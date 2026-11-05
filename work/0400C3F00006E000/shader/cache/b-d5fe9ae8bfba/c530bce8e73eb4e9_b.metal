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
    bool _1061 = false;
    bool _883 = false;
    bool _547 = false;
    bool _263 = false;
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
        float _2153 = as_type<float>(_99);
        out.gl_Position.z = _2153;
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
        float _2221 = as_type<float>(_135);
        out.gl_Position.z = _2221;
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
    float _145 = _141 * _139;
    float _147 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    int _149 = as_type<int>(_143) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_143) & 2;
    bool _155 = _153 != 0;
    float _157 = _147 * 6.283185482025146484375;
    float _159 = floor(_147);
    bool _161 = !_155;
    float _163 = _161 ? (-0.5) : 0.5;
    float _165 = _157 * 0.15915493667125701904296875;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _165 * 6.283185482025146484375;
    float _177 = cos(_175);
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    bool _187 = !_181;
    int _189 = _187 ? 0 : 1;
    float _191 = -_159;
    float _193 = _147 + _191;
    int _195 = abs(_185);
    int _197 = abs(_189);
    float _199 = -_193;
    float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _203 = !_173;
    int _205 = _203 ? 0 : 1;
    float _207 = float(_195);
    float _209 = fma(_177, 0.5, 0.5);
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _213 = abs(_205);
    float _215 = abs(_201);
    float _217 = _207 * _215;
    bool _219 = _193 < 0.5;
    float _221 = float(_219);
    float _223 = -_209;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_197);
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = fma(_227, _225, _217);
    float _235 = float(_213);
    bool _237 = !_151;
    float _239 = _237 ? (-0.5) : 0.5;
    float _241 = abs(_231);
    float _243 = fma(_235, _241, _233);
    bool _245 = !_211;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _293;
    float _297 = 1.0 / _279;
    float _299 = 1.0 / _283;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _271 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _307 = 1.0 / _291;
    float _309 = _303 * _297;
    bool _311 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _313 = isnan(_271);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    bool _323 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _325 = isnan(_271);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _295;
    float _337 = _275 * _299;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _271 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _271 + _343;
    float _347 = 1.0 / _287;
    float _349 = _341 * _307;
    bool _351 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_271);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = fma(_365, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _371 = _271 + _369;
    float _373 = _371 * _335;
    bool _375 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _377 = isnan(_271);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = -_321;
    float _389 = _387 + 1.0;
    float _391 = _345 * _347;
    float _393 = -_333;
    float _395 = _393 + 1.0;
    float _397 = -_385;
    float _399 = _397 + 1.0;
    float _401 = _361 * _389;
    float _403 = -_361;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _411 = _321 * _399;
    bool _413 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _415 = isnan(_271);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = _385 * _395;
    bool _427 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _429 = isnan(_271);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = _423 * _405;
    float _449 = -_423;
    float _451 = _449 + 1.0;
    float _453 = fma(_441, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _455 = -_437;
    float _457 = _455 + 1.0;
    float _459 = fma(_445, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _461 = _437 * _451;
    float _463 = fma(_409, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _469;
    float _473 = _453 * _461;
    float _475 = _367 * _461;
    float _477 = fma(_467, _391, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_471, _391, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _483 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _489 = fma(_459, _447, _481);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = fma(_463, _447, _483);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _497;
    float _501 = fma(_487, _349, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _503 = fma(_493, _349, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _505;
    float _509 = fma(_477, _401, _489);
    float _511 = fma(_479, _401, _495);
    float _513 = fma(_499, _373, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _515 = fma(_507, _373, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _517 = fma(_501, _411, _509);
    float _519 = fma(_503, _411, _511);
    float _521 = fma(_513, _425, _517);
    float _523 = fma(_515, _425, _519);
    float _525 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[148].x, _521);
    float _527 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[148].y, _523);
    bool _529 = !_305;
    float _545;
    if (!_529)
    {
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _533 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _537 = _535 * _531;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _543;
        _547 = true;
    }
    else
    {
        float _549 = float(_83);
        float _551 = 1.0 / _549;
        float _553 = _117 * _551;
        _545 = _553;
    }
    _547 = false;
    float _555 = _545;
    float _557 = in.m_54.x;
    float _559 = in.m_54.y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _563 = _555 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _581 = 1.0 / _567;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _583;
    float _587 = 1.0 / _571;
    bool _589 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _591 = isnan(_555);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _601;
    bool _605 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _607 = isnan(_555);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = _527 * _559;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _621 = _555 + _619;
    float _623 = 1.0 / _575;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _627 = _555 + _625;
    float _629 = _563 * _581;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _633 = _555 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _635;
    float _639 = -_599;
    float _641 = _639 + 1.0;
    float _643 = fma(_603, _629, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _645 = 1.0 / _579;
    float _647 = _621 * _587;
    bool _649 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _651 = isnan(_555);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _663 = _555 + _661;
    float _665 = fma(_637, _629, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _667 = _615 * _641;
    float _669 = -_615;
    float _671 = _669 + 1.0;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = 1.0 / _585;
    float _677 = _627 * _623;
    bool _679 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _681 = isnan(_555);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _525 * _557;
    float _693 = -_689;
    float _695 = _693 + 1.0;
    float _697 = _633 * _645;
    float _699 = -_659;
    float _701 = _699 + 1.0;
    bool _703 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _705 = isnan(_555);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = _689 * _701;
    float _717 = _713 * _695;
    float _719 = _663 * _675;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _721;
    float _725 = -_713;
    float _727 = _725 + 1.0;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _733 = fma(_723, _629, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _735 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _737 = isnan(_555);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _599 * _727;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _757 = fma(_731, _647, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _759 = _745 * _671;
    float _761 = fma(_751, _647, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _763 = fma(_755, _647, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _765 = _733 * _759;
    float _767 = -_745;
    float _769 = _767 + 1.0;
    float _771 = _643 * _759;
    float _773 = _665 * _759;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _779;
    float _783 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[107].x, _765);
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[107].y, _771);
    float _787 = fma(_777, _677, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _789 = fma(_781, _677, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _795;
    float _799 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[107].z, _773);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _805 = fma(_761, _667, _783);
    float _807 = fma(_793, _697, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _809 = fma(_797, _677, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _811 = fma(_803, _697, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _813 = fma(_763, _667, _785);
    float _815 = fma(_757, _667, _799);
    float _817 = fma(_787, _747, _805);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _823 = fma(_789, _747, _813);
    float _825 = fma(_809, _747, _815);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _827;
    float _831 = fma(_821, _697, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _837;
    float _841 = fma(_807, _717, _817);
    float _843 = fma(_829, _719, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _845 = fma(_835, _719, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _847 = fma(_839, _719, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _849 = fma(_811, _717, _823);
    float _851 = fma(_831, _717, _825);
    float _853 = fma(_843, _715, _841);
    float _855 = fma(_845, _715, _849);
    float _857 = fma(_847, _715, _851);
    float _859 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[112].x, _853);
    float _861 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[112].y, _855);
    float _863 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[112].z, _857);
    bool _865 = !_673;
    float _881;
    if (!_865)
    {
        float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _869 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _873 = _871 * _867;
        float _875 = floor(_873);
        float _877 = -_875;
        float _879 = _873 + _877;
        _881 = _879;
        _883 = true;
    }
    else
    {
        float _885 = float(_83);
        float _887 = 1.0 / _885;
        float _889 = _117 * _887;
        _881 = _889;
    }
    _883 = false;
    float _891 = _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _895 = _891 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _901 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _903 = isnan(_891);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _921 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _923 = isnan(_891);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _929 = _925 || _927;
    float _931 = float(_929);
    float _933 = 1.0 / _899;
    float _935 = -_911;
    float _937 = _935 + 1.0;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _939;
    bool _943 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _945 = isnan(_891);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = _931 * _937;
    float _957 = -_931;
    float _959 = _957 + 1.0;
    bool _961 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _963 = 1.0 / _915;
    float _965 = _953 * _959;
    float _967 = -_953;
    float _969 = _967 + 1.0;
    float _971 = 1.0 / _919;
    float _973 = _941 * _933;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _979 = fma(_973, _895, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _981 = _977 * _963;
    bool _983 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _985 = isnan(_891);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _995;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1001 = _891 + _999;
    float _1003 = _979 * _965;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1007 = _891 + _1005;
    float _1009 = -_993;
    float _1011 = _1009 + 1.0;
    float _1013 = fma(_981, _1001, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1015 = _997 * _971;
    float _1017 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1003);
    float _1019 = _911 * _1011;
    float _1021 = _859 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1023 = fma(_1015, _1007, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1025 = fma(_1013, _955, _1017);
    float _1027 = _863 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = fma(_1023, _1019, _1025);
    float _1033 = _861 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1031);
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1029;
    out.m_56.y = _1039;
    out.m_56.z = _1035;
    out.m_56.w = _1041;
    bool _1043 = !_961;
    float _1059;
    if (!_1043)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1047 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1051 = _1049 * _1045;
        float _1053 = floor(_1051);
        float _1055 = -_1053;
        float _1057 = _1051 + _1055;
        _1059 = _1057;
        _1061 = true;
    }
    else
    {
        float _1063 = float(_83);
        float _1065 = 1.0 / _1063;
        float _1067 = _117 * _1065;
        _1059 = _1067;
    }
    _1061 = false;
    float _1069 = _1059;
    float _1071 = in.m_42.x;
    float _1073 = in.m_42.y;
    float _1075 = in.m_42.z;
    float _1077 = in.m_49.y;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1095 = 1.0 / _1081;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1097;
    bool _1101 = _137 > 0.5;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1105 = _1069 + _1103;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1113 = _1111 != 0;
    float _1115 = 1.0 / _1085;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1119 = _1069 + _1117;
    float _1121 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1123 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1125 = 1.0 / _1089;
    float _1127 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1129 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1121);
    float _1131 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1123);
    bool _1133 = _1077 > 0.5;
    float _1135 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1127);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1139 = _1069 + _1137;
    float _1141 = 1.0 / _1093;
    float _1143 = _1119 * _1115;
    float _1145 = _1105 * _1095;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1149 = _1069 + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1157 = _1069 + _1155;
    float _1159 = 1.0 / _1099;
    float _1161 = _1139 * _1125;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1163;
    float _1167 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1129);
    float _1169 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1131);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1171;
    float _1175 = fma(_1165, _1145, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1177 = _1149 * _1141;
    float _1179 = fma(_1153, _1145, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1181 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1183 = isnan(_1069);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1189 = _1185 || _1187;
    float _1191 = float(_1189);
    float _1193 = fma(_1173, _1145, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1195 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1135);
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1205;
    float _1209 = _1157 * _1159;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1215 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1217 = isnan(_1069);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    float _1227 = -_1191;
    float _1229 = _1227 + 1.0;
    bool _1231 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1233 = isnan(_1069);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1251 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1253 = isnan(_1069);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = fma(_1199, _1161, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1265 = fma(_1203, _1161, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1267 = fma(_1207, _1161, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1269 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1271 = isnan(_1069);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1241 * _1229;
    float _1283 = -_1225;
    float _1285 = _1283 + 1.0;
    float _1287 = fma(_1245, _1143, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1289 = fma(_1249, _1143, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1291 = fma(_1213, _1143, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1293 = -_1241;
    float _1295 = _1293 + 1.0;
    bool _1297 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1299 = isnan(_1069);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = -_1261;
    float _1311 = _1309 + 1.0;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1319 = _1317 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1321 = _1279 * _1285;
    float _1323 = _1261 * _1295;
    float _1325 = -_1279;
    float _1327 = _1325 + 1.0;
    float _1329 = _1225 * _1311;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1335 = fma(_1315, _1177, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1337 = _1307 * _1327;
    float _1339 = fma(_1333, _1177, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1341 = fma(_1319, _1177, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1343 = _1193 * _1337;
    float _1345 = -_1307;
    float _1347 = _1345 + 1.0;
    float _1349 = _1175 * _1337;
    float _1351 = _1179 * _1337;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1361;
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1343);
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1349);
    float _1369 = fma(_1355, _1209, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1371 = fma(_1359, _1209, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1373 = fma(_1363, _1209, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1375 = fma(_1289, _1321, _1365);
    float _1377 = _1169 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1379 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1351);
    float _1381 = fma(_1287, _1321, _1367);
    float _1383 = fma(_1265, _1329, _1375);
    float _1385 = _1167 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1389 = _1377 + _1387;
    float _1391 = fma(_1291, _1321, _1379);
    float _1393 = fma(_1263, _1329, _1381);
    float _1395 = _1195 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1385 + _1397;
    float _1401 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1403 = fma(_1267, _1329, _1391);
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1407 = _1395 + _1405;
    float _1409 = fma(_1335, _1323, _1393);
    float _1411 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1401);
    float _1413 = -_239;
    int _1415 = _1101 ? as_type<int>(_1413) : as_type<int>(_239);
    float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1419 = fma(_1339, _1323, _1383);
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1411);
    float _1423 = -_163;
    int _1425 = _1133 ? as_type<int>(_1423) : as_type<int>(_163);
    float _1427 = fma(_1341, _1323, _1403);
    float _1429 = _1389 * _1389;
    bool _1431 = !_1109;
    float _1433 = _1431 ? _239 : as_type<float>(_1415);
    float _1435 = fma(_1369, _1281, _1409);
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1439 = !_1113;
    float _1441 = _1439 ? _163 : as_type<float>(_1425);
    float _1443 = fma(_1371, _1281, _1419);
    bool _1445 = _1421 >= 0.0;
    float _1447 = fma(_1373, _1281, _1427);
    float _1449 = fma(_1399, _1399, _1429);
    float _1451 = _1433 + 0.5;
    float _1453 = -_1441;
    float _1455 = _1453 + 0.5;
    float _1457 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1435);
    float _1459 = fma(_1407, _1407, _1449);
    float _1461 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1463 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1465 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1443);
    float _1467 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1447);
    float _1469 = rsqrt(_1459);
    float _1471 = _1461 * _1417;
    float _1473 = _1463 * _1437;
    float _1475 = _1461;
    float _1477 = _1395;
    if (_1445)
    {
        _1475 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1479 = _1475;
    float _1481 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1483 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1485 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1487 = as_type<int>(_1479);
    if (_1445)
    {
        float _1489 = _1479 * 5.0;
        _1487 = as_type<int>(_1489);
    }
    int _1491 = _1487;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1471;
    out.m_58.y = _1473;
    if (_1445)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4455 = as_type<float>(_1491);
        out.gl_Position.z = _4455;
    }
    float _1499 = _1389 * _1469;
    float _1501 = _1399 * _1469;
    out.m_60.x = _1493;
    out.m_60.y = _1495;
    out.m_60.z = _1497;
    if (_1445)
    {
        out.m_45.x = 0.0;
    }
    if (_1445)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1503 = -_1499;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1377);
    float _1507 = _1407 * _1469;
    float _1509 = -_1501;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1385);
    float _1513 = -_1499;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1389);
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1519 = _1505 + _1517;
    float _1521 = -_1507;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1395);
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1527 = _1511 + _1525;
    float _1529 = -_1501;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1399);
    float _1533 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1537 = _1523 + _1535;
    float _1539 = -_1507;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1407);
    float _1543 = _243 * _691;
    float _1545 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1533);
    float _1547 = _1515 * _1515;
    float _1549 = _243 * _617;
    float _1551 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1545);
    float _1553 = fma(_1531, _1531, _1547);
    bool _1555 = _1551 >= 0.0;
    float _1557 = fma(_1541, _1541, _1553);
    float _1559 = sqrt(_1557);
    float _1561 = _1551;
    if (_1555)
    {
        _1561 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1563 = _1561;
    int _1565 = as_type<int>(_1563);
    if (_1555)
    {
        out.m_45.x = 0.0;
    }
    if (_1555)
    {
        float _1567 = _1563 * 5.0;
        _1565 = as_type<int>(_1567);
    }
    int _1569 = _1565;
    if (_1555)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4602 = as_type<float>(_1569);
        out.gl_Position.z = _4602;
    }
    float _1571 = _1469 * _1559;
    if (_1555)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1573 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _163);
    float _1577 = _1543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _1581 = _1571 * _1573;
    float _1583 = _1571 * _1577;
    float _1585 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1587 = _1585 * 0.5;
    float _1589 = _1575 * _1581;
    float _1591 = _1579 * _1583;
    float _1593 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1595 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1597 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1599 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1593);
    float _1601 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1595);
    float _1603 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1597);
    float _1605 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1599);
    float _1607 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1601);
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1603);
    float _1611 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1613 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1615 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1617 = _1395 + _1611;
    float _1619 = _1385 + _1613;
    float _1621 = _1377 + _1615;
    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1625 = _1617 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1629 = _1619 + _1627;
    float _1631 = _1625 * _1625;
    float _1633 = fma(_1629, _1629, _1631);
    float _1635 = sqrt(_1633);
    bool _1637 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1639 = _1631;
    float _1641 = _1615;
    float _1643 = _1609;
    float _1645 = _1617;
    float _1647 = _1633;
    if (!_1637)
    {
        _1639 = _1619;
    }
    float _1649 = _1639;
    float _1651 = _1649;
    if (!_1637)
    {
        _1641 = _1617;
    }
    float _1653 = _1641;
    float _1655 = _1653;
    if (!_1637)
    {
        _1643 = _1621;
    }
    float _1657 = _1643;
    bool _1659 = !_1637;
    float _1661 = _1657;
    if (!_1659)
    {
        float _1663 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1667 = _1635 + _1665;
        float _1669 = rsqrt(_1633);
        float _1671 = _1667 * _1663;
        float _1673 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1675 = _1671 * 0.15915493667125701904296875;
        float _1677 = _1675 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = _1675 * 6.283185482025146484375;
        float _1683 = sin(_1681);
        float _1685 = _1679 + (-1.0);
        float _1687 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1689 = fma(_1683, _1673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1691 = fma(_1621, _1679, _1687);
        float _1693 = _1669 * _1689;
        float _1695 = fma(_1629, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1697 = fma(_1625, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1661 = _1691;
        _1651 = _1695;
        _1655 = _1697;
        _1645 = _1675;
        _1647 = _1669;
    }
    float _1699 = _1661;
    float _1701 = _1651;
    float _1703 = _1655;
    float _1705 = _1645;
    float _1707 = _1647;
    float _1709 = -_1499;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1699);
    float _1713 = -_1501;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1701);
    float _1717 = -_1507;
    float _1719 = fma(_1717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1703);
    float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1723 = _1711 + _1721;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1727 = _1715 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1731 = _1719 + _1729;
    float _1733 = _1723 * _1723;
    float _1735 = fma(_1727, _1727, _1733);
    float _1737 = fma(_1731, _1731, _1735);
    float _1739 = rsqrt(_1737);
    float _1741 = sqrt(_1737);
    float _1743 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1745 = _1727 * _1743;
    float _1747 = _1731 * _1743;
    float _1749 = _1745 * _1745;
    float _1751 = _1747 * _1747;
    float _1753 = _1749 + _1751;
    float _1755 = sqrt(_1753);
    bool _1757 = _1755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1761 = _1755 + _1759;
    float _1763 = _1739;
    float _1765 = _1707;
    float _1767 = _1761;
    float _1769 = _1705;
    float _1771 = _1723;
    float _1773 = _1745;
    if (_1757)
    {
        float _1775 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1763 = _1775;
    }
    float _1777 = _1763;
    if (_1757)
    {
        float _1779 = rsqrt(_1753);
        _1765 = _1779;
    }
    float _1781 = _1765;
    float _1783 = _1781;
    if (_1757)
    {
        float _1785 = _1761 * _1777;
        _1767 = _1785;
    }
    float _1787 = _1767;
    if (_1757)
    {
        float _1789 = _1787 * 0.15915493667125701904296875;
        _1769 = _1789;
    }
    float _1791 = _1769;
    float _1793 = _1731;
    if (_1757)
    {
        float _1795 = _1791 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        _1793 = _1797;
    }
    float _1799 = _1793;
    float _1801 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1803 = precise::max(0.0, _1801);
    float _1805 = _1777;
    float _1807 = _1803;
    if (_1757)
    {
        float _1809 = _1791 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        _1805 = _1811;
    }
    float _1813 = _1805;
    float _1815 = -_1743;
    float _1817 = -_1803;
    float _1819 = fma(_1723, _1815, _1817);
    if (_1757)
    {
        float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1771 = _1821;
    }
    float _1823 = _1771;
    float _1825 = _1823;
    float _1827 = _1799;
    if (_1757)
    {
        float _1829 = fma(_1799, _1823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1825 = _1829;
    }
    float _1831 = _1825;
    float _1833 = _1831;
    if (!_1757)
    {
        _1827 = _1819;
    }
    float _1835 = _1827;
    float _1837 = _1835;
    float _1839 = _1813;
    if (_1757)
    {
        float _1841 = _1813 + (-1.0);
        _1807 = _1841;
    }
    float _1843 = _1807;
    float _1845 = _1843;
    if (_1757)
    {
        float _1847 = _1781 * _1831;
        _1477 = _1847;
    }
    float _1849 = _1477;
    if (!_1757)
    {
        _1833 = _1749;
    }
    float _1851 = _1833;
    float _1853 = _1851;
    if (_1757)
    {
        float _1855 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1783 = _1855;
    }
    float _1857 = _1783;
    if (_1757)
    {
        float _1859 = _1745 * _1849;
        _1773 = _1859;
    }
    float _1861 = _1773;
    if (!_1757)
    {
        _1845 = _1747;
    }
    float _1863 = _1845;
    float _1865 = _1863;
    if (_1757)
    {
        float _1867 = _1747 * _1849;
        _1865 = _1867;
    }
    float _1869 = _1865;
    if (_1757)
    {
        float _1871 = fma(_1819, _1813, _1857);
        _1837 = _1871;
    }
    float _1873 = _1837;
    if (_1757)
    {
        float _1875 = _1861 * _1861;
        _1853 = _1875;
    }
    float _1877 = _1853;
    if (!_1757)
    {
        _1839 = _1751;
    }
    float _1879 = _1839;
    float _1881 = _1879;
    if (_1757)
    {
        float _1883 = _1869 * _1869;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = fma(_1873, _1873, _1877);
    float _1889 = _1887 + _1885;
    float _1891 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1895 = fma(_1741, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1893);
    float _1897 = precise::clamp(_1895, 0.0, 1.0);
    float _1899 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1901 = rsqrt(_1889);
    float _1903 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1891);
    float _1905 = -_1897;
    float _1907 = _1905 + 1.0;
    float _1909 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1899);
    float _1911 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1913 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1903);
    float _1915 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1917 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1909);
    float _1919 = abs(_1907);
    float _1921 = log2(_1919);
    float _1923 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1925 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1915);
    float _1927 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1929 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1931 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1925);
    float _1933 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1935 = _1901 * _1861;
    float _1937 = -_1929;
    float _1939 = fma(_1937, _1911, 1.0);
    float _1941 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1927);
    float _1943 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1947 = _1901 * _1873;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1951 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1941);
    float _1953 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1945);
    float _1955 = _1901 * _1869;
    float _1957 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1959 = -_1949;
    float _1961 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1959);
    float _1963 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1965 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1953);
    float _1967 = log2(_1939);
    float _1969 = -_1955;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1961);
    float _1973 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1975 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1965);
    float _1977 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1979 = fma(_1971, -0.5, 0.5);
    float _1981 = fma(_1971, 0.5, 0.5);
    float _1983 = exp2(_1957);
    float _1985 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1973);
    float _1987 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1977);
    float _1989 = _1947 + 1.0;
    float _1991 = fma(_1981, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1993 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1985);
    float _1995 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1987);
    float _1997 = 1.0 / _1975;
    float _1999 = fma(_1981, _1991, -0.212114393711090087890625);
    float _2001 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1995);
    float _2003 = _1967 * 0.693147182464599609375;
    float _2005 = fma(_1981, _1999, 1.570728778839111328125);
    float _2007 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2009 = sqrt(_1979);
    float _2011 = -_1947;
    float _2013 = fma(_1983, _1989, _2011);
    float _2015 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1993);
    float _2017 = fma(_2013, 0.5, 0.5);
    float _2019 = _2015 * _1997;
    float _2021 = _2001 * _1997;
    float _2023 = fma(_2019, 0.5, 0.5);
    float _2025 = fma(_2021, -0.5, 0.5);
    float _2027 = _2009 * 0.636619746685028076171875;
    float3 _5367 = float3(_2023, _2025, _2007);
    float _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5367, float3(0.0), isnan(_5367)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5367, float3(0.0), isnan(_5367)), level(0.0)).x;
    float3 _5378 = float3(_2023, _2025, _2007);
    float4 _2032 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5378, float3(0.0), isnan(_5378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5378, float3(0.0), isnan(_5378)), level(0.0)).xyzw;
    float _2034 = _2032.x;
    float _2036 = _2032.y;
    float _2038 = _2032.z;
    float _2040 = _2032.w;
    float _2042 = -_2005;
    float _2044 = fma(_2027, _2042, 1.0);
    float2 _5400 = float2(_2044, _2017);
    float3 _2048 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5400, float2(0.0), isnan(_5400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5400, float2(0.0), isnan(_5400)), level(0.0)).xyz;
    float _2050 = _2048.x;
    float _2052 = _2048.y;
    float _2054 = _2048.z;
    float _2056 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2058 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2060 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2058);
    float _2062 = exp2(_2056);
    float _2064 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2060);
    float _2066 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2064);
    float _2068 = _2066 + _1975;
    out.gl_Position.x = _2015;
    out.gl_Position.y = _2001;
    out.gl_Position.z = _2066;
    out.gl_Position.w = _1975;
    float _2070 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2072 = _2068 * 0.5;
    float _2074 = -_2062;
    float _2076 = _2074 + 1.0;
    out.m_45.x = _2070;
    float _2078 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2072;
    out.m_62.w = _1975;
    float _2080 = _2078 * _2029;
    float _2082 = -_2078;
    float _2084 = _2082 + 1.0;
    float _2086 = _2040 * _2080;
    float _2088 = _2054 * _2080;
    float _2090 = fma(_2050, _2086, _2034);
    float _2092 = fma(_2052, _2086, _2036);
    float _2094 = _2040 * _2084;
    float _2096 = fma(_2040, _2088, _2038);
    out.m_64.x = _2090;
    out.m_64.y = _2092;
    out.m_64.z = _2096;
    out.m_64.w = _2094;
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
    bool _1061 = false;
    bool _883 = false;
    bool _547 = false;
    bool _263 = false;
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
        float _2153 = as_type<float>(_99);
        out.gl_Position.z = _2153;
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
        float _2221 = as_type<float>(_135);
        out.gl_Position.z = _2221;
    }
    if (_129)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _141 * _139;
    float _147 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    int _149 = as_type<int>(_143) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_143) & 2;
    bool _155 = _153 != 0;
    float _157 = _147 * 6.283185482025146484375;
    float _159 = floor(_147);
    bool _161 = !_155;
    float _163 = _161 ? (-0.5) : 0.5;
    float _165 = _157 * 0.15915493667125701904296875;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _165 * 6.283185482025146484375;
    float _177 = cos(_175);
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    bool _187 = !_181;
    int _189 = _187 ? 0 : 1;
    float _191 = -_159;
    float _193 = _147 + _191;
    int _195 = abs(_185);
    int _197 = abs(_189);
    float _199 = -_193;
    float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _203 = !_173;
    int _205 = _203 ? 0 : 1;
    float _207 = float(_195);
    float _209 = fma(_177, 0.5, 0.5);
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _213 = abs(_205);
    float _215 = abs(_201);
    float _217 = _207 * _215;
    bool _219 = _193 < 0.5;
    float _221 = float(_219);
    float _223 = -_209;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_197);
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = fma(_227, _225, _217);
    float _235 = float(_213);
    bool _237 = !_151;
    float _239 = _237 ? (-0.5) : 0.5;
    float _241 = abs(_231);
    float _243 = fma(_235, _241, _233);
    bool _245 = !_211;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _293;
    float _297 = 1.0 / _279;
    float _299 = 1.0 / _283;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _271 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _307 = 1.0 / _291;
    float _309 = _303 * _297;
    bool _311 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _313 = isnan(_271);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    bool _323 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _325 = isnan(_271);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _295;
    float _337 = _275 * _299;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _271 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _271 + _343;
    float _347 = 1.0 / _287;
    float _349 = _341 * _307;
    bool _351 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_271);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = fma(_365, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _371 = _271 + _369;
    float _373 = _371 * _335;
    bool _375 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _377 = isnan(_271);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = -_321;
    float _389 = _387 + 1.0;
    float _391 = _345 * _347;
    float _393 = -_333;
    float _395 = _393 + 1.0;
    float _397 = -_385;
    float _399 = _397 + 1.0;
    float _401 = _361 * _389;
    float _403 = -_361;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _411 = _321 * _399;
    bool _413 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _415 = isnan(_271);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = _385 * _395;
    bool _427 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _429 = isnan(_271);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = _423 * _405;
    float _449 = -_423;
    float _451 = _449 + 1.0;
    float _453 = fma(_441, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _455 = -_437;
    float _457 = _455 + 1.0;
    float _459 = fma(_445, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _461 = _437 * _451;
    float _463 = fma(_409, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _469;
    float _473 = _453 * _461;
    float _475 = _367 * _461;
    float _477 = fma(_467, _391, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_471, _391, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _483 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _489 = fma(_459, _447, _481);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = fma(_463, _447, _483);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _497;
    float _501 = fma(_487, _349, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _503 = fma(_493, _349, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _505;
    float _509 = fma(_477, _401, _489);
    float _511 = fma(_479, _401, _495);
    float _513 = fma(_499, _373, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _515 = fma(_507, _373, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _517 = fma(_501, _411, _509);
    float _519 = fma(_503, _411, _511);
    float _521 = fma(_513, _425, _517);
    float _523 = fma(_515, _425, _519);
    float _525 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[148].x, _521);
    float _527 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[148].y, _523);
    bool _529 = !_305;
    float _545;
    if (!_529)
    {
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _533 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _537 = _535 * _531;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _543;
        _547 = true;
    }
    else
    {
        float _549 = float(_83);
        float _551 = 1.0 / _549;
        float _553 = _117 * _551;
        _545 = _553;
    }
    _547 = false;
    float _555 = _545;
    float _557 = in.m_54.x;
    float _559 = in.m_54.y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _563 = _555 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _581 = 1.0 / _567;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _583;
    float _587 = 1.0 / _571;
    bool _589 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _591 = isnan(_555);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _601;
    bool _605 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _607 = isnan(_555);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = _527 * _559;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _621 = _555 + _619;
    float _623 = 1.0 / _575;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _627 = _555 + _625;
    float _629 = _563 * _581;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _633 = _555 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _635;
    float _639 = -_599;
    float _641 = _639 + 1.0;
    float _643 = fma(_603, _629, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _645 = 1.0 / _579;
    float _647 = _621 * _587;
    bool _649 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _651 = isnan(_555);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _663 = _555 + _661;
    float _665 = fma(_637, _629, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _667 = _615 * _641;
    float _669 = -_615;
    float _671 = _669 + 1.0;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = 1.0 / _585;
    float _677 = _627 * _623;
    bool _679 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _681 = isnan(_555);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _525 * _557;
    float _693 = -_689;
    float _695 = _693 + 1.0;
    float _697 = _633 * _645;
    float _699 = -_659;
    float _701 = _699 + 1.0;
    bool _703 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _705 = isnan(_555);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = _689 * _701;
    float _717 = _713 * _695;
    float _719 = _663 * _675;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _721;
    float _725 = -_713;
    float _727 = _725 + 1.0;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _733 = fma(_723, _629, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _735 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _737 = isnan(_555);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _599 * _727;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _757 = fma(_731, _647, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _759 = _745 * _671;
    float _761 = fma(_751, _647, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _763 = fma(_755, _647, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _765 = _733 * _759;
    float _767 = -_745;
    float _769 = _767 + 1.0;
    float _771 = _643 * _759;
    float _773 = _665 * _759;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _779;
    float _783 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[107].x, _765);
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[107].y, _771);
    float _787 = fma(_777, _677, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _789 = fma(_781, _677, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _795;
    float _799 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[107].z, _773);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _805 = fma(_761, _667, _783);
    float _807 = fma(_793, _697, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _809 = fma(_797, _677, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _811 = fma(_803, _697, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _813 = fma(_763, _667, _785);
    float _815 = fma(_757, _667, _799);
    float _817 = fma(_787, _747, _805);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _823 = fma(_789, _747, _813);
    float _825 = fma(_809, _747, _815);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _827;
    float _831 = fma(_821, _697, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _837;
    float _841 = fma(_807, _717, _817);
    float _843 = fma(_829, _719, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _845 = fma(_835, _719, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _847 = fma(_839, _719, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _849 = fma(_811, _717, _823);
    float _851 = fma(_831, _717, _825);
    float _853 = fma(_843, _715, _841);
    float _855 = fma(_845, _715, _849);
    float _857 = fma(_847, _715, _851);
    float _859 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[112].x, _853);
    float _861 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[112].y, _855);
    float _863 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[112].z, _857);
    bool _865 = !_673;
    float _881;
    if (!_865)
    {
        float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _869 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _873 = _871 * _867;
        float _875 = floor(_873);
        float _877 = -_875;
        float _879 = _873 + _877;
        _881 = _879;
        _883 = true;
    }
    else
    {
        float _885 = float(_83);
        float _887 = 1.0 / _885;
        float _889 = _117 * _887;
        _881 = _889;
    }
    _883 = false;
    float _891 = _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _895 = _891 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _901 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _903 = isnan(_891);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _921 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _923 = isnan(_891);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _929 = _925 || _927;
    float _931 = float(_929);
    float _933 = 1.0 / _899;
    float _935 = -_911;
    float _937 = _935 + 1.0;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _939;
    bool _943 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _945 = isnan(_891);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = _931 * _937;
    float _957 = -_931;
    float _959 = _957 + 1.0;
    bool _961 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _963 = 1.0 / _915;
    float _965 = _953 * _959;
    float _967 = -_953;
    float _969 = _967 + 1.0;
    float _971 = 1.0 / _919;
    float _973 = _941 * _933;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _979 = fma(_973, _895, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _981 = _977 * _963;
    bool _983 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _985 = isnan(_891);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _995;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1001 = _891 + _999;
    float _1003 = _979 * _965;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1007 = _891 + _1005;
    float _1009 = -_993;
    float _1011 = _1009 + 1.0;
    float _1013 = fma(_981, _1001, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1015 = _997 * _971;
    float _1017 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1003);
    float _1019 = _911 * _1011;
    float _1021 = _859 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1023 = fma(_1015, _1007, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1025 = fma(_1013, _955, _1017);
    float _1027 = _863 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = fma(_1023, _1019, _1025);
    float _1033 = _861 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1031);
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1029;
    out.m_56.y = _1039;
    out.m_56.z = _1035;
    out.m_56.w = _1041;
    bool _1043 = !_961;
    float _1059;
    if (!_1043)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1047 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1051 = _1049 * _1045;
        float _1053 = floor(_1051);
        float _1055 = -_1053;
        float _1057 = _1051 + _1055;
        _1059 = _1057;
        _1061 = true;
    }
    else
    {
        float _1063 = float(_83);
        float _1065 = 1.0 / _1063;
        float _1067 = _117 * _1065;
        _1059 = _1067;
    }
    _1061 = false;
    float _1069 = _1059;
    float _1071 = in.m_42.x;
    float _1073 = in.m_42.y;
    float _1075 = in.m_42.z;
    float _1077 = in.m_49.y;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1095 = 1.0 / _1081;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1097;
    bool _1101 = _137 > 0.5;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1105 = _1069 + _1103;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1113 = _1111 != 0;
    float _1115 = 1.0 / _1085;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1119 = _1069 + _1117;
    float _1121 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1123 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1125 = 1.0 / _1089;
    float _1127 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1129 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1121);
    float _1131 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1123);
    bool _1133 = _1077 > 0.5;
    float _1135 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1127);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1139 = _1069 + _1137;
    float _1141 = 1.0 / _1093;
    float _1143 = _1119 * _1115;
    float _1145 = _1105 * _1095;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1149 = _1069 + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1157 = _1069 + _1155;
    float _1159 = 1.0 / _1099;
    float _1161 = _1139 * _1125;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1163;
    float _1167 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1129);
    float _1169 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1131);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1171;
    float _1175 = fma(_1165, _1145, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1177 = _1149 * _1141;
    float _1179 = fma(_1153, _1145, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1181 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1183 = isnan(_1069);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1189 = _1185 || _1187;
    float _1191 = float(_1189);
    float _1193 = fma(_1173, _1145, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1195 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1135);
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1205;
    float _1209 = _1157 * _1159;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1215 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1217 = isnan(_1069);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    float _1227 = -_1191;
    float _1229 = _1227 + 1.0;
    bool _1231 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1233 = isnan(_1069);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1251 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1253 = isnan(_1069);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = fma(_1199, _1161, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1265 = fma(_1203, _1161, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1267 = fma(_1207, _1161, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1269 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1271 = isnan(_1069);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1241 * _1229;
    float _1283 = -_1225;
    float _1285 = _1283 + 1.0;
    float _1287 = fma(_1245, _1143, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1289 = fma(_1249, _1143, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1291 = fma(_1213, _1143, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1293 = -_1241;
    float _1295 = _1293 + 1.0;
    bool _1297 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1299 = isnan(_1069);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = -_1261;
    float _1311 = _1309 + 1.0;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1319 = _1317 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1321 = _1279 * _1285;
    float _1323 = _1261 * _1295;
    float _1325 = -_1279;
    float _1327 = _1325 + 1.0;
    float _1329 = _1225 * _1311;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1335 = fma(_1315, _1177, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1337 = _1307 * _1327;
    float _1339 = fma(_1333, _1177, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1341 = fma(_1319, _1177, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1343 = _1193 * _1337;
    float _1345 = -_1307;
    float _1347 = _1345 + 1.0;
    float _1349 = _1175 * _1337;
    float _1351 = _1179 * _1337;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1361;
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1343);
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1349);
    float _1369 = fma(_1355, _1209, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1371 = fma(_1359, _1209, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1373 = fma(_1363, _1209, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1375 = fma(_1289, _1321, _1365);
    float _1377 = _1169 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1379 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1351);
    float _1381 = fma(_1287, _1321, _1367);
    float _1383 = fma(_1265, _1329, _1375);
    float _1385 = _1167 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1389 = _1377 + _1387;
    float _1391 = fma(_1291, _1321, _1379);
    float _1393 = fma(_1263, _1329, _1381);
    float _1395 = _1195 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1385 + _1397;
    float _1401 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1403 = fma(_1267, _1329, _1391);
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1407 = _1395 + _1405;
    float _1409 = fma(_1335, _1323, _1393);
    float _1411 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1401);
    float _1413 = -_239;
    int _1415 = _1101 ? as_type<int>(_1413) : as_type<int>(_239);
    float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1419 = fma(_1339, _1323, _1383);
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1411);
    float _1423 = -_163;
    int _1425 = _1133 ? as_type<int>(_1423) : as_type<int>(_163);
    float _1427 = fma(_1341, _1323, _1403);
    float _1429 = _1389 * _1389;
    bool _1431 = !_1109;
    float _1433 = _1431 ? _239 : as_type<float>(_1415);
    float _1435 = fma(_1369, _1281, _1409);
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1439 = !_1113;
    float _1441 = _1439 ? _163 : as_type<float>(_1425);
    float _1443 = fma(_1371, _1281, _1419);
    bool _1445 = _1421 >= 0.0;
    float _1447 = fma(_1373, _1281, _1427);
    float _1449 = fma(_1399, _1399, _1429);
    float _1451 = _1433 + 0.5;
    float _1453 = -_1441;
    float _1455 = _1453 + 0.5;
    float _1457 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1435);
    float _1459 = fma(_1407, _1407, _1449);
    float _1461 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1463 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1465 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1443);
    float _1467 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1447);
    float _1469 = rsqrt(_1459);
    float _1471 = _1461 * _1417;
    float _1473 = _1463 * _1437;
    float _1475 = _1461;
    float _1477 = _1395;
    if (_1445)
    {
        _1475 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1479 = _1475;
    float _1481 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1483 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1485 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1487 = as_type<int>(_1479);
    if (_1445)
    {
        float _1489 = _1479 * 5.0;
        _1487 = as_type<int>(_1489);
    }
    int _1491 = _1487;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1471;
    out.m_58.y = _1473;
    if (_1445)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4455 = as_type<float>(_1491);
        out.gl_Position.z = _4455;
    }
    float _1499 = _1389 * _1469;
    float _1501 = _1399 * _1469;
    out.m_60.x = _1493;
    out.m_60.y = _1495;
    out.m_60.z = _1497;
    if (_1445)
    {
        out.m_45.x = 0.0;
    }
    if (_1445)
    {
        return out;
    }
    float _1503 = -_1499;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1377);
    float _1507 = _1407 * _1469;
    float _1509 = -_1501;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1385);
    float _1513 = -_1499;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1389);
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1519 = _1505 + _1517;
    float _1521 = -_1507;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1395);
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1527 = _1511 + _1525;
    float _1529 = -_1501;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1399);
    float _1533 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1537 = _1523 + _1535;
    float _1539 = -_1507;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1407);
    float _1543 = _243 * _691;
    float _1545 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1533);
    float _1547 = _1515 * _1515;
    float _1549 = _243 * _617;
    float _1551 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1545);
    float _1553 = fma(_1531, _1531, _1547);
    bool _1555 = _1551 >= 0.0;
    float _1557 = fma(_1541, _1541, _1553);
    float _1559 = sqrt(_1557);
    float _1561 = _1551;
    if (_1555)
    {
        _1561 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1563 = _1561;
    int _1565 = as_type<int>(_1563);
    if (_1555)
    {
        out.m_45.x = 0.0;
    }
    if (_1555)
    {
        float _1567 = _1563 * 5.0;
        _1565 = as_type<int>(_1567);
    }
    int _1569 = _1565;
    if (_1555)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4602 = as_type<float>(_1569);
        out.gl_Position.z = _4602;
    }
    float _1571 = _1469 * _1559;
    if (_1555)
    {
        return out;
    }
    float _1573 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _163);
    float _1577 = _1543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _1581 = _1571 * _1573;
    float _1583 = _1571 * _1577;
    float _1585 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1587 = _1585 * 0.5;
    float _1589 = _1575 * _1581;
    float _1591 = _1579 * _1583;
    float _1593 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1595 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1597 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1599 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1593);
    float _1601 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1595);
    float _1603 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1597);
    float _1605 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1599);
    float _1607 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1601);
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1603);
    float _1611 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1613 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1615 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1617 = _1395 + _1611;
    float _1619 = _1385 + _1613;
    float _1621 = _1377 + _1615;
    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1625 = _1617 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1629 = _1619 + _1627;
    float _1631 = _1625 * _1625;
    float _1633 = fma(_1629, _1629, _1631);
    float _1635 = sqrt(_1633);
    bool _1637 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1639 = _1631;
    float _1641 = _1615;
    float _1643 = _1609;
    float _1645 = _1617;
    float _1647 = _1633;
    if (!_1637)
    {
        _1639 = _1619;
    }
    float _1649 = _1639;
    float _1651 = _1649;
    if (!_1637)
    {
        _1641 = _1617;
    }
    float _1653 = _1641;
    float _1655 = _1653;
    if (!_1637)
    {
        _1643 = _1621;
    }
    float _1657 = _1643;
    bool _1659 = !_1637;
    float _1661 = _1657;
    if (!_1659)
    {
        float _1663 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1667 = _1635 + _1665;
        float _1669 = rsqrt(_1633);
        float _1671 = _1667 * _1663;
        float _1673 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1675 = _1671 * 0.15915493667125701904296875;
        float _1677 = _1675 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = _1675 * 6.283185482025146484375;
        float _1683 = sin(_1681);
        float _1685 = _1679 + (-1.0);
        float _1687 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1689 = fma(_1683, _1673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1691 = fma(_1621, _1679, _1687);
        float _1693 = _1669 * _1689;
        float _1695 = fma(_1629, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1697 = fma(_1625, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1661 = _1691;
        _1651 = _1695;
        _1655 = _1697;
        _1645 = _1675;
        _1647 = _1669;
    }
    float _1699 = _1661;
    float _1701 = _1651;
    float _1703 = _1655;
    float _1705 = _1645;
    float _1707 = _1647;
    float _1709 = -_1499;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1699);
    float _1713 = -_1501;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1701);
    float _1717 = -_1507;
    float _1719 = fma(_1717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1703);
    float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1723 = _1711 + _1721;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1727 = _1715 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1731 = _1719 + _1729;
    float _1733 = _1723 * _1723;
    float _1735 = fma(_1727, _1727, _1733);
    float _1737 = fma(_1731, _1731, _1735);
    float _1739 = rsqrt(_1737);
    float _1741 = sqrt(_1737);
    float _1743 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1745 = _1727 * _1743;
    float _1747 = _1731 * _1743;
    float _1749 = _1745 * _1745;
    float _1751 = _1747 * _1747;
    float _1753 = _1749 + _1751;
    float _1755 = sqrt(_1753);
    bool _1757 = _1755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1761 = _1755 + _1759;
    float _1763 = _1739;
    float _1765 = _1707;
    float _1767 = _1761;
    float _1769 = _1705;
    float _1771 = _1723;
    float _1773 = _1745;
    if (_1757)
    {
        float _1775 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1763 = _1775;
    }
    float _1777 = _1763;
    if (_1757)
    {
        float _1779 = rsqrt(_1753);
        _1765 = _1779;
    }
    float _1781 = _1765;
    float _1783 = _1781;
    if (_1757)
    {
        float _1785 = _1761 * _1777;
        _1767 = _1785;
    }
    float _1787 = _1767;
    if (_1757)
    {
        float _1789 = _1787 * 0.15915493667125701904296875;
        _1769 = _1789;
    }
    float _1791 = _1769;
    float _1793 = _1731;
    if (_1757)
    {
        float _1795 = _1791 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        _1793 = _1797;
    }
    float _1799 = _1793;
    float _1801 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1803 = precise::max(0.0, _1801);
    float _1805 = _1777;
    float _1807 = _1803;
    if (_1757)
    {
        float _1809 = _1791 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        _1805 = _1811;
    }
    float _1813 = _1805;
    float _1815 = -_1743;
    float _1817 = -_1803;
    float _1819 = fma(_1723, _1815, _1817);
    if (_1757)
    {
        float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1771 = _1821;
    }
    float _1823 = _1771;
    float _1825 = _1823;
    float _1827 = _1799;
    if (_1757)
    {
        float _1829 = fma(_1799, _1823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1825 = _1829;
    }
    float _1831 = _1825;
    float _1833 = _1831;
    if (!_1757)
    {
        _1827 = _1819;
    }
    float _1835 = _1827;
    float _1837 = _1835;
    float _1839 = _1813;
    if (_1757)
    {
        float _1841 = _1813 + (-1.0);
        _1807 = _1841;
    }
    float _1843 = _1807;
    float _1845 = _1843;
    if (_1757)
    {
        float _1847 = _1781 * _1831;
        _1477 = _1847;
    }
    float _1849 = _1477;
    if (!_1757)
    {
        _1833 = _1749;
    }
    float _1851 = _1833;
    float _1853 = _1851;
    if (_1757)
    {
        float _1855 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1783 = _1855;
    }
    float _1857 = _1783;
    if (_1757)
    {
        float _1859 = _1745 * _1849;
        _1773 = _1859;
    }
    float _1861 = _1773;
    if (!_1757)
    {
        _1845 = _1747;
    }
    float _1863 = _1845;
    float _1865 = _1863;
    if (_1757)
    {
        float _1867 = _1747 * _1849;
        _1865 = _1867;
    }
    float _1869 = _1865;
    if (_1757)
    {
        float _1871 = fma(_1819, _1813, _1857);
        _1837 = _1871;
    }
    float _1873 = _1837;
    if (_1757)
    {
        float _1875 = _1861 * _1861;
        _1853 = _1875;
    }
    float _1877 = _1853;
    if (!_1757)
    {
        _1839 = _1751;
    }
    float _1879 = _1839;
    float _1881 = _1879;
    if (_1757)
    {
        float _1883 = _1869 * _1869;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = fma(_1873, _1873, _1877);
    float _1889 = _1887 + _1885;
    float _1891 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1895 = fma(_1741, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1893);
    float _1897 = precise::clamp(_1895, 0.0, 1.0);
    float _1899 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1901 = rsqrt(_1889);
    float _1903 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1891);
    float _1905 = -_1897;
    float _1907 = _1905 + 1.0;
    float _1909 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1899);
    float _1911 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1913 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1903);
    float _1915 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1917 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1909);
    float _1919 = abs(_1907);
    float _1921 = log2(_1919);
    float _1923 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1925 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1915);
    float _1927 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1929 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1931 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1925);
    float _1933 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1935 = _1901 * _1861;
    float _1937 = -_1929;
    float _1939 = fma(_1937, _1911, 1.0);
    float _1941 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1927);
    float _1943 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1947 = _1901 * _1873;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1951 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1941);
    float _1953 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1945);
    float _1955 = _1901 * _1869;
    float _1957 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1959 = -_1949;
    float _1961 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1959);
    float _1963 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1965 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1953);
    float _1967 = log2(_1939);
    float _1969 = -_1955;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1961);
    float _1973 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1975 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1965);
    float _1977 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1979 = fma(_1971, -0.5, 0.5);
    float _1981 = fma(_1971, 0.5, 0.5);
    float _1983 = exp2(_1957);
    float _1985 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1973);
    float _1987 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1977);
    float _1989 = _1947 + 1.0;
    float _1991 = fma(_1981, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1993 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1985);
    float _1995 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1987);
    float _1997 = 1.0 / _1975;
    float _1999 = fma(_1981, _1991, -0.212114393711090087890625);
    float _2001 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1995);
    float _2003 = _1967 * 0.693147182464599609375;
    float _2005 = fma(_1981, _1999, 1.570728778839111328125);
    float _2007 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2009 = sqrt(_1979);
    float _2011 = -_1947;
    float _2013 = fma(_1983, _1989, _2011);
    float _2015 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1993);
    float _2017 = fma(_2013, 0.5, 0.5);
    float _2019 = _2015 * _1997;
    float _2021 = _2001 * _1997;
    float _2023 = fma(_2019, 0.5, 0.5);
    float _2025 = fma(_2021, -0.5, 0.5);
    float _2027 = _2009 * 0.636619746685028076171875;
    float3 _5367 = float3(_2023, _2025, _2007);
    float _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5367, float3(0.0), isnan(_5367)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5367, float3(0.0), isnan(_5367)), level(0.0)).x;
    float3 _5378 = float3(_2023, _2025, _2007);
    float4 _2032 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5378, float3(0.0), isnan(_5378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5378, float3(0.0), isnan(_5378)), level(0.0)).xyzw;
    float _2034 = _2032.x;
    float _2036 = _2032.y;
    float _2038 = _2032.z;
    float _2040 = _2032.w;
    float _2042 = -_2005;
    float _2044 = fma(_2027, _2042, 1.0);
    float2 _5400 = float2(_2044, _2017);
    float3 _2048 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5400, float2(0.0), isnan(_5400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5400, float2(0.0), isnan(_5400)), level(0.0)).xyz;
    float _2050 = _2048.x;
    float _2052 = _2048.y;
    float _2054 = _2048.z;
    float _2056 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2058 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2060 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2058);
    float _2062 = exp2(_2056);
    float _2064 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2060);
    float _2066 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2064);
    float _2068 = _2066 + _1975;
    out.gl_Position.x = _2015;
    out.gl_Position.y = _2001;
    out.gl_Position.z = _2066;
    out.gl_Position.w = _1975;
    float _2070 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2072 = _2068 * 0.5;
    float _2074 = -_2062;
    float _2076 = _2074 + 1.0;
    out.m_45.x = _2070;
    float _2078 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2072;
    out.m_62.w = _1975;
    float _2080 = _2078 * _2029;
    float _2082 = -_2078;
    float _2084 = _2082 + 1.0;
    float _2086 = _2040 * _2080;
    float _2088 = _2054 * _2080;
    float _2090 = fma(_2050, _2086, _2034);
    float _2092 = fma(_2052, _2086, _2036);
    float _2094 = _2040 * _2084;
    float _2096 = fma(_2040, _2088, _2038);
    out.m_64.x = _2090;
    out.m_64.y = _2092;
    out.m_64.z = _2096;
    out.m_64.w = _2094;
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
    bool _1061 = false;
    bool _883 = false;
    bool _547 = false;
    bool _263 = false;
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
        float _2153 = as_type<float>(_99);
        out.gl_Position.z = _2153;
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
        float _2221 = as_type<float>(_135);
        out.gl_Position.z = _2221;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _141 * _139;
    float _147 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    int _149 = as_type<int>(_143) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_143) & 2;
    bool _155 = _153 != 0;
    float _157 = _147 * 6.283185482025146484375;
    float _159 = floor(_147);
    bool _161 = !_155;
    float _163 = _161 ? (-0.5) : 0.5;
    float _165 = _157 * 0.15915493667125701904296875;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _165 * 6.283185482025146484375;
    float _177 = cos(_175);
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    bool _187 = !_181;
    int _189 = _187 ? 0 : 1;
    float _191 = -_159;
    float _193 = _147 + _191;
    int _195 = abs(_185);
    int _197 = abs(_189);
    float _199 = -_193;
    float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _203 = !_173;
    int _205 = _203 ? 0 : 1;
    float _207 = float(_195);
    float _209 = fma(_177, 0.5, 0.5);
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _213 = abs(_205);
    float _215 = abs(_201);
    float _217 = _207 * _215;
    bool _219 = _193 < 0.5;
    float _221 = float(_219);
    float _223 = -_209;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_197);
    float _229 = -_221;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = fma(_227, _225, _217);
    float _235 = float(_213);
    bool _237 = !_151;
    float _239 = _237 ? (-0.5) : 0.5;
    float _241 = abs(_231);
    float _243 = fma(_235, _241, _233);
    bool _245 = !_211;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _293;
    float _297 = 1.0 / _279;
    float _299 = 1.0 / _283;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _271 + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _307 = 1.0 / _291;
    float _309 = _303 * _297;
    bool _311 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _313 = isnan(_271);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    bool _323 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _325 = isnan(_271);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _295;
    float _337 = _275 * _299;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _271 + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _271 + _343;
    float _347 = 1.0 / _287;
    float _349 = _341 * _307;
    bool _351 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_271);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _363;
    float _367 = fma(_365, _309, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _371 = _271 + _369;
    float _373 = _371 * _335;
    bool _375 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _377 = isnan(_271);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = -_321;
    float _389 = _387 + 1.0;
    float _391 = _345 * _347;
    float _393 = -_333;
    float _395 = _393 + 1.0;
    float _397 = -_385;
    float _399 = _397 + 1.0;
    float _401 = _361 * _389;
    float _403 = -_361;
    float _405 = _403 + 1.0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _411 = _321 * _399;
    bool _413 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _415 = isnan(_271);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = _385 * _395;
    bool _427 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _429 = isnan(_271);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _439;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _447 = _423 * _405;
    float _449 = -_423;
    float _451 = _449 + 1.0;
    float _453 = fma(_441, _309, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _455 = -_437;
    float _457 = _455 + 1.0;
    float _459 = fma(_445, _337, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _461 = _437 * _451;
    float _463 = fma(_409, _337, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _469;
    float _473 = _453 * _461;
    float _475 = _367 * _461;
    float _477 = fma(_467, _391, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_471, _391, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _483 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _489 = fma(_459, _447, _481);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = fma(_463, _447, _483);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _497;
    float _501 = fma(_487, _349, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _503 = fma(_493, _349, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _505;
    float _509 = fma(_477, _401, _489);
    float _511 = fma(_479, _401, _495);
    float _513 = fma(_499, _373, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _515 = fma(_507, _373, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _517 = fma(_501, _411, _509);
    float _519 = fma(_503, _411, _511);
    float _521 = fma(_513, _425, _517);
    float _523 = fma(_515, _425, _519);
    float _525 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[148].x, _521);
    float _527 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[148].y, _523);
    bool _529 = !_305;
    float _545;
    if (!_529)
    {
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _533 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _537 = _535 * _531;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _543;
        _547 = true;
    }
    else
    {
        float _549 = float(_83);
        float _551 = 1.0 / _549;
        float _553 = _117 * _551;
        _545 = _553;
    }
    _547 = false;
    float _555 = _545;
    float _557 = in.m_54.x;
    float _559 = in.m_54.y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _563 = _555 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _573;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _581 = 1.0 / _567;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _583;
    float _587 = 1.0 / _571;
    bool _589 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _591 = isnan(_555);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _601;
    bool _605 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _607 = isnan(_555);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = _527 * _559;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _621 = _555 + _619;
    float _623 = 1.0 / _575;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _627 = _555 + _625;
    float _629 = _563 * _581;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _633 = _555 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _635;
    float _639 = -_599;
    float _641 = _639 + 1.0;
    float _643 = fma(_603, _629, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _645 = 1.0 / _579;
    float _647 = _621 * _587;
    bool _649 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _651 = isnan(_555);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _663 = _555 + _661;
    float _665 = fma(_637, _629, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _667 = _615 * _641;
    float _669 = -_615;
    float _671 = _669 + 1.0;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = 1.0 / _585;
    float _677 = _627 * _623;
    bool _679 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _681 = isnan(_555);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _525 * _557;
    float _693 = -_689;
    float _695 = _693 + 1.0;
    float _697 = _633 * _645;
    float _699 = -_659;
    float _701 = _699 + 1.0;
    bool _703 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _705 = isnan(_555);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = _689 * _701;
    float _717 = _713 * _695;
    float _719 = _663 * _675;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _721;
    float _725 = -_713;
    float _727 = _725 + 1.0;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _733 = fma(_723, _629, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _735 = _555 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _737 = isnan(_555);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = _599 * _727;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _757 = fma(_731, _647, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _759 = _745 * _671;
    float _761 = fma(_751, _647, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _763 = fma(_755, _647, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _765 = _733 * _759;
    float _767 = -_745;
    float _769 = _767 + 1.0;
    float _771 = _643 * _759;
    float _773 = _665 * _759;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _779;
    float _783 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[107].x, _765);
    float _785 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[107].y, _771);
    float _787 = fma(_777, _677, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _789 = fma(_781, _677, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _795;
    float _799 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[107].z, _773);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _805 = fma(_761, _667, _783);
    float _807 = fma(_793, _697, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _809 = fma(_797, _677, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _811 = fma(_803, _697, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _813 = fma(_763, _667, _785);
    float _815 = fma(_757, _667, _799);
    float _817 = fma(_787, _747, _805);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _823 = fma(_789, _747, _813);
    float _825 = fma(_809, _747, _815);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _827;
    float _831 = fma(_821, _697, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _837;
    float _841 = fma(_807, _717, _817);
    float _843 = fma(_829, _719, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _845 = fma(_835, _719, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _847 = fma(_839, _719, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _849 = fma(_811, _717, _823);
    float _851 = fma(_831, _717, _825);
    float _853 = fma(_843, _715, _841);
    float _855 = fma(_845, _715, _849);
    float _857 = fma(_847, _715, _851);
    float _859 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[112].x, _853);
    float _861 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[112].y, _855);
    float _863 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[112].z, _857);
    bool _865 = !_673;
    float _881;
    if (!_865)
    {
        float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _869 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _873 = _871 * _867;
        float _875 = floor(_873);
        float _877 = -_875;
        float _879 = _873 + _877;
        _881 = _879;
        _883 = true;
    }
    else
    {
        float _885 = float(_83);
        float _887 = 1.0 / _885;
        float _889 = _117 * _887;
        _881 = _889;
    }
    _883 = false;
    float _891 = _881;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _895 = _891 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _901 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _903 = isnan(_891);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _921 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _923 = isnan(_891);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _929 = _925 || _927;
    float _931 = float(_929);
    float _933 = 1.0 / _899;
    float _935 = -_911;
    float _937 = _935 + 1.0;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _939;
    bool _943 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _945 = isnan(_891);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = _931 * _937;
    float _957 = -_931;
    float _959 = _957 + 1.0;
    bool _961 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _963 = 1.0 / _915;
    float _965 = _953 * _959;
    float _967 = -_953;
    float _969 = _967 + 1.0;
    float _971 = 1.0 / _919;
    float _973 = _941 * _933;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _979 = fma(_973, _895, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _981 = _977 * _963;
    bool _983 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _985 = isnan(_891);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _995;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1001 = _891 + _999;
    float _1003 = _979 * _965;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1007 = _891 + _1005;
    float _1009 = -_993;
    float _1011 = _1009 + 1.0;
    float _1013 = fma(_981, _1001, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1015 = _997 * _971;
    float _1017 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1003);
    float _1019 = _911 * _1011;
    float _1021 = _859 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1023 = fma(_1015, _1007, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1025 = fma(_1013, _955, _1017);
    float _1027 = _863 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = fma(_1023, _1019, _1025);
    float _1033 = _861 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1031);
    float _1039 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _1029;
    out.m_56.y = _1039;
    out.m_56.z = _1035;
    out.m_56.w = _1041;
    bool _1043 = !_961;
    float _1059;
    if (!_1043)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1047 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _1051 = _1049 * _1045;
        float _1053 = floor(_1051);
        float _1055 = -_1053;
        float _1057 = _1051 + _1055;
        _1059 = _1057;
        _1061 = true;
    }
    else
    {
        float _1063 = float(_83);
        float _1065 = 1.0 / _1063;
        float _1067 = _117 * _1065;
        _1059 = _1067;
    }
    _1061 = false;
    float _1069 = _1059;
    float _1071 = in.m_42.x;
    float _1073 = in.m_42.y;
    float _1075 = in.m_42.z;
    float _1077 = in.m_49.y;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1087;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1095 = 1.0 / _1081;
    float _1097 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1097;
    bool _1101 = _137 > 0.5;
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1105 = _1069 + _1103;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1113 = _1111 != 0;
    float _1115 = 1.0 / _1085;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1119 = _1069 + _1117;
    float _1121 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1123 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1125 = 1.0 / _1089;
    float _1127 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1129 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1121);
    float _1131 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1123);
    bool _1133 = _1077 > 0.5;
    float _1135 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1127);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1139 = _1069 + _1137;
    float _1141 = 1.0 / _1093;
    float _1143 = _1119 * _1115;
    float _1145 = _1105 * _1095;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1149 = _1069 + _1147;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1151;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1157 = _1069 + _1155;
    float _1159 = 1.0 / _1099;
    float _1161 = _1139 * _1125;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1163;
    float _1167 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1129);
    float _1169 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1131);
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1171;
    float _1175 = fma(_1165, _1145, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1177 = _1149 * _1141;
    float _1179 = fma(_1153, _1145, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1181 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1183 = isnan(_1069);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1189 = _1185 || _1187;
    float _1191 = float(_1189);
    float _1193 = fma(_1173, _1145, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1195 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1135);
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1205;
    float _1209 = _1157 * _1159;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1215 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1217 = isnan(_1069);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    float _1227 = -_1191;
    float _1229 = _1227 + 1.0;
    bool _1231 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1233 = isnan(_1069);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1239 = _1235 || _1237;
    float _1241 = float(_1239);
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1251 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1253 = isnan(_1069);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = fma(_1199, _1161, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1265 = fma(_1203, _1161, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1267 = fma(_1207, _1161, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1269 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1271 = isnan(_1069);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1241 * _1229;
    float _1283 = -_1225;
    float _1285 = _1283 + 1.0;
    float _1287 = fma(_1245, _1143, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1289 = fma(_1249, _1143, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1291 = fma(_1213, _1143, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1293 = -_1241;
    float _1295 = _1293 + 1.0;
    bool _1297 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1299 = isnan(_1069);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = -_1261;
    float _1311 = _1309 + 1.0;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1319 = _1317 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1321 = _1279 * _1285;
    float _1323 = _1261 * _1295;
    float _1325 = -_1279;
    float _1327 = _1325 + 1.0;
    float _1329 = _1225 * _1311;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1335 = fma(_1315, _1177, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1337 = _1307 * _1327;
    float _1339 = fma(_1333, _1177, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1341 = fma(_1319, _1177, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1343 = _1193 * _1337;
    float _1345 = -_1307;
    float _1347 = _1345 + 1.0;
    float _1349 = _1175 * _1337;
    float _1351 = _1179 * _1337;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1357;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1361;
    float _1365 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1343);
    float _1367 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1349);
    float _1369 = fma(_1355, _1209, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1371 = fma(_1359, _1209, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1373 = fma(_1363, _1209, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1375 = fma(_1289, _1321, _1365);
    float _1377 = _1169 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1379 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1351);
    float _1381 = fma(_1287, _1321, _1367);
    float _1383 = fma(_1265, _1329, _1375);
    float _1385 = _1167 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1389 = _1377 + _1387;
    float _1391 = fma(_1291, _1321, _1379);
    float _1393 = fma(_1263, _1329, _1381);
    float _1395 = _1195 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1385 + _1397;
    float _1401 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1403 = fma(_1267, _1329, _1391);
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1407 = _1395 + _1405;
    float _1409 = fma(_1335, _1323, _1393);
    float _1411 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1401);
    float _1413 = -_239;
    int _1415 = _1101 ? as_type<int>(_1413) : as_type<int>(_239);
    float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1419 = fma(_1339, _1323, _1383);
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1411);
    float _1423 = -_163;
    int _1425 = _1133 ? as_type<int>(_1423) : as_type<int>(_163);
    float _1427 = fma(_1341, _1323, _1403);
    float _1429 = _1389 * _1389;
    bool _1431 = !_1109;
    float _1433 = _1431 ? _239 : as_type<float>(_1415);
    float _1435 = fma(_1369, _1281, _1409);
    float _1437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1439 = !_1113;
    float _1441 = _1439 ? _163 : as_type<float>(_1425);
    float _1443 = fma(_1371, _1281, _1419);
    bool _1445 = _1421 >= 0.0;
    float _1447 = fma(_1373, _1281, _1427);
    float _1449 = fma(_1399, _1399, _1429);
    float _1451 = _1433 + 0.5;
    float _1453 = -_1441;
    float _1455 = _1453 + 0.5;
    float _1457 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1435);
    float _1459 = fma(_1407, _1407, _1449);
    float _1461 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1463 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1465 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1443);
    float _1467 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1447);
    float _1469 = rsqrt(_1459);
    float _1471 = _1461 * _1417;
    float _1473 = _1463 * _1437;
    float _1475 = _1461;
    float _1477 = _1395;
    if (_1445)
    {
        _1475 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1479 = _1475;
    float _1481 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1483 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1485 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1487 = as_type<int>(_1479);
    if (_1445)
    {
        float _1489 = _1479 * 5.0;
        _1487 = as_type<int>(_1489);
    }
    int _1491 = _1487;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _1471;
    out.m_58.y = _1473;
    if (_1445)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4455 = as_type<float>(_1491);
        out.gl_Position.z = _4455;
    }
    float _1499 = _1389 * _1469;
    float _1501 = _1399 * _1469;
    out.m_60.x = _1493;
    out.m_60.y = _1495;
    out.m_60.z = _1497;
    if (_1445)
    {
        out.m_45.x = 0.0;
    }
    if (_1445)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1503 = -_1499;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1377);
    float _1507 = _1407 * _1469;
    float _1509 = -_1501;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1385);
    float _1513 = -_1499;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1389);
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1519 = _1505 + _1517;
    float _1521 = -_1507;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1395);
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1527 = _1511 + _1525;
    float _1529 = -_1501;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1399);
    float _1533 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1537 = _1523 + _1535;
    float _1539 = -_1507;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1407);
    float _1543 = _243 * _691;
    float _1545 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1533);
    float _1547 = _1515 * _1515;
    float _1549 = _243 * _617;
    float _1551 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1545);
    float _1553 = fma(_1531, _1531, _1547);
    bool _1555 = _1551 >= 0.0;
    float _1557 = fma(_1541, _1541, _1553);
    float _1559 = sqrt(_1557);
    float _1561 = _1551;
    if (_1555)
    {
        _1561 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1563 = _1561;
    int _1565 = as_type<int>(_1563);
    if (_1555)
    {
        out.m_45.x = 0.0;
    }
    if (_1555)
    {
        float _1567 = _1563 * 5.0;
        _1565 = as_type<int>(_1567);
    }
    int _1569 = _1565;
    if (_1555)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4602 = as_type<float>(_1569);
        out.gl_Position.z = _4602;
    }
    float _1571 = _1469 * _1559;
    if (_1555)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1573 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _163);
    float _1577 = _1543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _1581 = _1571 * _1573;
    float _1583 = _1571 * _1577;
    float _1585 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1587 = _1585 * 0.5;
    float _1589 = _1575 * _1581;
    float _1591 = _1579 * _1583;
    float _1593 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1595 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1597 = _1589 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1599 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1593);
    float _1601 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1595);
    float _1603 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1597);
    float _1605 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1599);
    float _1607 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1601);
    float _1609 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1603);
    float _1611 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1613 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1615 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1617 = _1395 + _1611;
    float _1619 = _1385 + _1613;
    float _1621 = _1377 + _1615;
    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1625 = _1617 + _1623;
    float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1629 = _1619 + _1627;
    float _1631 = _1625 * _1625;
    float _1633 = fma(_1629, _1629, _1631);
    float _1635 = sqrt(_1633);
    bool _1637 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1639 = _1631;
    float _1641 = _1615;
    float _1643 = _1609;
    float _1645 = _1617;
    float _1647 = _1633;
    if (!_1637)
    {
        _1639 = _1619;
    }
    float _1649 = _1639;
    float _1651 = _1649;
    if (!_1637)
    {
        _1641 = _1617;
    }
    float _1653 = _1641;
    float _1655 = _1653;
    if (!_1637)
    {
        _1643 = _1621;
    }
    float _1657 = _1643;
    bool _1659 = !_1637;
    float _1661 = _1657;
    if (!_1659)
    {
        float _1663 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1667 = _1635 + _1665;
        float _1669 = rsqrt(_1633);
        float _1671 = _1667 * _1663;
        float _1673 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1675 = _1671 * 0.15915493667125701904296875;
        float _1677 = _1675 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = _1675 * 6.283185482025146484375;
        float _1683 = sin(_1681);
        float _1685 = _1679 + (-1.0);
        float _1687 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1689 = fma(_1683, _1673, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1691 = fma(_1621, _1679, _1687);
        float _1693 = _1669 * _1689;
        float _1695 = fma(_1629, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1697 = fma(_1625, _1693, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1661 = _1691;
        _1651 = _1695;
        _1655 = _1697;
        _1645 = _1675;
        _1647 = _1669;
    }
    float _1699 = _1661;
    float _1701 = _1651;
    float _1703 = _1655;
    float _1705 = _1645;
    float _1707 = _1647;
    float _1709 = -_1499;
    float _1711 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1699);
    float _1713 = -_1501;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1701);
    float _1717 = -_1507;
    float _1719 = fma(_1717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1703);
    float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1723 = _1711 + _1721;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1727 = _1715 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1731 = _1719 + _1729;
    float _1733 = _1723 * _1723;
    float _1735 = fma(_1727, _1727, _1733);
    float _1737 = fma(_1731, _1731, _1735);
    float _1739 = rsqrt(_1737);
    float _1741 = sqrt(_1737);
    float _1743 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1745 = _1727 * _1743;
    float _1747 = _1731 * _1743;
    float _1749 = _1745 * _1745;
    float _1751 = _1747 * _1747;
    float _1753 = _1749 + _1751;
    float _1755 = sqrt(_1753);
    bool _1757 = _1755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1761 = _1755 + _1759;
    float _1763 = _1739;
    float _1765 = _1707;
    float _1767 = _1761;
    float _1769 = _1705;
    float _1771 = _1723;
    float _1773 = _1745;
    if (_1757)
    {
        float _1775 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1763 = _1775;
    }
    float _1777 = _1763;
    if (_1757)
    {
        float _1779 = rsqrt(_1753);
        _1765 = _1779;
    }
    float _1781 = _1765;
    float _1783 = _1781;
    if (_1757)
    {
        float _1785 = _1761 * _1777;
        _1767 = _1785;
    }
    float _1787 = _1767;
    if (_1757)
    {
        float _1789 = _1787 * 0.15915493667125701904296875;
        _1769 = _1789;
    }
    float _1791 = _1769;
    float _1793 = _1731;
    if (_1757)
    {
        float _1795 = _1791 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        _1793 = _1797;
    }
    float _1799 = _1793;
    float _1801 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1803 = precise::max(0.0, _1801);
    float _1805 = _1777;
    float _1807 = _1803;
    if (_1757)
    {
        float _1809 = _1791 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        _1805 = _1811;
    }
    float _1813 = _1805;
    float _1815 = -_1743;
    float _1817 = -_1803;
    float _1819 = fma(_1723, _1815, _1817);
    if (_1757)
    {
        float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1771 = _1821;
    }
    float _1823 = _1771;
    float _1825 = _1823;
    float _1827 = _1799;
    if (_1757)
    {
        float _1829 = fma(_1799, _1823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1825 = _1829;
    }
    float _1831 = _1825;
    float _1833 = _1831;
    if (!_1757)
    {
        _1827 = _1819;
    }
    float _1835 = _1827;
    float _1837 = _1835;
    float _1839 = _1813;
    if (_1757)
    {
        float _1841 = _1813 + (-1.0);
        _1807 = _1841;
    }
    float _1843 = _1807;
    float _1845 = _1843;
    if (_1757)
    {
        float _1847 = _1781 * _1831;
        _1477 = _1847;
    }
    float _1849 = _1477;
    if (!_1757)
    {
        _1833 = _1749;
    }
    float _1851 = _1833;
    float _1853 = _1851;
    if (_1757)
    {
        float _1855 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1783 = _1855;
    }
    float _1857 = _1783;
    if (_1757)
    {
        float _1859 = _1745 * _1849;
        _1773 = _1859;
    }
    float _1861 = _1773;
    if (!_1757)
    {
        _1845 = _1747;
    }
    float _1863 = _1845;
    float _1865 = _1863;
    if (_1757)
    {
        float _1867 = _1747 * _1849;
        _1865 = _1867;
    }
    float _1869 = _1865;
    if (_1757)
    {
        float _1871 = fma(_1819, _1813, _1857);
        _1837 = _1871;
    }
    float _1873 = _1837;
    if (_1757)
    {
        float _1875 = _1861 * _1861;
        _1853 = _1875;
    }
    float _1877 = _1853;
    if (!_1757)
    {
        _1839 = _1751;
    }
    float _1879 = _1839;
    float _1881 = _1879;
    if (_1757)
    {
        float _1883 = _1869 * _1869;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = fma(_1873, _1873, _1877);
    float _1889 = _1887 + _1885;
    float _1891 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1895 = fma(_1741, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1893);
    float _1897 = precise::clamp(_1895, 0.0, 1.0);
    float _1899 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1901 = rsqrt(_1889);
    float _1903 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1891);
    float _1905 = -_1897;
    float _1907 = _1905 + 1.0;
    float _1909 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1899);
    float _1911 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1913 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1903);
    float _1915 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1917 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1909);
    float _1919 = abs(_1907);
    float _1921 = log2(_1919);
    float _1923 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1925 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1915);
    float _1927 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1929 = _1923 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1931 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1925);
    float _1933 = _1917 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1935 = _1901 * _1861;
    float _1937 = -_1929;
    float _1939 = fma(_1937, _1911, 1.0);
    float _1941 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1927);
    float _1943 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1945 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1947 = _1901 * _1873;
    float _1949 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1951 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1941);
    float _1953 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1945);
    float _1955 = _1901 * _1869;
    float _1957 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1959 = -_1949;
    float _1961 = fma(_1947, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1959);
    float _1963 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1965 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1953);
    float _1967 = log2(_1939);
    float _1969 = -_1955;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1961);
    float _1973 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1975 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1965);
    float _1977 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1979 = fma(_1971, -0.5, 0.5);
    float _1981 = fma(_1971, 0.5, 0.5);
    float _1983 = exp2(_1957);
    float _1985 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1973);
    float _1987 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1977);
    float _1989 = _1947 + 1.0;
    float _1991 = fma(_1981, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1993 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1985);
    float _1995 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1987);
    float _1997 = 1.0 / _1975;
    float _1999 = fma(_1981, _1991, -0.212114393711090087890625);
    float _2001 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1995);
    float _2003 = _1967 * 0.693147182464599609375;
    float _2005 = fma(_1981, _1999, 1.570728778839111328125);
    float _2007 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2009 = sqrt(_1979);
    float _2011 = -_1947;
    float _2013 = fma(_1983, _1989, _2011);
    float _2015 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1993);
    float _2017 = fma(_2013, 0.5, 0.5);
    float _2019 = _2015 * _1997;
    float _2021 = _2001 * _1997;
    float _2023 = fma(_2019, 0.5, 0.5);
    float _2025 = fma(_2021, -0.5, 0.5);
    float _2027 = _2009 * 0.636619746685028076171875;
    float3 _5367 = float3(_2023, _2025, _2007);
    float _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5367, float3(0.0), isnan(_5367)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5367, float3(0.0), isnan(_5367)), level(0.0)).x;
    float3 _5378 = float3(_2023, _2025, _2007);
    float4 _2032 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5378, float3(0.0), isnan(_5378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5378, float3(0.0), isnan(_5378)), level(0.0)).xyzw;
    float _2034 = _2032.x;
    float _2036 = _2032.y;
    float _2038 = _2032.z;
    float _2040 = _2032.w;
    float _2042 = -_2005;
    float _2044 = fma(_2027, _2042, 1.0);
    float2 _5400 = float2(_2044, _2017);
    float3 _2048 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5400, float2(0.0), isnan(_5400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5400, float2(0.0), isnan(_5400)), level(0.0)).xyz;
    float _2050 = _2048.x;
    float _2052 = _2048.y;
    float _2054 = _2048.z;
    float _2056 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2058 = _1933 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2060 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2058);
    float _2062 = exp2(_2056);
    float _2064 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2060);
    float _2066 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2064);
    float _2068 = _2066 + _1975;
    out.gl_Position.x = _2015;
    out.gl_Position.y = _2001;
    out.gl_Position.z = _2066;
    out.gl_Position.w = _1975;
    float _2070 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2072 = _2068 * 0.5;
    float _2074 = -_2062;
    float _2076 = _2074 + 1.0;
    out.m_45.x = _2070;
    float _2078 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2072;
    out.m_62.w = _1975;
    float _2080 = _2078 * _2029;
    float _2082 = -_2078;
    float _2084 = _2082 + 1.0;
    float _2086 = _2040 * _2080;
    float _2088 = _2054 * _2080;
    float _2090 = fma(_2050, _2086, _2034);
    float _2092 = fma(_2052, _2086, _2036);
    float _2094 = _2040 * _2084;
    float _2096 = fma(_2040, _2088, _2038);
    out.m_64.x = _2090;
    out.m_64.y = _2092;
    out.m_64.z = _2096;
    out.m_64.w = _2094;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

