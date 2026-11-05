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
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_50 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_66 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1866 = false;
    bool _1225 = false;
    bool _301 = false;
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2151 = as_type<float>(_123);
        out.gl_Position.z = _2151;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_55.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2221 = as_type<float>(_161);
        out.gl_Position.z = _2221;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _165 = !_163;
    float _183;
    if (!_165)
    {
        float _167 = in.m_57.x;
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
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _195;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _201 = 1.0 / _197;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _207 = _199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _211 = _203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _213 = _205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _193 + _215;
    bool _219 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_193);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    out.m_59.x = _207;
    out.m_59.y = _211;
    out.m_59.z = _213;
    out.m_59.w = _209;
    float _231 = -_229;
    float _233 = _231 + 1.0;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _237 = _217 * _201;
    bool _239 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_193);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = _249 * _233;
    float _261 = fma(_253, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_257, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = -_249;
    float _267 = _265 + 1.0;
    float _269 = _261 * _259;
    float _271 = _263 * _259;
    float _273 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_235;
    float _299;
    if (!_281)
    {
        float _283 = in.m_57.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_107);
        float _305 = 1.0 / _303;
        float _307 = _141 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = in.m_57.x;
    float _313 = in.m_57.y;
    float _315 = in.m_57.z;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _323 = 1.0 + _321;
    float _325 = 1.0 / _323;
    float _327 = _319 * _141;
    float _329 = exp2(_327);
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _337 = _335 != 0;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _341 = _339 != 0;
    float _343 = _315 * 2.0;
    float _345 = _311 * 2.0;
    float _347 = _313 * 2.0;
    float _349 = _313 + _311;
    bool _351 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _353 = isnan(0.0);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _359 = _355 || _357;
    float _361 = floor(_345);
    float _363 = _349 + (-1.0);
    float _365 = floor(_343);
    float _367 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _369 = -_329;
    float _371 = _369 + 1.0;
    float _373 = _359 ? _371 : 0.0;
    float _375 = floor(_347);
    bool _377 = _361 > 0.0;
    bool _379 = _365 > 0.0;
    bool _381 = _365 >= 0.0;
    bool _383 = isnan(_365);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    bool _391 = !_333;
    int _393 = _391 ? 0 : 1;
    int _395 = _389 ? 0 : 1;
    int _397 = abs(_393);
    int _399 = ~_395;
    int _401 = _399 + 1;
    int _403 = _401 + 1;
    bool _405 = _361 >= 0.0;
    bool _407 = isnan(_361);
    bool _409 = _405 || _407;
    bool _411 = isnan(0.0);
    bool _413 = _409 || _411;
    int _415 = _403;
    if (!_379)
    {
        int _417 = ~_395;
        int _419 = _417 + 1;
        _415 = _419;
    }
    int _421 = _415;
    float _423 = in.m_61.x;
    float _425 = in.m_61.y;
    float _427 = in.m_61.z;
    bool _429 = !_337;
    int _431 = _429 ? 0 : 1;
    bool _433 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _435 = isnan(1.0);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _441 = _437 || _439;
    bool _443 = _375 > 0.0;
    float _445 = float(_397);
    float _447 = float(_421);
    int _449 = _413 ? 0 : 1;
    int _451 = abs(_431);
    float _453 = _445 * _447;
    bool _455 = _375 >= 0.0;
    bool _457 = isnan(_375);
    bool _459 = _455 || _457;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    if (_441)
    {
        float _465 = _373 * _325;
        _143 = _465;
    }
    float _467 = _143;
    int _469 = ~_449;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    float _475 = _453 * (-2.0);
    int _477 = _473;
    if (!_377)
    {
        int _479 = ~_449;
        int _481 = _479 + 1;
        _477 = _481;
    }
    int _483 = _477;
    float _485 = _311 + (-0.5);
    int _487 = _463 ? 0 : 1;
    bool _489 = !_341;
    int _491 = _489 ? 0 : 1;
    float _493 = float(_451);
    int _495 = ~_487;
    int _497 = _495 + 1;
    int _499 = _497 + 1;
    float _501 = float(_483);
    float _503 = fma(_475, _423, _423);
    int _505 = _499;
    if (!_443)
    {
        int _507 = ~_487;
        int _509 = _507 + 1;
        _505 = _509;
    }
    int _511 = _505;
    float _513 = fma(_367, _475, _367);
    int _515 = abs(_491);
    float _517 = _313 + _315;
    float _519 = _493 * _501;
    float _521 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[196].x, _503);
    float _523 = float(_515);
    float _525 = _517 + (-1.0);
    float _527 = float(_511);
    float _529 = _519 * (-2.0);
    float _531 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _533 = _313 + (-0.5);
    float _535 = _523 * _527;
    float _537 = fma(_529, _425, _425);
    float _539 = as_type<float>(int(gl_VertexIndex));
    float _541 = fma(_531, _529, _531);
    float _543 = _315 + _311;
    float _545 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[196].y, _537);
    float _547 = _535 * (-2.0);
    float _549 = in.m_66.x;
    float _551 = in.m_66.y;
    float _553 = _543 + (-1.0);
    float _555 = fma(_541, _467, _545);
    float _557 = fma(_547, _427, _427);
    float _559 = _315 + (-0.5);
    float _561 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _563 = fma(_513, _467, _521);
    float _565 = _555 * 0.15915493667125701904296875;
    float _567 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[196].z, _557);
    float _569 = fma(_561, _547, _561);
    float _571 = _563 * 0.15915493667125701904296875;
    float _573 = _565 * 6.283185482025146484375;
    float _575 = sin(_573);
    float _577 = fma(_569, _467, _567);
    float _579 = _577 * 0.15915493667125701904296875;
    float _581 = _571 * 6.283185482025146484375;
    float _583 = sin(_581);
    int _585 = as_type<int>(_539) & 1;
    bool _587 = _585 != 0;
    int _589 = as_type<int>(_539) & 2;
    bool _591 = _589 != 0;
    float _593 = _277 * _549;
    float _595 = _279 * _551;
    bool _597 = !_587;
    float _599 = _597 ? (-0.5) : 0.5;
    float _601 = _571 * 6.283185482025146484375;
    float _603 = cos(_601);
    float _605 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _607 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _599);
    float _611 = _565 * 6.283185482025146484375;
    float _613 = cos(_611);
    bool _615 = !_591;
    float _617 = _615 ? (-0.5) : 0.5;
    float _619 = _605 * _609;
    float _621 = _583 * _575;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _617);
    float _625 = _579 * 6.283185482025146484375;
    float _627 = cos(_625);
    float _629 = _607 * _623;
    float _631 = in.m_50.x;
    float _633 = in.m_50.y;
    float _635 = in.m_50.z;
    float _637 = _579 * 6.283185482025146484375;
    float _639 = sin(_637);
    float _641 = _603 * _613;
    float _643 = _583 * _613;
    float _645 = _583 * _627;
    float _647 = _603 * _575;
    float _649 = _603 * _627;
    float _651 = _613 * _627;
    float _653 = _575 * _627;
    float _655 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _657 = _649 * _629;
    float _659 = fma(_639, _641, _621);
    float _661 = -_629;
    float _663 = _639 * _661;
    float _665 = -_647;
    float _667 = fma(_639, _643, _665);
    float _669 = _645 * _629;
    float _671 = fma(_639, _621, _641);
    float _673 = -_643;
    float _675 = fma(_639, _647, _673);
    float _677 = fma(_659, _619, _657);
    float _679 = fma(_651, _619, _663);
    float _681 = fma(_667, _619, _669);
    float _683 = fma(_675, _655, _677);
    float _685 = fma(_653, _655, _679);
    float _687 = fma(_671, _655, _681);
    float _689 = _633 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _691 = _633 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _693 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _695 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _697 = fma(_631, (*spvDescriptorSet0.vp_c10)._m0[4].x, _689);
    float _699 = fma(_631, (*spvDescriptorSet0.vp_c10)._m0[6].x, _691);
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _693);
    float _703 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _695);
    float _705 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[4].z, _697);
    float _707 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[6].z, _699);
    float _709 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _701);
    float _711 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _703);
    float _713 = _705 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _715 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _717 = _709 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _719 = _711 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _721 = _633 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _723 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _725 = _713 + _717;
    float _727 = _715 + _719;
    float _729 = fma(_631, (*spvDescriptorSet0.vp_c10)._m0[5].x, _721);
    float _731 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _723);
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _735 = _725 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _727 + _737;
    float _741 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[5].z, _729);
    float _743 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _731);
    float _745 = _735 * _735;
    float _747 = _739 * _739;
    float _749 = _741 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _751 = _743 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _753 = _745 + _747;
    float _755 = fma(_715, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _757 = _749 + _751;
    float _759 = sqrt(_753);
    float _761 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _763 = floor(_761);
    bool _765 = _759 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = _759 + _767;
    float _771 = floor(_755);
    float _773 = _719;
    float _775 = _741;
    float _777 = _751;
    float _779 = _769;
    float _781 = _671;
    float _783 = _757;
    float _785 = _745;
    float _787 = _747;
    if (_765)
    {
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _773 = _789;
    }
    float _791 = _773;
    if (_765)
    {
        float _793 = _757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _775 = _793;
    }
    float _795 = _775;
    if (!_765)
    {
        _777 = _725;
    }
    float _797 = _777;
    float _799 = _791;
    float _801 = _797;
    if (_765)
    {
        float _803 = _769 * _791;
        _799 = _803;
    }
    float _805 = _799;
    float _807 = _805;
    if (_765)
    {
        float _809 = rsqrt(_753);
        _779 = _809;
    }
    float _811 = _779;
    float _813 = _811;
    if (_765)
    {
        float _815 = _805 * 0.15915493667125701904296875;
        _807 = _815;
    }
    float _817 = _807;
    float _819 = _631;
    if (_765)
    {
        float _821 = _817 * 6.283185482025146484375;
        float _823 = sin(_821);
        _819 = _823;
    }
    float _825 = _819;
    float _827 = _825;
    if (_765)
    {
        float _829 = fma(_825, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _827 = _829;
    }
    float _831 = _827;
    float _833 = _831;
    if (_765)
    {
        float _835 = _811 * _831;
        _833 = _835;
    }
    float _837 = _833;
    if (!_765)
    {
        _813 = _727;
    }
    float _839 = _813;
    float _841 = -_763;
    float _843 = _761 + _841;
    float _845 = _839;
    if (_765)
    {
        float _847 = fma(_735, _837, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _801 = _847;
    }
    float _849 = _801;
    if (_765)
    {
        float _851 = fma(_739, _837, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _845 = _851;
    }
    float _853 = _845;
    float _855 = -_771;
    float _857 = _755 + _855;
    float _859 = fma(_849, 6.2500002968590706586837768554688e-05, 0.5);
    float _861 = fma(_853, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3298 = float2(_859, _861);
    float3 _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3298, float2(0.0), isnan(_3298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3298, float2(0.0), isnan(_3298)), level(0.0)).xyz;
    float _867 = _865.x;
    float _869 = _865.y;
    float _871 = _865.z;
    float2 _3314 = float2(_843, _857);
    float _873 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3314, float2(0.0), isnan(_3314)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3314, float2(0.0), isnan(_3314)), level(0.0)).x;
    float _875 = _649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _877 = 0.0;
    if (_765)
    {
        float _879 = _817 * 6.283185482025146484375;
        float _881 = cos(_879);
        _877 = _881;
    }
    float _883 = _877;
    bool _885 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _887 = isnan(_309);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _901 = _311 > 0.5;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _909 = _309 + _907;
    bool _911 = _313 > 0.5;
    float _913 = -_895;
    float _915 = _913 + 1.0;
    float _917 = 1.0 / _899;
    bool _919 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _921 = isnan(_309);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _933 = -_639;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _875);
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _939 = _937 != 0;
    float _941 = -_639;
    float _943 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _931);
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _947 = _945 != 0;
    float _949 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[26].z, _935);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _957 = _955 != 0;
    float _959 = _905 * _917;
    float _961 = _929 * _915;
    float _963 = -_929;
    float _965 = _963 + 1.0;
    float _967 = _649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _969 = fma(_959, _909, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _971 = -_617;
    int _973 = _911 ? as_type<int>(_971) : as_type<int>(_617);
    float _975 = _969 * _961;
    bool _977 = !_939;
    float _979 = _977 ? _617 : as_type<float>(_973);
    float _981 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[25].z, _943);
    bool _983 = _315 > 0.5;
    float _985 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[131].x, _975);
    float _987 = -_639;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].x, _967);
    float _991 = _659 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _993 = -_617;
    int _995 = _983 ? as_type<int>(_993) : as_type<int>(_617);
    float _997 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[132].x, _985);
    float _999 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _1001 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[25].x, _991);
    float _1003 = _675 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1005 = _659 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1007 = !_947;
    float _1009 = _1007 ? _617 : as_type<float>(_995);
    float _1011 = _659 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1013 = _617 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1015 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1003);
    float _1017 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1005);
    float _1019 = -_599;
    float _1021 = _911 ? _1019 : _599;
    float _1023 = _675 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1025 = _675 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1027 = _1013 * _999;
    float _1029 = _1013 * _981;
    float _1031 = _1013 * _949;
    bool _1033 = !_953;
    float _1035 = _1033 ? _599 : _1021;
    float _1037 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1023);
    float _1039 = _1021;
    if (_765)
    {
        float _1041 = _883 + (-1.0);
        _1039 = _1041;
    }
    float _1043 = _1039;
    float _1045 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1011);
    float _1047 = -_599;
    int _1049 = _901 ? as_type<int>(_1047) : as_type<int>(_599);
    float _1051 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1025);
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1055 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1017);
    float _1057 = 0.0;
    float _1059 = _1045;
    if (_765)
    {
        float _1061 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1061;
    }
    float _1063 = _1057;
    float _1065 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1001);
    float _1067 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1045);
    bool _1069 = !_957;
    float _1071 = _1069 ? _599 : as_type<float>(_1049);
    float _1073 = _599 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1075 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1037);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1079 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1015);
    float _1081 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1051);
    float _1083 = _1079;
    if (_765)
    {
        float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1087 = _849 + _1085;
        _781 = _1087;
    }
    float _1089 = _781;
    if (_765)
    {
        float _1091 = fma(_757, _883, _1063);
        _783 = _1091;
    }
    float _1093 = _783;
    if (_765)
    {
        float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1097 = _853 + _1095;
        _1059 = _1097;
    }
    float _1099 = _1059;
    float _1101 = _1071 + 0.5;
    if (_765)
    {
        float _1103 = _1089 * _1089;
        _785 = _1103;
    }
    float _1105 = _785;
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1111 = _1093 + _1109;
    float _1113 = fma(_1073, _1055, _1027);
    float _1115 = -_979;
    float _1117 = _1115 + 0.5;
    if (_765)
    {
        float _1119 = _1099 * _1099;
        _787 = _1119;
    }
    float _1121 = _787;
    float _1123 = fma(_1111, _1111, _1105);
    float _1125 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1127 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1131 = -_1009;
    float _1133 = _1131 + 0.5;
    float _1135 = _1123 + _1121;
    float _1137 = _1125 * _1053;
    float _1139 = _1127 * _1077;
    float _1141 = _1035 + 0.5;
    float _1143 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1145 = sqrt(_1135);
    float _1147 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1149 = _1143 * _1107;
    float _1151 = fma(_1073, _1065, _1029);
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1155 = fma(_1073, _1067, _1031);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1161 = _1147 * _1129;
    float _1163 = _1075 + _1113;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1079 + _1151;
    float _1175 = _1081 + _1155;
    out.m_68.x = _1137;
    out.m_68.y = _1139;
    bool _1177 = _1145 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1179 = isnan(_1145);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1185 = _1181 || _1183;
    out.m_70.x = _1161;
    out.m_70.y = _1149;
    out.m_72.x = _1169;
    out.m_72.y = _1165;
    out.m_72.z = _1171;
    out.m_72.w = _1167;
    out.m_74.x = _1163;
    out.m_74.y = _1173;
    out.m_74.z = _1175;
    float _1187 = _1137;
    float _1189 = _1145;
    if (!_1185)
    {
        _1083 = 1.0;
    }
    float _1191 = _1083;
    out.m_76.x = _867;
    out.m_76.y = _869;
    out.m_76.z = _871;
    bool _1193 = !_1185;
    float _1195 = _1191;
    if (!_1193)
    {
        bool _1197 = _1145 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1199 = isnan(_1145);
        bool _1201 = _1197 || _1199;
        bool _1203 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1205 = _1201 || _1203;
        if (!_1205)
        {
            float _1207 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1209 = _1145 + _1207;
            float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1213 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1211;
            float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1217 = _1215 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1219 = 1.0 / _1213;
            float _1221 = _1209 * _1219;
            float _1223 = fma(_1221, _1217, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1195 = _1223;
            _1225 = true;
        }
        else
        {
            bool _1227 = _1145 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1229 = isnan(_1145);
            bool _1231 = _1227 || _1229;
            bool _1233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1235 = _1231 || _1233;
            if (!_1235)
            {
                float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1239 = _1145 + _1237;
                float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1247 = _1245 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1249 = 1.0 / _1243;
                float _1251 = _1239 * _1249;
                float _1253 = fma(_1251, _1247, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1195 = _1253;
                _1225 = true;
            }
            else
            {
                _1195 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1225 = false;
    float _1255 = _1195;
    float _1257 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1259 = _1093 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1263 = _849 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1267 = _853 + _1265;
    float _1269 = fma(_1259, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1271 = fma(_1263, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1273 = fma(_1267, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1277 = _1269 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1281 = _1271 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1285 = _1273 + _1283;
    float _1287 = _1277 * _1277;
    float _1289 = fma(_1281, _1281, _1287);
    float _1291 = fma(_1285, _1285, _1289);
    float _1293 = rsqrt(_1291);
    float _1295 = sqrt(_1291);
    float _1297 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1299 = _1281 * _1297;
    float _1301 = _1285 * _1297;
    float _1303 = _1299 * _1299;
    float _1305 = _1301 * _1301;
    float _1307 = _1303 + _1305;
    float _1309 = sqrt(_1307);
    bool _1311 = _1309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1315 = _1309 + _1313;
    float _1317 = _849;
    float _1319 = _1315;
    float _1321 = _1277;
    float _1323 = _1299;
    if (_1311)
    {
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1317 = _1325;
    }
    float _1327 = _1317;
    float _1329 = _1327;
    if (_1311)
    {
        float _1331 = _1315 * _1327;
        _1319 = _1331;
    }
    float _1333 = _1319;
    if (_1311)
    {
        float _1335 = rsqrt(_1307);
        _1329 = _1335;
    }
    float _1337 = _1329;
    float _1339 = _1337;
    if (_1311)
    {
        float _1341 = _1333 * 0.15915493667125701904296875;
        _1187 = _1341;
    }
    float _1343 = _1187;
    float _1345 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1347 = _1285;
    if (_1311)
    {
        float _1349 = _1343 * 6.283185482025146484375;
        float _1351 = sin(_1349);
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = precise::max(0.0, _1345);
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1359 = _1255;
    float _1361 = _1355;
    if (_1311)
    {
        float _1363 = _1343 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        _1359 = _1365;
    }
    float _1367 = _1359;
    float _1369 = -_1297;
    float _1371 = -_1355;
    float _1373 = fma(_1277, _1369, _1371);
    if (_1311)
    {
        float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1375;
    }
    float _1377 = _1321;
    float _1379 = _1353;
    float _1381 = _1377;
    if (_1311)
    {
        float _1383 = fma(_1353, _1377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1379 = _1383;
    }
    float _1385 = _1379;
    float _1387 = _1385;
    if (!_1311)
    {
        _1381 = _1373;
    }
    float _1389 = _1381;
    float _1391 = _1389;
    if (_1311)
    {
        float _1393 = _1337 * _1385;
        _1189 = _1393;
    }
    float _1395 = _1189;
    if (!_1311)
    {
        _1387 = _1303;
    }
    float _1397 = _1387;
    float _1399 = _1397;
    float _1401 = _1367;
    if (_1311)
    {
        float _1403 = _1367 + (-1.0);
        _1361 = _1403;
    }
    float _1405 = _1361;
    float _1407 = _1405;
    if (_1311)
    {
        float _1409 = _1299 * _1395;
        _1323 = _1409;
    }
    float _1411 = _1323;
    if (_1311)
    {
        float _1413 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1339 = _1413;
    }
    float _1415 = _1339;
    if (!_1311)
    {
        _1407 = _1301;
    }
    float _1417 = _1407;
    float _1419 = _1417;
    if (_1311)
    {
        float _1421 = _1301 * _1395;
        _1419 = _1421;
    }
    float _1423 = _1419;
    if (_1311)
    {
        float _1425 = _1411 * _1411;
        _1399 = _1425;
    }
    float _1427 = _1399;
    if (_1311)
    {
        float _1429 = fma(_1373, _1367, _1415);
        _1391 = _1429;
    }
    float _1431 = _1391;
    if (!_1311)
    {
        _1401 = _1305;
    }
    float _1433 = _1401;
    float _1435 = _1433;
    if (_1311)
    {
        float _1437 = _1423 * _1423;
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1443 = fma(_1431, _1431, _1427);
    float _1445 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1447 = _1443 + _1439;
    float _1449 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1445);
    float _1451 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1455 = fma(_1295, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1453);
    float _1457 = precise::clamp(_1455, 0.0, 1.0);
    float _1459 = rsqrt(_1447);
    float _1461 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1449);
    float _1463 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1465 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1451);
    float _1467 = -_1457;
    float _1469 = _1467 + 1.0;
    float _1471 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1473 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1463);
    float _1475 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1465);
    float _1477 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1441);
    float _1479 = abs(_1469);
    float _1481 = log2(_1479);
    float _1483 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1485 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1487 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1477);
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1495 = _1459 * _1411;
    float _1497 = -_1487;
    float _1499 = fma(_1497, _1357, 1.0);
    float _1501 = _1459 * _1431;
    float _1503 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1493);
    float _1505 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1507 = _1459 * _1423;
    float _1509 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1511 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1503);
    float _1513 = -_1505;
    float _1515 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1513);
    float _1517 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1519 = log2(_1499);
    float _1521 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1511);
    float _1523 = -_1507;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1515);
    float _1527 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1529 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1531 = fma(_1525, -0.5, 0.5);
    float _1533 = fma(_1525, 0.5, 0.5);
    float _1535 = exp2(_1517);
    float _1537 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1527);
    float _1539 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1529);
    float _1541 = _1501 + 1.0;
    float _1543 = fma(_1533, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1545 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1537);
    float _1547 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1539);
    float _1549 = 1.0 / _1521;
    float _1551 = fma(_1533, _1543, -0.212114393711090087890625);
    float _1553 = _1519 * 0.693147182464599609375;
    float _1555 = fma(_1533, _1551, 1.570728778839111328125);
    float _1557 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1559 = sqrt(_1531);
    float _1561 = -_1501;
    float _1563 = fma(_1535, _1541, _1561);
    float _1565 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1545);
    float _1567 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1547);
    float _1569 = fma(_1563, 0.5, 0.5);
    float _1571 = _1565 * _1549;
    float _1573 = _1567 * _1549;
    float _1575 = fma(_1571, 0.5, 0.5);
    float _1577 = fma(_1573, -0.5, 0.5);
    float _1579 = _1559 * 0.636619746685028076171875;
    float _1581 = -_1555;
    float _1583 = fma(_1579, _1581, 1.0);
    float3 _4559 = float3(_1575, _1577, _1557);
    float _1585 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4559, float3(0.0), isnan(_4559)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4559, float3(0.0), isnan(_4559)), level(0.0)).x;
    float3 _4570 = float3(_1575, _1577, _1557);
    float4 _1588 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4570, float3(0.0), isnan(_4570)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4570, float3(0.0), isnan(_4570)), level(0.0)).xyzw;
    float _1590 = _1588.x;
    float _1592 = _1588.y;
    float _1594 = _1588.z;
    float _1596 = _1588.w;
    float2 _4586 = float2(_1583, _1569);
    float3 _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4586, float2(0.0), isnan(_4586)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4586, float2(0.0), isnan(_4586)), level(0.0)).xyz;
    float _1600 = _1598.x;
    float _1602 = _1598.y;
    float _1604 = _1598.z;
    float _1606 = _749 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1608 = _749 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1610 = -_873;
    float _1612 = _1610 + 1.0;
    bool _1614 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1616 = isnan(_1295);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1622 = _1618 || _1620;
    float _1624 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1606);
    float _1626 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1608);
    float _1628 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1624);
    float _1630 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1626);
    float _1632 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1634 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1636 = 1.0 / _1632;
    float _1638 = _1634 + _1632;
    float _1640 = _1638 * _1636;
    float _1642 = _1640 * 0.5;
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1646 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1644);
    float _1648 = 1.0 / _1646;
    float _1650 = in.m_78.x;
    float _1652 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1654 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1652);
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1658 = _1648 * _1656;
    float _1660 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1654);
    float _1662 = abs(_1658);
    float _1664 = log2(_1662);
    float _1666 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1660);
    float _1668 = _1666 + _1521;
    out.gl_Position.x = _1565;
    out.gl_Position.y = _1567;
    out.gl_Position.z = _1666;
    out.gl_Position.w = _1521;
    bool _1670 = _1658 <= 8000.0;
    bool _1672 = isnan(_1658);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan(8000.0);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = _1668 * 0.5;
    float _1684 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1686 = _1666;
    float _1688 = _1565;
    float _1690 = _1521;
    float _1692 = _1567;
    if (!_1622)
    {
        _1686 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1694 = _1686;
    float _1696 = exp2(_1684);
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1700 = precise::clamp(_1698, 0.0, 1.0);
    float _1702 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1704 = fma(_1700, -2.0, 3.0);
    float _1706 = _1700 * _1700;
    float _1708 = exp2(_1702);
    float _1710 = _1706 * _1704;
    float _1712 = -_1710;
    float _1714 = _1712 + 1.0;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1710);
    float _1718 = _1680 * _1716;
    float _1720 = -_1708;
    float _1722 = _1720 + 1.0;
    float _1724 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1726 = _1612 * _1724;
    float _1728 = precise::clamp(_1726, 0.0, 1.0);
    float _1730 = _1565 + _1521;
    float _1732 = _1694;
    float _1734 = _1694;
    if (!_1622)
    {
        _1688 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1736 = _1688;
    float _1738 = -_1728;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1742 = _1521 * 0.5;
    float _1744 = _1730 * 0.5;
    float _1746 = _1736;
    float _1748 = _1736;
    if (!_1622)
    {
        _1690 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1750 = _1690;
    float _1752 = _1740 * _1650;
    float _1754 = fma(_1567, -0.5, _1742);
    float _1756 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1758 = _1750;
    float _1760 = _1750;
    if (!_1622)
    {
        _1692 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1762 = _1692;
    float _1764 = _1752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _1744;
    out.m_80.y = _1754;
    out.m_80.z = _1682;
    out.m_80.w = _1521;
    out.m_82.x = _1764;
    float _1766 = _1756 * _1585;
    float _1768 = -_1756;
    float _1770 = _1768 + 1.0;
    float _1772 = _1596 * _1766;
    float _1774 = _1604 * _1766;
    float _1776 = _1596 * _1770;
    float _1778 = _1770;
    float _1780 = _1772;
    float _1782 = _1762;
    float _1784 = _1762;
    if (!_1622)
    {
        _1778 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1786 = _1778;
    float _1788 = fma(_1600, _1772, _1590);
    float _1790 = fma(_1602, _1772, _1592);
    float _1792 = fma(_1596, _1774, _1594);
    float _1794 = _1786;
    float _1796 = _1786;
    if (!_1622)
    {
        _1780 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1798 = _1780;
    out.m_84.x = _1788;
    out.m_84.y = _1790;
    out.m_84.z = _1792;
    out.m_84.w = _1776;
    bool _1800 = !_1622;
    float _1802 = _1798;
    float _1804 = _1798;
    if (!_1800)
    {
        bool _1806 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1808 = isnan(_1295);
        bool _1810 = _1806 || _1808;
        bool _1812 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1814 = _1810 || _1812;
        if (!_1814)
        {
            float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1818 = _1295 + _1816;
            float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1822 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1820;
            float _1824 = 1.0 / _1822;
            float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1828 = _1826 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1830 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1832 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1834 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1836 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1840 = _1838 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1844 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1846 = _1818 * _1824;
            float _1848 = precise::clamp(_1846, 0.0, 1.0);
            float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1852 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1854 = fma(_1848, _1828, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1856 = fma(_1848, _1852, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1858 = fma(_1848, _1832, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1860 = fma(_1848, _1836, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1862 = fma(_1848, _1840, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1864 = fma(_1848, _1844, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1760 = _1856;
            _1748 = _1862;
            _1796 = _1854;
            _1784 = _1860;
            _1734 = _1858;
            _1804 = _1864;
            _1866 = true;
        }
        else
        {
            bool _1868 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1870 = isnan(_1295);
            bool _1872 = _1868 || _1870;
            bool _1874 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1876 = _1872 || _1874;
            if (!_1876)
            {
                _1794 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1878 = _1794;
            _1796 = _1878;
            if (!_1876)
            {
                _1758 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1880 = _1758;
            _1760 = _1880;
            if (!_1876)
            {
                _1732 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1882 = _1732;
            _1734 = _1882;
            if (!_1876)
            {
                _1782 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1884 = _1782;
            _1784 = _1884;
            if (!_1876)
            {
                _1746 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1886 = _1746;
            _1748 = _1886;
            if (!_1876)
            {
                _1802 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1888 = _1802;
            bool _1890 = !_1876;
            _1804 = _1888;
            if (!_1890)
            {
                bool _1892 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1894 = isnan(_1295);
                bool _1896 = _1892 || _1894;
                bool _1898 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1900 = _1896 || _1898;
                if (!_1900)
                {
                    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1904 = _1295 + _1902;
                    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1908 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1906;
                    float _1910 = 1.0 / _1908;
                    float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1914 = _1912 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1918 = _1916 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1922 = _1920 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1926 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1930 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1932 = _1904 * _1910;
                    float _1934 = precise::clamp(_1932, 0.0, 1.0);
                    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1938 = _1936 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1940 = fma(_1934, _1914, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1942 = fma(_1934, _1938, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1944 = fma(_1934, _1918, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1946 = fma(_1934, _1922, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1948 = fma(_1934, _1926, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1950 = fma(_1934, _1930, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1760 = _1942;
                    _1748 = _1948;
                    _1796 = _1940;
                    _1784 = _1946;
                    _1734 = _1944;
                    _1804 = _1950;
                    _1866 = true;
                }
                else
                {
                    _1760 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1748 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1796 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1784 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1734 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1804 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1866 = false;
    float _1952 = _1760;
    float _1954 = _1748;
    float _1956 = _1796;
    float _1958 = _1784;
    float _1960 = _1734;
    float _1962 = _1804;
    float _1964 = fma(_1173, -0.5, 0.5);
    float _1966 = precise::clamp(_1964, 0.0, 1.0);
    float _1968 = -_1952;
    float _1970 = _1968 + _1954;
    float _1972 = -_1956;
    float _1974 = _1972 + _1958;
    float _1976 = -_1960;
    float _1978 = _1976 + _1962;
    bool _1980 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1982 = fma(_1966, _1970, _1952);
    float _1984 = fma(_1966, _1974, _1956);
    float _1986 = fma(_1966, _1978, _1960);
    float _1988 = _1982 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _1990 = fma(_1984, 0.298911988735198974609375, _1988);
    float _1992 = fma(_1986, 0.114477999508380889892578125, _1990);
    float _1994 = -_1992;
    float _1996 = _1984 + _1994;
    float _1998 = -_1992;
    float _2000 = _1982 + _1998;
    float _2002 = -_1992;
    float _2004 = _1986 + _2002;
    float _2006 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2008 = fma(_1996, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1992);
    float _2010 = fma(_2000, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1992);
    float _2012 = fma(_2004, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1992);
    out.m_53.x = _2006;
    out.m_88.x = _2008;
    out.m_88.y = _2010;
    out.m_88.z = _2012;
    if (!_1980)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2014 = -_1269;
    float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2018 = -_1271;
    float _2020 = _2018 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2022 = -_1273;
    float _2024 = _2022 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2026 = _2016 * _2016;
    float _2028 = fma(_2020, _2020, _2026);
    float _2030 = fma(_2024, _2024, _2028);
    float _2032 = sqrt(_2030);
    float _2034 = rsqrt(_2030);
    float _2036 = -_2032;
    float _2038 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2040 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2042 = precise::clamp(_2040, 0.0, 1.0);
    float _2044 = _2020 * _2034;
    float _2046 = _2016 * _2034;
    float _2048 = abs(_2042);
    float _2050 = log2(_2048);
    float _2052 = _2024 * _2034;
    float _2054 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2056 = _1173 * _2046;
    float _2058 = -_2046;
    float _2060 = -_2054;
    float _2062 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2060);
    float _2064 = fma(_1163, _2044, _2056);
    float _2066 = -_2052;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2062);
    float _2070 = fma(_1175, _2052, _2064);
    float _2072 = precise::clamp(_2070, 0.0, 1.0);
    float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2076 = _2068 + _2074;
    float _2078 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2080 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2082 = precise::clamp(_2080, 0.0, 1.0);
    float _2084 = exp2(_2078);
    float _2086 = _2084 * _2082;
    float _2088 = _2072 * _2086;
    float _2090 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2092 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2094 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2090;
    out.m_86.y = _2092;
    out.m_86.z = _2094;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1866 = false;
    bool _1225 = false;
    bool _301 = false;
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2151 = as_type<float>(_123);
        out.gl_Position.z = _2151;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_55.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2221 = as_type<float>(_161);
        out.gl_Position.z = _2221;
    }
    if (_153)
    {
        return out;
    }
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _165 = !_163;
    float _183;
    if (!_165)
    {
        float _167 = in.m_57.x;
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
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _195;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _201 = 1.0 / _197;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _207 = _199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _211 = _203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _213 = _205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _193 + _215;
    bool _219 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_193);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    out.m_59.x = _207;
    out.m_59.y = _211;
    out.m_59.z = _213;
    out.m_59.w = _209;
    float _231 = -_229;
    float _233 = _231 + 1.0;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _237 = _217 * _201;
    bool _239 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_193);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = _249 * _233;
    float _261 = fma(_253, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_257, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = -_249;
    float _267 = _265 + 1.0;
    float _269 = _261 * _259;
    float _271 = _263 * _259;
    float _273 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_235;
    float _299;
    if (!_281)
    {
        float _283 = in.m_57.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_107);
        float _305 = 1.0 / _303;
        float _307 = _141 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = in.m_57.x;
    float _313 = in.m_57.y;
    float _315 = in.m_57.z;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _323 = 1.0 + _321;
    float _325 = 1.0 / _323;
    float _327 = _319 * _141;
    float _329 = exp2(_327);
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _337 = _335 != 0;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _341 = _339 != 0;
    float _343 = _315 * 2.0;
    float _345 = _311 * 2.0;
    float _347 = _313 * 2.0;
    float _349 = _313 + _311;
    bool _351 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _353 = isnan(0.0);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _359 = _355 || _357;
    float _361 = floor(_345);
    float _363 = _349 + (-1.0);
    float _365 = floor(_343);
    float _367 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _369 = -_329;
    float _371 = _369 + 1.0;
    float _373 = _359 ? _371 : 0.0;
    float _375 = floor(_347);
    bool _377 = _361 > 0.0;
    bool _379 = _365 > 0.0;
    bool _381 = _365 >= 0.0;
    bool _383 = isnan(_365);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    bool _391 = !_333;
    int _393 = _391 ? 0 : 1;
    int _395 = _389 ? 0 : 1;
    int _397 = abs(_393);
    int _399 = ~_395;
    int _401 = _399 + 1;
    int _403 = _401 + 1;
    bool _405 = _361 >= 0.0;
    bool _407 = isnan(_361);
    bool _409 = _405 || _407;
    bool _411 = isnan(0.0);
    bool _413 = _409 || _411;
    int _415 = _403;
    if (!_379)
    {
        int _417 = ~_395;
        int _419 = _417 + 1;
        _415 = _419;
    }
    int _421 = _415;
    float _423 = in.m_61.x;
    float _425 = in.m_61.y;
    float _427 = in.m_61.z;
    bool _429 = !_337;
    int _431 = _429 ? 0 : 1;
    bool _433 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _435 = isnan(1.0);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _441 = _437 || _439;
    bool _443 = _375 > 0.0;
    float _445 = float(_397);
    float _447 = float(_421);
    int _449 = _413 ? 0 : 1;
    int _451 = abs(_431);
    float _453 = _445 * _447;
    bool _455 = _375 >= 0.0;
    bool _457 = isnan(_375);
    bool _459 = _455 || _457;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    if (_441)
    {
        float _465 = _373 * _325;
        _143 = _465;
    }
    float _467 = _143;
    int _469 = ~_449;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    float _475 = _453 * (-2.0);
    int _477 = _473;
    if (!_377)
    {
        int _479 = ~_449;
        int _481 = _479 + 1;
        _477 = _481;
    }
    int _483 = _477;
    float _485 = _311 + (-0.5);
    int _487 = _463 ? 0 : 1;
    bool _489 = !_341;
    int _491 = _489 ? 0 : 1;
    float _493 = float(_451);
    int _495 = ~_487;
    int _497 = _495 + 1;
    int _499 = _497 + 1;
    float _501 = float(_483);
    float _503 = fma(_475, _423, _423);
    int _505 = _499;
    if (!_443)
    {
        int _507 = ~_487;
        int _509 = _507 + 1;
        _505 = _509;
    }
    int _511 = _505;
    float _513 = fma(_367, _475, _367);
    int _515 = abs(_491);
    float _517 = _313 + _315;
    float _519 = _493 * _501;
    float _521 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[196].x, _503);
    float _523 = float(_515);
    float _525 = _517 + (-1.0);
    float _527 = float(_511);
    float _529 = _519 * (-2.0);
    float _531 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _533 = _313 + (-0.5);
    float _535 = _523 * _527;
    float _537 = fma(_529, _425, _425);
    float _539 = as_type<float>(int(gl_VertexIndex));
    float _541 = fma(_531, _529, _531);
    float _543 = _315 + _311;
    float _545 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[196].y, _537);
    float _547 = _535 * (-2.0);
    float _549 = in.m_66.x;
    float _551 = in.m_66.y;
    float _553 = _543 + (-1.0);
    float _555 = fma(_541, _467, _545);
    float _557 = fma(_547, _427, _427);
    float _559 = _315 + (-0.5);
    float _561 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _563 = fma(_513, _467, _521);
    float _565 = _555 * 0.15915493667125701904296875;
    float _567 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[196].z, _557);
    float _569 = fma(_561, _547, _561);
    float _571 = _563 * 0.15915493667125701904296875;
    float _573 = _565 * 6.283185482025146484375;
    float _575 = sin(_573);
    float _577 = fma(_569, _467, _567);
    float _579 = _577 * 0.15915493667125701904296875;
    float _581 = _571 * 6.283185482025146484375;
    float _583 = sin(_581);
    int _585 = as_type<int>(_539) & 1;
    bool _587 = _585 != 0;
    int _589 = as_type<int>(_539) & 2;
    bool _591 = _589 != 0;
    float _593 = _277 * _549;
    float _595 = _279 * _551;
    bool _597 = !_587;
    float _599 = _597 ? (-0.5) : 0.5;
    float _601 = _571 * 6.283185482025146484375;
    float _603 = cos(_601);
    float _605 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _607 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _599);
    float _611 = _565 * 6.283185482025146484375;
    float _613 = cos(_611);
    bool _615 = !_591;
    float _617 = _615 ? (-0.5) : 0.5;
    float _619 = _605 * _609;
    float _621 = _583 * _575;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _617);
    float _625 = _579 * 6.283185482025146484375;
    float _627 = cos(_625);
    float _629 = _607 * _623;
    float _631 = in.m_50.x;
    float _633 = in.m_50.y;
    float _635 = in.m_50.z;
    float _637 = _579 * 6.283185482025146484375;
    float _639 = sin(_637);
    float _641 = _603 * _613;
    float _643 = _583 * _613;
    float _645 = _583 * _627;
    float _647 = _603 * _575;
    float _649 = _603 * _627;
    float _651 = _613 * _627;
    float _653 = _575 * _627;
    float _655 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _657 = _649 * _629;
    float _659 = fma(_639, _641, _621);
    float _661 = -_629;
    float _663 = _639 * _661;
    float _665 = -_647;
    float _667 = fma(_639, _643, _665);
    float _669 = _645 * _629;
    float _671 = fma(_639, _621, _641);
    float _673 = -_643;
    float _675 = fma(_639, _647, _673);
    float _677 = fma(_659, _619, _657);
    float _679 = fma(_651, _619, _663);
    float _681 = fma(_667, _619, _669);
    float _683 = fma(_675, _655, _677);
    float _685 = fma(_653, _655, _679);
    float _687 = fma(_671, _655, _681);
    float _689 = _633 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _691 = _633 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _693 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _695 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _697 = fma(_631, (*spvDescriptorSet0.vp_c10)._m0[4].x, _689);
    float _699 = fma(_631, (*spvDescriptorSet0.vp_c10)._m0[6].x, _691);
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _693);
    float _703 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _695);
    float _705 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[4].z, _697);
    float _707 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[6].z, _699);
    float _709 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _701);
    float _711 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _703);
    float _713 = _705 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _715 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _717 = _709 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _719 = _711 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _721 = _633 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _723 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _725 = _713 + _717;
    float _727 = _715 + _719;
    float _729 = fma(_631, (*spvDescriptorSet0.vp_c10)._m0[5].x, _721);
    float _731 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _723);
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _735 = _725 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _727 + _737;
    float _741 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[5].z, _729);
    float _743 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _731);
    float _745 = _735 * _735;
    float _747 = _739 * _739;
    float _749 = _741 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _751 = _743 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _753 = _745 + _747;
    float _755 = fma(_715, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _757 = _749 + _751;
    float _759 = sqrt(_753);
    float _761 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _763 = floor(_761);
    bool _765 = _759 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = _759 + _767;
    float _771 = floor(_755);
    float _773 = _719;
    float _775 = _741;
    float _777 = _751;
    float _779 = _769;
    float _781 = _671;
    float _783 = _757;
    float _785 = _745;
    float _787 = _747;
    if (_765)
    {
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _773 = _789;
    }
    float _791 = _773;
    if (_765)
    {
        float _793 = _757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _775 = _793;
    }
    float _795 = _775;
    if (!_765)
    {
        _777 = _725;
    }
    float _797 = _777;
    float _799 = _791;
    float _801 = _797;
    if (_765)
    {
        float _803 = _769 * _791;
        _799 = _803;
    }
    float _805 = _799;
    float _807 = _805;
    if (_765)
    {
        float _809 = rsqrt(_753);
        _779 = _809;
    }
    float _811 = _779;
    float _813 = _811;
    if (_765)
    {
        float _815 = _805 * 0.15915493667125701904296875;
        _807 = _815;
    }
    float _817 = _807;
    float _819 = _631;
    if (_765)
    {
        float _821 = _817 * 6.283185482025146484375;
        float _823 = sin(_821);
        _819 = _823;
    }
    float _825 = _819;
    float _827 = _825;
    if (_765)
    {
        float _829 = fma(_825, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _827 = _829;
    }
    float _831 = _827;
    float _833 = _831;
    if (_765)
    {
        float _835 = _811 * _831;
        _833 = _835;
    }
    float _837 = _833;
    if (!_765)
    {
        _813 = _727;
    }
    float _839 = _813;
    float _841 = -_763;
    float _843 = _761 + _841;
    float _845 = _839;
    if (_765)
    {
        float _847 = fma(_735, _837, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _801 = _847;
    }
    float _849 = _801;
    if (_765)
    {
        float _851 = fma(_739, _837, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _845 = _851;
    }
    float _853 = _845;
    float _855 = -_771;
    float _857 = _755 + _855;
    float _859 = fma(_849, 6.2500002968590706586837768554688e-05, 0.5);
    float _861 = fma(_853, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3298 = float2(_859, _861);
    float3 _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3298, float2(0.0), isnan(_3298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3298, float2(0.0), isnan(_3298)), level(0.0)).xyz;
    float _867 = _865.x;
    float _869 = _865.y;
    float _871 = _865.z;
    float2 _3314 = float2(_843, _857);
    float _873 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3314, float2(0.0), isnan(_3314)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3314, float2(0.0), isnan(_3314)), level(0.0)).x;
    float _875 = _649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _877 = 0.0;
    if (_765)
    {
        float _879 = _817 * 6.283185482025146484375;
        float _881 = cos(_879);
        _877 = _881;
    }
    float _883 = _877;
    bool _885 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _887 = isnan(_309);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _901 = _311 > 0.5;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _909 = _309 + _907;
    bool _911 = _313 > 0.5;
    float _913 = -_895;
    float _915 = _913 + 1.0;
    float _917 = 1.0 / _899;
    bool _919 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _921 = isnan(_309);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _933 = -_639;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _875);
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _939 = _937 != 0;
    float _941 = -_639;
    float _943 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _931);
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _947 = _945 != 0;
    float _949 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[26].z, _935);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _957 = _955 != 0;
    float _959 = _905 * _917;
    float _961 = _929 * _915;
    float _963 = -_929;
    float _965 = _963 + 1.0;
    float _967 = _649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _969 = fma(_959, _909, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _971 = -_617;
    int _973 = _911 ? as_type<int>(_971) : as_type<int>(_617);
    float _975 = _969 * _961;
    bool _977 = !_939;
    float _979 = _977 ? _617 : as_type<float>(_973);
    float _981 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[25].z, _943);
    bool _983 = _315 > 0.5;
    float _985 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[131].x, _975);
    float _987 = -_639;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].x, _967);
    float _991 = _659 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _993 = -_617;
    int _995 = _983 ? as_type<int>(_993) : as_type<int>(_617);
    float _997 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[132].x, _985);
    float _999 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _1001 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[25].x, _991);
    float _1003 = _675 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1005 = _659 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1007 = !_947;
    float _1009 = _1007 ? _617 : as_type<float>(_995);
    float _1011 = _659 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1013 = _617 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1015 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1003);
    float _1017 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1005);
    float _1019 = -_599;
    float _1021 = _911 ? _1019 : _599;
    float _1023 = _675 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1025 = _675 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1027 = _1013 * _999;
    float _1029 = _1013 * _981;
    float _1031 = _1013 * _949;
    bool _1033 = !_953;
    float _1035 = _1033 ? _599 : _1021;
    float _1037 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1023);
    float _1039 = _1021;
    if (_765)
    {
        float _1041 = _883 + (-1.0);
        _1039 = _1041;
    }
    float _1043 = _1039;
    float _1045 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1011);
    float _1047 = -_599;
    int _1049 = _901 ? as_type<int>(_1047) : as_type<int>(_599);
    float _1051 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1025);
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1055 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1017);
    float _1057 = 0.0;
    float _1059 = _1045;
    if (_765)
    {
        float _1061 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1061;
    }
    float _1063 = _1057;
    float _1065 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1001);
    float _1067 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1045);
    bool _1069 = !_957;
    float _1071 = _1069 ? _599 : as_type<float>(_1049);
    float _1073 = _599 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1075 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1037);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1079 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1015);
    float _1081 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1051);
    float _1083 = _1079;
    if (_765)
    {
        float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1087 = _849 + _1085;
        _781 = _1087;
    }
    float _1089 = _781;
    if (_765)
    {
        float _1091 = fma(_757, _883, _1063);
        _783 = _1091;
    }
    float _1093 = _783;
    if (_765)
    {
        float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1097 = _853 + _1095;
        _1059 = _1097;
    }
    float _1099 = _1059;
    float _1101 = _1071 + 0.5;
    if (_765)
    {
        float _1103 = _1089 * _1089;
        _785 = _1103;
    }
    float _1105 = _785;
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1111 = _1093 + _1109;
    float _1113 = fma(_1073, _1055, _1027);
    float _1115 = -_979;
    float _1117 = _1115 + 0.5;
    if (_765)
    {
        float _1119 = _1099 * _1099;
        _787 = _1119;
    }
    float _1121 = _787;
    float _1123 = fma(_1111, _1111, _1105);
    float _1125 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1127 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1131 = -_1009;
    float _1133 = _1131 + 0.5;
    float _1135 = _1123 + _1121;
    float _1137 = _1125 * _1053;
    float _1139 = _1127 * _1077;
    float _1141 = _1035 + 0.5;
    float _1143 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1145 = sqrt(_1135);
    float _1147 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1149 = _1143 * _1107;
    float _1151 = fma(_1073, _1065, _1029);
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1155 = fma(_1073, _1067, _1031);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1161 = _1147 * _1129;
    float _1163 = _1075 + _1113;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1079 + _1151;
    float _1175 = _1081 + _1155;
    out.m_68.x = _1137;
    out.m_68.y = _1139;
    bool _1177 = _1145 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1179 = isnan(_1145);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1185 = _1181 || _1183;
    out.m_70.x = _1161;
    out.m_70.y = _1149;
    out.m_72.x = _1169;
    out.m_72.y = _1165;
    out.m_72.z = _1171;
    out.m_72.w = _1167;
    out.m_74.x = _1163;
    out.m_74.y = _1173;
    out.m_74.z = _1175;
    float _1187 = _1137;
    float _1189 = _1145;
    if (!_1185)
    {
        _1083 = 1.0;
    }
    float _1191 = _1083;
    out.m_76.x = _867;
    out.m_76.y = _869;
    out.m_76.z = _871;
    bool _1193 = !_1185;
    float _1195 = _1191;
    if (!_1193)
    {
        bool _1197 = _1145 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1199 = isnan(_1145);
        bool _1201 = _1197 || _1199;
        bool _1203 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1205 = _1201 || _1203;
        if (!_1205)
        {
            float _1207 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1209 = _1145 + _1207;
            float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1213 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1211;
            float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1217 = _1215 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1219 = 1.0 / _1213;
            float _1221 = _1209 * _1219;
            float _1223 = fma(_1221, _1217, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1195 = _1223;
            _1225 = true;
        }
        else
        {
            bool _1227 = _1145 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1229 = isnan(_1145);
            bool _1231 = _1227 || _1229;
            bool _1233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1235 = _1231 || _1233;
            if (!_1235)
            {
                float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1239 = _1145 + _1237;
                float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1247 = _1245 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1249 = 1.0 / _1243;
                float _1251 = _1239 * _1249;
                float _1253 = fma(_1251, _1247, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1195 = _1253;
                _1225 = true;
            }
            else
            {
                _1195 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1225 = false;
    float _1255 = _1195;
    float _1257 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1259 = _1093 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1263 = _849 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1267 = _853 + _1265;
    float _1269 = fma(_1259, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1271 = fma(_1263, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1273 = fma(_1267, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1277 = _1269 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1281 = _1271 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1285 = _1273 + _1283;
    float _1287 = _1277 * _1277;
    float _1289 = fma(_1281, _1281, _1287);
    float _1291 = fma(_1285, _1285, _1289);
    float _1293 = rsqrt(_1291);
    float _1295 = sqrt(_1291);
    float _1297 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1299 = _1281 * _1297;
    float _1301 = _1285 * _1297;
    float _1303 = _1299 * _1299;
    float _1305 = _1301 * _1301;
    float _1307 = _1303 + _1305;
    float _1309 = sqrt(_1307);
    bool _1311 = _1309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1315 = _1309 + _1313;
    float _1317 = _849;
    float _1319 = _1315;
    float _1321 = _1277;
    float _1323 = _1299;
    if (_1311)
    {
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1317 = _1325;
    }
    float _1327 = _1317;
    float _1329 = _1327;
    if (_1311)
    {
        float _1331 = _1315 * _1327;
        _1319 = _1331;
    }
    float _1333 = _1319;
    if (_1311)
    {
        float _1335 = rsqrt(_1307);
        _1329 = _1335;
    }
    float _1337 = _1329;
    float _1339 = _1337;
    if (_1311)
    {
        float _1341 = _1333 * 0.15915493667125701904296875;
        _1187 = _1341;
    }
    float _1343 = _1187;
    float _1345 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1347 = _1285;
    if (_1311)
    {
        float _1349 = _1343 * 6.283185482025146484375;
        float _1351 = sin(_1349);
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = precise::max(0.0, _1345);
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1359 = _1255;
    float _1361 = _1355;
    if (_1311)
    {
        float _1363 = _1343 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        _1359 = _1365;
    }
    float _1367 = _1359;
    float _1369 = -_1297;
    float _1371 = -_1355;
    float _1373 = fma(_1277, _1369, _1371);
    if (_1311)
    {
        float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1375;
    }
    float _1377 = _1321;
    float _1379 = _1353;
    float _1381 = _1377;
    if (_1311)
    {
        float _1383 = fma(_1353, _1377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1379 = _1383;
    }
    float _1385 = _1379;
    float _1387 = _1385;
    if (!_1311)
    {
        _1381 = _1373;
    }
    float _1389 = _1381;
    float _1391 = _1389;
    if (_1311)
    {
        float _1393 = _1337 * _1385;
        _1189 = _1393;
    }
    float _1395 = _1189;
    if (!_1311)
    {
        _1387 = _1303;
    }
    float _1397 = _1387;
    float _1399 = _1397;
    float _1401 = _1367;
    if (_1311)
    {
        float _1403 = _1367 + (-1.0);
        _1361 = _1403;
    }
    float _1405 = _1361;
    float _1407 = _1405;
    if (_1311)
    {
        float _1409 = _1299 * _1395;
        _1323 = _1409;
    }
    float _1411 = _1323;
    if (_1311)
    {
        float _1413 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1339 = _1413;
    }
    float _1415 = _1339;
    if (!_1311)
    {
        _1407 = _1301;
    }
    float _1417 = _1407;
    float _1419 = _1417;
    if (_1311)
    {
        float _1421 = _1301 * _1395;
        _1419 = _1421;
    }
    float _1423 = _1419;
    if (_1311)
    {
        float _1425 = _1411 * _1411;
        _1399 = _1425;
    }
    float _1427 = _1399;
    if (_1311)
    {
        float _1429 = fma(_1373, _1367, _1415);
        _1391 = _1429;
    }
    float _1431 = _1391;
    if (!_1311)
    {
        _1401 = _1305;
    }
    float _1433 = _1401;
    float _1435 = _1433;
    if (_1311)
    {
        float _1437 = _1423 * _1423;
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1443 = fma(_1431, _1431, _1427);
    float _1445 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1447 = _1443 + _1439;
    float _1449 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1445);
    float _1451 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1455 = fma(_1295, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1453);
    float _1457 = precise::clamp(_1455, 0.0, 1.0);
    float _1459 = rsqrt(_1447);
    float _1461 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1449);
    float _1463 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1465 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1451);
    float _1467 = -_1457;
    float _1469 = _1467 + 1.0;
    float _1471 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1473 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1463);
    float _1475 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1465);
    float _1477 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1441);
    float _1479 = abs(_1469);
    float _1481 = log2(_1479);
    float _1483 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1485 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1487 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1477);
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1495 = _1459 * _1411;
    float _1497 = -_1487;
    float _1499 = fma(_1497, _1357, 1.0);
    float _1501 = _1459 * _1431;
    float _1503 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1493);
    float _1505 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1507 = _1459 * _1423;
    float _1509 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1511 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1503);
    float _1513 = -_1505;
    float _1515 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1513);
    float _1517 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1519 = log2(_1499);
    float _1521 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1511);
    float _1523 = -_1507;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1515);
    float _1527 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1529 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1531 = fma(_1525, -0.5, 0.5);
    float _1533 = fma(_1525, 0.5, 0.5);
    float _1535 = exp2(_1517);
    float _1537 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1527);
    float _1539 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1529);
    float _1541 = _1501 + 1.0;
    float _1543 = fma(_1533, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1545 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1537);
    float _1547 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1539);
    float _1549 = 1.0 / _1521;
    float _1551 = fma(_1533, _1543, -0.212114393711090087890625);
    float _1553 = _1519 * 0.693147182464599609375;
    float _1555 = fma(_1533, _1551, 1.570728778839111328125);
    float _1557 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1559 = sqrt(_1531);
    float _1561 = -_1501;
    float _1563 = fma(_1535, _1541, _1561);
    float _1565 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1545);
    float _1567 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1547);
    float _1569 = fma(_1563, 0.5, 0.5);
    float _1571 = _1565 * _1549;
    float _1573 = _1567 * _1549;
    float _1575 = fma(_1571, 0.5, 0.5);
    float _1577 = fma(_1573, -0.5, 0.5);
    float _1579 = _1559 * 0.636619746685028076171875;
    float _1581 = -_1555;
    float _1583 = fma(_1579, _1581, 1.0);
    float3 _4559 = float3(_1575, _1577, _1557);
    float _1585 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4559, float3(0.0), isnan(_4559)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4559, float3(0.0), isnan(_4559)), level(0.0)).x;
    float3 _4570 = float3(_1575, _1577, _1557);
    float4 _1588 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4570, float3(0.0), isnan(_4570)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4570, float3(0.0), isnan(_4570)), level(0.0)).xyzw;
    float _1590 = _1588.x;
    float _1592 = _1588.y;
    float _1594 = _1588.z;
    float _1596 = _1588.w;
    float2 _4586 = float2(_1583, _1569);
    float3 _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4586, float2(0.0), isnan(_4586)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4586, float2(0.0), isnan(_4586)), level(0.0)).xyz;
    float _1600 = _1598.x;
    float _1602 = _1598.y;
    float _1604 = _1598.z;
    float _1606 = _749 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1608 = _749 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1610 = -_873;
    float _1612 = _1610 + 1.0;
    bool _1614 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1616 = isnan(_1295);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1622 = _1618 || _1620;
    float _1624 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1606);
    float _1626 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1608);
    float _1628 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1624);
    float _1630 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1626);
    float _1632 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1634 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1636 = 1.0 / _1632;
    float _1638 = _1634 + _1632;
    float _1640 = _1638 * _1636;
    float _1642 = _1640 * 0.5;
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1646 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1644);
    float _1648 = 1.0 / _1646;
    float _1650 = in.m_78.x;
    float _1652 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1654 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1652);
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1658 = _1648 * _1656;
    float _1660 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1654);
    float _1662 = abs(_1658);
    float _1664 = log2(_1662);
    float _1666 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1660);
    float _1668 = _1666 + _1521;
    out.gl_Position.x = _1565;
    out.gl_Position.y = _1567;
    out.gl_Position.z = _1666;
    out.gl_Position.w = _1521;
    bool _1670 = _1658 <= 8000.0;
    bool _1672 = isnan(_1658);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan(8000.0);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = _1668 * 0.5;
    float _1684 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1686 = _1666;
    float _1688 = _1565;
    float _1690 = _1521;
    float _1692 = _1567;
    if (!_1622)
    {
        _1686 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1694 = _1686;
    float _1696 = exp2(_1684);
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1700 = precise::clamp(_1698, 0.0, 1.0);
    float _1702 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1704 = fma(_1700, -2.0, 3.0);
    float _1706 = _1700 * _1700;
    float _1708 = exp2(_1702);
    float _1710 = _1706 * _1704;
    float _1712 = -_1710;
    float _1714 = _1712 + 1.0;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1710);
    float _1718 = _1680 * _1716;
    float _1720 = -_1708;
    float _1722 = _1720 + 1.0;
    float _1724 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1726 = _1612 * _1724;
    float _1728 = precise::clamp(_1726, 0.0, 1.0);
    float _1730 = _1565 + _1521;
    float _1732 = _1694;
    float _1734 = _1694;
    if (!_1622)
    {
        _1688 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1736 = _1688;
    float _1738 = -_1728;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1742 = _1521 * 0.5;
    float _1744 = _1730 * 0.5;
    float _1746 = _1736;
    float _1748 = _1736;
    if (!_1622)
    {
        _1690 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1750 = _1690;
    float _1752 = _1740 * _1650;
    float _1754 = fma(_1567, -0.5, _1742);
    float _1756 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1758 = _1750;
    float _1760 = _1750;
    if (!_1622)
    {
        _1692 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1762 = _1692;
    float _1764 = _1752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _1744;
    out.m_80.y = _1754;
    out.m_80.z = _1682;
    out.m_80.w = _1521;
    out.m_82.x = _1764;
    float _1766 = _1756 * _1585;
    float _1768 = -_1756;
    float _1770 = _1768 + 1.0;
    float _1772 = _1596 * _1766;
    float _1774 = _1604 * _1766;
    float _1776 = _1596 * _1770;
    float _1778 = _1770;
    float _1780 = _1772;
    float _1782 = _1762;
    float _1784 = _1762;
    if (!_1622)
    {
        _1778 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1786 = _1778;
    float _1788 = fma(_1600, _1772, _1590);
    float _1790 = fma(_1602, _1772, _1592);
    float _1792 = fma(_1596, _1774, _1594);
    float _1794 = _1786;
    float _1796 = _1786;
    if (!_1622)
    {
        _1780 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1798 = _1780;
    out.m_84.x = _1788;
    out.m_84.y = _1790;
    out.m_84.z = _1792;
    out.m_84.w = _1776;
    bool _1800 = !_1622;
    float _1802 = _1798;
    float _1804 = _1798;
    if (!_1800)
    {
        bool _1806 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1808 = isnan(_1295);
        bool _1810 = _1806 || _1808;
        bool _1812 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1814 = _1810 || _1812;
        if (!_1814)
        {
            float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1818 = _1295 + _1816;
            float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1822 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1820;
            float _1824 = 1.0 / _1822;
            float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1828 = _1826 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1830 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1832 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1834 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1836 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1840 = _1838 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1844 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1846 = _1818 * _1824;
            float _1848 = precise::clamp(_1846, 0.0, 1.0);
            float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1852 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1854 = fma(_1848, _1828, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1856 = fma(_1848, _1852, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1858 = fma(_1848, _1832, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1860 = fma(_1848, _1836, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1862 = fma(_1848, _1840, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1864 = fma(_1848, _1844, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1760 = _1856;
            _1748 = _1862;
            _1796 = _1854;
            _1784 = _1860;
            _1734 = _1858;
            _1804 = _1864;
            _1866 = true;
        }
        else
        {
            bool _1868 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1870 = isnan(_1295);
            bool _1872 = _1868 || _1870;
            bool _1874 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1876 = _1872 || _1874;
            if (!_1876)
            {
                _1794 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1878 = _1794;
            _1796 = _1878;
            if (!_1876)
            {
                _1758 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1880 = _1758;
            _1760 = _1880;
            if (!_1876)
            {
                _1732 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1882 = _1732;
            _1734 = _1882;
            if (!_1876)
            {
                _1782 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1884 = _1782;
            _1784 = _1884;
            if (!_1876)
            {
                _1746 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1886 = _1746;
            _1748 = _1886;
            if (!_1876)
            {
                _1802 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1888 = _1802;
            bool _1890 = !_1876;
            _1804 = _1888;
            if (!_1890)
            {
                bool _1892 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1894 = isnan(_1295);
                bool _1896 = _1892 || _1894;
                bool _1898 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1900 = _1896 || _1898;
                if (!_1900)
                {
                    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1904 = _1295 + _1902;
                    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1908 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1906;
                    float _1910 = 1.0 / _1908;
                    float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1914 = _1912 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1918 = _1916 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1922 = _1920 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1926 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1930 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1932 = _1904 * _1910;
                    float _1934 = precise::clamp(_1932, 0.0, 1.0);
                    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1938 = _1936 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1940 = fma(_1934, _1914, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1942 = fma(_1934, _1938, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1944 = fma(_1934, _1918, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1946 = fma(_1934, _1922, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1948 = fma(_1934, _1926, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1950 = fma(_1934, _1930, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1760 = _1942;
                    _1748 = _1948;
                    _1796 = _1940;
                    _1784 = _1946;
                    _1734 = _1944;
                    _1804 = _1950;
                    _1866 = true;
                }
                else
                {
                    _1760 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1748 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1796 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1784 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1734 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1804 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1866 = false;
    float _1952 = _1760;
    float _1954 = _1748;
    float _1956 = _1796;
    float _1958 = _1784;
    float _1960 = _1734;
    float _1962 = _1804;
    float _1964 = fma(_1173, -0.5, 0.5);
    float _1966 = precise::clamp(_1964, 0.0, 1.0);
    float _1968 = -_1952;
    float _1970 = _1968 + _1954;
    float _1972 = -_1956;
    float _1974 = _1972 + _1958;
    float _1976 = -_1960;
    float _1978 = _1976 + _1962;
    bool _1980 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1982 = fma(_1966, _1970, _1952);
    float _1984 = fma(_1966, _1974, _1956);
    float _1986 = fma(_1966, _1978, _1960);
    float _1988 = _1982 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _1990 = fma(_1984, 0.298911988735198974609375, _1988);
    float _1992 = fma(_1986, 0.114477999508380889892578125, _1990);
    float _1994 = -_1992;
    float _1996 = _1984 + _1994;
    float _1998 = -_1992;
    float _2000 = _1982 + _1998;
    float _2002 = -_1992;
    float _2004 = _1986 + _2002;
    float _2006 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2008 = fma(_1996, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1992);
    float _2010 = fma(_2000, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1992);
    float _2012 = fma(_2004, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1992);
    out.m_53.x = _2006;
    out.m_88.x = _2008;
    out.m_88.y = _2010;
    out.m_88.z = _2012;
    if (!_1980)
    {
        return out;
    }
    float _2014 = -_1269;
    float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2018 = -_1271;
    float _2020 = _2018 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2022 = -_1273;
    float _2024 = _2022 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2026 = _2016 * _2016;
    float _2028 = fma(_2020, _2020, _2026);
    float _2030 = fma(_2024, _2024, _2028);
    float _2032 = sqrt(_2030);
    float _2034 = rsqrt(_2030);
    float _2036 = -_2032;
    float _2038 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2040 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2042 = precise::clamp(_2040, 0.0, 1.0);
    float _2044 = _2020 * _2034;
    float _2046 = _2016 * _2034;
    float _2048 = abs(_2042);
    float _2050 = log2(_2048);
    float _2052 = _2024 * _2034;
    float _2054 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2056 = _1173 * _2046;
    float _2058 = -_2046;
    float _2060 = -_2054;
    float _2062 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2060);
    float _2064 = fma(_1163, _2044, _2056);
    float _2066 = -_2052;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2062);
    float _2070 = fma(_1175, _2052, _2064);
    float _2072 = precise::clamp(_2070, 0.0, 1.0);
    float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2076 = _2068 + _2074;
    float _2078 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2080 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2082 = precise::clamp(_2080, 0.0, 1.0);
    float _2084 = exp2(_2078);
    float _2086 = _2084 * _2082;
    float _2088 = _2072 * _2086;
    float _2090 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2092 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2094 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2090;
    out.m_86.y = _2092;
    out.m_86.z = _2094;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1866 = false;
    bool _1225 = false;
    bool _301 = false;
    bool _185 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2151 = as_type<float>(_123);
        out.gl_Position.z = _2151;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_55.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = _141;
    if (_137)
    {
        float _145 = float(_107);
        _117 = _145;
    }
    float _147 = _117;
    bool _149 = _141 >= _147;
    bool _151 = !_137;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_53.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2221 = as_type<float>(_161);
        out.gl_Position.z = _2221;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _165 = !_163;
    float _183;
    if (!_165)
    {
        float _167 = in.m_57.x;
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
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _195;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _201 = 1.0 / _197;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _205 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _207 = _199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _211 = _203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _213 = _205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _217 = _193 + _215;
    bool _219 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_193);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    out.m_59.x = _207;
    out.m_59.y = _211;
    out.m_59.z = _213;
    out.m_59.w = _209;
    float _231 = -_229;
    float _233 = _231 + 1.0;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _237 = _217 * _201;
    bool _239 = _193 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_193);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = _249 * _233;
    float _261 = fma(_253, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_257, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = -_249;
    float _267 = _265 + 1.0;
    float _269 = _261 * _259;
    float _271 = _263 * _259;
    float _273 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_235;
    float _299;
    if (!_281)
    {
        float _283 = in.m_57.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_107);
        float _305 = 1.0 / _303;
        float _307 = _141 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = in.m_57.x;
    float _313 = in.m_57.y;
    float _315 = in.m_57.z;
    float _317 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _319 = log2(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _323 = 1.0 + _321;
    float _325 = 1.0 / _323;
    float _327 = _319 * _141;
    float _329 = exp2(_327);
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _337 = _335 != 0;
    int _339 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _341 = _339 != 0;
    float _343 = _315 * 2.0;
    float _345 = _311 * 2.0;
    float _347 = _313 * 2.0;
    float _349 = _313 + _311;
    bool _351 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _353 = isnan(0.0);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _359 = _355 || _357;
    float _361 = floor(_345);
    float _363 = _349 + (-1.0);
    float _365 = floor(_343);
    float _367 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _369 = -_329;
    float _371 = _369 + 1.0;
    float _373 = _359 ? _371 : 0.0;
    float _375 = floor(_347);
    bool _377 = _361 > 0.0;
    bool _379 = _365 > 0.0;
    bool _381 = _365 >= 0.0;
    bool _383 = isnan(_365);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    bool _391 = !_333;
    int _393 = _391 ? 0 : 1;
    int _395 = _389 ? 0 : 1;
    int _397 = abs(_393);
    int _399 = ~_395;
    int _401 = _399 + 1;
    int _403 = _401 + 1;
    bool _405 = _361 >= 0.0;
    bool _407 = isnan(_361);
    bool _409 = _405 || _407;
    bool _411 = isnan(0.0);
    bool _413 = _409 || _411;
    int _415 = _403;
    if (!_379)
    {
        int _417 = ~_395;
        int _419 = _417 + 1;
        _415 = _419;
    }
    int _421 = _415;
    float _423 = in.m_61.x;
    float _425 = in.m_61.y;
    float _427 = in.m_61.z;
    bool _429 = !_337;
    int _431 = _429 ? 0 : 1;
    bool _433 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _435 = isnan(1.0);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _441 = _437 || _439;
    bool _443 = _375 > 0.0;
    float _445 = float(_397);
    float _447 = float(_421);
    int _449 = _413 ? 0 : 1;
    int _451 = abs(_431);
    float _453 = _445 * _447;
    bool _455 = _375 >= 0.0;
    bool _457 = isnan(_375);
    bool _459 = _455 || _457;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    if (_441)
    {
        float _465 = _373 * _325;
        _143 = _465;
    }
    float _467 = _143;
    int _469 = ~_449;
    int _471 = _469 + 1;
    int _473 = _471 + 1;
    float _475 = _453 * (-2.0);
    int _477 = _473;
    if (!_377)
    {
        int _479 = ~_449;
        int _481 = _479 + 1;
        _477 = _481;
    }
    int _483 = _477;
    float _485 = _311 + (-0.5);
    int _487 = _463 ? 0 : 1;
    bool _489 = !_341;
    int _491 = _489 ? 0 : 1;
    float _493 = float(_451);
    int _495 = ~_487;
    int _497 = _495 + 1;
    int _499 = _497 + 1;
    float _501 = float(_483);
    float _503 = fma(_475, _423, _423);
    int _505 = _499;
    if (!_443)
    {
        int _507 = ~_487;
        int _509 = _507 + 1;
        _505 = _509;
    }
    int _511 = _505;
    float _513 = fma(_367, _475, _367);
    int _515 = abs(_491);
    float _517 = _313 + _315;
    float _519 = _493 * _501;
    float _521 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[196].x, _503);
    float _523 = float(_515);
    float _525 = _517 + (-1.0);
    float _527 = float(_511);
    float _529 = _519 * (-2.0);
    float _531 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _533 = _313 + (-0.5);
    float _535 = _523 * _527;
    float _537 = fma(_529, _425, _425);
    float _539 = as_type<float>(int(gl_VertexIndex));
    float _541 = fma(_531, _529, _531);
    float _543 = _315 + _311;
    float _545 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[196].y, _537);
    float _547 = _535 * (-2.0);
    float _549 = in.m_66.x;
    float _551 = in.m_66.y;
    float _553 = _543 + (-1.0);
    float _555 = fma(_541, _467, _545);
    float _557 = fma(_547, _427, _427);
    float _559 = _315 + (-0.5);
    float _561 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _563 = fma(_513, _467, _521);
    float _565 = _555 * 0.15915493667125701904296875;
    float _567 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[196].z, _557);
    float _569 = fma(_561, _547, _561);
    float _571 = _563 * 0.15915493667125701904296875;
    float _573 = _565 * 6.283185482025146484375;
    float _575 = sin(_573);
    float _577 = fma(_569, _467, _567);
    float _579 = _577 * 0.15915493667125701904296875;
    float _581 = _571 * 6.283185482025146484375;
    float _583 = sin(_581);
    int _585 = as_type<int>(_539) & 1;
    bool _587 = _585 != 0;
    int _589 = as_type<int>(_539) & 2;
    bool _591 = _589 != 0;
    float _593 = _277 * _549;
    float _595 = _279 * _551;
    bool _597 = !_587;
    float _599 = _597 ? (-0.5) : 0.5;
    float _601 = _571 * 6.283185482025146484375;
    float _603 = cos(_601);
    float _605 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _607 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _599);
    float _611 = _565 * 6.283185482025146484375;
    float _613 = cos(_611);
    bool _615 = !_591;
    float _617 = _615 ? (-0.5) : 0.5;
    float _619 = _605 * _609;
    float _621 = _583 * _575;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _617);
    float _625 = _579 * 6.283185482025146484375;
    float _627 = cos(_625);
    float _629 = _607 * _623;
    float _631 = in.m_50.x;
    float _633 = in.m_50.y;
    float _635 = in.m_50.z;
    float _637 = _579 * 6.283185482025146484375;
    float _639 = sin(_637);
    float _641 = _603 * _613;
    float _643 = _583 * _613;
    float _645 = _583 * _627;
    float _647 = _603 * _575;
    float _649 = _603 * _627;
    float _651 = _613 * _627;
    float _653 = _575 * _627;
    float _655 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _657 = _649 * _629;
    float _659 = fma(_639, _641, _621);
    float _661 = -_629;
    float _663 = _639 * _661;
    float _665 = -_647;
    float _667 = fma(_639, _643, _665);
    float _669 = _645 * _629;
    float _671 = fma(_639, _621, _641);
    float _673 = -_643;
    float _675 = fma(_639, _647, _673);
    float _677 = fma(_659, _619, _657);
    float _679 = fma(_651, _619, _663);
    float _681 = fma(_667, _619, _669);
    float _683 = fma(_675, _655, _677);
    float _685 = fma(_653, _655, _679);
    float _687 = fma(_671, _655, _681);
    float _689 = _633 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _691 = _633 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _693 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _695 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _697 = fma(_631, (*spvDescriptorSet0.vp_c10)._m0[4].x, _689);
    float _699 = fma(_631, (*spvDescriptorSet0.vp_c10)._m0[6].x, _691);
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].x, _693);
    float _703 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].x, _695);
    float _705 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[4].z, _697);
    float _707 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[6].z, _699);
    float _709 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].z, _701);
    float _711 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].z, _703);
    float _713 = _705 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _715 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _717 = _709 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _719 = _711 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _721 = _633 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _723 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _725 = _713 + _717;
    float _727 = _715 + _719;
    float _729 = fma(_631, (*spvDescriptorSet0.vp_c10)._m0[5].x, _721);
    float _731 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].x, _723);
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _735 = _725 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _727 + _737;
    float _741 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[5].z, _729);
    float _743 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].z, _731);
    float _745 = _735 * _735;
    float _747 = _739 * _739;
    float _749 = _741 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _751 = _743 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _753 = _745 + _747;
    float _755 = fma(_715, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _757 = _749 + _751;
    float _759 = sqrt(_753);
    float _761 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _763 = floor(_761);
    bool _765 = _759 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = _759 + _767;
    float _771 = floor(_755);
    float _773 = _719;
    float _775 = _741;
    float _777 = _751;
    float _779 = _769;
    float _781 = _671;
    float _783 = _757;
    float _785 = _745;
    float _787 = _747;
    if (_765)
    {
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _773 = _789;
    }
    float _791 = _773;
    if (_765)
    {
        float _793 = _757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _775 = _793;
    }
    float _795 = _775;
    if (!_765)
    {
        _777 = _725;
    }
    float _797 = _777;
    float _799 = _791;
    float _801 = _797;
    if (_765)
    {
        float _803 = _769 * _791;
        _799 = _803;
    }
    float _805 = _799;
    float _807 = _805;
    if (_765)
    {
        float _809 = rsqrt(_753);
        _779 = _809;
    }
    float _811 = _779;
    float _813 = _811;
    if (_765)
    {
        float _815 = _805 * 0.15915493667125701904296875;
        _807 = _815;
    }
    float _817 = _807;
    float _819 = _631;
    if (_765)
    {
        float _821 = _817 * 6.283185482025146484375;
        float _823 = sin(_821);
        _819 = _823;
    }
    float _825 = _819;
    float _827 = _825;
    if (_765)
    {
        float _829 = fma(_825, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _827 = _829;
    }
    float _831 = _827;
    float _833 = _831;
    if (_765)
    {
        float _835 = _811 * _831;
        _833 = _835;
    }
    float _837 = _833;
    if (!_765)
    {
        _813 = _727;
    }
    float _839 = _813;
    float _841 = -_763;
    float _843 = _761 + _841;
    float _845 = _839;
    if (_765)
    {
        float _847 = fma(_735, _837, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _801 = _847;
    }
    float _849 = _801;
    if (_765)
    {
        float _851 = fma(_739, _837, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _845 = _851;
    }
    float _853 = _845;
    float _855 = -_771;
    float _857 = _755 + _855;
    float _859 = fma(_849, 6.2500002968590706586837768554688e-05, 0.5);
    float _861 = fma(_853, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3298 = float2(_859, _861);
    float3 _865 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3298, float2(0.0), isnan(_3298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3298, float2(0.0), isnan(_3298)), level(0.0)).xyz;
    float _867 = _865.x;
    float _869 = _865.y;
    float _871 = _865.z;
    float2 _3314 = float2(_843, _857);
    float _873 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3314, float2(0.0), isnan(_3314)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3314, float2(0.0), isnan(_3314)), level(0.0)).x;
    float _875 = _649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _877 = 0.0;
    if (_765)
    {
        float _879 = _817 * 6.283185482025146484375;
        float _881 = cos(_879);
        _877 = _881;
    }
    float _883 = _877;
    bool _885 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _887 = isnan(_309);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _901 = _311 > 0.5;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _909 = _309 + _907;
    bool _911 = _313 > 0.5;
    float _913 = -_895;
    float _915 = _913 + 1.0;
    float _917 = 1.0 / _899;
    bool _919 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _921 = isnan(_309);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _933 = -_639;
    float _935 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _875);
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _939 = _937 != 0;
    float _941 = -_639;
    float _943 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[25].x, _931);
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _947 = _945 != 0;
    float _949 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[26].z, _935);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _957 = _955 != 0;
    float _959 = _905 * _917;
    float _961 = _929 * _915;
    float _963 = -_929;
    float _965 = _963 + 1.0;
    float _967 = _649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _969 = fma(_959, _909, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _971 = -_617;
    int _973 = _911 ? as_type<int>(_971) : as_type<int>(_617);
    float _975 = _969 * _961;
    bool _977 = !_939;
    float _979 = _977 ? _617 : as_type<float>(_973);
    float _981 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[25].z, _943);
    bool _983 = _315 > 0.5;
    float _985 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[131].x, _975);
    float _987 = -_639;
    float _989 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[24].x, _967);
    float _991 = _659 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _993 = -_617;
    int _995 = _983 ? as_type<int>(_993) : as_type<int>(_617);
    float _997 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[132].x, _985);
    float _999 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[24].z, _989);
    float _1001 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[25].x, _991);
    float _1003 = _675 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1005 = _659 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1007 = !_947;
    float _1009 = _1007 ? _617 : as_type<float>(_995);
    float _1011 = _659 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1013 = _617 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1015 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1003);
    float _1017 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1005);
    float _1019 = -_599;
    float _1021 = _911 ? _1019 : _599;
    float _1023 = _675 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1025 = _675 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1027 = _1013 * _999;
    float _1029 = _1013 * _981;
    float _1031 = _1013 * _949;
    bool _1033 = !_953;
    float _1035 = _1033 ? _599 : _1021;
    float _1037 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1023);
    float _1039 = _1021;
    if (_765)
    {
        float _1041 = _883 + (-1.0);
        _1039 = _1041;
    }
    float _1043 = _1039;
    float _1045 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1011);
    float _1047 = -_599;
    int _1049 = _901 ? as_type<int>(_1047) : as_type<int>(_599);
    float _1051 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1025);
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1055 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1017);
    float _1057 = 0.0;
    float _1059 = _1045;
    if (_765)
    {
        float _1061 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1057 = _1061;
    }
    float _1063 = _1057;
    float _1065 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1001);
    float _1067 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1045);
    bool _1069 = !_957;
    float _1071 = _1069 ? _599 : as_type<float>(_1049);
    float _1073 = _599 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1075 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1037);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1079 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1015);
    float _1081 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1051);
    float _1083 = _1079;
    if (_765)
    {
        float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1087 = _849 + _1085;
        _781 = _1087;
    }
    float _1089 = _781;
    if (_765)
    {
        float _1091 = fma(_757, _883, _1063);
        _783 = _1091;
    }
    float _1093 = _783;
    if (_765)
    {
        float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1097 = _853 + _1095;
        _1059 = _1097;
    }
    float _1099 = _1059;
    float _1101 = _1071 + 0.5;
    if (_765)
    {
        float _1103 = _1089 * _1089;
        _785 = _1103;
    }
    float _1105 = _785;
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1111 = _1093 + _1109;
    float _1113 = fma(_1073, _1055, _1027);
    float _1115 = -_979;
    float _1117 = _1115 + 0.5;
    if (_765)
    {
        float _1119 = _1099 * _1099;
        _787 = _1119;
    }
    float _1121 = _787;
    float _1123 = fma(_1111, _1111, _1105);
    float _1125 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1127 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1131 = -_1009;
    float _1133 = _1131 + 0.5;
    float _1135 = _1123 + _1121;
    float _1137 = _1125 * _1053;
    float _1139 = _1127 * _1077;
    float _1141 = _1035 + 0.5;
    float _1143 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1145 = sqrt(_1135);
    float _1147 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1149 = _1143 * _1107;
    float _1151 = fma(_1073, _1065, _1029);
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1155 = fma(_1073, _1067, _1031);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1161 = _1147 * _1129;
    float _1163 = _1075 + _1113;
    float _1165 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1169 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1079 + _1151;
    float _1175 = _1081 + _1155;
    out.m_68.x = _1137;
    out.m_68.y = _1139;
    bool _1177 = _1145 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1179 = isnan(_1145);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1185 = _1181 || _1183;
    out.m_70.x = _1161;
    out.m_70.y = _1149;
    out.m_72.x = _1169;
    out.m_72.y = _1165;
    out.m_72.z = _1171;
    out.m_72.w = _1167;
    out.m_74.x = _1163;
    out.m_74.y = _1173;
    out.m_74.z = _1175;
    float _1187 = _1137;
    float _1189 = _1145;
    if (!_1185)
    {
        _1083 = 1.0;
    }
    float _1191 = _1083;
    out.m_76.x = _867;
    out.m_76.y = _869;
    out.m_76.z = _871;
    bool _1193 = !_1185;
    float _1195 = _1191;
    if (!_1193)
    {
        bool _1197 = _1145 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1199 = isnan(_1145);
        bool _1201 = _1197 || _1199;
        bool _1203 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1205 = _1201 || _1203;
        if (!_1205)
        {
            float _1207 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1209 = _1145 + _1207;
            float _1211 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1213 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1211;
            float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1217 = _1215 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1219 = 1.0 / _1213;
            float _1221 = _1209 * _1219;
            float _1223 = fma(_1221, _1217, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1195 = _1223;
            _1225 = true;
        }
        else
        {
            bool _1227 = _1145 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1229 = isnan(_1145);
            bool _1231 = _1227 || _1229;
            bool _1233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1235 = _1231 || _1233;
            if (!_1235)
            {
                float _1237 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1239 = _1145 + _1237;
                float _1241 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1243 = _1241 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1247 = _1245 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1249 = 1.0 / _1243;
                float _1251 = _1239 * _1249;
                float _1253 = fma(_1251, _1247, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1195 = _1253;
                _1225 = true;
            }
            else
            {
                _1195 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1225 = false;
    float _1255 = _1195;
    float _1257 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1259 = _1093 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1263 = _849 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1267 = _853 + _1265;
    float _1269 = fma(_1259, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1271 = fma(_1263, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1273 = fma(_1267, _1255, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1277 = _1269 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1281 = _1271 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1285 = _1273 + _1283;
    float _1287 = _1277 * _1277;
    float _1289 = fma(_1281, _1281, _1287);
    float _1291 = fma(_1285, _1285, _1289);
    float _1293 = rsqrt(_1291);
    float _1295 = sqrt(_1291);
    float _1297 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1299 = _1281 * _1297;
    float _1301 = _1285 * _1297;
    float _1303 = _1299 * _1299;
    float _1305 = _1301 * _1301;
    float _1307 = _1303 + _1305;
    float _1309 = sqrt(_1307);
    bool _1311 = _1309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1315 = _1309 + _1313;
    float _1317 = _849;
    float _1319 = _1315;
    float _1321 = _1277;
    float _1323 = _1299;
    if (_1311)
    {
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1317 = _1325;
    }
    float _1327 = _1317;
    float _1329 = _1327;
    if (_1311)
    {
        float _1331 = _1315 * _1327;
        _1319 = _1331;
    }
    float _1333 = _1319;
    if (_1311)
    {
        float _1335 = rsqrt(_1307);
        _1329 = _1335;
    }
    float _1337 = _1329;
    float _1339 = _1337;
    if (_1311)
    {
        float _1341 = _1333 * 0.15915493667125701904296875;
        _1187 = _1341;
    }
    float _1343 = _1187;
    float _1345 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1347 = _1285;
    if (_1311)
    {
        float _1349 = _1343 * 6.283185482025146484375;
        float _1351 = sin(_1349);
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = precise::max(0.0, _1345);
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1359 = _1255;
    float _1361 = _1355;
    if (_1311)
    {
        float _1363 = _1343 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        _1359 = _1365;
    }
    float _1367 = _1359;
    float _1369 = -_1297;
    float _1371 = -_1355;
    float _1373 = fma(_1277, _1369, _1371);
    if (_1311)
    {
        float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1375;
    }
    float _1377 = _1321;
    float _1379 = _1353;
    float _1381 = _1377;
    if (_1311)
    {
        float _1383 = fma(_1353, _1377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1379 = _1383;
    }
    float _1385 = _1379;
    float _1387 = _1385;
    if (!_1311)
    {
        _1381 = _1373;
    }
    float _1389 = _1381;
    float _1391 = _1389;
    if (_1311)
    {
        float _1393 = _1337 * _1385;
        _1189 = _1393;
    }
    float _1395 = _1189;
    if (!_1311)
    {
        _1387 = _1303;
    }
    float _1397 = _1387;
    float _1399 = _1397;
    float _1401 = _1367;
    if (_1311)
    {
        float _1403 = _1367 + (-1.0);
        _1361 = _1403;
    }
    float _1405 = _1361;
    float _1407 = _1405;
    if (_1311)
    {
        float _1409 = _1299 * _1395;
        _1323 = _1409;
    }
    float _1411 = _1323;
    if (_1311)
    {
        float _1413 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1339 = _1413;
    }
    float _1415 = _1339;
    if (!_1311)
    {
        _1407 = _1301;
    }
    float _1417 = _1407;
    float _1419 = _1417;
    if (_1311)
    {
        float _1421 = _1301 * _1395;
        _1419 = _1421;
    }
    float _1423 = _1419;
    if (_1311)
    {
        float _1425 = _1411 * _1411;
        _1399 = _1425;
    }
    float _1427 = _1399;
    if (_1311)
    {
        float _1429 = fma(_1373, _1367, _1415);
        _1391 = _1429;
    }
    float _1431 = _1391;
    if (!_1311)
    {
        _1401 = _1305;
    }
    float _1433 = _1401;
    float _1435 = _1433;
    if (_1311)
    {
        float _1437 = _1423 * _1423;
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1443 = fma(_1431, _1431, _1427);
    float _1445 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1447 = _1443 + _1439;
    float _1449 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1445);
    float _1451 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1455 = fma(_1295, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1453);
    float _1457 = precise::clamp(_1455, 0.0, 1.0);
    float _1459 = rsqrt(_1447);
    float _1461 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1449);
    float _1463 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1465 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1451);
    float _1467 = -_1457;
    float _1469 = _1467 + 1.0;
    float _1471 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1473 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1463);
    float _1475 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1465);
    float _1477 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1441);
    float _1479 = abs(_1469);
    float _1481 = log2(_1479);
    float _1483 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1485 = _1475 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1487 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1477);
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1495 = _1459 * _1411;
    float _1497 = -_1487;
    float _1499 = fma(_1497, _1357, 1.0);
    float _1501 = _1459 * _1431;
    float _1503 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1493);
    float _1505 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1507 = _1459 * _1423;
    float _1509 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1511 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1503);
    float _1513 = -_1505;
    float _1515 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1513);
    float _1517 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1519 = log2(_1499);
    float _1521 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1511);
    float _1523 = -_1507;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1515);
    float _1527 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1529 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1531 = fma(_1525, -0.5, 0.5);
    float _1533 = fma(_1525, 0.5, 0.5);
    float _1535 = exp2(_1517);
    float _1537 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1527);
    float _1539 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1529);
    float _1541 = _1501 + 1.0;
    float _1543 = fma(_1533, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1545 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1537);
    float _1547 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1539);
    float _1549 = 1.0 / _1521;
    float _1551 = fma(_1533, _1543, -0.212114393711090087890625);
    float _1553 = _1519 * 0.693147182464599609375;
    float _1555 = fma(_1533, _1551, 1.570728778839111328125);
    float _1557 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1559 = sqrt(_1531);
    float _1561 = -_1501;
    float _1563 = fma(_1535, _1541, _1561);
    float _1565 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1545);
    float _1567 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1547);
    float _1569 = fma(_1563, 0.5, 0.5);
    float _1571 = _1565 * _1549;
    float _1573 = _1567 * _1549;
    float _1575 = fma(_1571, 0.5, 0.5);
    float _1577 = fma(_1573, -0.5, 0.5);
    float _1579 = _1559 * 0.636619746685028076171875;
    float _1581 = -_1555;
    float _1583 = fma(_1579, _1581, 1.0);
    float3 _4559 = float3(_1575, _1577, _1557);
    float _1585 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4559, float3(0.0), isnan(_4559)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4559, float3(0.0), isnan(_4559)), level(0.0)).x;
    float3 _4570 = float3(_1575, _1577, _1557);
    float4 _1588 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4570, float3(0.0), isnan(_4570)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4570, float3(0.0), isnan(_4570)), level(0.0)).xyzw;
    float _1590 = _1588.x;
    float _1592 = _1588.y;
    float _1594 = _1588.z;
    float _1596 = _1588.w;
    float2 _4586 = float2(_1583, _1569);
    float3 _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4586, float2(0.0), isnan(_4586)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4586, float2(0.0), isnan(_4586)), level(0.0)).xyz;
    float _1600 = _1598.x;
    float _1602 = _1598.y;
    float _1604 = _1598.z;
    float _1606 = _749 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1608 = _749 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1610 = -_873;
    float _1612 = _1610 + 1.0;
    bool _1614 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1616 = isnan(_1295);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1622 = _1618 || _1620;
    float _1624 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1606);
    float _1626 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1608);
    float _1628 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1624);
    float _1630 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1626);
    float _1632 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1634 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1636 = 1.0 / _1632;
    float _1638 = _1634 + _1632;
    float _1640 = _1638 * _1636;
    float _1642 = _1640 * 0.5;
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1646 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1644);
    float _1648 = 1.0 / _1646;
    float _1650 = in.m_78.x;
    float _1652 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1654 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1652);
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1658 = _1648 * _1656;
    float _1660 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1654);
    float _1662 = abs(_1658);
    float _1664 = log2(_1662);
    float _1666 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1660);
    float _1668 = _1666 + _1521;
    out.gl_Position.x = _1565;
    out.gl_Position.y = _1567;
    out.gl_Position.z = _1666;
    out.gl_Position.w = _1521;
    bool _1670 = _1658 <= 8000.0;
    bool _1672 = isnan(_1658);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan(8000.0);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = _1668 * 0.5;
    float _1684 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1686 = _1666;
    float _1688 = _1565;
    float _1690 = _1521;
    float _1692 = _1567;
    if (!_1622)
    {
        _1686 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1694 = _1686;
    float _1696 = exp2(_1684);
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1700 = precise::clamp(_1698, 0.0, 1.0);
    float _1702 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1704 = fma(_1700, -2.0, 3.0);
    float _1706 = _1700 * _1700;
    float _1708 = exp2(_1702);
    float _1710 = _1706 * _1704;
    float _1712 = -_1710;
    float _1714 = _1712 + 1.0;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1710);
    float _1718 = _1680 * _1716;
    float _1720 = -_1708;
    float _1722 = _1720 + 1.0;
    float _1724 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1726 = _1612 * _1724;
    float _1728 = precise::clamp(_1726, 0.0, 1.0);
    float _1730 = _1565 + _1521;
    float _1732 = _1694;
    float _1734 = _1694;
    if (!_1622)
    {
        _1688 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1736 = _1688;
    float _1738 = -_1728;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1742 = _1521 * 0.5;
    float _1744 = _1730 * 0.5;
    float _1746 = _1736;
    float _1748 = _1736;
    if (!_1622)
    {
        _1690 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1750 = _1690;
    float _1752 = _1740 * _1650;
    float _1754 = fma(_1567, -0.5, _1742);
    float _1756 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1758 = _1750;
    float _1760 = _1750;
    if (!_1622)
    {
        _1692 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1762 = _1692;
    float _1764 = _1752 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _1744;
    out.m_80.y = _1754;
    out.m_80.z = _1682;
    out.m_80.w = _1521;
    out.m_82.x = _1764;
    float _1766 = _1756 * _1585;
    float _1768 = -_1756;
    float _1770 = _1768 + 1.0;
    float _1772 = _1596 * _1766;
    float _1774 = _1604 * _1766;
    float _1776 = _1596 * _1770;
    float _1778 = _1770;
    float _1780 = _1772;
    float _1782 = _1762;
    float _1784 = _1762;
    if (!_1622)
    {
        _1778 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1786 = _1778;
    float _1788 = fma(_1600, _1772, _1590);
    float _1790 = fma(_1602, _1772, _1592);
    float _1792 = fma(_1596, _1774, _1594);
    float _1794 = _1786;
    float _1796 = _1786;
    if (!_1622)
    {
        _1780 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1798 = _1780;
    out.m_84.x = _1788;
    out.m_84.y = _1790;
    out.m_84.z = _1792;
    out.m_84.w = _1776;
    bool _1800 = !_1622;
    float _1802 = _1798;
    float _1804 = _1798;
    if (!_1800)
    {
        bool _1806 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1808 = isnan(_1295);
        bool _1810 = _1806 || _1808;
        bool _1812 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1814 = _1810 || _1812;
        if (!_1814)
        {
            float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1818 = _1295 + _1816;
            float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1822 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1820;
            float _1824 = 1.0 / _1822;
            float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1828 = _1826 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1830 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1832 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1834 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1836 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1840 = _1838 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1844 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1846 = _1818 * _1824;
            float _1848 = precise::clamp(_1846, 0.0, 1.0);
            float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1852 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1854 = fma(_1848, _1828, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1856 = fma(_1848, _1852, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1858 = fma(_1848, _1832, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1860 = fma(_1848, _1836, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1862 = fma(_1848, _1840, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1864 = fma(_1848, _1844, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1760 = _1856;
            _1748 = _1862;
            _1796 = _1854;
            _1784 = _1860;
            _1734 = _1858;
            _1804 = _1864;
            _1866 = true;
        }
        else
        {
            bool _1868 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1870 = isnan(_1295);
            bool _1872 = _1868 || _1870;
            bool _1874 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1876 = _1872 || _1874;
            if (!_1876)
            {
                _1794 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1878 = _1794;
            _1796 = _1878;
            if (!_1876)
            {
                _1758 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1880 = _1758;
            _1760 = _1880;
            if (!_1876)
            {
                _1732 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1882 = _1732;
            _1734 = _1882;
            if (!_1876)
            {
                _1782 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1884 = _1782;
            _1784 = _1884;
            if (!_1876)
            {
                _1746 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1886 = _1746;
            _1748 = _1886;
            if (!_1876)
            {
                _1802 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1888 = _1802;
            bool _1890 = !_1876;
            _1804 = _1888;
            if (!_1890)
            {
                bool _1892 = _1295 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1894 = isnan(_1295);
                bool _1896 = _1892 || _1894;
                bool _1898 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1900 = _1896 || _1898;
                if (!_1900)
                {
                    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1904 = _1295 + _1902;
                    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1908 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1906;
                    float _1910 = 1.0 / _1908;
                    float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1914 = _1912 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1918 = _1916 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1922 = _1920 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1926 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1928 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1930 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1932 = _1904 * _1910;
                    float _1934 = precise::clamp(_1932, 0.0, 1.0);
                    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1938 = _1936 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1940 = fma(_1934, _1914, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1942 = fma(_1934, _1938, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1944 = fma(_1934, _1918, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1946 = fma(_1934, _1922, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1948 = fma(_1934, _1926, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1950 = fma(_1934, _1930, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1760 = _1942;
                    _1748 = _1948;
                    _1796 = _1940;
                    _1784 = _1946;
                    _1734 = _1944;
                    _1804 = _1950;
                    _1866 = true;
                }
                else
                {
                    _1760 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1748 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1796 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1784 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1734 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1804 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1866 = false;
    float _1952 = _1760;
    float _1954 = _1748;
    float _1956 = _1796;
    float _1958 = _1784;
    float _1960 = _1734;
    float _1962 = _1804;
    float _1964 = fma(_1173, -0.5, 0.5);
    float _1966 = precise::clamp(_1964, 0.0, 1.0);
    float _1968 = -_1952;
    float _1970 = _1968 + _1954;
    float _1972 = -_1956;
    float _1974 = _1972 + _1958;
    float _1976 = -_1960;
    float _1978 = _1976 + _1962;
    bool _1980 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1982 = fma(_1966, _1970, _1952);
    float _1984 = fma(_1966, _1974, _1956);
    float _1986 = fma(_1966, _1978, _1960);
    float _1988 = _1982 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _1990 = fma(_1984, 0.298911988735198974609375, _1988);
    float _1992 = fma(_1986, 0.114477999508380889892578125, _1990);
    float _1994 = -_1992;
    float _1996 = _1984 + _1994;
    float _1998 = -_1992;
    float _2000 = _1982 + _1998;
    float _2002 = -_1992;
    float _2004 = _1986 + _2002;
    float _2006 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2008 = fma(_1996, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1992);
    float _2010 = fma(_2000, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1992);
    float _2012 = fma(_2004, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1992);
    out.m_53.x = _2006;
    out.m_88.x = _2008;
    out.m_88.y = _2010;
    out.m_88.z = _2012;
    if (!_1980)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2014 = -_1269;
    float _2016 = _2014 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2018 = -_1271;
    float _2020 = _2018 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2022 = -_1273;
    float _2024 = _2022 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2026 = _2016 * _2016;
    float _2028 = fma(_2020, _2020, _2026);
    float _2030 = fma(_2024, _2024, _2028);
    float _2032 = sqrt(_2030);
    float _2034 = rsqrt(_2030);
    float _2036 = -_2032;
    float _2038 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2040 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2042 = precise::clamp(_2040, 0.0, 1.0);
    float _2044 = _2020 * _2034;
    float _2046 = _2016 * _2034;
    float _2048 = abs(_2042);
    float _2050 = log2(_2048);
    float _2052 = _2024 * _2034;
    float _2054 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2056 = _1173 * _2046;
    float _2058 = -_2046;
    float _2060 = -_2054;
    float _2062 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2060);
    float _2064 = fma(_1163, _2044, _2056);
    float _2066 = -_2052;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2062);
    float _2070 = fma(_1175, _2052, _2064);
    float _2072 = precise::clamp(_2070, 0.0, 1.0);
    float _2074 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2076 = _2068 + _2074;
    float _2078 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2080 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2082 = precise::clamp(_2080, 0.0, 1.0);
    float _2084 = exp2(_2078);
    float _2086 = _2084 * _2082;
    float _2088 = _2072 * _2086;
    float _2090 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2092 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2094 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2090;
    out.m_86.y = _2092;
    out.m_86.z = _2094;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

