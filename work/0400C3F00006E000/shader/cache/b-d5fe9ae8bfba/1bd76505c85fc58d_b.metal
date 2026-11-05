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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1891 = false;
    bool _1014 = false;
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2256 = as_type<float>(_123);
        out.gl_Position.z = _2256;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2325 = as_type<float>(_161);
        out.gl_Position.z = _2325;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _165 = !_163;
    float _183;
    if (!_165)
    {
        float _167 = in.m_55.x;
        float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _175 = _173 * _169;
        float _177 = floor(_175);
        float _179 = -_177;
        float _181 = _175 + _179;
        _183 = _181;
        _185 = true;
    }
    else
    {
        float _187 = float(_107);
        float _189 = 1.0 / _187;
        float _191 = _141 * _189;
        _183 = _191;
    }
    _185 = false;
    float _193 = _183;
    float _195 = in.m_55.z;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _193 + _197;
    float _201 = in.m_55.y;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _209 = _207 != 0;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _213 = _211 != 0;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _217 = _215 != 0;
    float _219 = in.m_55.x;
    float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _223 = log2(_221);
    bool _225 = !_217;
    int _227 = _225 ? 0 : 1;
    int _229 = abs(_227);
    float _231 = 1.0 / _205;
    float _233 = _195 * 2.0;
    float _235 = _201 * 2.0;
    float _237 = floor(_233);
    float _239 = _219 * 2.0;
    float _241 = _199 * _231;
    float _243 = _201 + _195;
    float _245 = floor(_235);
    float _247 = _243 + (-1.0);
    bool _249 = _237 > 0.0;
    float _251 = floor(_239);
    bool _253 = _237 >= 0.0;
    bool _255 = isnan(_237);
    bool _257 = _253 || _255;
    bool _259 = isnan(0.0);
    bool _261 = _257 || _259;
    float _263 = _219 + _195;
    float _265 = _195 + (-0.5);
    int _267 = _261 ? 0 : 1;
    float _269 = _263 + (-1.0);
    bool _271 = _245 > 0.0;
    bool _273 = _245 >= 0.0;
    bool _275 = isnan(_245);
    bool _277 = _273 || _275;
    bool _279 = isnan(0.0);
    bool _281 = _277 || _279;
    int _283 = ~_267;
    int _285 = _283 + 1;
    int _287 = _285 + 1;
    int _289 = _287;
    if (!_249)
    {
        int _291 = ~_267;
        int _293 = _291 + 1;
        _289 = _293;
    }
    int _295 = _289;
    float _297 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _299 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _301 = _223 * _141;
    int _303 = _281 ? 0 : 1;
    bool _305 = _251 > 0.0;
    bool _307 = _251 >= 0.0;
    bool _309 = isnan(_251);
    bool _311 = _307 || _309;
    bool _313 = isnan(0.0);
    bool _315 = _311 || _313;
    float _317 = exp2(_301);
    int _319 = ~_303;
    int _321 = _319 + 1;
    int _323 = _321 + 1;
    bool _325 = !_209;
    int _327 = _325 ? 0 : 1;
    int _329 = _323;
    if (!_271)
    {
        int _331 = ~_303;
        int _333 = _331 + 1;
        _329 = _333;
    }
    int _335 = _329;
    float _337 = in.m_57.x;
    float _339 = in.m_57.y;
    float _341 = in.m_57.z;
    bool _343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(1.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _355 = 1.0 + _353;
    int _357 = abs(_327);
    float _359 = _219 + _201;
    float _361 = float(_295);
    float _363 = 1.0 / _355;
    float _365 = -_317;
    float _367 = _365 + 1.0;
    bool _369 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _371 = isnan(0.0);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _377 = _373 || _375;
    float _379 = _359 + (-1.0);
    float _381 = float(_357);
    float _383 = float(_229);
    float _385 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _387 = float(_335);
    float _389 = _381 * _361;
    float _391 = _377 ? _367 : 0.0;
    float _393 = as_type<float>(int(gl_VertexIndex));
    int _395 = _315 ? 0 : 1;
    float _397 = _383 * _387;
    float _399 = _389 * (-2.0);
    if (_351)
    {
        float _401 = _391 * _363;
        _145 = _401;
    }
    float _403 = _145;
    int _405 = ~_395;
    int _407 = _405 + 1;
    int _409 = _407 + 1;
    float _411 = _397 * (-2.0);
    float _413 = fma(_385, _399, _385);
    float _415 = fma(_399, _337, _337);
    float _417 = _219 + (-0.5);
    float _419 = fma(_299, _411, _299);
    float _421 = fma(_411, _341, _341);
    bool _423 = !_213;
    int _425 = _423 ? 0 : 1;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[196].x, _415);
    float _429 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[196].z, _421);
    int _431 = abs(_425);
    float _433 = fma(_413, _403, _427);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    int _439 = _409;
    if (!_305)
    {
        int _441 = ~_395;
        int _443 = _441 + 1;
        _439 = _443;
    }
    int _445 = _439;
    float _447 = _433 * 0.15915493667125701904296875;
    float _449 = float(_431);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = float(_445);
    float _457 = fma(_437, _241, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _459 = fma(_419, _403, _429);
    float _461 = fma(_453, _241, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _463 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _465 = isnan(_193);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = _449 * _455;
    bool _477 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_193);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = in.m_62.x;
    float _491 = in.m_62.y;
    float _493 = _459 * 0.15915493667125701904296875;
    float _495 = _475 * (-2.0);
    float _497 = -_473;
    float _499 = _497 + 1.0;
    float _501 = in.m_48.x;
    float _503 = in.m_48.y;
    float _505 = in.m_48.z;
    float _507 = _447 * 6.283185482025146484375;
    float _509 = sin(_507);
    float _511 = fma(_495, _339, _339);
    float _513 = _201 + (-0.5);
    float _515 = _487 * _499;
    float _517 = fma(_297, _495, _297);
    float _519 = -_487;
    float _521 = _519 + 1.0;
    float _523 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[196].y, _511);
    float _525 = _457 * _515;
    float _527 = _461 * _515;
    float _529 = _447 * 6.283185482025146484375;
    float _531 = cos(_529);
    float _533 = fma(_517, _403, _523);
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].x, _525);
    float _537 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].y, _527);
    int _539 = as_type<int>(_393) & 1;
    bool _541 = _539 != 0;
    int _543 = as_type<int>(_393) & 2;
    bool _545 = _543 != 0;
    float _547 = _533 * 0.15915493667125701904296875;
    float _549 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[144].x, _535);
    float _551 = _493 * 6.283185482025146484375;
    float _553 = sin(_551);
    float _555 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[144].y, _537);
    float _557 = _549 * _489;
    bool _559 = !_541;
    float _561 = _559 ? (-0.5) : 0.5;
    float _563 = _555 * _491;
    bool _565 = !_545;
    float _567 = _565 ? (-0.5) : 0.5;
    float _569 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _571 = _493 * 6.283185482025146484375;
    float _573 = cos(_571);
    float _575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _561);
    float _577 = _563 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _567);
    float _581 = _503 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = _569 * _575;
    bool _585 = _201 > 0.5;
    float _587 = _577 * _579;
    float _589 = _547 * 6.283185482025146484375;
    float _591 = cos(_589);
    float _593 = _509 * _553;
    float _595 = _531 * _553;
    float _597 = _503 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _599 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    bool _601 = _219 > 0.5;
    float _603 = _567 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _605 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[6].x, _597);
    float _607 = _547 * 6.283185482025146484375;
    float _609 = sin(_607);
    float _611 = _531 * _573;
    float _613 = _509 * _573;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _621 = _619 != 0;
    float _623 = -_567;
    int _625 = _585 ? as_type<int>(_623) : as_type<int>(_567);
    float _627 = _591 * _553;
    float _629 = _531 * _591;
    float _631 = _591 * _573;
    float _633 = _509 * _591;
    float _635 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _637 = fma(_609, _593, _611);
    float _639 = -_595;
    float _641 = fma(_609, _613, _639);
    float _643 = -_613;
    float _645 = fma(_609, _595, _643);
    float _647 = fma(_609, _611, _593);
    float _649 = _637 * _587;
    float _651 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _653 = _641 * _587;
    float _655 = _633 * _587;
    float _657 = fma(_627, _583, _649);
    float _659 = _633 * _603;
    float _661 = fma(_631, _583, _653);
    float _663 = _651 * _219;
    float _665 = fma(_645, _635, _657);
    float _667 = -_609;
    float _669 = fma(_667, _583, _655);
    float _671 = fma(_647, _635, _661);
    float _673 = fma(_505, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
    float _675 = _665 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _677 = _665 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _679 = trunc(_663);
    int _681 = int(_679);
    float _683 = fma(_505, (*spvDescriptorSet0.vp_c10)._m0[6].z, _605);
    float _685 = fma(_629, _635, _669);
    float _687 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[8].x, _675);
    float _689 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[10].x, _677);
    float _691 = _673 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _693 = _683 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c10)._m0[8].z, _687);
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c10)._m0[10].z, _689);
    float _699 = -_561;
    int _701 = _601 ? as_type<int>(_699) : as_type<int>(_561);
    float _703 = _665 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _705 = _691 + _695;
    float _707 = _693 + _697;
    float _709 = _641 * _603;
    float _711 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[9].x, _703);
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _715 = _705 + _713;
    float _717 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _719 = _707 + _717;
    int _721 = _681 << 4;
    int _723 = _721 + 1712;
    float _725 = fma(_685, (*spvDescriptorSet0.vp_c10)._m0[9].z, _711);
    float _727 = in.m_64.y;
    float _729 = _715 * _715;
    float _731 = _719 * _719;
    float _733 = _637 * _603;
    int _735 = _723 + 8;
    uint _738 = uint(int(uint(_735) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[int(_740)][_742];
    float _746 = _729 + _731;
    float _748 = sqrt(_746);
    uint _750 = uint(int(uint(_723) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[int(_760)][_762];
    float _766 = _503 + _727;
    bool _768 = !_621;
    float _770 = _768 ? _567 : as_type<float>(_625);
    float _772 = _561 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _774 = _748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _776 = _766 + _725;
    bool _778 = !_617;
    float _780 = _778 ? _561 : as_type<float>(_701);
    float _782 = -_609;
    float _784 = fma(_782, _772, _659);
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _788 = fma(_631, _772, _709);
    float _790 = fma(_627, _772, _733);
    float _792 = _627;
    float _794 = _561;
    float _796 = _609;
    float _798 = _733;
    float _800 = _631;
    float _802 = _705;
    if (!_774)
    {
        _792 = _731;
    }
    float _804 = _792;
    float _806 = _804;
    if (!_774)
    {
        _794 = _729;
    }
    float _808 = _794;
    float _810 = _808;
    if (!_774)
    {
        _796 = _705;
    }
    float _812 = _796;
    float _814 = _812;
    if (!_774)
    {
        _798 = _707;
    }
    float _816 = _798;
    float _818 = _816;
    if (!_774)
    {
        _800 = _776;
    }
    float _820 = _800;
    bool _822 = !_774;
    float _824 = _820;
    if (!_822)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _830 = _748 + _828;
        float _832 = _776 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _834 = rsqrt(_746);
        float _836 = _830 * _826;
        float _838 = _836 * 0.15915493667125701904296875;
        float _840 = _838 * 6.283185482025146484375;
        float _842 = sin(_840);
        float _844 = _838 * 6.283185482025146484375;
        float _846 = cos(_844);
        float _848 = fma(_842, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _850 = _834 * _848;
        float _852 = _846 + (-1.0);
        float _854 = fma(_715, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _856 = fma(_719, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _858 = _852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _862 = _854 + _860;
        float _864 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _866 = _856 + _864;
        float _868 = fma(_776, _846, _858);
        float _870 = _862 * _862;
        float _872 = _866 * _866;
        _824 = _868;
        _810 = _870;
        _806 = _872;
        _818 = _856;
        _814 = _854;
    }
    float _874 = _824;
    float _876 = _810;
    float _878 = _806;
    float _880 = _818;
    float _882 = _814;
    float _884 = _645 + _790;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _888 = _874 + _886;
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _892 = _780 + 0.5;
    float _894 = -_770;
    float _896 = _894 + 0.5;
    float _898 = fma(_888, _888, _876);
    float _900 = _647 + _788;
    float _902 = _892 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _904 = _884 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _906 = _898 + _878;
    float _908 = _884 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _910 = _884 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _912 = _902 * _786;
    float _914 = _896 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _916 = _629 + _784;
    float _918 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].x, _904);
    float _920 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[9].x, _908);
    float _922 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[10].x, _910);
    float _924 = sqrt(_906);
    float _926 = _914 * _890;
    float _928 = _744 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _930 = _756 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _932 = _764 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _940 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _944 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[8].z, _918);
    float _956 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[9].z, _920);
    float _958 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    out.m_66.x = _944;
    out.m_66.y = _946;
    out.m_66.z = _948;
    bool _960 = _924 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _962 = isnan(_924);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _968 = _964 || _966;
    out.m_68.x = _950;
    out.m_68.y = _952;
    out.m_68.z = _940;
    out.m_68.w = _942;
    out.m_70.x = _912;
    out.m_70.y = _926;
    out.m_72.x = _954;
    out.m_72.y = _956;
    out.m_72.z = _958;
    float _970 = _908;
    float _972 = _952;
    float _974 = _880;
    float _976 = _926;
    float _978 = _916;
    if (!_968)
    {
        _970 = 1.0;
    }
    float _980 = _970;
    bool _982 = !_968;
    float _984 = _980;
    if (!_982)
    {
        bool _986 = _924 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _988 = isnan(_924);
        bool _990 = _986 || _988;
        bool _992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _994 = _990 || _992;
        if (!_994)
        {
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _998 = _924 + _996;
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1002 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1000;
            float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1006 = _1004 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1008 = 1.0 / _1002;
            float _1010 = _998 * _1008;
            float _1012 = fma(_1010, _1006, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _984 = _1012;
            _972 = _1008;
            _1014 = true;
        }
        else
        {
            bool _1016 = _924 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1018 = isnan(_924);
            bool _1020 = _1016 || _1018;
            bool _1022 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1024 = _1020 || _1022;
            if (!_1024)
            {
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1028 = _924 + _1026;
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1032 = _1030 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1036 = _1034 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1038 = 1.0 / _1032;
                float _1040 = _1028 * _1038;
                float _1042 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _984 = _1042;
                _972 = _1038;
                _1014 = true;
            }
            else
            {
                _984 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1014 = false;
    float _1044 = _984;
    float _1046 = _972;
    float _1048 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1050 = _874 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1054 = _880 + _1052;
    bool _1056 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.5);
    bool _1064 = _1060 || _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1068 = _882 + _1066;
    float _1070 = fma(_1050, _1044, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1072 = fma(_1068, _1044, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1074 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1076 = _1068;
    float _1078 = _1046;
    float _1080 = _1050;
    if (_1064)
    {
        _1076 = _1072;
    }
    float _1082 = _1076;
    float _1084 = _1082;
    if (_1064)
    {
        _1078 = _1070;
    }
    float _1086 = _1078;
    float _1088 = _1086;
    if (_1064)
    {
        _1080 = _1074;
    }
    float _1090 = _1080;
    float _1092 = _1090;
    if (!_1064)
    {
        float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1096 = _766 + _1094;
        float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1100 = _691 + _1098;
        float _1102 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1104 = _1096 * _1096;
        float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1108 = _693 + _1106;
        float _1110 = fma(_1100, _1100, _1104);
        float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1114 = fma(_1108, _1108, _1110);
        float _1116 = sqrt(_1114);
        float _1118 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1120 = -_766;
        float _1122 = _1120 + _1070;
        float _1124 = precise::min(_1116, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1126 = _1124 * _1112;
        float _1128 = -_691;
        float _1130 = _1128 + _1072;
        float _1132 = _1118 * _1126;
        float _1134 = -_693;
        float _1136 = _1134 + _1074;
        float _1138 = fma(_1130, _1132, _691);
        float _1140 = fma(_1122, _1132, _766);
        float _1142 = fma(_1136, _1132, _693);
        _1088 = _1140;
        _1084 = _1138;
        _1092 = _1142;
        _974 = _1116;
    }
    float _1144 = _1088;
    float _1146 = _1084;
    float _1148 = _1092;
    float _1150 = _974;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1154 = _1144 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1158 = _1146 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _1148 + _1160;
    float _1164 = _1154 * _1154;
    float _1166 = fma(_1158, _1158, _1164);
    float _1168 = fma(_1162, _1162, _1166);
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1172 = rsqrt(_1168);
    float _1174 = sqrt(_1168);
    float _1176 = _1158 * _1172;
    float _1178 = _1162 * _1172;
    float _1180 = _1154 * _1172;
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1186 = _1182 * _1182;
    float _1188 = _1184 * _1184;
    float _1190 = _1186 + _1188;
    float _1192 = sqrt(_1190);
    bool _1194 = _1192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1198 = _1192 + _1196;
    float _1200 = _912;
    float _1202 = _1190;
    float _1204 = _1198;
    float _1206 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1208 = _1162;
    if (_1194)
    {
        float _1210 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1210;
    }
    float _1212 = _1200;
    if (_1194)
    {
        float _1214 = rsqrt(_1190);
        _1202 = _1214;
    }
    float _1216 = _1202;
    float _1218 = _1216;
    if (_1194)
    {
        float _1220 = _1198 * _1212;
        _1204 = _1220;
    }
    float _1222 = _1204;
    if (_1194)
    {
        float _1224 = _1222 * 0.15915493667125701904296875;
        _976 = _1224;
    }
    float _1226 = _976;
    float _1228 = _1150;
    float _1230 = _1226;
    if (_1194)
    {
        float _1232 = _1226 * 6.283185482025146484375;
        float _1234 = sin(_1232);
        _1228 = _1234;
    }
    float _1236 = _1228;
    float _1238 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1240 = precise::max(0.0, _1238);
    float _1242 = _922;
    float _1244 = _1240;
    if (_1194)
    {
        float _1246 = _1226 * 6.283185482025146484375;
        float _1248 = cos(_1246);
        _1242 = _1248;
    }
    float _1250 = _1242;
    float _1252 = fma(_691, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1254 = -_1180;
    float _1256 = -_1240;
    float _1258 = fma(_1254, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1256);
    if (_1194)
    {
        float _1260 = _1258 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1244 = _1260;
    }
    float _1262 = _1244;
    float _1264 = _1236;
    if (_1194)
    {
        float _1266 = fma(_1236, _1262, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1206 = _1266;
    }
    float _1268 = _1206;
    float _1270 = _1268;
    if (!_1194)
    {
        _1264 = _1182;
    }
    float _1272 = _1264;
    float _1274 = floor(_1252);
    float _1276 = _1272;
    float _1278 = _1250;
    if (_1194)
    {
        float _1280 = _1250 + (-1.0);
        _1230 = _1280;
    }
    float _1282 = _1230;
    float _1284 = _1282;
    if (_1194)
    {
        float _1286 = _1216 * _1268;
        _802 = _1286;
    }
    float _1288 = _802;
    if (!_1194)
    {
        _1270 = _1258;
    }
    float _1290 = _1270;
    float _1292 = _1290;
    if (_1194)
    {
        float _1294 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _978 = _1294;
    }
    float _1296 = _978;
    if (_1194)
    {
        float _1298 = _1182 * _1288;
        _1276 = _1298;
    }
    float _1300 = _1276;
    if (!_1194)
    {
        _1218 = _1184;
    }
    float _1302 = _1218;
    float _1304 = _1302;
    if (_1194)
    {
        float _1306 = _1184 * _1288;
        _1304 = _1306;
    }
    float _1308 = _1304;
    if (!_1194)
    {
        _1284 = _1186;
    }
    float _1310 = _1284;
    float _1312 = _1310;
    if (_1194)
    {
        float _1314 = fma(_1258, _1250, _1296);
        _1292 = _1314;
    }
    float _1316 = _1292;
    if (_1194)
    {
        float _1318 = _1300 * _1300;
        _1312 = _1318;
    }
    float _1320 = _1312;
    if (!_1194)
    {
        _1278 = _1188;
    }
    float _1322 = _1278;
    float _1324 = _1322;
    if (_1194)
    {
        float _1326 = _1308 * _1308;
        _1324 = _1326;
    }
    float _1328 = _1324;
    float _1330 = fma(_1316, _1316, _1320);
    float _1332 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1338 = fma(_1174, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1336);
    float _1340 = precise::clamp(_1338, 0.0, 1.0);
    float _1342 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1344 = _1330 + _1328;
    float _1346 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1348 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1350 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1352 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1334);
    float _1354 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1346);
    float _1356 = rsqrt(_1344);
    float _1358 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1348);
    float _1360 = -_1340;
    float _1362 = _1360 + 1.0;
    float _1364 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1366 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1350);
    float _1368 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1358);
    float _1370 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1372 = abs(_1362);
    float _1374 = log2(_1372);
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1378 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1382 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1352);
    float _1384 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1380);
    float _1388 = _1356 * _1300;
    float _1390 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1392 = _1356 * _1316;
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1386);
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1398 = _1356 * _1308;
    float _1400 = floor(_1342);
    float _1402 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1394);
    float _1404 = -_1396;
    float _1406 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1410 = -_1384;
    float _1412 = fma(_1410, _1170, 1.0);
    float _1414 = -_1398;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1418 = -_1274;
    float _1420 = _1252 + _1418;
    float _1422 = 1.0 / _1402;
    float _1424 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1426 = fma(_1416, -0.5, 0.5);
    float _1428 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1430 = fma(_1416, 0.5, 0.5);
    float _1432 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1424);
    float _1434 = _1392 + 1.0;
    float _1436 = exp2(_1408);
    float _1438 = -_1400;
    float _1440 = _1342 + _1438;
    float _1442 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1428);
    float _1444 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1432);
    float _1446 = fma(_1430, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1448 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1442);
    float _1450 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1452 = sqrt(_1426);
    float _1454 = fma(_1430, _1446, -0.212114393711090087890625);
    float _1456 = _1450 * _1422;
    float _1458 = fma(_1430, _1454, 1.570728778839111328125);
    float _1460 = log2(_1412);
    float _1462 = -_1392;
    float _1464 = fma(_1436, _1434, _1462);
    float _1466 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1448);
    float _1468 = _1466 * _1422;
    float _1470 = _1452 * 0.636619746685028076171875;
    float _1472 = fma(_1456, 0.5, 0.5);
    float _1474 = fma(_1468, -0.5, 0.5);
    float _1476 = -_1458;
    float _1478 = fma(_1470, _1476, 1.0);
    float _1480 = fma(_1464, 0.5, 0.5);
    float _1482 = _1460 * 0.693147182464599609375;
    float2 _4438 = float2(_1420, _1440);
    float _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4438, float2(0.0), isnan(_4438)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4438, float2(0.0), isnan(_4438)), level(0.0)).x;
    float _1486 = _1482 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4453 = float3(_1472, _1474, _1486);
    float _1488 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4453, float3(0.0), isnan(_4453)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4453, float3(0.0), isnan(_4453)), level(0.0)).x;
    float3 _4464 = float3(_1472, _1474, _1486);
    float4 _1491 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4464, float3(0.0), isnan(_4464)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4464, float3(0.0), isnan(_4464)), level(0.0)).xyzw;
    float _1493 = _1491.x;
    float _1495 = _1491.y;
    float _1497 = _1491.z;
    float _1499 = _1491.w;
    float2 _4480 = float2(_1478, _1480);
    float3 _1503 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4480, float2(0.0), isnan(_4480)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4480, float2(0.0), isnan(_4480)), level(0.0)).xyz;
    float _1505 = _1503.x;
    float _1507 = _1503.y;
    float _1509 = _1503.z;
    float _1511 = _766 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1513 = _766 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1515 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_74.x = _1158;
    out.m_74.y = _1154;
    out.m_74.z = _1162;
    float _1517 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1511);
    float _1519 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1513);
    float _1521 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1517);
    float _1523 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1519);
    float _1525 = exp2(_1515);
    float _1527 = _1521 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1529 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1531 = _1529 + _1527;
    bool _1533 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan(0.5);
    bool _1541 = _1537 || _1539;
    float _1543 = 1.0 / _1527;
    float _1545 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1547 = in.m_64.x;
    float _1549 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1545);
    float _1551 = _1402;
    if (_1541)
    {
        _1208 = 1.0;
    }
    float _1553 = _1208;
    float _1555 = _1531 * _1543;
    float _1557 = _1555 * 0.5;
    float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1561 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1559);
    float _1563 = 1.0 / _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1567 = _1563 * _1565;
    float _1569 = abs(_1567);
    float _1571 = log2(_1569);
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1575 = exp2(_1573);
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1579 = precise::clamp(_1577, 0.0, 1.0);
    float _1581 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1549);
    bool _1583 = _1567 <= 8000.0;
    bool _1585 = isnan(_1567);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan(8000.0);
    bool _1591 = _1587 || _1589;
    float _1593 = float(_1591);
    float _1595 = fma(_1579, -2.0, 3.0);
    float _1597 = _1579 * _1579;
    float _1599 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1581);
    float _1601 = _1597 * _1595;
    float _1603 = _1599 + _1402;
    float _1605 = -_1601;
    float _1607 = _1605 + 1.0;
    float _1609 = _1603 * 0.5;
    float _1611 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1601);
    float _1613 = _1607;
    float _1615 = _1553;
    float _1617 = _1609;
    if (_1541)
    {
        _1613 = 1.0;
    }
    float _1619 = _1613;
    float _1621 = _1619;
    float _1623 = _1497;
    float _1625 = _1507;
    float _1627 = _1505;
    if (!_1541)
    {
        float _1629 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1633 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1631;
        float _1635 = _1629 * 0.15915493667125701904296875;
        float _1637 = _1635 * 6.283185482025146484375;
        float _1639 = cos(_1637);
        float _1641 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1643 = _1641 * 0.15915493667125701904296875;
        float _1645 = _1635 * 6.283185482025146484375;
        float _1647 = sin(_1645);
        float _1649 = 1.0 / _1639;
        float _1651 = _1643 * 6.283185482025146484375;
        float _1653 = cos(_1651);
        float _1655 = _1647 * _1649;
        float _1657 = _1643 * 6.283185482025146484375;
        float _1659 = sin(_1657);
        float _1661 = _1653 * _1655;
        float _1663 = 1.0 / _1633;
        float _1665 = 1.0 / _1661;
        float _1667 = _1659 * _1665;
        float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1671 = fma(_1567, _1667, _1669);
        float _1673 = _1671 * _1663;
        float _1675 = precise::clamp(_1673, 0.0, 1.0);
        _1621 = _1675;
    }
    float _1677 = _1621;
    if (!_1541)
    {
        float _1679 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1681 = _1679 * 0.15915493667125701904296875;
        float _1683 = _1681 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1689 = _1687 * 0.15915493667125701904296875;
        float _1691 = _1681 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        float _1695 = 1.0 / _1685;
        float _1697 = _1689 * 6.283185482025146484375;
        float _1699 = cos(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = _1689 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1699 * _1701;
        float _1709 = 1.0 / _1707;
        float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1713 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1711;
        float _1715 = 1.0 / _1713;
        float _1717 = _1705 * _1709;
        float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1721 = fma(_1567, _1717, _1719);
        float _1723 = _1721 * _1715;
        float _1725 = precise::clamp(_1723, 0.0, 1.0);
        float _1727 = -_1725;
        float _1729 = _1727 + 1.0;
        _1615 = _1729;
    }
    float _1731 = _1615;
    float _1733 = _1593 * _1611;
    float _1735 = -_1525;
    float _1737 = _1735 + 1.0;
    float _1739 = -_1484;
    float _1741 = _1739 + 1.0;
    float _1743 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1745 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1450;
    out.gl_Position.y = _1466;
    out.gl_Position.z = _1599;
    out.gl_Position.w = _1402;
    bool _1747 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1749 = isnan(_1174);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1755 = _1751 || _1753;
    float _1757 = _1741 * _1743;
    float _1759 = precise::clamp(_1757, 0.0, 1.0);
    float _1761 = _1745 * _1488;
    float _1763 = -_1745;
    float _1765 = _1763 + 1.0;
    out.m_76.x = _1146;
    out.m_76.y = _1144;
    out.m_76.z = _1148;
    float _1767 = -_1759;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1771 = _1499 * _1761;
    out.m_78.z = _1609;
    out.m_78.w = _1402;
    float _1773 = _1769 * _1547;
    float _1775 = _1509 * _1761;
    float _1777 = fma(_1505, _1771, _1493);
    float _1779 = fma(_1507, _1771, _1495);
    float _1781 = _1499 * _1765;
    float _1783 = _1773 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1785 = fma(_1499, _1775, _1497);
    float _1787 = _1677 * _1731;
    float _1789 = _1771;
    if (!_1755)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1791 = _1623;
    out.m_80.x = _1783;
    float _1793 = _1791;
    float _1795 = _1791;
    if (!_1755)
    {
        _1625 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1797 = _1625;
    float _1799 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1801 = _1797;
    float _1803 = _1797;
    if (!_1755)
    {
        _1627 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1805 = _1627;
    out.m_82.x = _1777;
    out.m_82.y = _1779;
    out.m_82.z = _1785;
    out.m_82.w = _1781;
    float _1807 = _1805;
    float _1809 = _1805;
    if (!_1755)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1811 = _1551;
    float _1813 = _1811;
    float _1815 = _1811;
    if (!_1755)
    {
        _1617 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1817 = _1617;
    float _1819 = _1817;
    float _1821 = _1817;
    if (!_1755)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1823 = _1789;
    bool _1825 = !_1755;
    float _1827 = _1823;
    float _1829 = _1823;
    if (!_1825)
    {
        bool _1831 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1833 = isnan(_1174);
        bool _1835 = _1831 || _1833;
        bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1839 = _1835 || _1837;
        if (!_1839)
        {
            float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1843 = _1174 + _1841;
            float _1845 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1847 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1845;
            float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1851 = _1849 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1853 = 1.0 / _1847;
            float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1865 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1871 = _1843 * _1853;
            float _1873 = precise::clamp(_1871, 0.0, 1.0);
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1879 = fma(_1873, _1851, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1881 = fma(_1873, _1877, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1883 = fma(_1873, _1857, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1885 = fma(_1873, _1861, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1887 = fma(_1873, _1865, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1889 = fma(_1873, _1869, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1803 = _1883;
            _1821 = _1887;
            _1795 = _1879;
            _1815 = _1885;
            _1809 = _1881;
            _1829 = _1889;
            _1891 = true;
        }
        else
        {
            bool _1893 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1895 = isnan(_1174);
            bool _1897 = _1893 || _1895;
            bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1901 = _1897 || _1899;
            if (!_1901)
            {
                _1793 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1903 = _1793;
            _1795 = _1903;
            if (!_1901)
            {
                _1801 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1905 = _1801;
            _1803 = _1905;
            if (!_1901)
            {
                _1807 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1907 = _1807;
            _1809 = _1907;
            if (!_1901)
            {
                _1813 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1909 = _1813;
            _1815 = _1909;
            if (!_1901)
            {
                _1819 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1911 = _1819;
            _1821 = _1911;
            if (!_1901)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1913 = _1827;
            bool _1915 = !_1901;
            _1829 = _1913;
            if (!_1915)
            {
                bool _1917 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1919 = isnan(_1174);
                bool _1921 = _1917 || _1919;
                bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1925 = _1921 || _1923;
                if (!_1925)
                {
                    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1929 = _1174 + _1927;
                    float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1931;
                    float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1937 = _1935 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1939 = 1.0 / _1933;
                    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1947 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1951 = _1949 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1957 = _1929 * _1939;
                    float _1959 = precise::clamp(_1957, 0.0, 1.0);
                    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1965 = fma(_1959, _1937, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1967 = fma(_1959, _1963, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1969 = fma(_1959, _1943, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1971 = fma(_1959, _1947, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1973 = fma(_1959, _1951, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1975 = fma(_1959, _1955, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1803 = _1969;
                    _1821 = _1973;
                    _1795 = _1965;
                    _1815 = _1971;
                    _1809 = _1967;
                    _1829 = _1975;
                    _1891 = true;
                }
                else
                {
                    _1803 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1821 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1795 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1815 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1809 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1891 = false;
    float _1977 = _1803;
    float _1979 = _1821;
    float _1981 = _1795;
    float _1983 = _1815;
    float _1985 = _1809;
    float _1987 = _1829;
    float _1989 = fma(_956, -0.5, 0.5);
    float _1991 = precise::clamp(_1989, 0.0, 1.0);
    float _1993 = -_1977;
    float _1995 = _1993 + _1979;
    float _1997 = _1799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1999 = -_1981;
    float _2001 = _1999 + _1983;
    float _2003 = fma(_1991, _1995, _1977);
    out.m_84.x = 0.0;
    float _2005 = -_1985;
    float _2007 = _2005 + _1987;
    float _2009 = fma(_1991, _2001, _1981);
    float _2011 = _2003 * 0.586610972881317138671875;
    out.m_51.x = _1997;
    bool _2013 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2015 = fma(_1991, _2007, _1985);
    float _2017 = fma(_2009, 0.298911988735198974609375, _2011);
    bool _2019 = _1677 > 0.0;
    bool _2021 = isnan(_1677);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan(0.0);
    bool _2027 = _2023 || _2025;
    float _2029 = fma(_2015, 0.114477999508380889892578125, _2017);
    out.m_86.x = 0.0;
    bool _2031 = _1731 <= 0.0;
    bool _2033 = !_2027;
    bool _2035 = _2031 || _2033;
    float _2037 = -_2029;
    float _2039 = _2009 + _2037;
    float _2041 = -_2029;
    float _2043 = _2003 + _2041;
    float _2045 = -_2029;
    float _2047 = _2015 + _2045;
    float _2049 = fma(_2039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2051 = fma(_2043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2053 = fma(_2047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    bool _2055 = !_2013;
    if (!_2055)
    {
        float _2057 = -_1144;
        float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2061 = -_1146;
        float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2065 = -_1148;
        float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2069 = _2059 * _2059;
        float _2071 = fma(_2063, _2063, _2069);
        float _2073 = fma(_2067, _2067, _2071);
        float _2075 = rsqrt(_2073);
        float _2077 = _2059 * _2075;
        float _2079 = _2063 * _2075;
        float _2081 = _2067 * _2075;
        float _2083 = -_1180;
        float _2085 = _2083 + _2077;
        float _2087 = -_1176;
        float _2089 = _2087 + _2079;
        float _2091 = -_1178;
        float _2093 = _2091 + _2081;
        float _2095 = sqrt(_2073);
        float _2097 = _2085 * _2085;
        float _2099 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2101 = precise::clamp(_2099, 0.0, 1.0);
        float _2103 = fma(_2089, _2089, _2097);
        float _2105 = _2101 * _2101;
        float _2107 = fma(_2093, _2093, _2103);
        float _2109 = rsqrt(_2107);
        float _2111 = -_2095;
        float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2115 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2117 = precise::clamp(_2115, 0.0, 1.0);
        float _2119 = abs(_2117);
        float _2121 = log2(_2119);
        float _2123 = _2085 * _2109;
        float _2125 = _2089 * _2109;
        float _2127 = _2093 * _2109;
        float _2129 = _2105 + (-1.0);
        float _2131 = _956 * _2123;
        float _2133 = _956 * _2077;
        float _2135 = fma(_954, _2125, _2131);
        float _2137 = fma(_954, _2079, _2133);
        float _2139 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2141 = fma(_958, _2127, _2135);
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        float _2145 = fma(_958, _2081, _2137);
        float _2147 = precise::clamp(_2145, 0.0, 1.0);
        float _2149 = _2143 * _2143;
        float _2151 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2153 = exp2(_2139);
        float _2155 = fma(_2149, _2129, 1.0);
        float _2157 = -_2077;
        float _2159 = -_2151;
        float _2161 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2159);
        float _2163 = _2155 * _2155;
        float _2165 = -_2081;
        float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2161);
        float _2169 = 1.0 / _2163;
        float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2173 = _2167 + _2171;
        float _2175 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = _2153 * _2177;
        float _2181 = _2147 * _2179;
        float _2183 = _2105 * _2169;
        float _2185 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2187 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2189 = _2181 * _2183;
        float _2191 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2193 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2195 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2197 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2185;
        out.m_84.y = _2191;
        out.m_84.z = _2187;
        out.m_86.x = _2193;
        out.m_86.y = _2195;
        out.m_86.z = _2197;
    }
    out.m_88.x = _2049;
    out.m_88.y = _2051;
    out.m_88.z = _2053;
    if (!_2035)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2199 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2199;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1891 = false;
    bool _1014 = false;
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2256 = as_type<float>(_123);
        out.gl_Position.z = _2256;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2325 = as_type<float>(_161);
        out.gl_Position.z = _2325;
    }
    if (_155)
    {
        return out;
    }
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _165 = !_163;
    float _183;
    if (!_165)
    {
        float _167 = in.m_55.x;
        float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _175 = _173 * _169;
        float _177 = floor(_175);
        float _179 = -_177;
        float _181 = _175 + _179;
        _183 = _181;
        _185 = true;
    }
    else
    {
        float _187 = float(_107);
        float _189 = 1.0 / _187;
        float _191 = _141 * _189;
        _183 = _191;
    }
    _185 = false;
    float _193 = _183;
    float _195 = in.m_55.z;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _193 + _197;
    float _201 = in.m_55.y;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _209 = _207 != 0;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _213 = _211 != 0;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _217 = _215 != 0;
    float _219 = in.m_55.x;
    float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _223 = log2(_221);
    bool _225 = !_217;
    int _227 = _225 ? 0 : 1;
    int _229 = abs(_227);
    float _231 = 1.0 / _205;
    float _233 = _195 * 2.0;
    float _235 = _201 * 2.0;
    float _237 = floor(_233);
    float _239 = _219 * 2.0;
    float _241 = _199 * _231;
    float _243 = _201 + _195;
    float _245 = floor(_235);
    float _247 = _243 + (-1.0);
    bool _249 = _237 > 0.0;
    float _251 = floor(_239);
    bool _253 = _237 >= 0.0;
    bool _255 = isnan(_237);
    bool _257 = _253 || _255;
    bool _259 = isnan(0.0);
    bool _261 = _257 || _259;
    float _263 = _219 + _195;
    float _265 = _195 + (-0.5);
    int _267 = _261 ? 0 : 1;
    float _269 = _263 + (-1.0);
    bool _271 = _245 > 0.0;
    bool _273 = _245 >= 0.0;
    bool _275 = isnan(_245);
    bool _277 = _273 || _275;
    bool _279 = isnan(0.0);
    bool _281 = _277 || _279;
    int _283 = ~_267;
    int _285 = _283 + 1;
    int _287 = _285 + 1;
    int _289 = _287;
    if (!_249)
    {
        int _291 = ~_267;
        int _293 = _291 + 1;
        _289 = _293;
    }
    int _295 = _289;
    float _297 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _299 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _301 = _223 * _141;
    int _303 = _281 ? 0 : 1;
    bool _305 = _251 > 0.0;
    bool _307 = _251 >= 0.0;
    bool _309 = isnan(_251);
    bool _311 = _307 || _309;
    bool _313 = isnan(0.0);
    bool _315 = _311 || _313;
    float _317 = exp2(_301);
    int _319 = ~_303;
    int _321 = _319 + 1;
    int _323 = _321 + 1;
    bool _325 = !_209;
    int _327 = _325 ? 0 : 1;
    int _329 = _323;
    if (!_271)
    {
        int _331 = ~_303;
        int _333 = _331 + 1;
        _329 = _333;
    }
    int _335 = _329;
    float _337 = in.m_57.x;
    float _339 = in.m_57.y;
    float _341 = in.m_57.z;
    bool _343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(1.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _355 = 1.0 + _353;
    int _357 = abs(_327);
    float _359 = _219 + _201;
    float _361 = float(_295);
    float _363 = 1.0 / _355;
    float _365 = -_317;
    float _367 = _365 + 1.0;
    bool _369 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _371 = isnan(0.0);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _377 = _373 || _375;
    float _379 = _359 + (-1.0);
    float _381 = float(_357);
    float _383 = float(_229);
    float _385 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _387 = float(_335);
    float _389 = _381 * _361;
    float _391 = _377 ? _367 : 0.0;
    float _393 = as_type<float>(int(gl_VertexIndex));
    int _395 = _315 ? 0 : 1;
    float _397 = _383 * _387;
    float _399 = _389 * (-2.0);
    if (_351)
    {
        float _401 = _391 * _363;
        _145 = _401;
    }
    float _403 = _145;
    int _405 = ~_395;
    int _407 = _405 + 1;
    int _409 = _407 + 1;
    float _411 = _397 * (-2.0);
    float _413 = fma(_385, _399, _385);
    float _415 = fma(_399, _337, _337);
    float _417 = _219 + (-0.5);
    float _419 = fma(_299, _411, _299);
    float _421 = fma(_411, _341, _341);
    bool _423 = !_213;
    int _425 = _423 ? 0 : 1;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[196].x, _415);
    float _429 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[196].z, _421);
    int _431 = abs(_425);
    float _433 = fma(_413, _403, _427);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    int _439 = _409;
    if (!_305)
    {
        int _441 = ~_395;
        int _443 = _441 + 1;
        _439 = _443;
    }
    int _445 = _439;
    float _447 = _433 * 0.15915493667125701904296875;
    float _449 = float(_431);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = float(_445);
    float _457 = fma(_437, _241, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _459 = fma(_419, _403, _429);
    float _461 = fma(_453, _241, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _463 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _465 = isnan(_193);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = _449 * _455;
    bool _477 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_193);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = in.m_62.x;
    float _491 = in.m_62.y;
    float _493 = _459 * 0.15915493667125701904296875;
    float _495 = _475 * (-2.0);
    float _497 = -_473;
    float _499 = _497 + 1.0;
    float _501 = in.m_48.x;
    float _503 = in.m_48.y;
    float _505 = in.m_48.z;
    float _507 = _447 * 6.283185482025146484375;
    float _509 = sin(_507);
    float _511 = fma(_495, _339, _339);
    float _513 = _201 + (-0.5);
    float _515 = _487 * _499;
    float _517 = fma(_297, _495, _297);
    float _519 = -_487;
    float _521 = _519 + 1.0;
    float _523 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[196].y, _511);
    float _525 = _457 * _515;
    float _527 = _461 * _515;
    float _529 = _447 * 6.283185482025146484375;
    float _531 = cos(_529);
    float _533 = fma(_517, _403, _523);
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].x, _525);
    float _537 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].y, _527);
    int _539 = as_type<int>(_393) & 1;
    bool _541 = _539 != 0;
    int _543 = as_type<int>(_393) & 2;
    bool _545 = _543 != 0;
    float _547 = _533 * 0.15915493667125701904296875;
    float _549 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[144].x, _535);
    float _551 = _493 * 6.283185482025146484375;
    float _553 = sin(_551);
    float _555 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[144].y, _537);
    float _557 = _549 * _489;
    bool _559 = !_541;
    float _561 = _559 ? (-0.5) : 0.5;
    float _563 = _555 * _491;
    bool _565 = !_545;
    float _567 = _565 ? (-0.5) : 0.5;
    float _569 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _571 = _493 * 6.283185482025146484375;
    float _573 = cos(_571);
    float _575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _561);
    float _577 = _563 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _567);
    float _581 = _503 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = _569 * _575;
    bool _585 = _201 > 0.5;
    float _587 = _577 * _579;
    float _589 = _547 * 6.283185482025146484375;
    float _591 = cos(_589);
    float _593 = _509 * _553;
    float _595 = _531 * _553;
    float _597 = _503 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _599 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    bool _601 = _219 > 0.5;
    float _603 = _567 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _605 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[6].x, _597);
    float _607 = _547 * 6.283185482025146484375;
    float _609 = sin(_607);
    float _611 = _531 * _573;
    float _613 = _509 * _573;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _621 = _619 != 0;
    float _623 = -_567;
    int _625 = _585 ? as_type<int>(_623) : as_type<int>(_567);
    float _627 = _591 * _553;
    float _629 = _531 * _591;
    float _631 = _591 * _573;
    float _633 = _509 * _591;
    float _635 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _637 = fma(_609, _593, _611);
    float _639 = -_595;
    float _641 = fma(_609, _613, _639);
    float _643 = -_613;
    float _645 = fma(_609, _595, _643);
    float _647 = fma(_609, _611, _593);
    float _649 = _637 * _587;
    float _651 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _653 = _641 * _587;
    float _655 = _633 * _587;
    float _657 = fma(_627, _583, _649);
    float _659 = _633 * _603;
    float _661 = fma(_631, _583, _653);
    float _663 = _651 * _219;
    float _665 = fma(_645, _635, _657);
    float _667 = -_609;
    float _669 = fma(_667, _583, _655);
    float _671 = fma(_647, _635, _661);
    float _673 = fma(_505, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
    float _675 = _665 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _677 = _665 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _679 = trunc(_663);
    int _681 = int(_679);
    float _683 = fma(_505, (*spvDescriptorSet0.vp_c10)._m0[6].z, _605);
    float _685 = fma(_629, _635, _669);
    float _687 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[8].x, _675);
    float _689 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[10].x, _677);
    float _691 = _673 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _693 = _683 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c10)._m0[8].z, _687);
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c10)._m0[10].z, _689);
    float _699 = -_561;
    int _701 = _601 ? as_type<int>(_699) : as_type<int>(_561);
    float _703 = _665 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _705 = _691 + _695;
    float _707 = _693 + _697;
    float _709 = _641 * _603;
    float _711 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[9].x, _703);
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _715 = _705 + _713;
    float _717 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _719 = _707 + _717;
    int _721 = _681 << 4;
    int _723 = _721 + 1712;
    float _725 = fma(_685, (*spvDescriptorSet0.vp_c10)._m0[9].z, _711);
    float _727 = in.m_64.y;
    float _729 = _715 * _715;
    float _731 = _719 * _719;
    float _733 = _637 * _603;
    int _735 = _723 + 8;
    uint _738 = uint(int(uint(_735) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[int(_740)][_742];
    float _746 = _729 + _731;
    float _748 = sqrt(_746);
    uint _750 = uint(int(uint(_723) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[int(_760)][_762];
    float _766 = _503 + _727;
    bool _768 = !_621;
    float _770 = _768 ? _567 : as_type<float>(_625);
    float _772 = _561 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _774 = _748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _776 = _766 + _725;
    bool _778 = !_617;
    float _780 = _778 ? _561 : as_type<float>(_701);
    float _782 = -_609;
    float _784 = fma(_782, _772, _659);
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _788 = fma(_631, _772, _709);
    float _790 = fma(_627, _772, _733);
    float _792 = _627;
    float _794 = _561;
    float _796 = _609;
    float _798 = _733;
    float _800 = _631;
    float _802 = _705;
    if (!_774)
    {
        _792 = _731;
    }
    float _804 = _792;
    float _806 = _804;
    if (!_774)
    {
        _794 = _729;
    }
    float _808 = _794;
    float _810 = _808;
    if (!_774)
    {
        _796 = _705;
    }
    float _812 = _796;
    float _814 = _812;
    if (!_774)
    {
        _798 = _707;
    }
    float _816 = _798;
    float _818 = _816;
    if (!_774)
    {
        _800 = _776;
    }
    float _820 = _800;
    bool _822 = !_774;
    float _824 = _820;
    if (!_822)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _830 = _748 + _828;
        float _832 = _776 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _834 = rsqrt(_746);
        float _836 = _830 * _826;
        float _838 = _836 * 0.15915493667125701904296875;
        float _840 = _838 * 6.283185482025146484375;
        float _842 = sin(_840);
        float _844 = _838 * 6.283185482025146484375;
        float _846 = cos(_844);
        float _848 = fma(_842, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _850 = _834 * _848;
        float _852 = _846 + (-1.0);
        float _854 = fma(_715, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _856 = fma(_719, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _858 = _852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _862 = _854 + _860;
        float _864 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _866 = _856 + _864;
        float _868 = fma(_776, _846, _858);
        float _870 = _862 * _862;
        float _872 = _866 * _866;
        _824 = _868;
        _810 = _870;
        _806 = _872;
        _818 = _856;
        _814 = _854;
    }
    float _874 = _824;
    float _876 = _810;
    float _878 = _806;
    float _880 = _818;
    float _882 = _814;
    float _884 = _645 + _790;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _888 = _874 + _886;
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _892 = _780 + 0.5;
    float _894 = -_770;
    float _896 = _894 + 0.5;
    float _898 = fma(_888, _888, _876);
    float _900 = _647 + _788;
    float _902 = _892 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _904 = _884 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _906 = _898 + _878;
    float _908 = _884 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _910 = _884 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _912 = _902 * _786;
    float _914 = _896 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _916 = _629 + _784;
    float _918 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].x, _904);
    float _920 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[9].x, _908);
    float _922 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[10].x, _910);
    float _924 = sqrt(_906);
    float _926 = _914 * _890;
    float _928 = _744 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _930 = _756 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _932 = _764 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _940 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _944 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[8].z, _918);
    float _956 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[9].z, _920);
    float _958 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    out.m_66.x = _944;
    out.m_66.y = _946;
    out.m_66.z = _948;
    bool _960 = _924 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _962 = isnan(_924);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _968 = _964 || _966;
    out.m_68.x = _950;
    out.m_68.y = _952;
    out.m_68.z = _940;
    out.m_68.w = _942;
    out.m_70.x = _912;
    out.m_70.y = _926;
    out.m_72.x = _954;
    out.m_72.y = _956;
    out.m_72.z = _958;
    float _970 = _908;
    float _972 = _952;
    float _974 = _880;
    float _976 = _926;
    float _978 = _916;
    if (!_968)
    {
        _970 = 1.0;
    }
    float _980 = _970;
    bool _982 = !_968;
    float _984 = _980;
    if (!_982)
    {
        bool _986 = _924 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _988 = isnan(_924);
        bool _990 = _986 || _988;
        bool _992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _994 = _990 || _992;
        if (!_994)
        {
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _998 = _924 + _996;
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1002 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1000;
            float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1006 = _1004 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1008 = 1.0 / _1002;
            float _1010 = _998 * _1008;
            float _1012 = fma(_1010, _1006, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _984 = _1012;
            _972 = _1008;
            _1014 = true;
        }
        else
        {
            bool _1016 = _924 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1018 = isnan(_924);
            bool _1020 = _1016 || _1018;
            bool _1022 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1024 = _1020 || _1022;
            if (!_1024)
            {
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1028 = _924 + _1026;
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1032 = _1030 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1036 = _1034 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1038 = 1.0 / _1032;
                float _1040 = _1028 * _1038;
                float _1042 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _984 = _1042;
                _972 = _1038;
                _1014 = true;
            }
            else
            {
                _984 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1014 = false;
    float _1044 = _984;
    float _1046 = _972;
    float _1048 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1050 = _874 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1054 = _880 + _1052;
    bool _1056 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.5);
    bool _1064 = _1060 || _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1068 = _882 + _1066;
    float _1070 = fma(_1050, _1044, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1072 = fma(_1068, _1044, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1074 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1076 = _1068;
    float _1078 = _1046;
    float _1080 = _1050;
    if (_1064)
    {
        _1076 = _1072;
    }
    float _1082 = _1076;
    float _1084 = _1082;
    if (_1064)
    {
        _1078 = _1070;
    }
    float _1086 = _1078;
    float _1088 = _1086;
    if (_1064)
    {
        _1080 = _1074;
    }
    float _1090 = _1080;
    float _1092 = _1090;
    if (!_1064)
    {
        float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1096 = _766 + _1094;
        float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1100 = _691 + _1098;
        float _1102 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1104 = _1096 * _1096;
        float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1108 = _693 + _1106;
        float _1110 = fma(_1100, _1100, _1104);
        float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1114 = fma(_1108, _1108, _1110);
        float _1116 = sqrt(_1114);
        float _1118 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1120 = -_766;
        float _1122 = _1120 + _1070;
        float _1124 = precise::min(_1116, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1126 = _1124 * _1112;
        float _1128 = -_691;
        float _1130 = _1128 + _1072;
        float _1132 = _1118 * _1126;
        float _1134 = -_693;
        float _1136 = _1134 + _1074;
        float _1138 = fma(_1130, _1132, _691);
        float _1140 = fma(_1122, _1132, _766);
        float _1142 = fma(_1136, _1132, _693);
        _1088 = _1140;
        _1084 = _1138;
        _1092 = _1142;
        _974 = _1116;
    }
    float _1144 = _1088;
    float _1146 = _1084;
    float _1148 = _1092;
    float _1150 = _974;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1154 = _1144 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1158 = _1146 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _1148 + _1160;
    float _1164 = _1154 * _1154;
    float _1166 = fma(_1158, _1158, _1164);
    float _1168 = fma(_1162, _1162, _1166);
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1172 = rsqrt(_1168);
    float _1174 = sqrt(_1168);
    float _1176 = _1158 * _1172;
    float _1178 = _1162 * _1172;
    float _1180 = _1154 * _1172;
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1186 = _1182 * _1182;
    float _1188 = _1184 * _1184;
    float _1190 = _1186 + _1188;
    float _1192 = sqrt(_1190);
    bool _1194 = _1192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1198 = _1192 + _1196;
    float _1200 = _912;
    float _1202 = _1190;
    float _1204 = _1198;
    float _1206 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1208 = _1162;
    if (_1194)
    {
        float _1210 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1210;
    }
    float _1212 = _1200;
    if (_1194)
    {
        float _1214 = rsqrt(_1190);
        _1202 = _1214;
    }
    float _1216 = _1202;
    float _1218 = _1216;
    if (_1194)
    {
        float _1220 = _1198 * _1212;
        _1204 = _1220;
    }
    float _1222 = _1204;
    if (_1194)
    {
        float _1224 = _1222 * 0.15915493667125701904296875;
        _976 = _1224;
    }
    float _1226 = _976;
    float _1228 = _1150;
    float _1230 = _1226;
    if (_1194)
    {
        float _1232 = _1226 * 6.283185482025146484375;
        float _1234 = sin(_1232);
        _1228 = _1234;
    }
    float _1236 = _1228;
    float _1238 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1240 = precise::max(0.0, _1238);
    float _1242 = _922;
    float _1244 = _1240;
    if (_1194)
    {
        float _1246 = _1226 * 6.283185482025146484375;
        float _1248 = cos(_1246);
        _1242 = _1248;
    }
    float _1250 = _1242;
    float _1252 = fma(_691, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1254 = -_1180;
    float _1256 = -_1240;
    float _1258 = fma(_1254, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1256);
    if (_1194)
    {
        float _1260 = _1258 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1244 = _1260;
    }
    float _1262 = _1244;
    float _1264 = _1236;
    if (_1194)
    {
        float _1266 = fma(_1236, _1262, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1206 = _1266;
    }
    float _1268 = _1206;
    float _1270 = _1268;
    if (!_1194)
    {
        _1264 = _1182;
    }
    float _1272 = _1264;
    float _1274 = floor(_1252);
    float _1276 = _1272;
    float _1278 = _1250;
    if (_1194)
    {
        float _1280 = _1250 + (-1.0);
        _1230 = _1280;
    }
    float _1282 = _1230;
    float _1284 = _1282;
    if (_1194)
    {
        float _1286 = _1216 * _1268;
        _802 = _1286;
    }
    float _1288 = _802;
    if (!_1194)
    {
        _1270 = _1258;
    }
    float _1290 = _1270;
    float _1292 = _1290;
    if (_1194)
    {
        float _1294 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _978 = _1294;
    }
    float _1296 = _978;
    if (_1194)
    {
        float _1298 = _1182 * _1288;
        _1276 = _1298;
    }
    float _1300 = _1276;
    if (!_1194)
    {
        _1218 = _1184;
    }
    float _1302 = _1218;
    float _1304 = _1302;
    if (_1194)
    {
        float _1306 = _1184 * _1288;
        _1304 = _1306;
    }
    float _1308 = _1304;
    if (!_1194)
    {
        _1284 = _1186;
    }
    float _1310 = _1284;
    float _1312 = _1310;
    if (_1194)
    {
        float _1314 = fma(_1258, _1250, _1296);
        _1292 = _1314;
    }
    float _1316 = _1292;
    if (_1194)
    {
        float _1318 = _1300 * _1300;
        _1312 = _1318;
    }
    float _1320 = _1312;
    if (!_1194)
    {
        _1278 = _1188;
    }
    float _1322 = _1278;
    float _1324 = _1322;
    if (_1194)
    {
        float _1326 = _1308 * _1308;
        _1324 = _1326;
    }
    float _1328 = _1324;
    float _1330 = fma(_1316, _1316, _1320);
    float _1332 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1338 = fma(_1174, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1336);
    float _1340 = precise::clamp(_1338, 0.0, 1.0);
    float _1342 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1344 = _1330 + _1328;
    float _1346 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1348 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1350 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1352 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1334);
    float _1354 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1346);
    float _1356 = rsqrt(_1344);
    float _1358 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1348);
    float _1360 = -_1340;
    float _1362 = _1360 + 1.0;
    float _1364 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1366 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1350);
    float _1368 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1358);
    float _1370 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1372 = abs(_1362);
    float _1374 = log2(_1372);
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1378 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1382 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1352);
    float _1384 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1380);
    float _1388 = _1356 * _1300;
    float _1390 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1392 = _1356 * _1316;
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1386);
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1398 = _1356 * _1308;
    float _1400 = floor(_1342);
    float _1402 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1394);
    float _1404 = -_1396;
    float _1406 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1410 = -_1384;
    float _1412 = fma(_1410, _1170, 1.0);
    float _1414 = -_1398;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1418 = -_1274;
    float _1420 = _1252 + _1418;
    float _1422 = 1.0 / _1402;
    float _1424 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1426 = fma(_1416, -0.5, 0.5);
    float _1428 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1430 = fma(_1416, 0.5, 0.5);
    float _1432 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1424);
    float _1434 = _1392 + 1.0;
    float _1436 = exp2(_1408);
    float _1438 = -_1400;
    float _1440 = _1342 + _1438;
    float _1442 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1428);
    float _1444 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1432);
    float _1446 = fma(_1430, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1448 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1442);
    float _1450 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1452 = sqrt(_1426);
    float _1454 = fma(_1430, _1446, -0.212114393711090087890625);
    float _1456 = _1450 * _1422;
    float _1458 = fma(_1430, _1454, 1.570728778839111328125);
    float _1460 = log2(_1412);
    float _1462 = -_1392;
    float _1464 = fma(_1436, _1434, _1462);
    float _1466 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1448);
    float _1468 = _1466 * _1422;
    float _1470 = _1452 * 0.636619746685028076171875;
    float _1472 = fma(_1456, 0.5, 0.5);
    float _1474 = fma(_1468, -0.5, 0.5);
    float _1476 = -_1458;
    float _1478 = fma(_1470, _1476, 1.0);
    float _1480 = fma(_1464, 0.5, 0.5);
    float _1482 = _1460 * 0.693147182464599609375;
    float2 _4438 = float2(_1420, _1440);
    float _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4438, float2(0.0), isnan(_4438)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4438, float2(0.0), isnan(_4438)), level(0.0)).x;
    float _1486 = _1482 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4453 = float3(_1472, _1474, _1486);
    float _1488 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4453, float3(0.0), isnan(_4453)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4453, float3(0.0), isnan(_4453)), level(0.0)).x;
    float3 _4464 = float3(_1472, _1474, _1486);
    float4 _1491 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4464, float3(0.0), isnan(_4464)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4464, float3(0.0), isnan(_4464)), level(0.0)).xyzw;
    float _1493 = _1491.x;
    float _1495 = _1491.y;
    float _1497 = _1491.z;
    float _1499 = _1491.w;
    float2 _4480 = float2(_1478, _1480);
    float3 _1503 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4480, float2(0.0), isnan(_4480)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4480, float2(0.0), isnan(_4480)), level(0.0)).xyz;
    float _1505 = _1503.x;
    float _1507 = _1503.y;
    float _1509 = _1503.z;
    float _1511 = _766 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1513 = _766 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1515 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_74.x = _1158;
    out.m_74.y = _1154;
    out.m_74.z = _1162;
    float _1517 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1511);
    float _1519 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1513);
    float _1521 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1517);
    float _1523 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1519);
    float _1525 = exp2(_1515);
    float _1527 = _1521 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1529 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1531 = _1529 + _1527;
    bool _1533 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan(0.5);
    bool _1541 = _1537 || _1539;
    float _1543 = 1.0 / _1527;
    float _1545 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1547 = in.m_64.x;
    float _1549 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1545);
    float _1551 = _1402;
    if (_1541)
    {
        _1208 = 1.0;
    }
    float _1553 = _1208;
    float _1555 = _1531 * _1543;
    float _1557 = _1555 * 0.5;
    float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1561 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1559);
    float _1563 = 1.0 / _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1567 = _1563 * _1565;
    float _1569 = abs(_1567);
    float _1571 = log2(_1569);
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1575 = exp2(_1573);
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1579 = precise::clamp(_1577, 0.0, 1.0);
    float _1581 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1549);
    bool _1583 = _1567 <= 8000.0;
    bool _1585 = isnan(_1567);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan(8000.0);
    bool _1591 = _1587 || _1589;
    float _1593 = float(_1591);
    float _1595 = fma(_1579, -2.0, 3.0);
    float _1597 = _1579 * _1579;
    float _1599 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1581);
    float _1601 = _1597 * _1595;
    float _1603 = _1599 + _1402;
    float _1605 = -_1601;
    float _1607 = _1605 + 1.0;
    float _1609 = _1603 * 0.5;
    float _1611 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1601);
    float _1613 = _1607;
    float _1615 = _1553;
    float _1617 = _1609;
    if (_1541)
    {
        _1613 = 1.0;
    }
    float _1619 = _1613;
    float _1621 = _1619;
    float _1623 = _1497;
    float _1625 = _1507;
    float _1627 = _1505;
    if (!_1541)
    {
        float _1629 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1633 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1631;
        float _1635 = _1629 * 0.15915493667125701904296875;
        float _1637 = _1635 * 6.283185482025146484375;
        float _1639 = cos(_1637);
        float _1641 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1643 = _1641 * 0.15915493667125701904296875;
        float _1645 = _1635 * 6.283185482025146484375;
        float _1647 = sin(_1645);
        float _1649 = 1.0 / _1639;
        float _1651 = _1643 * 6.283185482025146484375;
        float _1653 = cos(_1651);
        float _1655 = _1647 * _1649;
        float _1657 = _1643 * 6.283185482025146484375;
        float _1659 = sin(_1657);
        float _1661 = _1653 * _1655;
        float _1663 = 1.0 / _1633;
        float _1665 = 1.0 / _1661;
        float _1667 = _1659 * _1665;
        float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1671 = fma(_1567, _1667, _1669);
        float _1673 = _1671 * _1663;
        float _1675 = precise::clamp(_1673, 0.0, 1.0);
        _1621 = _1675;
    }
    float _1677 = _1621;
    if (!_1541)
    {
        float _1679 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1681 = _1679 * 0.15915493667125701904296875;
        float _1683 = _1681 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1689 = _1687 * 0.15915493667125701904296875;
        float _1691 = _1681 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        float _1695 = 1.0 / _1685;
        float _1697 = _1689 * 6.283185482025146484375;
        float _1699 = cos(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = _1689 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1699 * _1701;
        float _1709 = 1.0 / _1707;
        float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1713 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1711;
        float _1715 = 1.0 / _1713;
        float _1717 = _1705 * _1709;
        float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1721 = fma(_1567, _1717, _1719);
        float _1723 = _1721 * _1715;
        float _1725 = precise::clamp(_1723, 0.0, 1.0);
        float _1727 = -_1725;
        float _1729 = _1727 + 1.0;
        _1615 = _1729;
    }
    float _1731 = _1615;
    float _1733 = _1593 * _1611;
    float _1735 = -_1525;
    float _1737 = _1735 + 1.0;
    float _1739 = -_1484;
    float _1741 = _1739 + 1.0;
    float _1743 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1745 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1450;
    out.gl_Position.y = _1466;
    out.gl_Position.z = _1599;
    out.gl_Position.w = _1402;
    bool _1747 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1749 = isnan(_1174);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1755 = _1751 || _1753;
    float _1757 = _1741 * _1743;
    float _1759 = precise::clamp(_1757, 0.0, 1.0);
    float _1761 = _1745 * _1488;
    float _1763 = -_1745;
    float _1765 = _1763 + 1.0;
    out.m_76.x = _1146;
    out.m_76.y = _1144;
    out.m_76.z = _1148;
    float _1767 = -_1759;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1771 = _1499 * _1761;
    out.m_78.z = _1609;
    out.m_78.w = _1402;
    float _1773 = _1769 * _1547;
    float _1775 = _1509 * _1761;
    float _1777 = fma(_1505, _1771, _1493);
    float _1779 = fma(_1507, _1771, _1495);
    float _1781 = _1499 * _1765;
    float _1783 = _1773 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1785 = fma(_1499, _1775, _1497);
    float _1787 = _1677 * _1731;
    float _1789 = _1771;
    if (!_1755)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1791 = _1623;
    out.m_80.x = _1783;
    float _1793 = _1791;
    float _1795 = _1791;
    if (!_1755)
    {
        _1625 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1797 = _1625;
    float _1799 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1801 = _1797;
    float _1803 = _1797;
    if (!_1755)
    {
        _1627 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1805 = _1627;
    out.m_82.x = _1777;
    out.m_82.y = _1779;
    out.m_82.z = _1785;
    out.m_82.w = _1781;
    float _1807 = _1805;
    float _1809 = _1805;
    if (!_1755)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1811 = _1551;
    float _1813 = _1811;
    float _1815 = _1811;
    if (!_1755)
    {
        _1617 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1817 = _1617;
    float _1819 = _1817;
    float _1821 = _1817;
    if (!_1755)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1823 = _1789;
    bool _1825 = !_1755;
    float _1827 = _1823;
    float _1829 = _1823;
    if (!_1825)
    {
        bool _1831 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1833 = isnan(_1174);
        bool _1835 = _1831 || _1833;
        bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1839 = _1835 || _1837;
        if (!_1839)
        {
            float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1843 = _1174 + _1841;
            float _1845 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1847 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1845;
            float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1851 = _1849 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1853 = 1.0 / _1847;
            float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1865 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1871 = _1843 * _1853;
            float _1873 = precise::clamp(_1871, 0.0, 1.0);
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1879 = fma(_1873, _1851, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1881 = fma(_1873, _1877, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1883 = fma(_1873, _1857, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1885 = fma(_1873, _1861, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1887 = fma(_1873, _1865, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1889 = fma(_1873, _1869, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1803 = _1883;
            _1821 = _1887;
            _1795 = _1879;
            _1815 = _1885;
            _1809 = _1881;
            _1829 = _1889;
            _1891 = true;
        }
        else
        {
            bool _1893 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1895 = isnan(_1174);
            bool _1897 = _1893 || _1895;
            bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1901 = _1897 || _1899;
            if (!_1901)
            {
                _1793 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1903 = _1793;
            _1795 = _1903;
            if (!_1901)
            {
                _1801 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1905 = _1801;
            _1803 = _1905;
            if (!_1901)
            {
                _1807 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1907 = _1807;
            _1809 = _1907;
            if (!_1901)
            {
                _1813 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1909 = _1813;
            _1815 = _1909;
            if (!_1901)
            {
                _1819 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1911 = _1819;
            _1821 = _1911;
            if (!_1901)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1913 = _1827;
            bool _1915 = !_1901;
            _1829 = _1913;
            if (!_1915)
            {
                bool _1917 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1919 = isnan(_1174);
                bool _1921 = _1917 || _1919;
                bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1925 = _1921 || _1923;
                if (!_1925)
                {
                    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1929 = _1174 + _1927;
                    float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1931;
                    float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1937 = _1935 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1939 = 1.0 / _1933;
                    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1947 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1951 = _1949 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1957 = _1929 * _1939;
                    float _1959 = precise::clamp(_1957, 0.0, 1.0);
                    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1965 = fma(_1959, _1937, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1967 = fma(_1959, _1963, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1969 = fma(_1959, _1943, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1971 = fma(_1959, _1947, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1973 = fma(_1959, _1951, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1975 = fma(_1959, _1955, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1803 = _1969;
                    _1821 = _1973;
                    _1795 = _1965;
                    _1815 = _1971;
                    _1809 = _1967;
                    _1829 = _1975;
                    _1891 = true;
                }
                else
                {
                    _1803 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1821 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1795 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1815 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1809 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1891 = false;
    float _1977 = _1803;
    float _1979 = _1821;
    float _1981 = _1795;
    float _1983 = _1815;
    float _1985 = _1809;
    float _1987 = _1829;
    float _1989 = fma(_956, -0.5, 0.5);
    float _1991 = precise::clamp(_1989, 0.0, 1.0);
    float _1993 = -_1977;
    float _1995 = _1993 + _1979;
    float _1997 = _1799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1999 = -_1981;
    float _2001 = _1999 + _1983;
    float _2003 = fma(_1991, _1995, _1977);
    out.m_84.x = 0.0;
    float _2005 = -_1985;
    float _2007 = _2005 + _1987;
    float _2009 = fma(_1991, _2001, _1981);
    float _2011 = _2003 * 0.586610972881317138671875;
    out.m_51.x = _1997;
    bool _2013 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2015 = fma(_1991, _2007, _1985);
    float _2017 = fma(_2009, 0.298911988735198974609375, _2011);
    bool _2019 = _1677 > 0.0;
    bool _2021 = isnan(_1677);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan(0.0);
    bool _2027 = _2023 || _2025;
    float _2029 = fma(_2015, 0.114477999508380889892578125, _2017);
    out.m_86.x = 0.0;
    bool _2031 = _1731 <= 0.0;
    bool _2033 = !_2027;
    bool _2035 = _2031 || _2033;
    float _2037 = -_2029;
    float _2039 = _2009 + _2037;
    float _2041 = -_2029;
    float _2043 = _2003 + _2041;
    float _2045 = -_2029;
    float _2047 = _2015 + _2045;
    float _2049 = fma(_2039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2051 = fma(_2043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2053 = fma(_2047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    bool _2055 = !_2013;
    if (!_2055)
    {
        float _2057 = -_1144;
        float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2061 = -_1146;
        float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2065 = -_1148;
        float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2069 = _2059 * _2059;
        float _2071 = fma(_2063, _2063, _2069);
        float _2073 = fma(_2067, _2067, _2071);
        float _2075 = rsqrt(_2073);
        float _2077 = _2059 * _2075;
        float _2079 = _2063 * _2075;
        float _2081 = _2067 * _2075;
        float _2083 = -_1180;
        float _2085 = _2083 + _2077;
        float _2087 = -_1176;
        float _2089 = _2087 + _2079;
        float _2091 = -_1178;
        float _2093 = _2091 + _2081;
        float _2095 = sqrt(_2073);
        float _2097 = _2085 * _2085;
        float _2099 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2101 = precise::clamp(_2099, 0.0, 1.0);
        float _2103 = fma(_2089, _2089, _2097);
        float _2105 = _2101 * _2101;
        float _2107 = fma(_2093, _2093, _2103);
        float _2109 = rsqrt(_2107);
        float _2111 = -_2095;
        float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2115 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2117 = precise::clamp(_2115, 0.0, 1.0);
        float _2119 = abs(_2117);
        float _2121 = log2(_2119);
        float _2123 = _2085 * _2109;
        float _2125 = _2089 * _2109;
        float _2127 = _2093 * _2109;
        float _2129 = _2105 + (-1.0);
        float _2131 = _956 * _2123;
        float _2133 = _956 * _2077;
        float _2135 = fma(_954, _2125, _2131);
        float _2137 = fma(_954, _2079, _2133);
        float _2139 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2141 = fma(_958, _2127, _2135);
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        float _2145 = fma(_958, _2081, _2137);
        float _2147 = precise::clamp(_2145, 0.0, 1.0);
        float _2149 = _2143 * _2143;
        float _2151 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2153 = exp2(_2139);
        float _2155 = fma(_2149, _2129, 1.0);
        float _2157 = -_2077;
        float _2159 = -_2151;
        float _2161 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2159);
        float _2163 = _2155 * _2155;
        float _2165 = -_2081;
        float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2161);
        float _2169 = 1.0 / _2163;
        float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2173 = _2167 + _2171;
        float _2175 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = _2153 * _2177;
        float _2181 = _2147 * _2179;
        float _2183 = _2105 * _2169;
        float _2185 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2187 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2189 = _2181 * _2183;
        float _2191 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2193 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2195 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2197 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2185;
        out.m_84.y = _2191;
        out.m_84.z = _2187;
        out.m_86.x = _2193;
        out.m_86.y = _2195;
        out.m_86.z = _2197;
    }
    out.m_88.x = _2049;
    out.m_88.y = _2051;
    out.m_88.z = _2053;
    if (!_2035)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2199 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2199;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1891 = false;
    bool _1014 = false;
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2256 = as_type<float>(_123);
        out.gl_Position.z = _2256;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_53.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_107);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2325 = as_type<float>(_161);
        out.gl_Position.z = _2325;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _165 = !_163;
    float _183;
    if (!_165)
    {
        float _167 = in.m_55.x;
        float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _173 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _175 = _173 * _169;
        float _177 = floor(_175);
        float _179 = -_177;
        float _181 = _175 + _179;
        _183 = _181;
        _185 = true;
    }
    else
    {
        float _187 = float(_107);
        float _189 = 1.0 / _187;
        float _191 = _141 * _189;
        _183 = _191;
    }
    _185 = false;
    float _193 = _183;
    float _195 = in.m_55.z;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _199 = _193 + _197;
    float _201 = in.m_55.y;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _203;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _209 = _207 != 0;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _213 = _211 != 0;
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _217 = _215 != 0;
    float _219 = in.m_55.x;
    float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _223 = log2(_221);
    bool _225 = !_217;
    int _227 = _225 ? 0 : 1;
    int _229 = abs(_227);
    float _231 = 1.0 / _205;
    float _233 = _195 * 2.0;
    float _235 = _201 * 2.0;
    float _237 = floor(_233);
    float _239 = _219 * 2.0;
    float _241 = _199 * _231;
    float _243 = _201 + _195;
    float _245 = floor(_235);
    float _247 = _243 + (-1.0);
    bool _249 = _237 > 0.0;
    float _251 = floor(_239);
    bool _253 = _237 >= 0.0;
    bool _255 = isnan(_237);
    bool _257 = _253 || _255;
    bool _259 = isnan(0.0);
    bool _261 = _257 || _259;
    float _263 = _219 + _195;
    float _265 = _195 + (-0.5);
    int _267 = _261 ? 0 : 1;
    float _269 = _263 + (-1.0);
    bool _271 = _245 > 0.0;
    bool _273 = _245 >= 0.0;
    bool _275 = isnan(_245);
    bool _277 = _273 || _275;
    bool _279 = isnan(0.0);
    bool _281 = _277 || _279;
    int _283 = ~_267;
    int _285 = _283 + 1;
    int _287 = _285 + 1;
    int _289 = _287;
    if (!_249)
    {
        int _291 = ~_267;
        int _293 = _291 + 1;
        _289 = _293;
    }
    int _295 = _289;
    float _297 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _299 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _301 = _223 * _141;
    int _303 = _281 ? 0 : 1;
    bool _305 = _251 > 0.0;
    bool _307 = _251 >= 0.0;
    bool _309 = isnan(_251);
    bool _311 = _307 || _309;
    bool _313 = isnan(0.0);
    bool _315 = _311 || _313;
    float _317 = exp2(_301);
    int _319 = ~_303;
    int _321 = _319 + 1;
    int _323 = _321 + 1;
    bool _325 = !_209;
    int _327 = _325 ? 0 : 1;
    int _329 = _323;
    if (!_271)
    {
        int _331 = ~_303;
        int _333 = _331 + 1;
        _329 = _333;
    }
    int _335 = _329;
    float _337 = in.m_57.x;
    float _339 = in.m_57.y;
    float _341 = in.m_57.z;
    bool _343 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _345 = isnan(1.0);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _351 = _347 || _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _355 = 1.0 + _353;
    int _357 = abs(_327);
    float _359 = _219 + _201;
    float _361 = float(_295);
    float _363 = 1.0 / _355;
    float _365 = -_317;
    float _367 = _365 + 1.0;
    bool _369 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _371 = isnan(0.0);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _377 = _373 || _375;
    float _379 = _359 + (-1.0);
    float _381 = float(_357);
    float _383 = float(_229);
    float _385 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _387 = float(_335);
    float _389 = _381 * _361;
    float _391 = _377 ? _367 : 0.0;
    float _393 = as_type<float>(int(gl_VertexIndex));
    int _395 = _315 ? 0 : 1;
    float _397 = _383 * _387;
    float _399 = _389 * (-2.0);
    if (_351)
    {
        float _401 = _391 * _363;
        _145 = _401;
    }
    float _403 = _145;
    int _405 = ~_395;
    int _407 = _405 + 1;
    int _409 = _407 + 1;
    float _411 = _397 * (-2.0);
    float _413 = fma(_385, _399, _385);
    float _415 = fma(_399, _337, _337);
    float _417 = _219 + (-0.5);
    float _419 = fma(_299, _411, _299);
    float _421 = fma(_411, _341, _341);
    bool _423 = !_213;
    int _425 = _423 ? 0 : 1;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[196].x, _415);
    float _429 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[196].z, _421);
    int _431 = abs(_425);
    float _433 = fma(_413, _403, _427);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    int _439 = _409;
    if (!_305)
    {
        int _441 = ~_395;
        int _443 = _441 + 1;
        _439 = _443;
    }
    int _445 = _439;
    float _447 = _433 * 0.15915493667125701904296875;
    float _449 = float(_431);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = float(_445);
    float _457 = fma(_437, _241, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _459 = fma(_419, _403, _429);
    float _461 = fma(_453, _241, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _463 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _465 = isnan(_193);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = _449 * _455;
    bool _477 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_193);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = in.m_62.x;
    float _491 = in.m_62.y;
    float _493 = _459 * 0.15915493667125701904296875;
    float _495 = _475 * (-2.0);
    float _497 = -_473;
    float _499 = _497 + 1.0;
    float _501 = in.m_48.x;
    float _503 = in.m_48.y;
    float _505 = in.m_48.z;
    float _507 = _447 * 6.283185482025146484375;
    float _509 = sin(_507);
    float _511 = fma(_495, _339, _339);
    float _513 = _201 + (-0.5);
    float _515 = _487 * _499;
    float _517 = fma(_297, _495, _297);
    float _519 = -_487;
    float _521 = _519 + 1.0;
    float _523 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[196].y, _511);
    float _525 = _457 * _515;
    float _527 = _461 * _515;
    float _529 = _447 * 6.283185482025146484375;
    float _531 = cos(_529);
    float _533 = fma(_517, _403, _523);
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].x, _525);
    float _537 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[143].y, _527);
    int _539 = as_type<int>(_393) & 1;
    bool _541 = _539 != 0;
    int _543 = as_type<int>(_393) & 2;
    bool _545 = _543 != 0;
    float _547 = _533 * 0.15915493667125701904296875;
    float _549 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[144].x, _535);
    float _551 = _493 * 6.283185482025146484375;
    float _553 = sin(_551);
    float _555 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[144].y, _537);
    float _557 = _549 * _489;
    bool _559 = !_541;
    float _561 = _559 ? (-0.5) : 0.5;
    float _563 = _555 * _491;
    bool _565 = !_545;
    float _567 = _565 ? (-0.5) : 0.5;
    float _569 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _571 = _493 * 6.283185482025146484375;
    float _573 = cos(_571);
    float _575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _561);
    float _577 = _563 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _567);
    float _581 = _503 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = _569 * _575;
    bool _585 = _201 > 0.5;
    float _587 = _577 * _579;
    float _589 = _547 * 6.283185482025146484375;
    float _591 = cos(_589);
    float _593 = _509 * _553;
    float _595 = _531 * _553;
    float _597 = _503 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _599 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    bool _601 = _219 > 0.5;
    float _603 = _567 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _605 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[6].x, _597);
    float _607 = _547 * 6.283185482025146484375;
    float _609 = sin(_607);
    float _611 = _531 * _573;
    float _613 = _509 * _573;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _617 = _615 != 0;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _621 = _619 != 0;
    float _623 = -_567;
    int _625 = _585 ? as_type<int>(_623) : as_type<int>(_567);
    float _627 = _591 * _553;
    float _629 = _531 * _591;
    float _631 = _591 * _573;
    float _633 = _509 * _591;
    float _635 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _637 = fma(_609, _593, _611);
    float _639 = -_595;
    float _641 = fma(_609, _613, _639);
    float _643 = -_613;
    float _645 = fma(_609, _595, _643);
    float _647 = fma(_609, _611, _593);
    float _649 = _637 * _587;
    float _651 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _653 = _641 * _587;
    float _655 = _633 * _587;
    float _657 = fma(_627, _583, _649);
    float _659 = _633 * _603;
    float _661 = fma(_631, _583, _653);
    float _663 = _651 * _219;
    float _665 = fma(_645, _635, _657);
    float _667 = -_609;
    float _669 = fma(_667, _583, _655);
    float _671 = fma(_647, _635, _661);
    float _673 = fma(_505, (*spvDescriptorSet0.vp_c10)._m0[4].z, _599);
    float _675 = _665 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _677 = _665 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _679 = trunc(_663);
    int _681 = int(_679);
    float _683 = fma(_505, (*spvDescriptorSet0.vp_c10)._m0[6].z, _605);
    float _685 = fma(_629, _635, _669);
    float _687 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[8].x, _675);
    float _689 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[10].x, _677);
    float _691 = _673 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _693 = _683 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c10)._m0[8].z, _687);
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c10)._m0[10].z, _689);
    float _699 = -_561;
    int _701 = _601 ? as_type<int>(_699) : as_type<int>(_561);
    float _703 = _665 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _705 = _691 + _695;
    float _707 = _693 + _697;
    float _709 = _641 * _603;
    float _711 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[9].x, _703);
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _715 = _705 + _713;
    float _717 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _719 = _707 + _717;
    int _721 = _681 << 4;
    int _723 = _721 + 1712;
    float _725 = fma(_685, (*spvDescriptorSet0.vp_c10)._m0[9].z, _711);
    float _727 = in.m_64.y;
    float _729 = _715 * _715;
    float _731 = _719 * _719;
    float _733 = _637 * _603;
    int _735 = _723 + 8;
    uint _738 = uint(int(uint(_735) >> uint(2)));
    uint _740 = uint(int(uint(int(_738)) >> uint(2)));
    int _742 = int(_738) & 3;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[int(_740)][_742];
    float _746 = _729 + _731;
    float _748 = sqrt(_746);
    uint _750 = uint(int(uint(_723) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[int(_760)][_762];
    float _766 = _503 + _727;
    bool _768 = !_621;
    float _770 = _768 ? _567 : as_type<float>(_625);
    float _772 = _561 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _774 = _748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _776 = _766 + _725;
    bool _778 = !_617;
    float _780 = _778 ? _561 : as_type<float>(_701);
    float _782 = -_609;
    float _784 = fma(_782, _772, _659);
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _788 = fma(_631, _772, _709);
    float _790 = fma(_627, _772, _733);
    float _792 = _627;
    float _794 = _561;
    float _796 = _609;
    float _798 = _733;
    float _800 = _631;
    float _802 = _705;
    if (!_774)
    {
        _792 = _731;
    }
    float _804 = _792;
    float _806 = _804;
    if (!_774)
    {
        _794 = _729;
    }
    float _808 = _794;
    float _810 = _808;
    if (!_774)
    {
        _796 = _705;
    }
    float _812 = _796;
    float _814 = _812;
    if (!_774)
    {
        _798 = _707;
    }
    float _816 = _798;
    float _818 = _816;
    if (!_774)
    {
        _800 = _776;
    }
    float _820 = _800;
    bool _822 = !_774;
    float _824 = _820;
    if (!_822)
    {
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _830 = _748 + _828;
        float _832 = _776 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _834 = rsqrt(_746);
        float _836 = _830 * _826;
        float _838 = _836 * 0.15915493667125701904296875;
        float _840 = _838 * 6.283185482025146484375;
        float _842 = sin(_840);
        float _844 = _838 * 6.283185482025146484375;
        float _846 = cos(_844);
        float _848 = fma(_842, _832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _850 = _834 * _848;
        float _852 = _846 + (-1.0);
        float _854 = fma(_715, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _856 = fma(_719, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _858 = _852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _862 = _854 + _860;
        float _864 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _866 = _856 + _864;
        float _868 = fma(_776, _846, _858);
        float _870 = _862 * _862;
        float _872 = _866 * _866;
        _824 = _868;
        _810 = _870;
        _806 = _872;
        _818 = _856;
        _814 = _854;
    }
    float _874 = _824;
    float _876 = _810;
    float _878 = _806;
    float _880 = _818;
    float _882 = _814;
    float _884 = _645 + _790;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _888 = _874 + _886;
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _892 = _780 + 0.5;
    float _894 = -_770;
    float _896 = _894 + 0.5;
    float _898 = fma(_888, _888, _876);
    float _900 = _647 + _788;
    float _902 = _892 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _904 = _884 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _906 = _898 + _878;
    float _908 = _884 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _910 = _884 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _912 = _902 * _786;
    float _914 = _896 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _916 = _629 + _784;
    float _918 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].x, _904);
    float _920 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[9].x, _908);
    float _922 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[10].x, _910);
    float _924 = sqrt(_906);
    float _926 = _914 * _890;
    float _928 = _744 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _930 = _756 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _932 = _764 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _940 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _944 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _930 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[8].z, _918);
    float _956 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[9].z, _920);
    float _958 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    out.m_66.x = _944;
    out.m_66.y = _946;
    out.m_66.z = _948;
    bool _960 = _924 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _962 = isnan(_924);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _968 = _964 || _966;
    out.m_68.x = _950;
    out.m_68.y = _952;
    out.m_68.z = _940;
    out.m_68.w = _942;
    out.m_70.x = _912;
    out.m_70.y = _926;
    out.m_72.x = _954;
    out.m_72.y = _956;
    out.m_72.z = _958;
    float _970 = _908;
    float _972 = _952;
    float _974 = _880;
    float _976 = _926;
    float _978 = _916;
    if (!_968)
    {
        _970 = 1.0;
    }
    float _980 = _970;
    bool _982 = !_968;
    float _984 = _980;
    if (!_982)
    {
        bool _986 = _924 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _988 = isnan(_924);
        bool _990 = _986 || _988;
        bool _992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _994 = _990 || _992;
        if (!_994)
        {
            float _996 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _998 = _924 + _996;
            float _1000 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1002 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1000;
            float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1006 = _1004 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1008 = 1.0 / _1002;
            float _1010 = _998 * _1008;
            float _1012 = fma(_1010, _1006, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _984 = _1012;
            _972 = _1008;
            _1014 = true;
        }
        else
        {
            bool _1016 = _924 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1018 = isnan(_924);
            bool _1020 = _1016 || _1018;
            bool _1022 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1024 = _1020 || _1022;
            if (!_1024)
            {
                float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1028 = _924 + _1026;
                float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1032 = _1030 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1036 = _1034 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1038 = 1.0 / _1032;
                float _1040 = _1028 * _1038;
                float _1042 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _984 = _1042;
                _972 = _1038;
                _1014 = true;
            }
            else
            {
                _984 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1014 = false;
    float _1044 = _984;
    float _1046 = _972;
    float _1048 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1050 = _874 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1054 = _880 + _1052;
    bool _1056 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.5);
    bool _1064 = _1060 || _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1068 = _882 + _1066;
    float _1070 = fma(_1050, _1044, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1072 = fma(_1068, _1044, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1074 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1076 = _1068;
    float _1078 = _1046;
    float _1080 = _1050;
    if (_1064)
    {
        _1076 = _1072;
    }
    float _1082 = _1076;
    float _1084 = _1082;
    if (_1064)
    {
        _1078 = _1070;
    }
    float _1086 = _1078;
    float _1088 = _1086;
    if (_1064)
    {
        _1080 = _1074;
    }
    float _1090 = _1080;
    float _1092 = _1090;
    if (!_1064)
    {
        float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1096 = _766 + _1094;
        float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1100 = _691 + _1098;
        float _1102 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1104 = _1096 * _1096;
        float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1108 = _693 + _1106;
        float _1110 = fma(_1100, _1100, _1104);
        float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1114 = fma(_1108, _1108, _1110);
        float _1116 = sqrt(_1114);
        float _1118 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1120 = -_766;
        float _1122 = _1120 + _1070;
        float _1124 = precise::min(_1116, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1126 = _1124 * _1112;
        float _1128 = -_691;
        float _1130 = _1128 + _1072;
        float _1132 = _1118 * _1126;
        float _1134 = -_693;
        float _1136 = _1134 + _1074;
        float _1138 = fma(_1130, _1132, _691);
        float _1140 = fma(_1122, _1132, _766);
        float _1142 = fma(_1136, _1132, _693);
        _1088 = _1140;
        _1084 = _1138;
        _1092 = _1142;
        _974 = _1116;
    }
    float _1144 = _1088;
    float _1146 = _1084;
    float _1148 = _1092;
    float _1150 = _974;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1154 = _1144 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1158 = _1146 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _1148 + _1160;
    float _1164 = _1154 * _1154;
    float _1166 = fma(_1158, _1158, _1164);
    float _1168 = fma(_1162, _1162, _1166);
    float _1170 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1172 = rsqrt(_1168);
    float _1174 = sqrt(_1168);
    float _1176 = _1158 * _1172;
    float _1178 = _1162 * _1172;
    float _1180 = _1154 * _1172;
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1186 = _1182 * _1182;
    float _1188 = _1184 * _1184;
    float _1190 = _1186 + _1188;
    float _1192 = sqrt(_1190);
    bool _1194 = _1192 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1198 = _1192 + _1196;
    float _1200 = _912;
    float _1202 = _1190;
    float _1204 = _1198;
    float _1206 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1208 = _1162;
    if (_1194)
    {
        float _1210 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1210;
    }
    float _1212 = _1200;
    if (_1194)
    {
        float _1214 = rsqrt(_1190);
        _1202 = _1214;
    }
    float _1216 = _1202;
    float _1218 = _1216;
    if (_1194)
    {
        float _1220 = _1198 * _1212;
        _1204 = _1220;
    }
    float _1222 = _1204;
    if (_1194)
    {
        float _1224 = _1222 * 0.15915493667125701904296875;
        _976 = _1224;
    }
    float _1226 = _976;
    float _1228 = _1150;
    float _1230 = _1226;
    if (_1194)
    {
        float _1232 = _1226 * 6.283185482025146484375;
        float _1234 = sin(_1232);
        _1228 = _1234;
    }
    float _1236 = _1228;
    float _1238 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1240 = precise::max(0.0, _1238);
    float _1242 = _922;
    float _1244 = _1240;
    if (_1194)
    {
        float _1246 = _1226 * 6.283185482025146484375;
        float _1248 = cos(_1246);
        _1242 = _1248;
    }
    float _1250 = _1242;
    float _1252 = fma(_691, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1254 = -_1180;
    float _1256 = -_1240;
    float _1258 = fma(_1254, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1256);
    if (_1194)
    {
        float _1260 = _1258 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1244 = _1260;
    }
    float _1262 = _1244;
    float _1264 = _1236;
    if (_1194)
    {
        float _1266 = fma(_1236, _1262, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1206 = _1266;
    }
    float _1268 = _1206;
    float _1270 = _1268;
    if (!_1194)
    {
        _1264 = _1182;
    }
    float _1272 = _1264;
    float _1274 = floor(_1252);
    float _1276 = _1272;
    float _1278 = _1250;
    if (_1194)
    {
        float _1280 = _1250 + (-1.0);
        _1230 = _1280;
    }
    float _1282 = _1230;
    float _1284 = _1282;
    if (_1194)
    {
        float _1286 = _1216 * _1268;
        _802 = _1286;
    }
    float _1288 = _802;
    if (!_1194)
    {
        _1270 = _1258;
    }
    float _1290 = _1270;
    float _1292 = _1290;
    if (_1194)
    {
        float _1294 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _978 = _1294;
    }
    float _1296 = _978;
    if (_1194)
    {
        float _1298 = _1182 * _1288;
        _1276 = _1298;
    }
    float _1300 = _1276;
    if (!_1194)
    {
        _1218 = _1184;
    }
    float _1302 = _1218;
    float _1304 = _1302;
    if (_1194)
    {
        float _1306 = _1184 * _1288;
        _1304 = _1306;
    }
    float _1308 = _1304;
    if (!_1194)
    {
        _1284 = _1186;
    }
    float _1310 = _1284;
    float _1312 = _1310;
    if (_1194)
    {
        float _1314 = fma(_1258, _1250, _1296);
        _1292 = _1314;
    }
    float _1316 = _1292;
    if (_1194)
    {
        float _1318 = _1300 * _1300;
        _1312 = _1318;
    }
    float _1320 = _1312;
    if (!_1194)
    {
        _1278 = _1188;
    }
    float _1322 = _1278;
    float _1324 = _1322;
    if (_1194)
    {
        float _1326 = _1308 * _1308;
        _1324 = _1326;
    }
    float _1328 = _1324;
    float _1330 = fma(_1316, _1316, _1320);
    float _1332 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1338 = fma(_1174, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1336);
    float _1340 = precise::clamp(_1338, 0.0, 1.0);
    float _1342 = fma(_693, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1344 = _1330 + _1328;
    float _1346 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1348 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1350 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1352 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1334);
    float _1354 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1346);
    float _1356 = rsqrt(_1344);
    float _1358 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1348);
    float _1360 = -_1340;
    float _1362 = _1360 + 1.0;
    float _1364 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1366 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1350);
    float _1368 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1358);
    float _1370 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1372 = abs(_1362);
    float _1374 = log2(_1372);
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1378 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1382 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1352);
    float _1384 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1380);
    float _1388 = _1356 * _1300;
    float _1390 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1392 = _1356 * _1316;
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1386);
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1398 = _1356 * _1308;
    float _1400 = floor(_1342);
    float _1402 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1394);
    float _1404 = -_1396;
    float _1406 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1410 = -_1384;
    float _1412 = fma(_1410, _1170, 1.0);
    float _1414 = -_1398;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1418 = -_1274;
    float _1420 = _1252 + _1418;
    float _1422 = 1.0 / _1402;
    float _1424 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1426 = fma(_1416, -0.5, 0.5);
    float _1428 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1430 = fma(_1416, 0.5, 0.5);
    float _1432 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1424);
    float _1434 = _1392 + 1.0;
    float _1436 = exp2(_1408);
    float _1438 = -_1400;
    float _1440 = _1342 + _1438;
    float _1442 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1428);
    float _1444 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1432);
    float _1446 = fma(_1430, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1448 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1442);
    float _1450 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1452 = sqrt(_1426);
    float _1454 = fma(_1430, _1446, -0.212114393711090087890625);
    float _1456 = _1450 * _1422;
    float _1458 = fma(_1430, _1454, 1.570728778839111328125);
    float _1460 = log2(_1412);
    float _1462 = -_1392;
    float _1464 = fma(_1436, _1434, _1462);
    float _1466 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1448);
    float _1468 = _1466 * _1422;
    float _1470 = _1452 * 0.636619746685028076171875;
    float _1472 = fma(_1456, 0.5, 0.5);
    float _1474 = fma(_1468, -0.5, 0.5);
    float _1476 = -_1458;
    float _1478 = fma(_1470, _1476, 1.0);
    float _1480 = fma(_1464, 0.5, 0.5);
    float _1482 = _1460 * 0.693147182464599609375;
    float2 _4438 = float2(_1420, _1440);
    float _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4438, float2(0.0), isnan(_4438)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4438, float2(0.0), isnan(_4438)), level(0.0)).x;
    float _1486 = _1482 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _4453 = float3(_1472, _1474, _1486);
    float _1488 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4453, float3(0.0), isnan(_4453)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4453, float3(0.0), isnan(_4453)), level(0.0)).x;
    float3 _4464 = float3(_1472, _1474, _1486);
    float4 _1491 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4464, float3(0.0), isnan(_4464)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4464, float3(0.0), isnan(_4464)), level(0.0)).xyzw;
    float _1493 = _1491.x;
    float _1495 = _1491.y;
    float _1497 = _1491.z;
    float _1499 = _1491.w;
    float2 _4480 = float2(_1478, _1480);
    float3 _1503 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4480, float2(0.0), isnan(_4480)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4480, float2(0.0), isnan(_4480)), level(0.0)).xyz;
    float _1505 = _1503.x;
    float _1507 = _1503.y;
    float _1509 = _1503.z;
    float _1511 = _766 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1513 = _766 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1515 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_74.x = _1158;
    out.m_74.y = _1154;
    out.m_74.z = _1162;
    float _1517 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1511);
    float _1519 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1513);
    float _1521 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1517);
    float _1523 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1519);
    float _1525 = exp2(_1515);
    float _1527 = _1521 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1529 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1531 = _1529 + _1527;
    bool _1533 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan(0.5);
    bool _1541 = _1537 || _1539;
    float _1543 = 1.0 / _1527;
    float _1545 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1547 = in.m_64.x;
    float _1549 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1545);
    float _1551 = _1402;
    if (_1541)
    {
        _1208 = 1.0;
    }
    float _1553 = _1208;
    float _1555 = _1531 * _1543;
    float _1557 = _1555 * 0.5;
    float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1561 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1559);
    float _1563 = 1.0 / _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1567 = _1563 * _1565;
    float _1569 = abs(_1567);
    float _1571 = log2(_1569);
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1575 = exp2(_1573);
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1579 = precise::clamp(_1577, 0.0, 1.0);
    float _1581 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1549);
    bool _1583 = _1567 <= 8000.0;
    bool _1585 = isnan(_1567);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan(8000.0);
    bool _1591 = _1587 || _1589;
    float _1593 = float(_1591);
    float _1595 = fma(_1579, -2.0, 3.0);
    float _1597 = _1579 * _1579;
    float _1599 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1581);
    float _1601 = _1597 * _1595;
    float _1603 = _1599 + _1402;
    float _1605 = -_1601;
    float _1607 = _1605 + 1.0;
    float _1609 = _1603 * 0.5;
    float _1611 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1601);
    float _1613 = _1607;
    float _1615 = _1553;
    float _1617 = _1609;
    if (_1541)
    {
        _1613 = 1.0;
    }
    float _1619 = _1613;
    float _1621 = _1619;
    float _1623 = _1497;
    float _1625 = _1507;
    float _1627 = _1505;
    if (!_1541)
    {
        float _1629 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1631 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1633 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1631;
        float _1635 = _1629 * 0.15915493667125701904296875;
        float _1637 = _1635 * 6.283185482025146484375;
        float _1639 = cos(_1637);
        float _1641 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1643 = _1641 * 0.15915493667125701904296875;
        float _1645 = _1635 * 6.283185482025146484375;
        float _1647 = sin(_1645);
        float _1649 = 1.0 / _1639;
        float _1651 = _1643 * 6.283185482025146484375;
        float _1653 = cos(_1651);
        float _1655 = _1647 * _1649;
        float _1657 = _1643 * 6.283185482025146484375;
        float _1659 = sin(_1657);
        float _1661 = _1653 * _1655;
        float _1663 = 1.0 / _1633;
        float _1665 = 1.0 / _1661;
        float _1667 = _1659 * _1665;
        float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1671 = fma(_1567, _1667, _1669);
        float _1673 = _1671 * _1663;
        float _1675 = precise::clamp(_1673, 0.0, 1.0);
        _1621 = _1675;
    }
    float _1677 = _1621;
    if (!_1541)
    {
        float _1679 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1681 = _1679 * 0.15915493667125701904296875;
        float _1683 = _1681 * 6.283185482025146484375;
        float _1685 = cos(_1683);
        float _1687 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1689 = _1687 * 0.15915493667125701904296875;
        float _1691 = _1681 * 6.283185482025146484375;
        float _1693 = sin(_1691);
        float _1695 = 1.0 / _1685;
        float _1697 = _1689 * 6.283185482025146484375;
        float _1699 = cos(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = _1689 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1699 * _1701;
        float _1709 = 1.0 / _1707;
        float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1713 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1711;
        float _1715 = 1.0 / _1713;
        float _1717 = _1705 * _1709;
        float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1721 = fma(_1567, _1717, _1719);
        float _1723 = _1721 * _1715;
        float _1725 = precise::clamp(_1723, 0.0, 1.0);
        float _1727 = -_1725;
        float _1729 = _1727 + 1.0;
        _1615 = _1729;
    }
    float _1731 = _1615;
    float _1733 = _1593 * _1611;
    float _1735 = -_1525;
    float _1737 = _1735 + 1.0;
    float _1739 = -_1484;
    float _1741 = _1739 + 1.0;
    float _1743 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1745 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1450;
    out.gl_Position.y = _1466;
    out.gl_Position.z = _1599;
    out.gl_Position.w = _1402;
    bool _1747 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1749 = isnan(_1174);
    bool _1751 = _1747 || _1749;
    bool _1753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1755 = _1751 || _1753;
    float _1757 = _1741 * _1743;
    float _1759 = precise::clamp(_1757, 0.0, 1.0);
    float _1761 = _1745 * _1488;
    float _1763 = -_1745;
    float _1765 = _1763 + 1.0;
    out.m_76.x = _1146;
    out.m_76.y = _1144;
    out.m_76.z = _1148;
    float _1767 = -_1759;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1771 = _1499 * _1761;
    out.m_78.z = _1609;
    out.m_78.w = _1402;
    float _1773 = _1769 * _1547;
    float _1775 = _1509 * _1761;
    float _1777 = fma(_1505, _1771, _1493);
    float _1779 = fma(_1507, _1771, _1495);
    float _1781 = _1499 * _1765;
    float _1783 = _1773 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1785 = fma(_1499, _1775, _1497);
    float _1787 = _1677 * _1731;
    float _1789 = _1771;
    if (!_1755)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1791 = _1623;
    out.m_80.x = _1783;
    float _1793 = _1791;
    float _1795 = _1791;
    if (!_1755)
    {
        _1625 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1797 = _1625;
    float _1799 = _1787 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1801 = _1797;
    float _1803 = _1797;
    if (!_1755)
    {
        _1627 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1805 = _1627;
    out.m_82.x = _1777;
    out.m_82.y = _1779;
    out.m_82.z = _1785;
    out.m_82.w = _1781;
    float _1807 = _1805;
    float _1809 = _1805;
    if (!_1755)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1811 = _1551;
    float _1813 = _1811;
    float _1815 = _1811;
    if (!_1755)
    {
        _1617 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1817 = _1617;
    float _1819 = _1817;
    float _1821 = _1817;
    if (!_1755)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1823 = _1789;
    bool _1825 = !_1755;
    float _1827 = _1823;
    float _1829 = _1823;
    if (!_1825)
    {
        bool _1831 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1833 = isnan(_1174);
        bool _1835 = _1831 || _1833;
        bool _1837 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1839 = _1835 || _1837;
        if (!_1839)
        {
            float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1843 = _1174 + _1841;
            float _1845 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1847 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1845;
            float _1849 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1851 = _1849 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1853 = 1.0 / _1847;
            float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1861 = _1859 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1865 = _1863 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1871 = _1843 * _1853;
            float _1873 = precise::clamp(_1871, 0.0, 1.0);
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1879 = fma(_1873, _1851, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1881 = fma(_1873, _1877, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1883 = fma(_1873, _1857, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1885 = fma(_1873, _1861, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1887 = fma(_1873, _1865, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1889 = fma(_1873, _1869, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1803 = _1883;
            _1821 = _1887;
            _1795 = _1879;
            _1815 = _1885;
            _1809 = _1881;
            _1829 = _1889;
            _1891 = true;
        }
        else
        {
            bool _1893 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1895 = isnan(_1174);
            bool _1897 = _1893 || _1895;
            bool _1899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1901 = _1897 || _1899;
            if (!_1901)
            {
                _1793 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1903 = _1793;
            _1795 = _1903;
            if (!_1901)
            {
                _1801 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1905 = _1801;
            _1803 = _1905;
            if (!_1901)
            {
                _1807 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1907 = _1807;
            _1809 = _1907;
            if (!_1901)
            {
                _1813 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1909 = _1813;
            _1815 = _1909;
            if (!_1901)
            {
                _1819 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1911 = _1819;
            _1821 = _1911;
            if (!_1901)
            {
                _1827 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1913 = _1827;
            bool _1915 = !_1901;
            _1829 = _1913;
            if (!_1915)
            {
                bool _1917 = _1174 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1919 = isnan(_1174);
                bool _1921 = _1917 || _1919;
                bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1925 = _1921 || _1923;
                if (!_1925)
                {
                    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1929 = _1174 + _1927;
                    float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1933 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1931;
                    float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1937 = _1935 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1939 = 1.0 / _1933;
                    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1947 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1951 = _1949 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1953 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1957 = _1929 * _1939;
                    float _1959 = precise::clamp(_1957, 0.0, 1.0);
                    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1963 = _1961 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1965 = fma(_1959, _1937, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1967 = fma(_1959, _1963, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1969 = fma(_1959, _1943, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1971 = fma(_1959, _1947, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1973 = fma(_1959, _1951, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1975 = fma(_1959, _1955, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1803 = _1969;
                    _1821 = _1973;
                    _1795 = _1965;
                    _1815 = _1971;
                    _1809 = _1967;
                    _1829 = _1975;
                    _1891 = true;
                }
                else
                {
                    _1803 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1821 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1795 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1815 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1809 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1829 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1891 = false;
    float _1977 = _1803;
    float _1979 = _1821;
    float _1981 = _1795;
    float _1983 = _1815;
    float _1985 = _1809;
    float _1987 = _1829;
    float _1989 = fma(_956, -0.5, 0.5);
    float _1991 = precise::clamp(_1989, 0.0, 1.0);
    float _1993 = -_1977;
    float _1995 = _1993 + _1979;
    float _1997 = _1799 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1999 = -_1981;
    float _2001 = _1999 + _1983;
    float _2003 = fma(_1991, _1995, _1977);
    out.m_84.x = 0.0;
    float _2005 = -_1985;
    float _2007 = _2005 + _1987;
    float _2009 = fma(_1991, _2001, _1981);
    float _2011 = _2003 * 0.586610972881317138671875;
    out.m_51.x = _1997;
    bool _2013 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2015 = fma(_1991, _2007, _1985);
    float _2017 = fma(_2009, 0.298911988735198974609375, _2011);
    bool _2019 = _1677 > 0.0;
    bool _2021 = isnan(_1677);
    bool _2023 = _2019 || _2021;
    bool _2025 = isnan(0.0);
    bool _2027 = _2023 || _2025;
    float _2029 = fma(_2015, 0.114477999508380889892578125, _2017);
    out.m_86.x = 0.0;
    bool _2031 = _1731 <= 0.0;
    bool _2033 = !_2027;
    bool _2035 = _2031 || _2033;
    float _2037 = -_2029;
    float _2039 = _2009 + _2037;
    float _2041 = -_2029;
    float _2043 = _2003 + _2041;
    float _2045 = -_2029;
    float _2047 = _2015 + _2045;
    float _2049 = fma(_2039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2051 = fma(_2043, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    float _2053 = fma(_2047, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2029);
    bool _2055 = !_2013;
    if (!_2055)
    {
        float _2057 = -_1144;
        float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2061 = -_1146;
        float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2065 = -_1148;
        float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2069 = _2059 * _2059;
        float _2071 = fma(_2063, _2063, _2069);
        float _2073 = fma(_2067, _2067, _2071);
        float _2075 = rsqrt(_2073);
        float _2077 = _2059 * _2075;
        float _2079 = _2063 * _2075;
        float _2081 = _2067 * _2075;
        float _2083 = -_1180;
        float _2085 = _2083 + _2077;
        float _2087 = -_1176;
        float _2089 = _2087 + _2079;
        float _2091 = -_1178;
        float _2093 = _2091 + _2081;
        float _2095 = sqrt(_2073);
        float _2097 = _2085 * _2085;
        float _2099 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2101 = precise::clamp(_2099, 0.0, 1.0);
        float _2103 = fma(_2089, _2089, _2097);
        float _2105 = _2101 * _2101;
        float _2107 = fma(_2093, _2093, _2103);
        float _2109 = rsqrt(_2107);
        float _2111 = -_2095;
        float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2115 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2117 = precise::clamp(_2115, 0.0, 1.0);
        float _2119 = abs(_2117);
        float _2121 = log2(_2119);
        float _2123 = _2085 * _2109;
        float _2125 = _2089 * _2109;
        float _2127 = _2093 * _2109;
        float _2129 = _2105 + (-1.0);
        float _2131 = _956 * _2123;
        float _2133 = _956 * _2077;
        float _2135 = fma(_954, _2125, _2131);
        float _2137 = fma(_954, _2079, _2133);
        float _2139 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2141 = fma(_958, _2127, _2135);
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        float _2145 = fma(_958, _2081, _2137);
        float _2147 = precise::clamp(_2145, 0.0, 1.0);
        float _2149 = _2143 * _2143;
        float _2151 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2153 = exp2(_2139);
        float _2155 = fma(_2149, _2129, 1.0);
        float _2157 = -_2077;
        float _2159 = -_2151;
        float _2161 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2159);
        float _2163 = _2155 * _2155;
        float _2165 = -_2081;
        float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2161);
        float _2169 = 1.0 / _2163;
        float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2173 = _2167 + _2171;
        float _2175 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        float _2179 = _2153 * _2177;
        float _2181 = _2147 * _2179;
        float _2183 = _2105 * _2169;
        float _2185 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2187 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2189 = _2181 * _2183;
        float _2191 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2193 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2195 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2197 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2185;
        out.m_84.y = _2191;
        out.m_84.z = _2187;
        out.m_86.x = _2193;
        out.m_86.y = _2195;
        out.m_86.z = _2197;
    }
    out.m_88.x = _2049;
    out.m_88.y = _2051;
    out.m_88.z = _2053;
    if (!_2035)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2199 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2199;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

