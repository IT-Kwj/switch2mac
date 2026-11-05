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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _86(thread const int& _5565, thread const int& _5566, constant _10& support_buffer)
{
    float _5569 = as_type<float>(support_buffer._m4);
    int _5571 = _5566 + as_type<int>(_5569);
    int _5573 = 1 + _5571;
    float _5575 = support_buffer._m5[_5573].x;
    float _5577 = abs(_5575);
    bool _5579 = _5577 == 1.0;
    if (_5579)
    {
        return _5565;
    }
    float _5581 = float(_5565);
    float _5583 = _5581 / _5577;
    int _5585 = int(_5583);
    return _5585;
}

static inline __attribute__((always_inline))
int _87(thread const int& _5615, thread const int& _5616, constant _10& support_buffer)
{
    float _5619 = as_type<float>(support_buffer._m4);
    int _5621 = _5616 + as_type<int>(_5619);
    int _5623 = 1 + _5621;
    float _5625 = support_buffer._m5[_5623].x;
    bool _5627 = _5625 == 1.0;
    if (_5627)
    {
        return _5615;
    }
    float _5629 = float(_5615);
    float _5631 = _5629 * _5625;
    int _5633 = int(_5631);
    return _5633;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1574 = false;
    bool _433 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_111);
        out.gl_Position.z = _2238;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_51.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_149);
        out.gl_Position.z = _2308;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_53.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _171 = _155 * _153;
    float _173 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _175 = 0.0;
    if (!_167)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _175 = _179;
    }
    float _181 = _175;
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _171);
    float _185 = _173 * _169;
    float _187 = _181;
    if (!_167)
    {
        float _189 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    float _193 = _183 * 6.283185482025146484375;
    float _195 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].y, _185);
    float _197 = floor(_183);
    float _199 = _193 * 0.15915493667125701904296875;
    float _201 = _195 * 6.283185482025146484375;
    float _203 = in.m_51.x;
    float _205 = in.m_51.y;
    float _207 = in.m_51.z;
    float _209 = _201 * 0.15915493667125701904296875;
    float _211 = floor(_195);
    int _213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _215 = _213 != 0;
    float _217 = 1.4012984643248170709237295832899e-45;
    float _219 = _191;
    if (!_167)
    {
        _217 = _157;
    }
    float _221 = _217;
    float _223 = _199 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = -_197;
    float _229 = _183 + _227;
    float _231 = _209 * 6.283185482025146484375;
    float _233 = cos(_231);
    float _235 = -_211;
    float _237 = _195 + _235;
    bool _239 = !_167;
    float _241 = _221;
    if (!_239)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = _157 * _245;
        float _255 = 1.0 / _249;
        float _257 = _251 * 0.693147182464599609375;
        float _259 = exp2(_253);
        float _261 = 1.0 / _257;
        float _263 = _259 + (-1.0);
        float _265 = -_263;
        float _267 = fma(_265, _261, _157);
        float _269 = _267 * _255;
        float _271 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _271;
    }
    float _273 = _219;
    bool _275 = !_167;
    if (!_275)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _157 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _241 = _295;
    }
    float _297 = _241;
    float _299 = in.m_55.w;
    float _301 = in.m_46.x;
    float _303 = in.m_46.y;
    float _305 = in.m_46.z;
    bool _307 = _229 < 0.5;
    float _309 = float(_307);
    float _311 = -_229;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _315 = fma(_225, 0.5, 0.5);
    bool _317 = _237 < 0.5;
    float _319 = float(_317);
    float _321 = fma(_233, 0.5, 0.5);
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _325 = _323 != 0;
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _329 = _327 != 0;
    float _331 = -_309;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = -_315;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _339 = -_237;
    float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _343 = -_319;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _347 = -_321;
    float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _351 = !_325;
    int _353 = _351 ? 0 : 1;
    float _355 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _359 = !_215;
    int _361 = _359 ? 0 : 1;
    float _363 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _365 = abs(_353);
    float _367 = fma(_297, _205, _355);
    float _369 = fma(_297, _203, _357);
    bool _371 = !_329;
    int _373 = _371 ? 0 : 1;
    float _375 = fma(_297, _207, _363);
    float _377 = fma(_369, _299, _301);
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _381 = fma(_375, _299, _305);
    int _383 = abs(_361);
    float _385 = float(_365);
    int _387 = abs(_373);
    float _389 = float(_383);
    float _391 = abs(_313);
    float _393 = _385 * _391;
    float _395 = abs(_341);
    float _397 = _385 * _395;
    float _399 = float(_387);
    float _401 = fma(_389, _337, _393);
    float _403 = fma(_389, _349, _397);
    float _405 = fma(_367, _299, _303);
    float _407 = abs(_333);
    float _409 = fma(_399, _407, _401);
    float _411 = abs(_345);
    float _413 = fma(_399, _411, _403);
    bool _415 = !_379;
    float _431;
    if (!_415)
    {
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _419 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_95);
        float _437 = 1.0 / _435;
        float _439 = _129 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    int _443 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _445 = _443;
    int _447 = 0;
    int _449 = _86(_445, _447, (*spvDescriptorSet0.support_buffer));
    float _451 = _151 * 8.0;
    float _453 = in.m_57.z;
    float _455 = in.m_57.y;
    float _457 = rint(_451);
    float _459 = in.m_53.y;
    float _461 = in.m_59.x;
    float _463 = in.m_59.z;
    float _465 = in.m_59.y;
    float _467 = _457 * 0.125;
    float _469 = precise::clamp(_467, 0.0, 1.0);
    float _471 = in.m_59.w;
    int _473 = _449 + (-1);
    float _475 = trunc(_453);
    int _477 = int(_475);
    float _479 = float(_473);
    float _481 = _469 * _479;
    float _483 = trunc(_481);
    int _485 = int(_483);
    int _487 = _485 + 1;
    int _489 = min(_473, _487);
    int _491 = _485;
    int _493 = 0;
    int _495 = _87(_491, _493, (*spvDescriptorSet0.support_buffer));
    int _497 = _477;
    int _499 = 0;
    int _501 = _87(_497, _499, (*spvDescriptorSet0.support_buffer));
    float3 _505 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_495, _501)), 0).xyz;
    float _507 = _505.x;
    float _509 = _505.y;
    float _511 = _505.z;
    int _513 = _489;
    int _515 = 0;
    int _517 = _87(_513, _515, (*spvDescriptorSet0.support_buffer));
    int _519 = _477;
    int _521 = 0;
    int _523 = _87(_519, _521, (*spvDescriptorSet0.support_buffer));
    float3 _525 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_517, _523)), 0).xyz;
    float _527 = _525.x;
    float _529 = _525.y;
    float _531 = _525.z;
    float _533 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _545 = _543 != 0;
    float _547 = in.m_53.z;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _551 = _549 != 0;
    float _553 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _555 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _557 = -_455;
    float _559 = _557 + 1.0;
    float _561 = _151 * 2.0;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _565 = _563 != 0;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _567;
    bool _571 = _459 > 0.5;
    float _573 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    float _575 = floor(_561);
    float _577 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _581 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _583 = _455;
    if (_551)
    {
        float _585 = _571 ? _559 : _455;
        _583 = _585;
    }
    float _587 = _583;
    float _589 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
    float _591 = -_579;
    float _593 = fma(_577, 2.0, _591);
    float _595 = 1.0 / _569;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _601 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _581);
    float _603 = _459 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _605 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _573);
    float _607 = 1.0 / _599;
    float _609 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_61.x = _461;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _615 = fma(_603, -2.0, _611);
    float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _625 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _633 = _441 + _631;
    float _635 = in.m_57.x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _639 = _441 + _637;
    bool _641 = _151 > 0.5;
    bool _643 = _641 && _565;
    float _645 = _633 * _595;
    out.m_63.x = _625;
    out.m_63.y = _627;
    out.m_63.z = _629;
    out.m_63.w = _623;
    float _647 = _151 + _459;
    float _649 = _639 * _607;
    bool _651 = _575 >= 0.0;
    bool _653 = isnan(_575);
    bool _655 = _651 || _653;
    bool _657 = isnan(0.0);
    bool _659 = _655 || _657;
    float _661 = _617 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _663 = _647 + (-1.0);
    float _665 = _459 * 2.0;
    out.m_61.z = _463;
    float _667 = fma(_661, _587, -0.5);
    float _669 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _671 = floor(_665);
    out.m_61.y = _465;
    float _673 = _151 + _547;
    float _675 = _459 + _547;
    float _677 = _547 * 2.0;
    float _679 = _673 + (-1.0);
    float _681 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _683 = log2(_681);
    float _685 = _675 + (-1.0);
    float _687 = _663;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (_565)
    {
        _687 = _635;
    }
    float _691 = _687;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _695 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _699 = _691;
    if (!_565)
    {
        _689 = _635;
    }
    float _701 = _689;
    float _703 = _701;
    if (_643)
    {
        float _705 = -_691;
        float _707 = _705 + 1.0;
        _699 = _707;
    }
    float _709 = _699;
    float _711 = _695 * _151;
    float _713 = floor(_677);
    bool _715 = _671 >= 0.0;
    bool _717 = isnan(_671);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _729;
    float _733 = _683 * _129;
    if (_565)
    {
        _703 = _709;
    }
    float _735 = _703;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _739 = trunc(_711);
    int _741 = int(_739);
    bool _743 = _671 > 0.0;
    out.m_61.w = _471;
    int _745 = _659 ? 0 : 1;
    float _747 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[79].z, _737);
    int _749 = _723 ? 0 : 1;
    float _751 = fma(_727, _645, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _753 = _575 > 0.0;
    float _755 = exp2(_733);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _765 = _713 > 0.0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _767;
    float _771 = fma(_759, _649, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _773 = _713 >= 0.0;
    bool _775 = isnan(_713);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _787 = _741 << 4;
    int _789 = _787 + 1968;
    float _791 = fma(_769, _645, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _793 = fma(_785, _649, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    uint _796 = uint(int(uint(_789) >> uint(2)));
    uint _798 = uint(int(uint(int(_796)) >> uint(2)));
    int _800 = int(_796) & 3;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[int(_798)][_800];
    int _804 = int(_796) + 1;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    int _808 = _804 & 3;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[int(_806)][_808];
    float _812 = fma(_731, _645, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _814 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _816 = isnan(_441);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = fma(_763, _649, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _828 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _830 = isnan(_441);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _842 = 1.0 + _840;
    bool _844 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _846 = isnan(_441);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    int _856 = _789 + 8;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[int(_860)][_862];
    bool _866 = !_541;
    int _868 = _866 ? 0 : 1;
    float _870 = -_755;
    float _872 = _870 + 1.0;
    bool _874 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _882 = _878 || _880;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _886 = 1.0 / _842;
    float _888 = -_854;
    float _890 = _888 + 1.0;
    float _892 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _747);
    float _894 = _882 ? _872 : 0.0;
    float _896 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _884);
    bool _898 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _900 = isnan(1.0);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _906 = _902 || _904;
    float _908 = _892 * (-0.15915493667125701904296875);
    float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _912 = _838 * _890;
    float _914 = -_838;
    float _916 = _914 + 1.0;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _920 = -_129;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[76].x, _593);
    float _924 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _615);
    float _926 = _824 * _916;
    float _928 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[78].w, _918);
    float _930 = _908 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _896);
    float _936 = _751 * _926;
    float _938 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _928);
    if (_906)
    {
        float _940 = _894 * _886;
        _131 = _940;
    }
    float _942 = _131;
    float _944 = _791 * _926;
    float _946 = _812 * _926;
    int _948 = ~_745;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    float _954 = _908 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = _910 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _960 = abs(_868);
    float _962 = _605 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _964 = _952;
    if (!_753)
    {
        int _966 = ~_745;
        int _968 = _966 + 1;
        _964 = _968;
    }
    int _970 = _964;
    float _972 = fma(_958, _735, -0.5);
    float _974 = float(_960);
    float _976 = _589 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _978 = _932 * _667;
    float _980 = float(_970);
    float _982 = _609 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _984 = _802 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _986 = _810 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _988 = ~_749;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = _459 + (-0.5);
    int _996 = _992;
    if (!_743)
    {
        int _998 = ~_749;
        int _1000 = _998 + 1;
        _996 = _1000;
    }
    int _1002 = _996;
    float _1004 = _984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1006 = _781 ? 0 : 1;
    float _1008 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1012 = _956 * _667;
    float _1014 = -_978;
    float _1016 = fma(_956, _972, _1014);
    float _1018 = _974 * _980;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _962 + _1022;
    int _1026 = ~_1006;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    float _1032 = fma(_932, _972, _1012);
    int _1034 = _1030;
    if (!_765)
    {
        int _1036 = ~_1006;
        int _1038 = _1036 + 1;
        _1034 = _1038;
    }
    int _1040 = _1034;
    out.m_65.x = _1004;
    out.m_65.y = _1008;
    out.m_65.z = _1020;
    bool _1042 = !_545;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1048 = _976 + _1046;
    bool _1050 = !_537;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = in.m_67.x;
    float _1056 = in.m_67.y;
    float _1058 = in.m_67.z;
    int _1060 = abs(_1044);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _982 + _1062;
    float _1066 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1068 = _547 + (-0.5);
    float _1070 = float(_1060);
    float _1072 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1066);
    float _1074 = _1024 * _1024;
    int _1076 = abs(_1052);
    float _1078 = -_924;
    float _1080 = fma(_938, _1032, _1078);
    float _1082 = float(_1002);
    float _1084 = fma(_1048, _1048, _1074);
    float _1086 = float(_1076);
    float _1088 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1072);
    float _1090 = float(_1040);
    float _1092 = fma(_1064, _1064, _1084);
    float _1094 = fma(_934, _1016, _922);
    float _1096 = _1018 * (-2.0);
    float _1098 = _1070 * _1082;
    float _1100 = _1086 * _1090;
    bool _1102 = _1088 >= 0.0;
    float _1104 = rsqrt(_1092);
    float _1106 = fma(_697, _1096, _697);
    float _1108 = fma(_1096, _1056, _1056);
    float _1110 = _1100 * (-2.0);
    float _1112 = _1098 * (-2.0);
    float _1114 = _1094 + 0.5;
    float _1116 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1108);
    float _1118 = fma(_669, _1110, _669);
    float _1120 = fma(_1110, _1054, _1054);
    float _1122 = _151 + (-0.5);
    float _1124 = fma(_1106, _942, _1116);
    float _1126 = fma(_1112, _1058, _1058);
    float _1128 = _1080 + 0.5;
    float _1130 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1120);
    float _1132 = _1124 * 0.15915493667125701904296875;
    float _1134 = fma(_693, _1112, _693);
    float _1136 = _1024 * _1104;
    float _1138 = _1048 * _1104;
    float _1140 = _1064 * _1104;
    float _1142 = fma(_1118, _942, _1130);
    float _1144 = -_1136;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1148 = -_1138;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1152 = -_1140;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1064);
    float _1156 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1126);
    float _1158 = _1146 * _1146;
    float _1160 = in.m_55.x;
    float _1162 = in.m_55.y;
    float _1164 = in.m_55.z;
    float _1166 = _1100;
    if (_1102)
    {
        _1166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1168 = _1166;
    float _1170 = _1132 * 6.283185482025146484375;
    float _1172 = sin(_1170);
    float _1174 = fma(_1150, _1150, _1158);
    out.m_69.x = _1114;
    out.m_69.y = _1128;
    int _1176 = as_type<int>(_1168);
    if (_1102)
    {
        float _1178 = _1168 * 5.0;
        _1176 = as_type<int>(_1178);
    }
    int _1180 = _1176;
    float _1182 = fma(_1154, _1154, _1174);
    if (_1102)
    {
        out.m_49.x = 0.0;
    }
    float _1184 = _1132 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = sqrt(_1182);
    if (_1102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3884 = as_type<float>(_1180);
        out.gl_Position.z = _3884;
    }
    float _1190 = _1164;
    if (_1102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1192 = -_1136;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _1196 = -_824;
    float _1198 = _1196 + 1.0;
    float _1200 = -_1138;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1204 = -_1140;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1210 = _1194 + _1208;
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[143].y, _944);
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = _1202 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1206 + _1218;
    float _1222 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1224 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[143].x, _936);
    float _1226 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[143].z, _946);
    float _1228 = fma(_793, _912, _1212);
    float _1230 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1222);
    float _1232 = fma(_771, _912, _1224);
    float _1234 = _1142 * 0.15915493667125701904296875;
    float _1236 = fma(_1134, _942, _1156);
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1230);
    float _1240 = fma(_826, _912, _1226);
    float _1242 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1232);
    float _1244 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1228);
    float _1246 = _1234 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    bool _1250 = _1238 >= 0.0;
    float _1252 = _1236 * 0.15915493667125701904296875;
    float _1254 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[145].z, _1240);
    float _1256 = _1242 * _1160;
    float _1258 = _1244 * _1162;
    float _1260 = _1104 * _1188;
    float _1262 = _1254 * _1164;
    float _1264 = _1234 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = _413 * _1258;
    float _1270 = _409 * _1256;
    float _1272 = _1206;
    if (_1250)
    {
        _1190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1274 = _1190;
    int _1276 = as_type<int>(_1274);
    if (_1250)
    {
        out.m_49.x = 0.0;
    }
    float _1278 = _1252 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1248 * _1172;
    if (_1250)
    {
        float _1284 = _1274 * 5.0;
        _1276 = as_type<int>(_1284);
    }
    int _1286 = _1276;
    float _1288 = floor(_481);
    float _1290 = _1266 * _1186;
    if (_1250)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4064 = as_type<float>(_1286);
        out.gl_Position.z = _4064;
    }
    float _1292 = fma(_1280, _1290, _1282);
    float _1294 = fma(_1280, _1282, _1290);
    float _1296 = -_1288;
    float _1298 = _481 + _1296;
    if (_1250)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1300 = _1252 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = -_509;
    float _1306 = _1304 + _529;
    float _1308 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1310 = _1266 * _1172;
    float _1312 = _1248 * _1186;
    float _1314 = fma(_1298, _1306, _509);
    float _1316 = -_507;
    float _1318 = _1316 + _527;
    float _1320 = _1260 * _1308;
    float _1322 = -_1310;
    float _1324 = fma(_1280, _1312, _1322);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1314);
    float _1328 = -_1312;
    float _1330 = fma(_1280, _1310, _1328);
    float _1332 = -_511;
    float _1334 = _1332 + _531;
    float _1336 = fma(_1298, _1318, _507);
    float _1338 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1340 = _1326 * _1320;
    float _1342 = fma(_1298, _1334, _511);
    float _1344 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1346 = _1260 * _1338;
    float _1348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1336);
    float _1350 = _1302 * _1340;
    float _1352 = _1172 * _1302;
    float _1354 = _1186 * _1302;
    float _1356 = _1260 * _1344;
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1342);
    float _1360 = _1348 * _1346;
    float _1362 = _1266 * _1350;
    float _1364 = -_1340;
    float _1366 = _1280 * _1364;
    float _1368 = _1358 * _1356;
    float _1370 = _1248 * _1350;
    float _1372 = fma(_1292, _1360, _1362);
    float _1374 = fma(_1354, _1360, _1366);
    float _1376 = fma(_1324, _1360, _1370);
    float _1378 = fma(_1330, _1368, _1372);
    float _1380 = fma(_1352, _1368, _1374);
    float _1382 = fma(_1294, _1368, _1376);
    float _1384 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1388 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1386);
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1388);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1390);
    float _1396 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1398 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1400 = _976 + _1396;
    float _1402 = _982 + _1398;
    float _1404 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1408 = _1400 + _1406;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1412 = _1402 + _1410;
    float _1414 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1404);
    float _1416 = _1408 * _1408;
    float _1418 = _1412 * _1412;
    float _1420 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1414);
    float _1422 = _1416 + _1418;
    float _1424 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1426 = sqrt(_1422);
    float _1428 = _962 + _1424;
    bool _1430 = _1426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1432 = _1424;
    float _1434 = _1420;
    float _1436 = _1402;
    float _1438 = _1418;
    float _1440 = _1400;
    float _1442 = _1412;
    float _1444 = _1330;
    if (!_1430)
    {
        _1432 = _1402;
    }
    float _1446 = _1432;
    float _1448 = _1446;
    if (!_1430)
    {
        _1434 = _1416;
    }
    float _1450 = _1434;
    float _1452 = _1450;
    if (!_1430)
    {
        _1436 = _1428;
    }
    float _1454 = _1436;
    bool _1456 = !_1430;
    float _1458 = _1454;
    if (!_1456)
    {
        float _1460 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1464 = _1426 + _1462;
        float _1466 = rsqrt(_1422);
        float _1468 = _1464 * _1460;
        float _1470 = _1428 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = _1468 * 0.15915493667125701904296875;
        float _1474 = _1472 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = _1472 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = fma(_1476, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1484 = _1466 * _1482;
        float _1486 = _1480 + (-1.0);
        float _1488 = fma(_1408, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1490 = fma(_1412, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1492 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1496 = _1488 + _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1500 = _1490 + _1498;
        float _1502 = fma(_1428, _1480, _1492);
        float _1504 = _1496 * _1496;
        float _1506 = _1500 * _1500;
        _1458 = _1502;
        _1452 = _1504;
        _1438 = _1506;
        _1440 = _1488;
        _1448 = _1490;
    }
    float _1508 = _1458;
    float _1510 = _1452;
    float _1512 = _1438;
    float _1514 = _1440;
    float _1516 = _1448;
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1520 = _1508 + _1518;
    float _1522 = fma(_1520, _1520, _1510);
    float _1524 = _1522 + _1512;
    float _1526 = sqrt(_1524);
    bool _1528 = _1526 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1530 = isnan(_1526);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1536 = _1532 || _1534;
    float _1538 = _1510;
    if (!_1536)
    {
        _1538 = 1.0;
    }
    float _1540 = _1538;
    bool _1542 = !_1536;
    float _1544 = _1540;
    if (!_1542)
    {
        bool _1546 = _1526 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1548 = isnan(_1526);
        bool _1550 = _1546 || _1548;
        bool _1552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1554 = _1550 || _1552;
        if (!_1554)
        {
            float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1558 = _1526 + _1556;
            float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1562 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1560;
            float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1568 = 1.0 / _1562;
            float _1570 = _1558 * _1568;
            float _1572 = fma(_1570, _1566, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1544 = _1572;
            _1574 = true;
        }
        else
        {
            bool _1576 = _1526 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1578 = isnan(_1526);
            bool _1580 = _1576 || _1578;
            bool _1582 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1584 = _1580 || _1582;
            if (!_1584)
            {
                float _1586 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1588 = _1526 + _1586;
                float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1592 = _1590 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1596 = _1594 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1598 = 1.0 / _1592;
                float _1600 = _1588 * _1598;
                float _1602 = fma(_1600, _1596, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1544 = _1602;
                _1574 = true;
            }
            else
            {
                _1544 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1574 = false;
    float _1604 = _1544;
    float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1608 = _1508 + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1612 = _1514 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1616 = _1516 + _1614;
    bool _1618 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(0.5);
    bool _1626 = _1622 || _1624;
    float _1628 = fma(_1608, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1630 = fma(_1612, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1632 = fma(_1616, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1634 = -_1136;
    float _1636 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1628);
    float _1638 = -_1138;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1630);
    float _1642 = -_1140;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1632);
    float _1646 = _1636;
    float _1648 = _1640;
    float _1650 = _1644;
    if (!_1626)
    {
        float _1652 = _1210 * _1210;
        float _1654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1656 = -_982;
        float _1658 = _1656 + _1632;
        float _1660 = -_976;
        float _1662 = _1660 + _1630;
        float _1664 = fma(_1216, _1216, _1652);
        float _1666 = fma(_1220, _1220, _1664);
        float _1668 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1670 = sqrt(_1666);
        float _1672 = 1.0 / _1260;
        float _1674 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1676 = precise::min(_1670, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1678 = _1676 * _1654;
        float _1680 = _1678 * _1672;
        float _1682 = -_962;
        float _1684 = _1682 + _1628;
        float _1686 = _1674 * _1680;
        float _1688 = _1658 * _1680;
        float _1690 = fma(_1684, _1686, _1194);
        float _1692 = fma(_1662, _1686, _1202);
        float _1694 = fma(_1674, _1688, _1206);
        _1646 = _1690;
        _1648 = _1692;
        _1650 = _1694;
    }
    float _1696 = _1646;
    float _1698 = _1648;
    float _1700 = _1650;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1696 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1708 = _1698 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1700 + _1710;
    float _1714 = _1704 * _1704;
    float _1716 = fma(_1708, _1708, _1714);
    float _1718 = fma(_1712, _1712, _1716);
    float _1720 = rsqrt(_1718);
    float _1722 = sqrt(_1718);
    float _1724 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1726 = _1708 * _1724;
    float _1728 = _1712 * _1724;
    float _1730 = _1726 * _1726;
    float _1732 = _1728 * _1728;
    float _1734 = _1730 + _1732;
    float _1736 = sqrt(_1734);
    bool _1738 = _1736 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1742 = _1736 + _1740;
    float _1744 = _1712;
    float _1746 = _1714;
    float _1748 = _1742;
    float _1750 = _1724;
    if (_1738)
    {
        float _1752 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1752;
    }
    float _1754 = _1744;
    if (_1738)
    {
        float _1756 = rsqrt(_1734);
        _1746 = _1756;
    }
    float _1758 = _1746;
    float _1760 = _1758;
    if (_1738)
    {
        float _1762 = _1742 * _1754;
        _1748 = _1762;
    }
    float _1764 = _1748;
    if (_1738)
    {
        float _1766 = _1764 * 0.15915493667125701904296875;
        _1442 = _1766;
    }
    float _1768 = _1442;
    float _1770 = _1720;
    float _1772 = _1768;
    if (_1738)
    {
        float _1774 = _1768 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1782 = precise::max(0.0, _1780);
    float _1784 = _1628;
    float _1786 = _1782;
    float _1788 = _1780;
    if (_1738)
    {
        float _1790 = _1768 * 6.283185482025146484375;
        float _1792 = cos(_1790);
        _1784 = _1792;
    }
    float _1794 = _1784;
    float _1796 = -_1724;
    float _1798 = -_1782;
    float _1800 = fma(_1704, _1796, _1798);
    if (_1738)
    {
        float _1802 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1786 = _1802;
    }
    float _1804 = _1786;
    float _1806 = _1804;
    if (!_1738)
    {
        _1772 = _1730;
    }
    float _1808 = _1772;
    float _1810 = _1778;
    float _1812 = _1808;
    if (_1738)
    {
        float _1814 = fma(_1778, _1804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1810 = _1814;
    }
    float _1816 = _1810;
    float _1818 = _1816;
    if (!_1738)
    {
        _1806 = _1728;
    }
    float _1820 = _1806;
    float _1822 = _1820;
    if (_1738)
    {
        float _1824 = _1794 + (-1.0);
        _1788 = _1824;
    }
    float _1826 = _1788;
    float _1828 = _1826;
    if (_1738)
    {
        float _1830 = _1758 * _1816;
        _1444 = _1830;
    }
    float _1832 = _1444;
    if (!_1738)
    {
        _1760 = _1726;
    }
    float _1834 = _1760;
    float _1836 = _1834;
    if (_1738)
    {
        float _1838 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1838;
    }
    float _1840 = _1750;
    if (_1738)
    {
        float _1842 = _1726 * _1832;
        _1836 = _1842;
    }
    float _1844 = _1836;
    if (!_1738)
    {
        _1818 = _1800;
    }
    float _1846 = _1818;
    float _1848 = _1846;
    if (_1738)
    {
        float _1850 = _1728 * _1832;
        _1822 = _1850;
    }
    float _1852 = _1822;
    if (_1738)
    {
        float _1854 = fma(_1800, _1794, _1840);
        _1848 = _1854;
    }
    float _1856 = _1848;
    if (_1738)
    {
        float _1858 = _1844 * _1844;
        _1812 = _1858;
    }
    float _1860 = _1812;
    if (!_1738)
    {
        _1828 = _1732;
    }
    float _1862 = _1828;
    float _1864 = _1862;
    if (_1738)
    {
        float _1866 = _1852 * _1852;
        _1864 = _1866;
    }
    float _1868 = _1864;
    float _1870 = fma(_1856, _1856, _1860);
    float _1872 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1874 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1876 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1878 = _1870 + _1868;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1882 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1880);
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1888 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1872);
    float _1890 = rsqrt(_1878);
    float _1892 = -_1884;
    float _1894 = _1892 + 1.0;
    float _1896 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1886);
    float _1898 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1888);
    float _1900 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1902 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1874);
    float _1904 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1896);
    float _1906 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1900);
    float _1910 = abs(_1894);
    float _1912 = log2(_1910);
    float _1914 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1902);
    float _1916 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1918 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1908);
    float _1920 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1890 * _1844;
    float _1928 = _1890 * _1856;
    float _1930 = _1890 * _1852;
    float _1932 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1936 = -_1920;
    float _1938 = fma(_1936, _1876, 1.0);
    float _1940 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1942 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1932);
    float _1944 = -_1934;
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1944);
    float _1948 = log2(_1938);
    float _1950 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1952 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1954 = -_1930;
    float _1956 = fma(_1954, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1946);
    float _1958 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1960 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1952);
    float _1962 = fma(_1956, -0.5, 0.5);
    float _1964 = exp2(_1950);
    float _1966 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1942);
    float _1968 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1958);
    float _1970 = fma(_1956, 0.5, 0.5);
    float _1972 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1960);
    float _1974 = _1928 + 1.0;
    float _1976 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1968);
    float _1978 = fma(_1970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1980 = 1.0 / _1966;
    float _1982 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1972);
    float _1984 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1976);
    float _1986 = fma(_1970, _1978, -0.212114393711090087890625);
    float _1988 = _1948 * 0.693147182464599609375;
    float _1990 = fma(_1970, _1986, 1.570728778839111328125);
    float _1992 = sqrt(_1962);
    float _1994 = -_1928;
    float _1996 = fma(_1964, _1974, _1994);
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1996, 0.5, 0.5);
    float _2002 = _1982 * _1980;
    float _2004 = _1984 * _1980;
    float _2006 = fma(_2002, 0.5, 0.5);
    float _2008 = fma(_2004, -0.5, 0.5);
    float _2010 = _1992 * 0.636619746685028076171875;
    float3 _5244 = float3(_2006, _2008, _1998);
    float _2012 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5244, float3(0.0), isnan(_5244)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5244, float3(0.0), isnan(_5244)), level(0.0)).x;
    float3 _5255 = float3(_2006, _2008, _1998);
    float4 _2015 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5255, float3(0.0), isnan(_5255)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5255, float3(0.0), isnan(_5255)), level(0.0)).xyzw;
    float _2017 = _2015.x;
    float _2019 = _2015.y;
    float _2021 = _2015.z;
    float _2023 = _2015.w;
    float _2025 = -_1990;
    float _2027 = fma(_2010, _2025, 1.0);
    float2 _5277 = float2(_2027, _2000);
    float3 _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5277, float2(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5277, float2(0.0), isnan(_5277)), level(0.0)).xyz;
    float _2031 = _2029.x;
    float _2033 = _2029.y;
    float _2035 = _2029.z;
    float _2037 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2039 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2041 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2037);
    float _2043 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2045 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2039);
    float _2047 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2041);
    float _2049 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2043);
    bool _2051 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.5);
    bool _2059 = _2055 || _2057;
    float _2061 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2063 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2049);
    float _2065 = 1.0 / _2061;
    float _2067 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2069 = _2067 + _2061;
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2073 = _2047;
    if (!_2059)
    {
        _1272 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2075 = _1272;
    float _2077 = _2075;
    if (_2059)
    {
        _2071 = 1.0;
    }
    float _2079 = _2071;
    float _2081 = _2069 * _2065;
    float _2083 = _2081 * 0.5;
    float _2085 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2087 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2045);
    float _2089 = _2083;
    float _2091 = _2079;
    if (!_2059)
    {
        float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2095 = fma(_2083, _2075, _2093);
        _2077 = _2095;
    }
    float _2097 = _2077;
    if (!_2059)
    {
        _2089 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2099 = _2089;
    float _2101 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2087);
    float _2103 = exp2(_2085);
    float _2105 = _2099;
    if (!_2059)
    {
        float _2107 = -_2099;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2073 = _2109;
    }
    float _2111 = _2073;
    out.gl_Position.x = _1982;
    out.gl_Position.y = _1984;
    out.gl_Position.z = _2101;
    out.gl_Position.w = _1966;
    float _2113 = _2097;
    if (!_2059)
    {
        float _2115 = 1.0 / _2097;
        _2113 = _2115;
    }
    float _2117 = _2113;
    float _2119 = _2061;
    if (!_2059)
    {
        float _2121 = 1.0 / _2111;
        _2119 = _2121;
    }
    float _2123 = _2119;
    if (!_2059)
    {
        float _2125 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2127 = -_2099;
        float _2129 = fma(_2117, _2125, _2127);
        _2105 = _2129;
    }
    float _2131 = _2105;
    float _2133 = -_2103;
    float _2135 = _2133 + 1.0;
    float _2137 = _2101 + _1966;
    float _2139 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2059)
    {
        float _2141 = _2131 * _2123;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        _2091 = _2143;
    }
    float _2145 = _2091;
    float _2147 = _2137 * 0.5;
    float _2149 = _2145 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2151 = _2145 > 0.0;
    bool _2153 = isnan(_2145);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan(0.0);
    bool _2159 = _2155 || _2157;
    out.m_71.z = _2147;
    out.m_71.w = _1966;
    float _2161 = _2149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _2161;
    float _2163 = _2139 * _2012;
    float _2165 = -_2139;
    float _2167 = _2165 + 1.0;
    float _2169 = _2023 * _2163;
    float _2171 = _2035 * _2163;
    float _2173 = fma(_2031, _2169, _2017);
    float _2175 = fma(_2033, _2169, _2019);
    float _2177 = _2023 * _2167;
    float _2179 = fma(_2023, _2171, _2021);
    out.m_73.x = _2173;
    out.m_73.y = _2175;
    out.m_73.z = _2179;
    out.m_73.w = _2177;
    if (_2159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2181;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1574 = false;
    bool _433 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_111);
        out.gl_Position.z = _2238;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_51.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_149);
        out.gl_Position.z = _2308;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_53.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _171 = _155 * _153;
    float _173 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _175 = 0.0;
    if (!_167)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _175 = _179;
    }
    float _181 = _175;
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _171);
    float _185 = _173 * _169;
    float _187 = _181;
    if (!_167)
    {
        float _189 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    float _193 = _183 * 6.283185482025146484375;
    float _195 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].y, _185);
    float _197 = floor(_183);
    float _199 = _193 * 0.15915493667125701904296875;
    float _201 = _195 * 6.283185482025146484375;
    float _203 = in.m_51.x;
    float _205 = in.m_51.y;
    float _207 = in.m_51.z;
    float _209 = _201 * 0.15915493667125701904296875;
    float _211 = floor(_195);
    int _213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _215 = _213 != 0;
    float _217 = 1.4012984643248170709237295832899e-45;
    float _219 = _191;
    if (!_167)
    {
        _217 = _157;
    }
    float _221 = _217;
    float _223 = _199 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = -_197;
    float _229 = _183 + _227;
    float _231 = _209 * 6.283185482025146484375;
    float _233 = cos(_231);
    float _235 = -_211;
    float _237 = _195 + _235;
    bool _239 = !_167;
    float _241 = _221;
    if (!_239)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = _157 * _245;
        float _255 = 1.0 / _249;
        float _257 = _251 * 0.693147182464599609375;
        float _259 = exp2(_253);
        float _261 = 1.0 / _257;
        float _263 = _259 + (-1.0);
        float _265 = -_263;
        float _267 = fma(_265, _261, _157);
        float _269 = _267 * _255;
        float _271 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _271;
    }
    float _273 = _219;
    bool _275 = !_167;
    if (!_275)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _157 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _241 = _295;
    }
    float _297 = _241;
    float _299 = in.m_55.w;
    float _301 = in.m_46.x;
    float _303 = in.m_46.y;
    float _305 = in.m_46.z;
    bool _307 = _229 < 0.5;
    float _309 = float(_307);
    float _311 = -_229;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _315 = fma(_225, 0.5, 0.5);
    bool _317 = _237 < 0.5;
    float _319 = float(_317);
    float _321 = fma(_233, 0.5, 0.5);
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _325 = _323 != 0;
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _329 = _327 != 0;
    float _331 = -_309;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = -_315;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _339 = -_237;
    float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _343 = -_319;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _347 = -_321;
    float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _351 = !_325;
    int _353 = _351 ? 0 : 1;
    float _355 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _359 = !_215;
    int _361 = _359 ? 0 : 1;
    float _363 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _365 = abs(_353);
    float _367 = fma(_297, _205, _355);
    float _369 = fma(_297, _203, _357);
    bool _371 = !_329;
    int _373 = _371 ? 0 : 1;
    float _375 = fma(_297, _207, _363);
    float _377 = fma(_369, _299, _301);
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _381 = fma(_375, _299, _305);
    int _383 = abs(_361);
    float _385 = float(_365);
    int _387 = abs(_373);
    float _389 = float(_383);
    float _391 = abs(_313);
    float _393 = _385 * _391;
    float _395 = abs(_341);
    float _397 = _385 * _395;
    float _399 = float(_387);
    float _401 = fma(_389, _337, _393);
    float _403 = fma(_389, _349, _397);
    float _405 = fma(_367, _299, _303);
    float _407 = abs(_333);
    float _409 = fma(_399, _407, _401);
    float _411 = abs(_345);
    float _413 = fma(_399, _411, _403);
    bool _415 = !_379;
    float _431;
    if (!_415)
    {
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _419 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_95);
        float _437 = 1.0 / _435;
        float _439 = _129 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    int _443 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _445 = _443;
    int _447 = 0;
    int _449 = _86(_445, _447, (*spvDescriptorSet0.support_buffer));
    float _451 = _151 * 8.0;
    float _453 = in.m_57.z;
    float _455 = in.m_57.y;
    float _457 = rint(_451);
    float _459 = in.m_53.y;
    float _461 = in.m_59.x;
    float _463 = in.m_59.z;
    float _465 = in.m_59.y;
    float _467 = _457 * 0.125;
    float _469 = precise::clamp(_467, 0.0, 1.0);
    float _471 = in.m_59.w;
    int _473 = _449 + (-1);
    float _475 = trunc(_453);
    int _477 = int(_475);
    float _479 = float(_473);
    float _481 = _469 * _479;
    float _483 = trunc(_481);
    int _485 = int(_483);
    int _487 = _485 + 1;
    int _489 = min(_473, _487);
    int _491 = _485;
    int _493 = 0;
    int _495 = _87(_491, _493, (*spvDescriptorSet0.support_buffer));
    int _497 = _477;
    int _499 = 0;
    int _501 = _87(_497, _499, (*spvDescriptorSet0.support_buffer));
    float3 _505 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_495, _501)), 0).xyz;
    float _507 = _505.x;
    float _509 = _505.y;
    float _511 = _505.z;
    int _513 = _489;
    int _515 = 0;
    int _517 = _87(_513, _515, (*spvDescriptorSet0.support_buffer));
    int _519 = _477;
    int _521 = 0;
    int _523 = _87(_519, _521, (*spvDescriptorSet0.support_buffer));
    float3 _525 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_517, _523)), 0).xyz;
    float _527 = _525.x;
    float _529 = _525.y;
    float _531 = _525.z;
    float _533 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _545 = _543 != 0;
    float _547 = in.m_53.z;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _551 = _549 != 0;
    float _553 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _555 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _557 = -_455;
    float _559 = _557 + 1.0;
    float _561 = _151 * 2.0;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _565 = _563 != 0;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _567;
    bool _571 = _459 > 0.5;
    float _573 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    float _575 = floor(_561);
    float _577 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _581 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _583 = _455;
    if (_551)
    {
        float _585 = _571 ? _559 : _455;
        _583 = _585;
    }
    float _587 = _583;
    float _589 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
    float _591 = -_579;
    float _593 = fma(_577, 2.0, _591);
    float _595 = 1.0 / _569;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _601 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _581);
    float _603 = _459 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _605 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _573);
    float _607 = 1.0 / _599;
    float _609 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_61.x = _461;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _615 = fma(_603, -2.0, _611);
    float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _625 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _633 = _441 + _631;
    float _635 = in.m_57.x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _639 = _441 + _637;
    bool _641 = _151 > 0.5;
    bool _643 = _641 && _565;
    float _645 = _633 * _595;
    out.m_63.x = _625;
    out.m_63.y = _627;
    out.m_63.z = _629;
    out.m_63.w = _623;
    float _647 = _151 + _459;
    float _649 = _639 * _607;
    bool _651 = _575 >= 0.0;
    bool _653 = isnan(_575);
    bool _655 = _651 || _653;
    bool _657 = isnan(0.0);
    bool _659 = _655 || _657;
    float _661 = _617 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _663 = _647 + (-1.0);
    float _665 = _459 * 2.0;
    out.m_61.z = _463;
    float _667 = fma(_661, _587, -0.5);
    float _669 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _671 = floor(_665);
    out.m_61.y = _465;
    float _673 = _151 + _547;
    float _675 = _459 + _547;
    float _677 = _547 * 2.0;
    float _679 = _673 + (-1.0);
    float _681 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _683 = log2(_681);
    float _685 = _675 + (-1.0);
    float _687 = _663;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (_565)
    {
        _687 = _635;
    }
    float _691 = _687;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _695 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _699 = _691;
    if (!_565)
    {
        _689 = _635;
    }
    float _701 = _689;
    float _703 = _701;
    if (_643)
    {
        float _705 = -_691;
        float _707 = _705 + 1.0;
        _699 = _707;
    }
    float _709 = _699;
    float _711 = _695 * _151;
    float _713 = floor(_677);
    bool _715 = _671 >= 0.0;
    bool _717 = isnan(_671);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _729;
    float _733 = _683 * _129;
    if (_565)
    {
        _703 = _709;
    }
    float _735 = _703;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _739 = trunc(_711);
    int _741 = int(_739);
    bool _743 = _671 > 0.0;
    out.m_61.w = _471;
    int _745 = _659 ? 0 : 1;
    float _747 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[79].z, _737);
    int _749 = _723 ? 0 : 1;
    float _751 = fma(_727, _645, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _753 = _575 > 0.0;
    float _755 = exp2(_733);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _765 = _713 > 0.0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _767;
    float _771 = fma(_759, _649, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _773 = _713 >= 0.0;
    bool _775 = isnan(_713);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _787 = _741 << 4;
    int _789 = _787 + 1968;
    float _791 = fma(_769, _645, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _793 = fma(_785, _649, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    uint _796 = uint(int(uint(_789) >> uint(2)));
    uint _798 = uint(int(uint(int(_796)) >> uint(2)));
    int _800 = int(_796) & 3;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[int(_798)][_800];
    int _804 = int(_796) + 1;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    int _808 = _804 & 3;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[int(_806)][_808];
    float _812 = fma(_731, _645, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _814 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _816 = isnan(_441);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = fma(_763, _649, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _828 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _830 = isnan(_441);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _842 = 1.0 + _840;
    bool _844 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _846 = isnan(_441);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    int _856 = _789 + 8;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[int(_860)][_862];
    bool _866 = !_541;
    int _868 = _866 ? 0 : 1;
    float _870 = -_755;
    float _872 = _870 + 1.0;
    bool _874 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _882 = _878 || _880;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _886 = 1.0 / _842;
    float _888 = -_854;
    float _890 = _888 + 1.0;
    float _892 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _747);
    float _894 = _882 ? _872 : 0.0;
    float _896 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _884);
    bool _898 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _900 = isnan(1.0);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _906 = _902 || _904;
    float _908 = _892 * (-0.15915493667125701904296875);
    float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _912 = _838 * _890;
    float _914 = -_838;
    float _916 = _914 + 1.0;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _920 = -_129;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[76].x, _593);
    float _924 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _615);
    float _926 = _824 * _916;
    float _928 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[78].w, _918);
    float _930 = _908 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _896);
    float _936 = _751 * _926;
    float _938 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _928);
    if (_906)
    {
        float _940 = _894 * _886;
        _131 = _940;
    }
    float _942 = _131;
    float _944 = _791 * _926;
    float _946 = _812 * _926;
    int _948 = ~_745;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    float _954 = _908 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = _910 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _960 = abs(_868);
    float _962 = _605 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _964 = _952;
    if (!_753)
    {
        int _966 = ~_745;
        int _968 = _966 + 1;
        _964 = _968;
    }
    int _970 = _964;
    float _972 = fma(_958, _735, -0.5);
    float _974 = float(_960);
    float _976 = _589 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _978 = _932 * _667;
    float _980 = float(_970);
    float _982 = _609 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _984 = _802 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _986 = _810 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _988 = ~_749;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = _459 + (-0.5);
    int _996 = _992;
    if (!_743)
    {
        int _998 = ~_749;
        int _1000 = _998 + 1;
        _996 = _1000;
    }
    int _1002 = _996;
    float _1004 = _984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1006 = _781 ? 0 : 1;
    float _1008 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1012 = _956 * _667;
    float _1014 = -_978;
    float _1016 = fma(_956, _972, _1014);
    float _1018 = _974 * _980;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _962 + _1022;
    int _1026 = ~_1006;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    float _1032 = fma(_932, _972, _1012);
    int _1034 = _1030;
    if (!_765)
    {
        int _1036 = ~_1006;
        int _1038 = _1036 + 1;
        _1034 = _1038;
    }
    int _1040 = _1034;
    out.m_65.x = _1004;
    out.m_65.y = _1008;
    out.m_65.z = _1020;
    bool _1042 = !_545;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1048 = _976 + _1046;
    bool _1050 = !_537;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = in.m_67.x;
    float _1056 = in.m_67.y;
    float _1058 = in.m_67.z;
    int _1060 = abs(_1044);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _982 + _1062;
    float _1066 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1068 = _547 + (-0.5);
    float _1070 = float(_1060);
    float _1072 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1066);
    float _1074 = _1024 * _1024;
    int _1076 = abs(_1052);
    float _1078 = -_924;
    float _1080 = fma(_938, _1032, _1078);
    float _1082 = float(_1002);
    float _1084 = fma(_1048, _1048, _1074);
    float _1086 = float(_1076);
    float _1088 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1072);
    float _1090 = float(_1040);
    float _1092 = fma(_1064, _1064, _1084);
    float _1094 = fma(_934, _1016, _922);
    float _1096 = _1018 * (-2.0);
    float _1098 = _1070 * _1082;
    float _1100 = _1086 * _1090;
    bool _1102 = _1088 >= 0.0;
    float _1104 = rsqrt(_1092);
    float _1106 = fma(_697, _1096, _697);
    float _1108 = fma(_1096, _1056, _1056);
    float _1110 = _1100 * (-2.0);
    float _1112 = _1098 * (-2.0);
    float _1114 = _1094 + 0.5;
    float _1116 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1108);
    float _1118 = fma(_669, _1110, _669);
    float _1120 = fma(_1110, _1054, _1054);
    float _1122 = _151 + (-0.5);
    float _1124 = fma(_1106, _942, _1116);
    float _1126 = fma(_1112, _1058, _1058);
    float _1128 = _1080 + 0.5;
    float _1130 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1120);
    float _1132 = _1124 * 0.15915493667125701904296875;
    float _1134 = fma(_693, _1112, _693);
    float _1136 = _1024 * _1104;
    float _1138 = _1048 * _1104;
    float _1140 = _1064 * _1104;
    float _1142 = fma(_1118, _942, _1130);
    float _1144 = -_1136;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1148 = -_1138;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1152 = -_1140;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1064);
    float _1156 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1126);
    float _1158 = _1146 * _1146;
    float _1160 = in.m_55.x;
    float _1162 = in.m_55.y;
    float _1164 = in.m_55.z;
    float _1166 = _1100;
    if (_1102)
    {
        _1166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1168 = _1166;
    float _1170 = _1132 * 6.283185482025146484375;
    float _1172 = sin(_1170);
    float _1174 = fma(_1150, _1150, _1158);
    out.m_69.x = _1114;
    out.m_69.y = _1128;
    int _1176 = as_type<int>(_1168);
    if (_1102)
    {
        float _1178 = _1168 * 5.0;
        _1176 = as_type<int>(_1178);
    }
    int _1180 = _1176;
    float _1182 = fma(_1154, _1154, _1174);
    if (_1102)
    {
        out.m_49.x = 0.0;
    }
    float _1184 = _1132 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = sqrt(_1182);
    if (_1102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3884 = as_type<float>(_1180);
        out.gl_Position.z = _3884;
    }
    float _1190 = _1164;
    if (_1102)
    {
        return out;
    }
    float _1192 = -_1136;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _1196 = -_824;
    float _1198 = _1196 + 1.0;
    float _1200 = -_1138;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1204 = -_1140;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1210 = _1194 + _1208;
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[143].y, _944);
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = _1202 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1206 + _1218;
    float _1222 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1224 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[143].x, _936);
    float _1226 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[143].z, _946);
    float _1228 = fma(_793, _912, _1212);
    float _1230 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1222);
    float _1232 = fma(_771, _912, _1224);
    float _1234 = _1142 * 0.15915493667125701904296875;
    float _1236 = fma(_1134, _942, _1156);
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1230);
    float _1240 = fma(_826, _912, _1226);
    float _1242 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1232);
    float _1244 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1228);
    float _1246 = _1234 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    bool _1250 = _1238 >= 0.0;
    float _1252 = _1236 * 0.15915493667125701904296875;
    float _1254 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[145].z, _1240);
    float _1256 = _1242 * _1160;
    float _1258 = _1244 * _1162;
    float _1260 = _1104 * _1188;
    float _1262 = _1254 * _1164;
    float _1264 = _1234 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = _413 * _1258;
    float _1270 = _409 * _1256;
    float _1272 = _1206;
    if (_1250)
    {
        _1190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1274 = _1190;
    int _1276 = as_type<int>(_1274);
    if (_1250)
    {
        out.m_49.x = 0.0;
    }
    float _1278 = _1252 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1248 * _1172;
    if (_1250)
    {
        float _1284 = _1274 * 5.0;
        _1276 = as_type<int>(_1284);
    }
    int _1286 = _1276;
    float _1288 = floor(_481);
    float _1290 = _1266 * _1186;
    if (_1250)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4064 = as_type<float>(_1286);
        out.gl_Position.z = _4064;
    }
    float _1292 = fma(_1280, _1290, _1282);
    float _1294 = fma(_1280, _1282, _1290);
    float _1296 = -_1288;
    float _1298 = _481 + _1296;
    if (_1250)
    {
        return out;
    }
    float _1300 = _1252 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = -_509;
    float _1306 = _1304 + _529;
    float _1308 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1310 = _1266 * _1172;
    float _1312 = _1248 * _1186;
    float _1314 = fma(_1298, _1306, _509);
    float _1316 = -_507;
    float _1318 = _1316 + _527;
    float _1320 = _1260 * _1308;
    float _1322 = -_1310;
    float _1324 = fma(_1280, _1312, _1322);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1314);
    float _1328 = -_1312;
    float _1330 = fma(_1280, _1310, _1328);
    float _1332 = -_511;
    float _1334 = _1332 + _531;
    float _1336 = fma(_1298, _1318, _507);
    float _1338 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1340 = _1326 * _1320;
    float _1342 = fma(_1298, _1334, _511);
    float _1344 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1346 = _1260 * _1338;
    float _1348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1336);
    float _1350 = _1302 * _1340;
    float _1352 = _1172 * _1302;
    float _1354 = _1186 * _1302;
    float _1356 = _1260 * _1344;
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1342);
    float _1360 = _1348 * _1346;
    float _1362 = _1266 * _1350;
    float _1364 = -_1340;
    float _1366 = _1280 * _1364;
    float _1368 = _1358 * _1356;
    float _1370 = _1248 * _1350;
    float _1372 = fma(_1292, _1360, _1362);
    float _1374 = fma(_1354, _1360, _1366);
    float _1376 = fma(_1324, _1360, _1370);
    float _1378 = fma(_1330, _1368, _1372);
    float _1380 = fma(_1352, _1368, _1374);
    float _1382 = fma(_1294, _1368, _1376);
    float _1384 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1388 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1386);
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1388);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1390);
    float _1396 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1398 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1400 = _976 + _1396;
    float _1402 = _982 + _1398;
    float _1404 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1408 = _1400 + _1406;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1412 = _1402 + _1410;
    float _1414 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1404);
    float _1416 = _1408 * _1408;
    float _1418 = _1412 * _1412;
    float _1420 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1414);
    float _1422 = _1416 + _1418;
    float _1424 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1426 = sqrt(_1422);
    float _1428 = _962 + _1424;
    bool _1430 = _1426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1432 = _1424;
    float _1434 = _1420;
    float _1436 = _1402;
    float _1438 = _1418;
    float _1440 = _1400;
    float _1442 = _1412;
    float _1444 = _1330;
    if (!_1430)
    {
        _1432 = _1402;
    }
    float _1446 = _1432;
    float _1448 = _1446;
    if (!_1430)
    {
        _1434 = _1416;
    }
    float _1450 = _1434;
    float _1452 = _1450;
    if (!_1430)
    {
        _1436 = _1428;
    }
    float _1454 = _1436;
    bool _1456 = !_1430;
    float _1458 = _1454;
    if (!_1456)
    {
        float _1460 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1464 = _1426 + _1462;
        float _1466 = rsqrt(_1422);
        float _1468 = _1464 * _1460;
        float _1470 = _1428 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = _1468 * 0.15915493667125701904296875;
        float _1474 = _1472 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = _1472 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = fma(_1476, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1484 = _1466 * _1482;
        float _1486 = _1480 + (-1.0);
        float _1488 = fma(_1408, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1490 = fma(_1412, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1492 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1496 = _1488 + _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1500 = _1490 + _1498;
        float _1502 = fma(_1428, _1480, _1492);
        float _1504 = _1496 * _1496;
        float _1506 = _1500 * _1500;
        _1458 = _1502;
        _1452 = _1504;
        _1438 = _1506;
        _1440 = _1488;
        _1448 = _1490;
    }
    float _1508 = _1458;
    float _1510 = _1452;
    float _1512 = _1438;
    float _1514 = _1440;
    float _1516 = _1448;
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1520 = _1508 + _1518;
    float _1522 = fma(_1520, _1520, _1510);
    float _1524 = _1522 + _1512;
    float _1526 = sqrt(_1524);
    bool _1528 = _1526 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1530 = isnan(_1526);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1536 = _1532 || _1534;
    float _1538 = _1510;
    if (!_1536)
    {
        _1538 = 1.0;
    }
    float _1540 = _1538;
    bool _1542 = !_1536;
    float _1544 = _1540;
    if (!_1542)
    {
        bool _1546 = _1526 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1548 = isnan(_1526);
        bool _1550 = _1546 || _1548;
        bool _1552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1554 = _1550 || _1552;
        if (!_1554)
        {
            float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1558 = _1526 + _1556;
            float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1562 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1560;
            float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1568 = 1.0 / _1562;
            float _1570 = _1558 * _1568;
            float _1572 = fma(_1570, _1566, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1544 = _1572;
            _1574 = true;
        }
        else
        {
            bool _1576 = _1526 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1578 = isnan(_1526);
            bool _1580 = _1576 || _1578;
            bool _1582 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1584 = _1580 || _1582;
            if (!_1584)
            {
                float _1586 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1588 = _1526 + _1586;
                float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1592 = _1590 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1596 = _1594 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1598 = 1.0 / _1592;
                float _1600 = _1588 * _1598;
                float _1602 = fma(_1600, _1596, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1544 = _1602;
                _1574 = true;
            }
            else
            {
                _1544 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1574 = false;
    float _1604 = _1544;
    float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1608 = _1508 + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1612 = _1514 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1616 = _1516 + _1614;
    bool _1618 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(0.5);
    bool _1626 = _1622 || _1624;
    float _1628 = fma(_1608, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1630 = fma(_1612, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1632 = fma(_1616, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1634 = -_1136;
    float _1636 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1628);
    float _1638 = -_1138;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1630);
    float _1642 = -_1140;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1632);
    float _1646 = _1636;
    float _1648 = _1640;
    float _1650 = _1644;
    if (!_1626)
    {
        float _1652 = _1210 * _1210;
        float _1654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1656 = -_982;
        float _1658 = _1656 + _1632;
        float _1660 = -_976;
        float _1662 = _1660 + _1630;
        float _1664 = fma(_1216, _1216, _1652);
        float _1666 = fma(_1220, _1220, _1664);
        float _1668 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1670 = sqrt(_1666);
        float _1672 = 1.0 / _1260;
        float _1674 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1676 = precise::min(_1670, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1678 = _1676 * _1654;
        float _1680 = _1678 * _1672;
        float _1682 = -_962;
        float _1684 = _1682 + _1628;
        float _1686 = _1674 * _1680;
        float _1688 = _1658 * _1680;
        float _1690 = fma(_1684, _1686, _1194);
        float _1692 = fma(_1662, _1686, _1202);
        float _1694 = fma(_1674, _1688, _1206);
        _1646 = _1690;
        _1648 = _1692;
        _1650 = _1694;
    }
    float _1696 = _1646;
    float _1698 = _1648;
    float _1700 = _1650;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1696 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1708 = _1698 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1700 + _1710;
    float _1714 = _1704 * _1704;
    float _1716 = fma(_1708, _1708, _1714);
    float _1718 = fma(_1712, _1712, _1716);
    float _1720 = rsqrt(_1718);
    float _1722 = sqrt(_1718);
    float _1724 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1726 = _1708 * _1724;
    float _1728 = _1712 * _1724;
    float _1730 = _1726 * _1726;
    float _1732 = _1728 * _1728;
    float _1734 = _1730 + _1732;
    float _1736 = sqrt(_1734);
    bool _1738 = _1736 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1742 = _1736 + _1740;
    float _1744 = _1712;
    float _1746 = _1714;
    float _1748 = _1742;
    float _1750 = _1724;
    if (_1738)
    {
        float _1752 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1752;
    }
    float _1754 = _1744;
    if (_1738)
    {
        float _1756 = rsqrt(_1734);
        _1746 = _1756;
    }
    float _1758 = _1746;
    float _1760 = _1758;
    if (_1738)
    {
        float _1762 = _1742 * _1754;
        _1748 = _1762;
    }
    float _1764 = _1748;
    if (_1738)
    {
        float _1766 = _1764 * 0.15915493667125701904296875;
        _1442 = _1766;
    }
    float _1768 = _1442;
    float _1770 = _1720;
    float _1772 = _1768;
    if (_1738)
    {
        float _1774 = _1768 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1782 = precise::max(0.0, _1780);
    float _1784 = _1628;
    float _1786 = _1782;
    float _1788 = _1780;
    if (_1738)
    {
        float _1790 = _1768 * 6.283185482025146484375;
        float _1792 = cos(_1790);
        _1784 = _1792;
    }
    float _1794 = _1784;
    float _1796 = -_1724;
    float _1798 = -_1782;
    float _1800 = fma(_1704, _1796, _1798);
    if (_1738)
    {
        float _1802 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1786 = _1802;
    }
    float _1804 = _1786;
    float _1806 = _1804;
    if (!_1738)
    {
        _1772 = _1730;
    }
    float _1808 = _1772;
    float _1810 = _1778;
    float _1812 = _1808;
    if (_1738)
    {
        float _1814 = fma(_1778, _1804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1810 = _1814;
    }
    float _1816 = _1810;
    float _1818 = _1816;
    if (!_1738)
    {
        _1806 = _1728;
    }
    float _1820 = _1806;
    float _1822 = _1820;
    if (_1738)
    {
        float _1824 = _1794 + (-1.0);
        _1788 = _1824;
    }
    float _1826 = _1788;
    float _1828 = _1826;
    if (_1738)
    {
        float _1830 = _1758 * _1816;
        _1444 = _1830;
    }
    float _1832 = _1444;
    if (!_1738)
    {
        _1760 = _1726;
    }
    float _1834 = _1760;
    float _1836 = _1834;
    if (_1738)
    {
        float _1838 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1838;
    }
    float _1840 = _1750;
    if (_1738)
    {
        float _1842 = _1726 * _1832;
        _1836 = _1842;
    }
    float _1844 = _1836;
    if (!_1738)
    {
        _1818 = _1800;
    }
    float _1846 = _1818;
    float _1848 = _1846;
    if (_1738)
    {
        float _1850 = _1728 * _1832;
        _1822 = _1850;
    }
    float _1852 = _1822;
    if (_1738)
    {
        float _1854 = fma(_1800, _1794, _1840);
        _1848 = _1854;
    }
    float _1856 = _1848;
    if (_1738)
    {
        float _1858 = _1844 * _1844;
        _1812 = _1858;
    }
    float _1860 = _1812;
    if (!_1738)
    {
        _1828 = _1732;
    }
    float _1862 = _1828;
    float _1864 = _1862;
    if (_1738)
    {
        float _1866 = _1852 * _1852;
        _1864 = _1866;
    }
    float _1868 = _1864;
    float _1870 = fma(_1856, _1856, _1860);
    float _1872 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1874 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1876 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1878 = _1870 + _1868;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1882 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1880);
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1888 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1872);
    float _1890 = rsqrt(_1878);
    float _1892 = -_1884;
    float _1894 = _1892 + 1.0;
    float _1896 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1886);
    float _1898 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1888);
    float _1900 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1902 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1874);
    float _1904 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1896);
    float _1906 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1900);
    float _1910 = abs(_1894);
    float _1912 = log2(_1910);
    float _1914 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1902);
    float _1916 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1918 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1908);
    float _1920 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1890 * _1844;
    float _1928 = _1890 * _1856;
    float _1930 = _1890 * _1852;
    float _1932 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1936 = -_1920;
    float _1938 = fma(_1936, _1876, 1.0);
    float _1940 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1942 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1932);
    float _1944 = -_1934;
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1944);
    float _1948 = log2(_1938);
    float _1950 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1952 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1954 = -_1930;
    float _1956 = fma(_1954, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1946);
    float _1958 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1960 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1952);
    float _1962 = fma(_1956, -0.5, 0.5);
    float _1964 = exp2(_1950);
    float _1966 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1942);
    float _1968 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1958);
    float _1970 = fma(_1956, 0.5, 0.5);
    float _1972 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1960);
    float _1974 = _1928 + 1.0;
    float _1976 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1968);
    float _1978 = fma(_1970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1980 = 1.0 / _1966;
    float _1982 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1972);
    float _1984 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1976);
    float _1986 = fma(_1970, _1978, -0.212114393711090087890625);
    float _1988 = _1948 * 0.693147182464599609375;
    float _1990 = fma(_1970, _1986, 1.570728778839111328125);
    float _1992 = sqrt(_1962);
    float _1994 = -_1928;
    float _1996 = fma(_1964, _1974, _1994);
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1996, 0.5, 0.5);
    float _2002 = _1982 * _1980;
    float _2004 = _1984 * _1980;
    float _2006 = fma(_2002, 0.5, 0.5);
    float _2008 = fma(_2004, -0.5, 0.5);
    float _2010 = _1992 * 0.636619746685028076171875;
    float3 _5244 = float3(_2006, _2008, _1998);
    float _2012 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5244, float3(0.0), isnan(_5244)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5244, float3(0.0), isnan(_5244)), level(0.0)).x;
    float3 _5255 = float3(_2006, _2008, _1998);
    float4 _2015 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5255, float3(0.0), isnan(_5255)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5255, float3(0.0), isnan(_5255)), level(0.0)).xyzw;
    float _2017 = _2015.x;
    float _2019 = _2015.y;
    float _2021 = _2015.z;
    float _2023 = _2015.w;
    float _2025 = -_1990;
    float _2027 = fma(_2010, _2025, 1.0);
    float2 _5277 = float2(_2027, _2000);
    float3 _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5277, float2(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5277, float2(0.0), isnan(_5277)), level(0.0)).xyz;
    float _2031 = _2029.x;
    float _2033 = _2029.y;
    float _2035 = _2029.z;
    float _2037 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2039 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2041 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2037);
    float _2043 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2045 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2039);
    float _2047 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2041);
    float _2049 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2043);
    bool _2051 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.5);
    bool _2059 = _2055 || _2057;
    float _2061 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2063 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2049);
    float _2065 = 1.0 / _2061;
    float _2067 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2069 = _2067 + _2061;
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2073 = _2047;
    if (!_2059)
    {
        _1272 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2075 = _1272;
    float _2077 = _2075;
    if (_2059)
    {
        _2071 = 1.0;
    }
    float _2079 = _2071;
    float _2081 = _2069 * _2065;
    float _2083 = _2081 * 0.5;
    float _2085 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2087 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2045);
    float _2089 = _2083;
    float _2091 = _2079;
    if (!_2059)
    {
        float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2095 = fma(_2083, _2075, _2093);
        _2077 = _2095;
    }
    float _2097 = _2077;
    if (!_2059)
    {
        _2089 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2099 = _2089;
    float _2101 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2087);
    float _2103 = exp2(_2085);
    float _2105 = _2099;
    if (!_2059)
    {
        float _2107 = -_2099;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2073 = _2109;
    }
    float _2111 = _2073;
    out.gl_Position.x = _1982;
    out.gl_Position.y = _1984;
    out.gl_Position.z = _2101;
    out.gl_Position.w = _1966;
    float _2113 = _2097;
    if (!_2059)
    {
        float _2115 = 1.0 / _2097;
        _2113 = _2115;
    }
    float _2117 = _2113;
    float _2119 = _2061;
    if (!_2059)
    {
        float _2121 = 1.0 / _2111;
        _2119 = _2121;
    }
    float _2123 = _2119;
    if (!_2059)
    {
        float _2125 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2127 = -_2099;
        float _2129 = fma(_2117, _2125, _2127);
        _2105 = _2129;
    }
    float _2131 = _2105;
    float _2133 = -_2103;
    float _2135 = _2133 + 1.0;
    float _2137 = _2101 + _1966;
    float _2139 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2059)
    {
        float _2141 = _2131 * _2123;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        _2091 = _2143;
    }
    float _2145 = _2091;
    float _2147 = _2137 * 0.5;
    float _2149 = _2145 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2151 = _2145 > 0.0;
    bool _2153 = isnan(_2145);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan(0.0);
    bool _2159 = _2155 || _2157;
    out.m_71.z = _2147;
    out.m_71.w = _1966;
    float _2161 = _2149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _2161;
    float _2163 = _2139 * _2012;
    float _2165 = -_2139;
    float _2167 = _2165 + 1.0;
    float _2169 = _2023 * _2163;
    float _2171 = _2035 * _2163;
    float _2173 = fma(_2031, _2169, _2017);
    float _2175 = fma(_2033, _2169, _2019);
    float _2177 = _2023 * _2167;
    float _2179 = fma(_2023, _2171, _2021);
    out.m_73.x = _2173;
    out.m_73.y = _2175;
    out.m_73.z = _2179;
    out.m_73.w = _2177;
    if (_2159)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2181;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1574 = false;
    bool _433 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_111);
        out.gl_Position.z = _2238;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_51.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_149);
        out.gl_Position.z = _2308;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_53.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _171 = _155 * _153;
    float _173 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _175 = 0.0;
    if (!_167)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _175 = _179;
    }
    float _181 = _175;
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _171);
    float _185 = _173 * _169;
    float _187 = _181;
    if (!_167)
    {
        float _189 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    float _193 = _183 * 6.283185482025146484375;
    float _195 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].y, _185);
    float _197 = floor(_183);
    float _199 = _193 * 0.15915493667125701904296875;
    float _201 = _195 * 6.283185482025146484375;
    float _203 = in.m_51.x;
    float _205 = in.m_51.y;
    float _207 = in.m_51.z;
    float _209 = _201 * 0.15915493667125701904296875;
    float _211 = floor(_195);
    int _213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _215 = _213 != 0;
    float _217 = 1.4012984643248170709237295832899e-45;
    float _219 = _191;
    if (!_167)
    {
        _217 = _157;
    }
    float _221 = _217;
    float _223 = _199 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = -_197;
    float _229 = _183 + _227;
    float _231 = _209 * 6.283185482025146484375;
    float _233 = cos(_231);
    float _235 = -_211;
    float _237 = _195 + _235;
    bool _239 = !_167;
    float _241 = _221;
    if (!_239)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = _157 * _245;
        float _255 = 1.0 / _249;
        float _257 = _251 * 0.693147182464599609375;
        float _259 = exp2(_253);
        float _261 = 1.0 / _257;
        float _263 = _259 + (-1.0);
        float _265 = -_263;
        float _267 = fma(_265, _261, _157);
        float _269 = _267 * _255;
        float _271 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _271;
    }
    float _273 = _219;
    bool _275 = !_167;
    if (!_275)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _157 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _241 = _295;
    }
    float _297 = _241;
    float _299 = in.m_55.w;
    float _301 = in.m_46.x;
    float _303 = in.m_46.y;
    float _305 = in.m_46.z;
    bool _307 = _229 < 0.5;
    float _309 = float(_307);
    float _311 = -_229;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _315 = fma(_225, 0.5, 0.5);
    bool _317 = _237 < 0.5;
    float _319 = float(_317);
    float _321 = fma(_233, 0.5, 0.5);
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _325 = _323 != 0;
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _329 = _327 != 0;
    float _331 = -_309;
    float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _335 = -_315;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _339 = -_237;
    float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _343 = -_319;
    float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _347 = -_321;
    float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _351 = !_325;
    int _353 = _351 ? 0 : 1;
    float _355 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _359 = !_215;
    int _361 = _359 ? 0 : 1;
    float _363 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _365 = abs(_353);
    float _367 = fma(_297, _205, _355);
    float _369 = fma(_297, _203, _357);
    bool _371 = !_329;
    int _373 = _371 ? 0 : 1;
    float _375 = fma(_297, _207, _363);
    float _377 = fma(_369, _299, _301);
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _381 = fma(_375, _299, _305);
    int _383 = abs(_361);
    float _385 = float(_365);
    int _387 = abs(_373);
    float _389 = float(_383);
    float _391 = abs(_313);
    float _393 = _385 * _391;
    float _395 = abs(_341);
    float _397 = _385 * _395;
    float _399 = float(_387);
    float _401 = fma(_389, _337, _393);
    float _403 = fma(_389, _349, _397);
    float _405 = fma(_367, _299, _303);
    float _407 = abs(_333);
    float _409 = fma(_399, _407, _401);
    float _411 = abs(_345);
    float _413 = fma(_399, _411, _403);
    bool _415 = !_379;
    float _431;
    if (!_415)
    {
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _419 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        float _435 = float(_95);
        float _437 = 1.0 / _435;
        float _439 = _129 * _437;
        _431 = _439;
    }
    _433 = false;
    float _441 = _431;
    int _443 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _445 = _443;
    int _447 = 0;
    int _449 = _86(_445, _447, (*spvDescriptorSet0.support_buffer));
    float _451 = _151 * 8.0;
    float _453 = in.m_57.z;
    float _455 = in.m_57.y;
    float _457 = rint(_451);
    float _459 = in.m_53.y;
    float _461 = in.m_59.x;
    float _463 = in.m_59.z;
    float _465 = in.m_59.y;
    float _467 = _457 * 0.125;
    float _469 = precise::clamp(_467, 0.0, 1.0);
    float _471 = in.m_59.w;
    int _473 = _449 + (-1);
    float _475 = trunc(_453);
    int _477 = int(_475);
    float _479 = float(_473);
    float _481 = _469 * _479;
    float _483 = trunc(_481);
    int _485 = int(_483);
    int _487 = _485 + 1;
    int _489 = min(_473, _487);
    int _491 = _485;
    int _493 = 0;
    int _495 = _87(_491, _493, (*spvDescriptorSet0.support_buffer));
    int _497 = _477;
    int _499 = 0;
    int _501 = _87(_497, _499, (*spvDescriptorSet0.support_buffer));
    float3 _505 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_495, _501)), 0).xyz;
    float _507 = _505.x;
    float _509 = _505.y;
    float _511 = _505.z;
    int _513 = _489;
    int _515 = 0;
    int _517 = _87(_513, _515, (*spvDescriptorSet0.support_buffer));
    int _519 = _477;
    int _521 = 0;
    int _523 = _87(_519, _521, (*spvDescriptorSet0.support_buffer));
    float3 _525 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_517, _523)), 0).xyz;
    float _527 = _525.x;
    float _529 = _525.y;
    float _531 = _525.z;
    float _533 = _405 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _545 = _543 != 0;
    float _547 = in.m_53.z;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _551 = _549 != 0;
    float _553 = _405 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _555 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _557 = -_455;
    float _559 = _557 + 1.0;
    float _561 = _151 * 2.0;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _565 = _563 != 0;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _567;
    bool _571 = _459 > 0.5;
    float _573 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _553);
    float _575 = floor(_561);
    float _577 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _581 = _405 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _583 = _455;
    if (_551)
    {
        float _585 = _571 ? _559 : _455;
        _583 = _585;
    }
    float _587 = _583;
    float _589 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
    float _591 = -_579;
    float _593 = fma(_577, 2.0, _591);
    float _595 = 1.0 / _569;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _601 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _581);
    float _603 = _459 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _605 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _573);
    float _607 = 1.0 / _599;
    float _609 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_61.x = _461;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _615 = fma(_603, -2.0, _611);
    float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _625 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _633 = _441 + _631;
    float _635 = in.m_57.x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _639 = _441 + _637;
    bool _641 = _151 > 0.5;
    bool _643 = _641 && _565;
    float _645 = _633 * _595;
    out.m_63.x = _625;
    out.m_63.y = _627;
    out.m_63.z = _629;
    out.m_63.w = _623;
    float _647 = _151 + _459;
    float _649 = _639 * _607;
    bool _651 = _575 >= 0.0;
    bool _653 = isnan(_575);
    bool _655 = _651 || _653;
    bool _657 = isnan(0.0);
    bool _659 = _655 || _657;
    float _661 = _617 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _663 = _647 + (-1.0);
    float _665 = _459 * 2.0;
    out.m_61.z = _463;
    float _667 = fma(_661, _587, -0.5);
    float _669 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _671 = floor(_665);
    out.m_61.y = _465;
    float _673 = _151 + _547;
    float _675 = _459 + _547;
    float _677 = _547 * 2.0;
    float _679 = _673 + (-1.0);
    float _681 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _683 = log2(_681);
    float _685 = _675 + (-1.0);
    float _687 = _663;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (_565)
    {
        _687 = _635;
    }
    float _691 = _687;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _695 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _697 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _699 = _691;
    if (!_565)
    {
        _689 = _635;
    }
    float _701 = _689;
    float _703 = _701;
    if (_643)
    {
        float _705 = -_691;
        float _707 = _705 + 1.0;
        _699 = _707;
    }
    float _709 = _699;
    float _711 = _695 * _151;
    float _713 = floor(_677);
    bool _715 = _671 >= 0.0;
    bool _717 = isnan(_671);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _729;
    float _733 = _683 * _129;
    if (_565)
    {
        _703 = _709;
    }
    float _735 = _703;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _739 = trunc(_711);
    int _741 = int(_739);
    bool _743 = _671 > 0.0;
    out.m_61.w = _471;
    int _745 = _659 ? 0 : 1;
    float _747 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[79].z, _737);
    int _749 = _723 ? 0 : 1;
    float _751 = fma(_727, _645, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _753 = _575 > 0.0;
    float _755 = exp2(_733);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _765 = _713 > 0.0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _767;
    float _771 = fma(_759, _649, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _773 = _713 >= 0.0;
    bool _775 = isnan(_713);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _787 = _741 << 4;
    int _789 = _787 + 1968;
    float _791 = fma(_769, _645, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _793 = fma(_785, _649, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    uint _796 = uint(int(uint(_789) >> uint(2)));
    uint _798 = uint(int(uint(int(_796)) >> uint(2)));
    int _800 = int(_796) & 3;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[int(_798)][_800];
    int _804 = int(_796) + 1;
    uint _806 = uint(int(uint(_804) >> uint(2)));
    int _808 = _804 & 3;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[int(_806)][_808];
    float _812 = fma(_731, _645, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _814 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _816 = isnan(_441);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = fma(_763, _649, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _828 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _830 = isnan(_441);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _842 = 1.0 + _840;
    bool _844 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _846 = isnan(_441);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    int _856 = _789 + 8;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    uint _860 = uint(int(uint(int(_858)) >> uint(2)));
    int _862 = int(_858) & 3;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[int(_860)][_862];
    bool _866 = !_541;
    int _868 = _866 ? 0 : 1;
    float _870 = -_755;
    float _872 = _870 + 1.0;
    bool _874 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _882 = _878 || _880;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _886 = 1.0 / _842;
    float _888 = -_854;
    float _890 = _888 + 1.0;
    float _892 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _747);
    float _894 = _882 ? _872 : 0.0;
    float _896 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _884);
    bool _898 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _900 = isnan(1.0);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _906 = _902 || _904;
    float _908 = _892 * (-0.15915493667125701904296875);
    float _910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _912 = _838 * _890;
    float _914 = -_838;
    float _916 = _914 + 1.0;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _920 = -_129;
    float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[76].x, _593);
    float _924 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _615);
    float _926 = _824 * _916;
    float _928 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[78].w, _918);
    float _930 = _908 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _896);
    float _936 = _751 * _926;
    float _938 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _928);
    if (_906)
    {
        float _940 = _894 * _886;
        _131 = _940;
    }
    float _942 = _131;
    float _944 = _791 * _926;
    float _946 = _812 * _926;
    int _948 = ~_745;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    float _954 = _908 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = _910 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _960 = abs(_868);
    float _962 = _605 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _964 = _952;
    if (!_753)
    {
        int _966 = ~_745;
        int _968 = _966 + 1;
        _964 = _968;
    }
    int _970 = _964;
    float _972 = fma(_958, _735, -0.5);
    float _974 = float(_960);
    float _976 = _589 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _978 = _932 * _667;
    float _980 = float(_970);
    float _982 = _609 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _984 = _802 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _986 = _810 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _988 = ~_749;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = _459 + (-0.5);
    int _996 = _992;
    if (!_743)
    {
        int _998 = ~_749;
        int _1000 = _998 + 1;
        _996 = _1000;
    }
    int _1002 = _996;
    float _1004 = _984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1006 = _781 ? 0 : 1;
    float _1008 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1012 = _956 * _667;
    float _1014 = -_978;
    float _1016 = fma(_956, _972, _1014);
    float _1018 = _974 * _980;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _962 + _1022;
    int _1026 = ~_1006;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    float _1032 = fma(_932, _972, _1012);
    int _1034 = _1030;
    if (!_765)
    {
        int _1036 = ~_1006;
        int _1038 = _1036 + 1;
        _1034 = _1038;
    }
    int _1040 = _1034;
    out.m_65.x = _1004;
    out.m_65.y = _1008;
    out.m_65.z = _1020;
    bool _1042 = !_545;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1048 = _976 + _1046;
    bool _1050 = !_537;
    int _1052 = _1050 ? 0 : 1;
    float _1054 = in.m_67.x;
    float _1056 = in.m_67.y;
    float _1058 = in.m_67.z;
    int _1060 = abs(_1044);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _982 + _1062;
    float _1066 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1068 = _547 + (-0.5);
    float _1070 = float(_1060);
    float _1072 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1066);
    float _1074 = _1024 * _1024;
    int _1076 = abs(_1052);
    float _1078 = -_924;
    float _1080 = fma(_938, _1032, _1078);
    float _1082 = float(_1002);
    float _1084 = fma(_1048, _1048, _1074);
    float _1086 = float(_1076);
    float _1088 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1072);
    float _1090 = float(_1040);
    float _1092 = fma(_1064, _1064, _1084);
    float _1094 = fma(_934, _1016, _922);
    float _1096 = _1018 * (-2.0);
    float _1098 = _1070 * _1082;
    float _1100 = _1086 * _1090;
    bool _1102 = _1088 >= 0.0;
    float _1104 = rsqrt(_1092);
    float _1106 = fma(_697, _1096, _697);
    float _1108 = fma(_1096, _1056, _1056);
    float _1110 = _1100 * (-2.0);
    float _1112 = _1098 * (-2.0);
    float _1114 = _1094 + 0.5;
    float _1116 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1108);
    float _1118 = fma(_669, _1110, _669);
    float _1120 = fma(_1110, _1054, _1054);
    float _1122 = _151 + (-0.5);
    float _1124 = fma(_1106, _942, _1116);
    float _1126 = fma(_1112, _1058, _1058);
    float _1128 = _1080 + 0.5;
    float _1130 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1120);
    float _1132 = _1124 * 0.15915493667125701904296875;
    float _1134 = fma(_693, _1112, _693);
    float _1136 = _1024 * _1104;
    float _1138 = _1048 * _1104;
    float _1140 = _1064 * _1104;
    float _1142 = fma(_1118, _942, _1130);
    float _1144 = -_1136;
    float _1146 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1148 = -_1138;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1152 = -_1140;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1064);
    float _1156 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1126);
    float _1158 = _1146 * _1146;
    float _1160 = in.m_55.x;
    float _1162 = in.m_55.y;
    float _1164 = in.m_55.z;
    float _1166 = _1100;
    if (_1102)
    {
        _1166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1168 = _1166;
    float _1170 = _1132 * 6.283185482025146484375;
    float _1172 = sin(_1170);
    float _1174 = fma(_1150, _1150, _1158);
    out.m_69.x = _1114;
    out.m_69.y = _1128;
    int _1176 = as_type<int>(_1168);
    if (_1102)
    {
        float _1178 = _1168 * 5.0;
        _1176 = as_type<int>(_1178);
    }
    int _1180 = _1176;
    float _1182 = fma(_1154, _1154, _1174);
    if (_1102)
    {
        out.m_49.x = 0.0;
    }
    float _1184 = _1132 * 6.283185482025146484375;
    float _1186 = cos(_1184);
    float _1188 = sqrt(_1182);
    if (_1102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3884 = as_type<float>(_1180);
        out.gl_Position.z = _3884;
    }
    float _1190 = _1164;
    if (_1102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1192 = -_1136;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _962);
    float _1196 = -_824;
    float _1198 = _1196 + 1.0;
    float _1200 = -_1138;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1204 = -_1140;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1210 = _1194 + _1208;
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[143].y, _944);
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = _1202 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1220 = _1206 + _1218;
    float _1222 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1224 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[143].x, _936);
    float _1226 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[143].z, _946);
    float _1228 = fma(_793, _912, _1212);
    float _1230 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1222);
    float _1232 = fma(_771, _912, _1224);
    float _1234 = _1142 * 0.15915493667125701904296875;
    float _1236 = fma(_1134, _942, _1156);
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1230);
    float _1240 = fma(_826, _912, _1226);
    float _1242 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1232);
    float _1244 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1228);
    float _1246 = _1234 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    bool _1250 = _1238 >= 0.0;
    float _1252 = _1236 * 0.15915493667125701904296875;
    float _1254 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[145].z, _1240);
    float _1256 = _1242 * _1160;
    float _1258 = _1244 * _1162;
    float _1260 = _1104 * _1188;
    float _1262 = _1254 * _1164;
    float _1264 = _1234 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = _413 * _1258;
    float _1270 = _409 * _1256;
    float _1272 = _1206;
    if (_1250)
    {
        _1190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1274 = _1190;
    int _1276 = as_type<int>(_1274);
    if (_1250)
    {
        out.m_49.x = 0.0;
    }
    float _1278 = _1252 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1248 * _1172;
    if (_1250)
    {
        float _1284 = _1274 * 5.0;
        _1276 = as_type<int>(_1284);
    }
    int _1286 = _1276;
    float _1288 = floor(_481);
    float _1290 = _1266 * _1186;
    if (_1250)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4064 = as_type<float>(_1286);
        out.gl_Position.z = _4064;
    }
    float _1292 = fma(_1280, _1290, _1282);
    float _1294 = fma(_1280, _1282, _1290);
    float _1296 = -_1288;
    float _1298 = _481 + _1296;
    if (_1250)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1300 = _1252 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = -_509;
    float _1306 = _1304 + _529;
    float _1308 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1310 = _1266 * _1172;
    float _1312 = _1248 * _1186;
    float _1314 = fma(_1298, _1306, _509);
    float _1316 = -_507;
    float _1318 = _1316 + _527;
    float _1320 = _1260 * _1308;
    float _1322 = -_1310;
    float _1324 = fma(_1280, _1312, _1322);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1314);
    float _1328 = -_1312;
    float _1330 = fma(_1280, _1310, _1328);
    float _1332 = -_511;
    float _1334 = _1332 + _531;
    float _1336 = fma(_1298, _1318, _507);
    float _1338 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1340 = _1326 * _1320;
    float _1342 = fma(_1298, _1334, _511);
    float _1344 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1346 = _1260 * _1338;
    float _1348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1336);
    float _1350 = _1302 * _1340;
    float _1352 = _1172 * _1302;
    float _1354 = _1186 * _1302;
    float _1356 = _1260 * _1344;
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1342);
    float _1360 = _1348 * _1346;
    float _1362 = _1266 * _1350;
    float _1364 = -_1340;
    float _1366 = _1280 * _1364;
    float _1368 = _1358 * _1356;
    float _1370 = _1248 * _1350;
    float _1372 = fma(_1292, _1360, _1362);
    float _1374 = fma(_1354, _1360, _1366);
    float _1376 = fma(_1324, _1360, _1370);
    float _1378 = fma(_1330, _1368, _1372);
    float _1380 = fma(_1352, _1368, _1374);
    float _1382 = fma(_1294, _1368, _1376);
    float _1384 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1388 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1386);
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1388);
    float _1394 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1390);
    float _1396 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1398 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1400 = _976 + _1396;
    float _1402 = _982 + _1398;
    float _1404 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1408 = _1400 + _1406;
    float _1410 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1412 = _1402 + _1410;
    float _1414 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1404);
    float _1416 = _1408 * _1408;
    float _1418 = _1412 * _1412;
    float _1420 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1414);
    float _1422 = _1416 + _1418;
    float _1424 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1426 = sqrt(_1422);
    float _1428 = _962 + _1424;
    bool _1430 = _1426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1432 = _1424;
    float _1434 = _1420;
    float _1436 = _1402;
    float _1438 = _1418;
    float _1440 = _1400;
    float _1442 = _1412;
    float _1444 = _1330;
    if (!_1430)
    {
        _1432 = _1402;
    }
    float _1446 = _1432;
    float _1448 = _1446;
    if (!_1430)
    {
        _1434 = _1416;
    }
    float _1450 = _1434;
    float _1452 = _1450;
    if (!_1430)
    {
        _1436 = _1428;
    }
    float _1454 = _1436;
    bool _1456 = !_1430;
    float _1458 = _1454;
    if (!_1456)
    {
        float _1460 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1464 = _1426 + _1462;
        float _1466 = rsqrt(_1422);
        float _1468 = _1464 * _1460;
        float _1470 = _1428 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = _1468 * 0.15915493667125701904296875;
        float _1474 = _1472 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = _1472 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = fma(_1476, _1470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1484 = _1466 * _1482;
        float _1486 = _1480 + (-1.0);
        float _1488 = fma(_1408, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1490 = fma(_1412, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1492 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1496 = _1488 + _1494;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1500 = _1490 + _1498;
        float _1502 = fma(_1428, _1480, _1492);
        float _1504 = _1496 * _1496;
        float _1506 = _1500 * _1500;
        _1458 = _1502;
        _1452 = _1504;
        _1438 = _1506;
        _1440 = _1488;
        _1448 = _1490;
    }
    float _1508 = _1458;
    float _1510 = _1452;
    float _1512 = _1438;
    float _1514 = _1440;
    float _1516 = _1448;
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1520 = _1508 + _1518;
    float _1522 = fma(_1520, _1520, _1510);
    float _1524 = _1522 + _1512;
    float _1526 = sqrt(_1524);
    bool _1528 = _1526 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1530 = isnan(_1526);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1536 = _1532 || _1534;
    float _1538 = _1510;
    if (!_1536)
    {
        _1538 = 1.0;
    }
    float _1540 = _1538;
    bool _1542 = !_1536;
    float _1544 = _1540;
    if (!_1542)
    {
        bool _1546 = _1526 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1548 = isnan(_1526);
        bool _1550 = _1546 || _1548;
        bool _1552 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1554 = _1550 || _1552;
        if (!_1554)
        {
            float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1558 = _1526 + _1556;
            float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1562 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1560;
            float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1568 = 1.0 / _1562;
            float _1570 = _1558 * _1568;
            float _1572 = fma(_1570, _1566, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1544 = _1572;
            _1574 = true;
        }
        else
        {
            bool _1576 = _1526 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1578 = isnan(_1526);
            bool _1580 = _1576 || _1578;
            bool _1582 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1584 = _1580 || _1582;
            if (!_1584)
            {
                float _1586 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1588 = _1526 + _1586;
                float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1592 = _1590 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1596 = _1594 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1598 = 1.0 / _1592;
                float _1600 = _1588 * _1598;
                float _1602 = fma(_1600, _1596, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1544 = _1602;
                _1574 = true;
            }
            else
            {
                _1544 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1574 = false;
    float _1604 = _1544;
    float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1608 = _1508 + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1612 = _1514 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1616 = _1516 + _1614;
    bool _1618 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(0.5);
    bool _1626 = _1622 || _1624;
    float _1628 = fma(_1608, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1630 = fma(_1612, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1632 = fma(_1616, _1604, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1634 = -_1136;
    float _1636 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1628);
    float _1638 = -_1138;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1630);
    float _1642 = -_1140;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1632);
    float _1646 = _1636;
    float _1648 = _1640;
    float _1650 = _1644;
    if (!_1626)
    {
        float _1652 = _1210 * _1210;
        float _1654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1656 = -_982;
        float _1658 = _1656 + _1632;
        float _1660 = -_976;
        float _1662 = _1660 + _1630;
        float _1664 = fma(_1216, _1216, _1652);
        float _1666 = fma(_1220, _1220, _1664);
        float _1668 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1670 = sqrt(_1666);
        float _1672 = 1.0 / _1260;
        float _1674 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1676 = precise::min(_1670, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1678 = _1676 * _1654;
        float _1680 = _1678 * _1672;
        float _1682 = -_962;
        float _1684 = _1682 + _1628;
        float _1686 = _1674 * _1680;
        float _1688 = _1658 * _1680;
        float _1690 = fma(_1684, _1686, _1194);
        float _1692 = fma(_1662, _1686, _1202);
        float _1694 = fma(_1674, _1688, _1206);
        _1646 = _1690;
        _1648 = _1692;
        _1650 = _1694;
    }
    float _1696 = _1646;
    float _1698 = _1648;
    float _1700 = _1650;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1696 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1708 = _1698 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1700 + _1710;
    float _1714 = _1704 * _1704;
    float _1716 = fma(_1708, _1708, _1714);
    float _1718 = fma(_1712, _1712, _1716);
    float _1720 = rsqrt(_1718);
    float _1722 = sqrt(_1718);
    float _1724 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1726 = _1708 * _1724;
    float _1728 = _1712 * _1724;
    float _1730 = _1726 * _1726;
    float _1732 = _1728 * _1728;
    float _1734 = _1730 + _1732;
    float _1736 = sqrt(_1734);
    bool _1738 = _1736 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1742 = _1736 + _1740;
    float _1744 = _1712;
    float _1746 = _1714;
    float _1748 = _1742;
    float _1750 = _1724;
    if (_1738)
    {
        float _1752 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1744 = _1752;
    }
    float _1754 = _1744;
    if (_1738)
    {
        float _1756 = rsqrt(_1734);
        _1746 = _1756;
    }
    float _1758 = _1746;
    float _1760 = _1758;
    if (_1738)
    {
        float _1762 = _1742 * _1754;
        _1748 = _1762;
    }
    float _1764 = _1748;
    if (_1738)
    {
        float _1766 = _1764 * 0.15915493667125701904296875;
        _1442 = _1766;
    }
    float _1768 = _1442;
    float _1770 = _1720;
    float _1772 = _1768;
    if (_1738)
    {
        float _1774 = _1768 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1782 = precise::max(0.0, _1780);
    float _1784 = _1628;
    float _1786 = _1782;
    float _1788 = _1780;
    if (_1738)
    {
        float _1790 = _1768 * 6.283185482025146484375;
        float _1792 = cos(_1790);
        _1784 = _1792;
    }
    float _1794 = _1784;
    float _1796 = -_1724;
    float _1798 = -_1782;
    float _1800 = fma(_1704, _1796, _1798);
    if (_1738)
    {
        float _1802 = _1800 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1786 = _1802;
    }
    float _1804 = _1786;
    float _1806 = _1804;
    if (!_1738)
    {
        _1772 = _1730;
    }
    float _1808 = _1772;
    float _1810 = _1778;
    float _1812 = _1808;
    if (_1738)
    {
        float _1814 = fma(_1778, _1804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1810 = _1814;
    }
    float _1816 = _1810;
    float _1818 = _1816;
    if (!_1738)
    {
        _1806 = _1728;
    }
    float _1820 = _1806;
    float _1822 = _1820;
    if (_1738)
    {
        float _1824 = _1794 + (-1.0);
        _1788 = _1824;
    }
    float _1826 = _1788;
    float _1828 = _1826;
    if (_1738)
    {
        float _1830 = _1758 * _1816;
        _1444 = _1830;
    }
    float _1832 = _1444;
    if (!_1738)
    {
        _1760 = _1726;
    }
    float _1834 = _1760;
    float _1836 = _1834;
    if (_1738)
    {
        float _1838 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1838;
    }
    float _1840 = _1750;
    if (_1738)
    {
        float _1842 = _1726 * _1832;
        _1836 = _1842;
    }
    float _1844 = _1836;
    if (!_1738)
    {
        _1818 = _1800;
    }
    float _1846 = _1818;
    float _1848 = _1846;
    if (_1738)
    {
        float _1850 = _1728 * _1832;
        _1822 = _1850;
    }
    float _1852 = _1822;
    if (_1738)
    {
        float _1854 = fma(_1800, _1794, _1840);
        _1848 = _1854;
    }
    float _1856 = _1848;
    if (_1738)
    {
        float _1858 = _1844 * _1844;
        _1812 = _1858;
    }
    float _1860 = _1812;
    if (!_1738)
    {
        _1828 = _1732;
    }
    float _1862 = _1828;
    float _1864 = _1862;
    if (_1738)
    {
        float _1866 = _1852 * _1852;
        _1864 = _1866;
    }
    float _1868 = _1864;
    float _1870 = fma(_1856, _1856, _1860);
    float _1872 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1874 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1876 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1878 = _1870 + _1868;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1882 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1880);
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1888 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1872);
    float _1890 = rsqrt(_1878);
    float _1892 = -_1884;
    float _1894 = _1892 + 1.0;
    float _1896 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1886);
    float _1898 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1888);
    float _1900 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1902 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1874);
    float _1904 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1896);
    float _1906 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1908 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1900);
    float _1910 = abs(_1894);
    float _1912 = log2(_1910);
    float _1914 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1902);
    float _1916 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1918 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1908);
    float _1920 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1890 * _1844;
    float _1928 = _1890 * _1856;
    float _1930 = _1890 * _1852;
    float _1932 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1936 = -_1920;
    float _1938 = fma(_1936, _1876, 1.0);
    float _1940 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1942 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1932);
    float _1944 = -_1934;
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1944);
    float _1948 = log2(_1938);
    float _1950 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1952 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1954 = -_1930;
    float _1956 = fma(_1954, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1946);
    float _1958 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1960 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1952);
    float _1962 = fma(_1956, -0.5, 0.5);
    float _1964 = exp2(_1950);
    float _1966 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1942);
    float _1968 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1958);
    float _1970 = fma(_1956, 0.5, 0.5);
    float _1972 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1960);
    float _1974 = _1928 + 1.0;
    float _1976 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1968);
    float _1978 = fma(_1970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1980 = 1.0 / _1966;
    float _1982 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1972);
    float _1984 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1976);
    float _1986 = fma(_1970, _1978, -0.212114393711090087890625);
    float _1988 = _1948 * 0.693147182464599609375;
    float _1990 = fma(_1970, _1986, 1.570728778839111328125);
    float _1992 = sqrt(_1962);
    float _1994 = -_1928;
    float _1996 = fma(_1964, _1974, _1994);
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1996, 0.5, 0.5);
    float _2002 = _1982 * _1980;
    float _2004 = _1984 * _1980;
    float _2006 = fma(_2002, 0.5, 0.5);
    float _2008 = fma(_2004, -0.5, 0.5);
    float _2010 = _1992 * 0.636619746685028076171875;
    float3 _5244 = float3(_2006, _2008, _1998);
    float _2012 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5244, float3(0.0), isnan(_5244)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5244, float3(0.0), isnan(_5244)), level(0.0)).x;
    float3 _5255 = float3(_2006, _2008, _1998);
    float4 _2015 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5255, float3(0.0), isnan(_5255)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5255, float3(0.0), isnan(_5255)), level(0.0)).xyzw;
    float _2017 = _2015.x;
    float _2019 = _2015.y;
    float _2021 = _2015.z;
    float _2023 = _2015.w;
    float _2025 = -_1990;
    float _2027 = fma(_2010, _2025, 1.0);
    float2 _5277 = float2(_2027, _2000);
    float3 _2029 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5277, float2(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5277, float2(0.0), isnan(_5277)), level(0.0)).xyz;
    float _2031 = _2029.x;
    float _2033 = _2029.y;
    float _2035 = _2029.z;
    float _2037 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2039 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2041 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2037);
    float _2043 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2045 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2039);
    float _2047 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2041);
    float _2049 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2043);
    bool _2051 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2053 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(0.5);
    bool _2059 = _2055 || _2057;
    float _2061 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2063 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2049);
    float _2065 = 1.0 / _2061;
    float _2067 = _2063 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2069 = _2067 + _2061;
    float _2071 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2073 = _2047;
    if (!_2059)
    {
        _1272 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2075 = _1272;
    float _2077 = _2075;
    if (_2059)
    {
        _2071 = 1.0;
    }
    float _2079 = _2071;
    float _2081 = _2069 * _2065;
    float _2083 = _2081 * 0.5;
    float _2085 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2087 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2045);
    float _2089 = _2083;
    float _2091 = _2079;
    if (!_2059)
    {
        float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2095 = fma(_2083, _2075, _2093);
        _2077 = _2095;
    }
    float _2097 = _2077;
    if (!_2059)
    {
        _2089 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2099 = _2089;
    float _2101 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2087);
    float _2103 = exp2(_2085);
    float _2105 = _2099;
    if (!_2059)
    {
        float _2107 = -_2099;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2073 = _2109;
    }
    float _2111 = _2073;
    out.gl_Position.x = _1982;
    out.gl_Position.y = _1984;
    out.gl_Position.z = _2101;
    out.gl_Position.w = _1966;
    float _2113 = _2097;
    if (!_2059)
    {
        float _2115 = 1.0 / _2097;
        _2113 = _2115;
    }
    float _2117 = _2113;
    float _2119 = _2061;
    if (!_2059)
    {
        float _2121 = 1.0 / _2111;
        _2119 = _2121;
    }
    float _2123 = _2119;
    if (!_2059)
    {
        float _2125 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2127 = -_2099;
        float _2129 = fma(_2117, _2125, _2127);
        _2105 = _2129;
    }
    float _2131 = _2105;
    float _2133 = -_2103;
    float _2135 = _2133 + 1.0;
    float _2137 = _2101 + _1966;
    float _2139 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2059)
    {
        float _2141 = _2131 * _2123;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        _2091 = _2143;
    }
    float _2145 = _2091;
    float _2147 = _2137 * 0.5;
    float _2149 = _2145 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2151 = _2145 > 0.0;
    bool _2153 = isnan(_2145);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan(0.0);
    bool _2159 = _2155 || _2157;
    out.m_71.z = _2147;
    out.m_71.w = _1966;
    float _2161 = _2149 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = _2161;
    float _2163 = _2139 * _2012;
    float _2165 = -_2139;
    float _2167 = _2165 + 1.0;
    float _2169 = _2023 * _2163;
    float _2171 = _2035 * _2163;
    float _2173 = fma(_2031, _2169, _2017);
    float _2175 = fma(_2033, _2169, _2019);
    float _2177 = _2023 * _2167;
    float _2179 = fma(_2023, _2171, _2021);
    out.m_73.x = _2173;
    out.m_73.y = _2175;
    out.m_73.z = _2179;
    out.m_73.w = _2177;
    if (_2159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2181;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

