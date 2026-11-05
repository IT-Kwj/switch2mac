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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c11 [[id(4)]];
    texture2d_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture3d<float> fp_t_tcb_18 [[id(7)]];
    sampler fp_t_tcb_18Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_8 [[id(11)]];
    sampler fp_t_tcb_8Smplr [[id(12)]];
    texture3d<float> fp_t_tcb_1A [[id(13)]];
    sampler fp_t_tcb_1ASmplr [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_18Smplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    sampler fp_t_tcb_8Smplr_w [[id(18)]];
    sampler fp_t_tcb_1ASmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
    float4 m_58 [[color(1)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_49 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_49.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_49.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_49.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _65;
    float _87 = _85 * _71;
    float _89 = _85 * _77;
    float _91 = _85 * _83;
    float _93 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _95 = _87 + _93;
    float _97 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _99 = _89 + _97;
    float _101 = _95 * _95;
    float _103 = fma(_99, _99, _101);
    float _105 = sqrt(_103);
    bool _109 = _105 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _111 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _113 = _105 + _111;
    float _115 = _101;
    float _117 = _83;
    float _119 = _113;
    if (_109)
    {
        float _121 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _115 = _121;
    }
    float _123 = _115;
    if (_109)
    {
        float _125 = _91 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _117 = _125;
    }
    float _127 = _117;
    float _129 = 0.0;
    float _131 = _127;
    if (_109)
    {
        float _133 = rsqrt(_103);
        _129 = _133;
    }
    float _135 = _129;
    float _137 = _135;
    if (_109)
    {
        float _139 = _113 * _123;
        _119 = _139;
    }
    float _141 = _119;
    float _143 = 0.0;
    if (_109)
    {
        float _145 = _141 * 0.15915493667125701904296875;
        _143 = _145;
    }
    float _147 = _143;
    float _149 = _141;
    if (_109)
    {
        float _151 = _147 * 6.283185482025146484375;
        float _153 = cos(_151);
        _149 = _153;
    }
    float _155 = _149;
    float _157 = _123;
    if (_109)
    {
        float _159 = _147 * 6.283185482025146484375;
        float _161 = sin(_159);
        _157 = _161;
    }
    float _163 = _157;
    float _165 = 0.0;
    float _167 = _155;
    if (_109)
    {
        float _169 = _155 + (-1.0);
        _165 = _169;
    }
    float _171 = _165;
    float _173 = 0.0;
    if (_109)
    {
        float _175 = _171 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _173 = _175;
    }
    float _177 = _173;
    float _179 = 0.0;
    float _181 = _163;
    if (_109)
    {
        float _183 = fma(_163, _127, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _179 = _183;
    }
    float _185 = _179;
    if (!_109)
    {
        _181 = _91;
    }
    float _187 = _181;
    float _189 = _187;
    if (_109)
    {
        float _191 = fma(_91, _155, _177);
        _189 = _191;
    }
    float _193 = _189;
    if (!_109)
    {
        _131 = _89;
    }
    float _195 = _131;
    float _197 = _195;
    if (_109)
    {
        float _199 = _135 * _185;
        _137 = _199;
    }
    float _201 = _137;
    if (!_109)
    {
        _167 = _87;
    }
    float _203 = _167;
    float _205 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _207 = _193 + _205;
    float _209 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _211 = _91 + _209;
    float _213 = _203;
    if (_109)
    {
        float _215 = fma(_99, _201, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _197 = _215;
    }
    float _217 = _197;
    if (_109)
    {
        float _219 = fma(_95, _201, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _213 = _219;
    }
    float _221 = _213;
    float _223 = _207 * _207;
    float _225 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _227 = _89 + _225;
    float _229 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _231 = _217 + _229;
    float _233 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _235 = _221 + _233;
    float _237 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _239 = _87 + _237;
    float _241 = in.m_51.w;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = fma(_231, _231, _223);
    float _249 = _211 * _211;
    float _251 = fma(_235, _235, _247);
    float _253 = fma(_227, _227, _249);
    float _255 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _257 = fma(_239, _239, _253);
    float _259 = rsqrt(_251);
    float _261 = precise::max(0.0, _255);
    float _263 = _259 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _265 = sqrt(_257);
    float _267 = _231 * _263;
    float _269 = _235 * _263;
    float _271 = -_263;
    float _273 = -_261;
    float _275 = fma(_207, _271, _273);
    float _277 = _267 * _267;
    float _279 = _269 * _269;
    float _281 = _277 + _279;
    float _283 = sqrt(_281);
    bool _285 = _283 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _287 = _261;
    float _289 = _239;
    float _291 = _253;
    float _293 = _267;
    float _295 = _269;
    if (!_285)
    {
        _287 = _279;
    }
    float _297 = _287;
    float _299 = _297;
    if (!_285)
    {
        _289 = _277;
    }
    float _301 = _289;
    float _303 = _301;
    if (!_285)
    {
        _291 = _275;
    }
    float _305 = _291;
    bool _307 = !_285;
    float _309 = _305;
    if (!_307)
    {
        float _311 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _313 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _315 = _283 + _313;
        float _317 = _275 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _319 = rsqrt(_281);
        float _321 = _315 * _311;
        float _323 = _321 * 0.15915493667125701904296875;
        float _325 = _323 * 6.283185482025146484375;
        float _327 = sin(_325);
        float _329 = _323 * 6.283185482025146484375;
        float _331 = cos(_329);
        float _333 = fma(_327, _317, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _335 = _319 * _333;
        float _337 = _331 + (-1.0);
        float _339 = _267 * _335;
        float _341 = _269 * _335;
        float _343 = _337 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _345 = _341 * _341;
        float _347 = fma(_275, _331, _343);
        float _349 = _339 * _339;
        _309 = _347;
        _303 = _349;
        _299 = _345;
        _293 = _339;
        _295 = _341;
    }
    float _351 = _309;
    float _353 = _303;
    float _355 = _299;
    float _357 = _293;
    float _359 = _295;
    float _361 = fma(_351, _351, _353);
    float _363 = _85 * _245;
    float _365 = in.m_53.x;
    float _367 = gl_FragCoord.w;
    float _369 = _365 * _367;
    float _371 = _361 + _355;
    float _373 = _363 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _375 = in.m_53.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = rsqrt(_371);
    float _383 = gl_FragCoord.x;
    float _385 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _387 = _383 / _385;
    float _389 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _391 = fma(_265, (*spvDescriptorSet0.fp_c9)._m0[63].x, _389);
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = gl_FragCoord.y;
    float _397 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _399 = _395 / _397;
    float _401 = -_393;
    float _403 = _401 + 1.0;
    float _405 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _407 = -_373;
    float _409 = fma(_407, _405, 1.0);
    float _411 = abs(_403);
    float _413 = log2(_411);
    float _415 = _381 * _357;
    float _417 = _381 * _351;
    float _419 = _381 * _359;
    float _421 = _415 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _423 = log2(_409);
    float _425 = -_421;
    float _427 = fma(_417, (*spvDescriptorSet0.fp_c9)._m0[69].y, _425);
    float _429 = -_419;
    float _431 = fma(_429, (*spvDescriptorSet0.fp_c9)._m0[69].z, _427);
    float _433 = _413 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _435 = _85 * _379;
    float _437 = fma(_431, -0.5, 0.5);
    float _439 = fma(_431, 0.5, 0.5);
    float _441 = _417 + 1.0;
    float _443 = exp2(_433);
    float _445 = _387 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _447 = fma(_439, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _449 = _423 * 0.693147182464599609375;
    float _451 = _399 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _453 = fma(_439, _447, -0.212114393711090087890625);
    float _455 = _449 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float _457 = sqrt(_437);
    float _459 = fma(_439, _453, 1.570728778839111328125);
    float _461 = rint((*spvDescriptorSet0.fp_c7)._m0[9].w);
    float _463 = precise::max(_461, 0.0);
    uint _466 = uint(_463);
    uint _468 = clamp(_466, 0u, 65535u);
    float _470 = -_417;
    float _472 = fma(_443, _441, _470);
    float _474 = _85 * _369;
    float _476 = fma(_472, 0.5, 0.5);
    float _478 = _457 * 0.636619746685028076171875;
    float _480 = -_459;
    float _482 = fma(_478, _480, 1.0);
    float3 _1217 = float3(_474, _435, float(int(_468)));
    float3 _1221 = select(_1217, float3(0.0), isnan(_1217));
    float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1221.xy, uint(rint(_1221.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1221.xy, uint(rint(_1221.z))).xyz;
    float _488 = _486.x;
    float _490 = _486.y;
    float _492 = _486.z;
    float3 _1234 = float3(_445, _451, _455);
    float4 _495 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_1234, float3(0.0), isnan(_1234))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_1234, float3(0.0), isnan(_1234))).xyzw;
    float _497 = _495.x;
    float _499 = _495.y;
    float _501 = _495.z;
    float _503 = _495.w;
    float2 _1251 = float2(_482, _476);
    float3 _505 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1251, float2(0.0), isnan(_1251))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1251, float2(0.0), isnan(_1251))).xyz;
    float _507 = _505.x;
    float _509 = _505.y;
    float _511 = _505.z;
    float3 _1270 = float3(_474, _435, float(int(_468)));
    float3 _1272 = select(_1270, float3(0.0), isnan(_1270));
    float _513 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1272.xy, uint(rint(_1272.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1272.xy, uint(rint(_1272.z))).w;
    float3 _1279 = float3(_445, _451, _455);
    float _515 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1279, float3(0.0), isnan(_1279))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1279, float3(0.0), isnan(_1279))).x;
    float _517 = _413 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    int _520 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    float _522 = exp2(_517);
    int _524 = _520 & 31;
    uint _526 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_524)));
    bool _528 = uint(_524) < 32u;
    uint _530 = uint(_528 ? int(_526) : 0);
    uint _532 = extract_bits(_530, 0u, 8u);
    float _534 = float(_532);
    float _536 = (*spvDescriptorSet0.fp_c7)._m0[15].y * 300.0;
    float _538 = -_522;
    float _540 = _538 + 1.0;
    float _542 = _540 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _544 = -_542;
    float _546 = _544 + 1.0;
    float _548 = _534 * 0.0039215688593685626983642578125;
    float _550 = _492 * _536;
    float _552 = _542 * _503;
    float _554 = _488 * _536;
    float _556 = _490 * _536;
    float _558 = _513 * (*spvDescriptorSet0.fp_c11)._m0[40].x;
    float _560 = fma(_507, _552, _497);
    float _562 = fma(_509, _552, _499);
    float _564 = fma(_511, _552, _501);
    float _566 = _548 * _548;
    float _568 = precise::max(0.0, _554);
    float _570 = _546 * _503;
    float _572 = precise::max(0.0, _556);
    float _574 = _515 * _560;
    float _576 = precise::max(0.0, _550);
    float _578 = _515 * _562;
    float _580 = _515 * _564;
    float _582 = _558 * _566;
    float _584 = fma(_570, _568, _574);
    float _586 = fma(_570, _572, _578);
    float _588 = fma(_570, _576, _580);
    out.m_56.x = _584;
    out.m_56.y = _586;
    out.m_56.z = _588;
    out.m_56.w = _582;
    out.m_58.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

