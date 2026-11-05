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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2465 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = in.m_48.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_53.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_135);
        out.gl_Position.z = _2781;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_113);
    bool _149 = _117 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _125;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    int _157 = 0;
    if (_153)
    {
        float _159 = _155 * 5.0;
        _157 = as_type<int>(_159);
    }
    int _161 = _157;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2836 = as_type<float>(_161);
        out.gl_Position.z = _2836;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = 1.0 / _147;
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = _117 * _165;
    int _193 = as_type<int>(_163) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_163) & 2;
    bool _199 = _197 != 0;
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _203 = _169 * _175;
    float _205 = _169 * _181;
    float _207 = fma(_167, _173, _203);
    float _209 = _169 * _187;
    float _211 = fma(_167, _179, _205);
    float _213 = fma(_171, _177, _207);
    float _215 = fma(_167, _185, _209);
    float _217 = fma(_171, _183, _211);
    float _219 = fma(_171, _189, _215);
    bool _221 = !_195;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_199;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_201;
    float _231 = _191;
    float _233 = _219;
    float _251;
    if (!_229)
    {
        float _235 = in.m_66.x;
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _191;
    }
    _253 = false;
    float _255 = _251;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    bool _261 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _263 = isnan(_255);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -_271;
    float _279 = _277 + 1.0;
    bool _281 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _283 = isnan(_255);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _293;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _275;
    float _301 = _291 * _279;
    float _303 = -_291;
    float _305 = _303 + 1.0;
    float _307 = _259 * _299;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = fma(_295, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _315 = fma(_311, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = _313 * _301;
    float _319 = _315 * _301;
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _323 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _325 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _327 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    bool _329 = !_297;
    if (!_329)
    {
        float _331 = in.m_66.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _339 = _337 * _333;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _231 = _345;
    }
    float _347 = _231;
    float _349 = in.m_66.x;
    float _351 = in.m_66.y;
    float _353 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _355 = log2(_353);
    float _357 = in.m_66.z;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _363 = int(_361);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _367 = _355 * _117;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _371 = exp2(_367);
    float _373 = _349 * 2.0;
    float _375 = _351 + _349;
    float _377 = _351 * 2.0;
    float _379 = _349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _381 = _357 * 2.0;
    float _383 = _375 + (-1.0);
    float _385 = float(_363);
    float _387 = floor(_373);
    float _389 = -_365;
    float _391 = fma(_379, 2.0, _389);
    float _393 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _369);
    float _395 = -_117;
    float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[76].x, _391);
    float _399 = floor(_381);
    float _401 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _403 = -_371;
    float _405 = _403 + 1.0;
    float _407 = fma(_401, -2.0, _359);
    float _409 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _411 = floor(_377);
    float _413 = _351 + _357;
    float _415 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _407);
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _419 = _417 != 0;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _427 = _425 != 0;
    float _429 = _413 + (-1.0);
    bool _431 = _387 > 0.0;
    bool _433 = _399 >= 0.0;
    bool _435 = isnan(_399);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _445 = !_423;
    int _447 = _445 ? 0 : 1;
    float _449 = 1.0 / _385;
    bool _451 = _399 > 0.0;
    int _453 = _441 ? 0 : 1;
    bool _455 = !_419;
    int _457 = _455 ? 0 : 1;
    bool _459 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _467 = _463 || _465;
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _471 = int(_469);
    bool _473 = _387 >= 0.0;
    bool _475 = isnan(_387);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    bool _483 = _411 > 0.0;
    bool _485 = _411 >= 0.0;
    bool _487 = isnan(_411);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    int _495 = ~_453;
    int _497 = _495 + 1;
    int _499 = _497 + 1;
    float _501 = _449 * _117;
    int _503 = _499;
    if (!_451)
    {
        int _505 = ~_453;
        int _507 = _505 + 1;
        _503 = _507;
    }
    int _509 = _503;
    bool _511 = !_427;
    int _513 = _511 ? 0 : 1;
    float _515 = _467 ? _405 : 0.0;
    int _517 = _481 ? 0 : 1;
    float _519 = in.m_68.x;
    float _521 = in.m_68.y;
    float _523 = in.m_68.z;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _531 = _529 != 0;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _535 = _533 != 0;
    bool _537 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _539 = isnan(1.0);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _545 = _541 || _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _549 = 1.0 + _547;
    bool _551 = !_527;
    int _553 = _551 ? 0 : 1;
    float _555 = 1.0 / _549;
    float _557 = float(_471);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _561 = abs(_553);
    float _563 = float(_509);
    float _565 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _559);
    float _567 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _393);
    bool _569 = !_531;
    int _571 = _569 ? 0 : 1;
    float _573 = _557 * _117;
    float _575 = float(_561);
    float _577 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _565);
    int _579 = ~_517;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    int _585 = _583;
    if (!_431)
    {
        int _587 = ~_517;
        int _589 = _587 + 1;
        _585 = _589;
    }
    int _591 = _585;
    if (_545)
    {
        float _593 = _515 * _555;
        _127 = _593;
    }
    float _595 = _127;
    float _597 = _575 * _563;
    int _599 = abs(_571);
    float _601 = _349 + (-0.5);
    int _603 = _493 ? 0 : 1;
    float _605 = _597 * (-2.0);
    float _607 = float(_591);
    float _609 = float(_599);
    float _611 = fma(_605, _519, _519);
    float _613 = fma(_409, _605, _409);
    bool _615 = !_535;
    int _617 = _615 ? 0 : 1;
    float _619 = _609 * _607;
    int _621 = ~_603;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    float _627 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].x, _611);
    int _629 = _625;
    if (!_483)
    {
        int _631 = ~_603;
        int _633 = _631 + 1;
        _629 = _633;
    }
    int _635 = _629;
    float _637 = _619 * (-2.0);
    int _639 = abs(_617);
    float _641 = _351 + (-0.5);
    float _643 = float(_635);
    float _645 = fma(_637, _521, _521);
    float _647 = float(_639);
    float _649 = fma(_613, _595, _627);
    float _651 = fma(_443, _637, _443);
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[196].y, _645);
    float _655 = _357 + _349;
    float _657 = _647 * _643;
    float _659 = _649 * 0.15915493667125701904296875;
    float _661 = fma(_651, _595, _653);
    float _663 = _655 + (-1.0);
    float _665 = _657 * (-2.0);
    float _667 = in.m_70.x;
    float _669 = in.m_70.y;
    float _671 = _357 + (-0.5);
    float _673 = fma(_665, _523, _523);
    float _675 = _661 * 0.15915493667125701904296875;
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _679 = _659 * 6.283185482025146484375;
    float _681 = sin(_679);
    float _683 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[196].z, _673);
    float _685 = in.m_46.x;
    float _687 = in.m_46.y;
    float _689 = in.m_46.z;
    float _691 = fma(_677, _665, _677);
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _695 = fma(_691, _595, _683);
    float _697 = _659 * 6.283185482025146484375;
    float _699 = cos(_697);
    float _701 = _695 * 0.15915493667125701904296875;
    float _703 = _675 * 6.283185482025146484375;
    float _705 = sin(_703);
    float _707 = _325 * _667;
    float _709 = _327 * _669;
    float _711 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _713 = _707 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _715 = _675 * 6.283185482025146484375;
    float _717 = cos(_715);
    float _719 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _721 = _187 * _687;
    float _723 = _713 * _711;
    float _725 = _175 * _687;
    float _727 = _719 * _693;
    float _729 = fma(_185, _685, _721);
    float _731 = _181 * _687;
    float _733 = _701 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = _681 * _705;
    float _739 = _699 * _705;
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = fma(_173, _685, _725);
    float _745 = fma(_189, _689, _729);
    float _747 = fma(_179, _685, _731);
    float _749 = _701 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = _699 * _717;
    float _755 = _681 * _717;
    float _757 = fma(_177, _689, _743);
    float _759 = fma(_183, _689, _747);
    float _761 = _699 * _735;
    float _763 = _681 * _735;
    float _765 = _717 * _735;
    float _767 = _705 * _735;
    float _769 = _761 * _727;
    float _771 = in.m_64.w;
    float _773 = fma(_751, _753, _737);
    float _775 = -_727;
    float _777 = _751 * _775;
    float _779 = in.m_60.w;
    float _781 = -_755;
    float _783 = fma(_751, _739, _781);
    float _785 = fma(_773, _723, _769);
    float _787 = -_739;
    float _789 = fma(_751, _755, _787);
    float _791 = _763 * _727;
    float _793 = fma(_765, _723, _777);
    float _795 = fma(_783, _741, _785);
    float _797 = fma(_751, _737, _753);
    float _799 = fma(_789, _723, _791);
    float _801 = fma(_767, _741, _793);
    float _803 = _795 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _805 = fma(_797, _741, _799);
    float _807 = _795 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].x, _803);
    float _811 = _795 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].x, _807);
    float _815 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].z, _809);
    float _817 = _745 + _771;
    float _819 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _811);
    float _821 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = in.m_62.w;
    float _827 = _757 + _779;
    float _829 = _821 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _831 = _817 + _823;
    float _833 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].z, _819);
    float _835 = _827 + _829;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _839 = _831 + _837;
    float _841 = _833 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _845 = _835 + _843;
    float _847 = _839 * _839;
    float _849 = fma(_845, _845, _847);
    float _851 = sqrt(_849);
    float _853 = _759 + _825;
    float _855 = _853 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _857 = _853 + _841;
    float _859 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[11].x, _855);
    bool _861 = _851 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _863 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[11].z, _859);
    float _865 = _855;
    float _867 = _825;
    float _869 = _831;
    float _871 = _857;
    if (!_861)
    {
        _865 = _835;
    }
    float _873 = _865;
    float _875 = _873;
    if (!_861)
    {
        _867 = _857;
    }
    float _877 = _867;
    bool _879 = !_861;
    float _881 = _877;
    if (!_879)
    {
        float _883 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _885 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _887 = _851 + _885;
        float _889 = rsqrt(_849);
        float _891 = _887 * _883;
        float _893 = _857 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _895 = _891 * 0.15915493667125701904296875;
        float _897 = _895 * 6.283185482025146484375;
        float _899 = cos(_897);
        float _901 = _895 * 6.283185482025146484375;
        float _903 = sin(_901);
        float _905 = _899 + (-1.0);
        float _907 = _905 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = fma(_903, _893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _911 = fma(_857, _899, _907);
        float _913 = _889 * _909;
        float _915 = fma(_845, _913, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _917 = fma(_839, _913, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _881 = _911;
        _875 = _915;
        _869 = _917;
    }
    float _919 = _881;
    float _921 = _875;
    float _923 = _869;
    float _925 = -_853;
    float _927 = _925 + _919;
    float _929 = _863 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _931 = -_827;
    float _933 = _931 + _921;
    float _935 = -_817;
    float _937 = _935 + _923;
    float _939 = _927 * _927;
    float _941 = _853 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _943 = 1.0 / _929;
    bool _945 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _947 = isnan(0.5);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _953 = _949 || _951;
    float _955 = fma(_933, _933, _939);
    float _957 = fma(_937, _937, _955);
    float _959 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[10].x, _941);
    float _961 = sqrt(_957);
    float _963 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[10].z, _959);
    float _965 = _963 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _967 = _965 + _929;
    float _969 = _967 * _943;
    float _971 = _969 * 0.5;
    bool _973 = _961 > 0.0;
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _977 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[30].w, _975);
    float _979 = _961;
    float _981 = _919;
    float _983 = _921;
    float _985 = _923;
    float _987 = _929;
    float _989 = _943;
    if (_953)
    {
        _979 = 1.0;
    }
    float _991 = _979;
    float _993 = 1.0 / _977;
    bool _995 = !_973;
    float _997 = _991;
    if (!_995)
    {
        float _999 = _217 * _217;
        float _1001 = rsqrt(_957);
        float _1003 = fma(_213, _213, _999);
        float _1005 = fma(_219, _219, _1003);
        float _1007 = sqrt(_1005);
        float _1009 = _933 * _1001;
        float _1011 = _927 * _1001;
        bool _1013 = _1007 > 0.0;
        float _1015 = _937 * _1001;
        bool _1017 = !_1013;
        _987 = _1015;
        _871 = _1009;
        if (!_1017)
        {
            float _1019 = rsqrt(_1005);
            float _1021 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1023 = _217 * _1019;
            float _1025 = _213 * _1019;
            float _1027 = _1011 * _1023;
            float _1029 = _219 * _1019;
            float _1031 = fma(_1009, _1025, _1027);
            float _1033 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1035 = fma(_1015, _1029, _1031);
            float _1037 = _1035 * _1033;
            float _1039 = fma(_213, _1037, _921);
            float _1041 = fma(_217, _1037, _919);
            float _1043 = fma(_219, _1037, _923);
            _981 = _1041;
            _983 = _1039;
            _985 = _1043;
        }
    }
    float _1045 = _981;
    float _1047 = _983;
    float _1049 = _985;
    float _1051 = _987;
    float _1053 = _871;
    float _1055 = _1053;
    if (_953)
    {
        _1055 = 1.0;
    }
    float _1057 = _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1061 = _993 * _1059;
    float _1063 = _1057;
    if (!_953)
    {
        float _1065 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = _1065 * 0.15915493667125701904296875;
        float _1069 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1073 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1071;
        float _1075 = _1067 * 6.283185482025146484375;
        float _1077 = cos(_1075);
        float _1079 = _1069 * 0.15915493667125701904296875;
        float _1081 = _1067 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = 1.0 / _1077;
        float _1087 = _1079 * 6.283185482025146484375;
        float _1089 = cos(_1087);
        float _1091 = _1083 * _1085;
        float _1093 = _1079 * 6.283185482025146484375;
        float _1095 = sin(_1093);
        float _1097 = _1089 * _1091;
        float _1099 = 1.0 / _1073;
        float _1101 = 1.0 / _1097;
        float _1103 = _1095 * _1101;
        float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1107 = fma(_1061, _1103, _1105);
        float _1109 = _1107 * _1099;
        float _1111 = precise::clamp(_1109, 0.0, 1.0);
        _997 = _1111;
    }
    float _1113 = _997;
    if (!_953)
    {
        float _1115 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1117 = _1115 * 0.15915493667125701904296875;
        float _1119 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1121 = _1117 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = _1119 * 0.15915493667125701904296875;
        float _1127 = _1117 * 6.283185482025146484375;
        float _1129 = sin(_1127);
        float _1131 = 1.0 / _1123;
        float _1133 = _1125 * 6.283185482025146484375;
        float _1135 = cos(_1133);
        float _1137 = _1129 * _1131;
        float _1139 = _1125 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1135 * _1137;
        float _1145 = 1.0 / _1143;
        float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1149 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1147;
        float _1151 = 1.0 / _1149;
        float _1153 = _1141 * _1145;
        float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1157 = fma(_1061, _1153, _1155);
        float _1159 = _1157 * _1151;
        float _1161 = precise::clamp(_1159, 0.0, 1.0);
        float _1163 = -_1161;
        float _1165 = _1163 + 1.0;
        _233 = _1153;
        _1063 = _1165;
    }
    float _1167 = _233;
    float _1169 = _1063;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1173 = _1045 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1177 = _1047 + _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1181 = _1049 + _1179;
    float _1183 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1185 = _1173 * _1173;
    float _1187 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1189 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1183);
    float _1191 = fma(_1177, _1177, _1185);
    float _1193 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1187);
    float _1195 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1189);
    float _1197 = fma(_1181, _1181, _1191);
    float _1199 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1193);
    float _1201 = rsqrt(_1197);
    float _1203 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1205 = sqrt(_1197);
    float _1207 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1209 = _1177 * _1207;
    float _1211 = _1181 * _1207;
    float _1213 = _1209 * _1209;
    float _1215 = _1211 * _1211;
    float _1217 = _1213 + _1215;
    float _1219 = sqrt(_1217);
    bool _1221 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1223 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1225 = _1219 + _1223;
    float _1227 = _1167;
    float _1229 = _1225;
    float _1231 = _1209;
    float _1233 = _1211;
    float _1235 = _1213;
    float _1237 = _1215;
    if (_1221)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1227 = _1239;
    }
    float _1241 = _1227;
    if (_1221)
    {
        float _1243 = _1225 * _1241;
        _1229 = _1243;
    }
    float _1245 = _1229;
    if (_1221)
    {
        float _1247 = _1245 * 0.15915493667125701904296875;
        _989 = _1247;
    }
    float _1249 = _989;
    float _1251 = _217;
    float _1253 = _1249;
    if (_1221)
    {
        float _1255 = _1249 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        _1251 = _1257;
    }
    float _1259 = _1251;
    float _1261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1263 = precise::max(0.0, _1261);
    float _1265 = _1051;
    float _1267 = _1263;
    if (_1221)
    {
        float _1269 = _1249 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        _1265 = _1271;
    }
    float _1273 = _1265;
    float _1275 = -_1207;
    float _1277 = -_1263;
    float _1279 = fma(_1173, _1275, _1277);
    float _1281 = _1261;
    if (_1221)
    {
        float _1283 = rsqrt(_1217);
        _1281 = _1283;
    }
    float _1285 = _1281;
    if (_1221)
    {
        float _1287 = _1279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1267 = _1287;
    }
    float _1289 = _1267;
    float _1291 = fma(_827, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1293 = _1289;
    float _1295 = _1259;
    if (_1221)
    {
        float _1297 = fma(_1259, _1289, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = _1299;
    if (_1221)
    {
        float _1303 = _1273 + (-1.0);
        _1295 = _1303;
    }
    float _1305 = _1295;
    float _1307 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1309 = floor(_1291);
    float _1311 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1307);
    float _1313 = _1285;
    if (_1221)
    {
        float _1315 = _1285 * _1299;
        _1253 = _1315;
    }
    float _1317 = _1253;
    if (_1221)
    {
        float _1319 = _1305 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1319;
    }
    float _1321 = _1301;
    if (!_1221)
    {
        _1313 = _1279;
    }
    float _1323 = _1313;
    float _1325 = _1323;
    if (_1221)
    {
        float _1327 = _1209 * _1317;
        _1231 = _1327;
    }
    float _1329 = _1231;
    if (_1221)
    {
        float _1331 = fma(_1279, _1273, _1321);
        _1325 = _1331;
    }
    float _1333 = _1325;
    if (_1221)
    {
        float _1335 = _1211 * _1317;
        _1233 = _1335;
    }
    float _1337 = _1233;
    if (_1221)
    {
        float _1339 = _1329 * _1329;
        _1235 = _1339;
    }
    float _1341 = _1235;
    float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1345 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1343);
    float _1347 = precise::clamp(_1345, 0.0, 1.0);
    if (_1221)
    {
        float _1349 = _1337 * _1337;
        _1237 = _1349;
    }
    float _1351 = _1237;
    float _1353 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1355 = fma(_1333, _1333, _1341);
    float _1357 = fma(_817, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1359 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1361 = -_1347;
    float _1363 = _1361 + 1.0;
    float _1365 = _1355 + _1351;
    float _1367 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1311);
    float _1369 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1359);
    float _1371 = floor(_1357);
    float _1373 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1375 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1369);
    float _1377 = -_1309;
    float _1379 = _1291 + _1377;
    float _1381 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1385 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1387 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1389 = rsqrt(_1365);
    float _1391 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1393 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1383);
    float _1395 = -_1387;
    float _1397 = fma(_1395, _1381, 1.0);
    float _1399 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1401 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1393);
    float _1403 = abs(_1363);
    float _1405 = log2(_1403);
    float _1407 = -_1371;
    float _1409 = _1357 + _1407;
    float _1411 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1413 = _1389 * _1329;
    float _1415 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1401);
    float _1417 = _1389 * _1333;
    float _1419 = _1389 * _1337;
    float _1421 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1423 = log2(_1397);
    float _1425 = _1417 + 1.0;
    float _1427 = -_1421;
    float _1429 = fma(_1417, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1427);
    float _1431 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1433 = -_1419;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1429);
    float _1437 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1439 = 1.0 / _1415;
    float _1441 = fma(_1435, -0.5, 0.5);
    float _1443 = fma(_1435, 0.5, 0.5);
    float _1445 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1437);
    float _1447 = fma(_1443, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1449 = exp2(_1431);
    float _1451 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1445);
    float _1453 = _1423 * 0.693147182464599609375;
    float _1455 = fma(_1443, _1447, -0.212114393711090087890625);
    float _1457 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1459 = fma(_1443, _1455, 1.570728778839111328125);
    float _1461 = sqrt(_1441);
    float _1463 = -_1417;
    float _1465 = fma(_1449, _1425, _1463);
    float _1467 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1451);
    float _1469 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1411);
    float _1471 = fma(_1465, 0.5, 0.5);
    float _1473 = _1467 * _1439;
    float _1475 = _1469 * _1439;
    float _1477 = _1461 * 0.636619746685028076171875;
    float _1479 = fma(_1473, 0.5, 0.5);
    float _1481 = fma(_1475, -0.5, 0.5);
    float _1483 = -_1459;
    float _1485 = fma(_1477, _1483, 1.0);
    float2 _4849 = float2(_1379, _1409);
    float _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4849, float2(0.0), isnan(_4849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4849, float2(0.0), isnan(_4849)), level(0.0)).x;
    float3 _4860 = float3(_1479, _1481, _1457);
    float _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4860, float3(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4860, float3(0.0), isnan(_4860)), level(0.0)).x;
    float3 _4871 = float3(_1479, _1481, _1457);
    float4 _1492 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4871, float3(0.0), isnan(_4871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4871, float3(0.0), isnan(_4871)), level(0.0)).xyzw;
    float _1494 = _1492.x;
    float _1496 = _1492.y;
    float _1498 = _1492.z;
    float _1500 = _1492.w;
    float2 _4887 = float2(_1485, _1471);
    float3 _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4887, float2(0.0), isnan(_4887)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4887, float2(0.0), isnan(_4887)), level(0.0)).xyz;
    float _1506 = _1504.x;
    float _1508 = _1504.y;
    float _1510 = _1504.z;
    float _1512 = float(uint(_471));
    float _1514 = trunc(_501);
    int _1516 = int(_1514);
    int _1518 = abs(_447);
    float _1520 = -_577;
    float _1522 = _1520 + 1.0;
    int _1524 = abs(_457);
    float _1526 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1528 = _351 > 0.5;
    bool _1530 = _349 > 0.5;
    float _1532 = 1.0 / _1512;
    float _1534 = float(uint(_1516));
    float _1536 = exp2(_1526);
    int _1538 = as_type<int>(_1532) + (-2);
    float _1540 = as_type<float>(_1538) * _1534;
    float _1542 = trunc(_1540);
    float _1544 = precise::max(_1542, 0.0);
    uint _1547 = uint(_1544);
    int _1549 = ~_471;
    int _1551 = _1549 + 1;
    float _1553 = -_1536;
    float _1555 = _1553 + 1.0;
    float _1557 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1559 = ~_471;
    int _1561 = _1559 + 1;
    int _1563 = _1551 * int(_1547);
    int _1565 = _1563 + _1516;
    float _1567 = float(uint(_1565));
    float _1569 = as_type<float>(_1538) * _1567;
    float _1571 = trunc(_1569);
    float _1573 = precise::max(_1571, 0.0);
    uint _1575 = uint(_1573);
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1579 = _1577 != 0;
    bool _1581 = !_1579;
    float _1583 = _1581 ? 7.345489978790283203125 : 1.0;
    float _1585 = _1583 * _349;
    int _1587 = int(_1547) + int(_1575);
    float _1589 = floor(_1585);
    float _1591 = float(_1516);
    int _1593 = _1561 * _1587;
    int _1595 = _1593 + _1516;
    bool _1597 = _1591 >= _557;
    bool _1599 = isnan(_1591);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan(_557);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    bool _1609 = uint(_1595) >= uint(_471);
    float _1611 = trunc(_1607);
    int _1613 = int(_1611);
    bool _1615 = !_1609;
    int _1617 = _1615 ? 0 : (-1);
    bool _1619 = _471 == 0;
    float _1621 = -_1589;
    float _1623 = _1585 + _1621;
    int _1625 = ~_1587;
    int _1627 = _1625 + _1617;
    int _1629 = _1627 + 1;
    float _1631 = _573 * _165;
    int _1633 = _471 + (-1);
    float _1635 = _1623 * _557;
    int _1637 = _471 * _1629;
    int _1639 = _1637 + _1516;
    float _1641 = trunc(_1631);
    int _1643 = int(_1641);
    int _1645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1647 = _1645 != 0;
    int _1649 = ~_1613;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    bool _1655 = !_1619;
    int _1657 = _1655 ? _1639 : (-1);
    bool _1659 = !_1647;
    int _1661 = _1659 ? 0 : 1;
    float _1663 = trunc(_1635);
    int _1665 = int(_1663);
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1669 = _1667 != 0;
    int _1671 = _1657 * _1653;
    int _1673 = abs(_1661);
    int _1675 = abs(_513);
    int _1677 = _1613 * _1633;
    int _1679 = _1677 + _1671;
    bool _1681 = !_1669;
    int _1683 = _1681 ? 0 : 1;
    int _1685 = _1679 * _1518;
    int _1687 = abs(_1683);
    int _1689 = _1665 * _1673;
    int _1691 = _1689 + _1516;
    int _1693 = _1643 * _1524;
    int _1695 = _1693 + _1685;
    int _1697 = _1691 * _1675;
    int _1699 = _1697 + _1695;
    int _1701 = ~_471;
    int _1703 = _1701 + 1;
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1711 = _1709 != 0;
    int _1713 = _1665 * _1687;
    int _1715 = _1713 + _1699;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1719 = _1717 != 0;
    float _1721 = 1.0 / _1707;
    int _1723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1725 = _1723 != 0;
    float _1727 = float(uint(_1715));
    bool _1729 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1731 = isnan(_347);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = float(uint(_1691));
    float _1743 = as_type<float>(_1538) * _1727;
    float _1745 = as_type<float>(_1538) * _1741;
    float _1747 = trunc(_1743);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1755 = _1753 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1757 = 1.0 / _1755;
    int _1759 = _1703 * int(_1751);
    int _1761 = _1759 + _1715;
    bool _1763 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1765 = isnan(_347);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = float(uint(_1761));
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1779 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1783 = _1781 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1785 = as_type<float>(_1538) * _1775;
    float _1787 = -_1773;
    float _1789 = _1787 + 1.0;
    float _1791 = _1779 * _1757;
    float _1793 = _1783 * _1721;
    bool _1795 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1797 = isnan(_347);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    float _1807 = _1739 * _1789;
    float _1809 = trunc(_1785);
    float _1811 = precise::max(_1809, 0.0);
    uint _1813 = uint(_1811);
    float _1815 = -_1739;
    float _1817 = _1815 + 1.0;
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1821 = _347 + _1819;
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1825 = _347 + _1823;
    float _1827 = -_227;
    int _1829 = _1528 ? as_type<int>(_1827) : as_type<int>(_227);
    float _1831 = _1805 * _1817;
    float _1833 = fma(_1791, _1821, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1835 = fma(_1793, _1825, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1837 = trunc(_1745);
    float _1839 = precise::max(_1837, 0.0);
    uint _1841 = uint(_1839);
    int _1843 = ~_471;
    int _1845 = _1843 + 1;
    float _1847 = _1833 * _1831;
    float _1849 = -_223;
    int _1851 = _1530 ? as_type<int>(_1849) : as_type<int>(_223);
    float _1853 = -_1805;
    float _1855 = _1853 + 1.0;
    bool _1857 = !_1719;
    float _1859 = _1857 ? _223 : as_type<float>(_1851);
    float _1861 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1847);
    int _1863 = int(_1751) + int(_1813);
    bool _1865 = !_1725;
    float _1867 = _1865 ? _227 : as_type<float>(_1829);
    float _1869 = _1859 + 0.5;
    int _1871 = ~_471;
    int _1873 = _1871 + 1;
    int _1875 = _1845 * _1863;
    int _1877 = _1875 + _1715;
    float _1879 = fma(_1835, _1807, _1861);
    float _1881 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[80].x, _397);
    float _1883 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1885 = _1873 * int(_1841);
    int _1887 = _1885 + _1691;
    bool _1889 = uint(_1877) >= uint(_471);
    float _1891 = _1867 + (-0.5);
    float _1893 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1879);
    float _1895 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1897 = !_1889;
    int _1899 = _1897 ? 0 : (-1);
    float _1901 = -_1891;
    float _1903 = -_415;
    float _1905 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1903);
    float _1907 = float(uint(_1887));
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1911 = ~_1863;
    int _1913 = _1911 + _1899;
    int _1915 = _1913 + 1;
    float _1917 = -_567;
    float _1919 = _1917 + 1.0;
    float _1921 = fma(_1867, _1522, _1905);
    float _1923 = as_type<float>(_1538) * _1907;
    int _1925 = _471 * _1915;
    int _1927 = _1925 + _1715;
    float _1929 = -_1919;
    float _1931 = fma(_1859, _1929, _1881);
    float _1933 = abs(_1061);
    float _1935 = log2(_1933);
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1939 = !_1619;
    int _1941 = _1939 ? _1927 : (-1);
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1947 = _1941 >> 31;
    float _1949 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1953 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1955 = _1947 & 3;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1963 = trunc(_1923);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    out.m_72.x = _1949;
    out.m_72.y = _1951;
    out.m_72.z = _1953;
    out.m_72.w = _1909;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1973 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1975 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1977 = ~_471;
    int _1979 = _1977 + 1;
    float _1981 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_74.x = _1931;
    out.m_74.y = _1921;
    int _1983 = _1941 & 3;
    bool _1985 = _1983 != 0;
    float _1987 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1883);
    out.m_76.x = _1969;
    out.m_76.y = _1971;
    out.m_76.z = _1973;
    out.m_76.w = _1975;
    float _1989 = exp2(_1981);
    bool _1991 = _1061 <= 8000.0;
    bool _1993 = isnan(_1061);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(8000.0);
    bool _1999 = _1995 || _1997;
    float _2001 = float(_1999);
    float _2003 = _761 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2005 = _1941 + _1955;
    int _2007 = int(_1841) + int(_1967);
    float _2009 = -_751;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2003);
    int _2013 = _2005 >> 2;
    float _2015 = _761 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2017 = _761 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2019 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2011);
    float _2021 = -_751;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2015);
    int _2025 = _2013 << 4;
    int _2027 = _2025 + 368;
    int _2029 = _1979 * _2007;
    int _2031 = _2029 + _1691;
    float _2033 = -_751;
    float _2035 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2017);
    float _2037 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _2039 = uint(int(uint(_2027) >> uint(2)));
    uint _2041 = uint(int(uint(int(_2039)) >> uint(2)));
    int _2043 = int(_2039) & 3;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[int(_2041)][_2043];
    int _2047 = int(_2039) + 1;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    int _2051 = _2047 & 3;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[int(_2049)][_2051];
    float _2055 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2023);
    float _2057 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2035);
    float _2059 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2037);
    int _2061 = _1941 & 3;
    bool _2063 = _2061 != 0;
    float _2065 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2067 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2069 = uint(_2031) >= uint(_471);
    int _2071 = _2027 + 8;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
    int _2077 = int(_2073) & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_2073) + 1;
    uint _2083 = uint(int(uint(_2081) >> uint(2)));
    int _2085 = _2081 & 3;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[int(_2083)][_2085];
    bool _2089 = uint(_2061) > 1u;
    float _2091 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2065);
    float _2093 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2067);
    float _2095 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2097 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2099 = fma(_1989, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _1895 * _2019;
    float _2105 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2095);
    float _2107 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2097);
    int _2109 = _1985 ? 0 : 1;
    float _2111 = _1895 * _2055;
    float _2113 = _1895 * _2057;
    float _2115 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2059);
    int _2117 = ~_2109;
    int _2119 = _2117 + 1;
    int _2121 = _2119 + 1;
    float _2123 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2091);
    int _2125 = _2121;
    if (!_2089)
    {
        int _2127 = ~_2109;
        int _2129 = _2127 + 1;
        _2125 = _2129;
    }
    int _2131 = _2125;
    float _2133 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2093);
    bool _2135 = _2061 != 3;
    float _2137 = fma(_2101, -2.0, 3.0);
    float _2139 = _2101 * _2101;
    bool _2141 = uint(_2061) >= 2u;
    float _2143 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2105);
    int _2145 = abs(_2131);
    float _2147 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2107);
    float _2149 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1987);
    float _2151 = _2139 * _2137;
    int _2153 = _2141 ? 0 : 1;
    float _2155 = -_1487;
    float _2157 = _2155 + 1.0;
    bool _2159 = !_2063;
    int _2161 = _2159 ? 0 : 1;
    float _2163 = _1557 * _1489;
    int _2165 = ~_2145;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    bool _2171 = _2061 != 3;
    int _2173 = ~_2153;
    int _2175 = _2173 + 1;
    int _2177 = _2175 + 1;
    int _2179 = abs(_2161);
    int _2181 = _2177;
    if (_2135)
    {
        int _2183 = ~_2153;
        int _2185 = _2183 + 1;
        _2181 = _2185;
    }
    int _2187 = _2181;
    int _2189 = _2169 * as_type<int>(_2053);
    bool _2191 = !_2171;
    int _2193 = _2191 ? 0 : (-1);
    bool _2195 = !_2069;
    int _2197 = _2195 ? 0 : (-1);
    bool _2199 = !_1711;
    int _2201 = _2199 ? 0 : 1;
    int _2203 = abs(_2193);
    int _2205 = abs(_2187);
    int _2207 = ~_2179;
    int _2209 = _2207 + 1;
    int _2211 = _2209 + 1;
    float _2213 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2215 = ~_2007;
    int _2217 = _2215 + _2197;
    int _2219 = _2217 + 1;
    int _2221 = abs(_2201);
    int _2223 = _2211 * as_type<int>(_2045);
    int _2225 = _2223 + _2189;
    float _2227 = fma(_2213, _2115, _2103);
    int _2229 = ~_2205;
    int _2231 = _2229 + 1;
    int _2233 = _2231 + 1;
    int _2235 = _471 * _2219;
    int _2237 = _2235 + _1691;
    int _2239 = ~_2203;
    int _2241 = _2239 + 1;
    int _2243 = _2241 + 1;
    float _2245 = fma(_2213, _2133, _2113);
    int _2247 = _2233 * as_type<int>(_2079);
    int _2249 = _2247 + _2225;
    float _2251 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2253 = !_1619;
    int _2255 = _2253 ? _2237 : (-1);
    float _2257 = _1510 * _2163;
    int _2259 = _2243 * as_type<int>(_2087);
    int _2261 = _2259 + _2249;
    float _2263 = -_2151;
    float _2265 = _2263 + 1.0;
    float _2267 = in.m_78.x;
    int _2269 = ~_2221;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    float _2275 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2251);
    float _2277 = fma(_2265, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2151);
    float _2279 = _2143 + _2227;
    int _2281 = _2261 * _2273;
    float _2283 = _2001 * _2277;
    float _2285 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2275);
    float _2287 = fma(_2213, _2123, _2111);
    int _2289 = _2255 * _2221;
    int _2291 = _2289 + _2281;
    float _2293 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2295 = _1415 * 0.5;
    float _2297 = _2147 + _2287;
    float _2299 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2285);
    float _2301 = _2157 * _2293;
    float _2303 = precise::clamp(_2301, 0.0, 1.0);
    float _2305 = float(_2291);
    float _2307 = fma(_1469, -0.5, _2295);
    float _2309 = -_1557;
    float _2311 = _2309 + 1.0;
    float _2313 = -_2303;
    float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2317 = _2149 + _2245;
    out.m_80.x = _2305;
    float _2319 = _1500 * _2311;
    float _2321 = fma(_1500, _2257, _1498);
    float _2323 = _2315 * _2267;
    out.gl_Position.x = _1467;
    out.gl_Position.y = _1469;
    out.gl_Position.z = _2299;
    out.gl_Position.w = _1415;
    bool _2325 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2327 = isnan(_1205);
    bool _2329 = _2325 || _2327;
    bool _2331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2333 = _2329 || _2331;
    float _2335 = _2299 + _1415;
    float _2337 = _2323 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2339 = _1500 * _2163;
    out.m_82.x = _2279;
    out.m_82.y = _2297;
    out.m_82.z = _2317;
    float _2341 = _1467 + _1415;
    float _2343 = fma(_1506, _2339, _1494);
    float _2345 = fma(_1508, _2339, _1496);
    out.m_84.x = _2337;
    float _2347 = _2335 * 0.5;
    float _2349 = _2341 * 0.5;
    float _2351 = _1113 * _1169;
    out.m_86.x = _2343;
    out.m_86.y = _2345;
    out.m_86.z = _2321;
    out.m_86.w = _2319;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2355 = _2311;
    float _2357 = _2351;
    float _2359 = _2347;
    float _2361 = _2307;
    float _2363 = _2349;
    if (!_2333)
    {
        _2353 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2365 = _2353;
    float _2367 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_88.x = _2349;
    out.m_88.y = _2307;
    out.m_88.z = _2347;
    out.m_88.w = _1415;
    float _2369 = _2365;
    float _2371 = _2365;
    if (!_2333)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2373 = _2355;
    float _2375 = _2373;
    float _2377 = _2373;
    if (!_2333)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2379 = _2357;
    float _2381 = _2379;
    float _2383 = _2379;
    if (!_2333)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2385 = _2359;
    float _2387 = _2385;
    float _2389 = _2385;
    if (!_2333)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2391 = _2361;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2333)
    {
        _2363 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2397 = _2363;
    bool _2399 = !_2333;
    float _2401 = _2397;
    float _2403 = _2397;
    if (!_2399)
    {
        bool _2405 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2407 = isnan(_1205);
        bool _2409 = _2405 || _2407;
        bool _2411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2413 = _2409 || _2411;
        if (!_2413)
        {
            float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2417 = _1205 + _2415;
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2421 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2419;
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2427 = 1.0 / _2421;
            float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2445 = _2417 * _2427;
            float _2447 = precise::clamp(_2445, 0.0, 1.0);
            float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2453 = fma(_2447, _2425, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2455 = fma(_2447, _2451, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2457 = fma(_2447, _2431, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2459 = fma(_2447, _2435, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2461 = fma(_2447, _2439, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2463 = fma(_2447, _2443, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2395 = _2457;
            _2377 = _2461;
            _2389 = _2453;
            _2371 = _2459;
            _2403 = _2455;
            _2383 = _2463;
            _2465 = true;
        }
        else
        {
            bool _2467 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2469 = isnan(_1205);
            bool _2471 = _2467 || _2469;
            bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2475 = _2471 || _2473;
            if (!_2475)
            {
                _2387 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2477 = _2387;
            _2389 = _2477;
            if (!_2475)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2479 = _2393;
            _2395 = _2479;
            if (!_2475)
            {
                _2401 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2481 = _2401;
            _2403 = _2481;
            if (!_2475)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2483 = _2369;
            _2371 = _2483;
            if (!_2475)
            {
                _2375 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2485 = _2375;
            _2377 = _2485;
            if (!_2475)
            {
                _2381 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2487 = _2381;
            bool _2489 = !_2475;
            _2383 = _2487;
            if (!_2489)
            {
                bool _2491 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2493 = isnan(_1205);
                bool _2495 = _2491 || _2493;
                bool _2497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2499 = _2495 || _2497;
                if (!_2499)
                {
                    float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2503 = _1205 + _2501;
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2507 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2505;
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2513 = 1.0 / _2507;
                    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2531 = _2503 * _2513;
                    float _2533 = precise::clamp(_2531, 0.0, 1.0);
                    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2539 = fma(_2533, _2511, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2541 = fma(_2533, _2537, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2543 = fma(_2533, _2517, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2545 = fma(_2533, _2521, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2547 = fma(_2533, _2525, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2549 = fma(_2533, _2529, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2395 = _2543;
                    _2377 = _2547;
                    _2389 = _2539;
                    _2371 = _2545;
                    _2403 = _2541;
                    _2383 = _2549;
                    _2465 = true;
                }
                else
                {
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2377 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2389 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2403 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2383 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2465 = false;
    float _2551 = _2395;
    float _2553 = _2377;
    float _2555 = _2389;
    float _2557 = _2371;
    float _2559 = _2403;
    float _2561 = _2383;
    float _2563 = _2367 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2565 = fma(_2297, -0.5, 0.5);
    float _2567 = precise::clamp(_2565, 0.0, 1.0);
    float _2569 = -_2551;
    float _2571 = _2569 + _2553;
    float _2573 = -_2555;
    float _2575 = _2573 + _2557;
    out.m_53.x = _2563;
    float _2577 = -_2559;
    float _2579 = _2577 + _2561;
    float _2581 = fma(_2567, _2571, _2551);
    float _2583 = fma(_2567, _2575, _2555);
    bool _2585 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2587 = _2581 * 0.586610972881317138671875;
    float _2589 = fma(_2567, _2579, _2559);
    out.m_90.x = 0.0;
    bool _2591 = _1113 > 0.0;
    bool _2593 = isnan(_1113);
    bool _2595 = _2591 || _2593;
    bool _2597 = isnan(0.0);
    bool _2599 = _2595 || _2597;
    float _2601 = fma(_2583, 0.298911988735198974609375, _2587);
    bool _2603 = _1169 <= 0.0;
    bool _2605 = !_2599;
    bool _2607 = _2603 || _2605;
    float _2609 = fma(_2589, 0.114477999508380889892578125, _2601);
    float _2611 = -_2609;
    float _2613 = _2583 + _2611;
    float _2615 = -_2609;
    float _2617 = _2581 + _2615;
    float _2619 = -_2609;
    float _2621 = _2589 + _2619;
    float _2623 = fma(_2613, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2609);
    float _2625 = fma(_2617, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2609);
    float _2627 = fma(_2621, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2609);
    bool _2629 = !_2585;
    if (!_2629)
    {
        float _2631 = -_1045;
        float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2635 = -_1047;
        float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2639 = -_1049;
        float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2643 = _2633 * _2633;
        float _2645 = fma(_2637, _2637, _2643);
        float _2647 = fma(_2641, _2641, _2645);
        float _2649 = sqrt(_2647);
        float _2651 = rsqrt(_2647);
        float _2653 = -_2649;
        float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2657 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2659 = precise::clamp(_2657, 0.0, 1.0);
        float _2661 = _2637 * _2651;
        float _2663 = _2633 * _2651;
        float _2665 = abs(_2659);
        float _2667 = log2(_2665);
        float _2669 = _2641 * _2651;
        float _2671 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2673 = _2297 * _2663;
        float _2675 = -_2663;
        float _2677 = -_2671;
        float _2679 = fma(_2675, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2677);
        float _2681 = fma(_2279, _2661, _2673);
        float _2683 = -_2669;
        float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2679);
        float _2687 = fma(_2317, _2669, _2681);
        float _2689 = precise::clamp(_2687, 0.0, 1.0);
        float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2693 = _2685 + _2691;
        float _2695 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2697 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2699 = precise::clamp(_2697, 0.0, 1.0);
        float _2701 = exp2(_2695);
        float _2703 = _2701 * _2699;
        float _2705 = _2689 * _2703;
        float _2707 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2709 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2711 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2707;
        out.m_90.y = _2709;
        out.m_90.z = _2711;
    }
    out.m_92.x = _2623;
    out.m_92.y = _2625;
    out.m_92.z = _2627;
    if (!_2607)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2713 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2713;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2465 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = in.m_48.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_53.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_135);
        out.gl_Position.z = _2781;
    }
    if (!_121)
    {
        return out;
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_113);
    bool _149 = _117 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _125;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    int _157 = 0;
    if (_153)
    {
        float _159 = _155 * 5.0;
        _157 = as_type<int>(_159);
    }
    int _161 = _157;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2836 = as_type<float>(_161);
        out.gl_Position.z = _2836;
    }
    if (_153)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = 1.0 / _147;
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = _117 * _165;
    int _193 = as_type<int>(_163) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_163) & 2;
    bool _199 = _197 != 0;
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _203 = _169 * _175;
    float _205 = _169 * _181;
    float _207 = fma(_167, _173, _203);
    float _209 = _169 * _187;
    float _211 = fma(_167, _179, _205);
    float _213 = fma(_171, _177, _207);
    float _215 = fma(_167, _185, _209);
    float _217 = fma(_171, _183, _211);
    float _219 = fma(_171, _189, _215);
    bool _221 = !_195;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_199;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_201;
    float _231 = _191;
    float _233 = _219;
    float _251;
    if (!_229)
    {
        float _235 = in.m_66.x;
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _191;
    }
    _253 = false;
    float _255 = _251;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    bool _261 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _263 = isnan(_255);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -_271;
    float _279 = _277 + 1.0;
    bool _281 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _283 = isnan(_255);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _293;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _275;
    float _301 = _291 * _279;
    float _303 = -_291;
    float _305 = _303 + 1.0;
    float _307 = _259 * _299;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = fma(_295, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _315 = fma(_311, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = _313 * _301;
    float _319 = _315 * _301;
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _323 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _325 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _327 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    bool _329 = !_297;
    if (!_329)
    {
        float _331 = in.m_66.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _339 = _337 * _333;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _231 = _345;
    }
    float _347 = _231;
    float _349 = in.m_66.x;
    float _351 = in.m_66.y;
    float _353 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _355 = log2(_353);
    float _357 = in.m_66.z;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _363 = int(_361);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _367 = _355 * _117;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _371 = exp2(_367);
    float _373 = _349 * 2.0;
    float _375 = _351 + _349;
    float _377 = _351 * 2.0;
    float _379 = _349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _381 = _357 * 2.0;
    float _383 = _375 + (-1.0);
    float _385 = float(_363);
    float _387 = floor(_373);
    float _389 = -_365;
    float _391 = fma(_379, 2.0, _389);
    float _393 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _369);
    float _395 = -_117;
    float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[76].x, _391);
    float _399 = floor(_381);
    float _401 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _403 = -_371;
    float _405 = _403 + 1.0;
    float _407 = fma(_401, -2.0, _359);
    float _409 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _411 = floor(_377);
    float _413 = _351 + _357;
    float _415 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _407);
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _419 = _417 != 0;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _427 = _425 != 0;
    float _429 = _413 + (-1.0);
    bool _431 = _387 > 0.0;
    bool _433 = _399 >= 0.0;
    bool _435 = isnan(_399);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _445 = !_423;
    int _447 = _445 ? 0 : 1;
    float _449 = 1.0 / _385;
    bool _451 = _399 > 0.0;
    int _453 = _441 ? 0 : 1;
    bool _455 = !_419;
    int _457 = _455 ? 0 : 1;
    bool _459 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _467 = _463 || _465;
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _471 = int(_469);
    bool _473 = _387 >= 0.0;
    bool _475 = isnan(_387);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    bool _483 = _411 > 0.0;
    bool _485 = _411 >= 0.0;
    bool _487 = isnan(_411);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    int _495 = ~_453;
    int _497 = _495 + 1;
    int _499 = _497 + 1;
    float _501 = _449 * _117;
    int _503 = _499;
    if (!_451)
    {
        int _505 = ~_453;
        int _507 = _505 + 1;
        _503 = _507;
    }
    int _509 = _503;
    bool _511 = !_427;
    int _513 = _511 ? 0 : 1;
    float _515 = _467 ? _405 : 0.0;
    int _517 = _481 ? 0 : 1;
    float _519 = in.m_68.x;
    float _521 = in.m_68.y;
    float _523 = in.m_68.z;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _531 = _529 != 0;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _535 = _533 != 0;
    bool _537 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _539 = isnan(1.0);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _545 = _541 || _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _549 = 1.0 + _547;
    bool _551 = !_527;
    int _553 = _551 ? 0 : 1;
    float _555 = 1.0 / _549;
    float _557 = float(_471);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _561 = abs(_553);
    float _563 = float(_509);
    float _565 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _559);
    float _567 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _393);
    bool _569 = !_531;
    int _571 = _569 ? 0 : 1;
    float _573 = _557 * _117;
    float _575 = float(_561);
    float _577 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _565);
    int _579 = ~_517;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    int _585 = _583;
    if (!_431)
    {
        int _587 = ~_517;
        int _589 = _587 + 1;
        _585 = _589;
    }
    int _591 = _585;
    if (_545)
    {
        float _593 = _515 * _555;
        _127 = _593;
    }
    float _595 = _127;
    float _597 = _575 * _563;
    int _599 = abs(_571);
    float _601 = _349 + (-0.5);
    int _603 = _493 ? 0 : 1;
    float _605 = _597 * (-2.0);
    float _607 = float(_591);
    float _609 = float(_599);
    float _611 = fma(_605, _519, _519);
    float _613 = fma(_409, _605, _409);
    bool _615 = !_535;
    int _617 = _615 ? 0 : 1;
    float _619 = _609 * _607;
    int _621 = ~_603;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    float _627 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].x, _611);
    int _629 = _625;
    if (!_483)
    {
        int _631 = ~_603;
        int _633 = _631 + 1;
        _629 = _633;
    }
    int _635 = _629;
    float _637 = _619 * (-2.0);
    int _639 = abs(_617);
    float _641 = _351 + (-0.5);
    float _643 = float(_635);
    float _645 = fma(_637, _521, _521);
    float _647 = float(_639);
    float _649 = fma(_613, _595, _627);
    float _651 = fma(_443, _637, _443);
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[196].y, _645);
    float _655 = _357 + _349;
    float _657 = _647 * _643;
    float _659 = _649 * 0.15915493667125701904296875;
    float _661 = fma(_651, _595, _653);
    float _663 = _655 + (-1.0);
    float _665 = _657 * (-2.0);
    float _667 = in.m_70.x;
    float _669 = in.m_70.y;
    float _671 = _357 + (-0.5);
    float _673 = fma(_665, _523, _523);
    float _675 = _661 * 0.15915493667125701904296875;
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _679 = _659 * 6.283185482025146484375;
    float _681 = sin(_679);
    float _683 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[196].z, _673);
    float _685 = in.m_46.x;
    float _687 = in.m_46.y;
    float _689 = in.m_46.z;
    float _691 = fma(_677, _665, _677);
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _695 = fma(_691, _595, _683);
    float _697 = _659 * 6.283185482025146484375;
    float _699 = cos(_697);
    float _701 = _695 * 0.15915493667125701904296875;
    float _703 = _675 * 6.283185482025146484375;
    float _705 = sin(_703);
    float _707 = _325 * _667;
    float _709 = _327 * _669;
    float _711 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _713 = _707 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _715 = _675 * 6.283185482025146484375;
    float _717 = cos(_715);
    float _719 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _721 = _187 * _687;
    float _723 = _713 * _711;
    float _725 = _175 * _687;
    float _727 = _719 * _693;
    float _729 = fma(_185, _685, _721);
    float _731 = _181 * _687;
    float _733 = _701 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = _681 * _705;
    float _739 = _699 * _705;
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = fma(_173, _685, _725);
    float _745 = fma(_189, _689, _729);
    float _747 = fma(_179, _685, _731);
    float _749 = _701 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = _699 * _717;
    float _755 = _681 * _717;
    float _757 = fma(_177, _689, _743);
    float _759 = fma(_183, _689, _747);
    float _761 = _699 * _735;
    float _763 = _681 * _735;
    float _765 = _717 * _735;
    float _767 = _705 * _735;
    float _769 = _761 * _727;
    float _771 = in.m_64.w;
    float _773 = fma(_751, _753, _737);
    float _775 = -_727;
    float _777 = _751 * _775;
    float _779 = in.m_60.w;
    float _781 = -_755;
    float _783 = fma(_751, _739, _781);
    float _785 = fma(_773, _723, _769);
    float _787 = -_739;
    float _789 = fma(_751, _755, _787);
    float _791 = _763 * _727;
    float _793 = fma(_765, _723, _777);
    float _795 = fma(_783, _741, _785);
    float _797 = fma(_751, _737, _753);
    float _799 = fma(_789, _723, _791);
    float _801 = fma(_767, _741, _793);
    float _803 = _795 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _805 = fma(_797, _741, _799);
    float _807 = _795 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].x, _803);
    float _811 = _795 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].x, _807);
    float _815 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].z, _809);
    float _817 = _745 + _771;
    float _819 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _811);
    float _821 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = in.m_62.w;
    float _827 = _757 + _779;
    float _829 = _821 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _831 = _817 + _823;
    float _833 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].z, _819);
    float _835 = _827 + _829;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _839 = _831 + _837;
    float _841 = _833 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _845 = _835 + _843;
    float _847 = _839 * _839;
    float _849 = fma(_845, _845, _847);
    float _851 = sqrt(_849);
    float _853 = _759 + _825;
    float _855 = _853 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _857 = _853 + _841;
    float _859 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[11].x, _855);
    bool _861 = _851 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _863 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[11].z, _859);
    float _865 = _855;
    float _867 = _825;
    float _869 = _831;
    float _871 = _857;
    if (!_861)
    {
        _865 = _835;
    }
    float _873 = _865;
    float _875 = _873;
    if (!_861)
    {
        _867 = _857;
    }
    float _877 = _867;
    bool _879 = !_861;
    float _881 = _877;
    if (!_879)
    {
        float _883 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _885 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _887 = _851 + _885;
        float _889 = rsqrt(_849);
        float _891 = _887 * _883;
        float _893 = _857 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _895 = _891 * 0.15915493667125701904296875;
        float _897 = _895 * 6.283185482025146484375;
        float _899 = cos(_897);
        float _901 = _895 * 6.283185482025146484375;
        float _903 = sin(_901);
        float _905 = _899 + (-1.0);
        float _907 = _905 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = fma(_903, _893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _911 = fma(_857, _899, _907);
        float _913 = _889 * _909;
        float _915 = fma(_845, _913, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _917 = fma(_839, _913, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _881 = _911;
        _875 = _915;
        _869 = _917;
    }
    float _919 = _881;
    float _921 = _875;
    float _923 = _869;
    float _925 = -_853;
    float _927 = _925 + _919;
    float _929 = _863 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _931 = -_827;
    float _933 = _931 + _921;
    float _935 = -_817;
    float _937 = _935 + _923;
    float _939 = _927 * _927;
    float _941 = _853 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _943 = 1.0 / _929;
    bool _945 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _947 = isnan(0.5);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _953 = _949 || _951;
    float _955 = fma(_933, _933, _939);
    float _957 = fma(_937, _937, _955);
    float _959 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[10].x, _941);
    float _961 = sqrt(_957);
    float _963 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[10].z, _959);
    float _965 = _963 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _967 = _965 + _929;
    float _969 = _967 * _943;
    float _971 = _969 * 0.5;
    bool _973 = _961 > 0.0;
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _977 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[30].w, _975);
    float _979 = _961;
    float _981 = _919;
    float _983 = _921;
    float _985 = _923;
    float _987 = _929;
    float _989 = _943;
    if (_953)
    {
        _979 = 1.0;
    }
    float _991 = _979;
    float _993 = 1.0 / _977;
    bool _995 = !_973;
    float _997 = _991;
    if (!_995)
    {
        float _999 = _217 * _217;
        float _1001 = rsqrt(_957);
        float _1003 = fma(_213, _213, _999);
        float _1005 = fma(_219, _219, _1003);
        float _1007 = sqrt(_1005);
        float _1009 = _933 * _1001;
        float _1011 = _927 * _1001;
        bool _1013 = _1007 > 0.0;
        float _1015 = _937 * _1001;
        bool _1017 = !_1013;
        _987 = _1015;
        _871 = _1009;
        if (!_1017)
        {
            float _1019 = rsqrt(_1005);
            float _1021 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1023 = _217 * _1019;
            float _1025 = _213 * _1019;
            float _1027 = _1011 * _1023;
            float _1029 = _219 * _1019;
            float _1031 = fma(_1009, _1025, _1027);
            float _1033 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1035 = fma(_1015, _1029, _1031);
            float _1037 = _1035 * _1033;
            float _1039 = fma(_213, _1037, _921);
            float _1041 = fma(_217, _1037, _919);
            float _1043 = fma(_219, _1037, _923);
            _981 = _1041;
            _983 = _1039;
            _985 = _1043;
        }
    }
    float _1045 = _981;
    float _1047 = _983;
    float _1049 = _985;
    float _1051 = _987;
    float _1053 = _871;
    float _1055 = _1053;
    if (_953)
    {
        _1055 = 1.0;
    }
    float _1057 = _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1061 = _993 * _1059;
    float _1063 = _1057;
    if (!_953)
    {
        float _1065 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = _1065 * 0.15915493667125701904296875;
        float _1069 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1073 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1071;
        float _1075 = _1067 * 6.283185482025146484375;
        float _1077 = cos(_1075);
        float _1079 = _1069 * 0.15915493667125701904296875;
        float _1081 = _1067 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = 1.0 / _1077;
        float _1087 = _1079 * 6.283185482025146484375;
        float _1089 = cos(_1087);
        float _1091 = _1083 * _1085;
        float _1093 = _1079 * 6.283185482025146484375;
        float _1095 = sin(_1093);
        float _1097 = _1089 * _1091;
        float _1099 = 1.0 / _1073;
        float _1101 = 1.0 / _1097;
        float _1103 = _1095 * _1101;
        float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1107 = fma(_1061, _1103, _1105);
        float _1109 = _1107 * _1099;
        float _1111 = precise::clamp(_1109, 0.0, 1.0);
        _997 = _1111;
    }
    float _1113 = _997;
    if (!_953)
    {
        float _1115 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1117 = _1115 * 0.15915493667125701904296875;
        float _1119 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1121 = _1117 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = _1119 * 0.15915493667125701904296875;
        float _1127 = _1117 * 6.283185482025146484375;
        float _1129 = sin(_1127);
        float _1131 = 1.0 / _1123;
        float _1133 = _1125 * 6.283185482025146484375;
        float _1135 = cos(_1133);
        float _1137 = _1129 * _1131;
        float _1139 = _1125 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1135 * _1137;
        float _1145 = 1.0 / _1143;
        float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1149 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1147;
        float _1151 = 1.0 / _1149;
        float _1153 = _1141 * _1145;
        float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1157 = fma(_1061, _1153, _1155);
        float _1159 = _1157 * _1151;
        float _1161 = precise::clamp(_1159, 0.0, 1.0);
        float _1163 = -_1161;
        float _1165 = _1163 + 1.0;
        _233 = _1153;
        _1063 = _1165;
    }
    float _1167 = _233;
    float _1169 = _1063;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1173 = _1045 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1177 = _1047 + _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1181 = _1049 + _1179;
    float _1183 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1185 = _1173 * _1173;
    float _1187 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1189 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1183);
    float _1191 = fma(_1177, _1177, _1185);
    float _1193 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1187);
    float _1195 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1189);
    float _1197 = fma(_1181, _1181, _1191);
    float _1199 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1193);
    float _1201 = rsqrt(_1197);
    float _1203 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1205 = sqrt(_1197);
    float _1207 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1209 = _1177 * _1207;
    float _1211 = _1181 * _1207;
    float _1213 = _1209 * _1209;
    float _1215 = _1211 * _1211;
    float _1217 = _1213 + _1215;
    float _1219 = sqrt(_1217);
    bool _1221 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1223 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1225 = _1219 + _1223;
    float _1227 = _1167;
    float _1229 = _1225;
    float _1231 = _1209;
    float _1233 = _1211;
    float _1235 = _1213;
    float _1237 = _1215;
    if (_1221)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1227 = _1239;
    }
    float _1241 = _1227;
    if (_1221)
    {
        float _1243 = _1225 * _1241;
        _1229 = _1243;
    }
    float _1245 = _1229;
    if (_1221)
    {
        float _1247 = _1245 * 0.15915493667125701904296875;
        _989 = _1247;
    }
    float _1249 = _989;
    float _1251 = _217;
    float _1253 = _1249;
    if (_1221)
    {
        float _1255 = _1249 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        _1251 = _1257;
    }
    float _1259 = _1251;
    float _1261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1263 = precise::max(0.0, _1261);
    float _1265 = _1051;
    float _1267 = _1263;
    if (_1221)
    {
        float _1269 = _1249 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        _1265 = _1271;
    }
    float _1273 = _1265;
    float _1275 = -_1207;
    float _1277 = -_1263;
    float _1279 = fma(_1173, _1275, _1277);
    float _1281 = _1261;
    if (_1221)
    {
        float _1283 = rsqrt(_1217);
        _1281 = _1283;
    }
    float _1285 = _1281;
    if (_1221)
    {
        float _1287 = _1279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1267 = _1287;
    }
    float _1289 = _1267;
    float _1291 = fma(_827, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1293 = _1289;
    float _1295 = _1259;
    if (_1221)
    {
        float _1297 = fma(_1259, _1289, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = _1299;
    if (_1221)
    {
        float _1303 = _1273 + (-1.0);
        _1295 = _1303;
    }
    float _1305 = _1295;
    float _1307 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1309 = floor(_1291);
    float _1311 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1307);
    float _1313 = _1285;
    if (_1221)
    {
        float _1315 = _1285 * _1299;
        _1253 = _1315;
    }
    float _1317 = _1253;
    if (_1221)
    {
        float _1319 = _1305 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1319;
    }
    float _1321 = _1301;
    if (!_1221)
    {
        _1313 = _1279;
    }
    float _1323 = _1313;
    float _1325 = _1323;
    if (_1221)
    {
        float _1327 = _1209 * _1317;
        _1231 = _1327;
    }
    float _1329 = _1231;
    if (_1221)
    {
        float _1331 = fma(_1279, _1273, _1321);
        _1325 = _1331;
    }
    float _1333 = _1325;
    if (_1221)
    {
        float _1335 = _1211 * _1317;
        _1233 = _1335;
    }
    float _1337 = _1233;
    if (_1221)
    {
        float _1339 = _1329 * _1329;
        _1235 = _1339;
    }
    float _1341 = _1235;
    float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1345 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1343);
    float _1347 = precise::clamp(_1345, 0.0, 1.0);
    if (_1221)
    {
        float _1349 = _1337 * _1337;
        _1237 = _1349;
    }
    float _1351 = _1237;
    float _1353 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1355 = fma(_1333, _1333, _1341);
    float _1357 = fma(_817, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1359 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1361 = -_1347;
    float _1363 = _1361 + 1.0;
    float _1365 = _1355 + _1351;
    float _1367 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1311);
    float _1369 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1359);
    float _1371 = floor(_1357);
    float _1373 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1375 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1369);
    float _1377 = -_1309;
    float _1379 = _1291 + _1377;
    float _1381 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1385 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1387 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1389 = rsqrt(_1365);
    float _1391 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1393 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1383);
    float _1395 = -_1387;
    float _1397 = fma(_1395, _1381, 1.0);
    float _1399 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1401 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1393);
    float _1403 = abs(_1363);
    float _1405 = log2(_1403);
    float _1407 = -_1371;
    float _1409 = _1357 + _1407;
    float _1411 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1413 = _1389 * _1329;
    float _1415 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1401);
    float _1417 = _1389 * _1333;
    float _1419 = _1389 * _1337;
    float _1421 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1423 = log2(_1397);
    float _1425 = _1417 + 1.0;
    float _1427 = -_1421;
    float _1429 = fma(_1417, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1427);
    float _1431 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1433 = -_1419;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1429);
    float _1437 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1439 = 1.0 / _1415;
    float _1441 = fma(_1435, -0.5, 0.5);
    float _1443 = fma(_1435, 0.5, 0.5);
    float _1445 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1437);
    float _1447 = fma(_1443, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1449 = exp2(_1431);
    float _1451 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1445);
    float _1453 = _1423 * 0.693147182464599609375;
    float _1455 = fma(_1443, _1447, -0.212114393711090087890625);
    float _1457 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1459 = fma(_1443, _1455, 1.570728778839111328125);
    float _1461 = sqrt(_1441);
    float _1463 = -_1417;
    float _1465 = fma(_1449, _1425, _1463);
    float _1467 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1451);
    float _1469 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1411);
    float _1471 = fma(_1465, 0.5, 0.5);
    float _1473 = _1467 * _1439;
    float _1475 = _1469 * _1439;
    float _1477 = _1461 * 0.636619746685028076171875;
    float _1479 = fma(_1473, 0.5, 0.5);
    float _1481 = fma(_1475, -0.5, 0.5);
    float _1483 = -_1459;
    float _1485 = fma(_1477, _1483, 1.0);
    float2 _4849 = float2(_1379, _1409);
    float _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4849, float2(0.0), isnan(_4849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4849, float2(0.0), isnan(_4849)), level(0.0)).x;
    float3 _4860 = float3(_1479, _1481, _1457);
    float _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4860, float3(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4860, float3(0.0), isnan(_4860)), level(0.0)).x;
    float3 _4871 = float3(_1479, _1481, _1457);
    float4 _1492 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4871, float3(0.0), isnan(_4871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4871, float3(0.0), isnan(_4871)), level(0.0)).xyzw;
    float _1494 = _1492.x;
    float _1496 = _1492.y;
    float _1498 = _1492.z;
    float _1500 = _1492.w;
    float2 _4887 = float2(_1485, _1471);
    float3 _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4887, float2(0.0), isnan(_4887)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4887, float2(0.0), isnan(_4887)), level(0.0)).xyz;
    float _1506 = _1504.x;
    float _1508 = _1504.y;
    float _1510 = _1504.z;
    float _1512 = float(uint(_471));
    float _1514 = trunc(_501);
    int _1516 = int(_1514);
    int _1518 = abs(_447);
    float _1520 = -_577;
    float _1522 = _1520 + 1.0;
    int _1524 = abs(_457);
    float _1526 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1528 = _351 > 0.5;
    bool _1530 = _349 > 0.5;
    float _1532 = 1.0 / _1512;
    float _1534 = float(uint(_1516));
    float _1536 = exp2(_1526);
    int _1538 = as_type<int>(_1532) + (-2);
    float _1540 = as_type<float>(_1538) * _1534;
    float _1542 = trunc(_1540);
    float _1544 = precise::max(_1542, 0.0);
    uint _1547 = uint(_1544);
    int _1549 = ~_471;
    int _1551 = _1549 + 1;
    float _1553 = -_1536;
    float _1555 = _1553 + 1.0;
    float _1557 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1559 = ~_471;
    int _1561 = _1559 + 1;
    int _1563 = _1551 * int(_1547);
    int _1565 = _1563 + _1516;
    float _1567 = float(uint(_1565));
    float _1569 = as_type<float>(_1538) * _1567;
    float _1571 = trunc(_1569);
    float _1573 = precise::max(_1571, 0.0);
    uint _1575 = uint(_1573);
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1579 = _1577 != 0;
    bool _1581 = !_1579;
    float _1583 = _1581 ? 7.345489978790283203125 : 1.0;
    float _1585 = _1583 * _349;
    int _1587 = int(_1547) + int(_1575);
    float _1589 = floor(_1585);
    float _1591 = float(_1516);
    int _1593 = _1561 * _1587;
    int _1595 = _1593 + _1516;
    bool _1597 = _1591 >= _557;
    bool _1599 = isnan(_1591);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan(_557);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    bool _1609 = uint(_1595) >= uint(_471);
    float _1611 = trunc(_1607);
    int _1613 = int(_1611);
    bool _1615 = !_1609;
    int _1617 = _1615 ? 0 : (-1);
    bool _1619 = _471 == 0;
    float _1621 = -_1589;
    float _1623 = _1585 + _1621;
    int _1625 = ~_1587;
    int _1627 = _1625 + _1617;
    int _1629 = _1627 + 1;
    float _1631 = _573 * _165;
    int _1633 = _471 + (-1);
    float _1635 = _1623 * _557;
    int _1637 = _471 * _1629;
    int _1639 = _1637 + _1516;
    float _1641 = trunc(_1631);
    int _1643 = int(_1641);
    int _1645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1647 = _1645 != 0;
    int _1649 = ~_1613;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    bool _1655 = !_1619;
    int _1657 = _1655 ? _1639 : (-1);
    bool _1659 = !_1647;
    int _1661 = _1659 ? 0 : 1;
    float _1663 = trunc(_1635);
    int _1665 = int(_1663);
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1669 = _1667 != 0;
    int _1671 = _1657 * _1653;
    int _1673 = abs(_1661);
    int _1675 = abs(_513);
    int _1677 = _1613 * _1633;
    int _1679 = _1677 + _1671;
    bool _1681 = !_1669;
    int _1683 = _1681 ? 0 : 1;
    int _1685 = _1679 * _1518;
    int _1687 = abs(_1683);
    int _1689 = _1665 * _1673;
    int _1691 = _1689 + _1516;
    int _1693 = _1643 * _1524;
    int _1695 = _1693 + _1685;
    int _1697 = _1691 * _1675;
    int _1699 = _1697 + _1695;
    int _1701 = ~_471;
    int _1703 = _1701 + 1;
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1711 = _1709 != 0;
    int _1713 = _1665 * _1687;
    int _1715 = _1713 + _1699;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1719 = _1717 != 0;
    float _1721 = 1.0 / _1707;
    int _1723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1725 = _1723 != 0;
    float _1727 = float(uint(_1715));
    bool _1729 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1731 = isnan(_347);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = float(uint(_1691));
    float _1743 = as_type<float>(_1538) * _1727;
    float _1745 = as_type<float>(_1538) * _1741;
    float _1747 = trunc(_1743);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1755 = _1753 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1757 = 1.0 / _1755;
    int _1759 = _1703 * int(_1751);
    int _1761 = _1759 + _1715;
    bool _1763 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1765 = isnan(_347);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = float(uint(_1761));
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1779 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1783 = _1781 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1785 = as_type<float>(_1538) * _1775;
    float _1787 = -_1773;
    float _1789 = _1787 + 1.0;
    float _1791 = _1779 * _1757;
    float _1793 = _1783 * _1721;
    bool _1795 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1797 = isnan(_347);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    float _1807 = _1739 * _1789;
    float _1809 = trunc(_1785);
    float _1811 = precise::max(_1809, 0.0);
    uint _1813 = uint(_1811);
    float _1815 = -_1739;
    float _1817 = _1815 + 1.0;
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1821 = _347 + _1819;
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1825 = _347 + _1823;
    float _1827 = -_227;
    int _1829 = _1528 ? as_type<int>(_1827) : as_type<int>(_227);
    float _1831 = _1805 * _1817;
    float _1833 = fma(_1791, _1821, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1835 = fma(_1793, _1825, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1837 = trunc(_1745);
    float _1839 = precise::max(_1837, 0.0);
    uint _1841 = uint(_1839);
    int _1843 = ~_471;
    int _1845 = _1843 + 1;
    float _1847 = _1833 * _1831;
    float _1849 = -_223;
    int _1851 = _1530 ? as_type<int>(_1849) : as_type<int>(_223);
    float _1853 = -_1805;
    float _1855 = _1853 + 1.0;
    bool _1857 = !_1719;
    float _1859 = _1857 ? _223 : as_type<float>(_1851);
    float _1861 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1847);
    int _1863 = int(_1751) + int(_1813);
    bool _1865 = !_1725;
    float _1867 = _1865 ? _227 : as_type<float>(_1829);
    float _1869 = _1859 + 0.5;
    int _1871 = ~_471;
    int _1873 = _1871 + 1;
    int _1875 = _1845 * _1863;
    int _1877 = _1875 + _1715;
    float _1879 = fma(_1835, _1807, _1861);
    float _1881 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[80].x, _397);
    float _1883 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1885 = _1873 * int(_1841);
    int _1887 = _1885 + _1691;
    bool _1889 = uint(_1877) >= uint(_471);
    float _1891 = _1867 + (-0.5);
    float _1893 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1879);
    float _1895 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1897 = !_1889;
    int _1899 = _1897 ? 0 : (-1);
    float _1901 = -_1891;
    float _1903 = -_415;
    float _1905 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1903);
    float _1907 = float(uint(_1887));
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1911 = ~_1863;
    int _1913 = _1911 + _1899;
    int _1915 = _1913 + 1;
    float _1917 = -_567;
    float _1919 = _1917 + 1.0;
    float _1921 = fma(_1867, _1522, _1905);
    float _1923 = as_type<float>(_1538) * _1907;
    int _1925 = _471 * _1915;
    int _1927 = _1925 + _1715;
    float _1929 = -_1919;
    float _1931 = fma(_1859, _1929, _1881);
    float _1933 = abs(_1061);
    float _1935 = log2(_1933);
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1939 = !_1619;
    int _1941 = _1939 ? _1927 : (-1);
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1947 = _1941 >> 31;
    float _1949 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1953 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1955 = _1947 & 3;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1963 = trunc(_1923);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    out.m_72.x = _1949;
    out.m_72.y = _1951;
    out.m_72.z = _1953;
    out.m_72.w = _1909;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1973 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1975 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1977 = ~_471;
    int _1979 = _1977 + 1;
    float _1981 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_74.x = _1931;
    out.m_74.y = _1921;
    int _1983 = _1941 & 3;
    bool _1985 = _1983 != 0;
    float _1987 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1883);
    out.m_76.x = _1969;
    out.m_76.y = _1971;
    out.m_76.z = _1973;
    out.m_76.w = _1975;
    float _1989 = exp2(_1981);
    bool _1991 = _1061 <= 8000.0;
    bool _1993 = isnan(_1061);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(8000.0);
    bool _1999 = _1995 || _1997;
    float _2001 = float(_1999);
    float _2003 = _761 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2005 = _1941 + _1955;
    int _2007 = int(_1841) + int(_1967);
    float _2009 = -_751;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2003);
    int _2013 = _2005 >> 2;
    float _2015 = _761 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2017 = _761 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2019 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2011);
    float _2021 = -_751;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2015);
    int _2025 = _2013 << 4;
    int _2027 = _2025 + 368;
    int _2029 = _1979 * _2007;
    int _2031 = _2029 + _1691;
    float _2033 = -_751;
    float _2035 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2017);
    float _2037 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _2039 = uint(int(uint(_2027) >> uint(2)));
    uint _2041 = uint(int(uint(int(_2039)) >> uint(2)));
    int _2043 = int(_2039) & 3;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[int(_2041)][_2043];
    int _2047 = int(_2039) + 1;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    int _2051 = _2047 & 3;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[int(_2049)][_2051];
    float _2055 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2023);
    float _2057 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2035);
    float _2059 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2037);
    int _2061 = _1941 & 3;
    bool _2063 = _2061 != 0;
    float _2065 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2067 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2069 = uint(_2031) >= uint(_471);
    int _2071 = _2027 + 8;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
    int _2077 = int(_2073) & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_2073) + 1;
    uint _2083 = uint(int(uint(_2081) >> uint(2)));
    int _2085 = _2081 & 3;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[int(_2083)][_2085];
    bool _2089 = uint(_2061) > 1u;
    float _2091 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2065);
    float _2093 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2067);
    float _2095 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2097 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2099 = fma(_1989, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _1895 * _2019;
    float _2105 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2095);
    float _2107 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2097);
    int _2109 = _1985 ? 0 : 1;
    float _2111 = _1895 * _2055;
    float _2113 = _1895 * _2057;
    float _2115 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2059);
    int _2117 = ~_2109;
    int _2119 = _2117 + 1;
    int _2121 = _2119 + 1;
    float _2123 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2091);
    int _2125 = _2121;
    if (!_2089)
    {
        int _2127 = ~_2109;
        int _2129 = _2127 + 1;
        _2125 = _2129;
    }
    int _2131 = _2125;
    float _2133 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2093);
    bool _2135 = _2061 != 3;
    float _2137 = fma(_2101, -2.0, 3.0);
    float _2139 = _2101 * _2101;
    bool _2141 = uint(_2061) >= 2u;
    float _2143 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2105);
    int _2145 = abs(_2131);
    float _2147 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2107);
    float _2149 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1987);
    float _2151 = _2139 * _2137;
    int _2153 = _2141 ? 0 : 1;
    float _2155 = -_1487;
    float _2157 = _2155 + 1.0;
    bool _2159 = !_2063;
    int _2161 = _2159 ? 0 : 1;
    float _2163 = _1557 * _1489;
    int _2165 = ~_2145;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    bool _2171 = _2061 != 3;
    int _2173 = ~_2153;
    int _2175 = _2173 + 1;
    int _2177 = _2175 + 1;
    int _2179 = abs(_2161);
    int _2181 = _2177;
    if (_2135)
    {
        int _2183 = ~_2153;
        int _2185 = _2183 + 1;
        _2181 = _2185;
    }
    int _2187 = _2181;
    int _2189 = _2169 * as_type<int>(_2053);
    bool _2191 = !_2171;
    int _2193 = _2191 ? 0 : (-1);
    bool _2195 = !_2069;
    int _2197 = _2195 ? 0 : (-1);
    bool _2199 = !_1711;
    int _2201 = _2199 ? 0 : 1;
    int _2203 = abs(_2193);
    int _2205 = abs(_2187);
    int _2207 = ~_2179;
    int _2209 = _2207 + 1;
    int _2211 = _2209 + 1;
    float _2213 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2215 = ~_2007;
    int _2217 = _2215 + _2197;
    int _2219 = _2217 + 1;
    int _2221 = abs(_2201);
    int _2223 = _2211 * as_type<int>(_2045);
    int _2225 = _2223 + _2189;
    float _2227 = fma(_2213, _2115, _2103);
    int _2229 = ~_2205;
    int _2231 = _2229 + 1;
    int _2233 = _2231 + 1;
    int _2235 = _471 * _2219;
    int _2237 = _2235 + _1691;
    int _2239 = ~_2203;
    int _2241 = _2239 + 1;
    int _2243 = _2241 + 1;
    float _2245 = fma(_2213, _2133, _2113);
    int _2247 = _2233 * as_type<int>(_2079);
    int _2249 = _2247 + _2225;
    float _2251 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2253 = !_1619;
    int _2255 = _2253 ? _2237 : (-1);
    float _2257 = _1510 * _2163;
    int _2259 = _2243 * as_type<int>(_2087);
    int _2261 = _2259 + _2249;
    float _2263 = -_2151;
    float _2265 = _2263 + 1.0;
    float _2267 = in.m_78.x;
    int _2269 = ~_2221;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    float _2275 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2251);
    float _2277 = fma(_2265, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2151);
    float _2279 = _2143 + _2227;
    int _2281 = _2261 * _2273;
    float _2283 = _2001 * _2277;
    float _2285 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2275);
    float _2287 = fma(_2213, _2123, _2111);
    int _2289 = _2255 * _2221;
    int _2291 = _2289 + _2281;
    float _2293 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2295 = _1415 * 0.5;
    float _2297 = _2147 + _2287;
    float _2299 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2285);
    float _2301 = _2157 * _2293;
    float _2303 = precise::clamp(_2301, 0.0, 1.0);
    float _2305 = float(_2291);
    float _2307 = fma(_1469, -0.5, _2295);
    float _2309 = -_1557;
    float _2311 = _2309 + 1.0;
    float _2313 = -_2303;
    float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2317 = _2149 + _2245;
    out.m_80.x = _2305;
    float _2319 = _1500 * _2311;
    float _2321 = fma(_1500, _2257, _1498);
    float _2323 = _2315 * _2267;
    out.gl_Position.x = _1467;
    out.gl_Position.y = _1469;
    out.gl_Position.z = _2299;
    out.gl_Position.w = _1415;
    bool _2325 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2327 = isnan(_1205);
    bool _2329 = _2325 || _2327;
    bool _2331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2333 = _2329 || _2331;
    float _2335 = _2299 + _1415;
    float _2337 = _2323 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2339 = _1500 * _2163;
    out.m_82.x = _2279;
    out.m_82.y = _2297;
    out.m_82.z = _2317;
    float _2341 = _1467 + _1415;
    float _2343 = fma(_1506, _2339, _1494);
    float _2345 = fma(_1508, _2339, _1496);
    out.m_84.x = _2337;
    float _2347 = _2335 * 0.5;
    float _2349 = _2341 * 0.5;
    float _2351 = _1113 * _1169;
    out.m_86.x = _2343;
    out.m_86.y = _2345;
    out.m_86.z = _2321;
    out.m_86.w = _2319;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2355 = _2311;
    float _2357 = _2351;
    float _2359 = _2347;
    float _2361 = _2307;
    float _2363 = _2349;
    if (!_2333)
    {
        _2353 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2365 = _2353;
    float _2367 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_88.x = _2349;
    out.m_88.y = _2307;
    out.m_88.z = _2347;
    out.m_88.w = _1415;
    float _2369 = _2365;
    float _2371 = _2365;
    if (!_2333)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2373 = _2355;
    float _2375 = _2373;
    float _2377 = _2373;
    if (!_2333)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2379 = _2357;
    float _2381 = _2379;
    float _2383 = _2379;
    if (!_2333)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2385 = _2359;
    float _2387 = _2385;
    float _2389 = _2385;
    if (!_2333)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2391 = _2361;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2333)
    {
        _2363 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2397 = _2363;
    bool _2399 = !_2333;
    float _2401 = _2397;
    float _2403 = _2397;
    if (!_2399)
    {
        bool _2405 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2407 = isnan(_1205);
        bool _2409 = _2405 || _2407;
        bool _2411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2413 = _2409 || _2411;
        if (!_2413)
        {
            float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2417 = _1205 + _2415;
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2421 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2419;
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2427 = 1.0 / _2421;
            float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2445 = _2417 * _2427;
            float _2447 = precise::clamp(_2445, 0.0, 1.0);
            float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2453 = fma(_2447, _2425, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2455 = fma(_2447, _2451, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2457 = fma(_2447, _2431, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2459 = fma(_2447, _2435, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2461 = fma(_2447, _2439, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2463 = fma(_2447, _2443, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2395 = _2457;
            _2377 = _2461;
            _2389 = _2453;
            _2371 = _2459;
            _2403 = _2455;
            _2383 = _2463;
            _2465 = true;
        }
        else
        {
            bool _2467 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2469 = isnan(_1205);
            bool _2471 = _2467 || _2469;
            bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2475 = _2471 || _2473;
            if (!_2475)
            {
                _2387 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2477 = _2387;
            _2389 = _2477;
            if (!_2475)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2479 = _2393;
            _2395 = _2479;
            if (!_2475)
            {
                _2401 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2481 = _2401;
            _2403 = _2481;
            if (!_2475)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2483 = _2369;
            _2371 = _2483;
            if (!_2475)
            {
                _2375 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2485 = _2375;
            _2377 = _2485;
            if (!_2475)
            {
                _2381 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2487 = _2381;
            bool _2489 = !_2475;
            _2383 = _2487;
            if (!_2489)
            {
                bool _2491 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2493 = isnan(_1205);
                bool _2495 = _2491 || _2493;
                bool _2497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2499 = _2495 || _2497;
                if (!_2499)
                {
                    float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2503 = _1205 + _2501;
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2507 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2505;
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2513 = 1.0 / _2507;
                    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2531 = _2503 * _2513;
                    float _2533 = precise::clamp(_2531, 0.0, 1.0);
                    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2539 = fma(_2533, _2511, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2541 = fma(_2533, _2537, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2543 = fma(_2533, _2517, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2545 = fma(_2533, _2521, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2547 = fma(_2533, _2525, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2549 = fma(_2533, _2529, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2395 = _2543;
                    _2377 = _2547;
                    _2389 = _2539;
                    _2371 = _2545;
                    _2403 = _2541;
                    _2383 = _2549;
                    _2465 = true;
                }
                else
                {
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2377 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2389 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2403 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2383 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2465 = false;
    float _2551 = _2395;
    float _2553 = _2377;
    float _2555 = _2389;
    float _2557 = _2371;
    float _2559 = _2403;
    float _2561 = _2383;
    float _2563 = _2367 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2565 = fma(_2297, -0.5, 0.5);
    float _2567 = precise::clamp(_2565, 0.0, 1.0);
    float _2569 = -_2551;
    float _2571 = _2569 + _2553;
    float _2573 = -_2555;
    float _2575 = _2573 + _2557;
    out.m_53.x = _2563;
    float _2577 = -_2559;
    float _2579 = _2577 + _2561;
    float _2581 = fma(_2567, _2571, _2551);
    float _2583 = fma(_2567, _2575, _2555);
    bool _2585 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2587 = _2581 * 0.586610972881317138671875;
    float _2589 = fma(_2567, _2579, _2559);
    out.m_90.x = 0.0;
    bool _2591 = _1113 > 0.0;
    bool _2593 = isnan(_1113);
    bool _2595 = _2591 || _2593;
    bool _2597 = isnan(0.0);
    bool _2599 = _2595 || _2597;
    float _2601 = fma(_2583, 0.298911988735198974609375, _2587);
    bool _2603 = _1169 <= 0.0;
    bool _2605 = !_2599;
    bool _2607 = _2603 || _2605;
    float _2609 = fma(_2589, 0.114477999508380889892578125, _2601);
    float _2611 = -_2609;
    float _2613 = _2583 + _2611;
    float _2615 = -_2609;
    float _2617 = _2581 + _2615;
    float _2619 = -_2609;
    float _2621 = _2589 + _2619;
    float _2623 = fma(_2613, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2609);
    float _2625 = fma(_2617, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2609);
    float _2627 = fma(_2621, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2609);
    bool _2629 = !_2585;
    if (!_2629)
    {
        float _2631 = -_1045;
        float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2635 = -_1047;
        float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2639 = -_1049;
        float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2643 = _2633 * _2633;
        float _2645 = fma(_2637, _2637, _2643);
        float _2647 = fma(_2641, _2641, _2645);
        float _2649 = sqrt(_2647);
        float _2651 = rsqrt(_2647);
        float _2653 = -_2649;
        float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2657 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2659 = precise::clamp(_2657, 0.0, 1.0);
        float _2661 = _2637 * _2651;
        float _2663 = _2633 * _2651;
        float _2665 = abs(_2659);
        float _2667 = log2(_2665);
        float _2669 = _2641 * _2651;
        float _2671 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2673 = _2297 * _2663;
        float _2675 = -_2663;
        float _2677 = -_2671;
        float _2679 = fma(_2675, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2677);
        float _2681 = fma(_2279, _2661, _2673);
        float _2683 = -_2669;
        float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2679);
        float _2687 = fma(_2317, _2669, _2681);
        float _2689 = precise::clamp(_2687, 0.0, 1.0);
        float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2693 = _2685 + _2691;
        float _2695 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2697 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2699 = precise::clamp(_2697, 0.0, 1.0);
        float _2701 = exp2(_2695);
        float _2703 = _2701 * _2699;
        float _2705 = _2689 * _2703;
        float _2707 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2709 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2711 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2707;
        out.m_90.y = _2709;
        out.m_90.z = _2711;
    }
    out.m_92.x = _2623;
    out.m_92.y = _2625;
    out.m_92.z = _2627;
    if (!_2607)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2713 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2713;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2465 = false;
    bool _253 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = in.m_48.w;
    float _110 = trunc(_106);
    int _113 = int(_110);
    float _115 = -_108;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _117;
    bool _121 = _113 >= 1;
    float _123 = 0.0;
    float _125 = as_type<float>(_113);
    float _127 = _117;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (!_121)
    {
        out.m_53.x = 0.0;
    }
    int _131 = 0;
    if (!_121)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_135);
        out.gl_Position.z = _2781;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _137 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_108);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_113);
    bool _149 = _117 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _125;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    int _157 = 0;
    if (_153)
    {
        float _159 = _155 * 5.0;
        _157 = as_type<int>(_159);
    }
    int _161 = _157;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2836 = as_type<float>(_161);
        out.gl_Position.z = _2836;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = 1.0 / _147;
    float _167 = in.m_58.x;
    float _169 = in.m_58.y;
    float _171 = in.m_58.z;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = _117 * _165;
    int _193 = as_type<int>(_163) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_163) & 2;
    bool _199 = _197 != 0;
    bool _201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _203 = _169 * _175;
    float _205 = _169 * _181;
    float _207 = fma(_167, _173, _203);
    float _209 = _169 * _187;
    float _211 = fma(_167, _179, _205);
    float _213 = fma(_171, _177, _207);
    float _215 = fma(_167, _185, _209);
    float _217 = fma(_171, _183, _211);
    float _219 = fma(_171, _189, _215);
    bool _221 = !_195;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_199;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_201;
    float _231 = _191;
    float _233 = _219;
    float _251;
    if (!_229)
    {
        float _235 = in.m_66.x;
        float _237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _239 = _235 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _243 = _241 * _237;
        float _245 = floor(_243);
        float _247 = -_245;
        float _249 = _243 + _247;
        _251 = _249;
        _253 = true;
    }
    else
    {
        _251 = _191;
    }
    _253 = false;
    float _255 = _251;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = _255 + _257;
    bool _261 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _263 = isnan(_255);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -_271;
    float _279 = _277 + 1.0;
    bool _281 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _283 = isnan(_255);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _293;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 1.0 / _275;
    float _301 = _291 * _279;
    float _303 = -_291;
    float _305 = _303 + 1.0;
    float _307 = _259 * _299;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _309;
    float _313 = fma(_295, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _315 = fma(_311, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = _313 * _301;
    float _319 = _315 * _301;
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].x, _317);
    float _323 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[143].y, _319);
    float _325 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].x, _321);
    float _327 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[144].y, _323);
    bool _329 = !_297;
    if (!_329)
    {
        float _331 = in.m_66.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _339 = _337 * _333;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _231 = _345;
    }
    float _347 = _231;
    float _349 = in.m_66.x;
    float _351 = in.m_66.y;
    float _353 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _355 = log2(_353);
    float _357 = in.m_66.z;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _361 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _363 = int(_361);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _367 = _355 * _117;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _371 = exp2(_367);
    float _373 = _349 * 2.0;
    float _375 = _351 + _349;
    float _377 = _351 * 2.0;
    float _379 = _349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _381 = _357 * 2.0;
    float _383 = _375 + (-1.0);
    float _385 = float(_363);
    float _387 = floor(_373);
    float _389 = -_365;
    float _391 = fma(_379, 2.0, _389);
    float _393 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _369);
    float _395 = -_117;
    float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[76].x, _391);
    float _399 = floor(_381);
    float _401 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _403 = -_371;
    float _405 = _403 + 1.0;
    float _407 = fma(_401, -2.0, _359);
    float _409 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _411 = floor(_377);
    float _413 = _351 + _357;
    float _415 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _407);
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _419 = _417 != 0;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _427 = _425 != 0;
    float _429 = _413 + (-1.0);
    bool _431 = _387 > 0.0;
    bool _433 = _399 >= 0.0;
    bool _435 = isnan(_399);
    bool _437 = _433 || _435;
    bool _439 = isnan(0.0);
    bool _441 = _437 || _439;
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _445 = !_423;
    int _447 = _445 ? 0 : 1;
    float _449 = 1.0 / _385;
    bool _451 = _399 > 0.0;
    int _453 = _441 ? 0 : 1;
    bool _455 = !_419;
    int _457 = _455 ? 0 : 1;
    bool _459 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _467 = _463 || _465;
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _471 = int(_469);
    bool _473 = _387 >= 0.0;
    bool _475 = isnan(_387);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    bool _483 = _411 > 0.0;
    bool _485 = _411 >= 0.0;
    bool _487 = isnan(_411);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.0);
    bool _493 = _489 || _491;
    int _495 = ~_453;
    int _497 = _495 + 1;
    int _499 = _497 + 1;
    float _501 = _449 * _117;
    int _503 = _499;
    if (!_451)
    {
        int _505 = ~_453;
        int _507 = _505 + 1;
        _503 = _507;
    }
    int _509 = _503;
    bool _511 = !_427;
    int _513 = _511 ? 0 : 1;
    float _515 = _467 ? _405 : 0.0;
    int _517 = _481 ? 0 : 1;
    float _519 = in.m_68.x;
    float _521 = in.m_68.y;
    float _523 = in.m_68.z;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _531 = _529 != 0;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _535 = _533 != 0;
    bool _537 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _539 = isnan(1.0);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _545 = _541 || _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _549 = 1.0 + _547;
    bool _551 = !_527;
    int _553 = _551 ? 0 : 1;
    float _555 = 1.0 / _549;
    float _557 = float(_471);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _561 = abs(_553);
    float _563 = float(_509);
    float _565 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _559);
    float _567 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _393);
    bool _569 = !_531;
    int _571 = _569 ? 0 : 1;
    float _573 = _557 * _117;
    float _575 = float(_561);
    float _577 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _565);
    int _579 = ~_517;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    int _585 = _583;
    if (!_431)
    {
        int _587 = ~_517;
        int _589 = _587 + 1;
        _585 = _589;
    }
    int _591 = _585;
    if (_545)
    {
        float _593 = _515 * _555;
        _127 = _593;
    }
    float _595 = _127;
    float _597 = _575 * _563;
    int _599 = abs(_571);
    float _601 = _349 + (-0.5);
    int _603 = _493 ? 0 : 1;
    float _605 = _597 * (-2.0);
    float _607 = float(_591);
    float _609 = float(_599);
    float _611 = fma(_605, _519, _519);
    float _613 = fma(_409, _605, _409);
    bool _615 = !_535;
    int _617 = _615 ? 0 : 1;
    float _619 = _609 * _607;
    int _621 = ~_603;
    int _623 = _621 + 1;
    int _625 = _623 + 1;
    float _627 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].x, _611);
    int _629 = _625;
    if (!_483)
    {
        int _631 = ~_603;
        int _633 = _631 + 1;
        _629 = _633;
    }
    int _635 = _629;
    float _637 = _619 * (-2.0);
    int _639 = abs(_617);
    float _641 = _351 + (-0.5);
    float _643 = float(_635);
    float _645 = fma(_637, _521, _521);
    float _647 = float(_639);
    float _649 = fma(_613, _595, _627);
    float _651 = fma(_443, _637, _443);
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[196].y, _645);
    float _655 = _357 + _349;
    float _657 = _647 * _643;
    float _659 = _649 * 0.15915493667125701904296875;
    float _661 = fma(_651, _595, _653);
    float _663 = _655 + (-1.0);
    float _665 = _657 * (-2.0);
    float _667 = in.m_70.x;
    float _669 = in.m_70.y;
    float _671 = _357 + (-0.5);
    float _673 = fma(_665, _523, _523);
    float _675 = _661 * 0.15915493667125701904296875;
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _679 = _659 * 6.283185482025146484375;
    float _681 = sin(_679);
    float _683 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[196].z, _673);
    float _685 = in.m_46.x;
    float _687 = in.m_46.y;
    float _689 = in.m_46.z;
    float _691 = fma(_677, _665, _677);
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _695 = fma(_691, _595, _683);
    float _697 = _659 * 6.283185482025146484375;
    float _699 = cos(_697);
    float _701 = _695 * 0.15915493667125701904296875;
    float _703 = _675 * 6.283185482025146484375;
    float _705 = sin(_703);
    float _707 = _325 * _667;
    float _709 = _327 * _669;
    float _711 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _713 = _707 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _715 = _675 * 6.283185482025146484375;
    float _717 = cos(_715);
    float _719 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _721 = _187 * _687;
    float _723 = _713 * _711;
    float _725 = _175 * _687;
    float _727 = _719 * _693;
    float _729 = fma(_185, _685, _721);
    float _731 = _181 * _687;
    float _733 = _701 * 6.283185482025146484375;
    float _735 = cos(_733);
    float _737 = _681 * _705;
    float _739 = _699 * _705;
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = fma(_173, _685, _725);
    float _745 = fma(_189, _689, _729);
    float _747 = fma(_179, _685, _731);
    float _749 = _701 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = _699 * _717;
    float _755 = _681 * _717;
    float _757 = fma(_177, _689, _743);
    float _759 = fma(_183, _689, _747);
    float _761 = _699 * _735;
    float _763 = _681 * _735;
    float _765 = _717 * _735;
    float _767 = _705 * _735;
    float _769 = _761 * _727;
    float _771 = in.m_64.w;
    float _773 = fma(_751, _753, _737);
    float _775 = -_727;
    float _777 = _751 * _775;
    float _779 = in.m_60.w;
    float _781 = -_755;
    float _783 = fma(_751, _739, _781);
    float _785 = fma(_773, _723, _769);
    float _787 = -_739;
    float _789 = fma(_751, _755, _787);
    float _791 = _763 * _727;
    float _793 = fma(_765, _723, _777);
    float _795 = fma(_783, _741, _785);
    float _797 = fma(_751, _737, _753);
    float _799 = fma(_789, _723, _791);
    float _801 = fma(_767, _741, _793);
    float _803 = _795 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _805 = fma(_797, _741, _799);
    float _807 = _795 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _809 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].x, _803);
    float _811 = _795 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].x, _807);
    float _815 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].z, _809);
    float _817 = _745 + _771;
    float _819 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].x, _811);
    float _821 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = in.m_62.w;
    float _827 = _757 + _779;
    float _829 = _821 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _831 = _817 + _823;
    float _833 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].z, _819);
    float _835 = _827 + _829;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _839 = _831 + _837;
    float _841 = _833 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _845 = _835 + _843;
    float _847 = _839 * _839;
    float _849 = fma(_845, _845, _847);
    float _851 = sqrt(_849);
    float _853 = _759 + _825;
    float _855 = _853 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _857 = _853 + _841;
    float _859 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[11].x, _855);
    bool _861 = _851 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _863 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[11].z, _859);
    float _865 = _855;
    float _867 = _825;
    float _869 = _831;
    float _871 = _857;
    if (!_861)
    {
        _865 = _835;
    }
    float _873 = _865;
    float _875 = _873;
    if (!_861)
    {
        _867 = _857;
    }
    float _877 = _867;
    bool _879 = !_861;
    float _881 = _877;
    if (!_879)
    {
        float _883 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _885 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _887 = _851 + _885;
        float _889 = rsqrt(_849);
        float _891 = _887 * _883;
        float _893 = _857 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _895 = _891 * 0.15915493667125701904296875;
        float _897 = _895 * 6.283185482025146484375;
        float _899 = cos(_897);
        float _901 = _895 * 6.283185482025146484375;
        float _903 = sin(_901);
        float _905 = _899 + (-1.0);
        float _907 = _905 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = fma(_903, _893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _911 = fma(_857, _899, _907);
        float _913 = _889 * _909;
        float _915 = fma(_845, _913, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _917 = fma(_839, _913, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _881 = _911;
        _875 = _915;
        _869 = _917;
    }
    float _919 = _881;
    float _921 = _875;
    float _923 = _869;
    float _925 = -_853;
    float _927 = _925 + _919;
    float _929 = _863 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _931 = -_827;
    float _933 = _931 + _921;
    float _935 = -_817;
    float _937 = _935 + _923;
    float _939 = _927 * _927;
    float _941 = _853 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _943 = 1.0 / _929;
    bool _945 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _947 = isnan(0.5);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _953 = _949 || _951;
    float _955 = fma(_933, _933, _939);
    float _957 = fma(_937, _937, _955);
    float _959 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[10].x, _941);
    float _961 = sqrt(_957);
    float _963 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[10].z, _959);
    float _965 = _963 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _967 = _965 + _929;
    float _969 = _967 * _943;
    float _971 = _969 * 0.5;
    bool _973 = _961 > 0.0;
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _977 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[30].w, _975);
    float _979 = _961;
    float _981 = _919;
    float _983 = _921;
    float _985 = _923;
    float _987 = _929;
    float _989 = _943;
    if (_953)
    {
        _979 = 1.0;
    }
    float _991 = _979;
    float _993 = 1.0 / _977;
    bool _995 = !_973;
    float _997 = _991;
    if (!_995)
    {
        float _999 = _217 * _217;
        float _1001 = rsqrt(_957);
        float _1003 = fma(_213, _213, _999);
        float _1005 = fma(_219, _219, _1003);
        float _1007 = sqrt(_1005);
        float _1009 = _933 * _1001;
        float _1011 = _927 * _1001;
        bool _1013 = _1007 > 0.0;
        float _1015 = _937 * _1001;
        bool _1017 = !_1013;
        _987 = _1015;
        _871 = _1009;
        if (!_1017)
        {
            float _1019 = rsqrt(_1005);
            float _1021 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1023 = _217 * _1019;
            float _1025 = _213 * _1019;
            float _1027 = _1011 * _1023;
            float _1029 = _219 * _1019;
            float _1031 = fma(_1009, _1025, _1027);
            float _1033 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1035 = fma(_1015, _1029, _1031);
            float _1037 = _1035 * _1033;
            float _1039 = fma(_213, _1037, _921);
            float _1041 = fma(_217, _1037, _919);
            float _1043 = fma(_219, _1037, _923);
            _981 = _1041;
            _983 = _1039;
            _985 = _1043;
        }
    }
    float _1045 = _981;
    float _1047 = _983;
    float _1049 = _985;
    float _1051 = _987;
    float _1053 = _871;
    float _1055 = _1053;
    if (_953)
    {
        _1055 = 1.0;
    }
    float _1057 = _1055;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1061 = _993 * _1059;
    float _1063 = _1057;
    if (!_953)
    {
        float _1065 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = _1065 * 0.15915493667125701904296875;
        float _1069 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1073 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1071;
        float _1075 = _1067 * 6.283185482025146484375;
        float _1077 = cos(_1075);
        float _1079 = _1069 * 0.15915493667125701904296875;
        float _1081 = _1067 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = 1.0 / _1077;
        float _1087 = _1079 * 6.283185482025146484375;
        float _1089 = cos(_1087);
        float _1091 = _1083 * _1085;
        float _1093 = _1079 * 6.283185482025146484375;
        float _1095 = sin(_1093);
        float _1097 = _1089 * _1091;
        float _1099 = 1.0 / _1073;
        float _1101 = 1.0 / _1097;
        float _1103 = _1095 * _1101;
        float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1107 = fma(_1061, _1103, _1105);
        float _1109 = _1107 * _1099;
        float _1111 = precise::clamp(_1109, 0.0, 1.0);
        _997 = _1111;
    }
    float _1113 = _997;
    if (!_953)
    {
        float _1115 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1117 = _1115 * 0.15915493667125701904296875;
        float _1119 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1121 = _1117 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        float _1125 = _1119 * 0.15915493667125701904296875;
        float _1127 = _1117 * 6.283185482025146484375;
        float _1129 = sin(_1127);
        float _1131 = 1.0 / _1123;
        float _1133 = _1125 * 6.283185482025146484375;
        float _1135 = cos(_1133);
        float _1137 = _1129 * _1131;
        float _1139 = _1125 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1135 * _1137;
        float _1145 = 1.0 / _1143;
        float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1149 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1147;
        float _1151 = 1.0 / _1149;
        float _1153 = _1141 * _1145;
        float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1157 = fma(_1061, _1153, _1155);
        float _1159 = _1157 * _1151;
        float _1161 = precise::clamp(_1159, 0.0, 1.0);
        float _1163 = -_1161;
        float _1165 = _1163 + 1.0;
        _233 = _1153;
        _1063 = _1165;
    }
    float _1167 = _233;
    float _1169 = _1063;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1173 = _1045 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1177 = _1047 + _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1181 = _1049 + _1179;
    float _1183 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1185 = _1173 * _1173;
    float _1187 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1189 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1183);
    float _1191 = fma(_1177, _1177, _1185);
    float _1193 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1187);
    float _1195 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1189);
    float _1197 = fma(_1181, _1181, _1191);
    float _1199 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1193);
    float _1201 = rsqrt(_1197);
    float _1203 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1205 = sqrt(_1197);
    float _1207 = _1201 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1209 = _1177 * _1207;
    float _1211 = _1181 * _1207;
    float _1213 = _1209 * _1209;
    float _1215 = _1211 * _1211;
    float _1217 = _1213 + _1215;
    float _1219 = sqrt(_1217);
    bool _1221 = _1219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1223 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1225 = _1219 + _1223;
    float _1227 = _1167;
    float _1229 = _1225;
    float _1231 = _1209;
    float _1233 = _1211;
    float _1235 = _1213;
    float _1237 = _1215;
    if (_1221)
    {
        float _1239 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1227 = _1239;
    }
    float _1241 = _1227;
    if (_1221)
    {
        float _1243 = _1225 * _1241;
        _1229 = _1243;
    }
    float _1245 = _1229;
    if (_1221)
    {
        float _1247 = _1245 * 0.15915493667125701904296875;
        _989 = _1247;
    }
    float _1249 = _989;
    float _1251 = _217;
    float _1253 = _1249;
    if (_1221)
    {
        float _1255 = _1249 * 6.283185482025146484375;
        float _1257 = sin(_1255);
        _1251 = _1257;
    }
    float _1259 = _1251;
    float _1261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1263 = precise::max(0.0, _1261);
    float _1265 = _1051;
    float _1267 = _1263;
    if (_1221)
    {
        float _1269 = _1249 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        _1265 = _1271;
    }
    float _1273 = _1265;
    float _1275 = -_1207;
    float _1277 = -_1263;
    float _1279 = fma(_1173, _1275, _1277);
    float _1281 = _1261;
    if (_1221)
    {
        float _1283 = rsqrt(_1217);
        _1281 = _1283;
    }
    float _1285 = _1281;
    if (_1221)
    {
        float _1287 = _1279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1267 = _1287;
    }
    float _1289 = _1267;
    float _1291 = fma(_827, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1293 = _1289;
    float _1295 = _1259;
    if (_1221)
    {
        float _1297 = fma(_1259, _1289, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = _1299;
    if (_1221)
    {
        float _1303 = _1273 + (-1.0);
        _1295 = _1303;
    }
    float _1305 = _1295;
    float _1307 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1309 = floor(_1291);
    float _1311 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1307);
    float _1313 = _1285;
    if (_1221)
    {
        float _1315 = _1285 * _1299;
        _1253 = _1315;
    }
    float _1317 = _1253;
    if (_1221)
    {
        float _1319 = _1305 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1319;
    }
    float _1321 = _1301;
    if (!_1221)
    {
        _1313 = _1279;
    }
    float _1323 = _1313;
    float _1325 = _1323;
    if (_1221)
    {
        float _1327 = _1209 * _1317;
        _1231 = _1327;
    }
    float _1329 = _1231;
    if (_1221)
    {
        float _1331 = fma(_1279, _1273, _1321);
        _1325 = _1331;
    }
    float _1333 = _1325;
    if (_1221)
    {
        float _1335 = _1211 * _1317;
        _1233 = _1335;
    }
    float _1337 = _1233;
    if (_1221)
    {
        float _1339 = _1329 * _1329;
        _1235 = _1339;
    }
    float _1341 = _1235;
    float _1343 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1345 = fma(_1205, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1343);
    float _1347 = precise::clamp(_1345, 0.0, 1.0);
    if (_1221)
    {
        float _1349 = _1337 * _1337;
        _1237 = _1349;
    }
    float _1351 = _1237;
    float _1353 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1355 = fma(_1333, _1333, _1341);
    float _1357 = fma(_817, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1359 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1361 = -_1347;
    float _1363 = _1361 + 1.0;
    float _1365 = _1355 + _1351;
    float _1367 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1311);
    float _1369 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1359);
    float _1371 = floor(_1357);
    float _1373 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1375 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1369);
    float _1377 = -_1309;
    float _1379 = _1291 + _1377;
    float _1381 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1385 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1387 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1389 = rsqrt(_1365);
    float _1391 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1393 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1383);
    float _1395 = -_1387;
    float _1397 = fma(_1395, _1381, 1.0);
    float _1399 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1391);
    float _1401 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1393);
    float _1403 = abs(_1363);
    float _1405 = log2(_1403);
    float _1407 = -_1371;
    float _1409 = _1357 + _1407;
    float _1411 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1413 = _1389 * _1329;
    float _1415 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1401);
    float _1417 = _1389 * _1333;
    float _1419 = _1389 * _1337;
    float _1421 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1423 = log2(_1397);
    float _1425 = _1417 + 1.0;
    float _1427 = -_1421;
    float _1429 = fma(_1417, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1427);
    float _1431 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1433 = -_1419;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1429);
    float _1437 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1439 = 1.0 / _1415;
    float _1441 = fma(_1435, -0.5, 0.5);
    float _1443 = fma(_1435, 0.5, 0.5);
    float _1445 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1437);
    float _1447 = fma(_1443, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1449 = exp2(_1431);
    float _1451 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1445);
    float _1453 = _1423 * 0.693147182464599609375;
    float _1455 = fma(_1443, _1447, -0.212114393711090087890625);
    float _1457 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1459 = fma(_1443, _1455, 1.570728778839111328125);
    float _1461 = sqrt(_1441);
    float _1463 = -_1417;
    float _1465 = fma(_1449, _1425, _1463);
    float _1467 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1451);
    float _1469 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1411);
    float _1471 = fma(_1465, 0.5, 0.5);
    float _1473 = _1467 * _1439;
    float _1475 = _1469 * _1439;
    float _1477 = _1461 * 0.636619746685028076171875;
    float _1479 = fma(_1473, 0.5, 0.5);
    float _1481 = fma(_1475, -0.5, 0.5);
    float _1483 = -_1459;
    float _1485 = fma(_1477, _1483, 1.0);
    float2 _4849 = float2(_1379, _1409);
    float _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4849, float2(0.0), isnan(_4849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4849, float2(0.0), isnan(_4849)), level(0.0)).x;
    float3 _4860 = float3(_1479, _1481, _1457);
    float _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4860, float3(0.0), isnan(_4860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4860, float3(0.0), isnan(_4860)), level(0.0)).x;
    float3 _4871 = float3(_1479, _1481, _1457);
    float4 _1492 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4871, float3(0.0), isnan(_4871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4871, float3(0.0), isnan(_4871)), level(0.0)).xyzw;
    float _1494 = _1492.x;
    float _1496 = _1492.y;
    float _1498 = _1492.z;
    float _1500 = _1492.w;
    float2 _4887 = float2(_1485, _1471);
    float3 _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4887, float2(0.0), isnan(_4887)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4887, float2(0.0), isnan(_4887)), level(0.0)).xyz;
    float _1506 = _1504.x;
    float _1508 = _1504.y;
    float _1510 = _1504.z;
    float _1512 = float(uint(_471));
    float _1514 = trunc(_501);
    int _1516 = int(_1514);
    int _1518 = abs(_447);
    float _1520 = -_577;
    float _1522 = _1520 + 1.0;
    int _1524 = abs(_457);
    float _1526 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1528 = _351 > 0.5;
    bool _1530 = _349 > 0.5;
    float _1532 = 1.0 / _1512;
    float _1534 = float(uint(_1516));
    float _1536 = exp2(_1526);
    int _1538 = as_type<int>(_1532) + (-2);
    float _1540 = as_type<float>(_1538) * _1534;
    float _1542 = trunc(_1540);
    float _1544 = precise::max(_1542, 0.0);
    uint _1547 = uint(_1544);
    int _1549 = ~_471;
    int _1551 = _1549 + 1;
    float _1553 = -_1536;
    float _1555 = _1553 + 1.0;
    float _1557 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1559 = ~_471;
    int _1561 = _1559 + 1;
    int _1563 = _1551 * int(_1547);
    int _1565 = _1563 + _1516;
    float _1567 = float(uint(_1565));
    float _1569 = as_type<float>(_1538) * _1567;
    float _1571 = trunc(_1569);
    float _1573 = precise::max(_1571, 0.0);
    uint _1575 = uint(_1573);
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1579 = _1577 != 0;
    bool _1581 = !_1579;
    float _1583 = _1581 ? 7.345489978790283203125 : 1.0;
    float _1585 = _1583 * _349;
    int _1587 = int(_1547) + int(_1575);
    float _1589 = floor(_1585);
    float _1591 = float(_1516);
    int _1593 = _1561 * _1587;
    int _1595 = _1593 + _1516;
    bool _1597 = _1591 >= _557;
    bool _1599 = isnan(_1591);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan(_557);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    bool _1609 = uint(_1595) >= uint(_471);
    float _1611 = trunc(_1607);
    int _1613 = int(_1611);
    bool _1615 = !_1609;
    int _1617 = _1615 ? 0 : (-1);
    bool _1619 = _471 == 0;
    float _1621 = -_1589;
    float _1623 = _1585 + _1621;
    int _1625 = ~_1587;
    int _1627 = _1625 + _1617;
    int _1629 = _1627 + 1;
    float _1631 = _573 * _165;
    int _1633 = _471 + (-1);
    float _1635 = _1623 * _557;
    int _1637 = _471 * _1629;
    int _1639 = _1637 + _1516;
    float _1641 = trunc(_1631);
    int _1643 = int(_1641);
    int _1645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1647 = _1645 != 0;
    int _1649 = ~_1613;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    bool _1655 = !_1619;
    int _1657 = _1655 ? _1639 : (-1);
    bool _1659 = !_1647;
    int _1661 = _1659 ? 0 : 1;
    float _1663 = trunc(_1635);
    int _1665 = int(_1663);
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1669 = _1667 != 0;
    int _1671 = _1657 * _1653;
    int _1673 = abs(_1661);
    int _1675 = abs(_513);
    int _1677 = _1613 * _1633;
    int _1679 = _1677 + _1671;
    bool _1681 = !_1669;
    int _1683 = _1681 ? 0 : 1;
    int _1685 = _1679 * _1518;
    int _1687 = abs(_1683);
    int _1689 = _1665 * _1673;
    int _1691 = _1689 + _1516;
    int _1693 = _1643 * _1524;
    int _1695 = _1693 + _1685;
    int _1697 = _1691 * _1675;
    int _1699 = _1697 + _1695;
    int _1701 = ~_471;
    int _1703 = _1701 + 1;
    float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1707 = _1705 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1711 = _1709 != 0;
    int _1713 = _1665 * _1687;
    int _1715 = _1713 + _1699;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1719 = _1717 != 0;
    float _1721 = 1.0 / _1707;
    int _1723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1725 = _1723 != 0;
    float _1727 = float(uint(_1715));
    bool _1729 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1731 = isnan(_347);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = float(uint(_1691));
    float _1743 = as_type<float>(_1538) * _1727;
    float _1745 = as_type<float>(_1538) * _1741;
    float _1747 = trunc(_1743);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1755 = _1753 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1757 = 1.0 / _1755;
    int _1759 = _1703 * int(_1751);
    int _1761 = _1759 + _1715;
    bool _1763 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1765 = isnan(_347);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = float(uint(_1761));
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1779 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1783 = _1781 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1785 = as_type<float>(_1538) * _1775;
    float _1787 = -_1773;
    float _1789 = _1787 + 1.0;
    float _1791 = _1779 * _1757;
    float _1793 = _1783 * _1721;
    bool _1795 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1797 = isnan(_347);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    float _1807 = _1739 * _1789;
    float _1809 = trunc(_1785);
    float _1811 = precise::max(_1809, 0.0);
    uint _1813 = uint(_1811);
    float _1815 = -_1739;
    float _1817 = _1815 + 1.0;
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1821 = _347 + _1819;
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1825 = _347 + _1823;
    float _1827 = -_227;
    int _1829 = _1528 ? as_type<int>(_1827) : as_type<int>(_227);
    float _1831 = _1805 * _1817;
    float _1833 = fma(_1791, _1821, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1835 = fma(_1793, _1825, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1837 = trunc(_1745);
    float _1839 = precise::max(_1837, 0.0);
    uint _1841 = uint(_1839);
    int _1843 = ~_471;
    int _1845 = _1843 + 1;
    float _1847 = _1833 * _1831;
    float _1849 = -_223;
    int _1851 = _1530 ? as_type<int>(_1849) : as_type<int>(_223);
    float _1853 = -_1805;
    float _1855 = _1853 + 1.0;
    bool _1857 = !_1719;
    float _1859 = _1857 ? _223 : as_type<float>(_1851);
    float _1861 = fma(_1855, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1847);
    int _1863 = int(_1751) + int(_1813);
    bool _1865 = !_1725;
    float _1867 = _1865 ? _227 : as_type<float>(_1829);
    float _1869 = _1859 + 0.5;
    int _1871 = ~_471;
    int _1873 = _1871 + 1;
    int _1875 = _1845 * _1863;
    int _1877 = _1875 + _1715;
    float _1879 = fma(_1835, _1807, _1861);
    float _1881 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[80].x, _397);
    float _1883 = _783 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1885 = _1873 * int(_1841);
    int _1887 = _1885 + _1691;
    bool _1889 = uint(_1877) >= uint(_471);
    float _1891 = _1867 + (-0.5);
    float _1893 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1879);
    float _1895 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1897 = !_1889;
    int _1899 = _1897 ? 0 : (-1);
    float _1901 = -_1891;
    float _1903 = -_415;
    float _1905 = fma(_1901, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1903);
    float _1907 = float(uint(_1887));
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1911 = ~_1863;
    int _1913 = _1911 + _1899;
    int _1915 = _1913 + 1;
    float _1917 = -_567;
    float _1919 = _1917 + 1.0;
    float _1921 = fma(_1867, _1522, _1905);
    float _1923 = as_type<float>(_1538) * _1907;
    int _1925 = _471 * _1915;
    int _1927 = _1925 + _1715;
    float _1929 = -_1919;
    float _1931 = fma(_1859, _1929, _1881);
    float _1933 = abs(_1061);
    float _1935 = log2(_1933);
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1939 = !_1619;
    int _1941 = _1939 ? _1927 : (-1);
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1947 = _1941 >> 31;
    float _1949 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1951 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1953 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1955 = _1947 & 3;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1963 = trunc(_1923);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    out.m_72.x = _1949;
    out.m_72.y = _1951;
    out.m_72.z = _1953;
    out.m_72.w = _1909;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1973 = _1961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1975 = _1893 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1977 = ~_471;
    int _1979 = _1977 + 1;
    float _1981 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_74.x = _1931;
    out.m_74.y = _1921;
    int _1983 = _1941 & 3;
    bool _1985 = _1983 != 0;
    float _1987 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1883);
    out.m_76.x = _1969;
    out.m_76.y = _1971;
    out.m_76.z = _1973;
    out.m_76.w = _1975;
    float _1989 = exp2(_1981);
    bool _1991 = _1061 <= 8000.0;
    bool _1993 = isnan(_1061);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan(8000.0);
    bool _1999 = _1995 || _1997;
    float _2001 = float(_1999);
    float _2003 = _761 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2005 = _1941 + _1955;
    int _2007 = int(_1841) + int(_1967);
    float _2009 = -_751;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2003);
    int _2013 = _2005 >> 2;
    float _2015 = _761 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2017 = _761 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2019 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2011);
    float _2021 = -_751;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2015);
    int _2025 = _2013 << 4;
    int _2027 = _2025 + 368;
    int _2029 = _1979 * _2007;
    int _2031 = _2029 + _1691;
    float _2033 = -_751;
    float _2035 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2017);
    float _2037 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _2039 = uint(int(uint(_2027) >> uint(2)));
    uint _2041 = uint(int(uint(int(_2039)) >> uint(2)));
    int _2043 = int(_2039) & 3;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[int(_2041)][_2043];
    int _2047 = int(_2039) + 1;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    int _2051 = _2047 & 3;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[int(_2049)][_2051];
    float _2055 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2023);
    float _2057 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2035);
    float _2059 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2037);
    int _2061 = _1941 & 3;
    bool _2063 = _2061 != 0;
    float _2065 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2067 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2069 = uint(_2031) >= uint(_471);
    int _2071 = _2027 + 8;
    uint _2073 = uint(int(uint(_2071) >> uint(2)));
    uint _2075 = uint(int(uint(int(_2073)) >> uint(2)));
    int _2077 = int(_2073) & 3;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[int(_2075)][_2077];
    int _2081 = int(_2073) + 1;
    uint _2083 = uint(int(uint(_2081) >> uint(2)));
    int _2085 = _2081 & 3;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[int(_2083)][_2085];
    bool _2089 = uint(_2061) > 1u;
    float _2091 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2065);
    float _2093 = fma(_765, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2067);
    float _2095 = _783 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2097 = _783 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2099 = fma(_1989, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _1895 * _2019;
    float _2105 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2095);
    float _2107 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2097);
    int _2109 = _1985 ? 0 : 1;
    float _2111 = _1895 * _2055;
    float _2113 = _1895 * _2057;
    float _2115 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2059);
    int _2117 = ~_2109;
    int _2119 = _2117 + 1;
    int _2121 = _2119 + 1;
    float _2123 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2091);
    int _2125 = _2121;
    if (!_2089)
    {
        int _2127 = ~_2109;
        int _2129 = _2127 + 1;
        _2125 = _2129;
    }
    int _2131 = _2125;
    float _2133 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2093);
    bool _2135 = _2061 != 3;
    float _2137 = fma(_2101, -2.0, 3.0);
    float _2139 = _2101 * _2101;
    bool _2141 = uint(_2061) >= 2u;
    float _2143 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2105);
    int _2145 = abs(_2131);
    float _2147 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2107);
    float _2149 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1987);
    float _2151 = _2139 * _2137;
    int _2153 = _2141 ? 0 : 1;
    float _2155 = -_1487;
    float _2157 = _2155 + 1.0;
    bool _2159 = !_2063;
    int _2161 = _2159 ? 0 : 1;
    float _2163 = _1557 * _1489;
    int _2165 = ~_2145;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    bool _2171 = _2061 != 3;
    int _2173 = ~_2153;
    int _2175 = _2173 + 1;
    int _2177 = _2175 + 1;
    int _2179 = abs(_2161);
    int _2181 = _2177;
    if (_2135)
    {
        int _2183 = ~_2153;
        int _2185 = _2183 + 1;
        _2181 = _2185;
    }
    int _2187 = _2181;
    int _2189 = _2169 * as_type<int>(_2053);
    bool _2191 = !_2171;
    int _2193 = _2191 ? 0 : (-1);
    bool _2195 = !_2069;
    int _2197 = _2195 ? 0 : (-1);
    bool _2199 = !_1711;
    int _2201 = _2199 ? 0 : 1;
    int _2203 = abs(_2193);
    int _2205 = abs(_2187);
    int _2207 = ~_2179;
    int _2209 = _2207 + 1;
    int _2211 = _2209 + 1;
    float _2213 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2215 = ~_2007;
    int _2217 = _2215 + _2197;
    int _2219 = _2217 + 1;
    int _2221 = abs(_2201);
    int _2223 = _2211 * as_type<int>(_2045);
    int _2225 = _2223 + _2189;
    float _2227 = fma(_2213, _2115, _2103);
    int _2229 = ~_2205;
    int _2231 = _2229 + 1;
    int _2233 = _2231 + 1;
    int _2235 = _471 * _2219;
    int _2237 = _2235 + _1691;
    int _2239 = ~_2203;
    int _2241 = _2239 + 1;
    int _2243 = _2241 + 1;
    float _2245 = fma(_2213, _2133, _2113);
    int _2247 = _2233 * as_type<int>(_2079);
    int _2249 = _2247 + _2225;
    float _2251 = _1373 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2253 = !_1619;
    int _2255 = _2253 ? _2237 : (-1);
    float _2257 = _1510 * _2163;
    int _2259 = _2243 * as_type<int>(_2087);
    int _2261 = _2259 + _2249;
    float _2263 = -_2151;
    float _2265 = _2263 + 1.0;
    float _2267 = in.m_78.x;
    int _2269 = ~_2221;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    float _2275 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2251);
    float _2277 = fma(_2265, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2151);
    float _2279 = _2143 + _2227;
    int _2281 = _2261 * _2273;
    float _2283 = _2001 * _2277;
    float _2285 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2275);
    float _2287 = fma(_2213, _2123, _2111);
    int _2289 = _2255 * _2221;
    int _2291 = _2289 + _2281;
    float _2293 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2295 = _1415 * 0.5;
    float _2297 = _2147 + _2287;
    float _2299 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2285);
    float _2301 = _2157 * _2293;
    float _2303 = precise::clamp(_2301, 0.0, 1.0);
    float _2305 = float(_2291);
    float _2307 = fma(_1469, -0.5, _2295);
    float _2309 = -_1557;
    float _2311 = _2309 + 1.0;
    float _2313 = -_2303;
    float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2317 = _2149 + _2245;
    out.m_80.x = _2305;
    float _2319 = _1500 * _2311;
    float _2321 = fma(_1500, _2257, _1498);
    float _2323 = _2315 * _2267;
    out.gl_Position.x = _1467;
    out.gl_Position.y = _1469;
    out.gl_Position.z = _2299;
    out.gl_Position.w = _1415;
    bool _2325 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2327 = isnan(_1205);
    bool _2329 = _2325 || _2327;
    bool _2331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2333 = _2329 || _2331;
    float _2335 = _2299 + _1415;
    float _2337 = _2323 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2339 = _1500 * _2163;
    out.m_82.x = _2279;
    out.m_82.y = _2297;
    out.m_82.z = _2317;
    float _2341 = _1467 + _1415;
    float _2343 = fma(_1506, _2339, _1494);
    float _2345 = fma(_1508, _2339, _1496);
    out.m_84.x = _2337;
    float _2347 = _2335 * 0.5;
    float _2349 = _2341 * 0.5;
    float _2351 = _1113 * _1169;
    out.m_86.x = _2343;
    out.m_86.y = _2345;
    out.m_86.z = _2321;
    out.m_86.w = _2319;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2355 = _2311;
    float _2357 = _2351;
    float _2359 = _2347;
    float _2361 = _2307;
    float _2363 = _2349;
    if (!_2333)
    {
        _2353 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2365 = _2353;
    float _2367 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_88.x = _2349;
    out.m_88.y = _2307;
    out.m_88.z = _2347;
    out.m_88.w = _1415;
    float _2369 = _2365;
    float _2371 = _2365;
    if (!_2333)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2373 = _2355;
    float _2375 = _2373;
    float _2377 = _2373;
    if (!_2333)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2379 = _2357;
    float _2381 = _2379;
    float _2383 = _2379;
    if (!_2333)
    {
        _2359 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2385 = _2359;
    float _2387 = _2385;
    float _2389 = _2385;
    if (!_2333)
    {
        _2361 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2391 = _2361;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2333)
    {
        _2363 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2397 = _2363;
    bool _2399 = !_2333;
    float _2401 = _2397;
    float _2403 = _2397;
    if (!_2399)
    {
        bool _2405 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2407 = isnan(_1205);
        bool _2409 = _2405 || _2407;
        bool _2411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2413 = _2409 || _2411;
        if (!_2413)
        {
            float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2417 = _1205 + _2415;
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2421 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2419;
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2427 = 1.0 / _2421;
            float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2445 = _2417 * _2427;
            float _2447 = precise::clamp(_2445, 0.0, 1.0);
            float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2453 = fma(_2447, _2425, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2455 = fma(_2447, _2451, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2457 = fma(_2447, _2431, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2459 = fma(_2447, _2435, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2461 = fma(_2447, _2439, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2463 = fma(_2447, _2443, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2395 = _2457;
            _2377 = _2461;
            _2389 = _2453;
            _2371 = _2459;
            _2403 = _2455;
            _2383 = _2463;
            _2465 = true;
        }
        else
        {
            bool _2467 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2469 = isnan(_1205);
            bool _2471 = _2467 || _2469;
            bool _2473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2475 = _2471 || _2473;
            if (!_2475)
            {
                _2387 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2477 = _2387;
            _2389 = _2477;
            if (!_2475)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2479 = _2393;
            _2395 = _2479;
            if (!_2475)
            {
                _2401 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2481 = _2401;
            _2403 = _2481;
            if (!_2475)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2483 = _2369;
            _2371 = _2483;
            if (!_2475)
            {
                _2375 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2485 = _2375;
            _2377 = _2485;
            if (!_2475)
            {
                _2381 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2487 = _2381;
            bool _2489 = !_2475;
            _2383 = _2487;
            if (!_2489)
            {
                bool _2491 = _1205 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2493 = isnan(_1205);
                bool _2495 = _2491 || _2493;
                bool _2497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2499 = _2495 || _2497;
                if (!_2499)
                {
                    float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2503 = _1205 + _2501;
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2507 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2505;
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2513 = 1.0 / _2507;
                    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2531 = _2503 * _2513;
                    float _2533 = precise::clamp(_2531, 0.0, 1.0);
                    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2539 = fma(_2533, _2511, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2541 = fma(_2533, _2537, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2543 = fma(_2533, _2517, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2545 = fma(_2533, _2521, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2547 = fma(_2533, _2525, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2549 = fma(_2533, _2529, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2395 = _2543;
                    _2377 = _2547;
                    _2389 = _2539;
                    _2371 = _2545;
                    _2403 = _2541;
                    _2383 = _2549;
                    _2465 = true;
                }
                else
                {
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2377 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2389 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2403 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2383 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2465 = false;
    float _2551 = _2395;
    float _2553 = _2377;
    float _2555 = _2389;
    float _2557 = _2371;
    float _2559 = _2403;
    float _2561 = _2383;
    float _2563 = _2367 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2565 = fma(_2297, -0.5, 0.5);
    float _2567 = precise::clamp(_2565, 0.0, 1.0);
    float _2569 = -_2551;
    float _2571 = _2569 + _2553;
    float _2573 = -_2555;
    float _2575 = _2573 + _2557;
    out.m_53.x = _2563;
    float _2577 = -_2559;
    float _2579 = _2577 + _2561;
    float _2581 = fma(_2567, _2571, _2551);
    float _2583 = fma(_2567, _2575, _2555);
    bool _2585 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2587 = _2581 * 0.586610972881317138671875;
    float _2589 = fma(_2567, _2579, _2559);
    out.m_90.x = 0.0;
    bool _2591 = _1113 > 0.0;
    bool _2593 = isnan(_1113);
    bool _2595 = _2591 || _2593;
    bool _2597 = isnan(0.0);
    bool _2599 = _2595 || _2597;
    float _2601 = fma(_2583, 0.298911988735198974609375, _2587);
    bool _2603 = _1169 <= 0.0;
    bool _2605 = !_2599;
    bool _2607 = _2603 || _2605;
    float _2609 = fma(_2589, 0.114477999508380889892578125, _2601);
    float _2611 = -_2609;
    float _2613 = _2583 + _2611;
    float _2615 = -_2609;
    float _2617 = _2581 + _2615;
    float _2619 = -_2609;
    float _2621 = _2589 + _2619;
    float _2623 = fma(_2613, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2609);
    float _2625 = fma(_2617, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2609);
    float _2627 = fma(_2621, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2609);
    bool _2629 = !_2585;
    if (!_2629)
    {
        float _2631 = -_1045;
        float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2635 = -_1047;
        float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2639 = -_1049;
        float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2643 = _2633 * _2633;
        float _2645 = fma(_2637, _2637, _2643);
        float _2647 = fma(_2641, _2641, _2645);
        float _2649 = sqrt(_2647);
        float _2651 = rsqrt(_2647);
        float _2653 = -_2649;
        float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2657 = _2655 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2659 = precise::clamp(_2657, 0.0, 1.0);
        float _2661 = _2637 * _2651;
        float _2663 = _2633 * _2651;
        float _2665 = abs(_2659);
        float _2667 = log2(_2665);
        float _2669 = _2641 * _2651;
        float _2671 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2673 = _2297 * _2663;
        float _2675 = -_2663;
        float _2677 = -_2671;
        float _2679 = fma(_2675, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2677);
        float _2681 = fma(_2279, _2661, _2673);
        float _2683 = -_2669;
        float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2679);
        float _2687 = fma(_2317, _2669, _2681);
        float _2689 = precise::clamp(_2687, 0.0, 1.0);
        float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2693 = _2685 + _2691;
        float _2695 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2697 = _2693 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2699 = precise::clamp(_2697, 0.0, 1.0);
        float _2701 = exp2(_2695);
        float _2703 = _2701 * _2699;
        float _2705 = _2689 * _2703;
        float _2707 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2709 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2711 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2707;
        out.m_90.y = _2709;
        out.m_90.z = _2711;
    }
    out.m_92.x = _2623;
    out.m_92.y = _2625;
    out.m_92.z = _2627;
    if (!_2607)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2713 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2713;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

