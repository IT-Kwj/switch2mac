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
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_74 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1145 = false;
    bool _403 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1899 = as_type<float>(_109);
        out.gl_Position.z = _1899;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    float _131 = _127;
    if (_123)
    {
        float _133 = float(_93);
        _129 = _133;
    }
    float _135 = _129;
    bool _137 = _127 >= _135;
    bool _139 = !_123;
    bool _141 = _137 || _139;
    if (_141)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _103;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1968 = as_type<float>(_147);
        out.gl_Position.z = _1968;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_51.x;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = _153 * _151;
    float _171 = 0.0;
    if (!_167)
    {
        float _173 = _157 * _157;
        float _175 = _173 * 0.5;
        _171 = _175;
    }
    float _177 = _171;
    float _179 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _181 = _177;
    float _183 = _179;
    if (!_167)
    {
        float _185 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _185;
    }
    float _187 = _181;
    float _189 = in.m_49.x;
    float _191 = in.m_49.y;
    float _193 = in.m_49.z;
    float _195 = _179 * 6.283185482025146484375;
    float _197 = floor(_179);
    int _199 = as_type<int>(_155) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_155) & 2;
    bool _205 = _203 != 0;
    float _207 = _195 * 0.15915493667125701904296875;
    int _209 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _211 = _209 != 0;
    float _213 = _207 * 6.283185482025146484375;
    float _215 = cos(_213);
    bool _217 = !_201;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = -_197;
    float _223 = _179 + _221;
    bool _225 = !_205;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _187;
    float _231 = _219;
    if (!_167)
    {
        _183 = _157;
    }
    float _233 = _183;
    bool _235 = !_167;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _157 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _157);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _267;
    }
    float _269 = _229;
    bool _271 = !_167;
    if (!_271)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _157 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _237 = _291;
    }
    float _293 = _237;
    float _295 = in.m_56.w;
    float _297 = fma(_215, 0.5, 0.5);
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _301 = _299 != 0;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _305 = _303 != 0;
    float _307 = in.m_44.x;
    float _309 = in.m_44.y;
    float _311 = in.m_44.z;
    bool _313 = _223 < 0.5;
    float _315 = float(_313);
    float _317 = -_223;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _321 = !_211;
    int _323 = _321 ? 0 : 1;
    float _325 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _327 = !_301;
    int _329 = _327 ? 0 : 1;
    float _331 = -_315;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = -_297;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _339 = abs(_323);
    int _341 = abs(_329);
    float _343 = fma(_293, _189, _325);
    bool _345 = !_305;
    int _347 = _345 ? 0 : 1;
    float _349 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _353 = fma(_293, _191, _349);
    int _355 = abs(_347);
    float _357 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = float(_341);
    float _361 = float(_339);
    float _363 = fma(_293, _193, _357);
    float _365 = abs(_319);
    float _367 = _359 * _365;
    float _369 = float(_355);
    float _371 = fma(_361, _337, _367);
    float _373 = fma(_343, _295, _307);
    float _375 = fma(_353, _295, _309);
    float _377 = fma(_363, _295, _311);
    float _379 = abs(_333);
    float _381 = fma(_369, _379, _371);
    bool _383 = !_351;
    float _385 = _377;
    float _401;
    if (!_383)
    {
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _389 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_93);
        float _407 = 1.0 / _405;
        float _409 = _127 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_51.y;
    float _415 = _149 * 2.0;
    float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _419 = log2(_417);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _427 = _425 != 0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _431 = _429 != 0;
    float _433 = in.m_51.z;
    bool _435 = !_431;
    int _437 = _435 ? 0 : 1;
    float _439 = floor(_415);
    int _441 = abs(_437);
    float _443 = _419 * _127;
    float _445 = _413 * 2.0;
    float _447 = exp2(_443);
    bool _449 = _439 > 0.0;
    float _451 = _433 * 2.0;
    bool _453 = _439 >= 0.0;
    bool _455 = isnan(_439);
    bool _457 = _453 || _455;
    bool _459 = isnan(0.0);
    bool _461 = _457 || _459;
    float _463 = _149 + _413;
    float _465 = _413 + _433;
    float _467 = floor(_445);
    int _469 = _461 ? 0 : 1;
    float _471 = _463 + (-1.0);
    float _473 = _465 + (-1.0);
    int _475 = ~_469;
    int _477 = _475 + 1;
    int _479 = _477 + 1;
    int _481 = _479;
    if (!_449)
    {
        int _483 = ~_469;
        int _485 = _483 + 1;
        _481 = _485;
    }
    int _487 = _481;
    float _489 = floor(_451);
    float _491 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _493 = -_447;
    float _495 = _493 + 1.0;
    bool _497 = _467 > 0.0;
    bool _499 = _467 >= 0.0;
    bool _501 = isnan(_467);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    float _509 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _511 = !_423;
    int _513 = _511 ? 0 : 1;
    int _515 = _507 ? 0 : 1;
    bool _517 = _489 > 0.0;
    bool _519 = _489 >= 0.0;
    bool _521 = isnan(_489);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    int _529 = ~_515;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    int _535 = _527 ? 0 : 1;
    int _537 = _533;
    if (!_497)
    {
        int _539 = ~_515;
        int _541 = _539 + 1;
        _537 = _541;
    }
    int _543 = _537;
    bool _545 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _547 = isnan(1.0);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _553 = _549 || _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _557 = 1.0 + _555;
    int _559 = ~_535;
    int _561 = _559 + 1;
    int _563 = _561 + 1;
    int _565 = _563;
    if (!_517)
    {
        int _567 = ~_535;
        int _569 = _567 + 1;
        _565 = _569;
    }
    int _571 = _565;
    float _573 = 1.0 / _557;
    bool _575 = !_427;
    int _577 = _575 ? 0 : 1;
    float _579 = in.m_58.x;
    float _581 = in.m_58.y;
    float _583 = in.m_58.z;
    int _585 = abs(_513);
    int _587 = abs(_577);
    bool _589 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _597 = _593 || _595;
    float _599 = float(_587);
    float _601 = float(_487);
    float _603 = _597 ? _495 : 0.0;
    float _605 = float(_585);
    float _607 = _599 * _601;
    float _609 = float(_571);
    if (_553)
    {
        float _611 = _603 * _573;
        _131 = _611;
    }
    float _613 = _131;
    float _615 = _607 * (-2.0);
    float _617 = _413 + (-0.5);
    float _619 = _605 * _609;
    float _621 = float(_441);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _623;
    float _627 = fma(_615, _581, _581);
    float _629 = fma(_491, _615, _491);
    float _631 = float(_543);
    float _633 = _149 + _433;
    float _635 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[196].y, _627);
    float _637 = 1.0 / _625;
    float _639 = _619 * (-2.0);
    float _641 = fma(_629, _613, _635);
    float _643 = _621 * _631;
    float _645 = _633 + (-1.0);
    float _647 = fma(_509, _639, _509);
    float _649 = _641 * 0.15915493667125701904296875;
    float _651 = fma(_639, _579, _579);
    float _653 = _149 + (-0.5);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _657 = _643 * (-2.0);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _661 = _411 + _659;
    float _663 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].x, _651);
    bool _665 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _667 = isnan(_411);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_657, _583, _583);
    float _679 = fma(_655, _657, _655);
    float _681 = _661 * _637;
    float _683 = fma(_647, _613, _663);
    bool _685 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _687 = isnan(_411);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = in.m_56.x;
    float _699 = in.m_56.y;
    float _701 = _433 + (-0.5);
    float _703 = _683 * 0.15915493667125701904296875;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _705;
    float _709 = -_695;
    float _711 = _709 + 1.0;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _713;
    float _717 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].z, _677);
    float _719 = fma(_707, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _721 = _675 * _711;
    float _723 = fma(_715, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _725 = fma(_679, _613, _717);
    float _727 = in.m_60.x;
    float _729 = in.m_60.y;
    float _731 = in.m_60.z;
    float _733 = in.m_60.w;
    float _735 = -_675;
    float _737 = _735 + 1.0;
    float _739 = _719 * _721;
    float _741 = _723 * _721;
    float _743 = _725 * 0.15915493667125701904296875;
    float _745 = _649 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[143].x, _739);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[143].y, _741);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    bool _755 = _149 > 0.5;
    float _757 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[144].x, _749);
    float _759 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[144].y, _751);
    float _761 = _649 * 6.283185482025146484375;
    float _763 = cos(_761);
    float _765 = _757 * _697;
    float _767 = _759 * _699;
    float _769 = in.m_62.x;
    float _771 = in.m_62.y;
    float _773 = in.m_62.z;
    float _775 = in.m_62.w;
    float _777 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _779 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _781 = _703 * 6.283185482025146484375;
    float _783 = sin(_781);
    float _785 = _777 * _753;
    float _787 = _375 * _729;
    float _789 = fma(_373, _727, _787);
    float _791 = _703 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = fma(_377, _731, _789);
    float _797 = _743 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _803 = _783 * _747;
    float _805 = _779 * _801;
    float _807 = _743 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = _793 * _763;
    float _813 = _793 * _747;
    float _815 = _799 * _805;
    float _817 = _747 * _799;
    float _819 = _783 * _763;
    float _821 = _763 * _799;
    float _823 = _793 * _815;
    float _825 = _783 * _815;
    float _827 = fma(_809, _811, _803);
    float _829 = -_813;
    float _831 = fma(_809, _819, _829);
    float _833 = -_819;
    float _835 = fma(_809, _813, _833);
    float _837 = -_805;
    float _839 = _809 * _837;
    float _841 = fma(_827, _785, _823);
    float _843 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _845 = fma(_809, _803, _811);
    float _847 = fma(_821, _785, _839);
    float _849 = fma(_831, _785, _825);
    float _851 = fma(_835, _843, _841);
    float _853 = _375 * _771;
    float _855 = fma(_817, _843, _847);
    float _857 = fma(_845, _843, _849);
    float _859 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _861 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _863 = fma(_373, _769, _853);
    float _865 = _795 + _733;
    float _867 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _859);
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _861);
    float _871 = fma(_377, _773, _863);
    float _873 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _875 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[24].z, _867);
    float _877 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[26].z, _869);
    float _879 = _871 + _775;
    float _881 = in.m_64.x;
    float _883 = in.m_64.y;
    float _885 = in.m_64.z;
    float _887 = in.m_64.w;
    float _889 = _875 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _891 = _877 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _893 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _873);
    float _895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _897 = _865 + _889;
    float _899 = _879 + _891;
    float _901 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[25].z, _893);
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _905 = _897 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _909 = _899 + _907;
    float _911 = _901 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _915 = _913 != 0;
    float _917 = _905 * _905;
    float _919 = _909 * _909;
    float _921 = _917 + _919;
    float _923 = sqrt(_921);
    float _925 = _375 * _883;
    float _927 = fma(_373, _881, _925);
    float _929 = fma(_377, _885, _927);
    float _931 = _929 + _887;
    float _933 = -_219;
    float _935 = _755 ? _933 : _219;
    bool _937 = _923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _939 = _931 + _911;
    bool _941 = !_915;
    float _943 = _941 ? _219 : _935;
    bool _945 = _413 > 0.5;
    float _947 = _883;
    float _949 = _935;
    float _951 = _925;
    float _953 = _931;
    if (!_937)
    {
        _947 = _919;
    }
    float _955 = _947;
    float _957 = _955;
    if (!_937)
    {
        _949 = _917;
    }
    float _959 = _949;
    float _961 = _959;
    if (!_937)
    {
        _385 = _897;
    }
    float _963 = _385;
    float _965 = _963;
    if (!_937)
    {
        _951 = _899;
    }
    float _967 = _951;
    float _969 = _967;
    if (!_937)
    {
        _231 = _939;
    }
    float _971 = _231;
    bool _973 = !_937;
    float _975 = _971;
    if (!_973)
    {
        float _977 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _981 = _923 + _979;
        float _983 = rsqrt(_921);
        float _985 = _981 * _977;
        float _987 = _939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _989 = _985 * 0.15915493667125701904296875;
        float _991 = _989 * 6.283185482025146484375;
        float _993 = sin(_991);
        float _995 = _989 * 6.283185482025146484375;
        float _997 = cos(_995);
        float _999 = fma(_993, _987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1001 = _983 * _999;
        float _1003 = _997 + (-1.0);
        float _1005 = fma(_905, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1007 = fma(_909, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1009 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1013 = _1005 + _1011;
        float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1017 = _1007 + _1015;
        float _1019 = fma(_939, _997, _1009);
        float _1021 = _1013 * _1013;
        float _1023 = _1017 * _1017;
        _975 = _1019;
        _961 = _1021;
        _957 = _1023;
        _969 = _1007;
        _965 = _1005;
    }
    float _1025 = _975;
    float _1027 = _961;
    float _1029 = _957;
    float _1031 = _969;
    float _1033 = _965;
    float _1035 = _943 + 0.5;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1039 = _1025 + _1037;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1043 = _1041 != 0;
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1047 = -_227;
    int _1049 = _945 ? as_type<int>(_1047) : as_type<int>(_227);
    float _1051 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1053 = fma(_1039, _1039, _1027);
    bool _1055 = !_1043;
    float _1057 = _1055 ? _227 : as_type<float>(_1049);
    float _1059 = _1051 * _895;
    float _1061 = _1053 + _1029;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1065 = -_1057;
    float _1067 = _1065 + 0.5;
    float _1069 = sqrt(_1061);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1085 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1097 = _1081 * _1045;
    out.m_66.x = _1085;
    out.m_66.y = _1087;
    out.m_66.z = _1089;
    out.m_66.w = _1083;
    bool _1099 = _1069 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1101 = isnan(_1069);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1107 = _1103 || _1105;
    out.m_68.x = _1091;
    out.m_68.y = _1093;
    out.m_68.z = _1095;
    out.m_70.x = _1059;
    out.m_70.y = _1097;
    float _1109 = _1081;
    if (!_1107)
    {
        _1109 = 1.0;
    }
    float _1111 = _1109;
    bool _1113 = !_1107;
    float _1115 = _1111;
    if (!_1113)
    {
        bool _1117 = _1069 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1119 = isnan(_1069);
        bool _1121 = _1117 || _1119;
        bool _1123 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1125 = _1121 || _1123;
        if (!_1125)
        {
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1129 = _1069 + _1127;
            float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1133 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1131;
            float _1135 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1137 = _1135 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1139 = 1.0 / _1133;
            float _1141 = _1129 * _1139;
            float _1143 = fma(_1141, _1137, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1115 = _1143;
            _1145 = true;
        }
        else
        {
            bool _1147 = _1069 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1149 = isnan(_1069);
            bool _1151 = _1147 || _1149;
            bool _1153 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1155 = _1151 || _1153;
            if (!_1155)
            {
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1159 = _1069 + _1157;
                float _1161 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1163 = _1161 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1165 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1167 = _1165 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1169 = 1.0 / _1163;
                float _1171 = _1159 * _1169;
                float _1173 = fma(_1171, _1167, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1115 = _1173;
                _1145 = true;
            }
            else
            {
                _1115 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1145 = false;
    float _1175 = _1115;
    float _1177 = _931 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1179 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1181 = _1031 + _1179;
    float _1183 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1177);
    float _1185 = _931 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1187 = fma(_1181, _1175, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1189 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1183);
    bool _1191 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.5);
    bool _1199 = _1195 || _1197;
    bool _1201 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan(0.5);
    bool _1209 = _1205 || _1207;
    float _1211 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1213 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1185);
    float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1217 = _1025 + _1215;
    float _1219 = 1.0 / _1211;
    float _1221 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1213);
    float _1223 = fma(_1217, _1175, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1225 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1227 = _1225 + _1211;
    float _1229 = _1211;
    float _1231 = _1175;
    float _1233 = _1187;
    if (_1209)
    {
        _1229 = _1223;
    }
    float _1235 = _1229;
    float _1237 = _1227 * _1219;
    float _1239 = _1237 * 0.5;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1243 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1241);
    float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1247 = _1033 + _1245;
    float _1249 = fma(_1247, _1175, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1251 = 1.0 / _1243;
    float _1253 = _1247;
    float _1255 = _1219;
    float _1257 = _1235;
    if (_1199)
    {
        _1231 = 1.0;
    }
    float _1259 = _1231;
    float _1261 = _1259;
    if (_1209)
    {
        _1253 = _1187;
    }
    float _1263 = _1253;
    float _1265 = _1263;
    if (_1209)
    {
        _1255 = _1249;
    }
    float _1267 = _1255;
    float _1269 = _1267;
    float _1271 = _1251;
    if (!_1209)
    {
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1275 = _931 + _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1279 = _865 + _1277;
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1283 = _1275 * _1275;
        float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1287 = _879 + _1285;
        float _1289 = fma(_1279, _1279, _1283);
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1293 = fma(_1287, _1287, _1289);
        float _1295 = sqrt(_1293);
        float _1297 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1299 = precise::min(_1295, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1301 = _1299 * _1291;
        float _1303 = -_865;
        float _1305 = _1303 + _1249;
        float _1307 = _1297 * _1301;
        float _1309 = -_931;
        float _1311 = _1309 + _1223;
        float _1313 = -_879;
        float _1315 = _1313 + _1187;
        float _1317 = fma(_1305, _1307, _865);
        float _1319 = fma(_1311, _1307, _931);
        float _1321 = fma(_1315, _1307, _879);
        _1257 = _1319;
        _1269 = _1317;
        _1265 = _1321;
    }
    float _1323 = _1257;
    float _1325 = _1269;
    float _1327 = _1265;
    if (_1199)
    {
        _953 = 1.0;
    }
    float _1329 = _953;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1333 = _1251 * _1331;
    float _1335 = _1329;
    if (!_1199)
    {
        float _1337 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1341 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1339;
        float _1343 = _1337 * 0.15915493667125701904296875;
        float _1345 = _1343 * 6.283185482025146484375;
        float _1347 = cos(_1345);
        float _1349 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1351 = _1349 * 0.15915493667125701904296875;
        float _1353 = _1343 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = 1.0 / _1347;
        float _1359 = _1351 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1355 * _1357;
        float _1365 = _1351 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1361 * _1363;
        float _1371 = 1.0 / _1341;
        float _1373 = 1.0 / _1369;
        float _1375 = _1367 * _1373;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = fma(_1333, _1375, _1377);
        float _1381 = _1379 * _1371;
        float _1383 = precise::clamp(_1381, 0.0, 1.0);
        _1271 = _1351;
        _1261 = _1383;
    }
    float _1385 = _1271;
    float _1387 = _1261;
    if (!_1199)
    {
        float _1389 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1391 = _1389 * 0.15915493667125701904296875;
        float _1393 = _1391 * 6.283185482025146484375;
        float _1395 = cos(_1393);
        float _1397 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1399 = _1397 * 0.15915493667125701904296875;
        float _1401 = _1391 * 6.283185482025146484375;
        float _1403 = sin(_1401);
        float _1405 = 1.0 / _1395;
        float _1407 = _1399 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        float _1411 = _1403 * _1405;
        float _1413 = _1399 * 6.283185482025146484375;
        float _1415 = sin(_1413);
        float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1419 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1417;
        float _1421 = _1409 * _1411;
        float _1423 = 1.0 / _1419;
        float _1425 = 1.0 / _1421;
        float _1427 = _1415 * _1425;
        float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1431 = fma(_1333, _1427, _1429);
        float _1433 = _1431 * _1423;
        float _1435 = precise::clamp(_1433, 0.0, 1.0);
        float _1437 = -_1435;
        float _1439 = _1437 + 1.0;
        _1335 = _1439;
    }
    float _1441 = _1335;
    float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1445 = _1323 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1449 = _1325 + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1453 = _1327 + _1451;
    float _1455 = _1445 * _1445;
    float _1457 = fma(_1449, _1449, _1455);
    float _1459 = fma(_1453, _1453, _1457);
    float _1461 = rsqrt(_1459);
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1465 = _1449 * _1463;
    float _1467 = _1453 * _1463;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 * _1467;
    float _1473 = _1469 + _1471;
    float _1475 = sqrt(_1473);
    bool _1477 = _1475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1481 = _1475 + _1479;
    float _1483 = _1453;
    float _1485 = _1455;
    float _1487 = _1481;
    float _1489 = _1463;
    float _1491 = _1465;
    if (_1477)
    {
        float _1493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1483 = _1493;
    }
    float _1495 = _1483;
    if (_1477)
    {
        float _1497 = rsqrt(_1473);
        _1485 = _1497;
    }
    float _1499 = _1485;
    float _1501 = _1499;
    if (_1477)
    {
        float _1503 = _1481 * _1495;
        _1487 = _1503;
    }
    float _1505 = _1487;
    if (_1477)
    {
        float _1507 = _1505 * 0.15915493667125701904296875;
        _1233 = _1507;
    }
    float _1509 = _1233;
    float _1511 = _1461;
    if (_1477)
    {
        float _1513 = _1509 * 6.283185482025146484375;
        float _1515 = sin(_1513);
        _1511 = _1515;
    }
    float _1517 = _1511;
    float _1519 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1521 = precise::max(0.0, _1519);
    float _1523 = _1385;
    float _1525 = _1521;
    float _1527 = _1519;
    if (_1477)
    {
        float _1529 = _1509 * 6.283185482025146484375;
        float _1531 = cos(_1529);
        _1523 = _1531;
    }
    float _1533 = _1523;
    float _1535 = -_1463;
    float _1537 = -_1521;
    float _1539 = fma(_1445, _1535, _1537);
    float _1541 = _1539;
    if (_1477)
    {
        float _1543 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1525 = _1543;
    }
    float _1545 = _1525;
    float _1547 = sqrt(_1459);
    float _1549 = _1517;
    float _1551 = _1545;
    if (_1477)
    {
        float _1553 = fma(_1517, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1549 = _1553;
    }
    float _1555 = _1549;
    float _1557 = _1555;
    if (_1477)
    {
        float _1559 = _1533 + (-1.0);
        _1527 = _1559;
    }
    float _1561 = _1527;
    float _1563 = _1561;
    if (_1477)
    {
        float _1565 = _1499 * _1555;
        _1489 = _1565;
    }
    float _1567 = _1489;
    if (!_1477)
    {
        _1501 = _1539;
    }
    float _1569 = _1501;
    float _1571 = _1569;
    if (_1477)
    {
        float _1573 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1573;
    }
    float _1575 = _1551;
    if (_1477)
    {
        float _1577 = _1465 * _1567;
        _1491 = _1577;
    }
    float _1579 = _1491;
    if (!_1477)
    {
        _1557 = _1467;
    }
    float _1581 = _1557;
    float _1583 = _1581;
    if (_1477)
    {
        float _1585 = _1467 * _1567;
        _1583 = _1585;
    }
    float _1587 = _1583;
    if (!_1477)
    {
        _1563 = _1469;
    }
    float _1589 = _1563;
    float _1591 = _1589;
    if (_1477)
    {
        float _1593 = fma(_1539, _1533, _1575);
        _1571 = _1593;
    }
    float _1595 = _1571;
    if (_1477)
    {
        float _1597 = _1579 * _1579;
        _1591 = _1597;
    }
    float _1599 = _1591;
    if (!_1477)
    {
        _1541 = _1471;
    }
    float _1601 = _1541;
    float _1603 = _1601;
    if (_1477)
    {
        float _1605 = _1587 * _1587;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = fma(_1595, _1595, _1599);
    float _1611 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1613 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1615 = _1609 + _1607;
    float _1617 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1611);
    float _1619 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1623 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1621);
    float _1625 = precise::clamp(_1623, 0.0, 1.0);
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1629 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1617);
    float _1631 = rsqrt(_1615);
    float _1633 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1619);
    float _1635 = -_1625;
    float _1637 = _1635 + 1.0;
    float _1639 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1641 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1643 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1613);
    float _1645 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1633);
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1649 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1641);
    float _1651 = abs(_1637);
    float _1653 = log2(_1651);
    float _1655 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1643);
    float _1657 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1659 = -_1647;
    float _1661 = fma(_1659, _1627, 1.0);
    float _1663 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1649);
    float _1665 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1669 = _1631 * _1579;
    float _1671 = _1631 * _1595;
    float _1673 = _1631 * _1587;
    float _1675 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1667);
    float _1677 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1679 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1681 = log2(_1661);
    float _1683 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1675);
    float _1685 = -_1677;
    float _1687 = fma(_1671, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1685);
    float _1689 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1691 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1693 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1683);
    float _1695 = -_1673;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1687);
    float _1699 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1701 = 1.0 / _1693;
    float _1703 = fma(_1697, -0.5, 0.5);
    float _1705 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1699);
    float _1707 = fma(_1697, 0.5, 0.5);
    float _1709 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1691);
    float _1711 = _1671 + 1.0;
    float _1713 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1705);
    float _1715 = fma(_1707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1717 = exp2(_1689);
    float _1719 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1709);
    float _1721 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1713);
    float _1723 = fma(_1707, _1715, -0.212114393711090087890625);
    float _1725 = _1681 * 0.693147182464599609375;
    float _1727 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1719);
    float _1729 = fma(_1707, _1723, 1.570728778839111328125);
    float _1731 = sqrt(_1703);
    float _1733 = _1721 * _1701;
    float _1735 = _1727 * _1701;
    float _1737 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1739 = fma(_1733, 0.5, 0.5);
    float _1741 = fma(_1735, -0.5, 0.5);
    float _1743 = -_1671;
    float _1745 = fma(_1717, _1711, _1743);
    float3 _4419 = float3(_1739, _1741, _1737);
    float _1747 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4419, float3(0.0), isnan(_4419)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4419, float3(0.0), isnan(_4419)), level(0.0)).x;
    float3 _4430 = float3(_1739, _1741, _1737);
    float4 _1750 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).xyzw;
    float _1752 = _1750.x;
    float _1754 = _1750.y;
    float _1756 = _1750.z;
    float _1758 = _1750.w;
    float _1760 = fma(_1745, 0.5, 0.5);
    float _1762 = _1731 * 0.636619746685028076171875;
    float _1764 = -_1729;
    float _1766 = fma(_1762, _1764, 1.0);
    float2 _4457 = float2(_1766, _1760);
    float3 _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4457, float2(0.0), isnan(_4457)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4457, float2(0.0), isnan(_4457)), level(0.0)).xyz;
    float _1772 = _1770.x;
    float _1774 = _1770.y;
    float _1776 = _1770.z;
    float _1778 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1780 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1782 = _1387 * _1441;
    bool _1784 = _1387 > 0.0;
    bool _1786 = isnan(_1387);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan(0.0);
    bool _1792 = _1788 || _1790;
    float _1794 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1780);
    float _1796 = exp2(_1778);
    float _1798 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1800 = _1441 <= 0.0;
    bool _1802 = !_1792;
    bool _1804 = _1800 || _1802;
    float _1806 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1794);
    float _1808 = _381 * _1798;
    float _1810 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1806);
    float _1812 = _1810 + _1693;
    out.gl_Position.x = _1721;
    out.gl_Position.y = _1727;
    out.gl_Position.z = _1810;
    out.gl_Position.w = _1693;
    float _1814 = _1812 * 0.5;
    float _1816 = -_1796;
    float _1818 = _1816 + 1.0;
    float _1820 = _1808 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.z = _1814;
    out.m_72.w = _1693;
    float _1824 = -_1822;
    float _1826 = _1824 + 1.0;
    out.m_47.x = _1820;
    float _1828 = _1822 * _1747;
    float _1830 = _1758 * _1828;
    float _1832 = _1758 * _1826;
    float _1834 = _1776 * _1828;
    float _1836 = fma(_1772, _1830, _1752);
    float _1838 = fma(_1774, _1830, _1754);
    float _1840 = fma(_1758, _1834, _1756);
    out.m_74.x = _1836;
    out.m_74.y = _1838;
    out.m_74.z = _1840;
    out.m_74.w = _1832;
    if (!_1804)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1842 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1842;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1145 = false;
    bool _403 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1899 = as_type<float>(_109);
        out.gl_Position.z = _1899;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    float _131 = _127;
    if (_123)
    {
        float _133 = float(_93);
        _129 = _133;
    }
    float _135 = _129;
    bool _137 = _127 >= _135;
    bool _139 = !_123;
    bool _141 = _137 || _139;
    if (_141)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _103;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1968 = as_type<float>(_147);
        out.gl_Position.z = _1968;
    }
    if (_141)
    {
        return out;
    }
    float _149 = in.m_51.x;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = _153 * _151;
    float _171 = 0.0;
    if (!_167)
    {
        float _173 = _157 * _157;
        float _175 = _173 * 0.5;
        _171 = _175;
    }
    float _177 = _171;
    float _179 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _181 = _177;
    float _183 = _179;
    if (!_167)
    {
        float _185 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _185;
    }
    float _187 = _181;
    float _189 = in.m_49.x;
    float _191 = in.m_49.y;
    float _193 = in.m_49.z;
    float _195 = _179 * 6.283185482025146484375;
    float _197 = floor(_179);
    int _199 = as_type<int>(_155) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_155) & 2;
    bool _205 = _203 != 0;
    float _207 = _195 * 0.15915493667125701904296875;
    int _209 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _211 = _209 != 0;
    float _213 = _207 * 6.283185482025146484375;
    float _215 = cos(_213);
    bool _217 = !_201;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = -_197;
    float _223 = _179 + _221;
    bool _225 = !_205;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _187;
    float _231 = _219;
    if (!_167)
    {
        _183 = _157;
    }
    float _233 = _183;
    bool _235 = !_167;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _157 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _157);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _267;
    }
    float _269 = _229;
    bool _271 = !_167;
    if (!_271)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _157 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _237 = _291;
    }
    float _293 = _237;
    float _295 = in.m_56.w;
    float _297 = fma(_215, 0.5, 0.5);
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _301 = _299 != 0;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _305 = _303 != 0;
    float _307 = in.m_44.x;
    float _309 = in.m_44.y;
    float _311 = in.m_44.z;
    bool _313 = _223 < 0.5;
    float _315 = float(_313);
    float _317 = -_223;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _321 = !_211;
    int _323 = _321 ? 0 : 1;
    float _325 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _327 = !_301;
    int _329 = _327 ? 0 : 1;
    float _331 = -_315;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = -_297;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _339 = abs(_323);
    int _341 = abs(_329);
    float _343 = fma(_293, _189, _325);
    bool _345 = !_305;
    int _347 = _345 ? 0 : 1;
    float _349 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _353 = fma(_293, _191, _349);
    int _355 = abs(_347);
    float _357 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = float(_341);
    float _361 = float(_339);
    float _363 = fma(_293, _193, _357);
    float _365 = abs(_319);
    float _367 = _359 * _365;
    float _369 = float(_355);
    float _371 = fma(_361, _337, _367);
    float _373 = fma(_343, _295, _307);
    float _375 = fma(_353, _295, _309);
    float _377 = fma(_363, _295, _311);
    float _379 = abs(_333);
    float _381 = fma(_369, _379, _371);
    bool _383 = !_351;
    float _385 = _377;
    float _401;
    if (!_383)
    {
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _389 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_93);
        float _407 = 1.0 / _405;
        float _409 = _127 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_51.y;
    float _415 = _149 * 2.0;
    float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _419 = log2(_417);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _427 = _425 != 0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _431 = _429 != 0;
    float _433 = in.m_51.z;
    bool _435 = !_431;
    int _437 = _435 ? 0 : 1;
    float _439 = floor(_415);
    int _441 = abs(_437);
    float _443 = _419 * _127;
    float _445 = _413 * 2.0;
    float _447 = exp2(_443);
    bool _449 = _439 > 0.0;
    float _451 = _433 * 2.0;
    bool _453 = _439 >= 0.0;
    bool _455 = isnan(_439);
    bool _457 = _453 || _455;
    bool _459 = isnan(0.0);
    bool _461 = _457 || _459;
    float _463 = _149 + _413;
    float _465 = _413 + _433;
    float _467 = floor(_445);
    int _469 = _461 ? 0 : 1;
    float _471 = _463 + (-1.0);
    float _473 = _465 + (-1.0);
    int _475 = ~_469;
    int _477 = _475 + 1;
    int _479 = _477 + 1;
    int _481 = _479;
    if (!_449)
    {
        int _483 = ~_469;
        int _485 = _483 + 1;
        _481 = _485;
    }
    int _487 = _481;
    float _489 = floor(_451);
    float _491 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _493 = -_447;
    float _495 = _493 + 1.0;
    bool _497 = _467 > 0.0;
    bool _499 = _467 >= 0.0;
    bool _501 = isnan(_467);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    float _509 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _511 = !_423;
    int _513 = _511 ? 0 : 1;
    int _515 = _507 ? 0 : 1;
    bool _517 = _489 > 0.0;
    bool _519 = _489 >= 0.0;
    bool _521 = isnan(_489);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    int _529 = ~_515;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    int _535 = _527 ? 0 : 1;
    int _537 = _533;
    if (!_497)
    {
        int _539 = ~_515;
        int _541 = _539 + 1;
        _537 = _541;
    }
    int _543 = _537;
    bool _545 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _547 = isnan(1.0);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _553 = _549 || _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _557 = 1.0 + _555;
    int _559 = ~_535;
    int _561 = _559 + 1;
    int _563 = _561 + 1;
    int _565 = _563;
    if (!_517)
    {
        int _567 = ~_535;
        int _569 = _567 + 1;
        _565 = _569;
    }
    int _571 = _565;
    float _573 = 1.0 / _557;
    bool _575 = !_427;
    int _577 = _575 ? 0 : 1;
    float _579 = in.m_58.x;
    float _581 = in.m_58.y;
    float _583 = in.m_58.z;
    int _585 = abs(_513);
    int _587 = abs(_577);
    bool _589 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _597 = _593 || _595;
    float _599 = float(_587);
    float _601 = float(_487);
    float _603 = _597 ? _495 : 0.0;
    float _605 = float(_585);
    float _607 = _599 * _601;
    float _609 = float(_571);
    if (_553)
    {
        float _611 = _603 * _573;
        _131 = _611;
    }
    float _613 = _131;
    float _615 = _607 * (-2.0);
    float _617 = _413 + (-0.5);
    float _619 = _605 * _609;
    float _621 = float(_441);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _623;
    float _627 = fma(_615, _581, _581);
    float _629 = fma(_491, _615, _491);
    float _631 = float(_543);
    float _633 = _149 + _433;
    float _635 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[196].y, _627);
    float _637 = 1.0 / _625;
    float _639 = _619 * (-2.0);
    float _641 = fma(_629, _613, _635);
    float _643 = _621 * _631;
    float _645 = _633 + (-1.0);
    float _647 = fma(_509, _639, _509);
    float _649 = _641 * 0.15915493667125701904296875;
    float _651 = fma(_639, _579, _579);
    float _653 = _149 + (-0.5);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _657 = _643 * (-2.0);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _661 = _411 + _659;
    float _663 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].x, _651);
    bool _665 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _667 = isnan(_411);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_657, _583, _583);
    float _679 = fma(_655, _657, _655);
    float _681 = _661 * _637;
    float _683 = fma(_647, _613, _663);
    bool _685 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _687 = isnan(_411);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = in.m_56.x;
    float _699 = in.m_56.y;
    float _701 = _433 + (-0.5);
    float _703 = _683 * 0.15915493667125701904296875;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _705;
    float _709 = -_695;
    float _711 = _709 + 1.0;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _713;
    float _717 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].z, _677);
    float _719 = fma(_707, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _721 = _675 * _711;
    float _723 = fma(_715, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _725 = fma(_679, _613, _717);
    float _727 = in.m_60.x;
    float _729 = in.m_60.y;
    float _731 = in.m_60.z;
    float _733 = in.m_60.w;
    float _735 = -_675;
    float _737 = _735 + 1.0;
    float _739 = _719 * _721;
    float _741 = _723 * _721;
    float _743 = _725 * 0.15915493667125701904296875;
    float _745 = _649 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[143].x, _739);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[143].y, _741);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    bool _755 = _149 > 0.5;
    float _757 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[144].x, _749);
    float _759 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[144].y, _751);
    float _761 = _649 * 6.283185482025146484375;
    float _763 = cos(_761);
    float _765 = _757 * _697;
    float _767 = _759 * _699;
    float _769 = in.m_62.x;
    float _771 = in.m_62.y;
    float _773 = in.m_62.z;
    float _775 = in.m_62.w;
    float _777 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _779 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _781 = _703 * 6.283185482025146484375;
    float _783 = sin(_781);
    float _785 = _777 * _753;
    float _787 = _375 * _729;
    float _789 = fma(_373, _727, _787);
    float _791 = _703 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = fma(_377, _731, _789);
    float _797 = _743 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _803 = _783 * _747;
    float _805 = _779 * _801;
    float _807 = _743 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = _793 * _763;
    float _813 = _793 * _747;
    float _815 = _799 * _805;
    float _817 = _747 * _799;
    float _819 = _783 * _763;
    float _821 = _763 * _799;
    float _823 = _793 * _815;
    float _825 = _783 * _815;
    float _827 = fma(_809, _811, _803);
    float _829 = -_813;
    float _831 = fma(_809, _819, _829);
    float _833 = -_819;
    float _835 = fma(_809, _813, _833);
    float _837 = -_805;
    float _839 = _809 * _837;
    float _841 = fma(_827, _785, _823);
    float _843 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _845 = fma(_809, _803, _811);
    float _847 = fma(_821, _785, _839);
    float _849 = fma(_831, _785, _825);
    float _851 = fma(_835, _843, _841);
    float _853 = _375 * _771;
    float _855 = fma(_817, _843, _847);
    float _857 = fma(_845, _843, _849);
    float _859 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _861 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _863 = fma(_373, _769, _853);
    float _865 = _795 + _733;
    float _867 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _859);
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _861);
    float _871 = fma(_377, _773, _863);
    float _873 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _875 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[24].z, _867);
    float _877 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[26].z, _869);
    float _879 = _871 + _775;
    float _881 = in.m_64.x;
    float _883 = in.m_64.y;
    float _885 = in.m_64.z;
    float _887 = in.m_64.w;
    float _889 = _875 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _891 = _877 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _893 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _873);
    float _895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _897 = _865 + _889;
    float _899 = _879 + _891;
    float _901 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[25].z, _893);
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _905 = _897 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _909 = _899 + _907;
    float _911 = _901 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _915 = _913 != 0;
    float _917 = _905 * _905;
    float _919 = _909 * _909;
    float _921 = _917 + _919;
    float _923 = sqrt(_921);
    float _925 = _375 * _883;
    float _927 = fma(_373, _881, _925);
    float _929 = fma(_377, _885, _927);
    float _931 = _929 + _887;
    float _933 = -_219;
    float _935 = _755 ? _933 : _219;
    bool _937 = _923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _939 = _931 + _911;
    bool _941 = !_915;
    float _943 = _941 ? _219 : _935;
    bool _945 = _413 > 0.5;
    float _947 = _883;
    float _949 = _935;
    float _951 = _925;
    float _953 = _931;
    if (!_937)
    {
        _947 = _919;
    }
    float _955 = _947;
    float _957 = _955;
    if (!_937)
    {
        _949 = _917;
    }
    float _959 = _949;
    float _961 = _959;
    if (!_937)
    {
        _385 = _897;
    }
    float _963 = _385;
    float _965 = _963;
    if (!_937)
    {
        _951 = _899;
    }
    float _967 = _951;
    float _969 = _967;
    if (!_937)
    {
        _231 = _939;
    }
    float _971 = _231;
    bool _973 = !_937;
    float _975 = _971;
    if (!_973)
    {
        float _977 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _981 = _923 + _979;
        float _983 = rsqrt(_921);
        float _985 = _981 * _977;
        float _987 = _939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _989 = _985 * 0.15915493667125701904296875;
        float _991 = _989 * 6.283185482025146484375;
        float _993 = sin(_991);
        float _995 = _989 * 6.283185482025146484375;
        float _997 = cos(_995);
        float _999 = fma(_993, _987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1001 = _983 * _999;
        float _1003 = _997 + (-1.0);
        float _1005 = fma(_905, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1007 = fma(_909, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1009 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1013 = _1005 + _1011;
        float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1017 = _1007 + _1015;
        float _1019 = fma(_939, _997, _1009);
        float _1021 = _1013 * _1013;
        float _1023 = _1017 * _1017;
        _975 = _1019;
        _961 = _1021;
        _957 = _1023;
        _969 = _1007;
        _965 = _1005;
    }
    float _1025 = _975;
    float _1027 = _961;
    float _1029 = _957;
    float _1031 = _969;
    float _1033 = _965;
    float _1035 = _943 + 0.5;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1039 = _1025 + _1037;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1043 = _1041 != 0;
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1047 = -_227;
    int _1049 = _945 ? as_type<int>(_1047) : as_type<int>(_227);
    float _1051 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1053 = fma(_1039, _1039, _1027);
    bool _1055 = !_1043;
    float _1057 = _1055 ? _227 : as_type<float>(_1049);
    float _1059 = _1051 * _895;
    float _1061 = _1053 + _1029;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1065 = -_1057;
    float _1067 = _1065 + 0.5;
    float _1069 = sqrt(_1061);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1085 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1097 = _1081 * _1045;
    out.m_66.x = _1085;
    out.m_66.y = _1087;
    out.m_66.z = _1089;
    out.m_66.w = _1083;
    bool _1099 = _1069 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1101 = isnan(_1069);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1107 = _1103 || _1105;
    out.m_68.x = _1091;
    out.m_68.y = _1093;
    out.m_68.z = _1095;
    out.m_70.x = _1059;
    out.m_70.y = _1097;
    float _1109 = _1081;
    if (!_1107)
    {
        _1109 = 1.0;
    }
    float _1111 = _1109;
    bool _1113 = !_1107;
    float _1115 = _1111;
    if (!_1113)
    {
        bool _1117 = _1069 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1119 = isnan(_1069);
        bool _1121 = _1117 || _1119;
        bool _1123 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1125 = _1121 || _1123;
        if (!_1125)
        {
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1129 = _1069 + _1127;
            float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1133 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1131;
            float _1135 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1137 = _1135 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1139 = 1.0 / _1133;
            float _1141 = _1129 * _1139;
            float _1143 = fma(_1141, _1137, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1115 = _1143;
            _1145 = true;
        }
        else
        {
            bool _1147 = _1069 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1149 = isnan(_1069);
            bool _1151 = _1147 || _1149;
            bool _1153 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1155 = _1151 || _1153;
            if (!_1155)
            {
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1159 = _1069 + _1157;
                float _1161 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1163 = _1161 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1165 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1167 = _1165 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1169 = 1.0 / _1163;
                float _1171 = _1159 * _1169;
                float _1173 = fma(_1171, _1167, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1115 = _1173;
                _1145 = true;
            }
            else
            {
                _1115 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1145 = false;
    float _1175 = _1115;
    float _1177 = _931 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1179 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1181 = _1031 + _1179;
    float _1183 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1177);
    float _1185 = _931 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1187 = fma(_1181, _1175, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1189 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1183);
    bool _1191 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.5);
    bool _1199 = _1195 || _1197;
    bool _1201 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan(0.5);
    bool _1209 = _1205 || _1207;
    float _1211 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1213 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1185);
    float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1217 = _1025 + _1215;
    float _1219 = 1.0 / _1211;
    float _1221 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1213);
    float _1223 = fma(_1217, _1175, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1225 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1227 = _1225 + _1211;
    float _1229 = _1211;
    float _1231 = _1175;
    float _1233 = _1187;
    if (_1209)
    {
        _1229 = _1223;
    }
    float _1235 = _1229;
    float _1237 = _1227 * _1219;
    float _1239 = _1237 * 0.5;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1243 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1241);
    float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1247 = _1033 + _1245;
    float _1249 = fma(_1247, _1175, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1251 = 1.0 / _1243;
    float _1253 = _1247;
    float _1255 = _1219;
    float _1257 = _1235;
    if (_1199)
    {
        _1231 = 1.0;
    }
    float _1259 = _1231;
    float _1261 = _1259;
    if (_1209)
    {
        _1253 = _1187;
    }
    float _1263 = _1253;
    float _1265 = _1263;
    if (_1209)
    {
        _1255 = _1249;
    }
    float _1267 = _1255;
    float _1269 = _1267;
    float _1271 = _1251;
    if (!_1209)
    {
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1275 = _931 + _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1279 = _865 + _1277;
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1283 = _1275 * _1275;
        float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1287 = _879 + _1285;
        float _1289 = fma(_1279, _1279, _1283);
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1293 = fma(_1287, _1287, _1289);
        float _1295 = sqrt(_1293);
        float _1297 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1299 = precise::min(_1295, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1301 = _1299 * _1291;
        float _1303 = -_865;
        float _1305 = _1303 + _1249;
        float _1307 = _1297 * _1301;
        float _1309 = -_931;
        float _1311 = _1309 + _1223;
        float _1313 = -_879;
        float _1315 = _1313 + _1187;
        float _1317 = fma(_1305, _1307, _865);
        float _1319 = fma(_1311, _1307, _931);
        float _1321 = fma(_1315, _1307, _879);
        _1257 = _1319;
        _1269 = _1317;
        _1265 = _1321;
    }
    float _1323 = _1257;
    float _1325 = _1269;
    float _1327 = _1265;
    if (_1199)
    {
        _953 = 1.0;
    }
    float _1329 = _953;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1333 = _1251 * _1331;
    float _1335 = _1329;
    if (!_1199)
    {
        float _1337 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1341 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1339;
        float _1343 = _1337 * 0.15915493667125701904296875;
        float _1345 = _1343 * 6.283185482025146484375;
        float _1347 = cos(_1345);
        float _1349 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1351 = _1349 * 0.15915493667125701904296875;
        float _1353 = _1343 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = 1.0 / _1347;
        float _1359 = _1351 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1355 * _1357;
        float _1365 = _1351 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1361 * _1363;
        float _1371 = 1.0 / _1341;
        float _1373 = 1.0 / _1369;
        float _1375 = _1367 * _1373;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = fma(_1333, _1375, _1377);
        float _1381 = _1379 * _1371;
        float _1383 = precise::clamp(_1381, 0.0, 1.0);
        _1271 = _1351;
        _1261 = _1383;
    }
    float _1385 = _1271;
    float _1387 = _1261;
    if (!_1199)
    {
        float _1389 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1391 = _1389 * 0.15915493667125701904296875;
        float _1393 = _1391 * 6.283185482025146484375;
        float _1395 = cos(_1393);
        float _1397 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1399 = _1397 * 0.15915493667125701904296875;
        float _1401 = _1391 * 6.283185482025146484375;
        float _1403 = sin(_1401);
        float _1405 = 1.0 / _1395;
        float _1407 = _1399 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        float _1411 = _1403 * _1405;
        float _1413 = _1399 * 6.283185482025146484375;
        float _1415 = sin(_1413);
        float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1419 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1417;
        float _1421 = _1409 * _1411;
        float _1423 = 1.0 / _1419;
        float _1425 = 1.0 / _1421;
        float _1427 = _1415 * _1425;
        float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1431 = fma(_1333, _1427, _1429);
        float _1433 = _1431 * _1423;
        float _1435 = precise::clamp(_1433, 0.0, 1.0);
        float _1437 = -_1435;
        float _1439 = _1437 + 1.0;
        _1335 = _1439;
    }
    float _1441 = _1335;
    float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1445 = _1323 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1449 = _1325 + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1453 = _1327 + _1451;
    float _1455 = _1445 * _1445;
    float _1457 = fma(_1449, _1449, _1455);
    float _1459 = fma(_1453, _1453, _1457);
    float _1461 = rsqrt(_1459);
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1465 = _1449 * _1463;
    float _1467 = _1453 * _1463;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 * _1467;
    float _1473 = _1469 + _1471;
    float _1475 = sqrt(_1473);
    bool _1477 = _1475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1481 = _1475 + _1479;
    float _1483 = _1453;
    float _1485 = _1455;
    float _1487 = _1481;
    float _1489 = _1463;
    float _1491 = _1465;
    if (_1477)
    {
        float _1493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1483 = _1493;
    }
    float _1495 = _1483;
    if (_1477)
    {
        float _1497 = rsqrt(_1473);
        _1485 = _1497;
    }
    float _1499 = _1485;
    float _1501 = _1499;
    if (_1477)
    {
        float _1503 = _1481 * _1495;
        _1487 = _1503;
    }
    float _1505 = _1487;
    if (_1477)
    {
        float _1507 = _1505 * 0.15915493667125701904296875;
        _1233 = _1507;
    }
    float _1509 = _1233;
    float _1511 = _1461;
    if (_1477)
    {
        float _1513 = _1509 * 6.283185482025146484375;
        float _1515 = sin(_1513);
        _1511 = _1515;
    }
    float _1517 = _1511;
    float _1519 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1521 = precise::max(0.0, _1519);
    float _1523 = _1385;
    float _1525 = _1521;
    float _1527 = _1519;
    if (_1477)
    {
        float _1529 = _1509 * 6.283185482025146484375;
        float _1531 = cos(_1529);
        _1523 = _1531;
    }
    float _1533 = _1523;
    float _1535 = -_1463;
    float _1537 = -_1521;
    float _1539 = fma(_1445, _1535, _1537);
    float _1541 = _1539;
    if (_1477)
    {
        float _1543 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1525 = _1543;
    }
    float _1545 = _1525;
    float _1547 = sqrt(_1459);
    float _1549 = _1517;
    float _1551 = _1545;
    if (_1477)
    {
        float _1553 = fma(_1517, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1549 = _1553;
    }
    float _1555 = _1549;
    float _1557 = _1555;
    if (_1477)
    {
        float _1559 = _1533 + (-1.0);
        _1527 = _1559;
    }
    float _1561 = _1527;
    float _1563 = _1561;
    if (_1477)
    {
        float _1565 = _1499 * _1555;
        _1489 = _1565;
    }
    float _1567 = _1489;
    if (!_1477)
    {
        _1501 = _1539;
    }
    float _1569 = _1501;
    float _1571 = _1569;
    if (_1477)
    {
        float _1573 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1573;
    }
    float _1575 = _1551;
    if (_1477)
    {
        float _1577 = _1465 * _1567;
        _1491 = _1577;
    }
    float _1579 = _1491;
    if (!_1477)
    {
        _1557 = _1467;
    }
    float _1581 = _1557;
    float _1583 = _1581;
    if (_1477)
    {
        float _1585 = _1467 * _1567;
        _1583 = _1585;
    }
    float _1587 = _1583;
    if (!_1477)
    {
        _1563 = _1469;
    }
    float _1589 = _1563;
    float _1591 = _1589;
    if (_1477)
    {
        float _1593 = fma(_1539, _1533, _1575);
        _1571 = _1593;
    }
    float _1595 = _1571;
    if (_1477)
    {
        float _1597 = _1579 * _1579;
        _1591 = _1597;
    }
    float _1599 = _1591;
    if (!_1477)
    {
        _1541 = _1471;
    }
    float _1601 = _1541;
    float _1603 = _1601;
    if (_1477)
    {
        float _1605 = _1587 * _1587;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = fma(_1595, _1595, _1599);
    float _1611 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1613 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1615 = _1609 + _1607;
    float _1617 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1611);
    float _1619 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1623 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1621);
    float _1625 = precise::clamp(_1623, 0.0, 1.0);
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1629 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1617);
    float _1631 = rsqrt(_1615);
    float _1633 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1619);
    float _1635 = -_1625;
    float _1637 = _1635 + 1.0;
    float _1639 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1641 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1643 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1613);
    float _1645 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1633);
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1649 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1641);
    float _1651 = abs(_1637);
    float _1653 = log2(_1651);
    float _1655 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1643);
    float _1657 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1659 = -_1647;
    float _1661 = fma(_1659, _1627, 1.0);
    float _1663 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1649);
    float _1665 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1669 = _1631 * _1579;
    float _1671 = _1631 * _1595;
    float _1673 = _1631 * _1587;
    float _1675 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1667);
    float _1677 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1679 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1681 = log2(_1661);
    float _1683 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1675);
    float _1685 = -_1677;
    float _1687 = fma(_1671, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1685);
    float _1689 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1691 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1693 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1683);
    float _1695 = -_1673;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1687);
    float _1699 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1701 = 1.0 / _1693;
    float _1703 = fma(_1697, -0.5, 0.5);
    float _1705 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1699);
    float _1707 = fma(_1697, 0.5, 0.5);
    float _1709 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1691);
    float _1711 = _1671 + 1.0;
    float _1713 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1705);
    float _1715 = fma(_1707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1717 = exp2(_1689);
    float _1719 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1709);
    float _1721 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1713);
    float _1723 = fma(_1707, _1715, -0.212114393711090087890625);
    float _1725 = _1681 * 0.693147182464599609375;
    float _1727 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1719);
    float _1729 = fma(_1707, _1723, 1.570728778839111328125);
    float _1731 = sqrt(_1703);
    float _1733 = _1721 * _1701;
    float _1735 = _1727 * _1701;
    float _1737 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1739 = fma(_1733, 0.5, 0.5);
    float _1741 = fma(_1735, -0.5, 0.5);
    float _1743 = -_1671;
    float _1745 = fma(_1717, _1711, _1743);
    float3 _4419 = float3(_1739, _1741, _1737);
    float _1747 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4419, float3(0.0), isnan(_4419)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4419, float3(0.0), isnan(_4419)), level(0.0)).x;
    float3 _4430 = float3(_1739, _1741, _1737);
    float4 _1750 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).xyzw;
    float _1752 = _1750.x;
    float _1754 = _1750.y;
    float _1756 = _1750.z;
    float _1758 = _1750.w;
    float _1760 = fma(_1745, 0.5, 0.5);
    float _1762 = _1731 * 0.636619746685028076171875;
    float _1764 = -_1729;
    float _1766 = fma(_1762, _1764, 1.0);
    float2 _4457 = float2(_1766, _1760);
    float3 _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4457, float2(0.0), isnan(_4457)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4457, float2(0.0), isnan(_4457)), level(0.0)).xyz;
    float _1772 = _1770.x;
    float _1774 = _1770.y;
    float _1776 = _1770.z;
    float _1778 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1780 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1782 = _1387 * _1441;
    bool _1784 = _1387 > 0.0;
    bool _1786 = isnan(_1387);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan(0.0);
    bool _1792 = _1788 || _1790;
    float _1794 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1780);
    float _1796 = exp2(_1778);
    float _1798 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1800 = _1441 <= 0.0;
    bool _1802 = !_1792;
    bool _1804 = _1800 || _1802;
    float _1806 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1794);
    float _1808 = _381 * _1798;
    float _1810 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1806);
    float _1812 = _1810 + _1693;
    out.gl_Position.x = _1721;
    out.gl_Position.y = _1727;
    out.gl_Position.z = _1810;
    out.gl_Position.w = _1693;
    float _1814 = _1812 * 0.5;
    float _1816 = -_1796;
    float _1818 = _1816 + 1.0;
    float _1820 = _1808 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.z = _1814;
    out.m_72.w = _1693;
    float _1824 = -_1822;
    float _1826 = _1824 + 1.0;
    out.m_47.x = _1820;
    float _1828 = _1822 * _1747;
    float _1830 = _1758 * _1828;
    float _1832 = _1758 * _1826;
    float _1834 = _1776 * _1828;
    float _1836 = fma(_1772, _1830, _1752);
    float _1838 = fma(_1774, _1830, _1754);
    float _1840 = fma(_1758, _1834, _1756);
    out.m_74.x = _1836;
    out.m_74.y = _1838;
    out.m_74.z = _1840;
    out.m_74.w = _1832;
    if (!_1804)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1842 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1842;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1145 = false;
    bool _403 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1899 = as_type<float>(_109);
        out.gl_Position.z = _1899;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    float _131 = _127;
    if (_123)
    {
        float _133 = float(_93);
        _129 = _133;
    }
    float _135 = _129;
    bool _137 = _127 >= _135;
    bool _139 = !_123;
    bool _141 = _137 || _139;
    if (_141)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _103;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1968 = as_type<float>(_147);
        out.gl_Position.z = _1968;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_51.x;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = _153 * _151;
    float _171 = 0.0;
    if (!_167)
    {
        float _173 = _157 * _157;
        float _175 = _173 * 0.5;
        _171 = _175;
    }
    float _177 = _171;
    float _179 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _181 = _177;
    float _183 = _179;
    if (!_167)
    {
        float _185 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _185;
    }
    float _187 = _181;
    float _189 = in.m_49.x;
    float _191 = in.m_49.y;
    float _193 = in.m_49.z;
    float _195 = _179 * 6.283185482025146484375;
    float _197 = floor(_179);
    int _199 = as_type<int>(_155) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_155) & 2;
    bool _205 = _203 != 0;
    float _207 = _195 * 0.15915493667125701904296875;
    int _209 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _211 = _209 != 0;
    float _213 = _207 * 6.283185482025146484375;
    float _215 = cos(_213);
    bool _217 = !_201;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = -_197;
    float _223 = _179 + _221;
    bool _225 = !_205;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _187;
    float _231 = _219;
    if (!_167)
    {
        _183 = _157;
    }
    float _233 = _183;
    bool _235 = !_167;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _157 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _157);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _267;
    }
    float _269 = _229;
    bool _271 = !_167;
    if (!_271)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _157 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _237 = _291;
    }
    float _293 = _237;
    float _295 = in.m_56.w;
    float _297 = fma(_215, 0.5, 0.5);
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _301 = _299 != 0;
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _305 = _303 != 0;
    float _307 = in.m_44.x;
    float _309 = in.m_44.y;
    float _311 = in.m_44.z;
    bool _313 = _223 < 0.5;
    float _315 = float(_313);
    float _317 = -_223;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _321 = !_211;
    int _323 = _321 ? 0 : 1;
    float _325 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _327 = !_301;
    int _329 = _327 ? 0 : 1;
    float _331 = -_315;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = -_297;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _339 = abs(_323);
    int _341 = abs(_329);
    float _343 = fma(_293, _189, _325);
    bool _345 = !_305;
    int _347 = _345 ? 0 : 1;
    float _349 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _351 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _353 = fma(_293, _191, _349);
    int _355 = abs(_347);
    float _357 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = float(_341);
    float _361 = float(_339);
    float _363 = fma(_293, _193, _357);
    float _365 = abs(_319);
    float _367 = _359 * _365;
    float _369 = float(_355);
    float _371 = fma(_361, _337, _367);
    float _373 = fma(_343, _295, _307);
    float _375 = fma(_353, _295, _309);
    float _377 = fma(_363, _295, _311);
    float _379 = abs(_333);
    float _381 = fma(_369, _379, _371);
    bool _383 = !_351;
    float _385 = _377;
    float _401;
    if (!_383)
    {
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _389 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_93);
        float _407 = 1.0 / _405;
        float _409 = _127 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_51.y;
    float _415 = _149 * 2.0;
    float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _419 = log2(_417);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _427 = _425 != 0;
    int _429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _431 = _429 != 0;
    float _433 = in.m_51.z;
    bool _435 = !_431;
    int _437 = _435 ? 0 : 1;
    float _439 = floor(_415);
    int _441 = abs(_437);
    float _443 = _419 * _127;
    float _445 = _413 * 2.0;
    float _447 = exp2(_443);
    bool _449 = _439 > 0.0;
    float _451 = _433 * 2.0;
    bool _453 = _439 >= 0.0;
    bool _455 = isnan(_439);
    bool _457 = _453 || _455;
    bool _459 = isnan(0.0);
    bool _461 = _457 || _459;
    float _463 = _149 + _413;
    float _465 = _413 + _433;
    float _467 = floor(_445);
    int _469 = _461 ? 0 : 1;
    float _471 = _463 + (-1.0);
    float _473 = _465 + (-1.0);
    int _475 = ~_469;
    int _477 = _475 + 1;
    int _479 = _477 + 1;
    int _481 = _479;
    if (!_449)
    {
        int _483 = ~_469;
        int _485 = _483 + 1;
        _481 = _485;
    }
    int _487 = _481;
    float _489 = floor(_451);
    float _491 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _493 = -_447;
    float _495 = _493 + 1.0;
    bool _497 = _467 > 0.0;
    bool _499 = _467 >= 0.0;
    bool _501 = isnan(_467);
    bool _503 = _499 || _501;
    bool _505 = isnan(0.0);
    bool _507 = _503 || _505;
    float _509 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _511 = !_423;
    int _513 = _511 ? 0 : 1;
    int _515 = _507 ? 0 : 1;
    bool _517 = _489 > 0.0;
    bool _519 = _489 >= 0.0;
    bool _521 = isnan(_489);
    bool _523 = _519 || _521;
    bool _525 = isnan(0.0);
    bool _527 = _523 || _525;
    int _529 = ~_515;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    int _535 = _527 ? 0 : 1;
    int _537 = _533;
    if (!_497)
    {
        int _539 = ~_515;
        int _541 = _539 + 1;
        _537 = _541;
    }
    int _543 = _537;
    bool _545 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _547 = isnan(1.0);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _553 = _549 || _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _557 = 1.0 + _555;
    int _559 = ~_535;
    int _561 = _559 + 1;
    int _563 = _561 + 1;
    int _565 = _563;
    if (!_517)
    {
        int _567 = ~_535;
        int _569 = _567 + 1;
        _565 = _569;
    }
    int _571 = _565;
    float _573 = 1.0 / _557;
    bool _575 = !_427;
    int _577 = _575 ? 0 : 1;
    float _579 = in.m_58.x;
    float _581 = in.m_58.y;
    float _583 = in.m_58.z;
    int _585 = abs(_513);
    int _587 = abs(_577);
    bool _589 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _597 = _593 || _595;
    float _599 = float(_587);
    float _601 = float(_487);
    float _603 = _597 ? _495 : 0.0;
    float _605 = float(_585);
    float _607 = _599 * _601;
    float _609 = float(_571);
    if (_553)
    {
        float _611 = _603 * _573;
        _131 = _611;
    }
    float _613 = _131;
    float _615 = _607 * (-2.0);
    float _617 = _413 + (-0.5);
    float _619 = _605 * _609;
    float _621 = float(_441);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _623;
    float _627 = fma(_615, _581, _581);
    float _629 = fma(_491, _615, _491);
    float _631 = float(_543);
    float _633 = _149 + _433;
    float _635 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[196].y, _627);
    float _637 = 1.0 / _625;
    float _639 = _619 * (-2.0);
    float _641 = fma(_629, _613, _635);
    float _643 = _621 * _631;
    float _645 = _633 + (-1.0);
    float _647 = fma(_509, _639, _509);
    float _649 = _641 * 0.15915493667125701904296875;
    float _651 = fma(_639, _579, _579);
    float _653 = _149 + (-0.5);
    float _655 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _657 = _643 * (-2.0);
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _661 = _411 + _659;
    float _663 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[196].x, _651);
    bool _665 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _667 = isnan(_411);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = fma(_657, _583, _583);
    float _679 = fma(_655, _657, _655);
    float _681 = _661 * _637;
    float _683 = fma(_647, _613, _663);
    bool _685 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _687 = isnan(_411);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = in.m_56.x;
    float _699 = in.m_56.y;
    float _701 = _433 + (-0.5);
    float _703 = _683 * 0.15915493667125701904296875;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _705;
    float _709 = -_695;
    float _711 = _709 + 1.0;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _713;
    float _717 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].z, _677);
    float _719 = fma(_707, _681, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _721 = _675 * _711;
    float _723 = fma(_715, _681, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _725 = fma(_679, _613, _717);
    float _727 = in.m_60.x;
    float _729 = in.m_60.y;
    float _731 = in.m_60.z;
    float _733 = in.m_60.w;
    float _735 = -_675;
    float _737 = _735 + 1.0;
    float _739 = _719 * _721;
    float _741 = _723 * _721;
    float _743 = _725 * 0.15915493667125701904296875;
    float _745 = _649 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[143].x, _739);
    float _751 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[143].y, _741);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    bool _755 = _149 > 0.5;
    float _757 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[144].x, _749);
    float _759 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[144].y, _751);
    float _761 = _649 * 6.283185482025146484375;
    float _763 = cos(_761);
    float _765 = _757 * _697;
    float _767 = _759 * _699;
    float _769 = in.m_62.x;
    float _771 = in.m_62.y;
    float _773 = in.m_62.z;
    float _775 = in.m_62.w;
    float _777 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _779 = _767 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _781 = _703 * 6.283185482025146484375;
    float _783 = sin(_781);
    float _785 = _777 * _753;
    float _787 = _375 * _729;
    float _789 = fma(_373, _727, _787);
    float _791 = _703 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = fma(_377, _731, _789);
    float _797 = _743 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _803 = _783 * _747;
    float _805 = _779 * _801;
    float _807 = _743 * 6.283185482025146484375;
    float _809 = sin(_807);
    float _811 = _793 * _763;
    float _813 = _793 * _747;
    float _815 = _799 * _805;
    float _817 = _747 * _799;
    float _819 = _783 * _763;
    float _821 = _763 * _799;
    float _823 = _793 * _815;
    float _825 = _783 * _815;
    float _827 = fma(_809, _811, _803);
    float _829 = -_813;
    float _831 = fma(_809, _819, _829);
    float _833 = -_819;
    float _835 = fma(_809, _813, _833);
    float _837 = -_805;
    float _839 = _809 * _837;
    float _841 = fma(_827, _785, _823);
    float _843 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _845 = fma(_809, _803, _811);
    float _847 = fma(_821, _785, _839);
    float _849 = fma(_831, _785, _825);
    float _851 = fma(_835, _843, _841);
    float _853 = _375 * _771;
    float _855 = fma(_817, _843, _847);
    float _857 = fma(_845, _843, _849);
    float _859 = _851 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _861 = _851 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _863 = fma(_373, _769, _853);
    float _865 = _795 + _733;
    float _867 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _859);
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _861);
    float _871 = fma(_377, _773, _863);
    float _873 = _851 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _875 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[24].z, _867);
    float _877 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[26].z, _869);
    float _879 = _871 + _775;
    float _881 = in.m_64.x;
    float _883 = in.m_64.y;
    float _885 = in.m_64.z;
    float _887 = in.m_64.w;
    float _889 = _875 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _891 = _877 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _893 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _873);
    float _895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _897 = _865 + _889;
    float _899 = _879 + _891;
    float _901 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[25].z, _893);
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _905 = _897 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _909 = _899 + _907;
    float _911 = _901 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _915 = _913 != 0;
    float _917 = _905 * _905;
    float _919 = _909 * _909;
    float _921 = _917 + _919;
    float _923 = sqrt(_921);
    float _925 = _375 * _883;
    float _927 = fma(_373, _881, _925);
    float _929 = fma(_377, _885, _927);
    float _931 = _929 + _887;
    float _933 = -_219;
    float _935 = _755 ? _933 : _219;
    bool _937 = _923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _939 = _931 + _911;
    bool _941 = !_915;
    float _943 = _941 ? _219 : _935;
    bool _945 = _413 > 0.5;
    float _947 = _883;
    float _949 = _935;
    float _951 = _925;
    float _953 = _931;
    if (!_937)
    {
        _947 = _919;
    }
    float _955 = _947;
    float _957 = _955;
    if (!_937)
    {
        _949 = _917;
    }
    float _959 = _949;
    float _961 = _959;
    if (!_937)
    {
        _385 = _897;
    }
    float _963 = _385;
    float _965 = _963;
    if (!_937)
    {
        _951 = _899;
    }
    float _967 = _951;
    float _969 = _967;
    if (!_937)
    {
        _231 = _939;
    }
    float _971 = _231;
    bool _973 = !_937;
    float _975 = _971;
    if (!_973)
    {
        float _977 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _981 = _923 + _979;
        float _983 = rsqrt(_921);
        float _985 = _981 * _977;
        float _987 = _939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _989 = _985 * 0.15915493667125701904296875;
        float _991 = _989 * 6.283185482025146484375;
        float _993 = sin(_991);
        float _995 = _989 * 6.283185482025146484375;
        float _997 = cos(_995);
        float _999 = fma(_993, _987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1001 = _983 * _999;
        float _1003 = _997 + (-1.0);
        float _1005 = fma(_905, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1007 = fma(_909, _1001, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1009 = _1003 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1013 = _1005 + _1011;
        float _1015 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1017 = _1007 + _1015;
        float _1019 = fma(_939, _997, _1009);
        float _1021 = _1013 * _1013;
        float _1023 = _1017 * _1017;
        _975 = _1019;
        _961 = _1021;
        _957 = _1023;
        _969 = _1007;
        _965 = _1005;
    }
    float _1025 = _975;
    float _1027 = _961;
    float _1029 = _957;
    float _1031 = _969;
    float _1033 = _965;
    float _1035 = _943 + 0.5;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1039 = _1025 + _1037;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1043 = _1041 != 0;
    float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1047 = -_227;
    int _1049 = _945 ? as_type<int>(_1047) : as_type<int>(_227);
    float _1051 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1053 = fma(_1039, _1039, _1027);
    bool _1055 = !_1043;
    float _1057 = _1055 ? _227 : as_type<float>(_1049);
    float _1059 = _1051 * _895;
    float _1061 = _1053 + _1029;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1065 = -_1057;
    float _1067 = _1065 + 0.5;
    float _1069 = sqrt(_1061);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1081 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1085 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1097 = _1081 * _1045;
    out.m_66.x = _1085;
    out.m_66.y = _1087;
    out.m_66.z = _1089;
    out.m_66.w = _1083;
    bool _1099 = _1069 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1101 = isnan(_1069);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1107 = _1103 || _1105;
    out.m_68.x = _1091;
    out.m_68.y = _1093;
    out.m_68.z = _1095;
    out.m_70.x = _1059;
    out.m_70.y = _1097;
    float _1109 = _1081;
    if (!_1107)
    {
        _1109 = 1.0;
    }
    float _1111 = _1109;
    bool _1113 = !_1107;
    float _1115 = _1111;
    if (!_1113)
    {
        bool _1117 = _1069 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1119 = isnan(_1069);
        bool _1121 = _1117 || _1119;
        bool _1123 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1125 = _1121 || _1123;
        if (!_1125)
        {
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1129 = _1069 + _1127;
            float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1133 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1131;
            float _1135 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1137 = _1135 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1139 = 1.0 / _1133;
            float _1141 = _1129 * _1139;
            float _1143 = fma(_1141, _1137, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1115 = _1143;
            _1145 = true;
        }
        else
        {
            bool _1147 = _1069 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1149 = isnan(_1069);
            bool _1151 = _1147 || _1149;
            bool _1153 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1155 = _1151 || _1153;
            if (!_1155)
            {
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1159 = _1069 + _1157;
                float _1161 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1163 = _1161 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1165 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1167 = _1165 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1169 = 1.0 / _1163;
                float _1171 = _1159 * _1169;
                float _1173 = fma(_1171, _1167, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1115 = _1173;
                _1145 = true;
            }
            else
            {
                _1115 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1145 = false;
    float _1175 = _1115;
    float _1177 = _931 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1179 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1181 = _1031 + _1179;
    float _1183 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1177);
    float _1185 = _931 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1187 = fma(_1181, _1175, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1189 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1183);
    bool _1191 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.5);
    bool _1199 = _1195 || _1197;
    bool _1201 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1205 = _1201 || _1203;
    bool _1207 = isnan(0.5);
    bool _1209 = _1205 || _1207;
    float _1211 = _1189 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1213 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1185);
    float _1215 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1217 = _1025 + _1215;
    float _1219 = 1.0 / _1211;
    float _1221 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1213);
    float _1223 = fma(_1217, _1175, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1225 = _1221 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1227 = _1225 + _1211;
    float _1229 = _1211;
    float _1231 = _1175;
    float _1233 = _1187;
    if (_1209)
    {
        _1229 = _1223;
    }
    float _1235 = _1229;
    float _1237 = _1227 * _1219;
    float _1239 = _1237 * 0.5;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1243 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1241);
    float _1245 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1247 = _1033 + _1245;
    float _1249 = fma(_1247, _1175, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1251 = 1.0 / _1243;
    float _1253 = _1247;
    float _1255 = _1219;
    float _1257 = _1235;
    if (_1199)
    {
        _1231 = 1.0;
    }
    float _1259 = _1231;
    float _1261 = _1259;
    if (_1209)
    {
        _1253 = _1187;
    }
    float _1263 = _1253;
    float _1265 = _1263;
    if (_1209)
    {
        _1255 = _1249;
    }
    float _1267 = _1255;
    float _1269 = _1267;
    float _1271 = _1251;
    if (!_1209)
    {
        float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1275 = _931 + _1273;
        float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1279 = _865 + _1277;
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1283 = _1275 * _1275;
        float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1287 = _879 + _1285;
        float _1289 = fma(_1279, _1279, _1283);
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1293 = fma(_1287, _1287, _1289);
        float _1295 = sqrt(_1293);
        float _1297 = _1281 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1299 = precise::min(_1295, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1301 = _1299 * _1291;
        float _1303 = -_865;
        float _1305 = _1303 + _1249;
        float _1307 = _1297 * _1301;
        float _1309 = -_931;
        float _1311 = _1309 + _1223;
        float _1313 = -_879;
        float _1315 = _1313 + _1187;
        float _1317 = fma(_1305, _1307, _865);
        float _1319 = fma(_1311, _1307, _931);
        float _1321 = fma(_1315, _1307, _879);
        _1257 = _1319;
        _1269 = _1317;
        _1265 = _1321;
    }
    float _1323 = _1257;
    float _1325 = _1269;
    float _1327 = _1265;
    if (_1199)
    {
        _953 = 1.0;
    }
    float _1329 = _953;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1333 = _1251 * _1331;
    float _1335 = _1329;
    if (!_1199)
    {
        float _1337 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1341 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1339;
        float _1343 = _1337 * 0.15915493667125701904296875;
        float _1345 = _1343 * 6.283185482025146484375;
        float _1347 = cos(_1345);
        float _1349 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1351 = _1349 * 0.15915493667125701904296875;
        float _1353 = _1343 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = 1.0 / _1347;
        float _1359 = _1351 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1355 * _1357;
        float _1365 = _1351 * 6.283185482025146484375;
        float _1367 = sin(_1365);
        float _1369 = _1361 * _1363;
        float _1371 = 1.0 / _1341;
        float _1373 = 1.0 / _1369;
        float _1375 = _1367 * _1373;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = fma(_1333, _1375, _1377);
        float _1381 = _1379 * _1371;
        float _1383 = precise::clamp(_1381, 0.0, 1.0);
        _1271 = _1351;
        _1261 = _1383;
    }
    float _1385 = _1271;
    float _1387 = _1261;
    if (!_1199)
    {
        float _1389 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1391 = _1389 * 0.15915493667125701904296875;
        float _1393 = _1391 * 6.283185482025146484375;
        float _1395 = cos(_1393);
        float _1397 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1399 = _1397 * 0.15915493667125701904296875;
        float _1401 = _1391 * 6.283185482025146484375;
        float _1403 = sin(_1401);
        float _1405 = 1.0 / _1395;
        float _1407 = _1399 * 6.283185482025146484375;
        float _1409 = cos(_1407);
        float _1411 = _1403 * _1405;
        float _1413 = _1399 * 6.283185482025146484375;
        float _1415 = sin(_1413);
        float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1419 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1417;
        float _1421 = _1409 * _1411;
        float _1423 = 1.0 / _1419;
        float _1425 = 1.0 / _1421;
        float _1427 = _1415 * _1425;
        float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1431 = fma(_1333, _1427, _1429);
        float _1433 = _1431 * _1423;
        float _1435 = precise::clamp(_1433, 0.0, 1.0);
        float _1437 = -_1435;
        float _1439 = _1437 + 1.0;
        _1335 = _1439;
    }
    float _1441 = _1335;
    float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1445 = _1323 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1449 = _1325 + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1453 = _1327 + _1451;
    float _1455 = _1445 * _1445;
    float _1457 = fma(_1449, _1449, _1455);
    float _1459 = fma(_1453, _1453, _1457);
    float _1461 = rsqrt(_1459);
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1465 = _1449 * _1463;
    float _1467 = _1453 * _1463;
    float _1469 = _1465 * _1465;
    float _1471 = _1467 * _1467;
    float _1473 = _1469 + _1471;
    float _1475 = sqrt(_1473);
    bool _1477 = _1475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1481 = _1475 + _1479;
    float _1483 = _1453;
    float _1485 = _1455;
    float _1487 = _1481;
    float _1489 = _1463;
    float _1491 = _1465;
    if (_1477)
    {
        float _1493 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1483 = _1493;
    }
    float _1495 = _1483;
    if (_1477)
    {
        float _1497 = rsqrt(_1473);
        _1485 = _1497;
    }
    float _1499 = _1485;
    float _1501 = _1499;
    if (_1477)
    {
        float _1503 = _1481 * _1495;
        _1487 = _1503;
    }
    float _1505 = _1487;
    if (_1477)
    {
        float _1507 = _1505 * 0.15915493667125701904296875;
        _1233 = _1507;
    }
    float _1509 = _1233;
    float _1511 = _1461;
    if (_1477)
    {
        float _1513 = _1509 * 6.283185482025146484375;
        float _1515 = sin(_1513);
        _1511 = _1515;
    }
    float _1517 = _1511;
    float _1519 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1521 = precise::max(0.0, _1519);
    float _1523 = _1385;
    float _1525 = _1521;
    float _1527 = _1519;
    if (_1477)
    {
        float _1529 = _1509 * 6.283185482025146484375;
        float _1531 = cos(_1529);
        _1523 = _1531;
    }
    float _1533 = _1523;
    float _1535 = -_1463;
    float _1537 = -_1521;
    float _1539 = fma(_1445, _1535, _1537);
    float _1541 = _1539;
    if (_1477)
    {
        float _1543 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1525 = _1543;
    }
    float _1545 = _1525;
    float _1547 = sqrt(_1459);
    float _1549 = _1517;
    float _1551 = _1545;
    if (_1477)
    {
        float _1553 = fma(_1517, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1549 = _1553;
    }
    float _1555 = _1549;
    float _1557 = _1555;
    if (_1477)
    {
        float _1559 = _1533 + (-1.0);
        _1527 = _1559;
    }
    float _1561 = _1527;
    float _1563 = _1561;
    if (_1477)
    {
        float _1565 = _1499 * _1555;
        _1489 = _1565;
    }
    float _1567 = _1489;
    if (!_1477)
    {
        _1501 = _1539;
    }
    float _1569 = _1501;
    float _1571 = _1569;
    if (_1477)
    {
        float _1573 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1573;
    }
    float _1575 = _1551;
    if (_1477)
    {
        float _1577 = _1465 * _1567;
        _1491 = _1577;
    }
    float _1579 = _1491;
    if (!_1477)
    {
        _1557 = _1467;
    }
    float _1581 = _1557;
    float _1583 = _1581;
    if (_1477)
    {
        float _1585 = _1467 * _1567;
        _1583 = _1585;
    }
    float _1587 = _1583;
    if (!_1477)
    {
        _1563 = _1469;
    }
    float _1589 = _1563;
    float _1591 = _1589;
    if (_1477)
    {
        float _1593 = fma(_1539, _1533, _1575);
        _1571 = _1593;
    }
    float _1595 = _1571;
    if (_1477)
    {
        float _1597 = _1579 * _1579;
        _1591 = _1597;
    }
    float _1599 = _1591;
    if (!_1477)
    {
        _1541 = _1471;
    }
    float _1601 = _1541;
    float _1603 = _1601;
    if (_1477)
    {
        float _1605 = _1587 * _1587;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = fma(_1595, _1595, _1599);
    float _1611 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1613 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1615 = _1609 + _1607;
    float _1617 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1611);
    float _1619 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1623 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1621);
    float _1625 = precise::clamp(_1623, 0.0, 1.0);
    float _1627 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1629 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1617);
    float _1631 = rsqrt(_1615);
    float _1633 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1619);
    float _1635 = -_1625;
    float _1637 = _1635 + 1.0;
    float _1639 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1641 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1643 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1613);
    float _1645 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1633);
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1649 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1641);
    float _1651 = abs(_1637);
    float _1653 = log2(_1651);
    float _1655 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1643);
    float _1657 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1659 = -_1647;
    float _1661 = fma(_1659, _1627, 1.0);
    float _1663 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1649);
    float _1665 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1669 = _1631 * _1579;
    float _1671 = _1631 * _1595;
    float _1673 = _1631 * _1587;
    float _1675 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1667);
    float _1677 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1679 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1681 = log2(_1661);
    float _1683 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1675);
    float _1685 = -_1677;
    float _1687 = fma(_1671, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1685);
    float _1689 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1691 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1693 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1683);
    float _1695 = -_1673;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1687);
    float _1699 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1701 = 1.0 / _1693;
    float _1703 = fma(_1697, -0.5, 0.5);
    float _1705 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1699);
    float _1707 = fma(_1697, 0.5, 0.5);
    float _1709 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1691);
    float _1711 = _1671 + 1.0;
    float _1713 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1705);
    float _1715 = fma(_1707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1717 = exp2(_1689);
    float _1719 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1709);
    float _1721 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1713);
    float _1723 = fma(_1707, _1715, -0.212114393711090087890625);
    float _1725 = _1681 * 0.693147182464599609375;
    float _1727 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1719);
    float _1729 = fma(_1707, _1723, 1.570728778839111328125);
    float _1731 = sqrt(_1703);
    float _1733 = _1721 * _1701;
    float _1735 = _1727 * _1701;
    float _1737 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1739 = fma(_1733, 0.5, 0.5);
    float _1741 = fma(_1735, -0.5, 0.5);
    float _1743 = -_1671;
    float _1745 = fma(_1717, _1711, _1743);
    float3 _4419 = float3(_1739, _1741, _1737);
    float _1747 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4419, float3(0.0), isnan(_4419)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4419, float3(0.0), isnan(_4419)), level(0.0)).x;
    float3 _4430 = float3(_1739, _1741, _1737);
    float4 _1750 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).xyzw;
    float _1752 = _1750.x;
    float _1754 = _1750.y;
    float _1756 = _1750.z;
    float _1758 = _1750.w;
    float _1760 = fma(_1745, 0.5, 0.5);
    float _1762 = _1731 * 0.636619746685028076171875;
    float _1764 = -_1729;
    float _1766 = fma(_1762, _1764, 1.0);
    float2 _4457 = float2(_1766, _1760);
    float3 _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4457, float2(0.0), isnan(_4457)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4457, float2(0.0), isnan(_4457)), level(0.0)).xyz;
    float _1772 = _1770.x;
    float _1774 = _1770.y;
    float _1776 = _1770.z;
    float _1778 = _1653 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1780 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1782 = _1387 * _1441;
    bool _1784 = _1387 > 0.0;
    bool _1786 = isnan(_1387);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan(0.0);
    bool _1792 = _1788 || _1790;
    float _1794 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1780);
    float _1796 = exp2(_1778);
    float _1798 = _1782 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1800 = _1441 <= 0.0;
    bool _1802 = !_1792;
    bool _1804 = _1800 || _1802;
    float _1806 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1794);
    float _1808 = _381 * _1798;
    float _1810 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1806);
    float _1812 = _1810 + _1693;
    out.gl_Position.x = _1721;
    out.gl_Position.y = _1727;
    out.gl_Position.z = _1810;
    out.gl_Position.w = _1693;
    float _1814 = _1812 * 0.5;
    float _1816 = -_1796;
    float _1818 = _1816 + 1.0;
    float _1820 = _1808 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_72.z = _1814;
    out.m_72.w = _1693;
    float _1824 = -_1822;
    float _1826 = _1824 + 1.0;
    out.m_47.x = _1820;
    float _1828 = _1822 * _1747;
    float _1830 = _1758 * _1828;
    float _1832 = _1758 * _1826;
    float _1834 = _1776 * _1828;
    float _1836 = fma(_1772, _1830, _1752);
    float _1838 = fma(_1774, _1830, _1754);
    float _1840 = fma(_1758, _1834, _1756);
    out.m_74.x = _1836;
    out.m_74.y = _1838;
    out.m_74.z = _1840;
    out.m_74.w = _1832;
    if (!_1804)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1842 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1842;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

