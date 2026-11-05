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
    float4 m_53 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _431 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1231 = as_type<float>(_99);
        out.gl_Position.z = _1231;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1300 = as_type<float>(_135);
        out.gl_Position.z = _1300;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _261 = _257;
    float _279;
    if (!_259)
    {
        float _263 = in.m_51.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_83);
        float _285 = 1.0 / _283;
        float _287 = _117 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    bool _295 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_289);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_289);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_305;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _313;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _335 = _325 * _329;
    bool _337 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _339 = isnan(_289);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_325;
    float _351 = _349 + 1.0;
    out.m_53.w = _333;
    bool _353 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _355 = 1.0 / _309;
    float _357 = _347 * _351;
    float _359 = -_347;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _367 = _293 * _355;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _289 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = _371 * _331;
    float _383 = fma(_375, _367, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = fma(_379, _367, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = fma(_365, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = _383 * _357;
    float _395 = _385 * _357;
    float _397 = fma(_389, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _399 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _401 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _403 = fma(_397, _335, _399);
    float _405 = fma(_391, _335, _401);
    float _407 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].x, _403);
    float _409 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].y, _405);
    bool _411 = !_353;
    float _429;
    if (!_411)
    {
        float _413 = in.m_51.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        float _433 = float(_83);
        float _435 = 1.0 / _433;
        float _437 = _117 * _435;
        _429 = _437;
    }
    _431 = false;
    float _439 = _429;
    float _441 = as_type<float>(int(gl_VertexIndex));
    float _443 = in.m_49.x;
    float _445 = in.m_49.y;
    int _447 = as_type<int>(_441) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>(_441) & 2;
    bool _453 = _451 != 0;
    float _455 = _409 * _445;
    bool _457 = !_453;
    float _459 = _457 ? (-0.5) : 0.5;
    float _461 = _407 * _443;
    bool _463 = !_449;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _469 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _459);
    float _471 = _461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _465);
    float _475 = _467 * _469;
    float _477 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _479 = _471 * _473;
    float _481 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _483 = _475 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _485 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _487 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _489 = _475 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _491 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _483);
    float _493 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _481);
    float _495 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _497 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _489);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[26].z, _491);
    float _501 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _493);
    float _503 = _495 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _505 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[24].z, _497);
    float _507 = _499 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _509 = _501 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _511 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _513 = _505 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _515 = _503 + _507;
    float _517 = _475 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _519 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
    float _521 = _509 + _513;
    float _523 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _525 = _515 + _523;
    float _527 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _517);
    float _529 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
    float _531 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _533 = _521 + _531;
    float _535 = _525 * _525;
    float _537 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[25].z, _527);
    float _539 = _529 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _541 = fma(_533, _533, _535);
    float _543 = _537 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = sqrt(_541);
    float _547 = _539 + _543;
    bool _549 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _551 = _539;
    float _553 = _535;
    float _555 = _521;
    if (!_549)
    {
        _261 = _521;
    }
    float _557 = _261;
    float _559 = _557;
    if (!_549)
    {
        _551 = _515;
    }
    float _561 = _551;
    float _563 = _561;
    if (!_549)
    {
        _553 = _547;
    }
    float _565 = _553;
    bool _567 = !_549;
    float _569 = _565;
    if (!_567)
    {
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _575 = _545 + _573;
        float _577 = _547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _579 = _575 * _571;
        float _581 = rsqrt(_541);
        float _583 = _579 * 0.15915493667125701904296875;
        float _585 = _583 * 6.283185482025146484375;
        float _587 = cos(_585);
        float _589 = _583 * 6.283185482025146484375;
        float _591 = sin(_589);
        float _593 = _587 + (-1.0);
        float _595 = _593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _597 = fma(_591, _577, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _599 = fma(_547, _587, _595);
        float _601 = _581 * _597;
        float _603 = fma(_533, _601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _605 = fma(_525, _601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _569 = _599;
        _559 = _603;
        _563 = _605;
    }
    float _607 = _569;
    float _609 = _559;
    float _611 = _563;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _615 = _607 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _619 = _609 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _623 = _611 + _621;
    float _625 = _615 * _615;
    float _627 = fma(_619, _619, _625);
    float _629 = fma(_623, _623, _627);
    float _631 = rsqrt(_629);
    float _633 = _631 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _635 = _619 * _633;
    float _637 = _623 * _633;
    float _639 = _635 * _635;
    float _641 = _637 * _637;
    float _643 = _639 + _641;
    float _645 = sqrt(_643);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _651 = _645 + _649;
    float _653 = _541;
    float _655 = _643;
    float _657 = _651;
    float _659 = _615;
    float _661 = _633;
    float _663 = _635;
    if (_647)
    {
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _653 = _665;
    }
    float _667 = _653;
    if (_647)
    {
        float _669 = rsqrt(_643);
        _655 = _669;
    }
    float _671 = _655;
    float _673 = _667;
    float _675 = _671;
    if (_647)
    {
        float _677 = _651 * _667;
        _657 = _677;
    }
    float _679 = _657;
    if (_647)
    {
        float _681 = _679 * 0.15915493667125701904296875;
        _555 = _681;
    }
    float _683 = _555;
    float _685 = _623;
    if (_647)
    {
        float _687 = _683 * 6.283185482025146484375;
        float _689 = sin(_687);
        _685 = _689;
    }
    float _691 = _685;
    float _693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _695 = precise::max(0.0, _693);
    float _697 = _517;
    float _699 = _695;
    if (_647)
    {
        float _701 = _683 * 6.283185482025146484375;
        float _703 = cos(_701);
        _697 = _703;
    }
    float _705 = _697;
    float _707 = -_633;
    float _709 = -_695;
    float _711 = fma(_615, _707, _709);
    if (_647)
    {
        float _713 = _711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _659 = _713;
    }
    float _715 = _659;
    float _717 = sqrt(_629);
    float _719 = _691;
    float _721 = _715;
    if (_647)
    {
        float _723 = fma(_691, _715, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _719 = _723;
    }
    float _725 = _719;
    float _727 = _725;
    if (!_647)
    {
        _721 = _637;
    }
    float _729 = _721;
    float _731 = _729;
    if (_647)
    {
        float _733 = _705 + (-1.0);
        _699 = _733;
    }
    float _735 = _699;
    float _737 = _735;
    if (_647)
    {
        float _739 = _671 * _725;
        _661 = _739;
    }
    float _741 = _661;
    if (!_647)
    {
        _727 = _711;
    }
    float _743 = _727;
    float _745 = _743;
    if (_647)
    {
        float _747 = _735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _673 = _747;
    }
    float _749 = _673;
    if (_647)
    {
        float _751 = _635 * _741;
        _663 = _751;
    }
    float _753 = _663;
    if (!_647)
    {
        _675 = _639;
    }
    float _755 = _675;
    float _757 = _755;
    if (_647)
    {
        float _759 = _637 * _741;
        _731 = _759;
    }
    float _761 = _731;
    if (_647)
    {
        float _763 = fma(_711, _705, _749);
        _745 = _763;
    }
    float _765 = _745;
    if (_647)
    {
        float _767 = _753 * _753;
        _757 = _767;
    }
    float _769 = _757;
    if (!_647)
    {
        _737 = _641;
    }
    float _771 = _737;
    float _773 = _771;
    if (_647)
    {
        float _775 = _761 * _761;
        _773 = _775;
    }
    float _777 = _773;
    float _779 = fma(_765, _765, _769);
    float _781 = _779 + _777;
    float _783 = _607 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _785 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _787 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[23].w, _785);
    float _789 = precise::clamp(_787, 0.0, 1.0);
    float _791 = _607 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _793 = rsqrt(_781);
    float _795 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[2].x, _783);
    float _797 = -_789;
    float _799 = _797 + 1.0;
    float _801 = _607 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _803 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[1].x, _791);
    float _805 = _607 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _807 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[2].z, _795);
    float _809 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[0].x, _801);
    float _811 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[1].z, _803);
    float _813 = abs(_799);
    float _815 = log2(_813);
    float _817 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[3].x, _805);
    float _819 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[0].z, _809);
    float _821 = _811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _823 = _807 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _825 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[3].z, _817);
    float _827 = _819 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _829 = _793 * _753;
    float _831 = _821 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _833 = _793 * _765;
    float _835 = _793 * _761;
    float _837 = _829 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[7].x, _831);
    float _841 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _843 = _823 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _845 = -_837;
    float _847 = fma(_833, (*spvDescriptorSet0.vp_c15)._m0[21].y, _845);
    float _849 = _825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _851 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _839);
    float _853 = -_843;
    float _855 = fma(_853, _841, 1.0);
    float _857 = -_835;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c15)._m0[21].z, _847);
    float _861 = _815 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _863 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[7].w, _851);
    float _865 = _821 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _867 = fma(_859, -0.5, 0.5);
    float _869 = exp2(_861);
    float _871 = _821 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _873 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[4].x, _865);
    float _875 = fma(_859, 0.5, 0.5);
    float _877 = _833 + 1.0;
    float _879 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[5].x, _871);
    float _881 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _873);
    float _883 = fma(_875, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _885 = log2(_855);
    float _887 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _879);
    float _889 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[4].w, _881);
    float _891 = fma(_875, _883, -0.212114393711090087890625);
    float _893 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[5].w, _887);
    float _895 = fma(_875, _891, 1.570728778839111328125);
    float _897 = 1.0 / _863;
    float _899 = -_833;
    float _901 = fma(_869, _877, _899);
    float _903 = fma(_901, 0.5, 0.5);
    float _905 = sqrt(_867);
    float _907 = _885 * 0.693147182464599609375;
    float _909 = _907 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _911 = _889 * _897;
    float _913 = _893 * _897;
    float _915 = fma(_911, 0.5, 0.5);
    float _917 = fma(_913, -0.5, 0.5);
    float _919 = _905 * 0.636619746685028076171875;
    float3 _2585 = float3(_915, _917, _909);
    float _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2585, float3(0.0), isnan(_2585)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2585, float3(0.0), isnan(_2585)), level(0.0)).x;
    float3 _2596 = float3(_915, _917, _909);
    float4 _924 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2596, float3(0.0), isnan(_2596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2596, float3(0.0), isnan(_2596)), level(0.0)).xyzw;
    float _926 = _924.x;
    float _928 = _924.y;
    float _930 = _924.z;
    float _932 = _924.w;
    float _934 = -_895;
    float _936 = fma(_919, _934, 1.0);
    float2 _2618 = float2(_936, _903);
    float3 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2618, float2(0.0), isnan(_2618)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2618, float2(0.0), isnan(_2618)), level(0.0)).xyz;
    float _942 = _940.x;
    float _944 = _940.y;
    float _946 = _940.z;
    float _948 = in.m_51.x;
    float _950 = in.m_51.y;
    float _952 = _815 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _962 = _821 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _966 = _964 != 0;
    float _968 = 1.0 / _956;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _972 = _970 != 0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _982 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _984 = isnan(_439);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    bool _996 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _998 = isnan(_439);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = 1.0 / _960;
    bool _1010 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1012 = isnan(_439);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _994);
    float _1024 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1022);
    bool _1026 = _948 > 0.5;
    float _1028 = _976 * _968;
    float _1030 = 1.0 / _980;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1034 = _439 + _1032;
    float _1036 = -_992;
    float _1038 = _1036 + 1.0;
    bool _1040 = _950 > 0.5;
    float _1042 = -_1020;
    float _1044 = _1042 + 1.0;
    float _1046 = fma(_1028, _1034, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1052 = _1006 * _1038;
    float _1054 = -_1006;
    float _1056 = _1054 + 1.0;
    float _1058 = _1050 * _1008;
    float _1060 = exp2(_952);
    float _1062 = _1046 * _1052;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1064;
    float _1068 = _992 * _1044;
    bool _1070 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1072 = isnan(_439);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1062);
    float _1084 = _1066 * _1030;
    float _1086 = -_465;
    int _1088 = _1026 ? as_type<int>(_1086) : as_type<int>(_465);
    float _1090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1092 = -_459;
    int _1094 = _1040 ? as_type<int>(_1092) : as_type<int>(_459);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = _439 + _1096;
    bool _1100 = !_966;
    float _1102 = _1100 ? _465 : as_type<float>(_1088);
    float _1104 = -_1080;
    float _1106 = _1104 + 1.0;
    bool _1108 = !_972;
    float _1110 = _1108 ? _459 : as_type<float>(_1094);
    float _1112 = _1024 + _863;
    float _1114 = fma(_1058, _1098, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = _1102 + 0.5;
    float _1120 = -_1110;
    float _1122 = _1120 + 0.5;
    float _1124 = -_1060;
    float _1126 = _1124 + 1.0;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1130 = _439 + _1128;
    float _1132 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1136 = _1112 * 0.5;
    float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1140 = _1020 * _1106;
    float _1142 = fma(_1084, _1130, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1144 = fma(_1114, _1068, _1082);
    float _1146 = _1132 * _1090;
    float _1148 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1150 = fma(_1142, _1140, _1144);
    float _1152 = _1134 * _1116;
    out.gl_Position.x = _889;
    out.gl_Position.y = _893;
    out.gl_Position.z = _1024;
    out.gl_Position.w = _863;
    float _1154 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1150);
    out.m_58.x = _1146;
    out.m_58.y = _1152;
    float _1156 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_60.z = _1136;
    out.m_60.w = _863;
    out.m_62.w = _1156;
    out.m_45.x = _1148;
    float _1158 = _1138 * _921;
    float _1160 = _932 * _1158;
    float _1162 = _946 * _1158;
    float _1164 = -_1138;
    float _1166 = _1164 + 1.0;
    float _1168 = fma(_942, _1160, _926);
    float _1170 = fma(_944, _1160, _928);
    float _1172 = _932 * _1166;
    float _1174 = fma(_932, _1162, _930);
    out.m_64.x = _1168;
    out.m_64.y = _1170;
    out.m_64.z = _1174;
    out.m_64.w = _1172;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _431 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1231 = as_type<float>(_99);
        out.gl_Position.z = _1231;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1300 = as_type<float>(_135);
        out.gl_Position.z = _1300;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _261 = _257;
    float _279;
    if (!_259)
    {
        float _263 = in.m_51.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_83);
        float _285 = 1.0 / _283;
        float _287 = _117 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    bool _295 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_289);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_289);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_305;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _313;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _335 = _325 * _329;
    bool _337 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _339 = isnan(_289);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_325;
    float _351 = _349 + 1.0;
    out.m_53.w = _333;
    bool _353 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _355 = 1.0 / _309;
    float _357 = _347 * _351;
    float _359 = -_347;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _367 = _293 * _355;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _289 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = _371 * _331;
    float _383 = fma(_375, _367, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = fma(_379, _367, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = fma(_365, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = _383 * _357;
    float _395 = _385 * _357;
    float _397 = fma(_389, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _399 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _401 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _403 = fma(_397, _335, _399);
    float _405 = fma(_391, _335, _401);
    float _407 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].x, _403);
    float _409 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].y, _405);
    bool _411 = !_353;
    float _429;
    if (!_411)
    {
        float _413 = in.m_51.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        float _433 = float(_83);
        float _435 = 1.0 / _433;
        float _437 = _117 * _435;
        _429 = _437;
    }
    _431 = false;
    float _439 = _429;
    float _441 = as_type<float>(int(gl_VertexIndex));
    float _443 = in.m_49.x;
    float _445 = in.m_49.y;
    int _447 = as_type<int>(_441) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>(_441) & 2;
    bool _453 = _451 != 0;
    float _455 = _409 * _445;
    bool _457 = !_453;
    float _459 = _457 ? (-0.5) : 0.5;
    float _461 = _407 * _443;
    bool _463 = !_449;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _469 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _459);
    float _471 = _461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _465);
    float _475 = _467 * _469;
    float _477 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _479 = _471 * _473;
    float _481 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _483 = _475 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _485 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _487 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _489 = _475 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _491 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _483);
    float _493 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _481);
    float _495 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _497 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _489);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[26].z, _491);
    float _501 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _493);
    float _503 = _495 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _505 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[24].z, _497);
    float _507 = _499 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _509 = _501 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _511 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _513 = _505 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _515 = _503 + _507;
    float _517 = _475 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _519 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
    float _521 = _509 + _513;
    float _523 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _525 = _515 + _523;
    float _527 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _517);
    float _529 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
    float _531 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _533 = _521 + _531;
    float _535 = _525 * _525;
    float _537 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[25].z, _527);
    float _539 = _529 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _541 = fma(_533, _533, _535);
    float _543 = _537 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = sqrt(_541);
    float _547 = _539 + _543;
    bool _549 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _551 = _539;
    float _553 = _535;
    float _555 = _521;
    if (!_549)
    {
        _261 = _521;
    }
    float _557 = _261;
    float _559 = _557;
    if (!_549)
    {
        _551 = _515;
    }
    float _561 = _551;
    float _563 = _561;
    if (!_549)
    {
        _553 = _547;
    }
    float _565 = _553;
    bool _567 = !_549;
    float _569 = _565;
    if (!_567)
    {
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _575 = _545 + _573;
        float _577 = _547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _579 = _575 * _571;
        float _581 = rsqrt(_541);
        float _583 = _579 * 0.15915493667125701904296875;
        float _585 = _583 * 6.283185482025146484375;
        float _587 = cos(_585);
        float _589 = _583 * 6.283185482025146484375;
        float _591 = sin(_589);
        float _593 = _587 + (-1.0);
        float _595 = _593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _597 = fma(_591, _577, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _599 = fma(_547, _587, _595);
        float _601 = _581 * _597;
        float _603 = fma(_533, _601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _605 = fma(_525, _601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _569 = _599;
        _559 = _603;
        _563 = _605;
    }
    float _607 = _569;
    float _609 = _559;
    float _611 = _563;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _615 = _607 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _619 = _609 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _623 = _611 + _621;
    float _625 = _615 * _615;
    float _627 = fma(_619, _619, _625);
    float _629 = fma(_623, _623, _627);
    float _631 = rsqrt(_629);
    float _633 = _631 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _635 = _619 * _633;
    float _637 = _623 * _633;
    float _639 = _635 * _635;
    float _641 = _637 * _637;
    float _643 = _639 + _641;
    float _645 = sqrt(_643);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _651 = _645 + _649;
    float _653 = _541;
    float _655 = _643;
    float _657 = _651;
    float _659 = _615;
    float _661 = _633;
    float _663 = _635;
    if (_647)
    {
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _653 = _665;
    }
    float _667 = _653;
    if (_647)
    {
        float _669 = rsqrt(_643);
        _655 = _669;
    }
    float _671 = _655;
    float _673 = _667;
    float _675 = _671;
    if (_647)
    {
        float _677 = _651 * _667;
        _657 = _677;
    }
    float _679 = _657;
    if (_647)
    {
        float _681 = _679 * 0.15915493667125701904296875;
        _555 = _681;
    }
    float _683 = _555;
    float _685 = _623;
    if (_647)
    {
        float _687 = _683 * 6.283185482025146484375;
        float _689 = sin(_687);
        _685 = _689;
    }
    float _691 = _685;
    float _693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _695 = precise::max(0.0, _693);
    float _697 = _517;
    float _699 = _695;
    if (_647)
    {
        float _701 = _683 * 6.283185482025146484375;
        float _703 = cos(_701);
        _697 = _703;
    }
    float _705 = _697;
    float _707 = -_633;
    float _709 = -_695;
    float _711 = fma(_615, _707, _709);
    if (_647)
    {
        float _713 = _711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _659 = _713;
    }
    float _715 = _659;
    float _717 = sqrt(_629);
    float _719 = _691;
    float _721 = _715;
    if (_647)
    {
        float _723 = fma(_691, _715, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _719 = _723;
    }
    float _725 = _719;
    float _727 = _725;
    if (!_647)
    {
        _721 = _637;
    }
    float _729 = _721;
    float _731 = _729;
    if (_647)
    {
        float _733 = _705 + (-1.0);
        _699 = _733;
    }
    float _735 = _699;
    float _737 = _735;
    if (_647)
    {
        float _739 = _671 * _725;
        _661 = _739;
    }
    float _741 = _661;
    if (!_647)
    {
        _727 = _711;
    }
    float _743 = _727;
    float _745 = _743;
    if (_647)
    {
        float _747 = _735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _673 = _747;
    }
    float _749 = _673;
    if (_647)
    {
        float _751 = _635 * _741;
        _663 = _751;
    }
    float _753 = _663;
    if (!_647)
    {
        _675 = _639;
    }
    float _755 = _675;
    float _757 = _755;
    if (_647)
    {
        float _759 = _637 * _741;
        _731 = _759;
    }
    float _761 = _731;
    if (_647)
    {
        float _763 = fma(_711, _705, _749);
        _745 = _763;
    }
    float _765 = _745;
    if (_647)
    {
        float _767 = _753 * _753;
        _757 = _767;
    }
    float _769 = _757;
    if (!_647)
    {
        _737 = _641;
    }
    float _771 = _737;
    float _773 = _771;
    if (_647)
    {
        float _775 = _761 * _761;
        _773 = _775;
    }
    float _777 = _773;
    float _779 = fma(_765, _765, _769);
    float _781 = _779 + _777;
    float _783 = _607 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _785 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _787 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[23].w, _785);
    float _789 = precise::clamp(_787, 0.0, 1.0);
    float _791 = _607 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _793 = rsqrt(_781);
    float _795 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[2].x, _783);
    float _797 = -_789;
    float _799 = _797 + 1.0;
    float _801 = _607 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _803 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[1].x, _791);
    float _805 = _607 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _807 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[2].z, _795);
    float _809 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[0].x, _801);
    float _811 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[1].z, _803);
    float _813 = abs(_799);
    float _815 = log2(_813);
    float _817 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[3].x, _805);
    float _819 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[0].z, _809);
    float _821 = _811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _823 = _807 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _825 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[3].z, _817);
    float _827 = _819 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _829 = _793 * _753;
    float _831 = _821 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _833 = _793 * _765;
    float _835 = _793 * _761;
    float _837 = _829 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[7].x, _831);
    float _841 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _843 = _823 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _845 = -_837;
    float _847 = fma(_833, (*spvDescriptorSet0.vp_c15)._m0[21].y, _845);
    float _849 = _825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _851 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _839);
    float _853 = -_843;
    float _855 = fma(_853, _841, 1.0);
    float _857 = -_835;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c15)._m0[21].z, _847);
    float _861 = _815 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _863 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[7].w, _851);
    float _865 = _821 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _867 = fma(_859, -0.5, 0.5);
    float _869 = exp2(_861);
    float _871 = _821 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _873 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[4].x, _865);
    float _875 = fma(_859, 0.5, 0.5);
    float _877 = _833 + 1.0;
    float _879 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[5].x, _871);
    float _881 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _873);
    float _883 = fma(_875, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _885 = log2(_855);
    float _887 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _879);
    float _889 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[4].w, _881);
    float _891 = fma(_875, _883, -0.212114393711090087890625);
    float _893 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[5].w, _887);
    float _895 = fma(_875, _891, 1.570728778839111328125);
    float _897 = 1.0 / _863;
    float _899 = -_833;
    float _901 = fma(_869, _877, _899);
    float _903 = fma(_901, 0.5, 0.5);
    float _905 = sqrt(_867);
    float _907 = _885 * 0.693147182464599609375;
    float _909 = _907 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _911 = _889 * _897;
    float _913 = _893 * _897;
    float _915 = fma(_911, 0.5, 0.5);
    float _917 = fma(_913, -0.5, 0.5);
    float _919 = _905 * 0.636619746685028076171875;
    float3 _2585 = float3(_915, _917, _909);
    float _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2585, float3(0.0), isnan(_2585)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2585, float3(0.0), isnan(_2585)), level(0.0)).x;
    float3 _2596 = float3(_915, _917, _909);
    float4 _924 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2596, float3(0.0), isnan(_2596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2596, float3(0.0), isnan(_2596)), level(0.0)).xyzw;
    float _926 = _924.x;
    float _928 = _924.y;
    float _930 = _924.z;
    float _932 = _924.w;
    float _934 = -_895;
    float _936 = fma(_919, _934, 1.0);
    float2 _2618 = float2(_936, _903);
    float3 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2618, float2(0.0), isnan(_2618)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2618, float2(0.0), isnan(_2618)), level(0.0)).xyz;
    float _942 = _940.x;
    float _944 = _940.y;
    float _946 = _940.z;
    float _948 = in.m_51.x;
    float _950 = in.m_51.y;
    float _952 = _815 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _962 = _821 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _966 = _964 != 0;
    float _968 = 1.0 / _956;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _972 = _970 != 0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _982 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _984 = isnan(_439);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    bool _996 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _998 = isnan(_439);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = 1.0 / _960;
    bool _1010 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1012 = isnan(_439);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _994);
    float _1024 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1022);
    bool _1026 = _948 > 0.5;
    float _1028 = _976 * _968;
    float _1030 = 1.0 / _980;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1034 = _439 + _1032;
    float _1036 = -_992;
    float _1038 = _1036 + 1.0;
    bool _1040 = _950 > 0.5;
    float _1042 = -_1020;
    float _1044 = _1042 + 1.0;
    float _1046 = fma(_1028, _1034, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1052 = _1006 * _1038;
    float _1054 = -_1006;
    float _1056 = _1054 + 1.0;
    float _1058 = _1050 * _1008;
    float _1060 = exp2(_952);
    float _1062 = _1046 * _1052;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1064;
    float _1068 = _992 * _1044;
    bool _1070 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1072 = isnan(_439);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1062);
    float _1084 = _1066 * _1030;
    float _1086 = -_465;
    int _1088 = _1026 ? as_type<int>(_1086) : as_type<int>(_465);
    float _1090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1092 = -_459;
    int _1094 = _1040 ? as_type<int>(_1092) : as_type<int>(_459);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = _439 + _1096;
    bool _1100 = !_966;
    float _1102 = _1100 ? _465 : as_type<float>(_1088);
    float _1104 = -_1080;
    float _1106 = _1104 + 1.0;
    bool _1108 = !_972;
    float _1110 = _1108 ? _459 : as_type<float>(_1094);
    float _1112 = _1024 + _863;
    float _1114 = fma(_1058, _1098, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = _1102 + 0.5;
    float _1120 = -_1110;
    float _1122 = _1120 + 0.5;
    float _1124 = -_1060;
    float _1126 = _1124 + 1.0;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1130 = _439 + _1128;
    float _1132 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1136 = _1112 * 0.5;
    float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1140 = _1020 * _1106;
    float _1142 = fma(_1084, _1130, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1144 = fma(_1114, _1068, _1082);
    float _1146 = _1132 * _1090;
    float _1148 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1150 = fma(_1142, _1140, _1144);
    float _1152 = _1134 * _1116;
    out.gl_Position.x = _889;
    out.gl_Position.y = _893;
    out.gl_Position.z = _1024;
    out.gl_Position.w = _863;
    float _1154 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1150);
    out.m_58.x = _1146;
    out.m_58.y = _1152;
    float _1156 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_60.z = _1136;
    out.m_60.w = _863;
    out.m_62.w = _1156;
    out.m_45.x = _1148;
    float _1158 = _1138 * _921;
    float _1160 = _932 * _1158;
    float _1162 = _946 * _1158;
    float _1164 = -_1138;
    float _1166 = _1164 + 1.0;
    float _1168 = fma(_942, _1160, _926);
    float _1170 = fma(_944, _1160, _928);
    float _1172 = _932 * _1166;
    float _1174 = fma(_932, _1162, _930);
    out.m_64.x = _1168;
    out.m_64.y = _1170;
    out.m_64.z = _1174;
    out.m_64.w = _1172;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _431 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1231 = as_type<float>(_99);
        out.gl_Position.z = _1231;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1300 = as_type<float>(_135);
        out.gl_Position.z = _1300;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _261 = _257;
    float _279;
    if (!_259)
    {
        float _263 = in.m_51.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_83);
        float _285 = 1.0 / _283;
        float _287 = _117 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = _289 + _291;
    bool _295 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _297 = isnan(_289);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _315 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_289);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_305;
    float _329 = _327 + 1.0;
    float _331 = 1.0 / _313;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _335 = _325 * _329;
    bool _337 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _339 = isnan(_289);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_325;
    float _351 = _349 + 1.0;
    out.m_53.w = _333;
    bool _353 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _355 = 1.0 / _309;
    float _357 = _347 * _351;
    float _359 = -_347;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _367 = _293 * _355;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _289 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = _371 * _331;
    float _383 = fma(_375, _367, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _385 = fma(_379, _367, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = fma(_365, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _393 = _383 * _357;
    float _395 = _385 * _357;
    float _397 = fma(_389, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _399 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _393);
    float _401 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _395);
    float _403 = fma(_397, _335, _399);
    float _405 = fma(_391, _335, _401);
    float _407 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].x, _403);
    float _409 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[145].y, _405);
    bool _411 = !_353;
    float _429;
    if (!_411)
    {
        float _413 = in.m_51.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        float _433 = float(_83);
        float _435 = 1.0 / _433;
        float _437 = _117 * _435;
        _429 = _437;
    }
    _431 = false;
    float _439 = _429;
    float _441 = as_type<float>(int(gl_VertexIndex));
    float _443 = in.m_49.x;
    float _445 = in.m_49.y;
    int _447 = as_type<int>(_441) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>(_441) & 2;
    bool _453 = _451 != 0;
    float _455 = _409 * _445;
    bool _457 = !_453;
    float _459 = _457 ? (-0.5) : 0.5;
    float _461 = _407 * _443;
    bool _463 = !_449;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _469 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _459);
    float _471 = _461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _473 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _465);
    float _475 = _467 * _469;
    float _477 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _479 = _471 * _473;
    float _481 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _483 = _475 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _485 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _487 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _489 = _475 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _491 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _483);
    float _493 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _481);
    float _495 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _485);
    float _497 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _489);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[26].z, _491);
    float _501 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _493);
    float _503 = _495 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _505 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[24].z, _497);
    float _507 = _499 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _509 = _501 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _511 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _513 = _505 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _515 = _503 + _507;
    float _517 = _475 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _519 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
    float _521 = _509 + _513;
    float _523 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _525 = _515 + _523;
    float _527 = fma(_479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _517);
    float _529 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
    float _531 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _533 = _521 + _531;
    float _535 = _525 * _525;
    float _537 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[25].z, _527);
    float _539 = _529 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _541 = fma(_533, _533, _535);
    float _543 = _537 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _545 = sqrt(_541);
    float _547 = _539 + _543;
    bool _549 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _551 = _539;
    float _553 = _535;
    float _555 = _521;
    if (!_549)
    {
        _261 = _521;
    }
    float _557 = _261;
    float _559 = _557;
    if (!_549)
    {
        _551 = _515;
    }
    float _561 = _551;
    float _563 = _561;
    if (!_549)
    {
        _553 = _547;
    }
    float _565 = _553;
    bool _567 = !_549;
    float _569 = _565;
    if (!_567)
    {
        float _571 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _575 = _545 + _573;
        float _577 = _547 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _579 = _575 * _571;
        float _581 = rsqrt(_541);
        float _583 = _579 * 0.15915493667125701904296875;
        float _585 = _583 * 6.283185482025146484375;
        float _587 = cos(_585);
        float _589 = _583 * 6.283185482025146484375;
        float _591 = sin(_589);
        float _593 = _587 + (-1.0);
        float _595 = _593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _597 = fma(_591, _577, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _599 = fma(_547, _587, _595);
        float _601 = _581 * _597;
        float _603 = fma(_533, _601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _605 = fma(_525, _601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _569 = _599;
        _559 = _603;
        _563 = _605;
    }
    float _607 = _569;
    float _609 = _559;
    float _611 = _563;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _615 = _607 + _613;
    float _617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _619 = _609 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _623 = _611 + _621;
    float _625 = _615 * _615;
    float _627 = fma(_619, _619, _625);
    float _629 = fma(_623, _623, _627);
    float _631 = rsqrt(_629);
    float _633 = _631 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _635 = _619 * _633;
    float _637 = _623 * _633;
    float _639 = _635 * _635;
    float _641 = _637 * _637;
    float _643 = _639 + _641;
    float _645 = sqrt(_643);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _651 = _645 + _649;
    float _653 = _541;
    float _655 = _643;
    float _657 = _651;
    float _659 = _615;
    float _661 = _633;
    float _663 = _635;
    if (_647)
    {
        float _665 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _653 = _665;
    }
    float _667 = _653;
    if (_647)
    {
        float _669 = rsqrt(_643);
        _655 = _669;
    }
    float _671 = _655;
    float _673 = _667;
    float _675 = _671;
    if (_647)
    {
        float _677 = _651 * _667;
        _657 = _677;
    }
    float _679 = _657;
    if (_647)
    {
        float _681 = _679 * 0.15915493667125701904296875;
        _555 = _681;
    }
    float _683 = _555;
    float _685 = _623;
    if (_647)
    {
        float _687 = _683 * 6.283185482025146484375;
        float _689 = sin(_687);
        _685 = _689;
    }
    float _691 = _685;
    float _693 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _695 = precise::max(0.0, _693);
    float _697 = _517;
    float _699 = _695;
    if (_647)
    {
        float _701 = _683 * 6.283185482025146484375;
        float _703 = cos(_701);
        _697 = _703;
    }
    float _705 = _697;
    float _707 = -_633;
    float _709 = -_695;
    float _711 = fma(_615, _707, _709);
    if (_647)
    {
        float _713 = _711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _659 = _713;
    }
    float _715 = _659;
    float _717 = sqrt(_629);
    float _719 = _691;
    float _721 = _715;
    if (_647)
    {
        float _723 = fma(_691, _715, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _719 = _723;
    }
    float _725 = _719;
    float _727 = _725;
    if (!_647)
    {
        _721 = _637;
    }
    float _729 = _721;
    float _731 = _729;
    if (_647)
    {
        float _733 = _705 + (-1.0);
        _699 = _733;
    }
    float _735 = _699;
    float _737 = _735;
    if (_647)
    {
        float _739 = _671 * _725;
        _661 = _739;
    }
    float _741 = _661;
    if (!_647)
    {
        _727 = _711;
    }
    float _743 = _727;
    float _745 = _743;
    if (_647)
    {
        float _747 = _735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _673 = _747;
    }
    float _749 = _673;
    if (_647)
    {
        float _751 = _635 * _741;
        _663 = _751;
    }
    float _753 = _663;
    if (!_647)
    {
        _675 = _639;
    }
    float _755 = _675;
    float _757 = _755;
    if (_647)
    {
        float _759 = _637 * _741;
        _731 = _759;
    }
    float _761 = _731;
    if (_647)
    {
        float _763 = fma(_711, _705, _749);
        _745 = _763;
    }
    float _765 = _745;
    if (_647)
    {
        float _767 = _753 * _753;
        _757 = _767;
    }
    float _769 = _757;
    if (!_647)
    {
        _737 = _641;
    }
    float _771 = _737;
    float _773 = _771;
    if (_647)
    {
        float _775 = _761 * _761;
        _773 = _775;
    }
    float _777 = _773;
    float _779 = fma(_765, _765, _769);
    float _781 = _779 + _777;
    float _783 = _607 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _785 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _787 = fma(_717, (*spvDescriptorSet0.vp_c15)._m0[23].w, _785);
    float _789 = precise::clamp(_787, 0.0, 1.0);
    float _791 = _607 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _793 = rsqrt(_781);
    float _795 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[2].x, _783);
    float _797 = -_789;
    float _799 = _797 + 1.0;
    float _801 = _607 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _803 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[1].x, _791);
    float _805 = _607 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _807 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[2].z, _795);
    float _809 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[0].x, _801);
    float _811 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[1].z, _803);
    float _813 = abs(_799);
    float _815 = log2(_813);
    float _817 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[3].x, _805);
    float _819 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[0].z, _809);
    float _821 = _811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _823 = _807 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _825 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[3].z, _817);
    float _827 = _819 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _829 = _793 * _753;
    float _831 = _821 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _833 = _793 * _765;
    float _835 = _793 * _761;
    float _837 = _829 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[7].x, _831);
    float _841 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _843 = _823 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _845 = -_837;
    float _847 = fma(_833, (*spvDescriptorSet0.vp_c15)._m0[21].y, _845);
    float _849 = _825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _851 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _839);
    float _853 = -_843;
    float _855 = fma(_853, _841, 1.0);
    float _857 = -_835;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c15)._m0[21].z, _847);
    float _861 = _815 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _863 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[7].w, _851);
    float _865 = _821 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _867 = fma(_859, -0.5, 0.5);
    float _869 = exp2(_861);
    float _871 = _821 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _873 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[4].x, _865);
    float _875 = fma(_859, 0.5, 0.5);
    float _877 = _833 + 1.0;
    float _879 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[5].x, _871);
    float _881 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _873);
    float _883 = fma(_875, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _885 = log2(_855);
    float _887 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _879);
    float _889 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[4].w, _881);
    float _891 = fma(_875, _883, -0.212114393711090087890625);
    float _893 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[5].w, _887);
    float _895 = fma(_875, _891, 1.570728778839111328125);
    float _897 = 1.0 / _863;
    float _899 = -_833;
    float _901 = fma(_869, _877, _899);
    float _903 = fma(_901, 0.5, 0.5);
    float _905 = sqrt(_867);
    float _907 = _885 * 0.693147182464599609375;
    float _909 = _907 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _911 = _889 * _897;
    float _913 = _893 * _897;
    float _915 = fma(_911, 0.5, 0.5);
    float _917 = fma(_913, -0.5, 0.5);
    float _919 = _905 * 0.636619746685028076171875;
    float3 _2585 = float3(_915, _917, _909);
    float _921 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2585, float3(0.0), isnan(_2585)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2585, float3(0.0), isnan(_2585)), level(0.0)).x;
    float3 _2596 = float3(_915, _917, _909);
    float4 _924 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2596, float3(0.0), isnan(_2596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2596, float3(0.0), isnan(_2596)), level(0.0)).xyzw;
    float _926 = _924.x;
    float _928 = _924.y;
    float _930 = _924.z;
    float _932 = _924.w;
    float _934 = -_895;
    float _936 = fma(_919, _934, 1.0);
    float2 _2618 = float2(_936, _903);
    float3 _940 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2618, float2(0.0), isnan(_2618)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2618, float2(0.0), isnan(_2618)), level(0.0)).xyz;
    float _942 = _940.x;
    float _944 = _940.y;
    float _946 = _940.z;
    float _948 = in.m_51.x;
    float _950 = in.m_51.y;
    float _952 = _815 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _962 = _821 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _966 = _964 != 0;
    float _968 = 1.0 / _956;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _972 = _970 != 0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _982 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _984 = isnan(_439);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    bool _996 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _998 = isnan(_439);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    float _1008 = 1.0 / _960;
    bool _1010 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1012 = isnan(_439);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _994);
    float _1024 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1022);
    bool _1026 = _948 > 0.5;
    float _1028 = _976 * _968;
    float _1030 = 1.0 / _980;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1034 = _439 + _1032;
    float _1036 = -_992;
    float _1038 = _1036 + 1.0;
    bool _1040 = _950 > 0.5;
    float _1042 = -_1020;
    float _1044 = _1042 + 1.0;
    float _1046 = fma(_1028, _1034, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1052 = _1006 * _1038;
    float _1054 = -_1006;
    float _1056 = _1054 + 1.0;
    float _1058 = _1050 * _1008;
    float _1060 = exp2(_952);
    float _1062 = _1046 * _1052;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1064;
    float _1068 = _992 * _1044;
    bool _1070 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1072 = isnan(_439);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1062);
    float _1084 = _1066 * _1030;
    float _1086 = -_465;
    int _1088 = _1026 ? as_type<int>(_1086) : as_type<int>(_465);
    float _1090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1092 = -_459;
    int _1094 = _1040 ? as_type<int>(_1092) : as_type<int>(_459);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = _439 + _1096;
    bool _1100 = !_966;
    float _1102 = _1100 ? _465 : as_type<float>(_1088);
    float _1104 = -_1080;
    float _1106 = _1104 + 1.0;
    bool _1108 = !_972;
    float _1110 = _1108 ? _459 : as_type<float>(_1094);
    float _1112 = _1024 + _863;
    float _1114 = fma(_1058, _1098, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1116 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1118 = _1102 + 0.5;
    float _1120 = -_1110;
    float _1122 = _1120 + 0.5;
    float _1124 = -_1060;
    float _1126 = _1124 + 1.0;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1130 = _439 + _1128;
    float _1132 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1136 = _1112 * 0.5;
    float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1140 = _1020 * _1106;
    float _1142 = fma(_1084, _1130, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1144 = fma(_1114, _1068, _1082);
    float _1146 = _1132 * _1090;
    float _1148 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1150 = fma(_1142, _1140, _1144);
    float _1152 = _1134 * _1116;
    out.gl_Position.x = _889;
    out.gl_Position.y = _893;
    out.gl_Position.z = _1024;
    out.gl_Position.w = _863;
    float _1154 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1150);
    out.m_58.x = _1146;
    out.m_58.y = _1152;
    float _1156 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_60.z = _1136;
    out.m_60.w = _863;
    out.m_62.w = _1156;
    out.m_45.x = _1148;
    float _1158 = _1138 * _921;
    float _1160 = _932 * _1158;
    float _1162 = _946 * _1158;
    float _1164 = -_1138;
    float _1166 = _1164 + 1.0;
    float _1168 = fma(_942, _1160, _926);
    float _1170 = fma(_944, _1160, _928);
    float _1172 = _932 * _1166;
    float _1174 = fma(_932, _1162, _930);
    out.m_64.x = _1168;
    out.m_64.y = _1170;
    out.m_64.z = _1174;
    out.m_64.w = _1172;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

