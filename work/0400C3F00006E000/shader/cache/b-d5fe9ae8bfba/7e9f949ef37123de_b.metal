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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_58 [[user(locn6)]];
    float4 m_68 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1109 = false;
    bool _923 = false;
    bool _811 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3469 = as_type<float>(_103);
        out.gl_Position.z = _3469;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3538 = as_type<float>(_139);
        out.gl_Position.z = _3538;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_54.w;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = _145 * _143;
    float _169 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = in.m_47.x;
    float _173 = in.m_47.y;
    float _175 = in.m_47.z;
    float _177 = _169 * 6.283185482025146484375;
    float _179 = floor(_169);
    int _181 = as_type<int>(_147) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_147) & 2;
    bool _187 = _185 != 0;
    float _189 = _177 * 0.15915493667125701904296875;
    bool _191 = !_183;
    float _193 = _191 ? (-0.5) : 0.5;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = _189 * 6.283185482025146484375;
    float _201 = cos(_199);
    float _203 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _205 = !_187;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_179;
    float _211 = _169 + _209;
    float _213 = _169;
    float _215 = _203;
    if (!_157)
    {
        float _217 = _203 * _203;
        float _219 = _217 * 0.5;
        _213 = _219;
    }
    float _221 = _213;
    float _223 = _221;
    if (!_157)
    {
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _225;
    }
    float _227 = _223;
    bool _229 = !_157;
    float _231 = _227;
    float _233 = _161;
    float _235 = _163;
    if (!_229)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _203 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _203);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _265;
    }
    float _267 = _231;
    bool _269 = !_157;
    if (!_269)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _203 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _215 = _289;
    }
    float _291 = _215;
    float _293 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _299 = fma(_291, _171, _293);
    bool _301 = _211 < 0.5;
    float _303 = float(_301);
    float _305 = fma(_291, _173, _295);
    float _307 = fma(_201, 0.5, 0.5);
    float _309 = fma(_299, _159, _161);
    float _311 = fma(_291, _175, _297);
    if (!_157)
    {
        float _313 = _121 * _121;
        float _315 = _313 * 0.5;
        _233 = _315;
    }
    float _317 = _233;
    float _319 = fma(_305, _159, _163);
    float _321 = -_211;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_303;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _329 = -_307;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = fma(_311, _159, _165);
    float _335 = _317;
    if (!_157)
    {
        float _337 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _335 = _337;
    }
    float _339 = _335;
    float _341 = _339;
    if (!_157)
    {
        _235 = _121;
    }
    float _343 = _235;
    bool _345 = !_197;
    int _347 = _345 ? 0 : 1;
    bool _349 = !_157;
    float _351 = _343;
    if (!_349)
    {
        float _353 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _355 = log2(_353);
        float _357 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _359 = _357 + 1.0;
        float _361 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _363 = _121 * _355;
        float _365 = 1.0 / _359;
        float _367 = _361 * 0.693147182464599609375;
        float _369 = exp2(_363);
        float _371 = 1.0 / _367;
        float _373 = _369 + (-1.0);
        float _375 = -_373;
        float _377 = fma(_375, _371, _121);
        float _379 = _377 * _365;
        float _381 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _341 = _381;
    }
    float _383 = _341;
    bool _385 = !_157;
    if (!_385)
    {
        float _387 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _389 = log2(_387);
        float _391 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _393 = _391 + 1.0;
        float _395 = 1.0 / _393;
        float _397 = _121 * _389;
        float _399 = exp2(_397);
        float _401 = -_399;
        float _403 = _401 + 1.0;
        float _405 = _403 * _395;
        _351 = _405;
    }
    float _407 = _351;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _411 = _409 != 0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _415 = _413 != 0;
    float _417 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _419 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _421 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _423 = abs(_347);
    float _425 = fma(_407, _173, _417);
    bool _427 = !_411;
    int _429 = _427 ? 0 : 1;
    float _431 = fma(_407, _171, _419);
    bool _433 = !_415;
    int _435 = _433 ? 0 : 1;
    float _437 = fma(_407, _175, _421);
    int _439 = abs(_429);
    float _441 = -_425;
    float _443 = _305 + _441;
    int _445 = abs(_435);
    float _447 = -_431;
    float _449 = _299 + _447;
    float _451 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _459 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _461 = float(_439);
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _467 = float(_423);
    float _469 = abs(_323);
    float _471 = _461 * _469;
    float _473 = -_437;
    float _475 = _311 + _473;
    float _477 = float(_445);
    float _479 = fma(_467, _331, _471);
    float _481 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _483 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
    float _485 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    float _487 = abs(_327);
    float _489 = fma(_477, _487, _479);
    bool _491 = !_457;
    float _493 = _483;
    float _495 = _481;
    float _497 = _485;
    float _513;
    if (!_491)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_87);
        float _519 = 1.0 / _517;
        float _521 = _121 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _527 = _523 + _525;
    float _529 = in.m_54.x;
    float _531 = in.m_54.y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _549;
    float _553 = 1.0 / _535;
    float _555 = 1.0 / _539;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _559 = _523 + _557;
    bool _561 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _563 = 1.0 / _547;
    float _565 = _559 * _553;
    bool _567 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _569 = isnan(_523);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    bool _579 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _581 = isnan(_523);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = 1.0 / _551;
    float _593 = _527 * _555;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _597 = _523 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _601 = _523 + _599;
    float _603 = -_589;
    float _605 = _603 + 1.0;
    float _607 = 1.0 / _543;
    float _609 = _597 * _563;
    bool _611 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _613 = isnan(_523);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _623;
    float _627 = fma(_625, _565, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _629 = _621 * _605;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _633 = _523 + _631;
    float _635 = _633 * _591;
    bool _637 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _639 = isnan(_523);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = _601 * _607;
    float _651 = -_577;
    float _653 = _651 + 1.0;
    bool _655 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _657 = isnan(_523);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -_647;
    float _669 = _667 + 1.0;
    float _671 = _647 * _653;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _673;
    float _677 = _589 * _669;
    float _679 = -_621;
    float _681 = _679 + 1.0;
    bool _683 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _685 = isnan(_523);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = fma(_675, _565, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _701 = _665 * _681;
    float _703 = -_665;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _711 = fma(_699, _593, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _713;
    float _717 = _693 * _705;
    float _719 = -_693;
    float _721 = _719 + 1.0;
    float _723 = fma(_709, _593, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _725;
    float _729 = _695 * _717;
    float _731 = _627 * _717;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _737 = fma(_727, _649, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _739 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _741 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].y, _731);
    float _743 = fma(_715, _649, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _745 = fma(_723, _701, _739);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _751 = fma(_711, _701, _741);
    float _753 = fma(_735, _609, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _755;
    float _759 = fma(_737, _629, _745);
    float _761 = fma(_749, _609, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _763;
    float _767 = fma(_743, _629, _751);
    float _769 = fma(_757, _635, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _771 = fma(_753, _677, _759);
    float _773 = fma(_765, _635, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _775 = fma(_761, _677, _767);
    float _777 = fma(_769, _671, _771);
    float _779 = fma(_773, _671, _775);
    float _781 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[148].x, _777);
    float _783 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[148].y, _779);
    float _785 = _781 * _529;
    float _787 = _783 * _531;
    bool _789 = !_561;
    int _791 = as_type<int>(_609);
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _809;
    if (!_789)
    {
        float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _797 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _801 = _799 * _795;
        float _803 = floor(_801);
        float _805 = -_803;
        float _807 = _801 + _805;
        _809 = _807;
        _811 = true;
    }
    else
    {
        float _813 = float(_87);
        float _815 = 1.0 / _813;
        float _817 = _121 * _815;
        _809 = _817;
    }
    _811 = false;
    float _819 = _809;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _823 = _819 + _821;
    bool _825 = _819 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _827 = isnan(_819);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _837;
    bool _841 = _819 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _843 = isnan(_819);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -_835;
    float _855 = _853 + 1.0;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _857;
    float _861 = 1.0 / _839;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _865 = _851 * _855;
    float _867 = -_851;
    float _869 = _867 + 1.0;
    float _871 = _823 * _861;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _873;
    float _877 = fma(_859, _871, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _879;
    float _883 = fma(_875, _871, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _885 = _877 * _865;
    float _887 = fma(_881, _871, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _889 = _883 * _865;
    float _891 = _887 * _865;
    float _893 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[107].x, _885);
    float _895 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[107].y, _891);
    float _897 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[107].z, _889);
    float _899 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[108].x, _893);
    float _901 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[108].y, _895);
    float _903 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[108].z, _897);
    bool _905 = !_863;
    float _921;
    if (!_905)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _909 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _913 = _911 * _907;
        float _915 = floor(_913);
        float _917 = -_915;
        float _919 = _913 + _917;
        _921 = _919;
        _923 = true;
    }
    else
    {
        float _925 = float(_87);
        float _927 = 1.0 / _925;
        float _929 = _121 * _927;
        _921 = _929;
    }
    _923 = false;
    float _931 = _921;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _935 = _931 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _945 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _947 = isnan(_931);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _961 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _963 = isnan(_931);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / _939;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _975;
    float _979 = -_955;
    float _981 = _979 + 1.0;
    bool _983 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _985 = isnan(_931);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    bool _995 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _997 = 1.0 / _943;
    float _999 = 1.0 / _959;
    float _1001 = _977 * _973;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1007 = _971 * _981;
    float _1009 = -_971;
    float _1011 = _1009 + 1.0;
    float _1013 = fma(_1001, _935, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1015;
    float _1019 = _993 * _1011;
    float _1021 = _1005 * _997;
    bool _1023 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1025 = isnan(_931);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1037 = _931 + _1035;
    float _1039 = _1013 * _1019;
    float _1041 = -_993;
    float _1043 = _1041 + 1.0;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1047 = _931 + _1045;
    float _1049 = fma(_1021, _1037, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1051 = _1017 * _999;
    float _1053 = -_1033;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1039);
    float _1059 = _899 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1061 = fma(_1051, _1047, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1063 = _955 * _1055;
    float _1065 = fma(_1049, _1007, _1057);
    float _1067 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1071 = fma(_1061, _1063, _1065);
    float _1073 = _901 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1071);
    float _1077 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1081 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1069;
    out.m_56.y = _1077;
    out.m_56.z = _1079;
    out.m_56.w = _1081;
    bool _1083 = !_995;
    float _1105;
    float _1107;
    if (!_1083)
    {
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1087 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1089 = float(_87);
        float _1091 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _1093 = 1.0 / _1089;
        float _1095 = _1091 * _1085;
        float _1097 = floor(_1095);
        float _1099 = _121 * _1093;
        float _1101 = -_1097;
        float _1103 = _1095 + _1101;
        _1105 = _1103;
        _1107 = _1099;
        _1109 = true;
    }
    else
    {
        float _1111 = float(_87);
        float _1113 = 1.0 / _1111;
        float _1115 = _121 * _1113;
        _1105 = _1115;
        _1107 = _1115;
    }
    _1109 = false;
    float _1117 = _1105;
    float _1119 = _1107;
    float _1121 = in.m_49.z;
    float _1123 = _141 * 2.0;
    float _1125 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1127 = log2(_1125);
    float _1129 = in.m_49.y;
    bool _1131 = _141 > 0.5;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1135 = _1133 != 0;
    float _1137 = floor(_1123);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1143;
    float _1147 = _121 * _1127;
    float _1149 = 1.0 / _1141;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1159 = _1121 * 2.0;
    bool _1161 = _1121 > 0.5;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1165 = _1137 >= 0.0;
    bool _1167 = isnan(_1137);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    float _1175 = _1129 * 2.0;
    float _1177 = -_207;
    int _1179 = _1161 ? as_type<int>(_1177) : as_type<int>(_207);
    float _1181 = floor(_1159);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1183;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1191 = floor(_1175);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1193;
    bool _1197 = _1181 > 0.0;
    float _1199 = exp2(_1147);
    bool _1201 = _1181 >= 0.0;
    bool _1203 = isnan(_1181);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan(0.0);
    bool _1209 = _1205 || _1207;
    float _1211 = -_193;
    int _1213 = _1131 ? as_type<int>(_1211) : as_type<int>(_193);
    int _1215 = _1209 ? 0 : 1;
    bool _1217 = _1137 > 0.0;
    float _1219 = _319 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1221 = ~_1215;
    int _1223 = _1221 + 1;
    int _1225 = _1223 + 1;
    float _1227 = 1.0 / _1145;
    bool _1229 = !_1135;
    float _1231 = _1229 ? _193 : as_type<float>(_1213);
    float _1233 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1219);
    int _1235 = _1225;
    if (!_1197)
    {
        int _1237 = ~_1215;
        int _1239 = _1237 + 1;
        _1235 = _1239;
    }
    int _1241 = _1235;
    float _1243 = _319 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1245 = _1129 > 0.5;
    float _1247 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1233);
    float _1249 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1243);
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1257 = _1255 != 0;
    float _1259 = _1247 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1261 = -_193;
    int _1263 = _1245 ? as_type<int>(_1261) : as_type<int>(_193);
    float _1265 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1249);
    float _1267 = -_207;
    int _1269 = _1245 ? as_type<int>(_1267) : as_type<int>(_207);
    float _1271 = -_1259;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1275 = !_1253;
    float _1277 = _1275 ? _193 : as_type<float>(_1263);
    float _1279 = _1265 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1281 = _1173 ? 0 : 1;
    float _1283 = -_1199;
    float _1285 = _1283 + 1.0;
    bool _1287 = !_1257;
    float _1289 = _1287 ? _207 : as_type<float>(_1179);
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1293 = _1279 + _1291;
    int _1295 = ~_1281;
    int _1297 = _1295 + 1;
    int _1299 = _1297 + 1;
    float _1301 = _319 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1305 = _1303 != 0;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1313 = _1311 != 0;
    float _1315 = _1293 * 0.0625;
    float _1317 = abs(_1293);
    float _1319 = abs(_1273);
    float _1321 = precise::max(_1317, _1319);
    float _1323 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1301);
    int _1325 = _1299;
    float _1327 = _1273;
    bool _1329 = _1309;
    if (!_1217)
    {
        int _1331 = ~_1281;
        int _1333 = _1331 + 1;
        _1325 = _1333;
    }
    int _1335 = _1325;
    float _1337 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1339 = _1321 >= 16.0;
    float _1341 = 1.0 / _1153;
    float _1343 = _1339 ? _1315 : _1293;
    bool _1345 = !_1305;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1351 = 1.0 + _1349;
    bool _1353 = _1191 > 0.0;
    float _1355 = 1.0 / _1157;
    bool _1357 = _1191 >= 0.0;
    bool _1359 = isnan(_1191);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan(0.0);
    bool _1365 = _1361 || _1363;
    bool _1367 = !_1309;
    int _1369 = _1367 ? 0 : 1;
    float _1371 = as_type<float>(_1335);
    if (_1339)
    {
        float _1373 = _1273 * 0.0625;
        _1327 = _1373;
    }
    float _1375 = _1327;
    float _1377 = abs(_1343);
    bool _1379 = _1377 != 0.0;
    bool _1381 = isnan(_1377);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan(0.0);
    bool _1387 = _1383 || _1385;
    int _1389 = _1365 ? 0 : 1;
    float _1391 = 1.0 / _1351;
    float _1393 = abs(_1375);
    bool _1395 = _1393 == 0.0;
    bool _1397 = !_1387;
    bool _1399 = _1395 && _1397;
    float _1401 = _1189 * _1341;
    bool _1403 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1405 = isnan(0.0);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1411 = _1407 || _1409;
    float _1413 = _141 + _1121;
    int _1415 = ~_1389;
    int _1417 = _1415 + 1;
    int _1419 = _1417 + 1;
    float _1421 = _1411 ? _1285 : 0.0;
    float _1423 = _1413 + (-1.0);
    int _1425 = _1419;
    if (!_1353)
    {
        int _1427 = ~_1389;
        int _1429 = _1427 + 1;
        _1425 = _1429;
    }
    int _1431 = _1425;
    float _1433 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1435 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1437 = isnan(1.0);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1443 = _1439 || _1441;
    if (_1399)
    {
        bool _1445 = as_type<int>(_1375) >= 0;
        _1329 = _1445;
    }
    bool _1447 = _1329;
    float _1449 = _1421 * _1391;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    if (_1399)
    {
        int _1455 = _1447 ? 0 : 1078530011;
        _791 = _1455;
    }
    int _1457 = _791;
    bool _1459 = !_1443;
    float _1461 = _1459 ? _121 : _1449;
    float _1463 = 1.0 / _1453;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1467 = _1465 != 0;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    if (_1399)
    {
        int _1473 = int(0x80000000) & as_type<int>(_1343);
        int _1475 = _1457 | _1473;
        _793 = as_type<float>(_1475);
    }
    float _1477 = _793;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1481 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1487 = -_1479;
    float _1489 = fma(_1337, 2.0, _1487);
    float _1491 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1323);
    float _1493 = 1.0 / _1471;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1495;
    float _1499 = fma(_1481, -2.0, _1163);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1503 = _1117 + _1501;
    float _1505 = _1497 * _1149;
    float _1507 = abs(_1375);
    bool _1509 = _1507 == 0.0;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1511;
    float _1515 = 1.0 / _1485;
    float _1517 = _1503 * _1227;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1523 = _1513 * _1463;
    float _1525 = _1129 + _1121;
    float _1527 = -_121;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1489);
    bool _1531 = !_1313;
    int _1533 = _1531 ? 0 : 1;
    float _1535 = _1525 + (-1.0);
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1543 = _1541 != 0;
    float _1545 = 1.0 / _1521;
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1549 = _1539 * _1493;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1555 = in.m_49.w;
    float _1557 = _1185 * _1515;
    float _1559 = _1553 * _1355;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1563 = _141 + _1129;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1567 = _1565 != 0;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1569;
    int _1573 = abs(_1347);
    float _1575 = _1563 + (-1.0);
    float _1577 = _1571 * _1545;
    float _1579 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1581 = _1231 + 0.5;
    float _1583 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1589;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1595 = _1119 + _1593;
    float _1597 = fma(_1583, _1581, _1529);
    float _1599 = fma(_1587, _1517, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1601 = fma(_1591, _1517, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1603 = fma(_1195, _1517, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1607 = _1119 + _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1611 = _1119 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1615 = _1119 + _1613;
    bool _1617 = _1555 > 0.5;
    float _1619 = fma(_1505, _1607, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1621 = fma(_1559, _1611, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1623 = fma(_1549, _1615, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1625 = fma(_1523, _1595, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1627 = !_1387;
    bool _1629 = _1627 && _1509;
    int _1631 = as_type<int>(_1615);
    int _1633 = _1617 ? (-1) : 0;
    float _1635 = _1477;
    float _1637 = _1477;
    if (!_1629)
    {
        float _1639 = abs(_1343);
        bool _1641 = _1639 != as_type<float>(0x7f800000u /* inf */);
        bool _1643 = isnan(_1639);
        bool _1645 = _1641 || _1643;
        bool _1647 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1649 = _1645 || _1647;
        float _1651 = abs(_1375);
        bool _1653 = _1651 == as_type<float>(0x7f800000u /* inf */);
        bool _1655 = !_1649;
        bool _1657 = _1653 && _1655;
        if (_1657)
        {
            _1631 = 1075235812;
        }
        int _1659 = _1631;
        int _1661 = _1659;
        if (_1657)
        {
            bool _1663 = as_type<int>(_1375) >= 0;
            _1633 = _1663 ? (-1) : 0;
        }
        int _1665 = _1633;
        if (_1657)
        {
            int _1667 = ~_1665;
            int _1669 = (_1667 != 0) ? _1659 : 1061752795;
            _1661 = _1669;
        }
        int _1671 = _1661;
        if (_1657)
        {
            int _1673 = int(0x80000000) & as_type<int>(_1343);
            int _1675 = _1671 | _1673;
            _1635 = as_type<float>(_1675);
        }
        float _1677 = _1635;
        float _1679 = abs(_1375);
        bool _1681 = _1679 == as_type<float>(0x7f800000u /* inf */);
        bool _1683 = !_1649;
        bool _1685 = _1683 && _1681;
        _1637 = _1677;
        if (!_1685)
        {
            float _1687 = abs(_1343);
            float _1689 = abs(_1375);
            float _1691 = precise::max(_1687, _1689);
            float _1693 = abs(_1343);
            float _1695 = abs(_1375);
            float _1697 = precise::min(_1693, _1695);
            float _1699 = 1.0 / _1691;
            float _1701 = abs(_1343);
            float _1703 = abs(_1375);
            bool _1705 = _1701 > _1703;
            float _1707 = abs(_1343);
            float _1709 = abs(_1375);
            float _1711 = _1707 + _1709;
            float _1713 = _1697 * _1699;
            float _1715 = _1713 * _1713;
            float _1717 = _1715 + 11.33538818359375;
            float _1719 = fma(_1715, _1717, 28.84246826171875);
            float _1721 = fma(_1715, _1719, 19.6966705322265625);
            float _1723 = fma(_1715, -0.82336294651031494140625, -5.674867153167724609375);
            float _1725 = fma(_1715, _1723, -6.565555095672607421875);
            float _1727 = 1.0 / _1721;
            float _1729 = _1715 * _1725;
            float _1731 = _1713 * _1729;
            float _1733 = fma(_1731, _1727, _1713);
            float _1735 = _1733;
            _1637 = _1711;
            if (_1705)
            {
                float _1737 = -_1733;
                float _1739 = _1737 + 1.57079637050628662109375;
                _1735 = _1739;
            }
            float _1741 = _1735;
            bool _1743 = as_type<int>(_1375) >= 0;
            int _1745 = as_type<int>(_1343) & int(0x80000000);
            int _1747 = as_type<int>(_1741);
            if (!_1743)
            {
                float _1749 = -_1741;
                float _1751 = _1749 + 3.1415927410125732421875;
                _1747 = as_type<int>(_1751);
            }
            int _1753 = _1747;
            bool _1755 = _1711 > as_type<float>(0x7f800000u /* inf */);
            bool _1757 = isnan(_1711);
            bool _1759 = _1755 || _1757;
            bool _1761 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1763 = _1759 || _1761;
            if (!_1763)
            {
                int _1765 = _1745 | _1753;
                _1637 = as_type<float>(_1765);
            }
        }
    }
    float _1767 = _1637;
    float _1769 = _1491 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1773 = _1119 + _1771;
    float _1775 = float(_1241);
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1779 = _1119 + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1783 = _1769 + _1781;
    float _1785 = float(_1573);
    float _1787 = fma(_1557, _1773, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    int _1789 = abs(_1369);
    float _1791 = _1783 * _1783;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1795 = _1259 + _1793;
    float _1797 = _1785 * _1775;
    float _1799 = fma(_1293, _1293, _1791);
    float _1801 = fma(_1401, _1779, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1803 = float(_1335);
    float _1805 = _1797 * (-2.0);
    float _1807 = fma(_1795, _1795, _1799);
    float _1809 = float(_1789);
    float _1811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    int _1813 = abs(_1533);
    float _1815 = fma(_1579, _1805, _1579);
    float _1817 = rsqrt(_1807);
    float _1819 = _1809 * _1803;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1823 = _1119 + _1821;
    if (!_1467)
    {
        _1371 = _1121;
    }
    float _1825 = _1371;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1829 = _1825;
    if (_1467)
    {
        _1829 = _1129;
    }
    float _1831 = _1829;
    float _1833 = _1277 + 0.5;
    float _1835 = float(_1431);
    float _1837 = -_1289;
    float _1839 = _1837 + 0.5;
    float _1841 = float(_1813);
    float _1843 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1827);
    float _1845 = _1819 * (-2.0);
    float _1847 = fma(_1577, _1823, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1851 = _1849 != 0;
    float _1853 = _1841 * _1835;
    float _1855 = _1783 * _1817;
    float _1857 = fma(_1547, _1845, _1547);
    float _1859 = _1293 * _1817;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1865 = -_1855;
    float _1867 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1783);
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1467)
    {
        _1869 = _1129;
    }
    float _1871 = _1869;
    float _1873 = -_1859;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1293);
    float _1877 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1863);
    float _1879 = _1871;
    if (_1467)
    {
        _1879 = _141;
    }
    float _1881 = _1879;
    float _1883 = _1867 * _1867;
    float _1885 = _141 + (-0.5);
    float _1887 = _1795 * _1817;
    float _1889 = _1853 * (-2.0);
    float _1891 = fma(_1875, _1875, _1883);
    float _1893 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1895 = -_1887;
    float _1897 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1795);
    float _1899 = fma(_1433, _1889, _1433);
    float _1901 = fma(_1461, _1815, _1893);
    float _1903 = fma(_1897, _1897, _1891);
    bool _1905 = _1117 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1907 = isnan(_1117);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = _1129 + (-0.5);
    bool _1919 = _1117 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1921 = isnan(_1117);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1927 = _1923 || _1925;
    float _1929 = float(_1927);
    float _1931 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1467)
    {
        _1933 = _1121;
    }
    float _1935 = _1933;
    float _1937 = sqrt(_1903);
    float _1939 = _1935;
    if (_1467)
    {
        _1939 = _1129;
    }
    float _1941 = _1939;
    float _1943 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1931);
    bool _1945 = !_1851;
    float _1947 = _1945 ? _207 : as_type<float>(_1269);
    float _1949 = _1121 + (-0.5);
    float _1951 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1953 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1499);
    float _1955 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1957 = _1947 + (-0.5);
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1961 = _1121 > 0.5;
    float _1963 = -_1929;
    float _1965 = _1963 + 1.0;
    float _1967 = -_1951;
    float _1969 = -_1953;
    float _1971 = fma(_1967, _1957, _1969);
    float _1973 = fma(_1461, _1857, _1955);
    float _1975 = fma(_1461, _1899, _1959);
    bool _1977 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1979 = isnan(_1119);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = _1915 * _1965;
    float _1991 = -_1767;
    float _1993 = _1973 + _1991;
    float _1995 = _1817 * _1937;
    float _1997 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1999 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2001 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2003 = isnan(_1119);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1987;
    float _2015 = _2013 + 1.0;
    float _2017 = -_193;
    int _2019 = _1961 ? as_type<int>(_2017) : as_type<int>(_193);
    float _2021 = _1993 * 0.15915493667125701904296875;
    bool _2023 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2025 = isnan(_1119);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    float _2035 = _2011 * _2015;
    float _2037 = -_2011;
    float _2039 = _2037 + 1.0;
    bool _2041 = !_1543;
    float _2043 = _2041 ? _193 : as_type<float>(_2019);
    float _2045 = _1901 * 0.15915493667125701904296875;
    float _2047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    bool _2049 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2051 = isnan(_1119);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2057 = _2053 || _2055;
    float _2059 = float(_2057);
    float _2061 = _1975 * 0.15915493667125701904296875;
    bool _2063 = _1555 > 0.5;
    float _2065 = _1599 * _1989;
    float _2067 = _2033 * _2039;
    float _2069 = _2045 * 6.283185482025146484375;
    float _2071 = sin(_2069);
    float _2073 = -_2033;
    float _2075 = _2073 + 1.0;
    float _2077 = _1601 * _1989;
    float _2079 = _1603 * _1989;
    bool _2081 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2083 = isnan(_1119);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2089 = _2085 || _2087;
    float _2091 = float(_2089);
    float _2093 = -_2059;
    float _2095 = _2093 + 1.0;
    bool _2097 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2099 = isnan(_1119);
    bool _2101 = _2097 || _2099;
    bool _2103 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2105 = _2101 || _2103;
    float _2107 = float(_2105);
    float _2109 = _2059 * _2075;
    float _2111 = _2045 * 6.283185482025146484375;
    float _2113 = cos(_2111);
    float _2115 = _2091 * _2095;
    float _2117 = -_2091;
    float _2119 = _2117 + 1.0;
    bool _2121 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2123 = isnan(_1119);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2129 = _2125 || _2127;
    float _2131 = float(_2129);
    float _2133 = _1995 * _1999;
    bool _2135 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2137 = isnan(_1119);
    bool _2139 = _2135 || _2137;
    bool _2141 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2143 = _2139 || _2141;
    float _2145 = float(_2143);
    float _2147 = _1995 * _1997;
    float _2149 = _2107 * _2119;
    float _2151 = _2061 * 6.283185482025146484375;
    float _2153 = cos(_2151);
    float _2155 = -_207;
    int _2157 = _2063 ? as_type<int>(_2155) : as_type<int>(_207);
    float _2159 = _2133 * _1811;
    float _2161 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2163 = !_1567;
    float _2165 = _2163 ? _207 : as_type<float>(_2157);
    float _2167 = _2021 * 6.283185482025146484375;
    float _2169 = sin(_2167);
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2173 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2175 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2179 = fma(_1881, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2171);
    float _2181 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2183 = _2181 * 0.5;
    float _2185 = _2021 * 6.283185482025146484375;
    float _2187 = cos(_2185);
    float _2189 = _2061 * 6.283185482025146484375;
    float _2191 = sin(_2189);
    float _2193 = -_2107;
    float _2195 = _2193 + 1.0;
    float _2197 = _2147 * _2047;
    float _2199 = _2153 * _2159;
    float _2201 = _2131 * _2195;
    float _2203 = -_2131;
    float _2205 = _2203 + 1.0;
    float _2207 = _2071 * _2199;
    float _2209 = _2071 * _2187;
    float _2211 = _2113 * _2169;
    float _2213 = _2145 * _2205;
    float _2215 = _2113 * _2187;
    float _2217 = _2187 * _2153;
    float _2219 = _2113 * _2199;
    float _2221 = _1619 * _2213;
    float _2223 = _2071 * _2169;
    float _2225 = -_2211;
    float _2227 = fma(_2191, _2209, _2225);
    float _2229 = -_2159;
    float _2231 = _2191 * _2229;
    float _2233 = -_2177;
    float _2235 = fma(_2161, 2.0, _2233);
    float _2237 = fma(_2191, _2223, _2215);
    float _2239 = fma(_2227, _2197, _2207);
    float _2241 = _2169 * _2153;
    float _2243 = fma(_2217, _2197, _2231);
    float _2245 = -_2145;
    float _2247 = _2245 + 1.0;
    float _2249 = fma(_2237, _2183, _2239);
    float _2251 = fma(_2241, _2183, _2243);
    float _2253 = fma(_2247, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2221);
    float _2255 = _1259 + _2249;
    float _2257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2259 = _1279 + _2251;
    float _2261 = _1941 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2265 = _2255 + _2263;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2269 = fma(_1623, _2201, _2253);
    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2273 = _2259 + _2271;
    float _2275 = _2265 * _2265;
    float _2277 = -_1915;
    float _2279 = _2277 + 1.0;
    float _2281 = fma(_1625, _2149, _2269);
    float _2283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2285 = fma(_2273, _2273, _2275);
    float _2287 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2065);
    float _2289 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2077);
    float _2291 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2079);
    float _2293 = fma(_1621, _2115, _2281);
    float _2295 = fma(_2191, _2215, _2223);
    float _2297 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2287);
    float _2299 = sqrt(_2285);
    float _2301 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2289);
    float _2303 = fma(_1787, _2109, _2293);
    float _2305 = -_2209;
    float _2307 = fma(_2191, _2211, _2305);
    float _2309 = fma(_2295, _2197, _2219);
    float _2311 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2291);
    float _2313 = fma(_2261, -2.0, _2267);
    float _2315 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2319 = fma(_2307, _2183, _2309);
    float _2321 = fma(_1801, _2067, _2303);
    float _2323 = _2283 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2325 = _2043 + 0.5;
    float _2327 = _1769 + _2319;
    float _2329 = _2165 + (-0.5);
    float _2331 = -_121;
    float _2333 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2235);
    bool _2335 = _2299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2339 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2313);
    float _2341 = fma(_1847, _2035, _2321);
    float _2343 = fma(_2323, _2325, _2333);
    float _2345 = -_2315;
    float _2347 = -_2339;
    float _2349 = fma(_2345, _2329, _2347);
    float _2351 = _2321;
    float _2353 = _2259;
    float _2355 = _2255;
    if (!_2335)
    {
        _2351 = _2327;
    }
    float _2357 = _2351;
    bool _2359 = !_2335;
    float _2361 = _2357;
    if (!_2359)
    {
        float _2363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2367 = _2299 + _2365;
        float _2369 = rsqrt(_2285);
        float _2371 = _2367 * _2363;
        float _2373 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2375 = _2371 * 0.15915493667125701904296875;
        float _2377 = _2375 * 6.283185482025146484375;
        float _2379 = cos(_2377);
        float _2381 = _2375 * 6.283185482025146484375;
        float _2383 = sin(_2381);
        float _2385 = _2379 + (-1.0);
        float _2387 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2389 = fma(_2383, _2373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2391 = fma(_2327, _2379, _2387);
        float _2393 = _2369 * _2389;
        float _2395 = fma(_2273, _2393, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2397 = fma(_2265, _2393, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2361 = _2391;
        _2353 = _2395;
        _2355 = _2397;
    }
    float _2399 = _2361;
    float _2401 = _2353;
    float _2403 = _2355;
    float _2405 = -_1769;
    float _2407 = _2405 + _2399;
    float _2409 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1877);
    float _2411 = -_1279;
    float _2413 = _2411 + _2401;
    float _2415 = _2173 * _2317;
    float _2417 = _2407 * _2407;
    float _2419 = -_2409;
    float _2421 = _2419 + 1.0;
    float _2423 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1943);
    float _2425 = -_1259;
    float _2427 = _2425 + _2403;
    float _2429 = fma(_2413, _2413, _2417);
    float _2431 = -_2421;
    float _2433 = fma(_1231, _2431, _1597);
    float _2435 = -_2423;
    float _2437 = _2435 + 1.0;
    float _2439 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2179);
    float _2441 = fma(_2427, _2427, _2429);
    float _2443 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1843);
    float _2445 = fma(_1947, _2437, _1971);
    float _2447 = _2175 * _2337;
    float _2449 = sqrt(_2441);
    float _2451 = -_2439;
    float _2453 = _2451 + 1.0;
    float _2455 = -_2443;
    float _2457 = _2455 + 1.0;
    float _2459 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2461 = _2301 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2463 = _2311 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2465 = -_2453;
    float _2467 = fma(_2043, _2465, _2343);
    float _2469 = fma(_2165, _2457, _2349);
    float _2471 = _2459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2473 = _2461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2475 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2477 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2341);
    out.m_58.x = _2415;
    out.m_58.y = _2447;
    out.m_60.x = _2433;
    out.m_60.y = _2445;
    out.m_60.z = _2467;
    out.m_60.w = _2469;
    bool _2479 = _2449 > 0.0;
    out.m_62.x = _2471;
    out.m_62.y = _2473;
    out.m_62.z = _2475;
    out.m_64.x = _2477;
    bool _2481 = !_2479;
    float _2483 = _2469;
    float _2485 = _2445;
    float _2487 = _2433;
    float _2489 = _2475;
    float _2491 = _2475;
    float _2493 = _2399;
    float _2495 = _2401;
    float _2497 = _2403;
    float _2499 = _2433;
    float _2501 = _2475;
    if (!_2481)
    {
        bool _2503 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2505 = _2473;
        if (_2503)
        {
            float _2507 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2505 = _2507;
        }
        float _2509 = _2505;
        if (_2503)
        {
            float _2511 = _481 * _2509;
            _2483 = _2511;
        }
        float _2513 = _2483;
        float _2515 = _2513;
        if (_2503)
        {
            float _2517 = _483 * _2509;
            _2485 = _2517;
        }
        float _2519 = _2485;
        float _2521 = _2519;
        if (_2503)
        {
            float _2523 = _485 * _2509;
            _2487 = _2523;
        }
        float _2525 = _2487;
        float _2527 = _2525;
        float _2529 = _2525;
        if (!_2503)
        {
            float _2531 = _121 + 1.0;
            float _2533 = _2531;
            if (!_157)
            {
                float _2535 = _2531 * _2531;
                float _2537 = _2535 * 0.5;
                _2527 = _2537;
            }
            float _2539 = _2527;
            float _2541 = _2539;
            if (!_157)
            {
                float _2543 = _2539 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2541 = _2543;
            }
            float _2545 = _2541;
            bool _2547 = !_157;
            float _2549 = _2545;
            if (!_2547)
            {
                float _2551 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2553 = log2(_2551);
                float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2557 = _2555 + 1.0;
                float _2559 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2561 = _2553 * _2531;
                float _2563 = 1.0 / _2557;
                float _2565 = _2559 * 0.693147182464599609375;
                float _2567 = exp2(_2561);
                float _2569 = 1.0 / _2565;
                float _2571 = _2567 + (-1.0);
                float _2573 = -_2571;
                float _2575 = fma(_2573, _2569, _2531);
                float _2577 = _2575 * _2563;
                float _2579 = _2577 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2549 = _2579;
            }
            float _2581 = _2549;
            float _2583 = _2581 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2585 = _2581 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2587 = !_157;
            if (!_2587)
            {
                float _2589 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2591 = log2(_2589);
                float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2595 = _2593 + 1.0;
                float _2597 = 1.0 / _2595;
                float _2599 = _2591 * _2531;
                float _2601 = exp2(_2599);
                float _2603 = -_2601;
                float _2605 = _2603 + 1.0;
                float _2607 = _2605 * _2597;
                _2533 = _2607;
                _2489 = _2597;
            }
            float _2609 = _2533;
            float _2611 = _2489;
            float _2613 = fma(_2609, _173, _2585);
            float _2615 = _2581 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2617 = fma(_2609, _171, _2583);
            float _2619 = -_425;
            float _2621 = _2619 + _2613;
            float _2623 = fma(_2609, _175, _2615);
            float _2625 = -_431;
            float _2627 = _2625 + _2617;
            float _2629 = _2621 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2631 = _2621 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2633 = _2621 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2635 = -_437;
            float _2637 = _2635 + _2623;
            float _2639 = fma(_2627, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2629);
            float _2641 = fma(_2627, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2631);
            float _2643 = fma(_2627, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2633);
            float _2645 = fma(_2637, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2639);
            float _2647 = fma(_2637, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2641);
            float _2649 = fma(_2637, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2643);
            _493 = _2647;
            _495 = _2645;
            _497 = _2649;
            _2515 = _2645;
            _2521 = _2647;
            _2529 = _2649;
            _2491 = _2611;
        }
        float _2651 = _493;
        float _2653 = _495;
        float _2655 = _497;
        float _2657 = _2515;
        float _2659 = _2521;
        float _2661 = _2529;
        float _2663 = _2491;
        float _2665 = _2651 * _2651;
        float _2667 = rsqrt(_2441);
        float _2669 = fma(_2653, _2653, _2665);
        float _2671 = fma(_2655, _2655, _2669);
        float _2673 = sqrt(_2671);
        float _2675 = _2413 * _2667;
        float _2677 = _2407 * _2667;
        float _2679 = _2427 * _2667;
        bool _2681 = _2673 > 0.0;
        bool _2683 = !_2681;
        _2499 = _2661;
        _2501 = _2663;
        if (!_2683)
        {
            float _2685 = rsqrt(_2671);
            float _2687 = _2685 * _2651;
            float _2689 = _2685 * _2653;
            float _2691 = _2685 * _2655;
            float _2693 = _2677 * _2687;
            float _2695 = fma(_2675, _2689, _2693);
            float _2697 = fma(_2679, _2691, _2695);
            float _2699 = _2697 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2701 = fma(_2657, _2699, _2401);
            float _2703 = fma(_2659, _2699, _2399);
            float _2705 = fma(_2661, _2699, _2403);
            _2493 = _2703;
            _2495 = _2701;
            _2497 = _2705;
        }
    }
    float _2707 = _2493;
    float _2709 = _2495;
    float _2711 = _2497;
    float _2713 = _2499;
    float _2715 = _2501;
    float _2717 = -_1855;
    float _2719 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1769);
    float _2721 = -_1859;
    float _2723 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _2725 = -_1887;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1259);
    float _2729 = _2719 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2731 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2733 = isnan(0.5);
    bool _2735 = _2731 || _2733;
    bool _2737 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2739 = _2735 || _2737;
    float _2741 = -_1855;
    float _2743 = fma(_2741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2707);
    bool _2745 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2747 = isnan(0.5);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2753 = _2749 || _2751;
    float _2755 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2729);
    float _2757 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2755);
    float _2759 = _2719 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2761 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2763 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2759);
    float _2765 = 1.0 / _2761;
    float _2767 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2763);
    float _2769 = _2713;
    float _2771 = _2743;
    float _2773 = _2715;
    float _2775 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2777 = _2719;
    if (_2753)
    {
        _2769 = 1.0;
    }
    float _2779 = _2769;
    float _2781 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2783 = _2781 + _2761;
    float _2785 = -_1859;
    float _2787 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2709);
    float _2789 = _2783 * _2765;
    float _2791 = _2789 * 0.5;
    float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2795 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2793);
    float _2797 = -_1887;
    float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2711);
    float _2801 = 1.0 / _2795;
    float _2803 = _2787;
    float _2805 = _2799;
    float _2807 = _2779;
    if (!_2739)
    {
        float _2809 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2811 = _2719 + _2809;
        float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2815 = _2723 + _2813;
        float _2817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2819 = -_1259;
        float _2821 = _2819 + _2711;
        float _2823 = _2811 * _2811;
        float _2825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2827 = _2727 + _2825;
        float _2829 = fma(_2815, _2815, _2823);
        float _2831 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2833 = fma(_2827, _2827, _2829);
        float _2835 = sqrt(_2833);
        float _2837 = 1.0 / _1995;
        float _2839 = _2831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2841 = precise::min(_2835, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2843 = _2841 * _2817;
        float _2845 = -_1769;
        float _2847 = _2845 + _2707;
        float _2849 = _2843 * _2837;
        float _2851 = -_1279;
        float _2853 = _2851 + _2709;
        float _2855 = _2839 * _2849;
        float _2857 = _2821 * _2849;
        float _2859 = fma(_2853, _2855, _2723);
        float _2861 = fma(_2847, _2855, _2719);
        float _2863 = fma(_2839, _2857, _2727);
        _2771 = _2861;
        _2803 = _2859;
        _2805 = _2863;
        _2773 = _2855;
    }
    float _2865 = _2771;
    float _2867 = _2803;
    float _2869 = _2805;
    float _2871 = _2773;
    float _2873 = _2871;
    if (_2753)
    {
        _2775 = 1.0;
    }
    float _2875 = _2775;
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2879 = _2801 * _2877;
    float _2881 = _2875;
    if (!_2753)
    {
        float _2883 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2885 = _2883 * 0.15915493667125701904296875;
        float _2887 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2889 = _2885 * 6.283185482025146484375;
        float _2891 = cos(_2889);
        float _2893 = _2887 * 0.15915493667125701904296875;
        float _2895 = _2885 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = 1.0 / _2891;
        float _2901 = _2893 * 6.283185482025146484375;
        float _2903 = cos(_2901);
        float _2905 = _2897 * _2899;
        float _2907 = _2893 * 6.283185482025146484375;
        float _2909 = sin(_2907);
        float _2911 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2913 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2911;
        float _2915 = _2903 * _2905;
        float _2917 = 1.0 / _2915;
        float _2919 = 1.0 / _2913;
        float _2921 = _2909 * _2917;
        float _2923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2925 = fma(_2879, _2921, _2923);
        float _2927 = _2925 * _2919;
        float _2929 = precise::clamp(_2927, 0.0, 1.0);
        _2777 = _2915;
        _2873 = _2885;
        _2807 = _2929;
    }
    float _2931 = _2777;
    float _2933 = _2873;
    float _2935 = _2807;
    float _2937 = _2933;
    float _2939 = _2931;
    if (!_2753)
    {
        float _2941 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2943 = _2941 * 0.15915493667125701904296875;
        float _2945 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2947 = _2943 * 6.283185482025146484375;
        float _2949 = cos(_2947);
        float _2951 = _2945 * 0.15915493667125701904296875;
        float _2953 = _2943 * 6.283185482025146484375;
        float _2955 = sin(_2953);
        float _2957 = 1.0 / _2949;
        float _2959 = _2951 * 6.283185482025146484375;
        float _2961 = cos(_2959);
        float _2963 = _2955 * _2957;
        float _2965 = _2951 * 6.283185482025146484375;
        float _2967 = sin(_2965);
        float _2969 = _2961 * _2963;
        float _2971 = 1.0 / _2969;
        float _2973 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2975 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2973;
        float _2977 = 1.0 / _2975;
        float _2979 = _2967 * _2971;
        float _2981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2983 = fma(_2879, _2979, _2981);
        float _2985 = _2983 * _2977;
        float _2987 = precise::clamp(_2985, 0.0, 1.0);
        float _2989 = -_2987;
        float _2991 = _2989 + 1.0;
        _2937 = _2971;
        _2939 = _2957;
        _2881 = _2991;
    }
    float _2993 = _2937;
    float _2995 = _2939;
    float _2997 = _2881;
    float _2999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3001 = _2865 + _2999;
    float _3003 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3005 = _2867 + _3003;
    float _3007 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3009 = _2869 + _3007;
    float _3011 = _3001 * _3001;
    float _3013 = fma(_3005, _3005, _3011);
    float _3015 = fma(_3009, _3009, _3013);
    float _3017 = rsqrt(_3015);
    float _3019 = sqrt(_3015);
    float _3021 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3023 = _3005 * _3021;
    float _3025 = _3009 * _3021;
    float _3027 = _3023 * _3023;
    float _3029 = _3025 * _3025;
    float _3031 = _3027 + _3029;
    float _3033 = sqrt(_3031);
    bool _3035 = _3033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3039 = _3033 + _3037;
    float _3041 = _3017;
    float _3043 = _3039;
    float _3045 = _2993;
    float _3047 = _3001;
    float _3049 = _3021;
    if (_3035)
    {
        float _3051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3041 = _3051;
    }
    float _3053 = _3041;
    float _3055 = _3053;
    if (_3035)
    {
        float _3057 = _3039 * _3053;
        _3043 = _3057;
    }
    float _3059 = _3043;
    if (_3035)
    {
        float _3061 = rsqrt(_3031);
        _3055 = _3061;
    }
    float _3063 = _3055;
    float _3065 = _3063;
    if (_3035)
    {
        float _3067 = _3059 * 0.15915493667125701904296875;
        _3045 = _3067;
    }
    float _3069 = _3045;
    float _3071 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3073 = _3009;
    float _3075 = _3069;
    if (_3035)
    {
        float _3077 = _3069 * 6.283185482025146484375;
        float _3079 = sin(_3077);
        _3073 = _3079;
    }
    float _3081 = _3073;
    float _3083 = precise::max(0.0, _3071);
    float _3085 = _2995;
    float _3087 = _3083;
    if (_3035)
    {
        float _3089 = _3069 * 6.283185482025146484375;
        float _3091 = cos(_3089);
        _3085 = _3091;
    }
    float _3093 = _3085;
    float _3095 = -_3021;
    float _3097 = -_3083;
    float _3099 = fma(_3001, _3095, _3097);
    if (_3035)
    {
        float _3101 = _3099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3047 = _3101;
    }
    float _3103 = _3047;
    float _3105 = _3081;
    float _3107 = _3103;
    if (_3035)
    {
        float _3109 = fma(_3081, _3103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3105 = _3109;
    }
    float _3111 = _3105;
    float _3113 = _3111;
    if (!_3035)
    {
        _3107 = _3027;
    }
    float _3115 = _3107;
    float _3117 = _3115;
    if (_3035)
    {
        float _3119 = _3063 * _3111;
        _3049 = _3119;
    }
    float _3121 = _3049;
    if (!_3035)
    {
        _3065 = _3023;
    }
    float _3123 = _3065;
    float _3125 = _3123;
    float _3127 = _3093;
    if (_3035)
    {
        float _3129 = _3093 + (-1.0);
        _3087 = _3129;
    }
    float _3131 = _3087;
    float _3133 = _3131;
    if (_3035)
    {
        float _3135 = _3023 * _3121;
        _3125 = _3135;
    }
    float _3137 = _3125;
    if (!_3035)
    {
        _3113 = _3099;
    }
    float _3139 = _3113;
    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3143 = fma(_3019, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3141);
    float _3145 = precise::clamp(_3143, 0.0, 1.0);
    float _3147 = _3139;
    if (_3035)
    {
        float _3149 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3075 = _3149;
    }
    float _3151 = _3075;
    if (!_3035)
    {
        _3133 = _3025;
    }
    float _3153 = _3133;
    float _3155 = _3153;
    if (_3035)
    {
        float _3157 = _3025 * _3121;
        _3155 = _3157;
    }
    float _3159 = _3155;
    if (_3035)
    {
        float _3161 = _3137 * _3137;
        _3117 = _3161;
    }
    float _3163 = _3117;
    if (_3035)
    {
        float _3165 = fma(_3099, _3093, _3151);
        _3147 = _3165;
    }
    float _3167 = _3147;
    if (!_3035)
    {
        _3127 = _3029;
    }
    float _3169 = _3127;
    float _3171 = _3169;
    if (_3035)
    {
        float _3173 = _3159 * _3159;
        _3171 = _3173;
    }
    float _3175 = _3171;
    float _3177 = -_3145;
    float _3179 = _3177 + 1.0;
    float _3181 = fma(_3167, _3167, _3163);
    float _3183 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3185 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3187 = _3181 + _3175;
    float _3189 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3183);
    float _3191 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3193 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3195 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3197 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3189);
    float _3199 = rsqrt(_3187);
    float _3201 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3191);
    float _3203 = _3197 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3205 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3193);
    float _3207 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3201);
    float _3209 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3195);
    float _3211 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3213 = abs(_3179);
    float _3215 = log2(_3213);
    float _3217 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3205);
    float _3219 = _3207 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3221 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3209);
    float _3223 = -_3211;
    float _3225 = fma(_3223, _3185, 1.0);
    float _3227 = _3217 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3229 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3231 = _3221 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3233 = _3199 * _3137;
    float _3235 = _3199 * _3167;
    float _3237 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3229);
    float _3239 = _3199 * _3159;
    float _3241 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3243 = log2(_3225);
    float _3245 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3237);
    float _3247 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3249 = -_3241;
    float _3251 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3249);
    float _3253 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3255 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3245);
    float _3257 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3247);
    float _3259 = -_3239;
    float _3261 = fma(_3259, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3251);
    float _3263 = exp2(_3253);
    float _3265 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3267 = _3235 + 1.0;
    float _3269 = fma(_3261, -0.5, 0.5);
    float _3271 = fma(_3261, 0.5, 0.5);
    float _3273 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3265);
    float _3275 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3257);
    float _3277 = 1.0 / _3255;
    float _3279 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3273);
    float _3281 = fma(_3271, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3283 = _3243 * 0.693147182464599609375;
    float _3285 = fma(_3271, _3281, -0.212114393711090087890625);
    float _3287 = sqrt(_3269);
    float _3289 = -_3235;
    float _3291 = fma(_3263, _3267, _3289);
    float _3293 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3279);
    float _3295 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3275);
    float _3297 = fma(_3271, _3285, 1.570728778839111328125);
    float _3299 = fma(_3291, 0.5, 0.5);
    float _3301 = _3293 * _3277;
    float _3303 = _3295 * _3277;
    float _3305 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3307 = fma(_3301, 0.5, 0.5);
    float _3309 = fma(_3303, -0.5, 0.5);
    float _3311 = _3287 * 0.636619746685028076171875;
    float _3313 = -_3297;
    float _3315 = fma(_3311, _3313, 1.0);
    float3 _8440 = float3(_3307, _3309, _3305);
    float _3317 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8440, float3(0.0), isnan(_8440)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8440, float3(0.0), isnan(_8440)), level(0.0)).x;
    float3 _8451 = float3(_3307, _3309, _3305);
    float4 _3320 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8451, float3(0.0), isnan(_8451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8451, float3(0.0), isnan(_8451)), level(0.0)).xyzw;
    float _3322 = _3320.x;
    float _3324 = _3320.y;
    float _3326 = _3320.z;
    float _3328 = _3320.w;
    float2 _8468 = float2(_3315, _3299);
    float3 _3332 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8468, float2(0.0), isnan(_8468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8468, float2(0.0), isnan(_8468)), level(0.0)).xyz;
    float _3334 = _3332.x;
    float _3336 = _3332.y;
    float _3338 = _3332.z;
    float _3340 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3342 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3344 = _2935 > 0.0;
    bool _3346 = isnan(_2935);
    bool _3348 = _3344 || _3346;
    bool _3350 = isnan(0.0);
    bool _3352 = _3348 || _3350;
    float _3354 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3342);
    float _3356 = exp2(_3340);
    float _3358 = _2935 * _2997;
    bool _3360 = _2997 <= 0.0;
    bool _3362 = !_3352;
    bool _3364 = _3360 || _3362;
    float _3366 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3354);
    float _3368 = _3358 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3370 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3366);
    float _3372 = _3255 * 0.5;
    float _3374 = _489 * _3368;
    float _3376 = _3293 + _3255;
    float _3378 = _3370 + _3255;
    out.gl_Position.x = _3293;
    out.gl_Position.y = _3295;
    out.gl_Position.z = _3370;
    out.gl_Position.w = _3255;
    float _3380 = _3376 * 0.5;
    float _3382 = _3378 * 0.5;
    float _3384 = -_3356;
    float _3386 = _3384 + 1.0;
    float _3388 = fma(_3295, -0.5, _3372);
    float _3390 = _3374 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3392 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.x = _3380;
    out.m_66.y = _3388;
    out.m_66.z = _3382;
    out.m_66.w = _3255;
    out.m_45.x = _3390;
    float _3394 = _3392 * _3317;
    float _3396 = -_3392;
    float _3398 = _3396 + 1.0;
    float _3400 = _3328 * _3394;
    float _3402 = _3338 * _3394;
    float _3404 = _3328 * _3398;
    float _3406 = fma(_3334, _3400, _3322);
    float _3408 = fma(_3336, _3400, _3324);
    float _3410 = fma(_3328, _3402, _3326);
    out.m_68.x = _3406;
    out.m_68.y = _3408;
    out.m_68.z = _3410;
    out.m_68.w = _3404;
    if (!_3364)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3412 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3412;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1109 = false;
    bool _923 = false;
    bool _811 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3469 = as_type<float>(_103);
        out.gl_Position.z = _3469;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3538 = as_type<float>(_139);
        out.gl_Position.z = _3538;
    }
    if (_131)
    {
        return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_54.w;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = _145 * _143;
    float _169 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = in.m_47.x;
    float _173 = in.m_47.y;
    float _175 = in.m_47.z;
    float _177 = _169 * 6.283185482025146484375;
    float _179 = floor(_169);
    int _181 = as_type<int>(_147) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_147) & 2;
    bool _187 = _185 != 0;
    float _189 = _177 * 0.15915493667125701904296875;
    bool _191 = !_183;
    float _193 = _191 ? (-0.5) : 0.5;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = _189 * 6.283185482025146484375;
    float _201 = cos(_199);
    float _203 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _205 = !_187;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_179;
    float _211 = _169 + _209;
    float _213 = _169;
    float _215 = _203;
    if (!_157)
    {
        float _217 = _203 * _203;
        float _219 = _217 * 0.5;
        _213 = _219;
    }
    float _221 = _213;
    float _223 = _221;
    if (!_157)
    {
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _225;
    }
    float _227 = _223;
    bool _229 = !_157;
    float _231 = _227;
    float _233 = _161;
    float _235 = _163;
    if (!_229)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _203 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _203);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _265;
    }
    float _267 = _231;
    bool _269 = !_157;
    if (!_269)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _203 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _215 = _289;
    }
    float _291 = _215;
    float _293 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _299 = fma(_291, _171, _293);
    bool _301 = _211 < 0.5;
    float _303 = float(_301);
    float _305 = fma(_291, _173, _295);
    float _307 = fma(_201, 0.5, 0.5);
    float _309 = fma(_299, _159, _161);
    float _311 = fma(_291, _175, _297);
    if (!_157)
    {
        float _313 = _121 * _121;
        float _315 = _313 * 0.5;
        _233 = _315;
    }
    float _317 = _233;
    float _319 = fma(_305, _159, _163);
    float _321 = -_211;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_303;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _329 = -_307;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = fma(_311, _159, _165);
    float _335 = _317;
    if (!_157)
    {
        float _337 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _335 = _337;
    }
    float _339 = _335;
    float _341 = _339;
    if (!_157)
    {
        _235 = _121;
    }
    float _343 = _235;
    bool _345 = !_197;
    int _347 = _345 ? 0 : 1;
    bool _349 = !_157;
    float _351 = _343;
    if (!_349)
    {
        float _353 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _355 = log2(_353);
        float _357 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _359 = _357 + 1.0;
        float _361 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _363 = _121 * _355;
        float _365 = 1.0 / _359;
        float _367 = _361 * 0.693147182464599609375;
        float _369 = exp2(_363);
        float _371 = 1.0 / _367;
        float _373 = _369 + (-1.0);
        float _375 = -_373;
        float _377 = fma(_375, _371, _121);
        float _379 = _377 * _365;
        float _381 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _341 = _381;
    }
    float _383 = _341;
    bool _385 = !_157;
    if (!_385)
    {
        float _387 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _389 = log2(_387);
        float _391 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _393 = _391 + 1.0;
        float _395 = 1.0 / _393;
        float _397 = _121 * _389;
        float _399 = exp2(_397);
        float _401 = -_399;
        float _403 = _401 + 1.0;
        float _405 = _403 * _395;
        _351 = _405;
    }
    float _407 = _351;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _411 = _409 != 0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _415 = _413 != 0;
    float _417 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _419 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _421 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _423 = abs(_347);
    float _425 = fma(_407, _173, _417);
    bool _427 = !_411;
    int _429 = _427 ? 0 : 1;
    float _431 = fma(_407, _171, _419);
    bool _433 = !_415;
    int _435 = _433 ? 0 : 1;
    float _437 = fma(_407, _175, _421);
    int _439 = abs(_429);
    float _441 = -_425;
    float _443 = _305 + _441;
    int _445 = abs(_435);
    float _447 = -_431;
    float _449 = _299 + _447;
    float _451 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _459 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _461 = float(_439);
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _467 = float(_423);
    float _469 = abs(_323);
    float _471 = _461 * _469;
    float _473 = -_437;
    float _475 = _311 + _473;
    float _477 = float(_445);
    float _479 = fma(_467, _331, _471);
    float _481 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _483 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
    float _485 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    float _487 = abs(_327);
    float _489 = fma(_477, _487, _479);
    bool _491 = !_457;
    float _493 = _483;
    float _495 = _481;
    float _497 = _485;
    float _513;
    if (!_491)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_87);
        float _519 = 1.0 / _517;
        float _521 = _121 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _527 = _523 + _525;
    float _529 = in.m_54.x;
    float _531 = in.m_54.y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _549;
    float _553 = 1.0 / _535;
    float _555 = 1.0 / _539;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _559 = _523 + _557;
    bool _561 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _563 = 1.0 / _547;
    float _565 = _559 * _553;
    bool _567 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _569 = isnan(_523);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    bool _579 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _581 = isnan(_523);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = 1.0 / _551;
    float _593 = _527 * _555;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _597 = _523 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _601 = _523 + _599;
    float _603 = -_589;
    float _605 = _603 + 1.0;
    float _607 = 1.0 / _543;
    float _609 = _597 * _563;
    bool _611 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _613 = isnan(_523);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _623;
    float _627 = fma(_625, _565, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _629 = _621 * _605;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _633 = _523 + _631;
    float _635 = _633 * _591;
    bool _637 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _639 = isnan(_523);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = _601 * _607;
    float _651 = -_577;
    float _653 = _651 + 1.0;
    bool _655 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _657 = isnan(_523);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -_647;
    float _669 = _667 + 1.0;
    float _671 = _647 * _653;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _673;
    float _677 = _589 * _669;
    float _679 = -_621;
    float _681 = _679 + 1.0;
    bool _683 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _685 = isnan(_523);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = fma(_675, _565, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _701 = _665 * _681;
    float _703 = -_665;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _711 = fma(_699, _593, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _713;
    float _717 = _693 * _705;
    float _719 = -_693;
    float _721 = _719 + 1.0;
    float _723 = fma(_709, _593, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _725;
    float _729 = _695 * _717;
    float _731 = _627 * _717;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _737 = fma(_727, _649, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _739 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _741 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].y, _731);
    float _743 = fma(_715, _649, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _745 = fma(_723, _701, _739);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _751 = fma(_711, _701, _741);
    float _753 = fma(_735, _609, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _755;
    float _759 = fma(_737, _629, _745);
    float _761 = fma(_749, _609, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _763;
    float _767 = fma(_743, _629, _751);
    float _769 = fma(_757, _635, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _771 = fma(_753, _677, _759);
    float _773 = fma(_765, _635, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _775 = fma(_761, _677, _767);
    float _777 = fma(_769, _671, _771);
    float _779 = fma(_773, _671, _775);
    float _781 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[148].x, _777);
    float _783 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[148].y, _779);
    float _785 = _781 * _529;
    float _787 = _783 * _531;
    bool _789 = !_561;
    int _791 = as_type<int>(_609);
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _809;
    if (!_789)
    {
        float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _797 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _801 = _799 * _795;
        float _803 = floor(_801);
        float _805 = -_803;
        float _807 = _801 + _805;
        _809 = _807;
        _811 = true;
    }
    else
    {
        float _813 = float(_87);
        float _815 = 1.0 / _813;
        float _817 = _121 * _815;
        _809 = _817;
    }
    _811 = false;
    float _819 = _809;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _823 = _819 + _821;
    bool _825 = _819 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _827 = isnan(_819);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _837;
    bool _841 = _819 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _843 = isnan(_819);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -_835;
    float _855 = _853 + 1.0;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _857;
    float _861 = 1.0 / _839;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _865 = _851 * _855;
    float _867 = -_851;
    float _869 = _867 + 1.0;
    float _871 = _823 * _861;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _873;
    float _877 = fma(_859, _871, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _879;
    float _883 = fma(_875, _871, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _885 = _877 * _865;
    float _887 = fma(_881, _871, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _889 = _883 * _865;
    float _891 = _887 * _865;
    float _893 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[107].x, _885);
    float _895 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[107].y, _891);
    float _897 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[107].z, _889);
    float _899 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[108].x, _893);
    float _901 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[108].y, _895);
    float _903 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[108].z, _897);
    bool _905 = !_863;
    float _921;
    if (!_905)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _909 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _913 = _911 * _907;
        float _915 = floor(_913);
        float _917 = -_915;
        float _919 = _913 + _917;
        _921 = _919;
        _923 = true;
    }
    else
    {
        float _925 = float(_87);
        float _927 = 1.0 / _925;
        float _929 = _121 * _927;
        _921 = _929;
    }
    _923 = false;
    float _931 = _921;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _935 = _931 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _945 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _947 = isnan(_931);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _961 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _963 = isnan(_931);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / _939;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _975;
    float _979 = -_955;
    float _981 = _979 + 1.0;
    bool _983 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _985 = isnan(_931);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    bool _995 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _997 = 1.0 / _943;
    float _999 = 1.0 / _959;
    float _1001 = _977 * _973;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1007 = _971 * _981;
    float _1009 = -_971;
    float _1011 = _1009 + 1.0;
    float _1013 = fma(_1001, _935, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1015;
    float _1019 = _993 * _1011;
    float _1021 = _1005 * _997;
    bool _1023 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1025 = isnan(_931);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1037 = _931 + _1035;
    float _1039 = _1013 * _1019;
    float _1041 = -_993;
    float _1043 = _1041 + 1.0;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1047 = _931 + _1045;
    float _1049 = fma(_1021, _1037, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1051 = _1017 * _999;
    float _1053 = -_1033;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1039);
    float _1059 = _899 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1061 = fma(_1051, _1047, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1063 = _955 * _1055;
    float _1065 = fma(_1049, _1007, _1057);
    float _1067 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1071 = fma(_1061, _1063, _1065);
    float _1073 = _901 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1071);
    float _1077 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1081 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1069;
    out.m_56.y = _1077;
    out.m_56.z = _1079;
    out.m_56.w = _1081;
    bool _1083 = !_995;
    float _1105;
    float _1107;
    if (!_1083)
    {
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1087 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1089 = float(_87);
        float _1091 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _1093 = 1.0 / _1089;
        float _1095 = _1091 * _1085;
        float _1097 = floor(_1095);
        float _1099 = _121 * _1093;
        float _1101 = -_1097;
        float _1103 = _1095 + _1101;
        _1105 = _1103;
        _1107 = _1099;
        _1109 = true;
    }
    else
    {
        float _1111 = float(_87);
        float _1113 = 1.0 / _1111;
        float _1115 = _121 * _1113;
        _1105 = _1115;
        _1107 = _1115;
    }
    _1109 = false;
    float _1117 = _1105;
    float _1119 = _1107;
    float _1121 = in.m_49.z;
    float _1123 = _141 * 2.0;
    float _1125 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1127 = log2(_1125);
    float _1129 = in.m_49.y;
    bool _1131 = _141 > 0.5;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1135 = _1133 != 0;
    float _1137 = floor(_1123);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1143;
    float _1147 = _121 * _1127;
    float _1149 = 1.0 / _1141;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1159 = _1121 * 2.0;
    bool _1161 = _1121 > 0.5;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1165 = _1137 >= 0.0;
    bool _1167 = isnan(_1137);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    float _1175 = _1129 * 2.0;
    float _1177 = -_207;
    int _1179 = _1161 ? as_type<int>(_1177) : as_type<int>(_207);
    float _1181 = floor(_1159);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1183;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1191 = floor(_1175);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1193;
    bool _1197 = _1181 > 0.0;
    float _1199 = exp2(_1147);
    bool _1201 = _1181 >= 0.0;
    bool _1203 = isnan(_1181);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan(0.0);
    bool _1209 = _1205 || _1207;
    float _1211 = -_193;
    int _1213 = _1131 ? as_type<int>(_1211) : as_type<int>(_193);
    int _1215 = _1209 ? 0 : 1;
    bool _1217 = _1137 > 0.0;
    float _1219 = _319 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1221 = ~_1215;
    int _1223 = _1221 + 1;
    int _1225 = _1223 + 1;
    float _1227 = 1.0 / _1145;
    bool _1229 = !_1135;
    float _1231 = _1229 ? _193 : as_type<float>(_1213);
    float _1233 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1219);
    int _1235 = _1225;
    if (!_1197)
    {
        int _1237 = ~_1215;
        int _1239 = _1237 + 1;
        _1235 = _1239;
    }
    int _1241 = _1235;
    float _1243 = _319 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1245 = _1129 > 0.5;
    float _1247 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1233);
    float _1249 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1243);
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1257 = _1255 != 0;
    float _1259 = _1247 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1261 = -_193;
    int _1263 = _1245 ? as_type<int>(_1261) : as_type<int>(_193);
    float _1265 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1249);
    float _1267 = -_207;
    int _1269 = _1245 ? as_type<int>(_1267) : as_type<int>(_207);
    float _1271 = -_1259;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1275 = !_1253;
    float _1277 = _1275 ? _193 : as_type<float>(_1263);
    float _1279 = _1265 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1281 = _1173 ? 0 : 1;
    float _1283 = -_1199;
    float _1285 = _1283 + 1.0;
    bool _1287 = !_1257;
    float _1289 = _1287 ? _207 : as_type<float>(_1179);
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1293 = _1279 + _1291;
    int _1295 = ~_1281;
    int _1297 = _1295 + 1;
    int _1299 = _1297 + 1;
    float _1301 = _319 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1305 = _1303 != 0;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1313 = _1311 != 0;
    float _1315 = _1293 * 0.0625;
    float _1317 = abs(_1293);
    float _1319 = abs(_1273);
    float _1321 = precise::max(_1317, _1319);
    float _1323 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1301);
    int _1325 = _1299;
    float _1327 = _1273;
    bool _1329 = _1309;
    if (!_1217)
    {
        int _1331 = ~_1281;
        int _1333 = _1331 + 1;
        _1325 = _1333;
    }
    int _1335 = _1325;
    float _1337 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1339 = _1321 >= 16.0;
    float _1341 = 1.0 / _1153;
    float _1343 = _1339 ? _1315 : _1293;
    bool _1345 = !_1305;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1351 = 1.0 + _1349;
    bool _1353 = _1191 > 0.0;
    float _1355 = 1.0 / _1157;
    bool _1357 = _1191 >= 0.0;
    bool _1359 = isnan(_1191);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan(0.0);
    bool _1365 = _1361 || _1363;
    bool _1367 = !_1309;
    int _1369 = _1367 ? 0 : 1;
    float _1371 = as_type<float>(_1335);
    if (_1339)
    {
        float _1373 = _1273 * 0.0625;
        _1327 = _1373;
    }
    float _1375 = _1327;
    float _1377 = abs(_1343);
    bool _1379 = _1377 != 0.0;
    bool _1381 = isnan(_1377);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan(0.0);
    bool _1387 = _1383 || _1385;
    int _1389 = _1365 ? 0 : 1;
    float _1391 = 1.0 / _1351;
    float _1393 = abs(_1375);
    bool _1395 = _1393 == 0.0;
    bool _1397 = !_1387;
    bool _1399 = _1395 && _1397;
    float _1401 = _1189 * _1341;
    bool _1403 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1405 = isnan(0.0);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1411 = _1407 || _1409;
    float _1413 = _141 + _1121;
    int _1415 = ~_1389;
    int _1417 = _1415 + 1;
    int _1419 = _1417 + 1;
    float _1421 = _1411 ? _1285 : 0.0;
    float _1423 = _1413 + (-1.0);
    int _1425 = _1419;
    if (!_1353)
    {
        int _1427 = ~_1389;
        int _1429 = _1427 + 1;
        _1425 = _1429;
    }
    int _1431 = _1425;
    float _1433 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1435 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1437 = isnan(1.0);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1443 = _1439 || _1441;
    if (_1399)
    {
        bool _1445 = as_type<int>(_1375) >= 0;
        _1329 = _1445;
    }
    bool _1447 = _1329;
    float _1449 = _1421 * _1391;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    if (_1399)
    {
        int _1455 = _1447 ? 0 : 1078530011;
        _791 = _1455;
    }
    int _1457 = _791;
    bool _1459 = !_1443;
    float _1461 = _1459 ? _121 : _1449;
    float _1463 = 1.0 / _1453;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1467 = _1465 != 0;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    if (_1399)
    {
        int _1473 = int(0x80000000) & as_type<int>(_1343);
        int _1475 = _1457 | _1473;
        _793 = as_type<float>(_1475);
    }
    float _1477 = _793;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1481 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1487 = -_1479;
    float _1489 = fma(_1337, 2.0, _1487);
    float _1491 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1323);
    float _1493 = 1.0 / _1471;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1495;
    float _1499 = fma(_1481, -2.0, _1163);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1503 = _1117 + _1501;
    float _1505 = _1497 * _1149;
    float _1507 = abs(_1375);
    bool _1509 = _1507 == 0.0;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1511;
    float _1515 = 1.0 / _1485;
    float _1517 = _1503 * _1227;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1523 = _1513 * _1463;
    float _1525 = _1129 + _1121;
    float _1527 = -_121;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1489);
    bool _1531 = !_1313;
    int _1533 = _1531 ? 0 : 1;
    float _1535 = _1525 + (-1.0);
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1543 = _1541 != 0;
    float _1545 = 1.0 / _1521;
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1549 = _1539 * _1493;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1555 = in.m_49.w;
    float _1557 = _1185 * _1515;
    float _1559 = _1553 * _1355;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1563 = _141 + _1129;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1567 = _1565 != 0;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1569;
    int _1573 = abs(_1347);
    float _1575 = _1563 + (-1.0);
    float _1577 = _1571 * _1545;
    float _1579 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1581 = _1231 + 0.5;
    float _1583 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1589;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1595 = _1119 + _1593;
    float _1597 = fma(_1583, _1581, _1529);
    float _1599 = fma(_1587, _1517, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1601 = fma(_1591, _1517, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1603 = fma(_1195, _1517, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1607 = _1119 + _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1611 = _1119 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1615 = _1119 + _1613;
    bool _1617 = _1555 > 0.5;
    float _1619 = fma(_1505, _1607, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1621 = fma(_1559, _1611, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1623 = fma(_1549, _1615, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1625 = fma(_1523, _1595, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1627 = !_1387;
    bool _1629 = _1627 && _1509;
    int _1631 = as_type<int>(_1615);
    int _1633 = _1617 ? (-1) : 0;
    float _1635 = _1477;
    float _1637 = _1477;
    if (!_1629)
    {
        float _1639 = abs(_1343);
        bool _1641 = _1639 != as_type<float>(0x7f800000u /* inf */);
        bool _1643 = isnan(_1639);
        bool _1645 = _1641 || _1643;
        bool _1647 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1649 = _1645 || _1647;
        float _1651 = abs(_1375);
        bool _1653 = _1651 == as_type<float>(0x7f800000u /* inf */);
        bool _1655 = !_1649;
        bool _1657 = _1653 && _1655;
        if (_1657)
        {
            _1631 = 1075235812;
        }
        int _1659 = _1631;
        int _1661 = _1659;
        if (_1657)
        {
            bool _1663 = as_type<int>(_1375) >= 0;
            _1633 = _1663 ? (-1) : 0;
        }
        int _1665 = _1633;
        if (_1657)
        {
            int _1667 = ~_1665;
            int _1669 = (_1667 != 0) ? _1659 : 1061752795;
            _1661 = _1669;
        }
        int _1671 = _1661;
        if (_1657)
        {
            int _1673 = int(0x80000000) & as_type<int>(_1343);
            int _1675 = _1671 | _1673;
            _1635 = as_type<float>(_1675);
        }
        float _1677 = _1635;
        float _1679 = abs(_1375);
        bool _1681 = _1679 == as_type<float>(0x7f800000u /* inf */);
        bool _1683 = !_1649;
        bool _1685 = _1683 && _1681;
        _1637 = _1677;
        if (!_1685)
        {
            float _1687 = abs(_1343);
            float _1689 = abs(_1375);
            float _1691 = precise::max(_1687, _1689);
            float _1693 = abs(_1343);
            float _1695 = abs(_1375);
            float _1697 = precise::min(_1693, _1695);
            float _1699 = 1.0 / _1691;
            float _1701 = abs(_1343);
            float _1703 = abs(_1375);
            bool _1705 = _1701 > _1703;
            float _1707 = abs(_1343);
            float _1709 = abs(_1375);
            float _1711 = _1707 + _1709;
            float _1713 = _1697 * _1699;
            float _1715 = _1713 * _1713;
            float _1717 = _1715 + 11.33538818359375;
            float _1719 = fma(_1715, _1717, 28.84246826171875);
            float _1721 = fma(_1715, _1719, 19.6966705322265625);
            float _1723 = fma(_1715, -0.82336294651031494140625, -5.674867153167724609375);
            float _1725 = fma(_1715, _1723, -6.565555095672607421875);
            float _1727 = 1.0 / _1721;
            float _1729 = _1715 * _1725;
            float _1731 = _1713 * _1729;
            float _1733 = fma(_1731, _1727, _1713);
            float _1735 = _1733;
            _1637 = _1711;
            if (_1705)
            {
                float _1737 = -_1733;
                float _1739 = _1737 + 1.57079637050628662109375;
                _1735 = _1739;
            }
            float _1741 = _1735;
            bool _1743 = as_type<int>(_1375) >= 0;
            int _1745 = as_type<int>(_1343) & int(0x80000000);
            int _1747 = as_type<int>(_1741);
            if (!_1743)
            {
                float _1749 = -_1741;
                float _1751 = _1749 + 3.1415927410125732421875;
                _1747 = as_type<int>(_1751);
            }
            int _1753 = _1747;
            bool _1755 = _1711 > as_type<float>(0x7f800000u /* inf */);
            bool _1757 = isnan(_1711);
            bool _1759 = _1755 || _1757;
            bool _1761 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1763 = _1759 || _1761;
            if (!_1763)
            {
                int _1765 = _1745 | _1753;
                _1637 = as_type<float>(_1765);
            }
        }
    }
    float _1767 = _1637;
    float _1769 = _1491 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1773 = _1119 + _1771;
    float _1775 = float(_1241);
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1779 = _1119 + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1783 = _1769 + _1781;
    float _1785 = float(_1573);
    float _1787 = fma(_1557, _1773, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    int _1789 = abs(_1369);
    float _1791 = _1783 * _1783;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1795 = _1259 + _1793;
    float _1797 = _1785 * _1775;
    float _1799 = fma(_1293, _1293, _1791);
    float _1801 = fma(_1401, _1779, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1803 = float(_1335);
    float _1805 = _1797 * (-2.0);
    float _1807 = fma(_1795, _1795, _1799);
    float _1809 = float(_1789);
    float _1811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    int _1813 = abs(_1533);
    float _1815 = fma(_1579, _1805, _1579);
    float _1817 = rsqrt(_1807);
    float _1819 = _1809 * _1803;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1823 = _1119 + _1821;
    if (!_1467)
    {
        _1371 = _1121;
    }
    float _1825 = _1371;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1829 = _1825;
    if (_1467)
    {
        _1829 = _1129;
    }
    float _1831 = _1829;
    float _1833 = _1277 + 0.5;
    float _1835 = float(_1431);
    float _1837 = -_1289;
    float _1839 = _1837 + 0.5;
    float _1841 = float(_1813);
    float _1843 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1827);
    float _1845 = _1819 * (-2.0);
    float _1847 = fma(_1577, _1823, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1851 = _1849 != 0;
    float _1853 = _1841 * _1835;
    float _1855 = _1783 * _1817;
    float _1857 = fma(_1547, _1845, _1547);
    float _1859 = _1293 * _1817;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1865 = -_1855;
    float _1867 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1783);
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1467)
    {
        _1869 = _1129;
    }
    float _1871 = _1869;
    float _1873 = -_1859;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1293);
    float _1877 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1863);
    float _1879 = _1871;
    if (_1467)
    {
        _1879 = _141;
    }
    float _1881 = _1879;
    float _1883 = _1867 * _1867;
    float _1885 = _141 + (-0.5);
    float _1887 = _1795 * _1817;
    float _1889 = _1853 * (-2.0);
    float _1891 = fma(_1875, _1875, _1883);
    float _1893 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1895 = -_1887;
    float _1897 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1795);
    float _1899 = fma(_1433, _1889, _1433);
    float _1901 = fma(_1461, _1815, _1893);
    float _1903 = fma(_1897, _1897, _1891);
    bool _1905 = _1117 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1907 = isnan(_1117);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = _1129 + (-0.5);
    bool _1919 = _1117 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1921 = isnan(_1117);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1927 = _1923 || _1925;
    float _1929 = float(_1927);
    float _1931 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1467)
    {
        _1933 = _1121;
    }
    float _1935 = _1933;
    float _1937 = sqrt(_1903);
    float _1939 = _1935;
    if (_1467)
    {
        _1939 = _1129;
    }
    float _1941 = _1939;
    float _1943 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1931);
    bool _1945 = !_1851;
    float _1947 = _1945 ? _207 : as_type<float>(_1269);
    float _1949 = _1121 + (-0.5);
    float _1951 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1953 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1499);
    float _1955 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1957 = _1947 + (-0.5);
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1961 = _1121 > 0.5;
    float _1963 = -_1929;
    float _1965 = _1963 + 1.0;
    float _1967 = -_1951;
    float _1969 = -_1953;
    float _1971 = fma(_1967, _1957, _1969);
    float _1973 = fma(_1461, _1857, _1955);
    float _1975 = fma(_1461, _1899, _1959);
    bool _1977 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1979 = isnan(_1119);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = _1915 * _1965;
    float _1991 = -_1767;
    float _1993 = _1973 + _1991;
    float _1995 = _1817 * _1937;
    float _1997 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1999 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2001 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2003 = isnan(_1119);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1987;
    float _2015 = _2013 + 1.0;
    float _2017 = -_193;
    int _2019 = _1961 ? as_type<int>(_2017) : as_type<int>(_193);
    float _2021 = _1993 * 0.15915493667125701904296875;
    bool _2023 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2025 = isnan(_1119);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    float _2035 = _2011 * _2015;
    float _2037 = -_2011;
    float _2039 = _2037 + 1.0;
    bool _2041 = !_1543;
    float _2043 = _2041 ? _193 : as_type<float>(_2019);
    float _2045 = _1901 * 0.15915493667125701904296875;
    float _2047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    bool _2049 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2051 = isnan(_1119);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2057 = _2053 || _2055;
    float _2059 = float(_2057);
    float _2061 = _1975 * 0.15915493667125701904296875;
    bool _2063 = _1555 > 0.5;
    float _2065 = _1599 * _1989;
    float _2067 = _2033 * _2039;
    float _2069 = _2045 * 6.283185482025146484375;
    float _2071 = sin(_2069);
    float _2073 = -_2033;
    float _2075 = _2073 + 1.0;
    float _2077 = _1601 * _1989;
    float _2079 = _1603 * _1989;
    bool _2081 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2083 = isnan(_1119);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2089 = _2085 || _2087;
    float _2091 = float(_2089);
    float _2093 = -_2059;
    float _2095 = _2093 + 1.0;
    bool _2097 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2099 = isnan(_1119);
    bool _2101 = _2097 || _2099;
    bool _2103 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2105 = _2101 || _2103;
    float _2107 = float(_2105);
    float _2109 = _2059 * _2075;
    float _2111 = _2045 * 6.283185482025146484375;
    float _2113 = cos(_2111);
    float _2115 = _2091 * _2095;
    float _2117 = -_2091;
    float _2119 = _2117 + 1.0;
    bool _2121 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2123 = isnan(_1119);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2129 = _2125 || _2127;
    float _2131 = float(_2129);
    float _2133 = _1995 * _1999;
    bool _2135 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2137 = isnan(_1119);
    bool _2139 = _2135 || _2137;
    bool _2141 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2143 = _2139 || _2141;
    float _2145 = float(_2143);
    float _2147 = _1995 * _1997;
    float _2149 = _2107 * _2119;
    float _2151 = _2061 * 6.283185482025146484375;
    float _2153 = cos(_2151);
    float _2155 = -_207;
    int _2157 = _2063 ? as_type<int>(_2155) : as_type<int>(_207);
    float _2159 = _2133 * _1811;
    float _2161 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2163 = !_1567;
    float _2165 = _2163 ? _207 : as_type<float>(_2157);
    float _2167 = _2021 * 6.283185482025146484375;
    float _2169 = sin(_2167);
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2173 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2175 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2179 = fma(_1881, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2171);
    float _2181 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2183 = _2181 * 0.5;
    float _2185 = _2021 * 6.283185482025146484375;
    float _2187 = cos(_2185);
    float _2189 = _2061 * 6.283185482025146484375;
    float _2191 = sin(_2189);
    float _2193 = -_2107;
    float _2195 = _2193 + 1.0;
    float _2197 = _2147 * _2047;
    float _2199 = _2153 * _2159;
    float _2201 = _2131 * _2195;
    float _2203 = -_2131;
    float _2205 = _2203 + 1.0;
    float _2207 = _2071 * _2199;
    float _2209 = _2071 * _2187;
    float _2211 = _2113 * _2169;
    float _2213 = _2145 * _2205;
    float _2215 = _2113 * _2187;
    float _2217 = _2187 * _2153;
    float _2219 = _2113 * _2199;
    float _2221 = _1619 * _2213;
    float _2223 = _2071 * _2169;
    float _2225 = -_2211;
    float _2227 = fma(_2191, _2209, _2225);
    float _2229 = -_2159;
    float _2231 = _2191 * _2229;
    float _2233 = -_2177;
    float _2235 = fma(_2161, 2.0, _2233);
    float _2237 = fma(_2191, _2223, _2215);
    float _2239 = fma(_2227, _2197, _2207);
    float _2241 = _2169 * _2153;
    float _2243 = fma(_2217, _2197, _2231);
    float _2245 = -_2145;
    float _2247 = _2245 + 1.0;
    float _2249 = fma(_2237, _2183, _2239);
    float _2251 = fma(_2241, _2183, _2243);
    float _2253 = fma(_2247, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2221);
    float _2255 = _1259 + _2249;
    float _2257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2259 = _1279 + _2251;
    float _2261 = _1941 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2265 = _2255 + _2263;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2269 = fma(_1623, _2201, _2253);
    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2273 = _2259 + _2271;
    float _2275 = _2265 * _2265;
    float _2277 = -_1915;
    float _2279 = _2277 + 1.0;
    float _2281 = fma(_1625, _2149, _2269);
    float _2283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2285 = fma(_2273, _2273, _2275);
    float _2287 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2065);
    float _2289 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2077);
    float _2291 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2079);
    float _2293 = fma(_1621, _2115, _2281);
    float _2295 = fma(_2191, _2215, _2223);
    float _2297 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2287);
    float _2299 = sqrt(_2285);
    float _2301 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2289);
    float _2303 = fma(_1787, _2109, _2293);
    float _2305 = -_2209;
    float _2307 = fma(_2191, _2211, _2305);
    float _2309 = fma(_2295, _2197, _2219);
    float _2311 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2291);
    float _2313 = fma(_2261, -2.0, _2267);
    float _2315 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2319 = fma(_2307, _2183, _2309);
    float _2321 = fma(_1801, _2067, _2303);
    float _2323 = _2283 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2325 = _2043 + 0.5;
    float _2327 = _1769 + _2319;
    float _2329 = _2165 + (-0.5);
    float _2331 = -_121;
    float _2333 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2235);
    bool _2335 = _2299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2339 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2313);
    float _2341 = fma(_1847, _2035, _2321);
    float _2343 = fma(_2323, _2325, _2333);
    float _2345 = -_2315;
    float _2347 = -_2339;
    float _2349 = fma(_2345, _2329, _2347);
    float _2351 = _2321;
    float _2353 = _2259;
    float _2355 = _2255;
    if (!_2335)
    {
        _2351 = _2327;
    }
    float _2357 = _2351;
    bool _2359 = !_2335;
    float _2361 = _2357;
    if (!_2359)
    {
        float _2363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2367 = _2299 + _2365;
        float _2369 = rsqrt(_2285);
        float _2371 = _2367 * _2363;
        float _2373 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2375 = _2371 * 0.15915493667125701904296875;
        float _2377 = _2375 * 6.283185482025146484375;
        float _2379 = cos(_2377);
        float _2381 = _2375 * 6.283185482025146484375;
        float _2383 = sin(_2381);
        float _2385 = _2379 + (-1.0);
        float _2387 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2389 = fma(_2383, _2373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2391 = fma(_2327, _2379, _2387);
        float _2393 = _2369 * _2389;
        float _2395 = fma(_2273, _2393, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2397 = fma(_2265, _2393, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2361 = _2391;
        _2353 = _2395;
        _2355 = _2397;
    }
    float _2399 = _2361;
    float _2401 = _2353;
    float _2403 = _2355;
    float _2405 = -_1769;
    float _2407 = _2405 + _2399;
    float _2409 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1877);
    float _2411 = -_1279;
    float _2413 = _2411 + _2401;
    float _2415 = _2173 * _2317;
    float _2417 = _2407 * _2407;
    float _2419 = -_2409;
    float _2421 = _2419 + 1.0;
    float _2423 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1943);
    float _2425 = -_1259;
    float _2427 = _2425 + _2403;
    float _2429 = fma(_2413, _2413, _2417);
    float _2431 = -_2421;
    float _2433 = fma(_1231, _2431, _1597);
    float _2435 = -_2423;
    float _2437 = _2435 + 1.0;
    float _2439 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2179);
    float _2441 = fma(_2427, _2427, _2429);
    float _2443 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1843);
    float _2445 = fma(_1947, _2437, _1971);
    float _2447 = _2175 * _2337;
    float _2449 = sqrt(_2441);
    float _2451 = -_2439;
    float _2453 = _2451 + 1.0;
    float _2455 = -_2443;
    float _2457 = _2455 + 1.0;
    float _2459 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2461 = _2301 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2463 = _2311 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2465 = -_2453;
    float _2467 = fma(_2043, _2465, _2343);
    float _2469 = fma(_2165, _2457, _2349);
    float _2471 = _2459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2473 = _2461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2475 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2477 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2341);
    out.m_58.x = _2415;
    out.m_58.y = _2447;
    out.m_60.x = _2433;
    out.m_60.y = _2445;
    out.m_60.z = _2467;
    out.m_60.w = _2469;
    bool _2479 = _2449 > 0.0;
    out.m_62.x = _2471;
    out.m_62.y = _2473;
    out.m_62.z = _2475;
    out.m_64.x = _2477;
    bool _2481 = !_2479;
    float _2483 = _2469;
    float _2485 = _2445;
    float _2487 = _2433;
    float _2489 = _2475;
    float _2491 = _2475;
    float _2493 = _2399;
    float _2495 = _2401;
    float _2497 = _2403;
    float _2499 = _2433;
    float _2501 = _2475;
    if (!_2481)
    {
        bool _2503 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2505 = _2473;
        if (_2503)
        {
            float _2507 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2505 = _2507;
        }
        float _2509 = _2505;
        if (_2503)
        {
            float _2511 = _481 * _2509;
            _2483 = _2511;
        }
        float _2513 = _2483;
        float _2515 = _2513;
        if (_2503)
        {
            float _2517 = _483 * _2509;
            _2485 = _2517;
        }
        float _2519 = _2485;
        float _2521 = _2519;
        if (_2503)
        {
            float _2523 = _485 * _2509;
            _2487 = _2523;
        }
        float _2525 = _2487;
        float _2527 = _2525;
        float _2529 = _2525;
        if (!_2503)
        {
            float _2531 = _121 + 1.0;
            float _2533 = _2531;
            if (!_157)
            {
                float _2535 = _2531 * _2531;
                float _2537 = _2535 * 0.5;
                _2527 = _2537;
            }
            float _2539 = _2527;
            float _2541 = _2539;
            if (!_157)
            {
                float _2543 = _2539 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2541 = _2543;
            }
            float _2545 = _2541;
            bool _2547 = !_157;
            float _2549 = _2545;
            if (!_2547)
            {
                float _2551 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2553 = log2(_2551);
                float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2557 = _2555 + 1.0;
                float _2559 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2561 = _2553 * _2531;
                float _2563 = 1.0 / _2557;
                float _2565 = _2559 * 0.693147182464599609375;
                float _2567 = exp2(_2561);
                float _2569 = 1.0 / _2565;
                float _2571 = _2567 + (-1.0);
                float _2573 = -_2571;
                float _2575 = fma(_2573, _2569, _2531);
                float _2577 = _2575 * _2563;
                float _2579 = _2577 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2549 = _2579;
            }
            float _2581 = _2549;
            float _2583 = _2581 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2585 = _2581 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2587 = !_157;
            if (!_2587)
            {
                float _2589 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2591 = log2(_2589);
                float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2595 = _2593 + 1.0;
                float _2597 = 1.0 / _2595;
                float _2599 = _2591 * _2531;
                float _2601 = exp2(_2599);
                float _2603 = -_2601;
                float _2605 = _2603 + 1.0;
                float _2607 = _2605 * _2597;
                _2533 = _2607;
                _2489 = _2597;
            }
            float _2609 = _2533;
            float _2611 = _2489;
            float _2613 = fma(_2609, _173, _2585);
            float _2615 = _2581 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2617 = fma(_2609, _171, _2583);
            float _2619 = -_425;
            float _2621 = _2619 + _2613;
            float _2623 = fma(_2609, _175, _2615);
            float _2625 = -_431;
            float _2627 = _2625 + _2617;
            float _2629 = _2621 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2631 = _2621 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2633 = _2621 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2635 = -_437;
            float _2637 = _2635 + _2623;
            float _2639 = fma(_2627, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2629);
            float _2641 = fma(_2627, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2631);
            float _2643 = fma(_2627, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2633);
            float _2645 = fma(_2637, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2639);
            float _2647 = fma(_2637, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2641);
            float _2649 = fma(_2637, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2643);
            _493 = _2647;
            _495 = _2645;
            _497 = _2649;
            _2515 = _2645;
            _2521 = _2647;
            _2529 = _2649;
            _2491 = _2611;
        }
        float _2651 = _493;
        float _2653 = _495;
        float _2655 = _497;
        float _2657 = _2515;
        float _2659 = _2521;
        float _2661 = _2529;
        float _2663 = _2491;
        float _2665 = _2651 * _2651;
        float _2667 = rsqrt(_2441);
        float _2669 = fma(_2653, _2653, _2665);
        float _2671 = fma(_2655, _2655, _2669);
        float _2673 = sqrt(_2671);
        float _2675 = _2413 * _2667;
        float _2677 = _2407 * _2667;
        float _2679 = _2427 * _2667;
        bool _2681 = _2673 > 0.0;
        bool _2683 = !_2681;
        _2499 = _2661;
        _2501 = _2663;
        if (!_2683)
        {
            float _2685 = rsqrt(_2671);
            float _2687 = _2685 * _2651;
            float _2689 = _2685 * _2653;
            float _2691 = _2685 * _2655;
            float _2693 = _2677 * _2687;
            float _2695 = fma(_2675, _2689, _2693);
            float _2697 = fma(_2679, _2691, _2695);
            float _2699 = _2697 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2701 = fma(_2657, _2699, _2401);
            float _2703 = fma(_2659, _2699, _2399);
            float _2705 = fma(_2661, _2699, _2403);
            _2493 = _2703;
            _2495 = _2701;
            _2497 = _2705;
        }
    }
    float _2707 = _2493;
    float _2709 = _2495;
    float _2711 = _2497;
    float _2713 = _2499;
    float _2715 = _2501;
    float _2717 = -_1855;
    float _2719 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1769);
    float _2721 = -_1859;
    float _2723 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _2725 = -_1887;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1259);
    float _2729 = _2719 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2731 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2733 = isnan(0.5);
    bool _2735 = _2731 || _2733;
    bool _2737 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2739 = _2735 || _2737;
    float _2741 = -_1855;
    float _2743 = fma(_2741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2707);
    bool _2745 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2747 = isnan(0.5);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2753 = _2749 || _2751;
    float _2755 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2729);
    float _2757 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2755);
    float _2759 = _2719 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2761 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2763 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2759);
    float _2765 = 1.0 / _2761;
    float _2767 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2763);
    float _2769 = _2713;
    float _2771 = _2743;
    float _2773 = _2715;
    float _2775 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2777 = _2719;
    if (_2753)
    {
        _2769 = 1.0;
    }
    float _2779 = _2769;
    float _2781 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2783 = _2781 + _2761;
    float _2785 = -_1859;
    float _2787 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2709);
    float _2789 = _2783 * _2765;
    float _2791 = _2789 * 0.5;
    float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2795 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2793);
    float _2797 = -_1887;
    float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2711);
    float _2801 = 1.0 / _2795;
    float _2803 = _2787;
    float _2805 = _2799;
    float _2807 = _2779;
    if (!_2739)
    {
        float _2809 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2811 = _2719 + _2809;
        float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2815 = _2723 + _2813;
        float _2817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2819 = -_1259;
        float _2821 = _2819 + _2711;
        float _2823 = _2811 * _2811;
        float _2825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2827 = _2727 + _2825;
        float _2829 = fma(_2815, _2815, _2823);
        float _2831 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2833 = fma(_2827, _2827, _2829);
        float _2835 = sqrt(_2833);
        float _2837 = 1.0 / _1995;
        float _2839 = _2831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2841 = precise::min(_2835, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2843 = _2841 * _2817;
        float _2845 = -_1769;
        float _2847 = _2845 + _2707;
        float _2849 = _2843 * _2837;
        float _2851 = -_1279;
        float _2853 = _2851 + _2709;
        float _2855 = _2839 * _2849;
        float _2857 = _2821 * _2849;
        float _2859 = fma(_2853, _2855, _2723);
        float _2861 = fma(_2847, _2855, _2719);
        float _2863 = fma(_2839, _2857, _2727);
        _2771 = _2861;
        _2803 = _2859;
        _2805 = _2863;
        _2773 = _2855;
    }
    float _2865 = _2771;
    float _2867 = _2803;
    float _2869 = _2805;
    float _2871 = _2773;
    float _2873 = _2871;
    if (_2753)
    {
        _2775 = 1.0;
    }
    float _2875 = _2775;
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2879 = _2801 * _2877;
    float _2881 = _2875;
    if (!_2753)
    {
        float _2883 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2885 = _2883 * 0.15915493667125701904296875;
        float _2887 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2889 = _2885 * 6.283185482025146484375;
        float _2891 = cos(_2889);
        float _2893 = _2887 * 0.15915493667125701904296875;
        float _2895 = _2885 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = 1.0 / _2891;
        float _2901 = _2893 * 6.283185482025146484375;
        float _2903 = cos(_2901);
        float _2905 = _2897 * _2899;
        float _2907 = _2893 * 6.283185482025146484375;
        float _2909 = sin(_2907);
        float _2911 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2913 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2911;
        float _2915 = _2903 * _2905;
        float _2917 = 1.0 / _2915;
        float _2919 = 1.0 / _2913;
        float _2921 = _2909 * _2917;
        float _2923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2925 = fma(_2879, _2921, _2923);
        float _2927 = _2925 * _2919;
        float _2929 = precise::clamp(_2927, 0.0, 1.0);
        _2777 = _2915;
        _2873 = _2885;
        _2807 = _2929;
    }
    float _2931 = _2777;
    float _2933 = _2873;
    float _2935 = _2807;
    float _2937 = _2933;
    float _2939 = _2931;
    if (!_2753)
    {
        float _2941 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2943 = _2941 * 0.15915493667125701904296875;
        float _2945 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2947 = _2943 * 6.283185482025146484375;
        float _2949 = cos(_2947);
        float _2951 = _2945 * 0.15915493667125701904296875;
        float _2953 = _2943 * 6.283185482025146484375;
        float _2955 = sin(_2953);
        float _2957 = 1.0 / _2949;
        float _2959 = _2951 * 6.283185482025146484375;
        float _2961 = cos(_2959);
        float _2963 = _2955 * _2957;
        float _2965 = _2951 * 6.283185482025146484375;
        float _2967 = sin(_2965);
        float _2969 = _2961 * _2963;
        float _2971 = 1.0 / _2969;
        float _2973 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2975 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2973;
        float _2977 = 1.0 / _2975;
        float _2979 = _2967 * _2971;
        float _2981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2983 = fma(_2879, _2979, _2981);
        float _2985 = _2983 * _2977;
        float _2987 = precise::clamp(_2985, 0.0, 1.0);
        float _2989 = -_2987;
        float _2991 = _2989 + 1.0;
        _2937 = _2971;
        _2939 = _2957;
        _2881 = _2991;
    }
    float _2993 = _2937;
    float _2995 = _2939;
    float _2997 = _2881;
    float _2999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3001 = _2865 + _2999;
    float _3003 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3005 = _2867 + _3003;
    float _3007 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3009 = _2869 + _3007;
    float _3011 = _3001 * _3001;
    float _3013 = fma(_3005, _3005, _3011);
    float _3015 = fma(_3009, _3009, _3013);
    float _3017 = rsqrt(_3015);
    float _3019 = sqrt(_3015);
    float _3021 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3023 = _3005 * _3021;
    float _3025 = _3009 * _3021;
    float _3027 = _3023 * _3023;
    float _3029 = _3025 * _3025;
    float _3031 = _3027 + _3029;
    float _3033 = sqrt(_3031);
    bool _3035 = _3033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3039 = _3033 + _3037;
    float _3041 = _3017;
    float _3043 = _3039;
    float _3045 = _2993;
    float _3047 = _3001;
    float _3049 = _3021;
    if (_3035)
    {
        float _3051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3041 = _3051;
    }
    float _3053 = _3041;
    float _3055 = _3053;
    if (_3035)
    {
        float _3057 = _3039 * _3053;
        _3043 = _3057;
    }
    float _3059 = _3043;
    if (_3035)
    {
        float _3061 = rsqrt(_3031);
        _3055 = _3061;
    }
    float _3063 = _3055;
    float _3065 = _3063;
    if (_3035)
    {
        float _3067 = _3059 * 0.15915493667125701904296875;
        _3045 = _3067;
    }
    float _3069 = _3045;
    float _3071 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3073 = _3009;
    float _3075 = _3069;
    if (_3035)
    {
        float _3077 = _3069 * 6.283185482025146484375;
        float _3079 = sin(_3077);
        _3073 = _3079;
    }
    float _3081 = _3073;
    float _3083 = precise::max(0.0, _3071);
    float _3085 = _2995;
    float _3087 = _3083;
    if (_3035)
    {
        float _3089 = _3069 * 6.283185482025146484375;
        float _3091 = cos(_3089);
        _3085 = _3091;
    }
    float _3093 = _3085;
    float _3095 = -_3021;
    float _3097 = -_3083;
    float _3099 = fma(_3001, _3095, _3097);
    if (_3035)
    {
        float _3101 = _3099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3047 = _3101;
    }
    float _3103 = _3047;
    float _3105 = _3081;
    float _3107 = _3103;
    if (_3035)
    {
        float _3109 = fma(_3081, _3103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3105 = _3109;
    }
    float _3111 = _3105;
    float _3113 = _3111;
    if (!_3035)
    {
        _3107 = _3027;
    }
    float _3115 = _3107;
    float _3117 = _3115;
    if (_3035)
    {
        float _3119 = _3063 * _3111;
        _3049 = _3119;
    }
    float _3121 = _3049;
    if (!_3035)
    {
        _3065 = _3023;
    }
    float _3123 = _3065;
    float _3125 = _3123;
    float _3127 = _3093;
    if (_3035)
    {
        float _3129 = _3093 + (-1.0);
        _3087 = _3129;
    }
    float _3131 = _3087;
    float _3133 = _3131;
    if (_3035)
    {
        float _3135 = _3023 * _3121;
        _3125 = _3135;
    }
    float _3137 = _3125;
    if (!_3035)
    {
        _3113 = _3099;
    }
    float _3139 = _3113;
    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3143 = fma(_3019, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3141);
    float _3145 = precise::clamp(_3143, 0.0, 1.0);
    float _3147 = _3139;
    if (_3035)
    {
        float _3149 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3075 = _3149;
    }
    float _3151 = _3075;
    if (!_3035)
    {
        _3133 = _3025;
    }
    float _3153 = _3133;
    float _3155 = _3153;
    if (_3035)
    {
        float _3157 = _3025 * _3121;
        _3155 = _3157;
    }
    float _3159 = _3155;
    if (_3035)
    {
        float _3161 = _3137 * _3137;
        _3117 = _3161;
    }
    float _3163 = _3117;
    if (_3035)
    {
        float _3165 = fma(_3099, _3093, _3151);
        _3147 = _3165;
    }
    float _3167 = _3147;
    if (!_3035)
    {
        _3127 = _3029;
    }
    float _3169 = _3127;
    float _3171 = _3169;
    if (_3035)
    {
        float _3173 = _3159 * _3159;
        _3171 = _3173;
    }
    float _3175 = _3171;
    float _3177 = -_3145;
    float _3179 = _3177 + 1.0;
    float _3181 = fma(_3167, _3167, _3163);
    float _3183 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3185 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3187 = _3181 + _3175;
    float _3189 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3183);
    float _3191 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3193 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3195 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3197 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3189);
    float _3199 = rsqrt(_3187);
    float _3201 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3191);
    float _3203 = _3197 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3205 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3193);
    float _3207 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3201);
    float _3209 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3195);
    float _3211 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3213 = abs(_3179);
    float _3215 = log2(_3213);
    float _3217 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3205);
    float _3219 = _3207 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3221 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3209);
    float _3223 = -_3211;
    float _3225 = fma(_3223, _3185, 1.0);
    float _3227 = _3217 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3229 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3231 = _3221 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3233 = _3199 * _3137;
    float _3235 = _3199 * _3167;
    float _3237 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3229);
    float _3239 = _3199 * _3159;
    float _3241 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3243 = log2(_3225);
    float _3245 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3237);
    float _3247 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3249 = -_3241;
    float _3251 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3249);
    float _3253 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3255 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3245);
    float _3257 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3247);
    float _3259 = -_3239;
    float _3261 = fma(_3259, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3251);
    float _3263 = exp2(_3253);
    float _3265 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3267 = _3235 + 1.0;
    float _3269 = fma(_3261, -0.5, 0.5);
    float _3271 = fma(_3261, 0.5, 0.5);
    float _3273 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3265);
    float _3275 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3257);
    float _3277 = 1.0 / _3255;
    float _3279 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3273);
    float _3281 = fma(_3271, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3283 = _3243 * 0.693147182464599609375;
    float _3285 = fma(_3271, _3281, -0.212114393711090087890625);
    float _3287 = sqrt(_3269);
    float _3289 = -_3235;
    float _3291 = fma(_3263, _3267, _3289);
    float _3293 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3279);
    float _3295 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3275);
    float _3297 = fma(_3271, _3285, 1.570728778839111328125);
    float _3299 = fma(_3291, 0.5, 0.5);
    float _3301 = _3293 * _3277;
    float _3303 = _3295 * _3277;
    float _3305 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3307 = fma(_3301, 0.5, 0.5);
    float _3309 = fma(_3303, -0.5, 0.5);
    float _3311 = _3287 * 0.636619746685028076171875;
    float _3313 = -_3297;
    float _3315 = fma(_3311, _3313, 1.0);
    float3 _8440 = float3(_3307, _3309, _3305);
    float _3317 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8440, float3(0.0), isnan(_8440)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8440, float3(0.0), isnan(_8440)), level(0.0)).x;
    float3 _8451 = float3(_3307, _3309, _3305);
    float4 _3320 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8451, float3(0.0), isnan(_8451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8451, float3(0.0), isnan(_8451)), level(0.0)).xyzw;
    float _3322 = _3320.x;
    float _3324 = _3320.y;
    float _3326 = _3320.z;
    float _3328 = _3320.w;
    float2 _8468 = float2(_3315, _3299);
    float3 _3332 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8468, float2(0.0), isnan(_8468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8468, float2(0.0), isnan(_8468)), level(0.0)).xyz;
    float _3334 = _3332.x;
    float _3336 = _3332.y;
    float _3338 = _3332.z;
    float _3340 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3342 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3344 = _2935 > 0.0;
    bool _3346 = isnan(_2935);
    bool _3348 = _3344 || _3346;
    bool _3350 = isnan(0.0);
    bool _3352 = _3348 || _3350;
    float _3354 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3342);
    float _3356 = exp2(_3340);
    float _3358 = _2935 * _2997;
    bool _3360 = _2997 <= 0.0;
    bool _3362 = !_3352;
    bool _3364 = _3360 || _3362;
    float _3366 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3354);
    float _3368 = _3358 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3370 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3366);
    float _3372 = _3255 * 0.5;
    float _3374 = _489 * _3368;
    float _3376 = _3293 + _3255;
    float _3378 = _3370 + _3255;
    out.gl_Position.x = _3293;
    out.gl_Position.y = _3295;
    out.gl_Position.z = _3370;
    out.gl_Position.w = _3255;
    float _3380 = _3376 * 0.5;
    float _3382 = _3378 * 0.5;
    float _3384 = -_3356;
    float _3386 = _3384 + 1.0;
    float _3388 = fma(_3295, -0.5, _3372);
    float _3390 = _3374 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3392 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.x = _3380;
    out.m_66.y = _3388;
    out.m_66.z = _3382;
    out.m_66.w = _3255;
    out.m_45.x = _3390;
    float _3394 = _3392 * _3317;
    float _3396 = -_3392;
    float _3398 = _3396 + 1.0;
    float _3400 = _3328 * _3394;
    float _3402 = _3338 * _3394;
    float _3404 = _3328 * _3398;
    float _3406 = fma(_3334, _3400, _3322);
    float _3408 = fma(_3336, _3400, _3324);
    float _3410 = fma(_3328, _3402, _3326);
    out.m_68.x = _3406;
    out.m_68.y = _3408;
    out.m_68.z = _3410;
    out.m_68.w = _3404;
    if (!_3364)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3412 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3412;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1109 = false;
    bool _923 = false;
    bool _811 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3469 = as_type<float>(_103);
        out.gl_Position.z = _3469;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3538 = as_type<float>(_139);
        out.gl_Position.z = _3538;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_54.w;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = _145 * _143;
    float _169 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = in.m_47.x;
    float _173 = in.m_47.y;
    float _175 = in.m_47.z;
    float _177 = _169 * 6.283185482025146484375;
    float _179 = floor(_169);
    int _181 = as_type<int>(_147) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_147) & 2;
    bool _187 = _185 != 0;
    float _189 = _177 * 0.15915493667125701904296875;
    bool _191 = !_183;
    float _193 = _191 ? (-0.5) : 0.5;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = _189 * 6.283185482025146484375;
    float _201 = cos(_199);
    float _203 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _205 = !_187;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_179;
    float _211 = _169 + _209;
    float _213 = _169;
    float _215 = _203;
    if (!_157)
    {
        float _217 = _203 * _203;
        float _219 = _217 * 0.5;
        _213 = _219;
    }
    float _221 = _213;
    float _223 = _221;
    if (!_157)
    {
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _225;
    }
    float _227 = _223;
    bool _229 = !_157;
    float _231 = _227;
    float _233 = _161;
    float _235 = _163;
    if (!_229)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _203 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _203);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _265;
    }
    float _267 = _231;
    bool _269 = !_157;
    if (!_269)
    {
        float _271 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _273 = log2(_271);
        float _275 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _277 = _275 + 1.0;
        float _279 = 1.0 / _277;
        float _281 = _203 * _273;
        float _283 = exp2(_281);
        float _285 = -_283;
        float _287 = _285 + 1.0;
        float _289 = _287 * _279;
        _215 = _289;
    }
    float _291 = _215;
    float _293 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _295 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _297 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _299 = fma(_291, _171, _293);
    bool _301 = _211 < 0.5;
    float _303 = float(_301);
    float _305 = fma(_291, _173, _295);
    float _307 = fma(_201, 0.5, 0.5);
    float _309 = fma(_299, _159, _161);
    float _311 = fma(_291, _175, _297);
    if (!_157)
    {
        float _313 = _121 * _121;
        float _315 = _313 * 0.5;
        _233 = _315;
    }
    float _317 = _233;
    float _319 = fma(_305, _159, _163);
    float _321 = -_211;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_303;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _329 = -_307;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = fma(_311, _159, _165);
    float _335 = _317;
    if (!_157)
    {
        float _337 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _335 = _337;
    }
    float _339 = _335;
    float _341 = _339;
    if (!_157)
    {
        _235 = _121;
    }
    float _343 = _235;
    bool _345 = !_197;
    int _347 = _345 ? 0 : 1;
    bool _349 = !_157;
    float _351 = _343;
    if (!_349)
    {
        float _353 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _355 = log2(_353);
        float _357 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _359 = _357 + 1.0;
        float _361 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _363 = _121 * _355;
        float _365 = 1.0 / _359;
        float _367 = _361 * 0.693147182464599609375;
        float _369 = exp2(_363);
        float _371 = 1.0 / _367;
        float _373 = _369 + (-1.0);
        float _375 = -_373;
        float _377 = fma(_375, _371, _121);
        float _379 = _377 * _365;
        float _381 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _341 = _381;
    }
    float _383 = _341;
    bool _385 = !_157;
    if (!_385)
    {
        float _387 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _389 = log2(_387);
        float _391 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _393 = _391 + 1.0;
        float _395 = 1.0 / _393;
        float _397 = _121 * _389;
        float _399 = exp2(_397);
        float _401 = -_399;
        float _403 = _401 + 1.0;
        float _405 = _403 * _395;
        _351 = _405;
    }
    float _407 = _351;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _411 = _409 != 0;
    int _413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _415 = _413 != 0;
    float _417 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _419 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _421 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _423 = abs(_347);
    float _425 = fma(_407, _173, _417);
    bool _427 = !_411;
    int _429 = _427 ? 0 : 1;
    float _431 = fma(_407, _171, _419);
    bool _433 = !_415;
    int _435 = _433 ? 0 : 1;
    float _437 = fma(_407, _175, _421);
    int _439 = abs(_429);
    float _441 = -_425;
    float _443 = _305 + _441;
    int _445 = abs(_435);
    float _447 = -_431;
    float _449 = _299 + _447;
    float _451 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _459 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _461 = float(_439);
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _467 = float(_423);
    float _469 = abs(_323);
    float _471 = _461 * _469;
    float _473 = -_437;
    float _475 = _311 + _473;
    float _477 = float(_445);
    float _479 = fma(_467, _331, _471);
    float _481 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _483 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
    float _485 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    float _487 = abs(_327);
    float _489 = fma(_477, _487, _479);
    bool _491 = !_457;
    float _493 = _483;
    float _495 = _481;
    float _497 = _485;
    float _513;
    if (!_491)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_87);
        float _519 = 1.0 / _517;
        float _521 = _121 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _527 = _523 + _525;
    float _529 = in.m_54.x;
    float _531 = in.m_54.y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _549;
    float _553 = 1.0 / _535;
    float _555 = 1.0 / _539;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _559 = _523 + _557;
    bool _561 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _563 = 1.0 / _547;
    float _565 = _559 * _553;
    bool _567 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _569 = isnan(_523);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    bool _579 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _581 = isnan(_523);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = 1.0 / _551;
    float _593 = _527 * _555;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _597 = _523 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _601 = _523 + _599;
    float _603 = -_589;
    float _605 = _603 + 1.0;
    float _607 = 1.0 / _543;
    float _609 = _597 * _563;
    bool _611 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _613 = isnan(_523);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _623;
    float _627 = fma(_625, _565, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _629 = _621 * _605;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _633 = _523 + _631;
    float _635 = _633 * _591;
    bool _637 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _639 = isnan(_523);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = _601 * _607;
    float _651 = -_577;
    float _653 = _651 + 1.0;
    bool _655 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _657 = isnan(_523);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -_647;
    float _669 = _667 + 1.0;
    float _671 = _647 * _653;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _673;
    float _677 = _589 * _669;
    float _679 = -_621;
    float _681 = _679 + 1.0;
    bool _683 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _685 = isnan(_523);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = fma(_675, _565, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _701 = _665 * _681;
    float _703 = -_665;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _711 = fma(_699, _593, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _713;
    float _717 = _693 * _705;
    float _719 = -_693;
    float _721 = _719 + 1.0;
    float _723 = fma(_709, _593, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _725;
    float _729 = _695 * _717;
    float _731 = _627 * _717;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _737 = fma(_727, _649, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _739 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _741 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[143].y, _731);
    float _743 = fma(_715, _649, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _745 = fma(_723, _701, _739);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _751 = fma(_711, _701, _741);
    float _753 = fma(_735, _609, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _755;
    float _759 = fma(_737, _629, _745);
    float _761 = fma(_749, _609, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _763;
    float _767 = fma(_743, _629, _751);
    float _769 = fma(_757, _635, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _771 = fma(_753, _677, _759);
    float _773 = fma(_765, _635, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _775 = fma(_761, _677, _767);
    float _777 = fma(_769, _671, _771);
    float _779 = fma(_773, _671, _775);
    float _781 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[148].x, _777);
    float _783 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[148].y, _779);
    float _785 = _781 * _529;
    float _787 = _783 * _531;
    bool _789 = !_561;
    int _791 = as_type<int>(_609);
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _809;
    if (!_789)
    {
        float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _797 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _801 = _799 * _795;
        float _803 = floor(_801);
        float _805 = -_803;
        float _807 = _801 + _805;
        _809 = _807;
        _811 = true;
    }
    else
    {
        float _813 = float(_87);
        float _815 = 1.0 / _813;
        float _817 = _121 * _815;
        _809 = _817;
    }
    _811 = false;
    float _819 = _809;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _823 = _819 + _821;
    bool _825 = _819 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _827 = isnan(_819);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _837;
    bool _841 = _819 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _843 = isnan(_819);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -_835;
    float _855 = _853 + 1.0;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _857;
    float _861 = 1.0 / _839;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _865 = _851 * _855;
    float _867 = -_851;
    float _869 = _867 + 1.0;
    float _871 = _823 * _861;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _873;
    float _877 = fma(_859, _871, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _879;
    float _883 = fma(_875, _871, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _885 = _877 * _865;
    float _887 = fma(_881, _871, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _889 = _883 * _865;
    float _891 = _887 * _865;
    float _893 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[107].x, _885);
    float _895 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[107].y, _891);
    float _897 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[107].z, _889);
    float _899 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[108].x, _893);
    float _901 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[108].y, _895);
    float _903 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[108].z, _897);
    bool _905 = !_863;
    float _921;
    if (!_905)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _909 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _913 = _911 * _907;
        float _915 = floor(_913);
        float _917 = -_915;
        float _919 = _913 + _917;
        _921 = _919;
        _923 = true;
    }
    else
    {
        float _925 = float(_87);
        float _927 = 1.0 / _925;
        float _929 = _121 * _927;
        _921 = _929;
    }
    _923 = false;
    float _931 = _921;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _935 = _931 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _945 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _947 = isnan(_931);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _961 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _963 = isnan(_931);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / _939;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _975;
    float _979 = -_955;
    float _981 = _979 + 1.0;
    bool _983 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _985 = isnan(_931);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    bool _995 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _997 = 1.0 / _943;
    float _999 = 1.0 / _959;
    float _1001 = _977 * _973;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1007 = _971 * _981;
    float _1009 = -_971;
    float _1011 = _1009 + 1.0;
    float _1013 = fma(_1001, _935, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1015;
    float _1019 = _993 * _1011;
    float _1021 = _1005 * _997;
    bool _1023 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1025 = isnan(_931);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1037 = _931 + _1035;
    float _1039 = _1013 * _1019;
    float _1041 = -_993;
    float _1043 = _1041 + 1.0;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1047 = _931 + _1045;
    float _1049 = fma(_1021, _1037, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1051 = _1017 * _999;
    float _1053 = -_1033;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1039);
    float _1059 = _899 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1061 = fma(_1051, _1047, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1063 = _955 * _1055;
    float _1065 = fma(_1049, _1007, _1057);
    float _1067 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1071 = fma(_1061, _1063, _1065);
    float _1073 = _901 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1071);
    float _1077 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1081 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1069;
    out.m_56.y = _1077;
    out.m_56.z = _1079;
    out.m_56.w = _1081;
    bool _1083 = !_995;
    float _1105;
    float _1107;
    if (!_1083)
    {
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1087 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1089 = float(_87);
        float _1091 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _1093 = 1.0 / _1089;
        float _1095 = _1091 * _1085;
        float _1097 = floor(_1095);
        float _1099 = _121 * _1093;
        float _1101 = -_1097;
        float _1103 = _1095 + _1101;
        _1105 = _1103;
        _1107 = _1099;
        _1109 = true;
    }
    else
    {
        float _1111 = float(_87);
        float _1113 = 1.0 / _1111;
        float _1115 = _121 * _1113;
        _1105 = _1115;
        _1107 = _1115;
    }
    _1109 = false;
    float _1117 = _1105;
    float _1119 = _1107;
    float _1121 = in.m_49.z;
    float _1123 = _141 * 2.0;
    float _1125 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1127 = log2(_1125);
    float _1129 = in.m_49.y;
    bool _1131 = _141 > 0.5;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1135 = _1133 != 0;
    float _1137 = floor(_1123);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1143;
    float _1147 = _121 * _1127;
    float _1149 = 1.0 / _1141;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1159 = _1121 * 2.0;
    bool _1161 = _1121 > 0.5;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1165 = _1137 >= 0.0;
    bool _1167 = isnan(_1137);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    float _1175 = _1129 * 2.0;
    float _1177 = -_207;
    int _1179 = _1161 ? as_type<int>(_1177) : as_type<int>(_207);
    float _1181 = floor(_1159);
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1183;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1191 = floor(_1175);
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1193;
    bool _1197 = _1181 > 0.0;
    float _1199 = exp2(_1147);
    bool _1201 = _1181 >= 0.0;
    bool _1203 = isnan(_1181);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan(0.0);
    bool _1209 = _1205 || _1207;
    float _1211 = -_193;
    int _1213 = _1131 ? as_type<int>(_1211) : as_type<int>(_193);
    int _1215 = _1209 ? 0 : 1;
    bool _1217 = _1137 > 0.0;
    float _1219 = _319 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1221 = ~_1215;
    int _1223 = _1221 + 1;
    int _1225 = _1223 + 1;
    float _1227 = 1.0 / _1145;
    bool _1229 = !_1135;
    float _1231 = _1229 ? _193 : as_type<float>(_1213);
    float _1233 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1219);
    int _1235 = _1225;
    if (!_1197)
    {
        int _1237 = ~_1215;
        int _1239 = _1237 + 1;
        _1235 = _1239;
    }
    int _1241 = _1235;
    float _1243 = _319 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1245 = _1129 > 0.5;
    float _1247 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1233);
    float _1249 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1243);
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1257 = _1255 != 0;
    float _1259 = _1247 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1261 = -_193;
    int _1263 = _1245 ? as_type<int>(_1261) : as_type<int>(_193);
    float _1265 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1249);
    float _1267 = -_207;
    int _1269 = _1245 ? as_type<int>(_1267) : as_type<int>(_207);
    float _1271 = -_1259;
    float _1273 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1275 = !_1253;
    float _1277 = _1275 ? _193 : as_type<float>(_1263);
    float _1279 = _1265 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1281 = _1173 ? 0 : 1;
    float _1283 = -_1199;
    float _1285 = _1283 + 1.0;
    bool _1287 = !_1257;
    float _1289 = _1287 ? _207 : as_type<float>(_1179);
    float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1293 = _1279 + _1291;
    int _1295 = ~_1281;
    int _1297 = _1295 + 1;
    int _1299 = _1297 + 1;
    float _1301 = _319 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1305 = _1303 != 0;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1309 = _1307 != 0;
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1313 = _1311 != 0;
    float _1315 = _1293 * 0.0625;
    float _1317 = abs(_1293);
    float _1319 = abs(_1273);
    float _1321 = precise::max(_1317, _1319);
    float _1323 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1301);
    int _1325 = _1299;
    float _1327 = _1273;
    bool _1329 = _1309;
    if (!_1217)
    {
        int _1331 = ~_1281;
        int _1333 = _1331 + 1;
        _1325 = _1333;
    }
    int _1335 = _1325;
    float _1337 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1339 = _1321 >= 16.0;
    float _1341 = 1.0 / _1153;
    float _1343 = _1339 ? _1315 : _1293;
    bool _1345 = !_1305;
    int _1347 = _1345 ? 0 : 1;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1351 = 1.0 + _1349;
    bool _1353 = _1191 > 0.0;
    float _1355 = 1.0 / _1157;
    bool _1357 = _1191 >= 0.0;
    bool _1359 = isnan(_1191);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan(0.0);
    bool _1365 = _1361 || _1363;
    bool _1367 = !_1309;
    int _1369 = _1367 ? 0 : 1;
    float _1371 = as_type<float>(_1335);
    if (_1339)
    {
        float _1373 = _1273 * 0.0625;
        _1327 = _1373;
    }
    float _1375 = _1327;
    float _1377 = abs(_1343);
    bool _1379 = _1377 != 0.0;
    bool _1381 = isnan(_1377);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan(0.0);
    bool _1387 = _1383 || _1385;
    int _1389 = _1365 ? 0 : 1;
    float _1391 = 1.0 / _1351;
    float _1393 = abs(_1375);
    bool _1395 = _1393 == 0.0;
    bool _1397 = !_1387;
    bool _1399 = _1395 && _1397;
    float _1401 = _1189 * _1341;
    bool _1403 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1405 = isnan(0.0);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1411 = _1407 || _1409;
    float _1413 = _141 + _1121;
    int _1415 = ~_1389;
    int _1417 = _1415 + 1;
    int _1419 = _1417 + 1;
    float _1421 = _1411 ? _1285 : 0.0;
    float _1423 = _1413 + (-1.0);
    int _1425 = _1419;
    if (!_1353)
    {
        int _1427 = ~_1389;
        int _1429 = _1427 + 1;
        _1425 = _1429;
    }
    int _1431 = _1425;
    float _1433 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1435 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1437 = isnan(1.0);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1443 = _1439 || _1441;
    if (_1399)
    {
        bool _1445 = as_type<int>(_1375) >= 0;
        _1329 = _1445;
    }
    bool _1447 = _1329;
    float _1449 = _1421 * _1391;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    if (_1399)
    {
        int _1455 = _1447 ? 0 : 1078530011;
        _791 = _1455;
    }
    int _1457 = _791;
    bool _1459 = !_1443;
    float _1461 = _1459 ? _121 : _1449;
    float _1463 = 1.0 / _1453;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1467 = _1465 != 0;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    if (_1399)
    {
        int _1473 = int(0x80000000) & as_type<int>(_1343);
        int _1475 = _1457 | _1473;
        _793 = as_type<float>(_1475);
    }
    float _1477 = _793;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1481 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1487 = -_1479;
    float _1489 = fma(_1337, 2.0, _1487);
    float _1491 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1323);
    float _1493 = 1.0 / _1471;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1495;
    float _1499 = fma(_1481, -2.0, _1163);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1503 = _1117 + _1501;
    float _1505 = _1497 * _1149;
    float _1507 = abs(_1375);
    bool _1509 = _1507 == 0.0;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1511;
    float _1515 = 1.0 / _1485;
    float _1517 = _1503 * _1227;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1521 = _1519 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1523 = _1513 * _1463;
    float _1525 = _1129 + _1121;
    float _1527 = -_121;
    float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1489);
    bool _1531 = !_1313;
    int _1533 = _1531 ? 0 : 1;
    float _1535 = _1525 + (-1.0);
    float _1537 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1539 = _1537 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1543 = _1541 != 0;
    float _1545 = 1.0 / _1521;
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1549 = _1539 * _1493;
    float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1555 = in.m_49.w;
    float _1557 = _1185 * _1515;
    float _1559 = _1553 * _1355;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1563 = _141 + _1129;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1567 = _1565 != 0;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1569;
    int _1573 = abs(_1347);
    float _1575 = _1563 + (-1.0);
    float _1577 = _1571 * _1545;
    float _1579 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1581 = _1231 + 0.5;
    float _1583 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1585;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1589;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1595 = _1119 + _1593;
    float _1597 = fma(_1583, _1581, _1529);
    float _1599 = fma(_1587, _1517, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1601 = fma(_1591, _1517, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1603 = fma(_1195, _1517, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1607 = _1119 + _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1611 = _1119 + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1615 = _1119 + _1613;
    bool _1617 = _1555 > 0.5;
    float _1619 = fma(_1505, _1607, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1621 = fma(_1559, _1611, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1623 = fma(_1549, _1615, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1625 = fma(_1523, _1595, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _1627 = !_1387;
    bool _1629 = _1627 && _1509;
    int _1631 = as_type<int>(_1615);
    int _1633 = _1617 ? (-1) : 0;
    float _1635 = _1477;
    float _1637 = _1477;
    if (!_1629)
    {
        float _1639 = abs(_1343);
        bool _1641 = _1639 != as_type<float>(0x7f800000u /* inf */);
        bool _1643 = isnan(_1639);
        bool _1645 = _1641 || _1643;
        bool _1647 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1649 = _1645 || _1647;
        float _1651 = abs(_1375);
        bool _1653 = _1651 == as_type<float>(0x7f800000u /* inf */);
        bool _1655 = !_1649;
        bool _1657 = _1653 && _1655;
        if (_1657)
        {
            _1631 = 1075235812;
        }
        int _1659 = _1631;
        int _1661 = _1659;
        if (_1657)
        {
            bool _1663 = as_type<int>(_1375) >= 0;
            _1633 = _1663 ? (-1) : 0;
        }
        int _1665 = _1633;
        if (_1657)
        {
            int _1667 = ~_1665;
            int _1669 = (_1667 != 0) ? _1659 : 1061752795;
            _1661 = _1669;
        }
        int _1671 = _1661;
        if (_1657)
        {
            int _1673 = int(0x80000000) & as_type<int>(_1343);
            int _1675 = _1671 | _1673;
            _1635 = as_type<float>(_1675);
        }
        float _1677 = _1635;
        float _1679 = abs(_1375);
        bool _1681 = _1679 == as_type<float>(0x7f800000u /* inf */);
        bool _1683 = !_1649;
        bool _1685 = _1683 && _1681;
        _1637 = _1677;
        if (!_1685)
        {
            float _1687 = abs(_1343);
            float _1689 = abs(_1375);
            float _1691 = precise::max(_1687, _1689);
            float _1693 = abs(_1343);
            float _1695 = abs(_1375);
            float _1697 = precise::min(_1693, _1695);
            float _1699 = 1.0 / _1691;
            float _1701 = abs(_1343);
            float _1703 = abs(_1375);
            bool _1705 = _1701 > _1703;
            float _1707 = abs(_1343);
            float _1709 = abs(_1375);
            float _1711 = _1707 + _1709;
            float _1713 = _1697 * _1699;
            float _1715 = _1713 * _1713;
            float _1717 = _1715 + 11.33538818359375;
            float _1719 = fma(_1715, _1717, 28.84246826171875);
            float _1721 = fma(_1715, _1719, 19.6966705322265625);
            float _1723 = fma(_1715, -0.82336294651031494140625, -5.674867153167724609375);
            float _1725 = fma(_1715, _1723, -6.565555095672607421875);
            float _1727 = 1.0 / _1721;
            float _1729 = _1715 * _1725;
            float _1731 = _1713 * _1729;
            float _1733 = fma(_1731, _1727, _1713);
            float _1735 = _1733;
            _1637 = _1711;
            if (_1705)
            {
                float _1737 = -_1733;
                float _1739 = _1737 + 1.57079637050628662109375;
                _1735 = _1739;
            }
            float _1741 = _1735;
            bool _1743 = as_type<int>(_1375) >= 0;
            int _1745 = as_type<int>(_1343) & int(0x80000000);
            int _1747 = as_type<int>(_1741);
            if (!_1743)
            {
                float _1749 = -_1741;
                float _1751 = _1749 + 3.1415927410125732421875;
                _1747 = as_type<int>(_1751);
            }
            int _1753 = _1747;
            bool _1755 = _1711 > as_type<float>(0x7f800000u /* inf */);
            bool _1757 = isnan(_1711);
            bool _1759 = _1755 || _1757;
            bool _1761 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1763 = _1759 || _1761;
            if (!_1763)
            {
                int _1765 = _1745 | _1753;
                _1637 = as_type<float>(_1765);
            }
        }
    }
    float _1767 = _1637;
    float _1769 = _1491 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1773 = _1119 + _1771;
    float _1775 = float(_1241);
    float _1777 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1779 = _1119 + _1777;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1783 = _1769 + _1781;
    float _1785 = float(_1573);
    float _1787 = fma(_1557, _1773, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    int _1789 = abs(_1369);
    float _1791 = _1783 * _1783;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1795 = _1259 + _1793;
    float _1797 = _1785 * _1775;
    float _1799 = fma(_1293, _1293, _1791);
    float _1801 = fma(_1401, _1779, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1803 = float(_1335);
    float _1805 = _1797 * (-2.0);
    float _1807 = fma(_1795, _1795, _1799);
    float _1809 = float(_1789);
    float _1811 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    int _1813 = abs(_1533);
    float _1815 = fma(_1579, _1805, _1579);
    float _1817 = rsqrt(_1807);
    float _1819 = _1809 * _1803;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1823 = _1119 + _1821;
    if (!_1467)
    {
        _1371 = _1121;
    }
    float _1825 = _1371;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1829 = _1825;
    if (_1467)
    {
        _1829 = _1129;
    }
    float _1831 = _1829;
    float _1833 = _1277 + 0.5;
    float _1835 = float(_1431);
    float _1837 = -_1289;
    float _1839 = _1837 + 0.5;
    float _1841 = float(_1813);
    float _1843 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1827);
    float _1845 = _1819 * (-2.0);
    float _1847 = fma(_1577, _1823, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1851 = _1849 != 0;
    float _1853 = _1841 * _1835;
    float _1855 = _1783 * _1817;
    float _1857 = fma(_1547, _1845, _1547);
    float _1859 = _1293 * _1817;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1863 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1865 = -_1855;
    float _1867 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1783);
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1467)
    {
        _1869 = _1129;
    }
    float _1871 = _1869;
    float _1873 = -_1859;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1293);
    float _1877 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1863);
    float _1879 = _1871;
    if (_1467)
    {
        _1879 = _141;
    }
    float _1881 = _1879;
    float _1883 = _1867 * _1867;
    float _1885 = _141 + (-0.5);
    float _1887 = _1795 * _1817;
    float _1889 = _1853 * (-2.0);
    float _1891 = fma(_1875, _1875, _1883);
    float _1893 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1895 = -_1887;
    float _1897 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1795);
    float _1899 = fma(_1433, _1889, _1433);
    float _1901 = fma(_1461, _1815, _1893);
    float _1903 = fma(_1897, _1897, _1891);
    bool _1905 = _1117 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1907 = isnan(_1117);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = _1129 + (-0.5);
    bool _1919 = _1117 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1921 = isnan(_1117);
    bool _1923 = _1919 || _1921;
    bool _1925 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1927 = _1923 || _1925;
    float _1929 = float(_1927);
    float _1931 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    if (!_1467)
    {
        _1933 = _1121;
    }
    float _1935 = _1933;
    float _1937 = sqrt(_1903);
    float _1939 = _1935;
    if (_1467)
    {
        _1939 = _1129;
    }
    float _1941 = _1939;
    float _1943 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1931);
    bool _1945 = !_1851;
    float _1947 = _1945 ? _207 : as_type<float>(_1269);
    float _1949 = _1121 + (-0.5);
    float _1951 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1953 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1499);
    float _1955 = _1917 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1957 = _1947 + (-0.5);
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1961 = _1121 > 0.5;
    float _1963 = -_1929;
    float _1965 = _1963 + 1.0;
    float _1967 = -_1951;
    float _1969 = -_1953;
    float _1971 = fma(_1967, _1957, _1969);
    float _1973 = fma(_1461, _1857, _1955);
    float _1975 = fma(_1461, _1899, _1959);
    bool _1977 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1979 = isnan(_1119);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = _1915 * _1965;
    float _1991 = -_1767;
    float _1993 = _1973 + _1991;
    float _1995 = _1817 * _1937;
    float _1997 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1999 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2001 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2003 = isnan(_1119);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1987;
    float _2015 = _2013 + 1.0;
    float _2017 = -_193;
    int _2019 = _1961 ? as_type<int>(_2017) : as_type<int>(_193);
    float _2021 = _1993 * 0.15915493667125701904296875;
    bool _2023 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2025 = isnan(_1119);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    float _2035 = _2011 * _2015;
    float _2037 = -_2011;
    float _2039 = _2037 + 1.0;
    bool _2041 = !_1543;
    float _2043 = _2041 ? _193 : as_type<float>(_2019);
    float _2045 = _1901 * 0.15915493667125701904296875;
    float _2047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    bool _2049 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2051 = isnan(_1119);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2057 = _2053 || _2055;
    float _2059 = float(_2057);
    float _2061 = _1975 * 0.15915493667125701904296875;
    bool _2063 = _1555 > 0.5;
    float _2065 = _1599 * _1989;
    float _2067 = _2033 * _2039;
    float _2069 = _2045 * 6.283185482025146484375;
    float _2071 = sin(_2069);
    float _2073 = -_2033;
    float _2075 = _2073 + 1.0;
    float _2077 = _1601 * _1989;
    float _2079 = _1603 * _1989;
    bool _2081 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2083 = isnan(_1119);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2089 = _2085 || _2087;
    float _2091 = float(_2089);
    float _2093 = -_2059;
    float _2095 = _2093 + 1.0;
    bool _2097 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2099 = isnan(_1119);
    bool _2101 = _2097 || _2099;
    bool _2103 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2105 = _2101 || _2103;
    float _2107 = float(_2105);
    float _2109 = _2059 * _2075;
    float _2111 = _2045 * 6.283185482025146484375;
    float _2113 = cos(_2111);
    float _2115 = _2091 * _2095;
    float _2117 = -_2091;
    float _2119 = _2117 + 1.0;
    bool _2121 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2123 = isnan(_1119);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2129 = _2125 || _2127;
    float _2131 = float(_2129);
    float _2133 = _1995 * _1999;
    bool _2135 = _1119 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2137 = isnan(_1119);
    bool _2139 = _2135 || _2137;
    bool _2141 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2143 = _2139 || _2141;
    float _2145 = float(_2143);
    float _2147 = _1995 * _1997;
    float _2149 = _2107 * _2119;
    float _2151 = _2061 * 6.283185482025146484375;
    float _2153 = cos(_2151);
    float _2155 = -_207;
    int _2157 = _2063 ? as_type<int>(_2155) : as_type<int>(_207);
    float _2159 = _2133 * _1811;
    float _2161 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2163 = !_1567;
    float _2165 = _2163 ? _207 : as_type<float>(_2157);
    float _2167 = _2021 * 6.283185482025146484375;
    float _2169 = sin(_2167);
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2173 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2175 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2179 = fma(_1881, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2171);
    float _2181 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2183 = _2181 * 0.5;
    float _2185 = _2021 * 6.283185482025146484375;
    float _2187 = cos(_2185);
    float _2189 = _2061 * 6.283185482025146484375;
    float _2191 = sin(_2189);
    float _2193 = -_2107;
    float _2195 = _2193 + 1.0;
    float _2197 = _2147 * _2047;
    float _2199 = _2153 * _2159;
    float _2201 = _2131 * _2195;
    float _2203 = -_2131;
    float _2205 = _2203 + 1.0;
    float _2207 = _2071 * _2199;
    float _2209 = _2071 * _2187;
    float _2211 = _2113 * _2169;
    float _2213 = _2145 * _2205;
    float _2215 = _2113 * _2187;
    float _2217 = _2187 * _2153;
    float _2219 = _2113 * _2199;
    float _2221 = _1619 * _2213;
    float _2223 = _2071 * _2169;
    float _2225 = -_2211;
    float _2227 = fma(_2191, _2209, _2225);
    float _2229 = -_2159;
    float _2231 = _2191 * _2229;
    float _2233 = -_2177;
    float _2235 = fma(_2161, 2.0, _2233);
    float _2237 = fma(_2191, _2223, _2215);
    float _2239 = fma(_2227, _2197, _2207);
    float _2241 = _2169 * _2153;
    float _2243 = fma(_2217, _2197, _2231);
    float _2245 = -_2145;
    float _2247 = _2245 + 1.0;
    float _2249 = fma(_2237, _2183, _2239);
    float _2251 = fma(_2241, _2183, _2243);
    float _2253 = fma(_2247, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2221);
    float _2255 = _1259 + _2249;
    float _2257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2259 = _1279 + _2251;
    float _2261 = _1941 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2265 = _2255 + _2263;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2269 = fma(_1623, _2201, _2253);
    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2273 = _2259 + _2271;
    float _2275 = _2265 * _2265;
    float _2277 = -_1915;
    float _2279 = _2277 + 1.0;
    float _2281 = fma(_1625, _2149, _2269);
    float _2283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2285 = fma(_2273, _2273, _2275);
    float _2287 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2065);
    float _2289 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2077);
    float _2291 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2079);
    float _2293 = fma(_1621, _2115, _2281);
    float _2295 = fma(_2191, _2215, _2223);
    float _2297 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2287);
    float _2299 = sqrt(_2285);
    float _2301 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2289);
    float _2303 = fma(_1787, _2109, _2293);
    float _2305 = -_2209;
    float _2307 = fma(_2191, _2211, _2305);
    float _2309 = fma(_2295, _2197, _2219);
    float _2311 = fma(_1929, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2291);
    float _2313 = fma(_2261, -2.0, _2267);
    float _2315 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2319 = fma(_2307, _2183, _2309);
    float _2321 = fma(_1801, _2067, _2303);
    float _2323 = _2283 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2325 = _2043 + 0.5;
    float _2327 = _1769 + _2319;
    float _2329 = _2165 + (-0.5);
    float _2331 = -_121;
    float _2333 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2235);
    bool _2335 = _2299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2339 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2313);
    float _2341 = fma(_1847, _2035, _2321);
    float _2343 = fma(_2323, _2325, _2333);
    float _2345 = -_2315;
    float _2347 = -_2339;
    float _2349 = fma(_2345, _2329, _2347);
    float _2351 = _2321;
    float _2353 = _2259;
    float _2355 = _2255;
    if (!_2335)
    {
        _2351 = _2327;
    }
    float _2357 = _2351;
    bool _2359 = !_2335;
    float _2361 = _2357;
    if (!_2359)
    {
        float _2363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2367 = _2299 + _2365;
        float _2369 = rsqrt(_2285);
        float _2371 = _2367 * _2363;
        float _2373 = _2327 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2375 = _2371 * 0.15915493667125701904296875;
        float _2377 = _2375 * 6.283185482025146484375;
        float _2379 = cos(_2377);
        float _2381 = _2375 * 6.283185482025146484375;
        float _2383 = sin(_2381);
        float _2385 = _2379 + (-1.0);
        float _2387 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2389 = fma(_2383, _2373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2391 = fma(_2327, _2379, _2387);
        float _2393 = _2369 * _2389;
        float _2395 = fma(_2273, _2393, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2397 = fma(_2265, _2393, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2361 = _2391;
        _2353 = _2395;
        _2355 = _2397;
    }
    float _2399 = _2361;
    float _2401 = _2353;
    float _2403 = _2355;
    float _2405 = -_1769;
    float _2407 = _2405 + _2399;
    float _2409 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1877);
    float _2411 = -_1279;
    float _2413 = _2411 + _2401;
    float _2415 = _2173 * _2317;
    float _2417 = _2407 * _2407;
    float _2419 = -_2409;
    float _2421 = _2419 + 1.0;
    float _2423 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1943);
    float _2425 = -_1259;
    float _2427 = _2425 + _2403;
    float _2429 = fma(_2413, _2413, _2417);
    float _2431 = -_2421;
    float _2433 = fma(_1231, _2431, _1597);
    float _2435 = -_2423;
    float _2437 = _2435 + 1.0;
    float _2439 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2179);
    float _2441 = fma(_2427, _2427, _2429);
    float _2443 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1843);
    float _2445 = fma(_1947, _2437, _1971);
    float _2447 = _2175 * _2337;
    float _2449 = sqrt(_2441);
    float _2451 = -_2439;
    float _2453 = _2451 + 1.0;
    float _2455 = -_2443;
    float _2457 = _2455 + 1.0;
    float _2459 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2461 = _2301 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2463 = _2311 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2465 = -_2453;
    float _2467 = fma(_2043, _2465, _2343);
    float _2469 = fma(_2165, _2457, _2349);
    float _2471 = _2459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2473 = _2461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2475 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2477 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2341);
    out.m_58.x = _2415;
    out.m_58.y = _2447;
    out.m_60.x = _2433;
    out.m_60.y = _2445;
    out.m_60.z = _2467;
    out.m_60.w = _2469;
    bool _2479 = _2449 > 0.0;
    out.m_62.x = _2471;
    out.m_62.y = _2473;
    out.m_62.z = _2475;
    out.m_64.x = _2477;
    bool _2481 = !_2479;
    float _2483 = _2469;
    float _2485 = _2445;
    float _2487 = _2433;
    float _2489 = _2475;
    float _2491 = _2475;
    float _2493 = _2399;
    float _2495 = _2401;
    float _2497 = _2403;
    float _2499 = _2433;
    float _2501 = _2475;
    if (!_2481)
    {
        bool _2503 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2505 = _2473;
        if (_2503)
        {
            float _2507 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2505 = _2507;
        }
        float _2509 = _2505;
        if (_2503)
        {
            float _2511 = _481 * _2509;
            _2483 = _2511;
        }
        float _2513 = _2483;
        float _2515 = _2513;
        if (_2503)
        {
            float _2517 = _483 * _2509;
            _2485 = _2517;
        }
        float _2519 = _2485;
        float _2521 = _2519;
        if (_2503)
        {
            float _2523 = _485 * _2509;
            _2487 = _2523;
        }
        float _2525 = _2487;
        float _2527 = _2525;
        float _2529 = _2525;
        if (!_2503)
        {
            float _2531 = _121 + 1.0;
            float _2533 = _2531;
            if (!_157)
            {
                float _2535 = _2531 * _2531;
                float _2537 = _2535 * 0.5;
                _2527 = _2537;
            }
            float _2539 = _2527;
            float _2541 = _2539;
            if (!_157)
            {
                float _2543 = _2539 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2541 = _2543;
            }
            float _2545 = _2541;
            bool _2547 = !_157;
            float _2549 = _2545;
            if (!_2547)
            {
                float _2551 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2553 = log2(_2551);
                float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2557 = _2555 + 1.0;
                float _2559 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2561 = _2553 * _2531;
                float _2563 = 1.0 / _2557;
                float _2565 = _2559 * 0.693147182464599609375;
                float _2567 = exp2(_2561);
                float _2569 = 1.0 / _2565;
                float _2571 = _2567 + (-1.0);
                float _2573 = -_2571;
                float _2575 = fma(_2573, _2569, _2531);
                float _2577 = _2575 * _2563;
                float _2579 = _2577 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2549 = _2579;
            }
            float _2581 = _2549;
            float _2583 = _2581 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2585 = _2581 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2587 = !_157;
            if (!_2587)
            {
                float _2589 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2591 = log2(_2589);
                float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2595 = _2593 + 1.0;
                float _2597 = 1.0 / _2595;
                float _2599 = _2591 * _2531;
                float _2601 = exp2(_2599);
                float _2603 = -_2601;
                float _2605 = _2603 + 1.0;
                float _2607 = _2605 * _2597;
                _2533 = _2607;
                _2489 = _2597;
            }
            float _2609 = _2533;
            float _2611 = _2489;
            float _2613 = fma(_2609, _173, _2585);
            float _2615 = _2581 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2617 = fma(_2609, _171, _2583);
            float _2619 = -_425;
            float _2621 = _2619 + _2613;
            float _2623 = fma(_2609, _175, _2615);
            float _2625 = -_431;
            float _2627 = _2625 + _2617;
            float _2629 = _2621 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2631 = _2621 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2633 = _2621 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2635 = -_437;
            float _2637 = _2635 + _2623;
            float _2639 = fma(_2627, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2629);
            float _2641 = fma(_2627, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2631);
            float _2643 = fma(_2627, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2633);
            float _2645 = fma(_2637, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2639);
            float _2647 = fma(_2637, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2641);
            float _2649 = fma(_2637, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2643);
            _493 = _2647;
            _495 = _2645;
            _497 = _2649;
            _2515 = _2645;
            _2521 = _2647;
            _2529 = _2649;
            _2491 = _2611;
        }
        float _2651 = _493;
        float _2653 = _495;
        float _2655 = _497;
        float _2657 = _2515;
        float _2659 = _2521;
        float _2661 = _2529;
        float _2663 = _2491;
        float _2665 = _2651 * _2651;
        float _2667 = rsqrt(_2441);
        float _2669 = fma(_2653, _2653, _2665);
        float _2671 = fma(_2655, _2655, _2669);
        float _2673 = sqrt(_2671);
        float _2675 = _2413 * _2667;
        float _2677 = _2407 * _2667;
        float _2679 = _2427 * _2667;
        bool _2681 = _2673 > 0.0;
        bool _2683 = !_2681;
        _2499 = _2661;
        _2501 = _2663;
        if (!_2683)
        {
            float _2685 = rsqrt(_2671);
            float _2687 = _2685 * _2651;
            float _2689 = _2685 * _2653;
            float _2691 = _2685 * _2655;
            float _2693 = _2677 * _2687;
            float _2695 = fma(_2675, _2689, _2693);
            float _2697 = fma(_2679, _2691, _2695);
            float _2699 = _2697 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2701 = fma(_2657, _2699, _2401);
            float _2703 = fma(_2659, _2699, _2399);
            float _2705 = fma(_2661, _2699, _2403);
            _2493 = _2703;
            _2495 = _2701;
            _2497 = _2705;
        }
    }
    float _2707 = _2493;
    float _2709 = _2495;
    float _2711 = _2497;
    float _2713 = _2499;
    float _2715 = _2501;
    float _2717 = -_1855;
    float _2719 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1769);
    float _2721 = -_1859;
    float _2723 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _2725 = -_1887;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1259);
    float _2729 = _2719 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2731 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2733 = isnan(0.5);
    bool _2735 = _2731 || _2733;
    bool _2737 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2739 = _2735 || _2737;
    float _2741 = -_1855;
    float _2743 = fma(_2741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2707);
    bool _2745 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2747 = isnan(0.5);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2753 = _2749 || _2751;
    float _2755 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2729);
    float _2757 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2755);
    float _2759 = _2719 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2761 = _2757 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2763 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2759);
    float _2765 = 1.0 / _2761;
    float _2767 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2763);
    float _2769 = _2713;
    float _2771 = _2743;
    float _2773 = _2715;
    float _2775 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2777 = _2719;
    if (_2753)
    {
        _2769 = 1.0;
    }
    float _2779 = _2769;
    float _2781 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2783 = _2781 + _2761;
    float _2785 = -_1859;
    float _2787 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2709);
    float _2789 = _2783 * _2765;
    float _2791 = _2789 * 0.5;
    float _2793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2795 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2793);
    float _2797 = -_1887;
    float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2711);
    float _2801 = 1.0 / _2795;
    float _2803 = _2787;
    float _2805 = _2799;
    float _2807 = _2779;
    if (!_2739)
    {
        float _2809 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2811 = _2719 + _2809;
        float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2815 = _2723 + _2813;
        float _2817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2819 = -_1259;
        float _2821 = _2819 + _2711;
        float _2823 = _2811 * _2811;
        float _2825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2827 = _2727 + _2825;
        float _2829 = fma(_2815, _2815, _2823);
        float _2831 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2833 = fma(_2827, _2827, _2829);
        float _2835 = sqrt(_2833);
        float _2837 = 1.0 / _1995;
        float _2839 = _2831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2841 = precise::min(_2835, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2843 = _2841 * _2817;
        float _2845 = -_1769;
        float _2847 = _2845 + _2707;
        float _2849 = _2843 * _2837;
        float _2851 = -_1279;
        float _2853 = _2851 + _2709;
        float _2855 = _2839 * _2849;
        float _2857 = _2821 * _2849;
        float _2859 = fma(_2853, _2855, _2723);
        float _2861 = fma(_2847, _2855, _2719);
        float _2863 = fma(_2839, _2857, _2727);
        _2771 = _2861;
        _2803 = _2859;
        _2805 = _2863;
        _2773 = _2855;
    }
    float _2865 = _2771;
    float _2867 = _2803;
    float _2869 = _2805;
    float _2871 = _2773;
    float _2873 = _2871;
    if (_2753)
    {
        _2775 = 1.0;
    }
    float _2875 = _2775;
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2879 = _2801 * _2877;
    float _2881 = _2875;
    if (!_2753)
    {
        float _2883 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2885 = _2883 * 0.15915493667125701904296875;
        float _2887 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2889 = _2885 * 6.283185482025146484375;
        float _2891 = cos(_2889);
        float _2893 = _2887 * 0.15915493667125701904296875;
        float _2895 = _2885 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = 1.0 / _2891;
        float _2901 = _2893 * 6.283185482025146484375;
        float _2903 = cos(_2901);
        float _2905 = _2897 * _2899;
        float _2907 = _2893 * 6.283185482025146484375;
        float _2909 = sin(_2907);
        float _2911 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2913 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2911;
        float _2915 = _2903 * _2905;
        float _2917 = 1.0 / _2915;
        float _2919 = 1.0 / _2913;
        float _2921 = _2909 * _2917;
        float _2923 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2925 = fma(_2879, _2921, _2923);
        float _2927 = _2925 * _2919;
        float _2929 = precise::clamp(_2927, 0.0, 1.0);
        _2777 = _2915;
        _2873 = _2885;
        _2807 = _2929;
    }
    float _2931 = _2777;
    float _2933 = _2873;
    float _2935 = _2807;
    float _2937 = _2933;
    float _2939 = _2931;
    if (!_2753)
    {
        float _2941 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2943 = _2941 * 0.15915493667125701904296875;
        float _2945 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2947 = _2943 * 6.283185482025146484375;
        float _2949 = cos(_2947);
        float _2951 = _2945 * 0.15915493667125701904296875;
        float _2953 = _2943 * 6.283185482025146484375;
        float _2955 = sin(_2953);
        float _2957 = 1.0 / _2949;
        float _2959 = _2951 * 6.283185482025146484375;
        float _2961 = cos(_2959);
        float _2963 = _2955 * _2957;
        float _2965 = _2951 * 6.283185482025146484375;
        float _2967 = sin(_2965);
        float _2969 = _2961 * _2963;
        float _2971 = 1.0 / _2969;
        float _2973 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2975 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2973;
        float _2977 = 1.0 / _2975;
        float _2979 = _2967 * _2971;
        float _2981 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2983 = fma(_2879, _2979, _2981);
        float _2985 = _2983 * _2977;
        float _2987 = precise::clamp(_2985, 0.0, 1.0);
        float _2989 = -_2987;
        float _2991 = _2989 + 1.0;
        _2937 = _2971;
        _2939 = _2957;
        _2881 = _2991;
    }
    float _2993 = _2937;
    float _2995 = _2939;
    float _2997 = _2881;
    float _2999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3001 = _2865 + _2999;
    float _3003 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3005 = _2867 + _3003;
    float _3007 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3009 = _2869 + _3007;
    float _3011 = _3001 * _3001;
    float _3013 = fma(_3005, _3005, _3011);
    float _3015 = fma(_3009, _3009, _3013);
    float _3017 = rsqrt(_3015);
    float _3019 = sqrt(_3015);
    float _3021 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3023 = _3005 * _3021;
    float _3025 = _3009 * _3021;
    float _3027 = _3023 * _3023;
    float _3029 = _3025 * _3025;
    float _3031 = _3027 + _3029;
    float _3033 = sqrt(_3031);
    bool _3035 = _3033 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3039 = _3033 + _3037;
    float _3041 = _3017;
    float _3043 = _3039;
    float _3045 = _2993;
    float _3047 = _3001;
    float _3049 = _3021;
    if (_3035)
    {
        float _3051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3041 = _3051;
    }
    float _3053 = _3041;
    float _3055 = _3053;
    if (_3035)
    {
        float _3057 = _3039 * _3053;
        _3043 = _3057;
    }
    float _3059 = _3043;
    if (_3035)
    {
        float _3061 = rsqrt(_3031);
        _3055 = _3061;
    }
    float _3063 = _3055;
    float _3065 = _3063;
    if (_3035)
    {
        float _3067 = _3059 * 0.15915493667125701904296875;
        _3045 = _3067;
    }
    float _3069 = _3045;
    float _3071 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3073 = _3009;
    float _3075 = _3069;
    if (_3035)
    {
        float _3077 = _3069 * 6.283185482025146484375;
        float _3079 = sin(_3077);
        _3073 = _3079;
    }
    float _3081 = _3073;
    float _3083 = precise::max(0.0, _3071);
    float _3085 = _2995;
    float _3087 = _3083;
    if (_3035)
    {
        float _3089 = _3069 * 6.283185482025146484375;
        float _3091 = cos(_3089);
        _3085 = _3091;
    }
    float _3093 = _3085;
    float _3095 = -_3021;
    float _3097 = -_3083;
    float _3099 = fma(_3001, _3095, _3097);
    if (_3035)
    {
        float _3101 = _3099 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3047 = _3101;
    }
    float _3103 = _3047;
    float _3105 = _3081;
    float _3107 = _3103;
    if (_3035)
    {
        float _3109 = fma(_3081, _3103, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3105 = _3109;
    }
    float _3111 = _3105;
    float _3113 = _3111;
    if (!_3035)
    {
        _3107 = _3027;
    }
    float _3115 = _3107;
    float _3117 = _3115;
    if (_3035)
    {
        float _3119 = _3063 * _3111;
        _3049 = _3119;
    }
    float _3121 = _3049;
    if (!_3035)
    {
        _3065 = _3023;
    }
    float _3123 = _3065;
    float _3125 = _3123;
    float _3127 = _3093;
    if (_3035)
    {
        float _3129 = _3093 + (-1.0);
        _3087 = _3129;
    }
    float _3131 = _3087;
    float _3133 = _3131;
    if (_3035)
    {
        float _3135 = _3023 * _3121;
        _3125 = _3135;
    }
    float _3137 = _3125;
    if (!_3035)
    {
        _3113 = _3099;
    }
    float _3139 = _3113;
    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3143 = fma(_3019, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3141);
    float _3145 = precise::clamp(_3143, 0.0, 1.0);
    float _3147 = _3139;
    if (_3035)
    {
        float _3149 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3075 = _3149;
    }
    float _3151 = _3075;
    if (!_3035)
    {
        _3133 = _3025;
    }
    float _3153 = _3133;
    float _3155 = _3153;
    if (_3035)
    {
        float _3157 = _3025 * _3121;
        _3155 = _3157;
    }
    float _3159 = _3155;
    if (_3035)
    {
        float _3161 = _3137 * _3137;
        _3117 = _3161;
    }
    float _3163 = _3117;
    if (_3035)
    {
        float _3165 = fma(_3099, _3093, _3151);
        _3147 = _3165;
    }
    float _3167 = _3147;
    if (!_3035)
    {
        _3127 = _3029;
    }
    float _3169 = _3127;
    float _3171 = _3169;
    if (_3035)
    {
        float _3173 = _3159 * _3159;
        _3171 = _3173;
    }
    float _3175 = _3171;
    float _3177 = -_3145;
    float _3179 = _3177 + 1.0;
    float _3181 = fma(_3167, _3167, _3163);
    float _3183 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3185 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3187 = _3181 + _3175;
    float _3189 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3183);
    float _3191 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3193 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3195 = _2865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3197 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3189);
    float _3199 = rsqrt(_3187);
    float _3201 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3191);
    float _3203 = _3197 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3205 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3193);
    float _3207 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3201);
    float _3209 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3195);
    float _3211 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3213 = abs(_3179);
    float _3215 = log2(_3213);
    float _3217 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3205);
    float _3219 = _3207 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3221 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3209);
    float _3223 = -_3211;
    float _3225 = fma(_3223, _3185, 1.0);
    float _3227 = _3217 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3229 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3231 = _3221 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3233 = _3199 * _3137;
    float _3235 = _3199 * _3167;
    float _3237 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3229);
    float _3239 = _3199 * _3159;
    float _3241 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3243 = log2(_3225);
    float _3245 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3237);
    float _3247 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3249 = -_3241;
    float _3251 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3249);
    float _3253 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3255 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3245);
    float _3257 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3247);
    float _3259 = -_3239;
    float _3261 = fma(_3259, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3251);
    float _3263 = exp2(_3253);
    float _3265 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3267 = _3235 + 1.0;
    float _3269 = fma(_3261, -0.5, 0.5);
    float _3271 = fma(_3261, 0.5, 0.5);
    float _3273 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3265);
    float _3275 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3257);
    float _3277 = 1.0 / _3255;
    float _3279 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3273);
    float _3281 = fma(_3271, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3283 = _3243 * 0.693147182464599609375;
    float _3285 = fma(_3271, _3281, -0.212114393711090087890625);
    float _3287 = sqrt(_3269);
    float _3289 = -_3235;
    float _3291 = fma(_3263, _3267, _3289);
    float _3293 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3279);
    float _3295 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3275);
    float _3297 = fma(_3271, _3285, 1.570728778839111328125);
    float _3299 = fma(_3291, 0.5, 0.5);
    float _3301 = _3293 * _3277;
    float _3303 = _3295 * _3277;
    float _3305 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3307 = fma(_3301, 0.5, 0.5);
    float _3309 = fma(_3303, -0.5, 0.5);
    float _3311 = _3287 * 0.636619746685028076171875;
    float _3313 = -_3297;
    float _3315 = fma(_3311, _3313, 1.0);
    float3 _8440 = float3(_3307, _3309, _3305);
    float _3317 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8440, float3(0.0), isnan(_8440)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8440, float3(0.0), isnan(_8440)), level(0.0)).x;
    float3 _8451 = float3(_3307, _3309, _3305);
    float4 _3320 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8451, float3(0.0), isnan(_8451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8451, float3(0.0), isnan(_8451)), level(0.0)).xyzw;
    float _3322 = _3320.x;
    float _3324 = _3320.y;
    float _3326 = _3320.z;
    float _3328 = _3320.w;
    float2 _8468 = float2(_3315, _3299);
    float3 _3332 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8468, float2(0.0), isnan(_8468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8468, float2(0.0), isnan(_8468)), level(0.0)).xyz;
    float _3334 = _3332.x;
    float _3336 = _3332.y;
    float _3338 = _3332.z;
    float _3340 = _3215 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3342 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3344 = _2935 > 0.0;
    bool _3346 = isnan(_2935);
    bool _3348 = _3344 || _3346;
    bool _3350 = isnan(0.0);
    bool _3352 = _3348 || _3350;
    float _3354 = fma(_3227, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3342);
    float _3356 = exp2(_3340);
    float _3358 = _2935 * _2997;
    bool _3360 = _2997 <= 0.0;
    bool _3362 = !_3352;
    bool _3364 = _3360 || _3362;
    float _3366 = fma(_3203, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3354);
    float _3368 = _3358 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3370 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3366);
    float _3372 = _3255 * 0.5;
    float _3374 = _489 * _3368;
    float _3376 = _3293 + _3255;
    float _3378 = _3370 + _3255;
    out.gl_Position.x = _3293;
    out.gl_Position.y = _3295;
    out.gl_Position.z = _3370;
    out.gl_Position.w = _3255;
    float _3380 = _3376 * 0.5;
    float _3382 = _3378 * 0.5;
    float _3384 = -_3356;
    float _3386 = _3384 + 1.0;
    float _3388 = fma(_3295, -0.5, _3372);
    float _3390 = _3374 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3392 = _3386 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.x = _3380;
    out.m_66.y = _3388;
    out.m_66.z = _3382;
    out.m_66.w = _3255;
    out.m_45.x = _3390;
    float _3394 = _3392 * _3317;
    float _3396 = -_3392;
    float _3398 = _3396 + 1.0;
    float _3400 = _3328 * _3394;
    float _3402 = _3338 * _3394;
    float _3404 = _3328 * _3398;
    float _3406 = fma(_3334, _3400, _3322);
    float _3408 = fma(_3336, _3400, _3324);
    float _3410 = fma(_3328, _3402, _3326);
    out.m_68.x = _3406;
    out.m_68.y = _3408;
    out.m_68.z = _3410;
    out.m_68.w = _3404;
    if (!_3364)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3412 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3412;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

