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
    constant _16* vp_c13 [[id(4)]];
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
    float4 m_68 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3625 = false;
    bool _3407 = false;
    bool _637 = false;
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
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
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
        float _3910 = as_type<float>(_123);
        out.gl_Position.z = _3910;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3984 = as_type<float>(_163);
        out.gl_Position.z = _3984;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _165 * _165;
    float _193 = _167 * _167;
    float _195 = fma(_173, _173, _191);
    float _197 = fma(_175, _175, _193);
    float _199 = fma(_179, _179, _195);
    float _201 = _169 * _169;
    float _203 = fma(_181, _181, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_177, _177, _201);
    float _209 = fma(_183, _183, _207);
    float _211 = sqrt(_203);
    float _213 = sqrt(_209);
    bool _215 = _205 > 0.0;
    float _217 = as_type<float>(int(gl_VertexIndex));
    bool _219 = _211 > 0.0;
    float _221 = 0.0;
    float _223 = _203;
    float _225 = _171;
    if (_215)
    {
        float _227 = rsqrt(_199);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = 0.0;
    if (!_215)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _213 > 0.0;
    float _237 = 0.0;
    float _239 = _233;
    if (!_215)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = 0.0;
    float _245 = _241;
    if (!_219)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    float _249 = 0.0;
    float _251 = _247;
    if (_219)
    {
        float _253 = rsqrt(_203);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = 0.0;
    if (!_219)
    {
        _257 = 0.0;
    }
    float _259 = _257;
    int _261 = as_type<int>(_217) & 1;
    bool _263 = _261 != 0;
    int _265 = as_type<int>(_217) & 2;
    bool _267 = _265 != 0;
    bool _269 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _273 = _269 || _271;
    bool _275 = isnan(1.0);
    bool _277 = _273 || _275;
    float _279 = _209;
    float _281 = _217;
    float _283 = _259;
    if (_235)
    {
        float _285 = rsqrt(_209);
        _279 = _285;
    }
    float _287 = _279;
    if (!_215)
    {
        _281 = 0.0;
    }
    float _289 = _281;
    float _291 = _289;
    float _293 = _229;
    if (_215)
    {
        float _295 = _229 * _173;
        _239 = _295;
    }
    float _297 = _239;
    if (_215)
    {
        float _299 = _229 * _165;
        _245 = _299;
    }
    float _301 = _245;
    if (_215)
    {
        float _303 = _229 * _179;
        _291 = _303;
    }
    float _305 = _291;
    float _307 = 0.0;
    if (!_235)
    {
        _307 = 0.0;
    }
    float _309 = _307;
    float _311 = 0.0;
    float _313 = _309;
    if (!_235)
    {
        _311 = 0.0;
    }
    float _315 = _311;
    float _317 = _315;
    if (_219)
    {
        float _319 = _255 * _175;
        _251 = _319;
    }
    float _321 = _251;
    if (!_235)
    {
        _293 = 0.0;
    }
    float _323 = _293;
    float _325 = _323;
    if (_219)
    {
        float _327 = _255 * _167;
        _283 = _327;
    }
    float _329 = _283;
    if (!_219)
    {
        _223 = 0.0;
    }
    float _331 = _223;
    float _333 = 0.0;
    float _335 = _331;
    if (!_277)
    {
        float _337 = _171 * _171;
        float _339 = _337 * 0.5;
        _333 = _339;
    }
    float _341 = _333;
    float _343 = _341;
    if (_219)
    {
        float _345 = _255 * _181;
        _335 = _345;
    }
    float _347 = _335;
    bool _349 = !_267;
    float _351 = _349 ? (-0.5) : 0.5;
    if (_235)
    {
        float _353 = _287 * _177;
        _313 = _353;
    }
    float _355 = _313;
    if (_235)
    {
        float _357 = _287 * _169;
        _317 = _357;
    }
    float _359 = _317;
    if (_235)
    {
        float _361 = _287 * _183;
        _325 = _361;
    }
    float _363 = _325;
    bool _365 = !_263;
    float _367 = _365 ? (-0.5) : 0.5;
    float _369 = _363;
    if (!_277)
    {
        float _371 = _341 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _343 = _371;
    }
    float _373 = _343;
    bool _375 = !_277;
    float _377 = _373;
    if (!_375)
    {
        float _379 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _381 = log2(_379);
        float _383 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _385 = _383 + 1.0;
        float _387 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _389 = _171 * _381;
        float _391 = 1.0 / _385;
        float _393 = _387 * 0.693147182464599609375;
        float _395 = exp2(_389);
        float _397 = 1.0 / _393;
        float _399 = _395 + (-1.0);
        float _401 = -_399;
        float _403 = fma(_401, _397, _171);
        float _405 = _403 * _391;
        float _407 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _377 = _407;
    }
    float _409 = _377;
    float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _413 = !_277;
    float _415 = _411;
    if (!_413)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _171 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _225 = _435;
    }
    float _437 = _225;
    float _439 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = _411 * _301;
    float _443 = _411 * _329;
    float _445 = _411 * _359;
    float _447 = _445;
    if (!_277)
    {
        float _449 = _143 * _143;
        float _451 = _449 * 0.5;
        _415 = _451;
    }
    float _453 = _415;
    float _455 = fma(_439, _297, _441);
    float _457 = fma(_439, _321, _443);
    float _459 = fma(_439, _355, _445);
    if (!_277)
    {
        float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _447 = _461;
    }
    float _463 = _447;
    bool _465 = !_277;
    float _467 = _463;
    if (!_465)
    {
        float _469 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _471 = log2(_469);
        float _473 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _475 = _473 + 1.0;
        float _477 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _479 = _143 * _471;
        float _481 = 1.0 / _475;
        float _483 = _477 * 0.693147182464599609375;
        float _485 = exp2(_479);
        float _487 = 1.0 / _483;
        float _489 = _485 + (-1.0);
        float _491 = -_489;
        float _493 = fma(_491, _487, _143);
        float _495 = _493 * _481;
        float _497 = _495 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _467 = _497;
    }
    float _499 = _467;
    float _501 = in.m_64.w;
    float _503 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _505 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _507 = in.m_44.x;
    float _509 = in.m_44.y;
    float _511 = in.m_44.z;
    float _513 = _503 * _329;
    float _515 = _503 * _301;
    float _517 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _519 = _503 * _359;
    float _521 = fma(_505, _305, _455);
    float _523 = fma(_505, _347, _457);
    float _525 = fma(_517, _297, _515);
    float _527 = fma(_517, _321, _513);
    float _529 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _531 = fma(_517, _355, _519);
    float _533 = fma(_505, _363, _459);
    float _535 = fma(_437, _185, _521);
    float _537 = fma(_529, _305, _525);
    float _539 = fma(_529, _347, _527);
    float _541 = fma(_529, _363, _531);
    float _543 = fma(_437, _187, _523);
    float _545 = fma(_437, _189, _533);
    if (!_277)
    {
        _369 = _143;
    }
    float _547 = _369;
    bool _549 = !_277;
    float _551 = _547;
    if (!_549)
    {
        float _553 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _555 = log2(_553);
        float _557 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _559 = _557 + 1.0;
        float _561 = 1.0 / _559;
        float _563 = _143 * _555;
        float _565 = exp2(_563);
        float _567 = -_565;
        float _569 = _567 + 1.0;
        float _571 = _569 * _561;
        _551 = _571;
    }
    float _573 = _551;
    float _575 = fma(_573, _187, _539);
    bool _577 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _579 = fma(_573, _185, _537);
    float _581 = fma(_573, _189, _541);
    float _583 = -_575;
    float _585 = _543 + _583;
    float _587 = fma(_543, _501, _509);
    float _589 = -_579;
    float _591 = _535 + _589;
    float _593 = -_581;
    float _595 = _545 + _593;
    float _597 = _585 * _175;
    float _599 = _585 * _167;
    float _601 = _585 * _181;
    float _603 = fma(_535, _501, _507);
    float _605 = fma(_591, _173, _597);
    float _607 = fma(_591, _165, _599);
    float _609 = fma(_591, _179, _601);
    float _611 = fma(_545, _501, _511);
    float _613 = fma(_595, _177, _605);
    float _615 = fma(_595, _169, _607);
    float _617 = fma(_595, _183, _609);
    bool _619 = !_577;
    float _635;
    if (!_619)
    {
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _623 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _635 = _633;
        _637 = true;
    }
    else
    {
        float _639 = float(_107);
        float _641 = 1.0 / _639;
        float _643 = _143 * _641;
        _635 = _643;
    }
    _637 = false;
    float _645 = _635;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _649 = int(_647);
    float _651 = float(_107);
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _655 = _653 != 0;
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _659 = int(_657);
    bool _661 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _663 = isnan(_645);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _675 = int(_673);
    float _677 = float(_649);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _679;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _687 = 1.0 / _677;
    float _689 = float(_659);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _697 = int(_695);
    float _699 = float(uint(_675));
    int _701 = ~_675;
    int _703 = _701 + 1;
    int _705 = ~_675;
    int _707 = _705 + 1;
    bool _709 = _675 == 0;
    float _711 = 1.0 / _689;
    float _713 = _687 * _143;
    float _715 = 1.0 / _699;
    float _717 = float(uint(_697));
    float _719 = float(_697);
    float _721 = trunc(_713);
    int _723 = int(_721);
    float _725 = _711 * _143;
    float _727 = 1.0 / _717;
    int _729 = as_type<int>(_715) + (-2);
    float _731 = trunc(_725);
    int _733 = int(_731);
    float _735 = float(uint(_723));
    float _737 = float(_723);
    float _739 = as_type<float>(_729) * _735;
    int _741 = as_type<int>(_727) + (-2);
    float _743 = 1.0 / _651;
    int _745 = ~_697;
    int _747 = _745 + 1;
    float _749 = float(uint(_733));
    float _751 = trunc(_739);
    float _753 = precise::max(_751, 0.0);
    uint _756 = uint(_753);
    float _758 = float(_733);
    float _760 = as_type<float>(_741) * _749;
    bool _762 = _758 >= _719;
    bool _764 = isnan(_758);
    bool _766 = _762 || _764;
    bool _768 = isnan(_719);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = in.m_51.y;
    float _776 = trunc(_760);
    float _778 = precise::max(_776, 0.0);
    uint _780 = uint(_778);
    float _782 = _743 * _143;
    int _784 = _703 * int(_756);
    int _786 = _784 + _723;
    float _788 = _760;
    int _790 = _729;
    if (_655)
    {
        _788 = 1.0;
    }
    float _792 = _788;
    float _794 = trunc(_772);
    int _796 = int(_794);
    float _798 = _792;
    if (!_655)
    {
        _798 = 7.345489978790283203125;
    }
    float _800 = _798;
    float _802 = float(uint(_786));
    int _804 = _747 * int(_780);
    int _806 = _804 + _733;
    float _808 = _800 * _129;
    float _810 = as_type<float>(_729) * _802;
    float _812 = _802;
    float _814 = as_type<float>(_806);
    if (_655)
    {
        _812 = 1.0;
    }
    float _816 = _812;
    float _818 = float(uint(_806));
    float _820 = _774 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _822 = _816;
    if (_655)
    {
        _814 = _129;
    }
    float _824 = _814;
    float _826 = trunc(_810);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    float _832 = _824;
    if (!_655)
    {
        _822 = 1.2345600128173828125;
    }
    float _834 = _822;
    float _836 = as_type<float>(_741) * _818;
    if (!_655)
    {
        _832 = _774;
    }
    float _838 = _832;
    float _840 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[78].w, _693);
    float _842 = trunc(_836);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = _834 * _838;
    float _850 = floor(_848);
    int _852 = int(_756) + int(_830);
    int _854 = ~_697;
    int _856 = _854 + 1;
    float _858 = floor(_808);
    int _860 = int(_780) + int(_846);
    int _862 = _707 * _852;
    int _864 = _862 + _723;
    float _866 = float(_675);
    bool _868 = _737 >= _866;
    bool _870 = isnan(_737);
    bool _872 = _868 || _870;
    bool _874 = isnan(_866);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -_850;
    float _882 = _848 + _880;
    bool _884 = uint(_864) >= uint(_675);
    int _886 = _856 * _860;
    int _888 = _886 + _733;
    float _890 = trunc(_878);
    int _892 = int(_890);
    bool _894 = !_884;
    int _896 = _894 ? 0 : (-1);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _900 = _898 != 0;
    float _902 = -_858;
    float _904 = _808 + _902;
    int _906 = ~_852;
    int _908 = _906 + _896;
    int _910 = _908 + 1;
    bool _912 = !_900;
    int _914 = _912 ? 0 : 1;
    float _916 = _904 * _866;
    bool _918 = uint(_888) >= uint(_697);
    float _920 = _866 * _782;
    int _922 = abs(_914);
    float _924 = trunc(_916);
    int _926 = int(_924);
    int _928 = _675 * _910;
    int _930 = _928 + _723;
    float _932 = _882 * _719;
    int _934 = ~_892;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    float _940 = _719 * _782;
    bool _942 = !_709;
    int _944 = _942 ? _930 : (-1);
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _948 = _946 != 0;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _952 = _950 != 0;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _956 = _954 != 0;
    float _958 = trunc(_920);
    int _960 = int(_958);
    bool _962 = !_918;
    int _964 = _962 ? 0 : (-1);
    int _966 = _675 + (-1);
    int _968 = ~_860;
    int _970 = _968 + _964;
    int _972 = _970 + 1;
    int _974 = _944 * _938;
    bool _976 = !_952;
    int _978 = _976 ? 0 : 1;
    int _980 = _926 * _922;
    int _982 = _980 + _723;
    bool _984 = _697 == 0;
    int _986 = _697 * _972;
    int _988 = _986 + _733;
    int _990 = abs(_978);
    int _992 = _892 * _966;
    int _994 = _992 + _974;
    int _996 = ~_796;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    float _1002 = trunc(_932);
    int _1004 = int(_1002);
    bool _1006 = !_984;
    int _1008 = _1006 ? _988 : (-1);
    int _1010 = _994 * _990;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1014 = _1012 != 0;
    int _1016 = _1008 * _1000;
    bool _1018 = !_1014;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = trunc(_940);
    int _1024 = int(_1022);
    bool _1026 = !_948;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = abs(_1020);
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1034 = _1032 != 0;
    int _1036 = _697 + (-1);
    int _1038 = _1004 * _1030;
    int _1040 = _1038 + _733;
    int _1042 = abs(_1028);
    bool _1044 = !_956;
    int _1046 = _1044 ? 0 : 1;
    int _1048 = _796 * _1036;
    int _1050 = _1048 + _1016;
    bool _1052 = !_1034;
    int _1054 = _1052 ? 0 : 1;
    int _1056 = _960 * _1042;
    int _1058 = _1056 + _1010;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1070 = _1068 != 0;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1074 = _1072 != 0;
    int _1076 = abs(_1046);
    int _1078 = abs(_1054);
    bool _1080 = !_1066;
    int _1082 = _1080 ? 0 : 1;
    int _1084 = abs(_1082);
    bool _1086 = !_1062;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = _982 * _1076;
    int _1092 = _1090 + _1058;
    bool _1094 = !_1070;
    int _1096 = _1094 ? 0 : 1;
    int _1098 = _926 * _1078;
    int _1100 = _1098 + _1092;
    int _1102 = abs(_1088);
    int _1104 = _1050 * _1084;
    bool _1106 = !_1074;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = in.m_51.w;
    float _1112 = float(uint(_1100));
    int _1114 = abs(_1096);
    float _1116 = as_type<float>(_729) * _1112;
    int _1118 = abs(_1108);
    int _1120 = _1024 * _1102;
    int _1122 = _1120 + _1104;
    float _1124 = trunc(_1116);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    int _1130 = ~_697;
    int _1132 = _1130 + 1;
    int _1134 = _1040 * _1114;
    int _1136 = _1134 + _1122;
    bool _1138 = _675 == 0;
    int _1140 = _1004 * _1118;
    int _1142 = _1140 + _1136;
    int _1144 = ~_675;
    int _1146 = _1144 + 1;
    float _1148 = float(uint(_1142));
    float _1150 = as_type<float>(_741) * _1148;
    int _1152 = _1146 * int(_1128);
    int _1154 = _1152 + _1100;
    float _1156 = trunc(_1150);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    float _1162 = float(uint(_1154));
    float _1164 = as_type<float>(_729) * _1162;
    float _1166 = trunc(_1164);
    float _1168 = precise::max(_1166, 0.0);
    uint _1170 = uint(_1168);
    int _1172 = _1132 * int(_1160);
    int _1174 = _1172 + _1142;
    int _1176 = ~_697;
    int _1178 = _1176 + 1;
    float _1180 = float(uint(_1174));
    int _1182 = ~_675;
    int _1184 = _1182 + 1;
    float _1186 = as_type<float>(_741) * _1180;
    int _1188 = int(_1128) + int(_1170);
    float _1190 = trunc(_1186);
    float _1192 = precise::max(_1190, 0.0);
    uint _1194 = uint(_1192);
    int _1196 = _1184 * _1188;
    int _1198 = _1196 + _1100;
    bool _1200 = uint(_1198) >= uint(_675);
    float _1202 = _587 * _167;
    bool _1204 = !_1200;
    int _1206 = _1204 ? 0 : (-1);
    int _1208 = ~_1188;
    int _1210 = _1208 + _1206;
    int _1212 = _1210 + 1;
    float _1214 = _587 * _181;
    int _1216 = int(_1160) + int(_1194);
    int _1218 = _675 * _1212;
    int _1220 = _1218 + _1100;
    int _1222 = _1178 * _1216;
    int _1224 = _1222 + _1142;
    float _1226 = float(uint(_982));
    bool _1228 = !_1138;
    int _1230 = _1228 ? _1220 : (-1);
    bool _1232 = uint(_1224) >= uint(_697);
    float _1234 = as_type<float>(_729) * _1226;
    int _1236 = _1230 & 3;
    bool _1238 = _1236 != 0;
    bool _1240 = !_1232;
    int _1242 = _1240 ? 0 : (-1);
    float _1244 = trunc(_1234);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    bool _1250 = uint(_1236) > 1u;
    int _1252 = ~_1216;
    int _1254 = _1252 + _1242;
    int _1256 = _1254 + 1;
    int _1258 = _1230 & 3;
    bool _1260 = _1258 != 0;
    bool _1262 = uint(_1236) >= 2u;
    int _1264 = _697 * _1256;
    int _1266 = _1264 + _1142;
    int _1268 = _1260 ? 0 : 1;
    float _1270 = float(uint(_1040));
    bool _1272 = !_984;
    int _1274 = _1272 ? _1266 : (-1);
    int _1276 = ~_1268;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    float _1282 = as_type<float>(_741) * _1270;
    int _1284 = _1280;
    float _1286 = _1202;
    float _1288 = _1110;
    if (!_1250)
    {
        int _1290 = ~_1268;
        int _1292 = _1290 + 1;
        _1284 = _1292;
    }
    int _1294 = _1284;
    int _1296 = _1274 & 3;
    bool _1298 = _1296 != 0;
    float _1300 = trunc(_1282);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    int _1306 = _1274 & 3;
    bool _1308 = _1306 != 0;
    int _1310 = _1298 ? 0 : 1;
    bool _1312 = _1236 != 3;
    int _1314 = _1262 ? 0 : 1;
    bool _1316 = uint(_1306) > 1u;
    int _1318 = ~_675;
    int _1320 = _1318 + 1;
    int _1322 = ~_1314;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    int _1328 = ~_1310;
    int _1330 = _1328 + 1;
    int _1332 = _1330 + 1;
    int _1334 = _1320 * int(_1248);
    int _1336 = _1334 + _982;
    float _1338 = _129 * 2.0;
    int _1340 = _1326;
    int _1342 = _1332;
    if (_1312)
    {
        int _1344 = ~_1314;
        int _1346 = _1344 + 1;
        _1340 = _1346;
    }
    int _1348 = _1340;
    bool _1350 = _1306 != 3;
    float _1352 = in.m_51.z;
    if (!_1316)
    {
        int _1354 = ~_1310;
        int _1356 = _1354 + 1;
        _1342 = _1356;
    }
    int _1358 = _1342;
    float _1360 = floor(_1338);
    bool _1362 = uint(_1306) >= 2u;
    int _1364 = ~_697;
    int _1366 = _1364 + 1;
    int _1368 = _1362 ? 0 : 1;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1372 = _1370 != 0;
    int _1374 = _1366 * int(_1304);
    int _1376 = _1374 + _1040;
    int _1378 = ~_1368;
    int _1380 = _1378 + 1;
    int _1382 = _1380 + 1;
    float _1384 = _587 * _175;
    float _1386 = float(uint(_1336));
    float _1388 = fma(_603, _165, _1202);
    int _1390 = _1382;
    float _1392 = _1384;
    if (_1350)
    {
        int _1394 = ~_1368;
        int _1396 = _1394 + 1;
        _1390 = _1396;
    }
    int _1398 = _1390;
    bool _1400 = _129 > 0.5;
    float _1402 = as_type<float>(_729) * _1386;
    float _1404 = float(uint(_1376));
    float _1406 = fma(_611, _169, _1388);
    int _1408 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1410 = _1408 != 0;
    float _1412 = _774 * 2.0;
    float _1414 = -_367;
    int _1416 = _1400 ? as_type<int>(_1414) : as_type<int>(_367);
    float _1418 = as_type<float>(_741) * _1404;
    bool _1420 = _774 > 0.5;
    float _1422 = trunc(_1402);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    bool _1428 = !_1410;
    float _1430 = _1428 ? _367 : as_type<float>(_1416);
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1434 = _1432 != 0;
    float _1436 = -_351;
    int _1438 = _1420 ? as_type<int>(_1436) : as_type<int>(_351);
    float _1440 = _1430 + 0.5;
    bool _1442 = _1360 > 0.0;
    float _1444 = trunc(_1418);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    bool _1450 = _1352 > 0.5;
    bool _1452 = !_1434;
    float _1454 = _1452 ? _351 : as_type<float>(_1438);
    bool _1456 = _1360 >= 0.0;
    bool _1458 = isnan(_1360);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = -_367;
    int _1468 = _1450 ? as_type<int>(_1466) : as_type<int>(_367);
    float _1470 = floor(_1412);
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1474 = _1472 != 0;
    int _1476 = _1464 ? 0 : 1;
    float _1478 = _1454;
    if (_1372)
    {
        _790 = 0;
    }
    int _1480 = _790;
    bool _1482 = _1110 > 0.5;
    int _1484 = _1480;
    if (!_1372)
    {
        _1484 = 1;
    }
    int _1486 = _1484;
    bool _1488 = !_1474;
    float _1490 = _1488 ? _367 : as_type<float>(_1468);
    float _1492 = fma(_603, _173, _1384);
    int _1494 = ~_1476;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    float _1500 = fma(_603, _179, _1214);
    float _1502 = -_351;
    int _1504 = _1482 ? as_type<int>(_1502) : as_type<int>(_351);
    bool _1506 = _1486 != 1;
    float _1508 = fma(_611, _183, _1500);
    int _1510 = _1498;
    if (!_1442)
    {
        int _1512 = ~_1476;
        int _1514 = _1512 + 1;
        _1510 = _1514;
    }
    int _1516 = _1510;
    int _1518 = ~_675;
    int _1520 = _1518 + 1;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1524 = _1522 != 0;
    int _1526 = ~_697;
    int _1528 = _1526 + 1;
    int _1530 = int(_1304) + int(_1448);
    int _1532 = int(_1248) + int(_1426);
    int _1534 = _1528 * _1530;
    int _1536 = _1534 + _1040;
    bool _1538 = _1470 > 0.0;
    bool _1540 = !_1524;
    float _1542 = _1540 ? _351 : as_type<float>(_1504);
    int _1544 = _1520 * _1532;
    int _1546 = _1544 + _982;
    bool _1548 = _1470 >= 0.0;
    bool _1550 = isnan(_1470);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    int _1558 = _1556 ? 0 : 1;
    float _1560 = as_type<float>(_1520);
    if (!_1506)
    {
        _1286 = _774;
    }
    float _1562 = _1286;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1564;
    float _1568 = _1562;
    if (!_1506)
    {
        _1288 = _774;
    }
    float _1570 = _1288;
    float _1572 = _1570;
    if (!_1506)
    {
        _1560 = _1352;
    }
    float _1574 = _1560;
    float _1576 = _1574;
    if (!_1506)
    {
        _1392 = _1352;
    }
    float _1578 = _1392;
    float _1580 = 1.0 / _1566;
    float _1582 = _1578;
    if (_1506)
    {
        _1568 = _129;
    }
    float _1584 = _1568;
    if (_1506)
    {
        _1572 = _129;
    }
    float _1586 = _1572;
    if (_1506)
    {
        _1576 = _774;
    }
    float _1588 = _1576;
    if (_1506)
    {
        _1582 = _774;
    }
    float _1590 = _1582;
    float _1592 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[83].z, _683);
    bool _1594 = uint(_1536) >= uint(_697);
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1598 = _1596 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1600 = uint(_1546) >= uint(_675);
    float _1602 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1604 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1592);
    int _1606 = ~_1558;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    float _1612 = 1.0 / _1598;
    bool _1614 = !_1594;
    int _1616 = _1614 ? 0 : (-1);
    int _1618 = _1610;
    if (!_1538)
    {
        int _1620 = ~_1558;
        int _1622 = _1620 + 1;
        _1618 = _1622;
    }
    int _1624 = _1618;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1628 = _645 + _1626;
    bool _1630 = !_1600;
    int _1632 = _1630 ? 0 : (-1);
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1644 = _1642 != 0;
    float _1646 = fma(_611, _177, _1492);
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1650 = _1648 != 0;
    float _1652 = in.m_57.w;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1656 = _1654 != 0;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1660;
    float _1664 = _1352 * 2.0;
    float _1666 = in.m_59.w;
    float _1668 = -_1658;
    float _1670 = fma(_1602, 2.0, _1668);
    float _1672 = 1.0 / _1662;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1676 = _645 + _1674;
    float _1678 = in.m_55.w;
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1682 = _645 + _1680;
    float _1684 = _1676 * _1612;
    bool _1686 = !_1640;
    int _1688 = _1686 ? 0 : 1;
    float _1690 = -_143;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1670);
    float _1694 = floor(_1664);
    float _1696 = _1628 * _1580;
    float _1698 = _129 + _774;
    float _1700 = _129 + _1352;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1704 = fma(_681, _1696, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1706 = _1698 + (-1.0);
    bool _1708 = !_1636;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = _1682 * _1672;
    float _1714 = _1352 + _774;
    float _1716 = _1646 + _1652;
    float _1718 = _1700 + (-1.0);
    bool _1720 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1722 = isnan(_645);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = _1714 + (-1.0);
    float _1734 = _1508 + _1666;
    bool _1736 = _1694 >= 0.0;
    bool _1738 = isnan(_1694);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan(0.0);
    bool _1744 = _1740 || _1742;
    float _1746 = fma(_820, -2.0, _1702);
    float _1748 = _1406 + _1678;
    bool _1750 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1752 = isnan(_645);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1764 = -_1730;
    float _1766 = _1764 + 1.0;
    int _1768 = _1744 ? 0 : 1;
    float _1770 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1772 = _1694 > 0.0;
    bool _1774 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1776 = isnan(_645);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = _1760 * _1766;
    float _1788 = -_1760;
    float _1790 = _1788 + 1.0;
    int _1792 = abs(_1688);
    float _1794 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1796 = _671 * _1790;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1798;
    float _1802 = -_671;
    float _1804 = _1802 + 1.0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1812 = _1810 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1814 = fma(_1800, _1696, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1816 = _1784 * _1804;
    float _1818 = fma(_1808, _1684, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1820 = fma(_1812, _1684, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1822 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1746);
    float _1824 = _1454 + (-0.5);
    float _1826 = -_1784;
    float _1828 = _1826 + 1.0;
    float _1830 = _1814 * _1816;
    float _1832 = _1704 * _1816;
    float _1834 = -_1824;
    float _1836 = -_1822;
    float _1838 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1836);
    float _1840 = float(_1516);
    float _1842 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1830);
    float _1844 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1832);
    float _1846 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1848 = _1230 >> 31;
    float _1850 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1692);
    float _1852 = fma(_1820, _1796, _1844);
    int _1854 = ~_1768;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    float _1860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1862 = log2(_1860);
    int _1864 = _1848 & 3;
    float _1866 = fma(_1846, -2.0, _685);
    int _1868 = _1858;
    float _1870 = _1716;
    if (!_1772)
    {
        int _1872 = ~_1768;
        int _1874 = _1872 + 1;
        _1868 = _1874;
    }
    int _1876 = _1868;
    float _1878 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1880 = _1274 >> 31;
    float _1882 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1866);
    int _1884 = _1230 + _1864;
    float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1888 = _1748 + _1886;
    int _1890 = _1880 & 3;
    float _1892 = -_691;
    float _1894 = fma(_1878, 2.0, _1892);
    int _1896 = _1884 >> 2;
    float _1898 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1900 = float(_1792);
    float _1902 = -_143;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1894);
    int _1906 = _1274 + _1890;
    float _1908 = _1862 * _143;
    int _1910 = _1896 << 4;
    int _1912 = _1910 + 368;
    float _1914 = _1900 * _1840;
    int _1916 = _1906 >> 2;
    float _1918 = exp2(_1908);
    uint _1920 = uint(int(uint(_1912) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1938 = _1716 + _1936;
    int _1940 = _1916 << 4;
    int _1942 = _1940 + 512;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1946 = !_1644;
    int _1948 = _1946 ? 0 : 1;
    uint _1950 = uint(int(uint(_1942) >> uint(2)));
    uint _1952 = uint(int(uint(int(_1950)) >> uint(2)));
    int _1954 = int(_1950) & 3;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[int(_1952)][_1954];
    int _1958 = int(_1950) + 1;
    uint _1960 = uint(int(uint(_1958) >> uint(2)));
    int _1962 = _1958 & 3;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[int(_1960)][_1962];
    float _1966 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1898);
    float _1968 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1944);
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1972 = 1.0 + _1970;
    int _1974 = abs(_1948);
    int _1976 = abs(_1710);
    float _1978 = -_1918;
    float _1980 = _1978 + 1.0;
    int _1982 = _1942 + 8;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    uint _1986 = uint(int(uint(int(_1984)) >> uint(2)));
    int _1988 = int(_1984) & 3;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[int(_1986)][_1988];
    int _1992 = int(_1984) + 1;
    uint _1994 = uint(int(uint(_1992) >> uint(2)));
    int _1996 = _1992 & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    float _2000 = float(_1624);
    float _2002 = 1.0 / _1972;
    float _2004 = float(_1974);
    float _2006 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1968);
    float _2008 = float(_1876);
    int _2010 = _1912 + 8;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    bool _2028 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2030 = isnan(1.0);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2036 = _2032 || _2034;
    float _2038 = _2004 * _2000;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _1734 + _2040;
    bool _2044 = !_1238;
    int _2046 = _2044 ? 0 : 1;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2050 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2052 = isnan(0.0);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2058 = _2054 || _2056;
    float _2060 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1966);
    int _2062 = ~_1530;
    int _2064 = _2062 + _1616;
    int _2066 = _2064 + 1;
    float _2068 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2048);
    float _2070 = _2058 ? _1980 : 0.0;
    bool _2072 = _2060 >= 0.0;
    float _2074 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2068);
    float _2076 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _840);
    int _2078 = as_type<int>(_1888);
    if (_2036)
    {
        float _2080 = _2070 * _2002;
        _145 = _2080;
    }
    float _2082 = _145;
    int _2084 = ~_1532;
    int _2086 = _2084 + _1632;
    int _2088 = _2086 + 1;
    float _2090 = _1490 + 0.5;
    int _2092 = abs(_1294);
    int _2094 = _697 * _2066;
    int _2096 = _2094 + _1040;
    bool _2098 = !_1308;
    int _2100 = _2098 ? 0 : 1;
    float _2102 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1904);
    int _2104 = ~_2092;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = _675 * _2088;
    int _2112 = _2110 + _982;
    int _2114 = abs(_1358);
    float _2116 = _1542 + (-0.5);
    int _2118 = abs(_2100);
    int _2120 = _2108 * as_type<int>(_1934);
    int _2122 = abs(_2046);
    float _2124 = -_2116;
    float _2126 = -_1882;
    float _2128 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2126);
    if (_2072)
    {
        out.m_47.x = 0.0;
    }
    int _2130 = abs(_1348);
    int _2132 = ~_2114;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    int _2138 = abs(_1398);
    int _2140 = ~_2122;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    int _2146 = _2136 * as_type<int>(_1964);
    int _2148 = ~_2118;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = _2144 * as_type<int>(_1926);
    int _2156 = _2154 + _2120;
    bool _2158 = _1236 != 3;
    int _2160 = _2152 * as_type<int>(_1956);
    int _2162 = _2160 + _2146;
    bool _2164 = !_2158;
    int _2166 = _2164 ? 0 : (-1);
    int _2168 = ~_2138;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    bool _2174 = _1306 != 3;
    int _2176 = ~_2130;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    int _2182 = _2172 * as_type<int>(_1990);
    int _2184 = _2182 + _2162;
    bool _2186 = !_2174;
    int _2188 = _2186 ? 0 : (-1);
    float _2190 = _1888 * _1888;
    int _2192 = abs(_2166);
    int _2194 = _2180 * as_type<int>(_2018);
    int _2196 = _2194 + _2156;
    bool _2198 = !_1650;
    int _2200 = _2198 ? 0 : 1;
    float _2202 = fma(_1938, _1938, _2190);
    bool _2204 = !_1656;
    int _2206 = _2204 ? 0 : 1;
    float _2208 = in.m_66.x;
    float _2210 = in.m_66.y;
    float _2212 = in.m_66.z;
    int _2214 = abs(_2188);
    float _2216 = fma(_2042, _2042, _2202);
    int _2218 = ~_2192;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = abs(_2200);
    int _2226 = abs(_2206);
    int _2228 = _2222 * as_type<int>(_2026);
    int _2230 = _2228 + _2196;
    int _2232 = ~_2214;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = ~_2224;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = _2236 * as_type<int>(_1998);
    int _2246 = _2244 + _2184;
    bool _2248 = _675 == 0;
    int _2250 = _2230 * _2242;
    int _2252 = ~_2226;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    float _2258 = rsqrt(_2216);
    bool _2260 = _697 == 0;
    float _2262 = _129 + (-0.5);
    bool _2264 = !_2248;
    int _2266 = _2264 ? _2112 : (-1);
    int _2268 = _2246 * _2256;
    bool _2270 = !_2260;
    int _2272 = _2270 ? _2096 : (-1);
    float _2274 = -_2076;
    float _2276 = _2274 + 1.0;
    float _2278 = float(_1976);
    int _2280 = _2266 * _2224;
    int _2282 = _2280 + _2250;
    float _2284 = -_2074;
    float _2286 = _2284 + 1.0;
    int _2288 = _2272 * _2226;
    int _2290 = _2288 + _2268;
    float _2292 = fma(_1454, _2276, _1838);
    float _2294 = -_1604;
    float _2296 = _2294 + 1.0;
    float _2298 = -_2006;
    float _2300 = _2298 + 1.0;
    if (_2072)
    {
        _1478 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2302 = _1478;
    float _2304 = _2278 * _2008;
    float _2306 = _1888 * _2258;
    float _2308 = -_2286;
    float _2310 = fma(_1430, _2308, _1850);
    float _2312 = -_2296;
    float _2314 = fma(_1490, _2312, _2102);
    float _2316 = fma(_1542, _2300, _2128);
    float _2318 = -_2306;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1888);
    float _2322 = _2304 * (-2.0);
    float _2324 = _1938 * _2258;
    if (_2072)
    {
        float _2326 = _2302 * 5.0;
        _2078 = as_type<int>(_2326);
    }
    int _2328 = _2078;
    float _2330 = float(_2282);
    float _2332 = fma(_2322, _2208, _2208);
    float _2334 = float(_2290);
    float _2336 = -_2324;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1938);
    float _2340 = _2320 * _2320;
    if (_2072)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7080 = as_type<float>(_2328);
        out.gl_Position.z = _7080;
    }
    float _2342 = fma(_1794, _2322, _1794);
    float _2344 = fma(_2262, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2332);
    float _2346 = fma(_2338, _2338, _2340);
    out.m_68.x = _2310;
    out.m_68.y = _2292;
    out.m_68.z = _2314;
    out.m_68.w = _2316;
    float _2348 = _2042 * _2258;
    out.m_70.x = _2330;
    out.m_70.y = _2334;
    if (_2072)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2350 = -_2306;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1748);
    float _2354 = -_2324;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1716);
    float _2358 = -_2348;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1734);
    float _2362 = _1914 * (-2.0);
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2366 = _2352 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2370 = _2356 + _2368;
    float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2374 = _2360 + _2372;
    float _2376 = _774 + (-0.5);
    float _2378 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2380 = fma(_2362, _2210, _2210);
    float _2382 = fma(_1762, _2362, _1762);
    float _2384 = -_2348;
    float _2386 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2042);
    float _2388 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2378);
    float _2390 = fma(_2376, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2380);
    float _2392 = fma(_2342, _2082, _2344);
    float _2394 = fma(_2386, _2386, _2346);
    float _2396 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2388);
    float _2398 = _2038 * (-2.0);
    float _2400 = fma(_2382, _2082, _2390);
    float _2402 = _1352 + (-0.5);
    float _2404 = fma(_1770, _2398, _1770);
    bool _2406 = _2396 >= 0.0;
    float _2408 = fma(_2398, _2212, _2212);
    float _2410 = _2400 * 0.15915493667125701904296875;
    float _2412 = in.m_64.x;
    float _2414 = in.m_64.y;
    float _2416 = _2392 * 0.15915493667125701904296875;
    float _2418 = fma(_2402, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2408);
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2420;
    float _2424 = _2410 * 6.283185482025146484375;
    float _2426 = sin(_2424);
    float _2428 = fma(_1818, _1796, _1842);
    float _2430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2430;
    float _2434 = fma(_2422, _1712, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2436 = fma(_2404, _2082, _2418);
    float _2438 = _2408;
    float _2440 = _2366;
    if (_2406)
    {
        _2438 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2442 = _2438;
    float _2444 = fma(_2434, _1786, _1852);
    float _2446 = sqrt(_2394);
    int _2448 = as_type<int>(_2442);
    if (_2406)
    {
        out.m_47.x = 0.0;
    }
    if (_2406)
    {
        float _2450 = _2442 * 5.0;
        _2448 = as_type<int>(_2450);
    }
    int _2452 = _2448;
    float _2454 = fma(_2432, _1712, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2456 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2444);
    float _2458 = _2436 * 0.15915493667125701904296875;
    if (_2406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7309 = as_type<float>(_2452);
        out.gl_Position.z = _7309;
    }
    float _2460 = _2416 * 6.283185482025146484375;
    float _2462 = sin(_2460);
    float _2464 = _2416 * 6.283185482025146484375;
    float _2466 = cos(_2464);
    float _2468 = _2410 * 6.283185482025146484375;
    float _2470 = cos(_2468);
    if (_2406)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2472 = _2456 * _2414;
    float _2474 = _2458 * 6.283185482025146484375;
    float _2476 = cos(_2474);
    float _2478 = fma(_2454, _1786, _2428);
    float _2480 = _2258 * _2446;
    float _2482 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _351);
    float _2486 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2478);
    float _2488 = _2466 * _2470;
    float _2490 = _2480 * _2482;
    float _2492 = _2458 * 6.283185482025146484375;
    float _2494 = sin(_2492);
    float _2496 = _2486 * _2412;
    float _2498 = _2466 * _2426;
    float _2500 = _2484 * _2490;
    float _2502 = _2462 * _2426;
    float _2504 = _2496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2506 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _367);
    float _2508 = _2462 * _2470;
    float _2510 = _2466 * _2476;
    float _2512 = _2504 * _2480;
    float _2514 = _2470 * _2476;
    float _2516 = _2462 * _2476;
    float _2518 = _2426 * _2476;
    float _2520 = _2512 * _2506;
    float _2522 = _2510 * _2500;
    float _2524 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2526 = _2524 * 0.5;
    float _2528 = fma(_2494, _2488, _2502);
    float _2530 = -_2508;
    float _2532 = fma(_2494, _2498, _2530);
    float _2534 = -_2500;
    float _2536 = _2494 * _2534;
    float _2538 = -_2498;
    float _2540 = fma(_2494, _2508, _2538);
    float _2542 = fma(_2528, _2520, _2522);
    float _2544 = _2516 * _2500;
    float _2546 = fma(_2514, _2520, _2536);
    float _2548 = fma(_2494, _2502, _2488);
    float _2550 = fma(_2532, _2526, _2542);
    float _2552 = fma(_2540, _2520, _2544);
    float _2554 = fma(_2518, _2526, _2546);
    float _2556 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2558 = fma(_2548, _2526, _2552);
    float _2560 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2562 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2564 = isnan(0.5);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2570 = _2566 || _2568;
    float _2572 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2556);
    float _2574 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2560);
    float _2576 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2572);
    float _2578 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2574);
    float _2580 = _2576 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2582 = _2578 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2584 = _1734 + _2580;
    float _2586 = _1716 + _2582;
    float _2588 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2592 = _2584 + _2590;
    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2596 = _2586 + _2594;
    float _2598 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2588);
    float _2600 = _2592 * _2592;
    float _2602 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2598);
    float _2604 = fma(_2596, _2596, _2600);
    float _2606 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2608 = sqrt(_2604);
    float _2610 = _1748 + _2606;
    bool _2612 = _2608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2614 = _2550;
    float _2616 = _2586;
    float _2618 = _2584;
    float _2620 = _2592;
    float _2622 = _2512;
    if (!_2612)
    {
        _2614 = _2610;
    }
    float _2624 = _2614;
    bool _2626 = !_2612;
    float _2628 = _2624;
    if (!_2626)
    {
        float _2630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2634 = _2608 + _2632;
        float _2636 = rsqrt(_2604);
        float _2638 = _2634 * _2630;
        float _2640 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2642 = _2638 * 0.15915493667125701904296875;
        float _2644 = _2642 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = _2642 * 6.283185482025146484375;
        float _2650 = cos(_2648);
        float _2652 = fma(_2646, _2640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2654 = _2636 * _2652;
        float _2656 = _2650 + (-1.0);
        float _2658 = fma(_2596, _2654, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2660 = fma(_2592, _2654, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2662 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2664 = fma(_2610, _2650, _2662);
        _2616 = _2658;
        _2628 = _2664;
        _2618 = _2660;
    }
    float _2666 = _2616;
    float _2668 = _2628;
    float _2670 = _2618;
    float _2672 = -_2324;
    float _2674 = fma(_2672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2666);
    float _2676 = -_2306;
    float _2678 = fma(_2676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2668);
    float _2680 = -_2348;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2670);
    float _2684 = _2678;
    float _2686 = _2674;
    float _2688 = _2682;
    if (!_2570)
    {
        float _2690 = _2366 * _2366;
        float _2692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2694 = -_1734;
        float _2696 = _2694 + _2670;
        float _2698 = fma(_2370, _2370, _2690);
        float _2700 = fma(_2374, _2374, _2698);
        float _2702 = 1.0 / _2480;
        float _2704 = sqrt(_2700);
        float _2706 = precise::min(_2704, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2708 = _2706 * _2692;
        float _2710 = -_1716;
        float _2712 = _2710 + _2666;
        float _2714 = _2708 * _2702;
        float _2716 = -_1748;
        float _2718 = _2716 + _2668;
        float _2720 = fma(_2712, _2714, _2356);
        float _2722 = fma(_2718, _2714, _2352);
        float _2724 = fma(_2696, _2714, _2360);
        _2684 = _2722;
        _2686 = _2720;
        _2688 = _2724;
        _2440 = _2690;
    }
    float _2726 = _2684;
    float _2728 = _2686;
    float _2730 = _2688;
    float _2732 = _2440;
    float _2734 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2736 = _2726 + _2734;
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2740 = _2728 + _2738;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2744 = _2730 + _2742;
    float _2746 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2748 = _2736 * _2736;
    float _2750 = fma(_2740, _2740, _2748);
    float _2752 = fma(_2744, _2744, _2750);
    float _2754 = rsqrt(_2752);
    float _2756 = sqrt(_2752);
    float _2758 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2760 = _2740 * _2758;
    float _2762 = _2744 * _2758;
    float _2764 = _2760 * _2760;
    float _2766 = _2762 * _2762;
    float _2768 = _2764 + _2766;
    float _2770 = sqrt(_2768);
    bool _2772 = _2770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2776 = _2770 + _2774;
    float _2778 = _2744;
    float _2780 = _2768;
    float _2782 = _2776;
    float _2784 = _2758;
    if (_2772)
    {
        float _2786 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2778 = _2786;
    }
    float _2788 = _2778;
    if (_2772)
    {
        float _2790 = rsqrt(_2768);
        _2780 = _2790;
    }
    float _2792 = _2780;
    float _2794 = _2792;
    if (_2772)
    {
        float _2796 = _2776 * _2788;
        _2782 = _2796;
    }
    float _2798 = _2782;
    if (_2772)
    {
        float _2800 = _2798 * 0.15915493667125701904296875;
        _1870 = _2800;
    }
    float _2802 = _1870;
    float _2804 = _2788;
    if (_2772)
    {
        float _2806 = _2802 * 6.283185482025146484375;
        float _2808 = sin(_2806);
        _2804 = _2808;
    }
    float _2810 = _2804;
    float _2812 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2814 = precise::max(0.0, _2812);
    float _2816 = _2732;
    float _2818 = _2814;
    if (_2772)
    {
        float _2820 = _2802 * 6.283185482025146484375;
        float _2822 = cos(_2820);
        _2816 = _2822;
    }
    float _2824 = _2816;
    float _2826 = -_2758;
    float _2828 = -_2814;
    float _2830 = fma(_2736, _2826, _2828);
    float _2832 = _2830;
    if (_2772)
    {
        float _2834 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2818 = _2834;
    }
    float _2836 = _2818;
    float _2838 = _2810;
    float _2840 = _2836;
    if (_2772)
    {
        float _2842 = fma(_2810, _2836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2838 = _2842;
    }
    float _2844 = _2838;
    float _2846 = _2844;
    float _2848 = _2824;
    if (_2772)
    {
        float _2850 = _2824 + (-1.0);
        _2840 = _2850;
    }
    float _2852 = _2840;
    float _2854 = _2852;
    if (_2772)
    {
        float _2856 = _2792 * _2844;
        _2620 = _2856;
    }
    float _2858 = _2620;
    if (!_2772)
    {
        _2846 = _2760;
    }
    float _2860 = _2846;
    float _2862 = _2860;
    if (_2772)
    {
        float _2864 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2784 = _2864;
    }
    float _2866 = _2784;
    if (_2772)
    {
        float _2868 = _2760 * _2858;
        _2862 = _2868;
    }
    float _2870 = _2862;
    if (!_2772)
    {
        _2854 = _2762;
    }
    float _2872 = _2854;
    float _2874 = _2872;
    if (_2772)
    {
        float _2876 = _2762 * _2858;
        _2874 = _2876;
    }
    float _2878 = _2874;
    if (!_2772)
    {
        _2794 = _2764;
    }
    float _2880 = _2794;
    float _2882 = _2880;
    if (_2772)
    {
        float _2884 = fma(_2830, _2824, _2866);
        _2832 = _2884;
    }
    float _2886 = _2832;
    if (_2772)
    {
        float _2888 = _2870 * _2870;
        _2882 = _2888;
    }
    float _2890 = _2882;
    if (!_2772)
    {
        _2848 = _2766;
    }
    float _2892 = _2848;
    float _2894 = _2892;
    if (_2772)
    {
        float _2896 = _2878 * _2878;
        _2894 = _2896;
    }
    float _2898 = _2894;
    float _2900 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2902 = fma(_2886, _2886, _2890);
    float _2904 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2906 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2900);
    float _2908 = _2902 + _2898;
    float _2910 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2914 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2912);
    float _2916 = precise::clamp(_2914, 0.0, 1.0);
    float _2918 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2906);
    float _2920 = rsqrt(_2908);
    float _2922 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2924 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2910);
    float _2926 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2928 = -_2916;
    float _2930 = _2928 + 1.0;
    float _2932 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2922);
    float _2934 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2924);
    float _2936 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2904);
    float _2938 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2932);
    float _2940 = _2926 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2942 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2944 = abs(_2930);
    float _2946 = log2(_2944);
    float _2948 = _2938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2950 = -_2940;
    float _2952 = fma(_2950, _2746, 1.0);
    float _2954 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2956 = _2920 * _2870;
    float _2958 = _2920 * _2886;
    float _2960 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2936);
    float _2962 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2954);
    float _2964 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2966 = _2920 * _2878;
    float _2968 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2962);
    float _2972 = -_2964;
    float _2974 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2972);
    float _2976 = log2(_2952);
    float _2978 = _2958 + 1.0;
    float _2980 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2970);
    float _2982 = -_2966;
    float _2984 = fma(_2982, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2974);
    float _2986 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2988 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2990 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2992 = fma(_2984, -0.5, 0.5);
    float _2994 = 1.0 / _2980;
    float _2996 = fma(_2984, 0.5, 0.5);
    float _2998 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2988);
    float _3000 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2990);
    float _3002 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2998);
    float _3004 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3000);
    float _3006 = sqrt(_2992);
    float _3008 = _2976 * 0.693147182464599609375;
    float _3010 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3002);
    float _3012 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3004);
    float _3014 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3016 = exp2(_2986);
    float _3018 = _3010 * _2994;
    float _3020 = _3012 * _2994;
    float _3022 = fma(_3018, 0.5, 0.5);
    float _3024 = fma(_3020, -0.5, 0.5);
    float _3026 = _3006 * 0.636619746685028076171875;
    float _3028 = fma(_2996, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3030 = fma(_2996, _3028, -0.212114393711090087890625);
    float _3032 = -_2958;
    float _3034 = fma(_3016, _2978, _3032);
    float _3036 = fma(_2996, _3030, 1.570728778839111328125);
    float _3038 = fma(_3034, 0.5, 0.5);
    float _3040 = -_3036;
    float _3042 = fma(_3026, _3040, 1.0);
    float3 _8260 = float3(_3022, _3024, _3014);
    float _3044 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8260, float3(0.0), isnan(_8260)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8260, float3(0.0), isnan(_8260)), level(0.0)).x;
    float3 _8271 = float3(_3022, _3024, _3014);
    float4 _3047 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8271, float3(0.0), isnan(_8271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8271, float3(0.0), isnan(_8271)), level(0.0)).xyzw;
    float _3049 = _3047.x;
    float _3051 = _3047.y;
    float _3053 = _3047.z;
    float _3055 = _3047.w;
    float2 _8288 = float2(_3042, _3038);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8288, float2(0.0), isnan(_8288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8288, float2(0.0), isnan(_8288)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3069 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3071 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3073 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3075 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3067);
    float _3077 = _351 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3079 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3081 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3083 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3085 = fma(_3077, _3077, 1.0);
    float _3087 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3079);
    float _3089 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3081);
    float _3091 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3083);
    float _3093 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3071);
    float _3095 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3073);
    float _3097 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3099 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3101 = _2532 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3103 = _2532 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3105 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3107 = _2532 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3109 = rsqrt(_3085);
    float _3111 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3069);
    float _3113 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3087);
    float _3115 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3075);
    float _3117 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3089);
    float _3119 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3091);
    float _3121 = -_2494;
    float _3123 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3097);
    float _3125 = -_2494;
    float _3127 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3099);
    float _3129 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3101);
    float _3131 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3103);
    float _3133 = -_2494;
    float _3135 = fma(_3133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3105);
    float _3137 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3107);
    float _3139 = _3113 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3141 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3123);
    float _3143 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3127);
    float _3145 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3135);
    float _3147 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3137);
    float _3149 = _3115 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3151 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3153 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3155 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3157 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3111);
    float _3159 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3093);
    float _3161 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3163 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3095);
    float _3165 = _367 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3167 = _3077 * _3141;
    float _3169 = -_615;
    float _3171 = _3169 + _2726;
    float _3173 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3155);
    float _3175 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3151);
    float _3177 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3153);
    float _3179 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3161);
    float _3181 = _3077 * _3143;
    float _3183 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3129);
    float _3185 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    out.m_72.x = _3157;
    out.m_72.y = _3159;
    out.m_72.z = _3163;
    float _3187 = fma(_3165, _3157, _3167);
    float _3189 = _3077 * _3145;
    float _3191 = _3077 * _3109;
    float _3193 = -_613;
    float _3195 = _3193 + _2728;
    float _3197 = fma(_3165, _3159, _3181);
    float _3199 = fma(_3165, _3163, _3189);
    float _3201 = -_3183;
    float _3203 = _3191 * _3201;
    float _3205 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3207 = -_3185;
    float _3209 = _3191 * _3207;
    float _3211 = -_3147;
    float _3213 = _3191 * _3211;
    float _3215 = -_617;
    float _3217 = _3215 + _2730;
    float _3219 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3221 = _3117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3223 = fma(_3109, _3141, _3203);
    float _3225 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3205);
    float _3227 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3219);
    float _3229 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3231 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3233 = fma(_3109, _3143, _3209);
    float _3235 = fma(_3109, _3145, _3213);
    float _3237 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3227);
    float _3239 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3229);
    float _3241 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3231);
    float _3243 = _3221 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    out.m_74.x = _3223;
    out.m_74.y = _3233;
    out.m_74.z = _3235;
    float _3245 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3239);
    float _3247 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3241);
    float _3249 = _3243 + _3179;
    float _3251 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3253 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3255 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3225);
    float _3257 = fma(_3221, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3173);
    float _3259 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3261 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3263 = exp2(_3251);
    float _3265 = _3010 + _2980;
    float _3267 = _3119 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3269 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3255);
    float _3271 = _2980 * 0.5;
    float _3273 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3249);
    float _3275 = _3269 + _2980;
    float _3277 = 1.0 / _3253;
    float _3279 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3257);
    float _3281 = _3265 * 0.5;
    float _3283 = _3275 * 0.5;
    float _3285 = _3221 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    out.gl_Position.x = _3010;
    out.gl_Position.y = _3012;
    out.gl_Position.z = _3269;
    out.gl_Position.w = _2980;
    float _3287 = 1.0 / _3273;
    float _3289 = -_3263;
    float _3291 = _3289 + 1.0;
    float _3293 = fma(_3012, -0.5, _3271);
    float _3295 = _3183 + _3187;
    out.m_76.x = _2728;
    out.m_76.y = _2726;
    out.m_76.z = _2730;
    float _3297 = _3285 + _3177;
    float _3299 = _3259 * _3277;
    float _3301 = _3261 * _3277;
    float _3303 = _3221 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3305 = _3185 + _3197;
    float _3307 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _3281;
    out.m_78.y = _3293;
    out.m_78.z = _3283;
    out.m_78.w = _2980;
    float _3309 = _3147 + _3199;
    float _3311 = _3303 + _3175;
    float _3313 = _3279 * _3287;
    float _3315 = -_3307;
    float _3317 = _3315 + 1.0;
    out.m_80.y = 1.0;
    float _3319 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3311);
    float _3321 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3297);
    bool _3323 = _3313 > 0.0;
    out.m_82.x = _3295;
    out.m_82.y = _3305;
    out.m_82.z = _3309;
    float _3325 = _3321 * _3287;
    bool _3327 = _3313 < 1.0;
    bool _3329 = _3327 && _3323;
    bool _3331 = _3018 > (-1.0);
    bool _3333 = _3331 && _3329;
    bool _3335 = _3020 > (-1.0);
    bool _3337 = _3335 && _3333;
    bool _3339 = _3018 < 1.0;
    bool _3341 = _3339 && _3337;
    bool _3343 = _3020 < 1.0;
    bool _3345 = _3343 && _3341;
    float _3347 = _3307 * _3044;
    float _3349 = _3055 * _3317;
    float _3351 = _3319 * _3287;
    float _3353 = _3055 * _3347;
    float _3355 = _3065 * _3347;
    float _3357 = fma(_3061, _3353, _3049);
    float _3359 = fma(_3063, _3353, _3051);
    float _3361 = fma(_3055, _3355, _3053);
    out.m_84.x = _3357;
    out.m_84.y = _3359;
    out.m_84.z = _3361;
    out.m_84.w = _3349;
    bool _3363 = !_3345;
    float _3365 = _3010;
    float _3367 = _3012;
    float _3369 = _3243;
    float _3371 = _2980;
    float _3399;
    float _3405;
    if (!_3363)
    {
        float _3373 = -_3325;
        float _3375 = _3020 + _3373;
        float _3377 = -_3351;
        float _3379 = _3018 + _3377;
        float _3381 = -_3299;
        float _3383 = _3018 + _3381;
        float _3385 = -_3301;
        float _3387 = _3020 + _3385;
        float _3389 = _3375 * _3375;
        float _3391 = fma(_3379, _3379, _3389);
        float _3393 = sqrt(_3391);
        bool _3395 = _3393 > 0.0;
        float _3397 = _3393;
        _3399 = _3391;
        if (!_3395)
        {
            _3397 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3401 = _3397;
        bool _3403 = !_3395;
        _3405 = _3401;
        _3407 = _3403;
        if (!_3407)
        {
            float _3409 = _3387 * _3387;
            float _3411 = fma(_3383, _3383, _3409);
            float _3413 = rsqrt(_3391);
            float _3415 = sqrt(_3411);
            float _3417 = _3379 * _3413;
            float _3419 = _3375 * _3413;
            bool _3421 = _3415 > 0.0;
            float _3423 = _3413;
            if (!_3421)
            {
                _3423 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3425 = _3423;
            bool _3427 = !_3421;
            _3405 = _3425;
            _3407 = _3427;
            if (!_3407)
            {
                float _3429 = _2512 * _3267;
                float _3431 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3433 = fma(_3429, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3243);
                float _3435 = fma(_3429, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3285);
                float _3437 = fma(_3429, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3303);
                float _3439 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3433);
                float _3441 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3435);
                float _3443 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3437);
                float _3445 = rsqrt(_3411);
                float _3447 = _3431 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3449 = 1.0 / _3439;
                float _3451 = _3387 * _3447;
                float _3453 = _3383 * _3447;
                float _3455 = _3451 * _3451;
                float _3457 = fma(_3453, _3453, _3455);
                float _3459 = _3387 * _3445;
                float _3461 = _3383 * _3445;
                float _3463 = _3419 * _3459;
                float _3465 = _3441 * _3449;
                float _3467 = _3443 * _3449;
                float _3469 = sqrt(_3457);
                float _3471 = fma(_3417, _3461, _3463);
                float _3473 = _3465 * _3465;
                float _3475 = fma(_3467, _3467, _3473);
                float _3477 = precise::min(0.0, _3471);
                float _3479 = sqrt(_3475);
                float _3481 = _2980 * _3477;
                float _3483 = fma(_3453, _3481, _3010);
                float _3485 = fma(_3451, _3481, _3012);
                out.gl_Position.x = _3483;
                out.gl_Position.y = _3485;
                float _3487 = fma(_3469, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3479);
                float _3489 = 1.0 / _3487;
                float _3491 = _3479 * _3489;
                out.m_80.y = _3491;
                _3365 = _3483;
                _3399 = _3491;
                _3367 = _3485;
                _3369 = _3451;
                _2622 = _3471;
                _3405 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3407 = true;
            }
        }
    }
    else
    {
        float _3493 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3493;
        _3399 = 0.0;
        _2622 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3405 = 0.0;
    }
    _3407 = false;
    float _3495 = _3365;
    float _3497 = _3399;
    float _3499 = _3367;
    float _3501 = _3369;
    float _3503 = _2622;
    float _3505 = _3405;
    bool _3507 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3509 = isnan(_2756);
    bool _3511 = _3507 || _3509;
    bool _3513 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3515 = _3511 || _3513;
    float _3517 = _3497;
    float _3519 = _3501;
    float _3521 = _3499;
    float _3523 = _3495;
    float _3525 = _3503;
    if (!_3515)
    {
        _3517 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3527 = _3517;
    float _3529 = _3527;
    float _3531 = _3527;
    if (!_3515)
    {
        _3371 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3533 = _3371;
    float _3535 = _3533;
    float _3537 = _3533;
    if (!_3515)
    {
        _3519 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3539 = _3519;
    float _3541 = _3539;
    float _3543 = _3539;
    if (!_3515)
    {
        _3521 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3545 = _3521;
    float _3547 = _3545;
    float _3549 = _3545;
    if (!_3515)
    {
        _3523 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3551 = _3523;
    float _3553 = _3551;
    float _3555 = _3551;
    if (!_3515)
    {
        _3525 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3557 = _3525;
    bool _3559 = !_3515;
    float _3561 = _3557;
    float _3563 = _3557;
    if (!_3559)
    {
        bool _3565 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3567 = isnan(_2756);
        bool _3569 = _3565 || _3567;
        bool _3571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3573 = _3569 || _3571;
        if (!_3573)
        {
            float _3575 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3577 = _2756 + _3575;
            float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3581 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3579;
            float _3583 = 1.0 / _3581;
            float _3585 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3587 = _3585 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3589 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3591 = _3589 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3595 = _3593 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3599 = _3597 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3601 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3603 = _3601 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3605 = _3577 * _3583;
            float _3607 = precise::clamp(_3605, 0.0, 1.0);
            float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3613 = fma(_3607, _3587, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3615 = fma(_3607, _3611, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3617 = fma(_3607, _3591, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3619 = fma(_3607, _3595, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3621 = fma(_3607, _3599, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3623 = fma(_3607, _3603, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3537 = _3615;
            _3555 = _3621;
            _3531 = _3613;
            _3549 = _3619;
            _3543 = _3617;
            _3563 = _3623;
            _3625 = true;
        }
        else
        {
            bool _3627 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3629 = isnan(_2756);
            bool _3631 = _3627 || _3629;
            bool _3633 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3635 = _3631 || _3633;
            if (!_3635)
            {
                _3529 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3637 = _3529;
            _3531 = _3637;
            if (!_3635)
            {
                _3535 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3639 = _3535;
            _3537 = _3639;
            if (!_3635)
            {
                _3541 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3641 = _3541;
            _3543 = _3641;
            if (!_3635)
            {
                _3547 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3643 = _3547;
            _3549 = _3643;
            if (!_3635)
            {
                _3553 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3645 = _3553;
            _3555 = _3645;
            if (!_3635)
            {
                _3561 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3647 = _3561;
            bool _3649 = !_3635;
            _3563 = _3647;
            if (!_3649)
            {
                bool _3651 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3653 = isnan(_2756);
                bool _3655 = _3651 || _3653;
                bool _3657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3659 = _3655 || _3657;
                if (!_3659)
                {
                    float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3663 = _2756 + _3661;
                    float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3667 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3665;
                    float _3669 = 1.0 / _3667;
                    float _3671 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3691 = _3663 * _3669;
                    float _3693 = precise::clamp(_3691, 0.0, 1.0);
                    float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3699 = fma(_3693, _3673, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3701 = fma(_3693, _3697, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3703 = fma(_3693, _3677, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3705 = fma(_3693, _3681, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3707 = fma(_3693, _3685, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3709 = fma(_3693, _3689, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3537 = _3701;
                    _3555 = _3707;
                    _3531 = _3699;
                    _3549 = _3705;
                    _3543 = _3703;
                    _3563 = _3709;
                    _3625 = true;
                }
                else
                {
                    _3537 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3555 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3531 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3549 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3543 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3563 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3625 = false;
    float _3711 = _3537;
    float _3713 = _3555;
    float _3715 = _3531;
    float _3717 = _3549;
    float _3719 = _3543;
    float _3721 = _3563;
    float _3723 = fma(_3305, -0.5, 0.5);
    float _3725 = precise::clamp(_3723, 0.0, 1.0);
    float _3727 = -_3711;
    float _3729 = _3727 + _3713;
    float _3731 = -_3715;
    float _3733 = _3731 + _3717;
    float _3735 = -_3719;
    float _3737 = _3735 + _3721;
    bool _3739 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3741 = fma(_3725, _3729, _3711);
    float _3743 = fma(_3725, _3733, _3715);
    float _3745 = fma(_3725, _3737, _3719);
    float _3747 = _3505 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3749 = _3741 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3751 = fma(_3743, 0.298911988735198974609375, _3749);
    out.m_80.w = _3747;
    float _3753 = fma(_3745, 0.114477999508380889892578125, _3751);
    float _3755 = -_3753;
    float _3757 = _3743 + _3755;
    float _3759 = -_3753;
    float _3761 = _3741 + _3759;
    float _3763 = -_3753;
    float _3765 = _3745 + _3763;
    out.m_86.x = 0.0;
    float _3767 = fma(_3757, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3753);
    float _3769 = fma(_3761, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3753);
    float _3771 = fma(_3765, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3753);
    out.m_88.x = _3767;
    out.m_88.y = _3769;
    out.m_88.z = _3771;
    if (!_3739)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3773 = -_2726;
    float _3775 = _3773 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3777 = -_2728;
    float _3779 = _3777 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3781 = -_2730;
    float _3783 = _3781 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3785 = _3775 * _3775;
    float _3787 = fma(_3779, _3779, _3785);
    float _3789 = fma(_3783, _3783, _3787);
    float _3791 = sqrt(_3789);
    float _3793 = rsqrt(_3789);
    float _3795 = -_3791;
    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3799 = _3797 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3801 = precise::clamp(_3799, 0.0, 1.0);
    float _3803 = _3779 * _3793;
    float _3805 = _3775 * _3793;
    float _3807 = abs(_3801);
    float _3809 = log2(_3807);
    float _3811 = _3783 * _3793;
    float _3813 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3815 = _3305 * _3805;
    float _3817 = -_3805;
    float _3819 = -_3813;
    float _3821 = fma(_3817, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3819);
    float _3823 = fma(_3295, _3803, _3815);
    float _3825 = -_3811;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3821);
    float _3829 = fma(_3309, _3811, _3823);
    float _3831 = precise::clamp(_3829, 0.0, 1.0);
    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3835 = _3827 + _3833;
    float _3837 = _3809 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3839 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3841 = precise::clamp(_3839, 0.0, 1.0);
    float _3843 = exp2(_3837);
    float _3845 = _3843 * _3841;
    float _3847 = _3831 * _3845;
    float _3849 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3851 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3853 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3849;
    out.m_86.y = _3851;
    out.m_86.z = _3853;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3625 = false;
    bool _3407 = false;
    bool _637 = false;
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
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
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
        float _3910 = as_type<float>(_123);
        out.gl_Position.z = _3910;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3984 = as_type<float>(_163);
        out.gl_Position.z = _3984;
    }
    if (_155)
    {
        return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _165 * _165;
    float _193 = _167 * _167;
    float _195 = fma(_173, _173, _191);
    float _197 = fma(_175, _175, _193);
    float _199 = fma(_179, _179, _195);
    float _201 = _169 * _169;
    float _203 = fma(_181, _181, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_177, _177, _201);
    float _209 = fma(_183, _183, _207);
    float _211 = sqrt(_203);
    float _213 = sqrt(_209);
    bool _215 = _205 > 0.0;
    float _217 = as_type<float>(int(gl_VertexIndex));
    bool _219 = _211 > 0.0;
    float _221 = 0.0;
    float _223 = _203;
    float _225 = _171;
    if (_215)
    {
        float _227 = rsqrt(_199);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = 0.0;
    if (!_215)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _213 > 0.0;
    float _237 = 0.0;
    float _239 = _233;
    if (!_215)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = 0.0;
    float _245 = _241;
    if (!_219)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    float _249 = 0.0;
    float _251 = _247;
    if (_219)
    {
        float _253 = rsqrt(_203);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = 0.0;
    if (!_219)
    {
        _257 = 0.0;
    }
    float _259 = _257;
    int _261 = as_type<int>(_217) & 1;
    bool _263 = _261 != 0;
    int _265 = as_type<int>(_217) & 2;
    bool _267 = _265 != 0;
    bool _269 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _273 = _269 || _271;
    bool _275 = isnan(1.0);
    bool _277 = _273 || _275;
    float _279 = _209;
    float _281 = _217;
    float _283 = _259;
    if (_235)
    {
        float _285 = rsqrt(_209);
        _279 = _285;
    }
    float _287 = _279;
    if (!_215)
    {
        _281 = 0.0;
    }
    float _289 = _281;
    float _291 = _289;
    float _293 = _229;
    if (_215)
    {
        float _295 = _229 * _173;
        _239 = _295;
    }
    float _297 = _239;
    if (_215)
    {
        float _299 = _229 * _165;
        _245 = _299;
    }
    float _301 = _245;
    if (_215)
    {
        float _303 = _229 * _179;
        _291 = _303;
    }
    float _305 = _291;
    float _307 = 0.0;
    if (!_235)
    {
        _307 = 0.0;
    }
    float _309 = _307;
    float _311 = 0.0;
    float _313 = _309;
    if (!_235)
    {
        _311 = 0.0;
    }
    float _315 = _311;
    float _317 = _315;
    if (_219)
    {
        float _319 = _255 * _175;
        _251 = _319;
    }
    float _321 = _251;
    if (!_235)
    {
        _293 = 0.0;
    }
    float _323 = _293;
    float _325 = _323;
    if (_219)
    {
        float _327 = _255 * _167;
        _283 = _327;
    }
    float _329 = _283;
    if (!_219)
    {
        _223 = 0.0;
    }
    float _331 = _223;
    float _333 = 0.0;
    float _335 = _331;
    if (!_277)
    {
        float _337 = _171 * _171;
        float _339 = _337 * 0.5;
        _333 = _339;
    }
    float _341 = _333;
    float _343 = _341;
    if (_219)
    {
        float _345 = _255 * _181;
        _335 = _345;
    }
    float _347 = _335;
    bool _349 = !_267;
    float _351 = _349 ? (-0.5) : 0.5;
    if (_235)
    {
        float _353 = _287 * _177;
        _313 = _353;
    }
    float _355 = _313;
    if (_235)
    {
        float _357 = _287 * _169;
        _317 = _357;
    }
    float _359 = _317;
    if (_235)
    {
        float _361 = _287 * _183;
        _325 = _361;
    }
    float _363 = _325;
    bool _365 = !_263;
    float _367 = _365 ? (-0.5) : 0.5;
    float _369 = _363;
    if (!_277)
    {
        float _371 = _341 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _343 = _371;
    }
    float _373 = _343;
    bool _375 = !_277;
    float _377 = _373;
    if (!_375)
    {
        float _379 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _381 = log2(_379);
        float _383 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _385 = _383 + 1.0;
        float _387 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _389 = _171 * _381;
        float _391 = 1.0 / _385;
        float _393 = _387 * 0.693147182464599609375;
        float _395 = exp2(_389);
        float _397 = 1.0 / _393;
        float _399 = _395 + (-1.0);
        float _401 = -_399;
        float _403 = fma(_401, _397, _171);
        float _405 = _403 * _391;
        float _407 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _377 = _407;
    }
    float _409 = _377;
    float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _413 = !_277;
    float _415 = _411;
    if (!_413)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _171 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _225 = _435;
    }
    float _437 = _225;
    float _439 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = _411 * _301;
    float _443 = _411 * _329;
    float _445 = _411 * _359;
    float _447 = _445;
    if (!_277)
    {
        float _449 = _143 * _143;
        float _451 = _449 * 0.5;
        _415 = _451;
    }
    float _453 = _415;
    float _455 = fma(_439, _297, _441);
    float _457 = fma(_439, _321, _443);
    float _459 = fma(_439, _355, _445);
    if (!_277)
    {
        float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _447 = _461;
    }
    float _463 = _447;
    bool _465 = !_277;
    float _467 = _463;
    if (!_465)
    {
        float _469 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _471 = log2(_469);
        float _473 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _475 = _473 + 1.0;
        float _477 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _479 = _143 * _471;
        float _481 = 1.0 / _475;
        float _483 = _477 * 0.693147182464599609375;
        float _485 = exp2(_479);
        float _487 = 1.0 / _483;
        float _489 = _485 + (-1.0);
        float _491 = -_489;
        float _493 = fma(_491, _487, _143);
        float _495 = _493 * _481;
        float _497 = _495 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _467 = _497;
    }
    float _499 = _467;
    float _501 = in.m_64.w;
    float _503 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _505 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _507 = in.m_44.x;
    float _509 = in.m_44.y;
    float _511 = in.m_44.z;
    float _513 = _503 * _329;
    float _515 = _503 * _301;
    float _517 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _519 = _503 * _359;
    float _521 = fma(_505, _305, _455);
    float _523 = fma(_505, _347, _457);
    float _525 = fma(_517, _297, _515);
    float _527 = fma(_517, _321, _513);
    float _529 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _531 = fma(_517, _355, _519);
    float _533 = fma(_505, _363, _459);
    float _535 = fma(_437, _185, _521);
    float _537 = fma(_529, _305, _525);
    float _539 = fma(_529, _347, _527);
    float _541 = fma(_529, _363, _531);
    float _543 = fma(_437, _187, _523);
    float _545 = fma(_437, _189, _533);
    if (!_277)
    {
        _369 = _143;
    }
    float _547 = _369;
    bool _549 = !_277;
    float _551 = _547;
    if (!_549)
    {
        float _553 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _555 = log2(_553);
        float _557 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _559 = _557 + 1.0;
        float _561 = 1.0 / _559;
        float _563 = _143 * _555;
        float _565 = exp2(_563);
        float _567 = -_565;
        float _569 = _567 + 1.0;
        float _571 = _569 * _561;
        _551 = _571;
    }
    float _573 = _551;
    float _575 = fma(_573, _187, _539);
    bool _577 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _579 = fma(_573, _185, _537);
    float _581 = fma(_573, _189, _541);
    float _583 = -_575;
    float _585 = _543 + _583;
    float _587 = fma(_543, _501, _509);
    float _589 = -_579;
    float _591 = _535 + _589;
    float _593 = -_581;
    float _595 = _545 + _593;
    float _597 = _585 * _175;
    float _599 = _585 * _167;
    float _601 = _585 * _181;
    float _603 = fma(_535, _501, _507);
    float _605 = fma(_591, _173, _597);
    float _607 = fma(_591, _165, _599);
    float _609 = fma(_591, _179, _601);
    float _611 = fma(_545, _501, _511);
    float _613 = fma(_595, _177, _605);
    float _615 = fma(_595, _169, _607);
    float _617 = fma(_595, _183, _609);
    bool _619 = !_577;
    float _635;
    if (!_619)
    {
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _623 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _635 = _633;
        _637 = true;
    }
    else
    {
        float _639 = float(_107);
        float _641 = 1.0 / _639;
        float _643 = _143 * _641;
        _635 = _643;
    }
    _637 = false;
    float _645 = _635;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _649 = int(_647);
    float _651 = float(_107);
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _655 = _653 != 0;
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _659 = int(_657);
    bool _661 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _663 = isnan(_645);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _675 = int(_673);
    float _677 = float(_649);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _679;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _687 = 1.0 / _677;
    float _689 = float(_659);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _697 = int(_695);
    float _699 = float(uint(_675));
    int _701 = ~_675;
    int _703 = _701 + 1;
    int _705 = ~_675;
    int _707 = _705 + 1;
    bool _709 = _675 == 0;
    float _711 = 1.0 / _689;
    float _713 = _687 * _143;
    float _715 = 1.0 / _699;
    float _717 = float(uint(_697));
    float _719 = float(_697);
    float _721 = trunc(_713);
    int _723 = int(_721);
    float _725 = _711 * _143;
    float _727 = 1.0 / _717;
    int _729 = as_type<int>(_715) + (-2);
    float _731 = trunc(_725);
    int _733 = int(_731);
    float _735 = float(uint(_723));
    float _737 = float(_723);
    float _739 = as_type<float>(_729) * _735;
    int _741 = as_type<int>(_727) + (-2);
    float _743 = 1.0 / _651;
    int _745 = ~_697;
    int _747 = _745 + 1;
    float _749 = float(uint(_733));
    float _751 = trunc(_739);
    float _753 = precise::max(_751, 0.0);
    uint _756 = uint(_753);
    float _758 = float(_733);
    float _760 = as_type<float>(_741) * _749;
    bool _762 = _758 >= _719;
    bool _764 = isnan(_758);
    bool _766 = _762 || _764;
    bool _768 = isnan(_719);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = in.m_51.y;
    float _776 = trunc(_760);
    float _778 = precise::max(_776, 0.0);
    uint _780 = uint(_778);
    float _782 = _743 * _143;
    int _784 = _703 * int(_756);
    int _786 = _784 + _723;
    float _788 = _760;
    int _790 = _729;
    if (_655)
    {
        _788 = 1.0;
    }
    float _792 = _788;
    float _794 = trunc(_772);
    int _796 = int(_794);
    float _798 = _792;
    if (!_655)
    {
        _798 = 7.345489978790283203125;
    }
    float _800 = _798;
    float _802 = float(uint(_786));
    int _804 = _747 * int(_780);
    int _806 = _804 + _733;
    float _808 = _800 * _129;
    float _810 = as_type<float>(_729) * _802;
    float _812 = _802;
    float _814 = as_type<float>(_806);
    if (_655)
    {
        _812 = 1.0;
    }
    float _816 = _812;
    float _818 = float(uint(_806));
    float _820 = _774 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _822 = _816;
    if (_655)
    {
        _814 = _129;
    }
    float _824 = _814;
    float _826 = trunc(_810);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    float _832 = _824;
    if (!_655)
    {
        _822 = 1.2345600128173828125;
    }
    float _834 = _822;
    float _836 = as_type<float>(_741) * _818;
    if (!_655)
    {
        _832 = _774;
    }
    float _838 = _832;
    float _840 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[78].w, _693);
    float _842 = trunc(_836);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = _834 * _838;
    float _850 = floor(_848);
    int _852 = int(_756) + int(_830);
    int _854 = ~_697;
    int _856 = _854 + 1;
    float _858 = floor(_808);
    int _860 = int(_780) + int(_846);
    int _862 = _707 * _852;
    int _864 = _862 + _723;
    float _866 = float(_675);
    bool _868 = _737 >= _866;
    bool _870 = isnan(_737);
    bool _872 = _868 || _870;
    bool _874 = isnan(_866);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -_850;
    float _882 = _848 + _880;
    bool _884 = uint(_864) >= uint(_675);
    int _886 = _856 * _860;
    int _888 = _886 + _733;
    float _890 = trunc(_878);
    int _892 = int(_890);
    bool _894 = !_884;
    int _896 = _894 ? 0 : (-1);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _900 = _898 != 0;
    float _902 = -_858;
    float _904 = _808 + _902;
    int _906 = ~_852;
    int _908 = _906 + _896;
    int _910 = _908 + 1;
    bool _912 = !_900;
    int _914 = _912 ? 0 : 1;
    float _916 = _904 * _866;
    bool _918 = uint(_888) >= uint(_697);
    float _920 = _866 * _782;
    int _922 = abs(_914);
    float _924 = trunc(_916);
    int _926 = int(_924);
    int _928 = _675 * _910;
    int _930 = _928 + _723;
    float _932 = _882 * _719;
    int _934 = ~_892;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    float _940 = _719 * _782;
    bool _942 = !_709;
    int _944 = _942 ? _930 : (-1);
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _948 = _946 != 0;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _952 = _950 != 0;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _956 = _954 != 0;
    float _958 = trunc(_920);
    int _960 = int(_958);
    bool _962 = !_918;
    int _964 = _962 ? 0 : (-1);
    int _966 = _675 + (-1);
    int _968 = ~_860;
    int _970 = _968 + _964;
    int _972 = _970 + 1;
    int _974 = _944 * _938;
    bool _976 = !_952;
    int _978 = _976 ? 0 : 1;
    int _980 = _926 * _922;
    int _982 = _980 + _723;
    bool _984 = _697 == 0;
    int _986 = _697 * _972;
    int _988 = _986 + _733;
    int _990 = abs(_978);
    int _992 = _892 * _966;
    int _994 = _992 + _974;
    int _996 = ~_796;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    float _1002 = trunc(_932);
    int _1004 = int(_1002);
    bool _1006 = !_984;
    int _1008 = _1006 ? _988 : (-1);
    int _1010 = _994 * _990;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1014 = _1012 != 0;
    int _1016 = _1008 * _1000;
    bool _1018 = !_1014;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = trunc(_940);
    int _1024 = int(_1022);
    bool _1026 = !_948;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = abs(_1020);
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1034 = _1032 != 0;
    int _1036 = _697 + (-1);
    int _1038 = _1004 * _1030;
    int _1040 = _1038 + _733;
    int _1042 = abs(_1028);
    bool _1044 = !_956;
    int _1046 = _1044 ? 0 : 1;
    int _1048 = _796 * _1036;
    int _1050 = _1048 + _1016;
    bool _1052 = !_1034;
    int _1054 = _1052 ? 0 : 1;
    int _1056 = _960 * _1042;
    int _1058 = _1056 + _1010;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1070 = _1068 != 0;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1074 = _1072 != 0;
    int _1076 = abs(_1046);
    int _1078 = abs(_1054);
    bool _1080 = !_1066;
    int _1082 = _1080 ? 0 : 1;
    int _1084 = abs(_1082);
    bool _1086 = !_1062;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = _982 * _1076;
    int _1092 = _1090 + _1058;
    bool _1094 = !_1070;
    int _1096 = _1094 ? 0 : 1;
    int _1098 = _926 * _1078;
    int _1100 = _1098 + _1092;
    int _1102 = abs(_1088);
    int _1104 = _1050 * _1084;
    bool _1106 = !_1074;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = in.m_51.w;
    float _1112 = float(uint(_1100));
    int _1114 = abs(_1096);
    float _1116 = as_type<float>(_729) * _1112;
    int _1118 = abs(_1108);
    int _1120 = _1024 * _1102;
    int _1122 = _1120 + _1104;
    float _1124 = trunc(_1116);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    int _1130 = ~_697;
    int _1132 = _1130 + 1;
    int _1134 = _1040 * _1114;
    int _1136 = _1134 + _1122;
    bool _1138 = _675 == 0;
    int _1140 = _1004 * _1118;
    int _1142 = _1140 + _1136;
    int _1144 = ~_675;
    int _1146 = _1144 + 1;
    float _1148 = float(uint(_1142));
    float _1150 = as_type<float>(_741) * _1148;
    int _1152 = _1146 * int(_1128);
    int _1154 = _1152 + _1100;
    float _1156 = trunc(_1150);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    float _1162 = float(uint(_1154));
    float _1164 = as_type<float>(_729) * _1162;
    float _1166 = trunc(_1164);
    float _1168 = precise::max(_1166, 0.0);
    uint _1170 = uint(_1168);
    int _1172 = _1132 * int(_1160);
    int _1174 = _1172 + _1142;
    int _1176 = ~_697;
    int _1178 = _1176 + 1;
    float _1180 = float(uint(_1174));
    int _1182 = ~_675;
    int _1184 = _1182 + 1;
    float _1186 = as_type<float>(_741) * _1180;
    int _1188 = int(_1128) + int(_1170);
    float _1190 = trunc(_1186);
    float _1192 = precise::max(_1190, 0.0);
    uint _1194 = uint(_1192);
    int _1196 = _1184 * _1188;
    int _1198 = _1196 + _1100;
    bool _1200 = uint(_1198) >= uint(_675);
    float _1202 = _587 * _167;
    bool _1204 = !_1200;
    int _1206 = _1204 ? 0 : (-1);
    int _1208 = ~_1188;
    int _1210 = _1208 + _1206;
    int _1212 = _1210 + 1;
    float _1214 = _587 * _181;
    int _1216 = int(_1160) + int(_1194);
    int _1218 = _675 * _1212;
    int _1220 = _1218 + _1100;
    int _1222 = _1178 * _1216;
    int _1224 = _1222 + _1142;
    float _1226 = float(uint(_982));
    bool _1228 = !_1138;
    int _1230 = _1228 ? _1220 : (-1);
    bool _1232 = uint(_1224) >= uint(_697);
    float _1234 = as_type<float>(_729) * _1226;
    int _1236 = _1230 & 3;
    bool _1238 = _1236 != 0;
    bool _1240 = !_1232;
    int _1242 = _1240 ? 0 : (-1);
    float _1244 = trunc(_1234);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    bool _1250 = uint(_1236) > 1u;
    int _1252 = ~_1216;
    int _1254 = _1252 + _1242;
    int _1256 = _1254 + 1;
    int _1258 = _1230 & 3;
    bool _1260 = _1258 != 0;
    bool _1262 = uint(_1236) >= 2u;
    int _1264 = _697 * _1256;
    int _1266 = _1264 + _1142;
    int _1268 = _1260 ? 0 : 1;
    float _1270 = float(uint(_1040));
    bool _1272 = !_984;
    int _1274 = _1272 ? _1266 : (-1);
    int _1276 = ~_1268;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    float _1282 = as_type<float>(_741) * _1270;
    int _1284 = _1280;
    float _1286 = _1202;
    float _1288 = _1110;
    if (!_1250)
    {
        int _1290 = ~_1268;
        int _1292 = _1290 + 1;
        _1284 = _1292;
    }
    int _1294 = _1284;
    int _1296 = _1274 & 3;
    bool _1298 = _1296 != 0;
    float _1300 = trunc(_1282);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    int _1306 = _1274 & 3;
    bool _1308 = _1306 != 0;
    int _1310 = _1298 ? 0 : 1;
    bool _1312 = _1236 != 3;
    int _1314 = _1262 ? 0 : 1;
    bool _1316 = uint(_1306) > 1u;
    int _1318 = ~_675;
    int _1320 = _1318 + 1;
    int _1322 = ~_1314;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    int _1328 = ~_1310;
    int _1330 = _1328 + 1;
    int _1332 = _1330 + 1;
    int _1334 = _1320 * int(_1248);
    int _1336 = _1334 + _982;
    float _1338 = _129 * 2.0;
    int _1340 = _1326;
    int _1342 = _1332;
    if (_1312)
    {
        int _1344 = ~_1314;
        int _1346 = _1344 + 1;
        _1340 = _1346;
    }
    int _1348 = _1340;
    bool _1350 = _1306 != 3;
    float _1352 = in.m_51.z;
    if (!_1316)
    {
        int _1354 = ~_1310;
        int _1356 = _1354 + 1;
        _1342 = _1356;
    }
    int _1358 = _1342;
    float _1360 = floor(_1338);
    bool _1362 = uint(_1306) >= 2u;
    int _1364 = ~_697;
    int _1366 = _1364 + 1;
    int _1368 = _1362 ? 0 : 1;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1372 = _1370 != 0;
    int _1374 = _1366 * int(_1304);
    int _1376 = _1374 + _1040;
    int _1378 = ~_1368;
    int _1380 = _1378 + 1;
    int _1382 = _1380 + 1;
    float _1384 = _587 * _175;
    float _1386 = float(uint(_1336));
    float _1388 = fma(_603, _165, _1202);
    int _1390 = _1382;
    float _1392 = _1384;
    if (_1350)
    {
        int _1394 = ~_1368;
        int _1396 = _1394 + 1;
        _1390 = _1396;
    }
    int _1398 = _1390;
    bool _1400 = _129 > 0.5;
    float _1402 = as_type<float>(_729) * _1386;
    float _1404 = float(uint(_1376));
    float _1406 = fma(_611, _169, _1388);
    int _1408 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1410 = _1408 != 0;
    float _1412 = _774 * 2.0;
    float _1414 = -_367;
    int _1416 = _1400 ? as_type<int>(_1414) : as_type<int>(_367);
    float _1418 = as_type<float>(_741) * _1404;
    bool _1420 = _774 > 0.5;
    float _1422 = trunc(_1402);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    bool _1428 = !_1410;
    float _1430 = _1428 ? _367 : as_type<float>(_1416);
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1434 = _1432 != 0;
    float _1436 = -_351;
    int _1438 = _1420 ? as_type<int>(_1436) : as_type<int>(_351);
    float _1440 = _1430 + 0.5;
    bool _1442 = _1360 > 0.0;
    float _1444 = trunc(_1418);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    bool _1450 = _1352 > 0.5;
    bool _1452 = !_1434;
    float _1454 = _1452 ? _351 : as_type<float>(_1438);
    bool _1456 = _1360 >= 0.0;
    bool _1458 = isnan(_1360);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = -_367;
    int _1468 = _1450 ? as_type<int>(_1466) : as_type<int>(_367);
    float _1470 = floor(_1412);
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1474 = _1472 != 0;
    int _1476 = _1464 ? 0 : 1;
    float _1478 = _1454;
    if (_1372)
    {
        _790 = 0;
    }
    int _1480 = _790;
    bool _1482 = _1110 > 0.5;
    int _1484 = _1480;
    if (!_1372)
    {
        _1484 = 1;
    }
    int _1486 = _1484;
    bool _1488 = !_1474;
    float _1490 = _1488 ? _367 : as_type<float>(_1468);
    float _1492 = fma(_603, _173, _1384);
    int _1494 = ~_1476;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    float _1500 = fma(_603, _179, _1214);
    float _1502 = -_351;
    int _1504 = _1482 ? as_type<int>(_1502) : as_type<int>(_351);
    bool _1506 = _1486 != 1;
    float _1508 = fma(_611, _183, _1500);
    int _1510 = _1498;
    if (!_1442)
    {
        int _1512 = ~_1476;
        int _1514 = _1512 + 1;
        _1510 = _1514;
    }
    int _1516 = _1510;
    int _1518 = ~_675;
    int _1520 = _1518 + 1;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1524 = _1522 != 0;
    int _1526 = ~_697;
    int _1528 = _1526 + 1;
    int _1530 = int(_1304) + int(_1448);
    int _1532 = int(_1248) + int(_1426);
    int _1534 = _1528 * _1530;
    int _1536 = _1534 + _1040;
    bool _1538 = _1470 > 0.0;
    bool _1540 = !_1524;
    float _1542 = _1540 ? _351 : as_type<float>(_1504);
    int _1544 = _1520 * _1532;
    int _1546 = _1544 + _982;
    bool _1548 = _1470 >= 0.0;
    bool _1550 = isnan(_1470);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    int _1558 = _1556 ? 0 : 1;
    float _1560 = as_type<float>(_1520);
    if (!_1506)
    {
        _1286 = _774;
    }
    float _1562 = _1286;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1564;
    float _1568 = _1562;
    if (!_1506)
    {
        _1288 = _774;
    }
    float _1570 = _1288;
    float _1572 = _1570;
    if (!_1506)
    {
        _1560 = _1352;
    }
    float _1574 = _1560;
    float _1576 = _1574;
    if (!_1506)
    {
        _1392 = _1352;
    }
    float _1578 = _1392;
    float _1580 = 1.0 / _1566;
    float _1582 = _1578;
    if (_1506)
    {
        _1568 = _129;
    }
    float _1584 = _1568;
    if (_1506)
    {
        _1572 = _129;
    }
    float _1586 = _1572;
    if (_1506)
    {
        _1576 = _774;
    }
    float _1588 = _1576;
    if (_1506)
    {
        _1582 = _774;
    }
    float _1590 = _1582;
    float _1592 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[83].z, _683);
    bool _1594 = uint(_1536) >= uint(_697);
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1598 = _1596 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1600 = uint(_1546) >= uint(_675);
    float _1602 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1604 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1592);
    int _1606 = ~_1558;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    float _1612 = 1.0 / _1598;
    bool _1614 = !_1594;
    int _1616 = _1614 ? 0 : (-1);
    int _1618 = _1610;
    if (!_1538)
    {
        int _1620 = ~_1558;
        int _1622 = _1620 + 1;
        _1618 = _1622;
    }
    int _1624 = _1618;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1628 = _645 + _1626;
    bool _1630 = !_1600;
    int _1632 = _1630 ? 0 : (-1);
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1644 = _1642 != 0;
    float _1646 = fma(_611, _177, _1492);
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1650 = _1648 != 0;
    float _1652 = in.m_57.w;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1656 = _1654 != 0;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1660;
    float _1664 = _1352 * 2.0;
    float _1666 = in.m_59.w;
    float _1668 = -_1658;
    float _1670 = fma(_1602, 2.0, _1668);
    float _1672 = 1.0 / _1662;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1676 = _645 + _1674;
    float _1678 = in.m_55.w;
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1682 = _645 + _1680;
    float _1684 = _1676 * _1612;
    bool _1686 = !_1640;
    int _1688 = _1686 ? 0 : 1;
    float _1690 = -_143;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1670);
    float _1694 = floor(_1664);
    float _1696 = _1628 * _1580;
    float _1698 = _129 + _774;
    float _1700 = _129 + _1352;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1704 = fma(_681, _1696, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1706 = _1698 + (-1.0);
    bool _1708 = !_1636;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = _1682 * _1672;
    float _1714 = _1352 + _774;
    float _1716 = _1646 + _1652;
    float _1718 = _1700 + (-1.0);
    bool _1720 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1722 = isnan(_645);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = _1714 + (-1.0);
    float _1734 = _1508 + _1666;
    bool _1736 = _1694 >= 0.0;
    bool _1738 = isnan(_1694);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan(0.0);
    bool _1744 = _1740 || _1742;
    float _1746 = fma(_820, -2.0, _1702);
    float _1748 = _1406 + _1678;
    bool _1750 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1752 = isnan(_645);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1764 = -_1730;
    float _1766 = _1764 + 1.0;
    int _1768 = _1744 ? 0 : 1;
    float _1770 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1772 = _1694 > 0.0;
    bool _1774 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1776 = isnan(_645);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = _1760 * _1766;
    float _1788 = -_1760;
    float _1790 = _1788 + 1.0;
    int _1792 = abs(_1688);
    float _1794 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1796 = _671 * _1790;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1798;
    float _1802 = -_671;
    float _1804 = _1802 + 1.0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1812 = _1810 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1814 = fma(_1800, _1696, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1816 = _1784 * _1804;
    float _1818 = fma(_1808, _1684, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1820 = fma(_1812, _1684, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1822 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1746);
    float _1824 = _1454 + (-0.5);
    float _1826 = -_1784;
    float _1828 = _1826 + 1.0;
    float _1830 = _1814 * _1816;
    float _1832 = _1704 * _1816;
    float _1834 = -_1824;
    float _1836 = -_1822;
    float _1838 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1836);
    float _1840 = float(_1516);
    float _1842 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1830);
    float _1844 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1832);
    float _1846 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1848 = _1230 >> 31;
    float _1850 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1692);
    float _1852 = fma(_1820, _1796, _1844);
    int _1854 = ~_1768;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    float _1860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1862 = log2(_1860);
    int _1864 = _1848 & 3;
    float _1866 = fma(_1846, -2.0, _685);
    int _1868 = _1858;
    float _1870 = _1716;
    if (!_1772)
    {
        int _1872 = ~_1768;
        int _1874 = _1872 + 1;
        _1868 = _1874;
    }
    int _1876 = _1868;
    float _1878 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1880 = _1274 >> 31;
    float _1882 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1866);
    int _1884 = _1230 + _1864;
    float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1888 = _1748 + _1886;
    int _1890 = _1880 & 3;
    float _1892 = -_691;
    float _1894 = fma(_1878, 2.0, _1892);
    int _1896 = _1884 >> 2;
    float _1898 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1900 = float(_1792);
    float _1902 = -_143;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1894);
    int _1906 = _1274 + _1890;
    float _1908 = _1862 * _143;
    int _1910 = _1896 << 4;
    int _1912 = _1910 + 368;
    float _1914 = _1900 * _1840;
    int _1916 = _1906 >> 2;
    float _1918 = exp2(_1908);
    uint _1920 = uint(int(uint(_1912) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1938 = _1716 + _1936;
    int _1940 = _1916 << 4;
    int _1942 = _1940 + 512;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1946 = !_1644;
    int _1948 = _1946 ? 0 : 1;
    uint _1950 = uint(int(uint(_1942) >> uint(2)));
    uint _1952 = uint(int(uint(int(_1950)) >> uint(2)));
    int _1954 = int(_1950) & 3;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[int(_1952)][_1954];
    int _1958 = int(_1950) + 1;
    uint _1960 = uint(int(uint(_1958) >> uint(2)));
    int _1962 = _1958 & 3;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[int(_1960)][_1962];
    float _1966 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1898);
    float _1968 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1944);
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1972 = 1.0 + _1970;
    int _1974 = abs(_1948);
    int _1976 = abs(_1710);
    float _1978 = -_1918;
    float _1980 = _1978 + 1.0;
    int _1982 = _1942 + 8;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    uint _1986 = uint(int(uint(int(_1984)) >> uint(2)));
    int _1988 = int(_1984) & 3;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[int(_1986)][_1988];
    int _1992 = int(_1984) + 1;
    uint _1994 = uint(int(uint(_1992) >> uint(2)));
    int _1996 = _1992 & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    float _2000 = float(_1624);
    float _2002 = 1.0 / _1972;
    float _2004 = float(_1974);
    float _2006 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1968);
    float _2008 = float(_1876);
    int _2010 = _1912 + 8;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    bool _2028 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2030 = isnan(1.0);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2036 = _2032 || _2034;
    float _2038 = _2004 * _2000;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _1734 + _2040;
    bool _2044 = !_1238;
    int _2046 = _2044 ? 0 : 1;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2050 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2052 = isnan(0.0);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2058 = _2054 || _2056;
    float _2060 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1966);
    int _2062 = ~_1530;
    int _2064 = _2062 + _1616;
    int _2066 = _2064 + 1;
    float _2068 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2048);
    float _2070 = _2058 ? _1980 : 0.0;
    bool _2072 = _2060 >= 0.0;
    float _2074 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2068);
    float _2076 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _840);
    int _2078 = as_type<int>(_1888);
    if (_2036)
    {
        float _2080 = _2070 * _2002;
        _145 = _2080;
    }
    float _2082 = _145;
    int _2084 = ~_1532;
    int _2086 = _2084 + _1632;
    int _2088 = _2086 + 1;
    float _2090 = _1490 + 0.5;
    int _2092 = abs(_1294);
    int _2094 = _697 * _2066;
    int _2096 = _2094 + _1040;
    bool _2098 = !_1308;
    int _2100 = _2098 ? 0 : 1;
    float _2102 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1904);
    int _2104 = ~_2092;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = _675 * _2088;
    int _2112 = _2110 + _982;
    int _2114 = abs(_1358);
    float _2116 = _1542 + (-0.5);
    int _2118 = abs(_2100);
    int _2120 = _2108 * as_type<int>(_1934);
    int _2122 = abs(_2046);
    float _2124 = -_2116;
    float _2126 = -_1882;
    float _2128 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2126);
    if (_2072)
    {
        out.m_47.x = 0.0;
    }
    int _2130 = abs(_1348);
    int _2132 = ~_2114;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    int _2138 = abs(_1398);
    int _2140 = ~_2122;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    int _2146 = _2136 * as_type<int>(_1964);
    int _2148 = ~_2118;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = _2144 * as_type<int>(_1926);
    int _2156 = _2154 + _2120;
    bool _2158 = _1236 != 3;
    int _2160 = _2152 * as_type<int>(_1956);
    int _2162 = _2160 + _2146;
    bool _2164 = !_2158;
    int _2166 = _2164 ? 0 : (-1);
    int _2168 = ~_2138;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    bool _2174 = _1306 != 3;
    int _2176 = ~_2130;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    int _2182 = _2172 * as_type<int>(_1990);
    int _2184 = _2182 + _2162;
    bool _2186 = !_2174;
    int _2188 = _2186 ? 0 : (-1);
    float _2190 = _1888 * _1888;
    int _2192 = abs(_2166);
    int _2194 = _2180 * as_type<int>(_2018);
    int _2196 = _2194 + _2156;
    bool _2198 = !_1650;
    int _2200 = _2198 ? 0 : 1;
    float _2202 = fma(_1938, _1938, _2190);
    bool _2204 = !_1656;
    int _2206 = _2204 ? 0 : 1;
    float _2208 = in.m_66.x;
    float _2210 = in.m_66.y;
    float _2212 = in.m_66.z;
    int _2214 = abs(_2188);
    float _2216 = fma(_2042, _2042, _2202);
    int _2218 = ~_2192;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = abs(_2200);
    int _2226 = abs(_2206);
    int _2228 = _2222 * as_type<int>(_2026);
    int _2230 = _2228 + _2196;
    int _2232 = ~_2214;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = ~_2224;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = _2236 * as_type<int>(_1998);
    int _2246 = _2244 + _2184;
    bool _2248 = _675 == 0;
    int _2250 = _2230 * _2242;
    int _2252 = ~_2226;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    float _2258 = rsqrt(_2216);
    bool _2260 = _697 == 0;
    float _2262 = _129 + (-0.5);
    bool _2264 = !_2248;
    int _2266 = _2264 ? _2112 : (-1);
    int _2268 = _2246 * _2256;
    bool _2270 = !_2260;
    int _2272 = _2270 ? _2096 : (-1);
    float _2274 = -_2076;
    float _2276 = _2274 + 1.0;
    float _2278 = float(_1976);
    int _2280 = _2266 * _2224;
    int _2282 = _2280 + _2250;
    float _2284 = -_2074;
    float _2286 = _2284 + 1.0;
    int _2288 = _2272 * _2226;
    int _2290 = _2288 + _2268;
    float _2292 = fma(_1454, _2276, _1838);
    float _2294 = -_1604;
    float _2296 = _2294 + 1.0;
    float _2298 = -_2006;
    float _2300 = _2298 + 1.0;
    if (_2072)
    {
        _1478 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2302 = _1478;
    float _2304 = _2278 * _2008;
    float _2306 = _1888 * _2258;
    float _2308 = -_2286;
    float _2310 = fma(_1430, _2308, _1850);
    float _2312 = -_2296;
    float _2314 = fma(_1490, _2312, _2102);
    float _2316 = fma(_1542, _2300, _2128);
    float _2318 = -_2306;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1888);
    float _2322 = _2304 * (-2.0);
    float _2324 = _1938 * _2258;
    if (_2072)
    {
        float _2326 = _2302 * 5.0;
        _2078 = as_type<int>(_2326);
    }
    int _2328 = _2078;
    float _2330 = float(_2282);
    float _2332 = fma(_2322, _2208, _2208);
    float _2334 = float(_2290);
    float _2336 = -_2324;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1938);
    float _2340 = _2320 * _2320;
    if (_2072)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7080 = as_type<float>(_2328);
        out.gl_Position.z = _7080;
    }
    float _2342 = fma(_1794, _2322, _1794);
    float _2344 = fma(_2262, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2332);
    float _2346 = fma(_2338, _2338, _2340);
    out.m_68.x = _2310;
    out.m_68.y = _2292;
    out.m_68.z = _2314;
    out.m_68.w = _2316;
    float _2348 = _2042 * _2258;
    out.m_70.x = _2330;
    out.m_70.y = _2334;
    if (_2072)
    {
        return out;
    }
    float _2350 = -_2306;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1748);
    float _2354 = -_2324;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1716);
    float _2358 = -_2348;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1734);
    float _2362 = _1914 * (-2.0);
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2366 = _2352 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2370 = _2356 + _2368;
    float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2374 = _2360 + _2372;
    float _2376 = _774 + (-0.5);
    float _2378 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2380 = fma(_2362, _2210, _2210);
    float _2382 = fma(_1762, _2362, _1762);
    float _2384 = -_2348;
    float _2386 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2042);
    float _2388 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2378);
    float _2390 = fma(_2376, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2380);
    float _2392 = fma(_2342, _2082, _2344);
    float _2394 = fma(_2386, _2386, _2346);
    float _2396 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2388);
    float _2398 = _2038 * (-2.0);
    float _2400 = fma(_2382, _2082, _2390);
    float _2402 = _1352 + (-0.5);
    float _2404 = fma(_1770, _2398, _1770);
    bool _2406 = _2396 >= 0.0;
    float _2408 = fma(_2398, _2212, _2212);
    float _2410 = _2400 * 0.15915493667125701904296875;
    float _2412 = in.m_64.x;
    float _2414 = in.m_64.y;
    float _2416 = _2392 * 0.15915493667125701904296875;
    float _2418 = fma(_2402, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2408);
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2420;
    float _2424 = _2410 * 6.283185482025146484375;
    float _2426 = sin(_2424);
    float _2428 = fma(_1818, _1796, _1842);
    float _2430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2430;
    float _2434 = fma(_2422, _1712, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2436 = fma(_2404, _2082, _2418);
    float _2438 = _2408;
    float _2440 = _2366;
    if (_2406)
    {
        _2438 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2442 = _2438;
    float _2444 = fma(_2434, _1786, _1852);
    float _2446 = sqrt(_2394);
    int _2448 = as_type<int>(_2442);
    if (_2406)
    {
        out.m_47.x = 0.0;
    }
    if (_2406)
    {
        float _2450 = _2442 * 5.0;
        _2448 = as_type<int>(_2450);
    }
    int _2452 = _2448;
    float _2454 = fma(_2432, _1712, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2456 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2444);
    float _2458 = _2436 * 0.15915493667125701904296875;
    if (_2406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7309 = as_type<float>(_2452);
        out.gl_Position.z = _7309;
    }
    float _2460 = _2416 * 6.283185482025146484375;
    float _2462 = sin(_2460);
    float _2464 = _2416 * 6.283185482025146484375;
    float _2466 = cos(_2464);
    float _2468 = _2410 * 6.283185482025146484375;
    float _2470 = cos(_2468);
    if (_2406)
    {
        return out;
    }
    float _2472 = _2456 * _2414;
    float _2474 = _2458 * 6.283185482025146484375;
    float _2476 = cos(_2474);
    float _2478 = fma(_2454, _1786, _2428);
    float _2480 = _2258 * _2446;
    float _2482 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _351);
    float _2486 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2478);
    float _2488 = _2466 * _2470;
    float _2490 = _2480 * _2482;
    float _2492 = _2458 * 6.283185482025146484375;
    float _2494 = sin(_2492);
    float _2496 = _2486 * _2412;
    float _2498 = _2466 * _2426;
    float _2500 = _2484 * _2490;
    float _2502 = _2462 * _2426;
    float _2504 = _2496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2506 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _367);
    float _2508 = _2462 * _2470;
    float _2510 = _2466 * _2476;
    float _2512 = _2504 * _2480;
    float _2514 = _2470 * _2476;
    float _2516 = _2462 * _2476;
    float _2518 = _2426 * _2476;
    float _2520 = _2512 * _2506;
    float _2522 = _2510 * _2500;
    float _2524 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2526 = _2524 * 0.5;
    float _2528 = fma(_2494, _2488, _2502);
    float _2530 = -_2508;
    float _2532 = fma(_2494, _2498, _2530);
    float _2534 = -_2500;
    float _2536 = _2494 * _2534;
    float _2538 = -_2498;
    float _2540 = fma(_2494, _2508, _2538);
    float _2542 = fma(_2528, _2520, _2522);
    float _2544 = _2516 * _2500;
    float _2546 = fma(_2514, _2520, _2536);
    float _2548 = fma(_2494, _2502, _2488);
    float _2550 = fma(_2532, _2526, _2542);
    float _2552 = fma(_2540, _2520, _2544);
    float _2554 = fma(_2518, _2526, _2546);
    float _2556 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2558 = fma(_2548, _2526, _2552);
    float _2560 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2562 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2564 = isnan(0.5);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2570 = _2566 || _2568;
    float _2572 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2556);
    float _2574 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2560);
    float _2576 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2572);
    float _2578 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2574);
    float _2580 = _2576 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2582 = _2578 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2584 = _1734 + _2580;
    float _2586 = _1716 + _2582;
    float _2588 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2592 = _2584 + _2590;
    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2596 = _2586 + _2594;
    float _2598 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2588);
    float _2600 = _2592 * _2592;
    float _2602 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2598);
    float _2604 = fma(_2596, _2596, _2600);
    float _2606 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2608 = sqrt(_2604);
    float _2610 = _1748 + _2606;
    bool _2612 = _2608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2614 = _2550;
    float _2616 = _2586;
    float _2618 = _2584;
    float _2620 = _2592;
    float _2622 = _2512;
    if (!_2612)
    {
        _2614 = _2610;
    }
    float _2624 = _2614;
    bool _2626 = !_2612;
    float _2628 = _2624;
    if (!_2626)
    {
        float _2630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2634 = _2608 + _2632;
        float _2636 = rsqrt(_2604);
        float _2638 = _2634 * _2630;
        float _2640 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2642 = _2638 * 0.15915493667125701904296875;
        float _2644 = _2642 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = _2642 * 6.283185482025146484375;
        float _2650 = cos(_2648);
        float _2652 = fma(_2646, _2640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2654 = _2636 * _2652;
        float _2656 = _2650 + (-1.0);
        float _2658 = fma(_2596, _2654, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2660 = fma(_2592, _2654, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2662 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2664 = fma(_2610, _2650, _2662);
        _2616 = _2658;
        _2628 = _2664;
        _2618 = _2660;
    }
    float _2666 = _2616;
    float _2668 = _2628;
    float _2670 = _2618;
    float _2672 = -_2324;
    float _2674 = fma(_2672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2666);
    float _2676 = -_2306;
    float _2678 = fma(_2676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2668);
    float _2680 = -_2348;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2670);
    float _2684 = _2678;
    float _2686 = _2674;
    float _2688 = _2682;
    if (!_2570)
    {
        float _2690 = _2366 * _2366;
        float _2692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2694 = -_1734;
        float _2696 = _2694 + _2670;
        float _2698 = fma(_2370, _2370, _2690);
        float _2700 = fma(_2374, _2374, _2698);
        float _2702 = 1.0 / _2480;
        float _2704 = sqrt(_2700);
        float _2706 = precise::min(_2704, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2708 = _2706 * _2692;
        float _2710 = -_1716;
        float _2712 = _2710 + _2666;
        float _2714 = _2708 * _2702;
        float _2716 = -_1748;
        float _2718 = _2716 + _2668;
        float _2720 = fma(_2712, _2714, _2356);
        float _2722 = fma(_2718, _2714, _2352);
        float _2724 = fma(_2696, _2714, _2360);
        _2684 = _2722;
        _2686 = _2720;
        _2688 = _2724;
        _2440 = _2690;
    }
    float _2726 = _2684;
    float _2728 = _2686;
    float _2730 = _2688;
    float _2732 = _2440;
    float _2734 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2736 = _2726 + _2734;
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2740 = _2728 + _2738;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2744 = _2730 + _2742;
    float _2746 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2748 = _2736 * _2736;
    float _2750 = fma(_2740, _2740, _2748);
    float _2752 = fma(_2744, _2744, _2750);
    float _2754 = rsqrt(_2752);
    float _2756 = sqrt(_2752);
    float _2758 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2760 = _2740 * _2758;
    float _2762 = _2744 * _2758;
    float _2764 = _2760 * _2760;
    float _2766 = _2762 * _2762;
    float _2768 = _2764 + _2766;
    float _2770 = sqrt(_2768);
    bool _2772 = _2770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2776 = _2770 + _2774;
    float _2778 = _2744;
    float _2780 = _2768;
    float _2782 = _2776;
    float _2784 = _2758;
    if (_2772)
    {
        float _2786 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2778 = _2786;
    }
    float _2788 = _2778;
    if (_2772)
    {
        float _2790 = rsqrt(_2768);
        _2780 = _2790;
    }
    float _2792 = _2780;
    float _2794 = _2792;
    if (_2772)
    {
        float _2796 = _2776 * _2788;
        _2782 = _2796;
    }
    float _2798 = _2782;
    if (_2772)
    {
        float _2800 = _2798 * 0.15915493667125701904296875;
        _1870 = _2800;
    }
    float _2802 = _1870;
    float _2804 = _2788;
    if (_2772)
    {
        float _2806 = _2802 * 6.283185482025146484375;
        float _2808 = sin(_2806);
        _2804 = _2808;
    }
    float _2810 = _2804;
    float _2812 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2814 = precise::max(0.0, _2812);
    float _2816 = _2732;
    float _2818 = _2814;
    if (_2772)
    {
        float _2820 = _2802 * 6.283185482025146484375;
        float _2822 = cos(_2820);
        _2816 = _2822;
    }
    float _2824 = _2816;
    float _2826 = -_2758;
    float _2828 = -_2814;
    float _2830 = fma(_2736, _2826, _2828);
    float _2832 = _2830;
    if (_2772)
    {
        float _2834 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2818 = _2834;
    }
    float _2836 = _2818;
    float _2838 = _2810;
    float _2840 = _2836;
    if (_2772)
    {
        float _2842 = fma(_2810, _2836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2838 = _2842;
    }
    float _2844 = _2838;
    float _2846 = _2844;
    float _2848 = _2824;
    if (_2772)
    {
        float _2850 = _2824 + (-1.0);
        _2840 = _2850;
    }
    float _2852 = _2840;
    float _2854 = _2852;
    if (_2772)
    {
        float _2856 = _2792 * _2844;
        _2620 = _2856;
    }
    float _2858 = _2620;
    if (!_2772)
    {
        _2846 = _2760;
    }
    float _2860 = _2846;
    float _2862 = _2860;
    if (_2772)
    {
        float _2864 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2784 = _2864;
    }
    float _2866 = _2784;
    if (_2772)
    {
        float _2868 = _2760 * _2858;
        _2862 = _2868;
    }
    float _2870 = _2862;
    if (!_2772)
    {
        _2854 = _2762;
    }
    float _2872 = _2854;
    float _2874 = _2872;
    if (_2772)
    {
        float _2876 = _2762 * _2858;
        _2874 = _2876;
    }
    float _2878 = _2874;
    if (!_2772)
    {
        _2794 = _2764;
    }
    float _2880 = _2794;
    float _2882 = _2880;
    if (_2772)
    {
        float _2884 = fma(_2830, _2824, _2866);
        _2832 = _2884;
    }
    float _2886 = _2832;
    if (_2772)
    {
        float _2888 = _2870 * _2870;
        _2882 = _2888;
    }
    float _2890 = _2882;
    if (!_2772)
    {
        _2848 = _2766;
    }
    float _2892 = _2848;
    float _2894 = _2892;
    if (_2772)
    {
        float _2896 = _2878 * _2878;
        _2894 = _2896;
    }
    float _2898 = _2894;
    float _2900 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2902 = fma(_2886, _2886, _2890);
    float _2904 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2906 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2900);
    float _2908 = _2902 + _2898;
    float _2910 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2914 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2912);
    float _2916 = precise::clamp(_2914, 0.0, 1.0);
    float _2918 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2906);
    float _2920 = rsqrt(_2908);
    float _2922 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2924 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2910);
    float _2926 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2928 = -_2916;
    float _2930 = _2928 + 1.0;
    float _2932 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2922);
    float _2934 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2924);
    float _2936 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2904);
    float _2938 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2932);
    float _2940 = _2926 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2942 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2944 = abs(_2930);
    float _2946 = log2(_2944);
    float _2948 = _2938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2950 = -_2940;
    float _2952 = fma(_2950, _2746, 1.0);
    float _2954 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2956 = _2920 * _2870;
    float _2958 = _2920 * _2886;
    float _2960 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2936);
    float _2962 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2954);
    float _2964 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2966 = _2920 * _2878;
    float _2968 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2962);
    float _2972 = -_2964;
    float _2974 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2972);
    float _2976 = log2(_2952);
    float _2978 = _2958 + 1.0;
    float _2980 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2970);
    float _2982 = -_2966;
    float _2984 = fma(_2982, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2974);
    float _2986 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2988 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2990 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2992 = fma(_2984, -0.5, 0.5);
    float _2994 = 1.0 / _2980;
    float _2996 = fma(_2984, 0.5, 0.5);
    float _2998 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2988);
    float _3000 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2990);
    float _3002 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2998);
    float _3004 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3000);
    float _3006 = sqrt(_2992);
    float _3008 = _2976 * 0.693147182464599609375;
    float _3010 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3002);
    float _3012 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3004);
    float _3014 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3016 = exp2(_2986);
    float _3018 = _3010 * _2994;
    float _3020 = _3012 * _2994;
    float _3022 = fma(_3018, 0.5, 0.5);
    float _3024 = fma(_3020, -0.5, 0.5);
    float _3026 = _3006 * 0.636619746685028076171875;
    float _3028 = fma(_2996, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3030 = fma(_2996, _3028, -0.212114393711090087890625);
    float _3032 = -_2958;
    float _3034 = fma(_3016, _2978, _3032);
    float _3036 = fma(_2996, _3030, 1.570728778839111328125);
    float _3038 = fma(_3034, 0.5, 0.5);
    float _3040 = -_3036;
    float _3042 = fma(_3026, _3040, 1.0);
    float3 _8260 = float3(_3022, _3024, _3014);
    float _3044 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8260, float3(0.0), isnan(_8260)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8260, float3(0.0), isnan(_8260)), level(0.0)).x;
    float3 _8271 = float3(_3022, _3024, _3014);
    float4 _3047 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8271, float3(0.0), isnan(_8271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8271, float3(0.0), isnan(_8271)), level(0.0)).xyzw;
    float _3049 = _3047.x;
    float _3051 = _3047.y;
    float _3053 = _3047.z;
    float _3055 = _3047.w;
    float2 _8288 = float2(_3042, _3038);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8288, float2(0.0), isnan(_8288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8288, float2(0.0), isnan(_8288)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3069 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3071 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3073 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3075 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3067);
    float _3077 = _351 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3079 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3081 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3083 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3085 = fma(_3077, _3077, 1.0);
    float _3087 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3079);
    float _3089 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3081);
    float _3091 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3083);
    float _3093 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3071);
    float _3095 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3073);
    float _3097 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3099 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3101 = _2532 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3103 = _2532 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3105 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3107 = _2532 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3109 = rsqrt(_3085);
    float _3111 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3069);
    float _3113 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3087);
    float _3115 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3075);
    float _3117 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3089);
    float _3119 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3091);
    float _3121 = -_2494;
    float _3123 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3097);
    float _3125 = -_2494;
    float _3127 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3099);
    float _3129 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3101);
    float _3131 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3103);
    float _3133 = -_2494;
    float _3135 = fma(_3133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3105);
    float _3137 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3107);
    float _3139 = _3113 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3141 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3123);
    float _3143 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3127);
    float _3145 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3135);
    float _3147 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3137);
    float _3149 = _3115 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3151 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3153 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3155 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3157 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3111);
    float _3159 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3093);
    float _3161 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3163 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3095);
    float _3165 = _367 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3167 = _3077 * _3141;
    float _3169 = -_615;
    float _3171 = _3169 + _2726;
    float _3173 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3155);
    float _3175 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3151);
    float _3177 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3153);
    float _3179 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3161);
    float _3181 = _3077 * _3143;
    float _3183 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3129);
    float _3185 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    out.m_72.x = _3157;
    out.m_72.y = _3159;
    out.m_72.z = _3163;
    float _3187 = fma(_3165, _3157, _3167);
    float _3189 = _3077 * _3145;
    float _3191 = _3077 * _3109;
    float _3193 = -_613;
    float _3195 = _3193 + _2728;
    float _3197 = fma(_3165, _3159, _3181);
    float _3199 = fma(_3165, _3163, _3189);
    float _3201 = -_3183;
    float _3203 = _3191 * _3201;
    float _3205 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3207 = -_3185;
    float _3209 = _3191 * _3207;
    float _3211 = -_3147;
    float _3213 = _3191 * _3211;
    float _3215 = -_617;
    float _3217 = _3215 + _2730;
    float _3219 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3221 = _3117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3223 = fma(_3109, _3141, _3203);
    float _3225 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3205);
    float _3227 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3219);
    float _3229 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3231 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3233 = fma(_3109, _3143, _3209);
    float _3235 = fma(_3109, _3145, _3213);
    float _3237 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3227);
    float _3239 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3229);
    float _3241 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3231);
    float _3243 = _3221 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    out.m_74.x = _3223;
    out.m_74.y = _3233;
    out.m_74.z = _3235;
    float _3245 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3239);
    float _3247 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3241);
    float _3249 = _3243 + _3179;
    float _3251 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3253 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3255 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3225);
    float _3257 = fma(_3221, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3173);
    float _3259 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3261 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3263 = exp2(_3251);
    float _3265 = _3010 + _2980;
    float _3267 = _3119 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3269 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3255);
    float _3271 = _2980 * 0.5;
    float _3273 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3249);
    float _3275 = _3269 + _2980;
    float _3277 = 1.0 / _3253;
    float _3279 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3257);
    float _3281 = _3265 * 0.5;
    float _3283 = _3275 * 0.5;
    float _3285 = _3221 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    out.gl_Position.x = _3010;
    out.gl_Position.y = _3012;
    out.gl_Position.z = _3269;
    out.gl_Position.w = _2980;
    float _3287 = 1.0 / _3273;
    float _3289 = -_3263;
    float _3291 = _3289 + 1.0;
    float _3293 = fma(_3012, -0.5, _3271);
    float _3295 = _3183 + _3187;
    out.m_76.x = _2728;
    out.m_76.y = _2726;
    out.m_76.z = _2730;
    float _3297 = _3285 + _3177;
    float _3299 = _3259 * _3277;
    float _3301 = _3261 * _3277;
    float _3303 = _3221 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3305 = _3185 + _3197;
    float _3307 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _3281;
    out.m_78.y = _3293;
    out.m_78.z = _3283;
    out.m_78.w = _2980;
    float _3309 = _3147 + _3199;
    float _3311 = _3303 + _3175;
    float _3313 = _3279 * _3287;
    float _3315 = -_3307;
    float _3317 = _3315 + 1.0;
    out.m_80.y = 1.0;
    float _3319 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3311);
    float _3321 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3297);
    bool _3323 = _3313 > 0.0;
    out.m_82.x = _3295;
    out.m_82.y = _3305;
    out.m_82.z = _3309;
    float _3325 = _3321 * _3287;
    bool _3327 = _3313 < 1.0;
    bool _3329 = _3327 && _3323;
    bool _3331 = _3018 > (-1.0);
    bool _3333 = _3331 && _3329;
    bool _3335 = _3020 > (-1.0);
    bool _3337 = _3335 && _3333;
    bool _3339 = _3018 < 1.0;
    bool _3341 = _3339 && _3337;
    bool _3343 = _3020 < 1.0;
    bool _3345 = _3343 && _3341;
    float _3347 = _3307 * _3044;
    float _3349 = _3055 * _3317;
    float _3351 = _3319 * _3287;
    float _3353 = _3055 * _3347;
    float _3355 = _3065 * _3347;
    float _3357 = fma(_3061, _3353, _3049);
    float _3359 = fma(_3063, _3353, _3051);
    float _3361 = fma(_3055, _3355, _3053);
    out.m_84.x = _3357;
    out.m_84.y = _3359;
    out.m_84.z = _3361;
    out.m_84.w = _3349;
    bool _3363 = !_3345;
    float _3365 = _3010;
    float _3367 = _3012;
    float _3369 = _3243;
    float _3371 = _2980;
    float _3399;
    float _3405;
    if (!_3363)
    {
        float _3373 = -_3325;
        float _3375 = _3020 + _3373;
        float _3377 = -_3351;
        float _3379 = _3018 + _3377;
        float _3381 = -_3299;
        float _3383 = _3018 + _3381;
        float _3385 = -_3301;
        float _3387 = _3020 + _3385;
        float _3389 = _3375 * _3375;
        float _3391 = fma(_3379, _3379, _3389);
        float _3393 = sqrt(_3391);
        bool _3395 = _3393 > 0.0;
        float _3397 = _3393;
        _3399 = _3391;
        if (!_3395)
        {
            _3397 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3401 = _3397;
        bool _3403 = !_3395;
        _3405 = _3401;
        _3407 = _3403;
        if (!_3407)
        {
            float _3409 = _3387 * _3387;
            float _3411 = fma(_3383, _3383, _3409);
            float _3413 = rsqrt(_3391);
            float _3415 = sqrt(_3411);
            float _3417 = _3379 * _3413;
            float _3419 = _3375 * _3413;
            bool _3421 = _3415 > 0.0;
            float _3423 = _3413;
            if (!_3421)
            {
                _3423 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3425 = _3423;
            bool _3427 = !_3421;
            _3405 = _3425;
            _3407 = _3427;
            if (!_3407)
            {
                float _3429 = _2512 * _3267;
                float _3431 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3433 = fma(_3429, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3243);
                float _3435 = fma(_3429, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3285);
                float _3437 = fma(_3429, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3303);
                float _3439 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3433);
                float _3441 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3435);
                float _3443 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3437);
                float _3445 = rsqrt(_3411);
                float _3447 = _3431 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3449 = 1.0 / _3439;
                float _3451 = _3387 * _3447;
                float _3453 = _3383 * _3447;
                float _3455 = _3451 * _3451;
                float _3457 = fma(_3453, _3453, _3455);
                float _3459 = _3387 * _3445;
                float _3461 = _3383 * _3445;
                float _3463 = _3419 * _3459;
                float _3465 = _3441 * _3449;
                float _3467 = _3443 * _3449;
                float _3469 = sqrt(_3457);
                float _3471 = fma(_3417, _3461, _3463);
                float _3473 = _3465 * _3465;
                float _3475 = fma(_3467, _3467, _3473);
                float _3477 = precise::min(0.0, _3471);
                float _3479 = sqrt(_3475);
                float _3481 = _2980 * _3477;
                float _3483 = fma(_3453, _3481, _3010);
                float _3485 = fma(_3451, _3481, _3012);
                out.gl_Position.x = _3483;
                out.gl_Position.y = _3485;
                float _3487 = fma(_3469, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3479);
                float _3489 = 1.0 / _3487;
                float _3491 = _3479 * _3489;
                out.m_80.y = _3491;
                _3365 = _3483;
                _3399 = _3491;
                _3367 = _3485;
                _3369 = _3451;
                _2622 = _3471;
                _3405 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3407 = true;
            }
        }
    }
    else
    {
        float _3493 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3493;
        _3399 = 0.0;
        _2622 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3405 = 0.0;
    }
    _3407 = false;
    float _3495 = _3365;
    float _3497 = _3399;
    float _3499 = _3367;
    float _3501 = _3369;
    float _3503 = _2622;
    float _3505 = _3405;
    bool _3507 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3509 = isnan(_2756);
    bool _3511 = _3507 || _3509;
    bool _3513 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3515 = _3511 || _3513;
    float _3517 = _3497;
    float _3519 = _3501;
    float _3521 = _3499;
    float _3523 = _3495;
    float _3525 = _3503;
    if (!_3515)
    {
        _3517 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3527 = _3517;
    float _3529 = _3527;
    float _3531 = _3527;
    if (!_3515)
    {
        _3371 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3533 = _3371;
    float _3535 = _3533;
    float _3537 = _3533;
    if (!_3515)
    {
        _3519 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3539 = _3519;
    float _3541 = _3539;
    float _3543 = _3539;
    if (!_3515)
    {
        _3521 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3545 = _3521;
    float _3547 = _3545;
    float _3549 = _3545;
    if (!_3515)
    {
        _3523 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3551 = _3523;
    float _3553 = _3551;
    float _3555 = _3551;
    if (!_3515)
    {
        _3525 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3557 = _3525;
    bool _3559 = !_3515;
    float _3561 = _3557;
    float _3563 = _3557;
    if (!_3559)
    {
        bool _3565 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3567 = isnan(_2756);
        bool _3569 = _3565 || _3567;
        bool _3571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3573 = _3569 || _3571;
        if (!_3573)
        {
            float _3575 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3577 = _2756 + _3575;
            float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3581 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3579;
            float _3583 = 1.0 / _3581;
            float _3585 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3587 = _3585 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3589 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3591 = _3589 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3595 = _3593 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3599 = _3597 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3601 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3603 = _3601 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3605 = _3577 * _3583;
            float _3607 = precise::clamp(_3605, 0.0, 1.0);
            float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3613 = fma(_3607, _3587, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3615 = fma(_3607, _3611, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3617 = fma(_3607, _3591, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3619 = fma(_3607, _3595, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3621 = fma(_3607, _3599, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3623 = fma(_3607, _3603, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3537 = _3615;
            _3555 = _3621;
            _3531 = _3613;
            _3549 = _3619;
            _3543 = _3617;
            _3563 = _3623;
            _3625 = true;
        }
        else
        {
            bool _3627 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3629 = isnan(_2756);
            bool _3631 = _3627 || _3629;
            bool _3633 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3635 = _3631 || _3633;
            if (!_3635)
            {
                _3529 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3637 = _3529;
            _3531 = _3637;
            if (!_3635)
            {
                _3535 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3639 = _3535;
            _3537 = _3639;
            if (!_3635)
            {
                _3541 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3641 = _3541;
            _3543 = _3641;
            if (!_3635)
            {
                _3547 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3643 = _3547;
            _3549 = _3643;
            if (!_3635)
            {
                _3553 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3645 = _3553;
            _3555 = _3645;
            if (!_3635)
            {
                _3561 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3647 = _3561;
            bool _3649 = !_3635;
            _3563 = _3647;
            if (!_3649)
            {
                bool _3651 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3653 = isnan(_2756);
                bool _3655 = _3651 || _3653;
                bool _3657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3659 = _3655 || _3657;
                if (!_3659)
                {
                    float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3663 = _2756 + _3661;
                    float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3667 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3665;
                    float _3669 = 1.0 / _3667;
                    float _3671 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3691 = _3663 * _3669;
                    float _3693 = precise::clamp(_3691, 0.0, 1.0);
                    float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3699 = fma(_3693, _3673, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3701 = fma(_3693, _3697, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3703 = fma(_3693, _3677, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3705 = fma(_3693, _3681, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3707 = fma(_3693, _3685, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3709 = fma(_3693, _3689, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3537 = _3701;
                    _3555 = _3707;
                    _3531 = _3699;
                    _3549 = _3705;
                    _3543 = _3703;
                    _3563 = _3709;
                    _3625 = true;
                }
                else
                {
                    _3537 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3555 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3531 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3549 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3543 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3563 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3625 = false;
    float _3711 = _3537;
    float _3713 = _3555;
    float _3715 = _3531;
    float _3717 = _3549;
    float _3719 = _3543;
    float _3721 = _3563;
    float _3723 = fma(_3305, -0.5, 0.5);
    float _3725 = precise::clamp(_3723, 0.0, 1.0);
    float _3727 = -_3711;
    float _3729 = _3727 + _3713;
    float _3731 = -_3715;
    float _3733 = _3731 + _3717;
    float _3735 = -_3719;
    float _3737 = _3735 + _3721;
    bool _3739 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3741 = fma(_3725, _3729, _3711);
    float _3743 = fma(_3725, _3733, _3715);
    float _3745 = fma(_3725, _3737, _3719);
    float _3747 = _3505 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3749 = _3741 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3751 = fma(_3743, 0.298911988735198974609375, _3749);
    out.m_80.w = _3747;
    float _3753 = fma(_3745, 0.114477999508380889892578125, _3751);
    float _3755 = -_3753;
    float _3757 = _3743 + _3755;
    float _3759 = -_3753;
    float _3761 = _3741 + _3759;
    float _3763 = -_3753;
    float _3765 = _3745 + _3763;
    out.m_86.x = 0.0;
    float _3767 = fma(_3757, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3753);
    float _3769 = fma(_3761, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3753);
    float _3771 = fma(_3765, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3753);
    out.m_88.x = _3767;
    out.m_88.y = _3769;
    out.m_88.z = _3771;
    if (!_3739)
    {
        return out;
    }
    float _3773 = -_2726;
    float _3775 = _3773 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3777 = -_2728;
    float _3779 = _3777 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3781 = -_2730;
    float _3783 = _3781 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3785 = _3775 * _3775;
    float _3787 = fma(_3779, _3779, _3785);
    float _3789 = fma(_3783, _3783, _3787);
    float _3791 = sqrt(_3789);
    float _3793 = rsqrt(_3789);
    float _3795 = -_3791;
    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3799 = _3797 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3801 = precise::clamp(_3799, 0.0, 1.0);
    float _3803 = _3779 * _3793;
    float _3805 = _3775 * _3793;
    float _3807 = abs(_3801);
    float _3809 = log2(_3807);
    float _3811 = _3783 * _3793;
    float _3813 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3815 = _3305 * _3805;
    float _3817 = -_3805;
    float _3819 = -_3813;
    float _3821 = fma(_3817, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3819);
    float _3823 = fma(_3295, _3803, _3815);
    float _3825 = -_3811;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3821);
    float _3829 = fma(_3309, _3811, _3823);
    float _3831 = precise::clamp(_3829, 0.0, 1.0);
    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3835 = _3827 + _3833;
    float _3837 = _3809 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3839 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3841 = precise::clamp(_3839, 0.0, 1.0);
    float _3843 = exp2(_3837);
    float _3845 = _3843 * _3841;
    float _3847 = _3831 * _3845;
    float _3849 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3851 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3853 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3849;
    out.m_86.y = _3851;
    out.m_86.z = _3853;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3625 = false;
    bool _3407 = false;
    bool _637 = false;
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
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
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
        float _3910 = as_type<float>(_123);
        out.gl_Position.z = _3910;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3984 = as_type<float>(_163);
        out.gl_Position.z = _3984;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = in.m_59.x;
    float _181 = in.m_59.y;
    float _183 = in.m_59.z;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _165 * _165;
    float _193 = _167 * _167;
    float _195 = fma(_173, _173, _191);
    float _197 = fma(_175, _175, _193);
    float _199 = fma(_179, _179, _195);
    float _201 = _169 * _169;
    float _203 = fma(_181, _181, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_177, _177, _201);
    float _209 = fma(_183, _183, _207);
    float _211 = sqrt(_203);
    float _213 = sqrt(_209);
    bool _215 = _205 > 0.0;
    float _217 = as_type<float>(int(gl_VertexIndex));
    bool _219 = _211 > 0.0;
    float _221 = 0.0;
    float _223 = _203;
    float _225 = _171;
    if (_215)
    {
        float _227 = rsqrt(_199);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = 0.0;
    if (!_215)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _213 > 0.0;
    float _237 = 0.0;
    float _239 = _233;
    if (!_215)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = 0.0;
    float _245 = _241;
    if (!_219)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    float _249 = 0.0;
    float _251 = _247;
    if (_219)
    {
        float _253 = rsqrt(_203);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = 0.0;
    if (!_219)
    {
        _257 = 0.0;
    }
    float _259 = _257;
    int _261 = as_type<int>(_217) & 1;
    bool _263 = _261 != 0;
    int _265 = as_type<int>(_217) & 2;
    bool _267 = _265 != 0;
    bool _269 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _273 = _269 || _271;
    bool _275 = isnan(1.0);
    bool _277 = _273 || _275;
    float _279 = _209;
    float _281 = _217;
    float _283 = _259;
    if (_235)
    {
        float _285 = rsqrt(_209);
        _279 = _285;
    }
    float _287 = _279;
    if (!_215)
    {
        _281 = 0.0;
    }
    float _289 = _281;
    float _291 = _289;
    float _293 = _229;
    if (_215)
    {
        float _295 = _229 * _173;
        _239 = _295;
    }
    float _297 = _239;
    if (_215)
    {
        float _299 = _229 * _165;
        _245 = _299;
    }
    float _301 = _245;
    if (_215)
    {
        float _303 = _229 * _179;
        _291 = _303;
    }
    float _305 = _291;
    float _307 = 0.0;
    if (!_235)
    {
        _307 = 0.0;
    }
    float _309 = _307;
    float _311 = 0.0;
    float _313 = _309;
    if (!_235)
    {
        _311 = 0.0;
    }
    float _315 = _311;
    float _317 = _315;
    if (_219)
    {
        float _319 = _255 * _175;
        _251 = _319;
    }
    float _321 = _251;
    if (!_235)
    {
        _293 = 0.0;
    }
    float _323 = _293;
    float _325 = _323;
    if (_219)
    {
        float _327 = _255 * _167;
        _283 = _327;
    }
    float _329 = _283;
    if (!_219)
    {
        _223 = 0.0;
    }
    float _331 = _223;
    float _333 = 0.0;
    float _335 = _331;
    if (!_277)
    {
        float _337 = _171 * _171;
        float _339 = _337 * 0.5;
        _333 = _339;
    }
    float _341 = _333;
    float _343 = _341;
    if (_219)
    {
        float _345 = _255 * _181;
        _335 = _345;
    }
    float _347 = _335;
    bool _349 = !_267;
    float _351 = _349 ? (-0.5) : 0.5;
    if (_235)
    {
        float _353 = _287 * _177;
        _313 = _353;
    }
    float _355 = _313;
    if (_235)
    {
        float _357 = _287 * _169;
        _317 = _357;
    }
    float _359 = _317;
    if (_235)
    {
        float _361 = _287 * _183;
        _325 = _361;
    }
    float _363 = _325;
    bool _365 = !_263;
    float _367 = _365 ? (-0.5) : 0.5;
    float _369 = _363;
    if (!_277)
    {
        float _371 = _341 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _343 = _371;
    }
    float _373 = _343;
    bool _375 = !_277;
    float _377 = _373;
    if (!_375)
    {
        float _379 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _381 = log2(_379);
        float _383 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _385 = _383 + 1.0;
        float _387 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _389 = _171 * _381;
        float _391 = 1.0 / _385;
        float _393 = _387 * 0.693147182464599609375;
        float _395 = exp2(_389);
        float _397 = 1.0 / _393;
        float _399 = _395 + (-1.0);
        float _401 = -_399;
        float _403 = fma(_401, _397, _171);
        float _405 = _403 * _391;
        float _407 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _377 = _407;
    }
    float _409 = _377;
    float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _413 = !_277;
    float _415 = _411;
    if (!_413)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _171 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _225 = _435;
    }
    float _437 = _225;
    float _439 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = _411 * _301;
    float _443 = _411 * _329;
    float _445 = _411 * _359;
    float _447 = _445;
    if (!_277)
    {
        float _449 = _143 * _143;
        float _451 = _449 * 0.5;
        _415 = _451;
    }
    float _453 = _415;
    float _455 = fma(_439, _297, _441);
    float _457 = fma(_439, _321, _443);
    float _459 = fma(_439, _355, _445);
    if (!_277)
    {
        float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _447 = _461;
    }
    float _463 = _447;
    bool _465 = !_277;
    float _467 = _463;
    if (!_465)
    {
        float _469 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _471 = log2(_469);
        float _473 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _475 = _473 + 1.0;
        float _477 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _479 = _143 * _471;
        float _481 = 1.0 / _475;
        float _483 = _477 * 0.693147182464599609375;
        float _485 = exp2(_479);
        float _487 = 1.0 / _483;
        float _489 = _485 + (-1.0);
        float _491 = -_489;
        float _493 = fma(_491, _487, _143);
        float _495 = _493 * _481;
        float _497 = _495 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _467 = _497;
    }
    float _499 = _467;
    float _501 = in.m_64.w;
    float _503 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _505 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _507 = in.m_44.x;
    float _509 = in.m_44.y;
    float _511 = in.m_44.z;
    float _513 = _503 * _329;
    float _515 = _503 * _301;
    float _517 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _519 = _503 * _359;
    float _521 = fma(_505, _305, _455);
    float _523 = fma(_505, _347, _457);
    float _525 = fma(_517, _297, _515);
    float _527 = fma(_517, _321, _513);
    float _529 = _499 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _531 = fma(_517, _355, _519);
    float _533 = fma(_505, _363, _459);
    float _535 = fma(_437, _185, _521);
    float _537 = fma(_529, _305, _525);
    float _539 = fma(_529, _347, _527);
    float _541 = fma(_529, _363, _531);
    float _543 = fma(_437, _187, _523);
    float _545 = fma(_437, _189, _533);
    if (!_277)
    {
        _369 = _143;
    }
    float _547 = _369;
    bool _549 = !_277;
    float _551 = _547;
    if (!_549)
    {
        float _553 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _555 = log2(_553);
        float _557 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _559 = _557 + 1.0;
        float _561 = 1.0 / _559;
        float _563 = _143 * _555;
        float _565 = exp2(_563);
        float _567 = -_565;
        float _569 = _567 + 1.0;
        float _571 = _569 * _561;
        _551 = _571;
    }
    float _573 = _551;
    float _575 = fma(_573, _187, _539);
    bool _577 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _579 = fma(_573, _185, _537);
    float _581 = fma(_573, _189, _541);
    float _583 = -_575;
    float _585 = _543 + _583;
    float _587 = fma(_543, _501, _509);
    float _589 = -_579;
    float _591 = _535 + _589;
    float _593 = -_581;
    float _595 = _545 + _593;
    float _597 = _585 * _175;
    float _599 = _585 * _167;
    float _601 = _585 * _181;
    float _603 = fma(_535, _501, _507);
    float _605 = fma(_591, _173, _597);
    float _607 = fma(_591, _165, _599);
    float _609 = fma(_591, _179, _601);
    float _611 = fma(_545, _501, _511);
    float _613 = fma(_595, _177, _605);
    float _615 = fma(_595, _169, _607);
    float _617 = fma(_595, _183, _609);
    bool _619 = !_577;
    float _635;
    if (!_619)
    {
        float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _623 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _627 = _625 * _621;
        float _629 = floor(_627);
        float _631 = -_629;
        float _633 = _627 + _631;
        _635 = _633;
        _637 = true;
    }
    else
    {
        float _639 = float(_107);
        float _641 = 1.0 / _639;
        float _643 = _143 * _641;
        _635 = _643;
    }
    _637 = false;
    float _645 = _635;
    float _647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _649 = int(_647);
    float _651 = float(_107);
    int _653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _655 = _653 != 0;
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _659 = int(_657);
    bool _661 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _663 = isnan(_645);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _675 = int(_673);
    float _677 = float(_649);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _679;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _687 = 1.0 / _677;
    float _689 = float(_659);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _697 = int(_695);
    float _699 = float(uint(_675));
    int _701 = ~_675;
    int _703 = _701 + 1;
    int _705 = ~_675;
    int _707 = _705 + 1;
    bool _709 = _675 == 0;
    float _711 = 1.0 / _689;
    float _713 = _687 * _143;
    float _715 = 1.0 / _699;
    float _717 = float(uint(_697));
    float _719 = float(_697);
    float _721 = trunc(_713);
    int _723 = int(_721);
    float _725 = _711 * _143;
    float _727 = 1.0 / _717;
    int _729 = as_type<int>(_715) + (-2);
    float _731 = trunc(_725);
    int _733 = int(_731);
    float _735 = float(uint(_723));
    float _737 = float(_723);
    float _739 = as_type<float>(_729) * _735;
    int _741 = as_type<int>(_727) + (-2);
    float _743 = 1.0 / _651;
    int _745 = ~_697;
    int _747 = _745 + 1;
    float _749 = float(uint(_733));
    float _751 = trunc(_739);
    float _753 = precise::max(_751, 0.0);
    uint _756 = uint(_753);
    float _758 = float(_733);
    float _760 = as_type<float>(_741) * _749;
    bool _762 = _758 >= _719;
    bool _764 = isnan(_758);
    bool _766 = _762 || _764;
    bool _768 = isnan(_719);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = in.m_51.y;
    float _776 = trunc(_760);
    float _778 = precise::max(_776, 0.0);
    uint _780 = uint(_778);
    float _782 = _743 * _143;
    int _784 = _703 * int(_756);
    int _786 = _784 + _723;
    float _788 = _760;
    int _790 = _729;
    if (_655)
    {
        _788 = 1.0;
    }
    float _792 = _788;
    float _794 = trunc(_772);
    int _796 = int(_794);
    float _798 = _792;
    if (!_655)
    {
        _798 = 7.345489978790283203125;
    }
    float _800 = _798;
    float _802 = float(uint(_786));
    int _804 = _747 * int(_780);
    int _806 = _804 + _733;
    float _808 = _800 * _129;
    float _810 = as_type<float>(_729) * _802;
    float _812 = _802;
    float _814 = as_type<float>(_806);
    if (_655)
    {
        _812 = 1.0;
    }
    float _816 = _812;
    float _818 = float(uint(_806));
    float _820 = _774 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _822 = _816;
    if (_655)
    {
        _814 = _129;
    }
    float _824 = _814;
    float _826 = trunc(_810);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    float _832 = _824;
    if (!_655)
    {
        _822 = 1.2345600128173828125;
    }
    float _834 = _822;
    float _836 = as_type<float>(_741) * _818;
    if (!_655)
    {
        _832 = _774;
    }
    float _838 = _832;
    float _840 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[78].w, _693);
    float _842 = trunc(_836);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = _834 * _838;
    float _850 = floor(_848);
    int _852 = int(_756) + int(_830);
    int _854 = ~_697;
    int _856 = _854 + 1;
    float _858 = floor(_808);
    int _860 = int(_780) + int(_846);
    int _862 = _707 * _852;
    int _864 = _862 + _723;
    float _866 = float(_675);
    bool _868 = _737 >= _866;
    bool _870 = isnan(_737);
    bool _872 = _868 || _870;
    bool _874 = isnan(_866);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -_850;
    float _882 = _848 + _880;
    bool _884 = uint(_864) >= uint(_675);
    int _886 = _856 * _860;
    int _888 = _886 + _733;
    float _890 = trunc(_878);
    int _892 = int(_890);
    bool _894 = !_884;
    int _896 = _894 ? 0 : (-1);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _900 = _898 != 0;
    float _902 = -_858;
    float _904 = _808 + _902;
    int _906 = ~_852;
    int _908 = _906 + _896;
    int _910 = _908 + 1;
    bool _912 = !_900;
    int _914 = _912 ? 0 : 1;
    float _916 = _904 * _866;
    bool _918 = uint(_888) >= uint(_697);
    float _920 = _866 * _782;
    int _922 = abs(_914);
    float _924 = trunc(_916);
    int _926 = int(_924);
    int _928 = _675 * _910;
    int _930 = _928 + _723;
    float _932 = _882 * _719;
    int _934 = ~_892;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    float _940 = _719 * _782;
    bool _942 = !_709;
    int _944 = _942 ? _930 : (-1);
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _948 = _946 != 0;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _952 = _950 != 0;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _956 = _954 != 0;
    float _958 = trunc(_920);
    int _960 = int(_958);
    bool _962 = !_918;
    int _964 = _962 ? 0 : (-1);
    int _966 = _675 + (-1);
    int _968 = ~_860;
    int _970 = _968 + _964;
    int _972 = _970 + 1;
    int _974 = _944 * _938;
    bool _976 = !_952;
    int _978 = _976 ? 0 : 1;
    int _980 = _926 * _922;
    int _982 = _980 + _723;
    bool _984 = _697 == 0;
    int _986 = _697 * _972;
    int _988 = _986 + _733;
    int _990 = abs(_978);
    int _992 = _892 * _966;
    int _994 = _992 + _974;
    int _996 = ~_796;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    float _1002 = trunc(_932);
    int _1004 = int(_1002);
    bool _1006 = !_984;
    int _1008 = _1006 ? _988 : (-1);
    int _1010 = _994 * _990;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1014 = _1012 != 0;
    int _1016 = _1008 * _1000;
    bool _1018 = !_1014;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = trunc(_940);
    int _1024 = int(_1022);
    bool _1026 = !_948;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = abs(_1020);
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1034 = _1032 != 0;
    int _1036 = _697 + (-1);
    int _1038 = _1004 * _1030;
    int _1040 = _1038 + _733;
    int _1042 = abs(_1028);
    bool _1044 = !_956;
    int _1046 = _1044 ? 0 : 1;
    int _1048 = _796 * _1036;
    int _1050 = _1048 + _1016;
    bool _1052 = !_1034;
    int _1054 = _1052 ? 0 : 1;
    int _1056 = _960 * _1042;
    int _1058 = _1056 + _1010;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1070 = _1068 != 0;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1074 = _1072 != 0;
    int _1076 = abs(_1046);
    int _1078 = abs(_1054);
    bool _1080 = !_1066;
    int _1082 = _1080 ? 0 : 1;
    int _1084 = abs(_1082);
    bool _1086 = !_1062;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = _982 * _1076;
    int _1092 = _1090 + _1058;
    bool _1094 = !_1070;
    int _1096 = _1094 ? 0 : 1;
    int _1098 = _926 * _1078;
    int _1100 = _1098 + _1092;
    int _1102 = abs(_1088);
    int _1104 = _1050 * _1084;
    bool _1106 = !_1074;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = in.m_51.w;
    float _1112 = float(uint(_1100));
    int _1114 = abs(_1096);
    float _1116 = as_type<float>(_729) * _1112;
    int _1118 = abs(_1108);
    int _1120 = _1024 * _1102;
    int _1122 = _1120 + _1104;
    float _1124 = trunc(_1116);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    int _1130 = ~_697;
    int _1132 = _1130 + 1;
    int _1134 = _1040 * _1114;
    int _1136 = _1134 + _1122;
    bool _1138 = _675 == 0;
    int _1140 = _1004 * _1118;
    int _1142 = _1140 + _1136;
    int _1144 = ~_675;
    int _1146 = _1144 + 1;
    float _1148 = float(uint(_1142));
    float _1150 = as_type<float>(_741) * _1148;
    int _1152 = _1146 * int(_1128);
    int _1154 = _1152 + _1100;
    float _1156 = trunc(_1150);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    float _1162 = float(uint(_1154));
    float _1164 = as_type<float>(_729) * _1162;
    float _1166 = trunc(_1164);
    float _1168 = precise::max(_1166, 0.0);
    uint _1170 = uint(_1168);
    int _1172 = _1132 * int(_1160);
    int _1174 = _1172 + _1142;
    int _1176 = ~_697;
    int _1178 = _1176 + 1;
    float _1180 = float(uint(_1174));
    int _1182 = ~_675;
    int _1184 = _1182 + 1;
    float _1186 = as_type<float>(_741) * _1180;
    int _1188 = int(_1128) + int(_1170);
    float _1190 = trunc(_1186);
    float _1192 = precise::max(_1190, 0.0);
    uint _1194 = uint(_1192);
    int _1196 = _1184 * _1188;
    int _1198 = _1196 + _1100;
    bool _1200 = uint(_1198) >= uint(_675);
    float _1202 = _587 * _167;
    bool _1204 = !_1200;
    int _1206 = _1204 ? 0 : (-1);
    int _1208 = ~_1188;
    int _1210 = _1208 + _1206;
    int _1212 = _1210 + 1;
    float _1214 = _587 * _181;
    int _1216 = int(_1160) + int(_1194);
    int _1218 = _675 * _1212;
    int _1220 = _1218 + _1100;
    int _1222 = _1178 * _1216;
    int _1224 = _1222 + _1142;
    float _1226 = float(uint(_982));
    bool _1228 = !_1138;
    int _1230 = _1228 ? _1220 : (-1);
    bool _1232 = uint(_1224) >= uint(_697);
    float _1234 = as_type<float>(_729) * _1226;
    int _1236 = _1230 & 3;
    bool _1238 = _1236 != 0;
    bool _1240 = !_1232;
    int _1242 = _1240 ? 0 : (-1);
    float _1244 = trunc(_1234);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    bool _1250 = uint(_1236) > 1u;
    int _1252 = ~_1216;
    int _1254 = _1252 + _1242;
    int _1256 = _1254 + 1;
    int _1258 = _1230 & 3;
    bool _1260 = _1258 != 0;
    bool _1262 = uint(_1236) >= 2u;
    int _1264 = _697 * _1256;
    int _1266 = _1264 + _1142;
    int _1268 = _1260 ? 0 : 1;
    float _1270 = float(uint(_1040));
    bool _1272 = !_984;
    int _1274 = _1272 ? _1266 : (-1);
    int _1276 = ~_1268;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    float _1282 = as_type<float>(_741) * _1270;
    int _1284 = _1280;
    float _1286 = _1202;
    float _1288 = _1110;
    if (!_1250)
    {
        int _1290 = ~_1268;
        int _1292 = _1290 + 1;
        _1284 = _1292;
    }
    int _1294 = _1284;
    int _1296 = _1274 & 3;
    bool _1298 = _1296 != 0;
    float _1300 = trunc(_1282);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    int _1306 = _1274 & 3;
    bool _1308 = _1306 != 0;
    int _1310 = _1298 ? 0 : 1;
    bool _1312 = _1236 != 3;
    int _1314 = _1262 ? 0 : 1;
    bool _1316 = uint(_1306) > 1u;
    int _1318 = ~_675;
    int _1320 = _1318 + 1;
    int _1322 = ~_1314;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    int _1328 = ~_1310;
    int _1330 = _1328 + 1;
    int _1332 = _1330 + 1;
    int _1334 = _1320 * int(_1248);
    int _1336 = _1334 + _982;
    float _1338 = _129 * 2.0;
    int _1340 = _1326;
    int _1342 = _1332;
    if (_1312)
    {
        int _1344 = ~_1314;
        int _1346 = _1344 + 1;
        _1340 = _1346;
    }
    int _1348 = _1340;
    bool _1350 = _1306 != 3;
    float _1352 = in.m_51.z;
    if (!_1316)
    {
        int _1354 = ~_1310;
        int _1356 = _1354 + 1;
        _1342 = _1356;
    }
    int _1358 = _1342;
    float _1360 = floor(_1338);
    bool _1362 = uint(_1306) >= 2u;
    int _1364 = ~_697;
    int _1366 = _1364 + 1;
    int _1368 = _1362 ? 0 : 1;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1372 = _1370 != 0;
    int _1374 = _1366 * int(_1304);
    int _1376 = _1374 + _1040;
    int _1378 = ~_1368;
    int _1380 = _1378 + 1;
    int _1382 = _1380 + 1;
    float _1384 = _587 * _175;
    float _1386 = float(uint(_1336));
    float _1388 = fma(_603, _165, _1202);
    int _1390 = _1382;
    float _1392 = _1384;
    if (_1350)
    {
        int _1394 = ~_1368;
        int _1396 = _1394 + 1;
        _1390 = _1396;
    }
    int _1398 = _1390;
    bool _1400 = _129 > 0.5;
    float _1402 = as_type<float>(_729) * _1386;
    float _1404 = float(uint(_1376));
    float _1406 = fma(_611, _169, _1388);
    int _1408 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1410 = _1408 != 0;
    float _1412 = _774 * 2.0;
    float _1414 = -_367;
    int _1416 = _1400 ? as_type<int>(_1414) : as_type<int>(_367);
    float _1418 = as_type<float>(_741) * _1404;
    bool _1420 = _774 > 0.5;
    float _1422 = trunc(_1402);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    bool _1428 = !_1410;
    float _1430 = _1428 ? _367 : as_type<float>(_1416);
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1434 = _1432 != 0;
    float _1436 = -_351;
    int _1438 = _1420 ? as_type<int>(_1436) : as_type<int>(_351);
    float _1440 = _1430 + 0.5;
    bool _1442 = _1360 > 0.0;
    float _1444 = trunc(_1418);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    bool _1450 = _1352 > 0.5;
    bool _1452 = !_1434;
    float _1454 = _1452 ? _351 : as_type<float>(_1438);
    bool _1456 = _1360 >= 0.0;
    bool _1458 = isnan(_1360);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = -_367;
    int _1468 = _1450 ? as_type<int>(_1466) : as_type<int>(_367);
    float _1470 = floor(_1412);
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1474 = _1472 != 0;
    int _1476 = _1464 ? 0 : 1;
    float _1478 = _1454;
    if (_1372)
    {
        _790 = 0;
    }
    int _1480 = _790;
    bool _1482 = _1110 > 0.5;
    int _1484 = _1480;
    if (!_1372)
    {
        _1484 = 1;
    }
    int _1486 = _1484;
    bool _1488 = !_1474;
    float _1490 = _1488 ? _367 : as_type<float>(_1468);
    float _1492 = fma(_603, _173, _1384);
    int _1494 = ~_1476;
    int _1496 = _1494 + 1;
    int _1498 = _1496 + 1;
    float _1500 = fma(_603, _179, _1214);
    float _1502 = -_351;
    int _1504 = _1482 ? as_type<int>(_1502) : as_type<int>(_351);
    bool _1506 = _1486 != 1;
    float _1508 = fma(_611, _183, _1500);
    int _1510 = _1498;
    if (!_1442)
    {
        int _1512 = ~_1476;
        int _1514 = _1512 + 1;
        _1510 = _1514;
    }
    int _1516 = _1510;
    int _1518 = ~_675;
    int _1520 = _1518 + 1;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1524 = _1522 != 0;
    int _1526 = ~_697;
    int _1528 = _1526 + 1;
    int _1530 = int(_1304) + int(_1448);
    int _1532 = int(_1248) + int(_1426);
    int _1534 = _1528 * _1530;
    int _1536 = _1534 + _1040;
    bool _1538 = _1470 > 0.0;
    bool _1540 = !_1524;
    float _1542 = _1540 ? _351 : as_type<float>(_1504);
    int _1544 = _1520 * _1532;
    int _1546 = _1544 + _982;
    bool _1548 = _1470 >= 0.0;
    bool _1550 = isnan(_1470);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    int _1558 = _1556 ? 0 : 1;
    float _1560 = as_type<float>(_1520);
    if (!_1506)
    {
        _1286 = _774;
    }
    float _1562 = _1286;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1564;
    float _1568 = _1562;
    if (!_1506)
    {
        _1288 = _774;
    }
    float _1570 = _1288;
    float _1572 = _1570;
    if (!_1506)
    {
        _1560 = _1352;
    }
    float _1574 = _1560;
    float _1576 = _1574;
    if (!_1506)
    {
        _1392 = _1352;
    }
    float _1578 = _1392;
    float _1580 = 1.0 / _1566;
    float _1582 = _1578;
    if (_1506)
    {
        _1568 = _129;
    }
    float _1584 = _1568;
    if (_1506)
    {
        _1572 = _129;
    }
    float _1586 = _1572;
    if (_1506)
    {
        _1576 = _774;
    }
    float _1588 = _1576;
    if (_1506)
    {
        _1582 = _774;
    }
    float _1590 = _1582;
    float _1592 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[83].z, _683);
    bool _1594 = uint(_1536) >= uint(_697);
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1598 = _1596 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1600 = uint(_1546) >= uint(_675);
    float _1602 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1604 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1592);
    int _1606 = ~_1558;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    float _1612 = 1.0 / _1598;
    bool _1614 = !_1594;
    int _1616 = _1614 ? 0 : (-1);
    int _1618 = _1610;
    if (!_1538)
    {
        int _1620 = ~_1558;
        int _1622 = _1620 + 1;
        _1618 = _1622;
    }
    int _1624 = _1618;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1628 = _645 + _1626;
    bool _1630 = !_1600;
    int _1632 = _1630 ? 0 : (-1);
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1644 = _1642 != 0;
    float _1646 = fma(_611, _177, _1492);
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1650 = _1648 != 0;
    float _1652 = in.m_57.w;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1656 = _1654 != 0;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1660;
    float _1664 = _1352 * 2.0;
    float _1666 = in.m_59.w;
    float _1668 = -_1658;
    float _1670 = fma(_1602, 2.0, _1668);
    float _1672 = 1.0 / _1662;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1676 = _645 + _1674;
    float _1678 = in.m_55.w;
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1682 = _645 + _1680;
    float _1684 = _1676 * _1612;
    bool _1686 = !_1640;
    int _1688 = _1686 ? 0 : 1;
    float _1690 = -_143;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1670);
    float _1694 = floor(_1664);
    float _1696 = _1628 * _1580;
    float _1698 = _129 + _774;
    float _1700 = _129 + _1352;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1704 = fma(_681, _1696, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1706 = _1698 + (-1.0);
    bool _1708 = !_1636;
    int _1710 = _1708 ? 0 : 1;
    float _1712 = _1682 * _1672;
    float _1714 = _1352 + _774;
    float _1716 = _1646 + _1652;
    float _1718 = _1700 + (-1.0);
    bool _1720 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1722 = isnan(_645);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = _1714 + (-1.0);
    float _1734 = _1508 + _1666;
    bool _1736 = _1694 >= 0.0;
    bool _1738 = isnan(_1694);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan(0.0);
    bool _1744 = _1740 || _1742;
    float _1746 = fma(_820, -2.0, _1702);
    float _1748 = _1406 + _1678;
    bool _1750 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1752 = isnan(_645);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1764 = -_1730;
    float _1766 = _1764 + 1.0;
    int _1768 = _1744 ? 0 : 1;
    float _1770 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1772 = _1694 > 0.0;
    bool _1774 = _645 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1776 = isnan(_645);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = _1760 * _1766;
    float _1788 = -_1760;
    float _1790 = _1788 + 1.0;
    int _1792 = abs(_1688);
    float _1794 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1796 = _671 * _1790;
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1798;
    float _1802 = -_671;
    float _1804 = _1802 + 1.0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1810 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1812 = _1810 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1814 = fma(_1800, _1696, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1816 = _1784 * _1804;
    float _1818 = fma(_1808, _1684, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1820 = fma(_1812, _1684, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1822 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1746);
    float _1824 = _1454 + (-0.5);
    float _1826 = -_1784;
    float _1828 = _1826 + 1.0;
    float _1830 = _1814 * _1816;
    float _1832 = _1704 * _1816;
    float _1834 = -_1824;
    float _1836 = -_1822;
    float _1838 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1836);
    float _1840 = float(_1516);
    float _1842 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1830);
    float _1844 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1832);
    float _1846 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1848 = _1230 >> 31;
    float _1850 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1692);
    float _1852 = fma(_1820, _1796, _1844);
    int _1854 = ~_1768;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    float _1860 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1862 = log2(_1860);
    int _1864 = _1848 & 3;
    float _1866 = fma(_1846, -2.0, _685);
    int _1868 = _1858;
    float _1870 = _1716;
    if (!_1772)
    {
        int _1872 = ~_1768;
        int _1874 = _1872 + 1;
        _1868 = _1874;
    }
    int _1876 = _1868;
    float _1878 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1880 = _1274 >> 31;
    float _1882 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1866);
    int _1884 = _1230 + _1864;
    float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1888 = _1748 + _1886;
    int _1890 = _1880 & 3;
    float _1892 = -_691;
    float _1894 = fma(_1878, 2.0, _1892);
    int _1896 = _1884 >> 2;
    float _1898 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1900 = float(_1792);
    float _1902 = -_143;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1894);
    int _1906 = _1274 + _1890;
    float _1908 = _1862 * _143;
    int _1910 = _1896 << 4;
    int _1912 = _1910 + 368;
    float _1914 = _1900 * _1840;
    int _1916 = _1906 >> 2;
    float _1918 = exp2(_1908);
    uint _1920 = uint(int(uint(_1912) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1938 = _1716 + _1936;
    int _1940 = _1916 << 4;
    int _1942 = _1940 + 512;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1946 = !_1644;
    int _1948 = _1946 ? 0 : 1;
    uint _1950 = uint(int(uint(_1942) >> uint(2)));
    uint _1952 = uint(int(uint(int(_1950)) >> uint(2)));
    int _1954 = int(_1950) & 3;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[int(_1952)][_1954];
    int _1958 = int(_1950) + 1;
    uint _1960 = uint(int(uint(_1958) >> uint(2)));
    int _1962 = _1958 & 3;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[int(_1960)][_1962];
    float _1966 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1898);
    float _1968 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1944);
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1972 = 1.0 + _1970;
    int _1974 = abs(_1948);
    int _1976 = abs(_1710);
    float _1978 = -_1918;
    float _1980 = _1978 + 1.0;
    int _1982 = _1942 + 8;
    uint _1984 = uint(int(uint(_1982) >> uint(2)));
    uint _1986 = uint(int(uint(int(_1984)) >> uint(2)));
    int _1988 = int(_1984) & 3;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[int(_1986)][_1988];
    int _1992 = int(_1984) + 1;
    uint _1994 = uint(int(uint(_1992) >> uint(2)));
    int _1996 = _1992 & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    float _2000 = float(_1624);
    float _2002 = 1.0 / _1972;
    float _2004 = float(_1974);
    float _2006 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1968);
    float _2008 = float(_1876);
    int _2010 = _1912 + 8;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    bool _2028 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2030 = isnan(1.0);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2036 = _2032 || _2034;
    float _2038 = _2004 * _2000;
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _1734 + _2040;
    bool _2044 = !_1238;
    int _2046 = _2044 ? 0 : 1;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2050 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2052 = isnan(0.0);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2058 = _2054 || _2056;
    float _2060 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1966);
    int _2062 = ~_1530;
    int _2064 = _2062 + _1616;
    int _2066 = _2064 + 1;
    float _2068 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2048);
    float _2070 = _2058 ? _1980 : 0.0;
    bool _2072 = _2060 >= 0.0;
    float _2074 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2068);
    float _2076 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _840);
    int _2078 = as_type<int>(_1888);
    if (_2036)
    {
        float _2080 = _2070 * _2002;
        _145 = _2080;
    }
    float _2082 = _145;
    int _2084 = ~_1532;
    int _2086 = _2084 + _1632;
    int _2088 = _2086 + 1;
    float _2090 = _1490 + 0.5;
    int _2092 = abs(_1294);
    int _2094 = _697 * _2066;
    int _2096 = _2094 + _1040;
    bool _2098 = !_1308;
    int _2100 = _2098 ? 0 : 1;
    float _2102 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1904);
    int _2104 = ~_2092;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    int _2110 = _675 * _2088;
    int _2112 = _2110 + _982;
    int _2114 = abs(_1358);
    float _2116 = _1542 + (-0.5);
    int _2118 = abs(_2100);
    int _2120 = _2108 * as_type<int>(_1934);
    int _2122 = abs(_2046);
    float _2124 = -_2116;
    float _2126 = -_1882;
    float _2128 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2126);
    if (_2072)
    {
        out.m_47.x = 0.0;
    }
    int _2130 = abs(_1348);
    int _2132 = ~_2114;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    int _2138 = abs(_1398);
    int _2140 = ~_2122;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    int _2146 = _2136 * as_type<int>(_1964);
    int _2148 = ~_2118;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = _2144 * as_type<int>(_1926);
    int _2156 = _2154 + _2120;
    bool _2158 = _1236 != 3;
    int _2160 = _2152 * as_type<int>(_1956);
    int _2162 = _2160 + _2146;
    bool _2164 = !_2158;
    int _2166 = _2164 ? 0 : (-1);
    int _2168 = ~_2138;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    bool _2174 = _1306 != 3;
    int _2176 = ~_2130;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    int _2182 = _2172 * as_type<int>(_1990);
    int _2184 = _2182 + _2162;
    bool _2186 = !_2174;
    int _2188 = _2186 ? 0 : (-1);
    float _2190 = _1888 * _1888;
    int _2192 = abs(_2166);
    int _2194 = _2180 * as_type<int>(_2018);
    int _2196 = _2194 + _2156;
    bool _2198 = !_1650;
    int _2200 = _2198 ? 0 : 1;
    float _2202 = fma(_1938, _1938, _2190);
    bool _2204 = !_1656;
    int _2206 = _2204 ? 0 : 1;
    float _2208 = in.m_66.x;
    float _2210 = in.m_66.y;
    float _2212 = in.m_66.z;
    int _2214 = abs(_2188);
    float _2216 = fma(_2042, _2042, _2202);
    int _2218 = ~_2192;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = abs(_2200);
    int _2226 = abs(_2206);
    int _2228 = _2222 * as_type<int>(_2026);
    int _2230 = _2228 + _2196;
    int _2232 = ~_2214;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = ~_2224;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = _2236 * as_type<int>(_1998);
    int _2246 = _2244 + _2184;
    bool _2248 = _675 == 0;
    int _2250 = _2230 * _2242;
    int _2252 = ~_2226;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    float _2258 = rsqrt(_2216);
    bool _2260 = _697 == 0;
    float _2262 = _129 + (-0.5);
    bool _2264 = !_2248;
    int _2266 = _2264 ? _2112 : (-1);
    int _2268 = _2246 * _2256;
    bool _2270 = !_2260;
    int _2272 = _2270 ? _2096 : (-1);
    float _2274 = -_2076;
    float _2276 = _2274 + 1.0;
    float _2278 = float(_1976);
    int _2280 = _2266 * _2224;
    int _2282 = _2280 + _2250;
    float _2284 = -_2074;
    float _2286 = _2284 + 1.0;
    int _2288 = _2272 * _2226;
    int _2290 = _2288 + _2268;
    float _2292 = fma(_1454, _2276, _1838);
    float _2294 = -_1604;
    float _2296 = _2294 + 1.0;
    float _2298 = -_2006;
    float _2300 = _2298 + 1.0;
    if (_2072)
    {
        _1478 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2302 = _1478;
    float _2304 = _2278 * _2008;
    float _2306 = _1888 * _2258;
    float _2308 = -_2286;
    float _2310 = fma(_1430, _2308, _1850);
    float _2312 = -_2296;
    float _2314 = fma(_1490, _2312, _2102);
    float _2316 = fma(_1542, _2300, _2128);
    float _2318 = -_2306;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1888);
    float _2322 = _2304 * (-2.0);
    float _2324 = _1938 * _2258;
    if (_2072)
    {
        float _2326 = _2302 * 5.0;
        _2078 = as_type<int>(_2326);
    }
    int _2328 = _2078;
    float _2330 = float(_2282);
    float _2332 = fma(_2322, _2208, _2208);
    float _2334 = float(_2290);
    float _2336 = -_2324;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1938);
    float _2340 = _2320 * _2320;
    if (_2072)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7080 = as_type<float>(_2328);
        out.gl_Position.z = _7080;
    }
    float _2342 = fma(_1794, _2322, _1794);
    float _2344 = fma(_2262, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2332);
    float _2346 = fma(_2338, _2338, _2340);
    out.m_68.x = _2310;
    out.m_68.y = _2292;
    out.m_68.z = _2314;
    out.m_68.w = _2316;
    float _2348 = _2042 * _2258;
    out.m_70.x = _2330;
    out.m_70.y = _2334;
    if (_2072)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2350 = -_2306;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1748);
    float _2354 = -_2324;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1716);
    float _2358 = -_2348;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1734);
    float _2362 = _1914 * (-2.0);
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2366 = _2352 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2370 = _2356 + _2368;
    float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2374 = _2360 + _2372;
    float _2376 = _774 + (-0.5);
    float _2378 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2380 = fma(_2362, _2210, _2210);
    float _2382 = fma(_1762, _2362, _1762);
    float _2384 = -_2348;
    float _2386 = fma(_2384, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2042);
    float _2388 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2378);
    float _2390 = fma(_2376, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2380);
    float _2392 = fma(_2342, _2082, _2344);
    float _2394 = fma(_2386, _2386, _2346);
    float _2396 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2388);
    float _2398 = _2038 * (-2.0);
    float _2400 = fma(_2382, _2082, _2390);
    float _2402 = _1352 + (-0.5);
    float _2404 = fma(_1770, _2398, _1770);
    bool _2406 = _2396 >= 0.0;
    float _2408 = fma(_2398, _2212, _2212);
    float _2410 = _2400 * 0.15915493667125701904296875;
    float _2412 = in.m_64.x;
    float _2414 = in.m_64.y;
    float _2416 = _2392 * 0.15915493667125701904296875;
    float _2418 = fma(_2402, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2408);
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2420;
    float _2424 = _2410 * 6.283185482025146484375;
    float _2426 = sin(_2424);
    float _2428 = fma(_1818, _1796, _1842);
    float _2430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2430;
    float _2434 = fma(_2422, _1712, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2436 = fma(_2404, _2082, _2418);
    float _2438 = _2408;
    float _2440 = _2366;
    if (_2406)
    {
        _2438 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2442 = _2438;
    float _2444 = fma(_2434, _1786, _1852);
    float _2446 = sqrt(_2394);
    int _2448 = as_type<int>(_2442);
    if (_2406)
    {
        out.m_47.x = 0.0;
    }
    if (_2406)
    {
        float _2450 = _2442 * 5.0;
        _2448 = as_type<int>(_2450);
    }
    int _2452 = _2448;
    float _2454 = fma(_2432, _1712, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2456 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2444);
    float _2458 = _2436 * 0.15915493667125701904296875;
    if (_2406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7309 = as_type<float>(_2452);
        out.gl_Position.z = _7309;
    }
    float _2460 = _2416 * 6.283185482025146484375;
    float _2462 = sin(_2460);
    float _2464 = _2416 * 6.283185482025146484375;
    float _2466 = cos(_2464);
    float _2468 = _2410 * 6.283185482025146484375;
    float _2470 = cos(_2468);
    if (_2406)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2472 = _2456 * _2414;
    float _2474 = _2458 * 6.283185482025146484375;
    float _2476 = cos(_2474);
    float _2478 = fma(_2454, _1786, _2428);
    float _2480 = _2258 * _2446;
    float _2482 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _351);
    float _2486 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2478);
    float _2488 = _2466 * _2470;
    float _2490 = _2480 * _2482;
    float _2492 = _2458 * 6.283185482025146484375;
    float _2494 = sin(_2492);
    float _2496 = _2486 * _2412;
    float _2498 = _2466 * _2426;
    float _2500 = _2484 * _2490;
    float _2502 = _2462 * _2426;
    float _2504 = _2496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2506 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _367);
    float _2508 = _2462 * _2470;
    float _2510 = _2466 * _2476;
    float _2512 = _2504 * _2480;
    float _2514 = _2470 * _2476;
    float _2516 = _2462 * _2476;
    float _2518 = _2426 * _2476;
    float _2520 = _2512 * _2506;
    float _2522 = _2510 * _2500;
    float _2524 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2526 = _2524 * 0.5;
    float _2528 = fma(_2494, _2488, _2502);
    float _2530 = -_2508;
    float _2532 = fma(_2494, _2498, _2530);
    float _2534 = -_2500;
    float _2536 = _2494 * _2534;
    float _2538 = -_2498;
    float _2540 = fma(_2494, _2508, _2538);
    float _2542 = fma(_2528, _2520, _2522);
    float _2544 = _2516 * _2500;
    float _2546 = fma(_2514, _2520, _2536);
    float _2548 = fma(_2494, _2502, _2488);
    float _2550 = fma(_2532, _2526, _2542);
    float _2552 = fma(_2540, _2520, _2544);
    float _2554 = fma(_2518, _2526, _2546);
    float _2556 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2558 = fma(_2548, _2526, _2552);
    float _2560 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2562 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2564 = isnan(0.5);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2570 = _2566 || _2568;
    float _2572 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2556);
    float _2574 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2560);
    float _2576 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2572);
    float _2578 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2574);
    float _2580 = _2576 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2582 = _2578 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2584 = _1734 + _2580;
    float _2586 = _1716 + _2582;
    float _2588 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2592 = _2584 + _2590;
    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2596 = _2586 + _2594;
    float _2598 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2588);
    float _2600 = _2592 * _2592;
    float _2602 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2598);
    float _2604 = fma(_2596, _2596, _2600);
    float _2606 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2608 = sqrt(_2604);
    float _2610 = _1748 + _2606;
    bool _2612 = _2608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2614 = _2550;
    float _2616 = _2586;
    float _2618 = _2584;
    float _2620 = _2592;
    float _2622 = _2512;
    if (!_2612)
    {
        _2614 = _2610;
    }
    float _2624 = _2614;
    bool _2626 = !_2612;
    float _2628 = _2624;
    if (!_2626)
    {
        float _2630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2634 = _2608 + _2632;
        float _2636 = rsqrt(_2604);
        float _2638 = _2634 * _2630;
        float _2640 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2642 = _2638 * 0.15915493667125701904296875;
        float _2644 = _2642 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = _2642 * 6.283185482025146484375;
        float _2650 = cos(_2648);
        float _2652 = fma(_2646, _2640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2654 = _2636 * _2652;
        float _2656 = _2650 + (-1.0);
        float _2658 = fma(_2596, _2654, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2660 = fma(_2592, _2654, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2662 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2664 = fma(_2610, _2650, _2662);
        _2616 = _2658;
        _2628 = _2664;
        _2618 = _2660;
    }
    float _2666 = _2616;
    float _2668 = _2628;
    float _2670 = _2618;
    float _2672 = -_2324;
    float _2674 = fma(_2672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2666);
    float _2676 = -_2306;
    float _2678 = fma(_2676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2668);
    float _2680 = -_2348;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2670);
    float _2684 = _2678;
    float _2686 = _2674;
    float _2688 = _2682;
    if (!_2570)
    {
        float _2690 = _2366 * _2366;
        float _2692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2694 = -_1734;
        float _2696 = _2694 + _2670;
        float _2698 = fma(_2370, _2370, _2690);
        float _2700 = fma(_2374, _2374, _2698);
        float _2702 = 1.0 / _2480;
        float _2704 = sqrt(_2700);
        float _2706 = precise::min(_2704, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2708 = _2706 * _2692;
        float _2710 = -_1716;
        float _2712 = _2710 + _2666;
        float _2714 = _2708 * _2702;
        float _2716 = -_1748;
        float _2718 = _2716 + _2668;
        float _2720 = fma(_2712, _2714, _2356);
        float _2722 = fma(_2718, _2714, _2352);
        float _2724 = fma(_2696, _2714, _2360);
        _2684 = _2722;
        _2686 = _2720;
        _2688 = _2724;
        _2440 = _2690;
    }
    float _2726 = _2684;
    float _2728 = _2686;
    float _2730 = _2688;
    float _2732 = _2440;
    float _2734 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2736 = _2726 + _2734;
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2740 = _2728 + _2738;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2744 = _2730 + _2742;
    float _2746 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2748 = _2736 * _2736;
    float _2750 = fma(_2740, _2740, _2748);
    float _2752 = fma(_2744, _2744, _2750);
    float _2754 = rsqrt(_2752);
    float _2756 = sqrt(_2752);
    float _2758 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2760 = _2740 * _2758;
    float _2762 = _2744 * _2758;
    float _2764 = _2760 * _2760;
    float _2766 = _2762 * _2762;
    float _2768 = _2764 + _2766;
    float _2770 = sqrt(_2768);
    bool _2772 = _2770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2776 = _2770 + _2774;
    float _2778 = _2744;
    float _2780 = _2768;
    float _2782 = _2776;
    float _2784 = _2758;
    if (_2772)
    {
        float _2786 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2778 = _2786;
    }
    float _2788 = _2778;
    if (_2772)
    {
        float _2790 = rsqrt(_2768);
        _2780 = _2790;
    }
    float _2792 = _2780;
    float _2794 = _2792;
    if (_2772)
    {
        float _2796 = _2776 * _2788;
        _2782 = _2796;
    }
    float _2798 = _2782;
    if (_2772)
    {
        float _2800 = _2798 * 0.15915493667125701904296875;
        _1870 = _2800;
    }
    float _2802 = _1870;
    float _2804 = _2788;
    if (_2772)
    {
        float _2806 = _2802 * 6.283185482025146484375;
        float _2808 = sin(_2806);
        _2804 = _2808;
    }
    float _2810 = _2804;
    float _2812 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2814 = precise::max(0.0, _2812);
    float _2816 = _2732;
    float _2818 = _2814;
    if (_2772)
    {
        float _2820 = _2802 * 6.283185482025146484375;
        float _2822 = cos(_2820);
        _2816 = _2822;
    }
    float _2824 = _2816;
    float _2826 = -_2758;
    float _2828 = -_2814;
    float _2830 = fma(_2736, _2826, _2828);
    float _2832 = _2830;
    if (_2772)
    {
        float _2834 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2818 = _2834;
    }
    float _2836 = _2818;
    float _2838 = _2810;
    float _2840 = _2836;
    if (_2772)
    {
        float _2842 = fma(_2810, _2836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2838 = _2842;
    }
    float _2844 = _2838;
    float _2846 = _2844;
    float _2848 = _2824;
    if (_2772)
    {
        float _2850 = _2824 + (-1.0);
        _2840 = _2850;
    }
    float _2852 = _2840;
    float _2854 = _2852;
    if (_2772)
    {
        float _2856 = _2792 * _2844;
        _2620 = _2856;
    }
    float _2858 = _2620;
    if (!_2772)
    {
        _2846 = _2760;
    }
    float _2860 = _2846;
    float _2862 = _2860;
    if (_2772)
    {
        float _2864 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2784 = _2864;
    }
    float _2866 = _2784;
    if (_2772)
    {
        float _2868 = _2760 * _2858;
        _2862 = _2868;
    }
    float _2870 = _2862;
    if (!_2772)
    {
        _2854 = _2762;
    }
    float _2872 = _2854;
    float _2874 = _2872;
    if (_2772)
    {
        float _2876 = _2762 * _2858;
        _2874 = _2876;
    }
    float _2878 = _2874;
    if (!_2772)
    {
        _2794 = _2764;
    }
    float _2880 = _2794;
    float _2882 = _2880;
    if (_2772)
    {
        float _2884 = fma(_2830, _2824, _2866);
        _2832 = _2884;
    }
    float _2886 = _2832;
    if (_2772)
    {
        float _2888 = _2870 * _2870;
        _2882 = _2888;
    }
    float _2890 = _2882;
    if (!_2772)
    {
        _2848 = _2766;
    }
    float _2892 = _2848;
    float _2894 = _2892;
    if (_2772)
    {
        float _2896 = _2878 * _2878;
        _2894 = _2896;
    }
    float _2898 = _2894;
    float _2900 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2902 = fma(_2886, _2886, _2890);
    float _2904 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2906 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2900);
    float _2908 = _2902 + _2898;
    float _2910 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2914 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2912);
    float _2916 = precise::clamp(_2914, 0.0, 1.0);
    float _2918 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2906);
    float _2920 = rsqrt(_2908);
    float _2922 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2924 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2910);
    float _2926 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2928 = -_2916;
    float _2930 = _2928 + 1.0;
    float _2932 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2922);
    float _2934 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2924);
    float _2936 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2904);
    float _2938 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2932);
    float _2940 = _2926 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2942 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2944 = abs(_2930);
    float _2946 = log2(_2944);
    float _2948 = _2938 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2950 = -_2940;
    float _2952 = fma(_2950, _2746, 1.0);
    float _2954 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2956 = _2920 * _2870;
    float _2958 = _2920 * _2886;
    float _2960 = fma(_2730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2936);
    float _2962 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2954);
    float _2964 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2966 = _2920 * _2878;
    float _2968 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2962);
    float _2972 = -_2964;
    float _2974 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2972);
    float _2976 = log2(_2952);
    float _2978 = _2958 + 1.0;
    float _2980 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2970);
    float _2982 = -_2966;
    float _2984 = fma(_2982, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2974);
    float _2986 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2988 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2990 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2992 = fma(_2984, -0.5, 0.5);
    float _2994 = 1.0 / _2980;
    float _2996 = fma(_2984, 0.5, 0.5);
    float _2998 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2988);
    float _3000 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2990);
    float _3002 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2998);
    float _3004 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3000);
    float _3006 = sqrt(_2992);
    float _3008 = _2976 * 0.693147182464599609375;
    float _3010 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3002);
    float _3012 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3004);
    float _3014 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3016 = exp2(_2986);
    float _3018 = _3010 * _2994;
    float _3020 = _3012 * _2994;
    float _3022 = fma(_3018, 0.5, 0.5);
    float _3024 = fma(_3020, -0.5, 0.5);
    float _3026 = _3006 * 0.636619746685028076171875;
    float _3028 = fma(_2996, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3030 = fma(_2996, _3028, -0.212114393711090087890625);
    float _3032 = -_2958;
    float _3034 = fma(_3016, _2978, _3032);
    float _3036 = fma(_2996, _3030, 1.570728778839111328125);
    float _3038 = fma(_3034, 0.5, 0.5);
    float _3040 = -_3036;
    float _3042 = fma(_3026, _3040, 1.0);
    float3 _8260 = float3(_3022, _3024, _3014);
    float _3044 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8260, float3(0.0), isnan(_8260)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8260, float3(0.0), isnan(_8260)), level(0.0)).x;
    float3 _8271 = float3(_3022, _3024, _3014);
    float4 _3047 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8271, float3(0.0), isnan(_8271)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8271, float3(0.0), isnan(_8271)), level(0.0)).xyzw;
    float _3049 = _3047.x;
    float _3051 = _3047.y;
    float _3053 = _3047.z;
    float _3055 = _3047.w;
    float2 _8288 = float2(_3042, _3038);
    float3 _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8288, float2(0.0), isnan(_8288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8288, float2(0.0), isnan(_8288)), level(0.0)).xyz;
    float _3061 = _3059.x;
    float _3063 = _3059.y;
    float _3065 = _3059.z;
    float _3067 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3069 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3071 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3073 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3075 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3067);
    float _3077 = _351 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3079 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3081 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3083 = _2352 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3085 = fma(_3077, _3077, 1.0);
    float _3087 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3079);
    float _3089 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3081);
    float _3091 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3083);
    float _3093 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3071);
    float _3095 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3073);
    float _3097 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3099 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3101 = _2532 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3103 = _2532 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3105 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3107 = _2532 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3109 = rsqrt(_3085);
    float _3111 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3069);
    float _3113 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3087);
    float _3115 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3075);
    float _3117 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3089);
    float _3119 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3091);
    float _3121 = -_2494;
    float _3123 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3097);
    float _3125 = -_2494;
    float _3127 = fma(_3125, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3099);
    float _3129 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3101);
    float _3131 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3103);
    float _3133 = -_2494;
    float _3135 = fma(_3133, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3105);
    float _3137 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3107);
    float _3139 = _3113 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3141 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3123);
    float _3143 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3127);
    float _3145 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3135);
    float _3147 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3137);
    float _3149 = _3115 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3151 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3153 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3155 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3157 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3111);
    float _3159 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3093);
    float _3161 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3163 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3095);
    float _3165 = _367 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3167 = _3077 * _3141;
    float _3169 = -_615;
    float _3171 = _3169 + _2726;
    float _3173 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3155);
    float _3175 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3151);
    float _3177 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3153);
    float _3179 = fma(_3149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3161);
    float _3181 = _3077 * _3143;
    float _3183 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3129);
    float _3185 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3131);
    out.m_72.x = _3157;
    out.m_72.y = _3159;
    out.m_72.z = _3163;
    float _3187 = fma(_3165, _3157, _3167);
    float _3189 = _3077 * _3145;
    float _3191 = _3077 * _3109;
    float _3193 = -_613;
    float _3195 = _3193 + _2728;
    float _3197 = fma(_3165, _3159, _3181);
    float _3199 = fma(_3165, _3163, _3189);
    float _3201 = -_3183;
    float _3203 = _3191 * _3201;
    float _3205 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3207 = -_3185;
    float _3209 = _3191 * _3207;
    float _3211 = -_3147;
    float _3213 = _3191 * _3211;
    float _3215 = -_617;
    float _3217 = _3215 + _2730;
    float _3219 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3221 = _3117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3223 = fma(_3109, _3141, _3203);
    float _3225 = fma(_2948, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3205);
    float _3227 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3219);
    float _3229 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3231 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3233 = fma(_3109, _3143, _3209);
    float _3235 = fma(_3109, _3145, _3213);
    float _3237 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3227);
    float _3239 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3229);
    float _3241 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3231);
    float _3243 = _3221 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    out.m_74.x = _3223;
    out.m_74.y = _3233;
    out.m_74.z = _3235;
    float _3245 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3239);
    float _3247 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3241);
    float _3249 = _3243 + _3179;
    float _3251 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3253 = _3237 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3255 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3225);
    float _3257 = fma(_3221, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3173);
    float _3259 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3261 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3263 = exp2(_3251);
    float _3265 = _3010 + _2980;
    float _3267 = _3119 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3269 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3255);
    float _3271 = _2980 * 0.5;
    float _3273 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3249);
    float _3275 = _3269 + _2980;
    float _3277 = 1.0 / _3253;
    float _3279 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3257);
    float _3281 = _3265 * 0.5;
    float _3283 = _3275 * 0.5;
    float _3285 = _3221 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    out.gl_Position.x = _3010;
    out.gl_Position.y = _3012;
    out.gl_Position.z = _3269;
    out.gl_Position.w = _2980;
    float _3287 = 1.0 / _3273;
    float _3289 = -_3263;
    float _3291 = _3289 + 1.0;
    float _3293 = fma(_3012, -0.5, _3271);
    float _3295 = _3183 + _3187;
    out.m_76.x = _2728;
    out.m_76.y = _2726;
    out.m_76.z = _2730;
    float _3297 = _3285 + _3177;
    float _3299 = _3259 * _3277;
    float _3301 = _3261 * _3277;
    float _3303 = _3221 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3305 = _3185 + _3197;
    float _3307 = _3291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _3281;
    out.m_78.y = _3293;
    out.m_78.z = _3283;
    out.m_78.w = _2980;
    float _3309 = _3147 + _3199;
    float _3311 = _3303 + _3175;
    float _3313 = _3279 * _3287;
    float _3315 = -_3307;
    float _3317 = _3315 + 1.0;
    out.m_80.y = 1.0;
    float _3319 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3311);
    float _3321 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3297);
    bool _3323 = _3313 > 0.0;
    out.m_82.x = _3295;
    out.m_82.y = _3305;
    out.m_82.z = _3309;
    float _3325 = _3321 * _3287;
    bool _3327 = _3313 < 1.0;
    bool _3329 = _3327 && _3323;
    bool _3331 = _3018 > (-1.0);
    bool _3333 = _3331 && _3329;
    bool _3335 = _3020 > (-1.0);
    bool _3337 = _3335 && _3333;
    bool _3339 = _3018 < 1.0;
    bool _3341 = _3339 && _3337;
    bool _3343 = _3020 < 1.0;
    bool _3345 = _3343 && _3341;
    float _3347 = _3307 * _3044;
    float _3349 = _3055 * _3317;
    float _3351 = _3319 * _3287;
    float _3353 = _3055 * _3347;
    float _3355 = _3065 * _3347;
    float _3357 = fma(_3061, _3353, _3049);
    float _3359 = fma(_3063, _3353, _3051);
    float _3361 = fma(_3055, _3355, _3053);
    out.m_84.x = _3357;
    out.m_84.y = _3359;
    out.m_84.z = _3361;
    out.m_84.w = _3349;
    bool _3363 = !_3345;
    float _3365 = _3010;
    float _3367 = _3012;
    float _3369 = _3243;
    float _3371 = _2980;
    float _3399;
    float _3405;
    if (!_3363)
    {
        float _3373 = -_3325;
        float _3375 = _3020 + _3373;
        float _3377 = -_3351;
        float _3379 = _3018 + _3377;
        float _3381 = -_3299;
        float _3383 = _3018 + _3381;
        float _3385 = -_3301;
        float _3387 = _3020 + _3385;
        float _3389 = _3375 * _3375;
        float _3391 = fma(_3379, _3379, _3389);
        float _3393 = sqrt(_3391);
        bool _3395 = _3393 > 0.0;
        float _3397 = _3393;
        _3399 = _3391;
        if (!_3395)
        {
            _3397 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3401 = _3397;
        bool _3403 = !_3395;
        _3405 = _3401;
        _3407 = _3403;
        if (!_3407)
        {
            float _3409 = _3387 * _3387;
            float _3411 = fma(_3383, _3383, _3409);
            float _3413 = rsqrt(_3391);
            float _3415 = sqrt(_3411);
            float _3417 = _3379 * _3413;
            float _3419 = _3375 * _3413;
            bool _3421 = _3415 > 0.0;
            float _3423 = _3413;
            if (!_3421)
            {
                _3423 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
            }
            float _3425 = _3423;
            bool _3427 = !_3421;
            _3405 = _3425;
            _3407 = _3427;
            if (!_3407)
            {
                float _3429 = _2512 * _3267;
                float _3431 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3433 = fma(_3429, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3243);
                float _3435 = fma(_3429, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3285);
                float _3437 = fma(_3429, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3303);
                float _3439 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3433);
                float _3441 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3435);
                float _3443 = fma(_3267, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3437);
                float _3445 = rsqrt(_3411);
                float _3447 = _3431 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3449 = 1.0 / _3439;
                float _3451 = _3387 * _3447;
                float _3453 = _3383 * _3447;
                float _3455 = _3451 * _3451;
                float _3457 = fma(_3453, _3453, _3455);
                float _3459 = _3387 * _3445;
                float _3461 = _3383 * _3445;
                float _3463 = _3419 * _3459;
                float _3465 = _3441 * _3449;
                float _3467 = _3443 * _3449;
                float _3469 = sqrt(_3457);
                float _3471 = fma(_3417, _3461, _3463);
                float _3473 = _3465 * _3465;
                float _3475 = fma(_3467, _3467, _3473);
                float _3477 = precise::min(0.0, _3471);
                float _3479 = sqrt(_3475);
                float _3481 = _2980 * _3477;
                float _3483 = fma(_3453, _3481, _3010);
                float _3485 = fma(_3451, _3481, _3012);
                out.gl_Position.x = _3483;
                out.gl_Position.y = _3485;
                float _3487 = fma(_3469, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3479);
                float _3489 = 1.0 / _3487;
                float _3491 = _3479 * _3489;
                out.m_80.y = _3491;
                _3365 = _3483;
                _3399 = _3491;
                _3367 = _3485;
                _3369 = _3451;
                _2622 = _3471;
                _3405 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
                _3407 = true;
            }
        }
    }
    else
    {
        float _3493 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3493;
        _3399 = 0.0;
        _2622 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3405 = 0.0;
    }
    _3407 = false;
    float _3495 = _3365;
    float _3497 = _3399;
    float _3499 = _3367;
    float _3501 = _3369;
    float _3503 = _2622;
    float _3505 = _3405;
    bool _3507 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3509 = isnan(_2756);
    bool _3511 = _3507 || _3509;
    bool _3513 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3515 = _3511 || _3513;
    float _3517 = _3497;
    float _3519 = _3501;
    float _3521 = _3499;
    float _3523 = _3495;
    float _3525 = _3503;
    if (!_3515)
    {
        _3517 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3527 = _3517;
    float _3529 = _3527;
    float _3531 = _3527;
    if (!_3515)
    {
        _3371 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3533 = _3371;
    float _3535 = _3533;
    float _3537 = _3533;
    if (!_3515)
    {
        _3519 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3539 = _3519;
    float _3541 = _3539;
    float _3543 = _3539;
    if (!_3515)
    {
        _3521 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3545 = _3521;
    float _3547 = _3545;
    float _3549 = _3545;
    if (!_3515)
    {
        _3523 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3551 = _3523;
    float _3553 = _3551;
    float _3555 = _3551;
    if (!_3515)
    {
        _3525 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3557 = _3525;
    bool _3559 = !_3515;
    float _3561 = _3557;
    float _3563 = _3557;
    if (!_3559)
    {
        bool _3565 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3567 = isnan(_2756);
        bool _3569 = _3565 || _3567;
        bool _3571 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3573 = _3569 || _3571;
        if (!_3573)
        {
            float _3575 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3577 = _2756 + _3575;
            float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3581 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3579;
            float _3583 = 1.0 / _3581;
            float _3585 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3587 = _3585 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3589 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3591 = _3589 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3595 = _3593 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3599 = _3597 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3601 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3603 = _3601 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3605 = _3577 * _3583;
            float _3607 = precise::clamp(_3605, 0.0, 1.0);
            float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3613 = fma(_3607, _3587, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3615 = fma(_3607, _3611, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3617 = fma(_3607, _3591, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3619 = fma(_3607, _3595, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3621 = fma(_3607, _3599, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3623 = fma(_3607, _3603, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3537 = _3615;
            _3555 = _3621;
            _3531 = _3613;
            _3549 = _3619;
            _3543 = _3617;
            _3563 = _3623;
            _3625 = true;
        }
        else
        {
            bool _3627 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3629 = isnan(_2756);
            bool _3631 = _3627 || _3629;
            bool _3633 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3635 = _3631 || _3633;
            if (!_3635)
            {
                _3529 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3637 = _3529;
            _3531 = _3637;
            if (!_3635)
            {
                _3535 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3639 = _3535;
            _3537 = _3639;
            if (!_3635)
            {
                _3541 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3641 = _3541;
            _3543 = _3641;
            if (!_3635)
            {
                _3547 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3643 = _3547;
            _3549 = _3643;
            if (!_3635)
            {
                _3553 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3645 = _3553;
            _3555 = _3645;
            if (!_3635)
            {
                _3561 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3647 = _3561;
            bool _3649 = !_3635;
            _3563 = _3647;
            if (!_3649)
            {
                bool _3651 = _2756 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3653 = isnan(_2756);
                bool _3655 = _3651 || _3653;
                bool _3657 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3659 = _3655 || _3657;
                if (!_3659)
                {
                    float _3661 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3663 = _2756 + _3661;
                    float _3665 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3667 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3665;
                    float _3669 = 1.0 / _3667;
                    float _3671 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3673 = _3671 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3675 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3677 = _3675 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3679 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3685 = _3683 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3691 = _3663 * _3669;
                    float _3693 = precise::clamp(_3691, 0.0, 1.0);
                    float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3699 = fma(_3693, _3673, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3701 = fma(_3693, _3697, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3703 = fma(_3693, _3677, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3705 = fma(_3693, _3681, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3707 = fma(_3693, _3685, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3709 = fma(_3693, _3689, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3537 = _3701;
                    _3555 = _3707;
                    _3531 = _3699;
                    _3549 = _3705;
                    _3543 = _3703;
                    _3563 = _3709;
                    _3625 = true;
                }
                else
                {
                    _3537 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3555 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3531 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3549 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3543 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3563 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3625 = false;
    float _3711 = _3537;
    float _3713 = _3555;
    float _3715 = _3531;
    float _3717 = _3549;
    float _3719 = _3543;
    float _3721 = _3563;
    float _3723 = fma(_3305, -0.5, 0.5);
    float _3725 = precise::clamp(_3723, 0.0, 1.0);
    float _3727 = -_3711;
    float _3729 = _3727 + _3713;
    float _3731 = -_3715;
    float _3733 = _3731 + _3717;
    float _3735 = -_3719;
    float _3737 = _3735 + _3721;
    bool _3739 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3741 = fma(_3725, _3729, _3711);
    float _3743 = fma(_3725, _3733, _3715);
    float _3745 = fma(_3725, _3737, _3719);
    float _3747 = _3505 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3749 = _3741 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3751 = fma(_3743, 0.298911988735198974609375, _3749);
    out.m_80.w = _3747;
    float _3753 = fma(_3745, 0.114477999508380889892578125, _3751);
    float _3755 = -_3753;
    float _3757 = _3743 + _3755;
    float _3759 = -_3753;
    float _3761 = _3741 + _3759;
    float _3763 = -_3753;
    float _3765 = _3745 + _3763;
    out.m_86.x = 0.0;
    float _3767 = fma(_3757, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3753);
    float _3769 = fma(_3761, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3753);
    float _3771 = fma(_3765, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3753);
    out.m_88.x = _3767;
    out.m_88.y = _3769;
    out.m_88.z = _3771;
    if (!_3739)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3773 = -_2726;
    float _3775 = _3773 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3777 = -_2728;
    float _3779 = _3777 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3781 = -_2730;
    float _3783 = _3781 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3785 = _3775 * _3775;
    float _3787 = fma(_3779, _3779, _3785);
    float _3789 = fma(_3783, _3783, _3787);
    float _3791 = sqrt(_3789);
    float _3793 = rsqrt(_3789);
    float _3795 = -_3791;
    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3799 = _3797 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3801 = precise::clamp(_3799, 0.0, 1.0);
    float _3803 = _3779 * _3793;
    float _3805 = _3775 * _3793;
    float _3807 = abs(_3801);
    float _3809 = log2(_3807);
    float _3811 = _3783 * _3793;
    float _3813 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3815 = _3305 * _3805;
    float _3817 = -_3805;
    float _3819 = -_3813;
    float _3821 = fma(_3817, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3819);
    float _3823 = fma(_3295, _3803, _3815);
    float _3825 = -_3811;
    float _3827 = fma(_3825, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3821);
    float _3829 = fma(_3309, _3811, _3823);
    float _3831 = precise::clamp(_3829, 0.0, 1.0);
    float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3835 = _3827 + _3833;
    float _3837 = _3809 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3839 = _3835 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3841 = precise::clamp(_3839, 0.0, 1.0);
    float _3843 = exp2(_3837);
    float _3845 = _3843 * _3841;
    float _3847 = _3831 * _3845;
    float _3849 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3851 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3853 = _3847 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3849;
    out.m_86.y = _3851;
    out.m_86.z = _3853;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

