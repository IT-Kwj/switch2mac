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
    texturecube_array<float> fp_t_tcb_8 [[id(1)]];
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
    float _305 = _299 * _299;
    float _307 = _299 * _295;
    float _309 = _297 * _297;
    float _311 = fma(_297, _297, _305);
    float _313 = fma(_293, _293, _305);
    float _315 = -_307;
    float _317 = fma(_293, _297, _315);
    float _319 = fma(_293, _297, _307);
    float _321 = fma(_293, _293, _309);
    float _323 = -_303;
    float _325 = fma(_293, _299, _323);
    float _327 = fma(_297, _299, _301);
    float _329 = fma(_293, _299, _303);
    float _331 = fma(_313, -2.0, 1.0);
    float _333 = _317 * 2.0;
    float _335 = _327 * 2.0;
    float _337 = -_301;
    float _339 = fma(_297, _299, _337);
    float _341 = _325 * 2.0;
    float _343 = fma(_311, -2.0, 1.0);
    float _345 = _319 * 2.0;
    float _347 = _333 * _215;
    float _349 = _331 * _215;
    float _351 = fma(_321, -2.0, 1.0);
    float _353 = _335 * _215;
    float _355 = _333 * _191;
    float _357 = _331 * _191;
    float _359 = _335 * _191;
    float _361 = _333 * _193;
    float _363 = _331 * _193;
    float _365 = _335 * _193;
    float _367 = fma(_343, _189, _347);
    float _369 = fma(_345, _189, _349);
    float _371 = _329 * 2.0;
    float _373 = _339 * 2.0;
    float _375 = _331 * _197;
    float _377 = _333 * _197;
    float _379 = _335 * _197;
    float _381 = fma(_341, _189, _353);
    float _383 = fma(_343, _187, _355);
    float _385 = fma(_345, _187, _357);
    float _387 = fma(_341, _187, _359);
    float _389 = fma(_371, _181, _367);
    float _391 = fma(_373, _181, _369);
    float _393 = fma(_345, _221, _375);
    float _395 = fma(_351, _181, _381);
    float _397 = fma(_345, _219, _363);
    float _399 = fma(_343, _219, _361);
    float _401 = abs(_389);
    float _403 = abs(_391);
    float _405 = precise::max(_401, _403);
    float _407 = fma(_341, _219, _365);
    float _409 = fma(_343, _221, _377);
    float _411 = fma(_371, _227, _383);
    float _413 = fma(_373, _227, _385);
    float _415 = fma(_341, _221, _379);
    float _417 = abs(_395);
    float _419 = precise::max(_417, _405);
    float _421 = fma(_351, _227, _387);
    float _423 = fma(_373, _207, _397);
    float _425 = fma(_371, _207, _399);
    float _427 = fma(_371, _229, _409);
    float _429 = fma(_373, _229, _393);
    float _431 = abs(_411);
    float _433 = abs(_413);
    float _435 = precise::max(_431, _433);
    float _437 = fma(_351, _207, _407);
    float _439 = fma(_351, _229, _415);
    float _441 = abs(_425);
    float _443 = abs(_423);
    float _445 = precise::max(_441, _443);
    float _447 = 1.0 / _419;
    float _449 = abs(_427);
    float _451 = abs(_429);
    float _453 = precise::max(_449, _451);
    float _455 = abs(_421);
    float _457 = precise::max(_455, _435);
    float _459 = abs(_437);
    float _461 = precise::max(_459, _445);
    float _463 = abs(_439);
    float _465 = precise::max(_463, _453);
    float _467 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[0].z));
    float _469 = 1.0 / _457;
    float _471 = _395 * _447;
    float _473 = _389 * _447;
    float _475 = 1.0 / _465;
    float _477 = _391 * _447;
    float _479 = 1.0 / _461;
    float _481 = _411 * _469;
    float _483 = _421 * _469;
    float _485 = _413 * _469;
    float _487 = rint(_467);
    float _489 = precise::max(_487, 0.0);
    uint _492 = uint(_489);
    uint _494 = clamp(_492, 0u, 65535u);
    float _496 = _427 * _475;
    float _498 = _429 * _475;
    float _500 = _439 * _475;
    float _502 = _425 * _479;
    float _504 = _423 * _479;
    float _506 = _437 * _479;
    float4 _1246 = float4(_473, _477, _471, float(int(_494)));
    float4 _1250 = select(_1246, float4(0.0), isnan(_1246));
    float4 _509 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1250.xyz, uint(rint(_1250.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1250.xyz, uint(rint(_1250.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)).xyzw;
    float _511 = _509.x;
    float _513 = _509.y;
    float _515 = _509.z;
    float _517 = _509.w;
    float4 _1270 = float4(_481, _485, _483, float(int(_494)));
    float4 _1272 = select(_1270, float4(0.0), isnan(_1270));
    float4 _519 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1272.xyz, uint(rint(_1272.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1272.xyz, uint(rint(_1272.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)).xyzw;
    float _521 = _519.x;
    float _523 = _519.y;
    float _525 = _519.z;
    float _527 = _519.w;
    float4 _1292 = float4(_502, _504, _506, float(int(_494)));
    float4 _1294 = select(_1292, float4(0.0), isnan(_1292));
    float4 _529 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1294.xyz, uint(rint(_1294.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1294.xyz, uint(rint(_1294.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)).xyzw;
    float _531 = _529.x;
    float _533 = _529.y;
    float _535 = _529.z;
    float _537 = _529.w;
    float4 _1314 = float4(_496, _498, _500, float(int(_494)));
    float4 _1316 = select(_1314, float4(0.0), isnan(_1314));
    float4 _539 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1316.xyz, uint(rint(_1316.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1316.xyz, uint(rint(_1316.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)).xyzw;
    float _541 = _539.x;
    float _543 = _539.y;
    float _545 = _539.z;
    float _547 = _539.w;
    float _549 = _511 * 0.109375;
    float _551 = _513 * 0.109375;
    float _553 = _515 * 0.109375;
    float _555 = _517 * 0.109375;
    float _557 = fma(_521, 0.390625, _549);
    float _559 = fma(_523, 0.390625, _551);
    float _561 = fma(_525, 0.390625, _553);
    float _563 = fma(_527, 0.390625, _555);
    float _565 = fma(_531, 0.390625, _557);
    float _567 = fma(_533, 0.390625, _559);
    float _569 = fma(_535, 0.390625, _561);
    float _571 = fma(_537, 0.390625, _563);
    float _573 = fma(_541, 0.109375, _565);
    float _575 = fma(_543, 0.109375, _567);
    float _577 = fma(_545, 0.109375, _569);
    float _579 = fma(_547, 0.109375, _571);
    float _581 = precise::max(0.0, _573);
    float _583 = precise::max(0.0, _575);
    float _585 = precise::max(0.0, _577);
    float _587 = precise::max(0.0, _579);
    out.m_42.x = _581;
    out.m_42.y = _583;
    out.m_42.z = _585;
    out.m_42.w = _587;
    return out;
}

