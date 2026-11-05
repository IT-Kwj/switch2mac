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
    float4 m_66 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_62 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _717 = false;
    bool _501 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3982 = as_type<float>(_119);
        out.gl_Position.z = _3982;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _4052 = as_type<float>(_157);
        out.gl_Position.z = _4052;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = in.m_53.x;
    float _175 = in.m_53.y;
    float _177 = in.m_53.z;
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.w;
    float _183 = in.m_47.x;
    float _185 = in.m_47.y;
    float _187 = in.m_47.z;
    float _189 = _159 * _159;
    float _191 = _161 * _161;
    float _193 = _163 * _163;
    float _195 = fma(_167, _167, _189);
    float _197 = fma(_169, _169, _191);
    float _199 = fma(_171, _171, _193);
    float _201 = fma(_173, _173, _195);
    float _203 = fma(_175, _175, _197);
    float _205 = fma(_177, _177, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _207 > 0.0;
    float _213 = sqrt(_205);
    bool _215 = _209 > 0.0;
    int _217 = as_type<int>(_179) & 1;
    bool _219 = _217 != 0;
    int _221 = as_type<int>(_179) & 2;
    bool _223 = _221 != 0;
    float _225 = 0.0;
    float _227 = _203;
    if (_211)
    {
        float _229 = rsqrt(_201);
        _225 = _229;
    }
    float _231 = _225;
    float _233 = in.m_42.x;
    float _235 = in.m_42.y;
    float _237 = in.m_42.z;
    bool _239 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _243 = _239 || _241;
    bool _245 = isnan(1.0);
    bool _247 = _243 || _245;
    float _249 = 0.0;
    float _251 = 0.0;
    if (!_211)
    {
        _249 = 0.0;
        _251 = 0.0;
    }
    float _253 = _249;
    float _255 = _251;
    bool _257 = _213 > 0.0;
    float _259 = 0.0;
    float _261 = _253;
    float _263 = _255;
    if (!_211)
    {
        _259 = 0.0;
    }
    float _265 = _259;
    float _267 = 0.0;
    float _269 = _265;
    if (_215)
    {
        float _271 = rsqrt(_203);
        _267 = _271;
    }
    float _273 = _267;
    float _275 = 0.0;
    float _277 = 0.0;
    if (!_215)
    {
        _275 = 0.0;
        _277 = 0.0;
    }
    float _279 = _275;
    float _281 = _277;
    bool _283 = !_219;
    float _285 = _283 ? (-0.5) : 0.5;
    float _287 = _231;
    float _289 = _281;
    float _291 = _279;
    if (_211)
    {
        float _293 = _231 * _167;
        _261 = _293;
    }
    float _295 = _261;
    if (_211)
    {
        float _297 = _231 * _159;
        _269 = _297;
    }
    float _299 = _269;
    float _301 = _299;
    if (_211)
    {
        float _303 = _231 * _173;
        _263 = _303;
    }
    float _305 = _263;
    if (!_247)
    {
        float _307 = _165 * _165;
        float _309 = _307 * 0.5;
        _287 = _309;
    }
    float _311 = _287;
    float _313 = _311;
    if (!_215)
    {
        _227 = 0.0;
    }
    float _315 = _227;
    float _317 = 0.0;
    float _319 = _315;
    if (_257)
    {
        float _321 = rsqrt(_205);
        _317 = _321;
    }
    float _323 = _317;
    if (!_247)
    {
        float _325 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _325;
    }
    float _327 = _313;
    float _329 = _273;
    float _331 = _327;
    if (_215)
    {
        float _333 = _273 * _169;
        _289 = _333;
    }
    float _335 = _289;
    if (_215)
    {
        float _337 = _273 * _161;
        _291 = _337;
    }
    float _339 = _291;
    if (_215)
    {
        float _341 = _273 * _175;
        _319 = _341;
    }
    float _343 = _319;
    if (!_257)
    {
        _329 = 0.0;
    }
    float _345 = _329;
    bool _347 = !_223;
    float _349 = _347 ? (-0.5) : 0.5;
    bool _351 = !_247;
    float _353 = 0.0;
    float _355 = _345;
    if (!_351)
    {
        float _357 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _359 = log2(_357);
        float _361 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _363 = _361 + 1.0;
        float _365 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = _165 * _359;
        float _369 = 1.0 / _363;
        float _371 = _365 * 0.693147182464599609375;
        float _373 = exp2(_367);
        float _375 = 1.0 / _371;
        float _377 = _373 + (-1.0);
        float _379 = -_377;
        float _381 = fma(_379, _375, _165);
        float _383 = _381 * _369;
        float _385 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _385;
        _353 = _371;
    }
    float _387 = _331;
    float _389 = _353;
    float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _393 = _389;
    float _395 = _387;
    if (_257)
    {
        float _397 = _323 * _163;
        _355 = _397;
    }
    float _399 = _355;
    float _401 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_257)
    {
        _393 = 0.0;
    }
    float _403 = _393;
    float _405 = _391 * _299;
    float _407 = _391 * _399;
    float _409 = _391 * _339;
    float _411 = _403;
    if (_257)
    {
        float _413 = _323 * _171;
        _411 = _413;
    }
    float _415 = _411;
    float _417 = fma(_401, _295, _405);
    float _419 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_257)
    {
        _301 = 0.0;
    }
    float _421 = _301;
    float _423 = _421;
    if (_257)
    {
        float _425 = _323 * _177;
        _423 = _425;
    }
    float _427 = _423;
    float _429 = fma(_401, _335, _409);
    float _431 = fma(_401, _415, _407);
    float _433 = fma(_419, _305, _417);
    if (!_247)
    {
        _395 = _165;
    }
    float _435 = _395;
    bool _437 = !_247;
    float _439 = _435;
    if (!_437)
    {
        float _441 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _443 = log2(_441);
        float _445 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _447 = _445 + 1.0;
        float _449 = 1.0 / _447;
        float _451 = _165 * _443;
        float _453 = exp2(_451);
        float _455 = -_453;
        float _457 = _455 + 1.0;
        float _459 = _457 * _449;
        _439 = _459;
    }
    float _461 = _439;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _465 = fma(_419, _343, _429);
    float _467 = fma(_419, _427, _431);
    float _469 = fma(_461, _183, _433);
    float _471 = fma(_461, _185, _465);
    float _473 = fma(_461, _187, _467);
    float _475 = fma(_469, _181, _233);
    float _477 = fma(_471, _181, _235);
    float _479 = fma(_473, _181, _237);
    bool _481 = !_463;
    float _499;
    if (!_481)
    {
        float _483 = in.m_60.x;
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _487 = _483 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_103);
        float _505 = 1.0 / _503;
        float _507 = _137 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = _509 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _517 = _509 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _527;
    bool _531 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _533 = isnan(_509);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _521;
    float _545 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _547 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _549 = 1.0 / _529;
    float _551 = 1.0 / _525;
    float _553 = _513 * _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _557 = _509 + _555;
    bool _559 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _561 = isnan(_509);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = _557 * _549;
    float _573 = -_569;
    float _575 = _573 + 1.0;
    float _577 = in.m_60.x;
    float _579 = _541 * _575;
    bool _581 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _583 = isnan(_509);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -_541;
    float _595 = _593 + 1.0;
    float _597 = _517 * _551;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _603;
    float _607 = fma(_601, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _609 = fma(_605, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _611 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _613 = isnan(_509);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = -_621;
    float _633 = _631 + 1.0;
    float _635 = _621 * _595;
    float _637 = fma(_625, _597, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _639 = fma(_629, _597, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _641 = _591 * _633;
    float _643 = in.m_58.x;
    float _645 = in.m_58.y;
    float _647 = _545 * _577;
    float _649 = -_591;
    float _651 = _649 + 1.0;
    float _653 = _607 * _641;
    float _655 = _609 * _641;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _661;
    float _665 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].x, _653);
    float _667 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].y, _655);
    float _669 = trunc(_647);
    int _671 = int(_669);
    float _673 = fma(_659, _571, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _675 = fma(_663, _571, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _677 = fma(_637, _635, _665);
    float _679 = fma(_639, _635, _667);
    float _681 = fma(_673, _579, _677);
    float _683 = fma(_675, _579, _679);
    float _685 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[146].x, _681);
    float _687 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[146].y, _683);
    float _689 = _685 * _643;
    float _691 = _687 * _645;
    int _693 = _671 << 4;
    int _695 = _693 + 1712;
    bool _697 = !_547;
    float _699 = as_type<float>(_671);
    float _715;
    if (!_697)
    {
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _703 = _577 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        float _719 = float(_103);
        float _721 = 1.0 / _719;
        float _723 = _137 * _721;
        _715 = _723;
    }
    _717 = false;
    float _725 = _715;
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _729 = int(_727);
    float _731 = in.m_60.w;
    float _733 = _477 * _161;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _737 = _735 != 0;
    float _739 = _477 * _175;
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _743 = int(_741);
    float _745 = fma(_475, _159, _733);
    float _747 = fma(_475, _173, _739);
    float _749 = fma(_479, _163, _745);
    float _751 = float(_729);
    float _753 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _755 = int(_753);
    if (_737)
    {
        _699 = 1.0;
    }
    float _757 = _699;
    float _759 = _749 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _761 = _757;
    if (!_737)
    {
        _761 = 7.345489978790283203125;
    }
    float _763 = _761;
    float _765 = float(_743);
    float _767 = 1.0 / _751;
    float _769 = in.m_60.y;
    float _771 = _763 * _577;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _775 = int(_773);
    float _777 = float(uint(_755));
    int _779 = ~_755;
    int _781 = _779 + 1;
    float _783 = float(_755);
    int _785 = _755 + (-1);
    float _787 = 1.0 / _765;
    float _789 = _767 * _137;
    float _791 = in.m_60.z;
    float _793 = 1.0 / _777;
    float _795 = float(uint(_775));
    bool _797 = _769 > 0.5;
    int _799 = ~_775;
    int _801 = _799 + 1;
    float _803 = trunc(_789);
    int _805 = int(_803);
    float _807 = _787 * _137;
    float _809 = _787;
    if (_737)
    {
        _809 = _577;
    }
    float _811 = _809;
    float _813 = _811;
    if (!_737)
    {
        _813 = _769;
    }
    float _815 = _813;
    float _817 = 1.0 / _795;
    int _819 = as_type<int>(_793) + (-2);
    bool _821 = _791 > 0.5;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _833 = _831 != 0;
    float _835 = trunc(_807);
    int _837 = int(_835);
    float _839 = float(uint(_805));
    float _841 = float(_805);
    float _843 = as_type<float>(_819) * _839;
    float _845 = _839;
    if (_737)
    {
        _845 = 1.0;
    }
    float _847 = _845;
    float _849 = floor(_771);
    int _851 = as_type<int>(_817) + (-2);
    float _853 = _847;
    if (!_737)
    {
        _853 = 1.2345600128173828125;
    }
    float _855 = _853;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _859 = _857 != 0;
    float _861 = float(uint(_837));
    float _863 = trunc(_843);
    float _865 = precise::max(_863, 0.0);
    uint _868 = uint(_865);
    float _870 = _855 * _815;
    float _872 = as_type<float>(_851) * _861;
    int _874 = ~_775;
    int _876 = _874 + 1;
    float _878 = -_849;
    float _880 = _771 + _878;
    float _882 = trunc(_872);
    float _884 = precise::max(_882, 0.0);
    uint _886 = uint(_884);
    int _888 = ~_755;
    int _890 = _888 + 1;
    float _892 = _880 * _783;
    int _894 = _781 * int(_868);
    int _896 = _894 + _805;
    float _898 = floor(_870);
    float _900 = -_349;
    int _902 = _821 ? as_type<int>(_900) : as_type<int>(_349);
    float _904 = float(uint(_896));
    float _906 = -_285;
    int _908 = _797 ? as_type<int>(_906) : as_type<int>(_285);
    int _910 = _876 * int(_886);
    int _912 = _910 + _837;
    float _914 = as_type<float>(_819) * _904;
    bool _916 = !_829;
    float _918 = _916 ? _285 : as_type<float>(_908);
    float _920 = float(uint(_912));
    bool _922 = !_833;
    float _924 = _922 ? _349 : as_type<float>(_902);
    float _926 = trunc(_914);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    bool _932 = !_859;
    int _934 = _932 ? 0 : 1;
    float _936 = as_type<float>(_851) * _920;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _944 = _942 != 0;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _948 = _946 != 0;
    float _950 = -_898;
    float _952 = _870 + _950;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _960 = _958 != 0;
    float _962 = trunc(_936);
    float _964 = precise::max(_962, 0.0);
    uint _966 = uint(_964);
    bool _968 = !_956;
    int _970 = _968 ? 0 : 1;
    bool _972 = _731 > 0.5;
    int _974 = ~_775;
    int _976 = _974 + 1;
    bool _978 = !_944;
    int _980 = _978 ? 0 : 1;
    int _982 = int(_868) + int(_930);
    float _984 = float(_103);
    float _986 = 1.0 / _984;
    int _988 = int(_886) + int(_966);
    int _990 = _890 * _982;
    int _992 = _990 + _805;
    bool _994 = _841 >= _783;
    bool _996 = isnan(_841);
    bool _998 = _994 || _996;
    bool _1000 = isnan(_783);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = -_349;
    int _1008 = _972 ? as_type<int>(_1006) : as_type<int>(_349);
    int _1010 = _976 * _988;
    int _1012 = _1010 + _837;
    bool _1014 = uint(_992) >= uint(_755);
    float _1016 = trunc(_1004);
    int _1018 = int(_1016);
    bool _1020 = !_825;
    float _1022 = _1020 ? _349 : as_type<float>(_1008);
    bool _1024 = uint(_1012) >= uint(_775);
    bool _1026 = !_1014;
    int _1028 = _1026 ? 0 : (-1);
    bool _1030 = !_960;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _986 * _137;
    bool _1036 = !_1024;
    int _1038 = _1036 ? 0 : (-1);
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1046 = _1044 != 0;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1054 = _1052 != 0;
    int _1056 = ~_982;
    int _1058 = _1056 + _1028;
    int _1060 = _1058 + 1;
    float _1062 = float(_775);
    float _1064 = trunc(_892);
    int _1066 = int(_1064);
    bool _1068 = !_1046;
    int _1070 = _1068 ? 0 : 1;
    int _1072 = _755 * _1060;
    int _1074 = _1072 + _805;
    bool _1076 = _755 == 0;
    float _1078 = _952 * _1062;
    int _1080 = ~_1018;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    float _1086 = _783 * _1034;
    bool _1088 = !_1076;
    int _1090 = _1088 ? _1074 : (-1);
    float _1092 = trunc(_1078);
    int _1094 = int(_1092);
    float _1096 = float(_837);
    float _1098 = _1062 * _1034;
    bool _1100 = !_940;
    int _1102 = _1100 ? 0 : 1;
    int _1104 = _1090 * _1084;
    bool _1106 = _1096 >= _1062;
    bool _1108 = isnan(_1096);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1062);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    int _1118 = abs(_1032);
    float _1120 = trunc(_1086);
    int _1122 = int(_1120);
    int _1124 = _1018 * _785;
    int _1126 = _1124 + _1104;
    int _1128 = abs(_980);
    float _1130 = _477 * _169;
    int _1132 = abs(_934);
    int _1134 = abs(_1102);
    float _1136 = fma(_475, _167, _1130);
    float _1138 = trunc(_1116);
    int _1140 = int(_1138);
    int _1142 = _1066 * _1132;
    int _1144 = _1142 + _805;
    int _1146 = ~_988;
    int _1148 = _1146 + _1038;
    int _1150 = _1148 + 1;
    int _1152 = _1126 * _1128;
    bool _1154 = !_948;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1094 * _1118;
    int _1160 = _1158 + _837;
    bool _1162 = _775 == 0;
    int _1164 = _775 * _1150;
    int _1166 = _1164 + _837;
    int _1168 = abs(_1156);
    int _1170 = _1122 * _1134;
    int _1172 = _1170 + _1152;
    int _1174 = abs(_970);
    float _1176 = trunc(_1098);
    int _1178 = int(_1176);
    bool _1180 = !_1162;
    int _1182 = _1180 ? _1166 : (-1);
    int _1184 = _1144 * _1168;
    int _1186 = _1184 + _1172;
    int _1188 = ~_1140;
    int _1190 = _1188 + 1;
    int _1192 = _1190 + 1;
    bool _1194 = !_1042;
    int _1196 = _1194 ? 0 : 1;
    int _1198 = _1066 * _1174;
    int _1200 = _1198 + _1186;
    int _1202 = _775 + (-1);
    int _1204 = _1182 * _1192;
    int _1206 = abs(_1070);
    float _1208 = float(uint(_1200));
    int _1210 = _1140 * _1202;
    int _1212 = _1210 + _1204;
    int _1214 = abs(_1196);
    float _1216 = as_type<float>(_819) * _1208;
    bool _1218 = !_1050;
    int _1220 = _1218 ? 0 : 1;
    int _1222 = _1212 * _1206;
    int _1224 = abs(_1220);
    bool _1226 = !_1054;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = trunc(_1216);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    int _1236 = _1178 * _1214;
    int _1238 = _1236 + _1222;
    int _1240 = ~_755;
    int _1242 = _1240 + 1;
    int _1244 = abs(_1228);
    int _1246 = _1160 * _1224;
    int _1248 = _1246 + _1238;
    int _1250 = ~_755;
    int _1252 = _1250 + 1;
    int _1254 = ~_755;
    int _1256 = _1254 + 1;
    int _1258 = _1094 * _1244;
    int _1260 = _1258 + _1248;
    float _1262 = float(uint(_1144));
    float _1264 = float(uint(_1260));
    int _1266 = _1252 * int(_1234);
    int _1268 = _1266 + _1200;
    float _1270 = as_type<float>(_819) * _1262;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1274 = _1272 != 0;
    float _1276 = as_type<float>(_851) * _1264;
    bool _1278 = _577 > 0.5;
    float _1280 = float(uint(_1268));
    float _1282 = trunc(_1270);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = ~_775;
    int _1290 = _1288 + 1;
    float _1292 = as_type<float>(_819) * _1280;
    float _1294 = trunc(_1276);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = trunc(_1292);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    int _1306 = _1290 * int(_1298);
    int _1308 = _1306 + _1260;
    float _1310 = float(uint(_1308));
    int _1312 = int(_1234) + int(_1304);
    float _1314 = as_type<float>(_851) * _1310;
    int _1316 = ~_775;
    int _1318 = _1316 + 1;
    int _1320 = _1242 * _1312;
    int _1322 = _1320 + _1200;
    float _1324 = trunc(_1314);
    float _1326 = precise::max(_1324, 0.0);
    uint _1328 = uint(_1326);
    float _1330 = float(uint(_1160));
    bool _1332 = uint(_1322) >= uint(_755);
    float _1334 = as_type<float>(_851) * _1330;
    bool _1336 = !_1332;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = trunc(_1334);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    int _1346 = ~_1312;
    int _1348 = _1346 + _1338;
    int _1350 = _1348 + 1;
    int _1352 = int(_1298) + int(_1328);
    int _1354 = ~_775;
    int _1356 = _1354 + 1;
    int _1358 = _1256 * int(_1286);
    int _1360 = _1358 + _1144;
    int _1362 = _755 * _1350;
    int _1364 = _1362 + _1200;
    bool _1366 = !_1076;
    int _1368 = _1366 ? _1364 : (-1);
    int _1370 = _1356 * _1352;
    int _1372 = _1370 + _1260;
    float _1374 = float(uint(_1360));
    int _1376 = _1318 * int(_1344);
    int _1378 = _1376 + _1160;
    int _1380 = _1368 & 3;
    bool _1382 = _1380 != 0;
    bool _1384 = uint(_1372) >= uint(_775);
    float _1386 = as_type<float>(_819) * _1374;
    int _1388 = _1382 ? 0 : 1;
    int _1390 = _1368 & 3;
    bool _1392 = _1390 != 0;
    float _1394 = trunc(_1386);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    float _1400 = float(uint(_1378));
    bool _1402 = !_1384;
    int _1404 = _1402 ? 0 : (-1);
    bool _1406 = uint(_1390) > 1u;
    float _1408 = as_type<float>(_851) * _1400;
    int _1410 = ~_755;
    int _1412 = _1410 + 1;
    int _1414 = ~_1352;
    int _1416 = _1414 + _1404;
    int _1418 = _1416 + 1;
    float _1420 = trunc(_1408);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = ~_1388;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = _285 + 0.5;
    bool _1434 = !_1392;
    int _1436 = _1434 ? 0 : 1;
    int _1438 = _775 * _1418;
    int _1440 = _1438 + _1260;
    bool _1442 = uint(_1390) >= 2u;
    int _1444 = int(_1286) + int(_1398);
    float _1446 = -_349;
    float _1448 = _1446 + 0.5;
    int _1450 = _1430;
    if (!_1406)
    {
        int _1452 = ~_1388;
        int _1454 = _1452 + 1;
        _1450 = _1454;
    }
    int _1456 = _1450;
    bool _1458 = _1390 != 3;
    out.m_62.x = _1432;
    out.m_62.y = _1448;
    bool _1460 = !_1162;
    int _1462 = _1460 ? _1440 : (-1);
    int _1464 = _1412 * _1444;
    int _1466 = _1464 + _1144;
    int _1468 = _1442 ? 0 : 1;
    int _1470 = int(_1344) + int(_1424);
    int _1472 = _1368 >> 31;
    bool _1474 = uint(_1466) >= uint(_755);
    int _1476 = _801 * _1470;
    int _1478 = _1476 + _1160;
    int _1480 = _1462 >> 31;
    int _1482 = ~_1468;
    int _1484 = _1482 + 1;
    int _1486 = _1484 + 1;
    int _1488 = _1472 & 3;
    int _1490 = _1486;
    if (_1458)
    {
        int _1492 = ~_1468;
        int _1494 = _1492 + 1;
        _1490 = _1494;
    }
    int _1496 = _1490;
    bool _1498 = _1390 != 3;
    int _1500 = _1480 & 3;
    int _1502 = _1368 + _1488;
    int _1504 = _1462 + _1500;
    int _1506 = _1502 >> 2;
    int _1508 = _1504 >> 2;
    int _1510 = _1506 << 4;
    int _1512 = _1510 + 368;
    int _1514 = _1508 << 4;
    int _1516 = _1514 + 512;
    uint _1518 = uint(int(uint(_1512) >> uint(2)));
    uint _1520 = uint(int(uint(int(_1518)) >> uint(2)));
    int _1522 = int(_1518) & 3;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[int(_1520)][_1522];
    int _1526 = int(_1518) + 1;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    int _1530 = _1526 & 3;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[int(_1528)][_1530];
    bool _1534 = !_1474;
    int _1536 = _1534 ? 0 : (-1);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1540 = _1538 != 0;
    bool _1542 = !_1498;
    int _1544 = _1542 ? 0 : (-1);
    bool _1546 = !_1540;
    int _1548 = _1546 ? 0 : 1;
    uint _1550 = uint(int(uint(_1516) >> uint(2)));
    uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
    int _1554 = int(_1550) & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    int _1558 = int(_1550) + 1;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    int _1562 = _1558 & 3;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[int(_1560)][_1562];
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1568 = _1566 != 0;
    int _1570 = ~_1444;
    int _1572 = _1570 + _1536;
    int _1574 = _1572 + 1;
    bool _1576 = !_1568;
    int _1578 = _1576 ? 0 : 1;
    int _1580 = _1462 & 3;
    bool _1582 = _1580 != 0;
    int _1584 = _1512 + 8;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    uint _1588 = uint(int(uint(int(_1586)) >> uint(2)));
    int _1590 = int(_1586) & 3;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[int(_1588)][_1590];
    int _1594 = int(_1586) + 1;
    uint _1596 = uint(int(uint(_1594) >> uint(2)));
    int _1598 = _1594 & 3;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[int(_1596)][_1598];
    int _1602 = _1462 & 3;
    bool _1604 = _1602 != 0;
    int _1606 = _755 * _1574;
    int _1608 = _1606 + _1144;
    int _1610 = _1582 ? 0 : 1;
    bool _1612 = !_1604;
    int _1614 = _1612 ? 0 : 1;
    bool _1616 = uint(_1602) >= 2u;
    int _1618 = _1516 + 8;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    uint _1622 = uint(int(uint(int(_1620)) >> uint(2)));
    int _1624 = int(_1620) & 3;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[int(_1622)][_1624];
    int _1628 = int(_1620) + 1;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    int _1632 = _1628 & 3;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[int(_1630)][_1632];
    bool _1636 = uint(_1602) > 1u;
    int _1638 = _1616 ? 0 : 1;
    bool _1640 = _1602 != 3;
    int _1642 = ~_1610;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    int _1648 = ~_1638;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    int _1654 = abs(_1456);
    int _1656 = abs(_1614);
    int _1658 = _1646;
    int _1660 = _1652;
    if (!_1636)
    {
        int _1662 = ~_1610;
        int _1664 = _1662 + 1;
        _1658 = _1664;
    }
    int _1666 = _1658;
    bool _1668 = uint(_1478) >= uint(_775);
    if (_1640)
    {
        int _1670 = ~_1638;
        int _1672 = _1670 + 1;
        _1660 = _1672;
    }
    int _1674 = _1660;
    bool _1676 = !_1668;
    int _1678 = _1676 ? 0 : (-1);
    bool _1680 = _1602 != 3;
    int _1682 = abs(_1666);
    int _1684 = ~_1470;
    int _1686 = _1684 + _1678;
    int _1688 = _1686 + 1;
    bool _1690 = !_1680;
    int _1692 = _1690 ? 0 : (-1);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1696 = _1694 != 0;
    int _1698 = _775 * _1688;
    int _1700 = _1698 + _1160;
    int _1702 = abs(_1436);
    int _1704 = ~_1654;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1712 = _1710 != 0;
    int _1714 = abs(_1496);
    float _1716 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1718 = int(_1716);
    int _1720 = ~_1682;
    int _1722 = _1720 + 1;
    int _1724 = _1722 + 1;
    int _1726 = _1708 * as_type<int>(_1532);
    int _1728 = ~_1702;
    int _1730 = _1728 + 1;
    int _1732 = _1730 + 1;
    int _1734 = _1724 * as_type<int>(_1564);
    int _1736 = ~_1714;
    int _1738 = _1736 + 1;
    int _1740 = _1738 + 1;
    float _1742 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1744 = int(_1742);
    int _1746 = _1732 * as_type<int>(_1524);
    int _1748 = _1746 + _1726;
    int _1750 = ~_1656;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = _577 * 2.0;
    int _1758 = abs(_1674);
    int _1760 = _1740 * as_type<int>(_1592);
    int _1762 = _1760 + _1748;
    int _1764 = abs(_1544);
    int _1766 = _1754 * as_type<int>(_1556);
    int _1768 = _1766 + _1734;
    int _1770 = ~_1758;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    float _1776 = floor(_1756);
    int _1778 = abs(_1692);
    float _1780 = _791 * 2.0;
    int _1782 = abs(_1548);
    int _1784 = _1774 * as_type<int>(_1626);
    int _1786 = _1784 + _1768;
    float _1788 = float(uint(_1718));
    int _1790 = ~_1764;
    int _1792 = _1790 + 1;
    int _1794 = _1792 + 1;
    float _1796 = floor(_1780);
    int _1798 = ~_1778;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = ~_1782;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    int _1810 = _1794 * as_type<int>(_1600);
    int _1812 = _1810 + _1762;
    float _1814 = float(uint(_1744));
    int _1816 = _1802 * as_type<int>(_1634);
    int _1818 = _1816 + _1786;
    int _1820 = abs(_1578);
    float _1822 = 1.0 / _1788;
    int _1824 = _1812 * _1808;
    int _1826 = abs(_1718);
    bool _1828 = !_1076;
    int _1830 = _1828 ? _1608 : (-1);
    float _1832 = float(uint(_1826));
    float _1834 = 1.0 / _1814;
    int _1836 = ~_1820;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = _1830 * _1782;
    int _1844 = _1842 + _1824;
    int _1846 = abs(_1744);
    float _1848 = fma(_479, _171, _1136);
    bool _1850 = !_1162;
    int _1852 = _1850 ? _1700 : (-1);
    int _1854 = _1818 * _1840;
    float _1856 = float(uint(_1846));
    float _1858 = 1.0 / _1832;
    int _1860 = as_type<int>(_1822) + (-2);
    int _1862 = _1852 * _1820;
    int _1864 = _1862 + _1854;
    float _1866 = float(uint(_1844));
    float _1868 = fma(_479, _177, _747);
    float _1870 = _1848 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1872 = float(uint(_1864));
    float _1874 = as_type<float>(_1860) * _1866;
    float _1876 = 1.0 / _1856;
    int _1878 = as_type<int>(_1834) + (-2);
    int _1880 = abs(_1864);
    int _1882 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1884 = _1882 != 0;
    float _1886 = as_type<float>(_1878) * _1872;
    int _1888 = abs(_1844);
    float _1890 = trunc(_1874);
    float _1892 = precise::max(_1890, 0.0);
    uint _1894 = uint(_1892);
    int _1896 = as_type<int>(_1858) + (-2);
    float _1898 = float(uint(_1888));
    float _1900 = float(uint(_1880));
    int _1902 = ~_1718;
    int _1904 = _1902 + 1;
    float _1906 = trunc(_1886);
    float _1908 = precise::max(_1906, 0.0);
    uint _1910 = uint(_1908);
    float _1912 = as_type<float>(_1896) * _1898;
    int _1914 = as_type<int>(_1876) + (-2);
    int _1916 = ~_1744;
    int _1918 = _1916 + 1;
    float _1920 = -_285;
    int _1922 = _1278 ? as_type<int>(_1920) : as_type<int>(_285);
    float _1924 = as_type<float>(_1914) * _1900;
    float _1926 = trunc(_1912);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    int _1932 = _1904 * int(_1894);
    int _1934 = _1932 + _1844;
    int _1936 = as_type<int>(_1834);
    int _1938 = as_type<int>(_1822);
    float _1940 = as_type<float>(_1914);
    float _1942 = _1870;
    if (_1274)
    {
        _1936 = 0;
    }
    int _1944 = _1936;
    int _1946 = _1944;
    if (!_1274)
    {
        _1946 = 1;
    }
    int _1948 = _1946;
    float _1950 = float(uint(_1934));
    float _1952 = trunc(_1924);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = _1918 * int(_1910);
    int _1960 = _1958 + _1864;
    bool _1962 = !_1884;
    float _1964 = _1962 ? _285 : as_type<float>(_1922);
    float _1966 = as_type<float>(_1860) * _1950;
    bool _1968 = _1948 != 1;
    float _1970 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1972 = float(uint(_1960));
    int _1974 = ~_1826;
    int _1976 = _1974 + 1;
    int _1978 = ~_1846;
    int _1980 = _1978 + 1;
    float _1982 = as_type<float>(_1878) * _1972;
    float _1984 = trunc(_1966);
    float _1986 = precise::max(_1984, 0.0);
    uint _1988 = uint(_1986);
    int _1990 = _1976 * int(_1930);
    int _1992 = _1990 + _1888;
    bool _1994 = _1776 > 0.0;
    float _1996 = _769 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2000 = _1776 >= 0.0;
    bool _2002 = isnan(_1776);
    bool _2004 = _2000 || _2002;
    bool _2006 = isnan(0.0);
    bool _2008 = _2004 || _2006;
    float _2010 = float(uint(_1992));
    float _2012 = trunc(_1982);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    int _2018 = _1980 * int(_1956);
    int _2020 = _2018 + _1880;
    float _2022 = as_type<float>(_1992);
    float _2024 = _1996;
    if (_1274)
    {
        _1938 = 0;
    }
    int _2026 = _1938;
    float _2028 = -_1998;
    float _2030 = fma(_1970, 2.0, _2028);
    float _2032 = as_type<float>(_1896) * _2010;
    int _2034 = _2026;
    if (!_1274)
    {
        _2034 = 2;
    }
    int _2036 = _2034;
    float _2038 = float(uint(_2020));
    int _2040 = _2008 ? 0 : 1;
    float _2042 = trunc(_2032);
    float _2044 = precise::max(_2042, 0.0);
    uint _2046 = uint(_2044);
    float _2048 = as_type<float>(_1914) * _2038;
    int _2050 = ~_2040;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    bool _2056 = _2036 != 2;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2060 = _2054;
    if (!_1994)
    {
        int _2062 = ~_2040;
        int _2064 = _2062 + 1;
        _2060 = _2064;
    }
    int _2066 = _2060;
    float _2068 = trunc(_2048);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = int(_1894) + int(_1988);
    float _2076 = fma(_1996, -2.0, _2058);
    int _2078 = ~_1718;
    int _2080 = _2078 + 1;
    float _2082 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2084 = as_type<float>(_1988);
    if (!_1968)
    {
        _2084 = _769;
    }
    float _2086 = _2084;
    int _2088 = _2080 * _2074;
    int _2090 = _2088 + _1844;
    int _2092 = int(_1910) + int(_2016);
    float _2094 = _2082 * _577;
    int _2096 = int(_1930) + int(_2046);
    int _2098 = ~_1826;
    int _2100 = _2098 + 1;
    int _2102 = ~_1846;
    int _2104 = _2102 + 1;
    float _2106 = trunc(_2094);
    int _2108 = int(_2106);
    int _2110 = int(_1956) + int(_2072);
    int _2112 = _2100 * _2096;
    int _2114 = _2112 + _1888;
    float _2116 = _2086;
    float _2118 = as_type<float>(_2046);
    if (!_1968)
    {
        _1940 = _791;
    }
    float _2120 = _1940;
    float _2122 = _2120;
    if (!_1968)
    {
        _2022 = _2086;
    }
    float _2124 = _2022;
    int _2126 = _2104 * _2110;
    int _2128 = _2126 + _1880;
    float _2130 = _2124;
    if (!_1968)
    {
        _2024 = _791;
    }
    float _2132 = _2024;
    float _2134 = _769 * 2.0;
    float _2136 = _2132;
    if (_1968)
    {
        _2130 = _577;
    }
    float _2138 = _2130;
    if (_1968)
    {
        _2116 = _577;
    }
    float _2140 = _2116;
    if (_1968)
    {
        _2122 = _769;
    }
    float _2142 = _2122;
    float _2144 = floor(_2134);
    if (_1968)
    {
        _2136 = _769;
    }
    float _2146 = _2136;
    bool _2148 = uint(_2090) >= uint(_1718);
    int _2150 = ~_1744;
    int _2152 = _2150 + 1;
    bool _2154 = !_2148;
    int _2156 = _2154 ? 0 : (-1);
    bool _2158 = uint(_2114) >= uint(_1826);
    int _2160 = _2152 * _2092;
    int _2162 = _2160 + _1864;
    int _2164 = ~_2074;
    int _2166 = _2164 + _2156;
    int _2168 = _2166 + 1;
    float _2170 = as_type<float>(_2152);
    if (_2056)
    {
        _2118 = _577;
    }
    float _2172 = _2118;
    float _2174 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2176 = _2174 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2178 = _2172;
    if (_2056)
    {
        _2170 = _769;
    }
    float _2180 = _2170;
    bool _2182 = uint(_2162) >= uint(_1744);
    float _2184 = 1.0 / _2176;
    float _2186 = _2180;
    if (!_2056)
    {
        _2178 = _791;
    }
    float _2188 = _2178;
    if (!_2056)
    {
        _2186 = _577;
    }
    float _2190 = _2186;
    bool _2192 = uint(_2128) >= uint(_1846);
    int _2194 = _2108 << 4;
    int _2196 = _2194 + 1968;
    int _2198 = _1718 * _2168;
    int _2200 = _2198 + _1844;
    bool _2202 = !_2182;
    int _2204 = _2202 ? 0 : (-1);
    bool _2206 = !_2158;
    int _2208 = _2206 ? 0 : (-1);
    uint _2210 = uint(int(uint(_2196) >> uint(2)));
    uint _2212 = uint(int(uint(int(_2210)) >> uint(2)));
    int _2214 = int(_2210) & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    int _2218 = int(_2210) + 1;
    uint _2220 = uint(int(uint(_2218) >> uint(2)));
    int _2222 = _2218 & 3;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[int(_2220)][_2222];
    bool _2226 = _1718 == 0;
    bool _2228 = _1718 == 0;
    int _2230 = _1844 ^ _1718;
    int _2232 = _2196 + 8;
    uint _2234 = uint(int(uint(_2232) >> uint(2)));
    uint _2236 = uint(int(uint(int(_2234)) >> uint(2)));
    int _2238 = int(_2234) & 3;
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[int(_2236)][_2238];
    bool _2242 = !_2226;
    int _2244 = _2242 ? _2200 : (-1);
    bool _2246 = _2144 > 0.0;
    uint _2248 = uint(int(uint(_2230) >> uint(31)));
    float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2250;
    bool _2254 = !_2192;
    int _2256 = _2254 ? 0 : (-1);
    int _2258 = _695 + 8;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
    int _2264 = int(_2260) & 3;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[int(_2262)][_2264];
    int _2268 = ~_2092;
    int _2270 = _2268 + _2204;
    int _2272 = _2270 + 1;
    float _2274 = _2252 * _2184;
    bool _2276 = _2144 >= 0.0;
    bool _2278 = isnan(_2144);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan(0.0);
    bool _2284 = _2280 || _2282;
    int _2286 = ~_2208;
    int _2288 = _2096 + _2286;
    int _2290 = _2288 + 1;
    int _2292 = _1744 * _2272;
    int _2294 = _2292 + _1864;
    int _2296 = ~int(_2248);
    int _2298 = _2296 + 1;
    int _2300 = _2284 ? 0 : 1;
    int _2302 = _2290 ^ _2298;
    bool _2304 = _1744 == 0;
    int _2306 = ~_2300;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = ~_2298;
    int _2314 = _2312 + _2302;
    int _2316 = _2314 + 1;
    float _2318 = _577 + _769;
    int _2320 = _2310;
    if (!_2246)
    {
        int _2322 = ~_2300;
        int _2324 = _2322 + 1;
        _2320 = _2324;
    }
    int _2326 = _2320;
    bool _2328 = !_2304;
    int _2330 = _2328 ? _2294 : (-1);
    float _2332 = _2318 + (-1.0);
    uint _2334 = uint(int(uint(_695) >> uint(2)));
    uint _2336 = uint(int(uint(int(_2334)) >> uint(2)));
    int _2338 = int(_2334) & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = int(_2334) + 1;
    uint _2344 = uint(int(uint(_2342) >> uint(2)));
    int _2346 = _2342 & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    bool _2350 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2352 = isnan(_725);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    bool _2362 = !_2228;
    int _2364 = _2362 ? _2316 : (-1);
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2368 = _2366 != 0;
    int _2370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2372 = _2370 != 0;
    int _2374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2376 = _2374 != 0;
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2380 = _725 + _2378;
    bool _2382 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2384 = isnan(_725);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = -_2360;
    float _2396 = _2394 + 1.0;
    bool _2398 = _1796 >= 0.0;
    bool _2400 = isnan(_1796);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan(0.0);
    bool _2406 = _2402 || _2404;
    float _2408 = fma(_2274, _2380, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2410 = _1796 > 0.0;
    float _2412 = _2392 * _2396;
    float _2414 = _2216 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2416 = _2406 ? 0 : 1;
    float _2418 = _2408 * _2412;
    bool _2420 = _1744 == 0;
    float _2422 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2424 = _1864 ^ _1744;
    float _2426 = _2224 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = -_2392;
    float _2430 = _2428 + 1.0;
    float _2432 = _2240 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    uint _2434 = uint(int(uint(_2424) >> uint(31)));
    float _2436 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2440 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2442 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2444 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2418);
    int _2446 = ~int(_2434);
    int _2448 = _2446 + 1;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2452 = ~_2256;
    int _2454 = _2110 + _2452;
    int _2456 = _2454 + 1;
    float _2458 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2462 = _759 + _2460;
    out.m_64.x = _2436;
    out.m_64.y = _2440;
    out.m_64.z = _2442;
    out.m_64.w = _2438;
    int _2464 = _2456 ^ _2448;
    float _2466 = fma(_2360, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2444);
    float _2468 = -_2450;
    float _2470 = fma(_2458, 2.0, _2468);
    float _2472 = _1868 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2476 = _1870 + _2474;
    int _2478 = ~_2416;
    int _2480 = _2478 + 1;
    int _2482 = _2480 + 1;
    float _2484 = -_137;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2470);
    int _2488 = _2482;
    if (!_2410)
    {
        int _2490 = ~_2416;
        int _2492 = _2490 + 1;
        _2488 = _2492;
    }
    int _2494 = _2488;
    float _2496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2498 = ~_2448;
    int _2500 = _2498 + _2464;
    int _2502 = _2500 + 1;
    float _2504 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2506 = _2472 + _2504;
    float _2508 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2510 = _2340 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2512 = _2348 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2516 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2508);
    float _2518 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2522 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2524 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2516);
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2530 = !_2420;
    int _2532 = _2530 ? _2502 : (-1);
    float _2534 = _918 + 0.5;
    bool _2536 = _2524 >= 0.0;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    out.m_66.x = _2520;
    out.m_66.y = _2522;
    out.m_66.z = _2526;
    out.m_66.w = _2528;
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2542 = !_2372;
    int _2544 = _2542 ? 0 : 1;
    float _2546 = _2514 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2548 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2552 = fma(_2546, _2534, _2486);
    float _2554 = -_2538;
    float _2556 = fma(_2548, 2.0, _2554);
    float _2558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2560 = log2(_2558);
    float _2562 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2550);
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2566 = _2462 * _2462;
    int _2568 = abs(_2544);
    float _2570 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2572 = float(_2066);
    float _2574 = fma(_2476, _2476, _2566);
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2578 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2580 = float(_2568);
    float _2582 = fma(_2506, _2506, _2574);
    float _2584 = fma(_2146, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2564);
    float _2586 = fma(_2578, -2.0, _2576);
    float _2588 = _2526;
    if (_2536)
    {
        _2588 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2590 = _2588;
    float _2592 = _2560 * _137;
    bool _2594 = !_2368;
    int _2596 = _2594 ? 0 : 1;
    float _2598 = rsqrt(_2582);
    float _2600 = _2580 * _2572;
    int _2602 = as_type<int>(_2590);
    if (_2536)
    {
        float _2604 = _2590 * 5.0;
        _2602 = as_type<int>(_2604);
    }
    int _2606 = _2602;
    int _2608 = abs(_2596);
    float _2610 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2612 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2614 = exp2(_2592);
    if (_2536)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7570 = as_type<float>(_2606);
        out.gl_Position.z = _7570;
    }
    float _2616 = float(_2244);
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2620 = float(_2608);
    float _2622 = _924 + (-0.5);
    bool _2624 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2626 = isnan(0.0);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2632 = _2628 || _2630;
    float _2634 = fma(_2570, -2.0, _2618);
    float _2636 = _2462 * _2598;
    float _2638 = _2476 * _2598;
    float _2640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2642 = _769 > 0.5;
    float _2644 = -_2636;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2462);
    float _2648 = -_2638;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2476);
    float _2652 = -_137;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2030);
    float _2656 = float(_2494);
    float _2658 = _2646 * _2646;
    float _2660 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2586);
    float _2662 = fma(_2610, _2616, _2654);
    float _2664 = fma(_2650, _2650, _2658);
    float _2666 = _2620 * _2656;
    float _2668 = -_2614;
    float _2670 = _2668 + 1.0;
    float _2672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2676 = 1.0 + _2674;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2680 = -_2612;
    float _2682 = -_2660;
    float _2684 = fma(_2680, _2622, _2682);
    float _2686 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2076);
    float _2688 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2678);
    float _2690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2692 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2688);
    float _2694 = _2632 ? _2670 : 0.0;
    float _2696 = _1964 + 0.5;
    bool _2698 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2700 = isnan(1.0);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2706 = _2702 || _2704;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2710 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2712 = 1.0 / _2676;
    float _2714 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2716 = float(_2330);
    float _2718 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2720 = -_137;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2556);
    float _2724 = fma(_2610, _2696, _2662);
    float _2726 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2708);
    float _2728 = _2672 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2730 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2710);
    float _2732 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2714);
    float _2734 = -_349;
    int _2736 = _2642 ? as_type<int>(_2734) : as_type<int>(_349);
    float _2738 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2634);
    float _2740 = fma(_2718, _2716, _2722);
    float _2742 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2726);
    float _2744 = _2690 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2746 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2730);
    float _2748 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2732);
    float _2750 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2562);
    float _2752 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2584);
    bool _2754 = _791 > 0.5;
    if (_2706)
    {
        float _2756 = _2694 * _2712;
        _139 = _2756;
    }
    float _2758 = _139;
    float _2760 = float(_2364);
    float _2762 = -_2746;
    float _2764 = _2762 + 1.0;
    bool _2766 = !_1712;
    float _2768 = _2766 ? _349 : as_type<float>(_2736);
    float _2770 = -_2748;
    float _2772 = _2770 + 1.0;
    float _2774 = in.m_68.x;
    float _2776 = in.m_68.y;
    float _2778 = in.m_68.z;
    float _2780 = -_285;
    int _2782 = _2754 ? as_type<int>(_2780) : as_type<int>(_285);
    float _2784 = -_2686;
    float _2786 = fma(_2744, _2760, _2784);
    float _2788 = float(_2532);
    float _2790 = _2768 + (-0.5);
    bool _2792 = !_1696;
    float _2794 = _2792 ? _285 : as_type<float>(_2782);
    float _2796 = -_2764;
    float _2798 = fma(_918, _2796, _2552);
    float _2800 = -_2750;
    float _2802 = _2800 + 1.0;
    float _2804 = -_2738;
    float _2806 = fma(_2728, _2788, _2804);
    float _2808 = _1022 + (-0.5);
    float _2810 = _2794 + 0.5;
    float _2812 = -_2744;
    float _2814 = fma(_2812, _2790, _2786);
    float _2816 = -_2692;
    float _2818 = _2816 + 1.0;
    float _2820 = -_2728;
    float _2822 = fma(_2820, _2808, _2806);
    float _2824 = fma(_2718, _2810, _2740);
    float _2826 = -_2742;
    float _2828 = _2826 + 1.0;
    float _2830 = -_2752;
    float _2832 = _2830 + 1.0;
    float _2834 = _2666 * (-2.0);
    float _2836 = fma(_924, _2772, _2684);
    float _2838 = -_2828;
    float _2840 = fma(_1964, _2838, _2724);
    float _2842 = -_2802;
    float _2844 = fma(_2794, _2842, _2824);
    float _2846 = fma(_2768, _2818, _2814);
    float _2848 = _2506 * _2598;
    float _2850 = fma(_1022, _2832, _2822);
    float _2852 = _577 + (-0.5);
    float _2854 = fma(_2834, _2774, _2774);
    float _2856 = -_2848;
    float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2506);
    out.m_70.x = _2798;
    out.m_70.y = _2836;
    float _2860 = fma(_2422, _2834, _2422);
    float _2862 = fma(_2852, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2854);
    float _2864 = fma(_2858, _2858, _2664);
    out.m_72.x = _2840;
    out.m_72.y = _2846;
    out.m_72.z = _2844;
    out.m_72.w = _2850;
    float _2866 = _791 + _769;
    bool _2868 = !_2376;
    int _2870 = _2868 ? 0 : 1;
    float _2872 = _2778;
    float _2874 = _2848;
    if (_2536)
    {
        out.m_45.x = 0.0;
    }
    if (_2536)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2876 = -_2636;
    float _2878 = fma(_2876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _2880 = -_2638;
    float _2882 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1870);
    int _2884 = abs(_2870);
    float _2886 = -_2848;
    float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2472);
    float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2892 = _2878 + _2890;
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2896 = _2882 + _2894;
    float _2898 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2900 = _2888 + _2898;
    float _2902 = _2892 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2904 = fma(_2860, _2758, _2862);
    float _2906 = _2866 + (-1.0);
    float _2908 = _2600 * (-2.0);
    float _2910 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2902);
    float _2912 = _2904 * 0.15915493667125701904296875;
    float _2914 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2916 = _769 + (-0.5);
    float _2918 = fma(_2900, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2910);
    float _2920 = fma(_2908, _2776, _2776);
    float _2922 = float(_2326);
    float _2924 = _577 + _791;
    float _2926 = float(_2884);
    float _2928 = fma(_2914, _2908, _2914);
    bool _2930 = _2918 >= 0.0;
    float _2932 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2920);
    float _2934 = _2926 * _2922;
    float _2936 = _2924 + (-1.0);
    float _2938 = fma(_2928, _2758, _2932);
    float _2940 = sqrt(_2864);
    float _2942 = _2934 * (-2.0);
    float _2944 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2946 = _2938 * 0.15915493667125701904296875;
    float _2948 = _791 + (-0.5);
    float _2950 = fma(_2942, _2778, _2778);
    float _2952 = fma(_2944, _2942, _2944);
    if (_2930)
    {
        _2872 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2954 = _2872;
    float _2956 = _2912 * 6.283185482025146484375;
    float _2958 = sin(_2956);
    float _2960 = fma(_2948, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2950);
    int _2962 = as_type<int>(_2954);
    if (_2930)
    {
        out.m_45.x = 0.0;
    }
    if (_2930)
    {
        float _2964 = _2954 * 5.0;
        _2962 = as_type<int>(_2964);
    }
    int _2966 = _2962;
    float _2968 = fma(_2952, _2758, _2960);
    float _2970 = _2912 * 6.283185482025146484375;
    float _2972 = cos(_2970);
    if (_2930)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8176 = as_type<float>(_2966);
        out.gl_Position.z = _8176;
    }
    float _2974 = _2968 * 0.15915493667125701904296875;
    float _2976 = _2946 * 6.283185482025146484375;
    float _2978 = sin(_2976);
    float _2980 = _2946 * 6.283185482025146484375;
    float _2982 = cos(_2980);
    if (_2930)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2984 = _2974 * 6.283185482025146484375;
    float _2986 = cos(_2984);
    float _2988 = _2598 * _2940;
    float _2990 = _691 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _349);
    float _2994 = _2958 * _2978;
    float _2996 = _2972 * _2982;
    float _2998 = _2988 * _2990;
    float _3000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _285);
    float _3002 = _2974 * 6.283185482025146484375;
    float _3004 = sin(_3002);
    float _3006 = _2972 * _2978;
    float _3008 = _2992 * _2998;
    float _3010 = _689 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3012 = _2958 * _2982;
    float _3014 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3016 = _2988 * _3010;
    float _3018 = _2972 * _2986;
    float _3020 = _2978 * _2986;
    float _3022 = _2982 * _2986;
    float _3024 = _3000 * _3016;
    float _3026 = _3018 * _3008;
    float _3028 = _2958 * _2986;
    float _3030 = _2988 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3032 = _3030 * 0.5;
    float _3034 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3014);
    float _3036 = fma(_3004, _2996, _2994);
    float _3038 = -_3008;
    float _3040 = _3004 * _3038;
    float _3042 = -_3012;
    float _3044 = fma(_3004, _3006, _3042);
    float _3046 = -_3006;
    float _3048 = fma(_3004, _3012, _3046);
    float _3050 = fma(_3036, _3024, _3026);
    float _3052 = fma(_3022, _3024, _3040);
    float _3054 = _3028 * _3008;
    float _3056 = fma(_3004, _2994, _2996);
    float _3058 = fma(_3044, _3032, _3050);
    float _3060 = fma(_3020, _3032, _3052);
    float _3062 = fma(_3048, _3024, _3054);
    float _3064 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3034);
    float _3066 = _3058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3068 = _3058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3070 = fma(_3056, _3032, _3062);
    float _3072 = _3064 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3074 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3066);
    float _3076 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3068);
    float _3078 = _3058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3080 = 1.0 / _3072;
    float _3082 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3074);
    float _3084 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3076);
    float _3086 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3078);
    bool _3088 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3090 = isnan(0.5);
    bool _3092 = _3088 || _3090;
    bool _3094 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3096 = _3092 || _3094;
    float _3098 = _3082 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3100 = _3084 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3102 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3086);
    bool _3104 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3106 = isnan(0.5);
    bool _3108 = _3104 || _3106;
    bool _3110 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3112 = _3108 || _3110;
    float _3114 = _2472 + _3098;
    float _3116 = _1870 + _3100;
    float _3118 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3120 = _3102 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3124 = _3114 + _3122;
    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3128 = _3116 + _3126;
    float _3130 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3118);
    float _3132 = _759 + _3120;
    float _3134 = _3124 * _3124;
    float _3136 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3130);
    float _3138 = fma(_3128, _3128, _3134);
    float _3140 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3142 = sqrt(_3138);
    float _3144 = _3140 + _3072;
    float _3146 = _3144 * _3080;
    float _3148 = _3146 * 0.5;
    float _3150 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3152 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3150);
    bool _3154 = _3142 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3156 = 1.0 / _3152;
    float _3158 = _3072;
    float _3160 = _3064;
    float _3162 = _3116;
    float _3164 = _3120;
    if (!_3154)
    {
        _3158 = _3114;
    }
    float _3166 = _3158;
    float _3168 = _3166;
    if (!_3154)
    {
        _3160 = _3132;
    }
    float _3170 = _3160;
    bool _3172 = !_3154;
    float _3174 = _3170;
    float _3176 = _3156;
    if (!_3172)
    {
        float _3178 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3180 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3182 = _3142 + _3180;
        float _3184 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3186 = _3182 * _3178;
        float _3188 = rsqrt(_3138);
        float _3190 = _3186 * 0.15915493667125701904296875;
        float _3192 = _3190 * 6.283185482025146484375;
        float _3194 = cos(_3192);
        float _3196 = _3190 * 6.283185482025146484375;
        float _3198 = sin(_3196);
        float _3200 = _3194 + (-1.0);
        float _3202 = _3200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3204 = fma(_3198, _3184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3206 = fma(_3132, _3194, _3202);
        float _3208 = _3188 * _3204;
        float _3210 = fma(_3128, _3208, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3212 = fma(_3124, _3208, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3162 = _3210;
        _3174 = _3206;
        _3168 = _3212;
        _3164 = _3184;
    }
    float _3214 = _3162;
    float _3216 = _3174;
    float _3218 = _3168;
    float _3220 = _3164;
    float _3222 = -_2638;
    float _3224 = fma(_3222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3214);
    float _3226 = -_2636;
    float _3228 = fma(_3226, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3216);
    float _3230 = -_2848;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3218);
    float _3234 = _3220;
    float _3236 = _3228;
    float _3238 = _3224;
    float _3240 = _3232;
    if (_3112)
    {
        _3234 = 1.0;
    }
    float _3242 = _3234;
    float _3244 = _3242;
    if (!_3096)
    {
        float _3246 = _2892 * _2892;
        float _3248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3250 = -_2472;
        float _3252 = _3250 + _3218;
        float _3254 = fma(_2896, _2896, _3246);
        float _3256 = fma(_2900, _2900, _3254);
        float _3258 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3260 = sqrt(_3256);
        float _3262 = 1.0 / _2988;
        float _3264 = _3258 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3266 = precise::min(_3260, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3268 = _3266 * _3248;
        float _3270 = _3268 * _3262;
        float _3272 = -_1870;
        float _3274 = _3272 + _3214;
        float _3276 = -_759;
        float _3278 = _3276 + _3216;
        float _3280 = _3264 * _3270;
        float _3282 = _3252 * _3270;
        float _3284 = fma(_3274, _3280, _2882);
        float _3286 = fma(_3278, _3280, _2878);
        float _3288 = fma(_3264, _3282, _2888);
        _3236 = _3286;
        _3238 = _3284;
        _3240 = _3288;
    }
    float _3290 = _3236;
    float _3292 = _3238;
    float _3294 = _3240;
    if (_3112)
    {
        _1942 = 1.0;
    }
    float _3296 = _1942;
    float _3298 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3300 = _3156 * _3298;
    float _3302 = _3296;
    if (!_3112)
    {
        float _3304 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3306 = _3304 * 0.15915493667125701904296875;
        float _3308 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3310 = _3306 * 6.283185482025146484375;
        float _3312 = cos(_3310);
        float _3314 = _3308 * 0.15915493667125701904296875;
        float _3316 = _3306 * 6.283185482025146484375;
        float _3318 = sin(_3316);
        float _3320 = 1.0 / _3312;
        float _3322 = _3314 * 6.283185482025146484375;
        float _3324 = cos(_3322);
        float _3326 = _3318 * _3320;
        float _3328 = _3314 * 6.283185482025146484375;
        float _3330 = sin(_3328);
        float _3332 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3334 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3332;
        float _3336 = _3324 * _3326;
        float _3338 = 1.0 / _3334;
        float _3340 = 1.0 / _3336;
        float _3342 = _3330 * _3340;
        float _3344 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3346 = fma(_3300, _3342, _3344);
        float _3348 = _3346 * _3338;
        float _3350 = precise::clamp(_3348, 0.0, 1.0);
        _3176 = _3314;
        _3244 = _3350;
    }
    float _3352 = _3176;
    float _3354 = _3244;
    float _3356 = _3352;
    if (!_3112)
    {
        float _3358 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3360 = _3358 * 0.15915493667125701904296875;
        float _3362 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3364 = _3360 * 6.283185482025146484375;
        float _3366 = cos(_3364);
        float _3368 = _3362 * 0.15915493667125701904296875;
        float _3370 = _3360 * 6.283185482025146484375;
        float _3372 = sin(_3370);
        float _3374 = 1.0 / _3366;
        float _3376 = _3368 * 6.283185482025146484375;
        float _3378 = cos(_3376);
        float _3380 = _3372 * _3374;
        float _3382 = _3368 * 6.283185482025146484375;
        float _3384 = sin(_3382);
        float _3386 = _3378 * _3380;
        float _3388 = 1.0 / _3386;
        float _3390 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3392 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3390;
        float _3394 = 1.0 / _3392;
        float _3396 = _3384 * _3388;
        float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3400 = fma(_3300, _3396, _3398);
        float _3402 = _3400 * _3394;
        float _3404 = precise::clamp(_3402, 0.0, 1.0);
        float _3406 = -_3404;
        float _3408 = _3406 + 1.0;
        _3356 = _3366;
        _3302 = _3408;
    }
    float _3410 = _3356;
    float _3412 = _3302;
    float _3414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3416 = _3290 + _3414;
    float _3418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3420 = _3292 + _3418;
    float _3422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3424 = _3294 + _3422;
    float _3426 = _3416 * _3416;
    float _3428 = fma(_3420, _3420, _3426);
    float _3430 = fma(_3424, _3424, _3428);
    float _3432 = rsqrt(_3430);
    float _3434 = sqrt(_3430);
    float _3436 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3438 = _3420 * _3436;
    float _3440 = _3424 * _3436;
    float _3442 = _3438 * _3438;
    float _3444 = _3440 * _3440;
    float _3446 = _3442 + _3444;
    float _3448 = sqrt(_3446);
    bool _3450 = _3448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3454 = _3448 + _3452;
    float _3456 = _3424;
    float _3458 = _3446;
    float _3460 = _3454;
    float _3462 = _3410;
    if (_3450)
    {
        float _3464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3456 = _3464;
    }
    float _3466 = _3456;
    if (_3450)
    {
        float _3468 = rsqrt(_3446);
        _3458 = _3468;
    }
    float _3470 = _3458;
    float _3472 = _3470;
    if (_3450)
    {
        float _3474 = _3454 * _3466;
        _3460 = _3474;
    }
    float _3476 = _3460;
    if (_3450)
    {
        float _3478 = _3476 * 0.15915493667125701904296875;
        _3462 = _3478;
    }
    float _3480 = _3462;
    float _3482 = _3466;
    float _3484 = _3480;
    if (_3450)
    {
        float _3486 = _3480 * 6.283185482025146484375;
        float _3488 = sin(_3486);
        _3482 = _3488;
    }
    float _3490 = _3482;
    float _3492 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3494 = precise::max(0.0, _3492);
    float _3496 = _3432;
    float _3498 = _3494;
    if (_3450)
    {
        float _3500 = _3480 * 6.283185482025146484375;
        float _3502 = cos(_3500);
        _3496 = _3502;
    }
    float _3504 = _3496;
    float _3506 = -_3436;
    float _3508 = -_3494;
    float _3510 = fma(_3416, _3506, _3508);
    float _3512 = _3510;
    if (_3450)
    {
        float _3514 = _3510 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3498 = _3514;
    }
    float _3516 = _3498;
    float _3518 = _3490;
    float _3520 = _3516;
    if (_3450)
    {
        float _3522 = fma(_3490, _3516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3518 = _3522;
    }
    float _3524 = _3518;
    float _3526 = _3524;
    float _3528 = _3504;
    if (_3450)
    {
        float _3530 = _3504 + (-1.0);
        _3520 = _3530;
    }
    float _3532 = _3520;
    float _3534 = _3532;
    if (_3450)
    {
        float _3536 = _3470 * _3524;
        _2874 = _3536;
    }
    float _3538 = _2874;
    if (!_3450)
    {
        _3526 = _3438;
    }
    float _3540 = _3526;
    float _3542 = _3540;
    if (_3450)
    {
        float _3544 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3484 = _3544;
    }
    float _3546 = _3484;
    if (_3450)
    {
        float _3548 = _3438 * _3538;
        _3542 = _3548;
    }
    float _3550 = _3542;
    if (!_3450)
    {
        _3534 = _3440;
    }
    float _3552 = _3534;
    float _3554 = _3552;
    if (_3450)
    {
        float _3556 = _3440 * _3538;
        _3554 = _3556;
    }
    float _3558 = _3554;
    if (!_3450)
    {
        _3472 = _3442;
    }
    float _3560 = _3472;
    float _3562 = _3560;
    if (_3450)
    {
        float _3564 = fma(_3510, _3504, _3546);
        _3512 = _3564;
    }
    float _3566 = _3512;
    if (_3450)
    {
        float _3568 = _3550 * _3550;
        _3562 = _3568;
    }
    float _3570 = _3562;
    if (!_3450)
    {
        _3528 = _3444;
    }
    float _3572 = _3528;
    float _3574 = _3572;
    if (_3450)
    {
        float _3576 = _3558 * _3558;
        _3574 = _3576;
    }
    float _3578 = _3574;
    float _3580 = fma(_3566, _3566, _3570);
    float _3582 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3584 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3586 = _3580 + _3578;
    float _3588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3590 = fma(_3434, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3588);
    float _3592 = precise::clamp(_3590, 0.0, 1.0);
    float _3594 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3582);
    float _3596 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3598 = rsqrt(_3586);
    float _3600 = -_3592;
    float _3602 = _3600 + 1.0;
    float _3604 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3594);
    float _3606 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3608 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3596);
    float _3610 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3612 = _3604 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3614 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3606);
    float _3616 = abs(_3602);
    float _3618 = log2(_3616);
    float _3620 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3608);
    float _3622 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3624 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3614);
    float _3626 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3610);
    float _3628 = _3620 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3630 = -_3622;
    float _3632 = fma(_3630, _3584, 1.0);
    float _3634 = _3624 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3636 = _3598 * _3550;
    float _3638 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3640 = _3598 * _3566;
    float _3642 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3626);
    float _3644 = _3636 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3646 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3638);
    float _3648 = _3598 * _3558;
    float _3650 = _3642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3652 = -_3644;
    float _3654 = fma(_3640, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3652);
    float _3656 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3658 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3646);
    float _3660 = log2(_3632);
    float _3662 = -_3648;
    float _3664 = fma(_3662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3654);
    float _3666 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3668 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3658);
    float _3670 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3672 = fma(_3664, -0.5, 0.5);
    float _3674 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3666);
    float _3676 = fma(_3664, 0.5, 0.5);
    float _3678 = exp2(_3656);
    float _3680 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3670);
    float _3682 = _3640 + 1.0;
    float _3684 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3674);
    float _3686 = fma(_3676, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3688 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3680);
    float _3690 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3684);
    float _3692 = 1.0 / _3668;
    float _3694 = fma(_3676, _3686, -0.212114393711090087890625);
    float _3696 = _3660 * 0.693147182464599609375;
    float _3698 = fma(_3676, _3694, 1.570728778839111328125);
    float _3700 = _3696 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3702 = sqrt(_3672);
    float _3704 = -_3640;
    float _3706 = fma(_3678, _3682, _3704);
    float _3708 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3688);
    float _3710 = _3690 * _3692;
    float _3712 = _3708 * _3692;
    float _3714 = fma(_3710, 0.5, 0.5);
    float _3716 = fma(_3712, -0.5, 0.5);
    float _3718 = _3702 * 0.636619746685028076171875;
    float _3720 = fma(_3706, 0.5, 0.5);
    float _3722 = -_3698;
    float _3724 = fma(_3718, _3722, 1.0);
    float3 _9360 = float3(_3714, _3716, _3700);
    float _3726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9360, float3(0.0), isnan(_9360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9360, float3(0.0), isnan(_9360)), level(0.0)).x;
    float3 _9371 = float3(_3714, _3716, _3700);
    float4 _3729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9371, float3(0.0), isnan(_9371)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9371, float3(0.0), isnan(_9371)), level(0.0)).xyzw;
    float _3731 = _3729.x;
    float _3733 = _3729.y;
    float _3735 = _3729.z;
    float _3737 = _3729.w;
    float2 _9388 = float2(_3724, _3720);
    float3 _3741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9388, float2(0.0), isnan(_9388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9388, float2(0.0), isnan(_9388)), level(0.0)).xyz;
    float _3743 = _3741.x;
    float _3745 = _3741.y;
    float _3747 = _3741.z;
    float _3749 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3751 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3753 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3755 = _349 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3757 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3749);
    float _3759 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3751);
    float _3761 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3753);
    float _3763 = fma(_3755, _3755, 1.0);
    float _3765 = _3018 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3767 = _3018 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3769 = _3018 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3771 = _3044 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3773 = _3044 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3775 = rsqrt(_3763);
    float _3777 = -_3004;
    float _3779 = fma(_3777, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3765);
    float _3781 = -_3004;
    float _3783 = fma(_3781, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3767);
    float _3785 = -_3004;
    float _3787 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3769);
    float _3789 = _3044 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3791 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3771);
    float _3793 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3773);
    float _3795 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3797 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3779);
    float _3799 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3783);
    float _3801 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3787);
    float _3803 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3789);
    float _3805 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3791);
    float _3807 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3793);
    float _3809 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3795);
    float _3811 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3757);
    float _3813 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3759);
    float _3815 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3761);
    float _3817 = _285 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3819 = _3755 * _3797;
    float _3821 = _3755 * _3799;
    float _3823 = _3755 * _3801;
    float _3825 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3803);
    float _3827 = _3755 * _3775;
    float _3829 = fma(_3817, _3811, _3819);
    float _3831 = fma(_3817, _3813, _3821);
    float _3833 = fma(_3817, _3815, _3823);
    float _3835 = -_3807;
    float _3837 = _3827 * _3835;
    float _3839 = -_3825;
    float _3841 = _3827 * _3839;
    float _3843 = -_3805;
    float _3845 = _3827 * _3843;
    float _3847 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3849 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3809);
    float _3851 = fma(_3775, _3799, _3841);
    float _3853 = _3354 * _3412;
    bool _3855 = _3354 > 0.0;
    bool _3857 = isnan(_3354);
    bool _3859 = _3855 || _3857;
    bool _3861 = isnan(0.0);
    bool _3863 = _3859 || _3861;
    float _3865 = fma(_3775, _3797, _3837);
    float _3867 = exp2(_3847);
    float _3869 = _3853 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3871 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3849);
    bool _3873 = _3412 <= 0.0;
    bool _3875 = !_3863;
    bool _3877 = _3873 || _3875;
    float _3879 = fma(_3775, _3801, _3845);
    out.m_74.x = _3811;
    out.m_74.y = _3813;
    out.m_74.z = _3815;
    float _3881 = _3871 + _3668;
    float _3883 = _3690 + _3668;
    float _3885 = _3668 * 0.5;
    out.m_76.x = _3292;
    out.m_76.y = _3290;
    out.m_76.z = _3294;
    float _3887 = _3807 + _3829;
    float _3889 = _3825 + _3831;
    float _3891 = _3805 + _3833;
    float _3893 = _3869 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3895 = _3881 * 0.5;
    float _3897 = -_3867;
    float _3899 = _3897 + 1.0;
    float _3901 = _3883 * 0.5;
    float _3903 = fma(_3708, -0.5, _3885);
    out.m_78.x = _3865;
    out.m_78.y = _3851;
    out.m_78.z = _3879;
    float _3905 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3887;
    out.m_80.y = _3889;
    out.m_80.z = _3891;
    float _3907 = -_3905;
    float _3909 = _3907 + 1.0;
    out.m_45.x = _3893;
    out.gl_Position.x = _3690;
    out.gl_Position.y = _3708;
    out.gl_Position.z = _3871;
    out.gl_Position.w = _3668;
    out.m_82.x = _3901;
    out.m_82.y = _3903;
    out.m_82.z = _3895;
    out.m_82.w = _3668;
    float _3911 = _3905 * _3726;
    float _3913 = _3737 * _3909;
    float _3915 = _3737 * _3911;
    float _3917 = _3747 * _3911;
    float _3919 = fma(_3743, _3915, _3731);
    float _3921 = fma(_3745, _3915, _3733);
    float _3923 = fma(_3737, _3917, _3735);
    out.m_84.x = _3919;
    out.m_84.y = _3921;
    out.m_84.z = _3923;
    out.m_84.w = _3913;
    if (!_3877)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3925 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3925;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _717 = false;
    bool _501 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3982 = as_type<float>(_119);
        out.gl_Position.z = _3982;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _4052 = as_type<float>(_157);
        out.gl_Position.z = _4052;
    }
    if (_149)
    {
        return out;
    }
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = in.m_53.x;
    float _175 = in.m_53.y;
    float _177 = in.m_53.z;
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.w;
    float _183 = in.m_47.x;
    float _185 = in.m_47.y;
    float _187 = in.m_47.z;
    float _189 = _159 * _159;
    float _191 = _161 * _161;
    float _193 = _163 * _163;
    float _195 = fma(_167, _167, _189);
    float _197 = fma(_169, _169, _191);
    float _199 = fma(_171, _171, _193);
    float _201 = fma(_173, _173, _195);
    float _203 = fma(_175, _175, _197);
    float _205 = fma(_177, _177, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _207 > 0.0;
    float _213 = sqrt(_205);
    bool _215 = _209 > 0.0;
    int _217 = as_type<int>(_179) & 1;
    bool _219 = _217 != 0;
    int _221 = as_type<int>(_179) & 2;
    bool _223 = _221 != 0;
    float _225 = 0.0;
    float _227 = _203;
    if (_211)
    {
        float _229 = rsqrt(_201);
        _225 = _229;
    }
    float _231 = _225;
    float _233 = in.m_42.x;
    float _235 = in.m_42.y;
    float _237 = in.m_42.z;
    bool _239 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _243 = _239 || _241;
    bool _245 = isnan(1.0);
    bool _247 = _243 || _245;
    float _249 = 0.0;
    float _251 = 0.0;
    if (!_211)
    {
        _249 = 0.0;
        _251 = 0.0;
    }
    float _253 = _249;
    float _255 = _251;
    bool _257 = _213 > 0.0;
    float _259 = 0.0;
    float _261 = _253;
    float _263 = _255;
    if (!_211)
    {
        _259 = 0.0;
    }
    float _265 = _259;
    float _267 = 0.0;
    float _269 = _265;
    if (_215)
    {
        float _271 = rsqrt(_203);
        _267 = _271;
    }
    float _273 = _267;
    float _275 = 0.0;
    float _277 = 0.0;
    if (!_215)
    {
        _275 = 0.0;
        _277 = 0.0;
    }
    float _279 = _275;
    float _281 = _277;
    bool _283 = !_219;
    float _285 = _283 ? (-0.5) : 0.5;
    float _287 = _231;
    float _289 = _281;
    float _291 = _279;
    if (_211)
    {
        float _293 = _231 * _167;
        _261 = _293;
    }
    float _295 = _261;
    if (_211)
    {
        float _297 = _231 * _159;
        _269 = _297;
    }
    float _299 = _269;
    float _301 = _299;
    if (_211)
    {
        float _303 = _231 * _173;
        _263 = _303;
    }
    float _305 = _263;
    if (!_247)
    {
        float _307 = _165 * _165;
        float _309 = _307 * 0.5;
        _287 = _309;
    }
    float _311 = _287;
    float _313 = _311;
    if (!_215)
    {
        _227 = 0.0;
    }
    float _315 = _227;
    float _317 = 0.0;
    float _319 = _315;
    if (_257)
    {
        float _321 = rsqrt(_205);
        _317 = _321;
    }
    float _323 = _317;
    if (!_247)
    {
        float _325 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _325;
    }
    float _327 = _313;
    float _329 = _273;
    float _331 = _327;
    if (_215)
    {
        float _333 = _273 * _169;
        _289 = _333;
    }
    float _335 = _289;
    if (_215)
    {
        float _337 = _273 * _161;
        _291 = _337;
    }
    float _339 = _291;
    if (_215)
    {
        float _341 = _273 * _175;
        _319 = _341;
    }
    float _343 = _319;
    if (!_257)
    {
        _329 = 0.0;
    }
    float _345 = _329;
    bool _347 = !_223;
    float _349 = _347 ? (-0.5) : 0.5;
    bool _351 = !_247;
    float _353 = 0.0;
    float _355 = _345;
    if (!_351)
    {
        float _357 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _359 = log2(_357);
        float _361 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _363 = _361 + 1.0;
        float _365 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = _165 * _359;
        float _369 = 1.0 / _363;
        float _371 = _365 * 0.693147182464599609375;
        float _373 = exp2(_367);
        float _375 = 1.0 / _371;
        float _377 = _373 + (-1.0);
        float _379 = -_377;
        float _381 = fma(_379, _375, _165);
        float _383 = _381 * _369;
        float _385 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _385;
        _353 = _371;
    }
    float _387 = _331;
    float _389 = _353;
    float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _393 = _389;
    float _395 = _387;
    if (_257)
    {
        float _397 = _323 * _163;
        _355 = _397;
    }
    float _399 = _355;
    float _401 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_257)
    {
        _393 = 0.0;
    }
    float _403 = _393;
    float _405 = _391 * _299;
    float _407 = _391 * _399;
    float _409 = _391 * _339;
    float _411 = _403;
    if (_257)
    {
        float _413 = _323 * _171;
        _411 = _413;
    }
    float _415 = _411;
    float _417 = fma(_401, _295, _405);
    float _419 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_257)
    {
        _301 = 0.0;
    }
    float _421 = _301;
    float _423 = _421;
    if (_257)
    {
        float _425 = _323 * _177;
        _423 = _425;
    }
    float _427 = _423;
    float _429 = fma(_401, _335, _409);
    float _431 = fma(_401, _415, _407);
    float _433 = fma(_419, _305, _417);
    if (!_247)
    {
        _395 = _165;
    }
    float _435 = _395;
    bool _437 = !_247;
    float _439 = _435;
    if (!_437)
    {
        float _441 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _443 = log2(_441);
        float _445 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _447 = _445 + 1.0;
        float _449 = 1.0 / _447;
        float _451 = _165 * _443;
        float _453 = exp2(_451);
        float _455 = -_453;
        float _457 = _455 + 1.0;
        float _459 = _457 * _449;
        _439 = _459;
    }
    float _461 = _439;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _465 = fma(_419, _343, _429);
    float _467 = fma(_419, _427, _431);
    float _469 = fma(_461, _183, _433);
    float _471 = fma(_461, _185, _465);
    float _473 = fma(_461, _187, _467);
    float _475 = fma(_469, _181, _233);
    float _477 = fma(_471, _181, _235);
    float _479 = fma(_473, _181, _237);
    bool _481 = !_463;
    float _499;
    if (!_481)
    {
        float _483 = in.m_60.x;
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _487 = _483 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_103);
        float _505 = 1.0 / _503;
        float _507 = _137 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = _509 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _517 = _509 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _527;
    bool _531 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _533 = isnan(_509);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _521;
    float _545 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _547 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _549 = 1.0 / _529;
    float _551 = 1.0 / _525;
    float _553 = _513 * _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _557 = _509 + _555;
    bool _559 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _561 = isnan(_509);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = _557 * _549;
    float _573 = -_569;
    float _575 = _573 + 1.0;
    float _577 = in.m_60.x;
    float _579 = _541 * _575;
    bool _581 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _583 = isnan(_509);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -_541;
    float _595 = _593 + 1.0;
    float _597 = _517 * _551;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _603;
    float _607 = fma(_601, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _609 = fma(_605, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _611 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _613 = isnan(_509);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = -_621;
    float _633 = _631 + 1.0;
    float _635 = _621 * _595;
    float _637 = fma(_625, _597, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _639 = fma(_629, _597, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _641 = _591 * _633;
    float _643 = in.m_58.x;
    float _645 = in.m_58.y;
    float _647 = _545 * _577;
    float _649 = -_591;
    float _651 = _649 + 1.0;
    float _653 = _607 * _641;
    float _655 = _609 * _641;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _661;
    float _665 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].x, _653);
    float _667 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].y, _655);
    float _669 = trunc(_647);
    int _671 = int(_669);
    float _673 = fma(_659, _571, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _675 = fma(_663, _571, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _677 = fma(_637, _635, _665);
    float _679 = fma(_639, _635, _667);
    float _681 = fma(_673, _579, _677);
    float _683 = fma(_675, _579, _679);
    float _685 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[146].x, _681);
    float _687 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[146].y, _683);
    float _689 = _685 * _643;
    float _691 = _687 * _645;
    int _693 = _671 << 4;
    int _695 = _693 + 1712;
    bool _697 = !_547;
    float _699 = as_type<float>(_671);
    float _715;
    if (!_697)
    {
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _703 = _577 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        float _719 = float(_103);
        float _721 = 1.0 / _719;
        float _723 = _137 * _721;
        _715 = _723;
    }
    _717 = false;
    float _725 = _715;
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _729 = int(_727);
    float _731 = in.m_60.w;
    float _733 = _477 * _161;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _737 = _735 != 0;
    float _739 = _477 * _175;
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _743 = int(_741);
    float _745 = fma(_475, _159, _733);
    float _747 = fma(_475, _173, _739);
    float _749 = fma(_479, _163, _745);
    float _751 = float(_729);
    float _753 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _755 = int(_753);
    if (_737)
    {
        _699 = 1.0;
    }
    float _757 = _699;
    float _759 = _749 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _761 = _757;
    if (!_737)
    {
        _761 = 7.345489978790283203125;
    }
    float _763 = _761;
    float _765 = float(_743);
    float _767 = 1.0 / _751;
    float _769 = in.m_60.y;
    float _771 = _763 * _577;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _775 = int(_773);
    float _777 = float(uint(_755));
    int _779 = ~_755;
    int _781 = _779 + 1;
    float _783 = float(_755);
    int _785 = _755 + (-1);
    float _787 = 1.0 / _765;
    float _789 = _767 * _137;
    float _791 = in.m_60.z;
    float _793 = 1.0 / _777;
    float _795 = float(uint(_775));
    bool _797 = _769 > 0.5;
    int _799 = ~_775;
    int _801 = _799 + 1;
    float _803 = trunc(_789);
    int _805 = int(_803);
    float _807 = _787 * _137;
    float _809 = _787;
    if (_737)
    {
        _809 = _577;
    }
    float _811 = _809;
    float _813 = _811;
    if (!_737)
    {
        _813 = _769;
    }
    float _815 = _813;
    float _817 = 1.0 / _795;
    int _819 = as_type<int>(_793) + (-2);
    bool _821 = _791 > 0.5;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _833 = _831 != 0;
    float _835 = trunc(_807);
    int _837 = int(_835);
    float _839 = float(uint(_805));
    float _841 = float(_805);
    float _843 = as_type<float>(_819) * _839;
    float _845 = _839;
    if (_737)
    {
        _845 = 1.0;
    }
    float _847 = _845;
    float _849 = floor(_771);
    int _851 = as_type<int>(_817) + (-2);
    float _853 = _847;
    if (!_737)
    {
        _853 = 1.2345600128173828125;
    }
    float _855 = _853;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _859 = _857 != 0;
    float _861 = float(uint(_837));
    float _863 = trunc(_843);
    float _865 = precise::max(_863, 0.0);
    uint _868 = uint(_865);
    float _870 = _855 * _815;
    float _872 = as_type<float>(_851) * _861;
    int _874 = ~_775;
    int _876 = _874 + 1;
    float _878 = -_849;
    float _880 = _771 + _878;
    float _882 = trunc(_872);
    float _884 = precise::max(_882, 0.0);
    uint _886 = uint(_884);
    int _888 = ~_755;
    int _890 = _888 + 1;
    float _892 = _880 * _783;
    int _894 = _781 * int(_868);
    int _896 = _894 + _805;
    float _898 = floor(_870);
    float _900 = -_349;
    int _902 = _821 ? as_type<int>(_900) : as_type<int>(_349);
    float _904 = float(uint(_896));
    float _906 = -_285;
    int _908 = _797 ? as_type<int>(_906) : as_type<int>(_285);
    int _910 = _876 * int(_886);
    int _912 = _910 + _837;
    float _914 = as_type<float>(_819) * _904;
    bool _916 = !_829;
    float _918 = _916 ? _285 : as_type<float>(_908);
    float _920 = float(uint(_912));
    bool _922 = !_833;
    float _924 = _922 ? _349 : as_type<float>(_902);
    float _926 = trunc(_914);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    bool _932 = !_859;
    int _934 = _932 ? 0 : 1;
    float _936 = as_type<float>(_851) * _920;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _944 = _942 != 0;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _948 = _946 != 0;
    float _950 = -_898;
    float _952 = _870 + _950;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _960 = _958 != 0;
    float _962 = trunc(_936);
    float _964 = precise::max(_962, 0.0);
    uint _966 = uint(_964);
    bool _968 = !_956;
    int _970 = _968 ? 0 : 1;
    bool _972 = _731 > 0.5;
    int _974 = ~_775;
    int _976 = _974 + 1;
    bool _978 = !_944;
    int _980 = _978 ? 0 : 1;
    int _982 = int(_868) + int(_930);
    float _984 = float(_103);
    float _986 = 1.0 / _984;
    int _988 = int(_886) + int(_966);
    int _990 = _890 * _982;
    int _992 = _990 + _805;
    bool _994 = _841 >= _783;
    bool _996 = isnan(_841);
    bool _998 = _994 || _996;
    bool _1000 = isnan(_783);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = -_349;
    int _1008 = _972 ? as_type<int>(_1006) : as_type<int>(_349);
    int _1010 = _976 * _988;
    int _1012 = _1010 + _837;
    bool _1014 = uint(_992) >= uint(_755);
    float _1016 = trunc(_1004);
    int _1018 = int(_1016);
    bool _1020 = !_825;
    float _1022 = _1020 ? _349 : as_type<float>(_1008);
    bool _1024 = uint(_1012) >= uint(_775);
    bool _1026 = !_1014;
    int _1028 = _1026 ? 0 : (-1);
    bool _1030 = !_960;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _986 * _137;
    bool _1036 = !_1024;
    int _1038 = _1036 ? 0 : (-1);
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1046 = _1044 != 0;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1054 = _1052 != 0;
    int _1056 = ~_982;
    int _1058 = _1056 + _1028;
    int _1060 = _1058 + 1;
    float _1062 = float(_775);
    float _1064 = trunc(_892);
    int _1066 = int(_1064);
    bool _1068 = !_1046;
    int _1070 = _1068 ? 0 : 1;
    int _1072 = _755 * _1060;
    int _1074 = _1072 + _805;
    bool _1076 = _755 == 0;
    float _1078 = _952 * _1062;
    int _1080 = ~_1018;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    float _1086 = _783 * _1034;
    bool _1088 = !_1076;
    int _1090 = _1088 ? _1074 : (-1);
    float _1092 = trunc(_1078);
    int _1094 = int(_1092);
    float _1096 = float(_837);
    float _1098 = _1062 * _1034;
    bool _1100 = !_940;
    int _1102 = _1100 ? 0 : 1;
    int _1104 = _1090 * _1084;
    bool _1106 = _1096 >= _1062;
    bool _1108 = isnan(_1096);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1062);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    int _1118 = abs(_1032);
    float _1120 = trunc(_1086);
    int _1122 = int(_1120);
    int _1124 = _1018 * _785;
    int _1126 = _1124 + _1104;
    int _1128 = abs(_980);
    float _1130 = _477 * _169;
    int _1132 = abs(_934);
    int _1134 = abs(_1102);
    float _1136 = fma(_475, _167, _1130);
    float _1138 = trunc(_1116);
    int _1140 = int(_1138);
    int _1142 = _1066 * _1132;
    int _1144 = _1142 + _805;
    int _1146 = ~_988;
    int _1148 = _1146 + _1038;
    int _1150 = _1148 + 1;
    int _1152 = _1126 * _1128;
    bool _1154 = !_948;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1094 * _1118;
    int _1160 = _1158 + _837;
    bool _1162 = _775 == 0;
    int _1164 = _775 * _1150;
    int _1166 = _1164 + _837;
    int _1168 = abs(_1156);
    int _1170 = _1122 * _1134;
    int _1172 = _1170 + _1152;
    int _1174 = abs(_970);
    float _1176 = trunc(_1098);
    int _1178 = int(_1176);
    bool _1180 = !_1162;
    int _1182 = _1180 ? _1166 : (-1);
    int _1184 = _1144 * _1168;
    int _1186 = _1184 + _1172;
    int _1188 = ~_1140;
    int _1190 = _1188 + 1;
    int _1192 = _1190 + 1;
    bool _1194 = !_1042;
    int _1196 = _1194 ? 0 : 1;
    int _1198 = _1066 * _1174;
    int _1200 = _1198 + _1186;
    int _1202 = _775 + (-1);
    int _1204 = _1182 * _1192;
    int _1206 = abs(_1070);
    float _1208 = float(uint(_1200));
    int _1210 = _1140 * _1202;
    int _1212 = _1210 + _1204;
    int _1214 = abs(_1196);
    float _1216 = as_type<float>(_819) * _1208;
    bool _1218 = !_1050;
    int _1220 = _1218 ? 0 : 1;
    int _1222 = _1212 * _1206;
    int _1224 = abs(_1220);
    bool _1226 = !_1054;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = trunc(_1216);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    int _1236 = _1178 * _1214;
    int _1238 = _1236 + _1222;
    int _1240 = ~_755;
    int _1242 = _1240 + 1;
    int _1244 = abs(_1228);
    int _1246 = _1160 * _1224;
    int _1248 = _1246 + _1238;
    int _1250 = ~_755;
    int _1252 = _1250 + 1;
    int _1254 = ~_755;
    int _1256 = _1254 + 1;
    int _1258 = _1094 * _1244;
    int _1260 = _1258 + _1248;
    float _1262 = float(uint(_1144));
    float _1264 = float(uint(_1260));
    int _1266 = _1252 * int(_1234);
    int _1268 = _1266 + _1200;
    float _1270 = as_type<float>(_819) * _1262;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1274 = _1272 != 0;
    float _1276 = as_type<float>(_851) * _1264;
    bool _1278 = _577 > 0.5;
    float _1280 = float(uint(_1268));
    float _1282 = trunc(_1270);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = ~_775;
    int _1290 = _1288 + 1;
    float _1292 = as_type<float>(_819) * _1280;
    float _1294 = trunc(_1276);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = trunc(_1292);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    int _1306 = _1290 * int(_1298);
    int _1308 = _1306 + _1260;
    float _1310 = float(uint(_1308));
    int _1312 = int(_1234) + int(_1304);
    float _1314 = as_type<float>(_851) * _1310;
    int _1316 = ~_775;
    int _1318 = _1316 + 1;
    int _1320 = _1242 * _1312;
    int _1322 = _1320 + _1200;
    float _1324 = trunc(_1314);
    float _1326 = precise::max(_1324, 0.0);
    uint _1328 = uint(_1326);
    float _1330 = float(uint(_1160));
    bool _1332 = uint(_1322) >= uint(_755);
    float _1334 = as_type<float>(_851) * _1330;
    bool _1336 = !_1332;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = trunc(_1334);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    int _1346 = ~_1312;
    int _1348 = _1346 + _1338;
    int _1350 = _1348 + 1;
    int _1352 = int(_1298) + int(_1328);
    int _1354 = ~_775;
    int _1356 = _1354 + 1;
    int _1358 = _1256 * int(_1286);
    int _1360 = _1358 + _1144;
    int _1362 = _755 * _1350;
    int _1364 = _1362 + _1200;
    bool _1366 = !_1076;
    int _1368 = _1366 ? _1364 : (-1);
    int _1370 = _1356 * _1352;
    int _1372 = _1370 + _1260;
    float _1374 = float(uint(_1360));
    int _1376 = _1318 * int(_1344);
    int _1378 = _1376 + _1160;
    int _1380 = _1368 & 3;
    bool _1382 = _1380 != 0;
    bool _1384 = uint(_1372) >= uint(_775);
    float _1386 = as_type<float>(_819) * _1374;
    int _1388 = _1382 ? 0 : 1;
    int _1390 = _1368 & 3;
    bool _1392 = _1390 != 0;
    float _1394 = trunc(_1386);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    float _1400 = float(uint(_1378));
    bool _1402 = !_1384;
    int _1404 = _1402 ? 0 : (-1);
    bool _1406 = uint(_1390) > 1u;
    float _1408 = as_type<float>(_851) * _1400;
    int _1410 = ~_755;
    int _1412 = _1410 + 1;
    int _1414 = ~_1352;
    int _1416 = _1414 + _1404;
    int _1418 = _1416 + 1;
    float _1420 = trunc(_1408);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = ~_1388;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = _285 + 0.5;
    bool _1434 = !_1392;
    int _1436 = _1434 ? 0 : 1;
    int _1438 = _775 * _1418;
    int _1440 = _1438 + _1260;
    bool _1442 = uint(_1390) >= 2u;
    int _1444 = int(_1286) + int(_1398);
    float _1446 = -_349;
    float _1448 = _1446 + 0.5;
    int _1450 = _1430;
    if (!_1406)
    {
        int _1452 = ~_1388;
        int _1454 = _1452 + 1;
        _1450 = _1454;
    }
    int _1456 = _1450;
    bool _1458 = _1390 != 3;
    out.m_62.x = _1432;
    out.m_62.y = _1448;
    bool _1460 = !_1162;
    int _1462 = _1460 ? _1440 : (-1);
    int _1464 = _1412 * _1444;
    int _1466 = _1464 + _1144;
    int _1468 = _1442 ? 0 : 1;
    int _1470 = int(_1344) + int(_1424);
    int _1472 = _1368 >> 31;
    bool _1474 = uint(_1466) >= uint(_755);
    int _1476 = _801 * _1470;
    int _1478 = _1476 + _1160;
    int _1480 = _1462 >> 31;
    int _1482 = ~_1468;
    int _1484 = _1482 + 1;
    int _1486 = _1484 + 1;
    int _1488 = _1472 & 3;
    int _1490 = _1486;
    if (_1458)
    {
        int _1492 = ~_1468;
        int _1494 = _1492 + 1;
        _1490 = _1494;
    }
    int _1496 = _1490;
    bool _1498 = _1390 != 3;
    int _1500 = _1480 & 3;
    int _1502 = _1368 + _1488;
    int _1504 = _1462 + _1500;
    int _1506 = _1502 >> 2;
    int _1508 = _1504 >> 2;
    int _1510 = _1506 << 4;
    int _1512 = _1510 + 368;
    int _1514 = _1508 << 4;
    int _1516 = _1514 + 512;
    uint _1518 = uint(int(uint(_1512) >> uint(2)));
    uint _1520 = uint(int(uint(int(_1518)) >> uint(2)));
    int _1522 = int(_1518) & 3;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[int(_1520)][_1522];
    int _1526 = int(_1518) + 1;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    int _1530 = _1526 & 3;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[int(_1528)][_1530];
    bool _1534 = !_1474;
    int _1536 = _1534 ? 0 : (-1);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1540 = _1538 != 0;
    bool _1542 = !_1498;
    int _1544 = _1542 ? 0 : (-1);
    bool _1546 = !_1540;
    int _1548 = _1546 ? 0 : 1;
    uint _1550 = uint(int(uint(_1516) >> uint(2)));
    uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
    int _1554 = int(_1550) & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    int _1558 = int(_1550) + 1;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    int _1562 = _1558 & 3;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[int(_1560)][_1562];
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1568 = _1566 != 0;
    int _1570 = ~_1444;
    int _1572 = _1570 + _1536;
    int _1574 = _1572 + 1;
    bool _1576 = !_1568;
    int _1578 = _1576 ? 0 : 1;
    int _1580 = _1462 & 3;
    bool _1582 = _1580 != 0;
    int _1584 = _1512 + 8;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    uint _1588 = uint(int(uint(int(_1586)) >> uint(2)));
    int _1590 = int(_1586) & 3;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[int(_1588)][_1590];
    int _1594 = int(_1586) + 1;
    uint _1596 = uint(int(uint(_1594) >> uint(2)));
    int _1598 = _1594 & 3;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[int(_1596)][_1598];
    int _1602 = _1462 & 3;
    bool _1604 = _1602 != 0;
    int _1606 = _755 * _1574;
    int _1608 = _1606 + _1144;
    int _1610 = _1582 ? 0 : 1;
    bool _1612 = !_1604;
    int _1614 = _1612 ? 0 : 1;
    bool _1616 = uint(_1602) >= 2u;
    int _1618 = _1516 + 8;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    uint _1622 = uint(int(uint(int(_1620)) >> uint(2)));
    int _1624 = int(_1620) & 3;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[int(_1622)][_1624];
    int _1628 = int(_1620) + 1;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    int _1632 = _1628 & 3;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[int(_1630)][_1632];
    bool _1636 = uint(_1602) > 1u;
    int _1638 = _1616 ? 0 : 1;
    bool _1640 = _1602 != 3;
    int _1642 = ~_1610;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    int _1648 = ~_1638;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    int _1654 = abs(_1456);
    int _1656 = abs(_1614);
    int _1658 = _1646;
    int _1660 = _1652;
    if (!_1636)
    {
        int _1662 = ~_1610;
        int _1664 = _1662 + 1;
        _1658 = _1664;
    }
    int _1666 = _1658;
    bool _1668 = uint(_1478) >= uint(_775);
    if (_1640)
    {
        int _1670 = ~_1638;
        int _1672 = _1670 + 1;
        _1660 = _1672;
    }
    int _1674 = _1660;
    bool _1676 = !_1668;
    int _1678 = _1676 ? 0 : (-1);
    bool _1680 = _1602 != 3;
    int _1682 = abs(_1666);
    int _1684 = ~_1470;
    int _1686 = _1684 + _1678;
    int _1688 = _1686 + 1;
    bool _1690 = !_1680;
    int _1692 = _1690 ? 0 : (-1);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1696 = _1694 != 0;
    int _1698 = _775 * _1688;
    int _1700 = _1698 + _1160;
    int _1702 = abs(_1436);
    int _1704 = ~_1654;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1712 = _1710 != 0;
    int _1714 = abs(_1496);
    float _1716 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1718 = int(_1716);
    int _1720 = ~_1682;
    int _1722 = _1720 + 1;
    int _1724 = _1722 + 1;
    int _1726 = _1708 * as_type<int>(_1532);
    int _1728 = ~_1702;
    int _1730 = _1728 + 1;
    int _1732 = _1730 + 1;
    int _1734 = _1724 * as_type<int>(_1564);
    int _1736 = ~_1714;
    int _1738 = _1736 + 1;
    int _1740 = _1738 + 1;
    float _1742 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1744 = int(_1742);
    int _1746 = _1732 * as_type<int>(_1524);
    int _1748 = _1746 + _1726;
    int _1750 = ~_1656;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = _577 * 2.0;
    int _1758 = abs(_1674);
    int _1760 = _1740 * as_type<int>(_1592);
    int _1762 = _1760 + _1748;
    int _1764 = abs(_1544);
    int _1766 = _1754 * as_type<int>(_1556);
    int _1768 = _1766 + _1734;
    int _1770 = ~_1758;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    float _1776 = floor(_1756);
    int _1778 = abs(_1692);
    float _1780 = _791 * 2.0;
    int _1782 = abs(_1548);
    int _1784 = _1774 * as_type<int>(_1626);
    int _1786 = _1784 + _1768;
    float _1788 = float(uint(_1718));
    int _1790 = ~_1764;
    int _1792 = _1790 + 1;
    int _1794 = _1792 + 1;
    float _1796 = floor(_1780);
    int _1798 = ~_1778;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = ~_1782;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    int _1810 = _1794 * as_type<int>(_1600);
    int _1812 = _1810 + _1762;
    float _1814 = float(uint(_1744));
    int _1816 = _1802 * as_type<int>(_1634);
    int _1818 = _1816 + _1786;
    int _1820 = abs(_1578);
    float _1822 = 1.0 / _1788;
    int _1824 = _1812 * _1808;
    int _1826 = abs(_1718);
    bool _1828 = !_1076;
    int _1830 = _1828 ? _1608 : (-1);
    float _1832 = float(uint(_1826));
    float _1834 = 1.0 / _1814;
    int _1836 = ~_1820;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = _1830 * _1782;
    int _1844 = _1842 + _1824;
    int _1846 = abs(_1744);
    float _1848 = fma(_479, _171, _1136);
    bool _1850 = !_1162;
    int _1852 = _1850 ? _1700 : (-1);
    int _1854 = _1818 * _1840;
    float _1856 = float(uint(_1846));
    float _1858 = 1.0 / _1832;
    int _1860 = as_type<int>(_1822) + (-2);
    int _1862 = _1852 * _1820;
    int _1864 = _1862 + _1854;
    float _1866 = float(uint(_1844));
    float _1868 = fma(_479, _177, _747);
    float _1870 = _1848 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1872 = float(uint(_1864));
    float _1874 = as_type<float>(_1860) * _1866;
    float _1876 = 1.0 / _1856;
    int _1878 = as_type<int>(_1834) + (-2);
    int _1880 = abs(_1864);
    int _1882 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1884 = _1882 != 0;
    float _1886 = as_type<float>(_1878) * _1872;
    int _1888 = abs(_1844);
    float _1890 = trunc(_1874);
    float _1892 = precise::max(_1890, 0.0);
    uint _1894 = uint(_1892);
    int _1896 = as_type<int>(_1858) + (-2);
    float _1898 = float(uint(_1888));
    float _1900 = float(uint(_1880));
    int _1902 = ~_1718;
    int _1904 = _1902 + 1;
    float _1906 = trunc(_1886);
    float _1908 = precise::max(_1906, 0.0);
    uint _1910 = uint(_1908);
    float _1912 = as_type<float>(_1896) * _1898;
    int _1914 = as_type<int>(_1876) + (-2);
    int _1916 = ~_1744;
    int _1918 = _1916 + 1;
    float _1920 = -_285;
    int _1922 = _1278 ? as_type<int>(_1920) : as_type<int>(_285);
    float _1924 = as_type<float>(_1914) * _1900;
    float _1926 = trunc(_1912);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    int _1932 = _1904 * int(_1894);
    int _1934 = _1932 + _1844;
    int _1936 = as_type<int>(_1834);
    int _1938 = as_type<int>(_1822);
    float _1940 = as_type<float>(_1914);
    float _1942 = _1870;
    if (_1274)
    {
        _1936 = 0;
    }
    int _1944 = _1936;
    int _1946 = _1944;
    if (!_1274)
    {
        _1946 = 1;
    }
    int _1948 = _1946;
    float _1950 = float(uint(_1934));
    float _1952 = trunc(_1924);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = _1918 * int(_1910);
    int _1960 = _1958 + _1864;
    bool _1962 = !_1884;
    float _1964 = _1962 ? _285 : as_type<float>(_1922);
    float _1966 = as_type<float>(_1860) * _1950;
    bool _1968 = _1948 != 1;
    float _1970 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1972 = float(uint(_1960));
    int _1974 = ~_1826;
    int _1976 = _1974 + 1;
    int _1978 = ~_1846;
    int _1980 = _1978 + 1;
    float _1982 = as_type<float>(_1878) * _1972;
    float _1984 = trunc(_1966);
    float _1986 = precise::max(_1984, 0.0);
    uint _1988 = uint(_1986);
    int _1990 = _1976 * int(_1930);
    int _1992 = _1990 + _1888;
    bool _1994 = _1776 > 0.0;
    float _1996 = _769 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2000 = _1776 >= 0.0;
    bool _2002 = isnan(_1776);
    bool _2004 = _2000 || _2002;
    bool _2006 = isnan(0.0);
    bool _2008 = _2004 || _2006;
    float _2010 = float(uint(_1992));
    float _2012 = trunc(_1982);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    int _2018 = _1980 * int(_1956);
    int _2020 = _2018 + _1880;
    float _2022 = as_type<float>(_1992);
    float _2024 = _1996;
    if (_1274)
    {
        _1938 = 0;
    }
    int _2026 = _1938;
    float _2028 = -_1998;
    float _2030 = fma(_1970, 2.0, _2028);
    float _2032 = as_type<float>(_1896) * _2010;
    int _2034 = _2026;
    if (!_1274)
    {
        _2034 = 2;
    }
    int _2036 = _2034;
    float _2038 = float(uint(_2020));
    int _2040 = _2008 ? 0 : 1;
    float _2042 = trunc(_2032);
    float _2044 = precise::max(_2042, 0.0);
    uint _2046 = uint(_2044);
    float _2048 = as_type<float>(_1914) * _2038;
    int _2050 = ~_2040;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    bool _2056 = _2036 != 2;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2060 = _2054;
    if (!_1994)
    {
        int _2062 = ~_2040;
        int _2064 = _2062 + 1;
        _2060 = _2064;
    }
    int _2066 = _2060;
    float _2068 = trunc(_2048);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = int(_1894) + int(_1988);
    float _2076 = fma(_1996, -2.0, _2058);
    int _2078 = ~_1718;
    int _2080 = _2078 + 1;
    float _2082 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2084 = as_type<float>(_1988);
    if (!_1968)
    {
        _2084 = _769;
    }
    float _2086 = _2084;
    int _2088 = _2080 * _2074;
    int _2090 = _2088 + _1844;
    int _2092 = int(_1910) + int(_2016);
    float _2094 = _2082 * _577;
    int _2096 = int(_1930) + int(_2046);
    int _2098 = ~_1826;
    int _2100 = _2098 + 1;
    int _2102 = ~_1846;
    int _2104 = _2102 + 1;
    float _2106 = trunc(_2094);
    int _2108 = int(_2106);
    int _2110 = int(_1956) + int(_2072);
    int _2112 = _2100 * _2096;
    int _2114 = _2112 + _1888;
    float _2116 = _2086;
    float _2118 = as_type<float>(_2046);
    if (!_1968)
    {
        _1940 = _791;
    }
    float _2120 = _1940;
    float _2122 = _2120;
    if (!_1968)
    {
        _2022 = _2086;
    }
    float _2124 = _2022;
    int _2126 = _2104 * _2110;
    int _2128 = _2126 + _1880;
    float _2130 = _2124;
    if (!_1968)
    {
        _2024 = _791;
    }
    float _2132 = _2024;
    float _2134 = _769 * 2.0;
    float _2136 = _2132;
    if (_1968)
    {
        _2130 = _577;
    }
    float _2138 = _2130;
    if (_1968)
    {
        _2116 = _577;
    }
    float _2140 = _2116;
    if (_1968)
    {
        _2122 = _769;
    }
    float _2142 = _2122;
    float _2144 = floor(_2134);
    if (_1968)
    {
        _2136 = _769;
    }
    float _2146 = _2136;
    bool _2148 = uint(_2090) >= uint(_1718);
    int _2150 = ~_1744;
    int _2152 = _2150 + 1;
    bool _2154 = !_2148;
    int _2156 = _2154 ? 0 : (-1);
    bool _2158 = uint(_2114) >= uint(_1826);
    int _2160 = _2152 * _2092;
    int _2162 = _2160 + _1864;
    int _2164 = ~_2074;
    int _2166 = _2164 + _2156;
    int _2168 = _2166 + 1;
    float _2170 = as_type<float>(_2152);
    if (_2056)
    {
        _2118 = _577;
    }
    float _2172 = _2118;
    float _2174 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2176 = _2174 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2178 = _2172;
    if (_2056)
    {
        _2170 = _769;
    }
    float _2180 = _2170;
    bool _2182 = uint(_2162) >= uint(_1744);
    float _2184 = 1.0 / _2176;
    float _2186 = _2180;
    if (!_2056)
    {
        _2178 = _791;
    }
    float _2188 = _2178;
    if (!_2056)
    {
        _2186 = _577;
    }
    float _2190 = _2186;
    bool _2192 = uint(_2128) >= uint(_1846);
    int _2194 = _2108 << 4;
    int _2196 = _2194 + 1968;
    int _2198 = _1718 * _2168;
    int _2200 = _2198 + _1844;
    bool _2202 = !_2182;
    int _2204 = _2202 ? 0 : (-1);
    bool _2206 = !_2158;
    int _2208 = _2206 ? 0 : (-1);
    uint _2210 = uint(int(uint(_2196) >> uint(2)));
    uint _2212 = uint(int(uint(int(_2210)) >> uint(2)));
    int _2214 = int(_2210) & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    int _2218 = int(_2210) + 1;
    uint _2220 = uint(int(uint(_2218) >> uint(2)));
    int _2222 = _2218 & 3;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[int(_2220)][_2222];
    bool _2226 = _1718 == 0;
    bool _2228 = _1718 == 0;
    int _2230 = _1844 ^ _1718;
    int _2232 = _2196 + 8;
    uint _2234 = uint(int(uint(_2232) >> uint(2)));
    uint _2236 = uint(int(uint(int(_2234)) >> uint(2)));
    int _2238 = int(_2234) & 3;
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[int(_2236)][_2238];
    bool _2242 = !_2226;
    int _2244 = _2242 ? _2200 : (-1);
    bool _2246 = _2144 > 0.0;
    uint _2248 = uint(int(uint(_2230) >> uint(31)));
    float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2250;
    bool _2254 = !_2192;
    int _2256 = _2254 ? 0 : (-1);
    int _2258 = _695 + 8;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
    int _2264 = int(_2260) & 3;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[int(_2262)][_2264];
    int _2268 = ~_2092;
    int _2270 = _2268 + _2204;
    int _2272 = _2270 + 1;
    float _2274 = _2252 * _2184;
    bool _2276 = _2144 >= 0.0;
    bool _2278 = isnan(_2144);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan(0.0);
    bool _2284 = _2280 || _2282;
    int _2286 = ~_2208;
    int _2288 = _2096 + _2286;
    int _2290 = _2288 + 1;
    int _2292 = _1744 * _2272;
    int _2294 = _2292 + _1864;
    int _2296 = ~int(_2248);
    int _2298 = _2296 + 1;
    int _2300 = _2284 ? 0 : 1;
    int _2302 = _2290 ^ _2298;
    bool _2304 = _1744 == 0;
    int _2306 = ~_2300;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = ~_2298;
    int _2314 = _2312 + _2302;
    int _2316 = _2314 + 1;
    float _2318 = _577 + _769;
    int _2320 = _2310;
    if (!_2246)
    {
        int _2322 = ~_2300;
        int _2324 = _2322 + 1;
        _2320 = _2324;
    }
    int _2326 = _2320;
    bool _2328 = !_2304;
    int _2330 = _2328 ? _2294 : (-1);
    float _2332 = _2318 + (-1.0);
    uint _2334 = uint(int(uint(_695) >> uint(2)));
    uint _2336 = uint(int(uint(int(_2334)) >> uint(2)));
    int _2338 = int(_2334) & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = int(_2334) + 1;
    uint _2344 = uint(int(uint(_2342) >> uint(2)));
    int _2346 = _2342 & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    bool _2350 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2352 = isnan(_725);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    bool _2362 = !_2228;
    int _2364 = _2362 ? _2316 : (-1);
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2368 = _2366 != 0;
    int _2370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2372 = _2370 != 0;
    int _2374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2376 = _2374 != 0;
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2380 = _725 + _2378;
    bool _2382 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2384 = isnan(_725);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = -_2360;
    float _2396 = _2394 + 1.0;
    bool _2398 = _1796 >= 0.0;
    bool _2400 = isnan(_1796);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan(0.0);
    bool _2406 = _2402 || _2404;
    float _2408 = fma(_2274, _2380, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2410 = _1796 > 0.0;
    float _2412 = _2392 * _2396;
    float _2414 = _2216 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2416 = _2406 ? 0 : 1;
    float _2418 = _2408 * _2412;
    bool _2420 = _1744 == 0;
    float _2422 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2424 = _1864 ^ _1744;
    float _2426 = _2224 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = -_2392;
    float _2430 = _2428 + 1.0;
    float _2432 = _2240 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    uint _2434 = uint(int(uint(_2424) >> uint(31)));
    float _2436 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2440 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2442 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2444 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2418);
    int _2446 = ~int(_2434);
    int _2448 = _2446 + 1;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2452 = ~_2256;
    int _2454 = _2110 + _2452;
    int _2456 = _2454 + 1;
    float _2458 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2462 = _759 + _2460;
    out.m_64.x = _2436;
    out.m_64.y = _2440;
    out.m_64.z = _2442;
    out.m_64.w = _2438;
    int _2464 = _2456 ^ _2448;
    float _2466 = fma(_2360, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2444);
    float _2468 = -_2450;
    float _2470 = fma(_2458, 2.0, _2468);
    float _2472 = _1868 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2476 = _1870 + _2474;
    int _2478 = ~_2416;
    int _2480 = _2478 + 1;
    int _2482 = _2480 + 1;
    float _2484 = -_137;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2470);
    int _2488 = _2482;
    if (!_2410)
    {
        int _2490 = ~_2416;
        int _2492 = _2490 + 1;
        _2488 = _2492;
    }
    int _2494 = _2488;
    float _2496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2498 = ~_2448;
    int _2500 = _2498 + _2464;
    int _2502 = _2500 + 1;
    float _2504 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2506 = _2472 + _2504;
    float _2508 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2510 = _2340 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2512 = _2348 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2516 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2508);
    float _2518 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2522 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2524 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2516);
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2530 = !_2420;
    int _2532 = _2530 ? _2502 : (-1);
    float _2534 = _918 + 0.5;
    bool _2536 = _2524 >= 0.0;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    out.m_66.x = _2520;
    out.m_66.y = _2522;
    out.m_66.z = _2526;
    out.m_66.w = _2528;
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2542 = !_2372;
    int _2544 = _2542 ? 0 : 1;
    float _2546 = _2514 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2548 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2552 = fma(_2546, _2534, _2486);
    float _2554 = -_2538;
    float _2556 = fma(_2548, 2.0, _2554);
    float _2558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2560 = log2(_2558);
    float _2562 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2550);
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2566 = _2462 * _2462;
    int _2568 = abs(_2544);
    float _2570 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2572 = float(_2066);
    float _2574 = fma(_2476, _2476, _2566);
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2578 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2580 = float(_2568);
    float _2582 = fma(_2506, _2506, _2574);
    float _2584 = fma(_2146, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2564);
    float _2586 = fma(_2578, -2.0, _2576);
    float _2588 = _2526;
    if (_2536)
    {
        _2588 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2590 = _2588;
    float _2592 = _2560 * _137;
    bool _2594 = !_2368;
    int _2596 = _2594 ? 0 : 1;
    float _2598 = rsqrt(_2582);
    float _2600 = _2580 * _2572;
    int _2602 = as_type<int>(_2590);
    if (_2536)
    {
        float _2604 = _2590 * 5.0;
        _2602 = as_type<int>(_2604);
    }
    int _2606 = _2602;
    int _2608 = abs(_2596);
    float _2610 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2612 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2614 = exp2(_2592);
    if (_2536)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7570 = as_type<float>(_2606);
        out.gl_Position.z = _7570;
    }
    float _2616 = float(_2244);
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2620 = float(_2608);
    float _2622 = _924 + (-0.5);
    bool _2624 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2626 = isnan(0.0);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2632 = _2628 || _2630;
    float _2634 = fma(_2570, -2.0, _2618);
    float _2636 = _2462 * _2598;
    float _2638 = _2476 * _2598;
    float _2640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2642 = _769 > 0.5;
    float _2644 = -_2636;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2462);
    float _2648 = -_2638;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2476);
    float _2652 = -_137;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2030);
    float _2656 = float(_2494);
    float _2658 = _2646 * _2646;
    float _2660 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2586);
    float _2662 = fma(_2610, _2616, _2654);
    float _2664 = fma(_2650, _2650, _2658);
    float _2666 = _2620 * _2656;
    float _2668 = -_2614;
    float _2670 = _2668 + 1.0;
    float _2672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2676 = 1.0 + _2674;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2680 = -_2612;
    float _2682 = -_2660;
    float _2684 = fma(_2680, _2622, _2682);
    float _2686 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2076);
    float _2688 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2678);
    float _2690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2692 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2688);
    float _2694 = _2632 ? _2670 : 0.0;
    float _2696 = _1964 + 0.5;
    bool _2698 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2700 = isnan(1.0);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2706 = _2702 || _2704;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2710 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2712 = 1.0 / _2676;
    float _2714 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2716 = float(_2330);
    float _2718 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2720 = -_137;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2556);
    float _2724 = fma(_2610, _2696, _2662);
    float _2726 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2708);
    float _2728 = _2672 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2730 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2710);
    float _2732 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2714);
    float _2734 = -_349;
    int _2736 = _2642 ? as_type<int>(_2734) : as_type<int>(_349);
    float _2738 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2634);
    float _2740 = fma(_2718, _2716, _2722);
    float _2742 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2726);
    float _2744 = _2690 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2746 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2730);
    float _2748 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2732);
    float _2750 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2562);
    float _2752 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2584);
    bool _2754 = _791 > 0.5;
    if (_2706)
    {
        float _2756 = _2694 * _2712;
        _139 = _2756;
    }
    float _2758 = _139;
    float _2760 = float(_2364);
    float _2762 = -_2746;
    float _2764 = _2762 + 1.0;
    bool _2766 = !_1712;
    float _2768 = _2766 ? _349 : as_type<float>(_2736);
    float _2770 = -_2748;
    float _2772 = _2770 + 1.0;
    float _2774 = in.m_68.x;
    float _2776 = in.m_68.y;
    float _2778 = in.m_68.z;
    float _2780 = -_285;
    int _2782 = _2754 ? as_type<int>(_2780) : as_type<int>(_285);
    float _2784 = -_2686;
    float _2786 = fma(_2744, _2760, _2784);
    float _2788 = float(_2532);
    float _2790 = _2768 + (-0.5);
    bool _2792 = !_1696;
    float _2794 = _2792 ? _285 : as_type<float>(_2782);
    float _2796 = -_2764;
    float _2798 = fma(_918, _2796, _2552);
    float _2800 = -_2750;
    float _2802 = _2800 + 1.0;
    float _2804 = -_2738;
    float _2806 = fma(_2728, _2788, _2804);
    float _2808 = _1022 + (-0.5);
    float _2810 = _2794 + 0.5;
    float _2812 = -_2744;
    float _2814 = fma(_2812, _2790, _2786);
    float _2816 = -_2692;
    float _2818 = _2816 + 1.0;
    float _2820 = -_2728;
    float _2822 = fma(_2820, _2808, _2806);
    float _2824 = fma(_2718, _2810, _2740);
    float _2826 = -_2742;
    float _2828 = _2826 + 1.0;
    float _2830 = -_2752;
    float _2832 = _2830 + 1.0;
    float _2834 = _2666 * (-2.0);
    float _2836 = fma(_924, _2772, _2684);
    float _2838 = -_2828;
    float _2840 = fma(_1964, _2838, _2724);
    float _2842 = -_2802;
    float _2844 = fma(_2794, _2842, _2824);
    float _2846 = fma(_2768, _2818, _2814);
    float _2848 = _2506 * _2598;
    float _2850 = fma(_1022, _2832, _2822);
    float _2852 = _577 + (-0.5);
    float _2854 = fma(_2834, _2774, _2774);
    float _2856 = -_2848;
    float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2506);
    out.m_70.x = _2798;
    out.m_70.y = _2836;
    float _2860 = fma(_2422, _2834, _2422);
    float _2862 = fma(_2852, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2854);
    float _2864 = fma(_2858, _2858, _2664);
    out.m_72.x = _2840;
    out.m_72.y = _2846;
    out.m_72.z = _2844;
    out.m_72.w = _2850;
    float _2866 = _791 + _769;
    bool _2868 = !_2376;
    int _2870 = _2868 ? 0 : 1;
    float _2872 = _2778;
    float _2874 = _2848;
    if (_2536)
    {
        out.m_45.x = 0.0;
    }
    if (_2536)
    {
        return out;
    }
    float _2876 = -_2636;
    float _2878 = fma(_2876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _2880 = -_2638;
    float _2882 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1870);
    int _2884 = abs(_2870);
    float _2886 = -_2848;
    float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2472);
    float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2892 = _2878 + _2890;
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2896 = _2882 + _2894;
    float _2898 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2900 = _2888 + _2898;
    float _2902 = _2892 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2904 = fma(_2860, _2758, _2862);
    float _2906 = _2866 + (-1.0);
    float _2908 = _2600 * (-2.0);
    float _2910 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2902);
    float _2912 = _2904 * 0.15915493667125701904296875;
    float _2914 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2916 = _769 + (-0.5);
    float _2918 = fma(_2900, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2910);
    float _2920 = fma(_2908, _2776, _2776);
    float _2922 = float(_2326);
    float _2924 = _577 + _791;
    float _2926 = float(_2884);
    float _2928 = fma(_2914, _2908, _2914);
    bool _2930 = _2918 >= 0.0;
    float _2932 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2920);
    float _2934 = _2926 * _2922;
    float _2936 = _2924 + (-1.0);
    float _2938 = fma(_2928, _2758, _2932);
    float _2940 = sqrt(_2864);
    float _2942 = _2934 * (-2.0);
    float _2944 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2946 = _2938 * 0.15915493667125701904296875;
    float _2948 = _791 + (-0.5);
    float _2950 = fma(_2942, _2778, _2778);
    float _2952 = fma(_2944, _2942, _2944);
    if (_2930)
    {
        _2872 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2954 = _2872;
    float _2956 = _2912 * 6.283185482025146484375;
    float _2958 = sin(_2956);
    float _2960 = fma(_2948, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2950);
    int _2962 = as_type<int>(_2954);
    if (_2930)
    {
        out.m_45.x = 0.0;
    }
    if (_2930)
    {
        float _2964 = _2954 * 5.0;
        _2962 = as_type<int>(_2964);
    }
    int _2966 = _2962;
    float _2968 = fma(_2952, _2758, _2960);
    float _2970 = _2912 * 6.283185482025146484375;
    float _2972 = cos(_2970);
    if (_2930)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8176 = as_type<float>(_2966);
        out.gl_Position.z = _8176;
    }
    float _2974 = _2968 * 0.15915493667125701904296875;
    float _2976 = _2946 * 6.283185482025146484375;
    float _2978 = sin(_2976);
    float _2980 = _2946 * 6.283185482025146484375;
    float _2982 = cos(_2980);
    if (_2930)
    {
        return out;
    }
    float _2984 = _2974 * 6.283185482025146484375;
    float _2986 = cos(_2984);
    float _2988 = _2598 * _2940;
    float _2990 = _691 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _349);
    float _2994 = _2958 * _2978;
    float _2996 = _2972 * _2982;
    float _2998 = _2988 * _2990;
    float _3000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _285);
    float _3002 = _2974 * 6.283185482025146484375;
    float _3004 = sin(_3002);
    float _3006 = _2972 * _2978;
    float _3008 = _2992 * _2998;
    float _3010 = _689 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3012 = _2958 * _2982;
    float _3014 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3016 = _2988 * _3010;
    float _3018 = _2972 * _2986;
    float _3020 = _2978 * _2986;
    float _3022 = _2982 * _2986;
    float _3024 = _3000 * _3016;
    float _3026 = _3018 * _3008;
    float _3028 = _2958 * _2986;
    float _3030 = _2988 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3032 = _3030 * 0.5;
    float _3034 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3014);
    float _3036 = fma(_3004, _2996, _2994);
    float _3038 = -_3008;
    float _3040 = _3004 * _3038;
    float _3042 = -_3012;
    float _3044 = fma(_3004, _3006, _3042);
    float _3046 = -_3006;
    float _3048 = fma(_3004, _3012, _3046);
    float _3050 = fma(_3036, _3024, _3026);
    float _3052 = fma(_3022, _3024, _3040);
    float _3054 = _3028 * _3008;
    float _3056 = fma(_3004, _2994, _2996);
    float _3058 = fma(_3044, _3032, _3050);
    float _3060 = fma(_3020, _3032, _3052);
    float _3062 = fma(_3048, _3024, _3054);
    float _3064 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3034);
    float _3066 = _3058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3068 = _3058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3070 = fma(_3056, _3032, _3062);
    float _3072 = _3064 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3074 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3066);
    float _3076 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3068);
    float _3078 = _3058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3080 = 1.0 / _3072;
    float _3082 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3074);
    float _3084 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3076);
    float _3086 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3078);
    bool _3088 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3090 = isnan(0.5);
    bool _3092 = _3088 || _3090;
    bool _3094 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3096 = _3092 || _3094;
    float _3098 = _3082 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3100 = _3084 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3102 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3086);
    bool _3104 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3106 = isnan(0.5);
    bool _3108 = _3104 || _3106;
    bool _3110 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3112 = _3108 || _3110;
    float _3114 = _2472 + _3098;
    float _3116 = _1870 + _3100;
    float _3118 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3120 = _3102 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3124 = _3114 + _3122;
    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3128 = _3116 + _3126;
    float _3130 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3118);
    float _3132 = _759 + _3120;
    float _3134 = _3124 * _3124;
    float _3136 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3130);
    float _3138 = fma(_3128, _3128, _3134);
    float _3140 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3142 = sqrt(_3138);
    float _3144 = _3140 + _3072;
    float _3146 = _3144 * _3080;
    float _3148 = _3146 * 0.5;
    float _3150 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3152 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3150);
    bool _3154 = _3142 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3156 = 1.0 / _3152;
    float _3158 = _3072;
    float _3160 = _3064;
    float _3162 = _3116;
    float _3164 = _3120;
    if (!_3154)
    {
        _3158 = _3114;
    }
    float _3166 = _3158;
    float _3168 = _3166;
    if (!_3154)
    {
        _3160 = _3132;
    }
    float _3170 = _3160;
    bool _3172 = !_3154;
    float _3174 = _3170;
    float _3176 = _3156;
    if (!_3172)
    {
        float _3178 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3180 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3182 = _3142 + _3180;
        float _3184 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3186 = _3182 * _3178;
        float _3188 = rsqrt(_3138);
        float _3190 = _3186 * 0.15915493667125701904296875;
        float _3192 = _3190 * 6.283185482025146484375;
        float _3194 = cos(_3192);
        float _3196 = _3190 * 6.283185482025146484375;
        float _3198 = sin(_3196);
        float _3200 = _3194 + (-1.0);
        float _3202 = _3200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3204 = fma(_3198, _3184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3206 = fma(_3132, _3194, _3202);
        float _3208 = _3188 * _3204;
        float _3210 = fma(_3128, _3208, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3212 = fma(_3124, _3208, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3162 = _3210;
        _3174 = _3206;
        _3168 = _3212;
        _3164 = _3184;
    }
    float _3214 = _3162;
    float _3216 = _3174;
    float _3218 = _3168;
    float _3220 = _3164;
    float _3222 = -_2638;
    float _3224 = fma(_3222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3214);
    float _3226 = -_2636;
    float _3228 = fma(_3226, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3216);
    float _3230 = -_2848;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3218);
    float _3234 = _3220;
    float _3236 = _3228;
    float _3238 = _3224;
    float _3240 = _3232;
    if (_3112)
    {
        _3234 = 1.0;
    }
    float _3242 = _3234;
    float _3244 = _3242;
    if (!_3096)
    {
        float _3246 = _2892 * _2892;
        float _3248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3250 = -_2472;
        float _3252 = _3250 + _3218;
        float _3254 = fma(_2896, _2896, _3246);
        float _3256 = fma(_2900, _2900, _3254);
        float _3258 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3260 = sqrt(_3256);
        float _3262 = 1.0 / _2988;
        float _3264 = _3258 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3266 = precise::min(_3260, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3268 = _3266 * _3248;
        float _3270 = _3268 * _3262;
        float _3272 = -_1870;
        float _3274 = _3272 + _3214;
        float _3276 = -_759;
        float _3278 = _3276 + _3216;
        float _3280 = _3264 * _3270;
        float _3282 = _3252 * _3270;
        float _3284 = fma(_3274, _3280, _2882);
        float _3286 = fma(_3278, _3280, _2878);
        float _3288 = fma(_3264, _3282, _2888);
        _3236 = _3286;
        _3238 = _3284;
        _3240 = _3288;
    }
    float _3290 = _3236;
    float _3292 = _3238;
    float _3294 = _3240;
    if (_3112)
    {
        _1942 = 1.0;
    }
    float _3296 = _1942;
    float _3298 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3300 = _3156 * _3298;
    float _3302 = _3296;
    if (!_3112)
    {
        float _3304 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3306 = _3304 * 0.15915493667125701904296875;
        float _3308 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3310 = _3306 * 6.283185482025146484375;
        float _3312 = cos(_3310);
        float _3314 = _3308 * 0.15915493667125701904296875;
        float _3316 = _3306 * 6.283185482025146484375;
        float _3318 = sin(_3316);
        float _3320 = 1.0 / _3312;
        float _3322 = _3314 * 6.283185482025146484375;
        float _3324 = cos(_3322);
        float _3326 = _3318 * _3320;
        float _3328 = _3314 * 6.283185482025146484375;
        float _3330 = sin(_3328);
        float _3332 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3334 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3332;
        float _3336 = _3324 * _3326;
        float _3338 = 1.0 / _3334;
        float _3340 = 1.0 / _3336;
        float _3342 = _3330 * _3340;
        float _3344 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3346 = fma(_3300, _3342, _3344);
        float _3348 = _3346 * _3338;
        float _3350 = precise::clamp(_3348, 0.0, 1.0);
        _3176 = _3314;
        _3244 = _3350;
    }
    float _3352 = _3176;
    float _3354 = _3244;
    float _3356 = _3352;
    if (!_3112)
    {
        float _3358 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3360 = _3358 * 0.15915493667125701904296875;
        float _3362 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3364 = _3360 * 6.283185482025146484375;
        float _3366 = cos(_3364);
        float _3368 = _3362 * 0.15915493667125701904296875;
        float _3370 = _3360 * 6.283185482025146484375;
        float _3372 = sin(_3370);
        float _3374 = 1.0 / _3366;
        float _3376 = _3368 * 6.283185482025146484375;
        float _3378 = cos(_3376);
        float _3380 = _3372 * _3374;
        float _3382 = _3368 * 6.283185482025146484375;
        float _3384 = sin(_3382);
        float _3386 = _3378 * _3380;
        float _3388 = 1.0 / _3386;
        float _3390 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3392 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3390;
        float _3394 = 1.0 / _3392;
        float _3396 = _3384 * _3388;
        float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3400 = fma(_3300, _3396, _3398);
        float _3402 = _3400 * _3394;
        float _3404 = precise::clamp(_3402, 0.0, 1.0);
        float _3406 = -_3404;
        float _3408 = _3406 + 1.0;
        _3356 = _3366;
        _3302 = _3408;
    }
    float _3410 = _3356;
    float _3412 = _3302;
    float _3414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3416 = _3290 + _3414;
    float _3418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3420 = _3292 + _3418;
    float _3422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3424 = _3294 + _3422;
    float _3426 = _3416 * _3416;
    float _3428 = fma(_3420, _3420, _3426);
    float _3430 = fma(_3424, _3424, _3428);
    float _3432 = rsqrt(_3430);
    float _3434 = sqrt(_3430);
    float _3436 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3438 = _3420 * _3436;
    float _3440 = _3424 * _3436;
    float _3442 = _3438 * _3438;
    float _3444 = _3440 * _3440;
    float _3446 = _3442 + _3444;
    float _3448 = sqrt(_3446);
    bool _3450 = _3448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3454 = _3448 + _3452;
    float _3456 = _3424;
    float _3458 = _3446;
    float _3460 = _3454;
    float _3462 = _3410;
    if (_3450)
    {
        float _3464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3456 = _3464;
    }
    float _3466 = _3456;
    if (_3450)
    {
        float _3468 = rsqrt(_3446);
        _3458 = _3468;
    }
    float _3470 = _3458;
    float _3472 = _3470;
    if (_3450)
    {
        float _3474 = _3454 * _3466;
        _3460 = _3474;
    }
    float _3476 = _3460;
    if (_3450)
    {
        float _3478 = _3476 * 0.15915493667125701904296875;
        _3462 = _3478;
    }
    float _3480 = _3462;
    float _3482 = _3466;
    float _3484 = _3480;
    if (_3450)
    {
        float _3486 = _3480 * 6.283185482025146484375;
        float _3488 = sin(_3486);
        _3482 = _3488;
    }
    float _3490 = _3482;
    float _3492 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3494 = precise::max(0.0, _3492);
    float _3496 = _3432;
    float _3498 = _3494;
    if (_3450)
    {
        float _3500 = _3480 * 6.283185482025146484375;
        float _3502 = cos(_3500);
        _3496 = _3502;
    }
    float _3504 = _3496;
    float _3506 = -_3436;
    float _3508 = -_3494;
    float _3510 = fma(_3416, _3506, _3508);
    float _3512 = _3510;
    if (_3450)
    {
        float _3514 = _3510 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3498 = _3514;
    }
    float _3516 = _3498;
    float _3518 = _3490;
    float _3520 = _3516;
    if (_3450)
    {
        float _3522 = fma(_3490, _3516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3518 = _3522;
    }
    float _3524 = _3518;
    float _3526 = _3524;
    float _3528 = _3504;
    if (_3450)
    {
        float _3530 = _3504 + (-1.0);
        _3520 = _3530;
    }
    float _3532 = _3520;
    float _3534 = _3532;
    if (_3450)
    {
        float _3536 = _3470 * _3524;
        _2874 = _3536;
    }
    float _3538 = _2874;
    if (!_3450)
    {
        _3526 = _3438;
    }
    float _3540 = _3526;
    float _3542 = _3540;
    if (_3450)
    {
        float _3544 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3484 = _3544;
    }
    float _3546 = _3484;
    if (_3450)
    {
        float _3548 = _3438 * _3538;
        _3542 = _3548;
    }
    float _3550 = _3542;
    if (!_3450)
    {
        _3534 = _3440;
    }
    float _3552 = _3534;
    float _3554 = _3552;
    if (_3450)
    {
        float _3556 = _3440 * _3538;
        _3554 = _3556;
    }
    float _3558 = _3554;
    if (!_3450)
    {
        _3472 = _3442;
    }
    float _3560 = _3472;
    float _3562 = _3560;
    if (_3450)
    {
        float _3564 = fma(_3510, _3504, _3546);
        _3512 = _3564;
    }
    float _3566 = _3512;
    if (_3450)
    {
        float _3568 = _3550 * _3550;
        _3562 = _3568;
    }
    float _3570 = _3562;
    if (!_3450)
    {
        _3528 = _3444;
    }
    float _3572 = _3528;
    float _3574 = _3572;
    if (_3450)
    {
        float _3576 = _3558 * _3558;
        _3574 = _3576;
    }
    float _3578 = _3574;
    float _3580 = fma(_3566, _3566, _3570);
    float _3582 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3584 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3586 = _3580 + _3578;
    float _3588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3590 = fma(_3434, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3588);
    float _3592 = precise::clamp(_3590, 0.0, 1.0);
    float _3594 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3582);
    float _3596 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3598 = rsqrt(_3586);
    float _3600 = -_3592;
    float _3602 = _3600 + 1.0;
    float _3604 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3594);
    float _3606 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3608 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3596);
    float _3610 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3612 = _3604 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3614 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3606);
    float _3616 = abs(_3602);
    float _3618 = log2(_3616);
    float _3620 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3608);
    float _3622 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3624 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3614);
    float _3626 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3610);
    float _3628 = _3620 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3630 = -_3622;
    float _3632 = fma(_3630, _3584, 1.0);
    float _3634 = _3624 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3636 = _3598 * _3550;
    float _3638 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3640 = _3598 * _3566;
    float _3642 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3626);
    float _3644 = _3636 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3646 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3638);
    float _3648 = _3598 * _3558;
    float _3650 = _3642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3652 = -_3644;
    float _3654 = fma(_3640, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3652);
    float _3656 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3658 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3646);
    float _3660 = log2(_3632);
    float _3662 = -_3648;
    float _3664 = fma(_3662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3654);
    float _3666 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3668 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3658);
    float _3670 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3672 = fma(_3664, -0.5, 0.5);
    float _3674 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3666);
    float _3676 = fma(_3664, 0.5, 0.5);
    float _3678 = exp2(_3656);
    float _3680 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3670);
    float _3682 = _3640 + 1.0;
    float _3684 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3674);
    float _3686 = fma(_3676, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3688 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3680);
    float _3690 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3684);
    float _3692 = 1.0 / _3668;
    float _3694 = fma(_3676, _3686, -0.212114393711090087890625);
    float _3696 = _3660 * 0.693147182464599609375;
    float _3698 = fma(_3676, _3694, 1.570728778839111328125);
    float _3700 = _3696 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3702 = sqrt(_3672);
    float _3704 = -_3640;
    float _3706 = fma(_3678, _3682, _3704);
    float _3708 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3688);
    float _3710 = _3690 * _3692;
    float _3712 = _3708 * _3692;
    float _3714 = fma(_3710, 0.5, 0.5);
    float _3716 = fma(_3712, -0.5, 0.5);
    float _3718 = _3702 * 0.636619746685028076171875;
    float _3720 = fma(_3706, 0.5, 0.5);
    float _3722 = -_3698;
    float _3724 = fma(_3718, _3722, 1.0);
    float3 _9360 = float3(_3714, _3716, _3700);
    float _3726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9360, float3(0.0), isnan(_9360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9360, float3(0.0), isnan(_9360)), level(0.0)).x;
    float3 _9371 = float3(_3714, _3716, _3700);
    float4 _3729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9371, float3(0.0), isnan(_9371)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9371, float3(0.0), isnan(_9371)), level(0.0)).xyzw;
    float _3731 = _3729.x;
    float _3733 = _3729.y;
    float _3735 = _3729.z;
    float _3737 = _3729.w;
    float2 _9388 = float2(_3724, _3720);
    float3 _3741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9388, float2(0.0), isnan(_9388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9388, float2(0.0), isnan(_9388)), level(0.0)).xyz;
    float _3743 = _3741.x;
    float _3745 = _3741.y;
    float _3747 = _3741.z;
    float _3749 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3751 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3753 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3755 = _349 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3757 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3749);
    float _3759 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3751);
    float _3761 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3753);
    float _3763 = fma(_3755, _3755, 1.0);
    float _3765 = _3018 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3767 = _3018 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3769 = _3018 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3771 = _3044 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3773 = _3044 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3775 = rsqrt(_3763);
    float _3777 = -_3004;
    float _3779 = fma(_3777, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3765);
    float _3781 = -_3004;
    float _3783 = fma(_3781, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3767);
    float _3785 = -_3004;
    float _3787 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3769);
    float _3789 = _3044 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3791 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3771);
    float _3793 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3773);
    float _3795 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3797 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3779);
    float _3799 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3783);
    float _3801 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3787);
    float _3803 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3789);
    float _3805 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3791);
    float _3807 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3793);
    float _3809 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3795);
    float _3811 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3757);
    float _3813 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3759);
    float _3815 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3761);
    float _3817 = _285 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3819 = _3755 * _3797;
    float _3821 = _3755 * _3799;
    float _3823 = _3755 * _3801;
    float _3825 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3803);
    float _3827 = _3755 * _3775;
    float _3829 = fma(_3817, _3811, _3819);
    float _3831 = fma(_3817, _3813, _3821);
    float _3833 = fma(_3817, _3815, _3823);
    float _3835 = -_3807;
    float _3837 = _3827 * _3835;
    float _3839 = -_3825;
    float _3841 = _3827 * _3839;
    float _3843 = -_3805;
    float _3845 = _3827 * _3843;
    float _3847 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3849 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3809);
    float _3851 = fma(_3775, _3799, _3841);
    float _3853 = _3354 * _3412;
    bool _3855 = _3354 > 0.0;
    bool _3857 = isnan(_3354);
    bool _3859 = _3855 || _3857;
    bool _3861 = isnan(0.0);
    bool _3863 = _3859 || _3861;
    float _3865 = fma(_3775, _3797, _3837);
    float _3867 = exp2(_3847);
    float _3869 = _3853 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3871 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3849);
    bool _3873 = _3412 <= 0.0;
    bool _3875 = !_3863;
    bool _3877 = _3873 || _3875;
    float _3879 = fma(_3775, _3801, _3845);
    out.m_74.x = _3811;
    out.m_74.y = _3813;
    out.m_74.z = _3815;
    float _3881 = _3871 + _3668;
    float _3883 = _3690 + _3668;
    float _3885 = _3668 * 0.5;
    out.m_76.x = _3292;
    out.m_76.y = _3290;
    out.m_76.z = _3294;
    float _3887 = _3807 + _3829;
    float _3889 = _3825 + _3831;
    float _3891 = _3805 + _3833;
    float _3893 = _3869 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3895 = _3881 * 0.5;
    float _3897 = -_3867;
    float _3899 = _3897 + 1.0;
    float _3901 = _3883 * 0.5;
    float _3903 = fma(_3708, -0.5, _3885);
    out.m_78.x = _3865;
    out.m_78.y = _3851;
    out.m_78.z = _3879;
    float _3905 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3887;
    out.m_80.y = _3889;
    out.m_80.z = _3891;
    float _3907 = -_3905;
    float _3909 = _3907 + 1.0;
    out.m_45.x = _3893;
    out.gl_Position.x = _3690;
    out.gl_Position.y = _3708;
    out.gl_Position.z = _3871;
    out.gl_Position.w = _3668;
    out.m_82.x = _3901;
    out.m_82.y = _3903;
    out.m_82.z = _3895;
    out.m_82.w = _3668;
    float _3911 = _3905 * _3726;
    float _3913 = _3737 * _3909;
    float _3915 = _3737 * _3911;
    float _3917 = _3747 * _3911;
    float _3919 = fma(_3743, _3915, _3731);
    float _3921 = fma(_3745, _3915, _3733);
    float _3923 = fma(_3737, _3917, _3735);
    out.m_84.x = _3919;
    out.m_84.y = _3921;
    out.m_84.z = _3923;
    out.m_84.w = _3913;
    if (!_3877)
    {
        return out;
    }
    float _3925 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3925;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _717 = false;
    bool _501 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3982 = as_type<float>(_119);
        out.gl_Position.z = _3982;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _4052 = as_type<float>(_157);
        out.gl_Position.z = _4052;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = in.m_53.x;
    float _175 = in.m_53.y;
    float _177 = in.m_53.z;
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.w;
    float _183 = in.m_47.x;
    float _185 = in.m_47.y;
    float _187 = in.m_47.z;
    float _189 = _159 * _159;
    float _191 = _161 * _161;
    float _193 = _163 * _163;
    float _195 = fma(_167, _167, _189);
    float _197 = fma(_169, _169, _191);
    float _199 = fma(_171, _171, _193);
    float _201 = fma(_173, _173, _195);
    float _203 = fma(_175, _175, _197);
    float _205 = fma(_177, _177, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _207 > 0.0;
    float _213 = sqrt(_205);
    bool _215 = _209 > 0.0;
    int _217 = as_type<int>(_179) & 1;
    bool _219 = _217 != 0;
    int _221 = as_type<int>(_179) & 2;
    bool _223 = _221 != 0;
    float _225 = 0.0;
    float _227 = _203;
    if (_211)
    {
        float _229 = rsqrt(_201);
        _225 = _229;
    }
    float _231 = _225;
    float _233 = in.m_42.x;
    float _235 = in.m_42.y;
    float _237 = in.m_42.z;
    bool _239 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _243 = _239 || _241;
    bool _245 = isnan(1.0);
    bool _247 = _243 || _245;
    float _249 = 0.0;
    float _251 = 0.0;
    if (!_211)
    {
        _249 = 0.0;
        _251 = 0.0;
    }
    float _253 = _249;
    float _255 = _251;
    bool _257 = _213 > 0.0;
    float _259 = 0.0;
    float _261 = _253;
    float _263 = _255;
    if (!_211)
    {
        _259 = 0.0;
    }
    float _265 = _259;
    float _267 = 0.0;
    float _269 = _265;
    if (_215)
    {
        float _271 = rsqrt(_203);
        _267 = _271;
    }
    float _273 = _267;
    float _275 = 0.0;
    float _277 = 0.0;
    if (!_215)
    {
        _275 = 0.0;
        _277 = 0.0;
    }
    float _279 = _275;
    float _281 = _277;
    bool _283 = !_219;
    float _285 = _283 ? (-0.5) : 0.5;
    float _287 = _231;
    float _289 = _281;
    float _291 = _279;
    if (_211)
    {
        float _293 = _231 * _167;
        _261 = _293;
    }
    float _295 = _261;
    if (_211)
    {
        float _297 = _231 * _159;
        _269 = _297;
    }
    float _299 = _269;
    float _301 = _299;
    if (_211)
    {
        float _303 = _231 * _173;
        _263 = _303;
    }
    float _305 = _263;
    if (!_247)
    {
        float _307 = _165 * _165;
        float _309 = _307 * 0.5;
        _287 = _309;
    }
    float _311 = _287;
    float _313 = _311;
    if (!_215)
    {
        _227 = 0.0;
    }
    float _315 = _227;
    float _317 = 0.0;
    float _319 = _315;
    if (_257)
    {
        float _321 = rsqrt(_205);
        _317 = _321;
    }
    float _323 = _317;
    if (!_247)
    {
        float _325 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _325;
    }
    float _327 = _313;
    float _329 = _273;
    float _331 = _327;
    if (_215)
    {
        float _333 = _273 * _169;
        _289 = _333;
    }
    float _335 = _289;
    if (_215)
    {
        float _337 = _273 * _161;
        _291 = _337;
    }
    float _339 = _291;
    if (_215)
    {
        float _341 = _273 * _175;
        _319 = _341;
    }
    float _343 = _319;
    if (!_257)
    {
        _329 = 0.0;
    }
    float _345 = _329;
    bool _347 = !_223;
    float _349 = _347 ? (-0.5) : 0.5;
    bool _351 = !_247;
    float _353 = 0.0;
    float _355 = _345;
    if (!_351)
    {
        float _357 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _359 = log2(_357);
        float _361 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _363 = _361 + 1.0;
        float _365 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = _165 * _359;
        float _369 = 1.0 / _363;
        float _371 = _365 * 0.693147182464599609375;
        float _373 = exp2(_367);
        float _375 = 1.0 / _371;
        float _377 = _373 + (-1.0);
        float _379 = -_377;
        float _381 = fma(_379, _375, _165);
        float _383 = _381 * _369;
        float _385 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _331 = _385;
        _353 = _371;
    }
    float _387 = _331;
    float _389 = _353;
    float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _393 = _389;
    float _395 = _387;
    if (_257)
    {
        float _397 = _323 * _163;
        _355 = _397;
    }
    float _399 = _355;
    float _401 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_257)
    {
        _393 = 0.0;
    }
    float _403 = _393;
    float _405 = _391 * _299;
    float _407 = _391 * _399;
    float _409 = _391 * _339;
    float _411 = _403;
    if (_257)
    {
        float _413 = _323 * _171;
        _411 = _413;
    }
    float _415 = _411;
    float _417 = fma(_401, _295, _405);
    float _419 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_257)
    {
        _301 = 0.0;
    }
    float _421 = _301;
    float _423 = _421;
    if (_257)
    {
        float _425 = _323 * _177;
        _423 = _425;
    }
    float _427 = _423;
    float _429 = fma(_401, _335, _409);
    float _431 = fma(_401, _415, _407);
    float _433 = fma(_419, _305, _417);
    if (!_247)
    {
        _395 = _165;
    }
    float _435 = _395;
    bool _437 = !_247;
    float _439 = _435;
    if (!_437)
    {
        float _441 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _443 = log2(_441);
        float _445 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _447 = _445 + 1.0;
        float _449 = 1.0 / _447;
        float _451 = _165 * _443;
        float _453 = exp2(_451);
        float _455 = -_453;
        float _457 = _455 + 1.0;
        float _459 = _457 * _449;
        _439 = _459;
    }
    float _461 = _439;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _465 = fma(_419, _343, _429);
    float _467 = fma(_419, _427, _431);
    float _469 = fma(_461, _183, _433);
    float _471 = fma(_461, _185, _465);
    float _473 = fma(_461, _187, _467);
    float _475 = fma(_469, _181, _233);
    float _477 = fma(_471, _181, _235);
    float _479 = fma(_473, _181, _237);
    bool _481 = !_463;
    float _499;
    if (!_481)
    {
        float _483 = in.m_60.x;
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _487 = _483 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_103);
        float _505 = 1.0 / _503;
        float _507 = _137 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = _509 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _517 = _509 + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _527;
    bool _531 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _533 = isnan(_509);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _521;
    float _545 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _547 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _549 = 1.0 / _529;
    float _551 = 1.0 / _525;
    float _553 = _513 * _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _557 = _509 + _555;
    bool _559 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _561 = isnan(_509);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = _557 * _549;
    float _573 = -_569;
    float _575 = _573 + 1.0;
    float _577 = in.m_60.x;
    float _579 = _541 * _575;
    bool _581 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _583 = isnan(_509);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -_541;
    float _595 = _593 + 1.0;
    float _597 = _517 * _551;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _603;
    float _607 = fma(_601, _553, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _609 = fma(_605, _553, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _611 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _613 = isnan(_509);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _631 = -_621;
    float _633 = _631 + 1.0;
    float _635 = _621 * _595;
    float _637 = fma(_625, _597, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _639 = fma(_629, _597, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _641 = _591 * _633;
    float _643 = in.m_58.x;
    float _645 = in.m_58.y;
    float _647 = _545 * _577;
    float _649 = -_591;
    float _651 = _649 + 1.0;
    float _653 = _607 * _641;
    float _655 = _609 * _641;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _661;
    float _665 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].x, _653);
    float _667 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[143].y, _655);
    float _669 = trunc(_647);
    int _671 = int(_669);
    float _673 = fma(_659, _571, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _675 = fma(_663, _571, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _677 = fma(_637, _635, _665);
    float _679 = fma(_639, _635, _667);
    float _681 = fma(_673, _579, _677);
    float _683 = fma(_675, _579, _679);
    float _685 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[146].x, _681);
    float _687 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[146].y, _683);
    float _689 = _685 * _643;
    float _691 = _687 * _645;
    int _693 = _671 << 4;
    int _695 = _693 + 1712;
    bool _697 = !_547;
    float _699 = as_type<float>(_671);
    float _715;
    if (!_697)
    {
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _703 = _577 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        float _719 = float(_103);
        float _721 = 1.0 / _719;
        float _723 = _137 * _721;
        _715 = _723;
    }
    _717 = false;
    float _725 = _715;
    float _727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _729 = int(_727);
    float _731 = in.m_60.w;
    float _733 = _477 * _161;
    int _735 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _737 = _735 != 0;
    float _739 = _477 * _175;
    float _741 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _743 = int(_741);
    float _745 = fma(_475, _159, _733);
    float _747 = fma(_475, _173, _739);
    float _749 = fma(_479, _163, _745);
    float _751 = float(_729);
    float _753 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _755 = int(_753);
    if (_737)
    {
        _699 = 1.0;
    }
    float _757 = _699;
    float _759 = _749 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _761 = _757;
    if (!_737)
    {
        _761 = 7.345489978790283203125;
    }
    float _763 = _761;
    float _765 = float(_743);
    float _767 = 1.0 / _751;
    float _769 = in.m_60.y;
    float _771 = _763 * _577;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _775 = int(_773);
    float _777 = float(uint(_755));
    int _779 = ~_755;
    int _781 = _779 + 1;
    float _783 = float(_755);
    int _785 = _755 + (-1);
    float _787 = 1.0 / _765;
    float _789 = _767 * _137;
    float _791 = in.m_60.z;
    float _793 = 1.0 / _777;
    float _795 = float(uint(_775));
    bool _797 = _769 > 0.5;
    int _799 = ~_775;
    int _801 = _799 + 1;
    float _803 = trunc(_789);
    int _805 = int(_803);
    float _807 = _787 * _137;
    float _809 = _787;
    if (_737)
    {
        _809 = _577;
    }
    float _811 = _809;
    float _813 = _811;
    if (!_737)
    {
        _813 = _769;
    }
    float _815 = _813;
    float _817 = 1.0 / _795;
    int _819 = as_type<int>(_793) + (-2);
    bool _821 = _791 > 0.5;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _833 = _831 != 0;
    float _835 = trunc(_807);
    int _837 = int(_835);
    float _839 = float(uint(_805));
    float _841 = float(_805);
    float _843 = as_type<float>(_819) * _839;
    float _845 = _839;
    if (_737)
    {
        _845 = 1.0;
    }
    float _847 = _845;
    float _849 = floor(_771);
    int _851 = as_type<int>(_817) + (-2);
    float _853 = _847;
    if (!_737)
    {
        _853 = 1.2345600128173828125;
    }
    float _855 = _853;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _859 = _857 != 0;
    float _861 = float(uint(_837));
    float _863 = trunc(_843);
    float _865 = precise::max(_863, 0.0);
    uint _868 = uint(_865);
    float _870 = _855 * _815;
    float _872 = as_type<float>(_851) * _861;
    int _874 = ~_775;
    int _876 = _874 + 1;
    float _878 = -_849;
    float _880 = _771 + _878;
    float _882 = trunc(_872);
    float _884 = precise::max(_882, 0.0);
    uint _886 = uint(_884);
    int _888 = ~_755;
    int _890 = _888 + 1;
    float _892 = _880 * _783;
    int _894 = _781 * int(_868);
    int _896 = _894 + _805;
    float _898 = floor(_870);
    float _900 = -_349;
    int _902 = _821 ? as_type<int>(_900) : as_type<int>(_349);
    float _904 = float(uint(_896));
    float _906 = -_285;
    int _908 = _797 ? as_type<int>(_906) : as_type<int>(_285);
    int _910 = _876 * int(_886);
    int _912 = _910 + _837;
    float _914 = as_type<float>(_819) * _904;
    bool _916 = !_829;
    float _918 = _916 ? _285 : as_type<float>(_908);
    float _920 = float(uint(_912));
    bool _922 = !_833;
    float _924 = _922 ? _349 : as_type<float>(_902);
    float _926 = trunc(_914);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    bool _932 = !_859;
    int _934 = _932 ? 0 : 1;
    float _936 = as_type<float>(_851) * _920;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _944 = _942 != 0;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _948 = _946 != 0;
    float _950 = -_898;
    float _952 = _870 + _950;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _960 = _958 != 0;
    float _962 = trunc(_936);
    float _964 = precise::max(_962, 0.0);
    uint _966 = uint(_964);
    bool _968 = !_956;
    int _970 = _968 ? 0 : 1;
    bool _972 = _731 > 0.5;
    int _974 = ~_775;
    int _976 = _974 + 1;
    bool _978 = !_944;
    int _980 = _978 ? 0 : 1;
    int _982 = int(_868) + int(_930);
    float _984 = float(_103);
    float _986 = 1.0 / _984;
    int _988 = int(_886) + int(_966);
    int _990 = _890 * _982;
    int _992 = _990 + _805;
    bool _994 = _841 >= _783;
    bool _996 = isnan(_841);
    bool _998 = _994 || _996;
    bool _1000 = isnan(_783);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = -_349;
    int _1008 = _972 ? as_type<int>(_1006) : as_type<int>(_349);
    int _1010 = _976 * _988;
    int _1012 = _1010 + _837;
    bool _1014 = uint(_992) >= uint(_755);
    float _1016 = trunc(_1004);
    int _1018 = int(_1016);
    bool _1020 = !_825;
    float _1022 = _1020 ? _349 : as_type<float>(_1008);
    bool _1024 = uint(_1012) >= uint(_775);
    bool _1026 = !_1014;
    int _1028 = _1026 ? 0 : (-1);
    bool _1030 = !_960;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _986 * _137;
    bool _1036 = !_1024;
    int _1038 = _1036 ? 0 : (-1);
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1046 = _1044 != 0;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1054 = _1052 != 0;
    int _1056 = ~_982;
    int _1058 = _1056 + _1028;
    int _1060 = _1058 + 1;
    float _1062 = float(_775);
    float _1064 = trunc(_892);
    int _1066 = int(_1064);
    bool _1068 = !_1046;
    int _1070 = _1068 ? 0 : 1;
    int _1072 = _755 * _1060;
    int _1074 = _1072 + _805;
    bool _1076 = _755 == 0;
    float _1078 = _952 * _1062;
    int _1080 = ~_1018;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    float _1086 = _783 * _1034;
    bool _1088 = !_1076;
    int _1090 = _1088 ? _1074 : (-1);
    float _1092 = trunc(_1078);
    int _1094 = int(_1092);
    float _1096 = float(_837);
    float _1098 = _1062 * _1034;
    bool _1100 = !_940;
    int _1102 = _1100 ? 0 : 1;
    int _1104 = _1090 * _1084;
    bool _1106 = _1096 >= _1062;
    bool _1108 = isnan(_1096);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1062);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    int _1118 = abs(_1032);
    float _1120 = trunc(_1086);
    int _1122 = int(_1120);
    int _1124 = _1018 * _785;
    int _1126 = _1124 + _1104;
    int _1128 = abs(_980);
    float _1130 = _477 * _169;
    int _1132 = abs(_934);
    int _1134 = abs(_1102);
    float _1136 = fma(_475, _167, _1130);
    float _1138 = trunc(_1116);
    int _1140 = int(_1138);
    int _1142 = _1066 * _1132;
    int _1144 = _1142 + _805;
    int _1146 = ~_988;
    int _1148 = _1146 + _1038;
    int _1150 = _1148 + 1;
    int _1152 = _1126 * _1128;
    bool _1154 = !_948;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1094 * _1118;
    int _1160 = _1158 + _837;
    bool _1162 = _775 == 0;
    int _1164 = _775 * _1150;
    int _1166 = _1164 + _837;
    int _1168 = abs(_1156);
    int _1170 = _1122 * _1134;
    int _1172 = _1170 + _1152;
    int _1174 = abs(_970);
    float _1176 = trunc(_1098);
    int _1178 = int(_1176);
    bool _1180 = !_1162;
    int _1182 = _1180 ? _1166 : (-1);
    int _1184 = _1144 * _1168;
    int _1186 = _1184 + _1172;
    int _1188 = ~_1140;
    int _1190 = _1188 + 1;
    int _1192 = _1190 + 1;
    bool _1194 = !_1042;
    int _1196 = _1194 ? 0 : 1;
    int _1198 = _1066 * _1174;
    int _1200 = _1198 + _1186;
    int _1202 = _775 + (-1);
    int _1204 = _1182 * _1192;
    int _1206 = abs(_1070);
    float _1208 = float(uint(_1200));
    int _1210 = _1140 * _1202;
    int _1212 = _1210 + _1204;
    int _1214 = abs(_1196);
    float _1216 = as_type<float>(_819) * _1208;
    bool _1218 = !_1050;
    int _1220 = _1218 ? 0 : 1;
    int _1222 = _1212 * _1206;
    int _1224 = abs(_1220);
    bool _1226 = !_1054;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = trunc(_1216);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    int _1236 = _1178 * _1214;
    int _1238 = _1236 + _1222;
    int _1240 = ~_755;
    int _1242 = _1240 + 1;
    int _1244 = abs(_1228);
    int _1246 = _1160 * _1224;
    int _1248 = _1246 + _1238;
    int _1250 = ~_755;
    int _1252 = _1250 + 1;
    int _1254 = ~_755;
    int _1256 = _1254 + 1;
    int _1258 = _1094 * _1244;
    int _1260 = _1258 + _1248;
    float _1262 = float(uint(_1144));
    float _1264 = float(uint(_1260));
    int _1266 = _1252 * int(_1234);
    int _1268 = _1266 + _1200;
    float _1270 = as_type<float>(_819) * _1262;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1274 = _1272 != 0;
    float _1276 = as_type<float>(_851) * _1264;
    bool _1278 = _577 > 0.5;
    float _1280 = float(uint(_1268));
    float _1282 = trunc(_1270);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = ~_775;
    int _1290 = _1288 + 1;
    float _1292 = as_type<float>(_819) * _1280;
    float _1294 = trunc(_1276);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = trunc(_1292);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    int _1306 = _1290 * int(_1298);
    int _1308 = _1306 + _1260;
    float _1310 = float(uint(_1308));
    int _1312 = int(_1234) + int(_1304);
    float _1314 = as_type<float>(_851) * _1310;
    int _1316 = ~_775;
    int _1318 = _1316 + 1;
    int _1320 = _1242 * _1312;
    int _1322 = _1320 + _1200;
    float _1324 = trunc(_1314);
    float _1326 = precise::max(_1324, 0.0);
    uint _1328 = uint(_1326);
    float _1330 = float(uint(_1160));
    bool _1332 = uint(_1322) >= uint(_755);
    float _1334 = as_type<float>(_851) * _1330;
    bool _1336 = !_1332;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = trunc(_1334);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    int _1346 = ~_1312;
    int _1348 = _1346 + _1338;
    int _1350 = _1348 + 1;
    int _1352 = int(_1298) + int(_1328);
    int _1354 = ~_775;
    int _1356 = _1354 + 1;
    int _1358 = _1256 * int(_1286);
    int _1360 = _1358 + _1144;
    int _1362 = _755 * _1350;
    int _1364 = _1362 + _1200;
    bool _1366 = !_1076;
    int _1368 = _1366 ? _1364 : (-1);
    int _1370 = _1356 * _1352;
    int _1372 = _1370 + _1260;
    float _1374 = float(uint(_1360));
    int _1376 = _1318 * int(_1344);
    int _1378 = _1376 + _1160;
    int _1380 = _1368 & 3;
    bool _1382 = _1380 != 0;
    bool _1384 = uint(_1372) >= uint(_775);
    float _1386 = as_type<float>(_819) * _1374;
    int _1388 = _1382 ? 0 : 1;
    int _1390 = _1368 & 3;
    bool _1392 = _1390 != 0;
    float _1394 = trunc(_1386);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    float _1400 = float(uint(_1378));
    bool _1402 = !_1384;
    int _1404 = _1402 ? 0 : (-1);
    bool _1406 = uint(_1390) > 1u;
    float _1408 = as_type<float>(_851) * _1400;
    int _1410 = ~_755;
    int _1412 = _1410 + 1;
    int _1414 = ~_1352;
    int _1416 = _1414 + _1404;
    int _1418 = _1416 + 1;
    float _1420 = trunc(_1408);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = ~_1388;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = _285 + 0.5;
    bool _1434 = !_1392;
    int _1436 = _1434 ? 0 : 1;
    int _1438 = _775 * _1418;
    int _1440 = _1438 + _1260;
    bool _1442 = uint(_1390) >= 2u;
    int _1444 = int(_1286) + int(_1398);
    float _1446 = -_349;
    float _1448 = _1446 + 0.5;
    int _1450 = _1430;
    if (!_1406)
    {
        int _1452 = ~_1388;
        int _1454 = _1452 + 1;
        _1450 = _1454;
    }
    int _1456 = _1450;
    bool _1458 = _1390 != 3;
    out.m_62.x = _1432;
    out.m_62.y = _1448;
    bool _1460 = !_1162;
    int _1462 = _1460 ? _1440 : (-1);
    int _1464 = _1412 * _1444;
    int _1466 = _1464 + _1144;
    int _1468 = _1442 ? 0 : 1;
    int _1470 = int(_1344) + int(_1424);
    int _1472 = _1368 >> 31;
    bool _1474 = uint(_1466) >= uint(_755);
    int _1476 = _801 * _1470;
    int _1478 = _1476 + _1160;
    int _1480 = _1462 >> 31;
    int _1482 = ~_1468;
    int _1484 = _1482 + 1;
    int _1486 = _1484 + 1;
    int _1488 = _1472 & 3;
    int _1490 = _1486;
    if (_1458)
    {
        int _1492 = ~_1468;
        int _1494 = _1492 + 1;
        _1490 = _1494;
    }
    int _1496 = _1490;
    bool _1498 = _1390 != 3;
    int _1500 = _1480 & 3;
    int _1502 = _1368 + _1488;
    int _1504 = _1462 + _1500;
    int _1506 = _1502 >> 2;
    int _1508 = _1504 >> 2;
    int _1510 = _1506 << 4;
    int _1512 = _1510 + 368;
    int _1514 = _1508 << 4;
    int _1516 = _1514 + 512;
    uint _1518 = uint(int(uint(_1512) >> uint(2)));
    uint _1520 = uint(int(uint(int(_1518)) >> uint(2)));
    int _1522 = int(_1518) & 3;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[int(_1520)][_1522];
    int _1526 = int(_1518) + 1;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    int _1530 = _1526 & 3;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[int(_1528)][_1530];
    bool _1534 = !_1474;
    int _1536 = _1534 ? 0 : (-1);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1540 = _1538 != 0;
    bool _1542 = !_1498;
    int _1544 = _1542 ? 0 : (-1);
    bool _1546 = !_1540;
    int _1548 = _1546 ? 0 : 1;
    uint _1550 = uint(int(uint(_1516) >> uint(2)));
    uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
    int _1554 = int(_1550) & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    int _1558 = int(_1550) + 1;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    int _1562 = _1558 & 3;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[int(_1560)][_1562];
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1568 = _1566 != 0;
    int _1570 = ~_1444;
    int _1572 = _1570 + _1536;
    int _1574 = _1572 + 1;
    bool _1576 = !_1568;
    int _1578 = _1576 ? 0 : 1;
    int _1580 = _1462 & 3;
    bool _1582 = _1580 != 0;
    int _1584 = _1512 + 8;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    uint _1588 = uint(int(uint(int(_1586)) >> uint(2)));
    int _1590 = int(_1586) & 3;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[int(_1588)][_1590];
    int _1594 = int(_1586) + 1;
    uint _1596 = uint(int(uint(_1594) >> uint(2)));
    int _1598 = _1594 & 3;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[int(_1596)][_1598];
    int _1602 = _1462 & 3;
    bool _1604 = _1602 != 0;
    int _1606 = _755 * _1574;
    int _1608 = _1606 + _1144;
    int _1610 = _1582 ? 0 : 1;
    bool _1612 = !_1604;
    int _1614 = _1612 ? 0 : 1;
    bool _1616 = uint(_1602) >= 2u;
    int _1618 = _1516 + 8;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    uint _1622 = uint(int(uint(int(_1620)) >> uint(2)));
    int _1624 = int(_1620) & 3;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[int(_1622)][_1624];
    int _1628 = int(_1620) + 1;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    int _1632 = _1628 & 3;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[int(_1630)][_1632];
    bool _1636 = uint(_1602) > 1u;
    int _1638 = _1616 ? 0 : 1;
    bool _1640 = _1602 != 3;
    int _1642 = ~_1610;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    int _1648 = ~_1638;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    int _1654 = abs(_1456);
    int _1656 = abs(_1614);
    int _1658 = _1646;
    int _1660 = _1652;
    if (!_1636)
    {
        int _1662 = ~_1610;
        int _1664 = _1662 + 1;
        _1658 = _1664;
    }
    int _1666 = _1658;
    bool _1668 = uint(_1478) >= uint(_775);
    if (_1640)
    {
        int _1670 = ~_1638;
        int _1672 = _1670 + 1;
        _1660 = _1672;
    }
    int _1674 = _1660;
    bool _1676 = !_1668;
    int _1678 = _1676 ? 0 : (-1);
    bool _1680 = _1602 != 3;
    int _1682 = abs(_1666);
    int _1684 = ~_1470;
    int _1686 = _1684 + _1678;
    int _1688 = _1686 + 1;
    bool _1690 = !_1680;
    int _1692 = _1690 ? 0 : (-1);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1696 = _1694 != 0;
    int _1698 = _775 * _1688;
    int _1700 = _1698 + _1160;
    int _1702 = abs(_1436);
    int _1704 = ~_1654;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1712 = _1710 != 0;
    int _1714 = abs(_1496);
    float _1716 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1718 = int(_1716);
    int _1720 = ~_1682;
    int _1722 = _1720 + 1;
    int _1724 = _1722 + 1;
    int _1726 = _1708 * as_type<int>(_1532);
    int _1728 = ~_1702;
    int _1730 = _1728 + 1;
    int _1732 = _1730 + 1;
    int _1734 = _1724 * as_type<int>(_1564);
    int _1736 = ~_1714;
    int _1738 = _1736 + 1;
    int _1740 = _1738 + 1;
    float _1742 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1744 = int(_1742);
    int _1746 = _1732 * as_type<int>(_1524);
    int _1748 = _1746 + _1726;
    int _1750 = ~_1656;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = _577 * 2.0;
    int _1758 = abs(_1674);
    int _1760 = _1740 * as_type<int>(_1592);
    int _1762 = _1760 + _1748;
    int _1764 = abs(_1544);
    int _1766 = _1754 * as_type<int>(_1556);
    int _1768 = _1766 + _1734;
    int _1770 = ~_1758;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    float _1776 = floor(_1756);
    int _1778 = abs(_1692);
    float _1780 = _791 * 2.0;
    int _1782 = abs(_1548);
    int _1784 = _1774 * as_type<int>(_1626);
    int _1786 = _1784 + _1768;
    float _1788 = float(uint(_1718));
    int _1790 = ~_1764;
    int _1792 = _1790 + 1;
    int _1794 = _1792 + 1;
    float _1796 = floor(_1780);
    int _1798 = ~_1778;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = ~_1782;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    int _1810 = _1794 * as_type<int>(_1600);
    int _1812 = _1810 + _1762;
    float _1814 = float(uint(_1744));
    int _1816 = _1802 * as_type<int>(_1634);
    int _1818 = _1816 + _1786;
    int _1820 = abs(_1578);
    float _1822 = 1.0 / _1788;
    int _1824 = _1812 * _1808;
    int _1826 = abs(_1718);
    bool _1828 = !_1076;
    int _1830 = _1828 ? _1608 : (-1);
    float _1832 = float(uint(_1826));
    float _1834 = 1.0 / _1814;
    int _1836 = ~_1820;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = _1830 * _1782;
    int _1844 = _1842 + _1824;
    int _1846 = abs(_1744);
    float _1848 = fma(_479, _171, _1136);
    bool _1850 = !_1162;
    int _1852 = _1850 ? _1700 : (-1);
    int _1854 = _1818 * _1840;
    float _1856 = float(uint(_1846));
    float _1858 = 1.0 / _1832;
    int _1860 = as_type<int>(_1822) + (-2);
    int _1862 = _1852 * _1820;
    int _1864 = _1862 + _1854;
    float _1866 = float(uint(_1844));
    float _1868 = fma(_479, _177, _747);
    float _1870 = _1848 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1872 = float(uint(_1864));
    float _1874 = as_type<float>(_1860) * _1866;
    float _1876 = 1.0 / _1856;
    int _1878 = as_type<int>(_1834) + (-2);
    int _1880 = abs(_1864);
    int _1882 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1884 = _1882 != 0;
    float _1886 = as_type<float>(_1878) * _1872;
    int _1888 = abs(_1844);
    float _1890 = trunc(_1874);
    float _1892 = precise::max(_1890, 0.0);
    uint _1894 = uint(_1892);
    int _1896 = as_type<int>(_1858) + (-2);
    float _1898 = float(uint(_1888));
    float _1900 = float(uint(_1880));
    int _1902 = ~_1718;
    int _1904 = _1902 + 1;
    float _1906 = trunc(_1886);
    float _1908 = precise::max(_1906, 0.0);
    uint _1910 = uint(_1908);
    float _1912 = as_type<float>(_1896) * _1898;
    int _1914 = as_type<int>(_1876) + (-2);
    int _1916 = ~_1744;
    int _1918 = _1916 + 1;
    float _1920 = -_285;
    int _1922 = _1278 ? as_type<int>(_1920) : as_type<int>(_285);
    float _1924 = as_type<float>(_1914) * _1900;
    float _1926 = trunc(_1912);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    int _1932 = _1904 * int(_1894);
    int _1934 = _1932 + _1844;
    int _1936 = as_type<int>(_1834);
    int _1938 = as_type<int>(_1822);
    float _1940 = as_type<float>(_1914);
    float _1942 = _1870;
    if (_1274)
    {
        _1936 = 0;
    }
    int _1944 = _1936;
    int _1946 = _1944;
    if (!_1274)
    {
        _1946 = 1;
    }
    int _1948 = _1946;
    float _1950 = float(uint(_1934));
    float _1952 = trunc(_1924);
    float _1954 = precise::max(_1952, 0.0);
    uint _1956 = uint(_1954);
    int _1958 = _1918 * int(_1910);
    int _1960 = _1958 + _1864;
    bool _1962 = !_1884;
    float _1964 = _1962 ? _285 : as_type<float>(_1922);
    float _1966 = as_type<float>(_1860) * _1950;
    bool _1968 = _1948 != 1;
    float _1970 = _577 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1972 = float(uint(_1960));
    int _1974 = ~_1826;
    int _1976 = _1974 + 1;
    int _1978 = ~_1846;
    int _1980 = _1978 + 1;
    float _1982 = as_type<float>(_1878) * _1972;
    float _1984 = trunc(_1966);
    float _1986 = precise::max(_1984, 0.0);
    uint _1988 = uint(_1986);
    int _1990 = _1976 * int(_1930);
    int _1992 = _1990 + _1888;
    bool _1994 = _1776 > 0.0;
    float _1996 = _769 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2000 = _1776 >= 0.0;
    bool _2002 = isnan(_1776);
    bool _2004 = _2000 || _2002;
    bool _2006 = isnan(0.0);
    bool _2008 = _2004 || _2006;
    float _2010 = float(uint(_1992));
    float _2012 = trunc(_1982);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    int _2018 = _1980 * int(_1956);
    int _2020 = _2018 + _1880;
    float _2022 = as_type<float>(_1992);
    float _2024 = _1996;
    if (_1274)
    {
        _1938 = 0;
    }
    int _2026 = _1938;
    float _2028 = -_1998;
    float _2030 = fma(_1970, 2.0, _2028);
    float _2032 = as_type<float>(_1896) * _2010;
    int _2034 = _2026;
    if (!_1274)
    {
        _2034 = 2;
    }
    int _2036 = _2034;
    float _2038 = float(uint(_2020));
    int _2040 = _2008 ? 0 : 1;
    float _2042 = trunc(_2032);
    float _2044 = precise::max(_2042, 0.0);
    uint _2046 = uint(_2044);
    float _2048 = as_type<float>(_1914) * _2038;
    int _2050 = ~_2040;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    bool _2056 = _2036 != 2;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2060 = _2054;
    if (!_1994)
    {
        int _2062 = ~_2040;
        int _2064 = _2062 + 1;
        _2060 = _2064;
    }
    int _2066 = _2060;
    float _2068 = trunc(_2048);
    float _2070 = precise::max(_2068, 0.0);
    uint _2072 = uint(_2070);
    int _2074 = int(_1894) + int(_1988);
    float _2076 = fma(_1996, -2.0, _2058);
    int _2078 = ~_1718;
    int _2080 = _2078 + 1;
    float _2082 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2084 = as_type<float>(_1988);
    if (!_1968)
    {
        _2084 = _769;
    }
    float _2086 = _2084;
    int _2088 = _2080 * _2074;
    int _2090 = _2088 + _1844;
    int _2092 = int(_1910) + int(_2016);
    float _2094 = _2082 * _577;
    int _2096 = int(_1930) + int(_2046);
    int _2098 = ~_1826;
    int _2100 = _2098 + 1;
    int _2102 = ~_1846;
    int _2104 = _2102 + 1;
    float _2106 = trunc(_2094);
    int _2108 = int(_2106);
    int _2110 = int(_1956) + int(_2072);
    int _2112 = _2100 * _2096;
    int _2114 = _2112 + _1888;
    float _2116 = _2086;
    float _2118 = as_type<float>(_2046);
    if (!_1968)
    {
        _1940 = _791;
    }
    float _2120 = _1940;
    float _2122 = _2120;
    if (!_1968)
    {
        _2022 = _2086;
    }
    float _2124 = _2022;
    int _2126 = _2104 * _2110;
    int _2128 = _2126 + _1880;
    float _2130 = _2124;
    if (!_1968)
    {
        _2024 = _791;
    }
    float _2132 = _2024;
    float _2134 = _769 * 2.0;
    float _2136 = _2132;
    if (_1968)
    {
        _2130 = _577;
    }
    float _2138 = _2130;
    if (_1968)
    {
        _2116 = _577;
    }
    float _2140 = _2116;
    if (_1968)
    {
        _2122 = _769;
    }
    float _2142 = _2122;
    float _2144 = floor(_2134);
    if (_1968)
    {
        _2136 = _769;
    }
    float _2146 = _2136;
    bool _2148 = uint(_2090) >= uint(_1718);
    int _2150 = ~_1744;
    int _2152 = _2150 + 1;
    bool _2154 = !_2148;
    int _2156 = _2154 ? 0 : (-1);
    bool _2158 = uint(_2114) >= uint(_1826);
    int _2160 = _2152 * _2092;
    int _2162 = _2160 + _1864;
    int _2164 = ~_2074;
    int _2166 = _2164 + _2156;
    int _2168 = _2166 + 1;
    float _2170 = as_type<float>(_2152);
    if (_2056)
    {
        _2118 = _577;
    }
    float _2172 = _2118;
    float _2174 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2176 = _2174 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2178 = _2172;
    if (_2056)
    {
        _2170 = _769;
    }
    float _2180 = _2170;
    bool _2182 = uint(_2162) >= uint(_1744);
    float _2184 = 1.0 / _2176;
    float _2186 = _2180;
    if (!_2056)
    {
        _2178 = _791;
    }
    float _2188 = _2178;
    if (!_2056)
    {
        _2186 = _577;
    }
    float _2190 = _2186;
    bool _2192 = uint(_2128) >= uint(_1846);
    int _2194 = _2108 << 4;
    int _2196 = _2194 + 1968;
    int _2198 = _1718 * _2168;
    int _2200 = _2198 + _1844;
    bool _2202 = !_2182;
    int _2204 = _2202 ? 0 : (-1);
    bool _2206 = !_2158;
    int _2208 = _2206 ? 0 : (-1);
    uint _2210 = uint(int(uint(_2196) >> uint(2)));
    uint _2212 = uint(int(uint(int(_2210)) >> uint(2)));
    int _2214 = int(_2210) & 3;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[int(_2212)][_2214];
    int _2218 = int(_2210) + 1;
    uint _2220 = uint(int(uint(_2218) >> uint(2)));
    int _2222 = _2218 & 3;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[int(_2220)][_2222];
    bool _2226 = _1718 == 0;
    bool _2228 = _1718 == 0;
    int _2230 = _1844 ^ _1718;
    int _2232 = _2196 + 8;
    uint _2234 = uint(int(uint(_2232) >> uint(2)));
    uint _2236 = uint(int(uint(int(_2234)) >> uint(2)));
    int _2238 = int(_2234) & 3;
    float _2240 = (*spvDescriptorSet0.vp_c9)._m0[int(_2236)][_2238];
    bool _2242 = !_2226;
    int _2244 = _2242 ? _2200 : (-1);
    bool _2246 = _2144 > 0.0;
    uint _2248 = uint(int(uint(_2230) >> uint(31)));
    float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2250;
    bool _2254 = !_2192;
    int _2256 = _2254 ? 0 : (-1);
    int _2258 = _695 + 8;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    uint _2262 = uint(int(uint(int(_2260)) >> uint(2)));
    int _2264 = int(_2260) & 3;
    float _2266 = (*spvDescriptorSet0.vp_c9)._m0[int(_2262)][_2264];
    int _2268 = ~_2092;
    int _2270 = _2268 + _2204;
    int _2272 = _2270 + 1;
    float _2274 = _2252 * _2184;
    bool _2276 = _2144 >= 0.0;
    bool _2278 = isnan(_2144);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan(0.0);
    bool _2284 = _2280 || _2282;
    int _2286 = ~_2208;
    int _2288 = _2096 + _2286;
    int _2290 = _2288 + 1;
    int _2292 = _1744 * _2272;
    int _2294 = _2292 + _1864;
    int _2296 = ~int(_2248);
    int _2298 = _2296 + 1;
    int _2300 = _2284 ? 0 : 1;
    int _2302 = _2290 ^ _2298;
    bool _2304 = _1744 == 0;
    int _2306 = ~_2300;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = ~_2298;
    int _2314 = _2312 + _2302;
    int _2316 = _2314 + 1;
    float _2318 = _577 + _769;
    int _2320 = _2310;
    if (!_2246)
    {
        int _2322 = ~_2300;
        int _2324 = _2322 + 1;
        _2320 = _2324;
    }
    int _2326 = _2320;
    bool _2328 = !_2304;
    int _2330 = _2328 ? _2294 : (-1);
    float _2332 = _2318 + (-1.0);
    uint _2334 = uint(int(uint(_695) >> uint(2)));
    uint _2336 = uint(int(uint(int(_2334)) >> uint(2)));
    int _2338 = int(_2334) & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = int(_2334) + 1;
    uint _2344 = uint(int(uint(_2342) >> uint(2)));
    int _2346 = _2342 & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    bool _2350 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2352 = isnan(_725);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    bool _2362 = !_2228;
    int _2364 = _2362 ? _2316 : (-1);
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2368 = _2366 != 0;
    int _2370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2372 = _2370 != 0;
    int _2374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2376 = _2374 != 0;
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2380 = _725 + _2378;
    bool _2382 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2384 = isnan(_725);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = -_2360;
    float _2396 = _2394 + 1.0;
    bool _2398 = _1796 >= 0.0;
    bool _2400 = isnan(_1796);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan(0.0);
    bool _2406 = _2402 || _2404;
    float _2408 = fma(_2274, _2380, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2410 = _1796 > 0.0;
    float _2412 = _2392 * _2396;
    float _2414 = _2216 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2416 = _2406 ? 0 : 1;
    float _2418 = _2408 * _2412;
    bool _2420 = _1744 == 0;
    float _2422 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2424 = _1864 ^ _1744;
    float _2426 = _2224 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2428 = -_2392;
    float _2430 = _2428 + 1.0;
    float _2432 = _2240 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    uint _2434 = uint(int(uint(_2424) >> uint(31)));
    float _2436 = _2414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2440 = _2426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2442 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2444 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2418);
    int _2446 = ~int(_2434);
    int _2448 = _2446 + 1;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2452 = ~_2256;
    int _2454 = _2110 + _2452;
    int _2456 = _2454 + 1;
    float _2458 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2462 = _759 + _2460;
    out.m_64.x = _2436;
    out.m_64.y = _2440;
    out.m_64.z = _2442;
    out.m_64.w = _2438;
    int _2464 = _2456 ^ _2448;
    float _2466 = fma(_2360, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2444);
    float _2468 = -_2450;
    float _2470 = fma(_2458, 2.0, _2468);
    float _2472 = _1868 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2474 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2476 = _1870 + _2474;
    int _2478 = ~_2416;
    int _2480 = _2478 + 1;
    int _2482 = _2480 + 1;
    float _2484 = -_137;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2470);
    int _2488 = _2482;
    if (!_2410)
    {
        int _2490 = ~_2416;
        int _2492 = _2490 + 1;
        _2488 = _2492;
    }
    int _2494 = _2488;
    float _2496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2498 = ~_2448;
    int _2500 = _2498 + _2464;
    int _2502 = _2500 + 1;
    float _2504 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2506 = _2472 + _2504;
    float _2508 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2510 = _2340 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2512 = _2348 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2516 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2508);
    float _2518 = _2266 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2522 = _2512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2524 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2516);
    float _2526 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2528 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _2530 = !_2420;
    int _2532 = _2530 ? _2502 : (-1);
    float _2534 = _918 + 0.5;
    bool _2536 = _2524 >= 0.0;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    out.m_66.x = _2520;
    out.m_66.y = _2522;
    out.m_66.z = _2526;
    out.m_66.w = _2528;
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2542 = !_2372;
    int _2544 = _2542 ? 0 : 1;
    float _2546 = _2514 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2548 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2552 = fma(_2546, _2534, _2486);
    float _2554 = -_2538;
    float _2556 = fma(_2548, 2.0, _2554);
    float _2558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2560 = log2(_2558);
    float _2562 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2550);
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2566 = _2462 * _2462;
    int _2568 = abs(_2544);
    float _2570 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2572 = float(_2066);
    float _2574 = fma(_2476, _2476, _2566);
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2578 = _2190 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2580 = float(_2568);
    float _2582 = fma(_2506, _2506, _2574);
    float _2584 = fma(_2146, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2564);
    float _2586 = fma(_2578, -2.0, _2576);
    float _2588 = _2526;
    if (_2536)
    {
        _2588 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2590 = _2588;
    float _2592 = _2560 * _137;
    bool _2594 = !_2368;
    int _2596 = _2594 ? 0 : 1;
    float _2598 = rsqrt(_2582);
    float _2600 = _2580 * _2572;
    int _2602 = as_type<int>(_2590);
    if (_2536)
    {
        float _2604 = _2590 * 5.0;
        _2602 = as_type<int>(_2604);
    }
    int _2606 = _2602;
    int _2608 = abs(_2596);
    float _2610 = _2496 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2612 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2614 = exp2(_2592);
    if (_2536)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7570 = as_type<float>(_2606);
        out.gl_Position.z = _7570;
    }
    float _2616 = float(_2244);
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2620 = float(_2608);
    float _2622 = _924 + (-0.5);
    bool _2624 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2626 = isnan(0.0);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2632 = _2628 || _2630;
    float _2634 = fma(_2570, -2.0, _2618);
    float _2636 = _2462 * _2598;
    float _2638 = _2476 * _2598;
    float _2640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2642 = _769 > 0.5;
    float _2644 = -_2636;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2462);
    float _2648 = -_2638;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2476);
    float _2652 = -_137;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2030);
    float _2656 = float(_2494);
    float _2658 = _2646 * _2646;
    float _2660 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2586);
    float _2662 = fma(_2610, _2616, _2654);
    float _2664 = fma(_2650, _2650, _2658);
    float _2666 = _2620 * _2656;
    float _2668 = -_2614;
    float _2670 = _2668 + 1.0;
    float _2672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2676 = 1.0 + _2674;
    float _2678 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2680 = -_2612;
    float _2682 = -_2660;
    float _2684 = fma(_2680, _2622, _2682);
    float _2686 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2076);
    float _2688 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2678);
    float _2690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2692 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2688);
    float _2694 = _2632 ? _2670 : 0.0;
    float _2696 = _1964 + 0.5;
    bool _2698 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2700 = isnan(1.0);
    bool _2702 = _2698 || _2700;
    bool _2704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2706 = _2702 || _2704;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2710 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2712 = 1.0 / _2676;
    float _2714 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2716 = float(_2330);
    float _2718 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2720 = -_137;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2556);
    float _2724 = fma(_2610, _2696, _2662);
    float _2726 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2708);
    float _2728 = _2672 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2730 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2710);
    float _2732 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2714);
    float _2734 = -_349;
    int _2736 = _2642 ? as_type<int>(_2734) : as_type<int>(_349);
    float _2738 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2634);
    float _2740 = fma(_2718, _2716, _2722);
    float _2742 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2726);
    float _2744 = _2690 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2746 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2730);
    float _2748 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2732);
    float _2750 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2562);
    float _2752 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2584);
    bool _2754 = _791 > 0.5;
    if (_2706)
    {
        float _2756 = _2694 * _2712;
        _139 = _2756;
    }
    float _2758 = _139;
    float _2760 = float(_2364);
    float _2762 = -_2746;
    float _2764 = _2762 + 1.0;
    bool _2766 = !_1712;
    float _2768 = _2766 ? _349 : as_type<float>(_2736);
    float _2770 = -_2748;
    float _2772 = _2770 + 1.0;
    float _2774 = in.m_68.x;
    float _2776 = in.m_68.y;
    float _2778 = in.m_68.z;
    float _2780 = -_285;
    int _2782 = _2754 ? as_type<int>(_2780) : as_type<int>(_285);
    float _2784 = -_2686;
    float _2786 = fma(_2744, _2760, _2784);
    float _2788 = float(_2532);
    float _2790 = _2768 + (-0.5);
    bool _2792 = !_1696;
    float _2794 = _2792 ? _285 : as_type<float>(_2782);
    float _2796 = -_2764;
    float _2798 = fma(_918, _2796, _2552);
    float _2800 = -_2750;
    float _2802 = _2800 + 1.0;
    float _2804 = -_2738;
    float _2806 = fma(_2728, _2788, _2804);
    float _2808 = _1022 + (-0.5);
    float _2810 = _2794 + 0.5;
    float _2812 = -_2744;
    float _2814 = fma(_2812, _2790, _2786);
    float _2816 = -_2692;
    float _2818 = _2816 + 1.0;
    float _2820 = -_2728;
    float _2822 = fma(_2820, _2808, _2806);
    float _2824 = fma(_2718, _2810, _2740);
    float _2826 = -_2742;
    float _2828 = _2826 + 1.0;
    float _2830 = -_2752;
    float _2832 = _2830 + 1.0;
    float _2834 = _2666 * (-2.0);
    float _2836 = fma(_924, _2772, _2684);
    float _2838 = -_2828;
    float _2840 = fma(_1964, _2838, _2724);
    float _2842 = -_2802;
    float _2844 = fma(_2794, _2842, _2824);
    float _2846 = fma(_2768, _2818, _2814);
    float _2848 = _2506 * _2598;
    float _2850 = fma(_1022, _2832, _2822);
    float _2852 = _577 + (-0.5);
    float _2854 = fma(_2834, _2774, _2774);
    float _2856 = -_2848;
    float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2506);
    out.m_70.x = _2798;
    out.m_70.y = _2836;
    float _2860 = fma(_2422, _2834, _2422);
    float _2862 = fma(_2852, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2854);
    float _2864 = fma(_2858, _2858, _2664);
    out.m_72.x = _2840;
    out.m_72.y = _2846;
    out.m_72.z = _2844;
    out.m_72.w = _2850;
    float _2866 = _791 + _769;
    bool _2868 = !_2376;
    int _2870 = _2868 ? 0 : 1;
    float _2872 = _2778;
    float _2874 = _2848;
    if (_2536)
    {
        out.m_45.x = 0.0;
    }
    if (_2536)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2876 = -_2636;
    float _2878 = fma(_2876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _2880 = -_2638;
    float _2882 = fma(_2880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1870);
    int _2884 = abs(_2870);
    float _2886 = -_2848;
    float _2888 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2472);
    float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2892 = _2878 + _2890;
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2896 = _2882 + _2894;
    float _2898 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2900 = _2888 + _2898;
    float _2902 = _2892 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2904 = fma(_2860, _2758, _2862);
    float _2906 = _2866 + (-1.0);
    float _2908 = _2600 * (-2.0);
    float _2910 = fma(_2896, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2902);
    float _2912 = _2904 * 0.15915493667125701904296875;
    float _2914 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2916 = _769 + (-0.5);
    float _2918 = fma(_2900, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2910);
    float _2920 = fma(_2908, _2776, _2776);
    float _2922 = float(_2326);
    float _2924 = _577 + _791;
    float _2926 = float(_2884);
    float _2928 = fma(_2914, _2908, _2914);
    bool _2930 = _2918 >= 0.0;
    float _2932 = fma(_2916, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2920);
    float _2934 = _2926 * _2922;
    float _2936 = _2924 + (-1.0);
    float _2938 = fma(_2928, _2758, _2932);
    float _2940 = sqrt(_2864);
    float _2942 = _2934 * (-2.0);
    float _2944 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2946 = _2938 * 0.15915493667125701904296875;
    float _2948 = _791 + (-0.5);
    float _2950 = fma(_2942, _2778, _2778);
    float _2952 = fma(_2944, _2942, _2944);
    if (_2930)
    {
        _2872 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2954 = _2872;
    float _2956 = _2912 * 6.283185482025146484375;
    float _2958 = sin(_2956);
    float _2960 = fma(_2948, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2950);
    int _2962 = as_type<int>(_2954);
    if (_2930)
    {
        out.m_45.x = 0.0;
    }
    if (_2930)
    {
        float _2964 = _2954 * 5.0;
        _2962 = as_type<int>(_2964);
    }
    int _2966 = _2962;
    float _2968 = fma(_2952, _2758, _2960);
    float _2970 = _2912 * 6.283185482025146484375;
    float _2972 = cos(_2970);
    if (_2930)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8176 = as_type<float>(_2966);
        out.gl_Position.z = _8176;
    }
    float _2974 = _2968 * 0.15915493667125701904296875;
    float _2976 = _2946 * 6.283185482025146484375;
    float _2978 = sin(_2976);
    float _2980 = _2946 * 6.283185482025146484375;
    float _2982 = cos(_2980);
    if (_2930)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2984 = _2974 * 6.283185482025146484375;
    float _2986 = cos(_2984);
    float _2988 = _2598 * _2940;
    float _2990 = _691 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _349);
    float _2994 = _2958 * _2978;
    float _2996 = _2972 * _2982;
    float _2998 = _2988 * _2990;
    float _3000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _285);
    float _3002 = _2974 * 6.283185482025146484375;
    float _3004 = sin(_3002);
    float _3006 = _2972 * _2978;
    float _3008 = _2992 * _2998;
    float _3010 = _689 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3012 = _2958 * _2982;
    float _3014 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3016 = _2988 * _3010;
    float _3018 = _2972 * _2986;
    float _3020 = _2978 * _2986;
    float _3022 = _2982 * _2986;
    float _3024 = _3000 * _3016;
    float _3026 = _3018 * _3008;
    float _3028 = _2958 * _2986;
    float _3030 = _2988 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3032 = _3030 * 0.5;
    float _3034 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3014);
    float _3036 = fma(_3004, _2996, _2994);
    float _3038 = -_3008;
    float _3040 = _3004 * _3038;
    float _3042 = -_3012;
    float _3044 = fma(_3004, _3006, _3042);
    float _3046 = -_3006;
    float _3048 = fma(_3004, _3012, _3046);
    float _3050 = fma(_3036, _3024, _3026);
    float _3052 = fma(_3022, _3024, _3040);
    float _3054 = _3028 * _3008;
    float _3056 = fma(_3004, _2994, _2996);
    float _3058 = fma(_3044, _3032, _3050);
    float _3060 = fma(_3020, _3032, _3052);
    float _3062 = fma(_3048, _3024, _3054);
    float _3064 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3034);
    float _3066 = _3058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3068 = _3058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3070 = fma(_3056, _3032, _3062);
    float _3072 = _3064 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3074 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3066);
    float _3076 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3068);
    float _3078 = _3058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3080 = 1.0 / _3072;
    float _3082 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3074);
    float _3084 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3076);
    float _3086 = fma(_3060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3078);
    bool _3088 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3090 = isnan(0.5);
    bool _3092 = _3088 || _3090;
    bool _3094 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3096 = _3092 || _3094;
    float _3098 = _3082 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3100 = _3084 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3102 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3086);
    bool _3104 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3106 = isnan(0.5);
    bool _3108 = _3104 || _3106;
    bool _3110 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3112 = _3108 || _3110;
    float _3114 = _2472 + _3098;
    float _3116 = _1870 + _3100;
    float _3118 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3120 = _3102 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3124 = _3114 + _3122;
    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3128 = _3116 + _3126;
    float _3130 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3118);
    float _3132 = _759 + _3120;
    float _3134 = _3124 * _3124;
    float _3136 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3130);
    float _3138 = fma(_3128, _3128, _3134);
    float _3140 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3142 = sqrt(_3138);
    float _3144 = _3140 + _3072;
    float _3146 = _3144 * _3080;
    float _3148 = _3146 * 0.5;
    float _3150 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3152 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3150);
    bool _3154 = _3142 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3156 = 1.0 / _3152;
    float _3158 = _3072;
    float _3160 = _3064;
    float _3162 = _3116;
    float _3164 = _3120;
    if (!_3154)
    {
        _3158 = _3114;
    }
    float _3166 = _3158;
    float _3168 = _3166;
    if (!_3154)
    {
        _3160 = _3132;
    }
    float _3170 = _3160;
    bool _3172 = !_3154;
    float _3174 = _3170;
    float _3176 = _3156;
    if (!_3172)
    {
        float _3178 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3180 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3182 = _3142 + _3180;
        float _3184 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3186 = _3182 * _3178;
        float _3188 = rsqrt(_3138);
        float _3190 = _3186 * 0.15915493667125701904296875;
        float _3192 = _3190 * 6.283185482025146484375;
        float _3194 = cos(_3192);
        float _3196 = _3190 * 6.283185482025146484375;
        float _3198 = sin(_3196);
        float _3200 = _3194 + (-1.0);
        float _3202 = _3200 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3204 = fma(_3198, _3184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3206 = fma(_3132, _3194, _3202);
        float _3208 = _3188 * _3204;
        float _3210 = fma(_3128, _3208, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3212 = fma(_3124, _3208, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3162 = _3210;
        _3174 = _3206;
        _3168 = _3212;
        _3164 = _3184;
    }
    float _3214 = _3162;
    float _3216 = _3174;
    float _3218 = _3168;
    float _3220 = _3164;
    float _3222 = -_2638;
    float _3224 = fma(_3222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3214);
    float _3226 = -_2636;
    float _3228 = fma(_3226, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3216);
    float _3230 = -_2848;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3218);
    float _3234 = _3220;
    float _3236 = _3228;
    float _3238 = _3224;
    float _3240 = _3232;
    if (_3112)
    {
        _3234 = 1.0;
    }
    float _3242 = _3234;
    float _3244 = _3242;
    if (!_3096)
    {
        float _3246 = _2892 * _2892;
        float _3248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3250 = -_2472;
        float _3252 = _3250 + _3218;
        float _3254 = fma(_2896, _2896, _3246);
        float _3256 = fma(_2900, _2900, _3254);
        float _3258 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3260 = sqrt(_3256);
        float _3262 = 1.0 / _2988;
        float _3264 = _3258 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3266 = precise::min(_3260, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3268 = _3266 * _3248;
        float _3270 = _3268 * _3262;
        float _3272 = -_1870;
        float _3274 = _3272 + _3214;
        float _3276 = -_759;
        float _3278 = _3276 + _3216;
        float _3280 = _3264 * _3270;
        float _3282 = _3252 * _3270;
        float _3284 = fma(_3274, _3280, _2882);
        float _3286 = fma(_3278, _3280, _2878);
        float _3288 = fma(_3264, _3282, _2888);
        _3236 = _3286;
        _3238 = _3284;
        _3240 = _3288;
    }
    float _3290 = _3236;
    float _3292 = _3238;
    float _3294 = _3240;
    if (_3112)
    {
        _1942 = 1.0;
    }
    float _3296 = _1942;
    float _3298 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3300 = _3156 * _3298;
    float _3302 = _3296;
    if (!_3112)
    {
        float _3304 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3306 = _3304 * 0.15915493667125701904296875;
        float _3308 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3310 = _3306 * 6.283185482025146484375;
        float _3312 = cos(_3310);
        float _3314 = _3308 * 0.15915493667125701904296875;
        float _3316 = _3306 * 6.283185482025146484375;
        float _3318 = sin(_3316);
        float _3320 = 1.0 / _3312;
        float _3322 = _3314 * 6.283185482025146484375;
        float _3324 = cos(_3322);
        float _3326 = _3318 * _3320;
        float _3328 = _3314 * 6.283185482025146484375;
        float _3330 = sin(_3328);
        float _3332 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3334 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3332;
        float _3336 = _3324 * _3326;
        float _3338 = 1.0 / _3334;
        float _3340 = 1.0 / _3336;
        float _3342 = _3330 * _3340;
        float _3344 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3346 = fma(_3300, _3342, _3344);
        float _3348 = _3346 * _3338;
        float _3350 = precise::clamp(_3348, 0.0, 1.0);
        _3176 = _3314;
        _3244 = _3350;
    }
    float _3352 = _3176;
    float _3354 = _3244;
    float _3356 = _3352;
    if (!_3112)
    {
        float _3358 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3360 = _3358 * 0.15915493667125701904296875;
        float _3362 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3364 = _3360 * 6.283185482025146484375;
        float _3366 = cos(_3364);
        float _3368 = _3362 * 0.15915493667125701904296875;
        float _3370 = _3360 * 6.283185482025146484375;
        float _3372 = sin(_3370);
        float _3374 = 1.0 / _3366;
        float _3376 = _3368 * 6.283185482025146484375;
        float _3378 = cos(_3376);
        float _3380 = _3372 * _3374;
        float _3382 = _3368 * 6.283185482025146484375;
        float _3384 = sin(_3382);
        float _3386 = _3378 * _3380;
        float _3388 = 1.0 / _3386;
        float _3390 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3392 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3390;
        float _3394 = 1.0 / _3392;
        float _3396 = _3384 * _3388;
        float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3400 = fma(_3300, _3396, _3398);
        float _3402 = _3400 * _3394;
        float _3404 = precise::clamp(_3402, 0.0, 1.0);
        float _3406 = -_3404;
        float _3408 = _3406 + 1.0;
        _3356 = _3366;
        _3302 = _3408;
    }
    float _3410 = _3356;
    float _3412 = _3302;
    float _3414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3416 = _3290 + _3414;
    float _3418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3420 = _3292 + _3418;
    float _3422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3424 = _3294 + _3422;
    float _3426 = _3416 * _3416;
    float _3428 = fma(_3420, _3420, _3426);
    float _3430 = fma(_3424, _3424, _3428);
    float _3432 = rsqrt(_3430);
    float _3434 = sqrt(_3430);
    float _3436 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3438 = _3420 * _3436;
    float _3440 = _3424 * _3436;
    float _3442 = _3438 * _3438;
    float _3444 = _3440 * _3440;
    float _3446 = _3442 + _3444;
    float _3448 = sqrt(_3446);
    bool _3450 = _3448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3454 = _3448 + _3452;
    float _3456 = _3424;
    float _3458 = _3446;
    float _3460 = _3454;
    float _3462 = _3410;
    if (_3450)
    {
        float _3464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3456 = _3464;
    }
    float _3466 = _3456;
    if (_3450)
    {
        float _3468 = rsqrt(_3446);
        _3458 = _3468;
    }
    float _3470 = _3458;
    float _3472 = _3470;
    if (_3450)
    {
        float _3474 = _3454 * _3466;
        _3460 = _3474;
    }
    float _3476 = _3460;
    if (_3450)
    {
        float _3478 = _3476 * 0.15915493667125701904296875;
        _3462 = _3478;
    }
    float _3480 = _3462;
    float _3482 = _3466;
    float _3484 = _3480;
    if (_3450)
    {
        float _3486 = _3480 * 6.283185482025146484375;
        float _3488 = sin(_3486);
        _3482 = _3488;
    }
    float _3490 = _3482;
    float _3492 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3494 = precise::max(0.0, _3492);
    float _3496 = _3432;
    float _3498 = _3494;
    if (_3450)
    {
        float _3500 = _3480 * 6.283185482025146484375;
        float _3502 = cos(_3500);
        _3496 = _3502;
    }
    float _3504 = _3496;
    float _3506 = -_3436;
    float _3508 = -_3494;
    float _3510 = fma(_3416, _3506, _3508);
    float _3512 = _3510;
    if (_3450)
    {
        float _3514 = _3510 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3498 = _3514;
    }
    float _3516 = _3498;
    float _3518 = _3490;
    float _3520 = _3516;
    if (_3450)
    {
        float _3522 = fma(_3490, _3516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3518 = _3522;
    }
    float _3524 = _3518;
    float _3526 = _3524;
    float _3528 = _3504;
    if (_3450)
    {
        float _3530 = _3504 + (-1.0);
        _3520 = _3530;
    }
    float _3532 = _3520;
    float _3534 = _3532;
    if (_3450)
    {
        float _3536 = _3470 * _3524;
        _2874 = _3536;
    }
    float _3538 = _2874;
    if (!_3450)
    {
        _3526 = _3438;
    }
    float _3540 = _3526;
    float _3542 = _3540;
    if (_3450)
    {
        float _3544 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3484 = _3544;
    }
    float _3546 = _3484;
    if (_3450)
    {
        float _3548 = _3438 * _3538;
        _3542 = _3548;
    }
    float _3550 = _3542;
    if (!_3450)
    {
        _3534 = _3440;
    }
    float _3552 = _3534;
    float _3554 = _3552;
    if (_3450)
    {
        float _3556 = _3440 * _3538;
        _3554 = _3556;
    }
    float _3558 = _3554;
    if (!_3450)
    {
        _3472 = _3442;
    }
    float _3560 = _3472;
    float _3562 = _3560;
    if (_3450)
    {
        float _3564 = fma(_3510, _3504, _3546);
        _3512 = _3564;
    }
    float _3566 = _3512;
    if (_3450)
    {
        float _3568 = _3550 * _3550;
        _3562 = _3568;
    }
    float _3570 = _3562;
    if (!_3450)
    {
        _3528 = _3444;
    }
    float _3572 = _3528;
    float _3574 = _3572;
    if (_3450)
    {
        float _3576 = _3558 * _3558;
        _3574 = _3576;
    }
    float _3578 = _3574;
    float _3580 = fma(_3566, _3566, _3570);
    float _3582 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3584 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3586 = _3580 + _3578;
    float _3588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3590 = fma(_3434, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3588);
    float _3592 = precise::clamp(_3590, 0.0, 1.0);
    float _3594 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3582);
    float _3596 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3598 = rsqrt(_3586);
    float _3600 = -_3592;
    float _3602 = _3600 + 1.0;
    float _3604 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3594);
    float _3606 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3608 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3596);
    float _3610 = _3290 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3612 = _3604 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3614 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3606);
    float _3616 = abs(_3602);
    float _3618 = log2(_3616);
    float _3620 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3608);
    float _3622 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3624 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3614);
    float _3626 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3610);
    float _3628 = _3620 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3630 = -_3622;
    float _3632 = fma(_3630, _3584, 1.0);
    float _3634 = _3624 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3636 = _3598 * _3550;
    float _3638 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3640 = _3598 * _3566;
    float _3642 = fma(_3294, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3626);
    float _3644 = _3636 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3646 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3638);
    float _3648 = _3598 * _3558;
    float _3650 = _3642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3652 = -_3644;
    float _3654 = fma(_3640, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3652);
    float _3656 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3658 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3646);
    float _3660 = log2(_3632);
    float _3662 = -_3648;
    float _3664 = fma(_3662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3654);
    float _3666 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3668 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3658);
    float _3670 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3672 = fma(_3664, -0.5, 0.5);
    float _3674 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3666);
    float _3676 = fma(_3664, 0.5, 0.5);
    float _3678 = exp2(_3656);
    float _3680 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3670);
    float _3682 = _3640 + 1.0;
    float _3684 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3674);
    float _3686 = fma(_3676, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3688 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3680);
    float _3690 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3684);
    float _3692 = 1.0 / _3668;
    float _3694 = fma(_3676, _3686, -0.212114393711090087890625);
    float _3696 = _3660 * 0.693147182464599609375;
    float _3698 = fma(_3676, _3694, 1.570728778839111328125);
    float _3700 = _3696 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3702 = sqrt(_3672);
    float _3704 = -_3640;
    float _3706 = fma(_3678, _3682, _3704);
    float _3708 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3688);
    float _3710 = _3690 * _3692;
    float _3712 = _3708 * _3692;
    float _3714 = fma(_3710, 0.5, 0.5);
    float _3716 = fma(_3712, -0.5, 0.5);
    float _3718 = _3702 * 0.636619746685028076171875;
    float _3720 = fma(_3706, 0.5, 0.5);
    float _3722 = -_3698;
    float _3724 = fma(_3718, _3722, 1.0);
    float3 _9360 = float3(_3714, _3716, _3700);
    float _3726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9360, float3(0.0), isnan(_9360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9360, float3(0.0), isnan(_9360)), level(0.0)).x;
    float3 _9371 = float3(_3714, _3716, _3700);
    float4 _3729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9371, float3(0.0), isnan(_9371)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9371, float3(0.0), isnan(_9371)), level(0.0)).xyzw;
    float _3731 = _3729.x;
    float _3733 = _3729.y;
    float _3735 = _3729.z;
    float _3737 = _3729.w;
    float2 _9388 = float2(_3724, _3720);
    float3 _3741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9388, float2(0.0), isnan(_9388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9388, float2(0.0), isnan(_9388)), level(0.0)).xyz;
    float _3743 = _3741.x;
    float _3745 = _3741.y;
    float _3747 = _3741.z;
    float _3749 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3751 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3753 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3755 = _349 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3757 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3749);
    float _3759 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3751);
    float _3761 = fma(_3022, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3753);
    float _3763 = fma(_3755, _3755, 1.0);
    float _3765 = _3018 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3767 = _3018 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3769 = _3018 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3771 = _3044 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3773 = _3044 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3775 = rsqrt(_3763);
    float _3777 = -_3004;
    float _3779 = fma(_3777, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3765);
    float _3781 = -_3004;
    float _3783 = fma(_3781, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3767);
    float _3785 = -_3004;
    float _3787 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3769);
    float _3789 = _3044 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3791 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3771);
    float _3793 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3773);
    float _3795 = _3628 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3797 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3779);
    float _3799 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3783);
    float _3801 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3787);
    float _3803 = fma(_3020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3789);
    float _3805 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3791);
    float _3807 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3793);
    float _3809 = fma(_3634, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3795);
    float _3811 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3757);
    float _3813 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3759);
    float _3815 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3761);
    float _3817 = _285 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3819 = _3755 * _3797;
    float _3821 = _3755 * _3799;
    float _3823 = _3755 * _3801;
    float _3825 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3803);
    float _3827 = _3755 * _3775;
    float _3829 = fma(_3817, _3811, _3819);
    float _3831 = fma(_3817, _3813, _3821);
    float _3833 = fma(_3817, _3815, _3823);
    float _3835 = -_3807;
    float _3837 = _3827 * _3835;
    float _3839 = -_3825;
    float _3841 = _3827 * _3839;
    float _3843 = -_3805;
    float _3845 = _3827 * _3843;
    float _3847 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3849 = fma(_3612, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3809);
    float _3851 = fma(_3775, _3799, _3841);
    float _3853 = _3354 * _3412;
    bool _3855 = _3354 > 0.0;
    bool _3857 = isnan(_3354);
    bool _3859 = _3855 || _3857;
    bool _3861 = isnan(0.0);
    bool _3863 = _3859 || _3861;
    float _3865 = fma(_3775, _3797, _3837);
    float _3867 = exp2(_3847);
    float _3869 = _3853 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3871 = fma(_3650, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3849);
    bool _3873 = _3412 <= 0.0;
    bool _3875 = !_3863;
    bool _3877 = _3873 || _3875;
    float _3879 = fma(_3775, _3801, _3845);
    out.m_74.x = _3811;
    out.m_74.y = _3813;
    out.m_74.z = _3815;
    float _3881 = _3871 + _3668;
    float _3883 = _3690 + _3668;
    float _3885 = _3668 * 0.5;
    out.m_76.x = _3292;
    out.m_76.y = _3290;
    out.m_76.z = _3294;
    float _3887 = _3807 + _3829;
    float _3889 = _3825 + _3831;
    float _3891 = _3805 + _3833;
    float _3893 = _3869 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3895 = _3881 * 0.5;
    float _3897 = -_3867;
    float _3899 = _3897 + 1.0;
    float _3901 = _3883 * 0.5;
    float _3903 = fma(_3708, -0.5, _3885);
    out.m_78.x = _3865;
    out.m_78.y = _3851;
    out.m_78.z = _3879;
    float _3905 = _3899 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3887;
    out.m_80.y = _3889;
    out.m_80.z = _3891;
    float _3907 = -_3905;
    float _3909 = _3907 + 1.0;
    out.m_45.x = _3893;
    out.gl_Position.x = _3690;
    out.gl_Position.y = _3708;
    out.gl_Position.z = _3871;
    out.gl_Position.w = _3668;
    out.m_82.x = _3901;
    out.m_82.y = _3903;
    out.m_82.z = _3895;
    out.m_82.w = _3668;
    float _3911 = _3905 * _3726;
    float _3913 = _3737 * _3909;
    float _3915 = _3737 * _3911;
    float _3917 = _3747 * _3911;
    float _3919 = fma(_3743, _3915, _3731);
    float _3921 = fma(_3745, _3915, _3733);
    float _3923 = fma(_3737, _3917, _3735);
    out.m_84.x = _3919;
    out.m_84.y = _3921;
    out.m_84.z = _3923;
    out.m_84.w = _3913;
    if (!_3877)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3925 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3925;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

