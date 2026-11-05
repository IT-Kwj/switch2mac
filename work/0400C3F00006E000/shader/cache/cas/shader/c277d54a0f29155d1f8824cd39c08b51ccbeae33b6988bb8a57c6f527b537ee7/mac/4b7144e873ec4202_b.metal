#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_37.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _53;
    float _87 = _85 * _59;
    float _89 = _85 * _65;
    float _91 = _85 * _71;
    float _93 = _87 * _87;
    float _95 = fma(_89, _89, _93);
    float _97 = fma(_91, _91, _95);
    float _99 = rsqrt(_97);
    float _101 = _87 * _99;
    float _103 = _89 * _99;
    float _105 = _91 * _99;
    float _107 = _101 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _109 = _101 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _111 = _85 * _83;
    float _113 = fma(_103, (*spvDescriptorSet0.fp_c5)._m0[2].x, _107);
    float _115 = _85 * _77;
    float _117 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].z, _113);
    float _119 = fma(_109, 0.5, 0.5);
    float _121 = fma(_117, 0.5, 0.5);
    float2 _566 = float2(_115, _111);
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_566, float2(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_566, float2(0.0), isnan(_566))).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float2 _585 = float2(_121, _119);
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_585, float2(0.0), isnan(_585))).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float _144 = in.m_41.x;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = _85 * _148;
    bool _154 = _109 >= _150;
    float _156 = 0.0;
    float _158 = _150;
    if (!_154)
    {
        _156 = 0.0;
    }
    float _160 = _156;
    float _162 = 0.0;
    float _164 = _160;
    if (!_154)
    {
        _158 = 0.0;
        _162 = 0.0;
    }
    float _166 = _158;
    float _168 = _162;
    bool _170 = !_154;
    float _172 = _168;
    float _174 = _166;
    if (!_170)
    {
        float _176 = in.m_43.x;
        float _178 = gl_FragCoord.w;
        float _180 = _176 * _178;
        float _182 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _184 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _182;
        float _186 = fma(_109, 350.80767822265625, 53.62115478515625);
        float _188 = 1.0 / _184;
        float _190 = log2(_186);
        float _192 = _85 * _180;
        float _194 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _196 = _192 + _194;
        float _198 = _196 * _188;
        float _200 = _190 * 0.1155245304107666015625;
        float _202 = sqrt(_198);
        float2 _674 = float2(_200, _202);
        float3 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_674, float2(0.0), isnan(_674))).xyz;
        float _208 = _206.x;
        float _210 = _206.y;
        float _212 = _206.z;
        _172 = _208;
        _164 = _212;
        _174 = _210;
    }
    float _214 = _172;
    float _216 = _164;
    float _218 = _174;
    float _220 = _136 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _222 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _224 = fma(_117, (*spvDescriptorSet0.fp_c4)._m0[12].z, _222);
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _142 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = _140 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _234 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _236 = _220 + _234;
    float _238 = _220 * _214;
    float _240 = _226 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _242 = _232 * _216;
    float _244 = fma(_230, _236, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _246 = fma(_238, _240, _244);
    float _248 = _138 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _250 = _246 * _132;
    float _252 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _254 = _248 + _252;
    float _256 = _248 * _218;
    float _258 = fma(_126, (*spvDescriptorSet0.fp_c4)._m0[13].y, _250);
    float _260 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _262 = _232 + _260;
    float _264 = fma(_230, _254, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _266 = _258 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _268 = fma(_230, _262, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _270 = fma(_256, _240, _264);
    float _272 = fma(_242, _240, _268);
    float _274 = _270 * _132;
    bool _276 = _266 >= 1.41299998760223388671875;
    bool _278 = isnan(_266);
    bool _280 = _276 || _278;
    bool _282 = isnan(1.41299998760223388671875);
    bool _284 = _280 || _282;
    float _286 = _272 * _132;
    float _288 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[13].y, _274);
    float _290 = fma(_130, (*spvDescriptorSet0.fp_c4)._m0[13].y, _286);
    float _292 = _288 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _294 = _290 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _296 = _292 >= 1.41299998760223388671875;
    bool _298 = isnan(_292);
    bool _300 = _296 || _298;
    bool _302 = isnan(1.41299998760223388671875);
    bool _304 = _300 || _302;
    int _307 = as_type<int>(_286);
    float _309 = _290;
    float _311 = _256;
    int _313 = as_type<int>(_272);
    float _315 = _292;
    float _317 = _248;
    float _319 = _294;
    float _321 = _232;
    float _323 = _230;
    float _325 = _266;
    if (!_284)
    {
        float _327 = _266 * 0.38317000865936279296875;
        _307 = as_type<int>(_327);
    }
    int _329 = _307;
    if (_284)
    {
        float _331 = _266 * (-1.44269502162933349609375);
        _309 = _331;
    }
    float _333 = _309;
    bool _335 = _294 >= 1.41299998760223388671875;
    bool _337 = isnan(_294);
    bool _339 = _335 || _337;
    bool _341 = isnan(1.41299998760223388671875);
    bool _343 = _339 || _341;
    int _345 = as_type<int>(_333);
    if (_284)
    {
        float _347 = exp2(_333);
        _311 = _347;
    }
    float _349 = _311;
    if (!_304)
    {
        float _351 = _292 * 0.38317000865936279296875;
        _313 = as_type<int>(_351);
    }
    int _353 = _313;
    int _355 = _329;
    if (!_284)
    {
        float _357 = abs(as_type<float>(_329));
        float _359 = log2(_357);
        _355 = as_type<int>(_359);
    }
    int _361 = _355;
    if (_304)
    {
        float _363 = _292 * (-1.44269502162933349609375);
        _315 = _363;
    }
    float _365 = _315;
    if (!_343)
    {
        float _367 = _294 * 0.38317000865936279296875;
        _317 = _367;
    }
    float _369 = _317;
    if (_343)
    {
        float _371 = _294 * (-1.44269502162933349609375);
        _319 = _371;
    }
    float _373 = _319;
    int _375 = _353;
    if (!_304)
    {
        float _377 = abs(as_type<float>(_353));
        float _379 = log2(_377);
        _375 = as_type<int>(_379);
    }
    int _381 = _375;
    float _383 = _369;
    if (!_343)
    {
        float _385 = abs(_369);
        float _387 = log2(_385);
        _383 = _387;
    }
    float _389 = _383;
    int _391 = _361;
    if (!_284)
    {
        float _393 = as_type<float>(_361) * 0.4545454680919647216796875;
        _321 = _393;
    }
    float _395 = _321;
    int _397 = _381;
    if (!_304)
    {
        float _399 = as_type<float>(_381) * 0.4545454680919647216796875;
        _323 = _399;
    }
    float _401 = _323;
    float _403 = _365;
    if (_304)
    {
        float _405 = exp2(_365);
        _403 = _405;
    }
    float _407 = _403;
    if (!_343)
    {
        float _409 = _389 * 0.4545454680919647216796875;
        _325 = _409;
    }
    float _411 = _325;
    if (!_304)
    {
        float _413 = exp2(_401);
        _391 = as_type<int>(_413);
    }
    int _415 = _391;
    float _417 = _373;
    int _419 = _415;
    if (_343)
    {
        float _421 = exp2(_373);
        _417 = _421;
    }
    float _423 = _417;
    if (!_284)
    {
        float _425 = exp2(_395);
        _345 = as_type<int>(_425);
    }
    int _427 = _345;
    int _429 = _427;
    if (_304)
    {
        float _431 = -_407;
        float _433 = _431 + 1.0;
        _419 = as_type<int>(_433);
    }
    int _435 = _419;
    if (!_343)
    {
        float _437 = exp2(_411);
        _397 = as_type<int>(_437);
    }
    int _439 = _397;
    int _441 = _439;
    if (_284)
    {
        float _443 = -_349;
        float _445 = _443 + 1.0;
        _429 = as_type<int>(_445);
    }
    int _447 = _429;
    if (_343)
    {
        float _449 = -_423;
        float _451 = _449 + 1.0;
        _441 = as_type<int>(_451);
    }
    int _453 = _441;
    out.m_46.x = as_type<float>(_447);
    out.m_46.y = as_type<float>(_435);
    out.m_46.z = as_type<float>(_453);
    out.m_46.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_46 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_37.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _53;
    float _87 = _85 * _59;
    float _89 = _85 * _65;
    float _91 = _85 * _71;
    float _93 = _87 * _87;
    float _95 = fma(_89, _89, _93);
    float _97 = fma(_91, _91, _95);
    float _99 = rsqrt(_97);
    float _101 = _87 * _99;
    float _103 = _89 * _99;
    float _105 = _91 * _99;
    float _107 = _101 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _109 = _101 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _111 = _85 * _83;
    float _113 = fma(_103, (*spvDescriptorSet0.fp_c5)._m0[2].x, _107);
    float _115 = _85 * _77;
    float _117 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].z, _113);
    float _119 = fma(_109, 0.5, 0.5);
    float _121 = fma(_117, 0.5, 0.5);
    float2 _566 = float2(_115, _111);
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_566, float2(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_566, float2(0.0), isnan(_566))).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float2 _585 = float2(_121, _119);
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_585, float2(0.0), isnan(_585))).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float _144 = in.m_41.x;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = _85 * _148;
    bool _154 = _109 >= _150;
    float _156 = 0.0;
    float _158 = _150;
    if (!_154)
    {
        _156 = 0.0;
    }
    float _160 = _156;
    float _162 = 0.0;
    float _164 = _160;
    if (!_154)
    {
        _158 = 0.0;
        _162 = 0.0;
    }
    float _166 = _158;
    float _168 = _162;
    bool _170 = !_154;
    float _172 = _168;
    float _174 = _166;
    if (!_170)
    {
        float _176 = in.m_43.x;
        float _178 = gl_FragCoord.w;
        float _180 = _176 * _178;
        float _182 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _184 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _182;
        float _186 = fma(_109, 350.80767822265625, 53.62115478515625);
        float _188 = 1.0 / _184;
        float _190 = log2(_186);
        float _192 = _85 * _180;
        float _194 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _196 = _192 + _194;
        float _198 = _196 * _188;
        float _200 = _190 * 0.1155245304107666015625;
        float _202 = sqrt(_198);
        float2 _674 = float2(_200, _202);
        float3 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_674, float2(0.0), isnan(_674))).xyz;
        float _208 = _206.x;
        float _210 = _206.y;
        float _212 = _206.z;
        _172 = _208;
        _164 = _212;
        _174 = _210;
    }
    float _214 = _172;
    float _216 = _164;
    float _218 = _174;
    float _220 = _136 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _222 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _224 = fma(_117, (*spvDescriptorSet0.fp_c4)._m0[12].z, _222);
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _142 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = _140 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _234 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _236 = _220 + _234;
    float _238 = _220 * _214;
    float _240 = _226 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _242 = _232 * _216;
    float _244 = fma(_230, _236, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _246 = fma(_238, _240, _244);
    float _248 = _138 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _250 = _246 * _132;
    float _252 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _254 = _248 + _252;
    float _256 = _248 * _218;
    float _258 = fma(_126, (*spvDescriptorSet0.fp_c4)._m0[13].y, _250);
    float _260 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _262 = _232 + _260;
    float _264 = fma(_230, _254, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _266 = _258 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _268 = fma(_230, _262, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _270 = fma(_256, _240, _264);
    float _272 = fma(_242, _240, _268);
    float _274 = _270 * _132;
    bool _276 = _266 >= 1.41299998760223388671875;
    bool _278 = isnan(_266);
    bool _280 = _276 || _278;
    bool _282 = isnan(1.41299998760223388671875);
    bool _284 = _280 || _282;
    float _286 = _272 * _132;
    float _288 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[13].y, _274);
    float _290 = fma(_130, (*spvDescriptorSet0.fp_c4)._m0[13].y, _286);
    float _292 = _288 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _294 = _290 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _296 = _292 >= 1.41299998760223388671875;
    bool _298 = isnan(_292);
    bool _300 = _296 || _298;
    bool _302 = isnan(1.41299998760223388671875);
    bool _304 = _300 || _302;
    int _307 = as_type<int>(_286);
    float _309 = _290;
    float _311 = _256;
    int _313 = as_type<int>(_272);
    float _315 = _292;
    float _317 = _248;
    float _319 = _294;
    float _321 = _232;
    float _323 = _230;
    float _325 = _266;
    if (!_284)
    {
        float _327 = _266 * 0.38317000865936279296875;
        _307 = as_type<int>(_327);
    }
    int _329 = _307;
    if (_284)
    {
        float _331 = _266 * (-1.44269502162933349609375);
        _309 = _331;
    }
    float _333 = _309;
    bool _335 = _294 >= 1.41299998760223388671875;
    bool _337 = isnan(_294);
    bool _339 = _335 || _337;
    bool _341 = isnan(1.41299998760223388671875);
    bool _343 = _339 || _341;
    int _345 = as_type<int>(_333);
    if (_284)
    {
        float _347 = exp2(_333);
        _311 = _347;
    }
    float _349 = _311;
    if (!_304)
    {
        float _351 = _292 * 0.38317000865936279296875;
        _313 = as_type<int>(_351);
    }
    int _353 = _313;
    int _355 = _329;
    if (!_284)
    {
        float _357 = abs(as_type<float>(_329));
        float _359 = log2(_357);
        _355 = as_type<int>(_359);
    }
    int _361 = _355;
    if (_304)
    {
        float _363 = _292 * (-1.44269502162933349609375);
        _315 = _363;
    }
    float _365 = _315;
    if (!_343)
    {
        float _367 = _294 * 0.38317000865936279296875;
        _317 = _367;
    }
    float _369 = _317;
    if (_343)
    {
        float _371 = _294 * (-1.44269502162933349609375);
        _319 = _371;
    }
    float _373 = _319;
    int _375 = _353;
    if (!_304)
    {
        float _377 = abs(as_type<float>(_353));
        float _379 = log2(_377);
        _375 = as_type<int>(_379);
    }
    int _381 = _375;
    float _383 = _369;
    if (!_343)
    {
        float _385 = abs(_369);
        float _387 = log2(_385);
        _383 = _387;
    }
    float _389 = _383;
    int _391 = _361;
    if (!_284)
    {
        float _393 = as_type<float>(_361) * 0.4545454680919647216796875;
        _321 = _393;
    }
    float _395 = _321;
    int _397 = _381;
    if (!_304)
    {
        float _399 = as_type<float>(_381) * 0.4545454680919647216796875;
        _323 = _399;
    }
    float _401 = _323;
    float _403 = _365;
    if (_304)
    {
        float _405 = exp2(_365);
        _403 = _405;
    }
    float _407 = _403;
    if (!_343)
    {
        float _409 = _389 * 0.4545454680919647216796875;
        _325 = _409;
    }
    float _411 = _325;
    if (!_304)
    {
        float _413 = exp2(_401);
        _391 = as_type<int>(_413);
    }
    int _415 = _391;
    float _417 = _373;
    int _419 = _415;
    if (_343)
    {
        float _421 = exp2(_373);
        _417 = _421;
    }
    float _423 = _417;
    if (!_284)
    {
        float _425 = exp2(_395);
        _345 = as_type<int>(_425);
    }
    int _427 = _345;
    int _429 = _427;
    if (_304)
    {
        float _431 = -_407;
        float _433 = _431 + 1.0;
        _419 = as_type<int>(_433);
    }
    int _435 = _419;
    if (!_343)
    {
        float _437 = exp2(_411);
        _397 = as_type<int>(_437);
    }
    int _439 = _397;
    int _441 = _439;
    if (_284)
    {
        float _443 = -_349;
        float _445 = _443 + 1.0;
        _429 = as_type<int>(_445);
    }
    int _447 = _429;
    if (_343)
    {
        float _449 = -_423;
        float _451 = _449 + 1.0;
        _441 = as_type<int>(_451);
    }
    int _453 = _441;
    out.m_46.x = as_type<float>(_447);
    out.m_46.y = as_type<float>(_435);
    out.m_46.z = as_type<float>(_453);
    out.m_46.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_46)};
}

