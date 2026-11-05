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
    constant _16* fp_c3 [[id(0)]];
    texturecube<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_31 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_29 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_29.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_31.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_29.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_31.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_33.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_35.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_33.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_35.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_35.z;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_37.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_37.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_37.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_39.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_39.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_39.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = 1.0 / _49;
    float _155 = _153 * _55;
    float _157 = _153 * _61;
    float _159 = _153 * _67;
    float _161 = _153 * _73;
    float _163 = _155 * _155;
    float _165 = _157 * _157;
    float _167 = _153 * _79;
    float _169 = _153 * _85;
    float _171 = fma(_159, _159, _163);
    float _173 = fma(_161, _161, _165);
    float _175 = in.m_33.y;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = _153 * _91;
    float _183 = fma(_167, _167, _171);
    float _185 = fma(_169, _169, _173);
    float _187 = _153 * _97;
    float _189 = _153 * _103;
    float _191 = _153 * _109;
    float _193 = _153 * _127;
    float _195 = rsqrt(_183);
    float _197 = _153 * _139;
    float _199 = rsqrt(_185);
    float _201 = _155 * _195;
    float _203 = _159 * _195;
    float _205 = _167 * _195;
    float _207 = _153 * _133;
    float _209 = _157 * _199;
    float _211 = _161 * _199;
    float _213 = _169 * _199;
    float _215 = _153 * _179;
    float _217 = _201 * _209;
    float _219 = _153 * _121;
    float _221 = _153 * _145;
    float _223 = fma(_203, _211, _217);
    float _225 = fma(_205, _213, _223);
    float _227 = _153 * _115;
    float _229 = _153 * _151;
    bool _233 = _225 > (-1.0);
    float _235 = 0.0;
    float _237 = _145;
    float _239 = _151;
    if (!_233)
    {
        _235 = 0.0;
    }
    float _241 = _235;
    float _243 = 0.0;
    float _245 = _241;
    if (!_233)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    float _249 = _247;
    if (!_233)
    {
        _237 = 0.0;
    }
    float _251 = _237;
    float _253 = _251;
    if (!_233)
    {
        _239 = 1.0;
    }
    float _255 = _239;
    bool _257 = !_233;
    float _259 = _255;
    if (!_257)
    {
        float _261 = _201 * _213;
        float _263 = _205 * _211;
        float _265 = _203 * _209;
        float _267 = fma(_225, 0.5, 0.5);
        float _269 = -_261;
        float _271 = fma(_205, _209, _269);
        float _273 = -_263;
        float _275 = fma(_203, _213, _273);
        float _277 = -_265;
        float _279 = fma(_201, _211, _277);
        float _281 = sqrt(_267);
        float _283 = _281 * 2.0;
        float _285 = 1.0 / _283;
        float _287 = _271 * _285;
        float _289 = _275 * _285;
        float _291 = _279 * _285;
        _245 = _287;
        _259 = _281;
        _249 = _289;
        _253 = _291;
    }
    float _293 = _245;
    float _295 = _259;
    float _297 = _249;
    float _299 = _253;
    float _301 = _293 * _295;
    float _303 = _297 * _295;
    float _305 = _299 * _295;
    float _307 = _299 * _299;
    float _309 = _297 * _297;
    float _311 = -_305;
    float _313 = fma(_293, _297, _311);
    float _315 = fma(_297, _297, _307);
    float _317 = fma(_293, _293, _307);
    float _319 = fma(_293, _293, _309);
    float _321 = fma(_293, _297, _305);
    float _323 = fma(_297, _299, _301);
    float _325 = -_303;
    float _327 = fma(_293, _299, _325);
    float _329 = _313 * 2.0;
    float _331 = fma(_293, _299, _303);
    float _333 = fma(_317, -2.0, 1.0);
    float _335 = -_301;
    float _337 = fma(_297, _299, _335);
    float _339 = _323 * 2.0;
    float _341 = fma(_315, -2.0, 1.0);
    float _343 = _329 * _215;
    float _345 = fma(_319, -2.0, 1.0);
    float _347 = _321 * 2.0;
    float _349 = _327 * 2.0;
    float _351 = _329 * _191;
    float _353 = _333 * _191;
    float _355 = _333 * _215;
    float _357 = _339 * _215;
    float _359 = _339 * _191;
    float _361 = fma(_341, _189, _343);
    float _363 = _331 * 2.0;
    float _365 = _329 * _193;
    float _367 = _333 * _193;
    float _369 = _339 * _193;
    float _371 = _333 * _197;
    float _373 = fma(_341, _187, _351);
    float _375 = fma(_347, _187, _353);
    float _377 = _337 * 2.0;
    float _379 = _329 * _197;
    float _381 = _339 * _197;
    float _383 = fma(_347, _189, _355);
    float _385 = fma(_349, _189, _357);
    float _387 = fma(_349, _187, _359);
    float _389 = fma(_363, _181, _361);
    float _391 = fma(_341, _219, _365);
    float _393 = fma(_347, _219, _367);
    float _395 = fma(_349, _219, _369);
    float _397 = fma(_363, _227, _373);
    float _399 = fma(_377, _227, _375);
    float _401 = fma(_377, _181, _383);
    float _403 = fma(_347, _221, _371);
    float _405 = fma(_345, _227, _387);
    float _407 = fma(_345, _181, _385);
    float _409 = abs(_397);
    float _411 = abs(_399);
    float _413 = precise::max(_409, _411);
    float _415 = fma(_341, _221, _379);
    float _417 = abs(_389);
    float _419 = abs(_401);
    float _421 = precise::max(_417, _419);
    float _423 = fma(_349, _221, _381);
    float _425 = fma(_363, _207, _391);
    float _427 = fma(_377, _207, _393);
    float _429 = fma(_345, _207, _395);
    float _431 = abs(_405);
    float _433 = precise::max(_431, _413);
    float _435 = fma(_363, _229, _415);
    float _437 = abs(_407);
    float _439 = precise::max(_437, _421);
    float _441 = fma(_377, _229, _403);
    float _443 = abs(_425);
    float _445 = abs(_427);
    float _447 = precise::max(_443, _445);
    float _449 = fma(_345, _229, _423);
    float _451 = 1.0 / _433;
    float _453 = abs(_435);
    float _455 = abs(_441);
    float _457 = precise::max(_453, _455);
    float _459 = abs(_429);
    float _461 = precise::max(_459, _447);
    float _463 = abs(_449);
    float _465 = precise::max(_463, _457);
    float _467 = 1.0 / _439;
    float _469 = 1.0 / _461;
    float _471 = _397 * _451;
    float _473 = _399 * _451;
    float _475 = 1.0 / _465;
    float _477 = _389 * _467;
    float _479 = _401 * _467;
    float _481 = _407 * _467;
    float _483 = _405 * _451;
    float _485 = _425 * _469;
    float3 _1203 = float3(_477, _479, _481);
    float4 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1203, float3(0.0), isnan(_1203)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1203, float3(0.0), isnan(_1203)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)).xyzw;
    float _490 = _488.x;
    float _492 = _488.y;
    float _494 = _488.z;
    float _496 = _488.w;
    float _498 = _427 * _469;
    float _500 = _429 * _469;
    float _502 = _449 * _475;
    float _504 = _435 * _475;
    float3 _1237 = float3(_471, _473, _483);
    float4 _506 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1237, float3(0.0), isnan(_1237)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1237, float3(0.0), isnan(_1237)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)).xyzw;
    float _508 = _506.x;
    float _510 = _506.y;
    float _512 = _506.z;
    float _514 = _506.w;
    float3 _1256 = float3(_485, _498, _500);
    float4 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1256, float3(0.0), isnan(_1256)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1256, float3(0.0), isnan(_1256)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)).xyzw;
    float _518 = _516.x;
    float _520 = _516.y;
    float _522 = _516.z;
    float _524 = _516.w;
    float _526 = _441 * _475;
    float3 _1278 = float3(_504, _526, _502);
    float4 _528 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1278, float3(0.0), isnan(_1278)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1278, float3(0.0), isnan(_1278)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)).xyzw;
    float _530 = _528.x;
    float _532 = _528.y;
    float _534 = _528.z;
    float _536 = _528.w;
    float _538 = _490 * 0.109375;
    float _540 = _492 * 0.109375;
    float _542 = _494 * 0.109375;
    float _544 = _496 * 0.109375;
    float _546 = fma(_508, 0.390625, _538);
    float _548 = fma(_510, 0.390625, _540);
    float _550 = fma(_512, 0.390625, _542);
    float _552 = fma(_514, 0.390625, _544);
    float _554 = fma(_518, 0.390625, _546);
    float _556 = fma(_520, 0.390625, _548);
    float _558 = fma(_522, 0.390625, _550);
    float _560 = fma(_524, 0.390625, _552);
    float _562 = fma(_530, 0.109375, _554);
    float _564 = fma(_532, 0.109375, _556);
    float _566 = fma(_534, 0.109375, _558);
    float _568 = fma(_536, 0.109375, _560);
    float _570 = precise::max(0.0, _562);
    float _572 = precise::max(0.0, _564);
    float _574 = precise::max(0.0, _566);
    float _576 = precise::max(0.0, _568);
    out.m_42.x = _570;
    out.m_42.y = _572;
    out.m_42.z = _574;
    out.m_42.w = _576;
    return out;
}

