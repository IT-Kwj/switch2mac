#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_73 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _88(thread const int& _5538, thread const int& _5539, constant _10& support_buffer)
{
    float _5542 = as_type<float>(support_buffer._m4);
    int _5544 = _5539 + as_type<int>(_5542);
    int _5546 = 1 + _5544;
    float _5548 = support_buffer._m5[_5546].x;
    float _5550 = abs(_5548);
    bool _5552 = _5550 == 1.0;
    if (_5552)
    {
        return _5538;
    }
    float _5554 = float(_5538);
    float _5556 = _5554 / _5550;
    int _5558 = int(_5556);
    return _5558;
}

static inline __attribute__((always_inline))
int _89(thread const int& _5588, thread const int& _5589, constant _10& support_buffer)
{
    float _5592 = as_type<float>(support_buffer._m4);
    int _5594 = _5589 + as_type<int>(_5592);
    int _5596 = 1 + _5594;
    float _5598 = support_buffer._m5[_5596].x;
    bool _5600 = _5598 == 1.0;
    if (_5600)
    {
        return _5588;
    }
    float _5602 = float(_5588);
    float _5604 = _5602 * _5598;
    int _5606 = int(_5604);
    return _5606;
}

static inline __attribute__((always_inline))
void _86(thread int& _5535, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _5535 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _835 = false;
    bool _675 = false;
    bool _541 = false;
    bool _381 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_101)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_111);
        out.gl_Position.z = _2222;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    float _115 = float(_97);
    float _117 = in.m_51.x;
    float _119 = -_113;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_113);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    out.m_53.x = _117;
    bool _133 = _121 >= _115;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = 1.0 / _115;
    float _141 = _113;
    if (_137)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    float _145 = _121 * _139;
    int _147 = 0;
    if (_137)
    {
        float _149 = _143 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    out.m_55.x = _145;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2297 = as_type<float>(_151);
        out.gl_Position.z = _2297;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    int _169 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _171 = _169 != 0;
    float _173 = _155 * _153;
    float _175 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _177 = _175 * 6.283185482025146484375;
    float _179 = floor(_175);
    float _181 = _177 * 0.15915493667125701904296875;
    float _183 = in.m_49.x;
    float _185 = in.m_49.y;
    float _187 = in.m_49.z;
    float _189 = _181 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = -_179;
    float _195 = _175 + _193;
    float _197 = _175;
    float _199 = _157;
    if (!_167)
    {
        float _201 = _157 * _157;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_167)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    float _213 = fma(_191, 0.5, 0.5);
    bool _215 = !_167;
    float _217 = _211;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_167;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _157 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _199 = _271;
    }
    float _273 = _199;
    float _275 = in.m_57.w;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _279 = _277 != 0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _283 = _281 != 0;
    float _285 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _287 = _195 < 0.5;
    float _289 = float(_287);
    float _291 = -_195;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = in.m_44.x;
    float _297 = in.m_44.y;
    float _299 = in.m_44.z;
    bool _301 = !_279;
    int _303 = _301 ? 0 : 1;
    float _305 = -_213;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = -_289;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _313 = !_171;
    int _315 = _313 ? 0 : 1;
    int _317 = abs(_303);
    float _319 = fma(_273, _183, _285);
    bool _321 = !_283;
    int _323 = _321 ? 0 : 1;
    float _325 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _329 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _331 = abs(_315);
    float _333 = fma(_273, _185, _325);
    int _335 = abs(_323);
    float _337 = fma(_273, _187, _329);
    float _339 = float(_317);
    float _341 = float(_331);
    float _343 = abs(_293);
    float _345 = _339 * _343;
    float _347 = float(_335);
    float _349 = fma(_341, _307, _345);
    float _351 = fma(_319, _275, _295);
    float _353 = fma(_333, _275, _297);
    float _355 = fma(_337, _275, _299);
    float _357 = abs(_311);
    float _359 = fma(_347, _357, _349);
    bool _361 = !_327;
    bool _363 = false;
    float _379;
    if (!_361)
    {
        float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _367 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _369 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _371 = _369 * _365;
        float _373 = floor(_371);
        float _375 = -_373;
        float _377 = _371 + _375;
        _379 = _377;
        _381 = true;
    }
    else
    {
        _379 = _145;
    }
    _381 = false;
    float _383 = _379;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _383 + _385;
    bool _389 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _391 = isnan(_383);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _403 = _383 + _401;
    bool _405 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _407 = isnan(_383);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _425 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _427 = isnan(_383);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -_399;
    float _439 = _437 + 1.0;
    float _441 = 1.0 / _423;
    float _443 = _435 * _439;
    float _445 = -_435;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _449;
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _455 = 1.0 / _419;
    float _457 = _415 * _447;
    float _459 = -_415;
    float _461 = _459 + 1.0;
    float _463 = _387 * _455;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _469;
    float _473 = fma(_451, _463, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _475 = fma(_467, _463, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _477 = fma(_471, _463, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = _403 * _441;
    float _481 = _473 * _457;
    float _483 = _475 * _457;
    float _485 = _477 * _457;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _499 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _501 = fma(_489, _479, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _503 = fma(_493, _479, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _505 = fma(_497, _479, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _507 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].y, _483);
    float _509 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _511 = fma(_501, _443, _499);
    float _513 = fma(_503, _443, _507);
    float _515 = fma(_505, _443, _509);
    float _517 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].x, _511);
    float _519 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].y, _513);
    float _521 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].z, _515);
    bool _523 = !_453;
    float _539;
    if (!_523)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _527 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _531 = _529 * _525;
        float _533 = floor(_531);
        float _535 = -_533;
        float _537 = _531 + _535;
        _539 = _537;
        _541 = true;
    }
    else
    {
        _539 = _145;
    }
    _541 = false;
    float _543 = _539;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _543 + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _553 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _555 = isnan(_543);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _569 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _571 = isnan(_543);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _581;
    bool _585 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _587 = isnan(_543);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _551;
    float _599 = -_563;
    float _601 = _599 + 1.0;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _605 = _579 * _601;
    float _607 = -_579;
    float _609 = _607 + 1.0;
    float _611 = 1.0 / _567;
    float _613 = _583 * _597;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _619 = fma(_613, _547, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _621 = -_595;
    float _623 = _621 + 1.0;
    float _625 = _619 * _605;
    float _627 = _617 * _611;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _543 + _629;
    float _633 = _563 * _623;
    float _635 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _625);
    float _637 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _639 = fma(_627, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _641 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _643 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _645 = fma(_639, _633, _635);
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[117].x, _645);
    float _653 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _647;
    out.m_59.y = _649;
    out.m_59.z = _653;
    out.m_59.w = _655;
    bool _657 = !_603;
    float _673;
    if (!_657)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _661 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        _673 = _145;
    }
    _675 = false;
    float _677 = _673;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _681 = _677 + _679;
    bool _683 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _685 = isnan(_677);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _697 = _677 + _695;
    bool _699 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _701 = isnan(_677);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _719 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _721 = isnan(_677);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -_693;
    float _733 = _731 + 1.0;
    float _735 = 1.0 / _717;
    float _737 = _729 * _733;
    float _739 = -_729;
    float _741 = _739 + 1.0;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _743;
    bool _747 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _749 = 1.0 / _713;
    float _751 = _709 * _741;
    float _753 = -_709;
    float _755 = _753 + 1.0;
    float _757 = _681 * _749;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _763;
    float _767 = fma(_745, _757, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _769 = fma(_761, _757, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _771 = fma(_765, _757, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _773 = _697 * _735;
    float _775 = _767 * _751;
    float _777 = _769 * _751;
    float _779 = _771 * _751;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _793 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[123].x, _775);
    float _795 = fma(_783, _773, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _797 = fma(_787, _773, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _799 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[123].y, _777);
    float _801 = fma(_791, _773, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _803 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[123].z, _779);
    float _805 = fma(_795, _737, _793);
    float _807 = fma(_797, _737, _799);
    float _809 = fma(_801, _737, _803);
    float _811 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[125].x, _805);
    float _813 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[125].y, _807);
    float _815 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[125].z, _809);
    bool _817 = !_747;
    float _833;
    if (!_817)
    {
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _821 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _825 = _823 * _819;
        float _827 = floor(_825);
        float _829 = -_827;
        float _831 = _825 + _829;
        _833 = _831;
        _835 = true;
    }
    else
    {
        _833 = _145;
    }
    _835 = false;
    float _837 = _833;
    int _839 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _841 = _839;
    int _843 = 0;
    int _845 = _88(_841, _843, (*spvDescriptorSet0.support_buffer));
    float _847 = in.m_61.z;
    float _849 = 0.0 + _145;
    float _851 = precise::clamp(_849, 0.0, 1.0);
    float _853 = trunc(_847);
    int _855 = int(_853);
    int _857 = _845 + (-1);
    float _859 = float(_857);
    float _861 = _851 * _859;
    float _863 = trunc(_861);
    int _865 = int(_863);
    int _867 = _865;
    int _869 = 0;
    int _871 = _89(_867, _869, (*spvDescriptorSet0.support_buffer));
    int _873 = _855;
    int _875 = 0;
    int _877 = _89(_873, _875, (*spvDescriptorSet0.support_buffer));
    float4 _880 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_871, _877)), 0).xyzw;
    float _882 = _880.x;
    float _884 = _880.y;
    float _886 = _880.z;
    float _888 = _880.w;
    float _890 = in.m_51.z;
    float _892 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _896 = _894 != 0;
    float _898 = in.m_61.y;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _904 = in.m_61.x;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _908 = _906 != 0;
    float _910 = 1.0 / _902;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _918 = _916 != 0;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _922 = _920 != 0;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _926 = 0.0;
    float _928 = _898;
    if (_896)
    {
        float _930 = in.m_51.z;
        _926 = _930;
    }
    float _932 = _926;
    float _934 = 1.0 / _914;
    float _936 = -_924;
    float _938 = fma(_892, 2.0, _936);
    bool _940 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _942 = isnan(_837);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _952;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _958 = _956 != 0;
    float _960 = in.m_51.y;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _968 = _954 * _910;
    bool _970 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _972 = isnan(_837);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    bool _982 = _890 > 0.5;
    bool _984 = _982 && _922;
    bool _986 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _988 = isnan(_837);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = -_980;
    float _1000 = _998 + 1.0;
    float _1002 = _964 * _934;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1006 = _837 + _1004;
    float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _1010 = 0;
    bool _1012 = _984;
    float _1014 = _904;
    if (_896)
    {
        float _1016 = -_904;
        float _1018 = _1016 + 1.0;
        _1010 = as_type<int>(_1018);
    }
    int _1020 = _1010;
    int _1022 = 0;
    if (_918)
    {
        float _1024 = -_904;
        float _1026 = _1024 + 1.0;
        _1022 = as_type<int>(_1026);
    }
    int _1028 = _1022;
    float _1030 = fma(_968, _1006, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1032 = _966;
    if (_896)
    {
        bool _1034 = _932 > 0.5;
        _363 = _1034;
    }
    bool _1036 = _363;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1040 = _837 + _1038;
    float _1042 = _966 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    if (_984)
    {
        float _1044 = -_898;
        float _1046 = _1044 + 1.0;
        _928 = _1046;
    }
    float _1048 = _928;
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1052 = fma(_1002, _1040, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1054 = _996 * _1000;
    float _1056 = -_996;
    float _1058 = _1056 + 1.0;
    float _1060 = fma(_1042, _1048, -0.5);
    bool _1062 = _960 > 0.5;
    int _1064 = 0;
    float _1066 = _1058;
    float _1068 = _960;
    if (_908)
    {
        float _1070 = -_904;
        float _1072 = _1070 + 1.0;
        _1064 = as_type<int>(_1072);
    }
    int _1074 = _1064;
    float _1076 = _950 * _1058;
    float _1078 = -_950;
    float _1080 = _1078 + 1.0;
    float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1084 = _1076;
    float _1086 = as_type<float>(_1074);
    if (!_918)
    {
        _1032 = _904;
    }
    float _1088 = _1032;
    float _1090 = _1030 * _1076;
    float _1092 = _1088;
    if (!_896)
    {
        _1084 = _904;
    }
    float _1094 = _1084;
    float _1096 = _1094;
    if (_896)
    {
        float _1098 = _1036 ? as_type<float>(_1020) : _904;
        _1096 = _1098;
    }
    float _1100 = _1096;
    float _1102 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1090);
    if (_918)
    {
        float _1104 = _1062 ? as_type<float>(_1028) : _904;
        _1092 = _1104;
    }
    float _1106 = _1092;
    if (_908)
    {
        bool _1108 = _117 > 0.5;
        _1012 = _1108;
    }
    bool _1110 = _1012;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1114 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1112);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1120 = _1110;
    float _1122 = _1112;
    if (!_908)
    {
        _1066 = _904;
    }
    float _1124 = _1066;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1128 = _1124;
    if (_908)
    {
        float _1130 = _1110 ? as_type<float>(_1074) : _904;
        _1128 = _1130;
    }
    float _1132 = _1128;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_958)
    {
        _1120 = false;
    }
    bool _1136 = _1120;
    bool _1138 = _1136;
    if (_958)
    {
        _1014 = _117;
    }
    float _1140 = _1014;
    float _1142 = _1140;
    if (_958)
    {
        _1086 = _960;
    }
    float _1144 = _1086;
    float _1146 = _1144;
    if (!_958)
    {
        float _1148 = _117 * 3.1415927410125732421875;
        float _1150 = _1148 * 0.15915493667125701904296875;
        float _1152 = _960 * 3.1415927410125732421875;
        float _1154 = _1152 * 0.15915493667125701904296875;
        float _1156 = _1150 * 6.283185482025146484375;
        float _1158 = sin(_1156);
        float _1160 = _1154 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        _1138 = true;
        _1146 = _1162;
        _1142 = _1158;
        _1122 = _1154;
    }
    bool _1164 = _1138;
    float _1166 = _1146;
    float _1168 = _1142;
    float _1170 = _1122;
    float _1172 = _1170;
    if (_1164)
    {
        _1172 = _960;
    }
    float _1174 = _1172;
    float _1176 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1178 = _1174;
    if (!_1164)
    {
        _1178 = _117;
    }
    float _1180 = _1178;
    float _1182 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1134);
    if (!_1164)
    {
        _1068 = _117;
    }
    float _1184 = _1068;
    float _1186 = fma(_1176, _1100, -0.5);
    float _1188 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    uint _1191 = as_type<uint>(half2(float2(_888, 0.0)));
    float _1193 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1195 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1118);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1199 = fma(_1188, -2.0, _1126);
    uint _1201 = extract_bits(_1191, 0u, 8u);
    int _1203 = int(_1201) & 255;
    uint _1205 = extract_bits(_1191, 8u, 8u);
    int _1207 = int(_1205) & 255;
    int _1209 = _1207 << 8;
    int _1211 = _1203 | _1209;
    float _1213 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1215 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1197);
    float _1217 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1219 = fma(_1193, _1132, -0.5);
    float _1221 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1182);
    float _1223 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1199);
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1227 = _1211 >= 32768;
    float _1229 = fma(_1052, _1054, _1102);
    float _1231 = -_1116;
    float _1233 = fma(_1213, 2.0, _1231);
    float _1235 = -_1225;
    float _1237 = fma(_1217, 2.0, _1235);
    float _1239 = -_1223;
    float _1241 = fma(_1221, _1060, _1239);
    float _1243 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1229);
    float _1245 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1195);
    float _1247 = -_121;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1233);
    float _1251 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1114);
    float _1253 = -_121;
    float _1255 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[76].x, _938);
    float _1257 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1215);
    float _1259 = -_121;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1237);
    int _1263 = _865 + 1;
    float _1265 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1267 = _811 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1269 = min(_857, _1263);
    float _1271 = fma(_1265, _1106, -0.5);
    int _1273 = _1211 + (-1024);
    float _1275 = _813 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1277 = _1273;
    if (_1227)
    {
        int _1279 = ~_1211;
        int _1281 = _1279 + 33792;
        int _1283 = _1281 + 1;
        _1277 = _1283;
    }
    int _1285 = _1277;
    float _1287 = fma(_1245, _1271, _1249);
    float _1289 = _815 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1291 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1293 = _1285 + 30719;
    float _1295 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1243 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1301 = float(_1293);
    float _1303 = _1287 + 0.5;
    float _1305 = _1241 + 0.5;
    float _1307 = fma(_1251, _1219, _1255);
    out.m_63.x = _1291;
    out.m_63.y = _1295;
    out.m_63.z = _1297;
    out.m_63.w = _1299;
    float _1309 = fma(_1301, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1311 = fma(_1257, _1186, _1261);
    out.m_65.x = _1303;
    out.m_65.y = _1305;
    float _1313 = abs(_1309);
    float _1315 = -_1313;
    float _1317 = _1315 + 1.0;
    float _1319 = _1311 + 0.5;
    int _1321 = as_type<int>(_1317) + (-218103808);
    bool _1323 = uint(_1321) >= 1920991232u;
    float _1325 = _1307 + 0.5;
    bool _1327 = !_1323;
    if (!_1327)
    {
        int _1329;
        _86(_1329, out.gl_Position, out.gl_PointSize);
    }
    int _1331 = _1269;
    int _1333 = 0;
    int _1335 = _89(_1331, _1333, (*spvDescriptorSet0.support_buffer));
    int _1337 = _855;
    int _1339 = 0;
    int _1341 = _89(_1337, _1339, (*spvDescriptorSet0.support_buffer));
    float4 _1343 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1335, _1341)), 0).xyzw;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = _1343.w;
    float _1353 = floor(_861);
    float _1355 = -_1353;
    float _1357 = _861 + _1355;
    uint _1359 = as_type<uint>(half2(float2(_1351, 0.0)));
    float _1361 = -_882;
    float _1363 = _1361 + _1345;
    float _1365 = -_886;
    float _1367 = _1365 + _1349;
    uint _1369 = extract_bits(_1359, 0u, 8u);
    int _1371 = int(_1369) & 255;
    uint _1373 = extract_bits(_1359, 8u, 8u);
    int _1375 = int(_1373) & 255;
    int _1377 = _1375 << 8;
    int _1379 = _1371 | _1377;
    float _1381 = fma(_1357, _1363, _882);
    bool _1383 = _1379 >= 32768;
    int _1385 = _1379 + (-1024);
    int _1387 = _1385;
    if (_1383)
    {
        int _1389 = ~_1379;
        int _1391 = _1389 + 33792;
        int _1393 = _1391 + 1;
        _1387 = _1393;
    }
    int _1395 = _1387;
    int _1397 = _1395 + 30719;
    float _1399 = float(_1397);
    float _1401 = fma(_1399, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1403 = abs(_1401);
    float _1405 = -_1403;
    float _1407 = _1405 + 1.0;
    int _1409 = as_type<int>(_1407) + (-218103808);
    bool _1411 = uint(_1409) >= 1920991232u;
    float _1413 = -_884;
    float _1415 = _1413 + _1347;
    float _1417 = fma(_1357, _1367, _886);
    float _1419 = fma(_1357, _1415, _884);
    bool _1421 = !_1411;
    if (!_1421)
    {
        int _1423;
        _86(_1423, out.gl_Position, out.gl_PointSize);
    }
    float _1425 = _353 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1427 = _353 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1429 = _353 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1431 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1425);
    float _1433 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1427);
    float _1435 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1429);
    float _1437 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1431);
    float _1439 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1433);
    float _1441 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1435);
    float _1443 = _1437 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1445 = _1439 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1447 = _1441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1451 = _1443 + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1455 = _1445 + _1453;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1459 = _1447 + _1457;
    float _1461 = _1451 * _1451;
    float _1463 = fma(_1455, _1455, _1461);
    float _1465 = fma(_1459, _1459, _1463);
    float _1467 = rsqrt(_1465);
    float _1469 = _1451 * _1467;
    float _1471 = _1455 * _1467;
    float _1473 = _1459 * _1467;
    float _1475 = -_1469;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1479 = -_1471;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1455);
    float _1483 = -_1473;
    float _1485 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1459);
    float _1487 = _1477 * _1477;
    float _1489 = in.m_57.x;
    float _1491 = in.m_57.y;
    float _1493 = in.m_57.z;
    float _1495 = fma(_1481, _1481, _1487);
    float _1497 = fma(_1485, _1485, _1495);
    float _1499 = sqrt(_1497);
    float _1501 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1417);
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1505 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1507 = _1467 * _1499;
    float _1509 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1511 = _1503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1419);
    float _1515 = _1505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1517 = _1509 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1519 = _1511 * _1507;
    float _1521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1381);
    float _1523 = _1515 * _1507;
    float _1525 = _1517 * _1507;
    float _1527 = _1519 * _1513;
    float _1529 = _1523 * _1521;
    float _1531 = _1525 * _1501;
    float _1533 = _1527 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1535 = _1527 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1537 = _1527 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1539 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1533);
    float _1541 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1535);
    float _1543 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1537);
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1539);
    float _1547 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1541);
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1543);
    float _1551 = _1447 + _1545;
    float _1553 = _1445 + _1547;
    float _1555 = _1443 + _1549;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1551 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1553 + _1561;
    float _1565 = _1559 * _1559;
    float _1567 = fma(_1563, _1563, _1565);
    float _1569 = sqrt(_1567);
    bool _1571 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1573 = _1549;
    float _1575 = _1529;
    float _1577 = _1531;
    float _1579 = _1551;
    if (!_1571)
    {
        _1573 = _1553;
    }
    float _1581 = _1573;
    float _1583 = _1581;
    if (!_1571)
    {
        _1575 = _1551;
    }
    float _1585 = _1575;
    float _1587 = _1585;
    if (!_1571)
    {
        _1577 = _1555;
    }
    float _1589 = _1577;
    bool _1591 = !_1571;
    float _1593 = _1589;
    if (!_1591)
    {
        float _1595 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1599 = _1569 + _1597;
        float _1601 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = rsqrt(_1567);
        float _1605 = _1599 * _1595;
        float _1607 = _1605 * 0.15915493667125701904296875;
        float _1609 = _1607 * 6.283185482025146484375;
        float _1611 = sin(_1609);
        float _1613 = _1607 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        float _1617 = fma(_1611, _1601, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1619 = _1603 * _1617;
        float _1621 = _1615 + (-1.0);
        float _1623 = fma(_1563, _1619, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1625 = fma(_1559, _1619, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1627 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1629 = fma(_1555, _1615, _1627);
        _1593 = _1629;
        _1583 = _1623;
        _1587 = _1625;
    }
    float _1631 = _1593;
    float _1633 = _1583;
    float _1635 = _1587;
    float _1637 = -_1469;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1631);
    float _1641 = -_1471;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1633);
    float _1645 = -_1473;
    float _1647 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1635);
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1651 = _1639 + _1649;
    float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1655 = _1643 + _1653;
    float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1659 = _1647 + _1657;
    float _1661 = _1651 * _1651;
    float _1663 = fma(_1655, _1655, _1661);
    float _1665 = fma(_1659, _1659, _1663);
    float _1667 = rsqrt(_1665);
    float _1669 = sqrt(_1665);
    float _1671 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1673 = _1655 * _1671;
    float _1675 = _1659 * _1671;
    float _1677 = _1673 * _1673;
    float _1679 = _1675 * _1675;
    float _1681 = _1677 + _1679;
    float _1683 = sqrt(_1681);
    bool _1685 = _1683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1689 = _1683 + _1687;
    float _1691 = _1663;
    float _1693 = _1667;
    float _1695 = _1689;
    float _1697 = _1651;
    if (_1685)
    {
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1691 = _1699;
    }
    float _1701 = _1691;
    if (_1685)
    {
        float _1703 = rsqrt(_1681);
        _1693 = _1703;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (_1685)
    {
        float _1709 = _1689 * _1701;
        _1695 = _1709;
    }
    float _1711 = _1695;
    if (_1685)
    {
        float _1713 = _1711 * 0.15915493667125701904296875;
        _1579 = _1713;
    }
    float _1715 = _1579;
    float _1717 = _1659;
    float _1719 = _1715;
    if (_1685)
    {
        float _1721 = _1715 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        _1717 = _1723;
    }
    float _1725 = _1717;
    float _1727 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1729 = precise::max(0.0, _1727);
    float _1731 = _1701;
    float _1733 = _1729;
    if (_1685)
    {
        float _1735 = _1715 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        _1731 = _1737;
    }
    float _1739 = _1731;
    float _1741 = -_1671;
    float _1743 = -_1729;
    float _1745 = fma(_1651, _1741, _1743);
    if (_1685)
    {
        float _1747 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1697 = _1747;
    }
    float _1749 = _1697;
    float _1751 = _1749;
    float _1753 = _1725;
    if (_1685)
    {
        float _1755 = fma(_1725, _1749, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1751 = _1755;
    }
    float _1757 = _1751;
    float _1759 = _1757;
    if (!_1685)
    {
        _1753 = _1673;
    }
    float _1761 = _1753;
    float _1763 = _1761;
    float _1765 = _1739;
    if (_1685)
    {
        float _1767 = _1739 + (-1.0);
        _1733 = _1767;
    }
    float _1769 = _1733;
    float _1771 = _1769;
    if (_1685)
    {
        float _1773 = _1705 * _1757;
        _1759 = _1773;
    }
    float _1775 = _1759;
    float _1777 = _1775;
    if (!_1685)
    {
        _1707 = _1745;
    }
    float _1779 = _1707;
    float _1781 = _1779;
    if (_1685)
    {
        float _1783 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1783;
    }
    float _1785 = _1719;
    if (_1685)
    {
        float _1787 = _1673 * _1775;
        _1763 = _1787;
    }
    float _1789 = _1763;
    if (!_1685)
    {
        _1771 = _1675;
    }
    float _1791 = _1771;
    float _1793 = _1791;
    if (_1685)
    {
        float _1795 = _1675 * _1775;
        _1793 = _1795;
    }
    float _1797 = _1793;
    if (!_1685)
    {
        _1777 = _1677;
    }
    float _1799 = _1777;
    float _1801 = _1799;
    if (_1685)
    {
        float _1803 = fma(_1745, _1739, _1785);
        _1781 = _1803;
    }
    float _1805 = _1781;
    if (_1685)
    {
        float _1807 = _1789 * _1789;
        _1801 = _1807;
    }
    float _1809 = _1801;
    float _1811 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1685)
    {
        _1765 = _1679;
    }
    float _1813 = _1765;
    float _1815 = _1813;
    if (_1685)
    {
        float _1817 = _1797 * _1797;
        _1815 = _1817;
    }
    float _1819 = _1815;
    float _1821 = fma(_1805, _1805, _1809);
    float _1823 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1825 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1811);
    float _1827 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1829 = _1821 + _1819;
    float _1831 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1823);
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1835 = fma(_1669, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1833);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1827);
    float _1841 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1825);
    float _1843 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1831);
    float _1845 = rsqrt(_1829);
    float _1847 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1849 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1839);
    float _1851 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1853 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1855 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1847);
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1861 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1863 = -_1837;
    float _1865 = _1863 + 1.0;
    float _1867 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1869 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1855);
    float _1871 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    float _1873 = -_1867;
    float _1875 = fma(_1873, _1861, 1.0);
    float _1877 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1879 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1871);
    float _1881 = abs(_1865);
    float _1883 = log2(_1881);
    float _1885 = _1845 * _1789;
    float _1887 = _1845 * _1797;
    float _1889 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1879);
    float _1891 = _1845 * _1805;
    float _1893 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1895 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1897 = 1.0 / _1889;
    float _1899 = -_1893;
    float _1901 = fma(_1891, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1899);
    float _1903 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1895);
    float _1905 = _1891 + 1.0;
    float _1907 = -_1887;
    float _1909 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1901);
    float _1911 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1913 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1915 = fma(_1909, -0.5, 0.5);
    float _1917 = log2(_1875);
    float _1919 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1911);
    float _1921 = fma(_1909, 0.5, 0.5);
    float _1923 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1919);
    float _1925 = fma(_1921, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1927 = exp2(_1913);
    float _1929 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1923);
    float _1931 = fma(_1921, _1925, -0.212114393711090087890625);
    float _1933 = fma(_1921, _1931, 1.570728778839111328125);
    float _1935 = sqrt(_1915);
    float _1937 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1903);
    float _1939 = _1917 * 0.693147182464599609375;
    float _1941 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1937);
    float _1943 = _1929 * _1897;
    float _1945 = -_1891;
    float _1947 = fma(_1927, _1905, _1945);
    float _1949 = _1941 * _1897;
    float _1951 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1953 = fma(_1943, 0.5, 0.5);
    float _1955 = fma(_1947, 0.5, 0.5);
    float _1957 = fma(_1949, -0.5, 0.5);
    float _1959 = _1935 * 0.636619746685028076171875;
    float _1961 = -_1933;
    float _1963 = fma(_1959, _1961, 1.0);
    float3 _5179 = float3(_1953, _1957, _1951);
    float _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5179, float3(0.0), isnan(_5179)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5179, float3(0.0), isnan(_5179)), level(0.0)).x;
    float3 _5190 = float3(_1953, _1957, _1951);
    float4 _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5190, float3(0.0), isnan(_5190)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5190, float3(0.0), isnan(_5190)), level(0.0)).xyzw;
    float _1969 = _1967.x;
    float _1971 = _1967.y;
    float _1973 = _1967.z;
    float _1975 = _1967.w;
    float2 _5206 = float2(_1963, _1955);
    float3 _1979 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5206, float2(0.0), isnan(_5206)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5206, float2(0.0), isnan(_5206)), level(0.0)).xyz;
    float _1981 = _1979.x;
    float _1983 = _1979.y;
    float _1985 = _1979.z;
    float _1987 = -_1469;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1443);
    float _1991 = -_1471;
    float _1993 = fma(_1991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1445);
    float _1995 = -_1473;
    float _1997 = fma(_1995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1447);
    float _1999 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2001 = _1989 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2003 = _1989 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2005 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2007 = isnan(0.5);
    bool _2009 = _2005 || _2007;
    bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2013 = _2009 || _2011;
    float _2015 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2001);
    float _2019 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2003);
    float _2021 = exp2(_1999);
    float _2023 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2015);
    float _2025 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2017);
    float _2027 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2019);
    float _2029 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2023);
    float _2031 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2033 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2035 = 1.0 / _2031;
    float _2037 = _2033 + _2031;
    float _2039 = _2031;
    if (_2013)
    {
        _2039 = 1.0;
    }
    float _2041 = _2039;
    float _2043 = _2037 * _2035;
    float _2045 = _2043 * 0.5;
    float _2047 = _2041;
    if (!_2013)
    {
        float _2049 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2051 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2053 = _2049 * 0.15915493667125701904296875;
        float _2055 = _2051 * 0.15915493667125701904296875;
        float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2059 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2057);
        float _2061 = _2053 * 6.283185482025146484375;
        float _2063 = cos(_2061);
        float _2065 = _2053 * 6.283185482025146484375;
        float _2067 = sin(_2065);
        float _2069 = 1.0 / _2063;
        float _2071 = _2055 * 6.283185482025146484375;
        float _2073 = cos(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = _2055 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = 1.0 / _2059;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2087 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2085;
        float _2089 = 1.0 / _2081;
        float _2091 = 1.0 / _2087;
        float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2095 = _2083 * _2093;
        float _2097 = _2079 * _2089;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2101 = fma(_2097, _2095, _2099);
        float _2103 = _2101 * _2091;
        float _2105 = precise::clamp(_2103, 0.0, 1.0);
        float _2107 = -_2105;
        float _2109 = _2107 + 1.0;
        _2047 = _2109;
    }
    float _2111 = _2047;
    float _2113 = -_2021;
    float _2115 = _2113 + 1.0;
    float _2117 = _2111 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2119 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2029);
    bool _2121 = _2111 > 0.0;
    bool _2123 = isnan(_2111);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan(0.0);
    bool _2129 = _2125 || _2127;
    float _2131 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2133 = _359 * _2117;
    out.m_67.x = _1325;
    float _2135 = _1889 * 0.5;
    float _2137 = _2131 * _1965;
    float _2139 = _2119 + _1889;
    float _2141 = _1929 + _1889;
    float _2143 = -_2131;
    float _2145 = _2143 + 1.0;
    float _2147 = _1985 * _2137;
    float _2149 = fma(_1941, -0.5, _2135);
    float _2151 = _1975 * _2137;
    out.gl_Position.x = _1929;
    out.gl_Position.y = _1941;
    out.gl_Position.z = _2119;
    out.gl_Position.w = _1889;
    float _2153 = _2139 * 0.5;
    float _2155 = _2141 * 0.5;
    float _2157 = _2133 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2159 = fma(_1981, _2151, _1969);
    float _2161 = fma(_1983, _2151, _1971);
    float _2163 = _1975 * _2145;
    float _2165 = fma(_1975, _2147, _1973);
    out.m_67.z = _1319;
    out.m_69.x = _1381;
    out.m_71.x = _2155;
    out.m_71.y = _2149;
    out.m_71.z = _2153;
    out.m_71.w = _1889;
    out.m_47.x = _2157;
    out.m_73.x = _2159;
    out.m_73.y = _2161;
    out.m_73.z = _2165;
    out.m_73.w = _2163;
    if (_2129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2167;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _835 = false;
    bool _675 = false;
    bool _541 = false;
    bool _381 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_101)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_111);
        out.gl_Position.z = _2222;
    }
    if (!_101)
    {
        return out;
    }
    float _113 = in.m_49.w;
    float _115 = float(_97);
    float _117 = in.m_51.x;
    float _119 = -_113;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_113);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    out.m_53.x = _117;
    bool _133 = _121 >= _115;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = 1.0 / _115;
    float _141 = _113;
    if (_137)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    float _145 = _121 * _139;
    int _147 = 0;
    if (_137)
    {
        float _149 = _143 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    out.m_55.x = _145;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2297 = as_type<float>(_151);
        out.gl_Position.z = _2297;
    }
    if (_137)
    {
        return out;
    }
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    int _169 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _171 = _169 != 0;
    float _173 = _155 * _153;
    float _175 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _177 = _175 * 6.283185482025146484375;
    float _179 = floor(_175);
    float _181 = _177 * 0.15915493667125701904296875;
    float _183 = in.m_49.x;
    float _185 = in.m_49.y;
    float _187 = in.m_49.z;
    float _189 = _181 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = -_179;
    float _195 = _175 + _193;
    float _197 = _175;
    float _199 = _157;
    if (!_167)
    {
        float _201 = _157 * _157;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_167)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    float _213 = fma(_191, 0.5, 0.5);
    bool _215 = !_167;
    float _217 = _211;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_167;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _157 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _199 = _271;
    }
    float _273 = _199;
    float _275 = in.m_57.w;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _279 = _277 != 0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _283 = _281 != 0;
    float _285 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _287 = _195 < 0.5;
    float _289 = float(_287);
    float _291 = -_195;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = in.m_44.x;
    float _297 = in.m_44.y;
    float _299 = in.m_44.z;
    bool _301 = !_279;
    int _303 = _301 ? 0 : 1;
    float _305 = -_213;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = -_289;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _313 = !_171;
    int _315 = _313 ? 0 : 1;
    int _317 = abs(_303);
    float _319 = fma(_273, _183, _285);
    bool _321 = !_283;
    int _323 = _321 ? 0 : 1;
    float _325 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _329 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _331 = abs(_315);
    float _333 = fma(_273, _185, _325);
    int _335 = abs(_323);
    float _337 = fma(_273, _187, _329);
    float _339 = float(_317);
    float _341 = float(_331);
    float _343 = abs(_293);
    float _345 = _339 * _343;
    float _347 = float(_335);
    float _349 = fma(_341, _307, _345);
    float _351 = fma(_319, _275, _295);
    float _353 = fma(_333, _275, _297);
    float _355 = fma(_337, _275, _299);
    float _357 = abs(_311);
    float _359 = fma(_347, _357, _349);
    bool _361 = !_327;
    bool _363 = false;
    float _379;
    if (!_361)
    {
        float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _367 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _369 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _371 = _369 * _365;
        float _373 = floor(_371);
        float _375 = -_373;
        float _377 = _371 + _375;
        _379 = _377;
        _381 = true;
    }
    else
    {
        _379 = _145;
    }
    _381 = false;
    float _383 = _379;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _383 + _385;
    bool _389 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _391 = isnan(_383);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _403 = _383 + _401;
    bool _405 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _407 = isnan(_383);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _425 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _427 = isnan(_383);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -_399;
    float _439 = _437 + 1.0;
    float _441 = 1.0 / _423;
    float _443 = _435 * _439;
    float _445 = -_435;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _449;
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _455 = 1.0 / _419;
    float _457 = _415 * _447;
    float _459 = -_415;
    float _461 = _459 + 1.0;
    float _463 = _387 * _455;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _469;
    float _473 = fma(_451, _463, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _475 = fma(_467, _463, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _477 = fma(_471, _463, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = _403 * _441;
    float _481 = _473 * _457;
    float _483 = _475 * _457;
    float _485 = _477 * _457;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _499 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _501 = fma(_489, _479, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _503 = fma(_493, _479, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _505 = fma(_497, _479, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _507 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].y, _483);
    float _509 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _511 = fma(_501, _443, _499);
    float _513 = fma(_503, _443, _507);
    float _515 = fma(_505, _443, _509);
    float _517 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].x, _511);
    float _519 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].y, _513);
    float _521 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].z, _515);
    bool _523 = !_453;
    float _539;
    if (!_523)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _527 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _531 = _529 * _525;
        float _533 = floor(_531);
        float _535 = -_533;
        float _537 = _531 + _535;
        _539 = _537;
        _541 = true;
    }
    else
    {
        _539 = _145;
    }
    _541 = false;
    float _543 = _539;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _543 + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _553 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _555 = isnan(_543);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _569 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _571 = isnan(_543);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _581;
    bool _585 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _587 = isnan(_543);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _551;
    float _599 = -_563;
    float _601 = _599 + 1.0;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _605 = _579 * _601;
    float _607 = -_579;
    float _609 = _607 + 1.0;
    float _611 = 1.0 / _567;
    float _613 = _583 * _597;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _619 = fma(_613, _547, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _621 = -_595;
    float _623 = _621 + 1.0;
    float _625 = _619 * _605;
    float _627 = _617 * _611;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _543 + _629;
    float _633 = _563 * _623;
    float _635 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _625);
    float _637 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _639 = fma(_627, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _641 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _643 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _645 = fma(_639, _633, _635);
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[117].x, _645);
    float _653 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _647;
    out.m_59.y = _649;
    out.m_59.z = _653;
    out.m_59.w = _655;
    bool _657 = !_603;
    float _673;
    if (!_657)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _661 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        _673 = _145;
    }
    _675 = false;
    float _677 = _673;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _681 = _677 + _679;
    bool _683 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _685 = isnan(_677);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _697 = _677 + _695;
    bool _699 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _701 = isnan(_677);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _719 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _721 = isnan(_677);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -_693;
    float _733 = _731 + 1.0;
    float _735 = 1.0 / _717;
    float _737 = _729 * _733;
    float _739 = -_729;
    float _741 = _739 + 1.0;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _743;
    bool _747 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _749 = 1.0 / _713;
    float _751 = _709 * _741;
    float _753 = -_709;
    float _755 = _753 + 1.0;
    float _757 = _681 * _749;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _763;
    float _767 = fma(_745, _757, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _769 = fma(_761, _757, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _771 = fma(_765, _757, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _773 = _697 * _735;
    float _775 = _767 * _751;
    float _777 = _769 * _751;
    float _779 = _771 * _751;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _793 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[123].x, _775);
    float _795 = fma(_783, _773, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _797 = fma(_787, _773, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _799 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[123].y, _777);
    float _801 = fma(_791, _773, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _803 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[123].z, _779);
    float _805 = fma(_795, _737, _793);
    float _807 = fma(_797, _737, _799);
    float _809 = fma(_801, _737, _803);
    float _811 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[125].x, _805);
    float _813 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[125].y, _807);
    float _815 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[125].z, _809);
    bool _817 = !_747;
    float _833;
    if (!_817)
    {
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _821 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _825 = _823 * _819;
        float _827 = floor(_825);
        float _829 = -_827;
        float _831 = _825 + _829;
        _833 = _831;
        _835 = true;
    }
    else
    {
        _833 = _145;
    }
    _835 = false;
    float _837 = _833;
    int _839 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _841 = _839;
    int _843 = 0;
    int _845 = _88(_841, _843, (*spvDescriptorSet0.support_buffer));
    float _847 = in.m_61.z;
    float _849 = 0.0 + _145;
    float _851 = precise::clamp(_849, 0.0, 1.0);
    float _853 = trunc(_847);
    int _855 = int(_853);
    int _857 = _845 + (-1);
    float _859 = float(_857);
    float _861 = _851 * _859;
    float _863 = trunc(_861);
    int _865 = int(_863);
    int _867 = _865;
    int _869 = 0;
    int _871 = _89(_867, _869, (*spvDescriptorSet0.support_buffer));
    int _873 = _855;
    int _875 = 0;
    int _877 = _89(_873, _875, (*spvDescriptorSet0.support_buffer));
    float4 _880 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_871, _877)), 0).xyzw;
    float _882 = _880.x;
    float _884 = _880.y;
    float _886 = _880.z;
    float _888 = _880.w;
    float _890 = in.m_51.z;
    float _892 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _896 = _894 != 0;
    float _898 = in.m_61.y;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _904 = in.m_61.x;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _908 = _906 != 0;
    float _910 = 1.0 / _902;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _918 = _916 != 0;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _922 = _920 != 0;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _926 = 0.0;
    float _928 = _898;
    if (_896)
    {
        float _930 = in.m_51.z;
        _926 = _930;
    }
    float _932 = _926;
    float _934 = 1.0 / _914;
    float _936 = -_924;
    float _938 = fma(_892, 2.0, _936);
    bool _940 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _942 = isnan(_837);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _952;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _958 = _956 != 0;
    float _960 = in.m_51.y;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _968 = _954 * _910;
    bool _970 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _972 = isnan(_837);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    bool _982 = _890 > 0.5;
    bool _984 = _982 && _922;
    bool _986 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _988 = isnan(_837);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = -_980;
    float _1000 = _998 + 1.0;
    float _1002 = _964 * _934;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1006 = _837 + _1004;
    float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _1010 = 0;
    bool _1012 = _984;
    float _1014 = _904;
    if (_896)
    {
        float _1016 = -_904;
        float _1018 = _1016 + 1.0;
        _1010 = as_type<int>(_1018);
    }
    int _1020 = _1010;
    int _1022 = 0;
    if (_918)
    {
        float _1024 = -_904;
        float _1026 = _1024 + 1.0;
        _1022 = as_type<int>(_1026);
    }
    int _1028 = _1022;
    float _1030 = fma(_968, _1006, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1032 = _966;
    if (_896)
    {
        bool _1034 = _932 > 0.5;
        _363 = _1034;
    }
    bool _1036 = _363;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1040 = _837 + _1038;
    float _1042 = _966 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    if (_984)
    {
        float _1044 = -_898;
        float _1046 = _1044 + 1.0;
        _928 = _1046;
    }
    float _1048 = _928;
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1052 = fma(_1002, _1040, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1054 = _996 * _1000;
    float _1056 = -_996;
    float _1058 = _1056 + 1.0;
    float _1060 = fma(_1042, _1048, -0.5);
    bool _1062 = _960 > 0.5;
    int _1064 = 0;
    float _1066 = _1058;
    float _1068 = _960;
    if (_908)
    {
        float _1070 = -_904;
        float _1072 = _1070 + 1.0;
        _1064 = as_type<int>(_1072);
    }
    int _1074 = _1064;
    float _1076 = _950 * _1058;
    float _1078 = -_950;
    float _1080 = _1078 + 1.0;
    float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1084 = _1076;
    float _1086 = as_type<float>(_1074);
    if (!_918)
    {
        _1032 = _904;
    }
    float _1088 = _1032;
    float _1090 = _1030 * _1076;
    float _1092 = _1088;
    if (!_896)
    {
        _1084 = _904;
    }
    float _1094 = _1084;
    float _1096 = _1094;
    if (_896)
    {
        float _1098 = _1036 ? as_type<float>(_1020) : _904;
        _1096 = _1098;
    }
    float _1100 = _1096;
    float _1102 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1090);
    if (_918)
    {
        float _1104 = _1062 ? as_type<float>(_1028) : _904;
        _1092 = _1104;
    }
    float _1106 = _1092;
    if (_908)
    {
        bool _1108 = _117 > 0.5;
        _1012 = _1108;
    }
    bool _1110 = _1012;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1114 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1112);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1120 = _1110;
    float _1122 = _1112;
    if (!_908)
    {
        _1066 = _904;
    }
    float _1124 = _1066;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1128 = _1124;
    if (_908)
    {
        float _1130 = _1110 ? as_type<float>(_1074) : _904;
        _1128 = _1130;
    }
    float _1132 = _1128;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_958)
    {
        _1120 = false;
    }
    bool _1136 = _1120;
    bool _1138 = _1136;
    if (_958)
    {
        _1014 = _117;
    }
    float _1140 = _1014;
    float _1142 = _1140;
    if (_958)
    {
        _1086 = _960;
    }
    float _1144 = _1086;
    float _1146 = _1144;
    if (!_958)
    {
        float _1148 = _117 * 3.1415927410125732421875;
        float _1150 = _1148 * 0.15915493667125701904296875;
        float _1152 = _960 * 3.1415927410125732421875;
        float _1154 = _1152 * 0.15915493667125701904296875;
        float _1156 = _1150 * 6.283185482025146484375;
        float _1158 = sin(_1156);
        float _1160 = _1154 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        _1138 = true;
        _1146 = _1162;
        _1142 = _1158;
        _1122 = _1154;
    }
    bool _1164 = _1138;
    float _1166 = _1146;
    float _1168 = _1142;
    float _1170 = _1122;
    float _1172 = _1170;
    if (_1164)
    {
        _1172 = _960;
    }
    float _1174 = _1172;
    float _1176 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1178 = _1174;
    if (!_1164)
    {
        _1178 = _117;
    }
    float _1180 = _1178;
    float _1182 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1134);
    if (!_1164)
    {
        _1068 = _117;
    }
    float _1184 = _1068;
    float _1186 = fma(_1176, _1100, -0.5);
    float _1188 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    uint _1191 = as_type<uint>(half2(float2(_888, 0.0)));
    float _1193 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1195 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1118);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1199 = fma(_1188, -2.0, _1126);
    uint _1201 = extract_bits(_1191, 0u, 8u);
    int _1203 = int(_1201) & 255;
    uint _1205 = extract_bits(_1191, 8u, 8u);
    int _1207 = int(_1205) & 255;
    int _1209 = _1207 << 8;
    int _1211 = _1203 | _1209;
    float _1213 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1215 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1197);
    float _1217 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1219 = fma(_1193, _1132, -0.5);
    float _1221 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1182);
    float _1223 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1199);
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1227 = _1211 >= 32768;
    float _1229 = fma(_1052, _1054, _1102);
    float _1231 = -_1116;
    float _1233 = fma(_1213, 2.0, _1231);
    float _1235 = -_1225;
    float _1237 = fma(_1217, 2.0, _1235);
    float _1239 = -_1223;
    float _1241 = fma(_1221, _1060, _1239);
    float _1243 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1229);
    float _1245 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1195);
    float _1247 = -_121;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1233);
    float _1251 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1114);
    float _1253 = -_121;
    float _1255 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[76].x, _938);
    float _1257 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1215);
    float _1259 = -_121;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1237);
    int _1263 = _865 + 1;
    float _1265 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1267 = _811 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1269 = min(_857, _1263);
    float _1271 = fma(_1265, _1106, -0.5);
    int _1273 = _1211 + (-1024);
    float _1275 = _813 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1277 = _1273;
    if (_1227)
    {
        int _1279 = ~_1211;
        int _1281 = _1279 + 33792;
        int _1283 = _1281 + 1;
        _1277 = _1283;
    }
    int _1285 = _1277;
    float _1287 = fma(_1245, _1271, _1249);
    float _1289 = _815 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1291 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1293 = _1285 + 30719;
    float _1295 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1243 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1301 = float(_1293);
    float _1303 = _1287 + 0.5;
    float _1305 = _1241 + 0.5;
    float _1307 = fma(_1251, _1219, _1255);
    out.m_63.x = _1291;
    out.m_63.y = _1295;
    out.m_63.z = _1297;
    out.m_63.w = _1299;
    float _1309 = fma(_1301, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1311 = fma(_1257, _1186, _1261);
    out.m_65.x = _1303;
    out.m_65.y = _1305;
    float _1313 = abs(_1309);
    float _1315 = -_1313;
    float _1317 = _1315 + 1.0;
    float _1319 = _1311 + 0.5;
    int _1321 = as_type<int>(_1317) + (-218103808);
    bool _1323 = uint(_1321) >= 1920991232u;
    float _1325 = _1307 + 0.5;
    bool _1327 = !_1323;
    if (!_1327)
    {
        int _1329;
        _86(_1329, out.gl_Position, out.gl_PointSize);
    }
    int _1331 = _1269;
    int _1333 = 0;
    int _1335 = _89(_1331, _1333, (*spvDescriptorSet0.support_buffer));
    int _1337 = _855;
    int _1339 = 0;
    int _1341 = _89(_1337, _1339, (*spvDescriptorSet0.support_buffer));
    float4 _1343 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1335, _1341)), 0).xyzw;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = _1343.w;
    float _1353 = floor(_861);
    float _1355 = -_1353;
    float _1357 = _861 + _1355;
    uint _1359 = as_type<uint>(half2(float2(_1351, 0.0)));
    float _1361 = -_882;
    float _1363 = _1361 + _1345;
    float _1365 = -_886;
    float _1367 = _1365 + _1349;
    uint _1369 = extract_bits(_1359, 0u, 8u);
    int _1371 = int(_1369) & 255;
    uint _1373 = extract_bits(_1359, 8u, 8u);
    int _1375 = int(_1373) & 255;
    int _1377 = _1375 << 8;
    int _1379 = _1371 | _1377;
    float _1381 = fma(_1357, _1363, _882);
    bool _1383 = _1379 >= 32768;
    int _1385 = _1379 + (-1024);
    int _1387 = _1385;
    if (_1383)
    {
        int _1389 = ~_1379;
        int _1391 = _1389 + 33792;
        int _1393 = _1391 + 1;
        _1387 = _1393;
    }
    int _1395 = _1387;
    int _1397 = _1395 + 30719;
    float _1399 = float(_1397);
    float _1401 = fma(_1399, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1403 = abs(_1401);
    float _1405 = -_1403;
    float _1407 = _1405 + 1.0;
    int _1409 = as_type<int>(_1407) + (-218103808);
    bool _1411 = uint(_1409) >= 1920991232u;
    float _1413 = -_884;
    float _1415 = _1413 + _1347;
    float _1417 = fma(_1357, _1367, _886);
    float _1419 = fma(_1357, _1415, _884);
    bool _1421 = !_1411;
    if (!_1421)
    {
        int _1423;
        _86(_1423, out.gl_Position, out.gl_PointSize);
    }
    float _1425 = _353 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1427 = _353 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1429 = _353 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1431 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1425);
    float _1433 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1427);
    float _1435 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1429);
    float _1437 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1431);
    float _1439 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1433);
    float _1441 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1435);
    float _1443 = _1437 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1445 = _1439 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1447 = _1441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1451 = _1443 + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1455 = _1445 + _1453;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1459 = _1447 + _1457;
    float _1461 = _1451 * _1451;
    float _1463 = fma(_1455, _1455, _1461);
    float _1465 = fma(_1459, _1459, _1463);
    float _1467 = rsqrt(_1465);
    float _1469 = _1451 * _1467;
    float _1471 = _1455 * _1467;
    float _1473 = _1459 * _1467;
    float _1475 = -_1469;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1479 = -_1471;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1455);
    float _1483 = -_1473;
    float _1485 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1459);
    float _1487 = _1477 * _1477;
    float _1489 = in.m_57.x;
    float _1491 = in.m_57.y;
    float _1493 = in.m_57.z;
    float _1495 = fma(_1481, _1481, _1487);
    float _1497 = fma(_1485, _1485, _1495);
    float _1499 = sqrt(_1497);
    float _1501 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1417);
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1505 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1507 = _1467 * _1499;
    float _1509 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1511 = _1503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1419);
    float _1515 = _1505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1517 = _1509 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1519 = _1511 * _1507;
    float _1521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1381);
    float _1523 = _1515 * _1507;
    float _1525 = _1517 * _1507;
    float _1527 = _1519 * _1513;
    float _1529 = _1523 * _1521;
    float _1531 = _1525 * _1501;
    float _1533 = _1527 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1535 = _1527 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1537 = _1527 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1539 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1533);
    float _1541 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1535);
    float _1543 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1537);
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1539);
    float _1547 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1541);
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1543);
    float _1551 = _1447 + _1545;
    float _1553 = _1445 + _1547;
    float _1555 = _1443 + _1549;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1551 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1553 + _1561;
    float _1565 = _1559 * _1559;
    float _1567 = fma(_1563, _1563, _1565);
    float _1569 = sqrt(_1567);
    bool _1571 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1573 = _1549;
    float _1575 = _1529;
    float _1577 = _1531;
    float _1579 = _1551;
    if (!_1571)
    {
        _1573 = _1553;
    }
    float _1581 = _1573;
    float _1583 = _1581;
    if (!_1571)
    {
        _1575 = _1551;
    }
    float _1585 = _1575;
    float _1587 = _1585;
    if (!_1571)
    {
        _1577 = _1555;
    }
    float _1589 = _1577;
    bool _1591 = !_1571;
    float _1593 = _1589;
    if (!_1591)
    {
        float _1595 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1599 = _1569 + _1597;
        float _1601 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = rsqrt(_1567);
        float _1605 = _1599 * _1595;
        float _1607 = _1605 * 0.15915493667125701904296875;
        float _1609 = _1607 * 6.283185482025146484375;
        float _1611 = sin(_1609);
        float _1613 = _1607 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        float _1617 = fma(_1611, _1601, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1619 = _1603 * _1617;
        float _1621 = _1615 + (-1.0);
        float _1623 = fma(_1563, _1619, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1625 = fma(_1559, _1619, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1627 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1629 = fma(_1555, _1615, _1627);
        _1593 = _1629;
        _1583 = _1623;
        _1587 = _1625;
    }
    float _1631 = _1593;
    float _1633 = _1583;
    float _1635 = _1587;
    float _1637 = -_1469;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1631);
    float _1641 = -_1471;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1633);
    float _1645 = -_1473;
    float _1647 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1635);
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1651 = _1639 + _1649;
    float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1655 = _1643 + _1653;
    float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1659 = _1647 + _1657;
    float _1661 = _1651 * _1651;
    float _1663 = fma(_1655, _1655, _1661);
    float _1665 = fma(_1659, _1659, _1663);
    float _1667 = rsqrt(_1665);
    float _1669 = sqrt(_1665);
    float _1671 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1673 = _1655 * _1671;
    float _1675 = _1659 * _1671;
    float _1677 = _1673 * _1673;
    float _1679 = _1675 * _1675;
    float _1681 = _1677 + _1679;
    float _1683 = sqrt(_1681);
    bool _1685 = _1683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1689 = _1683 + _1687;
    float _1691 = _1663;
    float _1693 = _1667;
    float _1695 = _1689;
    float _1697 = _1651;
    if (_1685)
    {
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1691 = _1699;
    }
    float _1701 = _1691;
    if (_1685)
    {
        float _1703 = rsqrt(_1681);
        _1693 = _1703;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (_1685)
    {
        float _1709 = _1689 * _1701;
        _1695 = _1709;
    }
    float _1711 = _1695;
    if (_1685)
    {
        float _1713 = _1711 * 0.15915493667125701904296875;
        _1579 = _1713;
    }
    float _1715 = _1579;
    float _1717 = _1659;
    float _1719 = _1715;
    if (_1685)
    {
        float _1721 = _1715 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        _1717 = _1723;
    }
    float _1725 = _1717;
    float _1727 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1729 = precise::max(0.0, _1727);
    float _1731 = _1701;
    float _1733 = _1729;
    if (_1685)
    {
        float _1735 = _1715 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        _1731 = _1737;
    }
    float _1739 = _1731;
    float _1741 = -_1671;
    float _1743 = -_1729;
    float _1745 = fma(_1651, _1741, _1743);
    if (_1685)
    {
        float _1747 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1697 = _1747;
    }
    float _1749 = _1697;
    float _1751 = _1749;
    float _1753 = _1725;
    if (_1685)
    {
        float _1755 = fma(_1725, _1749, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1751 = _1755;
    }
    float _1757 = _1751;
    float _1759 = _1757;
    if (!_1685)
    {
        _1753 = _1673;
    }
    float _1761 = _1753;
    float _1763 = _1761;
    float _1765 = _1739;
    if (_1685)
    {
        float _1767 = _1739 + (-1.0);
        _1733 = _1767;
    }
    float _1769 = _1733;
    float _1771 = _1769;
    if (_1685)
    {
        float _1773 = _1705 * _1757;
        _1759 = _1773;
    }
    float _1775 = _1759;
    float _1777 = _1775;
    if (!_1685)
    {
        _1707 = _1745;
    }
    float _1779 = _1707;
    float _1781 = _1779;
    if (_1685)
    {
        float _1783 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1783;
    }
    float _1785 = _1719;
    if (_1685)
    {
        float _1787 = _1673 * _1775;
        _1763 = _1787;
    }
    float _1789 = _1763;
    if (!_1685)
    {
        _1771 = _1675;
    }
    float _1791 = _1771;
    float _1793 = _1791;
    if (_1685)
    {
        float _1795 = _1675 * _1775;
        _1793 = _1795;
    }
    float _1797 = _1793;
    if (!_1685)
    {
        _1777 = _1677;
    }
    float _1799 = _1777;
    float _1801 = _1799;
    if (_1685)
    {
        float _1803 = fma(_1745, _1739, _1785);
        _1781 = _1803;
    }
    float _1805 = _1781;
    if (_1685)
    {
        float _1807 = _1789 * _1789;
        _1801 = _1807;
    }
    float _1809 = _1801;
    float _1811 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1685)
    {
        _1765 = _1679;
    }
    float _1813 = _1765;
    float _1815 = _1813;
    if (_1685)
    {
        float _1817 = _1797 * _1797;
        _1815 = _1817;
    }
    float _1819 = _1815;
    float _1821 = fma(_1805, _1805, _1809);
    float _1823 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1825 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1811);
    float _1827 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1829 = _1821 + _1819;
    float _1831 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1823);
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1835 = fma(_1669, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1833);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1827);
    float _1841 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1825);
    float _1843 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1831);
    float _1845 = rsqrt(_1829);
    float _1847 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1849 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1839);
    float _1851 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1853 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1855 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1847);
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1861 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1863 = -_1837;
    float _1865 = _1863 + 1.0;
    float _1867 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1869 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1855);
    float _1871 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    float _1873 = -_1867;
    float _1875 = fma(_1873, _1861, 1.0);
    float _1877 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1879 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1871);
    float _1881 = abs(_1865);
    float _1883 = log2(_1881);
    float _1885 = _1845 * _1789;
    float _1887 = _1845 * _1797;
    float _1889 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1879);
    float _1891 = _1845 * _1805;
    float _1893 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1895 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1897 = 1.0 / _1889;
    float _1899 = -_1893;
    float _1901 = fma(_1891, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1899);
    float _1903 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1895);
    float _1905 = _1891 + 1.0;
    float _1907 = -_1887;
    float _1909 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1901);
    float _1911 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1913 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1915 = fma(_1909, -0.5, 0.5);
    float _1917 = log2(_1875);
    float _1919 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1911);
    float _1921 = fma(_1909, 0.5, 0.5);
    float _1923 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1919);
    float _1925 = fma(_1921, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1927 = exp2(_1913);
    float _1929 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1923);
    float _1931 = fma(_1921, _1925, -0.212114393711090087890625);
    float _1933 = fma(_1921, _1931, 1.570728778839111328125);
    float _1935 = sqrt(_1915);
    float _1937 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1903);
    float _1939 = _1917 * 0.693147182464599609375;
    float _1941 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1937);
    float _1943 = _1929 * _1897;
    float _1945 = -_1891;
    float _1947 = fma(_1927, _1905, _1945);
    float _1949 = _1941 * _1897;
    float _1951 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1953 = fma(_1943, 0.5, 0.5);
    float _1955 = fma(_1947, 0.5, 0.5);
    float _1957 = fma(_1949, -0.5, 0.5);
    float _1959 = _1935 * 0.636619746685028076171875;
    float _1961 = -_1933;
    float _1963 = fma(_1959, _1961, 1.0);
    float3 _5179 = float3(_1953, _1957, _1951);
    float _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5179, float3(0.0), isnan(_5179)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5179, float3(0.0), isnan(_5179)), level(0.0)).x;
    float3 _5190 = float3(_1953, _1957, _1951);
    float4 _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5190, float3(0.0), isnan(_5190)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5190, float3(0.0), isnan(_5190)), level(0.0)).xyzw;
    float _1969 = _1967.x;
    float _1971 = _1967.y;
    float _1973 = _1967.z;
    float _1975 = _1967.w;
    float2 _5206 = float2(_1963, _1955);
    float3 _1979 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5206, float2(0.0), isnan(_5206)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5206, float2(0.0), isnan(_5206)), level(0.0)).xyz;
    float _1981 = _1979.x;
    float _1983 = _1979.y;
    float _1985 = _1979.z;
    float _1987 = -_1469;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1443);
    float _1991 = -_1471;
    float _1993 = fma(_1991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1445);
    float _1995 = -_1473;
    float _1997 = fma(_1995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1447);
    float _1999 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2001 = _1989 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2003 = _1989 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2005 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2007 = isnan(0.5);
    bool _2009 = _2005 || _2007;
    bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2013 = _2009 || _2011;
    float _2015 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2001);
    float _2019 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2003);
    float _2021 = exp2(_1999);
    float _2023 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2015);
    float _2025 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2017);
    float _2027 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2019);
    float _2029 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2023);
    float _2031 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2033 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2035 = 1.0 / _2031;
    float _2037 = _2033 + _2031;
    float _2039 = _2031;
    if (_2013)
    {
        _2039 = 1.0;
    }
    float _2041 = _2039;
    float _2043 = _2037 * _2035;
    float _2045 = _2043 * 0.5;
    float _2047 = _2041;
    if (!_2013)
    {
        float _2049 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2051 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2053 = _2049 * 0.15915493667125701904296875;
        float _2055 = _2051 * 0.15915493667125701904296875;
        float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2059 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2057);
        float _2061 = _2053 * 6.283185482025146484375;
        float _2063 = cos(_2061);
        float _2065 = _2053 * 6.283185482025146484375;
        float _2067 = sin(_2065);
        float _2069 = 1.0 / _2063;
        float _2071 = _2055 * 6.283185482025146484375;
        float _2073 = cos(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = _2055 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = 1.0 / _2059;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2087 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2085;
        float _2089 = 1.0 / _2081;
        float _2091 = 1.0 / _2087;
        float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2095 = _2083 * _2093;
        float _2097 = _2079 * _2089;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2101 = fma(_2097, _2095, _2099);
        float _2103 = _2101 * _2091;
        float _2105 = precise::clamp(_2103, 0.0, 1.0);
        float _2107 = -_2105;
        float _2109 = _2107 + 1.0;
        _2047 = _2109;
    }
    float _2111 = _2047;
    float _2113 = -_2021;
    float _2115 = _2113 + 1.0;
    float _2117 = _2111 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2119 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2029);
    bool _2121 = _2111 > 0.0;
    bool _2123 = isnan(_2111);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan(0.0);
    bool _2129 = _2125 || _2127;
    float _2131 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2133 = _359 * _2117;
    out.m_67.x = _1325;
    float _2135 = _1889 * 0.5;
    float _2137 = _2131 * _1965;
    float _2139 = _2119 + _1889;
    float _2141 = _1929 + _1889;
    float _2143 = -_2131;
    float _2145 = _2143 + 1.0;
    float _2147 = _1985 * _2137;
    float _2149 = fma(_1941, -0.5, _2135);
    float _2151 = _1975 * _2137;
    out.gl_Position.x = _1929;
    out.gl_Position.y = _1941;
    out.gl_Position.z = _2119;
    out.gl_Position.w = _1889;
    float _2153 = _2139 * 0.5;
    float _2155 = _2141 * 0.5;
    float _2157 = _2133 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2159 = fma(_1981, _2151, _1969);
    float _2161 = fma(_1983, _2151, _1971);
    float _2163 = _1975 * _2145;
    float _2165 = fma(_1975, _2147, _1973);
    out.m_67.z = _1319;
    out.m_69.x = _1381;
    out.m_71.x = _2155;
    out.m_71.y = _2149;
    out.m_71.z = _2153;
    out.m_71.w = _1889;
    out.m_47.x = _2157;
    out.m_73.x = _2159;
    out.m_73.y = _2161;
    out.m_73.z = _2165;
    out.m_73.w = _2163;
    if (_2129)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2167;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _835 = false;
    bool _675 = false;
    bool _541 = false;
    bool _381 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    if (!_101)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_101)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_111);
        out.gl_Position.z = _2222;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    float _115 = float(_97);
    float _117 = in.m_51.x;
    float _119 = -_113;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_113);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    out.m_53.x = _117;
    bool _133 = _121 >= _115;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = 1.0 / _115;
    float _141 = _113;
    if (_137)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    float _145 = _121 * _139;
    int _147 = 0;
    if (_137)
    {
        float _149 = _143 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    out.m_55.x = _145;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2297 = as_type<float>(_151);
        out.gl_Position.z = _2297;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    int _169 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _171 = _169 != 0;
    float _173 = _155 * _153;
    float _175 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _177 = _175 * 6.283185482025146484375;
    float _179 = floor(_175);
    float _181 = _177 * 0.15915493667125701904296875;
    float _183 = in.m_49.x;
    float _185 = in.m_49.y;
    float _187 = in.m_49.z;
    float _189 = _181 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = -_179;
    float _195 = _175 + _193;
    float _197 = _175;
    float _199 = _157;
    if (!_167)
    {
        float _201 = _157 * _157;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    float _207 = _205;
    if (!_167)
    {
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _209;
    }
    float _211 = _207;
    float _213 = fma(_191, 0.5, 0.5);
    bool _215 = !_167;
    float _217 = _211;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_167;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _157 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _199 = _271;
    }
    float _273 = _199;
    float _275 = in.m_57.w;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _279 = _277 != 0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _283 = _281 != 0;
    float _285 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _287 = _195 < 0.5;
    float _289 = float(_287);
    float _291 = -_195;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = in.m_44.x;
    float _297 = in.m_44.y;
    float _299 = in.m_44.z;
    bool _301 = !_279;
    int _303 = _301 ? 0 : 1;
    float _305 = -_213;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = -_289;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _313 = !_171;
    int _315 = _313 ? 0 : 1;
    int _317 = abs(_303);
    float _319 = fma(_273, _183, _285);
    bool _321 = !_283;
    int _323 = _321 ? 0 : 1;
    float _325 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _327 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _329 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _331 = abs(_315);
    float _333 = fma(_273, _185, _325);
    int _335 = abs(_323);
    float _337 = fma(_273, _187, _329);
    float _339 = float(_317);
    float _341 = float(_331);
    float _343 = abs(_293);
    float _345 = _339 * _343;
    float _347 = float(_335);
    float _349 = fma(_341, _307, _345);
    float _351 = fma(_319, _275, _295);
    float _353 = fma(_333, _275, _297);
    float _355 = fma(_337, _275, _299);
    float _357 = abs(_311);
    float _359 = fma(_347, _357, _349);
    bool _361 = !_327;
    bool _363 = false;
    float _379;
    if (!_361)
    {
        float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _367 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _369 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _371 = _369 * _365;
        float _373 = floor(_371);
        float _375 = -_373;
        float _377 = _371 + _375;
        _379 = _377;
        _381 = true;
    }
    else
    {
        _379 = _145;
    }
    _381 = false;
    float _383 = _379;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _387 = _383 + _385;
    bool _389 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _391 = isnan(_383);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _403 = _383 + _401;
    bool _405 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _407 = isnan(_383);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _425 = _383 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _427 = isnan(_383);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -_399;
    float _439 = _437 + 1.0;
    float _441 = 1.0 / _423;
    float _443 = _435 * _439;
    float _445 = -_435;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _449;
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _455 = 1.0 / _419;
    float _457 = _415 * _447;
    float _459 = -_415;
    float _461 = _459 + 1.0;
    float _463 = _387 * _455;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _469;
    float _473 = fma(_451, _463, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _475 = fma(_467, _463, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _477 = fma(_471, _463, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = _403 * _441;
    float _481 = _473 * _457;
    float _483 = _475 * _457;
    float _485 = _477 * _457;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _499 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _501 = fma(_489, _479, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _503 = fma(_493, _479, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _505 = fma(_497, _479, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _507 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].y, _483);
    float _509 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _511 = fma(_501, _443, _499);
    float _513 = fma(_503, _443, _507);
    float _515 = fma(_505, _443, _509);
    float _517 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].x, _511);
    float _519 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].y, _513);
    float _521 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[109].z, _515);
    bool _523 = !_453;
    float _539;
    if (!_523)
    {
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _527 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _531 = _529 * _525;
        float _533 = floor(_531);
        float _535 = -_533;
        float _537 = _531 + _535;
        _539 = _537;
        _541 = true;
    }
    else
    {
        _539 = _145;
    }
    _541 = false;
    float _543 = _539;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _543 + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _553 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _555 = isnan(_543);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _569 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _571 = isnan(_543);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _581;
    bool _585 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _587 = isnan(_543);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _551;
    float _599 = -_563;
    float _601 = _599 + 1.0;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _605 = _579 * _601;
    float _607 = -_579;
    float _609 = _607 + 1.0;
    float _611 = 1.0 / _567;
    float _613 = _583 * _597;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _619 = fma(_613, _547, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _621 = -_595;
    float _623 = _621 + 1.0;
    float _625 = _619 * _605;
    float _627 = _617 * _611;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _543 + _629;
    float _633 = _563 * _623;
    float _635 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[115].x, _625);
    float _637 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _639 = fma(_627, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _641 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _643 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _645 = fma(_639, _633, _635);
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[117].x, _645);
    float _653 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _647;
    out.m_59.y = _649;
    out.m_59.z = _653;
    out.m_59.w = _655;
    bool _657 = !_603;
    float _673;
    if (!_657)
    {
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _661 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _665 = _663 * _659;
        float _667 = floor(_665);
        float _669 = -_667;
        float _671 = _665 + _669;
        _673 = _671;
        _675 = true;
    }
    else
    {
        _673 = _145;
    }
    _675 = false;
    float _677 = _673;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _681 = _677 + _679;
    bool _683 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _685 = isnan(_677);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _697 = _677 + _695;
    bool _699 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _701 = isnan(_677);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _719 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _721 = isnan(_677);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -_693;
    float _733 = _731 + 1.0;
    float _735 = 1.0 / _717;
    float _737 = _729 * _733;
    float _739 = -_729;
    float _741 = _739 + 1.0;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _743;
    bool _747 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _749 = 1.0 / _713;
    float _751 = _709 * _741;
    float _753 = -_709;
    float _755 = _753 + 1.0;
    float _757 = _681 * _749;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _763;
    float _767 = fma(_745, _757, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _769 = fma(_761, _757, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _771 = fma(_765, _757, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _773 = _697 * _735;
    float _775 = _767 * _751;
    float _777 = _769 * _751;
    float _779 = _771 * _751;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _793 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[123].x, _775);
    float _795 = fma(_783, _773, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _797 = fma(_787, _773, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _799 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[123].y, _777);
    float _801 = fma(_791, _773, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _803 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[123].z, _779);
    float _805 = fma(_795, _737, _793);
    float _807 = fma(_797, _737, _799);
    float _809 = fma(_801, _737, _803);
    float _811 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[125].x, _805);
    float _813 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[125].y, _807);
    float _815 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[125].z, _809);
    bool _817 = !_747;
    float _833;
    if (!_817)
    {
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _821 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[11].w, _121);
        float _825 = _823 * _819;
        float _827 = floor(_825);
        float _829 = -_827;
        float _831 = _825 + _829;
        _833 = _831;
        _835 = true;
    }
    else
    {
        _833 = _145;
    }
    _835 = false;
    float _837 = _833;
    int _839 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _841 = _839;
    int _843 = 0;
    int _845 = _88(_841, _843, (*spvDescriptorSet0.support_buffer));
    float _847 = in.m_61.z;
    float _849 = 0.0 + _145;
    float _851 = precise::clamp(_849, 0.0, 1.0);
    float _853 = trunc(_847);
    int _855 = int(_853);
    int _857 = _845 + (-1);
    float _859 = float(_857);
    float _861 = _851 * _859;
    float _863 = trunc(_861);
    int _865 = int(_863);
    int _867 = _865;
    int _869 = 0;
    int _871 = _89(_867, _869, (*spvDescriptorSet0.support_buffer));
    int _873 = _855;
    int _875 = 0;
    int _877 = _89(_873, _875, (*spvDescriptorSet0.support_buffer));
    float4 _880 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_871, _877)), 0).xyzw;
    float _882 = _880.x;
    float _884 = _880.y;
    float _886 = _880.z;
    float _888 = _880.w;
    float _890 = in.m_51.z;
    float _892 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _896 = _894 != 0;
    float _898 = in.m_61.y;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _904 = in.m_61.x;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _908 = _906 != 0;
    float _910 = 1.0 / _902;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _918 = _916 != 0;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _922 = _920 != 0;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _926 = 0.0;
    float _928 = _898;
    if (_896)
    {
        float _930 = in.m_51.z;
        _926 = _930;
    }
    float _932 = _926;
    float _934 = 1.0 / _914;
    float _936 = -_924;
    float _938 = fma(_892, 2.0, _936);
    bool _940 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _942 = isnan(_837);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _952;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _958 = _956 != 0;
    float _960 = in.m_51.y;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _968 = _954 * _910;
    bool _970 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _972 = isnan(_837);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    bool _982 = _890 > 0.5;
    bool _984 = _982 && _922;
    bool _986 = _837 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _988 = isnan(_837);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = -_980;
    float _1000 = _998 + 1.0;
    float _1002 = _964 * _934;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1006 = _837 + _1004;
    float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _1010 = 0;
    bool _1012 = _984;
    float _1014 = _904;
    if (_896)
    {
        float _1016 = -_904;
        float _1018 = _1016 + 1.0;
        _1010 = as_type<int>(_1018);
    }
    int _1020 = _1010;
    int _1022 = 0;
    if (_918)
    {
        float _1024 = -_904;
        float _1026 = _1024 + 1.0;
        _1022 = as_type<int>(_1026);
    }
    int _1028 = _1022;
    float _1030 = fma(_968, _1006, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1032 = _966;
    if (_896)
    {
        bool _1034 = _932 > 0.5;
        _363 = _1034;
    }
    bool _1036 = _363;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1040 = _837 + _1038;
    float _1042 = _966 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    if (_984)
    {
        float _1044 = -_898;
        float _1046 = _1044 + 1.0;
        _928 = _1046;
    }
    float _1048 = _928;
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1052 = fma(_1002, _1040, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1054 = _996 * _1000;
    float _1056 = -_996;
    float _1058 = _1056 + 1.0;
    float _1060 = fma(_1042, _1048, -0.5);
    bool _1062 = _960 > 0.5;
    int _1064 = 0;
    float _1066 = _1058;
    float _1068 = _960;
    if (_908)
    {
        float _1070 = -_904;
        float _1072 = _1070 + 1.0;
        _1064 = as_type<int>(_1072);
    }
    int _1074 = _1064;
    float _1076 = _950 * _1058;
    float _1078 = -_950;
    float _1080 = _1078 + 1.0;
    float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1084 = _1076;
    float _1086 = as_type<float>(_1074);
    if (!_918)
    {
        _1032 = _904;
    }
    float _1088 = _1032;
    float _1090 = _1030 * _1076;
    float _1092 = _1088;
    if (!_896)
    {
        _1084 = _904;
    }
    float _1094 = _1084;
    float _1096 = _1094;
    if (_896)
    {
        float _1098 = _1036 ? as_type<float>(_1020) : _904;
        _1096 = _1098;
    }
    float _1100 = _1096;
    float _1102 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1090);
    if (_918)
    {
        float _1104 = _1062 ? as_type<float>(_1028) : _904;
        _1092 = _1104;
    }
    float _1106 = _1092;
    if (_908)
    {
        bool _1108 = _117 > 0.5;
        _1012 = _1108;
    }
    bool _1110 = _1012;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1114 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1112);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1120 = _1110;
    float _1122 = _1112;
    if (!_908)
    {
        _1066 = _904;
    }
    float _1124 = _1066;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1128 = _1124;
    if (_908)
    {
        float _1130 = _1110 ? as_type<float>(_1074) : _904;
        _1128 = _1130;
    }
    float _1132 = _1128;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    if (_958)
    {
        _1120 = false;
    }
    bool _1136 = _1120;
    bool _1138 = _1136;
    if (_958)
    {
        _1014 = _117;
    }
    float _1140 = _1014;
    float _1142 = _1140;
    if (_958)
    {
        _1086 = _960;
    }
    float _1144 = _1086;
    float _1146 = _1144;
    if (!_958)
    {
        float _1148 = _117 * 3.1415927410125732421875;
        float _1150 = _1148 * 0.15915493667125701904296875;
        float _1152 = _960 * 3.1415927410125732421875;
        float _1154 = _1152 * 0.15915493667125701904296875;
        float _1156 = _1150 * 6.283185482025146484375;
        float _1158 = sin(_1156);
        float _1160 = _1154 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        _1138 = true;
        _1146 = _1162;
        _1142 = _1158;
        _1122 = _1154;
    }
    bool _1164 = _1138;
    float _1166 = _1146;
    float _1168 = _1142;
    float _1170 = _1122;
    float _1172 = _1170;
    if (_1164)
    {
        _1172 = _960;
    }
    float _1174 = _1172;
    float _1176 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1178 = _1174;
    if (!_1164)
    {
        _1178 = _117;
    }
    float _1180 = _1178;
    float _1182 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1134);
    if (!_1164)
    {
        _1068 = _117;
    }
    float _1184 = _1068;
    float _1186 = fma(_1176, _1100, -0.5);
    float _1188 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    uint _1191 = as_type<uint>(half2(float2(_888, 0.0)));
    float _1193 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1195 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1118);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1199 = fma(_1188, -2.0, _1126);
    uint _1201 = extract_bits(_1191, 0u, 8u);
    int _1203 = int(_1201) & 255;
    uint _1205 = extract_bits(_1191, 8u, 8u);
    int _1207 = int(_1205) & 255;
    int _1209 = _1207 << 8;
    int _1211 = _1203 | _1209;
    float _1213 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1215 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1197);
    float _1217 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1219 = fma(_1193, _1132, -0.5);
    float _1221 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1182);
    float _1223 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1199);
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1227 = _1211 >= 32768;
    float _1229 = fma(_1052, _1054, _1102);
    float _1231 = -_1116;
    float _1233 = fma(_1213, 2.0, _1231);
    float _1235 = -_1225;
    float _1237 = fma(_1217, 2.0, _1235);
    float _1239 = -_1223;
    float _1241 = fma(_1221, _1060, _1239);
    float _1243 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1229);
    float _1245 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1195);
    float _1247 = -_121;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1233);
    float _1251 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1114);
    float _1253 = -_121;
    float _1255 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[76].x, _938);
    float _1257 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1215);
    float _1259 = -_121;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1237);
    int _1263 = _865 + 1;
    float _1265 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1267 = _811 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1269 = min(_857, _1263);
    float _1271 = fma(_1265, _1106, -0.5);
    int _1273 = _1211 + (-1024);
    float _1275 = _813 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1277 = _1273;
    if (_1227)
    {
        int _1279 = ~_1211;
        int _1281 = _1279 + 33792;
        int _1283 = _1281 + 1;
        _1277 = _1283;
    }
    int _1285 = _1277;
    float _1287 = fma(_1245, _1271, _1249);
    float _1289 = _815 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1291 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1293 = _1285 + 30719;
    float _1295 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1243 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1301 = float(_1293);
    float _1303 = _1287 + 0.5;
    float _1305 = _1241 + 0.5;
    float _1307 = fma(_1251, _1219, _1255);
    out.m_63.x = _1291;
    out.m_63.y = _1295;
    out.m_63.z = _1297;
    out.m_63.w = _1299;
    float _1309 = fma(_1301, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1311 = fma(_1257, _1186, _1261);
    out.m_65.x = _1303;
    out.m_65.y = _1305;
    float _1313 = abs(_1309);
    float _1315 = -_1313;
    float _1317 = _1315 + 1.0;
    float _1319 = _1311 + 0.5;
    int _1321 = as_type<int>(_1317) + (-218103808);
    bool _1323 = uint(_1321) >= 1920991232u;
    float _1325 = _1307 + 0.5;
    bool _1327 = !_1323;
    if (!_1327)
    {
        int _1329;
        _86(_1329, out.gl_Position, out.gl_PointSize);
    }
    int _1331 = _1269;
    int _1333 = 0;
    int _1335 = _89(_1331, _1333, (*spvDescriptorSet0.support_buffer));
    int _1337 = _855;
    int _1339 = 0;
    int _1341 = _89(_1337, _1339, (*spvDescriptorSet0.support_buffer));
    float4 _1343 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1335, _1341)), 0).xyzw;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = _1343.w;
    float _1353 = floor(_861);
    float _1355 = -_1353;
    float _1357 = _861 + _1355;
    uint _1359 = as_type<uint>(half2(float2(_1351, 0.0)));
    float _1361 = -_882;
    float _1363 = _1361 + _1345;
    float _1365 = -_886;
    float _1367 = _1365 + _1349;
    uint _1369 = extract_bits(_1359, 0u, 8u);
    int _1371 = int(_1369) & 255;
    uint _1373 = extract_bits(_1359, 8u, 8u);
    int _1375 = int(_1373) & 255;
    int _1377 = _1375 << 8;
    int _1379 = _1371 | _1377;
    float _1381 = fma(_1357, _1363, _882);
    bool _1383 = _1379 >= 32768;
    int _1385 = _1379 + (-1024);
    int _1387 = _1385;
    if (_1383)
    {
        int _1389 = ~_1379;
        int _1391 = _1389 + 33792;
        int _1393 = _1391 + 1;
        _1387 = _1393;
    }
    int _1395 = _1387;
    int _1397 = _1395 + 30719;
    float _1399 = float(_1397);
    float _1401 = fma(_1399, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1403 = abs(_1401);
    float _1405 = -_1403;
    float _1407 = _1405 + 1.0;
    int _1409 = as_type<int>(_1407) + (-218103808);
    bool _1411 = uint(_1409) >= 1920991232u;
    float _1413 = -_884;
    float _1415 = _1413 + _1347;
    float _1417 = fma(_1357, _1367, _886);
    float _1419 = fma(_1357, _1415, _884);
    bool _1421 = !_1411;
    if (!_1421)
    {
        int _1423;
        _86(_1423, out.gl_Position, out.gl_PointSize);
    }
    float _1425 = _353 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1427 = _353 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1429 = _353 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1431 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1425);
    float _1433 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1427);
    float _1435 = fma(_351, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1429);
    float _1437 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1431);
    float _1439 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1433);
    float _1441 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1435);
    float _1443 = _1437 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1445 = _1439 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1447 = _1441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1451 = _1443 + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1455 = _1445 + _1453;
    float _1457 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1459 = _1447 + _1457;
    float _1461 = _1451 * _1451;
    float _1463 = fma(_1455, _1455, _1461);
    float _1465 = fma(_1459, _1459, _1463);
    float _1467 = rsqrt(_1465);
    float _1469 = _1451 * _1467;
    float _1471 = _1455 * _1467;
    float _1473 = _1459 * _1467;
    float _1475 = -_1469;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
    float _1479 = -_1471;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1455);
    float _1483 = -_1473;
    float _1485 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1459);
    float _1487 = _1477 * _1477;
    float _1489 = in.m_57.x;
    float _1491 = in.m_57.y;
    float _1493 = in.m_57.z;
    float _1495 = fma(_1481, _1481, _1487);
    float _1497 = fma(_1485, _1485, _1495);
    float _1499 = sqrt(_1497);
    float _1501 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1417);
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1505 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1507 = _1467 * _1499;
    float _1509 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1511 = _1503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1419);
    float _1515 = _1505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1517 = _1509 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1519 = _1511 * _1507;
    float _1521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1381);
    float _1523 = _1515 * _1507;
    float _1525 = _1517 * _1507;
    float _1527 = _1519 * _1513;
    float _1529 = _1523 * _1521;
    float _1531 = _1525 * _1501;
    float _1533 = _1527 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1535 = _1527 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1537 = _1527 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1539 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1533);
    float _1541 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1535);
    float _1543 = fma(_1529, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1537);
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1539);
    float _1547 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1541);
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1543);
    float _1551 = _1447 + _1545;
    float _1553 = _1445 + _1547;
    float _1555 = _1443 + _1549;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1551 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1553 + _1561;
    float _1565 = _1559 * _1559;
    float _1567 = fma(_1563, _1563, _1565);
    float _1569 = sqrt(_1567);
    bool _1571 = _1569 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1573 = _1549;
    float _1575 = _1529;
    float _1577 = _1531;
    float _1579 = _1551;
    if (!_1571)
    {
        _1573 = _1553;
    }
    float _1581 = _1573;
    float _1583 = _1581;
    if (!_1571)
    {
        _1575 = _1551;
    }
    float _1585 = _1575;
    float _1587 = _1585;
    if (!_1571)
    {
        _1577 = _1555;
    }
    float _1589 = _1577;
    bool _1591 = !_1571;
    float _1593 = _1589;
    if (!_1591)
    {
        float _1595 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1599 = _1569 + _1597;
        float _1601 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = rsqrt(_1567);
        float _1605 = _1599 * _1595;
        float _1607 = _1605 * 0.15915493667125701904296875;
        float _1609 = _1607 * 6.283185482025146484375;
        float _1611 = sin(_1609);
        float _1613 = _1607 * 6.283185482025146484375;
        float _1615 = cos(_1613);
        float _1617 = fma(_1611, _1601, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1619 = _1603 * _1617;
        float _1621 = _1615 + (-1.0);
        float _1623 = fma(_1563, _1619, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1625 = fma(_1559, _1619, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1627 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1629 = fma(_1555, _1615, _1627);
        _1593 = _1629;
        _1583 = _1623;
        _1587 = _1625;
    }
    float _1631 = _1593;
    float _1633 = _1583;
    float _1635 = _1587;
    float _1637 = -_1469;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1631);
    float _1641 = -_1471;
    float _1643 = fma(_1641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1633);
    float _1645 = -_1473;
    float _1647 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1635);
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1651 = _1639 + _1649;
    float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1655 = _1643 + _1653;
    float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1659 = _1647 + _1657;
    float _1661 = _1651 * _1651;
    float _1663 = fma(_1655, _1655, _1661);
    float _1665 = fma(_1659, _1659, _1663);
    float _1667 = rsqrt(_1665);
    float _1669 = sqrt(_1665);
    float _1671 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1673 = _1655 * _1671;
    float _1675 = _1659 * _1671;
    float _1677 = _1673 * _1673;
    float _1679 = _1675 * _1675;
    float _1681 = _1677 + _1679;
    float _1683 = sqrt(_1681);
    bool _1685 = _1683 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1689 = _1683 + _1687;
    float _1691 = _1663;
    float _1693 = _1667;
    float _1695 = _1689;
    float _1697 = _1651;
    if (_1685)
    {
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1691 = _1699;
    }
    float _1701 = _1691;
    if (_1685)
    {
        float _1703 = rsqrt(_1681);
        _1693 = _1703;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (_1685)
    {
        float _1709 = _1689 * _1701;
        _1695 = _1709;
    }
    float _1711 = _1695;
    if (_1685)
    {
        float _1713 = _1711 * 0.15915493667125701904296875;
        _1579 = _1713;
    }
    float _1715 = _1579;
    float _1717 = _1659;
    float _1719 = _1715;
    if (_1685)
    {
        float _1721 = _1715 * 6.283185482025146484375;
        float _1723 = sin(_1721);
        _1717 = _1723;
    }
    float _1725 = _1717;
    float _1727 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1729 = precise::max(0.0, _1727);
    float _1731 = _1701;
    float _1733 = _1729;
    if (_1685)
    {
        float _1735 = _1715 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        _1731 = _1737;
    }
    float _1739 = _1731;
    float _1741 = -_1671;
    float _1743 = -_1729;
    float _1745 = fma(_1651, _1741, _1743);
    if (_1685)
    {
        float _1747 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1697 = _1747;
    }
    float _1749 = _1697;
    float _1751 = _1749;
    float _1753 = _1725;
    if (_1685)
    {
        float _1755 = fma(_1725, _1749, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1751 = _1755;
    }
    float _1757 = _1751;
    float _1759 = _1757;
    if (!_1685)
    {
        _1753 = _1673;
    }
    float _1761 = _1753;
    float _1763 = _1761;
    float _1765 = _1739;
    if (_1685)
    {
        float _1767 = _1739 + (-1.0);
        _1733 = _1767;
    }
    float _1769 = _1733;
    float _1771 = _1769;
    if (_1685)
    {
        float _1773 = _1705 * _1757;
        _1759 = _1773;
    }
    float _1775 = _1759;
    float _1777 = _1775;
    if (!_1685)
    {
        _1707 = _1745;
    }
    float _1779 = _1707;
    float _1781 = _1779;
    if (_1685)
    {
        float _1783 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1783;
    }
    float _1785 = _1719;
    if (_1685)
    {
        float _1787 = _1673 * _1775;
        _1763 = _1787;
    }
    float _1789 = _1763;
    if (!_1685)
    {
        _1771 = _1675;
    }
    float _1791 = _1771;
    float _1793 = _1791;
    if (_1685)
    {
        float _1795 = _1675 * _1775;
        _1793 = _1795;
    }
    float _1797 = _1793;
    if (!_1685)
    {
        _1777 = _1677;
    }
    float _1799 = _1777;
    float _1801 = _1799;
    if (_1685)
    {
        float _1803 = fma(_1745, _1739, _1785);
        _1781 = _1803;
    }
    float _1805 = _1781;
    if (_1685)
    {
        float _1807 = _1789 * _1789;
        _1801 = _1807;
    }
    float _1809 = _1801;
    float _1811 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1685)
    {
        _1765 = _1679;
    }
    float _1813 = _1765;
    float _1815 = _1813;
    if (_1685)
    {
        float _1817 = _1797 * _1797;
        _1815 = _1817;
    }
    float _1819 = _1815;
    float _1821 = fma(_1805, _1805, _1809);
    float _1823 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1825 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1811);
    float _1827 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1829 = _1821 + _1819;
    float _1831 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1823);
    float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1835 = fma(_1669, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1833);
    float _1837 = precise::clamp(_1835, 0.0, 1.0);
    float _1839 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1827);
    float _1841 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1825);
    float _1843 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1831);
    float _1845 = rsqrt(_1829);
    float _1847 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1849 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1839);
    float _1851 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1853 = _1841 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1855 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1847);
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1861 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1863 = -_1837;
    float _1865 = _1863 + 1.0;
    float _1867 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1869 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1855);
    float _1871 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    float _1873 = -_1867;
    float _1875 = fma(_1873, _1861, 1.0);
    float _1877 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1879 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1871);
    float _1881 = abs(_1865);
    float _1883 = log2(_1881);
    float _1885 = _1845 * _1789;
    float _1887 = _1845 * _1797;
    float _1889 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1879);
    float _1891 = _1845 * _1805;
    float _1893 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1895 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1897 = 1.0 / _1889;
    float _1899 = -_1893;
    float _1901 = fma(_1891, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1899);
    float _1903 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1895);
    float _1905 = _1891 + 1.0;
    float _1907 = -_1887;
    float _1909 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1901);
    float _1911 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1913 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1915 = fma(_1909, -0.5, 0.5);
    float _1917 = log2(_1875);
    float _1919 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1911);
    float _1921 = fma(_1909, 0.5, 0.5);
    float _1923 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1919);
    float _1925 = fma(_1921, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1927 = exp2(_1913);
    float _1929 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1923);
    float _1931 = fma(_1921, _1925, -0.212114393711090087890625);
    float _1933 = fma(_1921, _1931, 1.570728778839111328125);
    float _1935 = sqrt(_1915);
    float _1937 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1903);
    float _1939 = _1917 * 0.693147182464599609375;
    float _1941 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1937);
    float _1943 = _1929 * _1897;
    float _1945 = -_1891;
    float _1947 = fma(_1927, _1905, _1945);
    float _1949 = _1941 * _1897;
    float _1951 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1953 = fma(_1943, 0.5, 0.5);
    float _1955 = fma(_1947, 0.5, 0.5);
    float _1957 = fma(_1949, -0.5, 0.5);
    float _1959 = _1935 * 0.636619746685028076171875;
    float _1961 = -_1933;
    float _1963 = fma(_1959, _1961, 1.0);
    float3 _5179 = float3(_1953, _1957, _1951);
    float _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5179, float3(0.0), isnan(_5179)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5179, float3(0.0), isnan(_5179)), level(0.0)).x;
    float3 _5190 = float3(_1953, _1957, _1951);
    float4 _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5190, float3(0.0), isnan(_5190)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5190, float3(0.0), isnan(_5190)), level(0.0)).xyzw;
    float _1969 = _1967.x;
    float _1971 = _1967.y;
    float _1973 = _1967.z;
    float _1975 = _1967.w;
    float2 _5206 = float2(_1963, _1955);
    float3 _1979 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5206, float2(0.0), isnan(_5206)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5206, float2(0.0), isnan(_5206)), level(0.0)).xyz;
    float _1981 = _1979.x;
    float _1983 = _1979.y;
    float _1985 = _1979.z;
    float _1987 = -_1469;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1443);
    float _1991 = -_1471;
    float _1993 = fma(_1991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1445);
    float _1995 = -_1473;
    float _1997 = fma(_1995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1447);
    float _1999 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2001 = _1989 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2003 = _1989 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2005 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2007 = isnan(0.5);
    bool _2009 = _2005 || _2007;
    bool _2011 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2013 = _2009 || _2011;
    float _2015 = _1851 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2017 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2001);
    float _2019 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2003);
    float _2021 = exp2(_1999);
    float _2023 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2015);
    float _2025 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2017);
    float _2027 = fma(_1997, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2019);
    float _2029 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2023);
    float _2031 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2033 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2035 = 1.0 / _2031;
    float _2037 = _2033 + _2031;
    float _2039 = _2031;
    if (_2013)
    {
        _2039 = 1.0;
    }
    float _2041 = _2039;
    float _2043 = _2037 * _2035;
    float _2045 = _2043 * 0.5;
    float _2047 = _2041;
    if (!_2013)
    {
        float _2049 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2051 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2053 = _2049 * 0.15915493667125701904296875;
        float _2055 = _2051 * 0.15915493667125701904296875;
        float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2059 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2057);
        float _2061 = _2053 * 6.283185482025146484375;
        float _2063 = cos(_2061);
        float _2065 = _2053 * 6.283185482025146484375;
        float _2067 = sin(_2065);
        float _2069 = 1.0 / _2063;
        float _2071 = _2055 * 6.283185482025146484375;
        float _2073 = cos(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = _2055 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = 1.0 / _2059;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2087 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2085;
        float _2089 = 1.0 / _2081;
        float _2091 = 1.0 / _2087;
        float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2095 = _2083 * _2093;
        float _2097 = _2079 * _2089;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2101 = fma(_2097, _2095, _2099);
        float _2103 = _2101 * _2091;
        float _2105 = precise::clamp(_2103, 0.0, 1.0);
        float _2107 = -_2105;
        float _2109 = _2107 + 1.0;
        _2047 = _2109;
    }
    float _2111 = _2047;
    float _2113 = -_2021;
    float _2115 = _2113 + 1.0;
    float _2117 = _2111 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2119 = fma(_1877, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2029);
    bool _2121 = _2111 > 0.0;
    bool _2123 = isnan(_2111);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan(0.0);
    bool _2129 = _2125 || _2127;
    float _2131 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2133 = _359 * _2117;
    out.m_67.x = _1325;
    float _2135 = _1889 * 0.5;
    float _2137 = _2131 * _1965;
    float _2139 = _2119 + _1889;
    float _2141 = _1929 + _1889;
    float _2143 = -_2131;
    float _2145 = _2143 + 1.0;
    float _2147 = _1985 * _2137;
    float _2149 = fma(_1941, -0.5, _2135);
    float _2151 = _1975 * _2137;
    out.gl_Position.x = _1929;
    out.gl_Position.y = _1941;
    out.gl_Position.z = _2119;
    out.gl_Position.w = _1889;
    float _2153 = _2139 * 0.5;
    float _2155 = _2141 * 0.5;
    float _2157 = _2133 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2159 = fma(_1981, _2151, _1969);
    float _2161 = fma(_1983, _2151, _1971);
    float _2163 = _1975 * _2145;
    float _2165 = fma(_1975, _2147, _1973);
    out.m_67.z = _1319;
    out.m_69.x = _1381;
    out.m_71.x = _2155;
    out.m_71.y = _2149;
    out.m_71.z = _2153;
    out.m_71.w = _1889;
    out.m_47.x = _2157;
    out.m_73.x = _2159;
    out.m_73.y = _2161;
    out.m_73.z = _2165;
    out.m_73.w = _2163;
    if (_2129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2167;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

