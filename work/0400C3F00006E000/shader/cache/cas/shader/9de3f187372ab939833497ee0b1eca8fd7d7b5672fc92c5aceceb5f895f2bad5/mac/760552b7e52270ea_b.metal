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
    float4 m_58 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_66 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2392 = false;
    bool _601 = false;
    bool _433 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2681 = as_type<float>(_121);
        out.gl_Position.z = _2681;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_135)
    {
        float _141 = float(_105);
        _115 = _141;
    }
    float _143 = _115;
    bool _145 = _139 >= _143;
    bool _147 = !_135;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2750 = as_type<float>(_157);
        out.gl_Position.z = _2750;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    float _187 = 0.0;
    float _189 = _161;
    if (!_173)
    {
        float _191 = _161 * _161;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    int _203 = as_type<int>(_159) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_159) & 2;
    bool _209 = _207 != 0;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_173;
    float _221 = _201;
    bool _223 = false;
    bool _225 = _173;
    if (!_219)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _161 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _161);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _255;
    }
    float _257 = _221;
    bool _259 = !_173;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _161 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _189 = _279;
    }
    float _281 = _189;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _285 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _291 = fma(_281, _175, _285);
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_291, _163, _181);
    float _299 = fma(_293, _163, _183);
    float _301 = fma(_295, _163, _185);
    bool _303 = !_283;
    float _321;
    if (!_303)
    {
        float _305 = in.m_56.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = in.m_54.x;
    float _339 = in.m_54.y;
    bool _341 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _343 = isnan(_331);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _353;
    bool _357 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _359 = isnan(_331);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = 1.0 / _355;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _381 = _367 * _371;
    float _383 = -_367;
    float _385 = _383 + 1.0;
    float _387 = _335 * _377;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _389;
    float _393 = fma(_375, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _393 * _381;
    float _399 = _395 * _381;
    float _401 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _403 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].x, _401);
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].y, _403);
    float _409 = _405 * _337;
    float _411 = _407 * _339;
    bool _413 = !_379;
    float _431;
    if (!_413)
    {
        float _415 = in.m_56.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_105);
        float _437 = 1.0 / _435;
        float _439 = _139 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _445 = _441 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _451 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = isnan(_441);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _471 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _473 = isnan(_441);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _449;
    float _485 = -_461;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _489;
    bool _493 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _495 = isnan(_441);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = _481 * _487;
    float _507 = -_481;
    float _509 = _507 + 1.0;
    bool _511 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _513 = 1.0 / _465;
    float _515 = _503 * _509;
    float _517 = -_503;
    float _519 = _517 + 1.0;
    float _521 = 1.0 / _469;
    float _523 = _491 * _483;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _529 = fma(_523, _445, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = _527 * _513;
    bool _533 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _535 = isnan(_441);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = _441 + _549;
    float _553 = _529 * _515;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _557 = _441 + _555;
    float _559 = -_543;
    float _561 = _559 + 1.0;
    float _563 = fma(_531, _551, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _565 = _547 * _521;
    float _567 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[115].x, _553);
    float _569 = _461 * _561;
    float _571 = fma(_565, _557, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _573 = fma(_563, _505, _567);
    float _575 = fma(_571, _569, _573);
    float _577 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[118].x, _575);
    float _579 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.w = _579;
    bool _581 = !_511;
    float _599;
    if (!_581)
    {
        float _583 = in.m_56.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_105);
        float _605 = 1.0 / _603;
        float _607 = _139 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = in.m_56.w;
    float _613 = in.m_60.x;
    float _615 = in.m_60.y;
    float _617 = in.m_60.z;
    float _619 = in.m_60.w;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _627 = _625 != 0;
    float _629 = in.m_62.x;
    float _631 = in.m_62.y;
    float _633 = in.m_62.z;
    float _635 = in.m_62.w;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _641 = in.m_64.x;
    float _643 = in.m_64.y;
    float _645 = in.m_64.z;
    float _647 = in.m_64.w;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _653 = 1.0 / _639;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _657 = _655 != 0;
    float _659 = 0.0;
    float _661 = _609;
    if (_623)
    {
        float _663 = in.m_56.x;
        _659 = _663;
    }
    float _665 = _659;
    float _667 = 0.0;
    if (_627)
    {
        float _669 = in.m_56.w;
        _667 = _669;
    }
    float _671 = _667;
    bool _673 = _611 > 0.5;
    float _675 = 1.0 / _651;
    bool _677 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _679 = isnan(_609);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = _299 * _615;
    float _691 = _299 * _631;
    float _693 = fma(_297, _613, _689);
    float _695 = fma(_297, _629, _691);
    float _697 = _299 * _643;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _699;
    float _703 = fma(_301, _633, _695);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _709 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _711 = isnan(_609);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = fma(_297, _641, _697);
    float _723 = fma(_301, _617, _693);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _729 = _701 * _653;
    float _731 = _707 * _675;
    float _733 = fma(_301, _645, _721);
    bool _735 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _737 = isnan(_609);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _707;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _751 = _653;
    float _753 = _675;
    int _755 = as_type<int>(_635);
    float _757 = _647;
    float _759 = _731;
    if (_623)
    {
        float _761 = _665 * 3.1415927410125732421875;
        _747 = _761;
    }
    float _763 = _747;
    float _765 = -_719;
    float _767 = _765 + 1.0;
    float _769 = 1.0 / _727;
    if (_627)
    {
        float _771 = _671 * 3.1415927410125732421875;
        _749 = _771;
    }
    float _773 = _749;
    if (_623)
    {
        float _775 = _763 * 0.15915493667125701904296875;
        _751 = _775;
    }
    float _777 = _751;
    float _779 = _745 * _767;
    float _781 = _767;
    float _783 = _763;
    if (_657)
    {
        float _785 = in.m_56.x;
        float _787 = in.m_56.y;
        _781 = _785;
        _783 = _787;
    }
    float _789 = _781;
    float _791 = _783;
    if (_627)
    {
        float _793 = _773 * 0.15915493667125701904296875;
        _753 = _793;
    }
    float _795 = _753;
    bool _797 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _799 = isnan(_609);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = _777;
    if (_623)
    {
        float _811 = _777 * 6.283185482025146484375;
        float _813 = sin(_811);
        _809 = _813;
    }
    float _815 = _809;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _817;
    float _821 = -_745;
    float _823 = _821 + 1.0;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _827 = _609 + _825;
    float _829 = -_807;
    float _831 = _829 + 1.0;
    float _833 = _723 + _619;
    float _835 = _807 * _823;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _839 = _609 + _837;
    float _841 = _795;
    if (_627)
    {
        float _843 = _795 * 6.283185482025146484375;
        float _845 = sin(_843);
        _841 = _845;
    }
    float _847 = _841;
    float _849 = _819 * _769;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _853 = _609 + _851;
    float _855 = _687 * _831;
    float _857 = -_687;
    float _859 = _857 + 1.0;
    float _861 = fma(_731, _839, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _863 = fma(_729, _853, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _865 = _733 + _647;
    float _867 = _703 + _635;
    float _869 = fma(_849, _827, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _871 = _863 * _855;
    float _873 = _853;
    float _875 = _867;
    if (_623)
    {
        bool _877 = _815 > 0.5;
        _223 = _877;
    }
    bool _879 = _223;
    if (_657)
    {
        _755 = 0;
    }
    int _881 = _755;
    float _883 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[131].x, _871);
    float _885 = _789;
    float _887 = _791;
    int _889 = _881;
    if (_657)
    {
        _661 = _789;
    }
    float _891 = _661;
    float _893 = _891;
    if (_627)
    {
        bool _895 = _847 > 0.5;
        _225 = _895;
    }
    bool _897 = _225;
    if (_657)
    {
        _757 = _791;
    }
    float _899 = _757;
    float _901 = _899;
    if (!_657)
    {
        float _903 = in.m_56.x;
        float _905 = in.m_56.y;
        float _907 = _903 * 3.1415927410125732421875;
        float _909 = _907 * 0.15915493667125701904296875;
        float _911 = _905 * 3.1415927410125732421875;
        float _913 = _911 * 0.15915493667125701904296875;
        float _915 = _909 * 6.283185482025146484375;
        float _917 = sin(_915);
        float _919 = _913 * 6.283185482025146484375;
        float _921 = sin(_919);
        _885 = _903;
        _887 = _905;
        _889 = 1;
        _893 = _917;
        _901 = _921;
    }
    float _923 = _885;
    float _925 = _887;
    int _927 = _889;
    float _929 = _893;
    float _931 = _901;
    float _933 = in.m_56.z;
    if (!_627)
    {
        _759 = _213;
    }
    float _935 = _759;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _939 = _935;
    if (_627)
    {
        float _941 = -_213;
        float _943 = _897 ? _941 : _213;
        _939 = _943;
    }
    float _945 = _939;
    float _947 = _923 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _949 = _923 > 0.5;
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _953 = _925 > 0.5;
    float _955 = -_937;
    float _957 = fma(_947, 2.0, _955);
    if (!_623)
    {
        _873 = _217;
    }
    float _959 = _873;
    float _961 = fma(_861, _835, _883);
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _965 = _963 != 0;
    float _967 = -_139;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[76].x, _957);
    float _971 = _959;
    if (_623)
    {
        float _973 = -_217;
        float _975 = _879 ? _973 : _217;
        _971 = _975;
    }
    float _977 = _971;
    float _979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _981 = -_213;
    int _983 = _949 ? as_type<int>(_981) : as_type<int>(_213);
    float _985 = fma(_869, _779, _961);
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _989 = _987 != 0;
    float _991 = -_217;
    int _993 = _953 ? as_type<int>(_991) : as_type<int>(_217);
    float _995 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[134].x, _985);
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _999 = _927 != 1;
    int _1001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1003 = _1001 != 0;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1009 = _1007 != 0;
    float _1011 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1005);
    bool _1013 = !_965;
    float _1015 = _1013 ? _213 : as_type<float>(_983);
    float _1017 = _925 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1019 = !_989;
    float _1021 = _1019 ? _217 : as_type<float>(_993);
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1033 = _1031 != 0;
    float _1035 = _929 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1041 = _931 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1043 = -_1023;
    float _1045 = fma(_1035, 2.0, _1043);
    float _1047 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1037);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1051 = fma(_1041, -2.0, _1039);
    float _1053 = _951 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1055 = -_139;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1045);
    float _1059 = _945 + 0.5;
    float _1061 = fma(_1017, -2.0, _1049);
    float _1063 = _1035;
    float _1065 = _1017;
    float _1067 = _951;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_999)
    {
        _1063 = _933;
    }
    float _1071 = _1063;
    float _1073 = fma(_1053, _1059, _1057);
    float _1075 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1051);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1079 = _1071;
    float _1081 = _1077;
    if (!_999)
    {
        _1065 = _1071;
    }
    float _1083 = _1065;
    float _1085 = _979 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1087 = _979;
    float _1089 = _1083;
    if (_999)
    {
        _1079 = _933;
    }
    float _1091 = _1079;
    float _1093 = _977 + (-0.5);
    float _1095 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1077);
    if (!_999)
    {
        _1067 = _925;
    }
    float _1097 = _1067;
    float _1099 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1061);
    float _1101 = _1097;
    if (!_999)
    {
        _1069 = _925;
    }
    float _1103 = _1069;
    float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1107 = _1103;
    if (_999)
    {
        _1101 = _923;
    }
    float _1109 = _1101;
    if (_999)
    {
        _1107 = _923;
    }
    float _1111 = _1107;
    if (!_999)
    {
        _1081 = _923;
    }
    float _1113 = _1081;
    float _1115 = -_1085;
    float _1117 = -_1075;
    float _1119 = fma(_1115, _1093, _1117);
    float _1121 = _1113;
    if (_999)
    {
        _1121 = _1091;
    }
    float _1123 = _1121;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_999)
    {
        _1087 = _1083;
    }
    float _1129 = _1087;
    float _1131 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1125);
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1135 = _833 + _1133;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1139 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1127);
    float _1141 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1131);
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1145 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1137);
    float _1147 = _1129;
    if (_999)
    {
        _1147 = _925;
    }
    float _1149 = _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1153 = _865 + _1151;
    if (_999)
    {
        _1089 = _925;
    }
    float _1155 = _1089;
    float _1157 = _997 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1159 = _1141 * (-0.15915493667125701904296875);
    float _1161 = _1015 + 0.5;
    float _1163 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1143);
    float _1165 = _1159 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = fma(_1157, _1161, _969);
    float _1171 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1173 = _1021 + (-0.5);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1177 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1181 = _867 + _1179;
    float _1183 = -_1171;
    float _1185 = -_1099;
    float _1187 = fma(_1183, _1173, _1185);
    float _1189 = _1159 * 6.283185482025146484375;
    float _1191 = cos(_1189);
    float _1193 = -_217;
    int _1195 = _673 ? as_type<int>(_1193) : as_type<int>(_217);
    float _1197 = -_1175;
    float _1199 = fma(_1177, 2.0, _1197);
    bool _1201 = _1091 > 0.5;
    float _1203 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1163);
    float _1205 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1139);
    bool _1207 = !_1009;
    float _1209 = _1207 ? _217 : as_type<float>(_1195);
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1215 = -_213;
    int _1217 = _1201 ? as_type<int>(_1215) : as_type<int>(_213);
    float _1219 = _1209 * _1167;
    bool _1221 = _1203 >= 0.0;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1225 = !_1003;
    float _1227 = _1225 ? _213 : as_type<float>(_1217);
    float _1229 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1231 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1213);
    float _1233 = _1209 * _1191;
    float _1235 = -_139;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1199);
    float _1239 = fma(_1229, -2.0, _1223);
    float _1241 = -_1219;
    float _1243 = fma(_1227, _1191, _1241);
    float _1245 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1047);
    float _1247 = -_213;
    int _1249 = _953 ? as_type<int>(_1247) : as_type<int>(_213);
    float _1251 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1253 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1145);
    float _1255 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1095);
    float _1257 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1011);
    float _1259 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1231);
    float _1261 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1239);
    float _1263 = _1243 + 0.5;
    float _1265 = fma(_1227, _1167, _1233);
    bool _1267 = !_1029;
    float _1269 = _1267 ? _213 : as_type<float>(_1249);
    float _1271 = -_1257;
    float _1273 = _1271 + 1.0;
    float _1275 = fma(_1251, _1263, _1237);
    float _1277 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1279 = _1265 + (-0.5);
    float _1281 = _1269 + 0.5;
    float _1283 = -_217;
    int _1285 = _1201 ? as_type<int>(_1283) : as_type<int>(_217);
    float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1289 = -_1277;
    float _1291 = -_1261;
    float _1293 = fma(_1289, _1279, _1291);
    float _1295 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1297 = _1135 * _1135;
    float _1299 = -_1273;
    float _1301 = fma(_1299, _945, _1073);
    float _1303 = -_1245;
    float _1305 = _1303 + 1.0;
    float _1307 = -_1253;
    float _1309 = _1307 + 1.0;
    float _1311 = fma(_1153, _1153, _1297);
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1315 = fma(_1305, _977, _1119);
    bool _1317 = !_1033;
    float _1319 = _1317 ? _217 : as_type<float>(_1285);
    float _1321 = -_1255;
    float _1323 = _1321 + 1.0;
    float _1325 = fma(_1181, _1181, _1311);
    float _1327 = fma(_1021, _1309, _1187);
    float _1329 = _1311;
    if (_1221)
    {
        _1329 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1331 = _1329;
    float _1333 = -_1319;
    float _1335 = _1333 + 0.5;
    float _1337 = rsqrt(_1325);
    float _1339 = -_1323;
    float _1341 = fma(_1015, _1339, _1169);
    float _1343 = -_1205;
    float _1345 = _1343 + 1.0;
    float _1347 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1349 = -_1259;
    float _1351 = _1349 + 1.0;
    float _1353 = _995 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1355 = _1295 * _1287;
    float _1357 = _1347 * _1313;
    int _1359 = as_type<int>(_1331);
    if (_1221)
    {
        float _1361 = _1331 * 5.0;
        _1359 = as_type<int>(_1361);
    }
    int _1363 = _1359;
    float _1365 = -_1345;
    float _1367 = fma(_1243, _1365, _1275);
    float _1369 = fma(_1265, _1351, _1293);
    out.m_66.x = _1301;
    out.m_66.y = _1315;
    out.m_68.w = _1353;
    float _1371 = _1135 * _1337;
    float _1373 = _1153 * _1337;
    if (_1221)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4656 = as_type<float>(_1363);
        out.gl_Position.z = _4656;
    }
    out.m_70.x = _1355;
    out.m_70.y = _1357;
    out.m_72.x = _1341;
    out.m_72.y = _1327;
    out.m_72.z = _1367;
    out.m_72.w = _1369;
    if (_1221)
    {
        out.m_47.x = 0.0;
    }
    if (_1221)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1375 = -_1371;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[18].w, _833);
    float _1379 = _1181 * _1337;
    float _1381 = -_1373;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _1385 = -_1371;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1135);
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1391 = _1377 + _1389;
    float _1393 = -_1379;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[18].w, _867);
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1383 + _1397;
    float _1401 = -_1373;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1405 = _1391 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1409 = _1395 + _1407;
    float _1411 = _1387 * _1387;
    float _1413 = -_1379;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1181);
    float _1417 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1405);
    float _1419 = fma(_1403, _1403, _1411);
    float _1421 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1417);
    float _1423 = fma(_1415, _1415, _1419);
    bool _1425 = _1421 >= 0.0;
    float _1427 = sqrt(_1423);
    float _1429 = _1405;
    float _1431 = _1379;
    float _1433 = _1391;
    float _1435 = _1383;
    float _1437 = _1395;
    if (_1425)
    {
        _1429 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1439 = _1429;
    int _1441 = as_type<int>(_1439);
    if (_1425)
    {
        out.m_47.x = 0.0;
    }
    if (_1425)
    {
        float _1443 = _1439 * 5.0;
        _1441 = as_type<int>(_1443);
    }
    int _1445 = _1441;
    float _1447 = _1337 * _1427;
    if (_1425)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4804 = as_type<float>(_1445);
        out.gl_Position.z = _4804;
    }
    if (_1425)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1449 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1451 = _409 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1453 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _1457 = _1447 * _1449;
    float _1459 = _1447 * _1451;
    float _1461 = _1453 * _1457;
    float _1463 = _1455 * _1459;
    float _1465 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1467 = _1465 * 0.5;
    bool _1469 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1471 = isnan(0.5);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1477 = _1473 || _1475;
    float _1479 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1481 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1483 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1485 = isnan(0.5);
    bool _1487 = _1483 || _1485;
    bool _1489 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1491 = _1487 || _1489;
    float _1493 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1479);
    float _1495 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1481);
    float _1497 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1499 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1493);
    float _1501 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1495);
    float _1503 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1497);
    float _1505 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1507 = _1501 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1509 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1503);
    float _1511 = _867 + _1505;
    float _1513 = _865 + _1507;
    float _1515 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1517 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1521 = _1511 + _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1525 = _1513 + _1523;
    float _1527 = 1.0 / _1515;
    float _1529 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1517);
    float _1531 = _1521 * _1521;
    float _1533 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1529);
    float _1535 = fma(_1525, _1525, _1531);
    float _1537 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1539 = sqrt(_1535);
    float _1541 = _1537 + _1515;
    float _1543 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1545 = _1541 * _1527;
    float _1547 = _1545 * 0.5;
    float _1549 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1543);
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1553 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1551);
    float _1555 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1549);
    bool _1557 = _1539 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1559 = 1.0 / _1553;
    float _1561 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1563 = _833 + _1561;
    float _1565 = _1515;
    float _1567 = _1467;
    float _1569 = _1547;
    float _1571 = _1561;
    float _1573 = _1513;
    if (!_1557)
    {
        _1565 = _1513;
    }
    float _1575 = _1565;
    float _1577 = _1575;
    if (!_1557)
    {
        _1567 = _1511;
    }
    float _1579 = _1567;
    float _1581 = _1579;
    if (!_1557)
    {
        _1569 = _1563;
    }
    float _1583 = _1569;
    bool _1585 = !_1557;
    float _1587 = _1583;
    if (!_1585)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1593 = _1539 + _1591;
        float _1595 = rsqrt(_1535);
        float _1597 = _1593 * _1589;
        float _1599 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = _1597 * 0.15915493667125701904296875;
        float _1603 = _1601 * 6.283185482025146484375;
        float _1605 = cos(_1603);
        float _1607 = _1601 * 6.283185482025146484375;
        float _1609 = sin(_1607);
        float _1611 = _1605 + (-1.0);
        float _1613 = fma(_1609, _1599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1615 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1617 = _1595 * _1613;
        float _1619 = fma(_1563, _1605, _1615);
        float _1621 = fma(_1525, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1623 = fma(_1521, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1577 = _1621;
        _1581 = _1623;
        _1587 = _1619;
        _1571 = _1617;
    }
    float _1625 = _1577;
    float _1627 = _1581;
    float _1629 = _1587;
    float _1631 = _1571;
    float _1633 = -_1373;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1625);
    float _1637 = -_1379;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1627);
    float _1641 = -_1371;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1629);
    float _1645 = _1631;
    float _1647 = _1643;
    float _1649 = _1639;
    if (_1491)
    {
        _1645 = 1.0;
    }
    float _1651 = _1645;
    float _1653 = _1651;
    if (_1477)
    {
        _1431 = _1635;
    }
    float _1655 = _1431;
    float _1657 = _1655;
    if (!_1477)
    {
        float _1659 = _1391 * _1391;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = -_867;
        float _1665 = _1663 + _1627;
        float _1667 = -_865;
        float _1669 = _1667 + _1625;
        float _1671 = fma(_1399, _1399, _1659);
        float _1673 = -_833;
        float _1675 = _1673 + _1629;
        float _1677 = fma(_1409, _1409, _1671);
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = sqrt(_1677);
        float _1683 = 1.0 / _1447;
        float _1685 = precise::min(_1681, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1687 = _1685 * _1661;
        float _1689 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1691 = _1687 * _1683;
        float _1693 = _1689 * _1691;
        float _1695 = _1665 * _1691;
        float _1697 = fma(_1669, _1693, _1383);
        float _1699 = fma(_1675, _1693, _1377);
        float _1701 = fma(_1689, _1695, _1395);
        _1433 = _1689;
        _1647 = _1699;
        _1657 = _1697;
        _1649 = _1701;
        _875 = _1695;
    }
    float _1703 = _1433;
    float _1705 = _1647;
    float _1707 = _1657;
    float _1709 = _1649;
    float _1711 = _875;
    float _1713 = _1711;
    float _1715 = _1703;
    if (_1491)
    {
        _1713 = 1.0;
    }
    float _1717 = _1713;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1721 = _1559 * _1719;
    float _1723 = _1717;
    if (!_1491)
    {
        float _1725 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1727 = _1725 * 0.15915493667125701904296875;
        float _1729 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1731 = _1727 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        float _1735 = _1729 * 0.15915493667125701904296875;
        float _1737 = _1727 * 6.283185482025146484375;
        float _1739 = sin(_1737);
        float _1741 = 1.0 / _1733;
        float _1743 = _1735 * 6.283185482025146484375;
        float _1745 = cos(_1743);
        float _1747 = _1739 * _1741;
        float _1749 = _1735 * 6.283185482025146484375;
        float _1751 = sin(_1749);
        float _1753 = _1745 * _1747;
        float _1755 = 1.0 / _1753;
        float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1759 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1757;
        float _1761 = 1.0 / _1759;
        float _1763 = _1751 * _1755;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1767 = fma(_1721, _1763, _1765);
        float _1769 = _1767 * _1761;
        float _1771 = precise::clamp(_1769, 0.0, 1.0);
        _1715 = _1727;
        _1435 = _1735;
        _1653 = _1771;
    }
    float _1773 = _1715;
    float _1775 = _1435;
    float _1777 = _1653;
    float _1779 = _1773;
    float _1781 = _1775;
    if (!_1491)
    {
        float _1783 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1785 = _1783 * 0.15915493667125701904296875;
        float _1787 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1789 = _1785 * 6.283185482025146484375;
        float _1791 = cos(_1789);
        float _1793 = _1787 * 0.15915493667125701904296875;
        float _1795 = _1785 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = 1.0 / _1791;
        float _1801 = _1793 * 6.283185482025146484375;
        float _1803 = cos(_1801);
        float _1805 = _1797 * _1799;
        float _1807 = _1793 * 6.283185482025146484375;
        float _1809 = sin(_1807);
        float _1811 = _1803 * _1805;
        float _1813 = 1.0 / _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1817 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1815;
        float _1819 = 1.0 / _1817;
        float _1821 = _1809 * _1813;
        float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1825 = fma(_1721, _1821, _1823);
        float _1827 = _1825 * _1819;
        float _1829 = precise::clamp(_1827, 0.0, 1.0);
        float _1831 = -_1829;
        float _1833 = _1831 + 1.0;
        _1779 = _1799;
        _1781 = _1811;
        _1723 = _1833;
    }
    float _1835 = _1779;
    float _1837 = _1781;
    float _1839 = _1723;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1843 = _1705 + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1847 = _1707 + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1709 + _1849;
    float _1853 = _1843 * _1843;
    float _1855 = fma(_1847, _1847, _1853);
    float _1857 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1859 = fma(_1851, _1851, _1855);
    float _1861 = rsqrt(_1859);
    float _1863 = sqrt(_1859);
    float _1865 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1867 = _1847 * _1865;
    float _1869 = _1851 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 * _1869;
    float _1875 = _1871 + _1873;
    float _1877 = sqrt(_1875);
    bool _1879 = _1877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1883 = _1877 + _1881;
    float _1885 = _1835;
    float _1887 = _1883;
    float _1889 = _1843;
    float _1891 = _1867;
    if (_1879)
    {
        float _1893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1893;
    }
    float _1895 = _1885;
    float _1897 = _1895;
    if (_1879)
    {
        float _1899 = _1883 * _1895;
        _1887 = _1899;
    }
    float _1901 = _1887;
    if (_1879)
    {
        float _1903 = rsqrt(_1875);
        _1897 = _1903;
    }
    float _1905 = _1897;
    float _1907 = _1905;
    if (_1879)
    {
        float _1909 = _1901 * 0.15915493667125701904296875;
        _1437 = _1909;
    }
    float _1911 = _1437;
    float _1913 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1915 = _1851;
    if (_1879)
    {
        float _1917 = _1911 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = precise::max(0.0, _1913);
    float _1925 = _1837;
    float _1927 = _1923;
    if (_1879)
    {
        float _1929 = _1911 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        _1925 = _1931;
    }
    float _1933 = _1925;
    float _1935 = -_1865;
    float _1937 = -_1923;
    float _1939 = fma(_1843, _1935, _1937);
    float _1941 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1879)
    {
        float _1943 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1889 = _1943;
    }
    float _1945 = _1889;
    float _1947 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1941);
    float _1949 = _1921;
    float _1951 = _1945;
    if (_1879)
    {
        float _1953 = fma(_1921, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = _1955;
    if (!_1879)
    {
        _1951 = _1939;
    }
    float _1959 = _1951;
    float _1961 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1947);
    float _1963 = _1959;
    if (_1879)
    {
        float _1965 = _1905 * _1955;
        _1573 = _1965;
    }
    float _1967 = _1573;
    if (!_1879)
    {
        _1957 = _1871;
    }
    float _1969 = _1957;
    float _1971 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1973 = _1969;
    float _1975 = _1933;
    if (_1879)
    {
        float _1977 = _1933 + (-1.0);
        _1927 = _1977;
    }
    float _1979 = _1927;
    float _1981 = _1979;
    if (_1879)
    {
        float _1983 = _1867 * _1967;
        _1891 = _1983;
    }
    float _1985 = _1891;
    if (_1879)
    {
        float _1987 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1907 = _1987;
    }
    float _1989 = _1907;
    if (!_1879)
    {
        _1981 = _1869;
    }
    float _1991 = _1981;
    float _1993 = _1991;
    if (_1879)
    {
        float _1995 = _1869 * _1967;
        _1993 = _1995;
    }
    float _1997 = _1993;
    if (_1879)
    {
        float _1999 = _1985 * _1985;
        _1973 = _1999;
    }
    float _2001 = _1973;
    if (_1879)
    {
        float _2003 = fma(_1939, _1933, _1989);
        _1963 = _2003;
    }
    float _2005 = _1963;
    if (!_1879)
    {
        _1975 = _1873;
    }
    float _2007 = _1975;
    float _2009 = _2007;
    if (_1879)
    {
        float _2011 = _1997 * _1997;
        _2009 = _2011;
    }
    float _2013 = _2009;
    float _2015 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2017 = fma(_2005, _2005, _2001);
    float _2019 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2015);
    float _2021 = _2017 + _2013;
    float _2023 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2027 = fma(_1863, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2025);
    float _2029 = precise::clamp(_2027, 0.0, 1.0);
    float _2031 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2019);
    float _2033 = rsqrt(_2021);
    float _2035 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2037 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2023);
    float _2039 = -_2029;
    float _2041 = _2039 + 1.0;
    float _2043 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2045 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2035);
    float _2047 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2037);
    float _2049 = abs(_2041);
    float _2051 = log2(_2049);
    float _2053 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2045);
    float _2055 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2059 = _2053 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2061 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = -_2057;
    float _2065 = fma(_2063, _1857, 1.0);
    float _2067 = _2033 * _1985;
    float _2069 = _2033 * _2005;
    float _2071 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2073 = _2033 * _1997;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2077 = log2(_2065);
    float _2079 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2071);
    float _2081 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2083 = -_2075;
    float _2085 = fma(_2069, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2083);
    float _2087 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2089 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2079);
    float _2091 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2081);
    float _2093 = -_2073;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2085);
    float _2097 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = 1.0 / _2089;
    float _2101 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2091);
    float _2103 = fma(_2095, -0.5, 0.5);
    float _2105 = fma(_2095, 0.5, 0.5);
    float _2107 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2109 = _2069 + 1.0;
    float _2111 = _2077 * 0.693147182464599609375;
    float _2113 = exp2(_2087);
    float _2115 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2107);
    float _2117 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2119 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2115);
    float _2121 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2101);
    float _2123 = sqrt(_2103);
    float _2125 = fma(_2105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2127 = _2119 * _2099;
    float _2129 = fma(_2105, _2125, -0.212114393711090087890625);
    float _2131 = fma(_2127, 0.5, 0.5);
    float _2133 = -_2069;
    float _2135 = fma(_2113, _2109, _2133);
    float _2137 = fma(_2105, _2129, 1.570728778839111328125);
    float _2139 = _2121 * _2099;
    float _2141 = fma(_2135, 0.5, 0.5);
    float _2143 = fma(_2139, -0.5, 0.5);
    float _2145 = _2123 * 0.636619746685028076171875;
    float _2147 = -_2137;
    float _2149 = fma(_2145, _2147, 1.0);
    float3 _5912 = float3(_2131, _2143, _2117);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).x;
    float3 _5923 = float3(_2131, _2143, _2117);
    float4 _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).xyzw;
    float _2156 = _2154.x;
    float _2158 = _2154.y;
    float _2160 = _2154.z;
    float _2162 = _2154.w;
    float2 _5940 = float2(_2149, _2141);
    float3 _2166 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5940, float2(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5940, float2(0.0), isnan(_5940)), level(0.0)).xyz;
    float _2168 = _2166.x;
    float _2170 = _2166.y;
    float _2172 = _2166.z;
    float _2174 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2176 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2178 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2180 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2174);
    float _2182 = fma(_2176, _2176, 1.0);
    float _2184 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2180);
    float _2186 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2188 = rsqrt(_2182);
    bool _2190 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2192 = isnan(_1863);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2198 = _2194 || _2196;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2200 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2184);
    float _2202 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2204 = exp2(_2186);
    out.gl_Position.x = _2119;
    out.gl_Position.y = _2121;
    out.gl_Position.z = _2200;
    out.gl_Position.w = _2089;
    float _2206 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2208 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2210 = _2176 * _2188;
    float _2212 = _2089 * 0.5;
    float _2214 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2206);
    float _2216 = _2119 + _2089;
    float _2218 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2220 = _2210 * _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2224 = _2210 * _2222;
    float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2228 = _2210 * _2226;
    float _2230 = fma(_2121, -0.5, _2212);
    float _2232 = -_2204;
    float _2234 = _2232 + 1.0;
    float _2236 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2220);
    float _2238 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2224);
    float _2240 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2228);
    float _2242 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2244 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2208);
    float _2246 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2202);
    float _2248 = _2200 + _2089;
    out.m_76.x = _2236;
    out.m_76.y = _2238;
    out.m_76.z = _2240;
    float _2250 = _2216 * 0.5;
    float _2252 = _2248 * 0.5;
    float _2254 = _2121;
    float _2256 = _2200;
    float _2258 = _2119;
    float _2260 = _2214;
    float _2262 = _2250;
    if (!_2198)
    {
        _2254 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2264 = _2254;
    float _2266 = _2264;
    float _2268 = _2264;
    if (!_2198)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2270 = _2256;
    out.m_78.x = _2250;
    out.m_78.y = _2230;
    out.m_78.z = _2252;
    out.m_78.w = _2089;
    float _2272 = _2270;
    float _2274 = _2270;
    if (!_2198)
    {
        _2258 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2276 = _2258;
    float _2278 = _2214 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2280 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2282 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2284 = _1777 * _1839;
    float _2286 = _2284;
    float _2288 = _2276;
    float _2290 = _2276;
    if (!_2198)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2292 = _2260;
    out.m_80.x = _2278;
    out.m_80.y = _2280;
    out.m_80.z = _2282;
    float _2294 = _2284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2296 = _2292;
    float _2298 = _2292;
    if (!_2198)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2300 = _2262;
    float _2302 = _2300;
    float _2304 = _2300;
    if (!_2198)
    {
        _2286 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2306 = _2286;
    float _2308 = _2242 * _2151;
    float _2310 = -_2242;
    float _2312 = _2310 + 1.0;
    float _2314 = _2162 * _2308;
    float _2316 = _2172 * _2308;
    float _2318 = _2162 * _2312;
    float _2320 = fma(_2168, _2314, _2156);
    float _2322 = fma(_2170, _2314, _2158);
    float _2324 = fma(_2162, _2316, _2160);
    out.m_82.x = _2320;
    out.m_82.y = _2322;
    out.m_82.z = _2324;
    out.m_82.w = _2318;
    bool _2326 = !_2198;
    float _2328 = _2306;
    float _2330 = _2306;
    if (!_2326)
    {
        bool _2332 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2334 = isnan(_1863);
        bool _2336 = _2332 || _2334;
        bool _2338 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2340 = _2336 || _2338;
        if (!_2340)
        {
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2344 = _1863 + _2342;
            float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2348 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2346;
            float _2350 = 1.0 / _2348;
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2354 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2358 = _2356 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2372 = _2344 * _2350;
            float _2374 = precise::clamp(_2372, 0.0, 1.0);
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2380 = fma(_2374, _2354, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2382 = fma(_2374, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2384 = fma(_2374, _2358, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2386 = fma(_2374, _2362, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2388 = fma(_2374, _2366, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2390 = fma(_2374, _2370, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2304 = _2380;
            _2298 = _2388;
            _2268 = _2382;
            _2290 = _2386;
            _2274 = _2384;
            _2330 = _2390;
            _2392 = true;
        }
        else
        {
            bool _2394 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2396 = isnan(_1863);
            bool _2398 = _2394 || _2396;
            bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2402 = _2398 || _2400;
            if (!_2402)
            {
                _2266 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2404 = _2266;
            _2268 = _2404;
            if (!_2402)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2406 = _2302;
            _2304 = _2406;
            if (!_2402)
            {
                _2272 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2408 = _2272;
            _2274 = _2408;
            if (!_2402)
            {
                _2288 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2410 = _2288;
            _2290 = _2410;
            if (!_2402)
            {
                _2296 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2412 = _2296;
            _2298 = _2412;
            if (!_2402)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2414 = _2328;
            bool _2416 = !_2402;
            _2330 = _2414;
            if (!_2416)
            {
                bool _2418 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2420 = isnan(_1863);
                bool _2422 = _2418 || _2420;
                bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2426 = _2422 || _2424;
                if (!_2426)
                {
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2430 = _1863 + _2428;
                    float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2434 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2432;
                    float _2436 = 1.0 / _2434;
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2458 = _2430 * _2436;
                    float _2460 = precise::clamp(_2458, 0.0, 1.0);
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2466 = fma(_2460, _2440, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2468 = fma(_2460, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2470 = fma(_2460, _2444, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2472 = fma(_2460, _2448, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2474 = fma(_2460, _2452, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2476 = fma(_2460, _2456, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2304 = _2466;
                    _2298 = _2474;
                    _2268 = _2468;
                    _2290 = _2472;
                    _2274 = _2470;
                    _2330 = _2476;
                    _2392 = true;
                }
                else
                {
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2298 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2268 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2290 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2274 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2392 = false;
    float _2478 = _2304;
    float _2480 = _2298;
    float _2482 = _2268;
    float _2484 = _2290;
    float _2486 = _2274;
    float _2488 = _2330;
    float _2490 = _2294 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2492 = fma(_2280, -0.5, 0.5);
    float _2494 = precise::clamp(_2492, 0.0, 1.0);
    float _2496 = -_2478;
    float _2498 = _2496 + _2480;
    float _2500 = -_2482;
    float _2502 = _2500 + _2484;
    out.m_47.x = _2490;
    float _2504 = -_2486;
    float _2506 = _2504 + _2488;
    float _2508 = fma(_2494, _2498, _2478);
    float _2510 = fma(_2494, _2502, _2482);
    bool _2512 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2514 = _2508 * 0.586610972881317138671875;
    float _2516 = fma(_2494, _2506, _2486);
    out.m_84.x = 0.0;
    bool _2518 = _1777 > 0.0;
    bool _2520 = isnan(_1777);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan(0.0);
    bool _2526 = _2522 || _2524;
    float _2528 = fma(_2510, 0.298911988735198974609375, _2514);
    bool _2530 = _1839 <= 0.0;
    bool _2532 = !_2526;
    bool _2534 = _2530 || _2532;
    float _2536 = fma(_2516, 0.114477999508380889892578125, _2528);
    float _2538 = -_2536;
    float _2540 = _2510 + _2538;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2536);
    bool _2544 = !_2512;
    if (!_2544)
    {
        float _2546 = -_1705;
        float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2550 = -_1707;
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2554 = -_1709;
        float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2558 = _2548 * _2548;
        float _2560 = fma(_2552, _2552, _2558);
        float _2562 = fma(_2556, _2556, _2560);
        float _2564 = sqrt(_2562);
        float _2566 = rsqrt(_2562);
        float _2568 = -_2564;
        float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2572 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2574 = precise::clamp(_2572, 0.0, 1.0);
        float _2576 = _2552 * _2566;
        float _2578 = _2548 * _2566;
        float _2580 = abs(_2574);
        float _2582 = log2(_2580);
        float _2584 = _2556 * _2566;
        float _2586 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2588 = _2280 * _2578;
        float _2590 = -_2578;
        float _2592 = -_2586;
        float _2594 = fma(_2590, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2592);
        float _2596 = fma(_2278, _2576, _2588);
        float _2598 = -_2584;
        float _2600 = fma(_2598, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2594);
        float _2602 = fma(_2282, _2584, _2596);
        float _2604 = precise::clamp(_2602, 0.0, 1.0);
        float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2608 = _2600 + _2606;
        float _2610 = _2582 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2612 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2614 = precise::clamp(_2612, 0.0, 1.0);
        float _2616 = exp2(_2610);
        float _2618 = _2616 * _2614;
        float _2620 = _2604 * _2618;
        float _2622 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_84.x = _2622;
    }
    out.m_86.x = _2542;
    if (!_2534)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2624 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2624;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2392 = false;
    bool _601 = false;
    bool _433 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2681 = as_type<float>(_121);
        out.gl_Position.z = _2681;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_135)
    {
        float _141 = float(_105);
        _115 = _141;
    }
    float _143 = _115;
    bool _145 = _139 >= _143;
    bool _147 = !_135;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2750 = as_type<float>(_157);
        out.gl_Position.z = _2750;
    }
    if (_149)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    float _187 = 0.0;
    float _189 = _161;
    if (!_173)
    {
        float _191 = _161 * _161;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    int _203 = as_type<int>(_159) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_159) & 2;
    bool _209 = _207 != 0;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_173;
    float _221 = _201;
    bool _223 = false;
    bool _225 = _173;
    if (!_219)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _161 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _161);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _255;
    }
    float _257 = _221;
    bool _259 = !_173;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _161 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _189 = _279;
    }
    float _281 = _189;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _285 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _291 = fma(_281, _175, _285);
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_291, _163, _181);
    float _299 = fma(_293, _163, _183);
    float _301 = fma(_295, _163, _185);
    bool _303 = !_283;
    float _321;
    if (!_303)
    {
        float _305 = in.m_56.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = in.m_54.x;
    float _339 = in.m_54.y;
    bool _341 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _343 = isnan(_331);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _353;
    bool _357 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _359 = isnan(_331);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = 1.0 / _355;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _381 = _367 * _371;
    float _383 = -_367;
    float _385 = _383 + 1.0;
    float _387 = _335 * _377;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _389;
    float _393 = fma(_375, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _393 * _381;
    float _399 = _395 * _381;
    float _401 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _403 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].x, _401);
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].y, _403);
    float _409 = _405 * _337;
    float _411 = _407 * _339;
    bool _413 = !_379;
    float _431;
    if (!_413)
    {
        float _415 = in.m_56.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_105);
        float _437 = 1.0 / _435;
        float _439 = _139 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _445 = _441 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _451 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = isnan(_441);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _471 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _473 = isnan(_441);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _449;
    float _485 = -_461;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _489;
    bool _493 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _495 = isnan(_441);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = _481 * _487;
    float _507 = -_481;
    float _509 = _507 + 1.0;
    bool _511 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _513 = 1.0 / _465;
    float _515 = _503 * _509;
    float _517 = -_503;
    float _519 = _517 + 1.0;
    float _521 = 1.0 / _469;
    float _523 = _491 * _483;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _529 = fma(_523, _445, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = _527 * _513;
    bool _533 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _535 = isnan(_441);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = _441 + _549;
    float _553 = _529 * _515;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _557 = _441 + _555;
    float _559 = -_543;
    float _561 = _559 + 1.0;
    float _563 = fma(_531, _551, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _565 = _547 * _521;
    float _567 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[115].x, _553);
    float _569 = _461 * _561;
    float _571 = fma(_565, _557, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _573 = fma(_563, _505, _567);
    float _575 = fma(_571, _569, _573);
    float _577 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[118].x, _575);
    float _579 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.w = _579;
    bool _581 = !_511;
    float _599;
    if (!_581)
    {
        float _583 = in.m_56.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_105);
        float _605 = 1.0 / _603;
        float _607 = _139 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = in.m_56.w;
    float _613 = in.m_60.x;
    float _615 = in.m_60.y;
    float _617 = in.m_60.z;
    float _619 = in.m_60.w;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _627 = _625 != 0;
    float _629 = in.m_62.x;
    float _631 = in.m_62.y;
    float _633 = in.m_62.z;
    float _635 = in.m_62.w;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _641 = in.m_64.x;
    float _643 = in.m_64.y;
    float _645 = in.m_64.z;
    float _647 = in.m_64.w;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _653 = 1.0 / _639;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _657 = _655 != 0;
    float _659 = 0.0;
    float _661 = _609;
    if (_623)
    {
        float _663 = in.m_56.x;
        _659 = _663;
    }
    float _665 = _659;
    float _667 = 0.0;
    if (_627)
    {
        float _669 = in.m_56.w;
        _667 = _669;
    }
    float _671 = _667;
    bool _673 = _611 > 0.5;
    float _675 = 1.0 / _651;
    bool _677 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _679 = isnan(_609);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = _299 * _615;
    float _691 = _299 * _631;
    float _693 = fma(_297, _613, _689);
    float _695 = fma(_297, _629, _691);
    float _697 = _299 * _643;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _699;
    float _703 = fma(_301, _633, _695);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _709 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _711 = isnan(_609);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = fma(_297, _641, _697);
    float _723 = fma(_301, _617, _693);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _729 = _701 * _653;
    float _731 = _707 * _675;
    float _733 = fma(_301, _645, _721);
    bool _735 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _737 = isnan(_609);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _707;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _751 = _653;
    float _753 = _675;
    int _755 = as_type<int>(_635);
    float _757 = _647;
    float _759 = _731;
    if (_623)
    {
        float _761 = _665 * 3.1415927410125732421875;
        _747 = _761;
    }
    float _763 = _747;
    float _765 = -_719;
    float _767 = _765 + 1.0;
    float _769 = 1.0 / _727;
    if (_627)
    {
        float _771 = _671 * 3.1415927410125732421875;
        _749 = _771;
    }
    float _773 = _749;
    if (_623)
    {
        float _775 = _763 * 0.15915493667125701904296875;
        _751 = _775;
    }
    float _777 = _751;
    float _779 = _745 * _767;
    float _781 = _767;
    float _783 = _763;
    if (_657)
    {
        float _785 = in.m_56.x;
        float _787 = in.m_56.y;
        _781 = _785;
        _783 = _787;
    }
    float _789 = _781;
    float _791 = _783;
    if (_627)
    {
        float _793 = _773 * 0.15915493667125701904296875;
        _753 = _793;
    }
    float _795 = _753;
    bool _797 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _799 = isnan(_609);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = _777;
    if (_623)
    {
        float _811 = _777 * 6.283185482025146484375;
        float _813 = sin(_811);
        _809 = _813;
    }
    float _815 = _809;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _817;
    float _821 = -_745;
    float _823 = _821 + 1.0;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _827 = _609 + _825;
    float _829 = -_807;
    float _831 = _829 + 1.0;
    float _833 = _723 + _619;
    float _835 = _807 * _823;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _839 = _609 + _837;
    float _841 = _795;
    if (_627)
    {
        float _843 = _795 * 6.283185482025146484375;
        float _845 = sin(_843);
        _841 = _845;
    }
    float _847 = _841;
    float _849 = _819 * _769;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _853 = _609 + _851;
    float _855 = _687 * _831;
    float _857 = -_687;
    float _859 = _857 + 1.0;
    float _861 = fma(_731, _839, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _863 = fma(_729, _853, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _865 = _733 + _647;
    float _867 = _703 + _635;
    float _869 = fma(_849, _827, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _871 = _863 * _855;
    float _873 = _853;
    float _875 = _867;
    if (_623)
    {
        bool _877 = _815 > 0.5;
        _223 = _877;
    }
    bool _879 = _223;
    if (_657)
    {
        _755 = 0;
    }
    int _881 = _755;
    float _883 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[131].x, _871);
    float _885 = _789;
    float _887 = _791;
    int _889 = _881;
    if (_657)
    {
        _661 = _789;
    }
    float _891 = _661;
    float _893 = _891;
    if (_627)
    {
        bool _895 = _847 > 0.5;
        _225 = _895;
    }
    bool _897 = _225;
    if (_657)
    {
        _757 = _791;
    }
    float _899 = _757;
    float _901 = _899;
    if (!_657)
    {
        float _903 = in.m_56.x;
        float _905 = in.m_56.y;
        float _907 = _903 * 3.1415927410125732421875;
        float _909 = _907 * 0.15915493667125701904296875;
        float _911 = _905 * 3.1415927410125732421875;
        float _913 = _911 * 0.15915493667125701904296875;
        float _915 = _909 * 6.283185482025146484375;
        float _917 = sin(_915);
        float _919 = _913 * 6.283185482025146484375;
        float _921 = sin(_919);
        _885 = _903;
        _887 = _905;
        _889 = 1;
        _893 = _917;
        _901 = _921;
    }
    float _923 = _885;
    float _925 = _887;
    int _927 = _889;
    float _929 = _893;
    float _931 = _901;
    float _933 = in.m_56.z;
    if (!_627)
    {
        _759 = _213;
    }
    float _935 = _759;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _939 = _935;
    if (_627)
    {
        float _941 = -_213;
        float _943 = _897 ? _941 : _213;
        _939 = _943;
    }
    float _945 = _939;
    float _947 = _923 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _949 = _923 > 0.5;
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _953 = _925 > 0.5;
    float _955 = -_937;
    float _957 = fma(_947, 2.0, _955);
    if (!_623)
    {
        _873 = _217;
    }
    float _959 = _873;
    float _961 = fma(_861, _835, _883);
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _965 = _963 != 0;
    float _967 = -_139;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[76].x, _957);
    float _971 = _959;
    if (_623)
    {
        float _973 = -_217;
        float _975 = _879 ? _973 : _217;
        _971 = _975;
    }
    float _977 = _971;
    float _979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _981 = -_213;
    int _983 = _949 ? as_type<int>(_981) : as_type<int>(_213);
    float _985 = fma(_869, _779, _961);
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _989 = _987 != 0;
    float _991 = -_217;
    int _993 = _953 ? as_type<int>(_991) : as_type<int>(_217);
    float _995 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[134].x, _985);
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _999 = _927 != 1;
    int _1001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1003 = _1001 != 0;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1009 = _1007 != 0;
    float _1011 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1005);
    bool _1013 = !_965;
    float _1015 = _1013 ? _213 : as_type<float>(_983);
    float _1017 = _925 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1019 = !_989;
    float _1021 = _1019 ? _217 : as_type<float>(_993);
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1033 = _1031 != 0;
    float _1035 = _929 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1041 = _931 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1043 = -_1023;
    float _1045 = fma(_1035, 2.0, _1043);
    float _1047 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1037);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1051 = fma(_1041, -2.0, _1039);
    float _1053 = _951 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1055 = -_139;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1045);
    float _1059 = _945 + 0.5;
    float _1061 = fma(_1017, -2.0, _1049);
    float _1063 = _1035;
    float _1065 = _1017;
    float _1067 = _951;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_999)
    {
        _1063 = _933;
    }
    float _1071 = _1063;
    float _1073 = fma(_1053, _1059, _1057);
    float _1075 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1051);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1079 = _1071;
    float _1081 = _1077;
    if (!_999)
    {
        _1065 = _1071;
    }
    float _1083 = _1065;
    float _1085 = _979 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1087 = _979;
    float _1089 = _1083;
    if (_999)
    {
        _1079 = _933;
    }
    float _1091 = _1079;
    float _1093 = _977 + (-0.5);
    float _1095 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1077);
    if (!_999)
    {
        _1067 = _925;
    }
    float _1097 = _1067;
    float _1099 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1061);
    float _1101 = _1097;
    if (!_999)
    {
        _1069 = _925;
    }
    float _1103 = _1069;
    float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1107 = _1103;
    if (_999)
    {
        _1101 = _923;
    }
    float _1109 = _1101;
    if (_999)
    {
        _1107 = _923;
    }
    float _1111 = _1107;
    if (!_999)
    {
        _1081 = _923;
    }
    float _1113 = _1081;
    float _1115 = -_1085;
    float _1117 = -_1075;
    float _1119 = fma(_1115, _1093, _1117);
    float _1121 = _1113;
    if (_999)
    {
        _1121 = _1091;
    }
    float _1123 = _1121;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_999)
    {
        _1087 = _1083;
    }
    float _1129 = _1087;
    float _1131 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1125);
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1135 = _833 + _1133;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1139 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1127);
    float _1141 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1131);
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1145 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1137);
    float _1147 = _1129;
    if (_999)
    {
        _1147 = _925;
    }
    float _1149 = _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1153 = _865 + _1151;
    if (_999)
    {
        _1089 = _925;
    }
    float _1155 = _1089;
    float _1157 = _997 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1159 = _1141 * (-0.15915493667125701904296875);
    float _1161 = _1015 + 0.5;
    float _1163 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1143);
    float _1165 = _1159 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = fma(_1157, _1161, _969);
    float _1171 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1173 = _1021 + (-0.5);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1177 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1181 = _867 + _1179;
    float _1183 = -_1171;
    float _1185 = -_1099;
    float _1187 = fma(_1183, _1173, _1185);
    float _1189 = _1159 * 6.283185482025146484375;
    float _1191 = cos(_1189);
    float _1193 = -_217;
    int _1195 = _673 ? as_type<int>(_1193) : as_type<int>(_217);
    float _1197 = -_1175;
    float _1199 = fma(_1177, 2.0, _1197);
    bool _1201 = _1091 > 0.5;
    float _1203 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1163);
    float _1205 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1139);
    bool _1207 = !_1009;
    float _1209 = _1207 ? _217 : as_type<float>(_1195);
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1215 = -_213;
    int _1217 = _1201 ? as_type<int>(_1215) : as_type<int>(_213);
    float _1219 = _1209 * _1167;
    bool _1221 = _1203 >= 0.0;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1225 = !_1003;
    float _1227 = _1225 ? _213 : as_type<float>(_1217);
    float _1229 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1231 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1213);
    float _1233 = _1209 * _1191;
    float _1235 = -_139;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1199);
    float _1239 = fma(_1229, -2.0, _1223);
    float _1241 = -_1219;
    float _1243 = fma(_1227, _1191, _1241);
    float _1245 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1047);
    float _1247 = -_213;
    int _1249 = _953 ? as_type<int>(_1247) : as_type<int>(_213);
    float _1251 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1253 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1145);
    float _1255 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1095);
    float _1257 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1011);
    float _1259 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1231);
    float _1261 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1239);
    float _1263 = _1243 + 0.5;
    float _1265 = fma(_1227, _1167, _1233);
    bool _1267 = !_1029;
    float _1269 = _1267 ? _213 : as_type<float>(_1249);
    float _1271 = -_1257;
    float _1273 = _1271 + 1.0;
    float _1275 = fma(_1251, _1263, _1237);
    float _1277 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1279 = _1265 + (-0.5);
    float _1281 = _1269 + 0.5;
    float _1283 = -_217;
    int _1285 = _1201 ? as_type<int>(_1283) : as_type<int>(_217);
    float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1289 = -_1277;
    float _1291 = -_1261;
    float _1293 = fma(_1289, _1279, _1291);
    float _1295 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1297 = _1135 * _1135;
    float _1299 = -_1273;
    float _1301 = fma(_1299, _945, _1073);
    float _1303 = -_1245;
    float _1305 = _1303 + 1.0;
    float _1307 = -_1253;
    float _1309 = _1307 + 1.0;
    float _1311 = fma(_1153, _1153, _1297);
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1315 = fma(_1305, _977, _1119);
    bool _1317 = !_1033;
    float _1319 = _1317 ? _217 : as_type<float>(_1285);
    float _1321 = -_1255;
    float _1323 = _1321 + 1.0;
    float _1325 = fma(_1181, _1181, _1311);
    float _1327 = fma(_1021, _1309, _1187);
    float _1329 = _1311;
    if (_1221)
    {
        _1329 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1331 = _1329;
    float _1333 = -_1319;
    float _1335 = _1333 + 0.5;
    float _1337 = rsqrt(_1325);
    float _1339 = -_1323;
    float _1341 = fma(_1015, _1339, _1169);
    float _1343 = -_1205;
    float _1345 = _1343 + 1.0;
    float _1347 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1349 = -_1259;
    float _1351 = _1349 + 1.0;
    float _1353 = _995 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1355 = _1295 * _1287;
    float _1357 = _1347 * _1313;
    int _1359 = as_type<int>(_1331);
    if (_1221)
    {
        float _1361 = _1331 * 5.0;
        _1359 = as_type<int>(_1361);
    }
    int _1363 = _1359;
    float _1365 = -_1345;
    float _1367 = fma(_1243, _1365, _1275);
    float _1369 = fma(_1265, _1351, _1293);
    out.m_66.x = _1301;
    out.m_66.y = _1315;
    out.m_68.w = _1353;
    float _1371 = _1135 * _1337;
    float _1373 = _1153 * _1337;
    if (_1221)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4656 = as_type<float>(_1363);
        out.gl_Position.z = _4656;
    }
    out.m_70.x = _1355;
    out.m_70.y = _1357;
    out.m_72.x = _1341;
    out.m_72.y = _1327;
    out.m_72.z = _1367;
    out.m_72.w = _1369;
    if (_1221)
    {
        out.m_47.x = 0.0;
    }
    if (_1221)
    {
        return out;
    }
    float _1375 = -_1371;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[18].w, _833);
    float _1379 = _1181 * _1337;
    float _1381 = -_1373;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _1385 = -_1371;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1135);
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1391 = _1377 + _1389;
    float _1393 = -_1379;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[18].w, _867);
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1383 + _1397;
    float _1401 = -_1373;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1405 = _1391 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1409 = _1395 + _1407;
    float _1411 = _1387 * _1387;
    float _1413 = -_1379;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1181);
    float _1417 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1405);
    float _1419 = fma(_1403, _1403, _1411);
    float _1421 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1417);
    float _1423 = fma(_1415, _1415, _1419);
    bool _1425 = _1421 >= 0.0;
    float _1427 = sqrt(_1423);
    float _1429 = _1405;
    float _1431 = _1379;
    float _1433 = _1391;
    float _1435 = _1383;
    float _1437 = _1395;
    if (_1425)
    {
        _1429 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1439 = _1429;
    int _1441 = as_type<int>(_1439);
    if (_1425)
    {
        out.m_47.x = 0.0;
    }
    if (_1425)
    {
        float _1443 = _1439 * 5.0;
        _1441 = as_type<int>(_1443);
    }
    int _1445 = _1441;
    float _1447 = _1337 * _1427;
    if (_1425)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4804 = as_type<float>(_1445);
        out.gl_Position.z = _4804;
    }
    if (_1425)
    {
        return out;
    }
    float _1449 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1451 = _409 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1453 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _1457 = _1447 * _1449;
    float _1459 = _1447 * _1451;
    float _1461 = _1453 * _1457;
    float _1463 = _1455 * _1459;
    float _1465 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1467 = _1465 * 0.5;
    bool _1469 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1471 = isnan(0.5);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1477 = _1473 || _1475;
    float _1479 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1481 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1483 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1485 = isnan(0.5);
    bool _1487 = _1483 || _1485;
    bool _1489 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1491 = _1487 || _1489;
    float _1493 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1479);
    float _1495 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1481);
    float _1497 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1499 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1493);
    float _1501 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1495);
    float _1503 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1497);
    float _1505 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1507 = _1501 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1509 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1503);
    float _1511 = _867 + _1505;
    float _1513 = _865 + _1507;
    float _1515 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1517 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1521 = _1511 + _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1525 = _1513 + _1523;
    float _1527 = 1.0 / _1515;
    float _1529 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1517);
    float _1531 = _1521 * _1521;
    float _1533 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1529);
    float _1535 = fma(_1525, _1525, _1531);
    float _1537 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1539 = sqrt(_1535);
    float _1541 = _1537 + _1515;
    float _1543 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1545 = _1541 * _1527;
    float _1547 = _1545 * 0.5;
    float _1549 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1543);
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1553 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1551);
    float _1555 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1549);
    bool _1557 = _1539 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1559 = 1.0 / _1553;
    float _1561 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1563 = _833 + _1561;
    float _1565 = _1515;
    float _1567 = _1467;
    float _1569 = _1547;
    float _1571 = _1561;
    float _1573 = _1513;
    if (!_1557)
    {
        _1565 = _1513;
    }
    float _1575 = _1565;
    float _1577 = _1575;
    if (!_1557)
    {
        _1567 = _1511;
    }
    float _1579 = _1567;
    float _1581 = _1579;
    if (!_1557)
    {
        _1569 = _1563;
    }
    float _1583 = _1569;
    bool _1585 = !_1557;
    float _1587 = _1583;
    if (!_1585)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1593 = _1539 + _1591;
        float _1595 = rsqrt(_1535);
        float _1597 = _1593 * _1589;
        float _1599 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = _1597 * 0.15915493667125701904296875;
        float _1603 = _1601 * 6.283185482025146484375;
        float _1605 = cos(_1603);
        float _1607 = _1601 * 6.283185482025146484375;
        float _1609 = sin(_1607);
        float _1611 = _1605 + (-1.0);
        float _1613 = fma(_1609, _1599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1615 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1617 = _1595 * _1613;
        float _1619 = fma(_1563, _1605, _1615);
        float _1621 = fma(_1525, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1623 = fma(_1521, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1577 = _1621;
        _1581 = _1623;
        _1587 = _1619;
        _1571 = _1617;
    }
    float _1625 = _1577;
    float _1627 = _1581;
    float _1629 = _1587;
    float _1631 = _1571;
    float _1633 = -_1373;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1625);
    float _1637 = -_1379;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1627);
    float _1641 = -_1371;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1629);
    float _1645 = _1631;
    float _1647 = _1643;
    float _1649 = _1639;
    if (_1491)
    {
        _1645 = 1.0;
    }
    float _1651 = _1645;
    float _1653 = _1651;
    if (_1477)
    {
        _1431 = _1635;
    }
    float _1655 = _1431;
    float _1657 = _1655;
    if (!_1477)
    {
        float _1659 = _1391 * _1391;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = -_867;
        float _1665 = _1663 + _1627;
        float _1667 = -_865;
        float _1669 = _1667 + _1625;
        float _1671 = fma(_1399, _1399, _1659);
        float _1673 = -_833;
        float _1675 = _1673 + _1629;
        float _1677 = fma(_1409, _1409, _1671);
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = sqrt(_1677);
        float _1683 = 1.0 / _1447;
        float _1685 = precise::min(_1681, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1687 = _1685 * _1661;
        float _1689 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1691 = _1687 * _1683;
        float _1693 = _1689 * _1691;
        float _1695 = _1665 * _1691;
        float _1697 = fma(_1669, _1693, _1383);
        float _1699 = fma(_1675, _1693, _1377);
        float _1701 = fma(_1689, _1695, _1395);
        _1433 = _1689;
        _1647 = _1699;
        _1657 = _1697;
        _1649 = _1701;
        _875 = _1695;
    }
    float _1703 = _1433;
    float _1705 = _1647;
    float _1707 = _1657;
    float _1709 = _1649;
    float _1711 = _875;
    float _1713 = _1711;
    float _1715 = _1703;
    if (_1491)
    {
        _1713 = 1.0;
    }
    float _1717 = _1713;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1721 = _1559 * _1719;
    float _1723 = _1717;
    if (!_1491)
    {
        float _1725 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1727 = _1725 * 0.15915493667125701904296875;
        float _1729 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1731 = _1727 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        float _1735 = _1729 * 0.15915493667125701904296875;
        float _1737 = _1727 * 6.283185482025146484375;
        float _1739 = sin(_1737);
        float _1741 = 1.0 / _1733;
        float _1743 = _1735 * 6.283185482025146484375;
        float _1745 = cos(_1743);
        float _1747 = _1739 * _1741;
        float _1749 = _1735 * 6.283185482025146484375;
        float _1751 = sin(_1749);
        float _1753 = _1745 * _1747;
        float _1755 = 1.0 / _1753;
        float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1759 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1757;
        float _1761 = 1.0 / _1759;
        float _1763 = _1751 * _1755;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1767 = fma(_1721, _1763, _1765);
        float _1769 = _1767 * _1761;
        float _1771 = precise::clamp(_1769, 0.0, 1.0);
        _1715 = _1727;
        _1435 = _1735;
        _1653 = _1771;
    }
    float _1773 = _1715;
    float _1775 = _1435;
    float _1777 = _1653;
    float _1779 = _1773;
    float _1781 = _1775;
    if (!_1491)
    {
        float _1783 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1785 = _1783 * 0.15915493667125701904296875;
        float _1787 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1789 = _1785 * 6.283185482025146484375;
        float _1791 = cos(_1789);
        float _1793 = _1787 * 0.15915493667125701904296875;
        float _1795 = _1785 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = 1.0 / _1791;
        float _1801 = _1793 * 6.283185482025146484375;
        float _1803 = cos(_1801);
        float _1805 = _1797 * _1799;
        float _1807 = _1793 * 6.283185482025146484375;
        float _1809 = sin(_1807);
        float _1811 = _1803 * _1805;
        float _1813 = 1.0 / _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1817 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1815;
        float _1819 = 1.0 / _1817;
        float _1821 = _1809 * _1813;
        float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1825 = fma(_1721, _1821, _1823);
        float _1827 = _1825 * _1819;
        float _1829 = precise::clamp(_1827, 0.0, 1.0);
        float _1831 = -_1829;
        float _1833 = _1831 + 1.0;
        _1779 = _1799;
        _1781 = _1811;
        _1723 = _1833;
    }
    float _1835 = _1779;
    float _1837 = _1781;
    float _1839 = _1723;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1843 = _1705 + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1847 = _1707 + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1709 + _1849;
    float _1853 = _1843 * _1843;
    float _1855 = fma(_1847, _1847, _1853);
    float _1857 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1859 = fma(_1851, _1851, _1855);
    float _1861 = rsqrt(_1859);
    float _1863 = sqrt(_1859);
    float _1865 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1867 = _1847 * _1865;
    float _1869 = _1851 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 * _1869;
    float _1875 = _1871 + _1873;
    float _1877 = sqrt(_1875);
    bool _1879 = _1877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1883 = _1877 + _1881;
    float _1885 = _1835;
    float _1887 = _1883;
    float _1889 = _1843;
    float _1891 = _1867;
    if (_1879)
    {
        float _1893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1893;
    }
    float _1895 = _1885;
    float _1897 = _1895;
    if (_1879)
    {
        float _1899 = _1883 * _1895;
        _1887 = _1899;
    }
    float _1901 = _1887;
    if (_1879)
    {
        float _1903 = rsqrt(_1875);
        _1897 = _1903;
    }
    float _1905 = _1897;
    float _1907 = _1905;
    if (_1879)
    {
        float _1909 = _1901 * 0.15915493667125701904296875;
        _1437 = _1909;
    }
    float _1911 = _1437;
    float _1913 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1915 = _1851;
    if (_1879)
    {
        float _1917 = _1911 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = precise::max(0.0, _1913);
    float _1925 = _1837;
    float _1927 = _1923;
    if (_1879)
    {
        float _1929 = _1911 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        _1925 = _1931;
    }
    float _1933 = _1925;
    float _1935 = -_1865;
    float _1937 = -_1923;
    float _1939 = fma(_1843, _1935, _1937);
    float _1941 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1879)
    {
        float _1943 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1889 = _1943;
    }
    float _1945 = _1889;
    float _1947 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1941);
    float _1949 = _1921;
    float _1951 = _1945;
    if (_1879)
    {
        float _1953 = fma(_1921, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = _1955;
    if (!_1879)
    {
        _1951 = _1939;
    }
    float _1959 = _1951;
    float _1961 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1947);
    float _1963 = _1959;
    if (_1879)
    {
        float _1965 = _1905 * _1955;
        _1573 = _1965;
    }
    float _1967 = _1573;
    if (!_1879)
    {
        _1957 = _1871;
    }
    float _1969 = _1957;
    float _1971 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1973 = _1969;
    float _1975 = _1933;
    if (_1879)
    {
        float _1977 = _1933 + (-1.0);
        _1927 = _1977;
    }
    float _1979 = _1927;
    float _1981 = _1979;
    if (_1879)
    {
        float _1983 = _1867 * _1967;
        _1891 = _1983;
    }
    float _1985 = _1891;
    if (_1879)
    {
        float _1987 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1907 = _1987;
    }
    float _1989 = _1907;
    if (!_1879)
    {
        _1981 = _1869;
    }
    float _1991 = _1981;
    float _1993 = _1991;
    if (_1879)
    {
        float _1995 = _1869 * _1967;
        _1993 = _1995;
    }
    float _1997 = _1993;
    if (_1879)
    {
        float _1999 = _1985 * _1985;
        _1973 = _1999;
    }
    float _2001 = _1973;
    if (_1879)
    {
        float _2003 = fma(_1939, _1933, _1989);
        _1963 = _2003;
    }
    float _2005 = _1963;
    if (!_1879)
    {
        _1975 = _1873;
    }
    float _2007 = _1975;
    float _2009 = _2007;
    if (_1879)
    {
        float _2011 = _1997 * _1997;
        _2009 = _2011;
    }
    float _2013 = _2009;
    float _2015 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2017 = fma(_2005, _2005, _2001);
    float _2019 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2015);
    float _2021 = _2017 + _2013;
    float _2023 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2027 = fma(_1863, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2025);
    float _2029 = precise::clamp(_2027, 0.0, 1.0);
    float _2031 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2019);
    float _2033 = rsqrt(_2021);
    float _2035 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2037 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2023);
    float _2039 = -_2029;
    float _2041 = _2039 + 1.0;
    float _2043 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2045 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2035);
    float _2047 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2037);
    float _2049 = abs(_2041);
    float _2051 = log2(_2049);
    float _2053 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2045);
    float _2055 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2059 = _2053 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2061 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = -_2057;
    float _2065 = fma(_2063, _1857, 1.0);
    float _2067 = _2033 * _1985;
    float _2069 = _2033 * _2005;
    float _2071 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2073 = _2033 * _1997;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2077 = log2(_2065);
    float _2079 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2071);
    float _2081 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2083 = -_2075;
    float _2085 = fma(_2069, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2083);
    float _2087 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2089 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2079);
    float _2091 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2081);
    float _2093 = -_2073;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2085);
    float _2097 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = 1.0 / _2089;
    float _2101 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2091);
    float _2103 = fma(_2095, -0.5, 0.5);
    float _2105 = fma(_2095, 0.5, 0.5);
    float _2107 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2109 = _2069 + 1.0;
    float _2111 = _2077 * 0.693147182464599609375;
    float _2113 = exp2(_2087);
    float _2115 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2107);
    float _2117 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2119 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2115);
    float _2121 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2101);
    float _2123 = sqrt(_2103);
    float _2125 = fma(_2105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2127 = _2119 * _2099;
    float _2129 = fma(_2105, _2125, -0.212114393711090087890625);
    float _2131 = fma(_2127, 0.5, 0.5);
    float _2133 = -_2069;
    float _2135 = fma(_2113, _2109, _2133);
    float _2137 = fma(_2105, _2129, 1.570728778839111328125);
    float _2139 = _2121 * _2099;
    float _2141 = fma(_2135, 0.5, 0.5);
    float _2143 = fma(_2139, -0.5, 0.5);
    float _2145 = _2123 * 0.636619746685028076171875;
    float _2147 = -_2137;
    float _2149 = fma(_2145, _2147, 1.0);
    float3 _5912 = float3(_2131, _2143, _2117);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).x;
    float3 _5923 = float3(_2131, _2143, _2117);
    float4 _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).xyzw;
    float _2156 = _2154.x;
    float _2158 = _2154.y;
    float _2160 = _2154.z;
    float _2162 = _2154.w;
    float2 _5940 = float2(_2149, _2141);
    float3 _2166 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5940, float2(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5940, float2(0.0), isnan(_5940)), level(0.0)).xyz;
    float _2168 = _2166.x;
    float _2170 = _2166.y;
    float _2172 = _2166.z;
    float _2174 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2176 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2178 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2180 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2174);
    float _2182 = fma(_2176, _2176, 1.0);
    float _2184 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2180);
    float _2186 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2188 = rsqrt(_2182);
    bool _2190 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2192 = isnan(_1863);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2198 = _2194 || _2196;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2200 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2184);
    float _2202 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2204 = exp2(_2186);
    out.gl_Position.x = _2119;
    out.gl_Position.y = _2121;
    out.gl_Position.z = _2200;
    out.gl_Position.w = _2089;
    float _2206 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2208 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2210 = _2176 * _2188;
    float _2212 = _2089 * 0.5;
    float _2214 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2206);
    float _2216 = _2119 + _2089;
    float _2218 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2220 = _2210 * _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2224 = _2210 * _2222;
    float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2228 = _2210 * _2226;
    float _2230 = fma(_2121, -0.5, _2212);
    float _2232 = -_2204;
    float _2234 = _2232 + 1.0;
    float _2236 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2220);
    float _2238 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2224);
    float _2240 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2228);
    float _2242 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2244 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2208);
    float _2246 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2202);
    float _2248 = _2200 + _2089;
    out.m_76.x = _2236;
    out.m_76.y = _2238;
    out.m_76.z = _2240;
    float _2250 = _2216 * 0.5;
    float _2252 = _2248 * 0.5;
    float _2254 = _2121;
    float _2256 = _2200;
    float _2258 = _2119;
    float _2260 = _2214;
    float _2262 = _2250;
    if (!_2198)
    {
        _2254 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2264 = _2254;
    float _2266 = _2264;
    float _2268 = _2264;
    if (!_2198)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2270 = _2256;
    out.m_78.x = _2250;
    out.m_78.y = _2230;
    out.m_78.z = _2252;
    out.m_78.w = _2089;
    float _2272 = _2270;
    float _2274 = _2270;
    if (!_2198)
    {
        _2258 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2276 = _2258;
    float _2278 = _2214 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2280 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2282 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2284 = _1777 * _1839;
    float _2286 = _2284;
    float _2288 = _2276;
    float _2290 = _2276;
    if (!_2198)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2292 = _2260;
    out.m_80.x = _2278;
    out.m_80.y = _2280;
    out.m_80.z = _2282;
    float _2294 = _2284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2296 = _2292;
    float _2298 = _2292;
    if (!_2198)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2300 = _2262;
    float _2302 = _2300;
    float _2304 = _2300;
    if (!_2198)
    {
        _2286 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2306 = _2286;
    float _2308 = _2242 * _2151;
    float _2310 = -_2242;
    float _2312 = _2310 + 1.0;
    float _2314 = _2162 * _2308;
    float _2316 = _2172 * _2308;
    float _2318 = _2162 * _2312;
    float _2320 = fma(_2168, _2314, _2156);
    float _2322 = fma(_2170, _2314, _2158);
    float _2324 = fma(_2162, _2316, _2160);
    out.m_82.x = _2320;
    out.m_82.y = _2322;
    out.m_82.z = _2324;
    out.m_82.w = _2318;
    bool _2326 = !_2198;
    float _2328 = _2306;
    float _2330 = _2306;
    if (!_2326)
    {
        bool _2332 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2334 = isnan(_1863);
        bool _2336 = _2332 || _2334;
        bool _2338 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2340 = _2336 || _2338;
        if (!_2340)
        {
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2344 = _1863 + _2342;
            float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2348 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2346;
            float _2350 = 1.0 / _2348;
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2354 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2358 = _2356 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2372 = _2344 * _2350;
            float _2374 = precise::clamp(_2372, 0.0, 1.0);
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2380 = fma(_2374, _2354, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2382 = fma(_2374, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2384 = fma(_2374, _2358, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2386 = fma(_2374, _2362, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2388 = fma(_2374, _2366, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2390 = fma(_2374, _2370, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2304 = _2380;
            _2298 = _2388;
            _2268 = _2382;
            _2290 = _2386;
            _2274 = _2384;
            _2330 = _2390;
            _2392 = true;
        }
        else
        {
            bool _2394 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2396 = isnan(_1863);
            bool _2398 = _2394 || _2396;
            bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2402 = _2398 || _2400;
            if (!_2402)
            {
                _2266 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2404 = _2266;
            _2268 = _2404;
            if (!_2402)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2406 = _2302;
            _2304 = _2406;
            if (!_2402)
            {
                _2272 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2408 = _2272;
            _2274 = _2408;
            if (!_2402)
            {
                _2288 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2410 = _2288;
            _2290 = _2410;
            if (!_2402)
            {
                _2296 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2412 = _2296;
            _2298 = _2412;
            if (!_2402)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2414 = _2328;
            bool _2416 = !_2402;
            _2330 = _2414;
            if (!_2416)
            {
                bool _2418 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2420 = isnan(_1863);
                bool _2422 = _2418 || _2420;
                bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2426 = _2422 || _2424;
                if (!_2426)
                {
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2430 = _1863 + _2428;
                    float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2434 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2432;
                    float _2436 = 1.0 / _2434;
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2458 = _2430 * _2436;
                    float _2460 = precise::clamp(_2458, 0.0, 1.0);
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2466 = fma(_2460, _2440, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2468 = fma(_2460, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2470 = fma(_2460, _2444, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2472 = fma(_2460, _2448, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2474 = fma(_2460, _2452, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2476 = fma(_2460, _2456, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2304 = _2466;
                    _2298 = _2474;
                    _2268 = _2468;
                    _2290 = _2472;
                    _2274 = _2470;
                    _2330 = _2476;
                    _2392 = true;
                }
                else
                {
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2298 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2268 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2290 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2274 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2392 = false;
    float _2478 = _2304;
    float _2480 = _2298;
    float _2482 = _2268;
    float _2484 = _2290;
    float _2486 = _2274;
    float _2488 = _2330;
    float _2490 = _2294 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2492 = fma(_2280, -0.5, 0.5);
    float _2494 = precise::clamp(_2492, 0.0, 1.0);
    float _2496 = -_2478;
    float _2498 = _2496 + _2480;
    float _2500 = -_2482;
    float _2502 = _2500 + _2484;
    out.m_47.x = _2490;
    float _2504 = -_2486;
    float _2506 = _2504 + _2488;
    float _2508 = fma(_2494, _2498, _2478);
    float _2510 = fma(_2494, _2502, _2482);
    bool _2512 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2514 = _2508 * 0.586610972881317138671875;
    float _2516 = fma(_2494, _2506, _2486);
    out.m_84.x = 0.0;
    bool _2518 = _1777 > 0.0;
    bool _2520 = isnan(_1777);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan(0.0);
    bool _2526 = _2522 || _2524;
    float _2528 = fma(_2510, 0.298911988735198974609375, _2514);
    bool _2530 = _1839 <= 0.0;
    bool _2532 = !_2526;
    bool _2534 = _2530 || _2532;
    float _2536 = fma(_2516, 0.114477999508380889892578125, _2528);
    float _2538 = -_2536;
    float _2540 = _2510 + _2538;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2536);
    bool _2544 = !_2512;
    if (!_2544)
    {
        float _2546 = -_1705;
        float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2550 = -_1707;
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2554 = -_1709;
        float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2558 = _2548 * _2548;
        float _2560 = fma(_2552, _2552, _2558);
        float _2562 = fma(_2556, _2556, _2560);
        float _2564 = sqrt(_2562);
        float _2566 = rsqrt(_2562);
        float _2568 = -_2564;
        float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2572 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2574 = precise::clamp(_2572, 0.0, 1.0);
        float _2576 = _2552 * _2566;
        float _2578 = _2548 * _2566;
        float _2580 = abs(_2574);
        float _2582 = log2(_2580);
        float _2584 = _2556 * _2566;
        float _2586 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2588 = _2280 * _2578;
        float _2590 = -_2578;
        float _2592 = -_2586;
        float _2594 = fma(_2590, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2592);
        float _2596 = fma(_2278, _2576, _2588);
        float _2598 = -_2584;
        float _2600 = fma(_2598, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2594);
        float _2602 = fma(_2282, _2584, _2596);
        float _2604 = precise::clamp(_2602, 0.0, 1.0);
        float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2608 = _2600 + _2606;
        float _2610 = _2582 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2612 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2614 = precise::clamp(_2612, 0.0, 1.0);
        float _2616 = exp2(_2610);
        float _2618 = _2616 * _2614;
        float _2620 = _2604 * _2618;
        float _2622 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_84.x = _2622;
    }
    out.m_86.x = _2542;
    if (!_2534)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2624 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2624;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2392 = false;
    bool _601 = false;
    bool _433 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2681 = as_type<float>(_121);
        out.gl_Position.z = _2681;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_135)
    {
        float _141 = float(_105);
        _115 = _141;
    }
    float _143 = _115;
    bool _145 = _139 >= _143;
    bool _147 = !_135;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2750 = as_type<float>(_157);
        out.gl_Position.z = _2750;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_54.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_49.x;
    float _177 = in.m_49.y;
    float _179 = in.m_49.z;
    float _181 = in.m_44.x;
    float _183 = in.m_44.y;
    float _185 = in.m_44.z;
    float _187 = 0.0;
    float _189 = _161;
    if (!_173)
    {
        float _191 = _161 * _161;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_173)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    int _203 = as_type<int>(_159) & 1;
    bool _205 = _203 != 0;
    int _207 = as_type<int>(_159) & 2;
    bool _209 = _207 != 0;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_209;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_173;
    float _221 = _201;
    bool _223 = false;
    bool _225 = _173;
    if (!_219)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = _161 * _229;
        float _239 = 1.0 / _233;
        float _241 = _235 * 0.693147182464599609375;
        float _243 = exp2(_237);
        float _245 = 1.0 / _241;
        float _247 = _243 + (-1.0);
        float _249 = -_247;
        float _251 = fma(_249, _245, _161);
        float _253 = _251 * _239;
        float _255 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _255;
    }
    float _257 = _221;
    bool _259 = !_173;
    if (!_259)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _161 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _189 = _279;
    }
    float _281 = _189;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _285 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _291 = fma(_281, _175, _285);
    float _293 = fma(_281, _177, _287);
    float _295 = fma(_281, _179, _289);
    float _297 = fma(_291, _163, _181);
    float _299 = fma(_293, _163, _183);
    float _301 = fma(_295, _163, _185);
    bool _303 = !_283;
    float _321;
    if (!_303)
    {
        float _305 = in.m_56.x;
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _305 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_105);
        float _327 = 1.0 / _325;
        float _329 = _139 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _331 + _333;
    float _337 = in.m_54.x;
    float _339 = in.m_54.y;
    bool _341 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _343 = isnan(_331);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _353;
    bool _357 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _359 = isnan(_331);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = 1.0 / _355;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _381 = _367 * _371;
    float _383 = -_367;
    float _385 = _383 + 1.0;
    float _387 = _335 * _377;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _389;
    float _393 = fma(_375, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = _393 * _381;
    float _399 = _395 * _381;
    float _401 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _403 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].x, _401);
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[144].y, _403);
    float _409 = _405 * _337;
    float _411 = _407 * _339;
    bool _413 = !_379;
    float _431;
    if (!_413)
    {
        float _415 = in.m_56.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_105);
        float _437 = 1.0 / _435;
        float _439 = _139 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _445 = _441 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _451 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _453 = isnan(_441);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _471 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _473 = isnan(_441);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _449;
    float _485 = -_461;
    float _487 = _485 + 1.0;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _489;
    bool _493 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _495 = isnan(_441);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = _481 * _487;
    float _507 = -_481;
    float _509 = _507 + 1.0;
    bool _511 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _513 = 1.0 / _465;
    float _515 = _503 * _509;
    float _517 = -_503;
    float _519 = _517 + 1.0;
    float _521 = 1.0 / _469;
    float _523 = _491 * _483;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _529 = fma(_523, _445, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = _527 * _513;
    bool _533 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _535 = isnan(_441);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = _441 + _549;
    float _553 = _529 * _515;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _557 = _441 + _555;
    float _559 = -_543;
    float _561 = _559 + 1.0;
    float _563 = fma(_531, _551, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _565 = _547 * _521;
    float _567 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[115].x, _553);
    float _569 = _461 * _561;
    float _571 = fma(_565, _557, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _573 = fma(_563, _505, _567);
    float _575 = fma(_571, _569, _573);
    float _577 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[118].x, _575);
    float _579 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.w = _579;
    bool _581 = !_511;
    float _599;
    if (!_581)
    {
        float _583 = in.m_56.x;
        float _585 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _587 = _583 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _589 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _591 = _589 * _585;
        float _593 = floor(_591);
        float _595 = -_593;
        float _597 = _591 + _595;
        _599 = _597;
        _601 = true;
    }
    else
    {
        float _603 = float(_105);
        float _605 = 1.0 / _603;
        float _607 = _139 * _605;
        _599 = _607;
    }
    _601 = false;
    float _609 = _599;
    float _611 = in.m_56.w;
    float _613 = in.m_60.x;
    float _615 = in.m_60.y;
    float _617 = in.m_60.z;
    float _619 = in.m_60.w;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _627 = _625 != 0;
    float _629 = in.m_62.x;
    float _631 = in.m_62.y;
    float _633 = in.m_62.z;
    float _635 = in.m_62.w;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _641 = in.m_64.x;
    float _643 = in.m_64.y;
    float _645 = in.m_64.z;
    float _647 = in.m_64.w;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _653 = 1.0 / _639;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _657 = _655 != 0;
    float _659 = 0.0;
    float _661 = _609;
    if (_623)
    {
        float _663 = in.m_56.x;
        _659 = _663;
    }
    float _665 = _659;
    float _667 = 0.0;
    if (_627)
    {
        float _669 = in.m_56.w;
        _667 = _669;
    }
    float _671 = _667;
    bool _673 = _611 > 0.5;
    float _675 = 1.0 / _651;
    bool _677 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _679 = isnan(_609);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = _299 * _615;
    float _691 = _299 * _631;
    float _693 = fma(_297, _613, _689);
    float _695 = fma(_297, _629, _691);
    float _697 = _299 * _643;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _699;
    float _703 = fma(_301, _633, _695);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _709 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _711 = isnan(_609);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = fma(_297, _641, _697);
    float _723 = fma(_301, _617, _693);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _729 = _701 * _653;
    float _731 = _707 * _675;
    float _733 = fma(_301, _645, _721);
    bool _735 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _737 = isnan(_609);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _707;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _751 = _653;
    float _753 = _675;
    int _755 = as_type<int>(_635);
    float _757 = _647;
    float _759 = _731;
    if (_623)
    {
        float _761 = _665 * 3.1415927410125732421875;
        _747 = _761;
    }
    float _763 = _747;
    float _765 = -_719;
    float _767 = _765 + 1.0;
    float _769 = 1.0 / _727;
    if (_627)
    {
        float _771 = _671 * 3.1415927410125732421875;
        _749 = _771;
    }
    float _773 = _749;
    if (_623)
    {
        float _775 = _763 * 0.15915493667125701904296875;
        _751 = _775;
    }
    float _777 = _751;
    float _779 = _745 * _767;
    float _781 = _767;
    float _783 = _763;
    if (_657)
    {
        float _785 = in.m_56.x;
        float _787 = in.m_56.y;
        _781 = _785;
        _783 = _787;
    }
    float _789 = _781;
    float _791 = _783;
    if (_627)
    {
        float _793 = _773 * 0.15915493667125701904296875;
        _753 = _793;
    }
    float _795 = _753;
    bool _797 = _609 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _799 = isnan(_609);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = _777;
    if (_623)
    {
        float _811 = _777 * 6.283185482025146484375;
        float _813 = sin(_811);
        _809 = _813;
    }
    float _815 = _809;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _817;
    float _821 = -_745;
    float _823 = _821 + 1.0;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _827 = _609 + _825;
    float _829 = -_807;
    float _831 = _829 + 1.0;
    float _833 = _723 + _619;
    float _835 = _807 * _823;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _839 = _609 + _837;
    float _841 = _795;
    if (_627)
    {
        float _843 = _795 * 6.283185482025146484375;
        float _845 = sin(_843);
        _841 = _845;
    }
    float _847 = _841;
    float _849 = _819 * _769;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _853 = _609 + _851;
    float _855 = _687 * _831;
    float _857 = -_687;
    float _859 = _857 + 1.0;
    float _861 = fma(_731, _839, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _863 = fma(_729, _853, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _865 = _733 + _647;
    float _867 = _703 + _635;
    float _869 = fma(_849, _827, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _871 = _863 * _855;
    float _873 = _853;
    float _875 = _867;
    if (_623)
    {
        bool _877 = _815 > 0.5;
        _223 = _877;
    }
    bool _879 = _223;
    if (_657)
    {
        _755 = 0;
    }
    int _881 = _755;
    float _883 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[131].x, _871);
    float _885 = _789;
    float _887 = _791;
    int _889 = _881;
    if (_657)
    {
        _661 = _789;
    }
    float _891 = _661;
    float _893 = _891;
    if (_627)
    {
        bool _895 = _847 > 0.5;
        _225 = _895;
    }
    bool _897 = _225;
    if (_657)
    {
        _757 = _791;
    }
    float _899 = _757;
    float _901 = _899;
    if (!_657)
    {
        float _903 = in.m_56.x;
        float _905 = in.m_56.y;
        float _907 = _903 * 3.1415927410125732421875;
        float _909 = _907 * 0.15915493667125701904296875;
        float _911 = _905 * 3.1415927410125732421875;
        float _913 = _911 * 0.15915493667125701904296875;
        float _915 = _909 * 6.283185482025146484375;
        float _917 = sin(_915);
        float _919 = _913 * 6.283185482025146484375;
        float _921 = sin(_919);
        _885 = _903;
        _887 = _905;
        _889 = 1;
        _893 = _917;
        _901 = _921;
    }
    float _923 = _885;
    float _925 = _887;
    int _927 = _889;
    float _929 = _893;
    float _931 = _901;
    float _933 = in.m_56.z;
    if (!_627)
    {
        _759 = _213;
    }
    float _935 = _759;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _939 = _935;
    if (_627)
    {
        float _941 = -_213;
        float _943 = _897 ? _941 : _213;
        _939 = _943;
    }
    float _945 = _939;
    float _947 = _923 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _949 = _923 > 0.5;
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _953 = _925 > 0.5;
    float _955 = -_937;
    float _957 = fma(_947, 2.0, _955);
    if (!_623)
    {
        _873 = _217;
    }
    float _959 = _873;
    float _961 = fma(_861, _835, _883);
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _965 = _963 != 0;
    float _967 = -_139;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[76].x, _957);
    float _971 = _959;
    if (_623)
    {
        float _973 = -_217;
        float _975 = _879 ? _973 : _217;
        _971 = _975;
    }
    float _977 = _971;
    float _979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _981 = -_213;
    int _983 = _949 ? as_type<int>(_981) : as_type<int>(_213);
    float _985 = fma(_869, _779, _961);
    int _987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _989 = _987 != 0;
    float _991 = -_217;
    int _993 = _953 ? as_type<int>(_991) : as_type<int>(_217);
    float _995 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[134].x, _985);
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _999 = _927 != 1;
    int _1001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1003 = _1001 != 0;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1009 = _1007 != 0;
    float _1011 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1005);
    bool _1013 = !_965;
    float _1015 = _1013 ? _213 : as_type<float>(_983);
    float _1017 = _925 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1019 = !_989;
    float _1021 = _1019 ? _217 : as_type<float>(_993);
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1033 = _1031 != 0;
    float _1035 = _929 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1041 = _931 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1043 = -_1023;
    float _1045 = fma(_1035, 2.0, _1043);
    float _1047 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1037);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1051 = fma(_1041, -2.0, _1039);
    float _1053 = _951 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1055 = -_139;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1045);
    float _1059 = _945 + 0.5;
    float _1061 = fma(_1017, -2.0, _1049);
    float _1063 = _1035;
    float _1065 = _1017;
    float _1067 = _951;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_999)
    {
        _1063 = _933;
    }
    float _1071 = _1063;
    float _1073 = fma(_1053, _1059, _1057);
    float _1075 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1051);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1079 = _1071;
    float _1081 = _1077;
    if (!_999)
    {
        _1065 = _1071;
    }
    float _1083 = _1065;
    float _1085 = _979 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1087 = _979;
    float _1089 = _1083;
    if (_999)
    {
        _1079 = _933;
    }
    float _1091 = _1079;
    float _1093 = _977 + (-0.5);
    float _1095 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1077);
    if (!_999)
    {
        _1067 = _925;
    }
    float _1097 = _1067;
    float _1099 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1061);
    float _1101 = _1097;
    if (!_999)
    {
        _1069 = _925;
    }
    float _1103 = _1069;
    float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1107 = _1103;
    if (_999)
    {
        _1101 = _923;
    }
    float _1109 = _1101;
    if (_999)
    {
        _1107 = _923;
    }
    float _1111 = _1107;
    if (!_999)
    {
        _1081 = _923;
    }
    float _1113 = _1081;
    float _1115 = -_1085;
    float _1117 = -_1075;
    float _1119 = fma(_1115, _1093, _1117);
    float _1121 = _1113;
    if (_999)
    {
        _1121 = _1091;
    }
    float _1123 = _1121;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_999)
    {
        _1087 = _1083;
    }
    float _1129 = _1087;
    float _1131 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1125);
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1135 = _833 + _1133;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1139 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1127);
    float _1141 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1131);
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1145 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1137);
    float _1147 = _1129;
    if (_999)
    {
        _1147 = _925;
    }
    float _1149 = _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1153 = _865 + _1151;
    if (_999)
    {
        _1089 = _925;
    }
    float _1155 = _1089;
    float _1157 = _997 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1159 = _1141 * (-0.15915493667125701904296875);
    float _1161 = _1015 + 0.5;
    float _1163 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1143);
    float _1165 = _1159 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = fma(_1157, _1161, _969);
    float _1171 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1173 = _1021 + (-0.5);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1177 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1181 = _867 + _1179;
    float _1183 = -_1171;
    float _1185 = -_1099;
    float _1187 = fma(_1183, _1173, _1185);
    float _1189 = _1159 * 6.283185482025146484375;
    float _1191 = cos(_1189);
    float _1193 = -_217;
    int _1195 = _673 ? as_type<int>(_1193) : as_type<int>(_217);
    float _1197 = -_1175;
    float _1199 = fma(_1177, 2.0, _1197);
    bool _1201 = _1091 > 0.5;
    float _1203 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1163);
    float _1205 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1139);
    bool _1207 = !_1009;
    float _1209 = _1207 ? _217 : as_type<float>(_1195);
    float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1215 = -_213;
    int _1217 = _1201 ? as_type<int>(_1215) : as_type<int>(_213);
    float _1219 = _1209 * _1167;
    bool _1221 = _1203 >= 0.0;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1225 = !_1003;
    float _1227 = _1225 ? _213 : as_type<float>(_1217);
    float _1229 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1231 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1213);
    float _1233 = _1209 * _1191;
    float _1235 = -_139;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1199);
    float _1239 = fma(_1229, -2.0, _1223);
    float _1241 = -_1219;
    float _1243 = fma(_1227, _1191, _1241);
    float _1245 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1047);
    float _1247 = -_213;
    int _1249 = _953 ? as_type<int>(_1247) : as_type<int>(_213);
    float _1251 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1253 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1145);
    float _1255 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1095);
    float _1257 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1011);
    float _1259 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1231);
    float _1261 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1239);
    float _1263 = _1243 + 0.5;
    float _1265 = fma(_1227, _1167, _1233);
    bool _1267 = !_1029;
    float _1269 = _1267 ? _213 : as_type<float>(_1249);
    float _1271 = -_1257;
    float _1273 = _1271 + 1.0;
    float _1275 = fma(_1251, _1263, _1237);
    float _1277 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1279 = _1265 + (-0.5);
    float _1281 = _1269 + 0.5;
    float _1283 = -_217;
    int _1285 = _1201 ? as_type<int>(_1283) : as_type<int>(_217);
    float _1287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1289 = -_1277;
    float _1291 = -_1261;
    float _1293 = fma(_1289, _1279, _1291);
    float _1295 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1297 = _1135 * _1135;
    float _1299 = -_1273;
    float _1301 = fma(_1299, _945, _1073);
    float _1303 = -_1245;
    float _1305 = _1303 + 1.0;
    float _1307 = -_1253;
    float _1309 = _1307 + 1.0;
    float _1311 = fma(_1153, _1153, _1297);
    float _1313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1315 = fma(_1305, _977, _1119);
    bool _1317 = !_1033;
    float _1319 = _1317 ? _217 : as_type<float>(_1285);
    float _1321 = -_1255;
    float _1323 = _1321 + 1.0;
    float _1325 = fma(_1181, _1181, _1311);
    float _1327 = fma(_1021, _1309, _1187);
    float _1329 = _1311;
    if (_1221)
    {
        _1329 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1331 = _1329;
    float _1333 = -_1319;
    float _1335 = _1333 + 0.5;
    float _1337 = rsqrt(_1325);
    float _1339 = -_1323;
    float _1341 = fma(_1015, _1339, _1169);
    float _1343 = -_1205;
    float _1345 = _1343 + 1.0;
    float _1347 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1349 = -_1259;
    float _1351 = _1349 + 1.0;
    float _1353 = _995 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1355 = _1295 * _1287;
    float _1357 = _1347 * _1313;
    int _1359 = as_type<int>(_1331);
    if (_1221)
    {
        float _1361 = _1331 * 5.0;
        _1359 = as_type<int>(_1361);
    }
    int _1363 = _1359;
    float _1365 = -_1345;
    float _1367 = fma(_1243, _1365, _1275);
    float _1369 = fma(_1265, _1351, _1293);
    out.m_66.x = _1301;
    out.m_66.y = _1315;
    out.m_68.w = _1353;
    float _1371 = _1135 * _1337;
    float _1373 = _1153 * _1337;
    if (_1221)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4656 = as_type<float>(_1363);
        out.gl_Position.z = _4656;
    }
    out.m_70.x = _1355;
    out.m_70.y = _1357;
    out.m_72.x = _1341;
    out.m_72.y = _1327;
    out.m_72.z = _1367;
    out.m_72.w = _1369;
    if (_1221)
    {
        out.m_47.x = 0.0;
    }
    if (_1221)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1375 = -_1371;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[18].w, _833);
    float _1379 = _1181 * _1337;
    float _1381 = -_1373;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _1385 = -_1371;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1135);
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1391 = _1377 + _1389;
    float _1393 = -_1379;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[18].w, _867);
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1383 + _1397;
    float _1401 = -_1373;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1153);
    float _1405 = _1391 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1409 = _1395 + _1407;
    float _1411 = _1387 * _1387;
    float _1413 = -_1379;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1181);
    float _1417 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1405);
    float _1419 = fma(_1403, _1403, _1411);
    float _1421 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1417);
    float _1423 = fma(_1415, _1415, _1419);
    bool _1425 = _1421 >= 0.0;
    float _1427 = sqrt(_1423);
    float _1429 = _1405;
    float _1431 = _1379;
    float _1433 = _1391;
    float _1435 = _1383;
    float _1437 = _1395;
    if (_1425)
    {
        _1429 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1439 = _1429;
    int _1441 = as_type<int>(_1439);
    if (_1425)
    {
        out.m_47.x = 0.0;
    }
    if (_1425)
    {
        float _1443 = _1439 * 5.0;
        _1441 = as_type<int>(_1443);
    }
    int _1445 = _1441;
    float _1447 = _1337 * _1427;
    if (_1425)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4804 = as_type<float>(_1445);
        out.gl_Position.z = _4804;
    }
    if (_1425)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1449 = _411 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1451 = _409 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1453 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _1455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _1457 = _1447 * _1449;
    float _1459 = _1447 * _1451;
    float _1461 = _1453 * _1457;
    float _1463 = _1455 * _1459;
    float _1465 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1467 = _1465 * 0.5;
    bool _1469 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1471 = isnan(0.5);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1477 = _1473 || _1475;
    float _1479 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1481 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1483 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1485 = isnan(0.5);
    bool _1487 = _1483 || _1485;
    bool _1489 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1491 = _1487 || _1489;
    float _1493 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1479);
    float _1495 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1481);
    float _1497 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1499 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1493);
    float _1501 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1495);
    float _1503 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1497);
    float _1505 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1507 = _1501 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1509 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1503);
    float _1511 = _867 + _1505;
    float _1513 = _865 + _1507;
    float _1515 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1517 = _1377 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1521 = _1511 + _1519;
    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1525 = _1513 + _1523;
    float _1527 = 1.0 / _1515;
    float _1529 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1517);
    float _1531 = _1521 * _1521;
    float _1533 = fma(_1395, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1529);
    float _1535 = fma(_1525, _1525, _1531);
    float _1537 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1539 = sqrt(_1535);
    float _1541 = _1537 + _1515;
    float _1543 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1545 = _1541 * _1527;
    float _1547 = _1545 * 0.5;
    float _1549 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1543);
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1553 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1551);
    float _1555 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1549);
    bool _1557 = _1539 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1559 = 1.0 / _1553;
    float _1561 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1563 = _833 + _1561;
    float _1565 = _1515;
    float _1567 = _1467;
    float _1569 = _1547;
    float _1571 = _1561;
    float _1573 = _1513;
    if (!_1557)
    {
        _1565 = _1513;
    }
    float _1575 = _1565;
    float _1577 = _1575;
    if (!_1557)
    {
        _1567 = _1511;
    }
    float _1579 = _1567;
    float _1581 = _1579;
    if (!_1557)
    {
        _1569 = _1563;
    }
    float _1583 = _1569;
    bool _1585 = !_1557;
    float _1587 = _1583;
    if (!_1585)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1593 = _1539 + _1591;
        float _1595 = rsqrt(_1535);
        float _1597 = _1593 * _1589;
        float _1599 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = _1597 * 0.15915493667125701904296875;
        float _1603 = _1601 * 6.283185482025146484375;
        float _1605 = cos(_1603);
        float _1607 = _1601 * 6.283185482025146484375;
        float _1609 = sin(_1607);
        float _1611 = _1605 + (-1.0);
        float _1613 = fma(_1609, _1599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1615 = _1611 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1617 = _1595 * _1613;
        float _1619 = fma(_1563, _1605, _1615);
        float _1621 = fma(_1525, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1623 = fma(_1521, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1577 = _1621;
        _1581 = _1623;
        _1587 = _1619;
        _1571 = _1617;
    }
    float _1625 = _1577;
    float _1627 = _1581;
    float _1629 = _1587;
    float _1631 = _1571;
    float _1633 = -_1373;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1625);
    float _1637 = -_1379;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1627);
    float _1641 = -_1371;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1629);
    float _1645 = _1631;
    float _1647 = _1643;
    float _1649 = _1639;
    if (_1491)
    {
        _1645 = 1.0;
    }
    float _1651 = _1645;
    float _1653 = _1651;
    if (_1477)
    {
        _1431 = _1635;
    }
    float _1655 = _1431;
    float _1657 = _1655;
    if (!_1477)
    {
        float _1659 = _1391 * _1391;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = -_867;
        float _1665 = _1663 + _1627;
        float _1667 = -_865;
        float _1669 = _1667 + _1625;
        float _1671 = fma(_1399, _1399, _1659);
        float _1673 = -_833;
        float _1675 = _1673 + _1629;
        float _1677 = fma(_1409, _1409, _1671);
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1681 = sqrt(_1677);
        float _1683 = 1.0 / _1447;
        float _1685 = precise::min(_1681, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1687 = _1685 * _1661;
        float _1689 = _1679 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1691 = _1687 * _1683;
        float _1693 = _1689 * _1691;
        float _1695 = _1665 * _1691;
        float _1697 = fma(_1669, _1693, _1383);
        float _1699 = fma(_1675, _1693, _1377);
        float _1701 = fma(_1689, _1695, _1395);
        _1433 = _1689;
        _1647 = _1699;
        _1657 = _1697;
        _1649 = _1701;
        _875 = _1695;
    }
    float _1703 = _1433;
    float _1705 = _1647;
    float _1707 = _1657;
    float _1709 = _1649;
    float _1711 = _875;
    float _1713 = _1711;
    float _1715 = _1703;
    if (_1491)
    {
        _1713 = 1.0;
    }
    float _1717 = _1713;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1721 = _1559 * _1719;
    float _1723 = _1717;
    if (!_1491)
    {
        float _1725 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1727 = _1725 * 0.15915493667125701904296875;
        float _1729 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1731 = _1727 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        float _1735 = _1729 * 0.15915493667125701904296875;
        float _1737 = _1727 * 6.283185482025146484375;
        float _1739 = sin(_1737);
        float _1741 = 1.0 / _1733;
        float _1743 = _1735 * 6.283185482025146484375;
        float _1745 = cos(_1743);
        float _1747 = _1739 * _1741;
        float _1749 = _1735 * 6.283185482025146484375;
        float _1751 = sin(_1749);
        float _1753 = _1745 * _1747;
        float _1755 = 1.0 / _1753;
        float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1759 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1757;
        float _1761 = 1.0 / _1759;
        float _1763 = _1751 * _1755;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1767 = fma(_1721, _1763, _1765);
        float _1769 = _1767 * _1761;
        float _1771 = precise::clamp(_1769, 0.0, 1.0);
        _1715 = _1727;
        _1435 = _1735;
        _1653 = _1771;
    }
    float _1773 = _1715;
    float _1775 = _1435;
    float _1777 = _1653;
    float _1779 = _1773;
    float _1781 = _1775;
    if (!_1491)
    {
        float _1783 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1785 = _1783 * 0.15915493667125701904296875;
        float _1787 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1789 = _1785 * 6.283185482025146484375;
        float _1791 = cos(_1789);
        float _1793 = _1787 * 0.15915493667125701904296875;
        float _1795 = _1785 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = 1.0 / _1791;
        float _1801 = _1793 * 6.283185482025146484375;
        float _1803 = cos(_1801);
        float _1805 = _1797 * _1799;
        float _1807 = _1793 * 6.283185482025146484375;
        float _1809 = sin(_1807);
        float _1811 = _1803 * _1805;
        float _1813 = 1.0 / _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1817 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1815;
        float _1819 = 1.0 / _1817;
        float _1821 = _1809 * _1813;
        float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1825 = fma(_1721, _1821, _1823);
        float _1827 = _1825 * _1819;
        float _1829 = precise::clamp(_1827, 0.0, 1.0);
        float _1831 = -_1829;
        float _1833 = _1831 + 1.0;
        _1779 = _1799;
        _1781 = _1811;
        _1723 = _1833;
    }
    float _1835 = _1779;
    float _1837 = _1781;
    float _1839 = _1723;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1843 = _1705 + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1847 = _1707 + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1851 = _1709 + _1849;
    float _1853 = _1843 * _1843;
    float _1855 = fma(_1847, _1847, _1853);
    float _1857 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1859 = fma(_1851, _1851, _1855);
    float _1861 = rsqrt(_1859);
    float _1863 = sqrt(_1859);
    float _1865 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1867 = _1847 * _1865;
    float _1869 = _1851 * _1865;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 * _1869;
    float _1875 = _1871 + _1873;
    float _1877 = sqrt(_1875);
    bool _1879 = _1877 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1883 = _1877 + _1881;
    float _1885 = _1835;
    float _1887 = _1883;
    float _1889 = _1843;
    float _1891 = _1867;
    if (_1879)
    {
        float _1893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1893;
    }
    float _1895 = _1885;
    float _1897 = _1895;
    if (_1879)
    {
        float _1899 = _1883 * _1895;
        _1887 = _1899;
    }
    float _1901 = _1887;
    if (_1879)
    {
        float _1903 = rsqrt(_1875);
        _1897 = _1903;
    }
    float _1905 = _1897;
    float _1907 = _1905;
    if (_1879)
    {
        float _1909 = _1901 * 0.15915493667125701904296875;
        _1437 = _1909;
    }
    float _1911 = _1437;
    float _1913 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1915 = _1851;
    if (_1879)
    {
        float _1917 = _1911 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = precise::max(0.0, _1913);
    float _1925 = _1837;
    float _1927 = _1923;
    if (_1879)
    {
        float _1929 = _1911 * 6.283185482025146484375;
        float _1931 = cos(_1929);
        _1925 = _1931;
    }
    float _1933 = _1925;
    float _1935 = -_1865;
    float _1937 = -_1923;
    float _1939 = fma(_1843, _1935, _1937);
    float _1941 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1879)
    {
        float _1943 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1889 = _1943;
    }
    float _1945 = _1889;
    float _1947 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1941);
    float _1949 = _1921;
    float _1951 = _1945;
    if (_1879)
    {
        float _1953 = fma(_1921, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = _1955;
    if (!_1879)
    {
        _1951 = _1939;
    }
    float _1959 = _1951;
    float _1961 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1947);
    float _1963 = _1959;
    if (_1879)
    {
        float _1965 = _1905 * _1955;
        _1573 = _1965;
    }
    float _1967 = _1573;
    if (!_1879)
    {
        _1957 = _1871;
    }
    float _1969 = _1957;
    float _1971 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1973 = _1969;
    float _1975 = _1933;
    if (_1879)
    {
        float _1977 = _1933 + (-1.0);
        _1927 = _1977;
    }
    float _1979 = _1927;
    float _1981 = _1979;
    if (_1879)
    {
        float _1983 = _1867 * _1967;
        _1891 = _1983;
    }
    float _1985 = _1891;
    if (_1879)
    {
        float _1987 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1907 = _1987;
    }
    float _1989 = _1907;
    if (!_1879)
    {
        _1981 = _1869;
    }
    float _1991 = _1981;
    float _1993 = _1991;
    if (_1879)
    {
        float _1995 = _1869 * _1967;
        _1993 = _1995;
    }
    float _1997 = _1993;
    if (_1879)
    {
        float _1999 = _1985 * _1985;
        _1973 = _1999;
    }
    float _2001 = _1973;
    if (_1879)
    {
        float _2003 = fma(_1939, _1933, _1989);
        _1963 = _2003;
    }
    float _2005 = _1963;
    if (!_1879)
    {
        _1975 = _1873;
    }
    float _2007 = _1975;
    float _2009 = _2007;
    if (_1879)
    {
        float _2011 = _1997 * _1997;
        _2009 = _2011;
    }
    float _2013 = _2009;
    float _2015 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2017 = fma(_2005, _2005, _2001);
    float _2019 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2015);
    float _2021 = _2017 + _2013;
    float _2023 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2027 = fma(_1863, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2025);
    float _2029 = precise::clamp(_2027, 0.0, 1.0);
    float _2031 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2019);
    float _2033 = rsqrt(_2021);
    float _2035 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2037 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2023);
    float _2039 = -_2029;
    float _2041 = _2039 + 1.0;
    float _2043 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2045 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2035);
    float _2047 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2037);
    float _2049 = abs(_2041);
    float _2051 = log2(_2049);
    float _2053 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2045);
    float _2055 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2057 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2059 = _2053 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2061 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2063 = -_2057;
    float _2065 = fma(_2063, _1857, 1.0);
    float _2067 = _2033 * _1985;
    float _2069 = _2033 * _2005;
    float _2071 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2061);
    float _2073 = _2033 * _1997;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2077 = log2(_2065);
    float _2079 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2071);
    float _2081 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2083 = -_2075;
    float _2085 = fma(_2069, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2083);
    float _2087 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2089 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2079);
    float _2091 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2081);
    float _2093 = -_2073;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2085);
    float _2097 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2099 = 1.0 / _2089;
    float _2101 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2091);
    float _2103 = fma(_2095, -0.5, 0.5);
    float _2105 = fma(_2095, 0.5, 0.5);
    float _2107 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2097);
    float _2109 = _2069 + 1.0;
    float _2111 = _2077 * 0.693147182464599609375;
    float _2113 = exp2(_2087);
    float _2115 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2107);
    float _2117 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2119 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2115);
    float _2121 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2101);
    float _2123 = sqrt(_2103);
    float _2125 = fma(_2105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2127 = _2119 * _2099;
    float _2129 = fma(_2105, _2125, -0.212114393711090087890625);
    float _2131 = fma(_2127, 0.5, 0.5);
    float _2133 = -_2069;
    float _2135 = fma(_2113, _2109, _2133);
    float _2137 = fma(_2105, _2129, 1.570728778839111328125);
    float _2139 = _2121 * _2099;
    float _2141 = fma(_2135, 0.5, 0.5);
    float _2143 = fma(_2139, -0.5, 0.5);
    float _2145 = _2123 * 0.636619746685028076171875;
    float _2147 = -_2137;
    float _2149 = fma(_2145, _2147, 1.0);
    float3 _5912 = float3(_2131, _2143, _2117);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5912, float3(0.0), isnan(_5912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5912, float3(0.0), isnan(_5912)), level(0.0)).x;
    float3 _5923 = float3(_2131, _2143, _2117);
    float4 _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5923, float3(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5923, float3(0.0), isnan(_5923)), level(0.0)).xyzw;
    float _2156 = _2154.x;
    float _2158 = _2154.y;
    float _2160 = _2154.z;
    float _2162 = _2154.w;
    float2 _5940 = float2(_2149, _2141);
    float3 _2166 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5940, float2(0.0), isnan(_5940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5940, float2(0.0), isnan(_5940)), level(0.0)).xyz;
    float _2168 = _2166.x;
    float _2170 = _2166.y;
    float _2172 = _2166.z;
    float _2174 = _2055 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2176 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2178 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2180 = fma(_2059, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2174);
    float _2182 = fma(_2176, _2176, 1.0);
    float _2184 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2180);
    float _2186 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2188 = rsqrt(_2182);
    bool _2190 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2192 = isnan(_1863);
    bool _2194 = _2190 || _2192;
    bool _2196 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2198 = _2194 || _2196;
    out.m_74.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_74.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_74.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _2200 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2184);
    float _2202 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2204 = exp2(_2186);
    out.gl_Position.x = _2119;
    out.gl_Position.y = _2121;
    out.gl_Position.z = _2200;
    out.gl_Position.w = _2089;
    float _2206 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2208 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2210 = _2176 * _2188;
    float _2212 = _2089 * 0.5;
    float _2214 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2206);
    float _2216 = _2119 + _2089;
    float _2218 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2220 = _2210 * _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2224 = _2210 * _2222;
    float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2228 = _2210 * _2226;
    float _2230 = fma(_2121, -0.5, _2212);
    float _2232 = -_2204;
    float _2234 = _2232 + 1.0;
    float _2236 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2220);
    float _2238 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2224);
    float _2240 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2228);
    float _2242 = _2234 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2244 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2208);
    float _2246 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2202);
    float _2248 = _2200 + _2089;
    out.m_76.x = _2236;
    out.m_76.y = _2238;
    out.m_76.z = _2240;
    float _2250 = _2216 * 0.5;
    float _2252 = _2248 * 0.5;
    float _2254 = _2121;
    float _2256 = _2200;
    float _2258 = _2119;
    float _2260 = _2214;
    float _2262 = _2250;
    if (!_2198)
    {
        _2254 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2264 = _2254;
    float _2266 = _2264;
    float _2268 = _2264;
    if (!_2198)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2270 = _2256;
    out.m_78.x = _2250;
    out.m_78.y = _2230;
    out.m_78.z = _2252;
    out.m_78.w = _2089;
    float _2272 = _2270;
    float _2274 = _2270;
    if (!_2198)
    {
        _2258 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2276 = _2258;
    float _2278 = _2214 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2280 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2282 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2284 = _1777 * _1839;
    float _2286 = _2284;
    float _2288 = _2276;
    float _2290 = _2276;
    if (!_2198)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2292 = _2260;
    out.m_80.x = _2278;
    out.m_80.y = _2280;
    out.m_80.z = _2282;
    float _2294 = _2284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2296 = _2292;
    float _2298 = _2292;
    if (!_2198)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2300 = _2262;
    float _2302 = _2300;
    float _2304 = _2300;
    if (!_2198)
    {
        _2286 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2306 = _2286;
    float _2308 = _2242 * _2151;
    float _2310 = -_2242;
    float _2312 = _2310 + 1.0;
    float _2314 = _2162 * _2308;
    float _2316 = _2172 * _2308;
    float _2318 = _2162 * _2312;
    float _2320 = fma(_2168, _2314, _2156);
    float _2322 = fma(_2170, _2314, _2158);
    float _2324 = fma(_2162, _2316, _2160);
    out.m_82.x = _2320;
    out.m_82.y = _2322;
    out.m_82.z = _2324;
    out.m_82.w = _2318;
    bool _2326 = !_2198;
    float _2328 = _2306;
    float _2330 = _2306;
    if (!_2326)
    {
        bool _2332 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2334 = isnan(_1863);
        bool _2336 = _2332 || _2334;
        bool _2338 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2340 = _2336 || _2338;
        if (!_2340)
        {
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2344 = _1863 + _2342;
            float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2348 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2346;
            float _2350 = 1.0 / _2348;
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2354 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2356 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2358 = _2356 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2372 = _2344 * _2350;
            float _2374 = precise::clamp(_2372, 0.0, 1.0);
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2380 = fma(_2374, _2354, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2382 = fma(_2374, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2384 = fma(_2374, _2358, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2386 = fma(_2374, _2362, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2388 = fma(_2374, _2366, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2390 = fma(_2374, _2370, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2304 = _2380;
            _2298 = _2388;
            _2268 = _2382;
            _2290 = _2386;
            _2274 = _2384;
            _2330 = _2390;
            _2392 = true;
        }
        else
        {
            bool _2394 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2396 = isnan(_1863);
            bool _2398 = _2394 || _2396;
            bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2402 = _2398 || _2400;
            if (!_2402)
            {
                _2266 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2404 = _2266;
            _2268 = _2404;
            if (!_2402)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2406 = _2302;
            _2304 = _2406;
            if (!_2402)
            {
                _2272 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2408 = _2272;
            _2274 = _2408;
            if (!_2402)
            {
                _2288 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2410 = _2288;
            _2290 = _2410;
            if (!_2402)
            {
                _2296 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2412 = _2296;
            _2298 = _2412;
            if (!_2402)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2414 = _2328;
            bool _2416 = !_2402;
            _2330 = _2414;
            if (!_2416)
            {
                bool _2418 = _1863 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2420 = isnan(_1863);
                bool _2422 = _2418 || _2420;
                bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2426 = _2422 || _2424;
                if (!_2426)
                {
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2430 = _1863 + _2428;
                    float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2434 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2432;
                    float _2436 = 1.0 / _2434;
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2458 = _2430 * _2436;
                    float _2460 = precise::clamp(_2458, 0.0, 1.0);
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2466 = fma(_2460, _2440, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2468 = fma(_2460, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2470 = fma(_2460, _2444, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2472 = fma(_2460, _2448, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2474 = fma(_2460, _2452, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2476 = fma(_2460, _2456, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2304 = _2466;
                    _2298 = _2474;
                    _2268 = _2468;
                    _2290 = _2472;
                    _2274 = _2470;
                    _2330 = _2476;
                    _2392 = true;
                }
                else
                {
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2298 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2268 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2290 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2274 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2392 = false;
    float _2478 = _2304;
    float _2480 = _2298;
    float _2482 = _2268;
    float _2484 = _2290;
    float _2486 = _2274;
    float _2488 = _2330;
    float _2490 = _2294 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2492 = fma(_2280, -0.5, 0.5);
    float _2494 = precise::clamp(_2492, 0.0, 1.0);
    float _2496 = -_2478;
    float _2498 = _2496 + _2480;
    float _2500 = -_2482;
    float _2502 = _2500 + _2484;
    out.m_47.x = _2490;
    float _2504 = -_2486;
    float _2506 = _2504 + _2488;
    float _2508 = fma(_2494, _2498, _2478);
    float _2510 = fma(_2494, _2502, _2482);
    bool _2512 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2514 = _2508 * 0.586610972881317138671875;
    float _2516 = fma(_2494, _2506, _2486);
    out.m_84.x = 0.0;
    bool _2518 = _1777 > 0.0;
    bool _2520 = isnan(_1777);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan(0.0);
    bool _2526 = _2522 || _2524;
    float _2528 = fma(_2510, 0.298911988735198974609375, _2514);
    bool _2530 = _1839 <= 0.0;
    bool _2532 = !_2526;
    bool _2534 = _2530 || _2532;
    float _2536 = fma(_2516, 0.114477999508380889892578125, _2528);
    float _2538 = -_2536;
    float _2540 = _2510 + _2538;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2536);
    bool _2544 = !_2512;
    if (!_2544)
    {
        float _2546 = -_1705;
        float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2550 = -_1707;
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2554 = -_1709;
        float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2558 = _2548 * _2548;
        float _2560 = fma(_2552, _2552, _2558);
        float _2562 = fma(_2556, _2556, _2560);
        float _2564 = sqrt(_2562);
        float _2566 = rsqrt(_2562);
        float _2568 = -_2564;
        float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2572 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2574 = precise::clamp(_2572, 0.0, 1.0);
        float _2576 = _2552 * _2566;
        float _2578 = _2548 * _2566;
        float _2580 = abs(_2574);
        float _2582 = log2(_2580);
        float _2584 = _2556 * _2566;
        float _2586 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2588 = _2280 * _2578;
        float _2590 = -_2578;
        float _2592 = -_2586;
        float _2594 = fma(_2590, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2592);
        float _2596 = fma(_2278, _2576, _2588);
        float _2598 = -_2584;
        float _2600 = fma(_2598, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2594);
        float _2602 = fma(_2282, _2584, _2596);
        float _2604 = precise::clamp(_2602, 0.0, 1.0);
        float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2608 = _2600 + _2606;
        float _2610 = _2582 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2612 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2614 = precise::clamp(_2612, 0.0, 1.0);
        float _2616 = exp2(_2610);
        float _2618 = _2616 * _2614;
        float _2620 = _2604 * _2618;
        float _2622 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        out.m_84.x = _2622;
    }
    out.m_86.x = _2542;
    if (!_2534)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2624 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2624;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

