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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _49;
    float _71 = _69 * _55;
    float _73 = _69 * _61;
    float _75 = _69 * _67;
    float _77 = _71 * _71;
    float _79 = fma(_73, _73, _77);
    float _81 = fma(_75, _75, _79);
    float _83 = rsqrt(_81);
    float _85 = _71 * _83;
    float _87 = _73 * _83;
    float _89 = _75 * _83;
    float _91 = _85 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _93 = _85 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _95 = fma(_87, (*spvDescriptorSet0.fp_c5)._m0[2].x, _91);
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].z, _95);
    float _99 = fma(_97, -0.5, 0.5);
    float _101 = fma(_97, 0.5, 0.5);
    float _103 = fma(_101, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _105 = sqrt(_99);
    float _107 = fma(_101, _103, -0.212114393711090087890625);
    float _109 = fma(_101, _107, 1.570728778839111328125);
    float _111 = fma(_93, 0.5, 0.5);
    float _113 = _105 * 0.636619746685028076171875;
    float _115 = -_109;
    float _117 = fma(_113, _115, 1.0);
    float2 _545 = float2(_117, _111);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_545, float2(0.0), isnan(_545))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_545, float2(0.0), isnan(_545))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    float _130 = in.m_37.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = _69 * _134;
    bool _140 = _93 >= _136;
    float _142 = _136;
    float _144 = 0.0187292993068695068359375;
    float _146 = 0.5;
    if (!_140)
    {
        _142 = 0.0;
    }
    float _148 = _142;
    float _150 = _148;
    if (!_140)
    {
        _144 = 0.0;
        _146 = 0.0;
    }
    float _152 = _144;
    float _154 = _146;
    bool _156 = !_140;
    float _158 = _154;
    float _160 = _152;
    float _162 = _124;
    if (!_156)
    {
        float _164 = in.m_39.x;
        float _166 = gl_FragCoord.w;
        float _168 = _164 * _166;
        float _170 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _172 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _170;
        float _174 = fma(_93, 350.80767822265625, 53.62115478515625);
        float _176 = 1.0 / _172;
        float _178 = log2(_174);
        float _180 = _69 * _168;
        float _182 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _184 = _180 + _182;
        float _186 = _184 * _176;
        float _188 = _178 * 0.1155245304107666015625;
        float _190 = sqrt(_186);
        float2 _639 = float2(_188, _190);
        float3 _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_639, float2(0.0), isnan(_639))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_639, float2(0.0), isnan(_639))).xyz;
        float _196 = _194.x;
        float _198 = _194.y;
        float _200 = _194.z;
        _158 = _196;
        _150 = _200;
        _160 = _198;
    }
    float _202 = _158;
    float _204 = _150;
    float _206 = _160;
    float _208 = _122 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _210 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _212 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[12].z, _210);
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = _128 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _126 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _222 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _224 = _208 + _222;
    float _226 = _208 * _202;
    float _228 = _214 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _230 = _220 * _204;
    float _232 = fma(_218, _224, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _234 = fma(_226, _228, _232);
    float _236 = _124 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _238 = _234 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _240 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _242 = _236 + _240;
    float _244 = _236 * _206;
    float _246 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _248 = _220 + _246;
    float _250 = fma(_218, _242, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    bool _252 = _238 >= 1.41299998760223388671875;
    bool _254 = isnan(_238);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.41299998760223388671875);
    bool _260 = _256 || _258;
    float _262 = fma(_218, _248, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _264 = fma(_244, _228, _250);
    float _266 = fma(_230, _228, _262);
    float _268 = _264 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _270 = _266 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _272 = _268 >= 1.41299998760223388671875;
    bool _274 = isnan(_268);
    bool _276 = _272 || _274;
    bool _278 = isnan(1.41299998760223388671875);
    bool _280 = _276 || _278;
    int _283 = as_type<int>(_220);
    float _285 = _218;
    int _287 = as_type<int>(_266);
    float _289 = _202;
    float _291 = _270;
    float _293 = _228;
    float _295 = _268;
    float _297 = _230;
    float _299 = _244;
    if (!_260)
    {
        float _301 = _238 * 0.38317000865936279296875;
        _283 = as_type<int>(_301);
    }
    int _303 = _283;
    bool _305 = _270 >= 1.41299998760223388671875;
    bool _307 = isnan(_270);
    bool _309 = _305 || _307;
    bool _311 = isnan(1.41299998760223388671875);
    bool _313 = _309 || _311;
    if (_260)
    {
        float _315 = _238 * (-1.44269502162933349609375);
        _285 = _315;
    }
    float _317 = _285;
    int _319 = _303;
    int _321 = as_type<int>(_317);
    if (!_260)
    {
        float _323 = abs(as_type<float>(_303));
        float _325 = log2(_323);
        _319 = as_type<int>(_325);
    }
    int _327 = _319;
    if (!_280)
    {
        float _329 = _268 * 0.38317000865936279296875;
        _287 = as_type<int>(_329);
    }
    int _331 = _287;
    if (_280)
    {
        float _333 = _268 * (-1.44269502162933349609375);
        _162 = _333;
    }
    float _335 = _162;
    if (!_313)
    {
        float _337 = _270 * 0.38317000865936279296875;
        _289 = _337;
    }
    float _339 = _289;
    if (_313)
    {
        float _341 = _270 * (-1.44269502162933349609375);
        _291 = _341;
    }
    float _343 = _291;
    if (_260)
    {
        float _345 = exp2(_317);
        _293 = _345;
    }
    float _347 = _293;
    int _349 = _327;
    if (!_260)
    {
        float _351 = as_type<float>(_327) * 0.4545454680919647216796875;
        _295 = _351;
    }
    float _353 = _295;
    int _355 = _331;
    if (!_280)
    {
        float _357 = abs(as_type<float>(_331));
        float _359 = log2(_357);
        _355 = as_type<int>(_359);
    }
    int _361 = _355;
    float _363 = _339;
    if (!_313)
    {
        float _365 = abs(_339);
        float _367 = log2(_365);
        _363 = _367;
    }
    float _369 = _363;
    int _371 = _361;
    if (!_280)
    {
        float _373 = as_type<float>(_361) * 0.4545454680919647216796875;
        _297 = _373;
    }
    float _375 = _297;
    float _377 = _335;
    if (_280)
    {
        float _379 = exp2(_335);
        _377 = _379;
    }
    float _381 = _377;
    if (!_313)
    {
        float _383 = _369 * 0.4545454680919647216796875;
        _299 = _383;
    }
    float _385 = _299;
    if (!_280)
    {
        float _387 = exp2(_375);
        _321 = as_type<int>(_387);
    }
    int _389 = _321;
    float _391 = _343;
    int _393 = _389;
    if (_313)
    {
        float _395 = exp2(_343);
        _391 = _395;
    }
    float _397 = _391;
    if (!_260)
    {
        float _399 = exp2(_353);
        _349 = as_type<int>(_399);
    }
    int _401 = _349;
    int _403 = _401;
    if (_280)
    {
        float _405 = -_381;
        float _407 = _405 + 1.0;
        _393 = as_type<int>(_407);
    }
    int _409 = _393;
    if (!_313)
    {
        float _411 = exp2(_385);
        _371 = as_type<int>(_411);
    }
    int _413 = _371;
    int _415 = _413;
    if (_260)
    {
        float _417 = -_347;
        float _419 = _417 + 1.0;
        _403 = as_type<int>(_419);
    }
    int _421 = _403;
    if (_313)
    {
        float _423 = -_397;
        float _425 = _423 + 1.0;
        _415 = as_type<int>(_425);
    }
    int _427 = _415;
    out.m_42.x = as_type<float>(_421);
    out.m_42.y = as_type<float>(_409);
    out.m_42.z = as_type<float>(_427);
    out.m_42.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _49;
    float _71 = _69 * _55;
    float _73 = _69 * _61;
    float _75 = _69 * _67;
    float _77 = _71 * _71;
    float _79 = fma(_73, _73, _77);
    float _81 = fma(_75, _75, _79);
    float _83 = rsqrt(_81);
    float _85 = _71 * _83;
    float _87 = _73 * _83;
    float _89 = _75 * _83;
    float _91 = _85 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _93 = _85 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _95 = fma(_87, (*spvDescriptorSet0.fp_c5)._m0[2].x, _91);
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].z, _95);
    float _99 = fma(_97, -0.5, 0.5);
    float _101 = fma(_97, 0.5, 0.5);
    float _103 = fma(_101, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _105 = sqrt(_99);
    float _107 = fma(_101, _103, -0.212114393711090087890625);
    float _109 = fma(_101, _107, 1.570728778839111328125);
    float _111 = fma(_93, 0.5, 0.5);
    float _113 = _105 * 0.636619746685028076171875;
    float _115 = -_109;
    float _117 = fma(_113, _115, 1.0);
    float2 _545 = float2(_117, _111);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_545, float2(0.0), isnan(_545))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_545, float2(0.0), isnan(_545))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    float _130 = in.m_37.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = _69 * _134;
    bool _140 = _93 >= _136;
    float _142 = _136;
    float _144 = 0.0187292993068695068359375;
    float _146 = 0.5;
    if (!_140)
    {
        _142 = 0.0;
    }
    float _148 = _142;
    float _150 = _148;
    if (!_140)
    {
        _144 = 0.0;
        _146 = 0.0;
    }
    float _152 = _144;
    float _154 = _146;
    bool _156 = !_140;
    float _158 = _154;
    float _160 = _152;
    float _162 = _124;
    if (!_156)
    {
        float _164 = in.m_39.x;
        float _166 = gl_FragCoord.w;
        float _168 = _164 * _166;
        float _170 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _172 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _170;
        float _174 = fma(_93, 350.80767822265625, 53.62115478515625);
        float _176 = 1.0 / _172;
        float _178 = log2(_174);
        float _180 = _69 * _168;
        float _182 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _184 = _180 + _182;
        float _186 = _184 * _176;
        float _188 = _178 * 0.1155245304107666015625;
        float _190 = sqrt(_186);
        float2 _639 = float2(_188, _190);
        float3 _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_639, float2(0.0), isnan(_639))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_639, float2(0.0), isnan(_639))).xyz;
        float _196 = _194.x;
        float _198 = _194.y;
        float _200 = _194.z;
        _158 = _196;
        _150 = _200;
        _160 = _198;
    }
    float _202 = _158;
    float _204 = _150;
    float _206 = _160;
    float _208 = _122 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _210 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _212 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[12].z, _210);
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = _128 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _126 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _222 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _224 = _208 + _222;
    float _226 = _208 * _202;
    float _228 = _214 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _230 = _220 * _204;
    float _232 = fma(_218, _224, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _234 = fma(_226, _228, _232);
    float _236 = _124 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _238 = _234 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _240 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _242 = _236 + _240;
    float _244 = _236 * _206;
    float _246 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _248 = _220 + _246;
    float _250 = fma(_218, _242, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    bool _252 = _238 >= 1.41299998760223388671875;
    bool _254 = isnan(_238);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.41299998760223388671875);
    bool _260 = _256 || _258;
    float _262 = fma(_218, _248, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _264 = fma(_244, _228, _250);
    float _266 = fma(_230, _228, _262);
    float _268 = _264 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _270 = _266 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _272 = _268 >= 1.41299998760223388671875;
    bool _274 = isnan(_268);
    bool _276 = _272 || _274;
    bool _278 = isnan(1.41299998760223388671875);
    bool _280 = _276 || _278;
    int _283 = as_type<int>(_220);
    float _285 = _218;
    int _287 = as_type<int>(_266);
    float _289 = _202;
    float _291 = _270;
    float _293 = _228;
    float _295 = _268;
    float _297 = _230;
    float _299 = _244;
    if (!_260)
    {
        float _301 = _238 * 0.38317000865936279296875;
        _283 = as_type<int>(_301);
    }
    int _303 = _283;
    bool _305 = _270 >= 1.41299998760223388671875;
    bool _307 = isnan(_270);
    bool _309 = _305 || _307;
    bool _311 = isnan(1.41299998760223388671875);
    bool _313 = _309 || _311;
    if (_260)
    {
        float _315 = _238 * (-1.44269502162933349609375);
        _285 = _315;
    }
    float _317 = _285;
    int _319 = _303;
    int _321 = as_type<int>(_317);
    if (!_260)
    {
        float _323 = abs(as_type<float>(_303));
        float _325 = log2(_323);
        _319 = as_type<int>(_325);
    }
    int _327 = _319;
    if (!_280)
    {
        float _329 = _268 * 0.38317000865936279296875;
        _287 = as_type<int>(_329);
    }
    int _331 = _287;
    if (_280)
    {
        float _333 = _268 * (-1.44269502162933349609375);
        _162 = _333;
    }
    float _335 = _162;
    if (!_313)
    {
        float _337 = _270 * 0.38317000865936279296875;
        _289 = _337;
    }
    float _339 = _289;
    if (_313)
    {
        float _341 = _270 * (-1.44269502162933349609375);
        _291 = _341;
    }
    float _343 = _291;
    if (_260)
    {
        float _345 = exp2(_317);
        _293 = _345;
    }
    float _347 = _293;
    int _349 = _327;
    if (!_260)
    {
        float _351 = as_type<float>(_327) * 0.4545454680919647216796875;
        _295 = _351;
    }
    float _353 = _295;
    int _355 = _331;
    if (!_280)
    {
        float _357 = abs(as_type<float>(_331));
        float _359 = log2(_357);
        _355 = as_type<int>(_359);
    }
    int _361 = _355;
    float _363 = _339;
    if (!_313)
    {
        float _365 = abs(_339);
        float _367 = log2(_365);
        _363 = _367;
    }
    float _369 = _363;
    int _371 = _361;
    if (!_280)
    {
        float _373 = as_type<float>(_361) * 0.4545454680919647216796875;
        _297 = _373;
    }
    float _375 = _297;
    float _377 = _335;
    if (_280)
    {
        float _379 = exp2(_335);
        _377 = _379;
    }
    float _381 = _377;
    if (!_313)
    {
        float _383 = _369 * 0.4545454680919647216796875;
        _299 = _383;
    }
    float _385 = _299;
    if (!_280)
    {
        float _387 = exp2(_375);
        _321 = as_type<int>(_387);
    }
    int _389 = _321;
    float _391 = _343;
    int _393 = _389;
    if (_313)
    {
        float _395 = exp2(_343);
        _391 = _395;
    }
    float _397 = _391;
    if (!_260)
    {
        float _399 = exp2(_353);
        _349 = as_type<int>(_399);
    }
    int _401 = _349;
    int _403 = _401;
    if (_280)
    {
        float _405 = -_381;
        float _407 = _405 + 1.0;
        _393 = as_type<int>(_407);
    }
    int _409 = _393;
    if (!_313)
    {
        float _411 = exp2(_385);
        _371 = as_type<int>(_411);
    }
    int _413 = _371;
    int _415 = _413;
    if (_260)
    {
        float _417 = -_347;
        float _419 = _417 + 1.0;
        _403 = as_type<int>(_419);
    }
    int _421 = _403;
    if (_313)
    {
        float _423 = -_397;
        float _425 = _423 + 1.0;
        _415 = as_type<int>(_425);
    }
    int _427 = _415;
    out.m_42.x = as_type<float>(_421);
    out.m_42.y = as_type<float>(_409);
    out.m_42.z = as_type<float>(_427);
    out.m_42.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

