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
    float4 m_72 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1950 = false;
    bool _301 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2255 = as_type<float>(_119);
        out.gl_Position.z = _2255;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2325 = as_type<float>(_157);
        out.gl_Position.z = _2325;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _163 = as_type<int>(_159) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_159) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _197;
    if (!_179)
    {
        float _181 = in.m_56.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_103);
        float _203 = 1.0 / _201;
        float _205 = _137 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -_223;
    float _231 = _229 + 1.0;
    bool _233 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _235 = 1.0 / _227;
    float _237 = _211 * _235;
    bool _239 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_207);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = _249 * _231;
    float _261 = fma(_253, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_257, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = -_249;
    float _267 = _265 + 1.0;
    float _269 = _261 * _259;
    float _271 = _263 * _259;
    float _273 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_233;
    float _299;
    if (!_281)
    {
        float _283 = in.m_56.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_103);
        float _305 = 1.0 / _303;
        float _307 = _137 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = in.m_56.z;
    float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _315 = log2(_313);
    float _317 = in.m_56.x;
    float _319 = in.m_56.y;
    float _321 = in.m_58.x;
    float _323 = in.m_58.y;
    float _325 = in.m_58.z;
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _329 = _327 != 0;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _337 = _335 != 0;
    bool _339 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _341 = isnan(1.0);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _347 = _343 || _345;
    float _349 = in.m_60.y;
    float _351 = _315 * _137;
    float _353 = exp2(_351);
    float _355 = _311 * 2.0;
    float _357 = _319 + _311;
    float _359 = _317 * 2.0;
    float _361 = _319 * 2.0;
    float _363 = floor(_355);
    float _365 = _357 + (-1.0);
    float _367 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _369 = _319 + _317;
    float _371 = floor(_359);
    float _373 = -_353;
    float _375 = _373 + 1.0;
    float _377 = _369 + (-1.0);
    float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _383 = 1.0 + _381;
    bool _385 = _363 > 0.0;
    float _387 = floor(_361);
    bool _389 = _363 >= 0.0;
    bool _391 = isnan(_363);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    bool _399 = !_329;
    int _401 = _399 ? 0 : 1;
    int _403 = _397 ? 0 : 1;
    bool _405 = _371 > 0.0;
    float _407 = 1.0 / _383;
    bool _409 = _371 >= 0.0;
    bool _411 = isnan(_371);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    int _419 = ~_403;
    int _421 = _419 + 1;
    int _423 = _421 + 1;
    int _425 = _423;
    if (!_385)
    {
        int _427 = ~_403;
        int _429 = _427 + 1;
        _425 = _429;
    }
    int _431 = _425;
    int _433 = abs(_401);
    bool _435 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _437 = isnan(0.0);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _443 = _439 || _441;
    float _445 = float(_433);
    float _447 = float(_431);
    bool _449 = !_333;
    int _451 = _449 ? 0 : 1;
    float _453 = _443 ? _375 : 0.0;
    float _455 = _445 * _447;
    int _457 = _417 ? 0 : 1;
    int _459 = abs(_451);
    if (_347)
    {
        float _461 = _453 * _407;
        _139 = _461;
    }
    float _463 = _139;
    bool _465 = _387 > 0.0;
    bool _467 = _387 >= 0.0;
    bool _469 = isnan(_387);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = _455 * (-2.0);
    int _479 = ~_457;
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    float _485 = _317 + (-0.5);
    int _487 = _483;
    if (!_405)
    {
        int _489 = ~_457;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = fma(_477, _321, _321);
    float _497 = fma(_379, _477, _379);
    float _499 = float(_493);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[196].x, _495);
    float _503 = float(_459);
    int _505 = _475 ? 0 : 1;
    bool _507 = !_337;
    int _509 = _507 ? 0 : 1;
    float _511 = _503 * _499;
    int _513 = ~_505;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = fma(_497, _463, _501);
    int _521 = _517;
    if (!_465)
    {
        int _523 = ~_505;
        int _525 = _523 + 1;
        _521 = _525;
    }
    int _527 = _521;
    float _529 = _511 * (-2.0);
    int _531 = abs(_509);
    float _533 = _311 + _317;
    float _535 = float(_527);
    float _537 = _319 + (-0.5);
    float _539 = float(_531);
    float _541 = fma(_529, _323, _323);
    float _543 = _533 + (-1.0);
    float _545 = fma(_367, _529, _367);
    float _547 = _519 * 0.15915493667125701904296875;
    float _549 = _539 * _535;
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[196].y, _541);
    float _553 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _555 = in.m_62.x;
    float _557 = in.m_62.y;
    float _559 = in.m_62.z;
    float _561 = in.m_62.w;
    float _563 = _549 * (-2.0);
    float _565 = fma(_545, _463, _551);
    float _567 = _311 + (-0.5);
    float _569 = in.m_46.x;
    float _571 = in.m_46.y;
    float _573 = in.m_46.z;
    float _575 = fma(_563, _325, _325);
    float _577 = fma(_553, _563, _553);
    float _579 = _565 * 0.15915493667125701904296875;
    float _581 = in.m_64.x;
    float _583 = in.m_64.y;
    float _585 = in.m_64.z;
    float _587 = in.m_64.w;
    float _589 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[196].z, _575);
    float _591 = _547 * 6.283185482025146484375;
    float _593 = sin(_591);
    bool _595 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _597 = isnan(0.5);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _603 = _599 || _601;
    float _605 = in.m_66.x;
    float _607 = in.m_66.y;
    float _609 = fma(_577, _463, _589);
    bool _611 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _613 = isnan(0.5);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _619 = _615 || _617;
    float _621 = _609 * 0.15915493667125701904296875;
    float _623 = _547 * 6.283185482025146484375;
    float _625 = cos(_623);
    float _627 = _579 * 6.283185482025146484375;
    float _629 = sin(_627);
    float _631 = _571 * _557;
    float _633 = _571 * _583;
    float _635 = _571 + _349;
    float _637 = _579 * 6.283185482025146484375;
    float _639 = cos(_637);
    float _641 = fma(_569, _555, _631);
    float _643 = _279 * _607;
    float _645 = _277 * _605;
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _649 = fma(_573, _559, _641);
    float _651 = _643 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _655 = _621 * 6.283185482025146484375;
    float _657 = cos(_655);
    float _659 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _661 = _651 * _647;
    float _663 = _593 * _629;
    float _665 = fma(_569, _581, _633);
    float _667 = _659 * _653;
    float _669 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _671 = _649 + _561;
    float _673 = _621 * 6.283185482025146484375;
    float _675 = sin(_673);
    float _677 = _625 * _639;
    float _679 = _593 * _639;
    float _681 = fma(_573, _585, _665);
    float _683 = _635 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _685 = _681 + _587;
    float _687 = _625 * _657;
    float _689 = _625 * _629;
    float _691 = _593 * _657;
    float _693 = _639 * _657;
    float _695 = _687 * _661;
    float _697 = _629 * _657;
    float _699 = fma(_675, _677, _663);
    float _701 = -_661;
    float _703 = _675 * _701;
    float _705 = -_679;
    float _707 = fma(_675, _689, _705);
    float _709 = -_689;
    float _711 = fma(_675, _679, _709);
    float _713 = fma(_699, _667, _695);
    float _715 = _691 * _661;
    float _717 = fma(_693, _667, _703);
    float _719 = fma(_675, _663, _677);
    float _721 = fma(_707, _669, _713);
    float _723 = fma(_711, _667, _715);
    float _725 = fma(_697, _669, _717);
    float _727 = _721 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _729 = fma(_719, _669, _723);
    float _731 = _721 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _733 = _721 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _735 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[26].x, _727);
    float _737 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[24].x, _731);
    float _739 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[11].x, _683);
    float _741 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[25].x, _733);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].z, _737);
    float _747 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[11].z, _739);
    float _749 = _741 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _751 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].z, _743);
    float _753 = _745 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _755 = _747 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _757 = _685 + _749;
    float _759 = _635 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _761 = _671 + _753;
    float _763 = 1.0 / _755;
    float _765 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _767 = _757 + _765;
    float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _771 = _761 + _769;
    float _773 = _767 * _767;
    float _775 = fma(_771, _771, _773);
    float _777 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[10].x, _759);
    float _779 = sqrt(_775);
    float _781 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[10].z, _777);
    float _783 = _781 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _785 = _783 + _755;
    float _787 = _785 * _763;
    float _789 = _787 * 0.5;
    bool _791 = _779 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[30].w, _793);
    float _797 = _751 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _799 = _635 + _797;
    float _801 = 1.0 / _795;
    float _803 = _579;
    float _805 = _733;
    float _807 = _757;
    float _809 = _761;
    float _811 = _755;
    float _813 = _577;
    float _815 = _547;
    float _817 = _715;
    if (!_791)
    {
        _803 = _799;
    }
    float _819 = _803;
    bool _821 = !_791;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _779 + _827;
        float _831 = rsqrt(_775);
        float _833 = _829 * _825;
        float _835 = _799 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = _833 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = _841 + (-1.0);
        float _849 = fma(_845, _835, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _851 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _853 = _831 * _849;
        float _855 = fma(_799, _841, _851);
        float _857 = fma(_771, _853, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _859 = fma(_767, _853, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _805 = _853;
        _823 = _855;
        _807 = _859;
        _809 = _857;
        _811 = _849;
    }
    float _861 = _805;
    float _863 = _823;
    float _865 = _807;
    float _867 = _809;
    float _869 = _811;
    float _871 = _869;
    float _873 = _863;
    float _875 = _867;
    float _877 = _865;
    float _879 = _861;
    if (_619)
    {
        _813 = 1.0;
    }
    float _881 = _813;
    float _883 = _881;
    if (!_603)
    {
        float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _887 = _635 + _885;
        float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _891 = _671 + _889;
        float _893 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _895 = -_635;
        float _897 = _895 + _863;
        float _899 = _887 * _887;
        float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _903 = _685 + _901;
        float _905 = fma(_891, _891, _899);
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _909 = fma(_903, _903, _905);
        float _911 = sqrt(_909);
        float _913 = _893 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _915 = precise::min(_911, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _917 = _915 * _907;
        float _919 = -_685;
        float _921 = _919 + _865;
        float _923 = _913 * _917;
        float _925 = -_671;
        float _927 = _925 + _867;
        float _929 = fma(_897, _923, _635);
        float _931 = fma(_927, _923, _671);
        float _933 = fma(_921, _923, _685);
        _871 = _923;
        _873 = _929;
        _875 = _931;
        _877 = _933;
        _879 = _893;
    }
    float _935 = _871;
    float _937 = _873;
    float _939 = _875;
    float _941 = _877;
    float _943 = _879;
    float _945 = _935;
    float _947 = _943;
    if (_619)
    {
        _815 = 1.0;
    }
    float _949 = _815;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _953 = _801 * _951;
    float _955 = _949;
    if (!_619)
    {
        float _957 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _959 = _957 * 0.15915493667125701904296875;
        float _961 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _963 = _959 * 6.283185482025146484375;
        float _965 = cos(_963);
        float _967 = _961 * 0.15915493667125701904296875;
        float _969 = _959 * 6.283185482025146484375;
        float _971 = sin(_969);
        float _973 = 1.0 / _965;
        float _975 = _967 * 6.283185482025146484375;
        float _977 = cos(_975);
        float _979 = _971 * _973;
        float _981 = _967 * 6.283185482025146484375;
        float _983 = sin(_981);
        float _985 = _977 * _979;
        float _987 = 1.0 / _985;
        float _989 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _991 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _989;
        float _993 = 1.0 / _991;
        float _995 = _983 * _987;
        float _997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _999 = fma(_953, _995, _997);
        float _1001 = _999 * _993;
        float _1003 = precise::clamp(_1001, 0.0, 1.0);
        _945 = _993;
        _947 = _967;
        _883 = _1003;
    }
    float _1005 = _945;
    float _1007 = _947;
    float _1009 = _883;
    float _1011 = _1005;
    float _1013 = _1007;
    if (!_619)
    {
        float _1015 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1017 = _1015 * 0.15915493667125701904296875;
        float _1019 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1021 = _1017 * 6.283185482025146484375;
        float _1023 = cos(_1021);
        float _1025 = _1019 * 0.15915493667125701904296875;
        float _1027 = _1017 * 6.283185482025146484375;
        float _1029 = sin(_1027);
        float _1031 = 1.0 / _1023;
        float _1033 = _1025 * 6.283185482025146484375;
        float _1035 = cos(_1033);
        float _1037 = _1029 * _1031;
        float _1039 = _1025 * 6.283185482025146484375;
        float _1041 = sin(_1039);
        float _1043 = _1035 * _1037;
        float _1045 = 1.0 / _1043;
        float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1049 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1047;
        float _1051 = 1.0 / _1049;
        float _1053 = _1041 * _1045;
        float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1057 = fma(_953, _1053, _1055);
        float _1059 = _1057 * _1051;
        float _1061 = precise::clamp(_1059, 0.0, 1.0);
        float _1063 = -_1061;
        float _1065 = _1063 + 1.0;
        _1011 = _1031;
        _1013 = _1043;
        _955 = _1065;
    }
    float _1067 = _1011;
    float _1069 = _1013;
    float _1071 = _955;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _937 + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1079 = _939 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1083 = _941 + _1081;
    float _1085 = _1075 * _1075;
    float _1087 = fma(_1079, _1079, _1085);
    float _1089 = fma(_1083, _1083, _1087);
    float _1091 = rsqrt(_1089);
    float _1093 = sqrt(_1089);
    float _1095 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1097 = _1079 * _1095;
    float _1099 = _1083 * _1095;
    float _1101 = _1097 * _1097;
    float _1103 = _1099 * _1099;
    float _1105 = _1101 + _1103;
    float _1107 = sqrt(_1105);
    bool _1109 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1113 = _1107 + _1111;
    float _1115 = _1067;
    float _1117 = _1105;
    float _1119 = _1113;
    float _1121 = _1075;
    float _1123 = _1095;
    if (_1109)
    {
        float _1125 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1115 = _1125;
    }
    float _1127 = _1115;
    if (_1109)
    {
        float _1129 = rsqrt(_1105);
        _1117 = _1129;
    }
    float _1131 = _1117;
    float _1133 = _1127;
    float _1135 = _1131;
    if (_1109)
    {
        float _1137 = _1113 * _1127;
        _1119 = _1137;
    }
    float _1139 = _1119;
    if (_1109)
    {
        float _1141 = _1139 * 0.15915493667125701904296875;
        _1133 = _1141;
    }
    float _1143 = _1133;
    float _1145 = _1083;
    float _1147 = _1143;
    if (_1109)
    {
        float _1149 = _1143 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        _1145 = _1151;
    }
    float _1153 = _1145;
    float _1155 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1157 = precise::max(0.0, _1155);
    float _1159 = _1069;
    if (_1109)
    {
        float _1161 = _1143 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        _1159 = _1163;
    }
    float _1165 = _1159;
    float _1167 = -_1095;
    float _1169 = -_1157;
    float _1171 = fma(_1075, _1167, _1169);
    float _1173 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1109)
    {
        float _1175 = _1171 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1121 = _1175;
    }
    float _1177 = _1121;
    float _1179 = _1177;
    if (!_1109)
    {
        _1147 = _1097;
    }
    float _1181 = _1147;
    float _1183 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1185 = _1153;
    float _1187 = _1181;
    if (_1109)
    {
        float _1189 = fma(_1153, _1177, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1185 = _1189;
    }
    float _1191 = _1185;
    float _1193 = _1191;
    if (!_1109)
    {
        _1179 = _1171;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    float _1199 = _1165;
    if (_1109)
    {
        float _1201 = _1165 + (-1.0);
        _1173 = _1201;
    }
    float _1203 = _1173;
    if (_1109)
    {
        float _1205 = _1131 * _1191;
        _817 = _1205;
    }
    float _1207 = _817;
    if (!_1109)
    {
        _1135 = _1099;
    }
    float _1209 = _1135;
    float _1211 = _1209;
    if (_1109)
    {
        float _1213 = _1203 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1123 = _1213;
    }
    float _1215 = _1123;
    if (_1109)
    {
        float _1217 = _1097 * _1207;
        _1187 = _1217;
    }
    float _1219 = _1187;
    if (!_1109)
    {
        _1193 = _1101;
    }
    float _1221 = _1193;
    float _1223 = _1221;
    if (_1109)
    {
        float _1225 = _1099 * _1207;
        _1211 = _1225;
    }
    float _1227 = _1211;
    if (_1109)
    {
        float _1229 = fma(_1171, _1165, _1215);
        _1197 = _1229;
    }
    float _1231 = _1197;
    if (_1109)
    {
        float _1233 = _1219 * _1219;
        _1223 = _1233;
    }
    float _1235 = _1223;
    if (!_1109)
    {
        _1199 = _1103;
    }
    float _1237 = _1199;
    float _1239 = _1237;
    if (_1109)
    {
        float _1241 = _1227 * _1227;
        _1239 = _1241;
    }
    float _1243 = _1239;
    float _1245 = fma(_1231, _1231, _1235);
    float _1247 = _937 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1249 = _937 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1251 = _1245 + _1243;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1255 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1253);
    float _1257 = precise::clamp(_1255, 0.0, 1.0);
    float _1259 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1261 = _937 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1263 = rsqrt(_1251);
    float _1265 = -_1257;
    float _1267 = _1265 + 1.0;
    float _1269 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1247);
    float _1271 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1261);
    float _1273 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1249);
    float _1275 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1269);
    float _1277 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1271);
    float _1279 = abs(_1267);
    float _1281 = log2(_1279);
    float _1283 = _937 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1287 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1289 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1273);
    float _1291 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1297 = _1263 * _1219;
    float _1299 = _1263 * _1231;
    float _1301 = _1263 * _1227;
    float _1303 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1307 = floor(_1183);
    float _1309 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1313 = -_1305;
    float _1315 = fma(_1299, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1313);
    float _1317 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1319 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1321 = -_1295;
    float _1323 = fma(_1321, _1293, 1.0);
    float _1325 = -_1301;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1315);
    float _1329 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1317);
    float _1331 = floor(_1259);
    float _1333 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1335 = fma(_1327, 0.5, 0.5);
    float _1337 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1329);
    float _1339 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1337);
    float _1341 = exp2(_1319);
    float _1343 = -_1307;
    float _1345 = _1183 + _1343;
    float _1347 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1349 = log2(_1323);
    float _1351 = -_1331;
    float _1353 = _1259 + _1351;
    float _1355 = 1.0 / _1339;
    float _1357 = fma(_1327, -0.5, 0.5);
    float _1359 = fma(_1335, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1361 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1347);
    float _1363 = _1299 + 1.0;
    float _1365 = fma(_1335, _1359, -0.212114393711090087890625);
    float _1367 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1361);
    float _1369 = sqrt(_1357);
    float _1371 = -_1299;
    float _1373 = fma(_1341, _1363, _1371);
    float _1375 = _1349 * 0.693147182464599609375;
    float _1377 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1367);
    float _1379 = fma(_1335, _1365, 1.570728778839111328125);
    float2 _4147 = float2(_1345, _1353);
    float _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4147, float2(0.0), isnan(_4147)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4147, float2(0.0), isnan(_4147)), level(0.0)).x;
    float _1383 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1385 = fma(_1373, 0.5, 0.5);
    float _1387 = _1377 * _1355;
    float _1389 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1333);
    float _1391 = fma(_1387, 0.5, 0.5);
    float _1393 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1389);
    float _1395 = _1369 * 0.636619746685028076171875;
    float _1397 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1393);
    float _1399 = -_1379;
    float _1401 = fma(_1395, _1399, 1.0);
    float _1403 = _1397 * _1355;
    float _1405 = fma(_1403, -0.5, 0.5);
    float3 _4197 = float3(_1391, _1405, _1383);
    float _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4197, float3(0.0), isnan(_4197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4197, float3(0.0), isnan(_4197)), level(0.0)).x;
    float3 _4208 = float3(_1391, _1405, _1383);
    float4 _1410 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4208, float3(0.0), isnan(_4208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4208, float3(0.0), isnan(_4208)), level(0.0)).xyzw;
    float _1412 = _1410.x;
    float _1414 = _1410.y;
    float _1416 = _1410.z;
    float _1418 = _1410.w;
    float2 _4224 = float2(_1401, _1385);
    float3 _1422 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4224, float2(0.0), isnan(_4224)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4224, float2(0.0), isnan(_4224)), level(0.0)).xyz;
    float _1424 = _1422.x;
    float _1426 = _1422.y;
    float _1428 = _1422.z;
    float _1430 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1432 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1444 = _1442 != 0;
    float _1446 = exp2(_1430);
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1450 = _1448 != 0;
    float _1452 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1432);
    bool _1454 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1456 = isnan(_309);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1462 = _1458 || _1460;
    float _1464 = float(_1462);
    bool _1466 = _317 > 0.5;
    float _1468 = 1.0 / _1436;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1470;
    bool _1474 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1476 = isnan(_309);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = -_1464;
    float _1488 = _1486 + 1.0;
    bool _1490 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1492 = isnan(_309);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1506 = _319 > 0.5;
    float _1508 = -_1484;
    float _1510 = _1508 + 1.0;
    float _1512 = 1.0 / _1440;
    float _1514 = _1500 * _1488;
    float _1516 = -_1500;
    float _1518 = _1516 + 1.0;
    float _1520 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1452);
    float _1522 = -_1446;
    float _1524 = _1522 + 1.0;
    float _1526 = _1472 * _1468;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1530 = _309 + _1528;
    float _1532 = _1464 * _1510;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1534;
    float _1538 = 1.0 / _1504;
    float _1540 = fma(_1526, _1530, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1544 = _309 + _1542;
    float _1546 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1548 = _1540 * _1514;
    float _1550 = -_173;
    int _1552 = _1466 ? as_type<int>(_1550) : as_type<int>(_173);
    bool _1554 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1556 = isnan(_309);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1570 = !_1444;
    float _1572 = _1570 ? _173 : as_type<float>(_1552);
    float _1574 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1548);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1578 = _309 + _1576;
    float _1580 = _1568 * _1512;
    float _1582 = -_177;
    int _1584 = _1506 ? as_type<int>(_1582) : as_type<int>(_177);
    float _1586 = _1572 + 0.5;
    float _1588 = _1536 * _1538;
    float _1590 = fma(_1580, _1544, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1594 = !_1450;
    float _1596 = _1594 ? _177 : as_type<float>(_1584);
    float _1598 = fma(_1588, _1578, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1600 = fma(_1590, _1532, _1574);
    float _1602 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1604 = -_1564;
    float _1606 = _1604 + 1.0;
    float _1608 = -_1596;
    float _1610 = _1608 + 0.5;
    float _1612 = _687 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1614 = abs(_953);
    float _1616 = log2(_1614);
    float _1618 = _1484 * _1606;
    float _1620 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1622 = -_675;
    float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1612);
    float _1626 = fma(_1598, _1618, _1600);
    float _1628 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1632 = _1620 * _1592;
    float _1634 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1626);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1638 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1640 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1646 = _687 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1648 = _687 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1650 = exp2(_1640);
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1654 = _1602 * _1630;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1660 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1672 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _1654;
    out.m_68.y = _1632;
    bool _1674 = _953 <= 8000.0;
    bool _1676 = isnan(_953);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(8000.0);
    bool _1682 = _1678 || _1680;
    float _1684 = float(_1682);
    float _1686 = fma(_1650, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1688 = precise::clamp(_1686, 0.0, 1.0);
    float _1690 = -_675;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1646);
    float _1694 = -_675;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1648);
    out.m_70.x = _1660;
    out.m_70.y = _1672;
    out.m_70.z = _1662;
    out.m_70.w = _1644;
    float _1698 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1692);
    float _1700 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1696);
    float _1702 = _699 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1704 = fma(_1688, -2.0, 3.0);
    float _1706 = _1688 * _1688;
    out.m_72.x = _1666;
    out.m_72.y = _1668;
    out.m_72.z = _1670;
    out.m_72.w = _1638;
    float _1708 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1702);
    bool _1710 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1712 = isnan(_1093);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1718 = _1714 || _1716;
    float _1720 = _1706 * _1704;
    float _1722 = -_1720;
    float _1724 = _1722 + 1.0;
    float _1726 = _699 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1728 = _699 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1730 = in.m_60.x;
    float _1732 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1726);
    float _1734 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1728);
    float _1736 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1738 = _707 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1740 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1624);
    float _1742 = _707 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1744 = _1736 * _1698;
    float _1746 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1738);
    float _1748 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1732);
    float _1750 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1720);
    float _1752 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1742);
    float _1754 = _1736 * _1740;
    float _1756 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1734);
    float _1758 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1746);
    float _1760 = fma(_1628, _1748, _1744);
    float _1762 = _1684 * _1750;
    float _1764 = _1736 * _1700;
    float _1766 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1708);
    float _1768 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1752);
    float _1770 = fma(_1628, _1756, _1754);
    float _1772 = _1758 + _1760;
    float _1774 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1520);
    float _1776 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1778 = fma(_1628, _1766, _1764);
    float _1780 = _1768 + _1770;
    float _1782 = _707 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1784 = _1377 + _1339;
    out.gl_Position.x = _1377;
    out.gl_Position.y = _1397;
    out.gl_Position.z = _1774;
    out.gl_Position.w = _1339;
    float _1786 = _1774 + _1339;
    float _1788 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1782);
    float _1790 = _1339 * 0.5;
    float _1792 = _1786 * 0.5;
    float _1794 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1788);
    float _1796 = _1784 * 0.5;
    float _1798 = fma(_1397, -0.5, _1790);
    float _1800 = _1794 + _1778;
    out.m_74.x = _1796;
    out.m_74.y = _1798;
    out.m_74.z = _1792;
    out.m_74.w = _1339;
    float _1802 = _1339;
    float _1804 = _1774;
    float _1806 = _1397;
    float _1808 = _1798;
    float _1810 = _1796;
    if (!_1718)
    {
        _1802 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1812 = _1802;
    float _1814 = _1812;
    float _1816 = _1812;
    if (!_1718)
    {
        _1804 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1818 = _1804;
    out.m_76.x = _1772;
    out.m_76.y = _1780;
    out.m_76.z = _1800;
    float _1820 = _1818;
    float _1822 = _1818;
    if (!_1718)
    {
        _1806 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1824 = _1806;
    float _1826 = _1824;
    float _1828 = _1824;
    if (!_1718)
    {
        _1808 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1830 = _1808;
    float _1832 = _1830;
    float _1834 = _1830;
    if (!_1718)
    {
        _1810 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1836 = _1810;
    float _1838 = -_1381;
    float _1840 = _1838 + 1.0;
    float _1842 = _1840 * _1776;
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = -_1844;
    float _1848 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1850 = _1848 * _1730;
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.x = _1852;
    float _1854 = _1546 * _1407;
    float _1856 = -_1546;
    float _1858 = _1856 + 1.0;
    float _1860 = _1418 * _1854;
    float _1862 = _1428 * _1854;
    float _1864 = _1009 * _1071;
    float _1866 = fma(_1424, _1860, _1412);
    float _1868 = fma(_1426, _1860, _1414);
    float _1870 = _1418 * _1858;
    float _1872 = fma(_1418, _1862, _1416);
    float _1874 = _1864 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1876 = _1864;
    float _1878 = _1836;
    float _1880 = _1836;
    if (!_1718)
    {
        _1876 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1882 = _1876;
    out.m_80.x = _1866;
    out.m_80.y = _1868;
    out.m_80.z = _1872;
    out.m_80.w = _1870;
    bool _1884 = !_1718;
    float _1886 = _1882;
    float _1888 = _1882;
    if (!_1884)
    {
        bool _1890 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1892 = isnan(_1093);
        bool _1894 = _1890 || _1892;
        bool _1896 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1898 = _1894 || _1896;
        if (!_1898)
        {
            float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1902 = _1093 + _1900;
            float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1906 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1904;
            float _1908 = 1.0 / _1906;
            float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1926 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1928 = _1926 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1930 = _1902 * _1908;
            float _1932 = precise::clamp(_1930, 0.0, 1.0);
            float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1936 = _1934 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1938 = fma(_1932, _1912, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1940 = fma(_1932, _1936, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1942 = fma(_1932, _1916, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1944 = fma(_1932, _1920, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1946 = fma(_1932, _1924, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1948 = fma(_1932, _1928, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1880 = _1940;
            _1828 = _1946;
            _1834 = _1938;
            _1822 = _1944;
            _1816 = _1942;
            _1888 = _1948;
            _1950 = true;
        }
        else
        {
            bool _1952 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1954 = isnan(_1093);
            bool _1956 = _1952 || _1954;
            bool _1958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1960 = _1956 || _1958;
            if (!_1960)
            {
                _1832 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1962 = _1832;
            _1834 = _1962;
            if (!_1960)
            {
                _1878 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1964 = _1878;
            _1880 = _1964;
            if (!_1960)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1966 = _1814;
            _1816 = _1966;
            if (!_1960)
            {
                _1820 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1968 = _1820;
            _1822 = _1968;
            if (!_1960)
            {
                _1826 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1970 = _1826;
            _1828 = _1970;
            if (!_1960)
            {
                _1886 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1972 = _1886;
            bool _1974 = !_1960;
            _1888 = _1972;
            if (!_1974)
            {
                bool _1976 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1978 = isnan(_1093);
                bool _1980 = _1976 || _1978;
                bool _1982 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1984 = _1980 || _1982;
                if (!_1984)
                {
                    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1988 = _1093 + _1986;
                    float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1992 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1990;
                    float _1994 = 1.0 / _1992;
                    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2010 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2014 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2016 = _1988 * _1994;
                    float _2018 = precise::clamp(_2016, 0.0, 1.0);
                    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2024 = fma(_2018, _1998, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2026 = fma(_2018, _2022, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2028 = fma(_2018, _2002, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2030 = fma(_2018, _2006, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2032 = fma(_2018, _2010, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2034 = fma(_2018, _2014, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1880 = _2026;
                    _1828 = _2032;
                    _1834 = _2024;
                    _1822 = _2030;
                    _1816 = _2028;
                    _1888 = _2034;
                    _1950 = true;
                }
                else
                {
                    _1880 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1828 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1834 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1822 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1888 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1950 = false;
    float _2036 = _1880;
    float _2038 = _1828;
    float _2040 = _1834;
    float _2042 = _1822;
    float _2044 = _1816;
    float _2046 = _1888;
    float _2048 = fma(_1780, -0.5, 0.5);
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = -_2036;
    float _2054 = _2052 + _2038;
    float _2056 = -_2040;
    float _2058 = _2056 + _2042;
    out.m_82.x = 0.0;
    float _2060 = fma(_2050, _2054, _2036);
    float _2062 = -_2044;
    float _2064 = _2062 + _2046;
    float _2066 = fma(_2050, _2058, _2040);
    float _2068 = _2060 * 0.586610972881317138671875;
    bool _2070 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2072 = fma(_2050, _2064, _2044);
    float _2074 = _1874 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2076 = fma(_2066, 0.298911988735198974609375, _2068);
    bool _2078 = _1009 > 0.0;
    bool _2080 = isnan(_1009);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan(0.0);
    bool _2086 = _2082 || _2084;
    float _2088 = fma(_2072, 0.114477999508380889892578125, _2076);
    out.m_49.x = _2074;
    bool _2090 = _1071 <= 0.0;
    bool _2092 = !_2086;
    bool _2094 = _2090 || _2092;
    float _2096 = -_2088;
    float _2098 = _2066 + _2096;
    float _2100 = -_2088;
    float _2102 = _2060 + _2100;
    float _2104 = -_2088;
    float _2106 = _2072 + _2104;
    float _2108 = fma(_2098, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2088);
    float _2110 = fma(_2102, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2088);
    float _2112 = fma(_2106, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2088);
    bool _2114 = !_2070;
    if (!_2114)
    {
        float _2116 = -_937;
        float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2120 = -_939;
        float _2122 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2124 = -_941;
        float _2126 = _2124 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2128 = _2118 * _2118;
        float _2130 = fma(_2122, _2122, _2128);
        float _2132 = fma(_2126, _2126, _2130);
        float _2134 = sqrt(_2132);
        float _2136 = rsqrt(_2132);
        float _2138 = -_2134;
        float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2142 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2144 = precise::clamp(_2142, 0.0, 1.0);
        float _2146 = _2122 * _2136;
        float _2148 = _2118 * _2136;
        float _2150 = abs(_2144);
        float _2152 = log2(_2150);
        float _2154 = _2126 * _2136;
        float _2156 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2158 = _1780 * _2148;
        float _2160 = -_2148;
        float _2162 = -_2156;
        float _2164 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2162);
        float _2166 = fma(_1772, _2146, _2158);
        float _2168 = -_2154;
        float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2164);
        float _2172 = fma(_1800, _2154, _2166);
        float _2174 = precise::clamp(_2172, 0.0, 1.0);
        float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2178 = _2170 + _2176;
        float _2180 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2182 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2184 = precise::clamp(_2182, 0.0, 1.0);
        float _2186 = exp2(_2180);
        float _2188 = _2186 * _2184;
        float _2190 = _2174 * _2188;
        float _2192 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2194 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2196 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2192;
        out.m_82.y = _2194;
        out.m_82.z = _2196;
    }
    out.m_84.x = _2108;
    out.m_84.y = _2110;
    out.m_84.z = _2112;
    if (!_2094)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2198 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2198;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1950 = false;
    bool _301 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2255 = as_type<float>(_119);
        out.gl_Position.z = _2255;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2325 = as_type<float>(_157);
        out.gl_Position.z = _2325;
    }
    if (_149)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _163 = as_type<int>(_159) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_159) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _197;
    if (!_179)
    {
        float _181 = in.m_56.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_103);
        float _203 = 1.0 / _201;
        float _205 = _137 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -_223;
    float _231 = _229 + 1.0;
    bool _233 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _235 = 1.0 / _227;
    float _237 = _211 * _235;
    bool _239 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_207);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = _249 * _231;
    float _261 = fma(_253, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_257, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = -_249;
    float _267 = _265 + 1.0;
    float _269 = _261 * _259;
    float _271 = _263 * _259;
    float _273 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_233;
    float _299;
    if (!_281)
    {
        float _283 = in.m_56.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_103);
        float _305 = 1.0 / _303;
        float _307 = _137 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = in.m_56.z;
    float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _315 = log2(_313);
    float _317 = in.m_56.x;
    float _319 = in.m_56.y;
    float _321 = in.m_58.x;
    float _323 = in.m_58.y;
    float _325 = in.m_58.z;
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _329 = _327 != 0;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _337 = _335 != 0;
    bool _339 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _341 = isnan(1.0);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _347 = _343 || _345;
    float _349 = in.m_60.y;
    float _351 = _315 * _137;
    float _353 = exp2(_351);
    float _355 = _311 * 2.0;
    float _357 = _319 + _311;
    float _359 = _317 * 2.0;
    float _361 = _319 * 2.0;
    float _363 = floor(_355);
    float _365 = _357 + (-1.0);
    float _367 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _369 = _319 + _317;
    float _371 = floor(_359);
    float _373 = -_353;
    float _375 = _373 + 1.0;
    float _377 = _369 + (-1.0);
    float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _383 = 1.0 + _381;
    bool _385 = _363 > 0.0;
    float _387 = floor(_361);
    bool _389 = _363 >= 0.0;
    bool _391 = isnan(_363);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    bool _399 = !_329;
    int _401 = _399 ? 0 : 1;
    int _403 = _397 ? 0 : 1;
    bool _405 = _371 > 0.0;
    float _407 = 1.0 / _383;
    bool _409 = _371 >= 0.0;
    bool _411 = isnan(_371);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    int _419 = ~_403;
    int _421 = _419 + 1;
    int _423 = _421 + 1;
    int _425 = _423;
    if (!_385)
    {
        int _427 = ~_403;
        int _429 = _427 + 1;
        _425 = _429;
    }
    int _431 = _425;
    int _433 = abs(_401);
    bool _435 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _437 = isnan(0.0);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _443 = _439 || _441;
    float _445 = float(_433);
    float _447 = float(_431);
    bool _449 = !_333;
    int _451 = _449 ? 0 : 1;
    float _453 = _443 ? _375 : 0.0;
    float _455 = _445 * _447;
    int _457 = _417 ? 0 : 1;
    int _459 = abs(_451);
    if (_347)
    {
        float _461 = _453 * _407;
        _139 = _461;
    }
    float _463 = _139;
    bool _465 = _387 > 0.0;
    bool _467 = _387 >= 0.0;
    bool _469 = isnan(_387);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = _455 * (-2.0);
    int _479 = ~_457;
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    float _485 = _317 + (-0.5);
    int _487 = _483;
    if (!_405)
    {
        int _489 = ~_457;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = fma(_477, _321, _321);
    float _497 = fma(_379, _477, _379);
    float _499 = float(_493);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[196].x, _495);
    float _503 = float(_459);
    int _505 = _475 ? 0 : 1;
    bool _507 = !_337;
    int _509 = _507 ? 0 : 1;
    float _511 = _503 * _499;
    int _513 = ~_505;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = fma(_497, _463, _501);
    int _521 = _517;
    if (!_465)
    {
        int _523 = ~_505;
        int _525 = _523 + 1;
        _521 = _525;
    }
    int _527 = _521;
    float _529 = _511 * (-2.0);
    int _531 = abs(_509);
    float _533 = _311 + _317;
    float _535 = float(_527);
    float _537 = _319 + (-0.5);
    float _539 = float(_531);
    float _541 = fma(_529, _323, _323);
    float _543 = _533 + (-1.0);
    float _545 = fma(_367, _529, _367);
    float _547 = _519 * 0.15915493667125701904296875;
    float _549 = _539 * _535;
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[196].y, _541);
    float _553 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _555 = in.m_62.x;
    float _557 = in.m_62.y;
    float _559 = in.m_62.z;
    float _561 = in.m_62.w;
    float _563 = _549 * (-2.0);
    float _565 = fma(_545, _463, _551);
    float _567 = _311 + (-0.5);
    float _569 = in.m_46.x;
    float _571 = in.m_46.y;
    float _573 = in.m_46.z;
    float _575 = fma(_563, _325, _325);
    float _577 = fma(_553, _563, _553);
    float _579 = _565 * 0.15915493667125701904296875;
    float _581 = in.m_64.x;
    float _583 = in.m_64.y;
    float _585 = in.m_64.z;
    float _587 = in.m_64.w;
    float _589 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[196].z, _575);
    float _591 = _547 * 6.283185482025146484375;
    float _593 = sin(_591);
    bool _595 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _597 = isnan(0.5);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _603 = _599 || _601;
    float _605 = in.m_66.x;
    float _607 = in.m_66.y;
    float _609 = fma(_577, _463, _589);
    bool _611 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _613 = isnan(0.5);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _619 = _615 || _617;
    float _621 = _609 * 0.15915493667125701904296875;
    float _623 = _547 * 6.283185482025146484375;
    float _625 = cos(_623);
    float _627 = _579 * 6.283185482025146484375;
    float _629 = sin(_627);
    float _631 = _571 * _557;
    float _633 = _571 * _583;
    float _635 = _571 + _349;
    float _637 = _579 * 6.283185482025146484375;
    float _639 = cos(_637);
    float _641 = fma(_569, _555, _631);
    float _643 = _279 * _607;
    float _645 = _277 * _605;
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _649 = fma(_573, _559, _641);
    float _651 = _643 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _655 = _621 * 6.283185482025146484375;
    float _657 = cos(_655);
    float _659 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _661 = _651 * _647;
    float _663 = _593 * _629;
    float _665 = fma(_569, _581, _633);
    float _667 = _659 * _653;
    float _669 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _671 = _649 + _561;
    float _673 = _621 * 6.283185482025146484375;
    float _675 = sin(_673);
    float _677 = _625 * _639;
    float _679 = _593 * _639;
    float _681 = fma(_573, _585, _665);
    float _683 = _635 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _685 = _681 + _587;
    float _687 = _625 * _657;
    float _689 = _625 * _629;
    float _691 = _593 * _657;
    float _693 = _639 * _657;
    float _695 = _687 * _661;
    float _697 = _629 * _657;
    float _699 = fma(_675, _677, _663);
    float _701 = -_661;
    float _703 = _675 * _701;
    float _705 = -_679;
    float _707 = fma(_675, _689, _705);
    float _709 = -_689;
    float _711 = fma(_675, _679, _709);
    float _713 = fma(_699, _667, _695);
    float _715 = _691 * _661;
    float _717 = fma(_693, _667, _703);
    float _719 = fma(_675, _663, _677);
    float _721 = fma(_707, _669, _713);
    float _723 = fma(_711, _667, _715);
    float _725 = fma(_697, _669, _717);
    float _727 = _721 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _729 = fma(_719, _669, _723);
    float _731 = _721 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _733 = _721 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _735 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[26].x, _727);
    float _737 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[24].x, _731);
    float _739 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[11].x, _683);
    float _741 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[25].x, _733);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].z, _737);
    float _747 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[11].z, _739);
    float _749 = _741 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _751 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].z, _743);
    float _753 = _745 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _755 = _747 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _757 = _685 + _749;
    float _759 = _635 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _761 = _671 + _753;
    float _763 = 1.0 / _755;
    float _765 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _767 = _757 + _765;
    float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _771 = _761 + _769;
    float _773 = _767 * _767;
    float _775 = fma(_771, _771, _773);
    float _777 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[10].x, _759);
    float _779 = sqrt(_775);
    float _781 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[10].z, _777);
    float _783 = _781 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _785 = _783 + _755;
    float _787 = _785 * _763;
    float _789 = _787 * 0.5;
    bool _791 = _779 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[30].w, _793);
    float _797 = _751 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _799 = _635 + _797;
    float _801 = 1.0 / _795;
    float _803 = _579;
    float _805 = _733;
    float _807 = _757;
    float _809 = _761;
    float _811 = _755;
    float _813 = _577;
    float _815 = _547;
    float _817 = _715;
    if (!_791)
    {
        _803 = _799;
    }
    float _819 = _803;
    bool _821 = !_791;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _779 + _827;
        float _831 = rsqrt(_775);
        float _833 = _829 * _825;
        float _835 = _799 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = _833 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = _841 + (-1.0);
        float _849 = fma(_845, _835, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _851 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _853 = _831 * _849;
        float _855 = fma(_799, _841, _851);
        float _857 = fma(_771, _853, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _859 = fma(_767, _853, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _805 = _853;
        _823 = _855;
        _807 = _859;
        _809 = _857;
        _811 = _849;
    }
    float _861 = _805;
    float _863 = _823;
    float _865 = _807;
    float _867 = _809;
    float _869 = _811;
    float _871 = _869;
    float _873 = _863;
    float _875 = _867;
    float _877 = _865;
    float _879 = _861;
    if (_619)
    {
        _813 = 1.0;
    }
    float _881 = _813;
    float _883 = _881;
    if (!_603)
    {
        float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _887 = _635 + _885;
        float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _891 = _671 + _889;
        float _893 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _895 = -_635;
        float _897 = _895 + _863;
        float _899 = _887 * _887;
        float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _903 = _685 + _901;
        float _905 = fma(_891, _891, _899);
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _909 = fma(_903, _903, _905);
        float _911 = sqrt(_909);
        float _913 = _893 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _915 = precise::min(_911, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _917 = _915 * _907;
        float _919 = -_685;
        float _921 = _919 + _865;
        float _923 = _913 * _917;
        float _925 = -_671;
        float _927 = _925 + _867;
        float _929 = fma(_897, _923, _635);
        float _931 = fma(_927, _923, _671);
        float _933 = fma(_921, _923, _685);
        _871 = _923;
        _873 = _929;
        _875 = _931;
        _877 = _933;
        _879 = _893;
    }
    float _935 = _871;
    float _937 = _873;
    float _939 = _875;
    float _941 = _877;
    float _943 = _879;
    float _945 = _935;
    float _947 = _943;
    if (_619)
    {
        _815 = 1.0;
    }
    float _949 = _815;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _953 = _801 * _951;
    float _955 = _949;
    if (!_619)
    {
        float _957 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _959 = _957 * 0.15915493667125701904296875;
        float _961 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _963 = _959 * 6.283185482025146484375;
        float _965 = cos(_963);
        float _967 = _961 * 0.15915493667125701904296875;
        float _969 = _959 * 6.283185482025146484375;
        float _971 = sin(_969);
        float _973 = 1.0 / _965;
        float _975 = _967 * 6.283185482025146484375;
        float _977 = cos(_975);
        float _979 = _971 * _973;
        float _981 = _967 * 6.283185482025146484375;
        float _983 = sin(_981);
        float _985 = _977 * _979;
        float _987 = 1.0 / _985;
        float _989 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _991 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _989;
        float _993 = 1.0 / _991;
        float _995 = _983 * _987;
        float _997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _999 = fma(_953, _995, _997);
        float _1001 = _999 * _993;
        float _1003 = precise::clamp(_1001, 0.0, 1.0);
        _945 = _993;
        _947 = _967;
        _883 = _1003;
    }
    float _1005 = _945;
    float _1007 = _947;
    float _1009 = _883;
    float _1011 = _1005;
    float _1013 = _1007;
    if (!_619)
    {
        float _1015 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1017 = _1015 * 0.15915493667125701904296875;
        float _1019 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1021 = _1017 * 6.283185482025146484375;
        float _1023 = cos(_1021);
        float _1025 = _1019 * 0.15915493667125701904296875;
        float _1027 = _1017 * 6.283185482025146484375;
        float _1029 = sin(_1027);
        float _1031 = 1.0 / _1023;
        float _1033 = _1025 * 6.283185482025146484375;
        float _1035 = cos(_1033);
        float _1037 = _1029 * _1031;
        float _1039 = _1025 * 6.283185482025146484375;
        float _1041 = sin(_1039);
        float _1043 = _1035 * _1037;
        float _1045 = 1.0 / _1043;
        float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1049 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1047;
        float _1051 = 1.0 / _1049;
        float _1053 = _1041 * _1045;
        float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1057 = fma(_953, _1053, _1055);
        float _1059 = _1057 * _1051;
        float _1061 = precise::clamp(_1059, 0.0, 1.0);
        float _1063 = -_1061;
        float _1065 = _1063 + 1.0;
        _1011 = _1031;
        _1013 = _1043;
        _955 = _1065;
    }
    float _1067 = _1011;
    float _1069 = _1013;
    float _1071 = _955;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _937 + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1079 = _939 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1083 = _941 + _1081;
    float _1085 = _1075 * _1075;
    float _1087 = fma(_1079, _1079, _1085);
    float _1089 = fma(_1083, _1083, _1087);
    float _1091 = rsqrt(_1089);
    float _1093 = sqrt(_1089);
    float _1095 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1097 = _1079 * _1095;
    float _1099 = _1083 * _1095;
    float _1101 = _1097 * _1097;
    float _1103 = _1099 * _1099;
    float _1105 = _1101 + _1103;
    float _1107 = sqrt(_1105);
    bool _1109 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1113 = _1107 + _1111;
    float _1115 = _1067;
    float _1117 = _1105;
    float _1119 = _1113;
    float _1121 = _1075;
    float _1123 = _1095;
    if (_1109)
    {
        float _1125 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1115 = _1125;
    }
    float _1127 = _1115;
    if (_1109)
    {
        float _1129 = rsqrt(_1105);
        _1117 = _1129;
    }
    float _1131 = _1117;
    float _1133 = _1127;
    float _1135 = _1131;
    if (_1109)
    {
        float _1137 = _1113 * _1127;
        _1119 = _1137;
    }
    float _1139 = _1119;
    if (_1109)
    {
        float _1141 = _1139 * 0.15915493667125701904296875;
        _1133 = _1141;
    }
    float _1143 = _1133;
    float _1145 = _1083;
    float _1147 = _1143;
    if (_1109)
    {
        float _1149 = _1143 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        _1145 = _1151;
    }
    float _1153 = _1145;
    float _1155 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1157 = precise::max(0.0, _1155);
    float _1159 = _1069;
    if (_1109)
    {
        float _1161 = _1143 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        _1159 = _1163;
    }
    float _1165 = _1159;
    float _1167 = -_1095;
    float _1169 = -_1157;
    float _1171 = fma(_1075, _1167, _1169);
    float _1173 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1109)
    {
        float _1175 = _1171 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1121 = _1175;
    }
    float _1177 = _1121;
    float _1179 = _1177;
    if (!_1109)
    {
        _1147 = _1097;
    }
    float _1181 = _1147;
    float _1183 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1185 = _1153;
    float _1187 = _1181;
    if (_1109)
    {
        float _1189 = fma(_1153, _1177, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1185 = _1189;
    }
    float _1191 = _1185;
    float _1193 = _1191;
    if (!_1109)
    {
        _1179 = _1171;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    float _1199 = _1165;
    if (_1109)
    {
        float _1201 = _1165 + (-1.0);
        _1173 = _1201;
    }
    float _1203 = _1173;
    if (_1109)
    {
        float _1205 = _1131 * _1191;
        _817 = _1205;
    }
    float _1207 = _817;
    if (!_1109)
    {
        _1135 = _1099;
    }
    float _1209 = _1135;
    float _1211 = _1209;
    if (_1109)
    {
        float _1213 = _1203 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1123 = _1213;
    }
    float _1215 = _1123;
    if (_1109)
    {
        float _1217 = _1097 * _1207;
        _1187 = _1217;
    }
    float _1219 = _1187;
    if (!_1109)
    {
        _1193 = _1101;
    }
    float _1221 = _1193;
    float _1223 = _1221;
    if (_1109)
    {
        float _1225 = _1099 * _1207;
        _1211 = _1225;
    }
    float _1227 = _1211;
    if (_1109)
    {
        float _1229 = fma(_1171, _1165, _1215);
        _1197 = _1229;
    }
    float _1231 = _1197;
    if (_1109)
    {
        float _1233 = _1219 * _1219;
        _1223 = _1233;
    }
    float _1235 = _1223;
    if (!_1109)
    {
        _1199 = _1103;
    }
    float _1237 = _1199;
    float _1239 = _1237;
    if (_1109)
    {
        float _1241 = _1227 * _1227;
        _1239 = _1241;
    }
    float _1243 = _1239;
    float _1245 = fma(_1231, _1231, _1235);
    float _1247 = _937 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1249 = _937 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1251 = _1245 + _1243;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1255 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1253);
    float _1257 = precise::clamp(_1255, 0.0, 1.0);
    float _1259 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1261 = _937 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1263 = rsqrt(_1251);
    float _1265 = -_1257;
    float _1267 = _1265 + 1.0;
    float _1269 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1247);
    float _1271 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1261);
    float _1273 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1249);
    float _1275 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1269);
    float _1277 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1271);
    float _1279 = abs(_1267);
    float _1281 = log2(_1279);
    float _1283 = _937 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1287 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1289 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1273);
    float _1291 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1297 = _1263 * _1219;
    float _1299 = _1263 * _1231;
    float _1301 = _1263 * _1227;
    float _1303 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1307 = floor(_1183);
    float _1309 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1313 = -_1305;
    float _1315 = fma(_1299, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1313);
    float _1317 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1319 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1321 = -_1295;
    float _1323 = fma(_1321, _1293, 1.0);
    float _1325 = -_1301;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1315);
    float _1329 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1317);
    float _1331 = floor(_1259);
    float _1333 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1335 = fma(_1327, 0.5, 0.5);
    float _1337 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1329);
    float _1339 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1337);
    float _1341 = exp2(_1319);
    float _1343 = -_1307;
    float _1345 = _1183 + _1343;
    float _1347 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1349 = log2(_1323);
    float _1351 = -_1331;
    float _1353 = _1259 + _1351;
    float _1355 = 1.0 / _1339;
    float _1357 = fma(_1327, -0.5, 0.5);
    float _1359 = fma(_1335, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1361 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1347);
    float _1363 = _1299 + 1.0;
    float _1365 = fma(_1335, _1359, -0.212114393711090087890625);
    float _1367 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1361);
    float _1369 = sqrt(_1357);
    float _1371 = -_1299;
    float _1373 = fma(_1341, _1363, _1371);
    float _1375 = _1349 * 0.693147182464599609375;
    float _1377 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1367);
    float _1379 = fma(_1335, _1365, 1.570728778839111328125);
    float2 _4147 = float2(_1345, _1353);
    float _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4147, float2(0.0), isnan(_4147)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4147, float2(0.0), isnan(_4147)), level(0.0)).x;
    float _1383 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1385 = fma(_1373, 0.5, 0.5);
    float _1387 = _1377 * _1355;
    float _1389 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1333);
    float _1391 = fma(_1387, 0.5, 0.5);
    float _1393 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1389);
    float _1395 = _1369 * 0.636619746685028076171875;
    float _1397 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1393);
    float _1399 = -_1379;
    float _1401 = fma(_1395, _1399, 1.0);
    float _1403 = _1397 * _1355;
    float _1405 = fma(_1403, -0.5, 0.5);
    float3 _4197 = float3(_1391, _1405, _1383);
    float _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4197, float3(0.0), isnan(_4197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4197, float3(0.0), isnan(_4197)), level(0.0)).x;
    float3 _4208 = float3(_1391, _1405, _1383);
    float4 _1410 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4208, float3(0.0), isnan(_4208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4208, float3(0.0), isnan(_4208)), level(0.0)).xyzw;
    float _1412 = _1410.x;
    float _1414 = _1410.y;
    float _1416 = _1410.z;
    float _1418 = _1410.w;
    float2 _4224 = float2(_1401, _1385);
    float3 _1422 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4224, float2(0.0), isnan(_4224)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4224, float2(0.0), isnan(_4224)), level(0.0)).xyz;
    float _1424 = _1422.x;
    float _1426 = _1422.y;
    float _1428 = _1422.z;
    float _1430 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1432 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1444 = _1442 != 0;
    float _1446 = exp2(_1430);
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1450 = _1448 != 0;
    float _1452 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1432);
    bool _1454 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1456 = isnan(_309);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1462 = _1458 || _1460;
    float _1464 = float(_1462);
    bool _1466 = _317 > 0.5;
    float _1468 = 1.0 / _1436;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1470;
    bool _1474 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1476 = isnan(_309);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = -_1464;
    float _1488 = _1486 + 1.0;
    bool _1490 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1492 = isnan(_309);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1506 = _319 > 0.5;
    float _1508 = -_1484;
    float _1510 = _1508 + 1.0;
    float _1512 = 1.0 / _1440;
    float _1514 = _1500 * _1488;
    float _1516 = -_1500;
    float _1518 = _1516 + 1.0;
    float _1520 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1452);
    float _1522 = -_1446;
    float _1524 = _1522 + 1.0;
    float _1526 = _1472 * _1468;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1530 = _309 + _1528;
    float _1532 = _1464 * _1510;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1534;
    float _1538 = 1.0 / _1504;
    float _1540 = fma(_1526, _1530, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1544 = _309 + _1542;
    float _1546 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1548 = _1540 * _1514;
    float _1550 = -_173;
    int _1552 = _1466 ? as_type<int>(_1550) : as_type<int>(_173);
    bool _1554 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1556 = isnan(_309);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1570 = !_1444;
    float _1572 = _1570 ? _173 : as_type<float>(_1552);
    float _1574 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1548);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1578 = _309 + _1576;
    float _1580 = _1568 * _1512;
    float _1582 = -_177;
    int _1584 = _1506 ? as_type<int>(_1582) : as_type<int>(_177);
    float _1586 = _1572 + 0.5;
    float _1588 = _1536 * _1538;
    float _1590 = fma(_1580, _1544, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1594 = !_1450;
    float _1596 = _1594 ? _177 : as_type<float>(_1584);
    float _1598 = fma(_1588, _1578, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1600 = fma(_1590, _1532, _1574);
    float _1602 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1604 = -_1564;
    float _1606 = _1604 + 1.0;
    float _1608 = -_1596;
    float _1610 = _1608 + 0.5;
    float _1612 = _687 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1614 = abs(_953);
    float _1616 = log2(_1614);
    float _1618 = _1484 * _1606;
    float _1620 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1622 = -_675;
    float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1612);
    float _1626 = fma(_1598, _1618, _1600);
    float _1628 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1632 = _1620 * _1592;
    float _1634 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1626);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1638 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1640 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1646 = _687 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1648 = _687 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1650 = exp2(_1640);
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1654 = _1602 * _1630;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1660 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1672 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _1654;
    out.m_68.y = _1632;
    bool _1674 = _953 <= 8000.0;
    bool _1676 = isnan(_953);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(8000.0);
    bool _1682 = _1678 || _1680;
    float _1684 = float(_1682);
    float _1686 = fma(_1650, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1688 = precise::clamp(_1686, 0.0, 1.0);
    float _1690 = -_675;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1646);
    float _1694 = -_675;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1648);
    out.m_70.x = _1660;
    out.m_70.y = _1672;
    out.m_70.z = _1662;
    out.m_70.w = _1644;
    float _1698 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1692);
    float _1700 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1696);
    float _1702 = _699 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1704 = fma(_1688, -2.0, 3.0);
    float _1706 = _1688 * _1688;
    out.m_72.x = _1666;
    out.m_72.y = _1668;
    out.m_72.z = _1670;
    out.m_72.w = _1638;
    float _1708 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1702);
    bool _1710 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1712 = isnan(_1093);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1718 = _1714 || _1716;
    float _1720 = _1706 * _1704;
    float _1722 = -_1720;
    float _1724 = _1722 + 1.0;
    float _1726 = _699 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1728 = _699 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1730 = in.m_60.x;
    float _1732 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1726);
    float _1734 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1728);
    float _1736 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1738 = _707 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1740 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1624);
    float _1742 = _707 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1744 = _1736 * _1698;
    float _1746 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1738);
    float _1748 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1732);
    float _1750 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1720);
    float _1752 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1742);
    float _1754 = _1736 * _1740;
    float _1756 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1734);
    float _1758 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1746);
    float _1760 = fma(_1628, _1748, _1744);
    float _1762 = _1684 * _1750;
    float _1764 = _1736 * _1700;
    float _1766 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1708);
    float _1768 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1752);
    float _1770 = fma(_1628, _1756, _1754);
    float _1772 = _1758 + _1760;
    float _1774 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1520);
    float _1776 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1778 = fma(_1628, _1766, _1764);
    float _1780 = _1768 + _1770;
    float _1782 = _707 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1784 = _1377 + _1339;
    out.gl_Position.x = _1377;
    out.gl_Position.y = _1397;
    out.gl_Position.z = _1774;
    out.gl_Position.w = _1339;
    float _1786 = _1774 + _1339;
    float _1788 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1782);
    float _1790 = _1339 * 0.5;
    float _1792 = _1786 * 0.5;
    float _1794 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1788);
    float _1796 = _1784 * 0.5;
    float _1798 = fma(_1397, -0.5, _1790);
    float _1800 = _1794 + _1778;
    out.m_74.x = _1796;
    out.m_74.y = _1798;
    out.m_74.z = _1792;
    out.m_74.w = _1339;
    float _1802 = _1339;
    float _1804 = _1774;
    float _1806 = _1397;
    float _1808 = _1798;
    float _1810 = _1796;
    if (!_1718)
    {
        _1802 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1812 = _1802;
    float _1814 = _1812;
    float _1816 = _1812;
    if (!_1718)
    {
        _1804 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1818 = _1804;
    out.m_76.x = _1772;
    out.m_76.y = _1780;
    out.m_76.z = _1800;
    float _1820 = _1818;
    float _1822 = _1818;
    if (!_1718)
    {
        _1806 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1824 = _1806;
    float _1826 = _1824;
    float _1828 = _1824;
    if (!_1718)
    {
        _1808 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1830 = _1808;
    float _1832 = _1830;
    float _1834 = _1830;
    if (!_1718)
    {
        _1810 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1836 = _1810;
    float _1838 = -_1381;
    float _1840 = _1838 + 1.0;
    float _1842 = _1840 * _1776;
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = -_1844;
    float _1848 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1850 = _1848 * _1730;
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.x = _1852;
    float _1854 = _1546 * _1407;
    float _1856 = -_1546;
    float _1858 = _1856 + 1.0;
    float _1860 = _1418 * _1854;
    float _1862 = _1428 * _1854;
    float _1864 = _1009 * _1071;
    float _1866 = fma(_1424, _1860, _1412);
    float _1868 = fma(_1426, _1860, _1414);
    float _1870 = _1418 * _1858;
    float _1872 = fma(_1418, _1862, _1416);
    float _1874 = _1864 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1876 = _1864;
    float _1878 = _1836;
    float _1880 = _1836;
    if (!_1718)
    {
        _1876 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1882 = _1876;
    out.m_80.x = _1866;
    out.m_80.y = _1868;
    out.m_80.z = _1872;
    out.m_80.w = _1870;
    bool _1884 = !_1718;
    float _1886 = _1882;
    float _1888 = _1882;
    if (!_1884)
    {
        bool _1890 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1892 = isnan(_1093);
        bool _1894 = _1890 || _1892;
        bool _1896 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1898 = _1894 || _1896;
        if (!_1898)
        {
            float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1902 = _1093 + _1900;
            float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1906 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1904;
            float _1908 = 1.0 / _1906;
            float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1926 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1928 = _1926 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1930 = _1902 * _1908;
            float _1932 = precise::clamp(_1930, 0.0, 1.0);
            float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1936 = _1934 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1938 = fma(_1932, _1912, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1940 = fma(_1932, _1936, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1942 = fma(_1932, _1916, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1944 = fma(_1932, _1920, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1946 = fma(_1932, _1924, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1948 = fma(_1932, _1928, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1880 = _1940;
            _1828 = _1946;
            _1834 = _1938;
            _1822 = _1944;
            _1816 = _1942;
            _1888 = _1948;
            _1950 = true;
        }
        else
        {
            bool _1952 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1954 = isnan(_1093);
            bool _1956 = _1952 || _1954;
            bool _1958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1960 = _1956 || _1958;
            if (!_1960)
            {
                _1832 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1962 = _1832;
            _1834 = _1962;
            if (!_1960)
            {
                _1878 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1964 = _1878;
            _1880 = _1964;
            if (!_1960)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1966 = _1814;
            _1816 = _1966;
            if (!_1960)
            {
                _1820 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1968 = _1820;
            _1822 = _1968;
            if (!_1960)
            {
                _1826 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1970 = _1826;
            _1828 = _1970;
            if (!_1960)
            {
                _1886 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1972 = _1886;
            bool _1974 = !_1960;
            _1888 = _1972;
            if (!_1974)
            {
                bool _1976 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1978 = isnan(_1093);
                bool _1980 = _1976 || _1978;
                bool _1982 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1984 = _1980 || _1982;
                if (!_1984)
                {
                    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1988 = _1093 + _1986;
                    float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1992 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1990;
                    float _1994 = 1.0 / _1992;
                    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2010 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2014 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2016 = _1988 * _1994;
                    float _2018 = precise::clamp(_2016, 0.0, 1.0);
                    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2024 = fma(_2018, _1998, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2026 = fma(_2018, _2022, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2028 = fma(_2018, _2002, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2030 = fma(_2018, _2006, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2032 = fma(_2018, _2010, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2034 = fma(_2018, _2014, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1880 = _2026;
                    _1828 = _2032;
                    _1834 = _2024;
                    _1822 = _2030;
                    _1816 = _2028;
                    _1888 = _2034;
                    _1950 = true;
                }
                else
                {
                    _1880 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1828 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1834 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1822 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1888 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1950 = false;
    float _2036 = _1880;
    float _2038 = _1828;
    float _2040 = _1834;
    float _2042 = _1822;
    float _2044 = _1816;
    float _2046 = _1888;
    float _2048 = fma(_1780, -0.5, 0.5);
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = -_2036;
    float _2054 = _2052 + _2038;
    float _2056 = -_2040;
    float _2058 = _2056 + _2042;
    out.m_82.x = 0.0;
    float _2060 = fma(_2050, _2054, _2036);
    float _2062 = -_2044;
    float _2064 = _2062 + _2046;
    float _2066 = fma(_2050, _2058, _2040);
    float _2068 = _2060 * 0.586610972881317138671875;
    bool _2070 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2072 = fma(_2050, _2064, _2044);
    float _2074 = _1874 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2076 = fma(_2066, 0.298911988735198974609375, _2068);
    bool _2078 = _1009 > 0.0;
    bool _2080 = isnan(_1009);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan(0.0);
    bool _2086 = _2082 || _2084;
    float _2088 = fma(_2072, 0.114477999508380889892578125, _2076);
    out.m_49.x = _2074;
    bool _2090 = _1071 <= 0.0;
    bool _2092 = !_2086;
    bool _2094 = _2090 || _2092;
    float _2096 = -_2088;
    float _2098 = _2066 + _2096;
    float _2100 = -_2088;
    float _2102 = _2060 + _2100;
    float _2104 = -_2088;
    float _2106 = _2072 + _2104;
    float _2108 = fma(_2098, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2088);
    float _2110 = fma(_2102, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2088);
    float _2112 = fma(_2106, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2088);
    bool _2114 = !_2070;
    if (!_2114)
    {
        float _2116 = -_937;
        float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2120 = -_939;
        float _2122 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2124 = -_941;
        float _2126 = _2124 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2128 = _2118 * _2118;
        float _2130 = fma(_2122, _2122, _2128);
        float _2132 = fma(_2126, _2126, _2130);
        float _2134 = sqrt(_2132);
        float _2136 = rsqrt(_2132);
        float _2138 = -_2134;
        float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2142 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2144 = precise::clamp(_2142, 0.0, 1.0);
        float _2146 = _2122 * _2136;
        float _2148 = _2118 * _2136;
        float _2150 = abs(_2144);
        float _2152 = log2(_2150);
        float _2154 = _2126 * _2136;
        float _2156 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2158 = _1780 * _2148;
        float _2160 = -_2148;
        float _2162 = -_2156;
        float _2164 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2162);
        float _2166 = fma(_1772, _2146, _2158);
        float _2168 = -_2154;
        float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2164);
        float _2172 = fma(_1800, _2154, _2166);
        float _2174 = precise::clamp(_2172, 0.0, 1.0);
        float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2178 = _2170 + _2176;
        float _2180 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2182 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2184 = precise::clamp(_2182, 0.0, 1.0);
        float _2186 = exp2(_2180);
        float _2188 = _2186 * _2184;
        float _2190 = _2174 * _2188;
        float _2192 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2194 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2196 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2192;
        out.m_82.y = _2194;
        out.m_82.z = _2196;
    }
    out.m_84.x = _2108;
    out.m_84.y = _2110;
    out.m_84.z = _2112;
    if (!_2094)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2198 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2198;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1950 = false;
    bool _301 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2255 = as_type<float>(_119);
        out.gl_Position.z = _2255;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2325 = as_type<float>(_157);
        out.gl_Position.z = _2325;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _163 = as_type<int>(_159) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_159) & 2;
    bool _169 = _167 != 0;
    bool _171 = !_165;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_161;
    float _197;
    if (!_179)
    {
        float _181 = in.m_56.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_103);
        float _203 = 1.0 / _201;
        float _205 = _137 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -_223;
    float _231 = _229 + 1.0;
    bool _233 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _235 = 1.0 / _227;
    float _237 = _211 * _235;
    bool _239 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_207);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = _249 * _231;
    float _261 = fma(_253, _237, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _263 = fma(_257, _237, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _265 = -_249;
    float _267 = _265 + 1.0;
    float _269 = _261 * _259;
    float _271 = _263 * _259;
    float _273 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _269);
    float _275 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _271);
    float _277 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].x, _273);
    float _279 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[144].y, _275);
    bool _281 = !_233;
    float _299;
    if (!_281)
    {
        float _283 = in.m_56.x;
        float _285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _287 = _283 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _291 = _289 * _285;
        float _293 = floor(_291);
        float _295 = -_293;
        float _297 = _291 + _295;
        _299 = _297;
        _301 = true;
    }
    else
    {
        float _303 = float(_103);
        float _305 = 1.0 / _303;
        float _307 = _137 * _305;
        _299 = _307;
    }
    _301 = false;
    float _309 = _299;
    float _311 = in.m_56.z;
    float _313 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _315 = log2(_313);
    float _317 = in.m_56.x;
    float _319 = in.m_56.y;
    float _321 = in.m_58.x;
    float _323 = in.m_58.y;
    float _325 = in.m_58.z;
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _329 = _327 != 0;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _333 = _331 != 0;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _337 = _335 != 0;
    bool _339 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _341 = isnan(1.0);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _347 = _343 || _345;
    float _349 = in.m_60.y;
    float _351 = _315 * _137;
    float _353 = exp2(_351);
    float _355 = _311 * 2.0;
    float _357 = _319 + _311;
    float _359 = _317 * 2.0;
    float _361 = _319 * 2.0;
    float _363 = floor(_355);
    float _365 = _357 + (-1.0);
    float _367 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _369 = _319 + _317;
    float _371 = floor(_359);
    float _373 = -_353;
    float _375 = _373 + 1.0;
    float _377 = _369 + (-1.0);
    float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _383 = 1.0 + _381;
    bool _385 = _363 > 0.0;
    float _387 = floor(_361);
    bool _389 = _363 >= 0.0;
    bool _391 = isnan(_363);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    bool _399 = !_329;
    int _401 = _399 ? 0 : 1;
    int _403 = _397 ? 0 : 1;
    bool _405 = _371 > 0.0;
    float _407 = 1.0 / _383;
    bool _409 = _371 >= 0.0;
    bool _411 = isnan(_371);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    int _419 = ~_403;
    int _421 = _419 + 1;
    int _423 = _421 + 1;
    int _425 = _423;
    if (!_385)
    {
        int _427 = ~_403;
        int _429 = _427 + 1;
        _425 = _429;
    }
    int _431 = _425;
    int _433 = abs(_401);
    bool _435 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _437 = isnan(0.0);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _443 = _439 || _441;
    float _445 = float(_433);
    float _447 = float(_431);
    bool _449 = !_333;
    int _451 = _449 ? 0 : 1;
    float _453 = _443 ? _375 : 0.0;
    float _455 = _445 * _447;
    int _457 = _417 ? 0 : 1;
    int _459 = abs(_451);
    if (_347)
    {
        float _461 = _453 * _407;
        _139 = _461;
    }
    float _463 = _139;
    bool _465 = _387 > 0.0;
    bool _467 = _387 >= 0.0;
    bool _469 = isnan(_387);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = _455 * (-2.0);
    int _479 = ~_457;
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    float _485 = _317 + (-0.5);
    int _487 = _483;
    if (!_405)
    {
        int _489 = ~_457;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = fma(_477, _321, _321);
    float _497 = fma(_379, _477, _379);
    float _499 = float(_493);
    float _501 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[196].x, _495);
    float _503 = float(_459);
    int _505 = _475 ? 0 : 1;
    bool _507 = !_337;
    int _509 = _507 ? 0 : 1;
    float _511 = _503 * _499;
    int _513 = ~_505;
    int _515 = _513 + 1;
    int _517 = _515 + 1;
    float _519 = fma(_497, _463, _501);
    int _521 = _517;
    if (!_465)
    {
        int _523 = ~_505;
        int _525 = _523 + 1;
        _521 = _525;
    }
    int _527 = _521;
    float _529 = _511 * (-2.0);
    int _531 = abs(_509);
    float _533 = _311 + _317;
    float _535 = float(_527);
    float _537 = _319 + (-0.5);
    float _539 = float(_531);
    float _541 = fma(_529, _323, _323);
    float _543 = _533 + (-1.0);
    float _545 = fma(_367, _529, _367);
    float _547 = _519 * 0.15915493667125701904296875;
    float _549 = _539 * _535;
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[196].y, _541);
    float _553 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _555 = in.m_62.x;
    float _557 = in.m_62.y;
    float _559 = in.m_62.z;
    float _561 = in.m_62.w;
    float _563 = _549 * (-2.0);
    float _565 = fma(_545, _463, _551);
    float _567 = _311 + (-0.5);
    float _569 = in.m_46.x;
    float _571 = in.m_46.y;
    float _573 = in.m_46.z;
    float _575 = fma(_563, _325, _325);
    float _577 = fma(_553, _563, _553);
    float _579 = _565 * 0.15915493667125701904296875;
    float _581 = in.m_64.x;
    float _583 = in.m_64.y;
    float _585 = in.m_64.z;
    float _587 = in.m_64.w;
    float _589 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[196].z, _575);
    float _591 = _547 * 6.283185482025146484375;
    float _593 = sin(_591);
    bool _595 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _597 = isnan(0.5);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _603 = _599 || _601;
    float _605 = in.m_66.x;
    float _607 = in.m_66.y;
    float _609 = fma(_577, _463, _589);
    bool _611 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _613 = isnan(0.5);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _619 = _615 || _617;
    float _621 = _609 * 0.15915493667125701904296875;
    float _623 = _547 * 6.283185482025146484375;
    float _625 = cos(_623);
    float _627 = _579 * 6.283185482025146484375;
    float _629 = sin(_627);
    float _631 = _571 * _557;
    float _633 = _571 * _583;
    float _635 = _571 + _349;
    float _637 = _579 * 6.283185482025146484375;
    float _639 = cos(_637);
    float _641 = fma(_569, _555, _631);
    float _643 = _279 * _607;
    float _645 = _277 * _605;
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _649 = fma(_573, _559, _641);
    float _651 = _643 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _655 = _621 * 6.283185482025146484375;
    float _657 = cos(_655);
    float _659 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _661 = _651 * _647;
    float _663 = _593 * _629;
    float _665 = fma(_569, _581, _633);
    float _667 = _659 * _653;
    float _669 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _671 = _649 + _561;
    float _673 = _621 * 6.283185482025146484375;
    float _675 = sin(_673);
    float _677 = _625 * _639;
    float _679 = _593 * _639;
    float _681 = fma(_573, _585, _665);
    float _683 = _635 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _685 = _681 + _587;
    float _687 = _625 * _657;
    float _689 = _625 * _629;
    float _691 = _593 * _657;
    float _693 = _639 * _657;
    float _695 = _687 * _661;
    float _697 = _629 * _657;
    float _699 = fma(_675, _677, _663);
    float _701 = -_661;
    float _703 = _675 * _701;
    float _705 = -_679;
    float _707 = fma(_675, _689, _705);
    float _709 = -_689;
    float _711 = fma(_675, _679, _709);
    float _713 = fma(_699, _667, _695);
    float _715 = _691 * _661;
    float _717 = fma(_693, _667, _703);
    float _719 = fma(_675, _663, _677);
    float _721 = fma(_707, _669, _713);
    float _723 = fma(_711, _667, _715);
    float _725 = fma(_697, _669, _717);
    float _727 = _721 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _729 = fma(_719, _669, _723);
    float _731 = _721 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _733 = _721 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _735 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[26].x, _727);
    float _737 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[24].x, _731);
    float _739 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[11].x, _683);
    float _741 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].z, _735);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c8)._m0[25].x, _733);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].z, _737);
    float _747 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[11].z, _739);
    float _749 = _741 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _751 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].z, _743);
    float _753 = _745 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _755 = _747 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _757 = _685 + _749;
    float _759 = _635 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _761 = _671 + _753;
    float _763 = 1.0 / _755;
    float _765 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _767 = _757 + _765;
    float _769 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _771 = _761 + _769;
    float _773 = _767 * _767;
    float _775 = fma(_771, _771, _773);
    float _777 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[10].x, _759);
    float _779 = sqrt(_775);
    float _781 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[10].z, _777);
    float _783 = _781 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _785 = _783 + _755;
    float _787 = _785 * _763;
    float _789 = _787 * 0.5;
    bool _791 = _779 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[30].w, _793);
    float _797 = _751 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _799 = _635 + _797;
    float _801 = 1.0 / _795;
    float _803 = _579;
    float _805 = _733;
    float _807 = _757;
    float _809 = _761;
    float _811 = _755;
    float _813 = _577;
    float _815 = _547;
    float _817 = _715;
    if (!_791)
    {
        _803 = _799;
    }
    float _819 = _803;
    bool _821 = !_791;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _779 + _827;
        float _831 = rsqrt(_775);
        float _833 = _829 * _825;
        float _835 = _799 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = _833 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = _841 + (-1.0);
        float _849 = fma(_845, _835, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _851 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _853 = _831 * _849;
        float _855 = fma(_799, _841, _851);
        float _857 = fma(_771, _853, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _859 = fma(_767, _853, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _805 = _853;
        _823 = _855;
        _807 = _859;
        _809 = _857;
        _811 = _849;
    }
    float _861 = _805;
    float _863 = _823;
    float _865 = _807;
    float _867 = _809;
    float _869 = _811;
    float _871 = _869;
    float _873 = _863;
    float _875 = _867;
    float _877 = _865;
    float _879 = _861;
    if (_619)
    {
        _813 = 1.0;
    }
    float _881 = _813;
    float _883 = _881;
    if (!_603)
    {
        float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _887 = _635 + _885;
        float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _891 = _671 + _889;
        float _893 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _895 = -_635;
        float _897 = _895 + _863;
        float _899 = _887 * _887;
        float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _903 = _685 + _901;
        float _905 = fma(_891, _891, _899);
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _909 = fma(_903, _903, _905);
        float _911 = sqrt(_909);
        float _913 = _893 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _915 = precise::min(_911, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _917 = _915 * _907;
        float _919 = -_685;
        float _921 = _919 + _865;
        float _923 = _913 * _917;
        float _925 = -_671;
        float _927 = _925 + _867;
        float _929 = fma(_897, _923, _635);
        float _931 = fma(_927, _923, _671);
        float _933 = fma(_921, _923, _685);
        _871 = _923;
        _873 = _929;
        _875 = _931;
        _877 = _933;
        _879 = _893;
    }
    float _935 = _871;
    float _937 = _873;
    float _939 = _875;
    float _941 = _877;
    float _943 = _879;
    float _945 = _935;
    float _947 = _943;
    if (_619)
    {
        _815 = 1.0;
    }
    float _949 = _815;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _953 = _801 * _951;
    float _955 = _949;
    if (!_619)
    {
        float _957 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _959 = _957 * 0.15915493667125701904296875;
        float _961 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _963 = _959 * 6.283185482025146484375;
        float _965 = cos(_963);
        float _967 = _961 * 0.15915493667125701904296875;
        float _969 = _959 * 6.283185482025146484375;
        float _971 = sin(_969);
        float _973 = 1.0 / _965;
        float _975 = _967 * 6.283185482025146484375;
        float _977 = cos(_975);
        float _979 = _971 * _973;
        float _981 = _967 * 6.283185482025146484375;
        float _983 = sin(_981);
        float _985 = _977 * _979;
        float _987 = 1.0 / _985;
        float _989 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _991 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _989;
        float _993 = 1.0 / _991;
        float _995 = _983 * _987;
        float _997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _999 = fma(_953, _995, _997);
        float _1001 = _999 * _993;
        float _1003 = precise::clamp(_1001, 0.0, 1.0);
        _945 = _993;
        _947 = _967;
        _883 = _1003;
    }
    float _1005 = _945;
    float _1007 = _947;
    float _1009 = _883;
    float _1011 = _1005;
    float _1013 = _1007;
    if (!_619)
    {
        float _1015 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1017 = _1015 * 0.15915493667125701904296875;
        float _1019 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1021 = _1017 * 6.283185482025146484375;
        float _1023 = cos(_1021);
        float _1025 = _1019 * 0.15915493667125701904296875;
        float _1027 = _1017 * 6.283185482025146484375;
        float _1029 = sin(_1027);
        float _1031 = 1.0 / _1023;
        float _1033 = _1025 * 6.283185482025146484375;
        float _1035 = cos(_1033);
        float _1037 = _1029 * _1031;
        float _1039 = _1025 * 6.283185482025146484375;
        float _1041 = sin(_1039);
        float _1043 = _1035 * _1037;
        float _1045 = 1.0 / _1043;
        float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1049 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1047;
        float _1051 = 1.0 / _1049;
        float _1053 = _1041 * _1045;
        float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1057 = fma(_953, _1053, _1055);
        float _1059 = _1057 * _1051;
        float _1061 = precise::clamp(_1059, 0.0, 1.0);
        float _1063 = -_1061;
        float _1065 = _1063 + 1.0;
        _1011 = _1031;
        _1013 = _1043;
        _955 = _1065;
    }
    float _1067 = _1011;
    float _1069 = _1013;
    float _1071 = _955;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1075 = _937 + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1079 = _939 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1083 = _941 + _1081;
    float _1085 = _1075 * _1075;
    float _1087 = fma(_1079, _1079, _1085);
    float _1089 = fma(_1083, _1083, _1087);
    float _1091 = rsqrt(_1089);
    float _1093 = sqrt(_1089);
    float _1095 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1097 = _1079 * _1095;
    float _1099 = _1083 * _1095;
    float _1101 = _1097 * _1097;
    float _1103 = _1099 * _1099;
    float _1105 = _1101 + _1103;
    float _1107 = sqrt(_1105);
    bool _1109 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1113 = _1107 + _1111;
    float _1115 = _1067;
    float _1117 = _1105;
    float _1119 = _1113;
    float _1121 = _1075;
    float _1123 = _1095;
    if (_1109)
    {
        float _1125 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1115 = _1125;
    }
    float _1127 = _1115;
    if (_1109)
    {
        float _1129 = rsqrt(_1105);
        _1117 = _1129;
    }
    float _1131 = _1117;
    float _1133 = _1127;
    float _1135 = _1131;
    if (_1109)
    {
        float _1137 = _1113 * _1127;
        _1119 = _1137;
    }
    float _1139 = _1119;
    if (_1109)
    {
        float _1141 = _1139 * 0.15915493667125701904296875;
        _1133 = _1141;
    }
    float _1143 = _1133;
    float _1145 = _1083;
    float _1147 = _1143;
    if (_1109)
    {
        float _1149 = _1143 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        _1145 = _1151;
    }
    float _1153 = _1145;
    float _1155 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1157 = precise::max(0.0, _1155);
    float _1159 = _1069;
    if (_1109)
    {
        float _1161 = _1143 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        _1159 = _1163;
    }
    float _1165 = _1159;
    float _1167 = -_1095;
    float _1169 = -_1157;
    float _1171 = fma(_1075, _1167, _1169);
    float _1173 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1109)
    {
        float _1175 = _1171 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1121 = _1175;
    }
    float _1177 = _1121;
    float _1179 = _1177;
    if (!_1109)
    {
        _1147 = _1097;
    }
    float _1181 = _1147;
    float _1183 = fma(_671, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1185 = _1153;
    float _1187 = _1181;
    if (_1109)
    {
        float _1189 = fma(_1153, _1177, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1185 = _1189;
    }
    float _1191 = _1185;
    float _1193 = _1191;
    if (!_1109)
    {
        _1179 = _1171;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    float _1199 = _1165;
    if (_1109)
    {
        float _1201 = _1165 + (-1.0);
        _1173 = _1201;
    }
    float _1203 = _1173;
    if (_1109)
    {
        float _1205 = _1131 * _1191;
        _817 = _1205;
    }
    float _1207 = _817;
    if (!_1109)
    {
        _1135 = _1099;
    }
    float _1209 = _1135;
    float _1211 = _1209;
    if (_1109)
    {
        float _1213 = _1203 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1123 = _1213;
    }
    float _1215 = _1123;
    if (_1109)
    {
        float _1217 = _1097 * _1207;
        _1187 = _1217;
    }
    float _1219 = _1187;
    if (!_1109)
    {
        _1193 = _1101;
    }
    float _1221 = _1193;
    float _1223 = _1221;
    if (_1109)
    {
        float _1225 = _1099 * _1207;
        _1211 = _1225;
    }
    float _1227 = _1211;
    if (_1109)
    {
        float _1229 = fma(_1171, _1165, _1215);
        _1197 = _1229;
    }
    float _1231 = _1197;
    if (_1109)
    {
        float _1233 = _1219 * _1219;
        _1223 = _1233;
    }
    float _1235 = _1223;
    if (!_1109)
    {
        _1199 = _1103;
    }
    float _1237 = _1199;
    float _1239 = _1237;
    if (_1109)
    {
        float _1241 = _1227 * _1227;
        _1239 = _1241;
    }
    float _1243 = _1239;
    float _1245 = fma(_1231, _1231, _1235);
    float _1247 = _937 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1249 = _937 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1251 = _1245 + _1243;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1255 = fma(_1093, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1253);
    float _1257 = precise::clamp(_1255, 0.0, 1.0);
    float _1259 = fma(_685, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1261 = _937 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1263 = rsqrt(_1251);
    float _1265 = -_1257;
    float _1267 = _1265 + 1.0;
    float _1269 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1247);
    float _1271 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1261);
    float _1273 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1249);
    float _1275 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1269);
    float _1277 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1271);
    float _1279 = abs(_1267);
    float _1281 = log2(_1279);
    float _1283 = _937 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = _1275 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1287 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1289 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1273);
    float _1291 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1293 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1297 = _1263 * _1219;
    float _1299 = _1263 * _1231;
    float _1301 = _1263 * _1227;
    float _1303 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1291);
    float _1305 = _1297 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1307 = floor(_1183);
    float _1309 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1313 = -_1305;
    float _1315 = fma(_1299, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1313);
    float _1317 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1319 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1321 = -_1295;
    float _1323 = fma(_1321, _1293, 1.0);
    float _1325 = -_1301;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1315);
    float _1329 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1317);
    float _1331 = floor(_1259);
    float _1333 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1335 = fma(_1327, 0.5, 0.5);
    float _1337 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1329);
    float _1339 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1337);
    float _1341 = exp2(_1319);
    float _1343 = -_1307;
    float _1345 = _1183 + _1343;
    float _1347 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1349 = log2(_1323);
    float _1351 = -_1331;
    float _1353 = _1259 + _1351;
    float _1355 = 1.0 / _1339;
    float _1357 = fma(_1327, -0.5, 0.5);
    float _1359 = fma(_1335, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1361 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1347);
    float _1363 = _1299 + 1.0;
    float _1365 = fma(_1335, _1359, -0.212114393711090087890625);
    float _1367 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1361);
    float _1369 = sqrt(_1357);
    float _1371 = -_1299;
    float _1373 = fma(_1341, _1363, _1371);
    float _1375 = _1349 * 0.693147182464599609375;
    float _1377 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1367);
    float _1379 = fma(_1335, _1365, 1.570728778839111328125);
    float2 _4147 = float2(_1345, _1353);
    float _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4147, float2(0.0), isnan(_4147)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4147, float2(0.0), isnan(_4147)), level(0.0)).x;
    float _1383 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1385 = fma(_1373, 0.5, 0.5);
    float _1387 = _1377 * _1355;
    float _1389 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1333);
    float _1391 = fma(_1387, 0.5, 0.5);
    float _1393 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1389);
    float _1395 = _1369 * 0.636619746685028076171875;
    float _1397 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1393);
    float _1399 = -_1379;
    float _1401 = fma(_1395, _1399, 1.0);
    float _1403 = _1397 * _1355;
    float _1405 = fma(_1403, -0.5, 0.5);
    float3 _4197 = float3(_1391, _1405, _1383);
    float _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4197, float3(0.0), isnan(_4197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4197, float3(0.0), isnan(_4197)), level(0.0)).x;
    float3 _4208 = float3(_1391, _1405, _1383);
    float4 _1410 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4208, float3(0.0), isnan(_4208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4208, float3(0.0), isnan(_4208)), level(0.0)).xyzw;
    float _1412 = _1410.x;
    float _1414 = _1410.y;
    float _1416 = _1410.z;
    float _1418 = _1410.w;
    float2 _4224 = float2(_1401, _1385);
    float3 _1422 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4224, float2(0.0), isnan(_4224)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4224, float2(0.0), isnan(_4224)), level(0.0)).xyz;
    float _1424 = _1422.x;
    float _1426 = _1422.y;
    float _1428 = _1422.z;
    float _1430 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1432 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1444 = _1442 != 0;
    float _1446 = exp2(_1430);
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1450 = _1448 != 0;
    float _1452 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1432);
    bool _1454 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1456 = isnan(_309);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1462 = _1458 || _1460;
    float _1464 = float(_1462);
    bool _1466 = _317 > 0.5;
    float _1468 = 1.0 / _1436;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1470;
    bool _1474 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1476 = isnan(_309);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = -_1464;
    float _1488 = _1486 + 1.0;
    bool _1490 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1492 = isnan(_309);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1506 = _319 > 0.5;
    float _1508 = -_1484;
    float _1510 = _1508 + 1.0;
    float _1512 = 1.0 / _1440;
    float _1514 = _1500 * _1488;
    float _1516 = -_1500;
    float _1518 = _1516 + 1.0;
    float _1520 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1452);
    float _1522 = -_1446;
    float _1524 = _1522 + 1.0;
    float _1526 = _1472 * _1468;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1530 = _309 + _1528;
    float _1532 = _1464 * _1510;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1534;
    float _1538 = 1.0 / _1504;
    float _1540 = fma(_1526, _1530, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1544 = _309 + _1542;
    float _1546 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1548 = _1540 * _1514;
    float _1550 = -_173;
    int _1552 = _1466 ? as_type<int>(_1550) : as_type<int>(_173);
    bool _1554 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1556 = isnan(_309);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1570 = !_1444;
    float _1572 = _1570 ? _173 : as_type<float>(_1552);
    float _1574 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1548);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1578 = _309 + _1576;
    float _1580 = _1568 * _1512;
    float _1582 = -_177;
    int _1584 = _1506 ? as_type<int>(_1582) : as_type<int>(_177);
    float _1586 = _1572 + 0.5;
    float _1588 = _1536 * _1538;
    float _1590 = fma(_1580, _1544, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1594 = !_1450;
    float _1596 = _1594 ? _177 : as_type<float>(_1584);
    float _1598 = fma(_1588, _1578, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1600 = fma(_1590, _1532, _1574);
    float _1602 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1604 = -_1564;
    float _1606 = _1604 + 1.0;
    float _1608 = -_1596;
    float _1610 = _1608 + 0.5;
    float _1612 = _687 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1614 = abs(_953);
    float _1616 = log2(_1614);
    float _1618 = _1484 * _1606;
    float _1620 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1622 = -_675;
    float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1612);
    float _1626 = fma(_1598, _1618, _1600);
    float _1628 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1632 = _1620 * _1592;
    float _1634 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1626);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1638 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1640 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1646 = _687 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1648 = _687 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1650 = exp2(_1640);
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1654 = _1602 * _1630;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1660 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1672 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _1654;
    out.m_68.y = _1632;
    bool _1674 = _953 <= 8000.0;
    bool _1676 = isnan(_953);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(8000.0);
    bool _1682 = _1678 || _1680;
    float _1684 = float(_1682);
    float _1686 = fma(_1650, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1688 = precise::clamp(_1686, 0.0, 1.0);
    float _1690 = -_675;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1646);
    float _1694 = -_675;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1648);
    out.m_70.x = _1660;
    out.m_70.y = _1672;
    out.m_70.z = _1662;
    out.m_70.w = _1644;
    float _1698 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1692);
    float _1700 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1696);
    float _1702 = _699 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1704 = fma(_1688, -2.0, 3.0);
    float _1706 = _1688 * _1688;
    out.m_72.x = _1666;
    out.m_72.y = _1668;
    out.m_72.z = _1670;
    out.m_72.w = _1638;
    float _1708 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1702);
    bool _1710 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1712 = isnan(_1093);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1718 = _1714 || _1716;
    float _1720 = _1706 * _1704;
    float _1722 = -_1720;
    float _1724 = _1722 + 1.0;
    float _1726 = _699 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1728 = _699 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1730 = in.m_60.x;
    float _1732 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1726);
    float _1734 = fma(_693, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1728);
    float _1736 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1738 = _707 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1740 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1624);
    float _1742 = _707 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1744 = _1736 * _1698;
    float _1746 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1738);
    float _1748 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1732);
    float _1750 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1720);
    float _1752 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1742);
    float _1754 = _1736 * _1740;
    float _1756 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1734);
    float _1758 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1746);
    float _1760 = fma(_1628, _1748, _1744);
    float _1762 = _1684 * _1750;
    float _1764 = _1736 * _1700;
    float _1766 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1708);
    float _1768 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1752);
    float _1770 = fma(_1628, _1756, _1754);
    float _1772 = _1758 + _1760;
    float _1774 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1520);
    float _1776 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1778 = fma(_1628, _1766, _1764);
    float _1780 = _1768 + _1770;
    float _1782 = _707 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1784 = _1377 + _1339;
    out.gl_Position.x = _1377;
    out.gl_Position.y = _1397;
    out.gl_Position.z = _1774;
    out.gl_Position.w = _1339;
    float _1786 = _1774 + _1339;
    float _1788 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1782);
    float _1790 = _1339 * 0.5;
    float _1792 = _1786 * 0.5;
    float _1794 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1788);
    float _1796 = _1784 * 0.5;
    float _1798 = fma(_1397, -0.5, _1790);
    float _1800 = _1794 + _1778;
    out.m_74.x = _1796;
    out.m_74.y = _1798;
    out.m_74.z = _1792;
    out.m_74.w = _1339;
    float _1802 = _1339;
    float _1804 = _1774;
    float _1806 = _1397;
    float _1808 = _1798;
    float _1810 = _1796;
    if (!_1718)
    {
        _1802 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1812 = _1802;
    float _1814 = _1812;
    float _1816 = _1812;
    if (!_1718)
    {
        _1804 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1818 = _1804;
    out.m_76.x = _1772;
    out.m_76.y = _1780;
    out.m_76.z = _1800;
    float _1820 = _1818;
    float _1822 = _1818;
    if (!_1718)
    {
        _1806 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1824 = _1806;
    float _1826 = _1824;
    float _1828 = _1824;
    if (!_1718)
    {
        _1808 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1830 = _1808;
    float _1832 = _1830;
    float _1834 = _1830;
    if (!_1718)
    {
        _1810 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1836 = _1810;
    float _1838 = -_1381;
    float _1840 = _1838 + 1.0;
    float _1842 = _1840 * _1776;
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = -_1844;
    float _1848 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1850 = _1848 * _1730;
    float _1852 = _1850 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_78.x = _1852;
    float _1854 = _1546 * _1407;
    float _1856 = -_1546;
    float _1858 = _1856 + 1.0;
    float _1860 = _1418 * _1854;
    float _1862 = _1428 * _1854;
    float _1864 = _1009 * _1071;
    float _1866 = fma(_1424, _1860, _1412);
    float _1868 = fma(_1426, _1860, _1414);
    float _1870 = _1418 * _1858;
    float _1872 = fma(_1418, _1862, _1416);
    float _1874 = _1864 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1876 = _1864;
    float _1878 = _1836;
    float _1880 = _1836;
    if (!_1718)
    {
        _1876 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1882 = _1876;
    out.m_80.x = _1866;
    out.m_80.y = _1868;
    out.m_80.z = _1872;
    out.m_80.w = _1870;
    bool _1884 = !_1718;
    float _1886 = _1882;
    float _1888 = _1882;
    if (!_1884)
    {
        bool _1890 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1892 = isnan(_1093);
        bool _1894 = _1890 || _1892;
        bool _1896 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1898 = _1894 || _1896;
        if (!_1898)
        {
            float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1902 = _1093 + _1900;
            float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1906 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1904;
            float _1908 = 1.0 / _1906;
            float _1910 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1912 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1914 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1916 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1920 = _1918 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1924 = _1922 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1926 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1928 = _1926 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1930 = _1902 * _1908;
            float _1932 = precise::clamp(_1930, 0.0, 1.0);
            float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1936 = _1934 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1938 = fma(_1932, _1912, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1940 = fma(_1932, _1936, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1942 = fma(_1932, _1916, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1944 = fma(_1932, _1920, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1946 = fma(_1932, _1924, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1948 = fma(_1932, _1928, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1880 = _1940;
            _1828 = _1946;
            _1834 = _1938;
            _1822 = _1944;
            _1816 = _1942;
            _1888 = _1948;
            _1950 = true;
        }
        else
        {
            bool _1952 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1954 = isnan(_1093);
            bool _1956 = _1952 || _1954;
            bool _1958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1960 = _1956 || _1958;
            if (!_1960)
            {
                _1832 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1962 = _1832;
            _1834 = _1962;
            if (!_1960)
            {
                _1878 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1964 = _1878;
            _1880 = _1964;
            if (!_1960)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1966 = _1814;
            _1816 = _1966;
            if (!_1960)
            {
                _1820 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1968 = _1820;
            _1822 = _1968;
            if (!_1960)
            {
                _1826 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1970 = _1826;
            _1828 = _1970;
            if (!_1960)
            {
                _1886 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1972 = _1886;
            bool _1974 = !_1960;
            _1888 = _1972;
            if (!_1974)
            {
                bool _1976 = _1093 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1978 = isnan(_1093);
                bool _1980 = _1976 || _1978;
                bool _1982 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1984 = _1980 || _1982;
                if (!_1984)
                {
                    float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1988 = _1093 + _1986;
                    float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1992 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1990;
                    float _1994 = 1.0 / _1992;
                    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1998 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2010 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2014 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2016 = _1988 * _1994;
                    float _2018 = precise::clamp(_2016, 0.0, 1.0);
                    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2024 = fma(_2018, _1998, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2026 = fma(_2018, _2022, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2028 = fma(_2018, _2002, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2030 = fma(_2018, _2006, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2032 = fma(_2018, _2010, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2034 = fma(_2018, _2014, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1880 = _2026;
                    _1828 = _2032;
                    _1834 = _2024;
                    _1822 = _2030;
                    _1816 = _2028;
                    _1888 = _2034;
                    _1950 = true;
                }
                else
                {
                    _1880 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1828 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1834 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1822 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1888 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1950 = false;
    float _2036 = _1880;
    float _2038 = _1828;
    float _2040 = _1834;
    float _2042 = _1822;
    float _2044 = _1816;
    float _2046 = _1888;
    float _2048 = fma(_1780, -0.5, 0.5);
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = -_2036;
    float _2054 = _2052 + _2038;
    float _2056 = -_2040;
    float _2058 = _2056 + _2042;
    out.m_82.x = 0.0;
    float _2060 = fma(_2050, _2054, _2036);
    float _2062 = -_2044;
    float _2064 = _2062 + _2046;
    float _2066 = fma(_2050, _2058, _2040);
    float _2068 = _2060 * 0.586610972881317138671875;
    bool _2070 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2072 = fma(_2050, _2064, _2044);
    float _2074 = _1874 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2076 = fma(_2066, 0.298911988735198974609375, _2068);
    bool _2078 = _1009 > 0.0;
    bool _2080 = isnan(_1009);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan(0.0);
    bool _2086 = _2082 || _2084;
    float _2088 = fma(_2072, 0.114477999508380889892578125, _2076);
    out.m_49.x = _2074;
    bool _2090 = _1071 <= 0.0;
    bool _2092 = !_2086;
    bool _2094 = _2090 || _2092;
    float _2096 = -_2088;
    float _2098 = _2066 + _2096;
    float _2100 = -_2088;
    float _2102 = _2060 + _2100;
    float _2104 = -_2088;
    float _2106 = _2072 + _2104;
    float _2108 = fma(_2098, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2088);
    float _2110 = fma(_2102, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2088);
    float _2112 = fma(_2106, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2088);
    bool _2114 = !_2070;
    if (!_2114)
    {
        float _2116 = -_937;
        float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2120 = -_939;
        float _2122 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2124 = -_941;
        float _2126 = _2124 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2128 = _2118 * _2118;
        float _2130 = fma(_2122, _2122, _2128);
        float _2132 = fma(_2126, _2126, _2130);
        float _2134 = sqrt(_2132);
        float _2136 = rsqrt(_2132);
        float _2138 = -_2134;
        float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2142 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2144 = precise::clamp(_2142, 0.0, 1.0);
        float _2146 = _2122 * _2136;
        float _2148 = _2118 * _2136;
        float _2150 = abs(_2144);
        float _2152 = log2(_2150);
        float _2154 = _2126 * _2136;
        float _2156 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2158 = _1780 * _2148;
        float _2160 = -_2148;
        float _2162 = -_2156;
        float _2164 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2162);
        float _2166 = fma(_1772, _2146, _2158);
        float _2168 = -_2154;
        float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2164);
        float _2172 = fma(_1800, _2154, _2166);
        float _2174 = precise::clamp(_2172, 0.0, 1.0);
        float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2178 = _2170 + _2176;
        float _2180 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2182 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2184 = precise::clamp(_2182, 0.0, 1.0);
        float _2186 = exp2(_2180);
        float _2188 = _2186 * _2184;
        float _2190 = _2174 * _2188;
        float _2192 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2194 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2196 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2192;
        out.m_82.y = _2194;
        out.m_82.z = _2196;
    }
    out.m_84.x = _2108;
    out.m_84.y = _2110;
    out.m_84.z = _2112;
    if (!_2094)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2198 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2198;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

