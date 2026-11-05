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
    float _115 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].z, _113);
    float _117 = fma(_115, -0.5, 0.5);
    float _119 = fma(_115, 0.5, 0.5);
    float _121 = fma(_109, 0.5, 0.5);
    float _123 = fma(_119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _125 = sqrt(_117);
    float _127 = fma(_119, _123, -0.212114393711090087890625);
    float _129 = fma(_119, _127, 1.570728778839111328125);
    float _131 = _125 * 0.636619746685028076171875;
    float _133 = -_129;
    float _135 = fma(_131, _133, 1.0);
    float _137 = _85 * _77;
    float2 _607 = float2(_137, _111);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_607, float2(0.0), isnan(_607))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float2 _626 = float2(_135, _121);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_626, float2(0.0), isnan(_626))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float _160 = in.m_41.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _85 * _164;
    bool _170 = _109 >= _166;
    float _172 = 0.0;
    float _174 = _164;
    float _176 = _166;
    if (!_170)
    {
        _172 = 0.0;
    }
    float _178 = _172;
    float _180 = _178;
    if (!_170)
    {
        _174 = 0.0;
        _176 = 0.0;
    }
    float _182 = _174;
    float _184 = _176;
    bool _186 = !_170;
    float _188 = _184;
    float _190 = _182;
    float _192 = _156;
    if (!_186)
    {
        float _194 = in.m_43.x;
        float _196 = gl_FragCoord.w;
        float _198 = _194 * _196;
        float _200 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _202 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _200;
        float _204 = fma(_109, 350.80767822265625, 53.62115478515625);
        float _206 = 1.0 / _202;
        float _208 = log2(_204);
        float _210 = _85 * _198;
        float _212 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _214 = _210 + _212;
        float _216 = _214 * _206;
        float _218 = _208 * 0.1155245304107666015625;
        float _220 = sqrt(_216);
        float2 _717 = float2(_218, _220);
        float3 _224 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_717, float2(0.0), isnan(_717))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_717, float2(0.0), isnan(_717))).xyz;
        float _226 = _224.x;
        float _228 = _224.y;
        float _230 = _224.z;
        _188 = _226;
        _190 = _228;
        _180 = _230;
    }
    float _232 = _188;
    float _234 = _190;
    float _236 = _180;
    float _238 = _152 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _240 = _158 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _246 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[12].z, _244);
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _154 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _252 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _254 = _238 + _252;
    float _256 = _238 * _232;
    float _258 = _248 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _260 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _262 = _250 + _260;
    float _264 = fma(_242, _254, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _266 = _250 * _234;
    float _268 = fma(_256, _258, _264);
    float _270 = _156 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _272 = _268 * _148;
    float _274 = _270 * _236;
    float _276 = fma(_142, (*spvDescriptorSet0.fp_c4)._m0[13].y, _272);
    float _278 = fma(_242, _262, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _280 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _282 = _270 + _280;
    float _284 = _276 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _286 = fma(_266, _258, _278);
    float _288 = fma(_242, _282, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _290 = _286 * _148;
    float _292 = fma(_274, _258, _288);
    bool _294 = _284 >= 1.41299998760223388671875;
    bool _296 = isnan(_284);
    bool _298 = _294 || _296;
    bool _300 = isnan(1.41299998760223388671875);
    bool _302 = _298 || _300;
    float _304 = fma(_144, (*spvDescriptorSet0.fp_c4)._m0[13].y, _290);
    float _306 = _292 * _148;
    float _308 = _304 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _310 = fma(_146, (*spvDescriptorSet0.fp_c4)._m0[13].y, _306);
    float _312 = _310 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _314 = _308 >= 1.41299998760223388671875;
    bool _316 = isnan(_308);
    bool _318 = _314 || _316;
    bool _320 = isnan(1.41299998760223388671875);
    bool _322 = _318 || _320;
    int _325 = as_type<int>(_306);
    float _327 = _310;
    float _329 = _284;
    int _331 = as_type<int>(_304);
    float _333 = _308;
    float _335 = _250;
    float _337 = _312;
    float _339 = _270;
    float _341 = _288;
    if (!_302)
    {
        float _343 = _284 * 0.38317000865936279296875;
        _325 = as_type<int>(_343);
    }
    int _345 = _325;
    if (_302)
    {
        float _347 = _284 * (-1.44269502162933349609375);
        _327 = _347;
    }
    float _349 = _327;
    bool _351 = _312 >= 1.41299998760223388671875;
    bool _353 = isnan(_312);
    bool _355 = _351 || _353;
    bool _357 = isnan(1.41299998760223388671875);
    bool _359 = _355 || _357;
    int _361 = as_type<int>(_349);
    if (_302)
    {
        float _363 = exp2(_349);
        _329 = _363;
    }
    float _365 = _329;
    if (!_322)
    {
        float _367 = _308 * 0.38317000865936279296875;
        _331 = as_type<int>(_367);
    }
    int _369 = _331;
    int _371 = _345;
    if (!_302)
    {
        float _373 = abs(as_type<float>(_345));
        float _375 = log2(_373);
        _371 = as_type<int>(_375);
    }
    int _377 = _371;
    if (_322)
    {
        float _379 = _308 * (-1.44269502162933349609375);
        _333 = _379;
    }
    float _381 = _333;
    if (!_359)
    {
        float _383 = _312 * 0.38317000865936279296875;
        _335 = _383;
    }
    float _385 = _335;
    if (_359)
    {
        float _387 = _312 * (-1.44269502162933349609375);
        _337 = _387;
    }
    float _389 = _337;
    int _391 = _369;
    if (!_322)
    {
        float _393 = abs(as_type<float>(_369));
        float _395 = log2(_393);
        _391 = as_type<int>(_395);
    }
    int _397 = _391;
    float _399 = _385;
    if (!_359)
    {
        float _401 = abs(_385);
        float _403 = log2(_401);
        _399 = _403;
    }
    float _405 = _399;
    int _407 = _377;
    if (!_302)
    {
        float _409 = as_type<float>(_377) * 0.4545454680919647216796875;
        _192 = _409;
    }
    float _411 = _192;
    int _413 = _397;
    if (!_322)
    {
        float _415 = as_type<float>(_397) * 0.4545454680919647216796875;
        _339 = _415;
    }
    float _417 = _339;
    float _419 = _381;
    if (_322)
    {
        float _421 = exp2(_381);
        _419 = _421;
    }
    float _423 = _419;
    if (!_359)
    {
        float _425 = _405 * 0.4545454680919647216796875;
        _341 = _425;
    }
    float _427 = _341;
    if (!_322)
    {
        float _429 = exp2(_417);
        _407 = as_type<int>(_429);
    }
    int _431 = _407;
    float _433 = _389;
    int _435 = _431;
    if (_359)
    {
        float _437 = exp2(_389);
        _433 = _437;
    }
    float _439 = _433;
    if (!_302)
    {
        float _441 = exp2(_411);
        _361 = as_type<int>(_441);
    }
    int _443 = _361;
    int _445 = _443;
    if (_322)
    {
        float _447 = -_423;
        float _449 = _447 + 1.0;
        _435 = as_type<int>(_449);
    }
    int _451 = _435;
    if (!_359)
    {
        float _453 = exp2(_427);
        _413 = as_type<int>(_453);
    }
    int _455 = _413;
    int _457 = _455;
    if (_302)
    {
        float _459 = -_365;
        float _461 = _459 + 1.0;
        _445 = as_type<int>(_461);
    }
    int _463 = _445;
    if (_359)
    {
        float _465 = -_439;
        float _467 = _465 + 1.0;
        _457 = as_type<int>(_467);
    }
    int _469 = _457;
    out.m_46.x = as_type<float>(_463);
    out.m_46.y = as_type<float>(_451);
    out.m_46.z = as_type<float>(_469);
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
    float _115 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].z, _113);
    float _117 = fma(_115, -0.5, 0.5);
    float _119 = fma(_115, 0.5, 0.5);
    float _121 = fma(_109, 0.5, 0.5);
    float _123 = fma(_119, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _125 = sqrt(_117);
    float _127 = fma(_119, _123, -0.212114393711090087890625);
    float _129 = fma(_119, _127, 1.570728778839111328125);
    float _131 = _125 * 0.636619746685028076171875;
    float _133 = -_129;
    float _135 = fma(_131, _133, 1.0);
    float _137 = _85 * _77;
    float2 _607 = float2(_137, _111);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_607, float2(0.0), isnan(_607))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float2 _626 = float2(_135, _121);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_626, float2(0.0), isnan(_626))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float _160 = in.m_41.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _85 * _164;
    bool _170 = _109 >= _166;
    float _172 = 0.0;
    float _174 = _164;
    float _176 = _166;
    if (!_170)
    {
        _172 = 0.0;
    }
    float _178 = _172;
    float _180 = _178;
    if (!_170)
    {
        _174 = 0.0;
        _176 = 0.0;
    }
    float _182 = _174;
    float _184 = _176;
    bool _186 = !_170;
    float _188 = _184;
    float _190 = _182;
    float _192 = _156;
    if (!_186)
    {
        float _194 = in.m_43.x;
        float _196 = gl_FragCoord.w;
        float _198 = _194 * _196;
        float _200 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _202 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _200;
        float _204 = fma(_109, 350.80767822265625, 53.62115478515625);
        float _206 = 1.0 / _202;
        float _208 = log2(_204);
        float _210 = _85 * _198;
        float _212 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _214 = _210 + _212;
        float _216 = _214 * _206;
        float _218 = _208 * 0.1155245304107666015625;
        float _220 = sqrt(_216);
        float2 _717 = float2(_218, _220);
        float3 _224 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_717, float2(0.0), isnan(_717))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_717, float2(0.0), isnan(_717))).xyz;
        float _226 = _224.x;
        float _228 = _224.y;
        float _230 = _224.z;
        _188 = _226;
        _190 = _228;
        _180 = _230;
    }
    float _232 = _188;
    float _234 = _190;
    float _236 = _180;
    float _238 = _152 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _240 = _158 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _246 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[12].z, _244);
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _154 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _252 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _254 = _238 + _252;
    float _256 = _238 * _232;
    float _258 = _248 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _260 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _262 = _250 + _260;
    float _264 = fma(_242, _254, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _266 = _250 * _234;
    float _268 = fma(_256, _258, _264);
    float _270 = _156 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _272 = _268 * _148;
    float _274 = _270 * _236;
    float _276 = fma(_142, (*spvDescriptorSet0.fp_c4)._m0[13].y, _272);
    float _278 = fma(_242, _262, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _280 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _282 = _270 + _280;
    float _284 = _276 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _286 = fma(_266, _258, _278);
    float _288 = fma(_242, _282, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _290 = _286 * _148;
    float _292 = fma(_274, _258, _288);
    bool _294 = _284 >= 1.41299998760223388671875;
    bool _296 = isnan(_284);
    bool _298 = _294 || _296;
    bool _300 = isnan(1.41299998760223388671875);
    bool _302 = _298 || _300;
    float _304 = fma(_144, (*spvDescriptorSet0.fp_c4)._m0[13].y, _290);
    float _306 = _292 * _148;
    float _308 = _304 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _310 = fma(_146, (*spvDescriptorSet0.fp_c4)._m0[13].y, _306);
    float _312 = _310 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _314 = _308 >= 1.41299998760223388671875;
    bool _316 = isnan(_308);
    bool _318 = _314 || _316;
    bool _320 = isnan(1.41299998760223388671875);
    bool _322 = _318 || _320;
    int _325 = as_type<int>(_306);
    float _327 = _310;
    float _329 = _284;
    int _331 = as_type<int>(_304);
    float _333 = _308;
    float _335 = _250;
    float _337 = _312;
    float _339 = _270;
    float _341 = _288;
    if (!_302)
    {
        float _343 = _284 * 0.38317000865936279296875;
        _325 = as_type<int>(_343);
    }
    int _345 = _325;
    if (_302)
    {
        float _347 = _284 * (-1.44269502162933349609375);
        _327 = _347;
    }
    float _349 = _327;
    bool _351 = _312 >= 1.41299998760223388671875;
    bool _353 = isnan(_312);
    bool _355 = _351 || _353;
    bool _357 = isnan(1.41299998760223388671875);
    bool _359 = _355 || _357;
    int _361 = as_type<int>(_349);
    if (_302)
    {
        float _363 = exp2(_349);
        _329 = _363;
    }
    float _365 = _329;
    if (!_322)
    {
        float _367 = _308 * 0.38317000865936279296875;
        _331 = as_type<int>(_367);
    }
    int _369 = _331;
    int _371 = _345;
    if (!_302)
    {
        float _373 = abs(as_type<float>(_345));
        float _375 = log2(_373);
        _371 = as_type<int>(_375);
    }
    int _377 = _371;
    if (_322)
    {
        float _379 = _308 * (-1.44269502162933349609375);
        _333 = _379;
    }
    float _381 = _333;
    if (!_359)
    {
        float _383 = _312 * 0.38317000865936279296875;
        _335 = _383;
    }
    float _385 = _335;
    if (_359)
    {
        float _387 = _312 * (-1.44269502162933349609375);
        _337 = _387;
    }
    float _389 = _337;
    int _391 = _369;
    if (!_322)
    {
        float _393 = abs(as_type<float>(_369));
        float _395 = log2(_393);
        _391 = as_type<int>(_395);
    }
    int _397 = _391;
    float _399 = _385;
    if (!_359)
    {
        float _401 = abs(_385);
        float _403 = log2(_401);
        _399 = _403;
    }
    float _405 = _399;
    int _407 = _377;
    if (!_302)
    {
        float _409 = as_type<float>(_377) * 0.4545454680919647216796875;
        _192 = _409;
    }
    float _411 = _192;
    int _413 = _397;
    if (!_322)
    {
        float _415 = as_type<float>(_397) * 0.4545454680919647216796875;
        _339 = _415;
    }
    float _417 = _339;
    float _419 = _381;
    if (_322)
    {
        float _421 = exp2(_381);
        _419 = _421;
    }
    float _423 = _419;
    if (!_359)
    {
        float _425 = _405 * 0.4545454680919647216796875;
        _341 = _425;
    }
    float _427 = _341;
    if (!_322)
    {
        float _429 = exp2(_417);
        _407 = as_type<int>(_429);
    }
    int _431 = _407;
    float _433 = _389;
    int _435 = _431;
    if (_359)
    {
        float _437 = exp2(_389);
        _433 = _437;
    }
    float _439 = _433;
    if (!_302)
    {
        float _441 = exp2(_411);
        _361 = as_type<int>(_441);
    }
    int _443 = _361;
    int _445 = _443;
    if (_322)
    {
        float _447 = -_423;
        float _449 = _447 + 1.0;
        _435 = as_type<int>(_449);
    }
    int _451 = _435;
    if (!_359)
    {
        float _453 = exp2(_427);
        _413 = as_type<int>(_453);
    }
    int _455 = _413;
    int _457 = _455;
    if (_302)
    {
        float _459 = -_365;
        float _461 = _459 + 1.0;
        _445 = as_type<int>(_461);
    }
    int _463 = _445;
    if (_359)
    {
        float _465 = -_439;
        float _467 = _465 + 1.0;
        _457 = as_type<int>(_467);
    }
    int _469 = _457;
    out.m_46.x = as_type<float>(_463);
    out.m_46.y = as_type<float>(_451);
    out.m_46.z = as_type<float>(_469);
    out.m_46.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_46)};
}

