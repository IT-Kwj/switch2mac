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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_70 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_80 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3107 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3394 = as_type<float>(_125);
        out.gl_Position.z = _3394;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_107);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3468 = as_type<float>(_165);
        out.gl_Position.z = _3468;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_55.x;
    float _169 = in.m_55.y;
    float _171 = in.m_55.z;
    float _173 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _167 * _167;
    float _191 = _169 * _169;
    float _193 = _171 * _171;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    bool _213 = _207 > 0.0;
    float _215 = in.m_49.x;
    float _217 = in.m_49.y;
    float _219 = in.m_49.z;
    bool _221 = _209 > 0.0;
    float _223 = in.m_64.w;
    int _225 = as_type<int>(_187) & 1;
    bool _227 = _225 != 0;
    int _229 = as_type<int>(_187) & 2;
    bool _231 = _229 != 0;
    float _233 = _201;
    float _235 = _167;
    float _237 = _169;
    float _239 = _171;
    if (_213)
    {
        float _241 = rsqrt(_201);
        _233 = _241;
    }
    float _243 = _233;
    bool _245 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _249 = _245 || _247;
    bool _251 = isnan(1.0);
    bool _253 = _249 || _251;
    float _255 = 0.0;
    float _257 = 0.0;
    if (!_213)
    {
        _255 = 0.0;
        _257 = 0.0;
    }
    float _259 = _255;
    float _261 = _257;
    bool _263 = _211 > 0.0;
    float _265 = in.m_44.x;
    float _267 = in.m_44.y;
    float _269 = in.m_44.z;
    float _271 = 0.0;
    float _273 = _259;
    float _275 = _261;
    if (!_213)
    {
        _271 = 0.0;
    }
    float _277 = _271;
    float _279 = 0.0;
    float _281 = 0.0;
    float _283 = _277;
    if (!_221)
    {
        _279 = 0.0;
        _281 = 0.0;
    }
    float _285 = _279;
    float _287 = _281;
    float _289 = 0.0;
    float _291 = _287;
    float _293 = _285;
    if (_221)
    {
        float _295 = rsqrt(_203);
        _289 = _295;
    }
    float _297 = _289;
    float _299 = 0.0;
    if (!_221)
    {
        _299 = 0.0;
    }
    float _301 = _299;
    float _303 = _243;
    float _305 = _301;
    if (_213)
    {
        float _307 = _243 * _175;
        _273 = _307;
    }
    float _309 = _273;
    if (_213)
    {
        float _311 = _243 * _167;
        _283 = _311;
    }
    float _313 = _283;
    float _315 = _313;
    if (_213)
    {
        float _317 = _243 * _181;
        _275 = _317;
    }
    float _319 = _275;
    if (!_253)
    {
        float _321 = _173 * _173;
        float _323 = _321 * 0.5;
        _303 = _323;
    }
    float _325 = _303;
    float _327 = 0.0;
    float _329 = _325;
    if (_263)
    {
        float _331 = rsqrt(_205);
        _327 = _331;
    }
    float _333 = _327;
    bool _335 = !_227;
    float _337 = _335 ? (-0.5) : 0.5;
    float _339 = _297;
    if (_221)
    {
        float _341 = _297 * _177;
        _291 = _341;
    }
    float _343 = _291;
    if (_221)
    {
        float _345 = _297 * _169;
        _293 = _345;
    }
    float _347 = _293;
    if (_221)
    {
        float _349 = _297 * _183;
        _305 = _349;
    }
    float _351 = _305;
    if (!_263)
    {
        _339 = 0.0;
    }
    float _353 = _339;
    float _355 = _353;
    if (!_253)
    {
        float _357 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _329 = _357;
    }
    float _359 = _329;
    bool _361 = !_231;
    float _363 = _361 ? (-0.5) : 0.5;
    bool _365 = !_253;
    float _367 = _359;
    float _369 = 0.0;
    if (!_365)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _377 = _375 + 1.0;
        float _379 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _381 = _173 * _373;
        float _383 = 1.0 / _377;
        float _385 = _379 * 0.693147182464599609375;
        float _387 = exp2(_381);
        float _389 = 1.0 / _385;
        float _391 = _387 + (-1.0);
        float _393 = -_391;
        float _395 = fma(_393, _389, _173);
        float _397 = _395 * _383;
        float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _367 = _399;
        _369 = _389;
    }
    float _401 = _367;
    float _403 = _369;
    float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _407 = _403;
    float _409 = _401;
    if (_263)
    {
        float _411 = _333 * _171;
        _355 = _411;
    }
    float _413 = _355;
    float _415 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_263)
    {
        _407 = 0.0;
    }
    float _417 = _407;
    float _419 = _405 * _313;
    float _421 = _405 * _347;
    float _423 = _405 * _413;
    float _425 = _417;
    if (_263)
    {
        float _427 = _333 * _179;
        _425 = _427;
    }
    float _429 = _425;
    float _431 = fma(_415, _309, _419);
    float _433 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_263)
    {
        _315 = 0.0;
    }
    float _435 = _315;
    float _437 = _435;
    if (_263)
    {
        float _439 = _333 * _185;
        _437 = _439;
    }
    float _441 = _437;
    float _443 = fma(_415, _343, _421);
    float _445 = fma(_415, _429, _423);
    float _447 = fma(_433, _319, _431);
    if (!_253)
    {
        _409 = _173;
    }
    float _449 = _409;
    bool _451 = !_253;
    float _453 = _449;
    if (!_451)
    {
        float _455 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _457 = log2(_455);
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _461 = _459 + 1.0;
        float _463 = 1.0 / _461;
        float _465 = _173 * _457;
        float _467 = exp2(_465);
        float _469 = -_467;
        float _471 = _469 + 1.0;
        float _473 = _471 * _463;
        _453 = _473;
    }
    float _475 = _453;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _479 = fma(_433, _351, _443);
    float _481 = fma(_433, _441, _445);
    float _483 = fma(_475, _215, _447);
    float _485 = fma(_475, _217, _479);
    float _487 = fma(_475, _219, _481);
    float _489 = fma(_483, _223, _265);
    float _491 = fma(_485, _223, _267);
    float _493 = fma(_487, _223, _269);
    bool _495 = !_477;
    float _497 = _489;
    float _513;
    if (!_495)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_107);
        float _519 = 1.0 / _517;
        float _521 = _145 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = in.m_51.y;
    float _527 = _131 * 2.0;
    float _529 = in.m_51.z;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _539 = floor(_527);
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _543 = _541 != 0;
    float _545 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _549 = 1.0 / _533;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _553 = -_547;
    float _555 = fma(_545, 2.0, _553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _557;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _563 = 1.0 / _537;
    float _565 = _525 * 2.0;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _569 = _523 + _567;
    float _571 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _573 = _529 * 2.0;
    bool _575 = _539 > 0.0;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _579 = _569 * _549;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _583 = _523 + _581;
    float _585 = _131 + _525;
    float _587 = floor(_565);
    float _589 = fma(_571, -2.0, _551);
    float _591 = _585 + (-1.0);
    bool _593 = _539 >= 0.0;
    bool _595 = isnan(_539);
    bool _597 = _593 || _595;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    float _603 = _583 * _563;
    float _605 = _529 + _525;
    float _607 = floor(_573);
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _611 = _605 + (-1.0);
    int _613 = as_type<int>(_591);
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (_543)
    {
        _613 = 0;
    }
    int _617 = _613;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _621 = _523 + _619;
    int _623 = _617;
    if (!_543)
    {
        _623 = 1;
    }
    int _625 = _623;
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _629 = _601 ? 0 : 1;
    float _631 = 1.0 / _559;
    bool _633 = _625 != 1;
    bool _635 = _587 > 0.0;
    bool _637 = _587 >= 0.0;
    bool _639 = isnan(_587);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _649 = int(_647);
    float _651 = _131 + _529;
    bool _653 = _607 > 0.0;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _655;
    bool _659 = _607 >= 0.0;
    bool _661 = isnan(_607);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _669;
    float _673 = _651 + (-1.0);
    float _675 = fma(_657, _579, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _677 = fma(_671, _579, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (!_633)
    {
        _615 = _525;
    }
    float _679 = _615;
    float _681 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _683 = _645 ? 0 : 1;
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _687 = int(_685);
    int _689 = _667 ? 0 : 1;
    float _691 = _621 * _631;
    float _693 = _679;
    if (_633)
    {
        _693 = _131;
    }
    float _695 = _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _701 = ~_629;
    int _703 = _701 + 1;
    int _705 = _703 + 1;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _711 = _705;
    float _713 = _695;
    if (!_575)
    {
        int _715 = ~_629;
        int _717 = _715 + 1;
        _711 = _717;
    }
    int _719 = _711;
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[83].z, _561);
    int _723 = ~_683;
    int _725 = _723 + 1;
    int _727 = _725 + 1;
    float _729 = fma(_699, _603, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _731 = ~_689;
    int _733 = _731 + 1;
    int _735 = _733 + 1;
    float _737 = fma(_709, _603, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _739 = _727;
    int _741 = _735;
    if (!_635)
    {
        int _743 = ~_683;
        int _745 = _743 + 1;
        _739 = _745;
    }
    int _747 = _739;
    if (!_653)
    {
        int _749 = ~_689;
        int _751 = _749 + 1;
        _741 = _751;
    }
    int _753 = _741;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _765 = _763 != 0;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _769 = _767 != 0;
    if (!_633)
    {
        _713 = _525;
    }
    float _771 = _713;
    float _773 = _771;
    if (_633)
    {
        _773 = _131;
    }
    float _775 = _773;
    bool _777 = !_765;
    int _779 = _777 ? 0 : 1;
    bool _781 = !_761;
    int _783 = _781 ? 0 : 1;
    float _785 = _775 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _787 = !_769;
    int _789 = _787 ? 0 : 1;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _793 = _791 != 0;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _797 = _795 != 0;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _801 = _799 != 0;
    float _803 = -_577;
    float _805 = fma(_785, 2.0, _803);
    float _807 = float(_107);
    if (!_633)
    {
        _115 = _529;
    }
    float _809 = _115;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _813 = !_793;
    int _815 = _813 ? 0 : 1;
    float _817 = _809;
    if (_633)
    {
        _817 = _525;
    }
    float _819 = _817;
    float _821 = 1.0 / _807;
    bool _823 = !_797;
    int _825 = _823 ? 0 : 1;
    int _827 = abs(_815);
    float _829 = _757 * _145;
    int _831 = abs(_825);
    float _833 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[83].w, _811);
    float _835 = float(_719);
    float _837 = _819;
    if (!_633)
    {
        _837 = _529;
    }
    float _839 = _837;
    float _841 = exp2(_829);
    float _843 = float(_747);
    float _845 = _839;
    if (_633)
    {
        _845 = _525;
    }
    float _847 = _845;
    float _849 = _821 * _145;
    float _851 = float(_827);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _855 = float(_753);
    float _857 = _847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _859 = float(_649);
    bool _861 = !_801;
    int _863 = _861 ? 0 : 1;
    float _865 = _851 * _855;
    float _867 = fma(_857, -2.0, _853);
    float _869 = in.m_66.x;
    float _871 = in.m_66.y;
    float _873 = in.m_66.z;
    float _875 = 1.0 / _859;
    int _877 = abs(_863);
    float _879 = -_841;
    float _881 = _879 + 1.0;
    float _883 = float(_687);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _887 = 1.0 + _885;
    float _889 = float(_877);
    float _891 = -_145;
    float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[76].x, _555);
    float _895 = 1.0 / _883;
    float _897 = float(_831);
    float _899 = _889 * _843;
    bool _901 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _903 = isnan(0.0);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _909 = _905 || _907;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _913 = _897 * _835;
    bool _915 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _917 = isnan(1.0);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _923 = _919 || _921;
    float _925 = 1.0 / _887;
    float _927 = _909 ? _881 : 0.0;
    float _929 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].w, _911);
    float _931 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _721);
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _935 = _913 * (-2.0);
    bool _937 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _939 = isnan(_523);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _875 * _145;
    float _951 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _589);
    float _953 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _929);
    float _955 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _867);
    float _957 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _933);
    float _959 = fma(_627, _935, _627);
    float _961 = fma(_935, _871, _871);
    float _963 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _833);
    float _965 = _865 * (-2.0);
    bool _967 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _969 = isnan(_523);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = _525 + (-0.5);
    float _981 = -_947;
    float _983 = _981 + 1.0;
    float _985 = _895 * _145;
    float _987 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _957);
    float _989 = -_145;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[81].x, _805);
    if (_923)
    {
        float _993 = _927 * _925;
        _147 = _993;
    }
    float _995 = _147;
    float _997 = fma(_609, _965, _609);
    float _999 = fma(_965, _869, _869);
    float _1001 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[196].y, _961);
    bool _1003 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1005 = isnan(_523);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = _977 * _983;
    float _1017 = -_977;
    float _1019 = _1017 + 1.0;
    float _1021 = fma(_959, _995, _1001);
    bool _1023 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1025 = isnan(_523);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = _899 * (-2.0);
    float _1037 = _1013 * _1019;
    float _1039 = -_1013;
    float _1041 = _1039 + 1.0;
    float _1043 = _131 + (-0.5);
    float _1045 = fma(_1035, _873, _873);
    float _1047 = fma(_681, _1035, _681);
    float _1049 = _1033 * _1041;
    float _1051 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].x, _999);
    float _1053 = _529 + (-0.5);
    float _1055 = _677 * _1049;
    float _1057 = _675 * _1049;
    float _1059 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1045);
    float _1061 = in.m_64.x;
    float _1063 = in.m_64.y;
    float _1065 = fma(_997, _995, _1051);
    float _1067 = fma(_1047, _995, _1059);
    float _1069 = -_1033;
    float _1071 = _1069 + 1.0;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1077;
    float _1081 = _1021 * 0.15915493667125701904296875;
    float _1083 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1057);
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1055);
    float _1087 = fma(_1079, _691, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1089 = _1065 * 0.15915493667125701904296875;
    float _1091 = fma(_729, _1037, _1083);
    float _1093 = fma(_1075, _691, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1095 = _1067 * 0.15915493667125701904296875;
    float _1097 = fma(_737, _1037, _1085);
    float _1099 = fma(_1087, _1015, _1091);
    float _1101 = _1081 * 6.283185482025146484375;
    float _1103 = sin(_1101);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _337);
    float _1107 = fma(_1093, _1015, _1097);
    float _1109 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1099);
    float _1111 = _491 * _183;
    float _1113 = in.m_59.w;
    float _1115 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1107);
    float _1117 = _1081 * 6.283185482025146484375;
    float _1119 = cos(_1117);
    float _1121 = _1109 * _1061;
    float _1123 = _1115 * _1063;
    float _1125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _363);
    float _1127 = fma(_489, _181, _1111);
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1133 = _1089 * 6.283185482025146484375;
    float _1135 = cos(_1133);
    float _1137 = _1129 * _1105;
    float _1139 = _1131 * _1125;
    float _1141 = in.m_57.w;
    float _1143 = fma(_493, _185, _1127);
    float _1145 = _1089 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    float _1149 = _1095 * 6.283185482025146484375;
    float _1151 = cos(_1149);
    float _1153 = _1135 * _1119;
    float _1155 = _1135 * _1103;
    float _1157 = _1095 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = _1147 * _1103;
    float _1163 = _1147 * _1119;
    float _1165 = _1135 * _1151;
    float _1167 = _1103 * _1151;
    float _1169 = _1147 * _1151;
    float _1171 = _1119 * _1151;
    float _1173 = _1165 * _1139;
    float _1175 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1177 = _1169 * _1139;
    float _1179 = fma(_1159, _1153, _1161);
    float _1181 = -_1139;
    float _1183 = _1159 * _1181;
    float _1185 = -_1163;
    float _1187 = fma(_1159, _1155, _1185);
    float _1189 = -_1155;
    float _1191 = fma(_1159, _1163, _1189);
    float _1193 = fma(_1179, _1137, _1173);
    float _1195 = fma(_1171, _1137, _1183);
    float _1197 = fma(_1159, _1161, _1153);
    float _1199 = fma(_1191, _1137, _1177);
    float _1201 = fma(_1187, _1175, _1193);
    float _1203 = fma(_1167, _1175, _1195);
    float _1205 = _491 * _177;
    float _1207 = fma(_1197, _1175, _1199);
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1213 = fma(_489, _175, _1205);
    float _1215 = _1143 + _1113;
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1209);
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1211);
    float _1221 = fma(_493, _179, _1213);
    float _1223 = _491 * _169;
    float _1225 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1217);
    float _1227 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1219);
    float _1229 = _1221 + _1141;
    float _1231 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1233 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1237 = fma(_489, _167, _1223);
    float _1239 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1231);
    float _1241 = _1215 + _1233;
    float _1243 = _1229 + _1235;
    float _1245 = in.m_55.w;
    float _1247 = fma(_493, _171, _1237);
    float _1249 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1251 = _1241 + _1249;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1255 = _1243 + _1253;
    float _1257 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1239);
    float _1259 = _1251 * _1251;
    float _1261 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1263 = fma(_1255, _1255, _1259);
    float _1265 = sqrt(_1263);
    float _1267 = _1247 + _1245;
    float _1269 = _1267 + _1261;
    bool _1271 = _1265 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1275 = _1273 != 0;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1279 = _1277 != 0;
    int _1281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1283 = _1281 != 0;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1287 = _1285 != 0;
    bool _1289 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1291 = isnan(0.5);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1297 = _1293 || _1295;
    bool _1299 = !_1279;
    int _1301 = _1299 ? 0 : 1;
    bool _1303 = !_1275;
    int _1305 = _1303 ? 0 : 1;
    bool _1307 = !_1283;
    int _1309 = _1307 ? 0 : 1;
    bool _1311 = !_1287;
    int _1313 = _1311 ? 0 : 1;
    float _1315 = _1263;
    float _1317 = _1255;
    float _1319 = _1251;
    float _1321 = _1243;
    if (!_1271)
    {
        _235 = _1243;
    }
    float _1323 = _235;
    float _1325 = _1323;
    if (!_1271)
    {
        _497 = _1241;
    }
    float _1327 = _497;
    float _1329 = _1327;
    if (!_1271)
    {
        _237 = _1269;
    }
    float _1331 = _237;
    bool _1333 = !_1271;
    float _1335 = _1331;
    if (!_1333)
    {
        float _1337 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1341 = _1265 + _1339;
        float _1343 = rsqrt(_1263);
        float _1345 = _1341 * _1337;
        float _1347 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = _1345 * 0.15915493667125701904296875;
        float _1351 = _1349 * 6.283185482025146484375;
        float _1353 = sin(_1351);
        float _1355 = _1349 * 6.283185482025146484375;
        float _1357 = cos(_1355);
        float _1359 = fma(_1353, _1347, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1361 = _1343 * _1359;
        float _1363 = _1357 + (-1.0);
        float _1365 = fma(_1255, _1361, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1367 = fma(_1251, _1361, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1369 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = fma(_1269, _1357, _1369);
        _1325 = _1365;
        _1335 = _1371;
        _1329 = _1367;
        _1315 = _1343;
        _239 = _1369;
    }
    float _1373 = _1325;
    float _1375 = _1335;
    float _1377 = _1329;
    float _1379 = _1315;
    float _1381 = _239;
    float _1383 = _1379;
    float _1385 = _1381;
    if (_1297)
    {
        _1317 = _1373;
    }
    float _1387 = _1317;
    float _1389 = _1387;
    if (_1297)
    {
        _1319 = _1375;
    }
    float _1391 = _1319;
    float _1393 = _1391;
    if (_1297)
    {
        _1383 = _1377;
    }
    float _1395 = _1383;
    float _1397 = _1395;
    if (!_1297)
    {
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1401 = _1267 + _1399;
        float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1405 = _1229 + _1403;
        float _1407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1409 = -_1215;
        float _1411 = _1409 + _1377;
        float _1413 = _1401 * _1401;
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1417 = _1215 + _1415;
        float _1419 = fma(_1405, _1405, _1413);
        float _1421 = fma(_1417, _1417, _1419);
        float _1423 = -_1229;
        float _1425 = _1423 + _1373;
        float _1427 = sqrt(_1421);
        float _1429 = precise::min(_1427, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1431 = _1429 * _1407;
        float _1433 = -_1267;
        float _1435 = _1433 + _1375;
        float _1437 = fma(_1425, _1431, _1229);
        float _1439 = fma(_1435, _1431, _1267);
        float _1441 = fma(_1411, _1431, _1215);
        _1393 = _1439;
        _1389 = _1437;
        _1397 = _1441;
        _1385 = _1427;
    }
    float _1443 = _1393;
    float _1445 = _1389;
    float _1447 = _1397;
    float _1449 = _1385;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1453 = _1443 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1457 = _1445 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1447 + _1459;
    float _1463 = _1453 * _1453;
    float _1465 = fma(_1457, _1457, _1463);
    float _1467 = fma(_1461, _1461, _1465);
    float _1469 = rsqrt(_1467);
    float _1471 = sqrt(_1467);
    float _1473 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1475 = _1457 * _1473;
    float _1477 = _1461 * _1473;
    float _1479 = _1475 * _1475;
    float _1481 = _1477 * _1477;
    float _1483 = _1479 + _1481;
    float _1485 = sqrt(_1483);
    bool _1487 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = _1485 + _1489;
    float _1493 = _1375;
    float _1495 = _1491;
    float _1497 = _1449;
    float _1499 = _1453;
    float _1501 = _1475;
    if (_1487)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1503;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    if (_1487)
    {
        float _1509 = _1491 * _1505;
        _1495 = _1509;
    }
    float _1511 = _1495;
    if (_1487)
    {
        float _1513 = rsqrt(_1483);
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = _1515;
    if (_1487)
    {
        float _1519 = _1511 * 0.15915493667125701904296875;
        _1497 = _1519;
    }
    float _1521 = _1497;
    float _1523 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1525 = _1461;
    if (_1487)
    {
        float _1527 = _1521 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1525 = _1529;
    }
    float _1531 = _1525;
    float _1533 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1535 = precise::max(0.0, _1523);
    float _1537 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1533);
    float _1539 = _1373;
    float _1541 = _1535;
    if (_1487)
    {
        float _1543 = _1521 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        _1539 = _1545;
    }
    float _1547 = _1539;
    float _1549 = -_1473;
    float _1551 = -_1535;
    float _1553 = fma(_1453, _1549, _1551);
    float _1555 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1537);
    float _1557 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1487)
    {
        float _1559 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1559;
    }
    float _1561 = _1499;
    float _1563 = _1531;
    float _1565 = _1561;
    if (_1487)
    {
        float _1567 = fma(_1531, _1561, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1563 = _1567;
    }
    float _1569 = _1563;
    float _1571 = _1569;
    if (!_1487)
    {
        _1565 = _1553;
    }
    float _1573 = _1565;
    float _1575 = _1573;
    if (_1487)
    {
        float _1577 = _1515 * _1569;
        _1321 = _1577;
    }
    float _1579 = _1321;
    if (!_1487)
    {
        _1571 = _1479;
    }
    float _1581 = _1571;
    float _1583 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1585 = _1581;
    float _1587 = _1547;
    if (_1487)
    {
        float _1589 = _1547 + (-1.0);
        _1541 = _1589;
    }
    float _1591 = _1541;
    float _1593 = _1591;
    if (_1487)
    {
        float _1595 = _1475 * _1579;
        _1501 = _1595;
    }
    float _1597 = _1501;
    float _1599 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1583);
    if (_1487)
    {
        float _1601 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1517 = _1601;
    }
    float _1603 = _1517;
    if (!_1487)
    {
        _1593 = _1477;
    }
    float _1605 = _1593;
    float _1607 = _1605;
    if (_1487)
    {
        float _1609 = _1477 * _1579;
        _1607 = _1609;
    }
    float _1611 = _1607;
    if (_1487)
    {
        float _1613 = _1597 * _1597;
        _1585 = _1613;
    }
    float _1615 = _1585;
    if (_1487)
    {
        float _1617 = fma(_1553, _1547, _1603);
        _1575 = _1617;
    }
    float _1619 = _1575;
    if (!_1487)
    {
        _1587 = _1481;
    }
    float _1621 = _1587;
    float _1623 = _1621;
    if (_1487)
    {
        float _1625 = _1611 * _1611;
        _1623 = _1625;
    }
    float _1627 = _1623;
    float _1629 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1631 = fma(_1619, _1619, _1615);
    float _1633 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1599);
    float _1635 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1637 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1629);
    float _1639 = _1631 + _1627;
    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1643 = fma(_1471, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1641);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1649 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1637);
    float _1651 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1653 = -_1645;
    float _1655 = _1653 + 1.0;
    float _1657 = rsqrt(_1639);
    float _1659 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1647);
    float _1661 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1663 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1665 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1659);
    float _1667 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1669 = -_1663;
    float _1671 = fma(_1669, _1557, 1.0);
    float _1673 = abs(_1655);
    float _1675 = log2(_1673);
    float _1677 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1679 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1681 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1667);
    float _1683 = _1657 * _1597;
    float _1685 = _1657 * _1619;
    float _1687 = _1657 * _1611;
    float _1689 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1681);
    float _1691 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1693 = log2(_1671);
    float _1695 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1689);
    float _1697 = -_1691;
    float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1697);
    float _1701 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1703 = _1685 + 1.0;
    float _1705 = -_1687;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1699);
    float _1709 = 1.0 / _1695;
    float _1711 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1713 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1679);
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1707, 0.5, 0.5);
    float _1719 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1711);
    float _1721 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1713);
    float _1723 = exp2(_1701);
    float _1725 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1727 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1719);
    float _1729 = _1693 * 0.693147182464599609375;
    float _1731 = fma(_1717, _1725, -0.212114393711090087890625);
    float _1733 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1727);
    float _1735 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = sqrt(_1715);
    float _1739 = _1733 * _1709;
    float _1741 = -_1685;
    float _1743 = fma(_1723, _1703, _1741);
    float _1745 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1721);
    float _1747 = fma(_1717, _1731, 1.570728778839111328125);
    float _1749 = fma(_1739, 0.5, 0.5);
    float _1751 = fma(_1743, 0.5, 0.5);
    float _1753 = _1745 * _1709;
    float _1755 = _1737 * 0.636619746685028076171875;
    float _1757 = fma(_1753, -0.5, 0.5);
    float _1759 = -_1747;
    float _1761 = fma(_1755, _1759, 1.0);
    float3 _5912 = float3(_1749, _1757, _1735);
    float _1763 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).x;
    float3 _5923 = float3(_1749, _1757, _1735);
    float4 _1766 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).xyzw;
    float _1768 = _1766.x;
    float _1770 = _1766.y;
    float _1772 = _1766.z;
    float _1774 = _1766.w;
    float2 _5940 = float2(_1761, _1751);
    float3 _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5940, float2(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5940, float2(0.0), isnan(_5940)), level(0.0)).xyz;
    float _1780 = _1778.x;
    float _1782 = _1778.y;
    float _1784 = _1778.z;
    float _1786 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1788 = int(_1786);
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1792 = _1790 != 0;
    float _1794 = -_931;
    float _1796 = _1794 + 1.0;
    bool _1798 = _131 > 0.5;
    float _1800 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1802 = _525 > 0.5;
    out.m_68.x = _1445;
    out.m_68.y = _1443;
    out.m_68.z = _1447;
    int _1804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1806 = _1804 != 0;
    float _1808 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1810 = int(_1808);
    bool _1812 = _529 > 0.5;
    int _1814 = abs(_1301);
    float _1816 = 0.0;
    float _1818 = _1695;
    float _1820 = _1745;
    float _1822 = _1733;
    if (_1792)
    {
        _1816 = 1.0;
    }
    float _1824 = _1816;
    float _1826 = trunc(_949);
    int _1828 = int(_1826);
    float _1830 = float(uint(_1788));
    float _1832 = _1824;
    if (!_1792)
    {
        _1832 = 1.2345600128173828125;
    }
    float _1834 = _1832;
    int _1836 = abs(_1309);
    int _1838 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1840 = _1838 != 0;
    float _1842 = 1.0 / _1830;
    float _1844 = float(uint(_1810));
    float _1846 = float(_1810);
    int _1848 = abs(_1313);
    float _1850 = 1.0 / _1844;
    float _1852 = trunc(_985);
    int _1854 = int(_1852);
    int _1856 = as_type<int>(_1842) + (-2);
    float _1858 = float(uint(_1828));
    int _1860 = ~_1810;
    int _1862 = _1860 + 1;
    float _1864 = as_type<float>(_1856) * _1858;
    int _1866 = as_type<int>(_1850) + (-2);
    float _1868 = exp2(_1800);
    float _1870 = _1858;
    if (_1792)
    {
        _1870 = 1.0;
    }
    float _1872 = _1870;
    float _1874 = _1872;
    if (!_1792)
    {
        _1874 = 7.345489978790283203125;
    }
    float _1876 = _1874;
    int _1878 = ~_1788;
    int _1880 = _1878 + 1;
    float _1882 = float(uint(_1854));
    float _1884 = trunc(_1864);
    float _1886 = precise::max(_1884, 0.0);
    uint _1889 = uint(_1886);
    float _1891 = _1876 * _131;
    float _1893 = as_type<float>(_1866) * _1882;
    float _1895 = _1882;
    if (_1792)
    {
        _1895 = _131;
    }
    float _1897 = _1895;
    float _1899 = _1897;
    if (!_1792)
    {
        _1899 = _525;
    }
    float _1901 = _1899;
    float _1903 = floor(_1891);
    float _1905 = float(_1828);
    float _1907 = -_1868;
    float _1909 = _1907 + 1.0;
    float _1911 = _1834 * _1901;
    float _1913 = trunc(_1893);
    float _1915 = precise::max(_1913, 0.0);
    uint _1917 = uint(_1915);
    int _1919 = _1880 * int(_1889);
    int _1921 = _1919 + _1828;
    float _1923 = float(uint(_1921));
    float _1925 = -_1903;
    float _1927 = _1891 + _1925;
    float _1929 = as_type<float>(_1856) * _1923;
    float _1931 = float(_1788);
    int _1933 = _1862 * int(_1917);
    int _1935 = _1933 + _1854;
    float _1937 = trunc(_1929);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    bool _1943 = _1905 >= _1931;
    bool _1945 = isnan(_1905);
    bool _1947 = _1943 || _1945;
    bool _1949 = isnan(_1931);
    bool _1951 = _1947 || _1949;
    float _1953 = float(_1951);
    float _1955 = _1927 * _1931;
    int _1957 = ~_1788;
    int _1959 = _1957 + 1;
    float _1961 = float(uint(_1935));
    float _1963 = float(_1854);
    float _1965 = floor(_1911);
    float _1967 = as_type<float>(_1866) * _1961;
    float _1969 = trunc(_1967);
    float _1971 = precise::max(_1969, 0.0);
    uint _1973 = uint(_1971);
    int _1975 = int(_1889) + int(_1941);
    int _1977 = _1959 * _1975;
    int _1979 = _1977 + _1828;
    int _1981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1983 = _1981 != 0;
    float _1985 = -_1965;
    float _1987 = _1911 + _1985;
    float _1989 = trunc(_1955);
    int _1991 = int(_1989);
    bool _1993 = _1963 >= _1846;
    bool _1995 = isnan(_1963);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(_1846);
    bool _2001 = _1997 || _1999;
    float _2003 = float(_2001);
    bool _2005 = uint(_1979) >= uint(_1788);
    float _2007 = _1987 * _1846;
    bool _2009 = !_1983;
    int _2011 = _2009 ? 0 : 1;
    int _2013 = int(_1917) + int(_1973);
    float _2015 = trunc(_1953);
    int _2017 = int(_2015);
    int _2019 = ~_1810;
    int _2021 = _2019 + 1;
    bool _2023 = !_2005;
    int _2025 = _2023 ? 0 : (-1);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2029 = _2027 != 0;
    int _2031 = _2021 * _2013;
    int _2033 = _2031 + _1854;
    int _2035 = ~_1975;
    int _2037 = _2035 + _2025;
    int _2039 = _2037 + 1;
    float _2041 = trunc(_2007);
    int _2043 = int(_2041);
    int _2045 = abs(_2011);
    bool _2047 = uint(_2033) >= uint(_1810);
    float _2049 = _1931 * _849;
    bool _2051 = !_2029;
    int _2053 = _2051 ? 0 : 1;
    float _2055 = _1846 * _849;
    bool _2057 = !_2047;
    int _2059 = _2057 ? 0 : (-1);
    float _2061 = trunc(_2003);
    int _2063 = int(_2061);
    bool _2065 = _1788 == 0;
    int _2067 = ~_2013;
    int _2069 = _2067 + _2059;
    int _2071 = _2069 + 1;
    int _2073 = _1991 * _2045;
    int _2075 = _2073 + _1828;
    int _2077 = abs(_2053);
    int _2079 = _1788 * _2039;
    int _2081 = _2079 + _1828;
    bool _2083 = _1810 == 0;
    int _2085 = _1810 * _2071;
    int _2087 = _2085 + _1854;
    int _2089 = ~_2017;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    int _2095 = _2043 * _2077;
    int _2097 = _2095 + _1854;
    bool _2099 = !_2065;
    int _2101 = _2099 ? _2081 : (-1);
    float _2103 = trunc(_2049);
    int _2105 = int(_2103);
    bool _2107 = !_2083;
    int _2109 = _2107 ? _2087 : (-1);
    int _2111 = abs(_779);
    int _2113 = _2101 * _2093;
    int _2115 = ~_2063;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    int _2121 = _1788 + (-1);
    float _2123 = trunc(_2055);
    int _2125 = int(_2123);
    int _2127 = _1810 + (-1);
    int _2129 = _2109 * _2119;
    int _2131 = _2017 * _2121;
    int _2133 = _2131 + _2113;
    int _2135 = abs(_1305);
    int _2137 = _2063 * _2127;
    int _2139 = _2137 + _2129;
    int _2141 = _2133 * _2111;
    int _2143 = abs(_783);
    int _2145 = abs(_789);
    float _2147 = in.m_51.w;
    int _2149 = _2139 * _1814;
    int _2151 = ~_1810;
    int _2153 = _2151 + 1;
    int _2155 = _2105 * _2143;
    int _2157 = _2155 + _2141;
    int _2159 = _2125 * _2135;
    int _2161 = _2159 + _2149;
    float _2163 = -_337;
    int _2165 = _1798 ? as_type<int>(_2163) : as_type<int>(_337);
    bool _2167 = !_1806;
    int _2169 = _2167 ? 0 : 1;
    int _2171 = _2075 * _2145;
    int _2173 = _2171 + _2157;
    float _2175 = float(uint(_2075));
    bool _2177 = !_1840;
    float _2179 = _2177 ? _337 : as_type<float>(_2165);
    int _2181 = _2097 * _1836;
    int _2183 = _2181 + _2161;
    int _2185 = abs(_2169);
    float _2187 = as_type<float>(_1856) * _2175;
    float _2189 = _2179 + 0.5;
    float _2191 = float(uint(_2097));
    int _2193 = _1991 * _2185;
    int _2195 = _2193 + _2173;
    int _2197 = ~_1788;
    int _2199 = _2197 + 1;
    float _2201 = fma(_2189, (*spvDescriptorSet0.vp_c9)._m0[80].x, _893);
    int _2203 = _2043 * _1848;
    int _2205 = _2203 + _2183;
    float _2207 = trunc(_2187);
    float _2209 = precise::max(_2207, 0.0);
    uint _2211 = uint(_2209);
    float _2213 = float(uint(_2195));
    float _2215 = as_type<float>(_1866) * _2191;
    bool _2217 = _2147 > 0.5;
    float _2219 = float(uint(_2205));
    float _2221 = as_type<float>(_1856) * _2213;
    int _2223 = ~_1810;
    int _2225 = _2223 + 1;
    float _2227 = trunc(_2215);
    float _2229 = precise::max(_2227, 0.0);
    uint _2231 = uint(_2229);
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2235 = _2233 != 0;
    float _2237 = as_type<float>(_1866) * _2219;
    float _2239 = -_337;
    int _2241 = _1812 ? as_type<int>(_2239) : as_type<int>(_337);
    float _2243 = -_363;
    int _2245 = _1802 ? as_type<int>(_2243) : as_type<int>(_363);
    int _2247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2249 = _2247 != 0;
    float _2251 = trunc(_2221);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = _2199 * int(_2211);
    int _2259 = _2257 + _2075;
    int _2261 = ~_1788;
    int _2263 = _2261 + 1;
    float _2265 = -_363;
    int _2267 = _2217 ? as_type<int>(_2265) : as_type<int>(_363);
    float _2269 = float(uint(_2259));
    float _2271 = trunc(_2237);
    float _2273 = precise::max(_2271, 0.0);
    uint _2275 = uint(_2273);
    int _2277 = _2153 * int(_2231);
    int _2279 = _2277 + _2097;
    float _2281 = as_type<float>(_1856) * _2269;
    bool _2283 = !_2235;
    float _2285 = _2283 ? _337 : as_type<float>(_2241);
    float _2287 = float(uint(_2279));
    int _2289 = _2263 * int(_2255);
    int _2291 = _2289 + _2195;
    bool _2293 = !_2249;
    float _2295 = _2293 ? _363 : as_type<float>(_2267);
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2299 = _2297 != 0;
    float _2301 = as_type<float>(_1866) * _2287;
    float _2303 = float(uint(_2291));
    float _2305 = _2285 + 0.5;
    bool _2307 = !_2299;
    float _2309 = _2307 ? _363 : as_type<float>(_2245);
    int _2311 = _2225 * int(_2275);
    int _2313 = _2311 + _2205;
    float _2315 = _2295 + (-0.5);
    float _2317 = as_type<float>(_1856) * _2303;
    float _2319 = trunc(_2301);
    float _2321 = precise::max(_2319, 0.0);
    uint _2323 = uint(_2321);
    float _2325 = _2309 + (-0.5);
    float _2327 = float(uint(_2313));
    float _2329 = fma(_2305, (*spvDescriptorSet0.vp_c9)._m0[85].x, _991);
    float _2331 = -_2315;
    float _2333 = -_955;
    float _2335 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2333);
    float _2337 = -_2325;
    float _2339 = -_951;
    float _2341 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2339);
    float _2343 = -_953;
    float _2345 = _2343 + 1.0;
    float _2347 = as_type<float>(_1866) * _2327;
    float _2349 = trunc(_2317);
    float _2351 = precise::max(_2349, 0.0);
    uint _2353 = uint(_2351);
    float _2355 = -_987;
    float _2357 = _2355 + 1.0;
    float _2359 = -_963;
    float _2361 = _2359 + 1.0;
    float _2363 = -_1796;
    float _2365 = fma(_2285, _2363, _2329);
    float _2367 = fma(_2309, _2345, _2341);
    float _2369 = -_2357;
    float _2371 = fma(_2179, _2369, _2201);
    float _2373 = fma(_2295, _2361, _2335);
    int _2375 = ~_1788;
    int _2377 = _2375 + 1;
    float _2379 = trunc(_2347);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    int _2385 = int(_2231) + int(_2323);
    float _2387 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2389 = ~_1810;
    int _2391 = _2389 + 1;
    out.m_70.x = _2371;
    out.m_70.y = _2367;
    out.m_70.z = _2365;
    out.m_70.w = _2373;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2395 = _2393 != 0;
    float _2397 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2401 = _2399 != 0;
    float _2403 = trunc(_2281);
    float _2405 = precise::max(_2403, 0.0);
    uint _2407 = uint(_2405);
    int _2409 = int(_2255) + int(_2353);
    float _2411 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2413 = -_1159;
    float _2415 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2397);
    float _2417 = -_1159;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2411);
    int _2421 = int(_2275) + int(_2383);
    int _2423 = _2377 * _2409;
    int _2425 = _2423 + _2195;
    float _2427 = -_1159;
    float _2429 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2387);
    float _2431 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2433 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2435 = _2391 * _2421;
    int _2437 = _2435 + _2205;
    bool _2439 = uint(_2425) >= uint(_1788);
    float _2441 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2429);
    int _2443 = int(_2211) + int(_2407);
    float _2445 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2447 = uint(_2437) >= uint(_1810);
    int _2449 = _2391 * _2385;
    int _2451 = _2449 + _2097;
    bool _2453 = !_2439;
    int _2455 = _2453 ? 0 : (-1);
    float _2457 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2459 = !_2447;
    int _2461 = _2459 ? 0 : (-1);
    float _2463 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2433);
    int _2465 = ~_2409;
    int _2467 = _2465 + _2455;
    int _2469 = _2467 + 1;
    float _2471 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2473 = ~_2421;
    int _2475 = _2473 + _2461;
    int _2477 = _2475 + 1;
    float _2479 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2481 = ~_1788;
    int _2483 = _2481 + 1;
    int _2485 = _1788 * _2469;
    int _2487 = _2485 + _2195;
    float _2489 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2471);
    int _2491 = _1810 * _2477;
    int _2493 = _2491 + _2205;
    float _2495 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2445);
    int _2497 = _2483 * _2443;
    int _2499 = _2497 + _2075;
    bool _2501 = !_2065;
    int _2503 = _2501 ? _2487 : (-1);
    float _2505 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2457);
    bool _2507 = uint(_2451) >= uint(_1810);
    float _2509 = _337 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2511 = !_2083;
    int _2513 = _2511 ? _2493 : (-1);
    float _2515 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2463);
    int _2517 = _2503 >> 31;
    float _2519 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2495);
    bool _2521 = uint(_2499) >= uint(_1788);
    float _2523 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2505);
    int _2525 = _2513 >> 31;
    float _2527 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2479);
    int _2529 = _2517 & 3;
    float _2531 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2489);
    int _2533 = _2525 & 3;
    float _2535 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2537 = _2503 + _2529;
    float _2539 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2415);
    int _2541 = _2513 + _2533;
    float _2543 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2527);
    int _2545 = _2537 >> 2;
    float _2547 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2431);
    int _2549 = _2503 & 3;
    bool _2551 = _2549 != 0;
    float _2553 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2419);
    int _2555 = _2541 >> 2;
    float _2557 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2547);
    int _2559 = _2545 << 4;
    int _2561 = _2559 + 368;
    float _2563 = _2535 * _2539;
    int _2565 = _2551 ? 0 : 1;
    float _2567 = _2535 * _2441;
    int _2569 = _2503 & 3;
    bool _2571 = _2569 != 0;
    uint _2573 = uint(int(uint(_2561) >> uint(2)));
    uint _2575 = uint(int(uint(int(_2573)) >> uint(2)));
    int _2577 = int(_2573) & 3;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[int(_2575)][_2577];
    int _2581 = int(_2573) + 1;
    uint _2583 = uint(int(uint(_2581) >> uint(2)));
    int _2585 = _2581 & 3;
    float _2587 = (*spvDescriptorSet0.vp_c9)._m0[int(_2583)][_2585];
    int _2589 = _2555 << 4;
    int _2591 = _2589 + 512;
    float _2593 = fma(_2509, _2515, _2563);
    bool _2595 = !_2521;
    int _2597 = _2595 ? 0 : (-1);
    out.m_72.x = _2515;
    out.m_72.y = _2519;
    out.m_72.z = _2523;
    bool _2599 = uint(_2569) >= 2u;
    float _2601 = fma(_2509, _2519, _2567);
    bool _2603 = !_2507;
    int _2605 = _2603 ? 0 : (-1);
    uint _2607 = uint(int(uint(_2591) >> uint(2)));
    uint _2609 = uint(int(uint(int(_2607)) >> uint(2)));
    int _2611 = int(_2607) & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    int _2615 = int(_2607) + 1;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    int _2619 = _2615 & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    bool _2623 = uint(_2569) > 1u;
    int _2625 = _2599 ? 0 : 1;
    bool _2627 = _2569 != 3;
    int _2629 = ~_2443;
    int _2631 = _2629 + _2597;
    int _2633 = _2631 + 1;
    int _2635 = _2561 + 8;
    uint _2637 = uint(int(uint(_2635) >> uint(2)));
    uint _2639 = uint(int(uint(int(_2637)) >> uint(2)));
    int _2641 = int(_2637) & 3;
    float _2643 = (*spvDescriptorSet0.vp_c9)._m0[int(_2639)][_2641];
    int _2645 = int(_2637) + 1;
    uint _2647 = uint(int(uint(_2645) >> uint(2)));
    int _2649 = _2645 & 3;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[int(_2647)][_2649];
    int _2653 = ~_2565;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    float _2659 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2661 = ~_2385;
    int _2663 = _2661 + _2605;
    int _2665 = _2663 + 1;
    int _2667 = _1788 * _2633;
    int _2669 = _2667 + _2075;
    int _2671 = ~_2625;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    int _2677 = _2657;
    int _2679 = _2675;
    if (!_2623)
    {
        int _2681 = ~_2565;
        int _2683 = _2681 + 1;
        _2677 = _2683;
    }
    int _2685 = _2677;
    float _2687 = _2535 * _2553;
    int _2689 = _2513 & 3;
    bool _2691 = _2689 != 0;
    int _2693 = _1810 * _2665;
    int _2695 = _2693 + _2097;
    if (_2627)
    {
        int _2697 = ~_2625;
        int _2699 = _2697 + 1;
        _2679 = _2699;
    }
    int _2701 = _2679;
    int _2703 = _2591 + 8;
    uint _2705 = uint(int(uint(_2703) >> uint(2)));
    uint _2707 = uint(int(uint(int(_2705)) >> uint(2)));
    int _2709 = int(_2705) & 3;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[int(_2707)][_2709];
    int _2713 = int(_2705) + 1;
    uint _2715 = uint(int(uint(_2713) >> uint(2)));
    int _2717 = _2713 & 3;
    float _2719 = (*spvDescriptorSet0.vp_c9)._m0[int(_2715)][_2717];
    bool _2721 = uint(_2689) > 1u;
    float _2723 = fma(_2509, _2523, _2687);
    bool _2725 = !_2571;
    int _2727 = _2725 ? 0 : 1;
    int _2729 = _2513 & 3;
    bool _2731 = _2729 != 0;
    int _2733 = abs(_2685);
    int _2735 = _2731 ? 0 : 1;
    bool _2737 = _2569 != 3;
    float _2739 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2659);
    bool _2741 = !_2691;
    int _2743 = _2741 ? 0 : 1;
    bool _2745 = uint(_2689) >= 2u;
    float _2747 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2739);
    int _2749 = ~_2735;
    int _2751 = _2749 + 1;
    int _2753 = _2751 + 1;
    int _2755 = _2753;
    if (!_2721)
    {
        int _2757 = ~_2735;
        int _2759 = _2757 + 1;
        _2755 = _2759;
    }
    int _2761 = _2755;
    int _2763 = _2745 ? 0 : 1;
    bool _2765 = _2689 != 3;
    bool _2767 = _2689 != 3;
    int _2769 = abs(_2761);
    int _2771 = abs(_2727);
    int _2773 = ~_2733;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = abs(_2743);
    int _2781 = _2777 * as_type<int>(_2587);
    int _2783 = ~_2769;
    int _2785 = _2783 + 1;
    int _2787 = _2785 + 1;
    int _2789 = abs(_2701);
    int _2791 = ~_2771;
    int _2793 = _2791 + 1;
    int _2795 = _2793 + 1;
    int _2797 = _2787 * as_type<int>(_2621);
    int _2799 = ~_2789;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    int _2805 = _2795 * as_type<int>(_2579);
    int _2807 = _2805 + _2781;
    int _2809 = ~_2779;
    int _2811 = _2809 + 1;
    int _2813 = _2811 + 1;
    float _2815 = fma(_2535, _2535, 1.0);
    int _2817 = ~_2763;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = _2803 * as_type<int>(_2643);
    int _2825 = _2823 + _2807;
    int _2827 = _2821;
    if (_2765)
    {
        int _2829 = ~_2763;
        int _2831 = _2829 + 1;
        _2827 = _2831;
    }
    int _2833 = _2827;
    int _2835 = _2813 * as_type<int>(_2613);
    int _2837 = _2835 + _2797;
    bool _2839 = !_2395;
    int _2841 = _2839 ? 0 : 1;
    float _2843 = rsqrt(_2815);
    bool _2845 = !_2737;
    int _2847 = _2845 ? 0 : (-1);
    bool _2849 = !_2767;
    int _2851 = _2849 ? 0 : (-1);
    int _2853 = abs(_2833);
    int _2855 = abs(_2841);
    bool _2857 = !_2401;
    int _2859 = _2857 ? 0 : 1;
    int _2861 = abs(_2847);
    int _2863 = abs(_2851);
    float _2865 = _2535 * _2843;
    int _2867 = abs(_2859);
    int _2869 = ~_2853;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = ~_2861;
    int _2877 = _2875 + 1;
    int _2879 = _2877 + 1;
    int _2881 = ~_2863;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    int _2887 = _2873 * as_type<int>(_2711);
    int _2889 = _2887 + _2837;
    int _2891 = _2879 * as_type<int>(_2651);
    int _2893 = _2891 + _2825;
    int _2895 = ~_2867;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _2885 * as_type<int>(_2719);
    int _2903 = _2901 + _2889;
    int _2905 = ~_2855;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    float _2911 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2913 = !_2065;
    int _2915 = _2913 ? _2669 : (-1);
    int _2917 = _2903 * _2899;
    bool _2919 = !_2083;
    int _2921 = _2919 ? _2695 : (-1);
    float _2923 = -_2531;
    float _2925 = _2865 * _2923;
    int _2927 = _2893 * _2909;
    float _2929 = -_2543;
    float _2931 = _2865 * _2929;
    float _2933 = _2911 * _1763;
    float _2935 = fma(_2843, _2441, _2925);
    int _2937 = _2915 * _2855;
    int _2939 = _2937 + _2927;
    float _2941 = _1695 * 0.5;
    int _2943 = _2921 * _2867;
    int _2945 = _2943 + _2917;
    float _2947 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2747);
    float _2949 = fma(_2843, _2539, _2931);
    float _2951 = fma(_1745, -0.5, _2941);
    float _2953 = float(_2939);
    float _2955 = -_2557;
    float _2957 = _2865 * _2955;
    float _2959 = float(_2945);
    float _2961 = _2947 + _1695;
    float _2963 = _1733 + _1695;
    float _2965 = _1774 * _2933;
    float _2967 = -_2911;
    float _2969 = _2967 + 1.0;
    float _2971 = _1784 * _2933;
    out.m_74.x = _2953;
    out.m_74.y = _2959;
    float _2973 = fma(_2843, _2553, _2957);
    float _2975 = _2961 * 0.5;
    float _2977 = _2963 * 0.5;
    float _2979 = _2543 + _2593;
    float _2981 = _2531 + _2601;
    float _2983 = _2557 + _2723;
    float _2985 = fma(_1780, _2965, _1768);
    float _2987 = fma(_1782, _2965, _1770);
    float _2989 = _1774 * _2969;
    float _2991 = fma(_1774, _2971, _1772);
    out.m_76.x = _2949;
    out.m_76.y = _2935;
    out.m_76.z = _2973;
    bool _2993 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2995 = isnan(_1471);
    bool _2997 = _2993 || _2995;
    bool _2999 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3001 = _2997 || _2999;
    out.m_78.x = _2977;
    out.m_78.y = _2951;
    out.m_78.z = _2975;
    out.m_78.w = _1695;
    out.m_80.x = _2985;
    out.m_80.y = _2987;
    out.m_80.z = _2991;
    out.m_80.w = _2989;
    out.m_82.x = _2979;
    out.m_82.y = _2981;
    out.m_82.z = _2983;
    float _3003 = _1770;
    float _3005 = _1768;
    float _3007 = _2947;
    if (!_3001)
    {
        _3003 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3009 = _3003;
    out.gl_Position.x = _1733;
    out.gl_Position.y = _1745;
    out.gl_Position.z = _2947;
    out.gl_Position.w = _1695;
    float _3011 = _3009;
    float _3013 = _3009;
    if (!_3001)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3015 = _3005;
    float _3017 = _3015;
    float _3019 = _3015;
    if (!_3001)
    {
        _1818 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3021 = _1818;
    float _3023 = _3021;
    float _3025 = _3021;
    if (!_3001)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3027 = _3007;
    float _3029 = _3027;
    float _3031 = _3027;
    if (!_3001)
    {
        _1820 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3033 = _1820;
    float _3035 = _3033;
    float _3037 = _3033;
    if (!_3001)
    {
        _1822 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3039 = _1822;
    bool _3041 = !_3001;
    float _3043 = _3039;
    float _3045 = _3039;
    if (!_3041)
    {
        bool _3047 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3049 = isnan(_1471);
        bool _3051 = _3047 || _3049;
        bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3055 = _3051 || _3053;
        if (!_3055)
        {
            float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3059 = _1471 + _3057;
            float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3063 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3061;
            float _3065 = 1.0 / _3063;
            float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3087 = _3059 * _3065;
            float _3089 = precise::clamp(_3087, 0.0, 1.0);
            float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3095 = fma(_3089, _3069, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3097 = fma(_3089, _3093, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3099 = fma(_3089, _3073, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3101 = fma(_3089, _3077, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3103 = fma(_3089, _3081, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3105 = fma(_3089, _3085, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3019 = _3097;
            _3037 = _3103;
            _3013 = _3095;
            _3031 = _3101;
            _3025 = _3099;
            _3045 = _3105;
            _3107 = true;
        }
        else
        {
            bool _3109 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3111 = isnan(_1471);
            bool _3113 = _3109 || _3111;
            bool _3115 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3117 = _3113 || _3115;
            if (!_3117)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3119 = _3011;
            _3013 = _3119;
            if (!_3117)
            {
                _3017 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3121 = _3017;
            _3019 = _3121;
            if (!_3117)
            {
                _3023 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3123 = _3023;
            _3025 = _3123;
            if (!_3117)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3125 = _3029;
            _3031 = _3125;
            if (!_3117)
            {
                _3035 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3127 = _3035;
            _3037 = _3127;
            if (!_3117)
            {
                _3043 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3129 = _3043;
            bool _3131 = !_3117;
            _3045 = _3129;
            if (!_3131)
            {
                bool _3133 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3135 = isnan(_1471);
                bool _3137 = _3133 || _3135;
                bool _3139 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3141 = _3137 || _3139;
                if (!_3141)
                {
                    float _3143 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3145 = _1471 + _3143;
                    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3149 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3147;
                    float _3151 = 1.0 / _3149;
                    float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3173 = _3145 * _3151;
                    float _3175 = precise::clamp(_3173, 0.0, 1.0);
                    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3181 = fma(_3175, _3155, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3183 = fma(_3175, _3179, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3185 = fma(_3175, _3159, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3187 = fma(_3175, _3163, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3189 = fma(_3175, _3167, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3191 = fma(_3175, _3171, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3019 = _3183;
                    _3037 = _3189;
                    _3013 = _3181;
                    _3031 = _3187;
                    _3025 = _3185;
                    _3045 = _3191;
                    _3107 = true;
                }
                else
                {
                    _3019 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3037 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3025 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3045 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3107 = false;
    float _3193 = _3019;
    float _3195 = _3037;
    float _3197 = _3013;
    float _3199 = _3031;
    float _3201 = _3025;
    float _3203 = _3045;
    float _3205 = fma(_2981, -0.5, 0.5);
    float _3207 = precise::clamp(_3205, 0.0, 1.0);
    float _3209 = -_3193;
    float _3211 = _3209 + _3195;
    float _3213 = -_3197;
    float _3215 = _3213 + _3199;
    float _3217 = -_3201;
    float _3219 = _3217 + _3203;
    bool _3221 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3223 = fma(_3207, _3211, _3193);
    float _3225 = fma(_3207, _3215, _3197);
    float _3227 = fma(_3207, _3219, _3201);
    float _3229 = _3223 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3231 = fma(_3225, 0.298911988735198974609375, _3229);
    float _3233 = fma(_3227, 0.114477999508380889892578125, _3231);
    out.m_84.x = 0.0;
    float _3235 = -_3233;
    float _3237 = _3225 + _3235;
    float _3239 = -_3233;
    float _3241 = _3223 + _3239;
    float _3243 = -_3233;
    float _3245 = _3227 + _3243;
    float _3247 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3249 = fma(_3237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3233);
    float _3251 = fma(_3241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3233);
    float _3253 = fma(_3245, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3233);
    out.m_86.w = _3247;
    out.m_88.x = _3249;
    out.m_88.y = _3251;
    out.m_88.z = _3253;
    if (!_3221)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3255 = -_1443;
    float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3259 = -_1445;
    float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3263 = -_1447;
    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3267 = _3257 * _3257;
    float _3269 = fma(_3261, _3261, _3267);
    float _3271 = fma(_3265, _3265, _3269);
    float _3273 = sqrt(_3271);
    float _3275 = rsqrt(_3271);
    float _3277 = -_3273;
    float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3281 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3283 = precise::clamp(_3281, 0.0, 1.0);
    float _3285 = _3261 * _3275;
    float _3287 = _3257 * _3275;
    float _3289 = abs(_3283);
    float _3291 = log2(_3289);
    float _3293 = _3265 * _3275;
    float _3295 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3297 = _2981 * _3287;
    float _3299 = -_3287;
    float _3301 = -_3295;
    float _3303 = fma(_3299, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3301);
    float _3305 = fma(_2979, _3285, _3297);
    float _3307 = -_3293;
    float _3309 = fma(_3307, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3303);
    float _3311 = fma(_2983, _3293, _3305);
    float _3313 = precise::clamp(_3311, 0.0, 1.0);
    float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3317 = _3309 + _3315;
    float _3319 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3321 = _3317 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3323 = precise::clamp(_3321, 0.0, 1.0);
    float _3325 = exp2(_3319);
    float _3327 = _3325 * _3323;
    float _3329 = _3313 * _3327;
    float _3331 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3333 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3335 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3331;
    out.m_84.y = _3333;
    out.m_84.z = _3335;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3107 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3394 = as_type<float>(_125);
        out.gl_Position.z = _3394;
    }
    if (!_111)
    {
        return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_107);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3468 = as_type<float>(_165);
        out.gl_Position.z = _3468;
    }
    if (_157)
    {
        return out;
    }
    float _167 = in.m_55.x;
    float _169 = in.m_55.y;
    float _171 = in.m_55.z;
    float _173 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _167 * _167;
    float _191 = _169 * _169;
    float _193 = _171 * _171;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    bool _213 = _207 > 0.0;
    float _215 = in.m_49.x;
    float _217 = in.m_49.y;
    float _219 = in.m_49.z;
    bool _221 = _209 > 0.0;
    float _223 = in.m_64.w;
    int _225 = as_type<int>(_187) & 1;
    bool _227 = _225 != 0;
    int _229 = as_type<int>(_187) & 2;
    bool _231 = _229 != 0;
    float _233 = _201;
    float _235 = _167;
    float _237 = _169;
    float _239 = _171;
    if (_213)
    {
        float _241 = rsqrt(_201);
        _233 = _241;
    }
    float _243 = _233;
    bool _245 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _249 = _245 || _247;
    bool _251 = isnan(1.0);
    bool _253 = _249 || _251;
    float _255 = 0.0;
    float _257 = 0.0;
    if (!_213)
    {
        _255 = 0.0;
        _257 = 0.0;
    }
    float _259 = _255;
    float _261 = _257;
    bool _263 = _211 > 0.0;
    float _265 = in.m_44.x;
    float _267 = in.m_44.y;
    float _269 = in.m_44.z;
    float _271 = 0.0;
    float _273 = _259;
    float _275 = _261;
    if (!_213)
    {
        _271 = 0.0;
    }
    float _277 = _271;
    float _279 = 0.0;
    float _281 = 0.0;
    float _283 = _277;
    if (!_221)
    {
        _279 = 0.0;
        _281 = 0.0;
    }
    float _285 = _279;
    float _287 = _281;
    float _289 = 0.0;
    float _291 = _287;
    float _293 = _285;
    if (_221)
    {
        float _295 = rsqrt(_203);
        _289 = _295;
    }
    float _297 = _289;
    float _299 = 0.0;
    if (!_221)
    {
        _299 = 0.0;
    }
    float _301 = _299;
    float _303 = _243;
    float _305 = _301;
    if (_213)
    {
        float _307 = _243 * _175;
        _273 = _307;
    }
    float _309 = _273;
    if (_213)
    {
        float _311 = _243 * _167;
        _283 = _311;
    }
    float _313 = _283;
    float _315 = _313;
    if (_213)
    {
        float _317 = _243 * _181;
        _275 = _317;
    }
    float _319 = _275;
    if (!_253)
    {
        float _321 = _173 * _173;
        float _323 = _321 * 0.5;
        _303 = _323;
    }
    float _325 = _303;
    float _327 = 0.0;
    float _329 = _325;
    if (_263)
    {
        float _331 = rsqrt(_205);
        _327 = _331;
    }
    float _333 = _327;
    bool _335 = !_227;
    float _337 = _335 ? (-0.5) : 0.5;
    float _339 = _297;
    if (_221)
    {
        float _341 = _297 * _177;
        _291 = _341;
    }
    float _343 = _291;
    if (_221)
    {
        float _345 = _297 * _169;
        _293 = _345;
    }
    float _347 = _293;
    if (_221)
    {
        float _349 = _297 * _183;
        _305 = _349;
    }
    float _351 = _305;
    if (!_263)
    {
        _339 = 0.0;
    }
    float _353 = _339;
    float _355 = _353;
    if (!_253)
    {
        float _357 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _329 = _357;
    }
    float _359 = _329;
    bool _361 = !_231;
    float _363 = _361 ? (-0.5) : 0.5;
    bool _365 = !_253;
    float _367 = _359;
    float _369 = 0.0;
    if (!_365)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _377 = _375 + 1.0;
        float _379 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _381 = _173 * _373;
        float _383 = 1.0 / _377;
        float _385 = _379 * 0.693147182464599609375;
        float _387 = exp2(_381);
        float _389 = 1.0 / _385;
        float _391 = _387 + (-1.0);
        float _393 = -_391;
        float _395 = fma(_393, _389, _173);
        float _397 = _395 * _383;
        float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _367 = _399;
        _369 = _389;
    }
    float _401 = _367;
    float _403 = _369;
    float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _407 = _403;
    float _409 = _401;
    if (_263)
    {
        float _411 = _333 * _171;
        _355 = _411;
    }
    float _413 = _355;
    float _415 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_263)
    {
        _407 = 0.0;
    }
    float _417 = _407;
    float _419 = _405 * _313;
    float _421 = _405 * _347;
    float _423 = _405 * _413;
    float _425 = _417;
    if (_263)
    {
        float _427 = _333 * _179;
        _425 = _427;
    }
    float _429 = _425;
    float _431 = fma(_415, _309, _419);
    float _433 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_263)
    {
        _315 = 0.0;
    }
    float _435 = _315;
    float _437 = _435;
    if (_263)
    {
        float _439 = _333 * _185;
        _437 = _439;
    }
    float _441 = _437;
    float _443 = fma(_415, _343, _421);
    float _445 = fma(_415, _429, _423);
    float _447 = fma(_433, _319, _431);
    if (!_253)
    {
        _409 = _173;
    }
    float _449 = _409;
    bool _451 = !_253;
    float _453 = _449;
    if (!_451)
    {
        float _455 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _457 = log2(_455);
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _461 = _459 + 1.0;
        float _463 = 1.0 / _461;
        float _465 = _173 * _457;
        float _467 = exp2(_465);
        float _469 = -_467;
        float _471 = _469 + 1.0;
        float _473 = _471 * _463;
        _453 = _473;
    }
    float _475 = _453;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _479 = fma(_433, _351, _443);
    float _481 = fma(_433, _441, _445);
    float _483 = fma(_475, _215, _447);
    float _485 = fma(_475, _217, _479);
    float _487 = fma(_475, _219, _481);
    float _489 = fma(_483, _223, _265);
    float _491 = fma(_485, _223, _267);
    float _493 = fma(_487, _223, _269);
    bool _495 = !_477;
    float _497 = _489;
    float _513;
    if (!_495)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_107);
        float _519 = 1.0 / _517;
        float _521 = _145 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = in.m_51.y;
    float _527 = _131 * 2.0;
    float _529 = in.m_51.z;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _539 = floor(_527);
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _543 = _541 != 0;
    float _545 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _549 = 1.0 / _533;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _553 = -_547;
    float _555 = fma(_545, 2.0, _553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _557;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _563 = 1.0 / _537;
    float _565 = _525 * 2.0;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _569 = _523 + _567;
    float _571 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _573 = _529 * 2.0;
    bool _575 = _539 > 0.0;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _579 = _569 * _549;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _583 = _523 + _581;
    float _585 = _131 + _525;
    float _587 = floor(_565);
    float _589 = fma(_571, -2.0, _551);
    float _591 = _585 + (-1.0);
    bool _593 = _539 >= 0.0;
    bool _595 = isnan(_539);
    bool _597 = _593 || _595;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    float _603 = _583 * _563;
    float _605 = _529 + _525;
    float _607 = floor(_573);
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _611 = _605 + (-1.0);
    int _613 = as_type<int>(_591);
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (_543)
    {
        _613 = 0;
    }
    int _617 = _613;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _621 = _523 + _619;
    int _623 = _617;
    if (!_543)
    {
        _623 = 1;
    }
    int _625 = _623;
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _629 = _601 ? 0 : 1;
    float _631 = 1.0 / _559;
    bool _633 = _625 != 1;
    bool _635 = _587 > 0.0;
    bool _637 = _587 >= 0.0;
    bool _639 = isnan(_587);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _649 = int(_647);
    float _651 = _131 + _529;
    bool _653 = _607 > 0.0;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _655;
    bool _659 = _607 >= 0.0;
    bool _661 = isnan(_607);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _669;
    float _673 = _651 + (-1.0);
    float _675 = fma(_657, _579, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _677 = fma(_671, _579, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (!_633)
    {
        _615 = _525;
    }
    float _679 = _615;
    float _681 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _683 = _645 ? 0 : 1;
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _687 = int(_685);
    int _689 = _667 ? 0 : 1;
    float _691 = _621 * _631;
    float _693 = _679;
    if (_633)
    {
        _693 = _131;
    }
    float _695 = _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _701 = ~_629;
    int _703 = _701 + 1;
    int _705 = _703 + 1;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _711 = _705;
    float _713 = _695;
    if (!_575)
    {
        int _715 = ~_629;
        int _717 = _715 + 1;
        _711 = _717;
    }
    int _719 = _711;
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[83].z, _561);
    int _723 = ~_683;
    int _725 = _723 + 1;
    int _727 = _725 + 1;
    float _729 = fma(_699, _603, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _731 = ~_689;
    int _733 = _731 + 1;
    int _735 = _733 + 1;
    float _737 = fma(_709, _603, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _739 = _727;
    int _741 = _735;
    if (!_635)
    {
        int _743 = ~_683;
        int _745 = _743 + 1;
        _739 = _745;
    }
    int _747 = _739;
    if (!_653)
    {
        int _749 = ~_689;
        int _751 = _749 + 1;
        _741 = _751;
    }
    int _753 = _741;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _765 = _763 != 0;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _769 = _767 != 0;
    if (!_633)
    {
        _713 = _525;
    }
    float _771 = _713;
    float _773 = _771;
    if (_633)
    {
        _773 = _131;
    }
    float _775 = _773;
    bool _777 = !_765;
    int _779 = _777 ? 0 : 1;
    bool _781 = !_761;
    int _783 = _781 ? 0 : 1;
    float _785 = _775 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _787 = !_769;
    int _789 = _787 ? 0 : 1;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _793 = _791 != 0;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _797 = _795 != 0;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _801 = _799 != 0;
    float _803 = -_577;
    float _805 = fma(_785, 2.0, _803);
    float _807 = float(_107);
    if (!_633)
    {
        _115 = _529;
    }
    float _809 = _115;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _813 = !_793;
    int _815 = _813 ? 0 : 1;
    float _817 = _809;
    if (_633)
    {
        _817 = _525;
    }
    float _819 = _817;
    float _821 = 1.0 / _807;
    bool _823 = !_797;
    int _825 = _823 ? 0 : 1;
    int _827 = abs(_815);
    float _829 = _757 * _145;
    int _831 = abs(_825);
    float _833 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[83].w, _811);
    float _835 = float(_719);
    float _837 = _819;
    if (!_633)
    {
        _837 = _529;
    }
    float _839 = _837;
    float _841 = exp2(_829);
    float _843 = float(_747);
    float _845 = _839;
    if (_633)
    {
        _845 = _525;
    }
    float _847 = _845;
    float _849 = _821 * _145;
    float _851 = float(_827);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _855 = float(_753);
    float _857 = _847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _859 = float(_649);
    bool _861 = !_801;
    int _863 = _861 ? 0 : 1;
    float _865 = _851 * _855;
    float _867 = fma(_857, -2.0, _853);
    float _869 = in.m_66.x;
    float _871 = in.m_66.y;
    float _873 = in.m_66.z;
    float _875 = 1.0 / _859;
    int _877 = abs(_863);
    float _879 = -_841;
    float _881 = _879 + 1.0;
    float _883 = float(_687);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _887 = 1.0 + _885;
    float _889 = float(_877);
    float _891 = -_145;
    float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[76].x, _555);
    float _895 = 1.0 / _883;
    float _897 = float(_831);
    float _899 = _889 * _843;
    bool _901 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _903 = isnan(0.0);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _909 = _905 || _907;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _913 = _897 * _835;
    bool _915 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _917 = isnan(1.0);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _923 = _919 || _921;
    float _925 = 1.0 / _887;
    float _927 = _909 ? _881 : 0.0;
    float _929 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].w, _911);
    float _931 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _721);
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _935 = _913 * (-2.0);
    bool _937 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _939 = isnan(_523);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _875 * _145;
    float _951 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _589);
    float _953 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _929);
    float _955 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _867);
    float _957 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _933);
    float _959 = fma(_627, _935, _627);
    float _961 = fma(_935, _871, _871);
    float _963 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _833);
    float _965 = _865 * (-2.0);
    bool _967 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _969 = isnan(_523);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = _525 + (-0.5);
    float _981 = -_947;
    float _983 = _981 + 1.0;
    float _985 = _895 * _145;
    float _987 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _957);
    float _989 = -_145;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[81].x, _805);
    if (_923)
    {
        float _993 = _927 * _925;
        _147 = _993;
    }
    float _995 = _147;
    float _997 = fma(_609, _965, _609);
    float _999 = fma(_965, _869, _869);
    float _1001 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[196].y, _961);
    bool _1003 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1005 = isnan(_523);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = _977 * _983;
    float _1017 = -_977;
    float _1019 = _1017 + 1.0;
    float _1021 = fma(_959, _995, _1001);
    bool _1023 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1025 = isnan(_523);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = _899 * (-2.0);
    float _1037 = _1013 * _1019;
    float _1039 = -_1013;
    float _1041 = _1039 + 1.0;
    float _1043 = _131 + (-0.5);
    float _1045 = fma(_1035, _873, _873);
    float _1047 = fma(_681, _1035, _681);
    float _1049 = _1033 * _1041;
    float _1051 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].x, _999);
    float _1053 = _529 + (-0.5);
    float _1055 = _677 * _1049;
    float _1057 = _675 * _1049;
    float _1059 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1045);
    float _1061 = in.m_64.x;
    float _1063 = in.m_64.y;
    float _1065 = fma(_997, _995, _1051);
    float _1067 = fma(_1047, _995, _1059);
    float _1069 = -_1033;
    float _1071 = _1069 + 1.0;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1077;
    float _1081 = _1021 * 0.15915493667125701904296875;
    float _1083 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1057);
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1055);
    float _1087 = fma(_1079, _691, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1089 = _1065 * 0.15915493667125701904296875;
    float _1091 = fma(_729, _1037, _1083);
    float _1093 = fma(_1075, _691, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1095 = _1067 * 0.15915493667125701904296875;
    float _1097 = fma(_737, _1037, _1085);
    float _1099 = fma(_1087, _1015, _1091);
    float _1101 = _1081 * 6.283185482025146484375;
    float _1103 = sin(_1101);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _337);
    float _1107 = fma(_1093, _1015, _1097);
    float _1109 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1099);
    float _1111 = _491 * _183;
    float _1113 = in.m_59.w;
    float _1115 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1107);
    float _1117 = _1081 * 6.283185482025146484375;
    float _1119 = cos(_1117);
    float _1121 = _1109 * _1061;
    float _1123 = _1115 * _1063;
    float _1125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _363);
    float _1127 = fma(_489, _181, _1111);
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1133 = _1089 * 6.283185482025146484375;
    float _1135 = cos(_1133);
    float _1137 = _1129 * _1105;
    float _1139 = _1131 * _1125;
    float _1141 = in.m_57.w;
    float _1143 = fma(_493, _185, _1127);
    float _1145 = _1089 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    float _1149 = _1095 * 6.283185482025146484375;
    float _1151 = cos(_1149);
    float _1153 = _1135 * _1119;
    float _1155 = _1135 * _1103;
    float _1157 = _1095 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = _1147 * _1103;
    float _1163 = _1147 * _1119;
    float _1165 = _1135 * _1151;
    float _1167 = _1103 * _1151;
    float _1169 = _1147 * _1151;
    float _1171 = _1119 * _1151;
    float _1173 = _1165 * _1139;
    float _1175 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1177 = _1169 * _1139;
    float _1179 = fma(_1159, _1153, _1161);
    float _1181 = -_1139;
    float _1183 = _1159 * _1181;
    float _1185 = -_1163;
    float _1187 = fma(_1159, _1155, _1185);
    float _1189 = -_1155;
    float _1191 = fma(_1159, _1163, _1189);
    float _1193 = fma(_1179, _1137, _1173);
    float _1195 = fma(_1171, _1137, _1183);
    float _1197 = fma(_1159, _1161, _1153);
    float _1199 = fma(_1191, _1137, _1177);
    float _1201 = fma(_1187, _1175, _1193);
    float _1203 = fma(_1167, _1175, _1195);
    float _1205 = _491 * _177;
    float _1207 = fma(_1197, _1175, _1199);
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1213 = fma(_489, _175, _1205);
    float _1215 = _1143 + _1113;
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1209);
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1211);
    float _1221 = fma(_493, _179, _1213);
    float _1223 = _491 * _169;
    float _1225 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1217);
    float _1227 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1219);
    float _1229 = _1221 + _1141;
    float _1231 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1233 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1237 = fma(_489, _167, _1223);
    float _1239 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1231);
    float _1241 = _1215 + _1233;
    float _1243 = _1229 + _1235;
    float _1245 = in.m_55.w;
    float _1247 = fma(_493, _171, _1237);
    float _1249 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1251 = _1241 + _1249;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1255 = _1243 + _1253;
    float _1257 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1239);
    float _1259 = _1251 * _1251;
    float _1261 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1263 = fma(_1255, _1255, _1259);
    float _1265 = sqrt(_1263);
    float _1267 = _1247 + _1245;
    float _1269 = _1267 + _1261;
    bool _1271 = _1265 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1275 = _1273 != 0;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1279 = _1277 != 0;
    int _1281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1283 = _1281 != 0;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1287 = _1285 != 0;
    bool _1289 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1291 = isnan(0.5);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1297 = _1293 || _1295;
    bool _1299 = !_1279;
    int _1301 = _1299 ? 0 : 1;
    bool _1303 = !_1275;
    int _1305 = _1303 ? 0 : 1;
    bool _1307 = !_1283;
    int _1309 = _1307 ? 0 : 1;
    bool _1311 = !_1287;
    int _1313 = _1311 ? 0 : 1;
    float _1315 = _1263;
    float _1317 = _1255;
    float _1319 = _1251;
    float _1321 = _1243;
    if (!_1271)
    {
        _235 = _1243;
    }
    float _1323 = _235;
    float _1325 = _1323;
    if (!_1271)
    {
        _497 = _1241;
    }
    float _1327 = _497;
    float _1329 = _1327;
    if (!_1271)
    {
        _237 = _1269;
    }
    float _1331 = _237;
    bool _1333 = !_1271;
    float _1335 = _1331;
    if (!_1333)
    {
        float _1337 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1341 = _1265 + _1339;
        float _1343 = rsqrt(_1263);
        float _1345 = _1341 * _1337;
        float _1347 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = _1345 * 0.15915493667125701904296875;
        float _1351 = _1349 * 6.283185482025146484375;
        float _1353 = sin(_1351);
        float _1355 = _1349 * 6.283185482025146484375;
        float _1357 = cos(_1355);
        float _1359 = fma(_1353, _1347, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1361 = _1343 * _1359;
        float _1363 = _1357 + (-1.0);
        float _1365 = fma(_1255, _1361, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1367 = fma(_1251, _1361, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1369 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = fma(_1269, _1357, _1369);
        _1325 = _1365;
        _1335 = _1371;
        _1329 = _1367;
        _1315 = _1343;
        _239 = _1369;
    }
    float _1373 = _1325;
    float _1375 = _1335;
    float _1377 = _1329;
    float _1379 = _1315;
    float _1381 = _239;
    float _1383 = _1379;
    float _1385 = _1381;
    if (_1297)
    {
        _1317 = _1373;
    }
    float _1387 = _1317;
    float _1389 = _1387;
    if (_1297)
    {
        _1319 = _1375;
    }
    float _1391 = _1319;
    float _1393 = _1391;
    if (_1297)
    {
        _1383 = _1377;
    }
    float _1395 = _1383;
    float _1397 = _1395;
    if (!_1297)
    {
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1401 = _1267 + _1399;
        float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1405 = _1229 + _1403;
        float _1407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1409 = -_1215;
        float _1411 = _1409 + _1377;
        float _1413 = _1401 * _1401;
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1417 = _1215 + _1415;
        float _1419 = fma(_1405, _1405, _1413);
        float _1421 = fma(_1417, _1417, _1419);
        float _1423 = -_1229;
        float _1425 = _1423 + _1373;
        float _1427 = sqrt(_1421);
        float _1429 = precise::min(_1427, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1431 = _1429 * _1407;
        float _1433 = -_1267;
        float _1435 = _1433 + _1375;
        float _1437 = fma(_1425, _1431, _1229);
        float _1439 = fma(_1435, _1431, _1267);
        float _1441 = fma(_1411, _1431, _1215);
        _1393 = _1439;
        _1389 = _1437;
        _1397 = _1441;
        _1385 = _1427;
    }
    float _1443 = _1393;
    float _1445 = _1389;
    float _1447 = _1397;
    float _1449 = _1385;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1453 = _1443 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1457 = _1445 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1447 + _1459;
    float _1463 = _1453 * _1453;
    float _1465 = fma(_1457, _1457, _1463);
    float _1467 = fma(_1461, _1461, _1465);
    float _1469 = rsqrt(_1467);
    float _1471 = sqrt(_1467);
    float _1473 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1475 = _1457 * _1473;
    float _1477 = _1461 * _1473;
    float _1479 = _1475 * _1475;
    float _1481 = _1477 * _1477;
    float _1483 = _1479 + _1481;
    float _1485 = sqrt(_1483);
    bool _1487 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = _1485 + _1489;
    float _1493 = _1375;
    float _1495 = _1491;
    float _1497 = _1449;
    float _1499 = _1453;
    float _1501 = _1475;
    if (_1487)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1503;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    if (_1487)
    {
        float _1509 = _1491 * _1505;
        _1495 = _1509;
    }
    float _1511 = _1495;
    if (_1487)
    {
        float _1513 = rsqrt(_1483);
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = _1515;
    if (_1487)
    {
        float _1519 = _1511 * 0.15915493667125701904296875;
        _1497 = _1519;
    }
    float _1521 = _1497;
    float _1523 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1525 = _1461;
    if (_1487)
    {
        float _1527 = _1521 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1525 = _1529;
    }
    float _1531 = _1525;
    float _1533 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1535 = precise::max(0.0, _1523);
    float _1537 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1533);
    float _1539 = _1373;
    float _1541 = _1535;
    if (_1487)
    {
        float _1543 = _1521 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        _1539 = _1545;
    }
    float _1547 = _1539;
    float _1549 = -_1473;
    float _1551 = -_1535;
    float _1553 = fma(_1453, _1549, _1551);
    float _1555 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1537);
    float _1557 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1487)
    {
        float _1559 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1559;
    }
    float _1561 = _1499;
    float _1563 = _1531;
    float _1565 = _1561;
    if (_1487)
    {
        float _1567 = fma(_1531, _1561, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1563 = _1567;
    }
    float _1569 = _1563;
    float _1571 = _1569;
    if (!_1487)
    {
        _1565 = _1553;
    }
    float _1573 = _1565;
    float _1575 = _1573;
    if (_1487)
    {
        float _1577 = _1515 * _1569;
        _1321 = _1577;
    }
    float _1579 = _1321;
    if (!_1487)
    {
        _1571 = _1479;
    }
    float _1581 = _1571;
    float _1583 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1585 = _1581;
    float _1587 = _1547;
    if (_1487)
    {
        float _1589 = _1547 + (-1.0);
        _1541 = _1589;
    }
    float _1591 = _1541;
    float _1593 = _1591;
    if (_1487)
    {
        float _1595 = _1475 * _1579;
        _1501 = _1595;
    }
    float _1597 = _1501;
    float _1599 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1583);
    if (_1487)
    {
        float _1601 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1517 = _1601;
    }
    float _1603 = _1517;
    if (!_1487)
    {
        _1593 = _1477;
    }
    float _1605 = _1593;
    float _1607 = _1605;
    if (_1487)
    {
        float _1609 = _1477 * _1579;
        _1607 = _1609;
    }
    float _1611 = _1607;
    if (_1487)
    {
        float _1613 = _1597 * _1597;
        _1585 = _1613;
    }
    float _1615 = _1585;
    if (_1487)
    {
        float _1617 = fma(_1553, _1547, _1603);
        _1575 = _1617;
    }
    float _1619 = _1575;
    if (!_1487)
    {
        _1587 = _1481;
    }
    float _1621 = _1587;
    float _1623 = _1621;
    if (_1487)
    {
        float _1625 = _1611 * _1611;
        _1623 = _1625;
    }
    float _1627 = _1623;
    float _1629 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1631 = fma(_1619, _1619, _1615);
    float _1633 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1599);
    float _1635 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1637 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1629);
    float _1639 = _1631 + _1627;
    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1643 = fma(_1471, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1641);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1649 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1637);
    float _1651 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1653 = -_1645;
    float _1655 = _1653 + 1.0;
    float _1657 = rsqrt(_1639);
    float _1659 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1647);
    float _1661 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1663 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1665 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1659);
    float _1667 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1669 = -_1663;
    float _1671 = fma(_1669, _1557, 1.0);
    float _1673 = abs(_1655);
    float _1675 = log2(_1673);
    float _1677 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1679 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1681 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1667);
    float _1683 = _1657 * _1597;
    float _1685 = _1657 * _1619;
    float _1687 = _1657 * _1611;
    float _1689 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1681);
    float _1691 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1693 = log2(_1671);
    float _1695 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1689);
    float _1697 = -_1691;
    float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1697);
    float _1701 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1703 = _1685 + 1.0;
    float _1705 = -_1687;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1699);
    float _1709 = 1.0 / _1695;
    float _1711 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1713 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1679);
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1707, 0.5, 0.5);
    float _1719 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1711);
    float _1721 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1713);
    float _1723 = exp2(_1701);
    float _1725 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1727 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1719);
    float _1729 = _1693 * 0.693147182464599609375;
    float _1731 = fma(_1717, _1725, -0.212114393711090087890625);
    float _1733 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1727);
    float _1735 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = sqrt(_1715);
    float _1739 = _1733 * _1709;
    float _1741 = -_1685;
    float _1743 = fma(_1723, _1703, _1741);
    float _1745 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1721);
    float _1747 = fma(_1717, _1731, 1.570728778839111328125);
    float _1749 = fma(_1739, 0.5, 0.5);
    float _1751 = fma(_1743, 0.5, 0.5);
    float _1753 = _1745 * _1709;
    float _1755 = _1737 * 0.636619746685028076171875;
    float _1757 = fma(_1753, -0.5, 0.5);
    float _1759 = -_1747;
    float _1761 = fma(_1755, _1759, 1.0);
    float3 _5912 = float3(_1749, _1757, _1735);
    float _1763 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).x;
    float3 _5923 = float3(_1749, _1757, _1735);
    float4 _1766 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).xyzw;
    float _1768 = _1766.x;
    float _1770 = _1766.y;
    float _1772 = _1766.z;
    float _1774 = _1766.w;
    float2 _5940 = float2(_1761, _1751);
    float3 _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5940, float2(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5940, float2(0.0), isnan(_5940)), level(0.0)).xyz;
    float _1780 = _1778.x;
    float _1782 = _1778.y;
    float _1784 = _1778.z;
    float _1786 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1788 = int(_1786);
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1792 = _1790 != 0;
    float _1794 = -_931;
    float _1796 = _1794 + 1.0;
    bool _1798 = _131 > 0.5;
    float _1800 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1802 = _525 > 0.5;
    out.m_68.x = _1445;
    out.m_68.y = _1443;
    out.m_68.z = _1447;
    int _1804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1806 = _1804 != 0;
    float _1808 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1810 = int(_1808);
    bool _1812 = _529 > 0.5;
    int _1814 = abs(_1301);
    float _1816 = 0.0;
    float _1818 = _1695;
    float _1820 = _1745;
    float _1822 = _1733;
    if (_1792)
    {
        _1816 = 1.0;
    }
    float _1824 = _1816;
    float _1826 = trunc(_949);
    int _1828 = int(_1826);
    float _1830 = float(uint(_1788));
    float _1832 = _1824;
    if (!_1792)
    {
        _1832 = 1.2345600128173828125;
    }
    float _1834 = _1832;
    int _1836 = abs(_1309);
    int _1838 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1840 = _1838 != 0;
    float _1842 = 1.0 / _1830;
    float _1844 = float(uint(_1810));
    float _1846 = float(_1810);
    int _1848 = abs(_1313);
    float _1850 = 1.0 / _1844;
    float _1852 = trunc(_985);
    int _1854 = int(_1852);
    int _1856 = as_type<int>(_1842) + (-2);
    float _1858 = float(uint(_1828));
    int _1860 = ~_1810;
    int _1862 = _1860 + 1;
    float _1864 = as_type<float>(_1856) * _1858;
    int _1866 = as_type<int>(_1850) + (-2);
    float _1868 = exp2(_1800);
    float _1870 = _1858;
    if (_1792)
    {
        _1870 = 1.0;
    }
    float _1872 = _1870;
    float _1874 = _1872;
    if (!_1792)
    {
        _1874 = 7.345489978790283203125;
    }
    float _1876 = _1874;
    int _1878 = ~_1788;
    int _1880 = _1878 + 1;
    float _1882 = float(uint(_1854));
    float _1884 = trunc(_1864);
    float _1886 = precise::max(_1884, 0.0);
    uint _1889 = uint(_1886);
    float _1891 = _1876 * _131;
    float _1893 = as_type<float>(_1866) * _1882;
    float _1895 = _1882;
    if (_1792)
    {
        _1895 = _131;
    }
    float _1897 = _1895;
    float _1899 = _1897;
    if (!_1792)
    {
        _1899 = _525;
    }
    float _1901 = _1899;
    float _1903 = floor(_1891);
    float _1905 = float(_1828);
    float _1907 = -_1868;
    float _1909 = _1907 + 1.0;
    float _1911 = _1834 * _1901;
    float _1913 = trunc(_1893);
    float _1915 = precise::max(_1913, 0.0);
    uint _1917 = uint(_1915);
    int _1919 = _1880 * int(_1889);
    int _1921 = _1919 + _1828;
    float _1923 = float(uint(_1921));
    float _1925 = -_1903;
    float _1927 = _1891 + _1925;
    float _1929 = as_type<float>(_1856) * _1923;
    float _1931 = float(_1788);
    int _1933 = _1862 * int(_1917);
    int _1935 = _1933 + _1854;
    float _1937 = trunc(_1929);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    bool _1943 = _1905 >= _1931;
    bool _1945 = isnan(_1905);
    bool _1947 = _1943 || _1945;
    bool _1949 = isnan(_1931);
    bool _1951 = _1947 || _1949;
    float _1953 = float(_1951);
    float _1955 = _1927 * _1931;
    int _1957 = ~_1788;
    int _1959 = _1957 + 1;
    float _1961 = float(uint(_1935));
    float _1963 = float(_1854);
    float _1965 = floor(_1911);
    float _1967 = as_type<float>(_1866) * _1961;
    float _1969 = trunc(_1967);
    float _1971 = precise::max(_1969, 0.0);
    uint _1973 = uint(_1971);
    int _1975 = int(_1889) + int(_1941);
    int _1977 = _1959 * _1975;
    int _1979 = _1977 + _1828;
    int _1981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1983 = _1981 != 0;
    float _1985 = -_1965;
    float _1987 = _1911 + _1985;
    float _1989 = trunc(_1955);
    int _1991 = int(_1989);
    bool _1993 = _1963 >= _1846;
    bool _1995 = isnan(_1963);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(_1846);
    bool _2001 = _1997 || _1999;
    float _2003 = float(_2001);
    bool _2005 = uint(_1979) >= uint(_1788);
    float _2007 = _1987 * _1846;
    bool _2009 = !_1983;
    int _2011 = _2009 ? 0 : 1;
    int _2013 = int(_1917) + int(_1973);
    float _2015 = trunc(_1953);
    int _2017 = int(_2015);
    int _2019 = ~_1810;
    int _2021 = _2019 + 1;
    bool _2023 = !_2005;
    int _2025 = _2023 ? 0 : (-1);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2029 = _2027 != 0;
    int _2031 = _2021 * _2013;
    int _2033 = _2031 + _1854;
    int _2035 = ~_1975;
    int _2037 = _2035 + _2025;
    int _2039 = _2037 + 1;
    float _2041 = trunc(_2007);
    int _2043 = int(_2041);
    int _2045 = abs(_2011);
    bool _2047 = uint(_2033) >= uint(_1810);
    float _2049 = _1931 * _849;
    bool _2051 = !_2029;
    int _2053 = _2051 ? 0 : 1;
    float _2055 = _1846 * _849;
    bool _2057 = !_2047;
    int _2059 = _2057 ? 0 : (-1);
    float _2061 = trunc(_2003);
    int _2063 = int(_2061);
    bool _2065 = _1788 == 0;
    int _2067 = ~_2013;
    int _2069 = _2067 + _2059;
    int _2071 = _2069 + 1;
    int _2073 = _1991 * _2045;
    int _2075 = _2073 + _1828;
    int _2077 = abs(_2053);
    int _2079 = _1788 * _2039;
    int _2081 = _2079 + _1828;
    bool _2083 = _1810 == 0;
    int _2085 = _1810 * _2071;
    int _2087 = _2085 + _1854;
    int _2089 = ~_2017;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    int _2095 = _2043 * _2077;
    int _2097 = _2095 + _1854;
    bool _2099 = !_2065;
    int _2101 = _2099 ? _2081 : (-1);
    float _2103 = trunc(_2049);
    int _2105 = int(_2103);
    bool _2107 = !_2083;
    int _2109 = _2107 ? _2087 : (-1);
    int _2111 = abs(_779);
    int _2113 = _2101 * _2093;
    int _2115 = ~_2063;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    int _2121 = _1788 + (-1);
    float _2123 = trunc(_2055);
    int _2125 = int(_2123);
    int _2127 = _1810 + (-1);
    int _2129 = _2109 * _2119;
    int _2131 = _2017 * _2121;
    int _2133 = _2131 + _2113;
    int _2135 = abs(_1305);
    int _2137 = _2063 * _2127;
    int _2139 = _2137 + _2129;
    int _2141 = _2133 * _2111;
    int _2143 = abs(_783);
    int _2145 = abs(_789);
    float _2147 = in.m_51.w;
    int _2149 = _2139 * _1814;
    int _2151 = ~_1810;
    int _2153 = _2151 + 1;
    int _2155 = _2105 * _2143;
    int _2157 = _2155 + _2141;
    int _2159 = _2125 * _2135;
    int _2161 = _2159 + _2149;
    float _2163 = -_337;
    int _2165 = _1798 ? as_type<int>(_2163) : as_type<int>(_337);
    bool _2167 = !_1806;
    int _2169 = _2167 ? 0 : 1;
    int _2171 = _2075 * _2145;
    int _2173 = _2171 + _2157;
    float _2175 = float(uint(_2075));
    bool _2177 = !_1840;
    float _2179 = _2177 ? _337 : as_type<float>(_2165);
    int _2181 = _2097 * _1836;
    int _2183 = _2181 + _2161;
    int _2185 = abs(_2169);
    float _2187 = as_type<float>(_1856) * _2175;
    float _2189 = _2179 + 0.5;
    float _2191 = float(uint(_2097));
    int _2193 = _1991 * _2185;
    int _2195 = _2193 + _2173;
    int _2197 = ~_1788;
    int _2199 = _2197 + 1;
    float _2201 = fma(_2189, (*spvDescriptorSet0.vp_c9)._m0[80].x, _893);
    int _2203 = _2043 * _1848;
    int _2205 = _2203 + _2183;
    float _2207 = trunc(_2187);
    float _2209 = precise::max(_2207, 0.0);
    uint _2211 = uint(_2209);
    float _2213 = float(uint(_2195));
    float _2215 = as_type<float>(_1866) * _2191;
    bool _2217 = _2147 > 0.5;
    float _2219 = float(uint(_2205));
    float _2221 = as_type<float>(_1856) * _2213;
    int _2223 = ~_1810;
    int _2225 = _2223 + 1;
    float _2227 = trunc(_2215);
    float _2229 = precise::max(_2227, 0.0);
    uint _2231 = uint(_2229);
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2235 = _2233 != 0;
    float _2237 = as_type<float>(_1866) * _2219;
    float _2239 = -_337;
    int _2241 = _1812 ? as_type<int>(_2239) : as_type<int>(_337);
    float _2243 = -_363;
    int _2245 = _1802 ? as_type<int>(_2243) : as_type<int>(_363);
    int _2247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2249 = _2247 != 0;
    float _2251 = trunc(_2221);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = _2199 * int(_2211);
    int _2259 = _2257 + _2075;
    int _2261 = ~_1788;
    int _2263 = _2261 + 1;
    float _2265 = -_363;
    int _2267 = _2217 ? as_type<int>(_2265) : as_type<int>(_363);
    float _2269 = float(uint(_2259));
    float _2271 = trunc(_2237);
    float _2273 = precise::max(_2271, 0.0);
    uint _2275 = uint(_2273);
    int _2277 = _2153 * int(_2231);
    int _2279 = _2277 + _2097;
    float _2281 = as_type<float>(_1856) * _2269;
    bool _2283 = !_2235;
    float _2285 = _2283 ? _337 : as_type<float>(_2241);
    float _2287 = float(uint(_2279));
    int _2289 = _2263 * int(_2255);
    int _2291 = _2289 + _2195;
    bool _2293 = !_2249;
    float _2295 = _2293 ? _363 : as_type<float>(_2267);
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2299 = _2297 != 0;
    float _2301 = as_type<float>(_1866) * _2287;
    float _2303 = float(uint(_2291));
    float _2305 = _2285 + 0.5;
    bool _2307 = !_2299;
    float _2309 = _2307 ? _363 : as_type<float>(_2245);
    int _2311 = _2225 * int(_2275);
    int _2313 = _2311 + _2205;
    float _2315 = _2295 + (-0.5);
    float _2317 = as_type<float>(_1856) * _2303;
    float _2319 = trunc(_2301);
    float _2321 = precise::max(_2319, 0.0);
    uint _2323 = uint(_2321);
    float _2325 = _2309 + (-0.5);
    float _2327 = float(uint(_2313));
    float _2329 = fma(_2305, (*spvDescriptorSet0.vp_c9)._m0[85].x, _991);
    float _2331 = -_2315;
    float _2333 = -_955;
    float _2335 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2333);
    float _2337 = -_2325;
    float _2339 = -_951;
    float _2341 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2339);
    float _2343 = -_953;
    float _2345 = _2343 + 1.0;
    float _2347 = as_type<float>(_1866) * _2327;
    float _2349 = trunc(_2317);
    float _2351 = precise::max(_2349, 0.0);
    uint _2353 = uint(_2351);
    float _2355 = -_987;
    float _2357 = _2355 + 1.0;
    float _2359 = -_963;
    float _2361 = _2359 + 1.0;
    float _2363 = -_1796;
    float _2365 = fma(_2285, _2363, _2329);
    float _2367 = fma(_2309, _2345, _2341);
    float _2369 = -_2357;
    float _2371 = fma(_2179, _2369, _2201);
    float _2373 = fma(_2295, _2361, _2335);
    int _2375 = ~_1788;
    int _2377 = _2375 + 1;
    float _2379 = trunc(_2347);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    int _2385 = int(_2231) + int(_2323);
    float _2387 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2389 = ~_1810;
    int _2391 = _2389 + 1;
    out.m_70.x = _2371;
    out.m_70.y = _2367;
    out.m_70.z = _2365;
    out.m_70.w = _2373;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2395 = _2393 != 0;
    float _2397 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2401 = _2399 != 0;
    float _2403 = trunc(_2281);
    float _2405 = precise::max(_2403, 0.0);
    uint _2407 = uint(_2405);
    int _2409 = int(_2255) + int(_2353);
    float _2411 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2413 = -_1159;
    float _2415 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2397);
    float _2417 = -_1159;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2411);
    int _2421 = int(_2275) + int(_2383);
    int _2423 = _2377 * _2409;
    int _2425 = _2423 + _2195;
    float _2427 = -_1159;
    float _2429 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2387);
    float _2431 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2433 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2435 = _2391 * _2421;
    int _2437 = _2435 + _2205;
    bool _2439 = uint(_2425) >= uint(_1788);
    float _2441 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2429);
    int _2443 = int(_2211) + int(_2407);
    float _2445 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2447 = uint(_2437) >= uint(_1810);
    int _2449 = _2391 * _2385;
    int _2451 = _2449 + _2097;
    bool _2453 = !_2439;
    int _2455 = _2453 ? 0 : (-1);
    float _2457 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2459 = !_2447;
    int _2461 = _2459 ? 0 : (-1);
    float _2463 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2433);
    int _2465 = ~_2409;
    int _2467 = _2465 + _2455;
    int _2469 = _2467 + 1;
    float _2471 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2473 = ~_2421;
    int _2475 = _2473 + _2461;
    int _2477 = _2475 + 1;
    float _2479 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2481 = ~_1788;
    int _2483 = _2481 + 1;
    int _2485 = _1788 * _2469;
    int _2487 = _2485 + _2195;
    float _2489 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2471);
    int _2491 = _1810 * _2477;
    int _2493 = _2491 + _2205;
    float _2495 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2445);
    int _2497 = _2483 * _2443;
    int _2499 = _2497 + _2075;
    bool _2501 = !_2065;
    int _2503 = _2501 ? _2487 : (-1);
    float _2505 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2457);
    bool _2507 = uint(_2451) >= uint(_1810);
    float _2509 = _337 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2511 = !_2083;
    int _2513 = _2511 ? _2493 : (-1);
    float _2515 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2463);
    int _2517 = _2503 >> 31;
    float _2519 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2495);
    bool _2521 = uint(_2499) >= uint(_1788);
    float _2523 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2505);
    int _2525 = _2513 >> 31;
    float _2527 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2479);
    int _2529 = _2517 & 3;
    float _2531 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2489);
    int _2533 = _2525 & 3;
    float _2535 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2537 = _2503 + _2529;
    float _2539 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2415);
    int _2541 = _2513 + _2533;
    float _2543 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2527);
    int _2545 = _2537 >> 2;
    float _2547 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2431);
    int _2549 = _2503 & 3;
    bool _2551 = _2549 != 0;
    float _2553 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2419);
    int _2555 = _2541 >> 2;
    float _2557 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2547);
    int _2559 = _2545 << 4;
    int _2561 = _2559 + 368;
    float _2563 = _2535 * _2539;
    int _2565 = _2551 ? 0 : 1;
    float _2567 = _2535 * _2441;
    int _2569 = _2503 & 3;
    bool _2571 = _2569 != 0;
    uint _2573 = uint(int(uint(_2561) >> uint(2)));
    uint _2575 = uint(int(uint(int(_2573)) >> uint(2)));
    int _2577 = int(_2573) & 3;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[int(_2575)][_2577];
    int _2581 = int(_2573) + 1;
    uint _2583 = uint(int(uint(_2581) >> uint(2)));
    int _2585 = _2581 & 3;
    float _2587 = (*spvDescriptorSet0.vp_c9)._m0[int(_2583)][_2585];
    int _2589 = _2555 << 4;
    int _2591 = _2589 + 512;
    float _2593 = fma(_2509, _2515, _2563);
    bool _2595 = !_2521;
    int _2597 = _2595 ? 0 : (-1);
    out.m_72.x = _2515;
    out.m_72.y = _2519;
    out.m_72.z = _2523;
    bool _2599 = uint(_2569) >= 2u;
    float _2601 = fma(_2509, _2519, _2567);
    bool _2603 = !_2507;
    int _2605 = _2603 ? 0 : (-1);
    uint _2607 = uint(int(uint(_2591) >> uint(2)));
    uint _2609 = uint(int(uint(int(_2607)) >> uint(2)));
    int _2611 = int(_2607) & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    int _2615 = int(_2607) + 1;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    int _2619 = _2615 & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    bool _2623 = uint(_2569) > 1u;
    int _2625 = _2599 ? 0 : 1;
    bool _2627 = _2569 != 3;
    int _2629 = ~_2443;
    int _2631 = _2629 + _2597;
    int _2633 = _2631 + 1;
    int _2635 = _2561 + 8;
    uint _2637 = uint(int(uint(_2635) >> uint(2)));
    uint _2639 = uint(int(uint(int(_2637)) >> uint(2)));
    int _2641 = int(_2637) & 3;
    float _2643 = (*spvDescriptorSet0.vp_c9)._m0[int(_2639)][_2641];
    int _2645 = int(_2637) + 1;
    uint _2647 = uint(int(uint(_2645) >> uint(2)));
    int _2649 = _2645 & 3;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[int(_2647)][_2649];
    int _2653 = ~_2565;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    float _2659 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2661 = ~_2385;
    int _2663 = _2661 + _2605;
    int _2665 = _2663 + 1;
    int _2667 = _1788 * _2633;
    int _2669 = _2667 + _2075;
    int _2671 = ~_2625;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    int _2677 = _2657;
    int _2679 = _2675;
    if (!_2623)
    {
        int _2681 = ~_2565;
        int _2683 = _2681 + 1;
        _2677 = _2683;
    }
    int _2685 = _2677;
    float _2687 = _2535 * _2553;
    int _2689 = _2513 & 3;
    bool _2691 = _2689 != 0;
    int _2693 = _1810 * _2665;
    int _2695 = _2693 + _2097;
    if (_2627)
    {
        int _2697 = ~_2625;
        int _2699 = _2697 + 1;
        _2679 = _2699;
    }
    int _2701 = _2679;
    int _2703 = _2591 + 8;
    uint _2705 = uint(int(uint(_2703) >> uint(2)));
    uint _2707 = uint(int(uint(int(_2705)) >> uint(2)));
    int _2709 = int(_2705) & 3;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[int(_2707)][_2709];
    int _2713 = int(_2705) + 1;
    uint _2715 = uint(int(uint(_2713) >> uint(2)));
    int _2717 = _2713 & 3;
    float _2719 = (*spvDescriptorSet0.vp_c9)._m0[int(_2715)][_2717];
    bool _2721 = uint(_2689) > 1u;
    float _2723 = fma(_2509, _2523, _2687);
    bool _2725 = !_2571;
    int _2727 = _2725 ? 0 : 1;
    int _2729 = _2513 & 3;
    bool _2731 = _2729 != 0;
    int _2733 = abs(_2685);
    int _2735 = _2731 ? 0 : 1;
    bool _2737 = _2569 != 3;
    float _2739 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2659);
    bool _2741 = !_2691;
    int _2743 = _2741 ? 0 : 1;
    bool _2745 = uint(_2689) >= 2u;
    float _2747 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2739);
    int _2749 = ~_2735;
    int _2751 = _2749 + 1;
    int _2753 = _2751 + 1;
    int _2755 = _2753;
    if (!_2721)
    {
        int _2757 = ~_2735;
        int _2759 = _2757 + 1;
        _2755 = _2759;
    }
    int _2761 = _2755;
    int _2763 = _2745 ? 0 : 1;
    bool _2765 = _2689 != 3;
    bool _2767 = _2689 != 3;
    int _2769 = abs(_2761);
    int _2771 = abs(_2727);
    int _2773 = ~_2733;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = abs(_2743);
    int _2781 = _2777 * as_type<int>(_2587);
    int _2783 = ~_2769;
    int _2785 = _2783 + 1;
    int _2787 = _2785 + 1;
    int _2789 = abs(_2701);
    int _2791 = ~_2771;
    int _2793 = _2791 + 1;
    int _2795 = _2793 + 1;
    int _2797 = _2787 * as_type<int>(_2621);
    int _2799 = ~_2789;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    int _2805 = _2795 * as_type<int>(_2579);
    int _2807 = _2805 + _2781;
    int _2809 = ~_2779;
    int _2811 = _2809 + 1;
    int _2813 = _2811 + 1;
    float _2815 = fma(_2535, _2535, 1.0);
    int _2817 = ~_2763;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = _2803 * as_type<int>(_2643);
    int _2825 = _2823 + _2807;
    int _2827 = _2821;
    if (_2765)
    {
        int _2829 = ~_2763;
        int _2831 = _2829 + 1;
        _2827 = _2831;
    }
    int _2833 = _2827;
    int _2835 = _2813 * as_type<int>(_2613);
    int _2837 = _2835 + _2797;
    bool _2839 = !_2395;
    int _2841 = _2839 ? 0 : 1;
    float _2843 = rsqrt(_2815);
    bool _2845 = !_2737;
    int _2847 = _2845 ? 0 : (-1);
    bool _2849 = !_2767;
    int _2851 = _2849 ? 0 : (-1);
    int _2853 = abs(_2833);
    int _2855 = abs(_2841);
    bool _2857 = !_2401;
    int _2859 = _2857 ? 0 : 1;
    int _2861 = abs(_2847);
    int _2863 = abs(_2851);
    float _2865 = _2535 * _2843;
    int _2867 = abs(_2859);
    int _2869 = ~_2853;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = ~_2861;
    int _2877 = _2875 + 1;
    int _2879 = _2877 + 1;
    int _2881 = ~_2863;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    int _2887 = _2873 * as_type<int>(_2711);
    int _2889 = _2887 + _2837;
    int _2891 = _2879 * as_type<int>(_2651);
    int _2893 = _2891 + _2825;
    int _2895 = ~_2867;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _2885 * as_type<int>(_2719);
    int _2903 = _2901 + _2889;
    int _2905 = ~_2855;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    float _2911 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2913 = !_2065;
    int _2915 = _2913 ? _2669 : (-1);
    int _2917 = _2903 * _2899;
    bool _2919 = !_2083;
    int _2921 = _2919 ? _2695 : (-1);
    float _2923 = -_2531;
    float _2925 = _2865 * _2923;
    int _2927 = _2893 * _2909;
    float _2929 = -_2543;
    float _2931 = _2865 * _2929;
    float _2933 = _2911 * _1763;
    float _2935 = fma(_2843, _2441, _2925);
    int _2937 = _2915 * _2855;
    int _2939 = _2937 + _2927;
    float _2941 = _1695 * 0.5;
    int _2943 = _2921 * _2867;
    int _2945 = _2943 + _2917;
    float _2947 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2747);
    float _2949 = fma(_2843, _2539, _2931);
    float _2951 = fma(_1745, -0.5, _2941);
    float _2953 = float(_2939);
    float _2955 = -_2557;
    float _2957 = _2865 * _2955;
    float _2959 = float(_2945);
    float _2961 = _2947 + _1695;
    float _2963 = _1733 + _1695;
    float _2965 = _1774 * _2933;
    float _2967 = -_2911;
    float _2969 = _2967 + 1.0;
    float _2971 = _1784 * _2933;
    out.m_74.x = _2953;
    out.m_74.y = _2959;
    float _2973 = fma(_2843, _2553, _2957);
    float _2975 = _2961 * 0.5;
    float _2977 = _2963 * 0.5;
    float _2979 = _2543 + _2593;
    float _2981 = _2531 + _2601;
    float _2983 = _2557 + _2723;
    float _2985 = fma(_1780, _2965, _1768);
    float _2987 = fma(_1782, _2965, _1770);
    float _2989 = _1774 * _2969;
    float _2991 = fma(_1774, _2971, _1772);
    out.m_76.x = _2949;
    out.m_76.y = _2935;
    out.m_76.z = _2973;
    bool _2993 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2995 = isnan(_1471);
    bool _2997 = _2993 || _2995;
    bool _2999 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3001 = _2997 || _2999;
    out.m_78.x = _2977;
    out.m_78.y = _2951;
    out.m_78.z = _2975;
    out.m_78.w = _1695;
    out.m_80.x = _2985;
    out.m_80.y = _2987;
    out.m_80.z = _2991;
    out.m_80.w = _2989;
    out.m_82.x = _2979;
    out.m_82.y = _2981;
    out.m_82.z = _2983;
    float _3003 = _1770;
    float _3005 = _1768;
    float _3007 = _2947;
    if (!_3001)
    {
        _3003 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3009 = _3003;
    out.gl_Position.x = _1733;
    out.gl_Position.y = _1745;
    out.gl_Position.z = _2947;
    out.gl_Position.w = _1695;
    float _3011 = _3009;
    float _3013 = _3009;
    if (!_3001)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3015 = _3005;
    float _3017 = _3015;
    float _3019 = _3015;
    if (!_3001)
    {
        _1818 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3021 = _1818;
    float _3023 = _3021;
    float _3025 = _3021;
    if (!_3001)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3027 = _3007;
    float _3029 = _3027;
    float _3031 = _3027;
    if (!_3001)
    {
        _1820 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3033 = _1820;
    float _3035 = _3033;
    float _3037 = _3033;
    if (!_3001)
    {
        _1822 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3039 = _1822;
    bool _3041 = !_3001;
    float _3043 = _3039;
    float _3045 = _3039;
    if (!_3041)
    {
        bool _3047 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3049 = isnan(_1471);
        bool _3051 = _3047 || _3049;
        bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3055 = _3051 || _3053;
        if (!_3055)
        {
            float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3059 = _1471 + _3057;
            float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3063 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3061;
            float _3065 = 1.0 / _3063;
            float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3087 = _3059 * _3065;
            float _3089 = precise::clamp(_3087, 0.0, 1.0);
            float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3095 = fma(_3089, _3069, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3097 = fma(_3089, _3093, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3099 = fma(_3089, _3073, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3101 = fma(_3089, _3077, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3103 = fma(_3089, _3081, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3105 = fma(_3089, _3085, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3019 = _3097;
            _3037 = _3103;
            _3013 = _3095;
            _3031 = _3101;
            _3025 = _3099;
            _3045 = _3105;
            _3107 = true;
        }
        else
        {
            bool _3109 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3111 = isnan(_1471);
            bool _3113 = _3109 || _3111;
            bool _3115 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3117 = _3113 || _3115;
            if (!_3117)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3119 = _3011;
            _3013 = _3119;
            if (!_3117)
            {
                _3017 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3121 = _3017;
            _3019 = _3121;
            if (!_3117)
            {
                _3023 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3123 = _3023;
            _3025 = _3123;
            if (!_3117)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3125 = _3029;
            _3031 = _3125;
            if (!_3117)
            {
                _3035 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3127 = _3035;
            _3037 = _3127;
            if (!_3117)
            {
                _3043 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3129 = _3043;
            bool _3131 = !_3117;
            _3045 = _3129;
            if (!_3131)
            {
                bool _3133 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3135 = isnan(_1471);
                bool _3137 = _3133 || _3135;
                bool _3139 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3141 = _3137 || _3139;
                if (!_3141)
                {
                    float _3143 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3145 = _1471 + _3143;
                    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3149 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3147;
                    float _3151 = 1.0 / _3149;
                    float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3173 = _3145 * _3151;
                    float _3175 = precise::clamp(_3173, 0.0, 1.0);
                    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3181 = fma(_3175, _3155, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3183 = fma(_3175, _3179, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3185 = fma(_3175, _3159, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3187 = fma(_3175, _3163, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3189 = fma(_3175, _3167, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3191 = fma(_3175, _3171, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3019 = _3183;
                    _3037 = _3189;
                    _3013 = _3181;
                    _3031 = _3187;
                    _3025 = _3185;
                    _3045 = _3191;
                    _3107 = true;
                }
                else
                {
                    _3019 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3037 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3025 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3045 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3107 = false;
    float _3193 = _3019;
    float _3195 = _3037;
    float _3197 = _3013;
    float _3199 = _3031;
    float _3201 = _3025;
    float _3203 = _3045;
    float _3205 = fma(_2981, -0.5, 0.5);
    float _3207 = precise::clamp(_3205, 0.0, 1.0);
    float _3209 = -_3193;
    float _3211 = _3209 + _3195;
    float _3213 = -_3197;
    float _3215 = _3213 + _3199;
    float _3217 = -_3201;
    float _3219 = _3217 + _3203;
    bool _3221 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3223 = fma(_3207, _3211, _3193);
    float _3225 = fma(_3207, _3215, _3197);
    float _3227 = fma(_3207, _3219, _3201);
    float _3229 = _3223 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3231 = fma(_3225, 0.298911988735198974609375, _3229);
    float _3233 = fma(_3227, 0.114477999508380889892578125, _3231);
    out.m_84.x = 0.0;
    float _3235 = -_3233;
    float _3237 = _3225 + _3235;
    float _3239 = -_3233;
    float _3241 = _3223 + _3239;
    float _3243 = -_3233;
    float _3245 = _3227 + _3243;
    float _3247 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3249 = fma(_3237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3233);
    float _3251 = fma(_3241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3233);
    float _3253 = fma(_3245, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3233);
    out.m_86.w = _3247;
    out.m_88.x = _3249;
    out.m_88.y = _3251;
    out.m_88.z = _3253;
    if (!_3221)
    {
        return out;
    }
    float _3255 = -_1443;
    float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3259 = -_1445;
    float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3263 = -_1447;
    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3267 = _3257 * _3257;
    float _3269 = fma(_3261, _3261, _3267);
    float _3271 = fma(_3265, _3265, _3269);
    float _3273 = sqrt(_3271);
    float _3275 = rsqrt(_3271);
    float _3277 = -_3273;
    float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3281 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3283 = precise::clamp(_3281, 0.0, 1.0);
    float _3285 = _3261 * _3275;
    float _3287 = _3257 * _3275;
    float _3289 = abs(_3283);
    float _3291 = log2(_3289);
    float _3293 = _3265 * _3275;
    float _3295 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3297 = _2981 * _3287;
    float _3299 = -_3287;
    float _3301 = -_3295;
    float _3303 = fma(_3299, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3301);
    float _3305 = fma(_2979, _3285, _3297);
    float _3307 = -_3293;
    float _3309 = fma(_3307, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3303);
    float _3311 = fma(_2983, _3293, _3305);
    float _3313 = precise::clamp(_3311, 0.0, 1.0);
    float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3317 = _3309 + _3315;
    float _3319 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3321 = _3317 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3323 = precise::clamp(_3321, 0.0, 1.0);
    float _3325 = exp2(_3319);
    float _3327 = _3325 * _3323;
    float _3329 = _3313 * _3327;
    float _3331 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3333 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3335 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3331;
    out.m_84.y = _3333;
    out.m_84.z = _3335;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3107 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3394 = as_type<float>(_125);
        out.gl_Position.z = _3394;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_107);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3468 = as_type<float>(_165);
        out.gl_Position.z = _3468;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_55.x;
    float _169 = in.m_55.y;
    float _171 = in.m_55.z;
    float _173 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _167 * _167;
    float _191 = _169 * _169;
    float _193 = _171 * _171;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    bool _213 = _207 > 0.0;
    float _215 = in.m_49.x;
    float _217 = in.m_49.y;
    float _219 = in.m_49.z;
    bool _221 = _209 > 0.0;
    float _223 = in.m_64.w;
    int _225 = as_type<int>(_187) & 1;
    bool _227 = _225 != 0;
    int _229 = as_type<int>(_187) & 2;
    bool _231 = _229 != 0;
    float _233 = _201;
    float _235 = _167;
    float _237 = _169;
    float _239 = _171;
    if (_213)
    {
        float _241 = rsqrt(_201);
        _233 = _241;
    }
    float _243 = _233;
    bool _245 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _249 = _245 || _247;
    bool _251 = isnan(1.0);
    bool _253 = _249 || _251;
    float _255 = 0.0;
    float _257 = 0.0;
    if (!_213)
    {
        _255 = 0.0;
        _257 = 0.0;
    }
    float _259 = _255;
    float _261 = _257;
    bool _263 = _211 > 0.0;
    float _265 = in.m_44.x;
    float _267 = in.m_44.y;
    float _269 = in.m_44.z;
    float _271 = 0.0;
    float _273 = _259;
    float _275 = _261;
    if (!_213)
    {
        _271 = 0.0;
    }
    float _277 = _271;
    float _279 = 0.0;
    float _281 = 0.0;
    float _283 = _277;
    if (!_221)
    {
        _279 = 0.0;
        _281 = 0.0;
    }
    float _285 = _279;
    float _287 = _281;
    float _289 = 0.0;
    float _291 = _287;
    float _293 = _285;
    if (_221)
    {
        float _295 = rsqrt(_203);
        _289 = _295;
    }
    float _297 = _289;
    float _299 = 0.0;
    if (!_221)
    {
        _299 = 0.0;
    }
    float _301 = _299;
    float _303 = _243;
    float _305 = _301;
    if (_213)
    {
        float _307 = _243 * _175;
        _273 = _307;
    }
    float _309 = _273;
    if (_213)
    {
        float _311 = _243 * _167;
        _283 = _311;
    }
    float _313 = _283;
    float _315 = _313;
    if (_213)
    {
        float _317 = _243 * _181;
        _275 = _317;
    }
    float _319 = _275;
    if (!_253)
    {
        float _321 = _173 * _173;
        float _323 = _321 * 0.5;
        _303 = _323;
    }
    float _325 = _303;
    float _327 = 0.0;
    float _329 = _325;
    if (_263)
    {
        float _331 = rsqrt(_205);
        _327 = _331;
    }
    float _333 = _327;
    bool _335 = !_227;
    float _337 = _335 ? (-0.5) : 0.5;
    float _339 = _297;
    if (_221)
    {
        float _341 = _297 * _177;
        _291 = _341;
    }
    float _343 = _291;
    if (_221)
    {
        float _345 = _297 * _169;
        _293 = _345;
    }
    float _347 = _293;
    if (_221)
    {
        float _349 = _297 * _183;
        _305 = _349;
    }
    float _351 = _305;
    if (!_263)
    {
        _339 = 0.0;
    }
    float _353 = _339;
    float _355 = _353;
    if (!_253)
    {
        float _357 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _329 = _357;
    }
    float _359 = _329;
    bool _361 = !_231;
    float _363 = _361 ? (-0.5) : 0.5;
    bool _365 = !_253;
    float _367 = _359;
    float _369 = 0.0;
    if (!_365)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _377 = _375 + 1.0;
        float _379 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _381 = _173 * _373;
        float _383 = 1.0 / _377;
        float _385 = _379 * 0.693147182464599609375;
        float _387 = exp2(_381);
        float _389 = 1.0 / _385;
        float _391 = _387 + (-1.0);
        float _393 = -_391;
        float _395 = fma(_393, _389, _173);
        float _397 = _395 * _383;
        float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _367 = _399;
        _369 = _389;
    }
    float _401 = _367;
    float _403 = _369;
    float _405 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _407 = _403;
    float _409 = _401;
    if (_263)
    {
        float _411 = _333 * _171;
        _355 = _411;
    }
    float _413 = _355;
    float _415 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_263)
    {
        _407 = 0.0;
    }
    float _417 = _407;
    float _419 = _405 * _313;
    float _421 = _405 * _347;
    float _423 = _405 * _413;
    float _425 = _417;
    if (_263)
    {
        float _427 = _333 * _179;
        _425 = _427;
    }
    float _429 = _425;
    float _431 = fma(_415, _309, _419);
    float _433 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_263)
    {
        _315 = 0.0;
    }
    float _435 = _315;
    float _437 = _435;
    if (_263)
    {
        float _439 = _333 * _185;
        _437 = _439;
    }
    float _441 = _437;
    float _443 = fma(_415, _343, _421);
    float _445 = fma(_415, _429, _423);
    float _447 = fma(_433, _319, _431);
    if (!_253)
    {
        _409 = _173;
    }
    float _449 = _409;
    bool _451 = !_253;
    float _453 = _449;
    if (!_451)
    {
        float _455 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _457 = log2(_455);
        float _459 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _461 = _459 + 1.0;
        float _463 = 1.0 / _461;
        float _465 = _173 * _457;
        float _467 = exp2(_465);
        float _469 = -_467;
        float _471 = _469 + 1.0;
        float _473 = _471 * _463;
        _453 = _473;
    }
    float _475 = _453;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _479 = fma(_433, _351, _443);
    float _481 = fma(_433, _441, _445);
    float _483 = fma(_475, _215, _447);
    float _485 = fma(_475, _217, _479);
    float _487 = fma(_475, _219, _481);
    float _489 = fma(_483, _223, _265);
    float _491 = fma(_485, _223, _267);
    float _493 = fma(_487, _223, _269);
    bool _495 = !_477;
    float _497 = _489;
    float _513;
    if (!_495)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_107);
        float _519 = 1.0 / _517;
        float _521 = _145 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = in.m_51.y;
    float _527 = _131 * 2.0;
    float _529 = in.m_51.z;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _539 = floor(_527);
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _543 = _541 != 0;
    float _545 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _549 = 1.0 / _533;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _553 = -_547;
    float _555 = fma(_545, 2.0, _553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _557;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _563 = 1.0 / _537;
    float _565 = _525 * 2.0;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _569 = _523 + _567;
    float _571 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _573 = _529 * 2.0;
    bool _575 = _539 > 0.0;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _579 = _569 * _549;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _583 = _523 + _581;
    float _585 = _131 + _525;
    float _587 = floor(_565);
    float _589 = fma(_571, -2.0, _551);
    float _591 = _585 + (-1.0);
    bool _593 = _539 >= 0.0;
    bool _595 = isnan(_539);
    bool _597 = _593 || _595;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    float _603 = _583 * _563;
    float _605 = _529 + _525;
    float _607 = floor(_573);
    float _609 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _611 = _605 + (-1.0);
    int _613 = as_type<int>(_591);
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (_543)
    {
        _613 = 0;
    }
    int _617 = _613;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _621 = _523 + _619;
    int _623 = _617;
    if (!_543)
    {
        _623 = 1;
    }
    int _625 = _623;
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _629 = _601 ? 0 : 1;
    float _631 = 1.0 / _559;
    bool _633 = _625 != 1;
    bool _635 = _587 > 0.0;
    bool _637 = _587 >= 0.0;
    bool _639 = isnan(_587);
    bool _641 = _637 || _639;
    bool _643 = isnan(0.0);
    bool _645 = _641 || _643;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _649 = int(_647);
    float _651 = _131 + _529;
    bool _653 = _607 > 0.0;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _655;
    bool _659 = _607 >= 0.0;
    bool _661 = isnan(_607);
    bool _663 = _659 || _661;
    bool _665 = isnan(0.0);
    bool _667 = _663 || _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _669;
    float _673 = _651 + (-1.0);
    float _675 = fma(_657, _579, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _677 = fma(_671, _579, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (!_633)
    {
        _615 = _525;
    }
    float _679 = _615;
    float _681 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _683 = _645 ? 0 : 1;
    float _685 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _687 = int(_685);
    int _689 = _667 ? 0 : 1;
    float _691 = _621 * _631;
    float _693 = _679;
    if (_633)
    {
        _693 = _131;
    }
    float _695 = _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _701 = ~_629;
    int _703 = _701 + 1;
    int _705 = _703 + 1;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _711 = _705;
    float _713 = _695;
    if (!_575)
    {
        int _715 = ~_629;
        int _717 = _715 + 1;
        _711 = _717;
    }
    int _719 = _711;
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[83].z, _561);
    int _723 = ~_683;
    int _725 = _723 + 1;
    int _727 = _725 + 1;
    float _729 = fma(_699, _603, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _731 = ~_689;
    int _733 = _731 + 1;
    int _735 = _733 + 1;
    float _737 = fma(_709, _603, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _739 = _727;
    int _741 = _735;
    if (!_635)
    {
        int _743 = ~_683;
        int _745 = _743 + 1;
        _739 = _745;
    }
    int _747 = _739;
    if (!_653)
    {
        int _749 = ~_689;
        int _751 = _749 + 1;
        _741 = _751;
    }
    int _753 = _741;
    float _755 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _757 = log2(_755);
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _765 = _763 != 0;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _769 = _767 != 0;
    if (!_633)
    {
        _713 = _525;
    }
    float _771 = _713;
    float _773 = _771;
    if (_633)
    {
        _773 = _131;
    }
    float _775 = _773;
    bool _777 = !_765;
    int _779 = _777 ? 0 : 1;
    bool _781 = !_761;
    int _783 = _781 ? 0 : 1;
    float _785 = _775 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _787 = !_769;
    int _789 = _787 ? 0 : 1;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _793 = _791 != 0;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _797 = _795 != 0;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _801 = _799 != 0;
    float _803 = -_577;
    float _805 = fma(_785, 2.0, _803);
    float _807 = float(_107);
    if (!_633)
    {
        _115 = _529;
    }
    float _809 = _115;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _813 = !_793;
    int _815 = _813 ? 0 : 1;
    float _817 = _809;
    if (_633)
    {
        _817 = _525;
    }
    float _819 = _817;
    float _821 = 1.0 / _807;
    bool _823 = !_797;
    int _825 = _823 ? 0 : 1;
    int _827 = abs(_815);
    float _829 = _757 * _145;
    int _831 = abs(_825);
    float _833 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[83].w, _811);
    float _835 = float(_719);
    float _837 = _819;
    if (!_633)
    {
        _837 = _529;
    }
    float _839 = _837;
    float _841 = exp2(_829);
    float _843 = float(_747);
    float _845 = _839;
    if (_633)
    {
        _845 = _525;
    }
    float _847 = _845;
    float _849 = _821 * _145;
    float _851 = float(_827);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _855 = float(_753);
    float _857 = _847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _859 = float(_649);
    bool _861 = !_801;
    int _863 = _861 ? 0 : 1;
    float _865 = _851 * _855;
    float _867 = fma(_857, -2.0, _853);
    float _869 = in.m_66.x;
    float _871 = in.m_66.y;
    float _873 = in.m_66.z;
    float _875 = 1.0 / _859;
    int _877 = abs(_863);
    float _879 = -_841;
    float _881 = _879 + 1.0;
    float _883 = float(_687);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _887 = 1.0 + _885;
    float _889 = float(_877);
    float _891 = -_145;
    float _893 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[76].x, _555);
    float _895 = 1.0 / _883;
    float _897 = float(_831);
    float _899 = _889 * _843;
    bool _901 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _903 = isnan(0.0);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _909 = _905 || _907;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _913 = _897 * _835;
    bool _915 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _917 = isnan(1.0);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _923 = _919 || _921;
    float _925 = 1.0 / _887;
    float _927 = _909 ? _881 : 0.0;
    float _929 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].w, _911);
    float _931 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _721);
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _935 = _913 * (-2.0);
    bool _937 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _939 = isnan(_523);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = _875 * _145;
    float _951 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _589);
    float _953 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _929);
    float _955 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _867);
    float _957 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _933);
    float _959 = fma(_627, _935, _627);
    float _961 = fma(_935, _871, _871);
    float _963 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _833);
    float _965 = _865 * (-2.0);
    bool _967 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _969 = isnan(_523);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = _525 + (-0.5);
    float _981 = -_947;
    float _983 = _981 + 1.0;
    float _985 = _895 * _145;
    float _987 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _957);
    float _989 = -_145;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[81].x, _805);
    if (_923)
    {
        float _993 = _927 * _925;
        _147 = _993;
    }
    float _995 = _147;
    float _997 = fma(_609, _965, _609);
    float _999 = fma(_965, _869, _869);
    float _1001 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[196].y, _961);
    bool _1003 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1005 = isnan(_523);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = _977 * _983;
    float _1017 = -_977;
    float _1019 = _1017 + 1.0;
    float _1021 = fma(_959, _995, _1001);
    bool _1023 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1025 = isnan(_523);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = _899 * (-2.0);
    float _1037 = _1013 * _1019;
    float _1039 = -_1013;
    float _1041 = _1039 + 1.0;
    float _1043 = _131 + (-0.5);
    float _1045 = fma(_1035, _873, _873);
    float _1047 = fma(_681, _1035, _681);
    float _1049 = _1033 * _1041;
    float _1051 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].x, _999);
    float _1053 = _529 + (-0.5);
    float _1055 = _677 * _1049;
    float _1057 = _675 * _1049;
    float _1059 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1045);
    float _1061 = in.m_64.x;
    float _1063 = in.m_64.y;
    float _1065 = fma(_997, _995, _1051);
    float _1067 = fma(_1047, _995, _1059);
    float _1069 = -_1033;
    float _1071 = _1069 + 1.0;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1077;
    float _1081 = _1021 * 0.15915493667125701904296875;
    float _1083 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1057);
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1055);
    float _1087 = fma(_1079, _691, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1089 = _1065 * 0.15915493667125701904296875;
    float _1091 = fma(_729, _1037, _1083);
    float _1093 = fma(_1075, _691, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1095 = _1067 * 0.15915493667125701904296875;
    float _1097 = fma(_737, _1037, _1085);
    float _1099 = fma(_1087, _1015, _1091);
    float _1101 = _1081 * 6.283185482025146484375;
    float _1103 = sin(_1101);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _337);
    float _1107 = fma(_1093, _1015, _1097);
    float _1109 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1099);
    float _1111 = _491 * _183;
    float _1113 = in.m_59.w;
    float _1115 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1107);
    float _1117 = _1081 * 6.283185482025146484375;
    float _1119 = cos(_1117);
    float _1121 = _1109 * _1061;
    float _1123 = _1115 * _1063;
    float _1125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _363);
    float _1127 = fma(_489, _181, _1111);
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1131 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1133 = _1089 * 6.283185482025146484375;
    float _1135 = cos(_1133);
    float _1137 = _1129 * _1105;
    float _1139 = _1131 * _1125;
    float _1141 = in.m_57.w;
    float _1143 = fma(_493, _185, _1127);
    float _1145 = _1089 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    float _1149 = _1095 * 6.283185482025146484375;
    float _1151 = cos(_1149);
    float _1153 = _1135 * _1119;
    float _1155 = _1135 * _1103;
    float _1157 = _1095 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = _1147 * _1103;
    float _1163 = _1147 * _1119;
    float _1165 = _1135 * _1151;
    float _1167 = _1103 * _1151;
    float _1169 = _1147 * _1151;
    float _1171 = _1119 * _1151;
    float _1173 = _1165 * _1139;
    float _1175 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1177 = _1169 * _1139;
    float _1179 = fma(_1159, _1153, _1161);
    float _1181 = -_1139;
    float _1183 = _1159 * _1181;
    float _1185 = -_1163;
    float _1187 = fma(_1159, _1155, _1185);
    float _1189 = -_1155;
    float _1191 = fma(_1159, _1163, _1189);
    float _1193 = fma(_1179, _1137, _1173);
    float _1195 = fma(_1171, _1137, _1183);
    float _1197 = fma(_1159, _1161, _1153);
    float _1199 = fma(_1191, _1137, _1177);
    float _1201 = fma(_1187, _1175, _1193);
    float _1203 = fma(_1167, _1175, _1195);
    float _1205 = _491 * _177;
    float _1207 = fma(_1197, _1175, _1199);
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1213 = fma(_489, _175, _1205);
    float _1215 = _1143 + _1113;
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1209);
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1211);
    float _1221 = fma(_493, _179, _1213);
    float _1223 = _491 * _169;
    float _1225 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1217);
    float _1227 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1219);
    float _1229 = _1221 + _1141;
    float _1231 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1233 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1235 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1237 = fma(_489, _167, _1223);
    float _1239 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1231);
    float _1241 = _1215 + _1233;
    float _1243 = _1229 + _1235;
    float _1245 = in.m_55.w;
    float _1247 = fma(_493, _171, _1237);
    float _1249 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1251 = _1241 + _1249;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1255 = _1243 + _1253;
    float _1257 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1239);
    float _1259 = _1251 * _1251;
    float _1261 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1263 = fma(_1255, _1255, _1259);
    float _1265 = sqrt(_1263);
    float _1267 = _1247 + _1245;
    float _1269 = _1267 + _1261;
    bool _1271 = _1265 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1275 = _1273 != 0;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1279 = _1277 != 0;
    int _1281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1283 = _1281 != 0;
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1287 = _1285 != 0;
    bool _1289 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1291 = isnan(0.5);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1297 = _1293 || _1295;
    bool _1299 = !_1279;
    int _1301 = _1299 ? 0 : 1;
    bool _1303 = !_1275;
    int _1305 = _1303 ? 0 : 1;
    bool _1307 = !_1283;
    int _1309 = _1307 ? 0 : 1;
    bool _1311 = !_1287;
    int _1313 = _1311 ? 0 : 1;
    float _1315 = _1263;
    float _1317 = _1255;
    float _1319 = _1251;
    float _1321 = _1243;
    if (!_1271)
    {
        _235 = _1243;
    }
    float _1323 = _235;
    float _1325 = _1323;
    if (!_1271)
    {
        _497 = _1241;
    }
    float _1327 = _497;
    float _1329 = _1327;
    if (!_1271)
    {
        _237 = _1269;
    }
    float _1331 = _237;
    bool _1333 = !_1271;
    float _1335 = _1331;
    if (!_1333)
    {
        float _1337 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1341 = _1265 + _1339;
        float _1343 = rsqrt(_1263);
        float _1345 = _1341 * _1337;
        float _1347 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = _1345 * 0.15915493667125701904296875;
        float _1351 = _1349 * 6.283185482025146484375;
        float _1353 = sin(_1351);
        float _1355 = _1349 * 6.283185482025146484375;
        float _1357 = cos(_1355);
        float _1359 = fma(_1353, _1347, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1361 = _1343 * _1359;
        float _1363 = _1357 + (-1.0);
        float _1365 = fma(_1255, _1361, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1367 = fma(_1251, _1361, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1369 = _1363 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = fma(_1269, _1357, _1369);
        _1325 = _1365;
        _1335 = _1371;
        _1329 = _1367;
        _1315 = _1343;
        _239 = _1369;
    }
    float _1373 = _1325;
    float _1375 = _1335;
    float _1377 = _1329;
    float _1379 = _1315;
    float _1381 = _239;
    float _1383 = _1379;
    float _1385 = _1381;
    if (_1297)
    {
        _1317 = _1373;
    }
    float _1387 = _1317;
    float _1389 = _1387;
    if (_1297)
    {
        _1319 = _1375;
    }
    float _1391 = _1319;
    float _1393 = _1391;
    if (_1297)
    {
        _1383 = _1377;
    }
    float _1395 = _1383;
    float _1397 = _1395;
    if (!_1297)
    {
        float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1401 = _1267 + _1399;
        float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1405 = _1229 + _1403;
        float _1407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1409 = -_1215;
        float _1411 = _1409 + _1377;
        float _1413 = _1401 * _1401;
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1417 = _1215 + _1415;
        float _1419 = fma(_1405, _1405, _1413);
        float _1421 = fma(_1417, _1417, _1419);
        float _1423 = -_1229;
        float _1425 = _1423 + _1373;
        float _1427 = sqrt(_1421);
        float _1429 = precise::min(_1427, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1431 = _1429 * _1407;
        float _1433 = -_1267;
        float _1435 = _1433 + _1375;
        float _1437 = fma(_1425, _1431, _1229);
        float _1439 = fma(_1435, _1431, _1267);
        float _1441 = fma(_1411, _1431, _1215);
        _1393 = _1439;
        _1389 = _1437;
        _1397 = _1441;
        _1385 = _1427;
    }
    float _1443 = _1393;
    float _1445 = _1389;
    float _1447 = _1397;
    float _1449 = _1385;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1453 = _1443 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1457 = _1445 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1447 + _1459;
    float _1463 = _1453 * _1453;
    float _1465 = fma(_1457, _1457, _1463);
    float _1467 = fma(_1461, _1461, _1465);
    float _1469 = rsqrt(_1467);
    float _1471 = sqrt(_1467);
    float _1473 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1475 = _1457 * _1473;
    float _1477 = _1461 * _1473;
    float _1479 = _1475 * _1475;
    float _1481 = _1477 * _1477;
    float _1483 = _1479 + _1481;
    float _1485 = sqrt(_1483);
    bool _1487 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = _1485 + _1489;
    float _1493 = _1375;
    float _1495 = _1491;
    float _1497 = _1449;
    float _1499 = _1453;
    float _1501 = _1475;
    if (_1487)
    {
        float _1503 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1503;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    if (_1487)
    {
        float _1509 = _1491 * _1505;
        _1495 = _1509;
    }
    float _1511 = _1495;
    if (_1487)
    {
        float _1513 = rsqrt(_1483);
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = _1515;
    if (_1487)
    {
        float _1519 = _1511 * 0.15915493667125701904296875;
        _1497 = _1519;
    }
    float _1521 = _1497;
    float _1523 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1525 = _1461;
    if (_1487)
    {
        float _1527 = _1521 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1525 = _1529;
    }
    float _1531 = _1525;
    float _1533 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1535 = precise::max(0.0, _1523);
    float _1537 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1533);
    float _1539 = _1373;
    float _1541 = _1535;
    if (_1487)
    {
        float _1543 = _1521 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        _1539 = _1545;
    }
    float _1547 = _1539;
    float _1549 = -_1473;
    float _1551 = -_1535;
    float _1553 = fma(_1453, _1549, _1551);
    float _1555 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1537);
    float _1557 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1487)
    {
        float _1559 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1499 = _1559;
    }
    float _1561 = _1499;
    float _1563 = _1531;
    float _1565 = _1561;
    if (_1487)
    {
        float _1567 = fma(_1531, _1561, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1563 = _1567;
    }
    float _1569 = _1563;
    float _1571 = _1569;
    if (!_1487)
    {
        _1565 = _1553;
    }
    float _1573 = _1565;
    float _1575 = _1573;
    if (_1487)
    {
        float _1577 = _1515 * _1569;
        _1321 = _1577;
    }
    float _1579 = _1321;
    if (!_1487)
    {
        _1571 = _1479;
    }
    float _1581 = _1571;
    float _1583 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1585 = _1581;
    float _1587 = _1547;
    if (_1487)
    {
        float _1589 = _1547 + (-1.0);
        _1541 = _1589;
    }
    float _1591 = _1541;
    float _1593 = _1591;
    if (_1487)
    {
        float _1595 = _1475 * _1579;
        _1501 = _1595;
    }
    float _1597 = _1501;
    float _1599 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1583);
    if (_1487)
    {
        float _1601 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1517 = _1601;
    }
    float _1603 = _1517;
    if (!_1487)
    {
        _1593 = _1477;
    }
    float _1605 = _1593;
    float _1607 = _1605;
    if (_1487)
    {
        float _1609 = _1477 * _1579;
        _1607 = _1609;
    }
    float _1611 = _1607;
    if (_1487)
    {
        float _1613 = _1597 * _1597;
        _1585 = _1613;
    }
    float _1615 = _1585;
    if (_1487)
    {
        float _1617 = fma(_1553, _1547, _1603);
        _1575 = _1617;
    }
    float _1619 = _1575;
    if (!_1487)
    {
        _1587 = _1481;
    }
    float _1621 = _1587;
    float _1623 = _1621;
    if (_1487)
    {
        float _1625 = _1611 * _1611;
        _1623 = _1625;
    }
    float _1627 = _1623;
    float _1629 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1631 = fma(_1619, _1619, _1615);
    float _1633 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1599);
    float _1635 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1637 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1629);
    float _1639 = _1631 + _1627;
    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1643 = fma(_1471, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1641);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1649 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1637);
    float _1651 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1653 = -_1645;
    float _1655 = _1653 + 1.0;
    float _1657 = rsqrt(_1639);
    float _1659 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1647);
    float _1661 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1663 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1665 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1659);
    float _1667 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1669 = -_1663;
    float _1671 = fma(_1669, _1557, 1.0);
    float _1673 = abs(_1655);
    float _1675 = log2(_1673);
    float _1677 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1679 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1681 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1667);
    float _1683 = _1657 * _1597;
    float _1685 = _1657 * _1619;
    float _1687 = _1657 * _1611;
    float _1689 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1681);
    float _1691 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1693 = log2(_1671);
    float _1695 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1689);
    float _1697 = -_1691;
    float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1697);
    float _1701 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1703 = _1685 + 1.0;
    float _1705 = -_1687;
    float _1707 = fma(_1705, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1699);
    float _1709 = 1.0 / _1695;
    float _1711 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1713 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1679);
    float _1715 = fma(_1707, -0.5, 0.5);
    float _1717 = fma(_1707, 0.5, 0.5);
    float _1719 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1711);
    float _1721 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1713);
    float _1723 = exp2(_1701);
    float _1725 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1727 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1719);
    float _1729 = _1693 * 0.693147182464599609375;
    float _1731 = fma(_1717, _1725, -0.212114393711090087890625);
    float _1733 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1727);
    float _1735 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1737 = sqrt(_1715);
    float _1739 = _1733 * _1709;
    float _1741 = -_1685;
    float _1743 = fma(_1723, _1703, _1741);
    float _1745 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1721);
    float _1747 = fma(_1717, _1731, 1.570728778839111328125);
    float _1749 = fma(_1739, 0.5, 0.5);
    float _1751 = fma(_1743, 0.5, 0.5);
    float _1753 = _1745 * _1709;
    float _1755 = _1737 * 0.636619746685028076171875;
    float _1757 = fma(_1753, -0.5, 0.5);
    float _1759 = -_1747;
    float _1761 = fma(_1755, _1759, 1.0);
    float3 _5912 = float3(_1749, _1757, _1735);
    float _1763 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).x;
    float3 _5923 = float3(_1749, _1757, _1735);
    float4 _1766 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).xyzw;
    float _1768 = _1766.x;
    float _1770 = _1766.y;
    float _1772 = _1766.z;
    float _1774 = _1766.w;
    float2 _5940 = float2(_1761, _1751);
    float3 _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5940, float2(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5940, float2(0.0), isnan(_5940)), level(0.0)).xyz;
    float _1780 = _1778.x;
    float _1782 = _1778.y;
    float _1784 = _1778.z;
    float _1786 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1788 = int(_1786);
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1792 = _1790 != 0;
    float _1794 = -_931;
    float _1796 = _1794 + 1.0;
    bool _1798 = _131 > 0.5;
    float _1800 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1802 = _525 > 0.5;
    out.m_68.x = _1445;
    out.m_68.y = _1443;
    out.m_68.z = _1447;
    int _1804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1806 = _1804 != 0;
    float _1808 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1810 = int(_1808);
    bool _1812 = _529 > 0.5;
    int _1814 = abs(_1301);
    float _1816 = 0.0;
    float _1818 = _1695;
    float _1820 = _1745;
    float _1822 = _1733;
    if (_1792)
    {
        _1816 = 1.0;
    }
    float _1824 = _1816;
    float _1826 = trunc(_949);
    int _1828 = int(_1826);
    float _1830 = float(uint(_1788));
    float _1832 = _1824;
    if (!_1792)
    {
        _1832 = 1.2345600128173828125;
    }
    float _1834 = _1832;
    int _1836 = abs(_1309);
    int _1838 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1840 = _1838 != 0;
    float _1842 = 1.0 / _1830;
    float _1844 = float(uint(_1810));
    float _1846 = float(_1810);
    int _1848 = abs(_1313);
    float _1850 = 1.0 / _1844;
    float _1852 = trunc(_985);
    int _1854 = int(_1852);
    int _1856 = as_type<int>(_1842) + (-2);
    float _1858 = float(uint(_1828));
    int _1860 = ~_1810;
    int _1862 = _1860 + 1;
    float _1864 = as_type<float>(_1856) * _1858;
    int _1866 = as_type<int>(_1850) + (-2);
    float _1868 = exp2(_1800);
    float _1870 = _1858;
    if (_1792)
    {
        _1870 = 1.0;
    }
    float _1872 = _1870;
    float _1874 = _1872;
    if (!_1792)
    {
        _1874 = 7.345489978790283203125;
    }
    float _1876 = _1874;
    int _1878 = ~_1788;
    int _1880 = _1878 + 1;
    float _1882 = float(uint(_1854));
    float _1884 = trunc(_1864);
    float _1886 = precise::max(_1884, 0.0);
    uint _1889 = uint(_1886);
    float _1891 = _1876 * _131;
    float _1893 = as_type<float>(_1866) * _1882;
    float _1895 = _1882;
    if (_1792)
    {
        _1895 = _131;
    }
    float _1897 = _1895;
    float _1899 = _1897;
    if (!_1792)
    {
        _1899 = _525;
    }
    float _1901 = _1899;
    float _1903 = floor(_1891);
    float _1905 = float(_1828);
    float _1907 = -_1868;
    float _1909 = _1907 + 1.0;
    float _1911 = _1834 * _1901;
    float _1913 = trunc(_1893);
    float _1915 = precise::max(_1913, 0.0);
    uint _1917 = uint(_1915);
    int _1919 = _1880 * int(_1889);
    int _1921 = _1919 + _1828;
    float _1923 = float(uint(_1921));
    float _1925 = -_1903;
    float _1927 = _1891 + _1925;
    float _1929 = as_type<float>(_1856) * _1923;
    float _1931 = float(_1788);
    int _1933 = _1862 * int(_1917);
    int _1935 = _1933 + _1854;
    float _1937 = trunc(_1929);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    bool _1943 = _1905 >= _1931;
    bool _1945 = isnan(_1905);
    bool _1947 = _1943 || _1945;
    bool _1949 = isnan(_1931);
    bool _1951 = _1947 || _1949;
    float _1953 = float(_1951);
    float _1955 = _1927 * _1931;
    int _1957 = ~_1788;
    int _1959 = _1957 + 1;
    float _1961 = float(uint(_1935));
    float _1963 = float(_1854);
    float _1965 = floor(_1911);
    float _1967 = as_type<float>(_1866) * _1961;
    float _1969 = trunc(_1967);
    float _1971 = precise::max(_1969, 0.0);
    uint _1973 = uint(_1971);
    int _1975 = int(_1889) + int(_1941);
    int _1977 = _1959 * _1975;
    int _1979 = _1977 + _1828;
    int _1981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1983 = _1981 != 0;
    float _1985 = -_1965;
    float _1987 = _1911 + _1985;
    float _1989 = trunc(_1955);
    int _1991 = int(_1989);
    bool _1993 = _1963 >= _1846;
    bool _1995 = isnan(_1963);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(_1846);
    bool _2001 = _1997 || _1999;
    float _2003 = float(_2001);
    bool _2005 = uint(_1979) >= uint(_1788);
    float _2007 = _1987 * _1846;
    bool _2009 = !_1983;
    int _2011 = _2009 ? 0 : 1;
    int _2013 = int(_1917) + int(_1973);
    float _2015 = trunc(_1953);
    int _2017 = int(_2015);
    int _2019 = ~_1810;
    int _2021 = _2019 + 1;
    bool _2023 = !_2005;
    int _2025 = _2023 ? 0 : (-1);
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2029 = _2027 != 0;
    int _2031 = _2021 * _2013;
    int _2033 = _2031 + _1854;
    int _2035 = ~_1975;
    int _2037 = _2035 + _2025;
    int _2039 = _2037 + 1;
    float _2041 = trunc(_2007);
    int _2043 = int(_2041);
    int _2045 = abs(_2011);
    bool _2047 = uint(_2033) >= uint(_1810);
    float _2049 = _1931 * _849;
    bool _2051 = !_2029;
    int _2053 = _2051 ? 0 : 1;
    float _2055 = _1846 * _849;
    bool _2057 = !_2047;
    int _2059 = _2057 ? 0 : (-1);
    float _2061 = trunc(_2003);
    int _2063 = int(_2061);
    bool _2065 = _1788 == 0;
    int _2067 = ~_2013;
    int _2069 = _2067 + _2059;
    int _2071 = _2069 + 1;
    int _2073 = _1991 * _2045;
    int _2075 = _2073 + _1828;
    int _2077 = abs(_2053);
    int _2079 = _1788 * _2039;
    int _2081 = _2079 + _1828;
    bool _2083 = _1810 == 0;
    int _2085 = _1810 * _2071;
    int _2087 = _2085 + _1854;
    int _2089 = ~_2017;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    int _2095 = _2043 * _2077;
    int _2097 = _2095 + _1854;
    bool _2099 = !_2065;
    int _2101 = _2099 ? _2081 : (-1);
    float _2103 = trunc(_2049);
    int _2105 = int(_2103);
    bool _2107 = !_2083;
    int _2109 = _2107 ? _2087 : (-1);
    int _2111 = abs(_779);
    int _2113 = _2101 * _2093;
    int _2115 = ~_2063;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    int _2121 = _1788 + (-1);
    float _2123 = trunc(_2055);
    int _2125 = int(_2123);
    int _2127 = _1810 + (-1);
    int _2129 = _2109 * _2119;
    int _2131 = _2017 * _2121;
    int _2133 = _2131 + _2113;
    int _2135 = abs(_1305);
    int _2137 = _2063 * _2127;
    int _2139 = _2137 + _2129;
    int _2141 = _2133 * _2111;
    int _2143 = abs(_783);
    int _2145 = abs(_789);
    float _2147 = in.m_51.w;
    int _2149 = _2139 * _1814;
    int _2151 = ~_1810;
    int _2153 = _2151 + 1;
    int _2155 = _2105 * _2143;
    int _2157 = _2155 + _2141;
    int _2159 = _2125 * _2135;
    int _2161 = _2159 + _2149;
    float _2163 = -_337;
    int _2165 = _1798 ? as_type<int>(_2163) : as_type<int>(_337);
    bool _2167 = !_1806;
    int _2169 = _2167 ? 0 : 1;
    int _2171 = _2075 * _2145;
    int _2173 = _2171 + _2157;
    float _2175 = float(uint(_2075));
    bool _2177 = !_1840;
    float _2179 = _2177 ? _337 : as_type<float>(_2165);
    int _2181 = _2097 * _1836;
    int _2183 = _2181 + _2161;
    int _2185 = abs(_2169);
    float _2187 = as_type<float>(_1856) * _2175;
    float _2189 = _2179 + 0.5;
    float _2191 = float(uint(_2097));
    int _2193 = _1991 * _2185;
    int _2195 = _2193 + _2173;
    int _2197 = ~_1788;
    int _2199 = _2197 + 1;
    float _2201 = fma(_2189, (*spvDescriptorSet0.vp_c9)._m0[80].x, _893);
    int _2203 = _2043 * _1848;
    int _2205 = _2203 + _2183;
    float _2207 = trunc(_2187);
    float _2209 = precise::max(_2207, 0.0);
    uint _2211 = uint(_2209);
    float _2213 = float(uint(_2195));
    float _2215 = as_type<float>(_1866) * _2191;
    bool _2217 = _2147 > 0.5;
    float _2219 = float(uint(_2205));
    float _2221 = as_type<float>(_1856) * _2213;
    int _2223 = ~_1810;
    int _2225 = _2223 + 1;
    float _2227 = trunc(_2215);
    float _2229 = precise::max(_2227, 0.0);
    uint _2231 = uint(_2229);
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2235 = _2233 != 0;
    float _2237 = as_type<float>(_1866) * _2219;
    float _2239 = -_337;
    int _2241 = _1812 ? as_type<int>(_2239) : as_type<int>(_337);
    float _2243 = -_363;
    int _2245 = _1802 ? as_type<int>(_2243) : as_type<int>(_363);
    int _2247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2249 = _2247 != 0;
    float _2251 = trunc(_2221);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = _2199 * int(_2211);
    int _2259 = _2257 + _2075;
    int _2261 = ~_1788;
    int _2263 = _2261 + 1;
    float _2265 = -_363;
    int _2267 = _2217 ? as_type<int>(_2265) : as_type<int>(_363);
    float _2269 = float(uint(_2259));
    float _2271 = trunc(_2237);
    float _2273 = precise::max(_2271, 0.0);
    uint _2275 = uint(_2273);
    int _2277 = _2153 * int(_2231);
    int _2279 = _2277 + _2097;
    float _2281 = as_type<float>(_1856) * _2269;
    bool _2283 = !_2235;
    float _2285 = _2283 ? _337 : as_type<float>(_2241);
    float _2287 = float(uint(_2279));
    int _2289 = _2263 * int(_2255);
    int _2291 = _2289 + _2195;
    bool _2293 = !_2249;
    float _2295 = _2293 ? _363 : as_type<float>(_2267);
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2299 = _2297 != 0;
    float _2301 = as_type<float>(_1866) * _2287;
    float _2303 = float(uint(_2291));
    float _2305 = _2285 + 0.5;
    bool _2307 = !_2299;
    float _2309 = _2307 ? _363 : as_type<float>(_2245);
    int _2311 = _2225 * int(_2275);
    int _2313 = _2311 + _2205;
    float _2315 = _2295 + (-0.5);
    float _2317 = as_type<float>(_1856) * _2303;
    float _2319 = trunc(_2301);
    float _2321 = precise::max(_2319, 0.0);
    uint _2323 = uint(_2321);
    float _2325 = _2309 + (-0.5);
    float _2327 = float(uint(_2313));
    float _2329 = fma(_2305, (*spvDescriptorSet0.vp_c9)._m0[85].x, _991);
    float _2331 = -_2315;
    float _2333 = -_955;
    float _2335 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2333);
    float _2337 = -_2325;
    float _2339 = -_951;
    float _2341 = fma(_2337, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2339);
    float _2343 = -_953;
    float _2345 = _2343 + 1.0;
    float _2347 = as_type<float>(_1866) * _2327;
    float _2349 = trunc(_2317);
    float _2351 = precise::max(_2349, 0.0);
    uint _2353 = uint(_2351);
    float _2355 = -_987;
    float _2357 = _2355 + 1.0;
    float _2359 = -_963;
    float _2361 = _2359 + 1.0;
    float _2363 = -_1796;
    float _2365 = fma(_2285, _2363, _2329);
    float _2367 = fma(_2309, _2345, _2341);
    float _2369 = -_2357;
    float _2371 = fma(_2179, _2369, _2201);
    float _2373 = fma(_2295, _2361, _2335);
    int _2375 = ~_1788;
    int _2377 = _2375 + 1;
    float _2379 = trunc(_2347);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    int _2385 = int(_2231) + int(_2323);
    float _2387 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2389 = ~_1810;
    int _2391 = _2389 + 1;
    out.m_70.x = _2371;
    out.m_70.y = _2367;
    out.m_70.z = _2365;
    out.m_70.w = _2373;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2395 = _2393 != 0;
    float _2397 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2401 = _2399 != 0;
    float _2403 = trunc(_2281);
    float _2405 = precise::max(_2403, 0.0);
    uint _2407 = uint(_2405);
    int _2409 = int(_2255) + int(_2353);
    float _2411 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2413 = -_1159;
    float _2415 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2397);
    float _2417 = -_1159;
    float _2419 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2411);
    int _2421 = int(_2275) + int(_2383);
    int _2423 = _2377 * _2409;
    int _2425 = _2423 + _2195;
    float _2427 = -_1159;
    float _2429 = fma(_2427, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2387);
    float _2431 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2433 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2435 = _2391 * _2421;
    int _2437 = _2435 + _2205;
    bool _2439 = uint(_2425) >= uint(_1788);
    float _2441 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2429);
    int _2443 = int(_2211) + int(_2407);
    float _2445 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2447 = uint(_2437) >= uint(_1810);
    int _2449 = _2391 * _2385;
    int _2451 = _2449 + _2097;
    bool _2453 = !_2439;
    int _2455 = _2453 ? 0 : (-1);
    float _2457 = _1179 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2459 = !_2447;
    int _2461 = _2459 ? 0 : (-1);
    float _2463 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2433);
    int _2465 = ~_2409;
    int _2467 = _2465 + _2455;
    int _2469 = _2467 + 1;
    float _2471 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2473 = ~_2421;
    int _2475 = _2473 + _2461;
    int _2477 = _2475 + 1;
    float _2479 = _1187 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2481 = ~_1788;
    int _2483 = _2481 + 1;
    int _2485 = _1788 * _2469;
    int _2487 = _2485 + _2195;
    float _2489 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2471);
    int _2491 = _1810 * _2477;
    int _2493 = _2491 + _2205;
    float _2495 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2445);
    int _2497 = _2483 * _2443;
    int _2499 = _2497 + _2075;
    bool _2501 = !_2065;
    int _2503 = _2501 ? _2487 : (-1);
    float _2505 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2457);
    bool _2507 = uint(_2451) >= uint(_1810);
    float _2509 = _337 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2511 = !_2083;
    int _2513 = _2511 ? _2493 : (-1);
    float _2515 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2463);
    int _2517 = _2503 >> 31;
    float _2519 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2495);
    bool _2521 = uint(_2499) >= uint(_1788);
    float _2523 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2505);
    int _2525 = _2513 >> 31;
    float _2527 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2479);
    int _2529 = _2517 & 3;
    float _2531 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2489);
    int _2533 = _2525 & 3;
    float _2535 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2537 = _2503 + _2529;
    float _2539 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2415);
    int _2541 = _2513 + _2533;
    float _2543 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2527);
    int _2545 = _2537 >> 2;
    float _2547 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2431);
    int _2549 = _2503 & 3;
    bool _2551 = _2549 != 0;
    float _2553 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2419);
    int _2555 = _2541 >> 2;
    float _2557 = fma(_1197, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2547);
    int _2559 = _2545 << 4;
    int _2561 = _2559 + 368;
    float _2563 = _2535 * _2539;
    int _2565 = _2551 ? 0 : 1;
    float _2567 = _2535 * _2441;
    int _2569 = _2503 & 3;
    bool _2571 = _2569 != 0;
    uint _2573 = uint(int(uint(_2561) >> uint(2)));
    uint _2575 = uint(int(uint(int(_2573)) >> uint(2)));
    int _2577 = int(_2573) & 3;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[int(_2575)][_2577];
    int _2581 = int(_2573) + 1;
    uint _2583 = uint(int(uint(_2581) >> uint(2)));
    int _2585 = _2581 & 3;
    float _2587 = (*spvDescriptorSet0.vp_c9)._m0[int(_2583)][_2585];
    int _2589 = _2555 << 4;
    int _2591 = _2589 + 512;
    float _2593 = fma(_2509, _2515, _2563);
    bool _2595 = !_2521;
    int _2597 = _2595 ? 0 : (-1);
    out.m_72.x = _2515;
    out.m_72.y = _2519;
    out.m_72.z = _2523;
    bool _2599 = uint(_2569) >= 2u;
    float _2601 = fma(_2509, _2519, _2567);
    bool _2603 = !_2507;
    int _2605 = _2603 ? 0 : (-1);
    uint _2607 = uint(int(uint(_2591) >> uint(2)));
    uint _2609 = uint(int(uint(int(_2607)) >> uint(2)));
    int _2611 = int(_2607) & 3;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[int(_2609)][_2611];
    int _2615 = int(_2607) + 1;
    uint _2617 = uint(int(uint(_2615) >> uint(2)));
    int _2619 = _2615 & 3;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[int(_2617)][_2619];
    bool _2623 = uint(_2569) > 1u;
    int _2625 = _2599 ? 0 : 1;
    bool _2627 = _2569 != 3;
    int _2629 = ~_2443;
    int _2631 = _2629 + _2597;
    int _2633 = _2631 + 1;
    int _2635 = _2561 + 8;
    uint _2637 = uint(int(uint(_2635) >> uint(2)));
    uint _2639 = uint(int(uint(int(_2637)) >> uint(2)));
    int _2641 = int(_2637) & 3;
    float _2643 = (*spvDescriptorSet0.vp_c9)._m0[int(_2639)][_2641];
    int _2645 = int(_2637) + 1;
    uint _2647 = uint(int(uint(_2645) >> uint(2)));
    int _2649 = _2645 & 3;
    float _2651 = (*spvDescriptorSet0.vp_c9)._m0[int(_2647)][_2649];
    int _2653 = ~_2565;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    float _2659 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2661 = ~_2385;
    int _2663 = _2661 + _2605;
    int _2665 = _2663 + 1;
    int _2667 = _1788 * _2633;
    int _2669 = _2667 + _2075;
    int _2671 = ~_2625;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    int _2677 = _2657;
    int _2679 = _2675;
    if (!_2623)
    {
        int _2681 = ~_2565;
        int _2683 = _2681 + 1;
        _2677 = _2683;
    }
    int _2685 = _2677;
    float _2687 = _2535 * _2553;
    int _2689 = _2513 & 3;
    bool _2691 = _2689 != 0;
    int _2693 = _1810 * _2665;
    int _2695 = _2693 + _2097;
    if (_2627)
    {
        int _2697 = ~_2625;
        int _2699 = _2697 + 1;
        _2679 = _2699;
    }
    int _2701 = _2679;
    int _2703 = _2591 + 8;
    uint _2705 = uint(int(uint(_2703) >> uint(2)));
    uint _2707 = uint(int(uint(int(_2705)) >> uint(2)));
    int _2709 = int(_2705) & 3;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[int(_2707)][_2709];
    int _2713 = int(_2705) + 1;
    uint _2715 = uint(int(uint(_2713) >> uint(2)));
    int _2717 = _2713 & 3;
    float _2719 = (*spvDescriptorSet0.vp_c9)._m0[int(_2715)][_2717];
    bool _2721 = uint(_2689) > 1u;
    float _2723 = fma(_2509, _2523, _2687);
    bool _2725 = !_2571;
    int _2727 = _2725 ? 0 : 1;
    int _2729 = _2513 & 3;
    bool _2731 = _2729 != 0;
    int _2733 = abs(_2685);
    int _2735 = _2731 ? 0 : 1;
    bool _2737 = _2569 != 3;
    float _2739 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2659);
    bool _2741 = !_2691;
    int _2743 = _2741 ? 0 : 1;
    bool _2745 = uint(_2689) >= 2u;
    float _2747 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2739);
    int _2749 = ~_2735;
    int _2751 = _2749 + 1;
    int _2753 = _2751 + 1;
    int _2755 = _2753;
    if (!_2721)
    {
        int _2757 = ~_2735;
        int _2759 = _2757 + 1;
        _2755 = _2759;
    }
    int _2761 = _2755;
    int _2763 = _2745 ? 0 : 1;
    bool _2765 = _2689 != 3;
    bool _2767 = _2689 != 3;
    int _2769 = abs(_2761);
    int _2771 = abs(_2727);
    int _2773 = ~_2733;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = abs(_2743);
    int _2781 = _2777 * as_type<int>(_2587);
    int _2783 = ~_2769;
    int _2785 = _2783 + 1;
    int _2787 = _2785 + 1;
    int _2789 = abs(_2701);
    int _2791 = ~_2771;
    int _2793 = _2791 + 1;
    int _2795 = _2793 + 1;
    int _2797 = _2787 * as_type<int>(_2621);
    int _2799 = ~_2789;
    int _2801 = _2799 + 1;
    int _2803 = _2801 + 1;
    int _2805 = _2795 * as_type<int>(_2579);
    int _2807 = _2805 + _2781;
    int _2809 = ~_2779;
    int _2811 = _2809 + 1;
    int _2813 = _2811 + 1;
    float _2815 = fma(_2535, _2535, 1.0);
    int _2817 = ~_2763;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = _2803 * as_type<int>(_2643);
    int _2825 = _2823 + _2807;
    int _2827 = _2821;
    if (_2765)
    {
        int _2829 = ~_2763;
        int _2831 = _2829 + 1;
        _2827 = _2831;
    }
    int _2833 = _2827;
    int _2835 = _2813 * as_type<int>(_2613);
    int _2837 = _2835 + _2797;
    bool _2839 = !_2395;
    int _2841 = _2839 ? 0 : 1;
    float _2843 = rsqrt(_2815);
    bool _2845 = !_2737;
    int _2847 = _2845 ? 0 : (-1);
    bool _2849 = !_2767;
    int _2851 = _2849 ? 0 : (-1);
    int _2853 = abs(_2833);
    int _2855 = abs(_2841);
    bool _2857 = !_2401;
    int _2859 = _2857 ? 0 : 1;
    int _2861 = abs(_2847);
    int _2863 = abs(_2851);
    float _2865 = _2535 * _2843;
    int _2867 = abs(_2859);
    int _2869 = ~_2853;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = ~_2861;
    int _2877 = _2875 + 1;
    int _2879 = _2877 + 1;
    int _2881 = ~_2863;
    int _2883 = _2881 + 1;
    int _2885 = _2883 + 1;
    int _2887 = _2873 * as_type<int>(_2711);
    int _2889 = _2887 + _2837;
    int _2891 = _2879 * as_type<int>(_2651);
    int _2893 = _2891 + _2825;
    int _2895 = ~_2867;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _2885 * as_type<int>(_2719);
    int _2903 = _2901 + _2889;
    int _2905 = ~_2855;
    int _2907 = _2905 + 1;
    int _2909 = _2907 + 1;
    float _2911 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2913 = !_2065;
    int _2915 = _2913 ? _2669 : (-1);
    int _2917 = _2903 * _2899;
    bool _2919 = !_2083;
    int _2921 = _2919 ? _2695 : (-1);
    float _2923 = -_2531;
    float _2925 = _2865 * _2923;
    int _2927 = _2893 * _2909;
    float _2929 = -_2543;
    float _2931 = _2865 * _2929;
    float _2933 = _2911 * _1763;
    float _2935 = fma(_2843, _2441, _2925);
    int _2937 = _2915 * _2855;
    int _2939 = _2937 + _2927;
    float _2941 = _1695 * 0.5;
    int _2943 = _2921 * _2867;
    int _2945 = _2943 + _2917;
    float _2947 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2747);
    float _2949 = fma(_2843, _2539, _2931);
    float _2951 = fma(_1745, -0.5, _2941);
    float _2953 = float(_2939);
    float _2955 = -_2557;
    float _2957 = _2865 * _2955;
    float _2959 = float(_2945);
    float _2961 = _2947 + _1695;
    float _2963 = _1733 + _1695;
    float _2965 = _1774 * _2933;
    float _2967 = -_2911;
    float _2969 = _2967 + 1.0;
    float _2971 = _1784 * _2933;
    out.m_74.x = _2953;
    out.m_74.y = _2959;
    float _2973 = fma(_2843, _2553, _2957);
    float _2975 = _2961 * 0.5;
    float _2977 = _2963 * 0.5;
    float _2979 = _2543 + _2593;
    float _2981 = _2531 + _2601;
    float _2983 = _2557 + _2723;
    float _2985 = fma(_1780, _2965, _1768);
    float _2987 = fma(_1782, _2965, _1770);
    float _2989 = _1774 * _2969;
    float _2991 = fma(_1774, _2971, _1772);
    out.m_76.x = _2949;
    out.m_76.y = _2935;
    out.m_76.z = _2973;
    bool _2993 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2995 = isnan(_1471);
    bool _2997 = _2993 || _2995;
    bool _2999 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3001 = _2997 || _2999;
    out.m_78.x = _2977;
    out.m_78.y = _2951;
    out.m_78.z = _2975;
    out.m_78.w = _1695;
    out.m_80.x = _2985;
    out.m_80.y = _2987;
    out.m_80.z = _2991;
    out.m_80.w = _2989;
    out.m_82.x = _2979;
    out.m_82.y = _2981;
    out.m_82.z = _2983;
    float _3003 = _1770;
    float _3005 = _1768;
    float _3007 = _2947;
    if (!_3001)
    {
        _3003 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3009 = _3003;
    out.gl_Position.x = _1733;
    out.gl_Position.y = _1745;
    out.gl_Position.z = _2947;
    out.gl_Position.w = _1695;
    float _3011 = _3009;
    float _3013 = _3009;
    if (!_3001)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3015 = _3005;
    float _3017 = _3015;
    float _3019 = _3015;
    if (!_3001)
    {
        _1818 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3021 = _1818;
    float _3023 = _3021;
    float _3025 = _3021;
    if (!_3001)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3027 = _3007;
    float _3029 = _3027;
    float _3031 = _3027;
    if (!_3001)
    {
        _1820 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3033 = _1820;
    float _3035 = _3033;
    float _3037 = _3033;
    if (!_3001)
    {
        _1822 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3039 = _1822;
    bool _3041 = !_3001;
    float _3043 = _3039;
    float _3045 = _3039;
    if (!_3041)
    {
        bool _3047 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3049 = isnan(_1471);
        bool _3051 = _3047 || _3049;
        bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3055 = _3051 || _3053;
        if (!_3055)
        {
            float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3059 = _1471 + _3057;
            float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3063 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3061;
            float _3065 = 1.0 / _3063;
            float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3087 = _3059 * _3065;
            float _3089 = precise::clamp(_3087, 0.0, 1.0);
            float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3095 = fma(_3089, _3069, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3097 = fma(_3089, _3093, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3099 = fma(_3089, _3073, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3101 = fma(_3089, _3077, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3103 = fma(_3089, _3081, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3105 = fma(_3089, _3085, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3019 = _3097;
            _3037 = _3103;
            _3013 = _3095;
            _3031 = _3101;
            _3025 = _3099;
            _3045 = _3105;
            _3107 = true;
        }
        else
        {
            bool _3109 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3111 = isnan(_1471);
            bool _3113 = _3109 || _3111;
            bool _3115 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3117 = _3113 || _3115;
            if (!_3117)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3119 = _3011;
            _3013 = _3119;
            if (!_3117)
            {
                _3017 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3121 = _3017;
            _3019 = _3121;
            if (!_3117)
            {
                _3023 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3123 = _3023;
            _3025 = _3123;
            if (!_3117)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3125 = _3029;
            _3031 = _3125;
            if (!_3117)
            {
                _3035 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3127 = _3035;
            _3037 = _3127;
            if (!_3117)
            {
                _3043 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3129 = _3043;
            bool _3131 = !_3117;
            _3045 = _3129;
            if (!_3131)
            {
                bool _3133 = _1471 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3135 = isnan(_1471);
                bool _3137 = _3133 || _3135;
                bool _3139 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3141 = _3137 || _3139;
                if (!_3141)
                {
                    float _3143 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3145 = _1471 + _3143;
                    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3149 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3147;
                    float _3151 = 1.0 / _3149;
                    float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3173 = _3145 * _3151;
                    float _3175 = precise::clamp(_3173, 0.0, 1.0);
                    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3181 = fma(_3175, _3155, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3183 = fma(_3175, _3179, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3185 = fma(_3175, _3159, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3187 = fma(_3175, _3163, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3189 = fma(_3175, _3167, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3191 = fma(_3175, _3171, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3019 = _3183;
                    _3037 = _3189;
                    _3013 = _3181;
                    _3031 = _3187;
                    _3025 = _3185;
                    _3045 = _3191;
                    _3107 = true;
                }
                else
                {
                    _3019 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3037 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3025 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3045 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3107 = false;
    float _3193 = _3019;
    float _3195 = _3037;
    float _3197 = _3013;
    float _3199 = _3031;
    float _3201 = _3025;
    float _3203 = _3045;
    float _3205 = fma(_2981, -0.5, 0.5);
    float _3207 = precise::clamp(_3205, 0.0, 1.0);
    float _3209 = -_3193;
    float _3211 = _3209 + _3195;
    float _3213 = -_3197;
    float _3215 = _3213 + _3199;
    float _3217 = -_3201;
    float _3219 = _3217 + _3203;
    bool _3221 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3223 = fma(_3207, _3211, _3193);
    float _3225 = fma(_3207, _3215, _3197);
    float _3227 = fma(_3207, _3219, _3201);
    float _3229 = _3223 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3231 = fma(_3225, 0.298911988735198974609375, _3229);
    float _3233 = fma(_3227, 0.114477999508380889892578125, _3231);
    out.m_84.x = 0.0;
    float _3235 = -_3233;
    float _3237 = _3225 + _3235;
    float _3239 = -_3233;
    float _3241 = _3223 + _3239;
    float _3243 = -_3233;
    float _3245 = _3227 + _3243;
    float _3247 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3249 = fma(_3237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3233);
    float _3251 = fma(_3241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3233);
    float _3253 = fma(_3245, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3233);
    out.m_86.w = _3247;
    out.m_88.x = _3249;
    out.m_88.y = _3251;
    out.m_88.z = _3253;
    if (!_3221)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3255 = -_1443;
    float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3259 = -_1445;
    float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3263 = -_1447;
    float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3267 = _3257 * _3257;
    float _3269 = fma(_3261, _3261, _3267);
    float _3271 = fma(_3265, _3265, _3269);
    float _3273 = sqrt(_3271);
    float _3275 = rsqrt(_3271);
    float _3277 = -_3273;
    float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3281 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3283 = precise::clamp(_3281, 0.0, 1.0);
    float _3285 = _3261 * _3275;
    float _3287 = _3257 * _3275;
    float _3289 = abs(_3283);
    float _3291 = log2(_3289);
    float _3293 = _3265 * _3275;
    float _3295 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3297 = _2981 * _3287;
    float _3299 = -_3287;
    float _3301 = -_3295;
    float _3303 = fma(_3299, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3301);
    float _3305 = fma(_2979, _3285, _3297);
    float _3307 = -_3293;
    float _3309 = fma(_3307, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3303);
    float _3311 = fma(_2983, _3293, _3305);
    float _3313 = precise::clamp(_3311, 0.0, 1.0);
    float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3317 = _3309 + _3315;
    float _3319 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3321 = _3317 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3323 = precise::clamp(_3321, 0.0, 1.0);
    float _3325 = exp2(_3319);
    float _3327 = _3325 * _3323;
    float _3329 = _3313 * _3327;
    float _3331 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3333 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3335 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3331;
    out.m_84.y = _3333;
    out.m_84.z = _3335;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

