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
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = _73 * _73;
    float _81 = fma(_75, _75, _79);
    float _83 = fma(_77, _77, _81);
    float _85 = rsqrt(_83);
    float _87 = _73 * _85;
    float _89 = _75 * _85;
    float _91 = _77 * _85;
    float _93 = _87 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _95 = _87 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].x, _93);
    float _99 = fma(_95, 0.5, 0.5);
    float _101 = fma(_91, (*spvDescriptorSet0.fp_c5)._m0[2].z, _97);
    float _103 = fma(_101, -0.5, 0.5);
    float _105 = fma(_101, 0.5, 0.5);
    float _107 = fma(_105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _109 = sqrt(_103);
    float _111 = fma(_105, _107, -0.212114393711090087890625);
    float _113 = fma(_105, _111, 1.570728778839111328125);
    float _115 = _109 * 0.636619746685028076171875;
    float _117 = -_113;
    float _119 = fma(_115, _117, 1.0);
    float2 _593 = float2(_119, _99);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_593, float2(0.0), isnan(_593))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_593, float2(0.0), isnan(_593))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float _132 = in.m_37.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = 0.0 + _95;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = in.m_39.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = abs(_140);
    float _150 = log2(_148);
    float _152 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _154 = _152 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _156 = _150 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _158 = exp2(_156);
    float _160 = _71 * _136;
    bool _164 = _95 >= _160;
    float _166 = _111;
    float _168 = _160;
    float _170 = _109;
    if (!_164)
    {
        _166 = 0.0;
    }
    float _172 = _166;
    float _174 = _172;
    if (!_164)
    {
        _168 = 0.0;
        _170 = 0.0;
    }
    float _176 = _168;
    float _178 = _170;
    bool _180 = !_164;
    float _182 = _178;
    float _184 = _176;
    float _186 = _146;
    float _188 = _126;
    if (!_180)
    {
        float _190 = in.m_41.x;
        float _192 = gl_FragCoord.w;
        float _194 = _190 * _192;
        float _196 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _198 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _196;
        float _200 = fma(_95, 350.80767822265625, 53.62115478515625);
        float _202 = 1.0 / _198;
        float _204 = log2(_200);
        float _206 = _71 * _194;
        float _208 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _210 = _206 + _208;
        float _212 = _204 * 0.1155245304107666015625;
        float _214 = _210 * _202;
        float _216 = sqrt(_214);
        float2 _718 = float2(_212, _216);
        float3 _220 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_718, float2(0.0), isnan(_718))).xyz;
        float _222 = _220.x;
        float _224 = _220.y;
        float _226 = _220.z;
        _182 = _222;
        _184 = _224;
        _174 = _226;
    }
    float _228 = _182;
    float _230 = _184;
    float _232 = _174;
    float _234 = _124 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _236 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _238 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[12].z, _236);
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _130 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = fma(_158, _154, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _248 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _250 = _234 + _248;
    float _252 = _234 * _228;
    float _254 = _240 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _256 = _71 * _146;
    float _258 = fma(_244, _250, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _260 = _126 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _262 = _128 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _264 = _246 * _256;
    float _266 = fma(_252, _254, _258);
    float _268 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _270 = _260 + _268;
    float _272 = _260 * _230;
    float _274 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _276 = _262 + _274;
    float _278 = _262 * _232;
    float _280 = fma(_244, _270, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _282 = -_266;
    float _284 = _282 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _286 = fma(_244, _276, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _288 = fma(_272, _254, _280);
    float _290 = fma(_264, _284, _266);
    float _292 = fma(_278, _254, _286);
    float _294 = -_288;
    float _296 = _294 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _298 = _290 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _300 = -_292;
    float _302 = _300 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _304 = fma(_264, _296, _288);
    float _306 = fma(_264, _302, _292);
    bool _308 = _298 >= 1.41299998760223388671875;
    bool _310 = isnan(_298);
    bool _312 = _308 || _310;
    bool _314 = isnan(1.41299998760223388671875);
    bool _316 = _312 || _314;
    float _318 = _304 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _320 = _306 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _322 = _318 >= 1.41299998760223388671875;
    bool _324 = isnan(_318);
    bool _326 = _322 || _324;
    bool _328 = isnan(1.41299998760223388671875);
    bool _330 = _326 || _328;
    bool _332 = _320 >= 1.41299998760223388671875;
    bool _334 = isnan(_320);
    bool _336 = _332 || _334;
    bool _338 = isnan(1.41299998760223388671875);
    bool _340 = _336 || _338;
    int _343 = as_type<int>(_292);
    float _345 = _306;
    int _347 = as_type<int>(_304);
    float _349 = _318;
    float _351 = _298;
    float _353 = _320;
    float _355 = _288;
    float _357 = _272;
    if (!_316)
    {
        float _359 = _298 * 0.38317000865936279296875;
        _343 = as_type<int>(_359);
    }
    int _361 = _343;
    if (_316)
    {
        float _363 = _298 * (-1.44269502162933349609375);
        _345 = _363;
    }
    float _365 = _345;
    int _367 = as_type<int>(_365);
    if (_316)
    {
        float _369 = exp2(_365);
        _186 = _369;
    }
    float _371 = _186;
    if (!_330)
    {
        float _373 = _318 * 0.38317000865936279296875;
        _347 = as_type<int>(_373);
    }
    int _375 = _347;
    if (_330)
    {
        float _377 = _318 * (-1.44269502162933349609375);
        _349 = _377;
    }
    float _379 = _349;
    if (!_340)
    {
        float _381 = _320 * 0.38317000865936279296875;
        _351 = _381;
    }
    float _383 = _351;
    if (_340)
    {
        float _385 = _320 * (-1.44269502162933349609375);
        _353 = _385;
    }
    float _387 = _353;
    int _389 = _375;
    if (!_330)
    {
        float _391 = abs(as_type<float>(_375));
        float _393 = log2(_391);
        _389 = as_type<int>(_393);
    }
    int _395 = _389;
    int _397 = _361;
    if (!_316)
    {
        float _399 = abs(as_type<float>(_361));
        float _401 = log2(_399);
        _397 = as_type<int>(_401);
    }
    int _403 = _397;
    float _405 = _383;
    if (!_340)
    {
        float _407 = abs(_383);
        float _409 = log2(_407);
        _405 = _409;
    }
    float _411 = _405;
    int _413 = _395;
    if (!_330)
    {
        float _415 = as_type<float>(_395) * 0.4545454680919647216796875;
        _188 = _415;
    }
    float _417 = _188;
    int _419 = _403;
    if (!_316)
    {
        float _421 = as_type<float>(_403) * 0.4545454680919647216796875;
        _355 = _421;
    }
    float _423 = _355;
    float _425 = _379;
    if (_330)
    {
        float _427 = exp2(_379);
        _425 = _427;
    }
    float _429 = _425;
    if (!_340)
    {
        float _431 = _411 * 0.4545454680919647216796875;
        _357 = _431;
    }
    float _433 = _357;
    if (!_330)
    {
        float _435 = exp2(_417);
        _367 = as_type<int>(_435);
    }
    int _437 = _367;
    float _439 = _387;
    int _441 = _437;
    if (_340)
    {
        float _443 = exp2(_387);
        _439 = _443;
    }
    float _445 = _439;
    if (!_316)
    {
        float _447 = exp2(_423);
        _419 = as_type<int>(_447);
    }
    int _449 = _419;
    int _451 = _449;
    if (_330)
    {
        float _453 = -_429;
        float _455 = _453 + 1.0;
        _441 = as_type<int>(_455);
    }
    int _457 = _441;
    if (!_340)
    {
        float _459 = exp2(_433);
        _413 = as_type<int>(_459);
    }
    int _461 = _413;
    int _463 = _461;
    if (_316)
    {
        float _465 = -_371;
        float _467 = _465 + 1.0;
        _451 = as_type<int>(_467);
    }
    int _469 = _451;
    if (_340)
    {
        float _471 = -_445;
        float _473 = _471 + 1.0;
        _463 = as_type<int>(_473);
    }
    int _475 = _463;
    out.m_44.x = as_type<float>(_469);
    out.m_44.y = as_type<float>(_457);
    out.m_44.z = as_type<float>(_475);
    out.m_44.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_44 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = _73 * _73;
    float _81 = fma(_75, _75, _79);
    float _83 = fma(_77, _77, _81);
    float _85 = rsqrt(_83);
    float _87 = _73 * _85;
    float _89 = _75 * _85;
    float _91 = _77 * _85;
    float _93 = _87 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _95 = _87 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].x, _93);
    float _99 = fma(_95, 0.5, 0.5);
    float _101 = fma(_91, (*spvDescriptorSet0.fp_c5)._m0[2].z, _97);
    float _103 = fma(_101, -0.5, 0.5);
    float _105 = fma(_101, 0.5, 0.5);
    float _107 = fma(_105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _109 = sqrt(_103);
    float _111 = fma(_105, _107, -0.212114393711090087890625);
    float _113 = fma(_105, _111, 1.570728778839111328125);
    float _115 = _109 * 0.636619746685028076171875;
    float _117 = -_113;
    float _119 = fma(_115, _117, 1.0);
    float2 _593 = float2(_119, _99);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_593, float2(0.0), isnan(_593))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_593, float2(0.0), isnan(_593))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float _132 = in.m_37.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = 0.0 + _95;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = in.m_39.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = abs(_140);
    float _150 = log2(_148);
    float _152 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _154 = _152 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _156 = _150 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _158 = exp2(_156);
    float _160 = _71 * _136;
    bool _164 = _95 >= _160;
    float _166 = _111;
    float _168 = _160;
    float _170 = _109;
    if (!_164)
    {
        _166 = 0.0;
    }
    float _172 = _166;
    float _174 = _172;
    if (!_164)
    {
        _168 = 0.0;
        _170 = 0.0;
    }
    float _176 = _168;
    float _178 = _170;
    bool _180 = !_164;
    float _182 = _178;
    float _184 = _176;
    float _186 = _146;
    float _188 = _126;
    if (!_180)
    {
        float _190 = in.m_41.x;
        float _192 = gl_FragCoord.w;
        float _194 = _190 * _192;
        float _196 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _198 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _196;
        float _200 = fma(_95, 350.80767822265625, 53.62115478515625);
        float _202 = 1.0 / _198;
        float _204 = log2(_200);
        float _206 = _71 * _194;
        float _208 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _210 = _206 + _208;
        float _212 = _204 * 0.1155245304107666015625;
        float _214 = _210 * _202;
        float _216 = sqrt(_214);
        float2 _718 = float2(_212, _216);
        float3 _220 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_718, float2(0.0), isnan(_718))).xyz;
        float _222 = _220.x;
        float _224 = _220.y;
        float _226 = _220.z;
        _182 = _222;
        _184 = _224;
        _174 = _226;
    }
    float _228 = _182;
    float _230 = _184;
    float _232 = _174;
    float _234 = _124 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _236 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _238 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[12].z, _236);
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _130 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = fma(_158, _154, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _248 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _250 = _234 + _248;
    float _252 = _234 * _228;
    float _254 = _240 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _256 = _71 * _146;
    float _258 = fma(_244, _250, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _260 = _126 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _262 = _128 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _264 = _246 * _256;
    float _266 = fma(_252, _254, _258);
    float _268 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _270 = _260 + _268;
    float _272 = _260 * _230;
    float _274 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _276 = _262 + _274;
    float _278 = _262 * _232;
    float _280 = fma(_244, _270, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _282 = -_266;
    float _284 = _282 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _286 = fma(_244, _276, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _288 = fma(_272, _254, _280);
    float _290 = fma(_264, _284, _266);
    float _292 = fma(_278, _254, _286);
    float _294 = -_288;
    float _296 = _294 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _298 = _290 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _300 = -_292;
    float _302 = _300 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _304 = fma(_264, _296, _288);
    float _306 = fma(_264, _302, _292);
    bool _308 = _298 >= 1.41299998760223388671875;
    bool _310 = isnan(_298);
    bool _312 = _308 || _310;
    bool _314 = isnan(1.41299998760223388671875);
    bool _316 = _312 || _314;
    float _318 = _304 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _320 = _306 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _322 = _318 >= 1.41299998760223388671875;
    bool _324 = isnan(_318);
    bool _326 = _322 || _324;
    bool _328 = isnan(1.41299998760223388671875);
    bool _330 = _326 || _328;
    bool _332 = _320 >= 1.41299998760223388671875;
    bool _334 = isnan(_320);
    bool _336 = _332 || _334;
    bool _338 = isnan(1.41299998760223388671875);
    bool _340 = _336 || _338;
    int _343 = as_type<int>(_292);
    float _345 = _306;
    int _347 = as_type<int>(_304);
    float _349 = _318;
    float _351 = _298;
    float _353 = _320;
    float _355 = _288;
    float _357 = _272;
    if (!_316)
    {
        float _359 = _298 * 0.38317000865936279296875;
        _343 = as_type<int>(_359);
    }
    int _361 = _343;
    if (_316)
    {
        float _363 = _298 * (-1.44269502162933349609375);
        _345 = _363;
    }
    float _365 = _345;
    int _367 = as_type<int>(_365);
    if (_316)
    {
        float _369 = exp2(_365);
        _186 = _369;
    }
    float _371 = _186;
    if (!_330)
    {
        float _373 = _318 * 0.38317000865936279296875;
        _347 = as_type<int>(_373);
    }
    int _375 = _347;
    if (_330)
    {
        float _377 = _318 * (-1.44269502162933349609375);
        _349 = _377;
    }
    float _379 = _349;
    if (!_340)
    {
        float _381 = _320 * 0.38317000865936279296875;
        _351 = _381;
    }
    float _383 = _351;
    if (_340)
    {
        float _385 = _320 * (-1.44269502162933349609375);
        _353 = _385;
    }
    float _387 = _353;
    int _389 = _375;
    if (!_330)
    {
        float _391 = abs(as_type<float>(_375));
        float _393 = log2(_391);
        _389 = as_type<int>(_393);
    }
    int _395 = _389;
    int _397 = _361;
    if (!_316)
    {
        float _399 = abs(as_type<float>(_361));
        float _401 = log2(_399);
        _397 = as_type<int>(_401);
    }
    int _403 = _397;
    float _405 = _383;
    if (!_340)
    {
        float _407 = abs(_383);
        float _409 = log2(_407);
        _405 = _409;
    }
    float _411 = _405;
    int _413 = _395;
    if (!_330)
    {
        float _415 = as_type<float>(_395) * 0.4545454680919647216796875;
        _188 = _415;
    }
    float _417 = _188;
    int _419 = _403;
    if (!_316)
    {
        float _421 = as_type<float>(_403) * 0.4545454680919647216796875;
        _355 = _421;
    }
    float _423 = _355;
    float _425 = _379;
    if (_330)
    {
        float _427 = exp2(_379);
        _425 = _427;
    }
    float _429 = _425;
    if (!_340)
    {
        float _431 = _411 * 0.4545454680919647216796875;
        _357 = _431;
    }
    float _433 = _357;
    if (!_330)
    {
        float _435 = exp2(_417);
        _367 = as_type<int>(_435);
    }
    int _437 = _367;
    float _439 = _387;
    int _441 = _437;
    if (_340)
    {
        float _443 = exp2(_387);
        _439 = _443;
    }
    float _445 = _439;
    if (!_316)
    {
        float _447 = exp2(_423);
        _419 = as_type<int>(_447);
    }
    int _449 = _419;
    int _451 = _449;
    if (_330)
    {
        float _453 = -_429;
        float _455 = _453 + 1.0;
        _441 = as_type<int>(_455);
    }
    int _457 = _441;
    if (!_340)
    {
        float _459 = exp2(_433);
        _413 = as_type<int>(_459);
    }
    int _461 = _413;
    int _463 = _461;
    if (_316)
    {
        float _465 = -_371;
        float _467 = _465 + 1.0;
        _451 = as_type<int>(_467);
    }
    int _469 = _451;
    if (_340)
    {
        float _471 = -_445;
        float _473 = _471 + 1.0;
        _463 = as_type<int>(_473);
    }
    int _475 = _463;
    out.m_44.x = as_type<float>(_469);
    out.m_44.y = as_type<float>(_457);
    out.m_44.z = as_type<float>(_475);
    out.m_44.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_44)};
}

