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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _767 = false;
    bool _647 = false;
    bool _501 = false;
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
        float _2017 = as_type<float>(_99);
        out.gl_Position.z = _2017;
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
        float _2086 = as_type<float>(_135);
        out.gl_Position.z = _2086;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.w;
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = in.m_47.x;
    float _169 = in.m_47.y;
    float _171 = in.m_47.z;
    float _173 = _165 * 6.283185482025146484375;
    float _175 = floor(_165);
    float _177 = _173 * 0.15915493667125701904296875;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _177 * 6.283185482025146484375;
    float _185 = cos(_183);
    float _187 = 1.4012984643248170709237295832899e-45;
    float _189 = _145;
    float _191 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_155)
    {
        float _197 = _145 * _145;
        float _199 = _197 * 0.5;
        _187 = _199;
    }
    float _201 = _187;
    float _203 = _201;
    if (!_155)
    {
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    float _209 = -_175;
    float _211 = _165 + _209;
    bool _213 = !_155;
    float _215 = _207;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _145 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _145);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_155;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _145 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _189 = _269;
    }
    float _271 = _189;
    float _273 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_271, _167, _273);
    bool _281 = _211 < 0.5;
    float _283 = float(_281);
    float _285 = fma(_271, _169, _275);
    float _287 = fma(_185, 0.5, 0.5);
    float _289 = fma(_271, _171, _277);
    float _291 = _275;
    if (!_155)
    {
        float _293 = _117 * _117;
        float _295 = _293 * 0.5;
        _291 = _295;
    }
    float _297 = _291;
    float _299 = -_211;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_283;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = -_287;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = fma(_279, _143, _157);
    float _313 = fma(_285, _143, _159);
    float _315 = fma(_289, _143, _161);
    float _317 = _297;
    if (!_155)
    {
        float _319 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _317 = _319;
    }
    float _321 = _317;
    float _323 = 0.0;
    float _325 = _321;
    if (!_155)
    {
        _323 = _117;
    }
    float _327 = _323;
    bool _329 = !_181;
    int _331 = _329 ? 0 : 1;
    bool _333 = !_155;
    float _335 = _327;
    if (!_333)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _347 = _117 * _339;
        float _349 = 1.0 / _343;
        float _351 = _345 * 0.693147182464599609375;
        float _353 = exp2(_347);
        float _355 = 1.0 / _351;
        float _357 = _353 + (-1.0);
        float _359 = -_357;
        float _361 = fma(_359, _355, _117);
        float _363 = _361 * _349;
        float _365 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _325 = _365;
    }
    float _367 = _325;
    bool _369 = !_155;
    if (!_369)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _377 = _375 + 1.0;
        float _379 = 1.0 / _377;
        float _381 = _117 * _373;
        float _383 = exp2(_381);
        float _385 = -_383;
        float _387 = _385 + 1.0;
        float _389 = _387 * _379;
        _335 = _389;
    }
    float _391 = _335;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _395 = _393 != 0;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _399 = _397 != 0;
    float _401 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _403 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _405 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _407 = abs(_331);
    float _409 = fma(_391, _169, _401);
    bool _411 = !_395;
    int _413 = _411 ? 0 : 1;
    float _415 = fma(_391, _167, _403);
    float _417 = fma(_391, _171, _405);
    bool _419 = !_399;
    int _421 = _419 ? 0 : 1;
    int _423 = abs(_413);
    float _425 = -_409;
    float _427 = _285 + _425;
    float _429 = -_415;
    float _431 = _279 + _429;
    int _433 = abs(_421);
    float _435 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _439 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _443 = float(_423);
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _447 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _449 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
    float _451 = float(_407);
    float _453 = abs(_301);
    float _455 = _443 * _453;
    float _457 = -_417;
    float _459 = _289 + _457;
    float _461 = fma(_451, _309, _455);
    float _463 = float(_433);
    float _465 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _467 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    float _471 = abs(_305);
    float _473 = fma(_463, _471, _461);
    bool _475 = !_437;
    float _477 = _467;
    float _479 = _465;
    float _481 = _469;
    float _483 = _465;
    float _499;
    if (!_475)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _487 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_83);
        float _505 = 1.0 / _503;
        float _507 = _117 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = _509 + _511;
    bool _515 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _517 = isnan(_509);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    bool _527 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_509);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _547 = -_525;
    float _549 = _547 + 1.0;
    float _551 = 1.0 / _541;
    bool _553 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _555 = isnan(_509);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = _537 * _549;
    float _567 = -_537;
    float _569 = _567 + 1.0;
    bool _571 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _573 = _563 * _569;
    float _575 = 1.0 / _545;
    float _577 = -_563;
    float _579 = _577 + 1.0;
    float _581 = _513 * _551;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _585 = _509 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _591;
    float _595 = fma(_589, _581, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _597 = fma(_593, _581, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _599 = _585 * _575;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _605 = _595 * _573;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _611 = _597 * _573;
    float _613 = fma(_603, _599, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _615 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _617 = fma(_609, _599, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _619 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].y, _611);
    float _621 = fma(_613, _565, _615);
    float _623 = fma(_617, _565, _619);
    float _625 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[145].x, _621);
    float _627 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[145].y, _623);
    bool _629 = !_571;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_83);
        float _651 = 1.0 / _649;
        float _653 = _117 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_51.x;
    float _659 = in.m_51.y;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _663 = _655 + _661;
    bool _665 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _667 = isnan(_655);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _677;
    float _681 = -_675;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _687 = 1.0 / _679;
    float _689 = _627 * _659;
    float _691 = _663 * _687;
    bool _693 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _695 = isnan(_655);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _713;
    float _717 = _703 * _683;
    float _719 = fma(_707, _691, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _721 = fma(_711, _691, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _723 = fma(_715, _691, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _725 = -_703;
    float _727 = _725 + 1.0;
    float _729 = _719 * _717;
    float _731 = _721 * _717;
    float _733 = _723 * _717;
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].x, _729);
    float _737 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].y, _731);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].z, _733);
    float _741 = _625 * _657;
    float _743 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].x, _735);
    float _745 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].y, _737);
    float _747 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].z, _739);
    bool _749 = !_685;
    float _765;
    if (!_749)
    {
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _753 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_83);
        float _771 = 1.0 / _769;
        float _773 = _117 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = as_type<float>(int(gl_VertexIndex));
    float _779 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _781 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _783 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _785 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].x, _779);
    float _787 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].x, _781);
    float _789 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].x, _783);
    bool _791 = _137 > 0.5;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _797 = in.m_49.y;
    float _799 = _473 * _689;
    float _801 = 1.0 / _795;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _807 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _813 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _787);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _815;
    bool _819 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _821 = isnan(_775);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = 1.0 / _805;
    int _833 = as_type<int>(_777) & 1;
    bool _835 = _833 != 0;
    int _837 = as_type<int>(_777) & 2;
    bool _839 = _837 != 0;
    float _841 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _785);
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _845 = _843 != 0;
    float _847 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _789);
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _851 = _849 != 0;
    float _853 = _473 * _741;
    bool _855 = !_835;
    float _857 = _855 ? (-0.5) : 0.5;
    float _859 = 1.0 / _811;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _865 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _867 = !_839;
    float _869 = _867 ? (-0.5) : 0.5;
    float _871 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _857);
    bool _873 = _797 > 0.5;
    float _875 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _877 = _847 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _869);
    float _881 = _865 * _871;
    float _883 = _863 * _831;
    float _885 = _817 * _801;
    float _887 = _807 * _879;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _891 = _775 + _889;
    bool _893 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _895 = isnan(_775);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = _887 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _907 = _887 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _909 = fma(_885, _891, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _911 = _887 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _913 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _905);
    float _915 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _907);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _917;
    float _921 = _841 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _913);
    float _925 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _915);
    float _927 = _919 * _859;
    float _929 = -_903;
    float _931 = _929 + 1.0;
    float _933 = _923 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _935 = _925 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _939 = _775 + _937;
    float _941 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _911);
    float _943 = _877 + _933;
    bool _945 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _947 = isnan(_775);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = _921 + _935;
    bool _959 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _961 = isnan(_775);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _973 = _943 + _971;
    float _975 = fma(_883, _939, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _977 = _955 * _931;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _981 = _957 + _979;
    float _983 = _973 * _973;
    float _985 = -_955;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _991 = _775 + _989;
    float _993 = -_857;
    int _995 = _791 ? as_type<int>(_993) : as_type<int>(_857);
    float _997 = fma(_981, _981, _983);
    float _999 = _969 * _987;
    float _1001 = -_969;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _1007 = sqrt(_997);
    float _1009 = fma(_927, _991, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1011 = _829 * _1003;
    float _1013 = -_829;
    float _1015 = _1013 + 1.0;
    bool _1017 = !_845;
    float _1019 = _1017 ? _857 : as_type<float>(_995);
    float _1021 = _813 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1023 = _909 * _1011;
    float _1025 = -_869;
    int _1027 = _873 ? as_type<int>(_1025) : as_type<int>(_869);
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1031 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1033 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    bool _1035 = !_851;
    float _1037 = _1035 ? _869 : as_type<float>(_1027);
    float _1039 = _1019 + 0.5;
    float _1041 = _1021 + _1031;
    float _1043 = fma(_975, _999, _1033);
    bool _1045 = _1007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1049 = fma(_1009, _977, _1043);
    float _1051 = -_1037;
    float _1053 = _1051 + 0.5;
    float _1055 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1057 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1049);
    float _1059 = _903;
    float _1061 = _857;
    float _1063 = _775;
    if (!_1045)
    {
        _1059 = _957;
    }
    float _1065 = _1059;
    float _1067 = _1065;
    if (!_1045)
    {
        _1061 = _943;
    }
    float _1069 = _1061;
    float _1071 = _1069;
    if (!_1045)
    {
        _1063 = _1041;
    }
    float _1073 = _1063;
    bool _1075 = !_1045;
    float _1077 = _1073;
    if (!_1075)
    {
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1083 = _1007 + _1081;
        float _1085 = rsqrt(_997);
        float _1087 = _1083 * _1079;
        float _1089 = _1041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1091 = _1087 * 0.15915493667125701904296875;
        float _1093 = _1091 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        float _1097 = _1091 * 6.283185482025146484375;
        float _1099 = sin(_1097);
        float _1101 = _1095 + (-1.0);
        float _1103 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = fma(_1099, _1089, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1107 = fma(_1041, _1095, _1103);
        float _1109 = _1085 * _1105;
        float _1111 = fma(_981, _1109, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1113 = fma(_973, _1109, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1077 = _1107;
        _1067 = _1111;
        _1071 = _1113;
    }
    float _1115 = _1077;
    float _1117 = _1067;
    float _1119 = _1071;
    float _1121 = -_1021;
    float _1123 = _1121 + _1115;
    float _1125 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1127 = -_921;
    float _1129 = _1127 + _1117;
    float _1131 = _1055 * _1029;
    float _1133 = _1123 * _1123;
    float _1135 = _1125 * _1047;
    float _1137 = -_877;
    float _1139 = _1137 + _1119;
    float _1141 = fma(_1129, _1129, _1133);
    float _1143 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1145 = fma(_1139, _1139, _1141);
    float _1147 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1149 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1153 = sqrt(_1145);
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1159 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1165 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1057 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1131;
    out.m_56.y = _1135;
    out.m_58.x = _1163;
    out.m_58.y = _1165;
    out.m_58.z = _1167;
    bool _1173 = _1153 > 0.0;
    out.m_60.x = _1159;
    out.m_60.y = _1161;
    out.m_60.z = _1169;
    out.m_60.w = _1171;
    bool _1175 = !_1173;
    float _1177 = _1163;
    float _1179 = _1161;
    float _1181 = _1165;
    float _1183 = _1117;
    float _1185 = _1115;
    float _1187 = _1119;
    float _1189 = _1163;
    float _1191 = _1167;
    float _1193 = _1165;
    if (!_1175)
    {
        bool _1195 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1197 = _1167;
        if (_1195)
        {
            float _1199 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1197 = _1199;
        }
        float _1201 = _1197;
        if (_1195)
        {
            float _1203 = _465 * _1201;
            _1177 = _1203;
        }
        float _1205 = _1177;
        float _1207 = _1205;
        float _1209 = _1205;
        if (_1195)
        {
            float _1211 = _467 * _1201;
            _1179 = _1211;
        }
        float _1213 = _1179;
        float _1215 = _1213;
        if (_1195)
        {
            float _1217 = _469 * _1201;
            _1181 = _1217;
        }
        float _1219 = _1181;
        float _1221 = _1219;
        if (!_1195)
        {
            float _1223 = _117 + 1.0;
            float _1225 = _1223;
            if (!_155)
            {
                float _1227 = _1223 * _1223;
                float _1229 = _1227 * 0.5;
                _1207 = _1229;
            }
            float _1231 = _1207;
            float _1233 = _1231;
            if (!_155)
            {
                float _1235 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1233 = _1235;
            }
            float _1237 = _1233;
            bool _1239 = !_155;
            float _1241 = _1237;
            if (!_1239)
            {
                float _1243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1245 = log2(_1243);
                float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1249 = _1247 + 1.0;
                float _1251 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1253 = _1245 * _1223;
                float _1255 = 1.0 / _1249;
                float _1257 = _1251 * 0.693147182464599609375;
                float _1259 = exp2(_1253);
                float _1261 = 1.0 / _1257;
                float _1263 = _1259 + (-1.0);
                float _1265 = -_1263;
                float _1267 = fma(_1265, _1261, _1223);
                float _1269 = _1267 * _1255;
                float _1271 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1241 = _1271;
            }
            float _1273 = _1241;
            float _1275 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1277 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1279 = !_155;
            if (!_1279)
            {
                float _1281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1283 = log2(_1281);
                float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1287 = _1285 + 1.0;
                float _1289 = 1.0 / _1287;
                float _1291 = _1283 * _1223;
                float _1293 = exp2(_1291);
                float _1295 = -_1293;
                float _1297 = _1295 + 1.0;
                float _1299 = _1297 * _1289;
                _1225 = _1299;
                _191 = _1289;
            }
            float _1301 = _1225;
            float _1303 = _191;
            float _1305 = fma(_1301, _169, _1277);
            float _1307 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1309 = fma(_1301, _167, _1275);
            float _1311 = -_409;
            float _1313 = _1311 + _1305;
            float _1315 = fma(_1301, _171, _1307);
            float _1317 = -_415;
            float _1319 = _1317 + _1309;
            float _1321 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1323 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1325 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1327 = -_417;
            float _1329 = _1327 + _1315;
            float _1331 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1321);
            float _1333 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1323);
            float _1335 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1325);
            float _1337 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1331);
            float _1339 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1333);
            float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1335);
            _477 = _1339;
            _479 = _1337;
            _481 = _1341;
            _1209 = _1337;
            _1215 = _1339;
            _1221 = _1341;
            _193 = _1303;
        }
        float _1343 = _477;
        float _1345 = _479;
        float _1347 = _481;
        float _1349 = _1209;
        float _1351 = _1215;
        float _1353 = _1221;
        float _1355 = _193;
        float _1357 = _1343 * _1343;
        float _1359 = rsqrt(_1145);
        float _1361 = fma(_1345, _1345, _1357);
        float _1363 = fma(_1347, _1347, _1361);
        float _1365 = sqrt(_1363);
        float _1367 = _1129 * _1359;
        float _1369 = _1123 * _1359;
        float _1371 = _1139 * _1359;
        bool _1373 = _1365 > 0.0;
        bool _1375 = !_1373;
        _1189 = _1349;
        _1191 = _1371;
        _1193 = _1353;
        _195 = _1355;
        _483 = _1345;
        if (!_1375)
        {
            float _1377 = rsqrt(_1363);
            float _1379 = _1377 * _1343;
            float _1381 = _1377 * _1345;
            float _1383 = _1377 * _1347;
            float _1385 = _1369 * _1379;
            float _1387 = fma(_1367, _1381, _1385);
            float _1389 = fma(_1371, _1383, _1387);
            float _1391 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1393 = fma(_1349, _1391, _1117);
            float _1395 = fma(_1351, _1391, _1115);
            float _1397 = fma(_1353, _1391, _1119);
            _1183 = _1393;
            _1185 = _1395;
            _1187 = _1397;
        }
    }
    float _1399 = _1183;
    float _1401 = _1185;
    float _1403 = _1187;
    float _1405 = _1189;
    float _1407 = _1191;
    float _1409 = _1193;
    float _1411 = _195;
    float _1413 = _483;
    float _1415 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1417 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1419 = isnan(0.5);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1425 = _1421 || _1423;
    bool _1427 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1429 = isnan(0.5);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1435 = _1431 || _1433;
    float _1437 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1415);
    float _1439 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1441 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1437);
    float _1443 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1439);
    float _1445 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1447 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1443);
    float _1449 = _1405;
    float _1451 = _1407;
    float _1453 = _1409;
    float _1455 = _1411;
    float _1457 = _1413;
    if (_1425)
    {
        _1449 = _1399;
    }
    float _1459 = _1449;
    float _1461 = 1.0 / _1445;
    float _1463 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1465 = _1463;
    float _1467 = _1459;
    if (_1425)
    {
        _1451 = _1401;
    }
    float _1469 = _1451;
    float _1471 = _1469;
    if (_1425)
    {
        _1453 = _1403;
    }
    float _1473 = _1453;
    float _1475 = _1463 + _1445;
    float _1477 = _1473;
    if (!_1425)
    {
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1481 = _1021 + _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1485 = _921 + _1483;
        float _1487 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1489 = -_921;
        float _1491 = _1489 + _1399;
        float _1493 = _1481 * _1481;
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1497 = _877 + _1495;
        float _1499 = -_1021;
        float _1501 = _1499 + _1401;
        float _1503 = -_877;
        float _1505 = _1503 + _1403;
        float _1507 = fma(_1485, _1485, _1493);
        float _1509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1511 = fma(_1497, _1497, _1507);
        float _1513 = sqrt(_1511);
        float _1515 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1517 = precise::min(_1513, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1519 = _1517 * _1509;
        float _1521 = _1515 * _1519;
        float _1523 = fma(_1491, _1521, _921);
        float _1525 = fma(_1501, _1521, _1021);
        float _1527 = fma(_1505, _1521, _877);
        _1465 = _1513;
        _1471 = _1525;
        _1467 = _1523;
        _1477 = _1527;
    }
    float _1529 = _1465;
    float _1531 = _1471;
    float _1533 = _1467;
    float _1535 = _1477;
    float _1537 = _1529;
    if (_1435)
    {
        _1537 = 1.0;
    }
    float _1539 = _1537;
    float _1541 = _1475 * _1461;
    float _1543 = _1541 * 0.5;
    float _1545 = _1539;
    if (!_1435)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1549 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1547);
        float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1555 = 1.0 / _1549;
        float _1557 = 1.0 / _1553;
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1563 = fma(_1555, _1559, _1561);
        float _1565 = _1563 * _1557;
        float _1567 = precise::clamp(_1565, 0.0, 1.0);
        _1545 = _1567;
    }
    float _1569 = _1545;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1573 = _1531 + _1571;
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1577 = _1533 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1581 = _1535 + _1579;
    float _1583 = _1573 * _1573;
    float _1585 = fma(_1577, _1577, _1583);
    float _1587 = fma(_1581, _1581, _1585);
    float _1589 = rsqrt(_1587);
    float _1591 = sqrt(_1587);
    float _1593 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1595 = _1577 * _1593;
    float _1597 = _1581 * _1593;
    float _1599 = _1595 * _1595;
    float _1601 = _1597 * _1597;
    float _1603 = _1599 + _1601;
    float _1605 = sqrt(_1603);
    bool _1607 = _1605 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1611 = _1605 + _1609;
    float _1613 = _1581;
    float _1615 = _1589;
    float _1617 = _1611;
    float _1619 = _1573;
    float _1621 = _1595;
    if (_1607)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1613 = _1623;
    }
    float _1625 = _1613;
    if (_1607)
    {
        float _1627 = rsqrt(_1603);
        _1615 = _1627;
    }
    float _1629 = _1615;
    float _1631 = _1629;
    if (_1607)
    {
        float _1633 = _1611 * _1625;
        _1617 = _1633;
    }
    float _1635 = _1617;
    if (_1607)
    {
        float _1637 = _1635 * 0.15915493667125701904296875;
        _1455 = _1637;
    }
    float _1639 = _1455;
    float _1641 = _1625;
    if (_1607)
    {
        float _1643 = _1639 * 6.283185482025146484375;
        float _1645 = sin(_1643);
        _1641 = _1645;
    }
    float _1647 = _1641;
    float _1649 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1651 = precise::max(0.0, _1649);
    float _1653 = _1583;
    float _1655 = _1651;
    if (_1607)
    {
        float _1657 = _1639 * 6.283185482025146484375;
        float _1659 = cos(_1657);
        _1653 = _1659;
    }
    float _1661 = _1653;
    float _1663 = -_1593;
    float _1665 = -_1651;
    float _1667 = fma(_1573, _1663, _1665);
    if (!_1607)
    {
        _1619 = _1599;
    }
    float _1669 = _1619;
    float _1671 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1673 = _1669;
    if (_1607)
    {
        float _1675 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1655 = _1675;
    }
    float _1677 = _1655;
    float _1679 = _1647;
    float _1681 = _1677;
    if (_1607)
    {
        float _1683 = fma(_1647, _1677, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1679 = _1683;
    }
    float _1685 = _1679;
    float _1687 = _1685;
    if (_1607)
    {
        float _1689 = _1661 + (-1.0);
        _1681 = _1689;
    }
    float _1691 = _1681;
    float _1693 = _1691;
    if (_1607)
    {
        float _1695 = _1629 * _1685;
        _1457 = _1695;
    }
    float _1697 = _1457;
    if (!_1607)
    {
        _1631 = _1667;
    }
    float _1699 = _1631;
    float _1701 = _1699;
    if (_1607)
    {
        float _1703 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1693 = _1703;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (_1607)
    {
        float _1709 = _1595 * _1697;
        _1621 = _1709;
    }
    float _1711 = _1621;
    if (!_1607)
    {
        _1687 = _1597;
    }
    float _1713 = _1687;
    float _1715 = _1713;
    if (_1607)
    {
        float _1717 = _1597 * _1697;
        _1715 = _1717;
    }
    float _1719 = _1715;
    if (_1607)
    {
        float _1721 = fma(_1667, _1661, _1705);
        _1701 = _1721;
    }
    float _1723 = _1701;
    if (_1607)
    {
        float _1725 = _1711 * _1711;
        _1673 = _1725;
    }
    float _1727 = _1673;
    if (!_1607)
    {
        _1707 = _1601;
    }
    float _1729 = _1707;
    float _1731 = _1729;
    if (_1607)
    {
        float _1733 = _1719 * _1719;
        _1731 = _1733;
    }
    float _1735 = _1731;
    float _1737 = fma(_1723, _1723, _1727);
    float _1739 = _1737 + _1735;
    float _1741 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1743 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1745 = fma(_1591, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1743);
    float _1747 = precise::clamp(_1745, 0.0, 1.0);
    float _1749 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1751 = rsqrt(_1739);
    float _1753 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1741);
    float _1755 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1757 = -_1747;
    float _1759 = _1757 + 1.0;
    float _1761 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1763 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1765 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1755);
    float _1767 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1761);
    float _1769 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1771 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1765);
    float _1773 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1671);
    float _1775 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1767);
    float _1777 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1779 = abs(_1759);
    float _1781 = log2(_1779);
    float _1783 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1785 = _1751 * _1711;
    float _1787 = -_1777;
    float _1789 = fma(_1787, _1749, 1.0);
    float _1791 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1773);
    float _1793 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1795 = _1751 * _1723;
    float _1797 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1799 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1801 = _1751 * _1719;
    float _1803 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1805 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1797);
    float _1807 = -_1799;
    float _1809 = fma(_1795, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1807);
    float _1811 = log2(_1789);
    float _1813 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1805);
    float _1815 = -_1801;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1809);
    float _1819 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1821 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1823 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1813);
    float _1825 = fma(_1817, -0.5, 0.5);
    float _1827 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1829 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1821);
    float _1831 = 1.0 / _1823;
    float _1833 = fma(_1817, 0.5, 0.5);
    float _1835 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1827);
    float _1837 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1829);
    float _1839 = _1795 + 1.0;
    float _1841 = fma(_1833, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1843 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1835);
    float _1845 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1837);
    float _1847 = exp2(_1819);
    float _1849 = fma(_1833, _1841, -0.212114393711090087890625);
    float _1851 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1843);
    float _1853 = _1811 * 0.693147182464599609375;
    float _1855 = fma(_1833, _1849, 1.570728778839111328125);
    float _1857 = sqrt(_1825);
    float _1859 = _1845 * _1831;
    float _1861 = _1851 * _1831;
    float _1863 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1865 = fma(_1859, 0.5, 0.5);
    float _1867 = fma(_1861, -0.5, 0.5);
    float _1869 = -_1795;
    float _1871 = fma(_1847, _1839, _1869);
    float3 _4829 = float3(_1865, _1867, _1863);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4829, float3(0.0), isnan(_4829)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4829, float3(0.0), isnan(_4829)), level(0.0)).x;
    float3 _4840 = float3(_1865, _1867, _1863);
    float4 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4840, float3(0.0), isnan(_4840)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4840, float3(0.0), isnan(_4840)), level(0.0)).xyzw;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = _1876.w;
    float _1886 = fma(_1871, 0.5, 0.5);
    float _1888 = _1857 * 0.636619746685028076171875;
    float _1890 = -_1855;
    float _1892 = fma(_1888, _1890, 1.0);
    float2 _4867 = float2(_1892, _1886);
    float3 _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4867, float2(0.0), isnan(_4867)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4867, float2(0.0), isnan(_4867)), level(0.0)).xyz;
    float _1898 = _1896.x;
    float _1900 = _1896.y;
    float _1902 = _1896.z;
    float _1904 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1906 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1908 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1910 = _1569 > 0.0;
    bool _1912 = isnan(_1569);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1906);
    float _1922 = exp2(_1904);
    float _1924 = _473 * _1908;
    float _1926 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1920);
    float _1928 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1926);
    float _1930 = _1928 + _1823;
    out.gl_Position.x = _1845;
    out.gl_Position.y = _1851;
    out.gl_Position.z = _1928;
    out.gl_Position.w = _1823;
    float _1932 = _1930 * 0.5;
    float _1934 = -_1922;
    float _1936 = _1934 + 1.0;
    float _1938 = _1924 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1940 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1932;
    out.m_62.w = _1823;
    out.m_45.x = _1938;
    float _1942 = _1940 * _1873;
    float _1944 = -_1940;
    float _1946 = _1944 + 1.0;
    float _1948 = _1884 * _1942;
    float _1950 = _1902 * _1942;
    float _1952 = fma(_1898, _1948, _1878);
    float _1954 = fma(_1900, _1948, _1880);
    float _1956 = _1884 * _1946;
    float _1958 = fma(_1884, _1950, _1882);
    out.m_64.x = _1952;
    out.m_64.y = _1954;
    out.m_64.z = _1958;
    out.m_64.w = _1956;
    if (_1918)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1960 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1960;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _767 = false;
    bool _647 = false;
    bool _501 = false;
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
        float _2017 = as_type<float>(_99);
        out.gl_Position.z = _2017;
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
        float _2086 = as_type<float>(_135);
        out.gl_Position.z = _2086;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.w;
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = in.m_47.x;
    float _169 = in.m_47.y;
    float _171 = in.m_47.z;
    float _173 = _165 * 6.283185482025146484375;
    float _175 = floor(_165);
    float _177 = _173 * 0.15915493667125701904296875;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _177 * 6.283185482025146484375;
    float _185 = cos(_183);
    float _187 = 1.4012984643248170709237295832899e-45;
    float _189 = _145;
    float _191 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_155)
    {
        float _197 = _145 * _145;
        float _199 = _197 * 0.5;
        _187 = _199;
    }
    float _201 = _187;
    float _203 = _201;
    if (!_155)
    {
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    float _209 = -_175;
    float _211 = _165 + _209;
    bool _213 = !_155;
    float _215 = _207;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _145 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _145);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_155;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _145 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _189 = _269;
    }
    float _271 = _189;
    float _273 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_271, _167, _273);
    bool _281 = _211 < 0.5;
    float _283 = float(_281);
    float _285 = fma(_271, _169, _275);
    float _287 = fma(_185, 0.5, 0.5);
    float _289 = fma(_271, _171, _277);
    float _291 = _275;
    if (!_155)
    {
        float _293 = _117 * _117;
        float _295 = _293 * 0.5;
        _291 = _295;
    }
    float _297 = _291;
    float _299 = -_211;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_283;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = -_287;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = fma(_279, _143, _157);
    float _313 = fma(_285, _143, _159);
    float _315 = fma(_289, _143, _161);
    float _317 = _297;
    if (!_155)
    {
        float _319 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _317 = _319;
    }
    float _321 = _317;
    float _323 = 0.0;
    float _325 = _321;
    if (!_155)
    {
        _323 = _117;
    }
    float _327 = _323;
    bool _329 = !_181;
    int _331 = _329 ? 0 : 1;
    bool _333 = !_155;
    float _335 = _327;
    if (!_333)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _347 = _117 * _339;
        float _349 = 1.0 / _343;
        float _351 = _345 * 0.693147182464599609375;
        float _353 = exp2(_347);
        float _355 = 1.0 / _351;
        float _357 = _353 + (-1.0);
        float _359 = -_357;
        float _361 = fma(_359, _355, _117);
        float _363 = _361 * _349;
        float _365 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _325 = _365;
    }
    float _367 = _325;
    bool _369 = !_155;
    if (!_369)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _377 = _375 + 1.0;
        float _379 = 1.0 / _377;
        float _381 = _117 * _373;
        float _383 = exp2(_381);
        float _385 = -_383;
        float _387 = _385 + 1.0;
        float _389 = _387 * _379;
        _335 = _389;
    }
    float _391 = _335;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _395 = _393 != 0;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _399 = _397 != 0;
    float _401 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _403 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _405 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _407 = abs(_331);
    float _409 = fma(_391, _169, _401);
    bool _411 = !_395;
    int _413 = _411 ? 0 : 1;
    float _415 = fma(_391, _167, _403);
    float _417 = fma(_391, _171, _405);
    bool _419 = !_399;
    int _421 = _419 ? 0 : 1;
    int _423 = abs(_413);
    float _425 = -_409;
    float _427 = _285 + _425;
    float _429 = -_415;
    float _431 = _279 + _429;
    int _433 = abs(_421);
    float _435 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _439 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _443 = float(_423);
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _447 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _449 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
    float _451 = float(_407);
    float _453 = abs(_301);
    float _455 = _443 * _453;
    float _457 = -_417;
    float _459 = _289 + _457;
    float _461 = fma(_451, _309, _455);
    float _463 = float(_433);
    float _465 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _467 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    float _471 = abs(_305);
    float _473 = fma(_463, _471, _461);
    bool _475 = !_437;
    float _477 = _467;
    float _479 = _465;
    float _481 = _469;
    float _483 = _465;
    float _499;
    if (!_475)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _487 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_83);
        float _505 = 1.0 / _503;
        float _507 = _117 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = _509 + _511;
    bool _515 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _517 = isnan(_509);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    bool _527 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_509);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _547 = -_525;
    float _549 = _547 + 1.0;
    float _551 = 1.0 / _541;
    bool _553 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _555 = isnan(_509);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = _537 * _549;
    float _567 = -_537;
    float _569 = _567 + 1.0;
    bool _571 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _573 = _563 * _569;
    float _575 = 1.0 / _545;
    float _577 = -_563;
    float _579 = _577 + 1.0;
    float _581 = _513 * _551;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _585 = _509 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _591;
    float _595 = fma(_589, _581, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _597 = fma(_593, _581, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _599 = _585 * _575;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _605 = _595 * _573;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _611 = _597 * _573;
    float _613 = fma(_603, _599, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _615 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _617 = fma(_609, _599, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _619 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].y, _611);
    float _621 = fma(_613, _565, _615);
    float _623 = fma(_617, _565, _619);
    float _625 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[145].x, _621);
    float _627 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[145].y, _623);
    bool _629 = !_571;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_83);
        float _651 = 1.0 / _649;
        float _653 = _117 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_51.x;
    float _659 = in.m_51.y;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _663 = _655 + _661;
    bool _665 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _667 = isnan(_655);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _677;
    float _681 = -_675;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _687 = 1.0 / _679;
    float _689 = _627 * _659;
    float _691 = _663 * _687;
    bool _693 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _695 = isnan(_655);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _713;
    float _717 = _703 * _683;
    float _719 = fma(_707, _691, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _721 = fma(_711, _691, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _723 = fma(_715, _691, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _725 = -_703;
    float _727 = _725 + 1.0;
    float _729 = _719 * _717;
    float _731 = _721 * _717;
    float _733 = _723 * _717;
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].x, _729);
    float _737 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].y, _731);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].z, _733);
    float _741 = _625 * _657;
    float _743 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].x, _735);
    float _745 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].y, _737);
    float _747 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].z, _739);
    bool _749 = !_685;
    float _765;
    if (!_749)
    {
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _753 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_83);
        float _771 = 1.0 / _769;
        float _773 = _117 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = as_type<float>(int(gl_VertexIndex));
    float _779 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _781 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _783 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _785 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].x, _779);
    float _787 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].x, _781);
    float _789 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].x, _783);
    bool _791 = _137 > 0.5;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _797 = in.m_49.y;
    float _799 = _473 * _689;
    float _801 = 1.0 / _795;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _807 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _813 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _787);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _815;
    bool _819 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _821 = isnan(_775);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = 1.0 / _805;
    int _833 = as_type<int>(_777) & 1;
    bool _835 = _833 != 0;
    int _837 = as_type<int>(_777) & 2;
    bool _839 = _837 != 0;
    float _841 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _785);
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _845 = _843 != 0;
    float _847 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _789);
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _851 = _849 != 0;
    float _853 = _473 * _741;
    bool _855 = !_835;
    float _857 = _855 ? (-0.5) : 0.5;
    float _859 = 1.0 / _811;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _865 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _867 = !_839;
    float _869 = _867 ? (-0.5) : 0.5;
    float _871 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _857);
    bool _873 = _797 > 0.5;
    float _875 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _877 = _847 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _869);
    float _881 = _865 * _871;
    float _883 = _863 * _831;
    float _885 = _817 * _801;
    float _887 = _807 * _879;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _891 = _775 + _889;
    bool _893 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _895 = isnan(_775);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = _887 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _907 = _887 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _909 = fma(_885, _891, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _911 = _887 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _913 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _905);
    float _915 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _907);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _917;
    float _921 = _841 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _913);
    float _925 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _915);
    float _927 = _919 * _859;
    float _929 = -_903;
    float _931 = _929 + 1.0;
    float _933 = _923 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _935 = _925 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _939 = _775 + _937;
    float _941 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _911);
    float _943 = _877 + _933;
    bool _945 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _947 = isnan(_775);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = _921 + _935;
    bool _959 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _961 = isnan(_775);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _973 = _943 + _971;
    float _975 = fma(_883, _939, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _977 = _955 * _931;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _981 = _957 + _979;
    float _983 = _973 * _973;
    float _985 = -_955;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _991 = _775 + _989;
    float _993 = -_857;
    int _995 = _791 ? as_type<int>(_993) : as_type<int>(_857);
    float _997 = fma(_981, _981, _983);
    float _999 = _969 * _987;
    float _1001 = -_969;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _1007 = sqrt(_997);
    float _1009 = fma(_927, _991, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1011 = _829 * _1003;
    float _1013 = -_829;
    float _1015 = _1013 + 1.0;
    bool _1017 = !_845;
    float _1019 = _1017 ? _857 : as_type<float>(_995);
    float _1021 = _813 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1023 = _909 * _1011;
    float _1025 = -_869;
    int _1027 = _873 ? as_type<int>(_1025) : as_type<int>(_869);
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1031 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1033 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    bool _1035 = !_851;
    float _1037 = _1035 ? _869 : as_type<float>(_1027);
    float _1039 = _1019 + 0.5;
    float _1041 = _1021 + _1031;
    float _1043 = fma(_975, _999, _1033);
    bool _1045 = _1007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1049 = fma(_1009, _977, _1043);
    float _1051 = -_1037;
    float _1053 = _1051 + 0.5;
    float _1055 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1057 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1049);
    float _1059 = _903;
    float _1061 = _857;
    float _1063 = _775;
    if (!_1045)
    {
        _1059 = _957;
    }
    float _1065 = _1059;
    float _1067 = _1065;
    if (!_1045)
    {
        _1061 = _943;
    }
    float _1069 = _1061;
    float _1071 = _1069;
    if (!_1045)
    {
        _1063 = _1041;
    }
    float _1073 = _1063;
    bool _1075 = !_1045;
    float _1077 = _1073;
    if (!_1075)
    {
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1083 = _1007 + _1081;
        float _1085 = rsqrt(_997);
        float _1087 = _1083 * _1079;
        float _1089 = _1041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1091 = _1087 * 0.15915493667125701904296875;
        float _1093 = _1091 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        float _1097 = _1091 * 6.283185482025146484375;
        float _1099 = sin(_1097);
        float _1101 = _1095 + (-1.0);
        float _1103 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = fma(_1099, _1089, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1107 = fma(_1041, _1095, _1103);
        float _1109 = _1085 * _1105;
        float _1111 = fma(_981, _1109, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1113 = fma(_973, _1109, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1077 = _1107;
        _1067 = _1111;
        _1071 = _1113;
    }
    float _1115 = _1077;
    float _1117 = _1067;
    float _1119 = _1071;
    float _1121 = -_1021;
    float _1123 = _1121 + _1115;
    float _1125 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1127 = -_921;
    float _1129 = _1127 + _1117;
    float _1131 = _1055 * _1029;
    float _1133 = _1123 * _1123;
    float _1135 = _1125 * _1047;
    float _1137 = -_877;
    float _1139 = _1137 + _1119;
    float _1141 = fma(_1129, _1129, _1133);
    float _1143 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1145 = fma(_1139, _1139, _1141);
    float _1147 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1149 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1153 = sqrt(_1145);
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1159 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1165 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1057 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1131;
    out.m_56.y = _1135;
    out.m_58.x = _1163;
    out.m_58.y = _1165;
    out.m_58.z = _1167;
    bool _1173 = _1153 > 0.0;
    out.m_60.x = _1159;
    out.m_60.y = _1161;
    out.m_60.z = _1169;
    out.m_60.w = _1171;
    bool _1175 = !_1173;
    float _1177 = _1163;
    float _1179 = _1161;
    float _1181 = _1165;
    float _1183 = _1117;
    float _1185 = _1115;
    float _1187 = _1119;
    float _1189 = _1163;
    float _1191 = _1167;
    float _1193 = _1165;
    if (!_1175)
    {
        bool _1195 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1197 = _1167;
        if (_1195)
        {
            float _1199 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1197 = _1199;
        }
        float _1201 = _1197;
        if (_1195)
        {
            float _1203 = _465 * _1201;
            _1177 = _1203;
        }
        float _1205 = _1177;
        float _1207 = _1205;
        float _1209 = _1205;
        if (_1195)
        {
            float _1211 = _467 * _1201;
            _1179 = _1211;
        }
        float _1213 = _1179;
        float _1215 = _1213;
        if (_1195)
        {
            float _1217 = _469 * _1201;
            _1181 = _1217;
        }
        float _1219 = _1181;
        float _1221 = _1219;
        if (!_1195)
        {
            float _1223 = _117 + 1.0;
            float _1225 = _1223;
            if (!_155)
            {
                float _1227 = _1223 * _1223;
                float _1229 = _1227 * 0.5;
                _1207 = _1229;
            }
            float _1231 = _1207;
            float _1233 = _1231;
            if (!_155)
            {
                float _1235 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1233 = _1235;
            }
            float _1237 = _1233;
            bool _1239 = !_155;
            float _1241 = _1237;
            if (!_1239)
            {
                float _1243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1245 = log2(_1243);
                float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1249 = _1247 + 1.0;
                float _1251 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1253 = _1245 * _1223;
                float _1255 = 1.0 / _1249;
                float _1257 = _1251 * 0.693147182464599609375;
                float _1259 = exp2(_1253);
                float _1261 = 1.0 / _1257;
                float _1263 = _1259 + (-1.0);
                float _1265 = -_1263;
                float _1267 = fma(_1265, _1261, _1223);
                float _1269 = _1267 * _1255;
                float _1271 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1241 = _1271;
            }
            float _1273 = _1241;
            float _1275 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1277 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1279 = !_155;
            if (!_1279)
            {
                float _1281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1283 = log2(_1281);
                float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1287 = _1285 + 1.0;
                float _1289 = 1.0 / _1287;
                float _1291 = _1283 * _1223;
                float _1293 = exp2(_1291);
                float _1295 = -_1293;
                float _1297 = _1295 + 1.0;
                float _1299 = _1297 * _1289;
                _1225 = _1299;
                _191 = _1289;
            }
            float _1301 = _1225;
            float _1303 = _191;
            float _1305 = fma(_1301, _169, _1277);
            float _1307 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1309 = fma(_1301, _167, _1275);
            float _1311 = -_409;
            float _1313 = _1311 + _1305;
            float _1315 = fma(_1301, _171, _1307);
            float _1317 = -_415;
            float _1319 = _1317 + _1309;
            float _1321 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1323 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1325 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1327 = -_417;
            float _1329 = _1327 + _1315;
            float _1331 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1321);
            float _1333 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1323);
            float _1335 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1325);
            float _1337 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1331);
            float _1339 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1333);
            float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1335);
            _477 = _1339;
            _479 = _1337;
            _481 = _1341;
            _1209 = _1337;
            _1215 = _1339;
            _1221 = _1341;
            _193 = _1303;
        }
        float _1343 = _477;
        float _1345 = _479;
        float _1347 = _481;
        float _1349 = _1209;
        float _1351 = _1215;
        float _1353 = _1221;
        float _1355 = _193;
        float _1357 = _1343 * _1343;
        float _1359 = rsqrt(_1145);
        float _1361 = fma(_1345, _1345, _1357);
        float _1363 = fma(_1347, _1347, _1361);
        float _1365 = sqrt(_1363);
        float _1367 = _1129 * _1359;
        float _1369 = _1123 * _1359;
        float _1371 = _1139 * _1359;
        bool _1373 = _1365 > 0.0;
        bool _1375 = !_1373;
        _1189 = _1349;
        _1191 = _1371;
        _1193 = _1353;
        _195 = _1355;
        _483 = _1345;
        if (!_1375)
        {
            float _1377 = rsqrt(_1363);
            float _1379 = _1377 * _1343;
            float _1381 = _1377 * _1345;
            float _1383 = _1377 * _1347;
            float _1385 = _1369 * _1379;
            float _1387 = fma(_1367, _1381, _1385);
            float _1389 = fma(_1371, _1383, _1387);
            float _1391 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1393 = fma(_1349, _1391, _1117);
            float _1395 = fma(_1351, _1391, _1115);
            float _1397 = fma(_1353, _1391, _1119);
            _1183 = _1393;
            _1185 = _1395;
            _1187 = _1397;
        }
    }
    float _1399 = _1183;
    float _1401 = _1185;
    float _1403 = _1187;
    float _1405 = _1189;
    float _1407 = _1191;
    float _1409 = _1193;
    float _1411 = _195;
    float _1413 = _483;
    float _1415 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1417 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1419 = isnan(0.5);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1425 = _1421 || _1423;
    bool _1427 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1429 = isnan(0.5);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1435 = _1431 || _1433;
    float _1437 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1415);
    float _1439 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1441 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1437);
    float _1443 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1439);
    float _1445 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1447 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1443);
    float _1449 = _1405;
    float _1451 = _1407;
    float _1453 = _1409;
    float _1455 = _1411;
    float _1457 = _1413;
    if (_1425)
    {
        _1449 = _1399;
    }
    float _1459 = _1449;
    float _1461 = 1.0 / _1445;
    float _1463 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1465 = _1463;
    float _1467 = _1459;
    if (_1425)
    {
        _1451 = _1401;
    }
    float _1469 = _1451;
    float _1471 = _1469;
    if (_1425)
    {
        _1453 = _1403;
    }
    float _1473 = _1453;
    float _1475 = _1463 + _1445;
    float _1477 = _1473;
    if (!_1425)
    {
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1481 = _1021 + _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1485 = _921 + _1483;
        float _1487 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1489 = -_921;
        float _1491 = _1489 + _1399;
        float _1493 = _1481 * _1481;
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1497 = _877 + _1495;
        float _1499 = -_1021;
        float _1501 = _1499 + _1401;
        float _1503 = -_877;
        float _1505 = _1503 + _1403;
        float _1507 = fma(_1485, _1485, _1493);
        float _1509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1511 = fma(_1497, _1497, _1507);
        float _1513 = sqrt(_1511);
        float _1515 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1517 = precise::min(_1513, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1519 = _1517 * _1509;
        float _1521 = _1515 * _1519;
        float _1523 = fma(_1491, _1521, _921);
        float _1525 = fma(_1501, _1521, _1021);
        float _1527 = fma(_1505, _1521, _877);
        _1465 = _1513;
        _1471 = _1525;
        _1467 = _1523;
        _1477 = _1527;
    }
    float _1529 = _1465;
    float _1531 = _1471;
    float _1533 = _1467;
    float _1535 = _1477;
    float _1537 = _1529;
    if (_1435)
    {
        _1537 = 1.0;
    }
    float _1539 = _1537;
    float _1541 = _1475 * _1461;
    float _1543 = _1541 * 0.5;
    float _1545 = _1539;
    if (!_1435)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1549 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1547);
        float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1555 = 1.0 / _1549;
        float _1557 = 1.0 / _1553;
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1563 = fma(_1555, _1559, _1561);
        float _1565 = _1563 * _1557;
        float _1567 = precise::clamp(_1565, 0.0, 1.0);
        _1545 = _1567;
    }
    float _1569 = _1545;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1573 = _1531 + _1571;
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1577 = _1533 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1581 = _1535 + _1579;
    float _1583 = _1573 * _1573;
    float _1585 = fma(_1577, _1577, _1583);
    float _1587 = fma(_1581, _1581, _1585);
    float _1589 = rsqrt(_1587);
    float _1591 = sqrt(_1587);
    float _1593 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1595 = _1577 * _1593;
    float _1597 = _1581 * _1593;
    float _1599 = _1595 * _1595;
    float _1601 = _1597 * _1597;
    float _1603 = _1599 + _1601;
    float _1605 = sqrt(_1603);
    bool _1607 = _1605 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1611 = _1605 + _1609;
    float _1613 = _1581;
    float _1615 = _1589;
    float _1617 = _1611;
    float _1619 = _1573;
    float _1621 = _1595;
    if (_1607)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1613 = _1623;
    }
    float _1625 = _1613;
    if (_1607)
    {
        float _1627 = rsqrt(_1603);
        _1615 = _1627;
    }
    float _1629 = _1615;
    float _1631 = _1629;
    if (_1607)
    {
        float _1633 = _1611 * _1625;
        _1617 = _1633;
    }
    float _1635 = _1617;
    if (_1607)
    {
        float _1637 = _1635 * 0.15915493667125701904296875;
        _1455 = _1637;
    }
    float _1639 = _1455;
    float _1641 = _1625;
    if (_1607)
    {
        float _1643 = _1639 * 6.283185482025146484375;
        float _1645 = sin(_1643);
        _1641 = _1645;
    }
    float _1647 = _1641;
    float _1649 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1651 = precise::max(0.0, _1649);
    float _1653 = _1583;
    float _1655 = _1651;
    if (_1607)
    {
        float _1657 = _1639 * 6.283185482025146484375;
        float _1659 = cos(_1657);
        _1653 = _1659;
    }
    float _1661 = _1653;
    float _1663 = -_1593;
    float _1665 = -_1651;
    float _1667 = fma(_1573, _1663, _1665);
    if (!_1607)
    {
        _1619 = _1599;
    }
    float _1669 = _1619;
    float _1671 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1673 = _1669;
    if (_1607)
    {
        float _1675 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1655 = _1675;
    }
    float _1677 = _1655;
    float _1679 = _1647;
    float _1681 = _1677;
    if (_1607)
    {
        float _1683 = fma(_1647, _1677, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1679 = _1683;
    }
    float _1685 = _1679;
    float _1687 = _1685;
    if (_1607)
    {
        float _1689 = _1661 + (-1.0);
        _1681 = _1689;
    }
    float _1691 = _1681;
    float _1693 = _1691;
    if (_1607)
    {
        float _1695 = _1629 * _1685;
        _1457 = _1695;
    }
    float _1697 = _1457;
    if (!_1607)
    {
        _1631 = _1667;
    }
    float _1699 = _1631;
    float _1701 = _1699;
    if (_1607)
    {
        float _1703 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1693 = _1703;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (_1607)
    {
        float _1709 = _1595 * _1697;
        _1621 = _1709;
    }
    float _1711 = _1621;
    if (!_1607)
    {
        _1687 = _1597;
    }
    float _1713 = _1687;
    float _1715 = _1713;
    if (_1607)
    {
        float _1717 = _1597 * _1697;
        _1715 = _1717;
    }
    float _1719 = _1715;
    if (_1607)
    {
        float _1721 = fma(_1667, _1661, _1705);
        _1701 = _1721;
    }
    float _1723 = _1701;
    if (_1607)
    {
        float _1725 = _1711 * _1711;
        _1673 = _1725;
    }
    float _1727 = _1673;
    if (!_1607)
    {
        _1707 = _1601;
    }
    float _1729 = _1707;
    float _1731 = _1729;
    if (_1607)
    {
        float _1733 = _1719 * _1719;
        _1731 = _1733;
    }
    float _1735 = _1731;
    float _1737 = fma(_1723, _1723, _1727);
    float _1739 = _1737 + _1735;
    float _1741 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1743 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1745 = fma(_1591, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1743);
    float _1747 = precise::clamp(_1745, 0.0, 1.0);
    float _1749 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1751 = rsqrt(_1739);
    float _1753 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1741);
    float _1755 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1757 = -_1747;
    float _1759 = _1757 + 1.0;
    float _1761 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1763 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1765 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1755);
    float _1767 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1761);
    float _1769 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1771 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1765);
    float _1773 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1671);
    float _1775 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1767);
    float _1777 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1779 = abs(_1759);
    float _1781 = log2(_1779);
    float _1783 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1785 = _1751 * _1711;
    float _1787 = -_1777;
    float _1789 = fma(_1787, _1749, 1.0);
    float _1791 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1773);
    float _1793 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1795 = _1751 * _1723;
    float _1797 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1799 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1801 = _1751 * _1719;
    float _1803 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1805 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1797);
    float _1807 = -_1799;
    float _1809 = fma(_1795, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1807);
    float _1811 = log2(_1789);
    float _1813 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1805);
    float _1815 = -_1801;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1809);
    float _1819 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1821 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1823 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1813);
    float _1825 = fma(_1817, -0.5, 0.5);
    float _1827 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1829 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1821);
    float _1831 = 1.0 / _1823;
    float _1833 = fma(_1817, 0.5, 0.5);
    float _1835 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1827);
    float _1837 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1829);
    float _1839 = _1795 + 1.0;
    float _1841 = fma(_1833, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1843 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1835);
    float _1845 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1837);
    float _1847 = exp2(_1819);
    float _1849 = fma(_1833, _1841, -0.212114393711090087890625);
    float _1851 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1843);
    float _1853 = _1811 * 0.693147182464599609375;
    float _1855 = fma(_1833, _1849, 1.570728778839111328125);
    float _1857 = sqrt(_1825);
    float _1859 = _1845 * _1831;
    float _1861 = _1851 * _1831;
    float _1863 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1865 = fma(_1859, 0.5, 0.5);
    float _1867 = fma(_1861, -0.5, 0.5);
    float _1869 = -_1795;
    float _1871 = fma(_1847, _1839, _1869);
    float3 _4829 = float3(_1865, _1867, _1863);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4829, float3(0.0), isnan(_4829)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4829, float3(0.0), isnan(_4829)), level(0.0)).x;
    float3 _4840 = float3(_1865, _1867, _1863);
    float4 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4840, float3(0.0), isnan(_4840)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4840, float3(0.0), isnan(_4840)), level(0.0)).xyzw;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = _1876.w;
    float _1886 = fma(_1871, 0.5, 0.5);
    float _1888 = _1857 * 0.636619746685028076171875;
    float _1890 = -_1855;
    float _1892 = fma(_1888, _1890, 1.0);
    float2 _4867 = float2(_1892, _1886);
    float3 _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4867, float2(0.0), isnan(_4867)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4867, float2(0.0), isnan(_4867)), level(0.0)).xyz;
    float _1898 = _1896.x;
    float _1900 = _1896.y;
    float _1902 = _1896.z;
    float _1904 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1906 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1908 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1910 = _1569 > 0.0;
    bool _1912 = isnan(_1569);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1906);
    float _1922 = exp2(_1904);
    float _1924 = _473 * _1908;
    float _1926 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1920);
    float _1928 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1926);
    float _1930 = _1928 + _1823;
    out.gl_Position.x = _1845;
    out.gl_Position.y = _1851;
    out.gl_Position.z = _1928;
    out.gl_Position.w = _1823;
    float _1932 = _1930 * 0.5;
    float _1934 = -_1922;
    float _1936 = _1934 + 1.0;
    float _1938 = _1924 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1940 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1932;
    out.m_62.w = _1823;
    out.m_45.x = _1938;
    float _1942 = _1940 * _1873;
    float _1944 = -_1940;
    float _1946 = _1944 + 1.0;
    float _1948 = _1884 * _1942;
    float _1950 = _1902 * _1942;
    float _1952 = fma(_1898, _1948, _1878);
    float _1954 = fma(_1900, _1948, _1880);
    float _1956 = _1884 * _1946;
    float _1958 = fma(_1884, _1950, _1882);
    out.m_64.x = _1952;
    out.m_64.y = _1954;
    out.m_64.z = _1958;
    out.m_64.w = _1956;
    if (_1918)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1960 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1960;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _767 = false;
    bool _647 = false;
    bool _501 = false;
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
        float _2017 = as_type<float>(_99);
        out.gl_Position.z = _2017;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2086 = as_type<float>(_135);
        out.gl_Position.z = _2086;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.w;
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = in.m_47.x;
    float _169 = in.m_47.y;
    float _171 = in.m_47.z;
    float _173 = _165 * 6.283185482025146484375;
    float _175 = floor(_165);
    float _177 = _173 * 0.15915493667125701904296875;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _177 * 6.283185482025146484375;
    float _185 = cos(_183);
    float _187 = 1.4012984643248170709237295832899e-45;
    float _189 = _145;
    float _191 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_155)
    {
        float _197 = _145 * _145;
        float _199 = _197 * 0.5;
        _187 = _199;
    }
    float _201 = _187;
    float _203 = _201;
    if (!_155)
    {
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    float _209 = -_175;
    float _211 = _165 + _209;
    bool _213 = !_155;
    float _215 = _207;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _145 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _145);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _215 = _245;
    }
    float _247 = _215;
    bool _249 = !_155;
    if (!_249)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _145 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _189 = _269;
    }
    float _271 = _189;
    float _273 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_271, _167, _273);
    bool _281 = _211 < 0.5;
    float _283 = float(_281);
    float _285 = fma(_271, _169, _275);
    float _287 = fma(_185, 0.5, 0.5);
    float _289 = fma(_271, _171, _277);
    float _291 = _275;
    if (!_155)
    {
        float _293 = _117 * _117;
        float _295 = _293 * 0.5;
        _291 = _295;
    }
    float _297 = _291;
    float _299 = -_211;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_283;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = -_287;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = fma(_279, _143, _157);
    float _313 = fma(_285, _143, _159);
    float _315 = fma(_289, _143, _161);
    float _317 = _297;
    if (!_155)
    {
        float _319 = _297 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _317 = _319;
    }
    float _321 = _317;
    float _323 = 0.0;
    float _325 = _321;
    if (!_155)
    {
        _323 = _117;
    }
    float _327 = _323;
    bool _329 = !_181;
    int _331 = _329 ? 0 : 1;
    bool _333 = !_155;
    float _335 = _327;
    if (!_333)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _347 = _117 * _339;
        float _349 = 1.0 / _343;
        float _351 = _345 * 0.693147182464599609375;
        float _353 = exp2(_347);
        float _355 = 1.0 / _351;
        float _357 = _353 + (-1.0);
        float _359 = -_357;
        float _361 = fma(_359, _355, _117);
        float _363 = _361 * _349;
        float _365 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _325 = _365;
    }
    float _367 = _325;
    bool _369 = !_155;
    if (!_369)
    {
        float _371 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _373 = log2(_371);
        float _375 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _377 = _375 + 1.0;
        float _379 = 1.0 / _377;
        float _381 = _117 * _373;
        float _383 = exp2(_381);
        float _385 = -_383;
        float _387 = _385 + 1.0;
        float _389 = _387 * _379;
        _335 = _389;
    }
    float _391 = _335;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _395 = _393 != 0;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _399 = _397 != 0;
    float _401 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _403 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _405 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _407 = abs(_331);
    float _409 = fma(_391, _169, _401);
    bool _411 = !_395;
    int _413 = _411 ? 0 : 1;
    float _415 = fma(_391, _167, _403);
    float _417 = fma(_391, _171, _405);
    bool _419 = !_399;
    int _421 = _419 ? 0 : 1;
    int _423 = abs(_413);
    float _425 = -_409;
    float _427 = _285 + _425;
    float _429 = -_415;
    float _431 = _279 + _429;
    int _433 = abs(_421);
    float _435 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _439 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _441 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _443 = float(_423);
    float _445 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _447 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
    float _449 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
    float _451 = float(_407);
    float _453 = abs(_301);
    float _455 = _443 * _453;
    float _457 = -_417;
    float _459 = _289 + _457;
    float _461 = fma(_451, _309, _455);
    float _463 = float(_433);
    float _465 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    float _467 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[5].z, _447);
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
    float _471 = abs(_305);
    float _473 = fma(_463, _471, _461);
    bool _475 = !_437;
    float _477 = _467;
    float _479 = _465;
    float _481 = _469;
    float _483 = _465;
    float _499;
    if (!_475)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _487 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _489 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _491 = _489 * _485;
        float _493 = floor(_491);
        float _495 = -_493;
        float _497 = _491 + _495;
        _499 = _497;
        _501 = true;
    }
    else
    {
        float _503 = float(_83);
        float _505 = 1.0 / _503;
        float _507 = _117 * _505;
        _499 = _507;
    }
    _501 = false;
    float _509 = _499;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _513 = _509 + _511;
    bool _515 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _517 = isnan(_509);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    bool _527 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_509);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _547 = -_525;
    float _549 = _547 + 1.0;
    float _551 = 1.0 / _541;
    bool _553 = _509 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _555 = isnan(_509);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = _537 * _549;
    float _567 = -_537;
    float _569 = _567 + 1.0;
    bool _571 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _573 = _563 * _569;
    float _575 = 1.0 / _545;
    float _577 = -_563;
    float _579 = _577 + 1.0;
    float _581 = _513 * _551;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _585 = _509 + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _591;
    float _595 = fma(_589, _581, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _597 = fma(_593, _581, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _599 = _585 * _575;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _605 = _595 * _573;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _611 = _597 * _573;
    float _613 = fma(_603, _599, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _615 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _617 = fma(_609, _599, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _619 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].y, _611);
    float _621 = fma(_613, _565, _615);
    float _623 = fma(_617, _565, _619);
    float _625 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[145].x, _621);
    float _627 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[145].y, _623);
    bool _629 = !_571;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_83);
        float _651 = 1.0 / _649;
        float _653 = _117 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = in.m_51.x;
    float _659 = in.m_51.y;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _663 = _655 + _661;
    bool _665 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _667 = isnan(_655);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _677;
    float _681 = -_675;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _687 = 1.0 / _679;
    float _689 = _627 * _659;
    float _691 = _663 * _687;
    bool _693 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _695 = isnan(_655);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _713;
    float _717 = _703 * _683;
    float _719 = fma(_707, _691, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _721 = fma(_711, _691, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _723 = fma(_715, _691, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _725 = -_703;
    float _727 = _725 + 1.0;
    float _729 = _719 * _717;
    float _731 = _721 * _717;
    float _733 = _723 * _717;
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].x, _729);
    float _737 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].y, _731);
    float _739 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].z, _733);
    float _741 = _625 * _657;
    float _743 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].x, _735);
    float _745 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].y, _737);
    float _747 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[108].z, _739);
    bool _749 = !_685;
    float _765;
    if (!_749)
    {
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _753 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_83);
        float _771 = 1.0 / _769;
        float _773 = _117 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = as_type<float>(int(gl_VertexIndex));
    float _779 = _313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _781 = _313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _783 = _313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _785 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].x, _779);
    float _787 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].x, _781);
    float _789 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].x, _783);
    bool _791 = _137 > 0.5;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _797 = in.m_49.y;
    float _799 = _473 * _689;
    float _801 = 1.0 / _795;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _807 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _813 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _787);
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _815;
    bool _819 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _821 = isnan(_775);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _827 = _823 || _825;
    float _829 = float(_827);
    float _831 = 1.0 / _805;
    int _833 = as_type<int>(_777) & 1;
    bool _835 = _833 != 0;
    int _837 = as_type<int>(_777) & 2;
    bool _839 = _837 != 0;
    float _841 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _785);
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _845 = _843 != 0;
    float _847 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _789);
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _851 = _849 != 0;
    float _853 = _473 * _741;
    bool _855 = !_835;
    float _857 = _855 ? (-0.5) : 0.5;
    float _859 = 1.0 / _811;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _865 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _867 = !_839;
    float _869 = _867 ? (-0.5) : 0.5;
    float _871 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _857);
    bool _873 = _797 > 0.5;
    float _875 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _877 = _847 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _869);
    float _881 = _865 * _871;
    float _883 = _863 * _831;
    float _885 = _817 * _801;
    float _887 = _807 * _879;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _891 = _775 + _889;
    bool _893 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _895 = isnan(_775);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = _887 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _907 = _887 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _909 = fma(_885, _891, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _911 = _887 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _913 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _905);
    float _915 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _907);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _917;
    float _921 = _841 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _923 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _913);
    float _925 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _915);
    float _927 = _919 * _859;
    float _929 = -_903;
    float _931 = _929 + 1.0;
    float _933 = _923 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _935 = _925 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _939 = _775 + _937;
    float _941 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _911);
    float _943 = _877 + _933;
    bool _945 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _947 = isnan(_775);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _953 = _949 || _951;
    float _955 = float(_953);
    float _957 = _921 + _935;
    bool _959 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _961 = isnan(_775);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _973 = _943 + _971;
    float _975 = fma(_883, _939, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _977 = _955 * _931;
    float _979 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _981 = _957 + _979;
    float _983 = _973 * _973;
    float _985 = -_955;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _991 = _775 + _989;
    float _993 = -_857;
    int _995 = _791 ? as_type<int>(_993) : as_type<int>(_857);
    float _997 = fma(_981, _981, _983);
    float _999 = _969 * _987;
    float _1001 = -_969;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _941);
    float _1007 = sqrt(_997);
    float _1009 = fma(_927, _991, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1011 = _829 * _1003;
    float _1013 = -_829;
    float _1015 = _1013 + 1.0;
    bool _1017 = !_845;
    float _1019 = _1017 ? _857 : as_type<float>(_995);
    float _1021 = _813 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1023 = _909 * _1011;
    float _1025 = -_869;
    int _1027 = _873 ? as_type<int>(_1025) : as_type<int>(_869);
    float _1029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1031 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1033 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1023);
    bool _1035 = !_851;
    float _1037 = _1035 ? _869 : as_type<float>(_1027);
    float _1039 = _1019 + 0.5;
    float _1041 = _1021 + _1031;
    float _1043 = fma(_975, _999, _1033);
    bool _1045 = _1007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1049 = fma(_1009, _977, _1043);
    float _1051 = -_1037;
    float _1053 = _1051 + 0.5;
    float _1055 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1057 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1049);
    float _1059 = _903;
    float _1061 = _857;
    float _1063 = _775;
    if (!_1045)
    {
        _1059 = _957;
    }
    float _1065 = _1059;
    float _1067 = _1065;
    if (!_1045)
    {
        _1061 = _943;
    }
    float _1069 = _1061;
    float _1071 = _1069;
    if (!_1045)
    {
        _1063 = _1041;
    }
    float _1073 = _1063;
    bool _1075 = !_1045;
    float _1077 = _1073;
    if (!_1075)
    {
        float _1079 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1083 = _1007 + _1081;
        float _1085 = rsqrt(_997);
        float _1087 = _1083 * _1079;
        float _1089 = _1041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1091 = _1087 * 0.15915493667125701904296875;
        float _1093 = _1091 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        float _1097 = _1091 * 6.283185482025146484375;
        float _1099 = sin(_1097);
        float _1101 = _1095 + (-1.0);
        float _1103 = _1101 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = fma(_1099, _1089, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1107 = fma(_1041, _1095, _1103);
        float _1109 = _1085 * _1105;
        float _1111 = fma(_981, _1109, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1113 = fma(_973, _1109, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1077 = _1107;
        _1067 = _1111;
        _1071 = _1113;
    }
    float _1115 = _1077;
    float _1117 = _1067;
    float _1119 = _1071;
    float _1121 = -_1021;
    float _1123 = _1121 + _1115;
    float _1125 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1127 = -_921;
    float _1129 = _1127 + _1117;
    float _1131 = _1055 * _1029;
    float _1133 = _1123 * _1123;
    float _1135 = _1125 * _1047;
    float _1137 = -_877;
    float _1139 = _1137 + _1119;
    float _1141 = fma(_1129, _1129, _1133);
    float _1143 = _743 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1145 = fma(_1139, _1139, _1141);
    float _1147 = _747 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1149 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1153 = sqrt(_1145);
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1159 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1163 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1165 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1057 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1131;
    out.m_56.y = _1135;
    out.m_58.x = _1163;
    out.m_58.y = _1165;
    out.m_58.z = _1167;
    bool _1173 = _1153 > 0.0;
    out.m_60.x = _1159;
    out.m_60.y = _1161;
    out.m_60.z = _1169;
    out.m_60.w = _1171;
    bool _1175 = !_1173;
    float _1177 = _1163;
    float _1179 = _1161;
    float _1181 = _1165;
    float _1183 = _1117;
    float _1185 = _1115;
    float _1187 = _1119;
    float _1189 = _1163;
    float _1191 = _1167;
    float _1193 = _1165;
    if (!_1175)
    {
        bool _1195 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1197 = _1167;
        if (_1195)
        {
            float _1199 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1197 = _1199;
        }
        float _1201 = _1197;
        if (_1195)
        {
            float _1203 = _465 * _1201;
            _1177 = _1203;
        }
        float _1205 = _1177;
        float _1207 = _1205;
        float _1209 = _1205;
        if (_1195)
        {
            float _1211 = _467 * _1201;
            _1179 = _1211;
        }
        float _1213 = _1179;
        float _1215 = _1213;
        if (_1195)
        {
            float _1217 = _469 * _1201;
            _1181 = _1217;
        }
        float _1219 = _1181;
        float _1221 = _1219;
        if (!_1195)
        {
            float _1223 = _117 + 1.0;
            float _1225 = _1223;
            if (!_155)
            {
                float _1227 = _1223 * _1223;
                float _1229 = _1227 * 0.5;
                _1207 = _1229;
            }
            float _1231 = _1207;
            float _1233 = _1231;
            if (!_155)
            {
                float _1235 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1233 = _1235;
            }
            float _1237 = _1233;
            bool _1239 = !_155;
            float _1241 = _1237;
            if (!_1239)
            {
                float _1243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1245 = log2(_1243);
                float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1249 = _1247 + 1.0;
                float _1251 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1253 = _1245 * _1223;
                float _1255 = 1.0 / _1249;
                float _1257 = _1251 * 0.693147182464599609375;
                float _1259 = exp2(_1253);
                float _1261 = 1.0 / _1257;
                float _1263 = _1259 + (-1.0);
                float _1265 = -_1263;
                float _1267 = fma(_1265, _1261, _1223);
                float _1269 = _1267 * _1255;
                float _1271 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1241 = _1271;
            }
            float _1273 = _1241;
            float _1275 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1277 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1279 = !_155;
            if (!_1279)
            {
                float _1281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1283 = log2(_1281);
                float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1287 = _1285 + 1.0;
                float _1289 = 1.0 / _1287;
                float _1291 = _1283 * _1223;
                float _1293 = exp2(_1291);
                float _1295 = -_1293;
                float _1297 = _1295 + 1.0;
                float _1299 = _1297 * _1289;
                _1225 = _1299;
                _191 = _1289;
            }
            float _1301 = _1225;
            float _1303 = _191;
            float _1305 = fma(_1301, _169, _1277);
            float _1307 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1309 = fma(_1301, _167, _1275);
            float _1311 = -_409;
            float _1313 = _1311 + _1305;
            float _1315 = fma(_1301, _171, _1307);
            float _1317 = -_415;
            float _1319 = _1317 + _1309;
            float _1321 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1323 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1325 = _1313 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1327 = -_417;
            float _1329 = _1327 + _1315;
            float _1331 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1321);
            float _1333 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1323);
            float _1335 = fma(_1319, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1325);
            float _1337 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1331);
            float _1339 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1333);
            float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1335);
            _477 = _1339;
            _479 = _1337;
            _481 = _1341;
            _1209 = _1337;
            _1215 = _1339;
            _1221 = _1341;
            _193 = _1303;
        }
        float _1343 = _477;
        float _1345 = _479;
        float _1347 = _481;
        float _1349 = _1209;
        float _1351 = _1215;
        float _1353 = _1221;
        float _1355 = _193;
        float _1357 = _1343 * _1343;
        float _1359 = rsqrt(_1145);
        float _1361 = fma(_1345, _1345, _1357);
        float _1363 = fma(_1347, _1347, _1361);
        float _1365 = sqrt(_1363);
        float _1367 = _1129 * _1359;
        float _1369 = _1123 * _1359;
        float _1371 = _1139 * _1359;
        bool _1373 = _1365 > 0.0;
        bool _1375 = !_1373;
        _1189 = _1349;
        _1191 = _1371;
        _1193 = _1353;
        _195 = _1355;
        _483 = _1345;
        if (!_1375)
        {
            float _1377 = rsqrt(_1363);
            float _1379 = _1377 * _1343;
            float _1381 = _1377 * _1345;
            float _1383 = _1377 * _1347;
            float _1385 = _1369 * _1379;
            float _1387 = fma(_1367, _1381, _1385);
            float _1389 = fma(_1371, _1383, _1387);
            float _1391 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1393 = fma(_1349, _1391, _1117);
            float _1395 = fma(_1351, _1391, _1115);
            float _1397 = fma(_1353, _1391, _1119);
            _1183 = _1393;
            _1185 = _1395;
            _1187 = _1397;
        }
    }
    float _1399 = _1183;
    float _1401 = _1185;
    float _1403 = _1187;
    float _1405 = _1189;
    float _1407 = _1191;
    float _1409 = _1193;
    float _1411 = _195;
    float _1413 = _483;
    float _1415 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1417 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1419 = isnan(0.5);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1425 = _1421 || _1423;
    bool _1427 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1429 = isnan(0.5);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1435 = _1431 || _1433;
    float _1437 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1415);
    float _1439 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1441 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1437);
    float _1443 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1439);
    float _1445 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1447 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1443);
    float _1449 = _1405;
    float _1451 = _1407;
    float _1453 = _1409;
    float _1455 = _1411;
    float _1457 = _1413;
    if (_1425)
    {
        _1449 = _1399;
    }
    float _1459 = _1449;
    float _1461 = 1.0 / _1445;
    float _1463 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1465 = _1463;
    float _1467 = _1459;
    if (_1425)
    {
        _1451 = _1401;
    }
    float _1469 = _1451;
    float _1471 = _1469;
    if (_1425)
    {
        _1453 = _1403;
    }
    float _1473 = _1453;
    float _1475 = _1463 + _1445;
    float _1477 = _1473;
    if (!_1425)
    {
        float _1479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1481 = _1021 + _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1485 = _921 + _1483;
        float _1487 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1489 = -_921;
        float _1491 = _1489 + _1399;
        float _1493 = _1481 * _1481;
        float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1497 = _877 + _1495;
        float _1499 = -_1021;
        float _1501 = _1499 + _1401;
        float _1503 = -_877;
        float _1505 = _1503 + _1403;
        float _1507 = fma(_1485, _1485, _1493);
        float _1509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1511 = fma(_1497, _1497, _1507);
        float _1513 = sqrt(_1511);
        float _1515 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1517 = precise::min(_1513, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1519 = _1517 * _1509;
        float _1521 = _1515 * _1519;
        float _1523 = fma(_1491, _1521, _921);
        float _1525 = fma(_1501, _1521, _1021);
        float _1527 = fma(_1505, _1521, _877);
        _1465 = _1513;
        _1471 = _1525;
        _1467 = _1523;
        _1477 = _1527;
    }
    float _1529 = _1465;
    float _1531 = _1471;
    float _1533 = _1467;
    float _1535 = _1477;
    float _1537 = _1529;
    if (_1435)
    {
        _1537 = 1.0;
    }
    float _1539 = _1537;
    float _1541 = _1475 * _1461;
    float _1543 = _1541 * 0.5;
    float _1545 = _1539;
    if (!_1435)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1549 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1547);
        float _1551 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1553 = _1551 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1555 = 1.0 / _1549;
        float _1557 = 1.0 / _1553;
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1563 = fma(_1555, _1559, _1561);
        float _1565 = _1563 * _1557;
        float _1567 = precise::clamp(_1565, 0.0, 1.0);
        _1545 = _1567;
    }
    float _1569 = _1545;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1573 = _1531 + _1571;
    float _1575 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1577 = _1533 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1581 = _1535 + _1579;
    float _1583 = _1573 * _1573;
    float _1585 = fma(_1577, _1577, _1583);
    float _1587 = fma(_1581, _1581, _1585);
    float _1589 = rsqrt(_1587);
    float _1591 = sqrt(_1587);
    float _1593 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1595 = _1577 * _1593;
    float _1597 = _1581 * _1593;
    float _1599 = _1595 * _1595;
    float _1601 = _1597 * _1597;
    float _1603 = _1599 + _1601;
    float _1605 = sqrt(_1603);
    bool _1607 = _1605 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1611 = _1605 + _1609;
    float _1613 = _1581;
    float _1615 = _1589;
    float _1617 = _1611;
    float _1619 = _1573;
    float _1621 = _1595;
    if (_1607)
    {
        float _1623 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1613 = _1623;
    }
    float _1625 = _1613;
    if (_1607)
    {
        float _1627 = rsqrt(_1603);
        _1615 = _1627;
    }
    float _1629 = _1615;
    float _1631 = _1629;
    if (_1607)
    {
        float _1633 = _1611 * _1625;
        _1617 = _1633;
    }
    float _1635 = _1617;
    if (_1607)
    {
        float _1637 = _1635 * 0.15915493667125701904296875;
        _1455 = _1637;
    }
    float _1639 = _1455;
    float _1641 = _1625;
    if (_1607)
    {
        float _1643 = _1639 * 6.283185482025146484375;
        float _1645 = sin(_1643);
        _1641 = _1645;
    }
    float _1647 = _1641;
    float _1649 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1651 = precise::max(0.0, _1649);
    float _1653 = _1583;
    float _1655 = _1651;
    if (_1607)
    {
        float _1657 = _1639 * 6.283185482025146484375;
        float _1659 = cos(_1657);
        _1653 = _1659;
    }
    float _1661 = _1653;
    float _1663 = -_1593;
    float _1665 = -_1651;
    float _1667 = fma(_1573, _1663, _1665);
    if (!_1607)
    {
        _1619 = _1599;
    }
    float _1669 = _1619;
    float _1671 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1673 = _1669;
    if (_1607)
    {
        float _1675 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1655 = _1675;
    }
    float _1677 = _1655;
    float _1679 = _1647;
    float _1681 = _1677;
    if (_1607)
    {
        float _1683 = fma(_1647, _1677, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1679 = _1683;
    }
    float _1685 = _1679;
    float _1687 = _1685;
    if (_1607)
    {
        float _1689 = _1661 + (-1.0);
        _1681 = _1689;
    }
    float _1691 = _1681;
    float _1693 = _1691;
    if (_1607)
    {
        float _1695 = _1629 * _1685;
        _1457 = _1695;
    }
    float _1697 = _1457;
    if (!_1607)
    {
        _1631 = _1667;
    }
    float _1699 = _1631;
    float _1701 = _1699;
    if (_1607)
    {
        float _1703 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1693 = _1703;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (_1607)
    {
        float _1709 = _1595 * _1697;
        _1621 = _1709;
    }
    float _1711 = _1621;
    if (!_1607)
    {
        _1687 = _1597;
    }
    float _1713 = _1687;
    float _1715 = _1713;
    if (_1607)
    {
        float _1717 = _1597 * _1697;
        _1715 = _1717;
    }
    float _1719 = _1715;
    if (_1607)
    {
        float _1721 = fma(_1667, _1661, _1705);
        _1701 = _1721;
    }
    float _1723 = _1701;
    if (_1607)
    {
        float _1725 = _1711 * _1711;
        _1673 = _1725;
    }
    float _1727 = _1673;
    if (!_1607)
    {
        _1707 = _1601;
    }
    float _1729 = _1707;
    float _1731 = _1729;
    if (_1607)
    {
        float _1733 = _1719 * _1719;
        _1731 = _1733;
    }
    float _1735 = _1731;
    float _1737 = fma(_1723, _1723, _1727);
    float _1739 = _1737 + _1735;
    float _1741 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1743 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1745 = fma(_1591, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1743);
    float _1747 = precise::clamp(_1745, 0.0, 1.0);
    float _1749 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1751 = rsqrt(_1739);
    float _1753 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1741);
    float _1755 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1757 = -_1747;
    float _1759 = _1757 + 1.0;
    float _1761 = _1531 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1763 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1753);
    float _1765 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1755);
    float _1767 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1761);
    float _1769 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1771 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1765);
    float _1773 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1671);
    float _1775 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1767);
    float _1777 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1779 = abs(_1759);
    float _1781 = log2(_1779);
    float _1783 = _1771 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1785 = _1751 * _1711;
    float _1787 = -_1777;
    float _1789 = fma(_1787, _1749, 1.0);
    float _1791 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1773);
    float _1793 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1795 = _1751 * _1723;
    float _1797 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1799 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1801 = _1751 * _1719;
    float _1803 = _1791 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1805 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1797);
    float _1807 = -_1799;
    float _1809 = fma(_1795, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1807);
    float _1811 = log2(_1789);
    float _1813 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1805);
    float _1815 = -_1801;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1809);
    float _1819 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1821 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1823 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1813);
    float _1825 = fma(_1817, -0.5, 0.5);
    float _1827 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1829 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1821);
    float _1831 = 1.0 / _1823;
    float _1833 = fma(_1817, 0.5, 0.5);
    float _1835 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1827);
    float _1837 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1829);
    float _1839 = _1795 + 1.0;
    float _1841 = fma(_1833, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1843 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1835);
    float _1845 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1837);
    float _1847 = exp2(_1819);
    float _1849 = fma(_1833, _1841, -0.212114393711090087890625);
    float _1851 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1843);
    float _1853 = _1811 * 0.693147182464599609375;
    float _1855 = fma(_1833, _1849, 1.570728778839111328125);
    float _1857 = sqrt(_1825);
    float _1859 = _1845 * _1831;
    float _1861 = _1851 * _1831;
    float _1863 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1865 = fma(_1859, 0.5, 0.5);
    float _1867 = fma(_1861, -0.5, 0.5);
    float _1869 = -_1795;
    float _1871 = fma(_1847, _1839, _1869);
    float3 _4829 = float3(_1865, _1867, _1863);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4829, float3(0.0), isnan(_4829)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4829, float3(0.0), isnan(_4829)), level(0.0)).x;
    float3 _4840 = float3(_1865, _1867, _1863);
    float4 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4840, float3(0.0), isnan(_4840)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4840, float3(0.0), isnan(_4840)), level(0.0)).xyzw;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = _1876.w;
    float _1886 = fma(_1871, 0.5, 0.5);
    float _1888 = _1857 * 0.636619746685028076171875;
    float _1890 = -_1855;
    float _1892 = fma(_1888, _1890, 1.0);
    float2 _4867 = float2(_1892, _1886);
    float3 _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4867, float2(0.0), isnan(_4867)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4867, float2(0.0), isnan(_4867)), level(0.0)).xyz;
    float _1898 = _1896.x;
    float _1900 = _1896.y;
    float _1902 = _1896.z;
    float _1904 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1906 = _1783 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1908 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1910 = _1569 > 0.0;
    bool _1912 = isnan(_1569);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1906);
    float _1922 = exp2(_1904);
    float _1924 = _473 * _1908;
    float _1926 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1920);
    float _1928 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1926);
    float _1930 = _1928 + _1823;
    out.gl_Position.x = _1845;
    out.gl_Position.y = _1851;
    out.gl_Position.z = _1928;
    out.gl_Position.w = _1823;
    float _1932 = _1930 * 0.5;
    float _1934 = -_1922;
    float _1936 = _1934 + 1.0;
    float _1938 = _1924 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1940 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1932;
    out.m_62.w = _1823;
    out.m_45.x = _1938;
    float _1942 = _1940 * _1873;
    float _1944 = -_1940;
    float _1946 = _1944 + 1.0;
    float _1948 = _1884 * _1942;
    float _1950 = _1902 * _1942;
    float _1952 = fma(_1898, _1948, _1878);
    float _1954 = fma(_1900, _1948, _1880);
    float _1956 = _1884 * _1946;
    float _1958 = fma(_1884, _1950, _1882);
    out.m_64.x = _1952;
    out.m_64.y = _1954;
    out.m_64.z = _1958;
    out.m_64.w = _1956;
    if (_1918)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1960 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1960;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

