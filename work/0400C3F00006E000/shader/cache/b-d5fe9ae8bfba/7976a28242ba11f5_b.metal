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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c15 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    sampler vp_t_tcb_24Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_54 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_64 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(0)]];
    float4 m_37 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_50 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1153 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_37.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    float _101 = as_type<float>(_93);
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _99;
    float _105 = _103;
    if (!_97)
    {
        out.m_40.x = 0.0;
    }
    int _107 = 0;
    if (!_97)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1528 = as_type<float>(_111);
        out.gl_Position.z = _1528;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_42.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_125)
    {
        float _131 = float(_93);
        _105 = _131;
    }
    float _133 = _105;
    bool _135 = _129 >= _133;
    bool _137 = !_125;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_40.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _113 = as_type<int>(_143);
    }
    int _145 = _113;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1596 = as_type<float>(_145);
        out.gl_Position.z = _1596;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _159 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _155);
    float _161 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _157);
    float _163 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _159);
    float _165 = _161 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _167 = _163 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _169 = fma(_165, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _171 = fma(_167, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _173 = floor(_169);
    float _175 = floor(_171);
    float _177 = -_173;
    float _179 = _169 + _177;
    float _181 = -_175;
    float _183 = _171 + _181;
    float2 _1676 = float2(_179, _183);
    float _185 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_1676, float2(0.0), isnan(_1676)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_1676, float2(0.0), isnan(_1676)), level(0.0)).x;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _203 = _201 != 0;
    float _205 = in.m_48.x;
    float _207 = in.m_48.y;
    float _209 = in.m_48.z;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _213 = _211 != 0;
    float _215 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _219 = in.m_50.y;
    float _221 = -_167;
    float _223 = _221 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _225 = _215 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _227 = in.m_50.x;
    float _229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _231 = 0.0;
    float _233 = _219;
    if (_203)
    {
        float _235 = in.m_44.x;
        _231 = _235;
    }
    float _237 = _231;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _241 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _187);
    bool _243 = _189 > 0.5;
    float _245 = _187 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _247 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[78].z, _239);
    float _249 = _195 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _253 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _247);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[191].y, _249);
    float _257 = _209 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _259 = -_251;
    float _261 = fma(_245, 2.0, _259);
    float _263 = _255 * 6.283185482025146484375;
    float _265 = _205 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = in.m_52.x;
    float _269 = in.m_52.y;
    float _271 = in.m_52.z;
    float _273 = _207 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = _263 * 0.15915493667125701904296875;
    float _277 = 0.0;
    float _279 = _227;
    if (_203)
    {
        _277 = _227;
    }
    float _281 = _277;
    float _283 = _265 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _285 = _273 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _287 = _257 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _289 = _275 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = _291 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _295 = fma(_271, _293, _197);
    float _297 = fma(_267, _293, _193);
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _301 = _189 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _303 = fma(_269, _293, _195);
    float _305 = -_219;
    float _307 = _305 + 1.0;
    float _309 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].w, _299);
    float _311 = -_225;
    float _313 = _311 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _315 = fma(_301, -2.0, _217);
    float _317 = -_165;
    float _319 = _317 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _321 = _281;
    float _323 = _269;
    float _325 = _271;
    if (_213)
    {
        float _327 = _243 ? _307 : _219;
        _233 = _327;
    }
    float _329 = _233;
    float _331 = _313 * _313;
    float _333 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _315);
    float _335 = fma(_319, _319, _331);
    bool _337 = _237 > 0.5;
    bool _339 = _337 && _203;
    float _341 = fma(_223, _223, _335);
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _347 = _225 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _353 = rsqrt(_341);
    float _355 = fma(_165, (*spvDescriptorSet0.vp_c8)._m0[11].x, _347);
    float _357 = _225 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _359 = _349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _361 = _343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _363 = fma(_167, (*spvDescriptorSet0.vp_c8)._m0[11].z, _355);
    float _365 = _351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _367 = fma(_165, (*spvDescriptorSet0.vp_c8)._m0[10].x, _357);
    float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _371 = _363 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (_339)
    {
        float _373 = -_281;
        float _375 = _373 + 1.0;
        _321 = _375;
    }
    float _377 = _321;
    out.m_54.x = _359;
    out.m_54.y = _361;
    out.m_54.z = _365;
    out.m_54.w = _345;
    float _379 = fma(_167, (*spvDescriptorSet0.vp_c8)._m0[10].z, _367);
    if (_203)
    {
        _279 = _377;
    }
    float _381 = _279;
    float _383 = _319 * _353;
    float _385 = _223 * _353;
    float _387 = _313 * _353;
    float _389 = 1.0 / _371;
    float _391 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _393 = _383 * _391;
    bool _395 = _303 != 0.0;
    bool _397 = isnan(_303);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _407 = _385 * _405;
    float _409 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _411 = -_393;
    float _413 = fma(_385, _409, _411);
    float _415 = _379 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _417 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _419 = _387 * _417;
    float _421 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _423 = -_407;
    float _425 = fma(_387, _421, _423);
    float _427 = _413 * _413;
    float _429 = _415 + _371;
    float _431 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _433 = -_419;
    float _435 = fma(_383, _431, _433);
    float _437 = -_129;
    float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[76].x, _261);
    float _441 = fma(_425, _425, _427);
    float _443 = _229 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _445 = _297 == 0.0;
    bool _447 = !_403;
    bool _449 = _445 && _447;
    float _451 = fma(_435, _435, _441);
    float _453 = _429 * _389;
    float _455 = _453 * 0.5;
    float _457 = fma(_443, _329, -0.5);
    float _459 = rsqrt(_451);
    float _461 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _463 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[30].w, _461);
    float _465 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _309);
    float _467 = _369 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _469 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _295);
    bool _471 = _295 == 0.0;
    bool _473 = _471 && _449;
    float _475 = -_333;
    float _477 = fma(_465, _457, _475);
    float _479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _297);
    float _481 = 1.0 / _463;
    float _483 = fma(_467, _381, -0.5);
    float _485 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _303);
    float _487 = _283 * _479;
    float _489 = _287 * _469;
    float _491 = fma(_253, _483, _439);
    float _493 = _285 * _485;
    float _495 = _425 * _459;
    float _497 = _413 * _459;
    float _499 = _435 * _459;
    float _501 = _387 * _495;
    float _503 = _385 * _497;
    if (!_473)
    {
        float _505 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[17].y, _269);
        _323 = _505;
    }
    float _507 = _323;
    float _509 = -_501;
    float _511 = fma(_383, _497, _509);
    float _513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _515 = _481 * _513;
    float _517 = -_503;
    float _519 = fma(_387, _499, _517);
    float _521 = _493 * _511;
    float _523 = abs(_515);
    float _525 = log2(_523);
    float _527 = _493 * _519;
    float _529 = fma(_487, _499, _521);
    float _531 = fma(_487, _495, _527);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _535 = fma(_489, _385, _529);
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _539 = fma(_489, _383, _531);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _543 = _167 + _535;
    float _545 = _477 + 0.5;
    float _547 = _165 + _539;
    float _549 = _491 + 0.5;
    float _551 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _553 = _543 + _551;
    float _555 = _525 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _557 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _559 = _547 + _557;
    float _561 = _553 * _553;
    float _563 = exp2(_555);
    float _565 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = fma(_559, _559, _561);
    float _571 = _561;
    float _573 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    float _575 = _547;
    float _577 = _543;
    if (_473)
    {
        _571 = _267;
    }
    float _579 = _571;
    float _581 = _579;
    if (!_473)
    {
        float _583 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[17].y, _267);
        _581 = _583;
    }
    float _585 = _581;
    float _587 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = sqrt(_569);
    float _591 = _383 * _499;
    out.m_56.x = _549;
    out.m_56.y = _545;
    float _593 = -_591;
    float _595 = fma(_385, _495, _593);
    out.m_58.x = _565;
    out.m_58.y = _567;
    out.m_58.z = _587;
    float _597 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _599 = precise::clamp(_597, 0.0, 1.0);
    float _601 = _493 * _595;
    float _603 = _595 * _507;
    float _605 = 2.0;
    if (_473)
    {
        _573 = _271;
    }
    float _607 = _573;
    float _609 = _519 * _507;
    float _611 = fma(_487, _497, _601);
    float _613 = _607;
    if (!_473)
    {
        float _615 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[17].y, _271);
        _613 = _615;
    }
    float _617 = _613;
    float _619 = _511 * _507;
    bool _621 = _589 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _623 = fma(_489, _387, _611);
    float _625 = fma(_599, -2.0, 3.0);
    float _627 = _599 * _599;
    bool _629 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _631 = isnan(0.5);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _637 = _633 || _635;
    float _639 = _225 + _623;
    float _641 = fma(_495, _585, _609);
    float _643 = _627 * _625;
    float _645 = fma(_497, _585, _603);
    bool _647 = !_621;
    float _649 = _639;
    float _651 = _623;
    if (!_647)
    {
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _657 = _589 + _655;
        float _659 = rsqrt(_569);
        float _661 = _657 * _653;
        float _663 = _639 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _665 = _661 * 0.15915493667125701904296875;
        float _667 = _665 * 6.283185482025146484375;
        float _669 = cos(_667);
        float _671 = _665 * 6.283185482025146484375;
        float _673 = sin(_671);
        float _675 = _669 + (-1.0);
        float _677 = _675 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _679 = fma(_673, _663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _681 = fma(_639, _669, _677);
        float _683 = _659 * _679;
        float _685 = fma(_559, _683, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _687 = fma(_553, _683, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _575 = _685;
        _577 = _687;
        _649 = _681;
        _605 = _669;
        _325 = _683;
    }
    float _689 = _575;
    float _691 = _577;
    float _693 = _649;
    float _695 = _605;
    float _697 = _325;
    float _699 = _695;
    float _701 = _697;
    float _703 = _693;
    if (_637)
    {
        _699 = _689;
    }
    float _705 = _699;
    float _707 = _705;
    if (_637)
    {
        _701 = _691;
    }
    float _709 = _701;
    float _711 = _709;
    if (!_637)
    {
        float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _715 = _225 + _713;
        float _717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _719 = _165 + _717;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _723 = -_165;
        float _725 = _723 + _689;
        float _727 = _715 * _715;
        float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _731 = _167 + _729;
        float _733 = -_225;
        float _735 = _733 + _693;
        float _737 = fma(_719, _719, _727);
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _741 = fma(_731, _731, _737);
        float _743 = sqrt(_741);
        float _745 = _721 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _747 = precise::min(_743, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _749 = _747 * _739;
        float _751 = -_167;
        float _753 = _751 + _691;
        float _755 = _745 * _749;
        float _757 = fma(_725, _755, _165);
        float _759 = fma(_735, _755, _225);
        float _761 = fma(_753, _755, _167);
        _703 = _759;
        _707 = _757;
        _711 = _761;
    }
    float _763 = _703;
    float _765 = _707;
    float _767 = _711;
    float _769 = _763 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _771 = -_643;
    float _773 = _771 + 1.0;
    float _775 = _763 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _777 = _763 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _779 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[1].x, _769);
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[654].w, _643);
    float _783 = _763 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _785 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[0].x, _775);
    float _787 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[1].z, _779);
    float _789 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[3].x, _777);
    float _791 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[2].x, _783);
    float _793 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[0].z, _785);
    float _795 = _787 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _797 = fma(_499, _585, _619);
    float _799 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[2].z, _791);
    float _801 = _793 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _803 = _795 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _805 = _795 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _807 = _795 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _809 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[3].z, _789);
    float _811 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[6].x, _803);
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[7].x, _805);
    float _815 = _799 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _819 = isnan(0.5);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    float _827 = _795 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _829 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[5].x, _807);
    float _831 = _809 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[6].z, _811);
    float _835 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[7].z, _813);
    float _837 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[4].x, _827);
    float _839 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[5].z, _829);
    float _841 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[6].w, _833);
    float _843 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[7].w, _835);
    bool _845 = _515 <= 8000.0;
    bool _847 = isnan(_515);
    bool _849 = _845 || _847;
    bool _851 = isnan(8000.0);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[4].z, _837);
    float _859 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[5].w, _839);
    float _861 = _841 + _843;
    float _863 = _835;
    float _865 = _797;
    float _867 = _843;
    float _869 = _841;
    if (_825)
    {
        _651 = 1.0;
    }
    float _871 = _651;
    float _873 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[4].w, _857);
    float _875 = _855 * _781;
    float _877 = _861 * 0.5;
    float _879 = _871;
    if (_825)
    {
        _863 = 1.0;
    }
    float _881 = _863;
    float _883 = _881;
    if (!_825)
    {
        float _885 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _887 = _885 * 0.15915493667125701904296875;
        float _889 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _893 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _891;
        float _895 = _887 * 6.283185482025146484375;
        float _897 = cos(_895);
        float _899 = _889 * 0.15915493667125701904296875;
        float _901 = _887 * 6.283185482025146484375;
        float _903 = sin(_901);
        float _905 = 1.0 / _897;
        float _907 = _899 * 6.283185482025146484375;
        float _909 = cos(_907);
        float _911 = _903 * _905;
        float _913 = _899 * 6.283185482025146484375;
        float _915 = sin(_913);
        float _917 = _909 * _911;
        float _919 = 1.0 / _893;
        float _921 = 1.0 / _917;
        float _923 = _915 * _921;
        float _925 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _927 = fma(_515, _923, _925);
        float _929 = _927 * _919;
        float _931 = precise::clamp(_929, 0.0, 1.0);
        _883 = _931;
    }
    float _933 = _883;
    if (!_825)
    {
        float _935 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _937 = _935 * 0.15915493667125701904296875;
        float _939 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _941 = _937 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _939 * 0.15915493667125701904296875;
        float _947 = _937 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = 1.0 / _943;
        float _953 = _945 * 6.283185482025146484375;
        float _955 = cos(_953);
        float _957 = _949 * _951;
        float _959 = _945 * 6.283185482025146484375;
        float _961 = sin(_959);
        float _963 = _955 * _957;
        float _965 = 1.0 / _963;
        float _967 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _969 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _967;
        float _971 = 1.0 / _969;
        float _973 = _961 * _965;
        float _975 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _977 = fma(_515, _973, _975);
        float _979 = _977 * _971;
        float _981 = precise::clamp(_979, 0.0, 1.0);
        float _983 = -_981;
        float _985 = _983 + 1.0;
        _879 = _985;
    }
    float _987 = _879;
    float _989 = in.m_60.x;
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _993 = _763 + _991;
    float _995 = fma(_383, _617, _641);
    float _997 = fma(_387, _617, _645);
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1001 = _765 + _999;
    float _1003 = _993 * _993;
    out.gl_Position.x = _873;
    out.gl_Position.y = _859;
    out.gl_Position.z = _841;
    out.gl_Position.w = _843;
    float _1005 = _875 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1009 = _767 + _1007;
    float _1011 = fma(_1001, _1001, _1003);
    out.m_62.z = _877;
    out.m_62.w = _843;
    float _1013 = fma(_385, _617, _797);
    out.m_64.x = _765;
    out.m_64.y = _763;
    out.m_64.z = _767;
    out.m_66.x = _995;
    out.m_66.y = _997;
    out.m_66.z = _1013;
    float _1015 = -_185;
    float _1017 = _1015 + 1.0;
    float _1019 = fma(_1009, _1009, _1011);
    float _1021 = _1017 * _1005;
    float _1023 = precise::clamp(_1021, 0.0, 1.0);
    float _1025 = sqrt(_1019);
    float _1027 = -_1023;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1031 = _1029 * _989;
    float _1033 = _1031 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1035 = _933 * _987;
    out.m_68.x = _1033;
    bool _1037 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1039 = isnan(_1025);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1045 = _1041 || _1043;
    float _1047 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1049 = _1011;
    float _1051 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1053 = _1035;
    if (!_1045)
    {
        _865 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1055 = _865;
    float _1057 = _1055;
    float _1059 = _1055;
    if (!_1045)
    {
        _1049 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1061 = _1049;
    float _1063 = _1061;
    float _1065 = _1061;
    if (!_1045)
    {
        _867 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1067 = _867;
    float _1069 = _1067;
    float _1071 = _1067;
    if (!_1045)
    {
        _869 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1073 = _869;
    float _1075 = _1073;
    float _1077 = _1073;
    if (!_1045)
    {
        _1051 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1079 = _1051;
    float _1081 = _1079;
    float _1083 = _1079;
    if (!_1045)
    {
        _1053 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1085 = _1053;
    bool _1087 = !_1045;
    float _1089 = _1085;
    float _1091 = _1085;
    if (!_1087)
    {
        bool _1093 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1095 = isnan(_1025);
        bool _1097 = _1093 || _1095;
        bool _1099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1101 = _1097 || _1099;
        if (!_1101)
        {
            float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1105 = _1025 + _1103;
            float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1109 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1107;
            float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1113 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1115 = 1.0 / _1109;
            float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1119 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1123 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1125 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1127 = _1125 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1131 = _1129 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1133 = _1105 * _1115;
            float _1135 = precise::clamp(_1133, 0.0, 1.0);
            float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1139 = _1137 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1141 = fma(_1135, _1113, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1143 = fma(_1135, _1139, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1145 = fma(_1135, _1119, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1147 = fma(_1135, _1123, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1149 = fma(_1135, _1127, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1151 = fma(_1135, _1131, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1065 = _1141;
            _1083 = _1149;
            _1059 = _1145;
            _1077 = _1147;
            _1071 = _1143;
            _1091 = _1151;
            _1153 = true;
        }
        else
        {
            bool _1155 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1157 = isnan(_1025);
            bool _1159 = _1155 || _1157;
            bool _1161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1163 = _1159 || _1161;
            if (!_1163)
            {
                _1057 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1165 = _1057;
            _1059 = _1165;
            if (!_1163)
            {
                _1063 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1167 = _1063;
            _1065 = _1167;
            if (!_1163)
            {
                _1069 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1169 = _1069;
            _1071 = _1169;
            if (!_1163)
            {
                _1075 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1171 = _1075;
            _1077 = _1171;
            if (!_1163)
            {
                _1081 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1173 = _1081;
            _1083 = _1173;
            if (!_1163)
            {
                _1089 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1175 = _1089;
            bool _1177 = !_1163;
            _1091 = _1175;
            if (!_1177)
            {
                bool _1179 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1181 = isnan(_1025);
                bool _1183 = _1179 || _1181;
                bool _1185 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1187 = _1183 || _1185;
                if (!_1187)
                {
                    float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1191 = _1025 + _1189;
                    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1193;
                    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1199 = _1197 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1201 = 1.0 / _1195;
                    float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1205 = _1203 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1209 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1213 = _1211 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1217 = _1215 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1219 = _1191 * _1201;
                    float _1221 = precise::clamp(_1219, 0.0, 1.0);
                    float _1223 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1225 = _1223 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1227 = fma(_1221, _1199, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1229 = fma(_1221, _1225, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1231 = fma(_1221, _1205, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1233 = fma(_1221, _1209, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1235 = fma(_1221, _1213, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1237 = fma(_1221, _1217, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1065 = _1227;
                    _1083 = _1235;
                    _1059 = _1231;
                    _1077 = _1233;
                    _1071 = _1229;
                    _1091 = _1237;
                    _1153 = true;
                }
                else
                {
                    _1065 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1083 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1059 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1077 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1071 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1091 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1153 = false;
    float _1239 = _1065;
    float _1241 = _1083;
    float _1243 = _1059;
    float _1245 = _1077;
    float _1247 = _1071;
    float _1249 = _1091;
    float _1251 = fma(_997, -0.5, 0.5);
    float _1253 = precise::clamp(_1251, 0.0, 1.0);
    float _1255 = -_1239;
    float _1257 = _1255 + _1241;
    float _1259 = -_1243;
    float _1261 = _1259 + _1245;
    out.m_70.x = 0.0;
    float _1263 = fma(_1253, _1257, _1239);
    float _1265 = rsqrt(_1019);
    float _1267 = fma(_1253, _1261, _1243);
    float _1269 = -_1247;
    float _1271 = _1269 + _1249;
    float _1273 = _1263 * 0.586610972881317138671875;
    bool _1275 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_72.x = 0.0;
    float _1277 = fma(_1253, _1271, _1247);
    float _1279 = fma(_1267, 0.298911988735198974609375, _1273);
    float _1281 = _1047 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1283 = _933 > 0.0;
    bool _1285 = isnan(_933);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    float _1293 = fma(_1277, 0.114477999508380889892578125, _1279);
    out.m_40.x = _1281;
    bool _1295 = _987 <= 0.0;
    bool _1297 = !_1291;
    bool _1299 = _1295 || _1297;
    float _1301 = -_1293;
    float _1303 = _1267 + _1301;
    float _1305 = -_1293;
    float _1307 = _1263 + _1305;
    float _1309 = _1001 * _1265;
    float _1311 = _993 * _1265;
    float _1313 = _1009 * _1265;
    float _1315 = fma(_1307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1293);
    float _1317 = -_1293;
    float _1319 = _1277 + _1317;
    float _1321 = fma(_1303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1293);
    float _1323 = fma(_1319, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1293);
    bool _1325 = !_1275;
    if (!_1325)
    {
        float _1327 = -_763;
        float _1329 = _1327 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1331 = -_765;
        float _1333 = _1331 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1335 = -_767;
        float _1337 = _1335 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1339 = _1329 * _1329;
        float _1341 = fma(_1333, _1333, _1339);
        float _1343 = fma(_1337, _1337, _1341);
        float _1345 = rsqrt(_1343);
        float _1347 = _1329 * _1345;
        float _1349 = _1333 * _1345;
        float _1351 = _1337 * _1345;
        float _1353 = sqrt(_1343);
        float _1355 = -_1311;
        float _1357 = _1355 + _1347;
        float _1359 = -_1309;
        float _1361 = _1359 + _1349;
        float _1363 = -_1313;
        float _1365 = _1363 + _1351;
        float _1367 = _1357 * _1357;
        float _1369 = fma(_1361, _1361, _1367);
        float _1371 = fma(_1365, _1365, _1369);
        float _1373 = -_1353;
        float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1377 = rsqrt(_1371);
        float _1379 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1381 = precise::clamp(_1379, 0.0, 1.0);
        float _1383 = abs(_1381);
        float _1385 = log2(_1383);
        float _1387 = _1357 * _1377;
        float _1389 = _1361 * _1377;
        float _1391 = _1365 * _1377;
        float _1393 = _997 * _1387;
        float _1395 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _1397 = precise::clamp(_1395, 0.0, 1.0);
        float _1399 = _997 * _1347;
        float _1401 = fma(_995, _1389, _1393);
        float _1403 = _1397 * _1397;
        float _1405 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1407 = fma(_995, _1349, _1399);
        float _1409 = fma(_1013, _1391, _1401);
        float _1411 = precise::clamp(_1409, 0.0, 1.0);
        float _1413 = _1403 + (-1.0);
        float _1415 = fma(_1013, _1351, _1407);
        float _1417 = precise::clamp(_1415, 0.0, 1.0);
        float _1419 = _1411 * _1411;
        float _1421 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1423 = exp2(_1405);
        float _1425 = fma(_1419, _1413, 1.0);
        float _1427 = -_1347;
        float _1429 = -_1421;
        float _1431 = fma(_1427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1429);
        float _1433 = _1425 * _1425;
        float _1435 = -_1351;
        float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1431);
        float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1441 = _1437 + _1439;
        float _1443 = 1.0 / _1433;
        float _1445 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1447 = precise::clamp(_1445, 0.0, 1.0);
        float _1449 = _1423 * _1447;
        float _1451 = _1417 * _1449;
        float _1453 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1455 = _1403 * _1443;
        float _1457 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1459 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _1461 = _1451 * _1455;
        out.m_70.x = _1453;
        out.m_70.y = _1457;
        out.m_70.z = _1459;
        float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1465 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1467 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_72.x = _1463;
        out.m_72.y = _1465;
        out.m_72.z = _1467;
    }
    out.m_74.x = _1321;
    out.m_74.y = _1315;
    out.m_74.z = _1323;
    if (!_1299)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_40.x = 0.0;
    float _1469 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1469;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1153 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_37.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    float _101 = as_type<float>(_93);
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _99;
    float _105 = _103;
    if (!_97)
    {
        out.m_40.x = 0.0;
    }
    int _107 = 0;
    if (!_97)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1528 = as_type<float>(_111);
        out.gl_Position.z = _1528;
    }
    if (!_97)
    {
        return out;
    }
    float _115 = in.m_42.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_125)
    {
        float _131 = float(_93);
        _105 = _131;
    }
    float _133 = _105;
    bool _135 = _129 >= _133;
    bool _137 = !_125;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_40.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _113 = as_type<int>(_143);
    }
    int _145 = _113;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1596 = as_type<float>(_145);
        out.gl_Position.z = _1596;
    }
    if (_139)
    {
        return out;
    }
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _159 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _155);
    float _161 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _157);
    float _163 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _159);
    float _165 = _161 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _167 = _163 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _169 = fma(_165, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _171 = fma(_167, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _173 = floor(_169);
    float _175 = floor(_171);
    float _177 = -_173;
    float _179 = _169 + _177;
    float _181 = -_175;
    float _183 = _171 + _181;
    float2 _1676 = float2(_179, _183);
    float _185 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_1676, float2(0.0), isnan(_1676)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_1676, float2(0.0), isnan(_1676)), level(0.0)).x;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _203 = _201 != 0;
    float _205 = in.m_48.x;
    float _207 = in.m_48.y;
    float _209 = in.m_48.z;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _213 = _211 != 0;
    float _215 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _219 = in.m_50.y;
    float _221 = -_167;
    float _223 = _221 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _225 = _215 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _227 = in.m_50.x;
    float _229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _231 = 0.0;
    float _233 = _219;
    if (_203)
    {
        float _235 = in.m_44.x;
        _231 = _235;
    }
    float _237 = _231;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _241 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _187);
    bool _243 = _189 > 0.5;
    float _245 = _187 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _247 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[78].z, _239);
    float _249 = _195 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _253 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _247);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[191].y, _249);
    float _257 = _209 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _259 = -_251;
    float _261 = fma(_245, 2.0, _259);
    float _263 = _255 * 6.283185482025146484375;
    float _265 = _205 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = in.m_52.x;
    float _269 = in.m_52.y;
    float _271 = in.m_52.z;
    float _273 = _207 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = _263 * 0.15915493667125701904296875;
    float _277 = 0.0;
    float _279 = _227;
    if (_203)
    {
        _277 = _227;
    }
    float _281 = _277;
    float _283 = _265 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _285 = _273 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _287 = _257 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _289 = _275 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = _291 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _295 = fma(_271, _293, _197);
    float _297 = fma(_267, _293, _193);
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _301 = _189 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _303 = fma(_269, _293, _195);
    float _305 = -_219;
    float _307 = _305 + 1.0;
    float _309 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].w, _299);
    float _311 = -_225;
    float _313 = _311 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _315 = fma(_301, -2.0, _217);
    float _317 = -_165;
    float _319 = _317 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _321 = _281;
    float _323 = _269;
    float _325 = _271;
    if (_213)
    {
        float _327 = _243 ? _307 : _219;
        _233 = _327;
    }
    float _329 = _233;
    float _331 = _313 * _313;
    float _333 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _315);
    float _335 = fma(_319, _319, _331);
    bool _337 = _237 > 0.5;
    bool _339 = _337 && _203;
    float _341 = fma(_223, _223, _335);
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _347 = _225 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _353 = rsqrt(_341);
    float _355 = fma(_165, (*spvDescriptorSet0.vp_c8)._m0[11].x, _347);
    float _357 = _225 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _359 = _349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _361 = _343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _363 = fma(_167, (*spvDescriptorSet0.vp_c8)._m0[11].z, _355);
    float _365 = _351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _367 = fma(_165, (*spvDescriptorSet0.vp_c8)._m0[10].x, _357);
    float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _371 = _363 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (_339)
    {
        float _373 = -_281;
        float _375 = _373 + 1.0;
        _321 = _375;
    }
    float _377 = _321;
    out.m_54.x = _359;
    out.m_54.y = _361;
    out.m_54.z = _365;
    out.m_54.w = _345;
    float _379 = fma(_167, (*spvDescriptorSet0.vp_c8)._m0[10].z, _367);
    if (_203)
    {
        _279 = _377;
    }
    float _381 = _279;
    float _383 = _319 * _353;
    float _385 = _223 * _353;
    float _387 = _313 * _353;
    float _389 = 1.0 / _371;
    float _391 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _393 = _383 * _391;
    bool _395 = _303 != 0.0;
    bool _397 = isnan(_303);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _407 = _385 * _405;
    float _409 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _411 = -_393;
    float _413 = fma(_385, _409, _411);
    float _415 = _379 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _417 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _419 = _387 * _417;
    float _421 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _423 = -_407;
    float _425 = fma(_387, _421, _423);
    float _427 = _413 * _413;
    float _429 = _415 + _371;
    float _431 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _433 = -_419;
    float _435 = fma(_383, _431, _433);
    float _437 = -_129;
    float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[76].x, _261);
    float _441 = fma(_425, _425, _427);
    float _443 = _229 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _445 = _297 == 0.0;
    bool _447 = !_403;
    bool _449 = _445 && _447;
    float _451 = fma(_435, _435, _441);
    float _453 = _429 * _389;
    float _455 = _453 * 0.5;
    float _457 = fma(_443, _329, -0.5);
    float _459 = rsqrt(_451);
    float _461 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _463 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[30].w, _461);
    float _465 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _309);
    float _467 = _369 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _469 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _295);
    bool _471 = _295 == 0.0;
    bool _473 = _471 && _449;
    float _475 = -_333;
    float _477 = fma(_465, _457, _475);
    float _479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _297);
    float _481 = 1.0 / _463;
    float _483 = fma(_467, _381, -0.5);
    float _485 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _303);
    float _487 = _283 * _479;
    float _489 = _287 * _469;
    float _491 = fma(_253, _483, _439);
    float _493 = _285 * _485;
    float _495 = _425 * _459;
    float _497 = _413 * _459;
    float _499 = _435 * _459;
    float _501 = _387 * _495;
    float _503 = _385 * _497;
    if (!_473)
    {
        float _505 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[17].y, _269);
        _323 = _505;
    }
    float _507 = _323;
    float _509 = -_501;
    float _511 = fma(_383, _497, _509);
    float _513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _515 = _481 * _513;
    float _517 = -_503;
    float _519 = fma(_387, _499, _517);
    float _521 = _493 * _511;
    float _523 = abs(_515);
    float _525 = log2(_523);
    float _527 = _493 * _519;
    float _529 = fma(_487, _499, _521);
    float _531 = fma(_487, _495, _527);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _535 = fma(_489, _385, _529);
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _539 = fma(_489, _383, _531);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _543 = _167 + _535;
    float _545 = _477 + 0.5;
    float _547 = _165 + _539;
    float _549 = _491 + 0.5;
    float _551 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _553 = _543 + _551;
    float _555 = _525 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _557 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _559 = _547 + _557;
    float _561 = _553 * _553;
    float _563 = exp2(_555);
    float _565 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = fma(_559, _559, _561);
    float _571 = _561;
    float _573 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    float _575 = _547;
    float _577 = _543;
    if (_473)
    {
        _571 = _267;
    }
    float _579 = _571;
    float _581 = _579;
    if (!_473)
    {
        float _583 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[17].y, _267);
        _581 = _583;
    }
    float _585 = _581;
    float _587 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = sqrt(_569);
    float _591 = _383 * _499;
    out.m_56.x = _549;
    out.m_56.y = _545;
    float _593 = -_591;
    float _595 = fma(_385, _495, _593);
    out.m_58.x = _565;
    out.m_58.y = _567;
    out.m_58.z = _587;
    float _597 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _599 = precise::clamp(_597, 0.0, 1.0);
    float _601 = _493 * _595;
    float _603 = _595 * _507;
    float _605 = 2.0;
    if (_473)
    {
        _573 = _271;
    }
    float _607 = _573;
    float _609 = _519 * _507;
    float _611 = fma(_487, _497, _601);
    float _613 = _607;
    if (!_473)
    {
        float _615 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[17].y, _271);
        _613 = _615;
    }
    float _617 = _613;
    float _619 = _511 * _507;
    bool _621 = _589 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _623 = fma(_489, _387, _611);
    float _625 = fma(_599, -2.0, 3.0);
    float _627 = _599 * _599;
    bool _629 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _631 = isnan(0.5);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _637 = _633 || _635;
    float _639 = _225 + _623;
    float _641 = fma(_495, _585, _609);
    float _643 = _627 * _625;
    float _645 = fma(_497, _585, _603);
    bool _647 = !_621;
    float _649 = _639;
    float _651 = _623;
    if (!_647)
    {
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _657 = _589 + _655;
        float _659 = rsqrt(_569);
        float _661 = _657 * _653;
        float _663 = _639 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _665 = _661 * 0.15915493667125701904296875;
        float _667 = _665 * 6.283185482025146484375;
        float _669 = cos(_667);
        float _671 = _665 * 6.283185482025146484375;
        float _673 = sin(_671);
        float _675 = _669 + (-1.0);
        float _677 = _675 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _679 = fma(_673, _663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _681 = fma(_639, _669, _677);
        float _683 = _659 * _679;
        float _685 = fma(_559, _683, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _687 = fma(_553, _683, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _575 = _685;
        _577 = _687;
        _649 = _681;
        _605 = _669;
        _325 = _683;
    }
    float _689 = _575;
    float _691 = _577;
    float _693 = _649;
    float _695 = _605;
    float _697 = _325;
    float _699 = _695;
    float _701 = _697;
    float _703 = _693;
    if (_637)
    {
        _699 = _689;
    }
    float _705 = _699;
    float _707 = _705;
    if (_637)
    {
        _701 = _691;
    }
    float _709 = _701;
    float _711 = _709;
    if (!_637)
    {
        float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _715 = _225 + _713;
        float _717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _719 = _165 + _717;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _723 = -_165;
        float _725 = _723 + _689;
        float _727 = _715 * _715;
        float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _731 = _167 + _729;
        float _733 = -_225;
        float _735 = _733 + _693;
        float _737 = fma(_719, _719, _727);
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _741 = fma(_731, _731, _737);
        float _743 = sqrt(_741);
        float _745 = _721 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _747 = precise::min(_743, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _749 = _747 * _739;
        float _751 = -_167;
        float _753 = _751 + _691;
        float _755 = _745 * _749;
        float _757 = fma(_725, _755, _165);
        float _759 = fma(_735, _755, _225);
        float _761 = fma(_753, _755, _167);
        _703 = _759;
        _707 = _757;
        _711 = _761;
    }
    float _763 = _703;
    float _765 = _707;
    float _767 = _711;
    float _769 = _763 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _771 = -_643;
    float _773 = _771 + 1.0;
    float _775 = _763 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _777 = _763 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _779 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[1].x, _769);
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[654].w, _643);
    float _783 = _763 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _785 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[0].x, _775);
    float _787 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[1].z, _779);
    float _789 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[3].x, _777);
    float _791 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[2].x, _783);
    float _793 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[0].z, _785);
    float _795 = _787 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _797 = fma(_499, _585, _619);
    float _799 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[2].z, _791);
    float _801 = _793 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _803 = _795 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _805 = _795 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _807 = _795 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _809 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[3].z, _789);
    float _811 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[6].x, _803);
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[7].x, _805);
    float _815 = _799 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _819 = isnan(0.5);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    float _827 = _795 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _829 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[5].x, _807);
    float _831 = _809 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[6].z, _811);
    float _835 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[7].z, _813);
    float _837 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[4].x, _827);
    float _839 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[5].z, _829);
    float _841 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[6].w, _833);
    float _843 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[7].w, _835);
    bool _845 = _515 <= 8000.0;
    bool _847 = isnan(_515);
    bool _849 = _845 || _847;
    bool _851 = isnan(8000.0);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[4].z, _837);
    float _859 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[5].w, _839);
    float _861 = _841 + _843;
    float _863 = _835;
    float _865 = _797;
    float _867 = _843;
    float _869 = _841;
    if (_825)
    {
        _651 = 1.0;
    }
    float _871 = _651;
    float _873 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[4].w, _857);
    float _875 = _855 * _781;
    float _877 = _861 * 0.5;
    float _879 = _871;
    if (_825)
    {
        _863 = 1.0;
    }
    float _881 = _863;
    float _883 = _881;
    if (!_825)
    {
        float _885 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _887 = _885 * 0.15915493667125701904296875;
        float _889 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _893 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _891;
        float _895 = _887 * 6.283185482025146484375;
        float _897 = cos(_895);
        float _899 = _889 * 0.15915493667125701904296875;
        float _901 = _887 * 6.283185482025146484375;
        float _903 = sin(_901);
        float _905 = 1.0 / _897;
        float _907 = _899 * 6.283185482025146484375;
        float _909 = cos(_907);
        float _911 = _903 * _905;
        float _913 = _899 * 6.283185482025146484375;
        float _915 = sin(_913);
        float _917 = _909 * _911;
        float _919 = 1.0 / _893;
        float _921 = 1.0 / _917;
        float _923 = _915 * _921;
        float _925 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _927 = fma(_515, _923, _925);
        float _929 = _927 * _919;
        float _931 = precise::clamp(_929, 0.0, 1.0);
        _883 = _931;
    }
    float _933 = _883;
    if (!_825)
    {
        float _935 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _937 = _935 * 0.15915493667125701904296875;
        float _939 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _941 = _937 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _939 * 0.15915493667125701904296875;
        float _947 = _937 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = 1.0 / _943;
        float _953 = _945 * 6.283185482025146484375;
        float _955 = cos(_953);
        float _957 = _949 * _951;
        float _959 = _945 * 6.283185482025146484375;
        float _961 = sin(_959);
        float _963 = _955 * _957;
        float _965 = 1.0 / _963;
        float _967 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _969 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _967;
        float _971 = 1.0 / _969;
        float _973 = _961 * _965;
        float _975 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _977 = fma(_515, _973, _975);
        float _979 = _977 * _971;
        float _981 = precise::clamp(_979, 0.0, 1.0);
        float _983 = -_981;
        float _985 = _983 + 1.0;
        _879 = _985;
    }
    float _987 = _879;
    float _989 = in.m_60.x;
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _993 = _763 + _991;
    float _995 = fma(_383, _617, _641);
    float _997 = fma(_387, _617, _645);
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1001 = _765 + _999;
    float _1003 = _993 * _993;
    out.gl_Position.x = _873;
    out.gl_Position.y = _859;
    out.gl_Position.z = _841;
    out.gl_Position.w = _843;
    float _1005 = _875 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1009 = _767 + _1007;
    float _1011 = fma(_1001, _1001, _1003);
    out.m_62.z = _877;
    out.m_62.w = _843;
    float _1013 = fma(_385, _617, _797);
    out.m_64.x = _765;
    out.m_64.y = _763;
    out.m_64.z = _767;
    out.m_66.x = _995;
    out.m_66.y = _997;
    out.m_66.z = _1013;
    float _1015 = -_185;
    float _1017 = _1015 + 1.0;
    float _1019 = fma(_1009, _1009, _1011);
    float _1021 = _1017 * _1005;
    float _1023 = precise::clamp(_1021, 0.0, 1.0);
    float _1025 = sqrt(_1019);
    float _1027 = -_1023;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1031 = _1029 * _989;
    float _1033 = _1031 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1035 = _933 * _987;
    out.m_68.x = _1033;
    bool _1037 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1039 = isnan(_1025);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1045 = _1041 || _1043;
    float _1047 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1049 = _1011;
    float _1051 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1053 = _1035;
    if (!_1045)
    {
        _865 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1055 = _865;
    float _1057 = _1055;
    float _1059 = _1055;
    if (!_1045)
    {
        _1049 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1061 = _1049;
    float _1063 = _1061;
    float _1065 = _1061;
    if (!_1045)
    {
        _867 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1067 = _867;
    float _1069 = _1067;
    float _1071 = _1067;
    if (!_1045)
    {
        _869 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1073 = _869;
    float _1075 = _1073;
    float _1077 = _1073;
    if (!_1045)
    {
        _1051 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1079 = _1051;
    float _1081 = _1079;
    float _1083 = _1079;
    if (!_1045)
    {
        _1053 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1085 = _1053;
    bool _1087 = !_1045;
    float _1089 = _1085;
    float _1091 = _1085;
    if (!_1087)
    {
        bool _1093 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1095 = isnan(_1025);
        bool _1097 = _1093 || _1095;
        bool _1099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1101 = _1097 || _1099;
        if (!_1101)
        {
            float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1105 = _1025 + _1103;
            float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1109 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1107;
            float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1113 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1115 = 1.0 / _1109;
            float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1119 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1123 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1125 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1127 = _1125 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1131 = _1129 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1133 = _1105 * _1115;
            float _1135 = precise::clamp(_1133, 0.0, 1.0);
            float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1139 = _1137 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1141 = fma(_1135, _1113, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1143 = fma(_1135, _1139, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1145 = fma(_1135, _1119, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1147 = fma(_1135, _1123, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1149 = fma(_1135, _1127, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1151 = fma(_1135, _1131, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1065 = _1141;
            _1083 = _1149;
            _1059 = _1145;
            _1077 = _1147;
            _1071 = _1143;
            _1091 = _1151;
            _1153 = true;
        }
        else
        {
            bool _1155 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1157 = isnan(_1025);
            bool _1159 = _1155 || _1157;
            bool _1161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1163 = _1159 || _1161;
            if (!_1163)
            {
                _1057 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1165 = _1057;
            _1059 = _1165;
            if (!_1163)
            {
                _1063 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1167 = _1063;
            _1065 = _1167;
            if (!_1163)
            {
                _1069 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1169 = _1069;
            _1071 = _1169;
            if (!_1163)
            {
                _1075 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1171 = _1075;
            _1077 = _1171;
            if (!_1163)
            {
                _1081 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1173 = _1081;
            _1083 = _1173;
            if (!_1163)
            {
                _1089 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1175 = _1089;
            bool _1177 = !_1163;
            _1091 = _1175;
            if (!_1177)
            {
                bool _1179 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1181 = isnan(_1025);
                bool _1183 = _1179 || _1181;
                bool _1185 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1187 = _1183 || _1185;
                if (!_1187)
                {
                    float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1191 = _1025 + _1189;
                    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1193;
                    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1199 = _1197 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1201 = 1.0 / _1195;
                    float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1205 = _1203 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1209 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1213 = _1211 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1217 = _1215 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1219 = _1191 * _1201;
                    float _1221 = precise::clamp(_1219, 0.0, 1.0);
                    float _1223 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1225 = _1223 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1227 = fma(_1221, _1199, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1229 = fma(_1221, _1225, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1231 = fma(_1221, _1205, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1233 = fma(_1221, _1209, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1235 = fma(_1221, _1213, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1237 = fma(_1221, _1217, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1065 = _1227;
                    _1083 = _1235;
                    _1059 = _1231;
                    _1077 = _1233;
                    _1071 = _1229;
                    _1091 = _1237;
                    _1153 = true;
                }
                else
                {
                    _1065 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1083 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1059 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1077 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1071 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1091 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1153 = false;
    float _1239 = _1065;
    float _1241 = _1083;
    float _1243 = _1059;
    float _1245 = _1077;
    float _1247 = _1071;
    float _1249 = _1091;
    float _1251 = fma(_997, -0.5, 0.5);
    float _1253 = precise::clamp(_1251, 0.0, 1.0);
    float _1255 = -_1239;
    float _1257 = _1255 + _1241;
    float _1259 = -_1243;
    float _1261 = _1259 + _1245;
    out.m_70.x = 0.0;
    float _1263 = fma(_1253, _1257, _1239);
    float _1265 = rsqrt(_1019);
    float _1267 = fma(_1253, _1261, _1243);
    float _1269 = -_1247;
    float _1271 = _1269 + _1249;
    float _1273 = _1263 * 0.586610972881317138671875;
    bool _1275 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_72.x = 0.0;
    float _1277 = fma(_1253, _1271, _1247);
    float _1279 = fma(_1267, 0.298911988735198974609375, _1273);
    float _1281 = _1047 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1283 = _933 > 0.0;
    bool _1285 = isnan(_933);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    float _1293 = fma(_1277, 0.114477999508380889892578125, _1279);
    out.m_40.x = _1281;
    bool _1295 = _987 <= 0.0;
    bool _1297 = !_1291;
    bool _1299 = _1295 || _1297;
    float _1301 = -_1293;
    float _1303 = _1267 + _1301;
    float _1305 = -_1293;
    float _1307 = _1263 + _1305;
    float _1309 = _1001 * _1265;
    float _1311 = _993 * _1265;
    float _1313 = _1009 * _1265;
    float _1315 = fma(_1307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1293);
    float _1317 = -_1293;
    float _1319 = _1277 + _1317;
    float _1321 = fma(_1303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1293);
    float _1323 = fma(_1319, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1293);
    bool _1325 = !_1275;
    if (!_1325)
    {
        float _1327 = -_763;
        float _1329 = _1327 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1331 = -_765;
        float _1333 = _1331 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1335 = -_767;
        float _1337 = _1335 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1339 = _1329 * _1329;
        float _1341 = fma(_1333, _1333, _1339);
        float _1343 = fma(_1337, _1337, _1341);
        float _1345 = rsqrt(_1343);
        float _1347 = _1329 * _1345;
        float _1349 = _1333 * _1345;
        float _1351 = _1337 * _1345;
        float _1353 = sqrt(_1343);
        float _1355 = -_1311;
        float _1357 = _1355 + _1347;
        float _1359 = -_1309;
        float _1361 = _1359 + _1349;
        float _1363 = -_1313;
        float _1365 = _1363 + _1351;
        float _1367 = _1357 * _1357;
        float _1369 = fma(_1361, _1361, _1367);
        float _1371 = fma(_1365, _1365, _1369);
        float _1373 = -_1353;
        float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1377 = rsqrt(_1371);
        float _1379 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1381 = precise::clamp(_1379, 0.0, 1.0);
        float _1383 = abs(_1381);
        float _1385 = log2(_1383);
        float _1387 = _1357 * _1377;
        float _1389 = _1361 * _1377;
        float _1391 = _1365 * _1377;
        float _1393 = _997 * _1387;
        float _1395 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _1397 = precise::clamp(_1395, 0.0, 1.0);
        float _1399 = _997 * _1347;
        float _1401 = fma(_995, _1389, _1393);
        float _1403 = _1397 * _1397;
        float _1405 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1407 = fma(_995, _1349, _1399);
        float _1409 = fma(_1013, _1391, _1401);
        float _1411 = precise::clamp(_1409, 0.0, 1.0);
        float _1413 = _1403 + (-1.0);
        float _1415 = fma(_1013, _1351, _1407);
        float _1417 = precise::clamp(_1415, 0.0, 1.0);
        float _1419 = _1411 * _1411;
        float _1421 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1423 = exp2(_1405);
        float _1425 = fma(_1419, _1413, 1.0);
        float _1427 = -_1347;
        float _1429 = -_1421;
        float _1431 = fma(_1427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1429);
        float _1433 = _1425 * _1425;
        float _1435 = -_1351;
        float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1431);
        float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1441 = _1437 + _1439;
        float _1443 = 1.0 / _1433;
        float _1445 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1447 = precise::clamp(_1445, 0.0, 1.0);
        float _1449 = _1423 * _1447;
        float _1451 = _1417 * _1449;
        float _1453 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1455 = _1403 * _1443;
        float _1457 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1459 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _1461 = _1451 * _1455;
        out.m_70.x = _1453;
        out.m_70.y = _1457;
        out.m_70.z = _1459;
        float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1465 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1467 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_72.x = _1463;
        out.m_72.y = _1465;
        out.m_72.z = _1467;
    }
    out.m_74.x = _1321;
    out.m_74.y = _1315;
    out.m_74.z = _1323;
    if (!_1299)
    {
        return out;
    }
    out.m_40.x = 0.0;
    float _1469 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1469;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1153 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_37.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    float _101 = as_type<float>(_93);
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _99;
    float _105 = _103;
    if (!_97)
    {
        out.m_40.x = 0.0;
    }
    int _107 = 0;
    if (!_97)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1528 = as_type<float>(_111);
        out.gl_Position.z = _1528;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_42.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_125)
    {
        float _131 = float(_93);
        _105 = _131;
    }
    float _133 = _105;
    bool _135 = _129 >= _133;
    bool _137 = !_125;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_40.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _113 = as_type<int>(_143);
    }
    int _145 = _113;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1596 = as_type<float>(_145);
        out.gl_Position.z = _1596;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _157 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _159 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _155);
    float _161 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _157);
    float _163 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _159);
    float _165 = _161 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _167 = _163 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _169 = fma(_165, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _171 = fma(_167, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _173 = floor(_169);
    float _175 = floor(_171);
    float _177 = -_173;
    float _179 = _169 + _177;
    float _181 = -_175;
    float _183 = _171 + _181;
    float2 _1676 = float2(_179, _183);
    float _185 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_1676, float2(0.0), isnan(_1676)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_1676, float2(0.0), isnan(_1676)), level(0.0)).x;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = in.m_46.x;
    float _195 = in.m_46.y;
    float _197 = in.m_46.z;
    float _199 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _203 = _201 != 0;
    float _205 = in.m_48.x;
    float _207 = in.m_48.y;
    float _209 = in.m_48.z;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _213 = _211 != 0;
    float _215 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _219 = in.m_50.y;
    float _221 = -_167;
    float _223 = _221 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _225 = _215 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _227 = in.m_50.x;
    float _229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _231 = 0.0;
    float _233 = _219;
    if (_203)
    {
        float _235 = in.m_44.x;
        _231 = _235;
    }
    float _237 = _231;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _241 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _187);
    bool _243 = _189 > 0.5;
    float _245 = _187 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _247 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[78].z, _239);
    float _249 = _195 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _253 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _247);
    float _255 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[191].y, _249);
    float _257 = _209 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _259 = -_251;
    float _261 = fma(_245, 2.0, _259);
    float _263 = _255 * 6.283185482025146484375;
    float _265 = _205 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _267 = in.m_52.x;
    float _269 = in.m_52.y;
    float _271 = in.m_52.z;
    float _273 = _207 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = _263 * 0.15915493667125701904296875;
    float _277 = 0.0;
    float _279 = _227;
    if (_203)
    {
        _277 = _227;
    }
    float _281 = _277;
    float _283 = _265 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _285 = _273 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _287 = _257 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _289 = _275 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = _291 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _295 = fma(_271, _293, _197);
    float _297 = fma(_267, _293, _193);
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _301 = _189 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _303 = fma(_269, _293, _195);
    float _305 = -_219;
    float _307 = _305 + 1.0;
    float _309 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[78].w, _299);
    float _311 = -_225;
    float _313 = _311 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _315 = fma(_301, -2.0, _217);
    float _317 = -_165;
    float _319 = _317 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _321 = _281;
    float _323 = _269;
    float _325 = _271;
    if (_213)
    {
        float _327 = _243 ? _307 : _219;
        _233 = _327;
    }
    float _329 = _233;
    float _331 = _313 * _313;
    float _333 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _315);
    float _335 = fma(_319, _319, _331);
    bool _337 = _237 > 0.5;
    bool _339 = _337 && _203;
    float _341 = fma(_223, _223, _335);
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _347 = _225 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _353 = rsqrt(_341);
    float _355 = fma(_165, (*spvDescriptorSet0.vp_c8)._m0[11].x, _347);
    float _357 = _225 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _359 = _349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _361 = _343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _363 = fma(_167, (*spvDescriptorSet0.vp_c8)._m0[11].z, _355);
    float _365 = _351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _367 = fma(_165, (*spvDescriptorSet0.vp_c8)._m0[10].x, _357);
    float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _371 = _363 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    if (_339)
    {
        float _373 = -_281;
        float _375 = _373 + 1.0;
        _321 = _375;
    }
    float _377 = _321;
    out.m_54.x = _359;
    out.m_54.y = _361;
    out.m_54.z = _365;
    out.m_54.w = _345;
    float _379 = fma(_167, (*spvDescriptorSet0.vp_c8)._m0[10].z, _367);
    if (_203)
    {
        _279 = _377;
    }
    float _381 = _279;
    float _383 = _319 * _353;
    float _385 = _223 * _353;
    float _387 = _313 * _353;
    float _389 = 1.0 / _371;
    float _391 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _393 = _383 * _391;
    bool _395 = _303 != 0.0;
    bool _397 = isnan(_303);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _407 = _385 * _405;
    float _409 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _411 = -_393;
    float _413 = fma(_385, _409, _411);
    float _415 = _379 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _417 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _419 = _387 * _417;
    float _421 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _423 = -_407;
    float _425 = fma(_387, _421, _423);
    float _427 = _413 * _413;
    float _429 = _415 + _371;
    float _431 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _433 = -_419;
    float _435 = fma(_383, _431, _433);
    float _437 = -_129;
    float _439 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[76].x, _261);
    float _441 = fma(_425, _425, _427);
    float _443 = _229 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _445 = _297 == 0.0;
    bool _447 = !_403;
    bool _449 = _445 && _447;
    float _451 = fma(_435, _435, _441);
    float _453 = _429 * _389;
    float _455 = _453 * 0.5;
    float _457 = fma(_443, _329, -0.5);
    float _459 = rsqrt(_451);
    float _461 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _463 = fma(_455, (*spvDescriptorSet0.vp_c8)._m0[30].w, _461);
    float _465 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _309);
    float _467 = _369 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _469 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _295);
    bool _471 = _295 == 0.0;
    bool _473 = _471 && _449;
    float _475 = -_333;
    float _477 = fma(_465, _457, _475);
    float _479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _297);
    float _481 = 1.0 / _463;
    float _483 = fma(_467, _381, -0.5);
    float _485 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _303);
    float _487 = _283 * _479;
    float _489 = _287 * _469;
    float _491 = fma(_253, _483, _439);
    float _493 = _285 * _485;
    float _495 = _425 * _459;
    float _497 = _413 * _459;
    float _499 = _435 * _459;
    float _501 = _387 * _495;
    float _503 = _385 * _497;
    if (!_473)
    {
        float _505 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[17].y, _269);
        _323 = _505;
    }
    float _507 = _323;
    float _509 = -_501;
    float _511 = fma(_383, _497, _509);
    float _513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _515 = _481 * _513;
    float _517 = -_503;
    float _519 = fma(_387, _499, _517);
    float _521 = _493 * _511;
    float _523 = abs(_515);
    float _525 = log2(_523);
    float _527 = _493 * _519;
    float _529 = fma(_487, _499, _521);
    float _531 = fma(_487, _495, _527);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _535 = fma(_489, _385, _529);
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _539 = fma(_489, _383, _531);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _543 = _167 + _535;
    float _545 = _477 + 0.5;
    float _547 = _165 + _539;
    float _549 = _491 + 0.5;
    float _551 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _553 = _543 + _551;
    float _555 = _525 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _557 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _559 = _547 + _557;
    float _561 = _553 * _553;
    float _563 = exp2(_555);
    float _565 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = fma(_559, _559, _561);
    float _571 = _561;
    float _573 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    float _575 = _547;
    float _577 = _543;
    if (_473)
    {
        _571 = _267;
    }
    float _579 = _571;
    float _581 = _579;
    if (!_473)
    {
        float _583 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[17].y, _267);
        _581 = _583;
    }
    float _585 = _581;
    float _587 = _541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = sqrt(_569);
    float _591 = _383 * _499;
    out.m_56.x = _549;
    out.m_56.y = _545;
    float _593 = -_591;
    float _595 = fma(_385, _495, _593);
    out.m_58.x = _565;
    out.m_58.y = _567;
    out.m_58.z = _587;
    float _597 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _599 = precise::clamp(_597, 0.0, 1.0);
    float _601 = _493 * _595;
    float _603 = _595 * _507;
    float _605 = 2.0;
    if (_473)
    {
        _573 = _271;
    }
    float _607 = _573;
    float _609 = _519 * _507;
    float _611 = fma(_487, _497, _601);
    float _613 = _607;
    if (!_473)
    {
        float _615 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[17].y, _271);
        _613 = _615;
    }
    float _617 = _613;
    float _619 = _511 * _507;
    bool _621 = _589 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _623 = fma(_489, _387, _611);
    float _625 = fma(_599, -2.0, 3.0);
    float _627 = _599 * _599;
    bool _629 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _631 = isnan(0.5);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _637 = _633 || _635;
    float _639 = _225 + _623;
    float _641 = fma(_495, _585, _609);
    float _643 = _627 * _625;
    float _645 = fma(_497, _585, _603);
    bool _647 = !_621;
    float _649 = _639;
    float _651 = _623;
    if (!_647)
    {
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _657 = _589 + _655;
        float _659 = rsqrt(_569);
        float _661 = _657 * _653;
        float _663 = _639 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _665 = _661 * 0.15915493667125701904296875;
        float _667 = _665 * 6.283185482025146484375;
        float _669 = cos(_667);
        float _671 = _665 * 6.283185482025146484375;
        float _673 = sin(_671);
        float _675 = _669 + (-1.0);
        float _677 = _675 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _679 = fma(_673, _663, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _681 = fma(_639, _669, _677);
        float _683 = _659 * _679;
        float _685 = fma(_559, _683, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _687 = fma(_553, _683, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _575 = _685;
        _577 = _687;
        _649 = _681;
        _605 = _669;
        _325 = _683;
    }
    float _689 = _575;
    float _691 = _577;
    float _693 = _649;
    float _695 = _605;
    float _697 = _325;
    float _699 = _695;
    float _701 = _697;
    float _703 = _693;
    if (_637)
    {
        _699 = _689;
    }
    float _705 = _699;
    float _707 = _705;
    if (_637)
    {
        _701 = _691;
    }
    float _709 = _701;
    float _711 = _709;
    if (!_637)
    {
        float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _715 = _225 + _713;
        float _717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _719 = _165 + _717;
        float _721 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _723 = -_165;
        float _725 = _723 + _689;
        float _727 = _715 * _715;
        float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _731 = _167 + _729;
        float _733 = -_225;
        float _735 = _733 + _693;
        float _737 = fma(_719, _719, _727);
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _741 = fma(_731, _731, _737);
        float _743 = sqrt(_741);
        float _745 = _721 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _747 = precise::min(_743, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _749 = _747 * _739;
        float _751 = -_167;
        float _753 = _751 + _691;
        float _755 = _745 * _749;
        float _757 = fma(_725, _755, _165);
        float _759 = fma(_735, _755, _225);
        float _761 = fma(_753, _755, _167);
        _703 = _759;
        _707 = _757;
        _711 = _761;
    }
    float _763 = _703;
    float _765 = _707;
    float _767 = _711;
    float _769 = _763 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _771 = -_643;
    float _773 = _771 + 1.0;
    float _775 = _763 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _777 = _763 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _779 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[1].x, _769);
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c15)._m0[654].w, _643);
    float _783 = _763 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _785 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[0].x, _775);
    float _787 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[1].z, _779);
    float _789 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[3].x, _777);
    float _791 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[2].x, _783);
    float _793 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[0].z, _785);
    float _795 = _787 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _797 = fma(_499, _585, _619);
    float _799 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[2].z, _791);
    float _801 = _793 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _803 = _795 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _805 = _795 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _807 = _795 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _809 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[3].z, _789);
    float _811 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[6].x, _803);
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[7].x, _805);
    float _815 = _799 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _819 = isnan(0.5);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    float _827 = _795 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _829 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[5].x, _807);
    float _831 = _809 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _833 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[6].z, _811);
    float _835 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[7].z, _813);
    float _837 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[4].x, _827);
    float _839 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[5].z, _829);
    float _841 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[6].w, _833);
    float _843 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[7].w, _835);
    bool _845 = _515 <= 8000.0;
    bool _847 = isnan(_515);
    bool _849 = _845 || _847;
    bool _851 = isnan(8000.0);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = fma(_815, (*spvDescriptorSet0.vp_c8)._m0[4].z, _837);
    float _859 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[5].w, _839);
    float _861 = _841 + _843;
    float _863 = _835;
    float _865 = _797;
    float _867 = _843;
    float _869 = _841;
    if (_825)
    {
        _651 = 1.0;
    }
    float _871 = _651;
    float _873 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[4].w, _857);
    float _875 = _855 * _781;
    float _877 = _861 * 0.5;
    float _879 = _871;
    if (_825)
    {
        _863 = 1.0;
    }
    float _881 = _863;
    float _883 = _881;
    if (!_825)
    {
        float _885 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _887 = _885 * 0.15915493667125701904296875;
        float _889 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _891 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _893 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _891;
        float _895 = _887 * 6.283185482025146484375;
        float _897 = cos(_895);
        float _899 = _889 * 0.15915493667125701904296875;
        float _901 = _887 * 6.283185482025146484375;
        float _903 = sin(_901);
        float _905 = 1.0 / _897;
        float _907 = _899 * 6.283185482025146484375;
        float _909 = cos(_907);
        float _911 = _903 * _905;
        float _913 = _899 * 6.283185482025146484375;
        float _915 = sin(_913);
        float _917 = _909 * _911;
        float _919 = 1.0 / _893;
        float _921 = 1.0 / _917;
        float _923 = _915 * _921;
        float _925 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _927 = fma(_515, _923, _925);
        float _929 = _927 * _919;
        float _931 = precise::clamp(_929, 0.0, 1.0);
        _883 = _931;
    }
    float _933 = _883;
    if (!_825)
    {
        float _935 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _937 = _935 * 0.15915493667125701904296875;
        float _939 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _941 = _937 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _939 * 0.15915493667125701904296875;
        float _947 = _937 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = 1.0 / _943;
        float _953 = _945 * 6.283185482025146484375;
        float _955 = cos(_953);
        float _957 = _949 * _951;
        float _959 = _945 * 6.283185482025146484375;
        float _961 = sin(_959);
        float _963 = _955 * _957;
        float _965 = 1.0 / _963;
        float _967 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _969 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _967;
        float _971 = 1.0 / _969;
        float _973 = _961 * _965;
        float _975 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _977 = fma(_515, _973, _975);
        float _979 = _977 * _971;
        float _981 = precise::clamp(_979, 0.0, 1.0);
        float _983 = -_981;
        float _985 = _983 + 1.0;
        _879 = _985;
    }
    float _987 = _879;
    float _989 = in.m_60.x;
    float _991 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _993 = _763 + _991;
    float _995 = fma(_383, _617, _641);
    float _997 = fma(_387, _617, _645);
    float _999 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1001 = _765 + _999;
    float _1003 = _993 * _993;
    out.gl_Position.x = _873;
    out.gl_Position.y = _859;
    out.gl_Position.z = _841;
    out.gl_Position.w = _843;
    float _1005 = _875 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1007 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1009 = _767 + _1007;
    float _1011 = fma(_1001, _1001, _1003);
    out.m_62.z = _877;
    out.m_62.w = _843;
    float _1013 = fma(_385, _617, _797);
    out.m_64.x = _765;
    out.m_64.y = _763;
    out.m_64.z = _767;
    out.m_66.x = _995;
    out.m_66.y = _997;
    out.m_66.z = _1013;
    float _1015 = -_185;
    float _1017 = _1015 + 1.0;
    float _1019 = fma(_1009, _1009, _1011);
    float _1021 = _1017 * _1005;
    float _1023 = precise::clamp(_1021, 0.0, 1.0);
    float _1025 = sqrt(_1019);
    float _1027 = -_1023;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1031 = _1029 * _989;
    float _1033 = _1031 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1035 = _933 * _987;
    out.m_68.x = _1033;
    bool _1037 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1039 = isnan(_1025);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1045 = _1041 || _1043;
    float _1047 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1049 = _1011;
    float _1051 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _1053 = _1035;
    if (!_1045)
    {
        _865 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1055 = _865;
    float _1057 = _1055;
    float _1059 = _1055;
    if (!_1045)
    {
        _1049 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1061 = _1049;
    float _1063 = _1061;
    float _1065 = _1061;
    if (!_1045)
    {
        _867 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1067 = _867;
    float _1069 = _1067;
    float _1071 = _1067;
    if (!_1045)
    {
        _869 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1073 = _869;
    float _1075 = _1073;
    float _1077 = _1073;
    if (!_1045)
    {
        _1051 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1079 = _1051;
    float _1081 = _1079;
    float _1083 = _1079;
    if (!_1045)
    {
        _1053 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1085 = _1053;
    bool _1087 = !_1045;
    float _1089 = _1085;
    float _1091 = _1085;
    if (!_1087)
    {
        bool _1093 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1095 = isnan(_1025);
        bool _1097 = _1093 || _1095;
        bool _1099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1101 = _1097 || _1099;
        if (!_1101)
        {
            float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1105 = _1025 + _1103;
            float _1107 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1109 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1107;
            float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1113 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1115 = 1.0 / _1109;
            float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1119 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1123 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1125 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1127 = _1125 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1131 = _1129 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1133 = _1105 * _1115;
            float _1135 = precise::clamp(_1133, 0.0, 1.0);
            float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1139 = _1137 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1141 = fma(_1135, _1113, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1143 = fma(_1135, _1139, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1145 = fma(_1135, _1119, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1147 = fma(_1135, _1123, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1149 = fma(_1135, _1127, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1151 = fma(_1135, _1131, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1065 = _1141;
            _1083 = _1149;
            _1059 = _1145;
            _1077 = _1147;
            _1071 = _1143;
            _1091 = _1151;
            _1153 = true;
        }
        else
        {
            bool _1155 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1157 = isnan(_1025);
            bool _1159 = _1155 || _1157;
            bool _1161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1163 = _1159 || _1161;
            if (!_1163)
            {
                _1057 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1165 = _1057;
            _1059 = _1165;
            if (!_1163)
            {
                _1063 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1167 = _1063;
            _1065 = _1167;
            if (!_1163)
            {
                _1069 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1169 = _1069;
            _1071 = _1169;
            if (!_1163)
            {
                _1075 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1171 = _1075;
            _1077 = _1171;
            if (!_1163)
            {
                _1081 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1173 = _1081;
            _1083 = _1173;
            if (!_1163)
            {
                _1089 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1175 = _1089;
            bool _1177 = !_1163;
            _1091 = _1175;
            if (!_1177)
            {
                bool _1179 = _1025 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1181 = isnan(_1025);
                bool _1183 = _1179 || _1181;
                bool _1185 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1187 = _1183 || _1185;
                if (!_1187)
                {
                    float _1189 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1191 = _1025 + _1189;
                    float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1193;
                    float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1199 = _1197 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1201 = 1.0 / _1195;
                    float _1203 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1205 = _1203 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1209 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1213 = _1211 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1217 = _1215 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1219 = _1191 * _1201;
                    float _1221 = precise::clamp(_1219, 0.0, 1.0);
                    float _1223 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1225 = _1223 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1227 = fma(_1221, _1199, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1229 = fma(_1221, _1225, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1231 = fma(_1221, _1205, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1233 = fma(_1221, _1209, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1235 = fma(_1221, _1213, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1237 = fma(_1221, _1217, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1065 = _1227;
                    _1083 = _1235;
                    _1059 = _1231;
                    _1077 = _1233;
                    _1071 = _1229;
                    _1091 = _1237;
                    _1153 = true;
                }
                else
                {
                    _1065 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1083 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1059 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1077 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1071 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1091 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1153 = false;
    float _1239 = _1065;
    float _1241 = _1083;
    float _1243 = _1059;
    float _1245 = _1077;
    float _1247 = _1071;
    float _1249 = _1091;
    float _1251 = fma(_997, -0.5, 0.5);
    float _1253 = precise::clamp(_1251, 0.0, 1.0);
    float _1255 = -_1239;
    float _1257 = _1255 + _1241;
    float _1259 = -_1243;
    float _1261 = _1259 + _1245;
    out.m_70.x = 0.0;
    float _1263 = fma(_1253, _1257, _1239);
    float _1265 = rsqrt(_1019);
    float _1267 = fma(_1253, _1261, _1243);
    float _1269 = -_1247;
    float _1271 = _1269 + _1249;
    float _1273 = _1263 * 0.586610972881317138671875;
    bool _1275 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_72.x = 0.0;
    float _1277 = fma(_1253, _1271, _1247);
    float _1279 = fma(_1267, 0.298911988735198974609375, _1273);
    float _1281 = _1047 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _1283 = _933 > 0.0;
    bool _1285 = isnan(_933);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    float _1293 = fma(_1277, 0.114477999508380889892578125, _1279);
    out.m_40.x = _1281;
    bool _1295 = _987 <= 0.0;
    bool _1297 = !_1291;
    bool _1299 = _1295 || _1297;
    float _1301 = -_1293;
    float _1303 = _1267 + _1301;
    float _1305 = -_1293;
    float _1307 = _1263 + _1305;
    float _1309 = _1001 * _1265;
    float _1311 = _993 * _1265;
    float _1313 = _1009 * _1265;
    float _1315 = fma(_1307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1293);
    float _1317 = -_1293;
    float _1319 = _1277 + _1317;
    float _1321 = fma(_1303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1293);
    float _1323 = fma(_1319, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1293);
    bool _1325 = !_1275;
    if (!_1325)
    {
        float _1327 = -_763;
        float _1329 = _1327 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1331 = -_765;
        float _1333 = _1331 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1335 = -_767;
        float _1337 = _1335 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1339 = _1329 * _1329;
        float _1341 = fma(_1333, _1333, _1339);
        float _1343 = fma(_1337, _1337, _1341);
        float _1345 = rsqrt(_1343);
        float _1347 = _1329 * _1345;
        float _1349 = _1333 * _1345;
        float _1351 = _1337 * _1345;
        float _1353 = sqrt(_1343);
        float _1355 = -_1311;
        float _1357 = _1355 + _1347;
        float _1359 = -_1309;
        float _1361 = _1359 + _1349;
        float _1363 = -_1313;
        float _1365 = _1363 + _1351;
        float _1367 = _1357 * _1357;
        float _1369 = fma(_1361, _1361, _1367);
        float _1371 = fma(_1365, _1365, _1369);
        float _1373 = -_1353;
        float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1377 = rsqrt(_1371);
        float _1379 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1381 = precise::clamp(_1379, 0.0, 1.0);
        float _1383 = abs(_1381);
        float _1385 = log2(_1383);
        float _1387 = _1357 * _1377;
        float _1389 = _1361 * _1377;
        float _1391 = _1365 * _1377;
        float _1393 = _997 * _1387;
        float _1395 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _1397 = precise::clamp(_1395, 0.0, 1.0);
        float _1399 = _997 * _1347;
        float _1401 = fma(_995, _1389, _1393);
        float _1403 = _1397 * _1397;
        float _1405 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1407 = fma(_995, _1349, _1399);
        float _1409 = fma(_1013, _1391, _1401);
        float _1411 = precise::clamp(_1409, 0.0, 1.0);
        float _1413 = _1403 + (-1.0);
        float _1415 = fma(_1013, _1351, _1407);
        float _1417 = precise::clamp(_1415, 0.0, 1.0);
        float _1419 = _1411 * _1411;
        float _1421 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1423 = exp2(_1405);
        float _1425 = fma(_1419, _1413, 1.0);
        float _1427 = -_1347;
        float _1429 = -_1421;
        float _1431 = fma(_1427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1429);
        float _1433 = _1425 * _1425;
        float _1435 = -_1351;
        float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1431);
        float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1441 = _1437 + _1439;
        float _1443 = 1.0 / _1433;
        float _1445 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1447 = precise::clamp(_1445, 0.0, 1.0);
        float _1449 = _1423 * _1447;
        float _1451 = _1417 * _1449;
        float _1453 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1455 = _1403 * _1443;
        float _1457 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1459 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _1461 = _1451 * _1455;
        out.m_70.x = _1453;
        out.m_70.y = _1457;
        out.m_70.z = _1459;
        float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1465 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1467 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_72.x = _1463;
        out.m_72.y = _1465;
        out.m_72.z = _1467;
    }
    out.m_74.x = _1321;
    out.m_74.y = _1315;
    out.m_74.z = _1323;
    if (!_1299)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_40.x = 0.0;
    float _1469 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1469;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

