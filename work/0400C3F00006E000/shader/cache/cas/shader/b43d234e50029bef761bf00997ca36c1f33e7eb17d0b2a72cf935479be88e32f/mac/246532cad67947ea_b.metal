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
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1389 = false;
    bool _1057 = false;
    bool _715 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3798 = as_type<float>(_101);
        out.gl_Position.z = _3798;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3867 = as_type<float>(_137);
        out.gl_Position.z = _3867;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = _143 * _141;
    float _169 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = in.m_47.x;
    float _173 = in.m_47.y;
    float _175 = in.m_47.z;
    float _177 = _169 * 6.283185482025146484375;
    float _179 = floor(_169);
    int _181 = as_type<int>(_145) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_145) & 2;
    bool _187 = _185 != 0;
    float _189 = _177 * 0.15915493667125701904296875;
    float _191 = _177;
    float _193 = _147;
    if (!_159)
    {
        float _195 = _147 * _147;
        float _197 = _195 * 0.5;
        _191 = _197;
    }
    float _199 = _191;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    bool _205 = !_183;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _189 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_187;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = _199;
    if (!_159)
    {
        float _219 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    float _223 = -_179;
    float _225 = _169 + _223;
    bool _227 = _225 < 0.5;
    float _229 = float(_227);
    bool _231 = !_159;
    float _233 = _221;
    float _235 = _161;
    float _237 = _163;
    float _239 = _171;
    if (!_231)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _147 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _147);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _269;
    }
    float _271 = _233;
    bool _273 = !_159;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _147 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _193 = _293;
    }
    float _295 = _193;
    float _297 = -_225;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_211, 0.5, 0.5);
    float _303 = -_229;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _313 = -_301;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = fma(_295, _171, _307);
    float _319 = fma(_295, _173, _309);
    float _321 = fma(_295, _175, _311);
    float _323 = _307;
    if (!_159)
    {
        float _325 = _119 * _119;
        float _327 = _325 * 0.5;
        _323 = _327;
    }
    float _329 = _323;
    float _331 = fma(_317, _149, _161);
    float _333 = fma(_319, _149, _163);
    float _335 = fma(_321, _149, _165);
    if (!_159)
    {
        float _337 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _337;
    }
    float _339 = _235;
    float _341 = _339;
    if (!_159)
    {
        _237 = _119;
    }
    float _343 = _237;
    bool _345 = !_159;
    float _347 = _343;
    if (!_345)
    {
        float _349 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = log2(_349);
        float _353 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _355 = _353 + 1.0;
        float _357 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _359 = _119 * _351;
        float _361 = 1.0 / _355;
        float _363 = _357 * 0.693147182464599609375;
        float _365 = exp2(_359);
        float _367 = 1.0 / _363;
        float _369 = _365 + (-1.0);
        float _371 = -_369;
        float _373 = fma(_371, _367, _119);
        float _375 = _373 * _361;
        float _377 = _375 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _341 = _377;
    }
    float _379 = _341;
    bool _381 = !_159;
    if (!_381)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = 1.0 / _389;
        float _393 = _119 * _385;
        float _395 = exp2(_393);
        float _397 = -_395;
        float _399 = _397 + 1.0;
        float _401 = _399 * _391;
        _347 = _401;
    }
    float _403 = _347;
    bool _405 = !_203;
    int _407 = _405 ? 0 : 1;
    float _409 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _417 = _415 != 0;
    float _419 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _421 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _423 = abs(_407);
    float _425 = fma(_403, _171, _409);
    bool _427 = !_413;
    int _429 = _427 ? 0 : 1;
    float _431 = fma(_403, _173, _419);
    bool _433 = !_417;
    int _435 = _433 ? 0 : 1;
    float _437 = fma(_403, _175, _421);
    int _439 = abs(_429);
    float _441 = -_431;
    float _443 = _319 + _441;
    int _445 = abs(_435);
    float _447 = -_425;
    float _449 = _317 + _447;
    float _451 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _457 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _459 = float(_439);
    float _461 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _457);
    float _467 = float(_423);
    float _469 = abs(_299);
    float _471 = _459 * _469;
    float _473 = -_437;
    float _475 = _321 + _473;
    float _477 = fma(_467, _315, _471);
    float _479 = float(_445);
    float _481 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[4].z, _461);
    float _483 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
    float _485 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    float _487 = abs(_305);
    float _489 = fma(_479, _487, _477);
    bool _491 = !_455;
    float _493 = _483;
    float _495 = _481;
    float _497 = _485;
    float _513;
    if (!_491)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_85);
        float _519 = 1.0 / _517;
        float _521 = _119 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = _523 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = 1.0 / _535;
    bool _547 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _549 = 1.0 / _539;
    float _551 = 1.0 / _543;
    float _553 = _527 * _545;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _557 = _523 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _559;
    float _563 = _557 * _549;
    bool _565 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _567 = isnan(_523);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = fma(_561, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -_575;
    float _589 = _587 + 1.0;
    float _591 = fma(_581, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _593 = _531 * _551;
    bool _595 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _597 = isnan(_523);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    bool _607 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _609 = isnan(_523);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _605 * _589;
    bool _621 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _623 = isnan(_523);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -_605;
    float _635 = _633 + 1.0;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _641 = -_617;
    float _643 = _641 + 1.0;
    float _645 = _617 * _635;
    float _647 = fma(_639, _563, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _649 = fma(_585, _563, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _651 = _631 * _643;
    float _653 = in.m_54.x;
    float _655 = in.m_54.y;
    float _657 = -_631;
    float _659 = _657 + 1.0;
    float _661 = _577 * _651;
    float _663 = _591 * _651;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _669;
    float _673 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _661);
    float _675 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _663);
    float _677 = fma(_667, _593, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _679 = fma(_671, _593, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _681 = fma(_647, _645, _673);
    float _683 = fma(_649, _645, _675);
    float _685 = fma(_677, _619, _681);
    float _687 = fma(_679, _619, _683);
    float _689 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[146].x, _685);
    float _691 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[146].y, _687);
    float _693 = _689 * _653;
    float _695 = _691 * _655;
    bool _697 = !_547;
    float _713;
    if (!_697)
    {
        float _699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _701 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _705 = _703 * _699;
        float _707 = floor(_705);
        float _709 = -_707;
        float _711 = _705 + _709;
        _713 = _711;
        _715 = true;
    }
    else
    {
        float _717 = float(_85);
        float _719 = 1.0 / _717;
        float _721 = _119 * _719;
        _713 = _721;
    }
    _715 = false;
    float _723 = _713;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _727 = _723 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _731 = _723 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _741;
    bool _745 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _747 = isnan(_723);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = 1.0 / _735;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _767 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _769 = isnan(_723);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = 1.0 / _739;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _783 = _723 + _781;
    float _785 = -_777;
    float _787 = _785 + 1.0;
    bool _789 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _791 = 1.0 / _743;
    float _793 = _783 * _757;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _797 = _723 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _801 = _723 + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _803;
    float _807 = 1.0 / _765;
    float _809 = _797 * _779;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _811;
    bool _815 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _817 = isnan(_723);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _831;
    float _835 = 1.0 / _761;
    float _837 = _801 * _791;
    float _839 = fma(_813, _793, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _841 = fma(_833, _793, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _847 = fma(_829, _809, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _849;
    float _853 = _727 * _807;
    bool _855 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _857 = isnan(_723);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _871 = fma(_851, _793, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _873 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _875 = isnan(_723);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = fma(_845, _809, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _887 = -_865;
    float _889 = _887 + 1.0;
    float _891 = fma(_869, _809, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _893 = _731 * _835;
    float _895 = -_825;
    float _897 = _895 + 1.0;
    float _899 = -_883;
    float _901 = _899 + 1.0;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _903;
    float _907 = fma(_805, _893, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _909 = _865 * _897;
    float _911 = _883 * _889;
    bool _913 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _915 = isnan(_723);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _755 * _901;
    float _927 = -_755;
    float _929 = _927 + 1.0;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _931;
    float _935 = fma(_905, _893, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _937 = _777 * _929;
    float _939 = _923 * _787;
    float _941 = fma(_933, _893, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _947 = _871 * _939;
    float _949 = _839 * _939;
    float _951 = _841 * _939;
    float _953 = -_923;
    float _955 = _953 + 1.0;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _965 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[107].x, _947);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[107].y, _949);
    float _969 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[107].z, _951);
    float _971 = fma(_963, _853, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _973 = fma(_891, _937, _965);
    float _975 = fma(_847, _937, _967);
    float _977 = fma(_885, _937, _969);
    float _979 = fma(_945, _853, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _981 = fma(_935, _925, _973);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _983;
    float _987 = fma(_959, _853, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _989;
    float _993 = fma(_907, _925, _975);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _995;
    float _999 = fma(_941, _925, _977);
    float _1001 = fma(_985, _837, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1003 = fma(_991, _837, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1005 = fma(_997, _837, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1007 = fma(_979, _911, _981);
    float _1009 = fma(_971, _911, _993);
    float _1011 = fma(_987, _911, _999);
    float _1013 = fma(_1001, _909, _1007);
    float _1015 = fma(_1003, _909, _1009);
    float _1017 = fma(_1005, _909, _1011);
    float _1019 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[112].x, _1013);
    float _1021 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[112].y, _1015);
    float _1023 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[112].z, _1017);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1033 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _1033;
    out.m_56.y = _1035;
    out.m_56.z = _1037;
    out.m_56.w = _1025;
    bool _1039 = !_789;
    float _1055;
    if (!_1039)
    {
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1043 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1047 = _1045 * _1041;
        float _1049 = floor(_1047);
        float _1051 = -_1049;
        float _1053 = _1047 + _1051;
        _1055 = _1053;
        _1057 = true;
    }
    else
    {
        float _1059 = float(_85);
        float _1061 = 1.0 / _1059;
        float _1063 = _119 * _1061;
        _1055 = _1063;
    }
    _1057 = false;
    float _1065 = _1055;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1069 = _1065 + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1071;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1087 = 1.0 / _1073;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1089;
    bool _1093 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1095 = isnan(_1065);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = 1.0 / _1077;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1109 = _1065 + _1107;
    float _1111 = -_1103;
    float _1113 = _1111 + 1.0;
    bool _1115 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1117 = isnan(_1065);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    float _1127 = 1.0 / _1085;
    float _1129 = _1109 * _1087;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1133 = _1065 + _1131;
    bool _1135 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1137 = isnan(_1065);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1149 = _1065 + _1147;
    float _1151 = 1.0 / _1091;
    float _1153 = _1069 * _1105;
    bool _1155 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1157 = isnan(_1065);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -_1145;
    float _1169 = _1167 + 1.0;
    bool _1171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1173 = 1.0 / _1081;
    float _1175 = _1133 * _1127;
    float _1177 = -_1165;
    float _1179 = _1177 + 1.0;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1181;
    float _1185 = _1145 * _1179;
    float _1187 = _1103 * _1169;
    float _1189 = fma(_1183, _1129, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1193 = _1065 + _1191;
    float _1195 = -_1125;
    float _1197 = _1195 + 1.0;
    float _1199 = _1193 * _1151;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1201;
    float _1205 = _1149 * _1173;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1207;
    float _1211 = fma(_1203, _1129, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1213 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1215 = isnan(_1065);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1229 = fma(_1209, _1129, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1231 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1233 = isnan(_1065);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = _1125 * _1113;
    float _1245 = -_1223;
    float _1247 = _1245 + 1.0;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1257 = _1223 * _1197;
    float _1259 = _1241 * _1247;
    float _1261 = fma(_1251, _1153, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1263 = fma(_1255, _1153, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1265 = fma(_1227, _1153, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1267 = _1189 * _1259;
    float _1269 = _1211 * _1259;
    float _1271 = _1229 * _1259;
    float _1273 = -_1241;
    float _1275 = _1273 + 1.0;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1285;
    float _1289 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1267);
    float _1291 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1269);
    float _1293 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1271);
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1297 = _1295 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1301 = _1299 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1307 = fma(_1261, _1257, _1289);
    float _1309 = fma(_1297, _1175, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1311 = fma(_1301, _1175, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1313 = fma(_1305, _1175, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1315 = fma(_1263, _1257, _1291);
    float _1317 = fma(_1265, _1257, _1293);
    float _1319 = fma(_1279, _1205, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1321 = fma(_1283, _1205, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1323 = fma(_1287, _1205, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1325 = fma(_1319, _1243, _1307);
    float _1327 = fma(_1321, _1243, _1315);
    float _1329 = fma(_1323, _1243, _1317);
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1335;
    float _1339 = fma(_1309, _1187, _1325);
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1341;
    float _1345 = fma(_1333, _1199, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1347 = fma(_1337, _1199, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1349 = fma(_1311, _1187, _1327);
    float _1351 = fma(_1343, _1199, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1353 = fma(_1313, _1187, _1329);
    float _1355 = fma(_1345, _1185, _1339);
    float _1357 = fma(_1347, _1185, _1349);
    float _1359 = fma(_1351, _1185, _1353);
    float _1361 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1355);
    float _1363 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1357);
    float _1365 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1359);
    bool _1367 = !_1171;
    float _1385;
    float _1387;
    if (!_1367)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1373 = float(_85);
        float _1375 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _1377 = _1375 * _1369;
        float _1379 = floor(_1377);
        float _1381 = -_1379;
        float _1383 = _1377 + _1381;
        _1385 = _1373;
        _1387 = _1383;
        _1389 = true;
    }
    else
    {
        float _1391 = float(_85);
        float _1393 = 1.0 / _1391;
        float _1395 = _119 * _1393;
        _1385 = _1391;
        _1387 = _1395;
    }
    _1389 = false;
    float _1397 = _1385;
    float _1399 = _1387;
    float _1401 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1403 = int(_1401);
    float _1405 = in.m_49.y;
    float _1407 = _333 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1409 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1411 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1413 = in.m_49.z;
    float _1415 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1407);
    float _1417 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1419 = int(_1417);
    float _1421 = float(_1403);
    float _1423 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1425 = log2(_1423);
    float _1427 = float(uint(_1419));
    float _1429 = 1.0 / _1421;
    int _1431 = ~_1419;
    int _1433 = _1431 + 1;
    float _1435 = _1405 + (-0.5);
    int _1437 = ~_1419;
    int _1439 = _1437 + 1;
    int _1441 = ~_1419;
    int _1443 = _1441 + 1;
    float _1445 = 1.0 / _1427;
    float _1447 = _119 * _1429;
    float _1449 = trunc(_1447);
    int _1451 = int(_1449);
    int _1453 = as_type<int>(_1445) + (-2);
    float _1455 = float(uint(_1451));
    float _1457 = float(_1451);
    float _1459 = as_type<float>(_1453) * _1455;
    int _1461 = ~_1419;
    int _1463 = _1461 + 1;
    float _1465 = trunc(_1459);
    float _1467 = precise::max(_1465, 0.0);
    uint _1470 = uint(_1467);
    int _1472 = _1463 * int(_1470);
    int _1474 = _1472 + _1451;
    float _1476 = float(_1419);
    float _1478 = float(uint(_1474));
    float _1480 = as_type<float>(_1453) * _1478;
    float _1482 = trunc(_1480);
    float _1484 = precise::max(_1482, 0.0);
    uint _1486 = uint(_1484);
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1490 = _1488 != 0;
    bool _1492 = !_1490;
    float _1494 = _1492 ? 7.345489978790283203125 : 1.0;
    float _1496 = _1494 * _139;
    int _1498 = int(_1470) + int(_1486);
    bool _1500 = _1457 >= _1476;
    bool _1502 = isnan(_1457);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(_1476);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = 1.0 / _1397;
    int _1514 = _1433 * _1498;
    int _1516 = _1514 + _1451;
    bool _1518 = uint(_1516) >= uint(_1419);
    float _1520 = trunc(_1510);
    int _1522 = int(_1520);
    bool _1524 = !_1518;
    int _1526 = _1524 ? 0 : (-1);
    bool _1528 = _1419 == 0;
    int _1530 = ~_1498;
    int _1532 = _1530 + _1526;
    int _1534 = _1532 + 1;
    float _1536 = floor(_1496);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1552 = _1550 != 0;
    int _1554 = _1419 * _1534;
    int _1556 = _1554 + _1451;
    bool _1558 = !_1552;
    int _1560 = _1558 ? 0 : 1;
    int _1562 = ~_1522;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    bool _1568 = !_1528;
    int _1570 = _1568 ? _1556 : (-1);
    int _1572 = abs(_1560);
    bool _1574 = _139 > 0.5;
    float _1576 = -_1536;
    float _1578 = _1496 + _1576;
    int _1580 = _1570 * _1566;
    int _1582 = _1419 + (-1);
    float _1584 = _1578 * _1476;
    float _1586 = _119 * _1476;
    bool _1588 = !_1544;
    int _1590 = _1588 ? 0 : 1;
    int _1592 = _1522 * _1582;
    int _1594 = _1592 + _1580;
    bool _1596 = !_1540;
    int _1598 = _1596 ? 0 : 1;
    float _1600 = _1586 * _1512;
    float _1602 = trunc(_1584);
    int _1604 = int(_1602);
    int _1606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1608 = _1606 != 0;
    int _1610 = abs(_1590);
    bool _1612 = !_1548;
    int _1614 = _1612 ? 0 : 1;
    int _1616 = abs(_1598);
    float _1618 = trunc(_1600);
    int _1620 = int(_1618);
    bool _1622 = !_1608;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = abs(_1614);
    int _1628 = _1594 * _1610;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1632 = _1630 != 0;
    float _1634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _1636 = -_207;
    int _1638 = _1574 ? as_type<int>(_1636) : as_type<int>(_207);
    int _1640 = _1604 * _1572;
    int _1642 = _1640 + _1451;
    int _1644 = abs(_1624);
    float _1646 = _1411 * _1634;
    bool _1648 = _1405 > 0.5;
    bool _1650 = _1413 > 0.5;
    int _1652 = _1620 * _1616;
    int _1654 = _1652 + _1628;
    float _1656 = -_215;
    int _1658 = _1648 ? as_type<int>(_1656) : as_type<int>(_215);
    float _1660 = in.m_49.w;
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1664 = _1662 != 0;
    int _1666 = _1642 * _1626;
    int _1668 = _1666 + _1654;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1672 = _1670 != 0;
    int _1674 = ~_1419;
    int _1676 = _1674 + 1;
    int _1678 = _1604 * _1644;
    int _1680 = _1678 + _1668;
    bool _1682 = !_1632;
    float _1684 = _1682 ? _207 : as_type<float>(_1638);
    float _1686 = _333 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1688 = -_207;
    int _1690 = _1650 ? as_type<int>(_1688) : as_type<int>(_207);
    float _1692 = float(uint(_1680));
    float _1694 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1686);
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1698 = _1696 != 0;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1702 = _1700 != 0;
    float _1704 = as_type<float>(_1453) * _1692;
    float _1706 = _333 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1708 = !_1672;
    float _1710 = _1708 ? _207 : as_type<float>(_1690);
    float _1712 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1706);
    float _1714 = trunc(_1704);
    float _1716 = precise::max(_1714, 0.0);
    uint _1718 = uint(_1716);
    float _1720 = _139 * 2.0;
    bool _1722 = _1660 > 0.5;
    float _1724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1728 = _1409 * _1724;
    float _1730 = floor(_1720);
    float _1732 = _1405 * 2.0;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1736 = _1676 * int(_1718);
    int _1738 = _1736 + _1680;
    float _1740 = floor(_1732);
    float _1742 = float(uint(_1738));
    float _1744 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1750 = as_type<float>(_1453) * _1742;
    float _1752 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1754 = -_215;
    int _1756 = _1722 ? as_type<int>(_1754) : as_type<int>(_215);
    float _1758 = -_1734;
    float _1760 = fma(_1744, 2.0, _1758);
    float _1762 = trunc(_1750);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    float _1768 = fma(_1752, -2.0, _1726);
    bool _1770 = !_1698;
    float _1772 = _1770 ? _215 : as_type<float>(_1658);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1778 = _1730 > 0.0;
    float _1780 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1768);
    bool _1782 = _1730 >= 0.0;
    bool _1784 = isnan(_1730);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan(0.0);
    bool _1790 = _1786 || _1788;
    float _1792 = 1.0 / _1748;
    bool _1794 = !_1702;
    float _1796 = _1794 ? _215 : as_type<float>(_1756);
    int _1798 = ~_1419;
    int _1800 = _1798 + 1;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1806 = _1740 > 0.0;
    int _1808 = int(_1718) + int(_1766);
    float _1810 = 1.0 / _1804;
    int _1812 = _1790 ? 0 : 1;
    bool _1814 = _1740 >= 0.0;
    bool _1816 = isnan(_1740);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan(0.0);
    bool _1822 = _1818 || _1820;
    float _1824 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1694);
    float _1826 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1712);
    float _1828 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1415);
    float _1830 = 1.0 / _1776;
    int _1832 = _1800 * _1808;
    int _1834 = _1832 + _1680;
    float _1836 = _1413 * 2.0;
    int _1838 = ~_1812;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    float _1844 = _1828 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1846 = _1822 ? 0 : 1;
    float _1848 = _1824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1850 = _1842;
    if (!_1778)
    {
        int _1852 = ~_1812;
        int _1854 = _1852 + 1;
        _1850 = _1854;
    }
    int _1856 = _1850;
    float _1858 = floor(_1836);
    float _1860 = _1826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1862 = uint(_1834) >= uint(_1419);
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1864;
    int _1868 = ~_1846;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    int _1874 = _1872;
    if (!_1806)
    {
        int _1876 = ~_1846;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1882;
    float _1886 = _1866 * _1810;
    bool _1888 = !_1862;
    int _1890 = _1888 ? 0 : (-1);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1894 = _1892 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1896 = float(uint(_1642));
    int _1898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1900 = _1898 != 0;
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1904 = _1902 != 0;
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1908 = _1906 != 0;
    float _1910 = _1884 * _1792;
    float _1912 = _139 + _1413;
    float _1914 = as_type<float>(_1453) * _1896;
    float _1916 = _1894 * _1830;
    bool _1918 = !_1904;
    int _1920 = _1918 ? 0 : 1;
    float _1922 = _1912 + (-1.0);
    bool _1924 = _1858 >= 0.0;
    bool _1926 = isnan(_1858);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(0.0);
    bool _1932 = _1928 || _1930;
    float _1934 = trunc(_1914);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    int _1940 = ~_1808;
    int _1942 = _1940 + _1890;
    int _1944 = _1942 + 1;
    float _1946 = _139 + _1405;
    int _1948 = _1932 ? 0 : 1;
    float _1950 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1952 = _1858 > 0.0;
    float _1954 = _119 * _1425;
    float _1956 = _1946 + (-1.0);
    int _1958 = abs(_1920);
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1962 = _1399 + _1960;
    float _1964 = float(_1856);
    float _1966 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1968 = float(_1958);
    int _1970 = _1419 * _1944;
    int _1972 = _1970 + _1680;
    float _1974 = fma(_1910, _1962, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1976 = _1439 * int(_1938);
    int _1978 = _1976 + _1642;
    bool _1980 = !_1900;
    int _1982 = _1980 ? 0 : 1;
    float _1984 = _1405 + _1413;
    bool _1986 = !_1528;
    int _1988 = _1986 ? _1972 : (-1);
    float _1990 = exp2(_1954);
    float _1992 = float(uint(_1978));
    float _1994 = _1984 + (-1.0);
    int _1996 = _1988 >> 31;
    int _1998 = abs(_1982);
    float _2000 = as_type<float>(_1453) * _1992;
    int _2002 = _1996 & 3;
    float _2004 = in.m_58.x;
    float _2006 = in.m_58.y;
    float _2008 = in.m_58.z;
    int _2010 = _1988 + _2002;
    float _2012 = trunc(_2000);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    float _2018 = float(_1998);
    float _2020 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2022 = ~_1948;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    float _2028 = -_1990;
    float _2030 = _2028 + 1.0;
    int _2032 = _2010 >> 2;
    int _2034 = _2026;
    float _2036 = as_type<float>(_1938);
    if (!_1952)
    {
        int _2038 = ~_1948;
        int _2040 = _2038 + 1;
        _2034 = _2040;
    }
    int _2042 = _2034;
    float _2044 = _1968 * _1964;
    int _2046 = _2032 << 4;
    int _2048 = _2046 + 368;
    float _2050 = float(_2042);
    float _2052 = _2044 * (-2.0);
    float _2054 = float(_1880);
    float _2056 = _2018 * _2050;
    uint _2058 = uint(int(uint(_2048) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    bool _2074 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2082 = _2078 || _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2086 = 1.0 + _2084;
    float _2088 = _2056 * (-2.0);
    float _2090 = fma(_2052, _2006, _2006);
    float _2092 = _2082 ? _2030 : 0.0;
    float _2094 = _139 + (-0.5);
    int _2096 = _1988 & 3;
    bool _2098 = _2096 != 0;
    float _2100 = 1.0 / _2086;
    int _2102 = _1988 & 3;
    bool _2104 = _2102 != 0;
    float _2106 = fma(_1966, _2088, _1966);
    float _2108 = fma(_2088, _2004, _2004);
    bool _2110 = !_1908;
    int _2112 = _2110 ? 0 : 1;
    float _2114 = fma(_2020, _2052, _2020);
    float _2116 = _2098 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2120 = uint(_2102) > 1u;
    float _2122 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2124 = int(_2122);
    int _2126 = abs(_2112);
    int _2128 = int(_1938) + int(_2016);
    float _2130 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2118);
    float _2132 = _2092;
    float _2134 = _2116;
    if (!_1490)
    {
        _2036 = _1405;
    }
    float _2136 = _2036;
    float _2138 = _2092 * _2100;
    float _2140 = _2136;
    if (_1490)
    {
        _2140 = _139;
    }
    float _2142 = _2140;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2146 = float(_2126);
    int _2148 = _2048 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    if (!_1490)
    {
        _2132 = _1413;
    }
    float _2166 = _2132;
    float _2168 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2144);
    float _2170 = _2166;
    if (_1490)
    {
        _2170 = _1405;
    }
    float _2172 = _2170;
    float _2174 = _2146 * _2054;
    int _2176 = ~as_type<int>(_2116);
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    int _2182 = _1443 * _2128;
    int _2184 = _2182 + _1642;
    int _2186 = _2180;
    if (!_2120)
    {
        int _2188 = ~as_type<int>(_2116);
        int _2190 = _2188 + 1;
        _2186 = _2190;
    }
    int _2192 = _2186;
    float _2194 = _2174 * (-2.0);
    bool _2196 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2198 = isnan(1.0);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2204 = _2200 || _2202;
    if (!_1490)
    {
        _2134 = _1413;
    }
    float _2206 = _2134;
    float _2208 = fma(_1950, _2194, _1950);
    float _2210 = _2206;
    if (_1490)
    {
        _2210 = _1405;
    }
    float _2212 = _2210;
    float _2214 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2090);
    bool _2216 = !_2204;
    float _2218 = _2216 ? _119 : _2138;
    float _2220 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2108);
    bool _2222 = uint(_2184) >= uint(_1419);
    float _2224 = fma(_2194, _2008, _2008);
    int _2226 = abs(_2192);
    float _2228 = fma(_2218, _2114, _2214);
    bool _2230 = !_2104;
    int _2232 = _2230 ? 0 : 1;
    float _2234 = fma(_2218, _2106, _2220);
    bool _2236 = _2102 != 3;
    float _2238 = _1413 + (-0.5);
    bool _2240 = !_2222;
    int _2242 = _2240 ? 0 : (-1);
    bool _2244 = uint(_2102) >= 2u;
    int _2246 = ~_2226;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    int _2252 = abs(_2232);
    int _2254 = ~_2128;
    int _2256 = _2254 + _2242;
    int _2258 = _2256 + 1;
    int _2260 = _2250 * as_type<int>(_2072);
    int _2262 = _2244 ? 0 : 1;
    int _2264 = ~_2252;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    int _2270 = _1419 * _2258;
    int _2272 = _2270 + _1642;
    int _2274 = ~_2262;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2282 = _1399 + _2280;
    bool _2284 = _2102 != 3;
    int _2286 = _2268 * as_type<int>(_2064);
    int _2288 = _2286 + _2260;
    int _2290 = _2278;
    if (_2236)
    {
        int _2292 = ~_2262;
        int _2294 = _2292 + 1;
        _2290 = _2294;
    }
    int _2296 = _2290;
    bool _2298 = !_2284;
    int _2300 = _2298 ? 0 : (-1);
    int _2302 = abs(_2296);
    int _2304 = abs(_2300);
    bool _2306 = !_1664;
    int _2308 = _2306 ? 0 : 1;
    float _2310 = _2228 * 0.15915493667125701904296875;
    int _2312 = abs(_2308);
    int _2314 = ~_2302;
    int _2316 = _2314 + 1;
    int _2318 = _2316 + 1;
    int _2320 = abs(_2124);
    int _2322 = _2318 * as_type<int>(_2156);
    int _2324 = _2322 + _2288;
    int _2326 = ~_2304;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = fma(_2238, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2224);
    float _2334 = float(uint(_2320));
    float _2336 = fma(_1916, _2282, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2338 = ~_2312;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    int _2344 = _2330 * as_type<int>(_2164);
    int _2346 = _2344 + _2324;
    bool _2348 = !_1528;
    int _2350 = _2348 ? _2272 : (-1);
    float _2352 = _2234 * 0.15915493667125701904296875;
    float _2354 = 1.0 / _2334;
    int _2356 = _2346 * _2342;
    float _2358 = float(uint(_2124));
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2362 = _1399 + _2360;
    int _2364 = _2350 * _2312;
    int _2366 = _2364 + _2356;
    bool _2368 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2370 = isnan(_1399);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = fma(_2218, _2208, _2332);
    float _2382 = 1.0 / _2358;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2386 = abs(_2366);
    float _2388 = -_2378;
    float _2390 = _2388 + 1.0;
    bool _2392 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2394 = isnan(_1399);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2400 = _2396 || _2398;
    float _2402 = float(_2400);
    float _2404 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2384);
    float _2406 = fma(_1886, _2362, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2408 = as_type<int>(_2354) + (-2);
    float _2410 = _2310 * 6.283185482025146484375;
    float _2412 = sin(_2410);
    float _2414 = float(uint(_2386));
    float _2416 = _2380 * 0.15915493667125701904296875;
    bool _2418 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2420 = isnan(_1399);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2426 = _2422 || _2424;
    float _2428 = float(_2426);
    bool _2430 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2432 = isnan(_1399);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = as_type<float>(_2408) * _2414;
    float _2444 = _2402 * _2390;
    float _2446 = _2310 * 6.283185482025146484375;
    float _2448 = cos(_2446);
    float _2450 = float(uint(_2366));
    int _2452 = ~_2320;
    int _2454 = _2452 + 1;
    float _2456 = trunc(_2442);
    float _2458 = precise::max(_2456, 0.0);
    uint _2460 = uint(_2458);
    int _2462 = as_type<int>(_2382) + (-2);
    float _2464 = -_2402;
    float _2466 = _2464 + 1.0;
    bool _2468 = _2124 == 0;
    float _2470 = as_type<float>(_2462) * _2450;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2474 = _2352 * 6.283185482025146484375;
    float _2476 = sin(_2474);
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2480 = _2352 * 6.283185482025146484375;
    float _2482 = cos(_2480);
    float _2484 = trunc(_2470);
    float _2486 = precise::max(_2484, 0.0);
    uint _2488 = uint(_2486);
    float _2490 = _2440 * _2466;
    float _2492 = -_2440;
    float _2494 = _2492 + 1.0;
    int _2496 = ~_2124;
    int _2498 = _2496 + 1;
    float _2500 = _2428 * _2494;
    float _2502 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2478);
    float _2504 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2506 = _2416 * 6.283185482025146484375;
    float _2508 = sin(_2506);
    float _2510 = _1974 * _2500;
    int _2512 = _2454 * int(_2460);
    int _2514 = _2512 + _2386;
    float _2516 = -_2472;
    float _2518 = fma(_2504, 2.0, _2516);
    float _2520 = -_2428;
    float _2522 = _2520 + 1.0;
    float _2524 = _2476 * _2448;
    float _2526 = float(uint(_2514));
    float _2528 = _2416 * 6.283185482025146484375;
    float _2530 = cos(_2528);
    int _2532 = _2498 * int(_2488);
    int _2534 = _2532 + _2366;
    float _2536 = fma(_2522, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2510);
    float _2538 = as_type<float>(_2408) * _2526;
    float _2540 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2544 = float(uint(_2534));
    float _2546 = _2482 * _2412;
    float _2548 = trunc(_2538);
    float _2550 = precise::max(_2548, 0.0);
    uint _2552 = uint(_2550);
    float _2554 = fma(_2540, -2.0, _2542);
    float _2556 = fma(_2336, _2490, _2536);
    float _2558 = as_type<float>(_2462) * _2544;
    float _2560 = _2476 * _2412;
    float _2562 = -_2546;
    float _2564 = fma(_2508, _2524, _2562);
    float _2566 = -_2524;
    float _2568 = fma(_2508, _2546, _2566);
    float _2570 = _2530 * _1646;
    float _2572 = _2448 * _2530;
    float _2574 = _2482 * _2448;
    float _2576 = _2412 * _2530;
    float _2578 = trunc(_2558);
    float _2580 = precise::max(_2578, 0.0);
    uint _2582 = uint(_2580);
    float _2584 = _2482 * _2570;
    float _2586 = _2476 * _2570;
    float _2588 = fma(_2508, _2574, _2560);
    float _2590 = -_1646;
    float _2592 = _2508 * _2590;
    float _2594 = fma(_2508, _2560, _2574);
    float _2596 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2598 = fma(_2588, _1728, _2584);
    float _2600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2602 = fma(_2572, _1728, _2592);
    float _2604 = fma(_2564, _1728, _2586);
    float _2606 = fma(_2568, _2596, _2598);
    int _2608 = ~_2320;
    int _2610 = _2608 + 1;
    float _2612 = fma(_2576, _2596, _2602);
    float _2614 = fma(_2594, _2596, _2604);
    float _2616 = _2606 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2620 = int(_2488) + int(_2582);
    float _2622 = _2606 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2624 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2616);
    int _2626 = int(_2460) + int(_2552);
    float _2628 = _1710 + 0.5;
    float _2630 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2622);
    float _2632 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2624);
    float _2634 = _2600 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2636 = _2610 * _2626;
    int _2638 = _2636 + _2386;
    float _2640 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2630);
    float _2642 = _2632 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2644 = -_119;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2518);
    float _2648 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2554);
    float _2650 = _2640 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2652 = _1844 + _2642;
    float _2654 = _2618 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2656 = ~_2124;
    int _2658 = _2656 + 1;
    float _2660 = _1848 + _2650;
    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2664 = _2652 + _2662;
    float _2666 = _1796 + (-0.5);
    bool _2668 = uint(_2638) >= uint(_2320);
    int _2670 = _2658 * _2620;
    int _2672 = _2670 + _2366;
    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2676 = _2660 + _2674;
    float _2678 = _2664 * _2664;
    float _2680 = _2606 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2682 = -_2634;
    float _2684 = -_2648;
    float _2686 = fma(_2682, _2666, _2684);
    int _2688 = _2366 ^ _2124;
    float _2690 = fma(_2676, _2676, _2678);
    bool _2692 = uint(_2672) >= uint(_2124);
    float _2694 = fma(_2654, _2628, _2646);
    bool _2696 = !_2668;
    int _2698 = _2696 ? 0 : (-1);
    float _2700 = sqrt(_2690);
    uint _2702 = uint(int(uint(_2688) >> uint(31)));
    float _2704 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2680);
    bool _2706 = !_2692;
    int _2708 = _2706 ? 0 : (-1);
    float _2710 = fma(_2406, _2444, _2556);
    int _2712 = ~_2698;
    int _2714 = _2626 + _2712;
    int _2716 = _2714 + 1;
    float _2718 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2704);
    int _2720 = ~int(_2702);
    int _2722 = _2720 + 1;
    float _2724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2726 = ~_2620;
    int _2728 = _2726 + _2708;
    int _2730 = _2728 + 1;
    float _2732 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2710);
    int _2734 = _2716 ^ _2722;
    bool _2736 = _2124 == 0;
    int _2738 = _2124 * _2730;
    int _2740 = _2738 + _2366;
    int _2742 = ~_2722;
    int _2744 = _2742 + _2734;
    int _2746 = _2744 + 1;
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2750 = _2700 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2752 = _2718 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2754 = !_2736;
    int _2756 = _2754 ? _2740 : (-1);
    float _2758 = -_119;
    float _2760 = fma(_2758, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1760);
    bool _2762 = !_2468;
    int _2764 = _2762 ? _2746 : (-1);
    float _2766 = _1860 + _2752;
    float _2768 = float(_2756);
    float _2770 = _2724 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2772 = float(_2764);
    float _2774 = _1684 + 0.5;
    float _2776 = fma(_2770, _2768, _2760);
    float _2778 = _2760;
    float _2780 = _2772;
    float _2782 = _2652;
    if (!_2750)
    {
        _2778 = _2660;
    }
    float _2784 = _2778;
    float _2786 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2788 = -_1780;
    float _2790 = fma(_2786, _2772, _2788);
    float _2792 = _1772 + (-0.5);
    float _2794 = _2784;
    if (!_2750)
    {
        _2780 = _2766;
    }
    float _2796 = _2780;
    bool _2798 = !_2750;
    float _2800 = _2796;
    if (!_2798)
    {
        float _2802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2806 = _2700 + _2804;
        float _2808 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2810 = rsqrt(_2690);
        float _2812 = _2806 * _2802;
        float _2814 = _2812 * 0.15915493667125701904296875;
        float _2816 = _2814 * 6.283185482025146484375;
        float _2818 = cos(_2816);
        float _2820 = _2814 * 6.283185482025146484375;
        float _2822 = sin(_2820);
        float _2824 = _2818 + (-1.0);
        float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2828 = fma(_2822, _2808, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2830 = fma(_2766, _2818, _2826);
        float _2832 = _2810 * _2828;
        float _2834 = fma(_2676, _2832, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2836 = fma(_2664, _2832, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2800 = _2830;
        _2794 = _2834;
        _2782 = _2836;
    }
    float _2838 = _2800;
    float _2840 = _2794;
    float _2842 = _2782;
    float _2844 = -_1860;
    float _2846 = _2844 + _2838;
    float _2848 = fma(_2770, _2774, _2776);
    float _2850 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2502);
    float _2852 = -_1848;
    float _2854 = _2852 + _2840;
    float _2856 = _2846 * _2846;
    float _2858 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2404);
    float _2860 = -_2786;
    float _2862 = fma(_2860, _2792, _2790);
    float _2864 = -_2850;
    float _2866 = _2864 + 1.0;
    float _2868 = -_1844;
    float _2870 = _2868 + _2842;
    float _2872 = fma(_2854, _2854, _2856);
    float _2874 = -_2858;
    float _2876 = _2874 + 1.0;
    float _2878 = -_2866;
    float _2880 = fma(_1710, _2878, _2694);
    float _2882 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2130);
    float _2884 = fma(_2870, _2870, _2872);
    float _2886 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2168);
    float _2888 = fma(_1796, _2876, _2686);
    float _2890 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2892 = sqrt(_2884);
    float _2894 = -_2882;
    float _2896 = _2894 + 1.0;
    float _2898 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2900 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2902 = -_2886;
    float _2904 = _2902 + 1.0;
    float _2906 = _2890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2908 = -_2896;
    float _2910 = fma(_1684, _2908, _2848);
    float _2912 = _2898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2914 = _2900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2916 = _2732 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2918 = fma(_1772, _2904, _2862);
    out.m_60.x = _2906;
    out.m_60.y = _2914;
    out.m_60.z = _2912;
    out.m_60.w = _2916;
    bool _2920 = _2892 > 0.0;
    out.m_62.x = _2910;
    out.m_62.y = _2918;
    out.m_62.z = _2880;
    out.m_62.w = _2888;
    bool _2922 = !_2920;
    float _2924 = _2880;
    float _2926 = _2918;
    float _2928 = _2910;
    float _2930 = _2838;
    float _2932 = _2842;
    float _2934 = _2840;
    float _2936 = _2910;
    float _2938 = _2906;
    if (!_2922)
    {
        bool _2940 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2942 = _2888;
        if (_2940)
        {
            float _2944 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2942 = _2944;
        }
        float _2946 = _2942;
        if (_2940)
        {
            float _2948 = _481 * _2946;
            _2924 = _2948;
        }
        float _2950 = _2924;
        float _2952 = _2950;
        if (_2940)
        {
            float _2954 = _483 * _2946;
            _2926 = _2954;
        }
        float _2956 = _2926;
        float _2958 = _2956;
        if (_2940)
        {
            float _2960 = _485 * _2946;
            _2928 = _2960;
        }
        float _2962 = _2928;
        float _2964 = _2962;
        float _2966 = _2962;
        if (!_2940)
        {
            float _2968 = _119 + 1.0;
            float _2970 = _2968;
            if (!_159)
            {
                float _2972 = _2968 * _2968;
                float _2974 = _2972 * 0.5;
                _2964 = _2974;
            }
            float _2976 = _2964;
            float _2978 = _2976;
            if (!_159)
            {
                float _2980 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2978 = _2980;
            }
            float _2982 = _2978;
            bool _2984 = !_159;
            float _2986 = _2982;
            if (!_2984)
            {
                float _2988 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2990 = log2(_2988);
                float _2992 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2994 = _2990 * _2968;
                float _2996 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2998 = 1.0 + _2996;
                float _3000 = 1.0 / _2998;
                float _3002 = _2992 * 0.693147182464599609375;
                float _3004 = exp2(_2994);
                float _3006 = 1.0 / _3002;
                float _3008 = _3004 + (-1.0);
                float _3010 = -_3008;
                float _3012 = fma(_3010, _3006, _2968);
                float _3014 = _3012 * _3000;
                float _3016 = _3014 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2986 = _3016;
            }
            float _3018 = _2986;
            float _3020 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3022 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3024 = !_159;
            if (!_3024)
            {
                float _3026 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3028 = log2(_3026);
                float _3030 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3032 = 1.0 + _3030;
                float _3034 = 1.0 / _3032;
                float _3036 = _3028 * _2968;
                float _3038 = exp2(_3036);
                float _3040 = -_3038;
                float _3042 = _3040 + 1.0;
                float _3044 = _3042 * _3034;
                _2970 = _3044;
            }
            float _3046 = _2970;
            float _3048 = fma(_3046, _173, _3022);
            float _3050 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3052 = fma(_3046, _171, _3020);
            float _3054 = -_431;
            float _3056 = _3054 + _3048;
            float _3058 = fma(_3046, _175, _3050);
            float _3060 = -_425;
            float _3062 = _3060 + _3052;
            float _3064 = _3056 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3066 = _3056 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3068 = _3056 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3070 = -_437;
            float _3072 = _3070 + _3058;
            float _3074 = fma(_3062, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3064);
            float _3076 = fma(_3062, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3066);
            float _3078 = fma(_3062, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3068);
            float _3080 = fma(_3072, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3074);
            float _3082 = fma(_3072, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3076);
            float _3084 = fma(_3072, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3078);
            _493 = _3082;
            _495 = _3080;
            _497 = _3084;
            _2952 = _3080;
            _2958 = _3082;
            _2966 = _3084;
        }
        float _3086 = _493;
        float _3088 = _495;
        float _3090 = _497;
        float _3092 = _2952;
        float _3094 = _2958;
        float _3096 = _2966;
        float _3098 = _3086 * _3086;
        float _3100 = rsqrt(_2884);
        float _3102 = fma(_3088, _3088, _3098);
        float _3104 = fma(_3090, _3090, _3102);
        float _3106 = sqrt(_3104);
        float _3108 = _2854 * _3100;
        float _3110 = _2846 * _3100;
        float _3112 = _2870 * _3100;
        bool _3114 = _3106 > 0.0;
        bool _3116 = !_3114;
        _2936 = _3096;
        _239 = _3100;
        if (!_3116)
        {
            float _3118 = rsqrt(_3104);
            float _3120 = _3118 * _3086;
            float _3122 = _3118 * _3088;
            float _3124 = _3118 * _3090;
            float _3126 = _3110 * _3120;
            float _3128 = fma(_3108, _3122, _3126);
            float _3130 = fma(_3112, _3124, _3128);
            float _3132 = _3130 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3134 = fma(_3092, _3132, _2840);
            float _3136 = fma(_3094, _3132, _2838);
            float _3138 = fma(_3096, _3132, _2842);
            _2930 = _3136;
            _2932 = _3138;
            _2934 = _3134;
            _239 = _3132;
        }
    }
    float _3140 = _2930;
    float _3142 = _2932;
    float _3144 = _2934;
    float _3146 = _2936;
    float _3148 = _239;
    float _3150 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3152 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3154 = isnan(0.5);
    bool _3156 = _3152 || _3154;
    bool _3158 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3160 = _3156 || _3158;
    bool _3162 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3164 = isnan(0.5);
    bool _3166 = _3162 || _3164;
    bool _3168 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3170 = _3166 || _3168;
    float _3172 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3150);
    float _3174 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3176 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3172);
    float _3178 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3174);
    float _3180 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3182 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3178);
    float _3184 = _3176;
    float _3186 = _3148;
    float _3188 = _3146;
    float _3190 = _3140;
    float _3192 = _3144;
    if (_3160)
    {
        _3184 = _3140;
    }
    float _3194 = _3184;
    float _3196 = 1.0 / _3180;
    float _3198 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3200 = _3198;
    float _3202 = _3194;
    if (_3160)
    {
        _3186 = _3142;
    }
    float _3204 = _3186;
    float _3206 = _3198 + _3180;
    float _3208 = _3204;
    if (_3160)
    {
        _3200 = _3144;
    }
    float _3210 = _3200;
    float _3212 = _3210;
    if (!_3160)
    {
        float _3214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3216 = _1860 + _3214;
        float _3218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3220 = _1848 + _3218;
        float _3222 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3224 = -_1860;
        float _3226 = _3224 + _3140;
        float _3228 = _3216 * _3216;
        float _3230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3232 = _1844 + _3230;
        float _3234 = -_1844;
        float _3236 = _3234 + _3142;
        float _3238 = fma(_3220, _3220, _3228);
        float _3240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3242 = fma(_3232, _3232, _3238);
        float _3244 = sqrt(_3242);
        float _3246 = _3222 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3248 = precise::min(_3244, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3250 = _3248 * _3240;
        float _3252 = -_1848;
        float _3254 = _3252 + _3144;
        float _3256 = _3246 * _3250;
        float _3258 = fma(_3254, _3256, _1848);
        float _3260 = fma(_3226, _3256, _1860);
        float _3262 = fma(_3236, _3256, _1844);
        _3188 = _3240;
        _3202 = _3260;
        _3212 = _3258;
        _3208 = _3262;
        _3190 = _3226;
    }
    float _3264 = _3188;
    float _3266 = _3202;
    float _3268 = _3212;
    float _3270 = _3208;
    float _3272 = _3190;
    float _3274 = _3264;
    float _3276 = _3272;
    if (_3170)
    {
        _3274 = 1.0;
    }
    float _3278 = _3274;
    float _3280 = _3206 * _3196;
    float _3282 = _3280 * 0.5;
    float _3284 = _3278;
    if (!_3170)
    {
        float _3286 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3288 = _3286 * 0.15915493667125701904296875;
        float _3290 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3294 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3292);
        float _3296 = _3288 * 6.283185482025146484375;
        float _3298 = cos(_3296);
        float _3300 = _3290 * 0.15915493667125701904296875;
        float _3302 = _3288 * 6.283185482025146484375;
        float _3304 = sin(_3302);
        float _3306 = 1.0 / _3298;
        float _3308 = _3300 * 6.283185482025146484375;
        float _3310 = cos(_3308);
        float _3312 = _3304 * _3306;
        float _3314 = _3300 * 6.283185482025146484375;
        float _3316 = sin(_3314);
        float _3318 = _3310 * _3312;
        float _3320 = 1.0 / _3294;
        float _3322 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3324 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3322;
        float _3326 = 1.0 / _3318;
        float _3328 = 1.0 / _3324;
        float _3330 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3332 = _3320 * _3330;
        float _3334 = _3316 * _3326;
        float _3336 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3338 = fma(_3334, _3332, _3336);
        float _3340 = _3338 * _3328;
        float _3342 = precise::clamp(_3340, 0.0, 1.0);
        _3192 = _3332;
        _3276 = _3300;
        _3284 = _3342;
    }
    float _3344 = _3192;
    float _3346 = _3276;
    float _3348 = _3284;
    float _3350 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3352 = _3266 + _3350;
    float _3354 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3356 = _3268 + _3354;
    float _3358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3360 = _3270 + _3358;
    float _3362 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3364 = _3352 * _3352;
    float _3366 = fma(_3356, _3356, _3364);
    float _3368 = fma(_3360, _3360, _3366);
    float _3370 = rsqrt(_3368);
    float _3372 = _3370 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3374 = _3356 * _3372;
    float _3376 = _3360 * _3372;
    float _3378 = _3374 * _3374;
    float _3380 = _3376 * _3376;
    float _3382 = _3378 + _3380;
    float _3384 = sqrt(_3382);
    bool _3386 = _3384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3390 = _3384 + _3388;
    float _3392 = _3370;
    float _3394 = _3346;
    float _3396 = _3390;
    float _3398 = _3344;
    float _3400 = _3352;
    float _3402 = _3374;
    if (_3386)
    {
        float _3404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3392 = _3404;
    }
    float _3406 = _3392;
    if (_3386)
    {
        float _3408 = rsqrt(_3382);
        _3394 = _3408;
    }
    float _3410 = _3394;
    float _3412 = _3410;
    if (_3386)
    {
        float _3414 = _3390 * _3406;
        _3396 = _3414;
    }
    float _3416 = _3396;
    if (_3386)
    {
        float _3418 = _3416 * 0.15915493667125701904296875;
        _3398 = _3418;
    }
    float _3420 = _3398;
    float _3422 = _3406;
    float _3424 = _3420;
    if (_3386)
    {
        float _3426 = _3420 * 6.283185482025146484375;
        float _3428 = sin(_3426);
        _3422 = _3428;
    }
    float _3430 = _3422;
    float _3432 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3434 = precise::max(0.0, _3432);
    float _3436 = _3360;
    float _3438 = _3434;
    if (_3386)
    {
        float _3440 = _3420 * 6.283185482025146484375;
        float _3442 = cos(_3440);
        _3436 = _3442;
    }
    float _3444 = _3436;
    float _3446 = -_3372;
    float _3448 = -_3434;
    float _3450 = fma(_3352, _3446, _3448);
    if (_3386)
    {
        float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3438 = _3452;
    }
    float _3454 = _3438;
    float _3456 = _3454;
    if (!_3386)
    {
        _3424 = _3450;
    }
    float _3458 = _3424;
    float _3460 = _3458;
    if (_3386)
    {
        float _3462 = fma(_3430, _3454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3400 = _3462;
    }
    float _3464 = _3400;
    float _3466 = sqrt(_3368);
    float _3468 = _3464;
    if (_3386)
    {
        float _3470 = _3444 + (-1.0);
        _3456 = _3470;
    }
    float _3472 = _3456;
    float _3474 = _3472;
    if (_3386)
    {
        float _3476 = _3410 * _3464;
        _2938 = _3476;
    }
    float _3478 = _2938;
    if (!_3386)
    {
        _3412 = _3376;
    }
    float _3480 = _3412;
    float _3482 = _3480;
    if (_3386)
    {
        float _3484 = _3472 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3468 = _3484;
    }
    float _3486 = _3468;
    float _3488 = _3486;
    if (_3386)
    {
        float _3490 = _3374 * _3478;
        _3402 = _3490;
    }
    float _3492 = _3402;
    if (!_3386)
    {
        _3474 = _3378;
    }
    float _3494 = _3474;
    float _3496 = _3494;
    if (_3386)
    {
        float _3498 = _3376 * _3478;
        _3482 = _3498;
    }
    float _3500 = _3482;
    if (_3386)
    {
        float _3502 = fma(_3450, _3444, _3486);
        _3460 = _3502;
    }
    float _3504 = _3460;
    if (_3386)
    {
        float _3506 = _3492 * _3492;
        _3496 = _3506;
    }
    float _3508 = _3496;
    if (!_3386)
    {
        _3488 = _3380;
    }
    float _3510 = _3488;
    float _3512 = _3510;
    if (_3386)
    {
        float _3514 = _3500 * _3500;
        _3512 = _3514;
    }
    float _3516 = _3512;
    float _3518 = fma(_3504, _3504, _3508);
    float _3520 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3522 = _3518 + _3516;
    float _3524 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3520);
    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3528 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3526);
    float _3530 = precise::clamp(_3528, 0.0, 1.0);
    float _3532 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3534 = rsqrt(_3522);
    float _3536 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3524);
    float _3538 = -_3530;
    float _3540 = _3538 + 1.0;
    float _3542 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3544 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3532);
    float _3546 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3548 = _3536 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3550 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3542);
    float _3552 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3544);
    float _3554 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3546);
    float _3556 = _3548 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3558 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3550);
    float _3560 = _3552 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3562 = abs(_3540);
    float _3564 = log2(_3562);
    float _3566 = -_3556;
    float _3568 = fma(_3566, _3362, 1.0);
    float _3570 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3572 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3574 = _3534 * _3492;
    float _3576 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3554);
    float _3578 = _3534 * _3504;
    float _3580 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3572);
    float _3582 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3584 = _3534 * _3500;
    float _3586 = _3576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3588 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3580);
    float _3590 = -_3582;
    float _3592 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3590);
    float _3594 = log2(_3568);
    float _3596 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3598 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3588);
    float _3600 = -_3584;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3592);
    float _3604 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3606 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3608 = fma(_3602, -0.5, 0.5);
    float _3610 = 1.0 / _3598;
    float _3612 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3606);
    float _3614 = fma(_3602, 0.5, 0.5);
    float _3616 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3596);
    float _3618 = _3578 + 1.0;
    float _3620 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3612);
    float _3622 = fma(_3614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3624 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3616);
    float _3626 = exp2(_3604);
    float _3628 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3620);
    float _3630 = fma(_3614, _3622, -0.212114393711090087890625);
    float _3632 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3624);
    float _3634 = _3594 * 0.693147182464599609375;
    float _3636 = sqrt(_3608);
    float _3638 = fma(_3614, _3630, 1.570728778839111328125);
    float _3640 = _3628 * _3610;
    float _3642 = _3632 * _3610;
    float _3644 = _3634 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3646 = fma(_3640, 0.5, 0.5);
    float _3648 = fma(_3642, -0.5, 0.5);
    float _3650 = -_3578;
    float _3652 = fma(_3626, _3618, _3650);
    float3 _9254 = float3(_3646, _3648, _3644);
    float _3654 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9254, float3(0.0), isnan(_9254)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9254, float3(0.0), isnan(_9254)), level(0.0)).x;
    float _3656 = fma(_3652, 0.5, 0.5);
    float _3658 = _3636 * 0.636619746685028076171875;
    float _3660 = -_3638;
    float _3662 = fma(_3658, _3660, 1.0);
    float3 _9275 = float3(_3646, _3648, _3644);
    float4 _3665 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9275, float3(0.0), isnan(_9275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9275, float3(0.0), isnan(_9275)), level(0.0)).xyzw;
    float _3667 = _3665.x;
    float _3669 = _3665.y;
    float _3671 = _3665.z;
    float _3673 = _3665.w;
    float2 _9292 = float2(_3662, _3656);
    float3 _3677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9292, float2(0.0), isnan(_9292)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9292, float2(0.0), isnan(_9292)), level(0.0)).xyz;
    float _3679 = _3677.x;
    float _3681 = _3677.y;
    float _3683 = _3677.z;
    float _3685 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3687 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3689 = _3348 > 0.0;
    bool _3691 = isnan(_3348);
    bool _3693 = _3689 || _3691;
    bool _3695 = isnan(0.0);
    bool _3697 = _3693 || _3695;
    float _3699 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3687);
    float _3701 = exp2(_3685);
    float _3703 = _3348 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3705 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3699);
    float _3707 = _489 * _3703;
    float _3709 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3705);
    float _3711 = _3709 + _3598;
    out.gl_Position.x = _3628;
    out.gl_Position.y = _3632;
    out.gl_Position.z = _3709;
    out.gl_Position.w = _3598;
    float _3713 = _3711 * 0.5;
    float _3715 = -_3701;
    float _3717 = _3715 + 1.0;
    float _3719 = _3707 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3721 = _3717 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _3713;
    out.m_64.w = _3598;
    out.m_45.x = _3719;
    float _3723 = _3721 * _3654;
    float _3725 = -_3721;
    float _3727 = _3725 + 1.0;
    float _3729 = _3673 * _3723;
    float _3731 = _3683 * _3723;
    float _3733 = fma(_3679, _3729, _3667);
    float _3735 = fma(_3681, _3729, _3669);
    float _3737 = _3673 * _3727;
    float _3739 = fma(_3673, _3731, _3671);
    out.m_66.x = _3733;
    out.m_66.y = _3735;
    out.m_66.z = _3739;
    out.m_66.w = _3737;
    if (_3697)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3741 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3741;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1389 = false;
    bool _1057 = false;
    bool _715 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3798 = as_type<float>(_101);
        out.gl_Position.z = _3798;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3867 = as_type<float>(_137);
        out.gl_Position.z = _3867;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = _143 * _141;
    float _169 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = in.m_47.x;
    float _173 = in.m_47.y;
    float _175 = in.m_47.z;
    float _177 = _169 * 6.283185482025146484375;
    float _179 = floor(_169);
    int _181 = as_type<int>(_145) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_145) & 2;
    bool _187 = _185 != 0;
    float _189 = _177 * 0.15915493667125701904296875;
    float _191 = _177;
    float _193 = _147;
    if (!_159)
    {
        float _195 = _147 * _147;
        float _197 = _195 * 0.5;
        _191 = _197;
    }
    float _199 = _191;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    bool _205 = !_183;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _189 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_187;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = _199;
    if (!_159)
    {
        float _219 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    float _223 = -_179;
    float _225 = _169 + _223;
    bool _227 = _225 < 0.5;
    float _229 = float(_227);
    bool _231 = !_159;
    float _233 = _221;
    float _235 = _161;
    float _237 = _163;
    float _239 = _171;
    if (!_231)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _147 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _147);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _269;
    }
    float _271 = _233;
    bool _273 = !_159;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _147 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _193 = _293;
    }
    float _295 = _193;
    float _297 = -_225;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_211, 0.5, 0.5);
    float _303 = -_229;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _313 = -_301;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = fma(_295, _171, _307);
    float _319 = fma(_295, _173, _309);
    float _321 = fma(_295, _175, _311);
    float _323 = _307;
    if (!_159)
    {
        float _325 = _119 * _119;
        float _327 = _325 * 0.5;
        _323 = _327;
    }
    float _329 = _323;
    float _331 = fma(_317, _149, _161);
    float _333 = fma(_319, _149, _163);
    float _335 = fma(_321, _149, _165);
    if (!_159)
    {
        float _337 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _337;
    }
    float _339 = _235;
    float _341 = _339;
    if (!_159)
    {
        _237 = _119;
    }
    float _343 = _237;
    bool _345 = !_159;
    float _347 = _343;
    if (!_345)
    {
        float _349 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = log2(_349);
        float _353 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _355 = _353 + 1.0;
        float _357 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _359 = _119 * _351;
        float _361 = 1.0 / _355;
        float _363 = _357 * 0.693147182464599609375;
        float _365 = exp2(_359);
        float _367 = 1.0 / _363;
        float _369 = _365 + (-1.0);
        float _371 = -_369;
        float _373 = fma(_371, _367, _119);
        float _375 = _373 * _361;
        float _377 = _375 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _341 = _377;
    }
    float _379 = _341;
    bool _381 = !_159;
    if (!_381)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = 1.0 / _389;
        float _393 = _119 * _385;
        float _395 = exp2(_393);
        float _397 = -_395;
        float _399 = _397 + 1.0;
        float _401 = _399 * _391;
        _347 = _401;
    }
    float _403 = _347;
    bool _405 = !_203;
    int _407 = _405 ? 0 : 1;
    float _409 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _417 = _415 != 0;
    float _419 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _421 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _423 = abs(_407);
    float _425 = fma(_403, _171, _409);
    bool _427 = !_413;
    int _429 = _427 ? 0 : 1;
    float _431 = fma(_403, _173, _419);
    bool _433 = !_417;
    int _435 = _433 ? 0 : 1;
    float _437 = fma(_403, _175, _421);
    int _439 = abs(_429);
    float _441 = -_431;
    float _443 = _319 + _441;
    int _445 = abs(_435);
    float _447 = -_425;
    float _449 = _317 + _447;
    float _451 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _457 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _459 = float(_439);
    float _461 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _457);
    float _467 = float(_423);
    float _469 = abs(_299);
    float _471 = _459 * _469;
    float _473 = -_437;
    float _475 = _321 + _473;
    float _477 = fma(_467, _315, _471);
    float _479 = float(_445);
    float _481 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[4].z, _461);
    float _483 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
    float _485 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    float _487 = abs(_305);
    float _489 = fma(_479, _487, _477);
    bool _491 = !_455;
    float _493 = _483;
    float _495 = _481;
    float _497 = _485;
    float _513;
    if (!_491)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_85);
        float _519 = 1.0 / _517;
        float _521 = _119 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = _523 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = 1.0 / _535;
    bool _547 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _549 = 1.0 / _539;
    float _551 = 1.0 / _543;
    float _553 = _527 * _545;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _557 = _523 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _559;
    float _563 = _557 * _549;
    bool _565 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _567 = isnan(_523);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = fma(_561, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -_575;
    float _589 = _587 + 1.0;
    float _591 = fma(_581, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _593 = _531 * _551;
    bool _595 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _597 = isnan(_523);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    bool _607 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _609 = isnan(_523);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _605 * _589;
    bool _621 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _623 = isnan(_523);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -_605;
    float _635 = _633 + 1.0;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _641 = -_617;
    float _643 = _641 + 1.0;
    float _645 = _617 * _635;
    float _647 = fma(_639, _563, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _649 = fma(_585, _563, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _651 = _631 * _643;
    float _653 = in.m_54.x;
    float _655 = in.m_54.y;
    float _657 = -_631;
    float _659 = _657 + 1.0;
    float _661 = _577 * _651;
    float _663 = _591 * _651;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _669;
    float _673 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _661);
    float _675 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _663);
    float _677 = fma(_667, _593, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _679 = fma(_671, _593, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _681 = fma(_647, _645, _673);
    float _683 = fma(_649, _645, _675);
    float _685 = fma(_677, _619, _681);
    float _687 = fma(_679, _619, _683);
    float _689 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[146].x, _685);
    float _691 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[146].y, _687);
    float _693 = _689 * _653;
    float _695 = _691 * _655;
    bool _697 = !_547;
    float _713;
    if (!_697)
    {
        float _699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _701 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _705 = _703 * _699;
        float _707 = floor(_705);
        float _709 = -_707;
        float _711 = _705 + _709;
        _713 = _711;
        _715 = true;
    }
    else
    {
        float _717 = float(_85);
        float _719 = 1.0 / _717;
        float _721 = _119 * _719;
        _713 = _721;
    }
    _715 = false;
    float _723 = _713;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _727 = _723 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _731 = _723 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _741;
    bool _745 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _747 = isnan(_723);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = 1.0 / _735;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _767 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _769 = isnan(_723);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = 1.0 / _739;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _783 = _723 + _781;
    float _785 = -_777;
    float _787 = _785 + 1.0;
    bool _789 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _791 = 1.0 / _743;
    float _793 = _783 * _757;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _797 = _723 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _801 = _723 + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _803;
    float _807 = 1.0 / _765;
    float _809 = _797 * _779;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _811;
    bool _815 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _817 = isnan(_723);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _831;
    float _835 = 1.0 / _761;
    float _837 = _801 * _791;
    float _839 = fma(_813, _793, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _841 = fma(_833, _793, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _847 = fma(_829, _809, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _849;
    float _853 = _727 * _807;
    bool _855 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _857 = isnan(_723);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _871 = fma(_851, _793, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _873 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _875 = isnan(_723);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = fma(_845, _809, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _887 = -_865;
    float _889 = _887 + 1.0;
    float _891 = fma(_869, _809, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _893 = _731 * _835;
    float _895 = -_825;
    float _897 = _895 + 1.0;
    float _899 = -_883;
    float _901 = _899 + 1.0;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _903;
    float _907 = fma(_805, _893, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _909 = _865 * _897;
    float _911 = _883 * _889;
    bool _913 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _915 = isnan(_723);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _755 * _901;
    float _927 = -_755;
    float _929 = _927 + 1.0;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _931;
    float _935 = fma(_905, _893, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _937 = _777 * _929;
    float _939 = _923 * _787;
    float _941 = fma(_933, _893, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _947 = _871 * _939;
    float _949 = _839 * _939;
    float _951 = _841 * _939;
    float _953 = -_923;
    float _955 = _953 + 1.0;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _965 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[107].x, _947);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[107].y, _949);
    float _969 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[107].z, _951);
    float _971 = fma(_963, _853, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _973 = fma(_891, _937, _965);
    float _975 = fma(_847, _937, _967);
    float _977 = fma(_885, _937, _969);
    float _979 = fma(_945, _853, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _981 = fma(_935, _925, _973);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _983;
    float _987 = fma(_959, _853, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _989;
    float _993 = fma(_907, _925, _975);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _995;
    float _999 = fma(_941, _925, _977);
    float _1001 = fma(_985, _837, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1003 = fma(_991, _837, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1005 = fma(_997, _837, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1007 = fma(_979, _911, _981);
    float _1009 = fma(_971, _911, _993);
    float _1011 = fma(_987, _911, _999);
    float _1013 = fma(_1001, _909, _1007);
    float _1015 = fma(_1003, _909, _1009);
    float _1017 = fma(_1005, _909, _1011);
    float _1019 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[112].x, _1013);
    float _1021 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[112].y, _1015);
    float _1023 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[112].z, _1017);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1033 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _1033;
    out.m_56.y = _1035;
    out.m_56.z = _1037;
    out.m_56.w = _1025;
    bool _1039 = !_789;
    float _1055;
    if (!_1039)
    {
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1043 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1047 = _1045 * _1041;
        float _1049 = floor(_1047);
        float _1051 = -_1049;
        float _1053 = _1047 + _1051;
        _1055 = _1053;
        _1057 = true;
    }
    else
    {
        float _1059 = float(_85);
        float _1061 = 1.0 / _1059;
        float _1063 = _119 * _1061;
        _1055 = _1063;
    }
    _1057 = false;
    float _1065 = _1055;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1069 = _1065 + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1071;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1087 = 1.0 / _1073;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1089;
    bool _1093 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1095 = isnan(_1065);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = 1.0 / _1077;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1109 = _1065 + _1107;
    float _1111 = -_1103;
    float _1113 = _1111 + 1.0;
    bool _1115 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1117 = isnan(_1065);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    float _1127 = 1.0 / _1085;
    float _1129 = _1109 * _1087;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1133 = _1065 + _1131;
    bool _1135 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1137 = isnan(_1065);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1149 = _1065 + _1147;
    float _1151 = 1.0 / _1091;
    float _1153 = _1069 * _1105;
    bool _1155 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1157 = isnan(_1065);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -_1145;
    float _1169 = _1167 + 1.0;
    bool _1171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1173 = 1.0 / _1081;
    float _1175 = _1133 * _1127;
    float _1177 = -_1165;
    float _1179 = _1177 + 1.0;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1181;
    float _1185 = _1145 * _1179;
    float _1187 = _1103 * _1169;
    float _1189 = fma(_1183, _1129, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1193 = _1065 + _1191;
    float _1195 = -_1125;
    float _1197 = _1195 + 1.0;
    float _1199 = _1193 * _1151;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1201;
    float _1205 = _1149 * _1173;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1207;
    float _1211 = fma(_1203, _1129, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1213 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1215 = isnan(_1065);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1229 = fma(_1209, _1129, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1231 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1233 = isnan(_1065);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = _1125 * _1113;
    float _1245 = -_1223;
    float _1247 = _1245 + 1.0;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1257 = _1223 * _1197;
    float _1259 = _1241 * _1247;
    float _1261 = fma(_1251, _1153, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1263 = fma(_1255, _1153, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1265 = fma(_1227, _1153, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1267 = _1189 * _1259;
    float _1269 = _1211 * _1259;
    float _1271 = _1229 * _1259;
    float _1273 = -_1241;
    float _1275 = _1273 + 1.0;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1285;
    float _1289 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1267);
    float _1291 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1269);
    float _1293 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1271);
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1297 = _1295 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1301 = _1299 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1307 = fma(_1261, _1257, _1289);
    float _1309 = fma(_1297, _1175, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1311 = fma(_1301, _1175, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1313 = fma(_1305, _1175, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1315 = fma(_1263, _1257, _1291);
    float _1317 = fma(_1265, _1257, _1293);
    float _1319 = fma(_1279, _1205, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1321 = fma(_1283, _1205, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1323 = fma(_1287, _1205, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1325 = fma(_1319, _1243, _1307);
    float _1327 = fma(_1321, _1243, _1315);
    float _1329 = fma(_1323, _1243, _1317);
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1335;
    float _1339 = fma(_1309, _1187, _1325);
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1341;
    float _1345 = fma(_1333, _1199, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1347 = fma(_1337, _1199, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1349 = fma(_1311, _1187, _1327);
    float _1351 = fma(_1343, _1199, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1353 = fma(_1313, _1187, _1329);
    float _1355 = fma(_1345, _1185, _1339);
    float _1357 = fma(_1347, _1185, _1349);
    float _1359 = fma(_1351, _1185, _1353);
    float _1361 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1355);
    float _1363 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1357);
    float _1365 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1359);
    bool _1367 = !_1171;
    float _1385;
    float _1387;
    if (!_1367)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1373 = float(_85);
        float _1375 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _1377 = _1375 * _1369;
        float _1379 = floor(_1377);
        float _1381 = -_1379;
        float _1383 = _1377 + _1381;
        _1385 = _1373;
        _1387 = _1383;
        _1389 = true;
    }
    else
    {
        float _1391 = float(_85);
        float _1393 = 1.0 / _1391;
        float _1395 = _119 * _1393;
        _1385 = _1391;
        _1387 = _1395;
    }
    _1389 = false;
    float _1397 = _1385;
    float _1399 = _1387;
    float _1401 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1403 = int(_1401);
    float _1405 = in.m_49.y;
    float _1407 = _333 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1409 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1411 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1413 = in.m_49.z;
    float _1415 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1407);
    float _1417 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1419 = int(_1417);
    float _1421 = float(_1403);
    float _1423 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1425 = log2(_1423);
    float _1427 = float(uint(_1419));
    float _1429 = 1.0 / _1421;
    int _1431 = ~_1419;
    int _1433 = _1431 + 1;
    float _1435 = _1405 + (-0.5);
    int _1437 = ~_1419;
    int _1439 = _1437 + 1;
    int _1441 = ~_1419;
    int _1443 = _1441 + 1;
    float _1445 = 1.0 / _1427;
    float _1447 = _119 * _1429;
    float _1449 = trunc(_1447);
    int _1451 = int(_1449);
    int _1453 = as_type<int>(_1445) + (-2);
    float _1455 = float(uint(_1451));
    float _1457 = float(_1451);
    float _1459 = as_type<float>(_1453) * _1455;
    int _1461 = ~_1419;
    int _1463 = _1461 + 1;
    float _1465 = trunc(_1459);
    float _1467 = precise::max(_1465, 0.0);
    uint _1470 = uint(_1467);
    int _1472 = _1463 * int(_1470);
    int _1474 = _1472 + _1451;
    float _1476 = float(_1419);
    float _1478 = float(uint(_1474));
    float _1480 = as_type<float>(_1453) * _1478;
    float _1482 = trunc(_1480);
    float _1484 = precise::max(_1482, 0.0);
    uint _1486 = uint(_1484);
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1490 = _1488 != 0;
    bool _1492 = !_1490;
    float _1494 = _1492 ? 7.345489978790283203125 : 1.0;
    float _1496 = _1494 * _139;
    int _1498 = int(_1470) + int(_1486);
    bool _1500 = _1457 >= _1476;
    bool _1502 = isnan(_1457);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(_1476);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = 1.0 / _1397;
    int _1514 = _1433 * _1498;
    int _1516 = _1514 + _1451;
    bool _1518 = uint(_1516) >= uint(_1419);
    float _1520 = trunc(_1510);
    int _1522 = int(_1520);
    bool _1524 = !_1518;
    int _1526 = _1524 ? 0 : (-1);
    bool _1528 = _1419 == 0;
    int _1530 = ~_1498;
    int _1532 = _1530 + _1526;
    int _1534 = _1532 + 1;
    float _1536 = floor(_1496);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1552 = _1550 != 0;
    int _1554 = _1419 * _1534;
    int _1556 = _1554 + _1451;
    bool _1558 = !_1552;
    int _1560 = _1558 ? 0 : 1;
    int _1562 = ~_1522;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    bool _1568 = !_1528;
    int _1570 = _1568 ? _1556 : (-1);
    int _1572 = abs(_1560);
    bool _1574 = _139 > 0.5;
    float _1576 = -_1536;
    float _1578 = _1496 + _1576;
    int _1580 = _1570 * _1566;
    int _1582 = _1419 + (-1);
    float _1584 = _1578 * _1476;
    float _1586 = _119 * _1476;
    bool _1588 = !_1544;
    int _1590 = _1588 ? 0 : 1;
    int _1592 = _1522 * _1582;
    int _1594 = _1592 + _1580;
    bool _1596 = !_1540;
    int _1598 = _1596 ? 0 : 1;
    float _1600 = _1586 * _1512;
    float _1602 = trunc(_1584);
    int _1604 = int(_1602);
    int _1606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1608 = _1606 != 0;
    int _1610 = abs(_1590);
    bool _1612 = !_1548;
    int _1614 = _1612 ? 0 : 1;
    int _1616 = abs(_1598);
    float _1618 = trunc(_1600);
    int _1620 = int(_1618);
    bool _1622 = !_1608;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = abs(_1614);
    int _1628 = _1594 * _1610;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1632 = _1630 != 0;
    float _1634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _1636 = -_207;
    int _1638 = _1574 ? as_type<int>(_1636) : as_type<int>(_207);
    int _1640 = _1604 * _1572;
    int _1642 = _1640 + _1451;
    int _1644 = abs(_1624);
    float _1646 = _1411 * _1634;
    bool _1648 = _1405 > 0.5;
    bool _1650 = _1413 > 0.5;
    int _1652 = _1620 * _1616;
    int _1654 = _1652 + _1628;
    float _1656 = -_215;
    int _1658 = _1648 ? as_type<int>(_1656) : as_type<int>(_215);
    float _1660 = in.m_49.w;
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1664 = _1662 != 0;
    int _1666 = _1642 * _1626;
    int _1668 = _1666 + _1654;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1672 = _1670 != 0;
    int _1674 = ~_1419;
    int _1676 = _1674 + 1;
    int _1678 = _1604 * _1644;
    int _1680 = _1678 + _1668;
    bool _1682 = !_1632;
    float _1684 = _1682 ? _207 : as_type<float>(_1638);
    float _1686 = _333 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1688 = -_207;
    int _1690 = _1650 ? as_type<int>(_1688) : as_type<int>(_207);
    float _1692 = float(uint(_1680));
    float _1694 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1686);
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1698 = _1696 != 0;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1702 = _1700 != 0;
    float _1704 = as_type<float>(_1453) * _1692;
    float _1706 = _333 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1708 = !_1672;
    float _1710 = _1708 ? _207 : as_type<float>(_1690);
    float _1712 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1706);
    float _1714 = trunc(_1704);
    float _1716 = precise::max(_1714, 0.0);
    uint _1718 = uint(_1716);
    float _1720 = _139 * 2.0;
    bool _1722 = _1660 > 0.5;
    float _1724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1728 = _1409 * _1724;
    float _1730 = floor(_1720);
    float _1732 = _1405 * 2.0;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1736 = _1676 * int(_1718);
    int _1738 = _1736 + _1680;
    float _1740 = floor(_1732);
    float _1742 = float(uint(_1738));
    float _1744 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1750 = as_type<float>(_1453) * _1742;
    float _1752 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1754 = -_215;
    int _1756 = _1722 ? as_type<int>(_1754) : as_type<int>(_215);
    float _1758 = -_1734;
    float _1760 = fma(_1744, 2.0, _1758);
    float _1762 = trunc(_1750);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    float _1768 = fma(_1752, -2.0, _1726);
    bool _1770 = !_1698;
    float _1772 = _1770 ? _215 : as_type<float>(_1658);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1778 = _1730 > 0.0;
    float _1780 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1768);
    bool _1782 = _1730 >= 0.0;
    bool _1784 = isnan(_1730);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan(0.0);
    bool _1790 = _1786 || _1788;
    float _1792 = 1.0 / _1748;
    bool _1794 = !_1702;
    float _1796 = _1794 ? _215 : as_type<float>(_1756);
    int _1798 = ~_1419;
    int _1800 = _1798 + 1;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1806 = _1740 > 0.0;
    int _1808 = int(_1718) + int(_1766);
    float _1810 = 1.0 / _1804;
    int _1812 = _1790 ? 0 : 1;
    bool _1814 = _1740 >= 0.0;
    bool _1816 = isnan(_1740);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan(0.0);
    bool _1822 = _1818 || _1820;
    float _1824 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1694);
    float _1826 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1712);
    float _1828 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1415);
    float _1830 = 1.0 / _1776;
    int _1832 = _1800 * _1808;
    int _1834 = _1832 + _1680;
    float _1836 = _1413 * 2.0;
    int _1838 = ~_1812;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    float _1844 = _1828 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1846 = _1822 ? 0 : 1;
    float _1848 = _1824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1850 = _1842;
    if (!_1778)
    {
        int _1852 = ~_1812;
        int _1854 = _1852 + 1;
        _1850 = _1854;
    }
    int _1856 = _1850;
    float _1858 = floor(_1836);
    float _1860 = _1826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1862 = uint(_1834) >= uint(_1419);
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1864;
    int _1868 = ~_1846;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    int _1874 = _1872;
    if (!_1806)
    {
        int _1876 = ~_1846;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1882;
    float _1886 = _1866 * _1810;
    bool _1888 = !_1862;
    int _1890 = _1888 ? 0 : (-1);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1894 = _1892 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1896 = float(uint(_1642));
    int _1898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1900 = _1898 != 0;
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1904 = _1902 != 0;
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1908 = _1906 != 0;
    float _1910 = _1884 * _1792;
    float _1912 = _139 + _1413;
    float _1914 = as_type<float>(_1453) * _1896;
    float _1916 = _1894 * _1830;
    bool _1918 = !_1904;
    int _1920 = _1918 ? 0 : 1;
    float _1922 = _1912 + (-1.0);
    bool _1924 = _1858 >= 0.0;
    bool _1926 = isnan(_1858);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(0.0);
    bool _1932 = _1928 || _1930;
    float _1934 = trunc(_1914);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    int _1940 = ~_1808;
    int _1942 = _1940 + _1890;
    int _1944 = _1942 + 1;
    float _1946 = _139 + _1405;
    int _1948 = _1932 ? 0 : 1;
    float _1950 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1952 = _1858 > 0.0;
    float _1954 = _119 * _1425;
    float _1956 = _1946 + (-1.0);
    int _1958 = abs(_1920);
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1962 = _1399 + _1960;
    float _1964 = float(_1856);
    float _1966 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1968 = float(_1958);
    int _1970 = _1419 * _1944;
    int _1972 = _1970 + _1680;
    float _1974 = fma(_1910, _1962, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1976 = _1439 * int(_1938);
    int _1978 = _1976 + _1642;
    bool _1980 = !_1900;
    int _1982 = _1980 ? 0 : 1;
    float _1984 = _1405 + _1413;
    bool _1986 = !_1528;
    int _1988 = _1986 ? _1972 : (-1);
    float _1990 = exp2(_1954);
    float _1992 = float(uint(_1978));
    float _1994 = _1984 + (-1.0);
    int _1996 = _1988 >> 31;
    int _1998 = abs(_1982);
    float _2000 = as_type<float>(_1453) * _1992;
    int _2002 = _1996 & 3;
    float _2004 = in.m_58.x;
    float _2006 = in.m_58.y;
    float _2008 = in.m_58.z;
    int _2010 = _1988 + _2002;
    float _2012 = trunc(_2000);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    float _2018 = float(_1998);
    float _2020 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2022 = ~_1948;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    float _2028 = -_1990;
    float _2030 = _2028 + 1.0;
    int _2032 = _2010 >> 2;
    int _2034 = _2026;
    float _2036 = as_type<float>(_1938);
    if (!_1952)
    {
        int _2038 = ~_1948;
        int _2040 = _2038 + 1;
        _2034 = _2040;
    }
    int _2042 = _2034;
    float _2044 = _1968 * _1964;
    int _2046 = _2032 << 4;
    int _2048 = _2046 + 368;
    float _2050 = float(_2042);
    float _2052 = _2044 * (-2.0);
    float _2054 = float(_1880);
    float _2056 = _2018 * _2050;
    uint _2058 = uint(int(uint(_2048) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    bool _2074 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2082 = _2078 || _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2086 = 1.0 + _2084;
    float _2088 = _2056 * (-2.0);
    float _2090 = fma(_2052, _2006, _2006);
    float _2092 = _2082 ? _2030 : 0.0;
    float _2094 = _139 + (-0.5);
    int _2096 = _1988 & 3;
    bool _2098 = _2096 != 0;
    float _2100 = 1.0 / _2086;
    int _2102 = _1988 & 3;
    bool _2104 = _2102 != 0;
    float _2106 = fma(_1966, _2088, _1966);
    float _2108 = fma(_2088, _2004, _2004);
    bool _2110 = !_1908;
    int _2112 = _2110 ? 0 : 1;
    float _2114 = fma(_2020, _2052, _2020);
    float _2116 = _2098 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2120 = uint(_2102) > 1u;
    float _2122 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2124 = int(_2122);
    int _2126 = abs(_2112);
    int _2128 = int(_1938) + int(_2016);
    float _2130 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2118);
    float _2132 = _2092;
    float _2134 = _2116;
    if (!_1490)
    {
        _2036 = _1405;
    }
    float _2136 = _2036;
    float _2138 = _2092 * _2100;
    float _2140 = _2136;
    if (_1490)
    {
        _2140 = _139;
    }
    float _2142 = _2140;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2146 = float(_2126);
    int _2148 = _2048 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    if (!_1490)
    {
        _2132 = _1413;
    }
    float _2166 = _2132;
    float _2168 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2144);
    float _2170 = _2166;
    if (_1490)
    {
        _2170 = _1405;
    }
    float _2172 = _2170;
    float _2174 = _2146 * _2054;
    int _2176 = ~as_type<int>(_2116);
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    int _2182 = _1443 * _2128;
    int _2184 = _2182 + _1642;
    int _2186 = _2180;
    if (!_2120)
    {
        int _2188 = ~as_type<int>(_2116);
        int _2190 = _2188 + 1;
        _2186 = _2190;
    }
    int _2192 = _2186;
    float _2194 = _2174 * (-2.0);
    bool _2196 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2198 = isnan(1.0);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2204 = _2200 || _2202;
    if (!_1490)
    {
        _2134 = _1413;
    }
    float _2206 = _2134;
    float _2208 = fma(_1950, _2194, _1950);
    float _2210 = _2206;
    if (_1490)
    {
        _2210 = _1405;
    }
    float _2212 = _2210;
    float _2214 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2090);
    bool _2216 = !_2204;
    float _2218 = _2216 ? _119 : _2138;
    float _2220 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2108);
    bool _2222 = uint(_2184) >= uint(_1419);
    float _2224 = fma(_2194, _2008, _2008);
    int _2226 = abs(_2192);
    float _2228 = fma(_2218, _2114, _2214);
    bool _2230 = !_2104;
    int _2232 = _2230 ? 0 : 1;
    float _2234 = fma(_2218, _2106, _2220);
    bool _2236 = _2102 != 3;
    float _2238 = _1413 + (-0.5);
    bool _2240 = !_2222;
    int _2242 = _2240 ? 0 : (-1);
    bool _2244 = uint(_2102) >= 2u;
    int _2246 = ~_2226;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    int _2252 = abs(_2232);
    int _2254 = ~_2128;
    int _2256 = _2254 + _2242;
    int _2258 = _2256 + 1;
    int _2260 = _2250 * as_type<int>(_2072);
    int _2262 = _2244 ? 0 : 1;
    int _2264 = ~_2252;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    int _2270 = _1419 * _2258;
    int _2272 = _2270 + _1642;
    int _2274 = ~_2262;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2282 = _1399 + _2280;
    bool _2284 = _2102 != 3;
    int _2286 = _2268 * as_type<int>(_2064);
    int _2288 = _2286 + _2260;
    int _2290 = _2278;
    if (_2236)
    {
        int _2292 = ~_2262;
        int _2294 = _2292 + 1;
        _2290 = _2294;
    }
    int _2296 = _2290;
    bool _2298 = !_2284;
    int _2300 = _2298 ? 0 : (-1);
    int _2302 = abs(_2296);
    int _2304 = abs(_2300);
    bool _2306 = !_1664;
    int _2308 = _2306 ? 0 : 1;
    float _2310 = _2228 * 0.15915493667125701904296875;
    int _2312 = abs(_2308);
    int _2314 = ~_2302;
    int _2316 = _2314 + 1;
    int _2318 = _2316 + 1;
    int _2320 = abs(_2124);
    int _2322 = _2318 * as_type<int>(_2156);
    int _2324 = _2322 + _2288;
    int _2326 = ~_2304;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = fma(_2238, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2224);
    float _2334 = float(uint(_2320));
    float _2336 = fma(_1916, _2282, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2338 = ~_2312;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    int _2344 = _2330 * as_type<int>(_2164);
    int _2346 = _2344 + _2324;
    bool _2348 = !_1528;
    int _2350 = _2348 ? _2272 : (-1);
    float _2352 = _2234 * 0.15915493667125701904296875;
    float _2354 = 1.0 / _2334;
    int _2356 = _2346 * _2342;
    float _2358 = float(uint(_2124));
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2362 = _1399 + _2360;
    int _2364 = _2350 * _2312;
    int _2366 = _2364 + _2356;
    bool _2368 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2370 = isnan(_1399);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = fma(_2218, _2208, _2332);
    float _2382 = 1.0 / _2358;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2386 = abs(_2366);
    float _2388 = -_2378;
    float _2390 = _2388 + 1.0;
    bool _2392 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2394 = isnan(_1399);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2400 = _2396 || _2398;
    float _2402 = float(_2400);
    float _2404 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2384);
    float _2406 = fma(_1886, _2362, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2408 = as_type<int>(_2354) + (-2);
    float _2410 = _2310 * 6.283185482025146484375;
    float _2412 = sin(_2410);
    float _2414 = float(uint(_2386));
    float _2416 = _2380 * 0.15915493667125701904296875;
    bool _2418 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2420 = isnan(_1399);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2426 = _2422 || _2424;
    float _2428 = float(_2426);
    bool _2430 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2432 = isnan(_1399);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = as_type<float>(_2408) * _2414;
    float _2444 = _2402 * _2390;
    float _2446 = _2310 * 6.283185482025146484375;
    float _2448 = cos(_2446);
    float _2450 = float(uint(_2366));
    int _2452 = ~_2320;
    int _2454 = _2452 + 1;
    float _2456 = trunc(_2442);
    float _2458 = precise::max(_2456, 0.0);
    uint _2460 = uint(_2458);
    int _2462 = as_type<int>(_2382) + (-2);
    float _2464 = -_2402;
    float _2466 = _2464 + 1.0;
    bool _2468 = _2124 == 0;
    float _2470 = as_type<float>(_2462) * _2450;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2474 = _2352 * 6.283185482025146484375;
    float _2476 = sin(_2474);
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2480 = _2352 * 6.283185482025146484375;
    float _2482 = cos(_2480);
    float _2484 = trunc(_2470);
    float _2486 = precise::max(_2484, 0.0);
    uint _2488 = uint(_2486);
    float _2490 = _2440 * _2466;
    float _2492 = -_2440;
    float _2494 = _2492 + 1.0;
    int _2496 = ~_2124;
    int _2498 = _2496 + 1;
    float _2500 = _2428 * _2494;
    float _2502 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2478);
    float _2504 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2506 = _2416 * 6.283185482025146484375;
    float _2508 = sin(_2506);
    float _2510 = _1974 * _2500;
    int _2512 = _2454 * int(_2460);
    int _2514 = _2512 + _2386;
    float _2516 = -_2472;
    float _2518 = fma(_2504, 2.0, _2516);
    float _2520 = -_2428;
    float _2522 = _2520 + 1.0;
    float _2524 = _2476 * _2448;
    float _2526 = float(uint(_2514));
    float _2528 = _2416 * 6.283185482025146484375;
    float _2530 = cos(_2528);
    int _2532 = _2498 * int(_2488);
    int _2534 = _2532 + _2366;
    float _2536 = fma(_2522, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2510);
    float _2538 = as_type<float>(_2408) * _2526;
    float _2540 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2544 = float(uint(_2534));
    float _2546 = _2482 * _2412;
    float _2548 = trunc(_2538);
    float _2550 = precise::max(_2548, 0.0);
    uint _2552 = uint(_2550);
    float _2554 = fma(_2540, -2.0, _2542);
    float _2556 = fma(_2336, _2490, _2536);
    float _2558 = as_type<float>(_2462) * _2544;
    float _2560 = _2476 * _2412;
    float _2562 = -_2546;
    float _2564 = fma(_2508, _2524, _2562);
    float _2566 = -_2524;
    float _2568 = fma(_2508, _2546, _2566);
    float _2570 = _2530 * _1646;
    float _2572 = _2448 * _2530;
    float _2574 = _2482 * _2448;
    float _2576 = _2412 * _2530;
    float _2578 = trunc(_2558);
    float _2580 = precise::max(_2578, 0.0);
    uint _2582 = uint(_2580);
    float _2584 = _2482 * _2570;
    float _2586 = _2476 * _2570;
    float _2588 = fma(_2508, _2574, _2560);
    float _2590 = -_1646;
    float _2592 = _2508 * _2590;
    float _2594 = fma(_2508, _2560, _2574);
    float _2596 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2598 = fma(_2588, _1728, _2584);
    float _2600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2602 = fma(_2572, _1728, _2592);
    float _2604 = fma(_2564, _1728, _2586);
    float _2606 = fma(_2568, _2596, _2598);
    int _2608 = ~_2320;
    int _2610 = _2608 + 1;
    float _2612 = fma(_2576, _2596, _2602);
    float _2614 = fma(_2594, _2596, _2604);
    float _2616 = _2606 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2620 = int(_2488) + int(_2582);
    float _2622 = _2606 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2624 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2616);
    int _2626 = int(_2460) + int(_2552);
    float _2628 = _1710 + 0.5;
    float _2630 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2622);
    float _2632 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2624);
    float _2634 = _2600 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2636 = _2610 * _2626;
    int _2638 = _2636 + _2386;
    float _2640 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2630);
    float _2642 = _2632 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2644 = -_119;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2518);
    float _2648 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2554);
    float _2650 = _2640 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2652 = _1844 + _2642;
    float _2654 = _2618 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2656 = ~_2124;
    int _2658 = _2656 + 1;
    float _2660 = _1848 + _2650;
    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2664 = _2652 + _2662;
    float _2666 = _1796 + (-0.5);
    bool _2668 = uint(_2638) >= uint(_2320);
    int _2670 = _2658 * _2620;
    int _2672 = _2670 + _2366;
    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2676 = _2660 + _2674;
    float _2678 = _2664 * _2664;
    float _2680 = _2606 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2682 = -_2634;
    float _2684 = -_2648;
    float _2686 = fma(_2682, _2666, _2684);
    int _2688 = _2366 ^ _2124;
    float _2690 = fma(_2676, _2676, _2678);
    bool _2692 = uint(_2672) >= uint(_2124);
    float _2694 = fma(_2654, _2628, _2646);
    bool _2696 = !_2668;
    int _2698 = _2696 ? 0 : (-1);
    float _2700 = sqrt(_2690);
    uint _2702 = uint(int(uint(_2688) >> uint(31)));
    float _2704 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2680);
    bool _2706 = !_2692;
    int _2708 = _2706 ? 0 : (-1);
    float _2710 = fma(_2406, _2444, _2556);
    int _2712 = ~_2698;
    int _2714 = _2626 + _2712;
    int _2716 = _2714 + 1;
    float _2718 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2704);
    int _2720 = ~int(_2702);
    int _2722 = _2720 + 1;
    float _2724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2726 = ~_2620;
    int _2728 = _2726 + _2708;
    int _2730 = _2728 + 1;
    float _2732 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2710);
    int _2734 = _2716 ^ _2722;
    bool _2736 = _2124 == 0;
    int _2738 = _2124 * _2730;
    int _2740 = _2738 + _2366;
    int _2742 = ~_2722;
    int _2744 = _2742 + _2734;
    int _2746 = _2744 + 1;
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2750 = _2700 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2752 = _2718 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2754 = !_2736;
    int _2756 = _2754 ? _2740 : (-1);
    float _2758 = -_119;
    float _2760 = fma(_2758, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1760);
    bool _2762 = !_2468;
    int _2764 = _2762 ? _2746 : (-1);
    float _2766 = _1860 + _2752;
    float _2768 = float(_2756);
    float _2770 = _2724 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2772 = float(_2764);
    float _2774 = _1684 + 0.5;
    float _2776 = fma(_2770, _2768, _2760);
    float _2778 = _2760;
    float _2780 = _2772;
    float _2782 = _2652;
    if (!_2750)
    {
        _2778 = _2660;
    }
    float _2784 = _2778;
    float _2786 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2788 = -_1780;
    float _2790 = fma(_2786, _2772, _2788);
    float _2792 = _1772 + (-0.5);
    float _2794 = _2784;
    if (!_2750)
    {
        _2780 = _2766;
    }
    float _2796 = _2780;
    bool _2798 = !_2750;
    float _2800 = _2796;
    if (!_2798)
    {
        float _2802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2806 = _2700 + _2804;
        float _2808 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2810 = rsqrt(_2690);
        float _2812 = _2806 * _2802;
        float _2814 = _2812 * 0.15915493667125701904296875;
        float _2816 = _2814 * 6.283185482025146484375;
        float _2818 = cos(_2816);
        float _2820 = _2814 * 6.283185482025146484375;
        float _2822 = sin(_2820);
        float _2824 = _2818 + (-1.0);
        float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2828 = fma(_2822, _2808, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2830 = fma(_2766, _2818, _2826);
        float _2832 = _2810 * _2828;
        float _2834 = fma(_2676, _2832, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2836 = fma(_2664, _2832, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2800 = _2830;
        _2794 = _2834;
        _2782 = _2836;
    }
    float _2838 = _2800;
    float _2840 = _2794;
    float _2842 = _2782;
    float _2844 = -_1860;
    float _2846 = _2844 + _2838;
    float _2848 = fma(_2770, _2774, _2776);
    float _2850 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2502);
    float _2852 = -_1848;
    float _2854 = _2852 + _2840;
    float _2856 = _2846 * _2846;
    float _2858 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2404);
    float _2860 = -_2786;
    float _2862 = fma(_2860, _2792, _2790);
    float _2864 = -_2850;
    float _2866 = _2864 + 1.0;
    float _2868 = -_1844;
    float _2870 = _2868 + _2842;
    float _2872 = fma(_2854, _2854, _2856);
    float _2874 = -_2858;
    float _2876 = _2874 + 1.0;
    float _2878 = -_2866;
    float _2880 = fma(_1710, _2878, _2694);
    float _2882 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2130);
    float _2884 = fma(_2870, _2870, _2872);
    float _2886 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2168);
    float _2888 = fma(_1796, _2876, _2686);
    float _2890 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2892 = sqrt(_2884);
    float _2894 = -_2882;
    float _2896 = _2894 + 1.0;
    float _2898 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2900 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2902 = -_2886;
    float _2904 = _2902 + 1.0;
    float _2906 = _2890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2908 = -_2896;
    float _2910 = fma(_1684, _2908, _2848);
    float _2912 = _2898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2914 = _2900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2916 = _2732 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2918 = fma(_1772, _2904, _2862);
    out.m_60.x = _2906;
    out.m_60.y = _2914;
    out.m_60.z = _2912;
    out.m_60.w = _2916;
    bool _2920 = _2892 > 0.0;
    out.m_62.x = _2910;
    out.m_62.y = _2918;
    out.m_62.z = _2880;
    out.m_62.w = _2888;
    bool _2922 = !_2920;
    float _2924 = _2880;
    float _2926 = _2918;
    float _2928 = _2910;
    float _2930 = _2838;
    float _2932 = _2842;
    float _2934 = _2840;
    float _2936 = _2910;
    float _2938 = _2906;
    if (!_2922)
    {
        bool _2940 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2942 = _2888;
        if (_2940)
        {
            float _2944 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2942 = _2944;
        }
        float _2946 = _2942;
        if (_2940)
        {
            float _2948 = _481 * _2946;
            _2924 = _2948;
        }
        float _2950 = _2924;
        float _2952 = _2950;
        if (_2940)
        {
            float _2954 = _483 * _2946;
            _2926 = _2954;
        }
        float _2956 = _2926;
        float _2958 = _2956;
        if (_2940)
        {
            float _2960 = _485 * _2946;
            _2928 = _2960;
        }
        float _2962 = _2928;
        float _2964 = _2962;
        float _2966 = _2962;
        if (!_2940)
        {
            float _2968 = _119 + 1.0;
            float _2970 = _2968;
            if (!_159)
            {
                float _2972 = _2968 * _2968;
                float _2974 = _2972 * 0.5;
                _2964 = _2974;
            }
            float _2976 = _2964;
            float _2978 = _2976;
            if (!_159)
            {
                float _2980 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2978 = _2980;
            }
            float _2982 = _2978;
            bool _2984 = !_159;
            float _2986 = _2982;
            if (!_2984)
            {
                float _2988 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2990 = log2(_2988);
                float _2992 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2994 = _2990 * _2968;
                float _2996 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2998 = 1.0 + _2996;
                float _3000 = 1.0 / _2998;
                float _3002 = _2992 * 0.693147182464599609375;
                float _3004 = exp2(_2994);
                float _3006 = 1.0 / _3002;
                float _3008 = _3004 + (-1.0);
                float _3010 = -_3008;
                float _3012 = fma(_3010, _3006, _2968);
                float _3014 = _3012 * _3000;
                float _3016 = _3014 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2986 = _3016;
            }
            float _3018 = _2986;
            float _3020 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3022 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3024 = !_159;
            if (!_3024)
            {
                float _3026 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3028 = log2(_3026);
                float _3030 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3032 = 1.0 + _3030;
                float _3034 = 1.0 / _3032;
                float _3036 = _3028 * _2968;
                float _3038 = exp2(_3036);
                float _3040 = -_3038;
                float _3042 = _3040 + 1.0;
                float _3044 = _3042 * _3034;
                _2970 = _3044;
            }
            float _3046 = _2970;
            float _3048 = fma(_3046, _173, _3022);
            float _3050 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3052 = fma(_3046, _171, _3020);
            float _3054 = -_431;
            float _3056 = _3054 + _3048;
            float _3058 = fma(_3046, _175, _3050);
            float _3060 = -_425;
            float _3062 = _3060 + _3052;
            float _3064 = _3056 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3066 = _3056 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3068 = _3056 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3070 = -_437;
            float _3072 = _3070 + _3058;
            float _3074 = fma(_3062, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3064);
            float _3076 = fma(_3062, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3066);
            float _3078 = fma(_3062, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3068);
            float _3080 = fma(_3072, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3074);
            float _3082 = fma(_3072, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3076);
            float _3084 = fma(_3072, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3078);
            _493 = _3082;
            _495 = _3080;
            _497 = _3084;
            _2952 = _3080;
            _2958 = _3082;
            _2966 = _3084;
        }
        float _3086 = _493;
        float _3088 = _495;
        float _3090 = _497;
        float _3092 = _2952;
        float _3094 = _2958;
        float _3096 = _2966;
        float _3098 = _3086 * _3086;
        float _3100 = rsqrt(_2884);
        float _3102 = fma(_3088, _3088, _3098);
        float _3104 = fma(_3090, _3090, _3102);
        float _3106 = sqrt(_3104);
        float _3108 = _2854 * _3100;
        float _3110 = _2846 * _3100;
        float _3112 = _2870 * _3100;
        bool _3114 = _3106 > 0.0;
        bool _3116 = !_3114;
        _2936 = _3096;
        _239 = _3100;
        if (!_3116)
        {
            float _3118 = rsqrt(_3104);
            float _3120 = _3118 * _3086;
            float _3122 = _3118 * _3088;
            float _3124 = _3118 * _3090;
            float _3126 = _3110 * _3120;
            float _3128 = fma(_3108, _3122, _3126);
            float _3130 = fma(_3112, _3124, _3128);
            float _3132 = _3130 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3134 = fma(_3092, _3132, _2840);
            float _3136 = fma(_3094, _3132, _2838);
            float _3138 = fma(_3096, _3132, _2842);
            _2930 = _3136;
            _2932 = _3138;
            _2934 = _3134;
            _239 = _3132;
        }
    }
    float _3140 = _2930;
    float _3142 = _2932;
    float _3144 = _2934;
    float _3146 = _2936;
    float _3148 = _239;
    float _3150 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3152 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3154 = isnan(0.5);
    bool _3156 = _3152 || _3154;
    bool _3158 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3160 = _3156 || _3158;
    bool _3162 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3164 = isnan(0.5);
    bool _3166 = _3162 || _3164;
    bool _3168 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3170 = _3166 || _3168;
    float _3172 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3150);
    float _3174 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3176 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3172);
    float _3178 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3174);
    float _3180 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3182 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3178);
    float _3184 = _3176;
    float _3186 = _3148;
    float _3188 = _3146;
    float _3190 = _3140;
    float _3192 = _3144;
    if (_3160)
    {
        _3184 = _3140;
    }
    float _3194 = _3184;
    float _3196 = 1.0 / _3180;
    float _3198 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3200 = _3198;
    float _3202 = _3194;
    if (_3160)
    {
        _3186 = _3142;
    }
    float _3204 = _3186;
    float _3206 = _3198 + _3180;
    float _3208 = _3204;
    if (_3160)
    {
        _3200 = _3144;
    }
    float _3210 = _3200;
    float _3212 = _3210;
    if (!_3160)
    {
        float _3214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3216 = _1860 + _3214;
        float _3218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3220 = _1848 + _3218;
        float _3222 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3224 = -_1860;
        float _3226 = _3224 + _3140;
        float _3228 = _3216 * _3216;
        float _3230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3232 = _1844 + _3230;
        float _3234 = -_1844;
        float _3236 = _3234 + _3142;
        float _3238 = fma(_3220, _3220, _3228);
        float _3240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3242 = fma(_3232, _3232, _3238);
        float _3244 = sqrt(_3242);
        float _3246 = _3222 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3248 = precise::min(_3244, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3250 = _3248 * _3240;
        float _3252 = -_1848;
        float _3254 = _3252 + _3144;
        float _3256 = _3246 * _3250;
        float _3258 = fma(_3254, _3256, _1848);
        float _3260 = fma(_3226, _3256, _1860);
        float _3262 = fma(_3236, _3256, _1844);
        _3188 = _3240;
        _3202 = _3260;
        _3212 = _3258;
        _3208 = _3262;
        _3190 = _3226;
    }
    float _3264 = _3188;
    float _3266 = _3202;
    float _3268 = _3212;
    float _3270 = _3208;
    float _3272 = _3190;
    float _3274 = _3264;
    float _3276 = _3272;
    if (_3170)
    {
        _3274 = 1.0;
    }
    float _3278 = _3274;
    float _3280 = _3206 * _3196;
    float _3282 = _3280 * 0.5;
    float _3284 = _3278;
    if (!_3170)
    {
        float _3286 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3288 = _3286 * 0.15915493667125701904296875;
        float _3290 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3294 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3292);
        float _3296 = _3288 * 6.283185482025146484375;
        float _3298 = cos(_3296);
        float _3300 = _3290 * 0.15915493667125701904296875;
        float _3302 = _3288 * 6.283185482025146484375;
        float _3304 = sin(_3302);
        float _3306 = 1.0 / _3298;
        float _3308 = _3300 * 6.283185482025146484375;
        float _3310 = cos(_3308);
        float _3312 = _3304 * _3306;
        float _3314 = _3300 * 6.283185482025146484375;
        float _3316 = sin(_3314);
        float _3318 = _3310 * _3312;
        float _3320 = 1.0 / _3294;
        float _3322 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3324 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3322;
        float _3326 = 1.0 / _3318;
        float _3328 = 1.0 / _3324;
        float _3330 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3332 = _3320 * _3330;
        float _3334 = _3316 * _3326;
        float _3336 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3338 = fma(_3334, _3332, _3336);
        float _3340 = _3338 * _3328;
        float _3342 = precise::clamp(_3340, 0.0, 1.0);
        _3192 = _3332;
        _3276 = _3300;
        _3284 = _3342;
    }
    float _3344 = _3192;
    float _3346 = _3276;
    float _3348 = _3284;
    float _3350 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3352 = _3266 + _3350;
    float _3354 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3356 = _3268 + _3354;
    float _3358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3360 = _3270 + _3358;
    float _3362 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3364 = _3352 * _3352;
    float _3366 = fma(_3356, _3356, _3364);
    float _3368 = fma(_3360, _3360, _3366);
    float _3370 = rsqrt(_3368);
    float _3372 = _3370 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3374 = _3356 * _3372;
    float _3376 = _3360 * _3372;
    float _3378 = _3374 * _3374;
    float _3380 = _3376 * _3376;
    float _3382 = _3378 + _3380;
    float _3384 = sqrt(_3382);
    bool _3386 = _3384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3390 = _3384 + _3388;
    float _3392 = _3370;
    float _3394 = _3346;
    float _3396 = _3390;
    float _3398 = _3344;
    float _3400 = _3352;
    float _3402 = _3374;
    if (_3386)
    {
        float _3404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3392 = _3404;
    }
    float _3406 = _3392;
    if (_3386)
    {
        float _3408 = rsqrt(_3382);
        _3394 = _3408;
    }
    float _3410 = _3394;
    float _3412 = _3410;
    if (_3386)
    {
        float _3414 = _3390 * _3406;
        _3396 = _3414;
    }
    float _3416 = _3396;
    if (_3386)
    {
        float _3418 = _3416 * 0.15915493667125701904296875;
        _3398 = _3418;
    }
    float _3420 = _3398;
    float _3422 = _3406;
    float _3424 = _3420;
    if (_3386)
    {
        float _3426 = _3420 * 6.283185482025146484375;
        float _3428 = sin(_3426);
        _3422 = _3428;
    }
    float _3430 = _3422;
    float _3432 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3434 = precise::max(0.0, _3432);
    float _3436 = _3360;
    float _3438 = _3434;
    if (_3386)
    {
        float _3440 = _3420 * 6.283185482025146484375;
        float _3442 = cos(_3440);
        _3436 = _3442;
    }
    float _3444 = _3436;
    float _3446 = -_3372;
    float _3448 = -_3434;
    float _3450 = fma(_3352, _3446, _3448);
    if (_3386)
    {
        float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3438 = _3452;
    }
    float _3454 = _3438;
    float _3456 = _3454;
    if (!_3386)
    {
        _3424 = _3450;
    }
    float _3458 = _3424;
    float _3460 = _3458;
    if (_3386)
    {
        float _3462 = fma(_3430, _3454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3400 = _3462;
    }
    float _3464 = _3400;
    float _3466 = sqrt(_3368);
    float _3468 = _3464;
    if (_3386)
    {
        float _3470 = _3444 + (-1.0);
        _3456 = _3470;
    }
    float _3472 = _3456;
    float _3474 = _3472;
    if (_3386)
    {
        float _3476 = _3410 * _3464;
        _2938 = _3476;
    }
    float _3478 = _2938;
    if (!_3386)
    {
        _3412 = _3376;
    }
    float _3480 = _3412;
    float _3482 = _3480;
    if (_3386)
    {
        float _3484 = _3472 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3468 = _3484;
    }
    float _3486 = _3468;
    float _3488 = _3486;
    if (_3386)
    {
        float _3490 = _3374 * _3478;
        _3402 = _3490;
    }
    float _3492 = _3402;
    if (!_3386)
    {
        _3474 = _3378;
    }
    float _3494 = _3474;
    float _3496 = _3494;
    if (_3386)
    {
        float _3498 = _3376 * _3478;
        _3482 = _3498;
    }
    float _3500 = _3482;
    if (_3386)
    {
        float _3502 = fma(_3450, _3444, _3486);
        _3460 = _3502;
    }
    float _3504 = _3460;
    if (_3386)
    {
        float _3506 = _3492 * _3492;
        _3496 = _3506;
    }
    float _3508 = _3496;
    if (!_3386)
    {
        _3488 = _3380;
    }
    float _3510 = _3488;
    float _3512 = _3510;
    if (_3386)
    {
        float _3514 = _3500 * _3500;
        _3512 = _3514;
    }
    float _3516 = _3512;
    float _3518 = fma(_3504, _3504, _3508);
    float _3520 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3522 = _3518 + _3516;
    float _3524 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3520);
    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3528 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3526);
    float _3530 = precise::clamp(_3528, 0.0, 1.0);
    float _3532 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3534 = rsqrt(_3522);
    float _3536 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3524);
    float _3538 = -_3530;
    float _3540 = _3538 + 1.0;
    float _3542 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3544 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3532);
    float _3546 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3548 = _3536 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3550 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3542);
    float _3552 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3544);
    float _3554 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3546);
    float _3556 = _3548 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3558 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3550);
    float _3560 = _3552 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3562 = abs(_3540);
    float _3564 = log2(_3562);
    float _3566 = -_3556;
    float _3568 = fma(_3566, _3362, 1.0);
    float _3570 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3572 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3574 = _3534 * _3492;
    float _3576 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3554);
    float _3578 = _3534 * _3504;
    float _3580 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3572);
    float _3582 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3584 = _3534 * _3500;
    float _3586 = _3576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3588 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3580);
    float _3590 = -_3582;
    float _3592 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3590);
    float _3594 = log2(_3568);
    float _3596 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3598 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3588);
    float _3600 = -_3584;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3592);
    float _3604 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3606 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3608 = fma(_3602, -0.5, 0.5);
    float _3610 = 1.0 / _3598;
    float _3612 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3606);
    float _3614 = fma(_3602, 0.5, 0.5);
    float _3616 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3596);
    float _3618 = _3578 + 1.0;
    float _3620 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3612);
    float _3622 = fma(_3614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3624 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3616);
    float _3626 = exp2(_3604);
    float _3628 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3620);
    float _3630 = fma(_3614, _3622, -0.212114393711090087890625);
    float _3632 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3624);
    float _3634 = _3594 * 0.693147182464599609375;
    float _3636 = sqrt(_3608);
    float _3638 = fma(_3614, _3630, 1.570728778839111328125);
    float _3640 = _3628 * _3610;
    float _3642 = _3632 * _3610;
    float _3644 = _3634 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3646 = fma(_3640, 0.5, 0.5);
    float _3648 = fma(_3642, -0.5, 0.5);
    float _3650 = -_3578;
    float _3652 = fma(_3626, _3618, _3650);
    float3 _9254 = float3(_3646, _3648, _3644);
    float _3654 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9254, float3(0.0), isnan(_9254)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9254, float3(0.0), isnan(_9254)), level(0.0)).x;
    float _3656 = fma(_3652, 0.5, 0.5);
    float _3658 = _3636 * 0.636619746685028076171875;
    float _3660 = -_3638;
    float _3662 = fma(_3658, _3660, 1.0);
    float3 _9275 = float3(_3646, _3648, _3644);
    float4 _3665 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9275, float3(0.0), isnan(_9275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9275, float3(0.0), isnan(_9275)), level(0.0)).xyzw;
    float _3667 = _3665.x;
    float _3669 = _3665.y;
    float _3671 = _3665.z;
    float _3673 = _3665.w;
    float2 _9292 = float2(_3662, _3656);
    float3 _3677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9292, float2(0.0), isnan(_9292)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9292, float2(0.0), isnan(_9292)), level(0.0)).xyz;
    float _3679 = _3677.x;
    float _3681 = _3677.y;
    float _3683 = _3677.z;
    float _3685 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3687 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3689 = _3348 > 0.0;
    bool _3691 = isnan(_3348);
    bool _3693 = _3689 || _3691;
    bool _3695 = isnan(0.0);
    bool _3697 = _3693 || _3695;
    float _3699 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3687);
    float _3701 = exp2(_3685);
    float _3703 = _3348 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3705 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3699);
    float _3707 = _489 * _3703;
    float _3709 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3705);
    float _3711 = _3709 + _3598;
    out.gl_Position.x = _3628;
    out.gl_Position.y = _3632;
    out.gl_Position.z = _3709;
    out.gl_Position.w = _3598;
    float _3713 = _3711 * 0.5;
    float _3715 = -_3701;
    float _3717 = _3715 + 1.0;
    float _3719 = _3707 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3721 = _3717 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _3713;
    out.m_64.w = _3598;
    out.m_45.x = _3719;
    float _3723 = _3721 * _3654;
    float _3725 = -_3721;
    float _3727 = _3725 + 1.0;
    float _3729 = _3673 * _3723;
    float _3731 = _3683 * _3723;
    float _3733 = fma(_3679, _3729, _3667);
    float _3735 = fma(_3681, _3729, _3669);
    float _3737 = _3673 * _3727;
    float _3739 = fma(_3673, _3731, _3671);
    out.m_66.x = _3733;
    out.m_66.y = _3735;
    out.m_66.z = _3739;
    out.m_66.w = _3737;
    if (_3697)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3741 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3741;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1389 = false;
    bool _1057 = false;
    bool _715 = false;
    bool _515 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3798 = as_type<float>(_101);
        out.gl_Position.z = _3798;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3867 = as_type<float>(_137);
        out.gl_Position.z = _3867;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_42.x;
    float _163 = in.m_42.y;
    float _165 = in.m_42.z;
    float _167 = _143 * _141;
    float _169 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _167);
    float _171 = in.m_47.x;
    float _173 = in.m_47.y;
    float _175 = in.m_47.z;
    float _177 = _169 * 6.283185482025146484375;
    float _179 = floor(_169);
    int _181 = as_type<int>(_145) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_145) & 2;
    bool _187 = _185 != 0;
    float _189 = _177 * 0.15915493667125701904296875;
    float _191 = _177;
    float _193 = _147;
    if (!_159)
    {
        float _195 = _147 * _147;
        float _197 = _195 * 0.5;
        _191 = _197;
    }
    float _199 = _191;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    bool _205 = !_183;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _189 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_187;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = _199;
    if (!_159)
    {
        float _219 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    float _223 = -_179;
    float _225 = _169 + _223;
    bool _227 = _225 < 0.5;
    float _229 = float(_227);
    bool _231 = !_159;
    float _233 = _221;
    float _235 = _161;
    float _237 = _163;
    float _239 = _171;
    if (!_231)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _147 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _147);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _233 = _269;
    }
    float _271 = _233;
    bool _273 = !_159;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _147 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _193 = _293;
    }
    float _295 = _193;
    float _297 = -_225;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = fma(_211, 0.5, 0.5);
    float _303 = -_229;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _313 = -_301;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = fma(_295, _171, _307);
    float _319 = fma(_295, _173, _309);
    float _321 = fma(_295, _175, _311);
    float _323 = _307;
    if (!_159)
    {
        float _325 = _119 * _119;
        float _327 = _325 * 0.5;
        _323 = _327;
    }
    float _329 = _323;
    float _331 = fma(_317, _149, _161);
    float _333 = fma(_319, _149, _163);
    float _335 = fma(_321, _149, _165);
    if (!_159)
    {
        float _337 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _337;
    }
    float _339 = _235;
    float _341 = _339;
    if (!_159)
    {
        _237 = _119;
    }
    float _343 = _237;
    bool _345 = !_159;
    float _347 = _343;
    if (!_345)
    {
        float _349 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = log2(_349);
        float _353 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _355 = _353 + 1.0;
        float _357 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _359 = _119 * _351;
        float _361 = 1.0 / _355;
        float _363 = _357 * 0.693147182464599609375;
        float _365 = exp2(_359);
        float _367 = 1.0 / _363;
        float _369 = _365 + (-1.0);
        float _371 = -_369;
        float _373 = fma(_371, _367, _119);
        float _375 = _373 * _361;
        float _377 = _375 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _341 = _377;
    }
    float _379 = _341;
    bool _381 = !_159;
    if (!_381)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = 1.0 / _389;
        float _393 = _119 * _385;
        float _395 = exp2(_393);
        float _397 = -_395;
        float _399 = _397 + 1.0;
        float _401 = _399 * _391;
        _347 = _401;
    }
    float _403 = _347;
    bool _405 = !_203;
    int _407 = _405 ? 0 : 1;
    float _409 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _417 = _415 != 0;
    float _419 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _421 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _423 = abs(_407);
    float _425 = fma(_403, _171, _409);
    bool _427 = !_413;
    int _429 = _427 ? 0 : 1;
    float _431 = fma(_403, _173, _419);
    bool _433 = !_417;
    int _435 = _433 ? 0 : 1;
    float _437 = fma(_403, _175, _421);
    int _439 = abs(_429);
    float _441 = -_431;
    float _443 = _319 + _441;
    int _445 = abs(_435);
    float _447 = -_425;
    float _449 = _317 + _447;
    float _451 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _457 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _459 = float(_439);
    float _461 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _457);
    float _467 = float(_423);
    float _469 = abs(_299);
    float _471 = _459 * _469;
    float _473 = -_437;
    float _475 = _321 + _473;
    float _477 = fma(_467, _315, _471);
    float _479 = float(_445);
    float _481 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[4].z, _461);
    float _483 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
    float _485 = fma(_475, (*spvDescriptorSet0.vp_c10)._m0[6].z, _465);
    float _487 = abs(_305);
    float _489 = fma(_479, _487, _477);
    bool _491 = !_455;
    float _493 = _483;
    float _495 = _481;
    float _497 = _485;
    float _513;
    if (!_491)
    {
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _501 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_85);
        float _519 = 1.0 / _517;
        float _521 = _119 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = _523 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = 1.0 / _535;
    bool _547 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _549 = 1.0 / _539;
    float _551 = 1.0 / _543;
    float _553 = _527 * _545;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _557 = _523 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _559;
    float _563 = _557 * _549;
    bool _565 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _567 = isnan(_523);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = fma(_561, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -_575;
    float _589 = _587 + 1.0;
    float _591 = fma(_581, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _593 = _531 * _551;
    bool _595 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _597 = isnan(_523);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    bool _607 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _609 = isnan(_523);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _605 * _589;
    bool _621 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _623 = isnan(_523);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = -_605;
    float _635 = _633 + 1.0;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _641 = -_617;
    float _643 = _641 + 1.0;
    float _645 = _617 * _635;
    float _647 = fma(_639, _563, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _649 = fma(_585, _563, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _651 = _631 * _643;
    float _653 = in.m_54.x;
    float _655 = in.m_54.y;
    float _657 = -_631;
    float _659 = _657 + 1.0;
    float _661 = _577 * _651;
    float _663 = _591 * _651;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _669;
    float _673 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _661);
    float _675 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _663);
    float _677 = fma(_667, _593, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _679 = fma(_671, _593, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _681 = fma(_647, _645, _673);
    float _683 = fma(_649, _645, _675);
    float _685 = fma(_677, _619, _681);
    float _687 = fma(_679, _619, _683);
    float _689 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[146].x, _685);
    float _691 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[146].y, _687);
    float _693 = _689 * _653;
    float _695 = _691 * _655;
    bool _697 = !_547;
    float _713;
    if (!_697)
    {
        float _699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _701 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _705 = _703 * _699;
        float _707 = floor(_705);
        float _709 = -_707;
        float _711 = _705 + _709;
        _713 = _711;
        _715 = true;
    }
    else
    {
        float _717 = float(_85);
        float _719 = 1.0 / _717;
        float _721 = _119 * _719;
        _713 = _721;
    }
    _715 = false;
    float _723 = _713;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _727 = _723 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _731 = _723 + _729;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _741;
    bool _745 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _747 = isnan(_723);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = 1.0 / _735;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _767 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _769 = isnan(_723);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = 1.0 / _739;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _783 = _723 + _781;
    float _785 = -_777;
    float _787 = _785 + 1.0;
    bool _789 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _791 = 1.0 / _743;
    float _793 = _783 * _757;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _797 = _723 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _801 = _723 + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _803;
    float _807 = 1.0 / _765;
    float _809 = _797 * _779;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _811;
    bool _815 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _817 = isnan(_723);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _831;
    float _835 = 1.0 / _761;
    float _837 = _801 * _791;
    float _839 = fma(_813, _793, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _841 = fma(_833, _793, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _847 = fma(_829, _809, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _849;
    float _853 = _727 * _807;
    bool _855 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _857 = isnan(_723);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _871 = fma(_851, _793, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _873 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _875 = isnan(_723);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = fma(_845, _809, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _887 = -_865;
    float _889 = _887 + 1.0;
    float _891 = fma(_869, _809, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _893 = _731 * _835;
    float _895 = -_825;
    float _897 = _895 + 1.0;
    float _899 = -_883;
    float _901 = _899 + 1.0;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _903;
    float _907 = fma(_805, _893, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _909 = _865 * _897;
    float _911 = _883 * _889;
    bool _913 = _723 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _915 = isnan(_723);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _755 * _901;
    float _927 = -_755;
    float _929 = _927 + 1.0;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _931;
    float _935 = fma(_905, _893, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _937 = _777 * _929;
    float _939 = _923 * _787;
    float _941 = fma(_933, _893, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _947 = _871 * _939;
    float _949 = _839 * _939;
    float _951 = _841 * _939;
    float _953 = -_923;
    float _955 = _953 + 1.0;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _965 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[107].x, _947);
    float _967 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[107].y, _949);
    float _969 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[107].z, _951);
    float _971 = fma(_963, _853, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _973 = fma(_891, _937, _965);
    float _975 = fma(_847, _937, _967);
    float _977 = fma(_885, _937, _969);
    float _979 = fma(_945, _853, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _981 = fma(_935, _925, _973);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _983;
    float _987 = fma(_959, _853, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _989;
    float _993 = fma(_907, _925, _975);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _995;
    float _999 = fma(_941, _925, _977);
    float _1001 = fma(_985, _837, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1003 = fma(_991, _837, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1005 = fma(_997, _837, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1007 = fma(_979, _911, _981);
    float _1009 = fma(_971, _911, _993);
    float _1011 = fma(_987, _911, _999);
    float _1013 = fma(_1001, _909, _1007);
    float _1015 = fma(_1003, _909, _1009);
    float _1017 = fma(_1005, _909, _1011);
    float _1019 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[112].x, _1013);
    float _1021 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[112].y, _1015);
    float _1023 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[112].z, _1017);
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1033 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _1033;
    out.m_56.y = _1035;
    out.m_56.z = _1037;
    out.m_56.w = _1025;
    bool _1039 = !_789;
    float _1055;
    if (!_1039)
    {
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1043 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1047 = _1045 * _1041;
        float _1049 = floor(_1047);
        float _1051 = -_1049;
        float _1053 = _1047 + _1051;
        _1055 = _1053;
        _1057 = true;
    }
    else
    {
        float _1059 = float(_85);
        float _1061 = 1.0 / _1059;
        float _1063 = _119 * _1061;
        _1055 = _1063;
    }
    _1057 = false;
    float _1065 = _1055;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1069 = _1065 + _1067;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1071;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1087 = 1.0 / _1073;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1089;
    bool _1093 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1095 = isnan(_1065);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = 1.0 / _1077;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1109 = _1065 + _1107;
    float _1111 = -_1103;
    float _1113 = _1111 + 1.0;
    bool _1115 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1117 = isnan(_1065);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    float _1127 = 1.0 / _1085;
    float _1129 = _1109 * _1087;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1133 = _1065 + _1131;
    bool _1135 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1137 = isnan(_1065);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1149 = _1065 + _1147;
    float _1151 = 1.0 / _1091;
    float _1153 = _1069 * _1105;
    bool _1155 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1157 = isnan(_1065);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -_1145;
    float _1169 = _1167 + 1.0;
    bool _1171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1173 = 1.0 / _1081;
    float _1175 = _1133 * _1127;
    float _1177 = -_1165;
    float _1179 = _1177 + 1.0;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1181;
    float _1185 = _1145 * _1179;
    float _1187 = _1103 * _1169;
    float _1189 = fma(_1183, _1129, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1193 = _1065 + _1191;
    float _1195 = -_1125;
    float _1197 = _1195 + 1.0;
    float _1199 = _1193 * _1151;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1201;
    float _1205 = _1149 * _1173;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1207;
    float _1211 = fma(_1203, _1129, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1213 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1215 = isnan(_1065);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1229 = fma(_1209, _1129, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1231 = _1065 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1233 = isnan(_1065);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = _1125 * _1113;
    float _1245 = -_1223;
    float _1247 = _1245 + 1.0;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1257 = _1223 * _1197;
    float _1259 = _1241 * _1247;
    float _1261 = fma(_1251, _1153, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1263 = fma(_1255, _1153, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1265 = fma(_1227, _1153, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1267 = _1189 * _1259;
    float _1269 = _1211 * _1259;
    float _1271 = _1229 * _1259;
    float _1273 = -_1241;
    float _1275 = _1273 + 1.0;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1285;
    float _1289 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1267);
    float _1291 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1269);
    float _1293 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1271);
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1297 = _1295 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1301 = _1299 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1307 = fma(_1261, _1257, _1289);
    float _1309 = fma(_1297, _1175, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1311 = fma(_1301, _1175, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1313 = fma(_1305, _1175, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1315 = fma(_1263, _1257, _1291);
    float _1317 = fma(_1265, _1257, _1293);
    float _1319 = fma(_1279, _1205, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1321 = fma(_1283, _1205, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1323 = fma(_1287, _1205, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1325 = fma(_1319, _1243, _1307);
    float _1327 = fma(_1321, _1243, _1315);
    float _1329 = fma(_1323, _1243, _1317);
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1335;
    float _1339 = fma(_1309, _1187, _1325);
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1341;
    float _1345 = fma(_1333, _1199, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1347 = fma(_1337, _1199, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1349 = fma(_1311, _1187, _1327);
    float _1351 = fma(_1343, _1199, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1353 = fma(_1313, _1187, _1329);
    float _1355 = fma(_1345, _1185, _1339);
    float _1357 = fma(_1347, _1185, _1349);
    float _1359 = fma(_1351, _1185, _1353);
    float _1361 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1355);
    float _1363 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1357);
    float _1365 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1359);
    bool _1367 = !_1171;
    float _1385;
    float _1387;
    if (!_1367)
    {
        float _1369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1373 = float(_85);
        float _1375 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _1377 = _1375 * _1369;
        float _1379 = floor(_1377);
        float _1381 = -_1379;
        float _1383 = _1377 + _1381;
        _1385 = _1373;
        _1387 = _1383;
        _1389 = true;
    }
    else
    {
        float _1391 = float(_85);
        float _1393 = 1.0 / _1391;
        float _1395 = _119 * _1393;
        _1385 = _1391;
        _1387 = _1395;
    }
    _1389 = false;
    float _1397 = _1385;
    float _1399 = _1387;
    float _1401 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1403 = int(_1401);
    float _1405 = in.m_49.y;
    float _1407 = _333 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1409 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1411 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1413 = in.m_49.z;
    float _1415 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1407);
    float _1417 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1419 = int(_1417);
    float _1421 = float(_1403);
    float _1423 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1425 = log2(_1423);
    float _1427 = float(uint(_1419));
    float _1429 = 1.0 / _1421;
    int _1431 = ~_1419;
    int _1433 = _1431 + 1;
    float _1435 = _1405 + (-0.5);
    int _1437 = ~_1419;
    int _1439 = _1437 + 1;
    int _1441 = ~_1419;
    int _1443 = _1441 + 1;
    float _1445 = 1.0 / _1427;
    float _1447 = _119 * _1429;
    float _1449 = trunc(_1447);
    int _1451 = int(_1449);
    int _1453 = as_type<int>(_1445) + (-2);
    float _1455 = float(uint(_1451));
    float _1457 = float(_1451);
    float _1459 = as_type<float>(_1453) * _1455;
    int _1461 = ~_1419;
    int _1463 = _1461 + 1;
    float _1465 = trunc(_1459);
    float _1467 = precise::max(_1465, 0.0);
    uint _1470 = uint(_1467);
    int _1472 = _1463 * int(_1470);
    int _1474 = _1472 + _1451;
    float _1476 = float(_1419);
    float _1478 = float(uint(_1474));
    float _1480 = as_type<float>(_1453) * _1478;
    float _1482 = trunc(_1480);
    float _1484 = precise::max(_1482, 0.0);
    uint _1486 = uint(_1484);
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1490 = _1488 != 0;
    bool _1492 = !_1490;
    float _1494 = _1492 ? 7.345489978790283203125 : 1.0;
    float _1496 = _1494 * _139;
    int _1498 = int(_1470) + int(_1486);
    bool _1500 = _1457 >= _1476;
    bool _1502 = isnan(_1457);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(_1476);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = 1.0 / _1397;
    int _1514 = _1433 * _1498;
    int _1516 = _1514 + _1451;
    bool _1518 = uint(_1516) >= uint(_1419);
    float _1520 = trunc(_1510);
    int _1522 = int(_1520);
    bool _1524 = !_1518;
    int _1526 = _1524 ? 0 : (-1);
    bool _1528 = _1419 == 0;
    int _1530 = ~_1498;
    int _1532 = _1530 + _1526;
    int _1534 = _1532 + 1;
    float _1536 = floor(_1496);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1540 = _1538 != 0;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1544 = _1542 != 0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1548 = _1546 != 0;
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1552 = _1550 != 0;
    int _1554 = _1419 * _1534;
    int _1556 = _1554 + _1451;
    bool _1558 = !_1552;
    int _1560 = _1558 ? 0 : 1;
    int _1562 = ~_1522;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    bool _1568 = !_1528;
    int _1570 = _1568 ? _1556 : (-1);
    int _1572 = abs(_1560);
    bool _1574 = _139 > 0.5;
    float _1576 = -_1536;
    float _1578 = _1496 + _1576;
    int _1580 = _1570 * _1566;
    int _1582 = _1419 + (-1);
    float _1584 = _1578 * _1476;
    float _1586 = _119 * _1476;
    bool _1588 = !_1544;
    int _1590 = _1588 ? 0 : 1;
    int _1592 = _1522 * _1582;
    int _1594 = _1592 + _1580;
    bool _1596 = !_1540;
    int _1598 = _1596 ? 0 : 1;
    float _1600 = _1586 * _1512;
    float _1602 = trunc(_1584);
    int _1604 = int(_1602);
    int _1606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1608 = _1606 != 0;
    int _1610 = abs(_1590);
    bool _1612 = !_1548;
    int _1614 = _1612 ? 0 : 1;
    int _1616 = abs(_1598);
    float _1618 = trunc(_1600);
    int _1620 = int(_1618);
    bool _1622 = !_1608;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = abs(_1614);
    int _1628 = _1594 * _1610;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1632 = _1630 != 0;
    float _1634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _1636 = -_207;
    int _1638 = _1574 ? as_type<int>(_1636) : as_type<int>(_207);
    int _1640 = _1604 * _1572;
    int _1642 = _1640 + _1451;
    int _1644 = abs(_1624);
    float _1646 = _1411 * _1634;
    bool _1648 = _1405 > 0.5;
    bool _1650 = _1413 > 0.5;
    int _1652 = _1620 * _1616;
    int _1654 = _1652 + _1628;
    float _1656 = -_215;
    int _1658 = _1648 ? as_type<int>(_1656) : as_type<int>(_215);
    float _1660 = in.m_49.w;
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1664 = _1662 != 0;
    int _1666 = _1642 * _1626;
    int _1668 = _1666 + _1654;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1672 = _1670 != 0;
    int _1674 = ~_1419;
    int _1676 = _1674 + 1;
    int _1678 = _1604 * _1644;
    int _1680 = _1678 + _1668;
    bool _1682 = !_1632;
    float _1684 = _1682 ? _207 : as_type<float>(_1638);
    float _1686 = _333 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1688 = -_207;
    int _1690 = _1650 ? as_type<int>(_1688) : as_type<int>(_207);
    float _1692 = float(uint(_1680));
    float _1694 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1686);
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1698 = _1696 != 0;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1702 = _1700 != 0;
    float _1704 = as_type<float>(_1453) * _1692;
    float _1706 = _333 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1708 = !_1672;
    float _1710 = _1708 ? _207 : as_type<float>(_1690);
    float _1712 = fma(_331, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1706);
    float _1714 = trunc(_1704);
    float _1716 = precise::max(_1714, 0.0);
    uint _1718 = uint(_1716);
    float _1720 = _139 * 2.0;
    bool _1722 = _1660 > 0.5;
    float _1724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1728 = _1409 * _1724;
    float _1730 = floor(_1720);
    float _1732 = _1405 * 2.0;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1736 = _1676 * int(_1718);
    int _1738 = _1736 + _1680;
    float _1740 = floor(_1732);
    float _1742 = float(uint(_1738));
    float _1744 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1750 = as_type<float>(_1453) * _1742;
    float _1752 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1754 = -_215;
    int _1756 = _1722 ? as_type<int>(_1754) : as_type<int>(_215);
    float _1758 = -_1734;
    float _1760 = fma(_1744, 2.0, _1758);
    float _1762 = trunc(_1750);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    float _1768 = fma(_1752, -2.0, _1726);
    bool _1770 = !_1698;
    float _1772 = _1770 ? _215 : as_type<float>(_1658);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1778 = _1730 > 0.0;
    float _1780 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1768);
    bool _1782 = _1730 >= 0.0;
    bool _1784 = isnan(_1730);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan(0.0);
    bool _1790 = _1786 || _1788;
    float _1792 = 1.0 / _1748;
    bool _1794 = !_1702;
    float _1796 = _1794 ? _215 : as_type<float>(_1756);
    int _1798 = ~_1419;
    int _1800 = _1798 + 1;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1804 = _1802 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1806 = _1740 > 0.0;
    int _1808 = int(_1718) + int(_1766);
    float _1810 = 1.0 / _1804;
    int _1812 = _1790 ? 0 : 1;
    bool _1814 = _1740 >= 0.0;
    bool _1816 = isnan(_1740);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan(0.0);
    bool _1822 = _1818 || _1820;
    float _1824 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1694);
    float _1826 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1712);
    float _1828 = fma(_335, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1415);
    float _1830 = 1.0 / _1776;
    int _1832 = _1800 * _1808;
    int _1834 = _1832 + _1680;
    float _1836 = _1413 * 2.0;
    int _1838 = ~_1812;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    float _1844 = _1828 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1846 = _1822 ? 0 : 1;
    float _1848 = _1824 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1850 = _1842;
    if (!_1778)
    {
        int _1852 = ~_1812;
        int _1854 = _1852 + 1;
        _1850 = _1854;
    }
    int _1856 = _1850;
    float _1858 = floor(_1836);
    float _1860 = _1826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1862 = uint(_1834) >= uint(_1419);
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1864;
    int _1868 = ~_1846;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    int _1874 = _1872;
    if (!_1806)
    {
        int _1876 = ~_1846;
        int _1878 = _1876 + 1;
        _1874 = _1878;
    }
    int _1880 = _1874;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1882;
    float _1886 = _1866 * _1810;
    bool _1888 = !_1862;
    int _1890 = _1888 ? 0 : (-1);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1894 = _1892 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1896 = float(uint(_1642));
    int _1898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1900 = _1898 != 0;
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1904 = _1902 != 0;
    int _1906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1908 = _1906 != 0;
    float _1910 = _1884 * _1792;
    float _1912 = _139 + _1413;
    float _1914 = as_type<float>(_1453) * _1896;
    float _1916 = _1894 * _1830;
    bool _1918 = !_1904;
    int _1920 = _1918 ? 0 : 1;
    float _1922 = _1912 + (-1.0);
    bool _1924 = _1858 >= 0.0;
    bool _1926 = isnan(_1858);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(0.0);
    bool _1932 = _1928 || _1930;
    float _1934 = trunc(_1914);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    int _1940 = ~_1808;
    int _1942 = _1940 + _1890;
    int _1944 = _1942 + 1;
    float _1946 = _139 + _1405;
    int _1948 = _1932 ? 0 : 1;
    float _1950 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1952 = _1858 > 0.0;
    float _1954 = _119 * _1425;
    float _1956 = _1946 + (-1.0);
    int _1958 = abs(_1920);
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1962 = _1399 + _1960;
    float _1964 = float(_1856);
    float _1966 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1968 = float(_1958);
    int _1970 = _1419 * _1944;
    int _1972 = _1970 + _1680;
    float _1974 = fma(_1910, _1962, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1976 = _1439 * int(_1938);
    int _1978 = _1976 + _1642;
    bool _1980 = !_1900;
    int _1982 = _1980 ? 0 : 1;
    float _1984 = _1405 + _1413;
    bool _1986 = !_1528;
    int _1988 = _1986 ? _1972 : (-1);
    float _1990 = exp2(_1954);
    float _1992 = float(uint(_1978));
    float _1994 = _1984 + (-1.0);
    int _1996 = _1988 >> 31;
    int _1998 = abs(_1982);
    float _2000 = as_type<float>(_1453) * _1992;
    int _2002 = _1996 & 3;
    float _2004 = in.m_58.x;
    float _2006 = in.m_58.y;
    float _2008 = in.m_58.z;
    int _2010 = _1988 + _2002;
    float _2012 = trunc(_2000);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    float _2018 = float(_1998);
    float _2020 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2022 = ~_1948;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    float _2028 = -_1990;
    float _2030 = _2028 + 1.0;
    int _2032 = _2010 >> 2;
    int _2034 = _2026;
    float _2036 = as_type<float>(_1938);
    if (!_1952)
    {
        int _2038 = ~_1948;
        int _2040 = _2038 + 1;
        _2034 = _2040;
    }
    int _2042 = _2034;
    float _2044 = _1968 * _1964;
    int _2046 = _2032 << 4;
    int _2048 = _2046 + 368;
    float _2050 = float(_2042);
    float _2052 = _2044 * (-2.0);
    float _2054 = float(_1880);
    float _2056 = _2018 * _2050;
    uint _2058 = uint(int(uint(_2048) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    bool _2074 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2082 = _2078 || _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2086 = 1.0 + _2084;
    float _2088 = _2056 * (-2.0);
    float _2090 = fma(_2052, _2006, _2006);
    float _2092 = _2082 ? _2030 : 0.0;
    float _2094 = _139 + (-0.5);
    int _2096 = _1988 & 3;
    bool _2098 = _2096 != 0;
    float _2100 = 1.0 / _2086;
    int _2102 = _1988 & 3;
    bool _2104 = _2102 != 0;
    float _2106 = fma(_1966, _2088, _1966);
    float _2108 = fma(_2088, _2004, _2004);
    bool _2110 = !_1908;
    int _2112 = _2110 ? 0 : 1;
    float _2114 = fma(_2020, _2052, _2020);
    float _2116 = _2098 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2120 = uint(_2102) > 1u;
    float _2122 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2124 = int(_2122);
    int _2126 = abs(_2112);
    int _2128 = int(_1938) + int(_2016);
    float _2130 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2118);
    float _2132 = _2092;
    float _2134 = _2116;
    if (!_1490)
    {
        _2036 = _1405;
    }
    float _2136 = _2036;
    float _2138 = _2092 * _2100;
    float _2140 = _2136;
    if (_1490)
    {
        _2140 = _139;
    }
    float _2142 = _2140;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2146 = float(_2126);
    int _2148 = _2048 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    if (!_1490)
    {
        _2132 = _1413;
    }
    float _2166 = _2132;
    float _2168 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2144);
    float _2170 = _2166;
    if (_1490)
    {
        _2170 = _1405;
    }
    float _2172 = _2170;
    float _2174 = _2146 * _2054;
    int _2176 = ~as_type<int>(_2116);
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    int _2182 = _1443 * _2128;
    int _2184 = _2182 + _1642;
    int _2186 = _2180;
    if (!_2120)
    {
        int _2188 = ~as_type<int>(_2116);
        int _2190 = _2188 + 1;
        _2186 = _2190;
    }
    int _2192 = _2186;
    float _2194 = _2174 * (-2.0);
    bool _2196 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2198 = isnan(1.0);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2204 = _2200 || _2202;
    if (!_1490)
    {
        _2134 = _1413;
    }
    float _2206 = _2134;
    float _2208 = fma(_1950, _2194, _1950);
    float _2210 = _2206;
    if (_1490)
    {
        _2210 = _1405;
    }
    float _2212 = _2210;
    float _2214 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2090);
    bool _2216 = !_2204;
    float _2218 = _2216 ? _119 : _2138;
    float _2220 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2108);
    bool _2222 = uint(_2184) >= uint(_1419);
    float _2224 = fma(_2194, _2008, _2008);
    int _2226 = abs(_2192);
    float _2228 = fma(_2218, _2114, _2214);
    bool _2230 = !_2104;
    int _2232 = _2230 ? 0 : 1;
    float _2234 = fma(_2218, _2106, _2220);
    bool _2236 = _2102 != 3;
    float _2238 = _1413 + (-0.5);
    bool _2240 = !_2222;
    int _2242 = _2240 ? 0 : (-1);
    bool _2244 = uint(_2102) >= 2u;
    int _2246 = ~_2226;
    int _2248 = _2246 + 1;
    int _2250 = _2248 + 1;
    int _2252 = abs(_2232);
    int _2254 = ~_2128;
    int _2256 = _2254 + _2242;
    int _2258 = _2256 + 1;
    int _2260 = _2250 * as_type<int>(_2072);
    int _2262 = _2244 ? 0 : 1;
    int _2264 = ~_2252;
    int _2266 = _2264 + 1;
    int _2268 = _2266 + 1;
    int _2270 = _1419 * _2258;
    int _2272 = _2270 + _1642;
    int _2274 = ~_2262;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2282 = _1399 + _2280;
    bool _2284 = _2102 != 3;
    int _2286 = _2268 * as_type<int>(_2064);
    int _2288 = _2286 + _2260;
    int _2290 = _2278;
    if (_2236)
    {
        int _2292 = ~_2262;
        int _2294 = _2292 + 1;
        _2290 = _2294;
    }
    int _2296 = _2290;
    bool _2298 = !_2284;
    int _2300 = _2298 ? 0 : (-1);
    int _2302 = abs(_2296);
    int _2304 = abs(_2300);
    bool _2306 = !_1664;
    int _2308 = _2306 ? 0 : 1;
    float _2310 = _2228 * 0.15915493667125701904296875;
    int _2312 = abs(_2308);
    int _2314 = ~_2302;
    int _2316 = _2314 + 1;
    int _2318 = _2316 + 1;
    int _2320 = abs(_2124);
    int _2322 = _2318 * as_type<int>(_2156);
    int _2324 = _2322 + _2288;
    int _2326 = ~_2304;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = fma(_2238, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2224);
    float _2334 = float(uint(_2320));
    float _2336 = fma(_1916, _2282, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2338 = ~_2312;
    int _2340 = _2338 + 1;
    int _2342 = _2340 + 1;
    int _2344 = _2330 * as_type<int>(_2164);
    int _2346 = _2344 + _2324;
    bool _2348 = !_1528;
    int _2350 = _2348 ? _2272 : (-1);
    float _2352 = _2234 * 0.15915493667125701904296875;
    float _2354 = 1.0 / _2334;
    int _2356 = _2346 * _2342;
    float _2358 = float(uint(_2124));
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2362 = _1399 + _2360;
    int _2364 = _2350 * _2312;
    int _2366 = _2364 + _2356;
    bool _2368 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2370 = isnan(_1399);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = fma(_2218, _2208, _2332);
    float _2382 = 1.0 / _2358;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2386 = abs(_2366);
    float _2388 = -_2378;
    float _2390 = _2388 + 1.0;
    bool _2392 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2394 = isnan(_1399);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2400 = _2396 || _2398;
    float _2402 = float(_2400);
    float _2404 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2384);
    float _2406 = fma(_1886, _2362, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2408 = as_type<int>(_2354) + (-2);
    float _2410 = _2310 * 6.283185482025146484375;
    float _2412 = sin(_2410);
    float _2414 = float(uint(_2386));
    float _2416 = _2380 * 0.15915493667125701904296875;
    bool _2418 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2420 = isnan(_1399);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2426 = _2422 || _2424;
    float _2428 = float(_2426);
    bool _2430 = _1399 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2432 = isnan(_1399);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = as_type<float>(_2408) * _2414;
    float _2444 = _2402 * _2390;
    float _2446 = _2310 * 6.283185482025146484375;
    float _2448 = cos(_2446);
    float _2450 = float(uint(_2366));
    int _2452 = ~_2320;
    int _2454 = _2452 + 1;
    float _2456 = trunc(_2442);
    float _2458 = precise::max(_2456, 0.0);
    uint _2460 = uint(_2458);
    int _2462 = as_type<int>(_2382) + (-2);
    float _2464 = -_2402;
    float _2466 = _2464 + 1.0;
    bool _2468 = _2124 == 0;
    float _2470 = as_type<float>(_2462) * _2450;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2474 = _2352 * 6.283185482025146484375;
    float _2476 = sin(_2474);
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2480 = _2352 * 6.283185482025146484375;
    float _2482 = cos(_2480);
    float _2484 = trunc(_2470);
    float _2486 = precise::max(_2484, 0.0);
    uint _2488 = uint(_2486);
    float _2490 = _2440 * _2466;
    float _2492 = -_2440;
    float _2494 = _2492 + 1.0;
    int _2496 = ~_2124;
    int _2498 = _2496 + 1;
    float _2500 = _2428 * _2494;
    float _2502 = fma(_2142, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2478);
    float _2504 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2506 = _2416 * 6.283185482025146484375;
    float _2508 = sin(_2506);
    float _2510 = _1974 * _2500;
    int _2512 = _2454 * int(_2460);
    int _2514 = _2512 + _2386;
    float _2516 = -_2472;
    float _2518 = fma(_2504, 2.0, _2516);
    float _2520 = -_2428;
    float _2522 = _2520 + 1.0;
    float _2524 = _2476 * _2448;
    float _2526 = float(uint(_2514));
    float _2528 = _2416 * 6.283185482025146484375;
    float _2530 = cos(_2528);
    int _2532 = _2498 * int(_2488);
    int _2534 = _2532 + _2366;
    float _2536 = fma(_2522, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2510);
    float _2538 = as_type<float>(_2408) * _2526;
    float _2540 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2544 = float(uint(_2534));
    float _2546 = _2482 * _2412;
    float _2548 = trunc(_2538);
    float _2550 = precise::max(_2548, 0.0);
    uint _2552 = uint(_2550);
    float _2554 = fma(_2540, -2.0, _2542);
    float _2556 = fma(_2336, _2490, _2536);
    float _2558 = as_type<float>(_2462) * _2544;
    float _2560 = _2476 * _2412;
    float _2562 = -_2546;
    float _2564 = fma(_2508, _2524, _2562);
    float _2566 = -_2524;
    float _2568 = fma(_2508, _2546, _2566);
    float _2570 = _2530 * _1646;
    float _2572 = _2448 * _2530;
    float _2574 = _2482 * _2448;
    float _2576 = _2412 * _2530;
    float _2578 = trunc(_2558);
    float _2580 = precise::max(_2578, 0.0);
    uint _2582 = uint(_2580);
    float _2584 = _2482 * _2570;
    float _2586 = _2476 * _2570;
    float _2588 = fma(_2508, _2574, _2560);
    float _2590 = -_1646;
    float _2592 = _2508 * _2590;
    float _2594 = fma(_2508, _2560, _2574);
    float _2596 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2598 = fma(_2588, _1728, _2584);
    float _2600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2602 = fma(_2572, _1728, _2592);
    float _2604 = fma(_2564, _1728, _2586);
    float _2606 = fma(_2568, _2596, _2598);
    int _2608 = ~_2320;
    int _2610 = _2608 + 1;
    float _2612 = fma(_2576, _2596, _2602);
    float _2614 = fma(_2594, _2596, _2604);
    float _2616 = _2606 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2620 = int(_2488) + int(_2582);
    float _2622 = _2606 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2624 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2616);
    int _2626 = int(_2460) + int(_2552);
    float _2628 = _1710 + 0.5;
    float _2630 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2622);
    float _2632 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2624);
    float _2634 = _2600 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2636 = _2610 * _2626;
    int _2638 = _2636 + _2386;
    float _2640 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2630);
    float _2642 = _2632 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2644 = -_119;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2518);
    float _2648 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2554);
    float _2650 = _2640 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2652 = _1844 + _2642;
    float _2654 = _2618 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2656 = ~_2124;
    int _2658 = _2656 + 1;
    float _2660 = _1848 + _2650;
    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2664 = _2652 + _2662;
    float _2666 = _1796 + (-0.5);
    bool _2668 = uint(_2638) >= uint(_2320);
    int _2670 = _2658 * _2620;
    int _2672 = _2670 + _2366;
    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2676 = _2660 + _2674;
    float _2678 = _2664 * _2664;
    float _2680 = _2606 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2682 = -_2634;
    float _2684 = -_2648;
    float _2686 = fma(_2682, _2666, _2684);
    int _2688 = _2366 ^ _2124;
    float _2690 = fma(_2676, _2676, _2678);
    bool _2692 = uint(_2672) >= uint(_2124);
    float _2694 = fma(_2654, _2628, _2646);
    bool _2696 = !_2668;
    int _2698 = _2696 ? 0 : (-1);
    float _2700 = sqrt(_2690);
    uint _2702 = uint(int(uint(_2688) >> uint(31)));
    float _2704 = fma(_2612, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2680);
    bool _2706 = !_2692;
    int _2708 = _2706 ? 0 : (-1);
    float _2710 = fma(_2406, _2444, _2556);
    int _2712 = ~_2698;
    int _2714 = _2626 + _2712;
    int _2716 = _2714 + 1;
    float _2718 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2704);
    int _2720 = ~int(_2702);
    int _2722 = _2720 + 1;
    float _2724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2726 = ~_2620;
    int _2728 = _2726 + _2708;
    int _2730 = _2728 + 1;
    float _2732 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2710);
    int _2734 = _2716 ^ _2722;
    bool _2736 = _2124 == 0;
    int _2738 = _2124 * _2730;
    int _2740 = _2738 + _2366;
    int _2742 = ~_2722;
    int _2744 = _2742 + _2734;
    int _2746 = _2744 + 1;
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2750 = _2700 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2752 = _2718 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _2754 = !_2736;
    int _2756 = _2754 ? _2740 : (-1);
    float _2758 = -_119;
    float _2760 = fma(_2758, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1760);
    bool _2762 = !_2468;
    int _2764 = _2762 ? _2746 : (-1);
    float _2766 = _1860 + _2752;
    float _2768 = float(_2756);
    float _2770 = _2724 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2772 = float(_2764);
    float _2774 = _1684 + 0.5;
    float _2776 = fma(_2770, _2768, _2760);
    float _2778 = _2760;
    float _2780 = _2772;
    float _2782 = _2652;
    if (!_2750)
    {
        _2778 = _2660;
    }
    float _2784 = _2778;
    float _2786 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2788 = -_1780;
    float _2790 = fma(_2786, _2772, _2788);
    float _2792 = _1772 + (-0.5);
    float _2794 = _2784;
    if (!_2750)
    {
        _2780 = _2766;
    }
    float _2796 = _2780;
    bool _2798 = !_2750;
    float _2800 = _2796;
    if (!_2798)
    {
        float _2802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2806 = _2700 + _2804;
        float _2808 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2810 = rsqrt(_2690);
        float _2812 = _2806 * _2802;
        float _2814 = _2812 * 0.15915493667125701904296875;
        float _2816 = _2814 * 6.283185482025146484375;
        float _2818 = cos(_2816);
        float _2820 = _2814 * 6.283185482025146484375;
        float _2822 = sin(_2820);
        float _2824 = _2818 + (-1.0);
        float _2826 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2828 = fma(_2822, _2808, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2830 = fma(_2766, _2818, _2826);
        float _2832 = _2810 * _2828;
        float _2834 = fma(_2676, _2832, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2836 = fma(_2664, _2832, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2800 = _2830;
        _2794 = _2834;
        _2782 = _2836;
    }
    float _2838 = _2800;
    float _2840 = _2794;
    float _2842 = _2782;
    float _2844 = -_1860;
    float _2846 = _2844 + _2838;
    float _2848 = fma(_2770, _2774, _2776);
    float _2850 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2502);
    float _2852 = -_1848;
    float _2854 = _2852 + _2840;
    float _2856 = _2846 * _2846;
    float _2858 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2404);
    float _2860 = -_2786;
    float _2862 = fma(_2860, _2792, _2790);
    float _2864 = -_2850;
    float _2866 = _2864 + 1.0;
    float _2868 = -_1844;
    float _2870 = _2868 + _2842;
    float _2872 = fma(_2854, _2854, _2856);
    float _2874 = -_2858;
    float _2876 = _2874 + 1.0;
    float _2878 = -_2866;
    float _2880 = fma(_1710, _2878, _2694);
    float _2882 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2130);
    float _2884 = fma(_2870, _2870, _2872);
    float _2886 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2168);
    float _2888 = fma(_1796, _2876, _2686);
    float _2890 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2892 = sqrt(_2884);
    float _2894 = -_2882;
    float _2896 = _2894 + 1.0;
    float _2898 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2900 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2902 = -_2886;
    float _2904 = _2902 + 1.0;
    float _2906 = _2890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2908 = -_2896;
    float _2910 = fma(_1684, _2908, _2848);
    float _2912 = _2898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2914 = _2900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2916 = _2732 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2918 = fma(_1772, _2904, _2862);
    out.m_60.x = _2906;
    out.m_60.y = _2914;
    out.m_60.z = _2912;
    out.m_60.w = _2916;
    bool _2920 = _2892 > 0.0;
    out.m_62.x = _2910;
    out.m_62.y = _2918;
    out.m_62.z = _2880;
    out.m_62.w = _2888;
    bool _2922 = !_2920;
    float _2924 = _2880;
    float _2926 = _2918;
    float _2928 = _2910;
    float _2930 = _2838;
    float _2932 = _2842;
    float _2934 = _2840;
    float _2936 = _2910;
    float _2938 = _2906;
    if (!_2922)
    {
        bool _2940 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2942 = _2888;
        if (_2940)
        {
            float _2944 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2942 = _2944;
        }
        float _2946 = _2942;
        if (_2940)
        {
            float _2948 = _481 * _2946;
            _2924 = _2948;
        }
        float _2950 = _2924;
        float _2952 = _2950;
        if (_2940)
        {
            float _2954 = _483 * _2946;
            _2926 = _2954;
        }
        float _2956 = _2926;
        float _2958 = _2956;
        if (_2940)
        {
            float _2960 = _485 * _2946;
            _2928 = _2960;
        }
        float _2962 = _2928;
        float _2964 = _2962;
        float _2966 = _2962;
        if (!_2940)
        {
            float _2968 = _119 + 1.0;
            float _2970 = _2968;
            if (!_159)
            {
                float _2972 = _2968 * _2968;
                float _2974 = _2972 * 0.5;
                _2964 = _2974;
            }
            float _2976 = _2964;
            float _2978 = _2976;
            if (!_159)
            {
                float _2980 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2978 = _2980;
            }
            float _2982 = _2978;
            bool _2984 = !_159;
            float _2986 = _2982;
            if (!_2984)
            {
                float _2988 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2990 = log2(_2988);
                float _2992 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2994 = _2990 * _2968;
                float _2996 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2998 = 1.0 + _2996;
                float _3000 = 1.0 / _2998;
                float _3002 = _2992 * 0.693147182464599609375;
                float _3004 = exp2(_2994);
                float _3006 = 1.0 / _3002;
                float _3008 = _3004 + (-1.0);
                float _3010 = -_3008;
                float _3012 = fma(_3010, _3006, _2968);
                float _3014 = _3012 * _3000;
                float _3016 = _3014 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2986 = _3016;
            }
            float _3018 = _2986;
            float _3020 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3022 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3024 = !_159;
            if (!_3024)
            {
                float _3026 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3028 = log2(_3026);
                float _3030 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3032 = 1.0 + _3030;
                float _3034 = 1.0 / _3032;
                float _3036 = _3028 * _2968;
                float _3038 = exp2(_3036);
                float _3040 = -_3038;
                float _3042 = _3040 + 1.0;
                float _3044 = _3042 * _3034;
                _2970 = _3044;
            }
            float _3046 = _2970;
            float _3048 = fma(_3046, _173, _3022);
            float _3050 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3052 = fma(_3046, _171, _3020);
            float _3054 = -_431;
            float _3056 = _3054 + _3048;
            float _3058 = fma(_3046, _175, _3050);
            float _3060 = -_425;
            float _3062 = _3060 + _3052;
            float _3064 = _3056 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3066 = _3056 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3068 = _3056 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3070 = -_437;
            float _3072 = _3070 + _3058;
            float _3074 = fma(_3062, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3064);
            float _3076 = fma(_3062, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3066);
            float _3078 = fma(_3062, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3068);
            float _3080 = fma(_3072, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3074);
            float _3082 = fma(_3072, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3076);
            float _3084 = fma(_3072, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3078);
            _493 = _3082;
            _495 = _3080;
            _497 = _3084;
            _2952 = _3080;
            _2958 = _3082;
            _2966 = _3084;
        }
        float _3086 = _493;
        float _3088 = _495;
        float _3090 = _497;
        float _3092 = _2952;
        float _3094 = _2958;
        float _3096 = _2966;
        float _3098 = _3086 * _3086;
        float _3100 = rsqrt(_2884);
        float _3102 = fma(_3088, _3088, _3098);
        float _3104 = fma(_3090, _3090, _3102);
        float _3106 = sqrt(_3104);
        float _3108 = _2854 * _3100;
        float _3110 = _2846 * _3100;
        float _3112 = _2870 * _3100;
        bool _3114 = _3106 > 0.0;
        bool _3116 = !_3114;
        _2936 = _3096;
        _239 = _3100;
        if (!_3116)
        {
            float _3118 = rsqrt(_3104);
            float _3120 = _3118 * _3086;
            float _3122 = _3118 * _3088;
            float _3124 = _3118 * _3090;
            float _3126 = _3110 * _3120;
            float _3128 = fma(_3108, _3122, _3126);
            float _3130 = fma(_3112, _3124, _3128);
            float _3132 = _3130 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3134 = fma(_3092, _3132, _2840);
            float _3136 = fma(_3094, _3132, _2838);
            float _3138 = fma(_3096, _3132, _2842);
            _2930 = _3136;
            _2932 = _3138;
            _2934 = _3134;
            _239 = _3132;
        }
    }
    float _3140 = _2930;
    float _3142 = _2932;
    float _3144 = _2934;
    float _3146 = _2936;
    float _3148 = _239;
    float _3150 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3152 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3154 = isnan(0.5);
    bool _3156 = _3152 || _3154;
    bool _3158 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3160 = _3156 || _3158;
    bool _3162 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3164 = isnan(0.5);
    bool _3166 = _3162 || _3164;
    bool _3168 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3170 = _3166 || _3168;
    float _3172 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3150);
    float _3174 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3176 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3172);
    float _3178 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3174);
    float _3180 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3182 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3178);
    float _3184 = _3176;
    float _3186 = _3148;
    float _3188 = _3146;
    float _3190 = _3140;
    float _3192 = _3144;
    if (_3160)
    {
        _3184 = _3140;
    }
    float _3194 = _3184;
    float _3196 = 1.0 / _3180;
    float _3198 = _3182 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3200 = _3198;
    float _3202 = _3194;
    if (_3160)
    {
        _3186 = _3142;
    }
    float _3204 = _3186;
    float _3206 = _3198 + _3180;
    float _3208 = _3204;
    if (_3160)
    {
        _3200 = _3144;
    }
    float _3210 = _3200;
    float _3212 = _3210;
    if (!_3160)
    {
        float _3214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3216 = _1860 + _3214;
        float _3218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3220 = _1848 + _3218;
        float _3222 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3224 = -_1860;
        float _3226 = _3224 + _3140;
        float _3228 = _3216 * _3216;
        float _3230 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3232 = _1844 + _3230;
        float _3234 = -_1844;
        float _3236 = _3234 + _3142;
        float _3238 = fma(_3220, _3220, _3228);
        float _3240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3242 = fma(_3232, _3232, _3238);
        float _3244 = sqrt(_3242);
        float _3246 = _3222 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3248 = precise::min(_3244, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3250 = _3248 * _3240;
        float _3252 = -_1848;
        float _3254 = _3252 + _3144;
        float _3256 = _3246 * _3250;
        float _3258 = fma(_3254, _3256, _1848);
        float _3260 = fma(_3226, _3256, _1860);
        float _3262 = fma(_3236, _3256, _1844);
        _3188 = _3240;
        _3202 = _3260;
        _3212 = _3258;
        _3208 = _3262;
        _3190 = _3226;
    }
    float _3264 = _3188;
    float _3266 = _3202;
    float _3268 = _3212;
    float _3270 = _3208;
    float _3272 = _3190;
    float _3274 = _3264;
    float _3276 = _3272;
    if (_3170)
    {
        _3274 = 1.0;
    }
    float _3278 = _3274;
    float _3280 = _3206 * _3196;
    float _3282 = _3280 * 0.5;
    float _3284 = _3278;
    if (!_3170)
    {
        float _3286 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3288 = _3286 * 0.15915493667125701904296875;
        float _3290 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3294 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3292);
        float _3296 = _3288 * 6.283185482025146484375;
        float _3298 = cos(_3296);
        float _3300 = _3290 * 0.15915493667125701904296875;
        float _3302 = _3288 * 6.283185482025146484375;
        float _3304 = sin(_3302);
        float _3306 = 1.0 / _3298;
        float _3308 = _3300 * 6.283185482025146484375;
        float _3310 = cos(_3308);
        float _3312 = _3304 * _3306;
        float _3314 = _3300 * 6.283185482025146484375;
        float _3316 = sin(_3314);
        float _3318 = _3310 * _3312;
        float _3320 = 1.0 / _3294;
        float _3322 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3324 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3322;
        float _3326 = 1.0 / _3318;
        float _3328 = 1.0 / _3324;
        float _3330 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3332 = _3320 * _3330;
        float _3334 = _3316 * _3326;
        float _3336 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3338 = fma(_3334, _3332, _3336);
        float _3340 = _3338 * _3328;
        float _3342 = precise::clamp(_3340, 0.0, 1.0);
        _3192 = _3332;
        _3276 = _3300;
        _3284 = _3342;
    }
    float _3344 = _3192;
    float _3346 = _3276;
    float _3348 = _3284;
    float _3350 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3352 = _3266 + _3350;
    float _3354 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3356 = _3268 + _3354;
    float _3358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3360 = _3270 + _3358;
    float _3362 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3364 = _3352 * _3352;
    float _3366 = fma(_3356, _3356, _3364);
    float _3368 = fma(_3360, _3360, _3366);
    float _3370 = rsqrt(_3368);
    float _3372 = _3370 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3374 = _3356 * _3372;
    float _3376 = _3360 * _3372;
    float _3378 = _3374 * _3374;
    float _3380 = _3376 * _3376;
    float _3382 = _3378 + _3380;
    float _3384 = sqrt(_3382);
    bool _3386 = _3384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3390 = _3384 + _3388;
    float _3392 = _3370;
    float _3394 = _3346;
    float _3396 = _3390;
    float _3398 = _3344;
    float _3400 = _3352;
    float _3402 = _3374;
    if (_3386)
    {
        float _3404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3392 = _3404;
    }
    float _3406 = _3392;
    if (_3386)
    {
        float _3408 = rsqrt(_3382);
        _3394 = _3408;
    }
    float _3410 = _3394;
    float _3412 = _3410;
    if (_3386)
    {
        float _3414 = _3390 * _3406;
        _3396 = _3414;
    }
    float _3416 = _3396;
    if (_3386)
    {
        float _3418 = _3416 * 0.15915493667125701904296875;
        _3398 = _3418;
    }
    float _3420 = _3398;
    float _3422 = _3406;
    float _3424 = _3420;
    if (_3386)
    {
        float _3426 = _3420 * 6.283185482025146484375;
        float _3428 = sin(_3426);
        _3422 = _3428;
    }
    float _3430 = _3422;
    float _3432 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3434 = precise::max(0.0, _3432);
    float _3436 = _3360;
    float _3438 = _3434;
    if (_3386)
    {
        float _3440 = _3420 * 6.283185482025146484375;
        float _3442 = cos(_3440);
        _3436 = _3442;
    }
    float _3444 = _3436;
    float _3446 = -_3372;
    float _3448 = -_3434;
    float _3450 = fma(_3352, _3446, _3448);
    if (_3386)
    {
        float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3438 = _3452;
    }
    float _3454 = _3438;
    float _3456 = _3454;
    if (!_3386)
    {
        _3424 = _3450;
    }
    float _3458 = _3424;
    float _3460 = _3458;
    if (_3386)
    {
        float _3462 = fma(_3430, _3454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3400 = _3462;
    }
    float _3464 = _3400;
    float _3466 = sqrt(_3368);
    float _3468 = _3464;
    if (_3386)
    {
        float _3470 = _3444 + (-1.0);
        _3456 = _3470;
    }
    float _3472 = _3456;
    float _3474 = _3472;
    if (_3386)
    {
        float _3476 = _3410 * _3464;
        _2938 = _3476;
    }
    float _3478 = _2938;
    if (!_3386)
    {
        _3412 = _3376;
    }
    float _3480 = _3412;
    float _3482 = _3480;
    if (_3386)
    {
        float _3484 = _3472 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3468 = _3484;
    }
    float _3486 = _3468;
    float _3488 = _3486;
    if (_3386)
    {
        float _3490 = _3374 * _3478;
        _3402 = _3490;
    }
    float _3492 = _3402;
    if (!_3386)
    {
        _3474 = _3378;
    }
    float _3494 = _3474;
    float _3496 = _3494;
    if (_3386)
    {
        float _3498 = _3376 * _3478;
        _3482 = _3498;
    }
    float _3500 = _3482;
    if (_3386)
    {
        float _3502 = fma(_3450, _3444, _3486);
        _3460 = _3502;
    }
    float _3504 = _3460;
    if (_3386)
    {
        float _3506 = _3492 * _3492;
        _3496 = _3506;
    }
    float _3508 = _3496;
    if (!_3386)
    {
        _3488 = _3380;
    }
    float _3510 = _3488;
    float _3512 = _3510;
    if (_3386)
    {
        float _3514 = _3500 * _3500;
        _3512 = _3514;
    }
    float _3516 = _3512;
    float _3518 = fma(_3504, _3504, _3508);
    float _3520 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3522 = _3518 + _3516;
    float _3524 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3520);
    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3528 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3526);
    float _3530 = precise::clamp(_3528, 0.0, 1.0);
    float _3532 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3534 = rsqrt(_3522);
    float _3536 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3524);
    float _3538 = -_3530;
    float _3540 = _3538 + 1.0;
    float _3542 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3544 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3532);
    float _3546 = _3266 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3548 = _3536 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3550 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3542);
    float _3552 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3544);
    float _3554 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3546);
    float _3556 = _3548 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3558 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3550);
    float _3560 = _3552 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3562 = abs(_3540);
    float _3564 = log2(_3562);
    float _3566 = -_3556;
    float _3568 = fma(_3566, _3362, 1.0);
    float _3570 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3572 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3574 = _3534 * _3492;
    float _3576 = fma(_3270, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3554);
    float _3578 = _3534 * _3504;
    float _3580 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3572);
    float _3582 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3584 = _3534 * _3500;
    float _3586 = _3576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3588 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3580);
    float _3590 = -_3582;
    float _3592 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3590);
    float _3594 = log2(_3568);
    float _3596 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3598 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3588);
    float _3600 = -_3584;
    float _3602 = fma(_3600, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3592);
    float _3604 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3606 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3608 = fma(_3602, -0.5, 0.5);
    float _3610 = 1.0 / _3598;
    float _3612 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3606);
    float _3614 = fma(_3602, 0.5, 0.5);
    float _3616 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3596);
    float _3618 = _3578 + 1.0;
    float _3620 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3612);
    float _3622 = fma(_3614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3624 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3616);
    float _3626 = exp2(_3604);
    float _3628 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3620);
    float _3630 = fma(_3614, _3622, -0.212114393711090087890625);
    float _3632 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3624);
    float _3634 = _3594 * 0.693147182464599609375;
    float _3636 = sqrt(_3608);
    float _3638 = fma(_3614, _3630, 1.570728778839111328125);
    float _3640 = _3628 * _3610;
    float _3642 = _3632 * _3610;
    float _3644 = _3634 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3646 = fma(_3640, 0.5, 0.5);
    float _3648 = fma(_3642, -0.5, 0.5);
    float _3650 = -_3578;
    float _3652 = fma(_3626, _3618, _3650);
    float3 _9254 = float3(_3646, _3648, _3644);
    float _3654 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9254, float3(0.0), isnan(_9254)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9254, float3(0.0), isnan(_9254)), level(0.0)).x;
    float _3656 = fma(_3652, 0.5, 0.5);
    float _3658 = _3636 * 0.636619746685028076171875;
    float _3660 = -_3638;
    float _3662 = fma(_3658, _3660, 1.0);
    float3 _9275 = float3(_3646, _3648, _3644);
    float4 _3665 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9275, float3(0.0), isnan(_9275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9275, float3(0.0), isnan(_9275)), level(0.0)).xyzw;
    float _3667 = _3665.x;
    float _3669 = _3665.y;
    float _3671 = _3665.z;
    float _3673 = _3665.w;
    float2 _9292 = float2(_3662, _3656);
    float3 _3677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9292, float2(0.0), isnan(_9292)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9292, float2(0.0), isnan(_9292)), level(0.0)).xyz;
    float _3679 = _3677.x;
    float _3681 = _3677.y;
    float _3683 = _3677.z;
    float _3685 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3687 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3689 = _3348 > 0.0;
    bool _3691 = isnan(_3348);
    bool _3693 = _3689 || _3691;
    bool _3695 = isnan(0.0);
    bool _3697 = _3693 || _3695;
    float _3699 = fma(_3570, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3687);
    float _3701 = exp2(_3685);
    float _3703 = _3348 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3705 = fma(_3548, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3699);
    float _3707 = _489 * _3703;
    float _3709 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3705);
    float _3711 = _3709 + _3598;
    out.gl_Position.x = _3628;
    out.gl_Position.y = _3632;
    out.gl_Position.z = _3709;
    out.gl_Position.w = _3598;
    float _3713 = _3711 * 0.5;
    float _3715 = -_3701;
    float _3717 = _3715 + 1.0;
    float _3719 = _3707 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3721 = _3717 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _3713;
    out.m_64.w = _3598;
    out.m_45.x = _3719;
    float _3723 = _3721 * _3654;
    float _3725 = -_3721;
    float _3727 = _3725 + 1.0;
    float _3729 = _3673 * _3723;
    float _3731 = _3683 * _3723;
    float _3733 = fma(_3679, _3729, _3667);
    float _3735 = fma(_3681, _3729, _3669);
    float _3737 = _3673 * _3727;
    float _3739 = fma(_3673, _3731, _3671);
    out.m_66.x = _3733;
    out.m_66.y = _3735;
    out.m_66.z = _3739;
    out.m_66.w = _3737;
    if (_3697)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3741 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3741;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

