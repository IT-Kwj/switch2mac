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
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
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
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1181 = false;
    bool _1003 = false;
    bool _675 = false;
    bool _383 = false;
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
        float _2263 = as_type<float>(_99);
        out.gl_Position.z = _2263;
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
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2331 = as_type<float>(_135);
        out.gl_Position.z = _2331;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = _165 * 6.283185482025146484375;
    float _169 = floor(_165);
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    float _181 = _145;
    if (!_161)
    {
        float _183 = _145 * _145;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _167 * 0.15915493667125701904296875;
    float _191 = _187;
    if (!_161)
    {
        float _193 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _189 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_173;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_169;
    float _211 = _165 + _209;
    bool _213 = !_177;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_161;
    float _219 = _195;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _145 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _145);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_161;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _181 = _273;
    }
    float _275 = _181;
    float _277 = fma(_203, 0.5, 0.5);
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_54.w;
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = -_211;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _299 = in.m_42.x;
    float _301 = in.m_42.y;
    float _303 = in.m_42.z;
    bool _305 = !_281;
    int _307 = _305 ? 0 : 1;
    float _309 = -_291;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = -_277;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = !_199;
    int _319 = _317 ? 0 : 1;
    int _321 = abs(_307);
    float _323 = fma(_275, _147, _297);
    bool _325 = !_285;
    int _327 = _325 ? 0 : 1;
    float _329 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _335 = abs(_319);
    float _337 = fma(_275, _149, _329);
    int _339 = abs(_327);
    float _341 = fma(_275, _151, _333);
    float _343 = float(_321);
    float _345 = float(_335);
    float _347 = abs(_295);
    float _349 = _343 * _347;
    float _351 = float(_339);
    float _353 = fma(_345, _315, _349);
    float _355 = fma(_323, _287, _299);
    float _357 = fma(_337, _287, _301);
    float _359 = fma(_341, _287, _303);
    float _361 = abs(_311);
    float _363 = fma(_351, _361, _353);
    bool _365 = !_331;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _391 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _413 = 1.0 / _399;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _415;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _421 = 1.0 / _403;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _391 + _423;
    float _427 = 1.0 / _411;
    float _429 = _425 * _413;
    bool _431 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _433 = isnan(_391);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = _391 + _443;
    bool _447 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _449 = isnan(_391);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = 1.0 / _407;
    float _461 = _395 * _421;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _465 = _391 + _463;
    bool _467 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _469 = isnan(_391);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = 1.0 / _417;
    float _481 = _465 * _427;
    bool _483 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _485 = isnan(_391);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _497 = _391 + _495;
    float _499 = -_493;
    float _501 = _499 + 1.0;
    float _503 = _445 * _459;
    float _505 = -_441;
    float _507 = _505 + 1.0;
    float _509 = -_477;
    float _511 = _509 + 1.0;
    float _513 = _477 * _501;
    bool _515 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_391);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = _493 * _507;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _533;
    float _537 = _497 * _479;
    bool _539 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _541 = isnan(_391);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = fma(_531, _429, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _553 = fma(_535, _429, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _555 = _457 * _511;
    float _557 = -_457;
    float _559 = _557 + 1.0;
    float _561 = -_525;
    float _563 = _561 + 1.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = _525 * _559;
    float _571 = _549 * _563;
    float _573 = fma(_567, _461, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _583 = _551 * _571;
    float _585 = -_549;
    float _587 = _585 + 1.0;
    float _589 = _553 * _571;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _591;
    float _595 = fma(_581, _461, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _597 = fma(_577, _503, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].x, _583);
    float _601 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].y, _589);
    float _603 = in.m_54.x;
    float _605 = in.m_54.y;
    float _607 = fma(_593, _503, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _617 = fma(_573, _569, _599);
    float _619 = fma(_595, _569, _601);
    float _621 = fma(_611, _481, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _623 = fma(_615, _481, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = fma(_597, _555, _617);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _631;
    float _635 = fma(_607, _555, _619);
    float _637 = fma(_627, _537, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _639 = fma(_621, _513, _629);
    float _641 = fma(_633, _537, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _643 = fma(_623, _513, _635);
    float _645 = fma(_637, _527, _639);
    float _647 = fma(_641, _527, _643);
    float _649 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[148].x, _645);
    float _651 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[148].y, _647);
    float _653 = _649 * _603;
    float _655 = _651 * _605;
    bool _657 = !_419;
    float _673;
    if (!_657)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _661 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        float _677 = float(_83);
        float _679 = 1.0 / _677;
        float _681 = _117 * _679;
        _673 = _681;
    }
    _675 = false;
    float _683 = _673;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _687 = _683 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _691 = _683 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _709 = 1.0 / _695;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _711;
    float _715 = 1.0 / _707;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _719 = _683 + _717;
    bool _721 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _723 = isnan(_683);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _733;
    float _737 = -_731;
    float _739 = _737 + 1.0;
    float _741 = 1.0 / _703;
    float _743 = _719 * _709;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _747 = _683 + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _749;
    bool _753 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _755 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _757 = fma(_751, _743, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _759 = 1.0 / _699;
    float _761 = _747 * _715;
    bool _763 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _765 = isnan(_683);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    bool _775 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _777 = isnan(_683);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = 1.0 / _713;
    float _789 = _687 * _741;
    bool _791 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _793 = isnan(_683);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = -_773;
    float _805 = _803 + 1.0;
    float _807 = _785 * _739;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = -_801;
    float _815 = _813 + 1.0;
    float _817 = _691 * _759;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _821 = _683 + _819;
    bool _823 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _825 = isnan(_683);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = _801 * _805;
    float _837 = _833 * _815;
    float _839 = _821 * _787;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _841;
    float _845 = -_833;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _853 = fma(_843, _743, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _855 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _857 = isnan(_683);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = _731 * _847;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _877 = fma(_851, _817, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _879 = _865 * _811;
    float _881 = fma(_871, _817, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _883 = fma(_875, _817, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _885 = _853 * _879;
    float _887 = -_865;
    float _889 = _887 + 1.0;
    float _891 = _755 * _879;
    float _893 = _757 * _879;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _895;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _899;
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[107].x, _885);
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[107].y, _891);
    float _907 = fma(_897, _789, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _913;
    float _917 = fma(_901, _789, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _919 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[107].z, _893);
    float _921 = fma(_881, _807, _903);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _927 = fma(_911, _761, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _929 = fma(_915, _789, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _931 = fma(_883, _807, _905);
    float _933 = fma(_877, _807, _919);
    float _935 = fma(_907, _867, _921);
    float _937 = fma(_925, _761, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _943 = fma(_917, _867, _931);
    float _945 = fma(_929, _867, _933);
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _951;
    float _955 = fma(_941, _761, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _957;
    float _961 = fma(_927, _837, _935);
    float _963 = fma(_949, _839, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _965 = fma(_953, _839, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _967 = fma(_937, _837, _943);
    float _969 = fma(_959, _839, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _971 = fma(_955, _837, _945);
    float _973 = fma(_963, _835, _961);
    float _975 = fma(_965, _835, _967);
    float _977 = fma(_969, _835, _971);
    float _979 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[112].x, _973);
    float _981 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[112].y, _975);
    float _983 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[112].z, _977);
    bool _985 = !_753;
    float _1001;
    if (!_985)
    {
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _989 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _993 = _991 * _987;
        float _995 = floor(_993);
        float _997 = -_995;
        float _999 = _993 + _997;
        _1001 = _999;
        _1003 = true;
    }
    else
    {
        float _1005 = float(_83);
        float _1007 = 1.0 / _1005;
        float _1009 = _117 * _1007;
        _1001 = _1009;
    }
    _1003 = false;
    float _1011 = _1001;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1015 = _1011 + _1013;
    float _1017 = _979 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1027 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1029 = isnan(_1011);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1043 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1045 = isnan(_1011);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = 1.0 / _1021;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1057;
    float _1061 = -_1037;
    float _1063 = _1061 + 1.0;
    bool _1065 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1067 = isnan(_1011);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1079 = _983 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1081 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1083 = 1.0 / _1025;
    float _1085 = 1.0 / _1041;
    float _1087 = _1059 * _1055;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1093 = _1053 * _1063;
    float _1095 = -_1053;
    float _1097 = _1095 + 1.0;
    float _1099 = fma(_1087, _1015, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1101;
    float _1105 = _1075 * _1097;
    float _1107 = _1091 * _1083;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1111 = _1011 + _1109;
    bool _1113 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1115 = isnan(_1011);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = _1099 * _1105;
    float _1127 = -_1075;
    float _1129 = _1127 + 1.0;
    float _1131 = fma(_1107, _1111, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1135 = _1011 + _1133;
    float _1137 = _1103 * _1085;
    float _1139 = -_1123;
    float _1141 = _1139 + 1.0;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1125);
    float _1145 = fma(_1137, _1135, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1147 = _1037 * _1141;
    float _1149 = fma(_1131, _1093, _1143);
    float _1151 = fma(_1145, _1147, _1149);
    float _1153 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1151);
    float _1159 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1153;
    out.m_56.y = _1159;
    out.m_56.z = _1155;
    out.m_56.w = _1161;
    bool _1163 = !_1081;
    float _1179;
    if (!_1163)
    {
        float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1167 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1169 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1171 = _1169 * _1165;
        float _1173 = floor(_1171);
        float _1175 = -_1173;
        float _1177 = _1171 + _1175;
        _1179 = _1177;
        _1181 = true;
    }
    else
    {
        float _1183 = float(_83);
        float _1185 = 1.0 / _1183;
        float _1187 = _117 * _1185;
        _1179 = _1187;
    }
    _1181 = false;
    float _1189 = _1179;
    float _1191 = in.m_49.y;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1195 = _1189 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1211 = _1209 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1213 = 1.0 / _1199;
    bool _1215 = _137 > 0.5;
    float _1217 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1221 = _1219 != 0;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1225 = _1223 != 0;
    float _1227 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1229 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1231 = 1.0 / _1203;
    float _1233 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1217);
    float _1235 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1227);
    float _1237 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1229);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1241 = _1189 + _1239;
    bool _1243 = _1191 > 0.5;
    float _1245 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1235);
    float _1247 = 1.0 / _1207;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1251 = _1189 + _1249;
    float _1253 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1255 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1257 = isnan(_1189);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = 1.0 / _1211;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1269;
    float _1273 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1233);
    float _1275 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1237);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1279 = _1189 + _1277;
    float _1281 = _1251 * _1213;
    float _1283 = _1241 * _1231;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1287 = _1189 + _1285;
    float _1289 = 1.0 / _1271;
    float _1291 = _1279 * _1247;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1305;
    float _1309 = _1287 * _1267;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1331 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1333 = isnan(_1189);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = _1195 * _1289;
    bool _1345 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1347 = isnan(_1189);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = fma(_1307, _1281, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1359 = fma(_1317, _1281, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1361 = fma(_1325, _1281, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1363 = fma(_1313, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1365 = fma(_1321, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1367 = fma(_1329, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1369;
    float _1373 = -_1341;
    float _1375 = _1373 + 1.0;
    float _1377 = -_1355;
    float _1379 = _1377 + 1.0;
    float _1381 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1383 = fma(_1371, _1291, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1385 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1387 = _1355 * _1375;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1397 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1399 = isnan(_1189);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = _1265 * _1379;
    float _1411 = -_1265;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_1303, _1309, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1417 = fma(_1391, _1309, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1419 = fma(_1395, _1309, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1421 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1423 = isnan(_1189);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1429 = _1425 || _1427;
    float _1431 = float(_1429);
    float _1433 = _1407 * _1413;
    bool _1435 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1437 = isnan(_1189);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    float _1447 = -_1407;
    float _1449 = _1447 + 1.0;
    float _1451 = _1273 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1453 = _1445 * _1449;
    float _1455 = -_1445;
    float _1457 = _1455 + 1.0;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1463;
    float _1467 = _1431 * _1457;
    float _1469 = -_1431;
    float _1471 = _1469 + 1.0;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1473;
    float _1477 = fma(_1461, _1343, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1479 = _1357 * _1467;
    float _1481 = _1359 * _1467;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1485 = _1253 + _1483;
    float _1487 = _1361 * _1467;
    float _1489 = _1275 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1493 = _1451 + _1491;
    float _1495 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1497 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1481);
    float _1499 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1479);
    float _1501 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1487);
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1505 = _1489 + _1503;
    float _1507 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1495);
    float _1509 = fma(_1365, _1453, _1497);
    float _1511 = fma(_1363, _1453, _1499);
    float _1513 = fma(_1367, _1453, _1501);
    float _1515 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1507);
    float _1517 = fma(_1383, _1433, _1509);
    float _1519 = -_207;
    int _1521 = _1215 ? as_type<int>(_1519) : as_type<int>(_207);
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1525 = _1485 * _1485;
    float _1527 = fma(_1381, _1433, _1511);
    float _1529 = fma(_1385, _1433, _1513);
    bool _1531 = !_1221;
    float _1533 = _1531 ? _207 : as_type<float>(_1521);
    float _1535 = fma(_1493, _1493, _1525);
    bool _1537 = _1515 >= 0.0;
    float _1539 = fma(_1465, _1343, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1541 = -_215;
    int _1543 = _1243 ? as_type<int>(_1541) : as_type<int>(_215);
    float _1545 = fma(_1475, _1343, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1547 = fma(_1415, _1409, _1527);
    float _1549 = fma(_1417, _1409, _1517);
    float _1551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1553 = fma(_1419, _1409, _1529);
    float _1555 = _1533 + 0.5;
    float _1557 = fma(_1505, _1505, _1535);
    bool _1559 = !_1225;
    float _1561 = _1559 ? _215 : as_type<float>(_1543);
    float _1563 = fma(_1477, _1387, _1547);
    float _1565 = fma(_1539, _1387, _1549);
    float _1567 = fma(_1545, _1387, _1553);
    float _1569 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1571 = -_1561;
    float _1573 = _1571 + 0.5;
    float _1575 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1563);
    float _1577 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1565);
    float _1579 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1567);
    float _1581 = rsqrt(_1557);
    float _1583 = _1569 * _1523;
    float _1585 = _1569;
    if (_1537)
    {
        _1585 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1587 = _1585;
    float _1589 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1591 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1593 = _1577 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1595 = _1579 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1597 = _1589 * _1551;
    int _1599 = as_type<int>(_1587);
    if (_1537)
    {
        float _1601 = _1587 * 5.0;
        _1599 = as_type<int>(_1601);
    }
    int _1603 = _1599;
    float _1605 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1607 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1609 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1583;
    out.m_58.y = _1597;
    float _1611 = _1485 * _1581;
    float _1613 = _1609;
    if (_1537)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4737 = as_type<float>(_1603);
        out.gl_Position.z = _4737;
    }
    float _1615 = _1493 * _1581;
    out.m_60.x = _1605;
    out.m_60.y = _1607;
    out.m_60.z = _1609;
    float _1617 = _1615;
    if (_1537)
    {
        out.m_45.x = 0.0;
    }
    if (_1537)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1619 = -_1611;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1623 = _1505 * _1581;
    float _1625 = -_1615;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1629 = -_1611;
    float _1631 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1485);
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1635 = _1621 + _1633;
    float _1637 = -_1623;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1489);
    float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1643 = _1627 + _1641;
    float _1645 = -_1615;
    float _1647 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1493);
    float _1649 = _1635 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1653 = _1639 + _1651;
    float _1655 = _1631 * _1631;
    float _1657 = -_1623;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1505);
    float _1661 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1649);
    float _1663 = _363 * _653;
    float _1665 = fma(_1647, _1647, _1655);
    float _1667 = _363 * _655;
    float _1669 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1661);
    float _1671 = fma(_1659, _1659, _1665);
    bool _1673 = _1669 >= 0.0;
    float _1675 = sqrt(_1671);
    if (_1673)
    {
        _1613 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1677 = _1613;
    int _1679 = as_type<int>(_1677);
    if (_1673)
    {
        out.m_45.x = 0.0;
    }
    float _1681 = _1581 * _1675;
    if (_1673)
    {
        float _1683 = _1677 * 5.0;
        _1679 = as_type<int>(_1683);
    }
    int _1685 = _1679;
    if (_1673)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4884 = as_type<float>(_1685);
        out.gl_Position.z = _4884;
    }
    if (_1673)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _1691 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1695 = _1681 * _1687;
    float _1697 = _1681 * _1691;
    float _1699 = _1689 * _1695;
    float _1701 = _1693 * _1697;
    float _1703 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1705 = _1703 * 0.5;
    float _1707 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1709 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1711 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1713 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1707);
    float _1715 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1709);
    float _1717 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1711);
    float _1719 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1713);
    float _1721 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1715);
    float _1723 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1717);
    float _1725 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1727 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1729 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1731 = _1489 + _1725;
    float _1733 = _1451 + _1727;
    float _1735 = _1253 + _1729;
    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1739 = _1731 + _1737;
    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1743 = _1733 + _1741;
    float _1745 = _1739 * _1739;
    float _1747 = fma(_1743, _1743, _1745);
    float _1749 = sqrt(_1747);
    bool _1751 = _1749 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1753 = _1705;
    float _1755 = _1729;
    float _1757 = _1723;
    float _1759 = _1731;
    float _1761 = _1747;
    if (!_1751)
    {
        _1753 = _1733;
    }
    float _1763 = _1753;
    float _1765 = _1763;
    if (!_1751)
    {
        _1755 = _1731;
    }
    float _1767 = _1755;
    float _1769 = _1767;
    if (!_1751)
    {
        _1757 = _1735;
    }
    float _1771 = _1757;
    bool _1773 = !_1751;
    float _1775 = _1771;
    if (!_1773)
    {
        float _1777 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1781 = _1749 + _1779;
        float _1783 = _1735 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1785 = rsqrt(_1747);
        float _1787 = _1781 * _1777;
        float _1789 = _1787 * 0.15915493667125701904296875;
        float _1791 = _1789 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = _1789 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = _1793 + (-1.0);
        float _1801 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1803 = fma(_1797, _1783, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1805 = fma(_1735, _1793, _1801);
        float _1807 = _1785 * _1803;
        float _1809 = fma(_1743, _1807, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1811 = fma(_1739, _1807, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1775 = _1805;
        _1765 = _1809;
        _1769 = _1811;
        _1759 = _1789;
    }
    float _1813 = _1775;
    float _1815 = _1765;
    float _1817 = _1769;
    float _1819 = _1759;
    float _1821 = -_1611;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1813);
    float _1825 = -_1615;
    float _1827 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1815);
    float _1829 = -_1623;
    float _1831 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1817);
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1835 = _1823 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1839 = _1827 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = _1831 + _1841;
    float _1845 = _1835 * _1835;
    float _1847 = fma(_1839, _1839, _1845);
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = rsqrt(_1849);
    float _1853 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1855 = _1839 * _1853;
    float _1857 = _1843 * _1853;
    float _1859 = _1855 * _1855;
    float _1861 = _1857 * _1857;
    float _1863 = _1859 + _1861;
    float _1865 = sqrt(_1863);
    bool _1867 = _1865 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1871 = _1865 + _1869;
    float _1873 = _1851;
    float _1875 = _1819;
    float _1877 = _1871;
    float _1879 = _1853;
    float _1881 = _1835;
    float _1883 = _1855;
    if (_1867)
    {
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1873 = _1885;
    }
    float _1887 = _1873;
    if (_1867)
    {
        float _1889 = rsqrt(_1863);
        _1875 = _1889;
    }
    float _1891 = _1875;
    float _1893 = _1891;
    if (_1867)
    {
        float _1895 = _1871 * _1887;
        _1877 = _1895;
    }
    float _1897 = _1877;
    if (_1867)
    {
        float _1899 = _1897 * 0.15915493667125701904296875;
        _1617 = _1899;
    }
    float _1901 = _1617;
    float _1903 = _1887;
    if (_1867)
    {
        float _1905 = _1901 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        _1903 = _1907;
    }
    float _1909 = _1903;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1913 = precise::max(0.0, _1911);
    float _1915 = _1843;
    float _1917 = _1913;
    if (_1867)
    {
        float _1919 = _1901 * 6.283185482025146484375;
        float _1921 = cos(_1919);
        _1915 = _1921;
    }
    float _1923 = _1915;
    float _1925 = -_1853;
    float _1927 = -_1913;
    float _1929 = fma(_1835, _1925, _1927);
    if (_1867)
    {
        float _1931 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1917 = _1931;
    }
    float _1933 = _1917;
    float _1935 = _1909;
    float _1937 = _1933;
    if (_1867)
    {
        float _1939 = fma(_1909, _1933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1761 = _1939;
    }
    float _1941 = _1761;
    if (!_1867)
    {
        _1935 = _1857;
    }
    float _1943 = _1935;
    float _1945 = _1943;
    if (_1867)
    {
        float _1947 = _1923 + (-1.0);
        _1937 = _1947;
    }
    float _1949 = _1937;
    float _1951 = _1949;
    if (_1867)
    {
        float _1953 = _1891 * _1941;
        _1879 = _1953;
    }
    float _1955 = _1879;
    if (!_1867)
    {
        _1893 = _1929;
    }
    float _1957 = _1893;
    float _1959 = sqrt(_1849);
    float _1961 = _1957;
    if (_1867)
    {
        float _1963 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1963;
    }
    float _1965 = _1881;
    float _1967 = _1965;
    if (_1867)
    {
        float _1969 = _1855 * _1955;
        _1883 = _1969;
    }
    float _1971 = _1883;
    if (!_1867)
    {
        _1951 = _1859;
    }
    float _1973 = _1951;
    float _1975 = _1973;
    if (_1867)
    {
        float _1977 = _1857 * _1955;
        _1945 = _1977;
    }
    float _1979 = _1945;
    if (_1867)
    {
        float _1981 = fma(_1929, _1923, _1965);
        _1961 = _1981;
    }
    float _1983 = _1961;
    if (_1867)
    {
        float _1985 = _1971 * _1971;
        _1975 = _1985;
    }
    float _1987 = _1975;
    if (!_1867)
    {
        _1967 = _1861;
    }
    float _1989 = _1967;
    float _1991 = _1989;
    if (_1867)
    {
        float _1993 = _1979 * _1979;
        _1991 = _1993;
    }
    float _1995 = _1991;
    float _1997 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1999 = fma(_1983, _1983, _1987);
    float _2001 = _1999 + _1995;
    float _2003 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2007 = fma(_1959, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2005);
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2013 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2015 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2003);
    float _2017 = rsqrt(_2001);
    float _2019 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2021 = -_2009;
    float _2023 = _2021 + 1.0;
    float _2025 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2011);
    float _2027 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2015);
    float _2029 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2019);
    float _2031 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1997);
    float _2033 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2025);
    float _2035 = abs(_2023);
    float _2037 = log2(_2035);
    float _2039 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2029);
    float _2041 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2043 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2031);
    float _2045 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2047 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2049 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2051 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2053 = _2017 * _1971;
    float _2055 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2057 = _2017 * _1983;
    float _2059 = -_2049;
    float _2061 = fma(_2059, _2013, 1.0);
    float _2063 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2065 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2055);
    float _2067 = _2017 * _1979;
    float _2069 = -_2063;
    float _2071 = fma(_2057, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2069);
    float _2073 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2075 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2065);
    float _2077 = log2(_2061);
    float _2079 = -_2067;
    float _2081 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2071);
    float _2083 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2085 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2075);
    float _2087 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2089 = fma(_2081, -0.5, 0.5);
    float _2091 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2083);
    float _2093 = exp2(_2073);
    float _2095 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2087);
    float _2097 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2091);
    float _2099 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2095);
    float _2101 = 1.0 / _2085;
    float _2103 = fma(_2081, 0.5, 0.5);
    float _2105 = _2057 + 1.0;
    float _2107 = _2077 * 0.693147182464599609375;
    float _2109 = fma(_2103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2111 = sqrt(_2089);
    float _2113 = -_2057;
    float _2115 = fma(_2093, _2105, _2113);
    float _2117 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2097);
    float _2119 = fma(_2103, _2109, -0.212114393711090087890625);
    float _2121 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2099);
    float _2123 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2125 = fma(_2115, 0.5, 0.5);
    float _2127 = fma(_2103, _2119, 1.570728778839111328125);
    float _2129 = _2117 * _2101;
    float _2131 = _2121 * _2101;
    float _2133 = fma(_2129, 0.5, 0.5);
    float _2135 = fma(_2131, -0.5, 0.5);
    float _2137 = _2111 * 0.636619746685028076171875;
    float3 _5641 = float3(_2133, _2135, _2123);
    float _2139 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5641, float3(0.0), isnan(_5641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5641, float3(0.0), isnan(_5641)), level(0.0)).x;
    float _2141 = -_2127;
    float _2143 = fma(_2137, _2141, 1.0);
    float3 _5657 = float3(_2133, _2135, _2123);
    float4 _2146 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5657, float3(0.0), isnan(_5657)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5657, float3(0.0), isnan(_5657)), level(0.0)).xyzw;
    float _2148 = _2146.x;
    float _2150 = _2146.y;
    float _2152 = _2146.z;
    float _2154 = _2146.w;
    float2 _5674 = float2(_2143, _2125);
    float3 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5674, float2(0.0), isnan(_5674)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5674, float2(0.0), isnan(_5674)), level(0.0)).xyz;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2168 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2170 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2168);
    float _2172 = exp2(_2166);
    float _2174 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2170);
    float _2176 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2174);
    float _2178 = _2176 + _2085;
    out.gl_Position.x = _2117;
    out.gl_Position.y = _2121;
    out.gl_Position.z = _2176;
    out.gl_Position.w = _2085;
    float _2180 = _2178 * 0.5;
    float _2182 = -_2172;
    float _2184 = _2182 + 1.0;
    float _2186 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2188 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2180;
    out.m_62.w = _2085;
    out.m_45.x = _2186;
    float _2190 = _2188 * _2139;
    float _2192 = -_2188;
    float _2194 = _2192 + 1.0;
    float _2196 = _2154 * _2190;
    float _2198 = _2154 * _2194;
    float _2200 = _2164 * _2190;
    float _2202 = fma(_2160, _2196, _2148);
    float _2204 = fma(_2162, _2196, _2150);
    float _2206 = fma(_2154, _2200, _2152);
    out.m_64.x = _2202;
    out.m_64.y = _2204;
    out.m_64.z = _2206;
    out.m_64.w = _2198;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1181 = false;
    bool _1003 = false;
    bool _675 = false;
    bool _383 = false;
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
        float _2263 = as_type<float>(_99);
        out.gl_Position.z = _2263;
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
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2331 = as_type<float>(_135);
        out.gl_Position.z = _2331;
    }
    if (_129)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = _165 * 6.283185482025146484375;
    float _169 = floor(_165);
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    float _181 = _145;
    if (!_161)
    {
        float _183 = _145 * _145;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _167 * 0.15915493667125701904296875;
    float _191 = _187;
    if (!_161)
    {
        float _193 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _189 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_173;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_169;
    float _211 = _165 + _209;
    bool _213 = !_177;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_161;
    float _219 = _195;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _145 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _145);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_161;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _181 = _273;
    }
    float _275 = _181;
    float _277 = fma(_203, 0.5, 0.5);
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_54.w;
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = -_211;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _299 = in.m_42.x;
    float _301 = in.m_42.y;
    float _303 = in.m_42.z;
    bool _305 = !_281;
    int _307 = _305 ? 0 : 1;
    float _309 = -_291;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = -_277;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = !_199;
    int _319 = _317 ? 0 : 1;
    int _321 = abs(_307);
    float _323 = fma(_275, _147, _297);
    bool _325 = !_285;
    int _327 = _325 ? 0 : 1;
    float _329 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _335 = abs(_319);
    float _337 = fma(_275, _149, _329);
    int _339 = abs(_327);
    float _341 = fma(_275, _151, _333);
    float _343 = float(_321);
    float _345 = float(_335);
    float _347 = abs(_295);
    float _349 = _343 * _347;
    float _351 = float(_339);
    float _353 = fma(_345, _315, _349);
    float _355 = fma(_323, _287, _299);
    float _357 = fma(_337, _287, _301);
    float _359 = fma(_341, _287, _303);
    float _361 = abs(_311);
    float _363 = fma(_351, _361, _353);
    bool _365 = !_331;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _391 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _413 = 1.0 / _399;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _415;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _421 = 1.0 / _403;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _391 + _423;
    float _427 = 1.0 / _411;
    float _429 = _425 * _413;
    bool _431 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _433 = isnan(_391);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = _391 + _443;
    bool _447 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _449 = isnan(_391);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = 1.0 / _407;
    float _461 = _395 * _421;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _465 = _391 + _463;
    bool _467 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _469 = isnan(_391);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = 1.0 / _417;
    float _481 = _465 * _427;
    bool _483 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _485 = isnan(_391);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _497 = _391 + _495;
    float _499 = -_493;
    float _501 = _499 + 1.0;
    float _503 = _445 * _459;
    float _505 = -_441;
    float _507 = _505 + 1.0;
    float _509 = -_477;
    float _511 = _509 + 1.0;
    float _513 = _477 * _501;
    bool _515 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_391);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = _493 * _507;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _533;
    float _537 = _497 * _479;
    bool _539 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _541 = isnan(_391);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = fma(_531, _429, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _553 = fma(_535, _429, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _555 = _457 * _511;
    float _557 = -_457;
    float _559 = _557 + 1.0;
    float _561 = -_525;
    float _563 = _561 + 1.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = _525 * _559;
    float _571 = _549 * _563;
    float _573 = fma(_567, _461, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _583 = _551 * _571;
    float _585 = -_549;
    float _587 = _585 + 1.0;
    float _589 = _553 * _571;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _591;
    float _595 = fma(_581, _461, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _597 = fma(_577, _503, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].x, _583);
    float _601 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].y, _589);
    float _603 = in.m_54.x;
    float _605 = in.m_54.y;
    float _607 = fma(_593, _503, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _617 = fma(_573, _569, _599);
    float _619 = fma(_595, _569, _601);
    float _621 = fma(_611, _481, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _623 = fma(_615, _481, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = fma(_597, _555, _617);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _631;
    float _635 = fma(_607, _555, _619);
    float _637 = fma(_627, _537, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _639 = fma(_621, _513, _629);
    float _641 = fma(_633, _537, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _643 = fma(_623, _513, _635);
    float _645 = fma(_637, _527, _639);
    float _647 = fma(_641, _527, _643);
    float _649 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[148].x, _645);
    float _651 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[148].y, _647);
    float _653 = _649 * _603;
    float _655 = _651 * _605;
    bool _657 = !_419;
    float _673;
    if (!_657)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _661 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        float _677 = float(_83);
        float _679 = 1.0 / _677;
        float _681 = _117 * _679;
        _673 = _681;
    }
    _675 = false;
    float _683 = _673;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _687 = _683 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _691 = _683 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _709 = 1.0 / _695;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _711;
    float _715 = 1.0 / _707;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _719 = _683 + _717;
    bool _721 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _723 = isnan(_683);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _733;
    float _737 = -_731;
    float _739 = _737 + 1.0;
    float _741 = 1.0 / _703;
    float _743 = _719 * _709;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _747 = _683 + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _749;
    bool _753 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _755 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _757 = fma(_751, _743, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _759 = 1.0 / _699;
    float _761 = _747 * _715;
    bool _763 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _765 = isnan(_683);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    bool _775 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _777 = isnan(_683);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = 1.0 / _713;
    float _789 = _687 * _741;
    bool _791 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _793 = isnan(_683);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = -_773;
    float _805 = _803 + 1.0;
    float _807 = _785 * _739;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = -_801;
    float _815 = _813 + 1.0;
    float _817 = _691 * _759;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _821 = _683 + _819;
    bool _823 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _825 = isnan(_683);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = _801 * _805;
    float _837 = _833 * _815;
    float _839 = _821 * _787;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _841;
    float _845 = -_833;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _853 = fma(_843, _743, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _855 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _857 = isnan(_683);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = _731 * _847;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _877 = fma(_851, _817, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _879 = _865 * _811;
    float _881 = fma(_871, _817, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _883 = fma(_875, _817, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _885 = _853 * _879;
    float _887 = -_865;
    float _889 = _887 + 1.0;
    float _891 = _755 * _879;
    float _893 = _757 * _879;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _895;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _899;
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[107].x, _885);
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[107].y, _891);
    float _907 = fma(_897, _789, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _913;
    float _917 = fma(_901, _789, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _919 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[107].z, _893);
    float _921 = fma(_881, _807, _903);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _927 = fma(_911, _761, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _929 = fma(_915, _789, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _931 = fma(_883, _807, _905);
    float _933 = fma(_877, _807, _919);
    float _935 = fma(_907, _867, _921);
    float _937 = fma(_925, _761, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _943 = fma(_917, _867, _931);
    float _945 = fma(_929, _867, _933);
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _951;
    float _955 = fma(_941, _761, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _957;
    float _961 = fma(_927, _837, _935);
    float _963 = fma(_949, _839, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _965 = fma(_953, _839, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _967 = fma(_937, _837, _943);
    float _969 = fma(_959, _839, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _971 = fma(_955, _837, _945);
    float _973 = fma(_963, _835, _961);
    float _975 = fma(_965, _835, _967);
    float _977 = fma(_969, _835, _971);
    float _979 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[112].x, _973);
    float _981 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[112].y, _975);
    float _983 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[112].z, _977);
    bool _985 = !_753;
    float _1001;
    if (!_985)
    {
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _989 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _993 = _991 * _987;
        float _995 = floor(_993);
        float _997 = -_995;
        float _999 = _993 + _997;
        _1001 = _999;
        _1003 = true;
    }
    else
    {
        float _1005 = float(_83);
        float _1007 = 1.0 / _1005;
        float _1009 = _117 * _1007;
        _1001 = _1009;
    }
    _1003 = false;
    float _1011 = _1001;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1015 = _1011 + _1013;
    float _1017 = _979 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1027 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1029 = isnan(_1011);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1043 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1045 = isnan(_1011);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = 1.0 / _1021;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1057;
    float _1061 = -_1037;
    float _1063 = _1061 + 1.0;
    bool _1065 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1067 = isnan(_1011);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1079 = _983 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1081 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1083 = 1.0 / _1025;
    float _1085 = 1.0 / _1041;
    float _1087 = _1059 * _1055;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1093 = _1053 * _1063;
    float _1095 = -_1053;
    float _1097 = _1095 + 1.0;
    float _1099 = fma(_1087, _1015, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1101;
    float _1105 = _1075 * _1097;
    float _1107 = _1091 * _1083;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1111 = _1011 + _1109;
    bool _1113 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1115 = isnan(_1011);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = _1099 * _1105;
    float _1127 = -_1075;
    float _1129 = _1127 + 1.0;
    float _1131 = fma(_1107, _1111, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1135 = _1011 + _1133;
    float _1137 = _1103 * _1085;
    float _1139 = -_1123;
    float _1141 = _1139 + 1.0;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1125);
    float _1145 = fma(_1137, _1135, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1147 = _1037 * _1141;
    float _1149 = fma(_1131, _1093, _1143);
    float _1151 = fma(_1145, _1147, _1149);
    float _1153 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1151);
    float _1159 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1153;
    out.m_56.y = _1159;
    out.m_56.z = _1155;
    out.m_56.w = _1161;
    bool _1163 = !_1081;
    float _1179;
    if (!_1163)
    {
        float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1167 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1169 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1171 = _1169 * _1165;
        float _1173 = floor(_1171);
        float _1175 = -_1173;
        float _1177 = _1171 + _1175;
        _1179 = _1177;
        _1181 = true;
    }
    else
    {
        float _1183 = float(_83);
        float _1185 = 1.0 / _1183;
        float _1187 = _117 * _1185;
        _1179 = _1187;
    }
    _1181 = false;
    float _1189 = _1179;
    float _1191 = in.m_49.y;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1195 = _1189 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1211 = _1209 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1213 = 1.0 / _1199;
    bool _1215 = _137 > 0.5;
    float _1217 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1221 = _1219 != 0;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1225 = _1223 != 0;
    float _1227 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1229 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1231 = 1.0 / _1203;
    float _1233 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1217);
    float _1235 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1227);
    float _1237 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1229);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1241 = _1189 + _1239;
    bool _1243 = _1191 > 0.5;
    float _1245 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1235);
    float _1247 = 1.0 / _1207;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1251 = _1189 + _1249;
    float _1253 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1255 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1257 = isnan(_1189);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = 1.0 / _1211;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1269;
    float _1273 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1233);
    float _1275 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1237);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1279 = _1189 + _1277;
    float _1281 = _1251 * _1213;
    float _1283 = _1241 * _1231;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1287 = _1189 + _1285;
    float _1289 = 1.0 / _1271;
    float _1291 = _1279 * _1247;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1305;
    float _1309 = _1287 * _1267;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1331 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1333 = isnan(_1189);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = _1195 * _1289;
    bool _1345 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1347 = isnan(_1189);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = fma(_1307, _1281, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1359 = fma(_1317, _1281, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1361 = fma(_1325, _1281, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1363 = fma(_1313, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1365 = fma(_1321, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1367 = fma(_1329, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1369;
    float _1373 = -_1341;
    float _1375 = _1373 + 1.0;
    float _1377 = -_1355;
    float _1379 = _1377 + 1.0;
    float _1381 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1383 = fma(_1371, _1291, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1385 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1387 = _1355 * _1375;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1397 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1399 = isnan(_1189);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = _1265 * _1379;
    float _1411 = -_1265;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_1303, _1309, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1417 = fma(_1391, _1309, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1419 = fma(_1395, _1309, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1421 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1423 = isnan(_1189);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1429 = _1425 || _1427;
    float _1431 = float(_1429);
    float _1433 = _1407 * _1413;
    bool _1435 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1437 = isnan(_1189);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    float _1447 = -_1407;
    float _1449 = _1447 + 1.0;
    float _1451 = _1273 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1453 = _1445 * _1449;
    float _1455 = -_1445;
    float _1457 = _1455 + 1.0;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1463;
    float _1467 = _1431 * _1457;
    float _1469 = -_1431;
    float _1471 = _1469 + 1.0;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1473;
    float _1477 = fma(_1461, _1343, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1479 = _1357 * _1467;
    float _1481 = _1359 * _1467;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1485 = _1253 + _1483;
    float _1487 = _1361 * _1467;
    float _1489 = _1275 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1493 = _1451 + _1491;
    float _1495 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1497 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1481);
    float _1499 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1479);
    float _1501 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1487);
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1505 = _1489 + _1503;
    float _1507 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1495);
    float _1509 = fma(_1365, _1453, _1497);
    float _1511 = fma(_1363, _1453, _1499);
    float _1513 = fma(_1367, _1453, _1501);
    float _1515 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1507);
    float _1517 = fma(_1383, _1433, _1509);
    float _1519 = -_207;
    int _1521 = _1215 ? as_type<int>(_1519) : as_type<int>(_207);
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1525 = _1485 * _1485;
    float _1527 = fma(_1381, _1433, _1511);
    float _1529 = fma(_1385, _1433, _1513);
    bool _1531 = !_1221;
    float _1533 = _1531 ? _207 : as_type<float>(_1521);
    float _1535 = fma(_1493, _1493, _1525);
    bool _1537 = _1515 >= 0.0;
    float _1539 = fma(_1465, _1343, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1541 = -_215;
    int _1543 = _1243 ? as_type<int>(_1541) : as_type<int>(_215);
    float _1545 = fma(_1475, _1343, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1547 = fma(_1415, _1409, _1527);
    float _1549 = fma(_1417, _1409, _1517);
    float _1551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1553 = fma(_1419, _1409, _1529);
    float _1555 = _1533 + 0.5;
    float _1557 = fma(_1505, _1505, _1535);
    bool _1559 = !_1225;
    float _1561 = _1559 ? _215 : as_type<float>(_1543);
    float _1563 = fma(_1477, _1387, _1547);
    float _1565 = fma(_1539, _1387, _1549);
    float _1567 = fma(_1545, _1387, _1553);
    float _1569 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1571 = -_1561;
    float _1573 = _1571 + 0.5;
    float _1575 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1563);
    float _1577 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1565);
    float _1579 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1567);
    float _1581 = rsqrt(_1557);
    float _1583 = _1569 * _1523;
    float _1585 = _1569;
    if (_1537)
    {
        _1585 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1587 = _1585;
    float _1589 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1591 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1593 = _1577 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1595 = _1579 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1597 = _1589 * _1551;
    int _1599 = as_type<int>(_1587);
    if (_1537)
    {
        float _1601 = _1587 * 5.0;
        _1599 = as_type<int>(_1601);
    }
    int _1603 = _1599;
    float _1605 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1607 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1609 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1583;
    out.m_58.y = _1597;
    float _1611 = _1485 * _1581;
    float _1613 = _1609;
    if (_1537)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4737 = as_type<float>(_1603);
        out.gl_Position.z = _4737;
    }
    float _1615 = _1493 * _1581;
    out.m_60.x = _1605;
    out.m_60.y = _1607;
    out.m_60.z = _1609;
    float _1617 = _1615;
    if (_1537)
    {
        out.m_45.x = 0.0;
    }
    if (_1537)
    {
        return out;
    }
    float _1619 = -_1611;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1623 = _1505 * _1581;
    float _1625 = -_1615;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1629 = -_1611;
    float _1631 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1485);
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1635 = _1621 + _1633;
    float _1637 = -_1623;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1489);
    float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1643 = _1627 + _1641;
    float _1645 = -_1615;
    float _1647 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1493);
    float _1649 = _1635 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1653 = _1639 + _1651;
    float _1655 = _1631 * _1631;
    float _1657 = -_1623;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1505);
    float _1661 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1649);
    float _1663 = _363 * _653;
    float _1665 = fma(_1647, _1647, _1655);
    float _1667 = _363 * _655;
    float _1669 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1661);
    float _1671 = fma(_1659, _1659, _1665);
    bool _1673 = _1669 >= 0.0;
    float _1675 = sqrt(_1671);
    if (_1673)
    {
        _1613 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1677 = _1613;
    int _1679 = as_type<int>(_1677);
    if (_1673)
    {
        out.m_45.x = 0.0;
    }
    float _1681 = _1581 * _1675;
    if (_1673)
    {
        float _1683 = _1677 * 5.0;
        _1679 = as_type<int>(_1683);
    }
    int _1685 = _1679;
    if (_1673)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4884 = as_type<float>(_1685);
        out.gl_Position.z = _4884;
    }
    if (_1673)
    {
        return out;
    }
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _1691 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1695 = _1681 * _1687;
    float _1697 = _1681 * _1691;
    float _1699 = _1689 * _1695;
    float _1701 = _1693 * _1697;
    float _1703 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1705 = _1703 * 0.5;
    float _1707 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1709 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1711 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1713 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1707);
    float _1715 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1709);
    float _1717 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1711);
    float _1719 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1713);
    float _1721 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1715);
    float _1723 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1717);
    float _1725 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1727 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1729 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1731 = _1489 + _1725;
    float _1733 = _1451 + _1727;
    float _1735 = _1253 + _1729;
    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1739 = _1731 + _1737;
    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1743 = _1733 + _1741;
    float _1745 = _1739 * _1739;
    float _1747 = fma(_1743, _1743, _1745);
    float _1749 = sqrt(_1747);
    bool _1751 = _1749 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1753 = _1705;
    float _1755 = _1729;
    float _1757 = _1723;
    float _1759 = _1731;
    float _1761 = _1747;
    if (!_1751)
    {
        _1753 = _1733;
    }
    float _1763 = _1753;
    float _1765 = _1763;
    if (!_1751)
    {
        _1755 = _1731;
    }
    float _1767 = _1755;
    float _1769 = _1767;
    if (!_1751)
    {
        _1757 = _1735;
    }
    float _1771 = _1757;
    bool _1773 = !_1751;
    float _1775 = _1771;
    if (!_1773)
    {
        float _1777 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1781 = _1749 + _1779;
        float _1783 = _1735 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1785 = rsqrt(_1747);
        float _1787 = _1781 * _1777;
        float _1789 = _1787 * 0.15915493667125701904296875;
        float _1791 = _1789 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = _1789 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = _1793 + (-1.0);
        float _1801 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1803 = fma(_1797, _1783, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1805 = fma(_1735, _1793, _1801);
        float _1807 = _1785 * _1803;
        float _1809 = fma(_1743, _1807, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1811 = fma(_1739, _1807, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1775 = _1805;
        _1765 = _1809;
        _1769 = _1811;
        _1759 = _1789;
    }
    float _1813 = _1775;
    float _1815 = _1765;
    float _1817 = _1769;
    float _1819 = _1759;
    float _1821 = -_1611;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1813);
    float _1825 = -_1615;
    float _1827 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1815);
    float _1829 = -_1623;
    float _1831 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1817);
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1835 = _1823 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1839 = _1827 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = _1831 + _1841;
    float _1845 = _1835 * _1835;
    float _1847 = fma(_1839, _1839, _1845);
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = rsqrt(_1849);
    float _1853 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1855 = _1839 * _1853;
    float _1857 = _1843 * _1853;
    float _1859 = _1855 * _1855;
    float _1861 = _1857 * _1857;
    float _1863 = _1859 + _1861;
    float _1865 = sqrt(_1863);
    bool _1867 = _1865 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1871 = _1865 + _1869;
    float _1873 = _1851;
    float _1875 = _1819;
    float _1877 = _1871;
    float _1879 = _1853;
    float _1881 = _1835;
    float _1883 = _1855;
    if (_1867)
    {
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1873 = _1885;
    }
    float _1887 = _1873;
    if (_1867)
    {
        float _1889 = rsqrt(_1863);
        _1875 = _1889;
    }
    float _1891 = _1875;
    float _1893 = _1891;
    if (_1867)
    {
        float _1895 = _1871 * _1887;
        _1877 = _1895;
    }
    float _1897 = _1877;
    if (_1867)
    {
        float _1899 = _1897 * 0.15915493667125701904296875;
        _1617 = _1899;
    }
    float _1901 = _1617;
    float _1903 = _1887;
    if (_1867)
    {
        float _1905 = _1901 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        _1903 = _1907;
    }
    float _1909 = _1903;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1913 = precise::max(0.0, _1911);
    float _1915 = _1843;
    float _1917 = _1913;
    if (_1867)
    {
        float _1919 = _1901 * 6.283185482025146484375;
        float _1921 = cos(_1919);
        _1915 = _1921;
    }
    float _1923 = _1915;
    float _1925 = -_1853;
    float _1927 = -_1913;
    float _1929 = fma(_1835, _1925, _1927);
    if (_1867)
    {
        float _1931 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1917 = _1931;
    }
    float _1933 = _1917;
    float _1935 = _1909;
    float _1937 = _1933;
    if (_1867)
    {
        float _1939 = fma(_1909, _1933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1761 = _1939;
    }
    float _1941 = _1761;
    if (!_1867)
    {
        _1935 = _1857;
    }
    float _1943 = _1935;
    float _1945 = _1943;
    if (_1867)
    {
        float _1947 = _1923 + (-1.0);
        _1937 = _1947;
    }
    float _1949 = _1937;
    float _1951 = _1949;
    if (_1867)
    {
        float _1953 = _1891 * _1941;
        _1879 = _1953;
    }
    float _1955 = _1879;
    if (!_1867)
    {
        _1893 = _1929;
    }
    float _1957 = _1893;
    float _1959 = sqrt(_1849);
    float _1961 = _1957;
    if (_1867)
    {
        float _1963 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1963;
    }
    float _1965 = _1881;
    float _1967 = _1965;
    if (_1867)
    {
        float _1969 = _1855 * _1955;
        _1883 = _1969;
    }
    float _1971 = _1883;
    if (!_1867)
    {
        _1951 = _1859;
    }
    float _1973 = _1951;
    float _1975 = _1973;
    if (_1867)
    {
        float _1977 = _1857 * _1955;
        _1945 = _1977;
    }
    float _1979 = _1945;
    if (_1867)
    {
        float _1981 = fma(_1929, _1923, _1965);
        _1961 = _1981;
    }
    float _1983 = _1961;
    if (_1867)
    {
        float _1985 = _1971 * _1971;
        _1975 = _1985;
    }
    float _1987 = _1975;
    if (!_1867)
    {
        _1967 = _1861;
    }
    float _1989 = _1967;
    float _1991 = _1989;
    if (_1867)
    {
        float _1993 = _1979 * _1979;
        _1991 = _1993;
    }
    float _1995 = _1991;
    float _1997 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1999 = fma(_1983, _1983, _1987);
    float _2001 = _1999 + _1995;
    float _2003 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2007 = fma(_1959, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2005);
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2013 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2015 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2003);
    float _2017 = rsqrt(_2001);
    float _2019 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2021 = -_2009;
    float _2023 = _2021 + 1.0;
    float _2025 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2011);
    float _2027 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2015);
    float _2029 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2019);
    float _2031 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1997);
    float _2033 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2025);
    float _2035 = abs(_2023);
    float _2037 = log2(_2035);
    float _2039 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2029);
    float _2041 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2043 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2031);
    float _2045 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2047 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2049 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2051 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2053 = _2017 * _1971;
    float _2055 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2057 = _2017 * _1983;
    float _2059 = -_2049;
    float _2061 = fma(_2059, _2013, 1.0);
    float _2063 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2065 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2055);
    float _2067 = _2017 * _1979;
    float _2069 = -_2063;
    float _2071 = fma(_2057, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2069);
    float _2073 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2075 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2065);
    float _2077 = log2(_2061);
    float _2079 = -_2067;
    float _2081 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2071);
    float _2083 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2085 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2075);
    float _2087 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2089 = fma(_2081, -0.5, 0.5);
    float _2091 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2083);
    float _2093 = exp2(_2073);
    float _2095 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2087);
    float _2097 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2091);
    float _2099 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2095);
    float _2101 = 1.0 / _2085;
    float _2103 = fma(_2081, 0.5, 0.5);
    float _2105 = _2057 + 1.0;
    float _2107 = _2077 * 0.693147182464599609375;
    float _2109 = fma(_2103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2111 = sqrt(_2089);
    float _2113 = -_2057;
    float _2115 = fma(_2093, _2105, _2113);
    float _2117 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2097);
    float _2119 = fma(_2103, _2109, -0.212114393711090087890625);
    float _2121 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2099);
    float _2123 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2125 = fma(_2115, 0.5, 0.5);
    float _2127 = fma(_2103, _2119, 1.570728778839111328125);
    float _2129 = _2117 * _2101;
    float _2131 = _2121 * _2101;
    float _2133 = fma(_2129, 0.5, 0.5);
    float _2135 = fma(_2131, -0.5, 0.5);
    float _2137 = _2111 * 0.636619746685028076171875;
    float3 _5641 = float3(_2133, _2135, _2123);
    float _2139 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5641, float3(0.0), isnan(_5641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5641, float3(0.0), isnan(_5641)), level(0.0)).x;
    float _2141 = -_2127;
    float _2143 = fma(_2137, _2141, 1.0);
    float3 _5657 = float3(_2133, _2135, _2123);
    float4 _2146 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5657, float3(0.0), isnan(_5657)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5657, float3(0.0), isnan(_5657)), level(0.0)).xyzw;
    float _2148 = _2146.x;
    float _2150 = _2146.y;
    float _2152 = _2146.z;
    float _2154 = _2146.w;
    float2 _5674 = float2(_2143, _2125);
    float3 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5674, float2(0.0), isnan(_5674)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5674, float2(0.0), isnan(_5674)), level(0.0)).xyz;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2168 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2170 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2168);
    float _2172 = exp2(_2166);
    float _2174 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2170);
    float _2176 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2174);
    float _2178 = _2176 + _2085;
    out.gl_Position.x = _2117;
    out.gl_Position.y = _2121;
    out.gl_Position.z = _2176;
    out.gl_Position.w = _2085;
    float _2180 = _2178 * 0.5;
    float _2182 = -_2172;
    float _2184 = _2182 + 1.0;
    float _2186 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2188 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2180;
    out.m_62.w = _2085;
    out.m_45.x = _2186;
    float _2190 = _2188 * _2139;
    float _2192 = -_2188;
    float _2194 = _2192 + 1.0;
    float _2196 = _2154 * _2190;
    float _2198 = _2154 * _2194;
    float _2200 = _2164 * _2190;
    float _2202 = fma(_2160, _2196, _2148);
    float _2204 = fma(_2162, _2196, _2150);
    float _2206 = fma(_2154, _2200, _2152);
    out.m_64.x = _2202;
    out.m_64.y = _2204;
    out.m_64.z = _2206;
    out.m_64.w = _2198;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1181 = false;
    bool _1003 = false;
    bool _675 = false;
    bool _383 = false;
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
        float _2263 = as_type<float>(_99);
        out.gl_Position.z = _2263;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2331 = as_type<float>(_135);
        out.gl_Position.z = _2331;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = _165 * 6.283185482025146484375;
    float _169 = floor(_165);
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    float _181 = _145;
    if (!_161)
    {
        float _183 = _145 * _145;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _167 * 0.15915493667125701904296875;
    float _191 = _187;
    if (!_161)
    {
        float _193 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _189 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_173;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_169;
    float _211 = _165 + _209;
    bool _213 = !_177;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_161;
    float _219 = _195;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _145 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _145);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_161;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _181 = _273;
    }
    float _275 = _181;
    float _277 = fma(_203, 0.5, 0.5);
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_54.w;
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = -_211;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _299 = in.m_42.x;
    float _301 = in.m_42.y;
    float _303 = in.m_42.z;
    bool _305 = !_281;
    int _307 = _305 ? 0 : 1;
    float _309 = -_291;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _313 = -_277;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _317 = !_199;
    int _319 = _317 ? 0 : 1;
    int _321 = abs(_307);
    float _323 = fma(_275, _147, _297);
    bool _325 = !_285;
    int _327 = _325 ? 0 : 1;
    float _329 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _335 = abs(_319);
    float _337 = fma(_275, _149, _329);
    int _339 = abs(_327);
    float _341 = fma(_275, _151, _333);
    float _343 = float(_321);
    float _345 = float(_335);
    float _347 = abs(_295);
    float _349 = _343 * _347;
    float _351 = float(_339);
    float _353 = fma(_345, _315, _349);
    float _355 = fma(_323, _287, _299);
    float _357 = fma(_337, _287, _301);
    float _359 = fma(_341, _287, _303);
    float _361 = abs(_311);
    float _363 = fma(_351, _361, _353);
    bool _365 = !_331;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _391 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _413 = 1.0 / _399;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _415;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _421 = 1.0 / _403;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _391 + _423;
    float _427 = 1.0 / _411;
    float _429 = _425 * _413;
    bool _431 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _433 = isnan(_391);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = _391 + _443;
    bool _447 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _449 = isnan(_391);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = 1.0 / _407;
    float _461 = _395 * _421;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _465 = _391 + _463;
    bool _467 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _469 = isnan(_391);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = 1.0 / _417;
    float _481 = _465 * _427;
    bool _483 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _485 = isnan(_391);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _497 = _391 + _495;
    float _499 = -_493;
    float _501 = _499 + 1.0;
    float _503 = _445 * _459;
    float _505 = -_441;
    float _507 = _505 + 1.0;
    float _509 = -_477;
    float _511 = _509 + 1.0;
    float _513 = _477 * _501;
    bool _515 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_391);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = _493 * _507;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _533;
    float _537 = _497 * _479;
    bool _539 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _541 = isnan(_391);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = fma(_531, _429, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _553 = fma(_535, _429, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _555 = _457 * _511;
    float _557 = -_457;
    float _559 = _557 + 1.0;
    float _561 = -_525;
    float _563 = _561 + 1.0;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = _525 * _559;
    float _571 = _549 * _563;
    float _573 = fma(_567, _461, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _583 = _551 * _571;
    float _585 = -_549;
    float _587 = _585 + 1.0;
    float _589 = _553 * _571;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _591;
    float _595 = fma(_581, _461, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _597 = fma(_577, _503, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].x, _583);
    float _601 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[143].y, _589);
    float _603 = in.m_54.x;
    float _605 = in.m_54.y;
    float _607 = fma(_593, _503, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _617 = fma(_573, _569, _599);
    float _619 = fma(_595, _569, _601);
    float _621 = fma(_611, _481, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _623 = fma(_615, _481, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = fma(_597, _555, _617);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _631;
    float _635 = fma(_607, _555, _619);
    float _637 = fma(_627, _537, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _639 = fma(_621, _513, _629);
    float _641 = fma(_633, _537, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _643 = fma(_623, _513, _635);
    float _645 = fma(_637, _527, _639);
    float _647 = fma(_641, _527, _643);
    float _649 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[148].x, _645);
    float _651 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[148].y, _647);
    float _653 = _649 * _603;
    float _655 = _651 * _605;
    bool _657 = !_419;
    float _673;
    if (!_657)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _661 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        float _677 = float(_83);
        float _679 = 1.0 / _677;
        float _681 = _117 * _679;
        _673 = _681;
    }
    _675 = false;
    float _683 = _673;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _687 = _683 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _691 = _683 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _693;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _709 = 1.0 / _695;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _711;
    float _715 = 1.0 / _707;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _719 = _683 + _717;
    bool _721 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _723 = isnan(_683);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _733;
    float _737 = -_731;
    float _739 = _737 + 1.0;
    float _741 = 1.0 / _703;
    float _743 = _719 * _709;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _747 = _683 + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _749;
    bool _753 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _755 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _757 = fma(_751, _743, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _759 = 1.0 / _699;
    float _761 = _747 * _715;
    bool _763 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _765 = isnan(_683);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    bool _775 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _777 = isnan(_683);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = 1.0 / _713;
    float _789 = _687 * _741;
    bool _791 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _793 = isnan(_683);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = -_773;
    float _805 = _803 + 1.0;
    float _807 = _785 * _739;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = -_801;
    float _815 = _813 + 1.0;
    float _817 = _691 * _759;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _821 = _683 + _819;
    bool _823 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _825 = isnan(_683);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = _801 * _805;
    float _837 = _833 * _815;
    float _839 = _821 * _787;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _841;
    float _845 = -_833;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _853 = fma(_843, _743, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _855 = _683 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _857 = isnan(_683);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = _731 * _847;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _877 = fma(_851, _817, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _879 = _865 * _811;
    float _881 = fma(_871, _817, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _883 = fma(_875, _817, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _885 = _853 * _879;
    float _887 = -_865;
    float _889 = _887 + 1.0;
    float _891 = _755 * _879;
    float _893 = _757 * _879;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _895;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _899;
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[107].x, _885);
    float _905 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[107].y, _891);
    float _907 = fma(_897, _789, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _913;
    float _917 = fma(_901, _789, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _919 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[107].z, _893);
    float _921 = fma(_881, _807, _903);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _927 = fma(_911, _761, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _929 = fma(_915, _789, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _931 = fma(_883, _807, _905);
    float _933 = fma(_877, _807, _919);
    float _935 = fma(_907, _867, _921);
    float _937 = fma(_925, _761, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _943 = fma(_917, _867, _931);
    float _945 = fma(_929, _867, _933);
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _949 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _951;
    float _955 = fma(_941, _761, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _957;
    float _961 = fma(_927, _837, _935);
    float _963 = fma(_949, _839, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _965 = fma(_953, _839, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _967 = fma(_937, _837, _943);
    float _969 = fma(_959, _839, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _971 = fma(_955, _837, _945);
    float _973 = fma(_963, _835, _961);
    float _975 = fma(_965, _835, _967);
    float _977 = fma(_969, _835, _971);
    float _979 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[112].x, _973);
    float _981 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[112].y, _975);
    float _983 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[112].z, _977);
    bool _985 = !_753;
    float _1001;
    if (!_985)
    {
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _989 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _993 = _991 * _987;
        float _995 = floor(_993);
        float _997 = -_995;
        float _999 = _993 + _997;
        _1001 = _999;
        _1003 = true;
    }
    else
    {
        float _1005 = float(_83);
        float _1007 = 1.0 / _1005;
        float _1009 = _117 * _1007;
        _1001 = _1009;
    }
    _1003 = false;
    float _1011 = _1001;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1015 = _1011 + _1013;
    float _1017 = _979 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1027 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1029 = isnan(_1011);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1043 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1045 = isnan(_1011);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = 1.0 / _1021;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1057;
    float _1061 = -_1037;
    float _1063 = _1061 + 1.0;
    bool _1065 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1067 = isnan(_1011);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1079 = _983 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1081 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1083 = 1.0 / _1025;
    float _1085 = 1.0 / _1041;
    float _1087 = _1059 * _1055;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1093 = _1053 * _1063;
    float _1095 = -_1053;
    float _1097 = _1095 + 1.0;
    float _1099 = fma(_1087, _1015, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1101;
    float _1105 = _1075 * _1097;
    float _1107 = _1091 * _1083;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1111 = _1011 + _1109;
    bool _1113 = _1011 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1115 = isnan(_1011);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = _1099 * _1105;
    float _1127 = -_1075;
    float _1129 = _1127 + 1.0;
    float _1131 = fma(_1107, _1111, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1135 = _1011 + _1133;
    float _1137 = _1103 * _1085;
    float _1139 = -_1123;
    float _1141 = _1139 + 1.0;
    float _1143 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1125);
    float _1145 = fma(_1137, _1135, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1147 = _1037 * _1141;
    float _1149 = fma(_1131, _1093, _1143);
    float _1151 = fma(_1145, _1147, _1149);
    float _1153 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1151);
    float _1159 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1153;
    out.m_56.y = _1159;
    out.m_56.z = _1155;
    out.m_56.w = _1161;
    bool _1163 = !_1081;
    float _1179;
    if (!_1163)
    {
        float _1165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1167 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1169 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1171 = _1169 * _1165;
        float _1173 = floor(_1171);
        float _1175 = -_1173;
        float _1177 = _1171 + _1175;
        _1179 = _1177;
        _1181 = true;
    }
    else
    {
        float _1183 = float(_83);
        float _1185 = 1.0 / _1183;
        float _1187 = _117 * _1185;
        _1179 = _1187;
    }
    _1181 = false;
    float _1189 = _1179;
    float _1191 = in.m_49.y;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1195 = _1189 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1211 = _1209 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1213 = 1.0 / _1199;
    bool _1215 = _137 > 0.5;
    float _1217 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1221 = _1219 != 0;
    int _1223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1225 = _1223 != 0;
    float _1227 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1229 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1231 = 1.0 / _1203;
    float _1233 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1217);
    float _1235 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1227);
    float _1237 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1229);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1241 = _1189 + _1239;
    bool _1243 = _1191 > 0.5;
    float _1245 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1235);
    float _1247 = 1.0 / _1207;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1251 = _1189 + _1249;
    float _1253 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1255 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1257 = isnan(_1189);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    float _1267 = 1.0 / _1211;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1269;
    float _1273 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1233);
    float _1275 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1237);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1279 = _1189 + _1277;
    float _1281 = _1251 * _1213;
    float _1283 = _1241 * _1231;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1287 = _1189 + _1285;
    float _1289 = 1.0 / _1271;
    float _1291 = _1279 * _1247;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1305;
    float _1309 = _1287 * _1267;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1331 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1333 = isnan(_1189);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = _1195 * _1289;
    bool _1345 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1347 = isnan(_1189);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = fma(_1307, _1281, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1359 = fma(_1317, _1281, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1361 = fma(_1325, _1281, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1363 = fma(_1313, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1365 = fma(_1321, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1367 = fma(_1329, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1369;
    float _1373 = -_1341;
    float _1375 = _1373 + 1.0;
    float _1377 = -_1355;
    float _1379 = _1377 + 1.0;
    float _1381 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1383 = fma(_1371, _1291, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1385 = fma(_1299, _1291, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1387 = _1355 * _1375;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    bool _1397 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1399 = isnan(_1189);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1405 = _1401 || _1403;
    float _1407 = float(_1405);
    float _1409 = _1265 * _1379;
    float _1411 = -_1265;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_1303, _1309, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1417 = fma(_1391, _1309, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1419 = fma(_1395, _1309, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    bool _1421 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1423 = isnan(_1189);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1429 = _1425 || _1427;
    float _1431 = float(_1429);
    float _1433 = _1407 * _1413;
    bool _1435 = _1189 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1437 = isnan(_1189);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    float _1447 = -_1407;
    float _1449 = _1447 + 1.0;
    float _1451 = _1273 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1453 = _1445 * _1449;
    float _1455 = -_1445;
    float _1457 = _1455 + 1.0;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1463;
    float _1467 = _1431 * _1457;
    float _1469 = -_1431;
    float _1471 = _1469 + 1.0;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1473;
    float _1477 = fma(_1461, _1343, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1479 = _1357 * _1467;
    float _1481 = _1359 * _1467;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1485 = _1253 + _1483;
    float _1487 = _1361 * _1467;
    float _1489 = _1275 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1493 = _1451 + _1491;
    float _1495 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1497 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1481);
    float _1499 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1479);
    float _1501 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1487);
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1505 = _1489 + _1503;
    float _1507 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1495);
    float _1509 = fma(_1365, _1453, _1497);
    float _1511 = fma(_1363, _1453, _1499);
    float _1513 = fma(_1367, _1453, _1501);
    float _1515 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1507);
    float _1517 = fma(_1383, _1433, _1509);
    float _1519 = -_207;
    int _1521 = _1215 ? as_type<int>(_1519) : as_type<int>(_207);
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1525 = _1485 * _1485;
    float _1527 = fma(_1381, _1433, _1511);
    float _1529 = fma(_1385, _1433, _1513);
    bool _1531 = !_1221;
    float _1533 = _1531 ? _207 : as_type<float>(_1521);
    float _1535 = fma(_1493, _1493, _1525);
    bool _1537 = _1515 >= 0.0;
    float _1539 = fma(_1465, _1343, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1541 = -_215;
    int _1543 = _1243 ? as_type<int>(_1541) : as_type<int>(_215);
    float _1545 = fma(_1475, _1343, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1547 = fma(_1415, _1409, _1527);
    float _1549 = fma(_1417, _1409, _1517);
    float _1551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1553 = fma(_1419, _1409, _1529);
    float _1555 = _1533 + 0.5;
    float _1557 = fma(_1505, _1505, _1535);
    bool _1559 = !_1225;
    float _1561 = _1559 ? _215 : as_type<float>(_1543);
    float _1563 = fma(_1477, _1387, _1547);
    float _1565 = fma(_1539, _1387, _1549);
    float _1567 = fma(_1545, _1387, _1553);
    float _1569 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1571 = -_1561;
    float _1573 = _1571 + 0.5;
    float _1575 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1563);
    float _1577 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1565);
    float _1579 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1567);
    float _1581 = rsqrt(_1557);
    float _1583 = _1569 * _1523;
    float _1585 = _1569;
    if (_1537)
    {
        _1585 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1587 = _1585;
    float _1589 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1591 = _1575 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1593 = _1577 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1595 = _1579 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1597 = _1589 * _1551;
    int _1599 = as_type<int>(_1587);
    if (_1537)
    {
        float _1601 = _1587 * 5.0;
        _1599 = as_type<int>(_1601);
    }
    int _1603 = _1599;
    float _1605 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1607 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1609 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1583;
    out.m_58.y = _1597;
    float _1611 = _1485 * _1581;
    float _1613 = _1609;
    if (_1537)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4737 = as_type<float>(_1603);
        out.gl_Position.z = _4737;
    }
    float _1615 = _1493 * _1581;
    out.m_60.x = _1605;
    out.m_60.y = _1607;
    out.m_60.z = _1609;
    float _1617 = _1615;
    if (_1537)
    {
        out.m_45.x = 0.0;
    }
    if (_1537)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1619 = -_1611;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1623 = _1505 * _1581;
    float _1625 = -_1615;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1629 = -_1611;
    float _1631 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1485);
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1635 = _1621 + _1633;
    float _1637 = -_1623;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1489);
    float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1643 = _1627 + _1641;
    float _1645 = -_1615;
    float _1647 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1493);
    float _1649 = _1635 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1653 = _1639 + _1651;
    float _1655 = _1631 * _1631;
    float _1657 = -_1623;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1505);
    float _1661 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1649);
    float _1663 = _363 * _653;
    float _1665 = fma(_1647, _1647, _1655);
    float _1667 = _363 * _655;
    float _1669 = fma(_1653, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1661);
    float _1671 = fma(_1659, _1659, _1665);
    bool _1673 = _1669 >= 0.0;
    float _1675 = sqrt(_1671);
    if (_1673)
    {
        _1613 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1677 = _1613;
    int _1679 = as_type<int>(_1677);
    if (_1673)
    {
        out.m_45.x = 0.0;
    }
    float _1681 = _1581 * _1675;
    if (_1673)
    {
        float _1683 = _1677 * 5.0;
        _1679 = as_type<int>(_1683);
    }
    int _1685 = _1679;
    if (_1673)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4884 = as_type<float>(_1685);
        out.gl_Position.z = _4884;
    }
    if (_1673)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _1691 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1695 = _1681 * _1687;
    float _1697 = _1681 * _1691;
    float _1699 = _1689 * _1695;
    float _1701 = _1693 * _1697;
    float _1703 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1705 = _1703 * 0.5;
    float _1707 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1709 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1711 = _1699 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1713 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1707);
    float _1715 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1709);
    float _1717 = fma(_1701, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1711);
    float _1719 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1713);
    float _1721 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1715);
    float _1723 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1717);
    float _1725 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1727 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1729 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1731 = _1489 + _1725;
    float _1733 = _1451 + _1727;
    float _1735 = _1253 + _1729;
    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1739 = _1731 + _1737;
    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1743 = _1733 + _1741;
    float _1745 = _1739 * _1739;
    float _1747 = fma(_1743, _1743, _1745);
    float _1749 = sqrt(_1747);
    bool _1751 = _1749 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1753 = _1705;
    float _1755 = _1729;
    float _1757 = _1723;
    float _1759 = _1731;
    float _1761 = _1747;
    if (!_1751)
    {
        _1753 = _1733;
    }
    float _1763 = _1753;
    float _1765 = _1763;
    if (!_1751)
    {
        _1755 = _1731;
    }
    float _1767 = _1755;
    float _1769 = _1767;
    if (!_1751)
    {
        _1757 = _1735;
    }
    float _1771 = _1757;
    bool _1773 = !_1751;
    float _1775 = _1771;
    if (!_1773)
    {
        float _1777 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1781 = _1749 + _1779;
        float _1783 = _1735 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1785 = rsqrt(_1747);
        float _1787 = _1781 * _1777;
        float _1789 = _1787 * 0.15915493667125701904296875;
        float _1791 = _1789 * 6.283185482025146484375;
        float _1793 = cos(_1791);
        float _1795 = _1789 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = _1793 + (-1.0);
        float _1801 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1803 = fma(_1797, _1783, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1805 = fma(_1735, _1793, _1801);
        float _1807 = _1785 * _1803;
        float _1809 = fma(_1743, _1807, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1811 = fma(_1739, _1807, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1775 = _1805;
        _1765 = _1809;
        _1769 = _1811;
        _1759 = _1789;
    }
    float _1813 = _1775;
    float _1815 = _1765;
    float _1817 = _1769;
    float _1819 = _1759;
    float _1821 = -_1611;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1813);
    float _1825 = -_1615;
    float _1827 = fma(_1825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1815);
    float _1829 = -_1623;
    float _1831 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1817);
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1835 = _1823 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1839 = _1827 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = _1831 + _1841;
    float _1845 = _1835 * _1835;
    float _1847 = fma(_1839, _1839, _1845);
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = rsqrt(_1849);
    float _1853 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1855 = _1839 * _1853;
    float _1857 = _1843 * _1853;
    float _1859 = _1855 * _1855;
    float _1861 = _1857 * _1857;
    float _1863 = _1859 + _1861;
    float _1865 = sqrt(_1863);
    bool _1867 = _1865 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1871 = _1865 + _1869;
    float _1873 = _1851;
    float _1875 = _1819;
    float _1877 = _1871;
    float _1879 = _1853;
    float _1881 = _1835;
    float _1883 = _1855;
    if (_1867)
    {
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1873 = _1885;
    }
    float _1887 = _1873;
    if (_1867)
    {
        float _1889 = rsqrt(_1863);
        _1875 = _1889;
    }
    float _1891 = _1875;
    float _1893 = _1891;
    if (_1867)
    {
        float _1895 = _1871 * _1887;
        _1877 = _1895;
    }
    float _1897 = _1877;
    if (_1867)
    {
        float _1899 = _1897 * 0.15915493667125701904296875;
        _1617 = _1899;
    }
    float _1901 = _1617;
    float _1903 = _1887;
    if (_1867)
    {
        float _1905 = _1901 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        _1903 = _1907;
    }
    float _1909 = _1903;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1913 = precise::max(0.0, _1911);
    float _1915 = _1843;
    float _1917 = _1913;
    if (_1867)
    {
        float _1919 = _1901 * 6.283185482025146484375;
        float _1921 = cos(_1919);
        _1915 = _1921;
    }
    float _1923 = _1915;
    float _1925 = -_1853;
    float _1927 = -_1913;
    float _1929 = fma(_1835, _1925, _1927);
    if (_1867)
    {
        float _1931 = _1929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1917 = _1931;
    }
    float _1933 = _1917;
    float _1935 = _1909;
    float _1937 = _1933;
    if (_1867)
    {
        float _1939 = fma(_1909, _1933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1761 = _1939;
    }
    float _1941 = _1761;
    if (!_1867)
    {
        _1935 = _1857;
    }
    float _1943 = _1935;
    float _1945 = _1943;
    if (_1867)
    {
        float _1947 = _1923 + (-1.0);
        _1937 = _1947;
    }
    float _1949 = _1937;
    float _1951 = _1949;
    if (_1867)
    {
        float _1953 = _1891 * _1941;
        _1879 = _1953;
    }
    float _1955 = _1879;
    if (!_1867)
    {
        _1893 = _1929;
    }
    float _1957 = _1893;
    float _1959 = sqrt(_1849);
    float _1961 = _1957;
    if (_1867)
    {
        float _1963 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1881 = _1963;
    }
    float _1965 = _1881;
    float _1967 = _1965;
    if (_1867)
    {
        float _1969 = _1855 * _1955;
        _1883 = _1969;
    }
    float _1971 = _1883;
    if (!_1867)
    {
        _1951 = _1859;
    }
    float _1973 = _1951;
    float _1975 = _1973;
    if (_1867)
    {
        float _1977 = _1857 * _1955;
        _1945 = _1977;
    }
    float _1979 = _1945;
    if (_1867)
    {
        float _1981 = fma(_1929, _1923, _1965);
        _1961 = _1981;
    }
    float _1983 = _1961;
    if (_1867)
    {
        float _1985 = _1971 * _1971;
        _1975 = _1985;
    }
    float _1987 = _1975;
    if (!_1867)
    {
        _1967 = _1861;
    }
    float _1989 = _1967;
    float _1991 = _1989;
    if (_1867)
    {
        float _1993 = _1979 * _1979;
        _1991 = _1993;
    }
    float _1995 = _1991;
    float _1997 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1999 = fma(_1983, _1983, _1987);
    float _2001 = _1999 + _1995;
    float _2003 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2007 = fma(_1959, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2005);
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2013 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2015 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2003);
    float _2017 = rsqrt(_2001);
    float _2019 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2021 = -_2009;
    float _2023 = _2021 + 1.0;
    float _2025 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2011);
    float _2027 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2015);
    float _2029 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2019);
    float _2031 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1997);
    float _2033 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2025);
    float _2035 = abs(_2023);
    float _2037 = log2(_2035);
    float _2039 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2029);
    float _2041 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2043 = fma(_1831, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2031);
    float _2045 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2047 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2049 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2051 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2053 = _2017 * _1971;
    float _2055 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2057 = _2017 * _1983;
    float _2059 = -_2049;
    float _2061 = fma(_2059, _2013, 1.0);
    float _2063 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2065 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2055);
    float _2067 = _2017 * _1979;
    float _2069 = -_2063;
    float _2071 = fma(_2057, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2069);
    float _2073 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2075 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2065);
    float _2077 = log2(_2061);
    float _2079 = -_2067;
    float _2081 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2071);
    float _2083 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2085 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2075);
    float _2087 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2089 = fma(_2081, -0.5, 0.5);
    float _2091 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2083);
    float _2093 = exp2(_2073);
    float _2095 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2087);
    float _2097 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2091);
    float _2099 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2095);
    float _2101 = 1.0 / _2085;
    float _2103 = fma(_2081, 0.5, 0.5);
    float _2105 = _2057 + 1.0;
    float _2107 = _2077 * 0.693147182464599609375;
    float _2109 = fma(_2103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2111 = sqrt(_2089);
    float _2113 = -_2057;
    float _2115 = fma(_2093, _2105, _2113);
    float _2117 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2097);
    float _2119 = fma(_2103, _2109, -0.212114393711090087890625);
    float _2121 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2099);
    float _2123 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2125 = fma(_2115, 0.5, 0.5);
    float _2127 = fma(_2103, _2119, 1.570728778839111328125);
    float _2129 = _2117 * _2101;
    float _2131 = _2121 * _2101;
    float _2133 = fma(_2129, 0.5, 0.5);
    float _2135 = fma(_2131, -0.5, 0.5);
    float _2137 = _2111 * 0.636619746685028076171875;
    float3 _5641 = float3(_2133, _2135, _2123);
    float _2139 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5641, float3(0.0), isnan(_5641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5641, float3(0.0), isnan(_5641)), level(0.0)).x;
    float _2141 = -_2127;
    float _2143 = fma(_2137, _2141, 1.0);
    float3 _5657 = float3(_2133, _2135, _2123);
    float4 _2146 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5657, float3(0.0), isnan(_5657)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5657, float3(0.0), isnan(_5657)), level(0.0)).xyzw;
    float _2148 = _2146.x;
    float _2150 = _2146.y;
    float _2152 = _2146.z;
    float _2154 = _2146.w;
    float2 _5674 = float2(_2143, _2125);
    float3 _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5674, float2(0.0), isnan(_5674)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5674, float2(0.0), isnan(_5674)), level(0.0)).xyz;
    float _2160 = _2158.x;
    float _2162 = _2158.y;
    float _2164 = _2158.z;
    float _2166 = _2037 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2168 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2170 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2168);
    float _2172 = exp2(_2166);
    float _2174 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2170);
    float _2176 = fma(_2051, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2174);
    float _2178 = _2176 + _2085;
    out.gl_Position.x = _2117;
    out.gl_Position.y = _2121;
    out.gl_Position.z = _2176;
    out.gl_Position.w = _2085;
    float _2180 = _2178 * 0.5;
    float _2182 = -_2172;
    float _2184 = _2182 + 1.0;
    float _2186 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2188 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2180;
    out.m_62.w = _2085;
    out.m_45.x = _2186;
    float _2190 = _2188 * _2139;
    float _2192 = -_2188;
    float _2194 = _2192 + 1.0;
    float _2196 = _2154 * _2190;
    float _2198 = _2154 * _2194;
    float _2200 = _2164 * _2190;
    float _2202 = fma(_2160, _2196, _2148);
    float _2204 = fma(_2162, _2196, _2150);
    float _2206 = fma(_2154, _2200, _2152);
    out.m_64.x = _2202;
    out.m_64.y = _2204;
    out.m_64.z = _2206;
    out.m_64.w = _2198;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

