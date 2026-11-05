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
    float4 m_59 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _86(thread const int& _5228, thread const int& _5229, constant _10& support_buffer)
{
    float _5232 = as_type<float>(support_buffer._m4);
    int _5234 = _5229 + as_type<int>(_5232);
    int _5236 = 1 + _5234;
    float _5238 = support_buffer._m5[_5236].x;
    float _5240 = abs(_5238);
    bool _5242 = _5240 == 1.0;
    if (_5242)
    {
        return _5228;
    }
    float _5244 = float(_5228);
    float _5246 = _5244 / _5240;
    int _5248 = int(_5246);
    return _5248;
}

static inline __attribute__((always_inline))
int _87(thread const int& _5278, thread const int& _5279, constant _10& support_buffer)
{
    float _5282 = as_type<float>(support_buffer._m4);
    int _5284 = _5279 + as_type<int>(_5282);
    int _5286 = 1 + _5284;
    float _5288 = support_buffer._m5[_5286].x;
    bool _5290 = _5288 == 1.0;
    if (_5290)
    {
        return _5278;
    }
    float _5292 = float(_5278);
    float _5294 = _5292 * _5288;
    int _5296 = int(_5294);
    return _5296;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1460 = false;
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
        float _2126 = as_type<float>(_111);
        out.gl_Position.z = _2126;
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
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2195 = as_type<float>(_149);
        out.gl_Position.z = _2195;
    }
    if (_143)
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
    float _307 = fma(_225, 0.5, 0.5);
    bool _309 = _229 < 0.5;
    float _311 = float(_309);
    float _313 = -_229;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = fma(_233, 0.5, 0.5);
    bool _319 = _237 < 0.5;
    float _321 = float(_319);
    float _323 = -_311;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _329 = _327 != 0;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _333 = _331 != 0;
    float _335 = -_307;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _339 = -_237;
    float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _343 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = -_321;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _349 = !_329;
    int _351 = _349 ? 0 : 1;
    float _353 = -_317;
    float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _357 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _359 = !_215;
    int _361 = _359 ? 0 : 1;
    float _363 = fma(_297, _203, _343);
    int _365 = abs(_351);
    float _367 = fma(_297, _205, _357);
    bool _369 = !_333;
    int _371 = _369 ? 0 : 1;
    float _373 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _375 = abs(_361);
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _379 = fma(_297, _207, _373);
    int _381 = abs(_371);
    float _383 = fma(_363, _299, _301);
    float _385 = float(_365);
    float _387 = fma(_367, _299, _303);
    float _389 = float(_375);
    float _391 = fma(_379, _299, _305);
    float _393 = abs(_315);
    float _395 = _385 * _393;
    float _397 = abs(_341);
    float _399 = _385 * _397;
    float _401 = float(_381);
    float _403 = fma(_389, _337, _395);
    float _405 = fma(_389, _355, _399);
    float _407 = abs(_325);
    float _409 = fma(_401, _407, _403);
    float _411 = abs(_347);
    float _413 = fma(_401, _411, _405);
    bool _415 = !_377;
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
    float _455 = rint(_451);
    float _457 = _455 * 0.125;
    float _459 = precise::clamp(_457, 0.0, 1.0);
    int _461 = _449 + (-1);
    float _463 = float(_461);
    float _465 = _459 * _463;
    float _467 = trunc(_453);
    int _469 = int(_467);
    float _471 = trunc(_465);
    int _473 = int(_471);
    int _475 = _473 + 1;
    int _477 = min(_461, _475);
    int _479 = _473;
    int _481 = 0;
    int _483 = _87(_479, _481, (*spvDescriptorSet0.support_buffer));
    int _485 = _469;
    int _487 = 0;
    int _489 = _87(_485, _487, (*spvDescriptorSet0.support_buffer));
    float3 _493 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_483, _489)), 0).xyz;
    float _495 = _493.x;
    float _497 = _493.y;
    float _499 = _493.z;
    int _501 = _477;
    int _503 = 0;
    int _505 = _87(_501, _503, (*spvDescriptorSet0.support_buffer));
    int _507 = _469;
    int _509 = 0;
    int _511 = _87(_507, _509, (*spvDescriptorSet0.support_buffer));
    float3 _513 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_505, _511)), 0).xyz;
    float _515 = _513.x;
    float _517 = _513.y;
    float _519 = _513.z;
    float _521 = in.m_57.y;
    float _523 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _531 = _529 != 0;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _535 = _533 != 0;
    float _537 = in.m_53.y;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _541 = _539 != 0;
    float _543 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _523);
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _547 = _545 != 0;
    float _549 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _551 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = _151 * 2.0;
    float _555 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
    float _557 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _559;
    float _563 = floor(_553);
    float _565 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
    float _567 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = -_521;
    float _579 = _577 + 1.0;
    float _581 = 1.0 / _561;
    float _583 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _543);
    float _585 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _557);
    bool _587 = _537 > 0.5;
    float _589 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _591 = in.m_53.z;
    float _593 = -_569;
    float _595 = fma(_567, 2.0, _593);
    float _597 = _521;
    if (_547)
    {
        float _599 = _587 ? _579 : _521;
        _597 = _599;
    }
    float _601 = _597;
    float _603 = fma(_589, -2.0, _571);
    float _605 = in.m_57.x;
    float _607 = 1.0 / _575;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _611 = _151 > 0.5;
    bool _613 = _611 && _541;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _619 = _441 + _617;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = _441 + _627;
    float _631 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _635 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _629 * _581;
    float _639 = _537 * 2.0;
    bool _641 = _563 > 0.0;
    float _643 = _619 * _607;
    out.m_59.x = _631;
    out.m_59.y = _633;
    out.m_59.z = _635;
    out.m_59.w = _623;
    float _645 = floor(_639);
    bool _647 = _563 >= 0.0;
    bool _649 = isnan(_563);
    bool _651 = _647 || _649;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    float _657 = _591 * 2.0;
    float _659 = -_129;
    float _661 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[76].x, _595);
    float _663 = 0.0;
    if (_541)
    {
        _663 = _605;
    }
    float _665 = _663;
    float _667 = _625 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _669 = floor(_657);
    float _671 = _665;
    if (_613)
    {
        float _673 = -_665;
        float _675 = _673 + 1.0;
        _671 = _675;
    }
    float _677 = _671;
    float _679 = fma(_667, _601, -0.5);
    float _681 = _151 + _591;
    float _683 = _537 + _591;
    float _685 = _151 + _537;
    float _687 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _689 = log2(_687);
    float _691 = _681 + (-1.0);
    float _693 = _683 + (-1.0);
    bool _695 = _645 > 0.0;
    float _697 = _685 + (-1.0);
    float _699 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _703 = _655 ? 0 : 1;
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _707 = _645 >= 0.0;
    bool _709 = isnan(_645);
    bool _711 = _707 || _709;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _719 = _565 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _721 = _585 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _723 = _697;
    float _725 = _721;
    if (!_541)
    {
        _723 = _605;
    }
    float _727 = _723;
    float _729 = _689 * _129;
    int _731 = ~_703;
    int _733 = _731 + 1;
    int _735 = _733 + 1;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _737;
    float _741 = _727;
    int _743 = _735;
    if (_541)
    {
        _741 = _677;
    }
    float _745 = _741;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _747;
    if (!_641)
    {
        int _751 = ~_703;
        int _753 = _751 + 1;
        _743 = _753;
    }
    int _755 = _743;
    float _757 = exp2(_729);
    bool _759 = _669 > 0.0;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _761;
    bool _765 = _669 >= 0.0;
    bool _767 = isnan(_669);
    bool _769 = _765 || _767;
    bool _771 = isnan(0.0);
    bool _773 = _769 || _771;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _787 = fma(_739, _637, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _789 = fma(_763, _637, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _791 = fma(_749, _637, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _793 = fma(_777, _643, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _795 = fma(_781, _643, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _797 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _799 = isnan(_441);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = fma(_785, _643, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _811 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _813 = isnan(_441);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = _583 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _825 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _827 = isnan(_441);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_757;
    float _839 = _837 + 1.0;
    float _841 = -_835;
    float _843 = _841 + 1.0;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _847 = 1.0 + _845;
    bool _849 = !_531;
    int _851 = _849 ? 0 : 1;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _855 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _863 = _859 || _861;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _867 = 1.0 / _847;
    float _869 = _863 ? _839 : 0.0;
    float _871 = _821 * _843;
    float _873 = -_821;
    float _875 = _873 + 1.0;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _879 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[79].z, _853);
    float _881 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].w, _865);
    float _883 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _885 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _877);
    bool _887 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(1.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = _807 * _875;
    float _899 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _879);
    float _901 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _881);
    float _903 = _717 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _905 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _603);
    float _907 = _883 * _151;
    float _909 = _787 * _897;
    float _911 = _789 * _897;
    float _913 = _791 * _897;
    int _915 = abs(_851);
    float _917 = fma(_903, _745, -0.5);
    float _919 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _885);
    float _921 = in.m_61.x;
    float _923 = in.m_61.y;
    float _925 = in.m_61.z;
    if (_895)
    {
        float _927 = _869 * _867;
        _133 = _927;
    }
    float _929 = _133;
    int _931 = _773 ? 0 : 1;
    float _933 = -_807;
    float _935 = _933 + 1.0;
    float _937 = trunc(_907);
    int _939 = int(_937);
    float _941 = float(_755);
    float _943 = _537 + (-0.5);
    float _945 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[143].x, _909);
    float _947 = float(_915);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[143].y, _911);
    bool _951 = !_535;
    int _953 = _951 ? 0 : 1;
    float _955 = fma(_793, _871, _945);
    int _957 = _715 ? 0 : 1;
    float _959 = _947 * _941;
    int _961 = ~_931;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[143].z, _913);
    int _969 = _965;
    if (!_759)
    {
        int _971 = ~_931;
        int _973 = _971 + 1;
        _969 = _973;
    }
    int _975 = _969;
    float _977 = _959 * (-2.0);
    bool _979 = !_527;
    int _981 = _979 ? 0 : 1;
    float _983 = _591 + (-0.5);
    int _985 = abs(_953);
    float _987 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[145].x, _955);
    int _989 = abs(_981);
    float _991 = fma(_809, _871, _967);
    int _993 = ~_957;
    int _995 = _993 + 1;
    int _997 = _995 + 1;
    float _999 = fma(_701, _977, _701);
    int _1001 = _997;
    if (!_695)
    {
        int _1003 = ~_957;
        int _1005 = _1003 + 1;
        _1001 = _1005;
    }
    int _1007 = _1001;
    float _1009 = _899 * (-0.15915493667125701904296875);
    float _1011 = float(_989);
    float _1013 = fma(_977, _923, _923);
    float _1015 = float(_975);
    float _1017 = _1009 * 6.283185482025146484375;
    float _1019 = sin(_1017);
    int _1021 = _939 << 4;
    int _1023 = _1021 + 1968;
    float _1025 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1013);
    float _1027 = fma(_795, _871, _949);
    float _1029 = _1011 * _1015;
    float _1031 = float(_985);
    uint _1034 = uint(int(uint(_1023) >> uint(2)));
    uint _1036 = uint(int(uint(int(_1034)) >> uint(2)));
    int _1038 = int(_1034) & 3;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[int(_1036)][_1038];
    int _1042 = int(_1034) + 1;
    uint _1044 = uint(int(uint(_1042) >> uint(2)));
    int _1046 = _1042 & 3;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[int(_1044)][_1046];
    float _1050 = float(_1007);
    float _1052 = _1009 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    float _1056 = _1029 * (-2.0);
    float _1058 = _151 + (-0.5);
    float _1060 = fma(_999, _929, _1025);
    float _1062 = _1031 * _1050;
    float _1064 = fma(_1056, _921, _921);
    int _1066 = _1023 + 8;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    uint _1070 = uint(int(uint(int(_1068)) >> uint(2)));
    int _1072 = int(_1068) & 3;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[int(_1070)][_1072];
    float _1076 = fma(_705, _1056, _705);
    float _1078 = _1019 * _679;
    float _1080 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1064);
    float _1082 = _1062 * (-2.0);
    float _1084 = _1060 * 0.15915493667125701904296875;
    float _1086 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[145].z, _991);
    float _1088 = fma(_1076, _929, _1080);
    float _1090 = fma(_1082, _925, _925);
    float _1092 = fma(_699, _1082, _699);
    float _1094 = _1054 * _679;
    float _1096 = -_1078;
    float _1098 = fma(_1054, _917, _1096);
    float _1100 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1090);
    float _1102 = in.m_55.x;
    float _1104 = in.m_55.y;
    float _1106 = in.m_55.z;
    float _1108 = _1088 * 0.15915493667125701904296875;
    float _1110 = _1084 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = fma(_1092, _929, _1100);
    float _1116 = fma(_919, _1098, _661);
    float _1118 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1027);
    float _1120 = fma(_1019, _917, _1094);
    float _1122 = _1114 * 0.15915493667125701904296875;
    float _1124 = _1084 * 6.283185482025146484375;
    float _1126 = cos(_1124);
    float _1128 = -_905;
    float _1130 = fma(_901, _1120, _1128);
    float _1132 = _1116 + 0.5;
    float _1134 = _1130 + 0.5;
    float _1136 = _1108 * 6.283185482025146484375;
    float _1138 = sin(_1136);
    out.m_63.x = _1132;
    out.m_63.y = _1134;
    float _1140 = _987 * _1102;
    float _1142 = _1118 * _1104;
    float _1144 = _1108 * 6.283185482025146484375;
    float _1146 = cos(_1144);
    float _1148 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1150 = _409 * _1140;
    float _1152 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1154 = _413 * _1142;
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = _1086 * _1106;
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1162 = _1122 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1168 = _1138 * _1126;
    float _1170 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1172 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1178 = floor(_465);
    float _1180 = _1146 * _1112;
    out.m_65.x = _1156;
    out.m_65.y = _1160;
    out.m_65.z = _1174;
    float _1182 = _1146 * _1126;
    float _1184 = -_1180;
    float _1186 = fma(_1164, _1168, _1184);
    float _1188 = -_1168;
    float _1190 = fma(_1164, _1180, _1188);
    float _1192 = _1122 * 6.283185482025146484375;
    float _1194 = cos(_1192);
    float _1196 = -_1178;
    float _1198 = _465 + _1196;
    float _1200 = _1126 * _1194;
    float _1202 = -_497;
    float _1204 = _1202 + _517;
    float _1206 = -_495;
    float _1208 = _1206 + _515;
    float _1210 = -_499;
    float _1212 = _1210 + _519;
    float _1214 = _1138 * _1112;
    float _1216 = fma(_1198, _1204, _497);
    float _1218 = fma(_1198, _1208, _495);
    float _1220 = fma(_1198, _1212, _499);
    float _1222 = fma(_1164, _1182, _1214);
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1216);
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1218);
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1220);
    float _1230 = _1112 * _1194;
    float _1232 = _1170 * _1224;
    float _1234 = _1172 * _1226;
    float _1236 = _1176 * _1228;
    float _1238 = fma(_1164, _1214, _1182);
    float _1240 = _1194 * _1232;
    float _1242 = -_1232;
    float _1244 = _1164 * _1242;
    float _1246 = _1146 * _1240;
    float _1248 = fma(_1200, _1234, _1244);
    float _1250 = fma(_1222, _1234, _1246);
    float _1252 = _1138 * _1240;
    float _1254 = fma(_1230, _1236, _1248);
    float _1256 = fma(_1190, _1236, _1250);
    float _1258 = fma(_1186, _1234, _1252);
    float _1260 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1262 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1264 = fma(_1238, _1236, _1258);
    float _1266 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1260);
    float _1268 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1262);
    float _1270 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1266);
    float _1272 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1268);
    float _1274 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1276 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1278 = _719 + _1274;
    float _1280 = _721 + _1276;
    float _1282 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1286 = _1278 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1282);
    float _1294 = _1286 * _1286;
    float _1296 = _1290 * _1290;
    float _1298 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1292);
    float _1300 = _1294 + _1296;
    float _1302 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1304 = sqrt(_1300);
    float _1306 = _823 + _1302;
    bool _1308 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1310 = _1264;
    float _1312 = _1282;
    float _1314 = _1296;
    float _1316 = _1280;
    float _1318 = _1278;
    float _1320 = _1164;
    if (!_1308)
    {
        _1310 = _1294;
    }
    float _1322 = _1310;
    float _1324 = _1322;
    if (!_1308)
    {
        _1312 = _1306;
    }
    float _1326 = _1312;
    bool _1328 = !_1308;
    float _1330 = _1326;
    if (!_1328)
    {
        float _1332 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1336 = _1304 + _1334;
        float _1338 = rsqrt(_1300);
        float _1340 = _1336 * _1332;
        float _1342 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = _1340 * 0.15915493667125701904296875;
        float _1346 = _1344 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        float _1350 = _1344 * 6.283185482025146484375;
        float _1352 = cos(_1350);
        float _1354 = fma(_1348, _1342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1356 = _1338 * _1354;
        float _1358 = _1352 + (-1.0);
        float _1360 = fma(_1286, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1362 = fma(_1290, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1364 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1368 = _1360 + _1366;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1372 = _1362 + _1370;
        float _1374 = fma(_1306, _1352, _1364);
        float _1376 = _1368 * _1368;
        float _1378 = _1372 * _1372;
        _1330 = _1374;
        _1324 = _1376;
        _1314 = _1378;
        _1316 = _1362;
        _1318 = _1360;
    }
    float _1380 = _1330;
    float _1382 = _1324;
    float _1384 = _1314;
    float _1386 = _1316;
    float _1388 = _1318;
    float _1390 = in.m_67.x;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1394 = _1380 + _1392;
    float _1396 = in.m_67.y;
    float _1398 = fma(_1394, _1394, _1382);
    float _1400 = in.m_67.z;
    float _1402 = _1398 + _1384;
    float _1404 = in.m_67.w;
    float _1406 = sqrt(_1402);
    out.m_69.x = _1390;
    out.m_69.y = _1396;
    bool _1408 = _1406 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1410 = isnan(_1406);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1416 = _1412 || _1414;
    out.m_69.z = _1400;
    out.m_69.w = _1404;
    float _1418 = _1398;
    float _1420 = _1388;
    float _1422 = _1396;
    float _1424 = _1406;
    if (!_1416)
    {
        _1418 = 1.0;
    }
    float _1426 = _1418;
    bool _1428 = !_1416;
    float _1430 = _1426;
    if (!_1428)
    {
        bool _1432 = _1406 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1434 = isnan(_1406);
        bool _1436 = _1432 || _1434;
        bool _1438 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1440 = _1436 || _1438;
        if (!_1440)
        {
            float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1444 = _1406 + _1442;
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1454 = 1.0 / _1448;
            float _1456 = _1444 * _1454;
            float _1458 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1430 = _1458;
            _1460 = true;
        }
        else
        {
            bool _1462 = _1406 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1464 = isnan(_1406);
            bool _1466 = _1462 || _1464;
            bool _1468 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1470 = _1466 || _1468;
            if (!_1470)
            {
                float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1474 = _1406 + _1472;
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1476 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1484 = 1.0 / _1478;
                float _1486 = _1474 * _1484;
                float _1488 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1430 = _1488;
                _1460 = true;
            }
            else
            {
                _1430 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1460 = false;
    float _1490 = _1430;
    float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1494 = _1380 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1498 = _1386 + _1496;
    bool _1500 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(0.5);
    bool _1508 = _1504 || _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1512 = _1388 + _1510;
    float _1514 = fma(_1494, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1516 = fma(_1498, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1518 = fma(_1512, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1520 = _1512;
    float _1522 = _1498;
    if (_1508)
    {
        _1420 = _1518;
    }
    float _1524 = _1420;
    float _1526 = _1524;
    if (_1508)
    {
        _1520 = _1514;
    }
    float _1528 = _1520;
    float _1530 = _1528;
    if (_1508)
    {
        _1522 = _1516;
    }
    float _1532 = _1522;
    float _1534 = _1532;
    if (!_1508)
    {
        float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1538 = _823 + _1536;
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1542 = _719 + _1540;
        float _1544 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1546 = _1538 * _1538;
        float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1550 = _721 + _1548;
        float _1552 = fma(_1542, _1542, _1546);
        float _1554 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1556 = fma(_1550, _1550, _1552);
        float _1558 = sqrt(_1556);
        float _1560 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1562 = -_719;
        float _1564 = _1562 + _1518;
        float _1566 = precise::min(_1558, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1568 = _1566 * _1554;
        float _1570 = -_823;
        float _1572 = _1570 + _1514;
        float _1574 = _1560 * _1568;
        float _1576 = -_721;
        float _1578 = _1576 + _1516;
        float _1580 = fma(_1564, _1574, _719);
        float _1582 = fma(_1572, _1574, _823);
        float _1584 = fma(_1578, _1574, _721);
        _1530 = _1582;
        _1526 = _1580;
        _1534 = _1584;
    }
    float _1586 = _1530;
    float _1588 = _1526;
    float _1590 = _1534;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1594 = _1586 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1598 = _1588 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1602 = _1590 + _1600;
    float _1604 = _1594 * _1594;
    float _1606 = fma(_1598, _1598, _1604);
    float _1608 = fma(_1602, _1602, _1606);
    float _1610 = rsqrt(_1608);
    float _1612 = sqrt(_1608);
    float _1614 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1616 = _1598 * _1614;
    float _1618 = _1602 * _1614;
    float _1620 = _1616 * _1616;
    float _1622 = _1618 * _1618;
    float _1624 = _1620 + _1622;
    float _1626 = sqrt(_1624);
    bool _1628 = _1626 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = _1626 + _1630;
    float _1634 = _1610;
    float _1636 = _1632;
    float _1638 = _1594;
    if (_1628)
    {
        float _1640 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1640;
    }
    float _1642 = _1634;
    if (_1628)
    {
        float _1644 = rsqrt(_1624);
        _1422 = _1644;
    }
    float _1646 = _1422;
    float _1648 = _1646;
    if (_1628)
    {
        float _1650 = _1632 * _1642;
        _1636 = _1650;
    }
    float _1652 = _1636;
    if (_1628)
    {
        float _1654 = _1652 * 0.15915493667125701904296875;
        _1424 = _1654;
    }
    float _1656 = _1424;
    float _1658 = _1602;
    if (_1628)
    {
        float _1660 = _1656 * 6.283185482025146484375;
        float _1662 = sin(_1660);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1668 = precise::max(0.0, _1666);
    float _1670 = _1516;
    float _1672 = _1668;
    float _1674 = _1666;
    if (_1628)
    {
        float _1676 = _1656 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        _1670 = _1678;
    }
    float _1680 = _1670;
    float _1682 = -_1614;
    float _1684 = -_1668;
    float _1686 = fma(_1594, _1682, _1684);
    if (_1628)
    {
        float _1688 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1688;
    }
    float _1690 = _1672;
    float _1692 = _1690;
    float _1694 = _1664;
    if (_1628)
    {
        float _1696 = fma(_1664, _1690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1692 = _1696;
    }
    float _1698 = _1692;
    float _1700 = _1698;
    if (!_1628)
    {
        _1694 = _1618;
    }
    float _1702 = _1694;
    float _1704 = _1702;
    if (_1628)
    {
        float _1706 = _1680 + (-1.0);
        _1674 = _1706;
    }
    float _1708 = _1674;
    float _1710 = _1708;
    if (_1628)
    {
        float _1712 = _1646 * _1698;
        _1320 = _1712;
    }
    float _1714 = _1320;
    if (!_1628)
    {
        _1648 = _1616;
    }
    float _1716 = _1648;
    float _1718 = _1716;
    if (_1628)
    {
        float _1720 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1720;
    }
    float _1722 = _1638;
    float _1724 = _1722;
    if (_1628)
    {
        float _1726 = _1616 * _1714;
        _1718 = _1726;
    }
    float _1728 = _1718;
    if (!_1628)
    {
        _1700 = _1686;
    }
    float _1730 = _1700;
    float _1732 = _1730;
    if (_1628)
    {
        float _1734 = _1618 * _1714;
        _1704 = _1734;
    }
    float _1736 = _1704;
    if (!_1628)
    {
        _1710 = _1620;
    }
    float _1738 = _1710;
    float _1740 = _1738;
    if (_1628)
    {
        float _1742 = fma(_1686, _1680, _1722);
        _1732 = _1742;
    }
    float _1744 = _1732;
    if (_1628)
    {
        float _1746 = _1728 * _1728;
        _1740 = _1746;
    }
    float _1748 = _1740;
    if (!_1628)
    {
        _1724 = _1622;
    }
    float _1750 = _1724;
    float _1752 = _1750;
    if (_1628)
    {
        float _1754 = _1736 * _1736;
        _1752 = _1754;
    }
    float _1756 = _1752;
    float _1758 = fma(_1744, _1744, _1748);
    float _1760 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1762 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1764 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1766 = _1758 + _1756;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1770 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1768);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1760);
    float _1776 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1778 = rsqrt(_1766);
    float _1780 = -_1772;
    float _1782 = _1780 + 1.0;
    float _1784 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1774);
    float _1786 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1776);
    float _1788 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1764);
    float _1790 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1792 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1794 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1786);
    float _1796 = abs(_1782);
    float _1798 = log2(_1796);
    float _1800 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1788);
    float _1802 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1804 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1806 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1790);
    float _1808 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1810 = -_1802;
    float _1812 = fma(_1810, _1762, 1.0);
    float _1814 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1816 = _1778 * _1728;
    float _1818 = _1778 * _1744;
    float _1820 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1806);
    float _1822 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1814);
    float _1824 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1826 = _1778 * _1736;
    float _1828 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1830 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1822);
    float _1832 = -_1824;
    float _1834 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1832);
    float _1836 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1838 = log2(_1812);
    float _1840 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1842 = -_1826;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1834);
    float _1846 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1848 = fma(_1844, -0.5, 0.5);
    float _1850 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1846);
    float _1852 = exp2(_1836);
    float _1854 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1830);
    float _1856 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1840);
    float _1858 = fma(_1844, 0.5, 0.5);
    float _1860 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1850);
    float _1862 = _1818 + 1.0;
    float _1864 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1856);
    float _1866 = fma(_1858, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1868 = 1.0 / _1854;
    float _1870 = _1838 * 0.693147182464599609375;
    float _1872 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1864);
    float _1874 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1860);
    float _1876 = fma(_1858, _1866, -0.212114393711090087890625);
    float _1878 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1880 = sqrt(_1848);
    float _1882 = -_1818;
    float _1884 = fma(_1852, _1862, _1882);
    float _1886 = fma(_1858, _1876, 1.570728778839111328125);
    float _1888 = fma(_1884, 0.5, 0.5);
    float _1890 = _1872 * _1868;
    float _1892 = _1874 * _1868;
    float _1894 = fma(_1890, 0.5, 0.5);
    float _1896 = fma(_1892, -0.5, 0.5);
    float _1898 = _1880 * 0.636619746685028076171875;
    float3 _4907 = float3(_1894, _1896, _1878);
    float _1900 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4907, float3(0.0), isnan(_4907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4907, float3(0.0), isnan(_4907)), level(0.0)).x;
    float3 _4918 = float3(_1894, _1896, _1878);
    float4 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4918, float3(0.0), isnan(_4918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4918, float3(0.0), isnan(_4918)), level(0.0)).xyzw;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = _1903.w;
    float _1913 = -_1886;
    float _1915 = fma(_1898, _1913, 1.0);
    float2 _4940 = float2(_1915, _1888);
    float3 _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4940, float2(0.0), isnan(_4940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4940, float2(0.0), isnan(_4940)), level(0.0)).xyz;
    float _1919 = _1917.x;
    float _1921 = _1917.y;
    float _1923 = _1917.z;
    float _1925 = _823 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1927 = _823 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1929 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1931 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1925);
    float _1933 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1927);
    float _1935 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1929);
    float _1937 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1931);
    float _1939 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1933);
    float _1941 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1935);
    float _1943 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1945 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1947 = 1.0 / _1943;
    bool _1949 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(0.5);
    bool _1957 = _1953 || _1955;
    float _1959 = _1945 + _1943;
    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1963 = _1929;
    float _1965 = _1798;
    if (!_1957)
    {
        _1961 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1967 = _1961;
    float _1969 = _1959 * _1947;
    float _1971 = _1969 * 0.5;
    float _1973 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1975 = _1967;
    float _1977 = _1971;
    if (_1957)
    {
        _1963 = 1.0;
    }
    float _1979 = _1963;
    float _1981 = _1979;
    if (!_1957)
    {
        float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1985 = fma(_1971, _1967, _1983);
        _1975 = _1985;
    }
    float _1987 = _1975;
    if (!_1957)
    {
        _1977 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1989 = _1977;
    float _1991 = exp2(_1973);
    if (!_1957)
    {
        float _1993 = -_1989;
        float _1995 = _1993 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _725 = _1995;
    }
    float _1997 = _725;
    float _1999 = _1987;
    if (!_1957)
    {
        float _2001 = 1.0 / _1987;
        _1999 = _2001;
    }
    float _2003 = _1999;
    float _2005 = _1896;
    if (!_1957)
    {
        float _2007 = 1.0 / _1997;
        _2005 = _2007;
    }
    float _2009 = _2005;
    if (!_1957)
    {
        float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2013 = -_1989;
        float _2015 = fma(_2003, _2011, _2013);
        _1965 = _2015;
    }
    float _2017 = _1965;
    float _2019 = -_1991;
    float _2021 = _2019 + 1.0;
    float _2023 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1957)
    {
        float _2025 = _2017 * _2009;
        float _2027 = precise::clamp(_2025, 0.0, 1.0);
        _1981 = _2027;
    }
    float _2029 = _1981;
    float _2031 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1941);
    float _2033 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2035 = _2031 + _1854;
    bool _2037 = _2029 > 0.0;
    bool _2039 = isnan(_2029);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(0.0);
    bool _2045 = _2041 || _2043;
    out.gl_Position.x = _1872;
    out.gl_Position.y = _1874;
    out.gl_Position.z = _2031;
    out.gl_Position.w = _1854;
    float _2047 = _2033 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2049 = _2035 * 0.5;
    out.m_49.x = _2047;
    out.m_71.z = _2049;
    out.m_71.w = _1854;
    float _2051 = _2023 * _1900;
    float _2053 = -_2023;
    float _2055 = _2053 + 1.0;
    float _2057 = _1911 * _2051;
    float _2059 = _1923 * _2051;
    float _2061 = fma(_1919, _2057, _1905);
    float _2063 = fma(_1921, _2057, _1907);
    float _2065 = _1911 * _2055;
    float _2067 = fma(_1911, _2059, _1909);
    out.m_73.x = _2061;
    out.m_73.y = _2063;
    out.m_73.z = _2067;
    out.m_73.w = _2065;
    if (_2045)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2069 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2069;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1460 = false;
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
        float _2126 = as_type<float>(_111);
        out.gl_Position.z = _2126;
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
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2195 = as_type<float>(_149);
        out.gl_Position.z = _2195;
    }
    if (_143)
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
    float _307 = fma(_225, 0.5, 0.5);
    bool _309 = _229 < 0.5;
    float _311 = float(_309);
    float _313 = -_229;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = fma(_233, 0.5, 0.5);
    bool _319 = _237 < 0.5;
    float _321 = float(_319);
    float _323 = -_311;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _329 = _327 != 0;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _333 = _331 != 0;
    float _335 = -_307;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _339 = -_237;
    float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _343 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = -_321;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _349 = !_329;
    int _351 = _349 ? 0 : 1;
    float _353 = -_317;
    float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _357 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _359 = !_215;
    int _361 = _359 ? 0 : 1;
    float _363 = fma(_297, _203, _343);
    int _365 = abs(_351);
    float _367 = fma(_297, _205, _357);
    bool _369 = !_333;
    int _371 = _369 ? 0 : 1;
    float _373 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _375 = abs(_361);
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _379 = fma(_297, _207, _373);
    int _381 = abs(_371);
    float _383 = fma(_363, _299, _301);
    float _385 = float(_365);
    float _387 = fma(_367, _299, _303);
    float _389 = float(_375);
    float _391 = fma(_379, _299, _305);
    float _393 = abs(_315);
    float _395 = _385 * _393;
    float _397 = abs(_341);
    float _399 = _385 * _397;
    float _401 = float(_381);
    float _403 = fma(_389, _337, _395);
    float _405 = fma(_389, _355, _399);
    float _407 = abs(_325);
    float _409 = fma(_401, _407, _403);
    float _411 = abs(_347);
    float _413 = fma(_401, _411, _405);
    bool _415 = !_377;
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
    float _455 = rint(_451);
    float _457 = _455 * 0.125;
    float _459 = precise::clamp(_457, 0.0, 1.0);
    int _461 = _449 + (-1);
    float _463 = float(_461);
    float _465 = _459 * _463;
    float _467 = trunc(_453);
    int _469 = int(_467);
    float _471 = trunc(_465);
    int _473 = int(_471);
    int _475 = _473 + 1;
    int _477 = min(_461, _475);
    int _479 = _473;
    int _481 = 0;
    int _483 = _87(_479, _481, (*spvDescriptorSet0.support_buffer));
    int _485 = _469;
    int _487 = 0;
    int _489 = _87(_485, _487, (*spvDescriptorSet0.support_buffer));
    float3 _493 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_483, _489)), 0).xyz;
    float _495 = _493.x;
    float _497 = _493.y;
    float _499 = _493.z;
    int _501 = _477;
    int _503 = 0;
    int _505 = _87(_501, _503, (*spvDescriptorSet0.support_buffer));
    int _507 = _469;
    int _509 = 0;
    int _511 = _87(_507, _509, (*spvDescriptorSet0.support_buffer));
    float3 _513 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_505, _511)), 0).xyz;
    float _515 = _513.x;
    float _517 = _513.y;
    float _519 = _513.z;
    float _521 = in.m_57.y;
    float _523 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _531 = _529 != 0;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _535 = _533 != 0;
    float _537 = in.m_53.y;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _541 = _539 != 0;
    float _543 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _523);
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _547 = _545 != 0;
    float _549 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _551 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = _151 * 2.0;
    float _555 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
    float _557 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _559;
    float _563 = floor(_553);
    float _565 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
    float _567 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = -_521;
    float _579 = _577 + 1.0;
    float _581 = 1.0 / _561;
    float _583 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _543);
    float _585 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _557);
    bool _587 = _537 > 0.5;
    float _589 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _591 = in.m_53.z;
    float _593 = -_569;
    float _595 = fma(_567, 2.0, _593);
    float _597 = _521;
    if (_547)
    {
        float _599 = _587 ? _579 : _521;
        _597 = _599;
    }
    float _601 = _597;
    float _603 = fma(_589, -2.0, _571);
    float _605 = in.m_57.x;
    float _607 = 1.0 / _575;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _611 = _151 > 0.5;
    bool _613 = _611 && _541;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _619 = _441 + _617;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = _441 + _627;
    float _631 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _635 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _629 * _581;
    float _639 = _537 * 2.0;
    bool _641 = _563 > 0.0;
    float _643 = _619 * _607;
    out.m_59.x = _631;
    out.m_59.y = _633;
    out.m_59.z = _635;
    out.m_59.w = _623;
    float _645 = floor(_639);
    bool _647 = _563 >= 0.0;
    bool _649 = isnan(_563);
    bool _651 = _647 || _649;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    float _657 = _591 * 2.0;
    float _659 = -_129;
    float _661 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[76].x, _595);
    float _663 = 0.0;
    if (_541)
    {
        _663 = _605;
    }
    float _665 = _663;
    float _667 = _625 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _669 = floor(_657);
    float _671 = _665;
    if (_613)
    {
        float _673 = -_665;
        float _675 = _673 + 1.0;
        _671 = _675;
    }
    float _677 = _671;
    float _679 = fma(_667, _601, -0.5);
    float _681 = _151 + _591;
    float _683 = _537 + _591;
    float _685 = _151 + _537;
    float _687 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _689 = log2(_687);
    float _691 = _681 + (-1.0);
    float _693 = _683 + (-1.0);
    bool _695 = _645 > 0.0;
    float _697 = _685 + (-1.0);
    float _699 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _703 = _655 ? 0 : 1;
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _707 = _645 >= 0.0;
    bool _709 = isnan(_645);
    bool _711 = _707 || _709;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _719 = _565 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _721 = _585 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _723 = _697;
    float _725 = _721;
    if (!_541)
    {
        _723 = _605;
    }
    float _727 = _723;
    float _729 = _689 * _129;
    int _731 = ~_703;
    int _733 = _731 + 1;
    int _735 = _733 + 1;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _737;
    float _741 = _727;
    int _743 = _735;
    if (_541)
    {
        _741 = _677;
    }
    float _745 = _741;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _747;
    if (!_641)
    {
        int _751 = ~_703;
        int _753 = _751 + 1;
        _743 = _753;
    }
    int _755 = _743;
    float _757 = exp2(_729);
    bool _759 = _669 > 0.0;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _761;
    bool _765 = _669 >= 0.0;
    bool _767 = isnan(_669);
    bool _769 = _765 || _767;
    bool _771 = isnan(0.0);
    bool _773 = _769 || _771;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _787 = fma(_739, _637, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _789 = fma(_763, _637, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _791 = fma(_749, _637, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _793 = fma(_777, _643, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _795 = fma(_781, _643, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _797 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _799 = isnan(_441);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = fma(_785, _643, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _811 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _813 = isnan(_441);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = _583 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _825 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _827 = isnan(_441);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_757;
    float _839 = _837 + 1.0;
    float _841 = -_835;
    float _843 = _841 + 1.0;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _847 = 1.0 + _845;
    bool _849 = !_531;
    int _851 = _849 ? 0 : 1;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _855 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _863 = _859 || _861;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _867 = 1.0 / _847;
    float _869 = _863 ? _839 : 0.0;
    float _871 = _821 * _843;
    float _873 = -_821;
    float _875 = _873 + 1.0;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _879 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[79].z, _853);
    float _881 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].w, _865);
    float _883 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _885 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _877);
    bool _887 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(1.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = _807 * _875;
    float _899 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _879);
    float _901 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _881);
    float _903 = _717 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _905 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _603);
    float _907 = _883 * _151;
    float _909 = _787 * _897;
    float _911 = _789 * _897;
    float _913 = _791 * _897;
    int _915 = abs(_851);
    float _917 = fma(_903, _745, -0.5);
    float _919 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _885);
    float _921 = in.m_61.x;
    float _923 = in.m_61.y;
    float _925 = in.m_61.z;
    if (_895)
    {
        float _927 = _869 * _867;
        _133 = _927;
    }
    float _929 = _133;
    int _931 = _773 ? 0 : 1;
    float _933 = -_807;
    float _935 = _933 + 1.0;
    float _937 = trunc(_907);
    int _939 = int(_937);
    float _941 = float(_755);
    float _943 = _537 + (-0.5);
    float _945 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[143].x, _909);
    float _947 = float(_915);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[143].y, _911);
    bool _951 = !_535;
    int _953 = _951 ? 0 : 1;
    float _955 = fma(_793, _871, _945);
    int _957 = _715 ? 0 : 1;
    float _959 = _947 * _941;
    int _961 = ~_931;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[143].z, _913);
    int _969 = _965;
    if (!_759)
    {
        int _971 = ~_931;
        int _973 = _971 + 1;
        _969 = _973;
    }
    int _975 = _969;
    float _977 = _959 * (-2.0);
    bool _979 = !_527;
    int _981 = _979 ? 0 : 1;
    float _983 = _591 + (-0.5);
    int _985 = abs(_953);
    float _987 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[145].x, _955);
    int _989 = abs(_981);
    float _991 = fma(_809, _871, _967);
    int _993 = ~_957;
    int _995 = _993 + 1;
    int _997 = _995 + 1;
    float _999 = fma(_701, _977, _701);
    int _1001 = _997;
    if (!_695)
    {
        int _1003 = ~_957;
        int _1005 = _1003 + 1;
        _1001 = _1005;
    }
    int _1007 = _1001;
    float _1009 = _899 * (-0.15915493667125701904296875);
    float _1011 = float(_989);
    float _1013 = fma(_977, _923, _923);
    float _1015 = float(_975);
    float _1017 = _1009 * 6.283185482025146484375;
    float _1019 = sin(_1017);
    int _1021 = _939 << 4;
    int _1023 = _1021 + 1968;
    float _1025 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1013);
    float _1027 = fma(_795, _871, _949);
    float _1029 = _1011 * _1015;
    float _1031 = float(_985);
    uint _1034 = uint(int(uint(_1023) >> uint(2)));
    uint _1036 = uint(int(uint(int(_1034)) >> uint(2)));
    int _1038 = int(_1034) & 3;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[int(_1036)][_1038];
    int _1042 = int(_1034) + 1;
    uint _1044 = uint(int(uint(_1042) >> uint(2)));
    int _1046 = _1042 & 3;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[int(_1044)][_1046];
    float _1050 = float(_1007);
    float _1052 = _1009 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    float _1056 = _1029 * (-2.0);
    float _1058 = _151 + (-0.5);
    float _1060 = fma(_999, _929, _1025);
    float _1062 = _1031 * _1050;
    float _1064 = fma(_1056, _921, _921);
    int _1066 = _1023 + 8;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    uint _1070 = uint(int(uint(int(_1068)) >> uint(2)));
    int _1072 = int(_1068) & 3;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[int(_1070)][_1072];
    float _1076 = fma(_705, _1056, _705);
    float _1078 = _1019 * _679;
    float _1080 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1064);
    float _1082 = _1062 * (-2.0);
    float _1084 = _1060 * 0.15915493667125701904296875;
    float _1086 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[145].z, _991);
    float _1088 = fma(_1076, _929, _1080);
    float _1090 = fma(_1082, _925, _925);
    float _1092 = fma(_699, _1082, _699);
    float _1094 = _1054 * _679;
    float _1096 = -_1078;
    float _1098 = fma(_1054, _917, _1096);
    float _1100 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1090);
    float _1102 = in.m_55.x;
    float _1104 = in.m_55.y;
    float _1106 = in.m_55.z;
    float _1108 = _1088 * 0.15915493667125701904296875;
    float _1110 = _1084 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = fma(_1092, _929, _1100);
    float _1116 = fma(_919, _1098, _661);
    float _1118 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1027);
    float _1120 = fma(_1019, _917, _1094);
    float _1122 = _1114 * 0.15915493667125701904296875;
    float _1124 = _1084 * 6.283185482025146484375;
    float _1126 = cos(_1124);
    float _1128 = -_905;
    float _1130 = fma(_901, _1120, _1128);
    float _1132 = _1116 + 0.5;
    float _1134 = _1130 + 0.5;
    float _1136 = _1108 * 6.283185482025146484375;
    float _1138 = sin(_1136);
    out.m_63.x = _1132;
    out.m_63.y = _1134;
    float _1140 = _987 * _1102;
    float _1142 = _1118 * _1104;
    float _1144 = _1108 * 6.283185482025146484375;
    float _1146 = cos(_1144);
    float _1148 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1150 = _409 * _1140;
    float _1152 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1154 = _413 * _1142;
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = _1086 * _1106;
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1162 = _1122 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1168 = _1138 * _1126;
    float _1170 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1172 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1178 = floor(_465);
    float _1180 = _1146 * _1112;
    out.m_65.x = _1156;
    out.m_65.y = _1160;
    out.m_65.z = _1174;
    float _1182 = _1146 * _1126;
    float _1184 = -_1180;
    float _1186 = fma(_1164, _1168, _1184);
    float _1188 = -_1168;
    float _1190 = fma(_1164, _1180, _1188);
    float _1192 = _1122 * 6.283185482025146484375;
    float _1194 = cos(_1192);
    float _1196 = -_1178;
    float _1198 = _465 + _1196;
    float _1200 = _1126 * _1194;
    float _1202 = -_497;
    float _1204 = _1202 + _517;
    float _1206 = -_495;
    float _1208 = _1206 + _515;
    float _1210 = -_499;
    float _1212 = _1210 + _519;
    float _1214 = _1138 * _1112;
    float _1216 = fma(_1198, _1204, _497);
    float _1218 = fma(_1198, _1208, _495);
    float _1220 = fma(_1198, _1212, _499);
    float _1222 = fma(_1164, _1182, _1214);
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1216);
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1218);
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1220);
    float _1230 = _1112 * _1194;
    float _1232 = _1170 * _1224;
    float _1234 = _1172 * _1226;
    float _1236 = _1176 * _1228;
    float _1238 = fma(_1164, _1214, _1182);
    float _1240 = _1194 * _1232;
    float _1242 = -_1232;
    float _1244 = _1164 * _1242;
    float _1246 = _1146 * _1240;
    float _1248 = fma(_1200, _1234, _1244);
    float _1250 = fma(_1222, _1234, _1246);
    float _1252 = _1138 * _1240;
    float _1254 = fma(_1230, _1236, _1248);
    float _1256 = fma(_1190, _1236, _1250);
    float _1258 = fma(_1186, _1234, _1252);
    float _1260 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1262 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1264 = fma(_1238, _1236, _1258);
    float _1266 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1260);
    float _1268 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1262);
    float _1270 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1266);
    float _1272 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1268);
    float _1274 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1276 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1278 = _719 + _1274;
    float _1280 = _721 + _1276;
    float _1282 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1286 = _1278 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1282);
    float _1294 = _1286 * _1286;
    float _1296 = _1290 * _1290;
    float _1298 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1292);
    float _1300 = _1294 + _1296;
    float _1302 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1304 = sqrt(_1300);
    float _1306 = _823 + _1302;
    bool _1308 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1310 = _1264;
    float _1312 = _1282;
    float _1314 = _1296;
    float _1316 = _1280;
    float _1318 = _1278;
    float _1320 = _1164;
    if (!_1308)
    {
        _1310 = _1294;
    }
    float _1322 = _1310;
    float _1324 = _1322;
    if (!_1308)
    {
        _1312 = _1306;
    }
    float _1326 = _1312;
    bool _1328 = !_1308;
    float _1330 = _1326;
    if (!_1328)
    {
        float _1332 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1336 = _1304 + _1334;
        float _1338 = rsqrt(_1300);
        float _1340 = _1336 * _1332;
        float _1342 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = _1340 * 0.15915493667125701904296875;
        float _1346 = _1344 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        float _1350 = _1344 * 6.283185482025146484375;
        float _1352 = cos(_1350);
        float _1354 = fma(_1348, _1342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1356 = _1338 * _1354;
        float _1358 = _1352 + (-1.0);
        float _1360 = fma(_1286, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1362 = fma(_1290, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1364 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1368 = _1360 + _1366;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1372 = _1362 + _1370;
        float _1374 = fma(_1306, _1352, _1364);
        float _1376 = _1368 * _1368;
        float _1378 = _1372 * _1372;
        _1330 = _1374;
        _1324 = _1376;
        _1314 = _1378;
        _1316 = _1362;
        _1318 = _1360;
    }
    float _1380 = _1330;
    float _1382 = _1324;
    float _1384 = _1314;
    float _1386 = _1316;
    float _1388 = _1318;
    float _1390 = in.m_67.x;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1394 = _1380 + _1392;
    float _1396 = in.m_67.y;
    float _1398 = fma(_1394, _1394, _1382);
    float _1400 = in.m_67.z;
    float _1402 = _1398 + _1384;
    float _1404 = in.m_67.w;
    float _1406 = sqrt(_1402);
    out.m_69.x = _1390;
    out.m_69.y = _1396;
    bool _1408 = _1406 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1410 = isnan(_1406);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1416 = _1412 || _1414;
    out.m_69.z = _1400;
    out.m_69.w = _1404;
    float _1418 = _1398;
    float _1420 = _1388;
    float _1422 = _1396;
    float _1424 = _1406;
    if (!_1416)
    {
        _1418 = 1.0;
    }
    float _1426 = _1418;
    bool _1428 = !_1416;
    float _1430 = _1426;
    if (!_1428)
    {
        bool _1432 = _1406 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1434 = isnan(_1406);
        bool _1436 = _1432 || _1434;
        bool _1438 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1440 = _1436 || _1438;
        if (!_1440)
        {
            float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1444 = _1406 + _1442;
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1454 = 1.0 / _1448;
            float _1456 = _1444 * _1454;
            float _1458 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1430 = _1458;
            _1460 = true;
        }
        else
        {
            bool _1462 = _1406 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1464 = isnan(_1406);
            bool _1466 = _1462 || _1464;
            bool _1468 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1470 = _1466 || _1468;
            if (!_1470)
            {
                float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1474 = _1406 + _1472;
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1476 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1484 = 1.0 / _1478;
                float _1486 = _1474 * _1484;
                float _1488 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1430 = _1488;
                _1460 = true;
            }
            else
            {
                _1430 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1460 = false;
    float _1490 = _1430;
    float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1494 = _1380 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1498 = _1386 + _1496;
    bool _1500 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(0.5);
    bool _1508 = _1504 || _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1512 = _1388 + _1510;
    float _1514 = fma(_1494, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1516 = fma(_1498, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1518 = fma(_1512, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1520 = _1512;
    float _1522 = _1498;
    if (_1508)
    {
        _1420 = _1518;
    }
    float _1524 = _1420;
    float _1526 = _1524;
    if (_1508)
    {
        _1520 = _1514;
    }
    float _1528 = _1520;
    float _1530 = _1528;
    if (_1508)
    {
        _1522 = _1516;
    }
    float _1532 = _1522;
    float _1534 = _1532;
    if (!_1508)
    {
        float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1538 = _823 + _1536;
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1542 = _719 + _1540;
        float _1544 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1546 = _1538 * _1538;
        float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1550 = _721 + _1548;
        float _1552 = fma(_1542, _1542, _1546);
        float _1554 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1556 = fma(_1550, _1550, _1552);
        float _1558 = sqrt(_1556);
        float _1560 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1562 = -_719;
        float _1564 = _1562 + _1518;
        float _1566 = precise::min(_1558, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1568 = _1566 * _1554;
        float _1570 = -_823;
        float _1572 = _1570 + _1514;
        float _1574 = _1560 * _1568;
        float _1576 = -_721;
        float _1578 = _1576 + _1516;
        float _1580 = fma(_1564, _1574, _719);
        float _1582 = fma(_1572, _1574, _823);
        float _1584 = fma(_1578, _1574, _721);
        _1530 = _1582;
        _1526 = _1580;
        _1534 = _1584;
    }
    float _1586 = _1530;
    float _1588 = _1526;
    float _1590 = _1534;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1594 = _1586 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1598 = _1588 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1602 = _1590 + _1600;
    float _1604 = _1594 * _1594;
    float _1606 = fma(_1598, _1598, _1604);
    float _1608 = fma(_1602, _1602, _1606);
    float _1610 = rsqrt(_1608);
    float _1612 = sqrt(_1608);
    float _1614 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1616 = _1598 * _1614;
    float _1618 = _1602 * _1614;
    float _1620 = _1616 * _1616;
    float _1622 = _1618 * _1618;
    float _1624 = _1620 + _1622;
    float _1626 = sqrt(_1624);
    bool _1628 = _1626 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = _1626 + _1630;
    float _1634 = _1610;
    float _1636 = _1632;
    float _1638 = _1594;
    if (_1628)
    {
        float _1640 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1640;
    }
    float _1642 = _1634;
    if (_1628)
    {
        float _1644 = rsqrt(_1624);
        _1422 = _1644;
    }
    float _1646 = _1422;
    float _1648 = _1646;
    if (_1628)
    {
        float _1650 = _1632 * _1642;
        _1636 = _1650;
    }
    float _1652 = _1636;
    if (_1628)
    {
        float _1654 = _1652 * 0.15915493667125701904296875;
        _1424 = _1654;
    }
    float _1656 = _1424;
    float _1658 = _1602;
    if (_1628)
    {
        float _1660 = _1656 * 6.283185482025146484375;
        float _1662 = sin(_1660);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1668 = precise::max(0.0, _1666);
    float _1670 = _1516;
    float _1672 = _1668;
    float _1674 = _1666;
    if (_1628)
    {
        float _1676 = _1656 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        _1670 = _1678;
    }
    float _1680 = _1670;
    float _1682 = -_1614;
    float _1684 = -_1668;
    float _1686 = fma(_1594, _1682, _1684);
    if (_1628)
    {
        float _1688 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1688;
    }
    float _1690 = _1672;
    float _1692 = _1690;
    float _1694 = _1664;
    if (_1628)
    {
        float _1696 = fma(_1664, _1690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1692 = _1696;
    }
    float _1698 = _1692;
    float _1700 = _1698;
    if (!_1628)
    {
        _1694 = _1618;
    }
    float _1702 = _1694;
    float _1704 = _1702;
    if (_1628)
    {
        float _1706 = _1680 + (-1.0);
        _1674 = _1706;
    }
    float _1708 = _1674;
    float _1710 = _1708;
    if (_1628)
    {
        float _1712 = _1646 * _1698;
        _1320 = _1712;
    }
    float _1714 = _1320;
    if (!_1628)
    {
        _1648 = _1616;
    }
    float _1716 = _1648;
    float _1718 = _1716;
    if (_1628)
    {
        float _1720 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1720;
    }
    float _1722 = _1638;
    float _1724 = _1722;
    if (_1628)
    {
        float _1726 = _1616 * _1714;
        _1718 = _1726;
    }
    float _1728 = _1718;
    if (!_1628)
    {
        _1700 = _1686;
    }
    float _1730 = _1700;
    float _1732 = _1730;
    if (_1628)
    {
        float _1734 = _1618 * _1714;
        _1704 = _1734;
    }
    float _1736 = _1704;
    if (!_1628)
    {
        _1710 = _1620;
    }
    float _1738 = _1710;
    float _1740 = _1738;
    if (_1628)
    {
        float _1742 = fma(_1686, _1680, _1722);
        _1732 = _1742;
    }
    float _1744 = _1732;
    if (_1628)
    {
        float _1746 = _1728 * _1728;
        _1740 = _1746;
    }
    float _1748 = _1740;
    if (!_1628)
    {
        _1724 = _1622;
    }
    float _1750 = _1724;
    float _1752 = _1750;
    if (_1628)
    {
        float _1754 = _1736 * _1736;
        _1752 = _1754;
    }
    float _1756 = _1752;
    float _1758 = fma(_1744, _1744, _1748);
    float _1760 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1762 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1764 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1766 = _1758 + _1756;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1770 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1768);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1760);
    float _1776 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1778 = rsqrt(_1766);
    float _1780 = -_1772;
    float _1782 = _1780 + 1.0;
    float _1784 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1774);
    float _1786 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1776);
    float _1788 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1764);
    float _1790 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1792 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1794 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1786);
    float _1796 = abs(_1782);
    float _1798 = log2(_1796);
    float _1800 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1788);
    float _1802 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1804 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1806 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1790);
    float _1808 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1810 = -_1802;
    float _1812 = fma(_1810, _1762, 1.0);
    float _1814 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1816 = _1778 * _1728;
    float _1818 = _1778 * _1744;
    float _1820 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1806);
    float _1822 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1814);
    float _1824 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1826 = _1778 * _1736;
    float _1828 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1830 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1822);
    float _1832 = -_1824;
    float _1834 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1832);
    float _1836 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1838 = log2(_1812);
    float _1840 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1842 = -_1826;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1834);
    float _1846 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1848 = fma(_1844, -0.5, 0.5);
    float _1850 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1846);
    float _1852 = exp2(_1836);
    float _1854 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1830);
    float _1856 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1840);
    float _1858 = fma(_1844, 0.5, 0.5);
    float _1860 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1850);
    float _1862 = _1818 + 1.0;
    float _1864 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1856);
    float _1866 = fma(_1858, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1868 = 1.0 / _1854;
    float _1870 = _1838 * 0.693147182464599609375;
    float _1872 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1864);
    float _1874 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1860);
    float _1876 = fma(_1858, _1866, -0.212114393711090087890625);
    float _1878 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1880 = sqrt(_1848);
    float _1882 = -_1818;
    float _1884 = fma(_1852, _1862, _1882);
    float _1886 = fma(_1858, _1876, 1.570728778839111328125);
    float _1888 = fma(_1884, 0.5, 0.5);
    float _1890 = _1872 * _1868;
    float _1892 = _1874 * _1868;
    float _1894 = fma(_1890, 0.5, 0.5);
    float _1896 = fma(_1892, -0.5, 0.5);
    float _1898 = _1880 * 0.636619746685028076171875;
    float3 _4907 = float3(_1894, _1896, _1878);
    float _1900 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4907, float3(0.0), isnan(_4907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4907, float3(0.0), isnan(_4907)), level(0.0)).x;
    float3 _4918 = float3(_1894, _1896, _1878);
    float4 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4918, float3(0.0), isnan(_4918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4918, float3(0.0), isnan(_4918)), level(0.0)).xyzw;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = _1903.w;
    float _1913 = -_1886;
    float _1915 = fma(_1898, _1913, 1.0);
    float2 _4940 = float2(_1915, _1888);
    float3 _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4940, float2(0.0), isnan(_4940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4940, float2(0.0), isnan(_4940)), level(0.0)).xyz;
    float _1919 = _1917.x;
    float _1921 = _1917.y;
    float _1923 = _1917.z;
    float _1925 = _823 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1927 = _823 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1929 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1931 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1925);
    float _1933 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1927);
    float _1935 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1929);
    float _1937 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1931);
    float _1939 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1933);
    float _1941 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1935);
    float _1943 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1945 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1947 = 1.0 / _1943;
    bool _1949 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(0.5);
    bool _1957 = _1953 || _1955;
    float _1959 = _1945 + _1943;
    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1963 = _1929;
    float _1965 = _1798;
    if (!_1957)
    {
        _1961 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1967 = _1961;
    float _1969 = _1959 * _1947;
    float _1971 = _1969 * 0.5;
    float _1973 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1975 = _1967;
    float _1977 = _1971;
    if (_1957)
    {
        _1963 = 1.0;
    }
    float _1979 = _1963;
    float _1981 = _1979;
    if (!_1957)
    {
        float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1985 = fma(_1971, _1967, _1983);
        _1975 = _1985;
    }
    float _1987 = _1975;
    if (!_1957)
    {
        _1977 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1989 = _1977;
    float _1991 = exp2(_1973);
    if (!_1957)
    {
        float _1993 = -_1989;
        float _1995 = _1993 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _725 = _1995;
    }
    float _1997 = _725;
    float _1999 = _1987;
    if (!_1957)
    {
        float _2001 = 1.0 / _1987;
        _1999 = _2001;
    }
    float _2003 = _1999;
    float _2005 = _1896;
    if (!_1957)
    {
        float _2007 = 1.0 / _1997;
        _2005 = _2007;
    }
    float _2009 = _2005;
    if (!_1957)
    {
        float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2013 = -_1989;
        float _2015 = fma(_2003, _2011, _2013);
        _1965 = _2015;
    }
    float _2017 = _1965;
    float _2019 = -_1991;
    float _2021 = _2019 + 1.0;
    float _2023 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1957)
    {
        float _2025 = _2017 * _2009;
        float _2027 = precise::clamp(_2025, 0.0, 1.0);
        _1981 = _2027;
    }
    float _2029 = _1981;
    float _2031 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1941);
    float _2033 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2035 = _2031 + _1854;
    bool _2037 = _2029 > 0.0;
    bool _2039 = isnan(_2029);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(0.0);
    bool _2045 = _2041 || _2043;
    out.gl_Position.x = _1872;
    out.gl_Position.y = _1874;
    out.gl_Position.z = _2031;
    out.gl_Position.w = _1854;
    float _2047 = _2033 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2049 = _2035 * 0.5;
    out.m_49.x = _2047;
    out.m_71.z = _2049;
    out.m_71.w = _1854;
    float _2051 = _2023 * _1900;
    float _2053 = -_2023;
    float _2055 = _2053 + 1.0;
    float _2057 = _1911 * _2051;
    float _2059 = _1923 * _2051;
    float _2061 = fma(_1919, _2057, _1905);
    float _2063 = fma(_1921, _2057, _1907);
    float _2065 = _1911 * _2055;
    float _2067 = fma(_1911, _2059, _1909);
    out.m_73.x = _2061;
    out.m_73.y = _2063;
    out.m_73.z = _2067;
    out.m_73.w = _2065;
    if (_2045)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2069 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2069;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1460 = false;
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
        float _2126 = as_type<float>(_111);
        out.gl_Position.z = _2126;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_51.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2195 = as_type<float>(_149);
        out.gl_Position.z = _2195;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _307 = fma(_225, 0.5, 0.5);
    bool _309 = _229 < 0.5;
    float _311 = float(_309);
    float _313 = -_229;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = fma(_233, 0.5, 0.5);
    bool _319 = _237 < 0.5;
    float _321 = float(_319);
    float _323 = -_311;
    float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _329 = _327 != 0;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _333 = _331 != 0;
    float _335 = -_307;
    float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _339 = -_237;
    float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _343 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = -_321;
    float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _349 = !_329;
    int _351 = _349 ? 0 : 1;
    float _353 = -_317;
    float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _357 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _359 = !_215;
    int _361 = _359 ? 0 : 1;
    float _363 = fma(_297, _203, _343);
    int _365 = abs(_351);
    float _367 = fma(_297, _205, _357);
    bool _369 = !_333;
    int _371 = _369 ? 0 : 1;
    float _373 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _375 = abs(_361);
    bool _377 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _379 = fma(_297, _207, _373);
    int _381 = abs(_371);
    float _383 = fma(_363, _299, _301);
    float _385 = float(_365);
    float _387 = fma(_367, _299, _303);
    float _389 = float(_375);
    float _391 = fma(_379, _299, _305);
    float _393 = abs(_315);
    float _395 = _385 * _393;
    float _397 = abs(_341);
    float _399 = _385 * _397;
    float _401 = float(_381);
    float _403 = fma(_389, _337, _395);
    float _405 = fma(_389, _355, _399);
    float _407 = abs(_325);
    float _409 = fma(_401, _407, _403);
    float _411 = abs(_347);
    float _413 = fma(_401, _411, _405);
    bool _415 = !_377;
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
    float _455 = rint(_451);
    float _457 = _455 * 0.125;
    float _459 = precise::clamp(_457, 0.0, 1.0);
    int _461 = _449 + (-1);
    float _463 = float(_461);
    float _465 = _459 * _463;
    float _467 = trunc(_453);
    int _469 = int(_467);
    float _471 = trunc(_465);
    int _473 = int(_471);
    int _475 = _473 + 1;
    int _477 = min(_461, _475);
    int _479 = _473;
    int _481 = 0;
    int _483 = _87(_479, _481, (*spvDescriptorSet0.support_buffer));
    int _485 = _469;
    int _487 = 0;
    int _489 = _87(_485, _487, (*spvDescriptorSet0.support_buffer));
    float3 _493 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_483, _489)), 0).xyz;
    float _495 = _493.x;
    float _497 = _493.y;
    float _499 = _493.z;
    int _501 = _477;
    int _503 = 0;
    int _505 = _87(_501, _503, (*spvDescriptorSet0.support_buffer));
    int _507 = _469;
    int _509 = 0;
    int _511 = _87(_507, _509, (*spvDescriptorSet0.support_buffer));
    float3 _513 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_505, _511)), 0).xyz;
    float _515 = _513.x;
    float _517 = _513.y;
    float _519 = _513.z;
    float _521 = in.m_57.y;
    float _523 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _531 = _529 != 0;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _535 = _533 != 0;
    float _537 = in.m_53.y;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _541 = _539 != 0;
    float _543 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _523);
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _547 = _545 != 0;
    float _549 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _551 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = _151 * 2.0;
    float _555 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
    float _557 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _559;
    float _563 = floor(_553);
    float _565 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
    float _567 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _577 = -_521;
    float _579 = _577 + 1.0;
    float _581 = 1.0 / _561;
    float _583 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _543);
    float _585 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _557);
    bool _587 = _537 > 0.5;
    float _589 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _591 = in.m_53.z;
    float _593 = -_569;
    float _595 = fma(_567, 2.0, _593);
    float _597 = _521;
    if (_547)
    {
        float _599 = _587 ? _579 : _521;
        _597 = _599;
    }
    float _601 = _597;
    float _603 = fma(_589, -2.0, _571);
    float _605 = in.m_57.x;
    float _607 = 1.0 / _575;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _611 = _151 > 0.5;
    bool _613 = _611 && _541;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _619 = _441 + _617;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = _441 + _627;
    float _631 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _635 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _629 * _581;
    float _639 = _537 * 2.0;
    bool _641 = _563 > 0.0;
    float _643 = _619 * _607;
    out.m_59.x = _631;
    out.m_59.y = _633;
    out.m_59.z = _635;
    out.m_59.w = _623;
    float _645 = floor(_639);
    bool _647 = _563 >= 0.0;
    bool _649 = isnan(_563);
    bool _651 = _647 || _649;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    float _657 = _591 * 2.0;
    float _659 = -_129;
    float _661 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[76].x, _595);
    float _663 = 0.0;
    if (_541)
    {
        _663 = _605;
    }
    float _665 = _663;
    float _667 = _625 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _669 = floor(_657);
    float _671 = _665;
    if (_613)
    {
        float _673 = -_665;
        float _675 = _673 + 1.0;
        _671 = _675;
    }
    float _677 = _671;
    float _679 = fma(_667, _601, -0.5);
    float _681 = _151 + _591;
    float _683 = _537 + _591;
    float _685 = _151 + _537;
    float _687 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _689 = log2(_687);
    float _691 = _681 + (-1.0);
    float _693 = _683 + (-1.0);
    bool _695 = _645 > 0.0;
    float _697 = _685 + (-1.0);
    float _699 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _701 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _703 = _655 ? 0 : 1;
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _707 = _645 >= 0.0;
    bool _709 = isnan(_645);
    bool _711 = _707 || _709;
    bool _713 = isnan(0.0);
    bool _715 = _711 || _713;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _719 = _565 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _721 = _585 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _723 = _697;
    float _725 = _721;
    if (!_541)
    {
        _723 = _605;
    }
    float _727 = _723;
    float _729 = _689 * _129;
    int _731 = ~_703;
    int _733 = _731 + 1;
    int _735 = _733 + 1;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _737;
    float _741 = _727;
    int _743 = _735;
    if (_541)
    {
        _741 = _677;
    }
    float _745 = _741;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _747;
    if (!_641)
    {
        int _751 = ~_703;
        int _753 = _751 + 1;
        _743 = _753;
    }
    int _755 = _743;
    float _757 = exp2(_729);
    bool _759 = _669 > 0.0;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _761;
    bool _765 = _669 >= 0.0;
    bool _767 = isnan(_669);
    bool _769 = _765 || _767;
    bool _771 = isnan(0.0);
    bool _773 = _769 || _771;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _787 = fma(_739, _637, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _789 = fma(_763, _637, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _791 = fma(_749, _637, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _793 = fma(_777, _643, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _795 = fma(_781, _643, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _797 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _799 = isnan(_441);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = fma(_785, _643, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _811 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _813 = isnan(_441);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = _583 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _825 = _441 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _827 = isnan(_441);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_757;
    float _839 = _837 + 1.0;
    float _841 = -_835;
    float _843 = _841 + 1.0;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _847 = 1.0 + _845;
    bool _849 = !_531;
    int _851 = _849 ? 0 : 1;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _855 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _863 = _859 || _861;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _867 = 1.0 / _847;
    float _869 = _863 ? _839 : 0.0;
    float _871 = _821 * _843;
    float _873 = -_821;
    float _875 = _873 + 1.0;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _879 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[79].z, _853);
    float _881 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].w, _865);
    float _883 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _885 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _877);
    bool _887 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(1.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = _807 * _875;
    float _899 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _879);
    float _901 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _881);
    float _903 = _717 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _905 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _603);
    float _907 = _883 * _151;
    float _909 = _787 * _897;
    float _911 = _789 * _897;
    float _913 = _791 * _897;
    int _915 = abs(_851);
    float _917 = fma(_903, _745, -0.5);
    float _919 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _885);
    float _921 = in.m_61.x;
    float _923 = in.m_61.y;
    float _925 = in.m_61.z;
    if (_895)
    {
        float _927 = _869 * _867;
        _133 = _927;
    }
    float _929 = _133;
    int _931 = _773 ? 0 : 1;
    float _933 = -_807;
    float _935 = _933 + 1.0;
    float _937 = trunc(_907);
    int _939 = int(_937);
    float _941 = float(_755);
    float _943 = _537 + (-0.5);
    float _945 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[143].x, _909);
    float _947 = float(_915);
    float _949 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[143].y, _911);
    bool _951 = !_535;
    int _953 = _951 ? 0 : 1;
    float _955 = fma(_793, _871, _945);
    int _957 = _715 ? 0 : 1;
    float _959 = _947 * _941;
    int _961 = ~_931;
    int _963 = _961 + 1;
    int _965 = _963 + 1;
    float _967 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[143].z, _913);
    int _969 = _965;
    if (!_759)
    {
        int _971 = ~_931;
        int _973 = _971 + 1;
        _969 = _973;
    }
    int _975 = _969;
    float _977 = _959 * (-2.0);
    bool _979 = !_527;
    int _981 = _979 ? 0 : 1;
    float _983 = _591 + (-0.5);
    int _985 = abs(_953);
    float _987 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[145].x, _955);
    int _989 = abs(_981);
    float _991 = fma(_809, _871, _967);
    int _993 = ~_957;
    int _995 = _993 + 1;
    int _997 = _995 + 1;
    float _999 = fma(_701, _977, _701);
    int _1001 = _997;
    if (!_695)
    {
        int _1003 = ~_957;
        int _1005 = _1003 + 1;
        _1001 = _1005;
    }
    int _1007 = _1001;
    float _1009 = _899 * (-0.15915493667125701904296875);
    float _1011 = float(_989);
    float _1013 = fma(_977, _923, _923);
    float _1015 = float(_975);
    float _1017 = _1009 * 6.283185482025146484375;
    float _1019 = sin(_1017);
    int _1021 = _939 << 4;
    int _1023 = _1021 + 1968;
    float _1025 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1013);
    float _1027 = fma(_795, _871, _949);
    float _1029 = _1011 * _1015;
    float _1031 = float(_985);
    uint _1034 = uint(int(uint(_1023) >> uint(2)));
    uint _1036 = uint(int(uint(int(_1034)) >> uint(2)));
    int _1038 = int(_1034) & 3;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[int(_1036)][_1038];
    int _1042 = int(_1034) + 1;
    uint _1044 = uint(int(uint(_1042) >> uint(2)));
    int _1046 = _1042 & 3;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[int(_1044)][_1046];
    float _1050 = float(_1007);
    float _1052 = _1009 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    float _1056 = _1029 * (-2.0);
    float _1058 = _151 + (-0.5);
    float _1060 = fma(_999, _929, _1025);
    float _1062 = _1031 * _1050;
    float _1064 = fma(_1056, _921, _921);
    int _1066 = _1023 + 8;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    uint _1070 = uint(int(uint(int(_1068)) >> uint(2)));
    int _1072 = int(_1068) & 3;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[int(_1070)][_1072];
    float _1076 = fma(_705, _1056, _705);
    float _1078 = _1019 * _679;
    float _1080 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1064);
    float _1082 = _1062 * (-2.0);
    float _1084 = _1060 * 0.15915493667125701904296875;
    float _1086 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[145].z, _991);
    float _1088 = fma(_1076, _929, _1080);
    float _1090 = fma(_1082, _925, _925);
    float _1092 = fma(_699, _1082, _699);
    float _1094 = _1054 * _679;
    float _1096 = -_1078;
    float _1098 = fma(_1054, _917, _1096);
    float _1100 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1090);
    float _1102 = in.m_55.x;
    float _1104 = in.m_55.y;
    float _1106 = in.m_55.z;
    float _1108 = _1088 * 0.15915493667125701904296875;
    float _1110 = _1084 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = fma(_1092, _929, _1100);
    float _1116 = fma(_919, _1098, _661);
    float _1118 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1027);
    float _1120 = fma(_1019, _917, _1094);
    float _1122 = _1114 * 0.15915493667125701904296875;
    float _1124 = _1084 * 6.283185482025146484375;
    float _1126 = cos(_1124);
    float _1128 = -_905;
    float _1130 = fma(_901, _1120, _1128);
    float _1132 = _1116 + 0.5;
    float _1134 = _1130 + 0.5;
    float _1136 = _1108 * 6.283185482025146484375;
    float _1138 = sin(_1136);
    out.m_63.x = _1132;
    out.m_63.y = _1134;
    float _1140 = _987 * _1102;
    float _1142 = _1118 * _1104;
    float _1144 = _1108 * 6.283185482025146484375;
    float _1146 = cos(_1144);
    float _1148 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1150 = _409 * _1140;
    float _1152 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1154 = _413 * _1142;
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1158 = _1086 * _1106;
    float _1160 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1162 = _1122 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1168 = _1138 * _1126;
    float _1170 = _1154 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1172 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1178 = floor(_465);
    float _1180 = _1146 * _1112;
    out.m_65.x = _1156;
    out.m_65.y = _1160;
    out.m_65.z = _1174;
    float _1182 = _1146 * _1126;
    float _1184 = -_1180;
    float _1186 = fma(_1164, _1168, _1184);
    float _1188 = -_1168;
    float _1190 = fma(_1164, _1180, _1188);
    float _1192 = _1122 * 6.283185482025146484375;
    float _1194 = cos(_1192);
    float _1196 = -_1178;
    float _1198 = _465 + _1196;
    float _1200 = _1126 * _1194;
    float _1202 = -_497;
    float _1204 = _1202 + _517;
    float _1206 = -_495;
    float _1208 = _1206 + _515;
    float _1210 = -_499;
    float _1212 = _1210 + _519;
    float _1214 = _1138 * _1112;
    float _1216 = fma(_1198, _1204, _497);
    float _1218 = fma(_1198, _1208, _495);
    float _1220 = fma(_1198, _1212, _499);
    float _1222 = fma(_1164, _1182, _1214);
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1216);
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1218);
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1220);
    float _1230 = _1112 * _1194;
    float _1232 = _1170 * _1224;
    float _1234 = _1172 * _1226;
    float _1236 = _1176 * _1228;
    float _1238 = fma(_1164, _1214, _1182);
    float _1240 = _1194 * _1232;
    float _1242 = -_1232;
    float _1244 = _1164 * _1242;
    float _1246 = _1146 * _1240;
    float _1248 = fma(_1200, _1234, _1244);
    float _1250 = fma(_1222, _1234, _1246);
    float _1252 = _1138 * _1240;
    float _1254 = fma(_1230, _1236, _1248);
    float _1256 = fma(_1190, _1236, _1250);
    float _1258 = fma(_1186, _1234, _1252);
    float _1260 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1262 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1264 = fma(_1238, _1236, _1258);
    float _1266 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1260);
    float _1268 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1262);
    float _1270 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1266);
    float _1272 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1268);
    float _1274 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1276 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1278 = _719 + _1274;
    float _1280 = _721 + _1276;
    float _1282 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1286 = _1278 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1282);
    float _1294 = _1286 * _1286;
    float _1296 = _1290 * _1290;
    float _1298 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1292);
    float _1300 = _1294 + _1296;
    float _1302 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1304 = sqrt(_1300);
    float _1306 = _823 + _1302;
    bool _1308 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1310 = _1264;
    float _1312 = _1282;
    float _1314 = _1296;
    float _1316 = _1280;
    float _1318 = _1278;
    float _1320 = _1164;
    if (!_1308)
    {
        _1310 = _1294;
    }
    float _1322 = _1310;
    float _1324 = _1322;
    if (!_1308)
    {
        _1312 = _1306;
    }
    float _1326 = _1312;
    bool _1328 = !_1308;
    float _1330 = _1326;
    if (!_1328)
    {
        float _1332 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1336 = _1304 + _1334;
        float _1338 = rsqrt(_1300);
        float _1340 = _1336 * _1332;
        float _1342 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = _1340 * 0.15915493667125701904296875;
        float _1346 = _1344 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        float _1350 = _1344 * 6.283185482025146484375;
        float _1352 = cos(_1350);
        float _1354 = fma(_1348, _1342, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1356 = _1338 * _1354;
        float _1358 = _1352 + (-1.0);
        float _1360 = fma(_1286, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1362 = fma(_1290, _1356, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1364 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1368 = _1360 + _1366;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1372 = _1362 + _1370;
        float _1374 = fma(_1306, _1352, _1364);
        float _1376 = _1368 * _1368;
        float _1378 = _1372 * _1372;
        _1330 = _1374;
        _1324 = _1376;
        _1314 = _1378;
        _1316 = _1362;
        _1318 = _1360;
    }
    float _1380 = _1330;
    float _1382 = _1324;
    float _1384 = _1314;
    float _1386 = _1316;
    float _1388 = _1318;
    float _1390 = in.m_67.x;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1394 = _1380 + _1392;
    float _1396 = in.m_67.y;
    float _1398 = fma(_1394, _1394, _1382);
    float _1400 = in.m_67.z;
    float _1402 = _1398 + _1384;
    float _1404 = in.m_67.w;
    float _1406 = sqrt(_1402);
    out.m_69.x = _1390;
    out.m_69.y = _1396;
    bool _1408 = _1406 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1410 = isnan(_1406);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1416 = _1412 || _1414;
    out.m_69.z = _1400;
    out.m_69.w = _1404;
    float _1418 = _1398;
    float _1420 = _1388;
    float _1422 = _1396;
    float _1424 = _1406;
    if (!_1416)
    {
        _1418 = 1.0;
    }
    float _1426 = _1418;
    bool _1428 = !_1416;
    float _1430 = _1426;
    if (!_1428)
    {
        bool _1432 = _1406 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1434 = isnan(_1406);
        bool _1436 = _1432 || _1434;
        bool _1438 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1440 = _1436 || _1438;
        if (!_1440)
        {
            float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1444 = _1406 + _1442;
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1452 = _1450 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1454 = 1.0 / _1448;
            float _1456 = _1444 * _1454;
            float _1458 = fma(_1456, _1452, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1430 = _1458;
            _1460 = true;
        }
        else
        {
            bool _1462 = _1406 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1464 = isnan(_1406);
            bool _1466 = _1462 || _1464;
            bool _1468 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1470 = _1466 || _1468;
            if (!_1470)
            {
                float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1474 = _1406 + _1472;
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1476 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1484 = 1.0 / _1478;
                float _1486 = _1474 * _1484;
                float _1488 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1430 = _1488;
                _1460 = true;
            }
            else
            {
                _1430 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1460 = false;
    float _1490 = _1430;
    float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1494 = _1380 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1498 = _1386 + _1496;
    bool _1500 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan(0.5);
    bool _1508 = _1504 || _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1512 = _1388 + _1510;
    float _1514 = fma(_1494, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1516 = fma(_1498, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1518 = fma(_1512, _1490, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1520 = _1512;
    float _1522 = _1498;
    if (_1508)
    {
        _1420 = _1518;
    }
    float _1524 = _1420;
    float _1526 = _1524;
    if (_1508)
    {
        _1520 = _1514;
    }
    float _1528 = _1520;
    float _1530 = _1528;
    if (_1508)
    {
        _1522 = _1516;
    }
    float _1532 = _1522;
    float _1534 = _1532;
    if (!_1508)
    {
        float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1538 = _823 + _1536;
        float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1542 = _719 + _1540;
        float _1544 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1546 = _1538 * _1538;
        float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1550 = _721 + _1548;
        float _1552 = fma(_1542, _1542, _1546);
        float _1554 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1556 = fma(_1550, _1550, _1552);
        float _1558 = sqrt(_1556);
        float _1560 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1562 = -_719;
        float _1564 = _1562 + _1518;
        float _1566 = precise::min(_1558, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1568 = _1566 * _1554;
        float _1570 = -_823;
        float _1572 = _1570 + _1514;
        float _1574 = _1560 * _1568;
        float _1576 = -_721;
        float _1578 = _1576 + _1516;
        float _1580 = fma(_1564, _1574, _719);
        float _1582 = fma(_1572, _1574, _823);
        float _1584 = fma(_1578, _1574, _721);
        _1530 = _1582;
        _1526 = _1580;
        _1534 = _1584;
    }
    float _1586 = _1530;
    float _1588 = _1526;
    float _1590 = _1534;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1594 = _1586 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1598 = _1588 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1602 = _1590 + _1600;
    float _1604 = _1594 * _1594;
    float _1606 = fma(_1598, _1598, _1604);
    float _1608 = fma(_1602, _1602, _1606);
    float _1610 = rsqrt(_1608);
    float _1612 = sqrt(_1608);
    float _1614 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1616 = _1598 * _1614;
    float _1618 = _1602 * _1614;
    float _1620 = _1616 * _1616;
    float _1622 = _1618 * _1618;
    float _1624 = _1620 + _1622;
    float _1626 = sqrt(_1624);
    bool _1628 = _1626 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = _1626 + _1630;
    float _1634 = _1610;
    float _1636 = _1632;
    float _1638 = _1594;
    if (_1628)
    {
        float _1640 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1640;
    }
    float _1642 = _1634;
    if (_1628)
    {
        float _1644 = rsqrt(_1624);
        _1422 = _1644;
    }
    float _1646 = _1422;
    float _1648 = _1646;
    if (_1628)
    {
        float _1650 = _1632 * _1642;
        _1636 = _1650;
    }
    float _1652 = _1636;
    if (_1628)
    {
        float _1654 = _1652 * 0.15915493667125701904296875;
        _1424 = _1654;
    }
    float _1656 = _1424;
    float _1658 = _1602;
    if (_1628)
    {
        float _1660 = _1656 * 6.283185482025146484375;
        float _1662 = sin(_1660);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1668 = precise::max(0.0, _1666);
    float _1670 = _1516;
    float _1672 = _1668;
    float _1674 = _1666;
    if (_1628)
    {
        float _1676 = _1656 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        _1670 = _1678;
    }
    float _1680 = _1670;
    float _1682 = -_1614;
    float _1684 = -_1668;
    float _1686 = fma(_1594, _1682, _1684);
    if (_1628)
    {
        float _1688 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1688;
    }
    float _1690 = _1672;
    float _1692 = _1690;
    float _1694 = _1664;
    if (_1628)
    {
        float _1696 = fma(_1664, _1690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1692 = _1696;
    }
    float _1698 = _1692;
    float _1700 = _1698;
    if (!_1628)
    {
        _1694 = _1618;
    }
    float _1702 = _1694;
    float _1704 = _1702;
    if (_1628)
    {
        float _1706 = _1680 + (-1.0);
        _1674 = _1706;
    }
    float _1708 = _1674;
    float _1710 = _1708;
    if (_1628)
    {
        float _1712 = _1646 * _1698;
        _1320 = _1712;
    }
    float _1714 = _1320;
    if (!_1628)
    {
        _1648 = _1616;
    }
    float _1716 = _1648;
    float _1718 = _1716;
    if (_1628)
    {
        float _1720 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1720;
    }
    float _1722 = _1638;
    float _1724 = _1722;
    if (_1628)
    {
        float _1726 = _1616 * _1714;
        _1718 = _1726;
    }
    float _1728 = _1718;
    if (!_1628)
    {
        _1700 = _1686;
    }
    float _1730 = _1700;
    float _1732 = _1730;
    if (_1628)
    {
        float _1734 = _1618 * _1714;
        _1704 = _1734;
    }
    float _1736 = _1704;
    if (!_1628)
    {
        _1710 = _1620;
    }
    float _1738 = _1710;
    float _1740 = _1738;
    if (_1628)
    {
        float _1742 = fma(_1686, _1680, _1722);
        _1732 = _1742;
    }
    float _1744 = _1732;
    if (_1628)
    {
        float _1746 = _1728 * _1728;
        _1740 = _1746;
    }
    float _1748 = _1740;
    if (!_1628)
    {
        _1724 = _1622;
    }
    float _1750 = _1724;
    float _1752 = _1750;
    if (_1628)
    {
        float _1754 = _1736 * _1736;
        _1752 = _1754;
    }
    float _1756 = _1752;
    float _1758 = fma(_1744, _1744, _1748);
    float _1760 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1762 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1764 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1766 = _1758 + _1756;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1770 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1768);
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1760);
    float _1776 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1778 = rsqrt(_1766);
    float _1780 = -_1772;
    float _1782 = _1780 + 1.0;
    float _1784 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1774);
    float _1786 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1776);
    float _1788 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1764);
    float _1790 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1792 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1794 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1786);
    float _1796 = abs(_1782);
    float _1798 = log2(_1796);
    float _1800 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1788);
    float _1802 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1804 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1806 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1790);
    float _1808 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1810 = -_1802;
    float _1812 = fma(_1810, _1762, 1.0);
    float _1814 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1816 = _1778 * _1728;
    float _1818 = _1778 * _1744;
    float _1820 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1806);
    float _1822 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1814);
    float _1824 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1826 = _1778 * _1736;
    float _1828 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1830 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1822);
    float _1832 = -_1824;
    float _1834 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1832);
    float _1836 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1838 = log2(_1812);
    float _1840 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1842 = -_1826;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1834);
    float _1846 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1848 = fma(_1844, -0.5, 0.5);
    float _1850 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1846);
    float _1852 = exp2(_1836);
    float _1854 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1830);
    float _1856 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1840);
    float _1858 = fma(_1844, 0.5, 0.5);
    float _1860 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1850);
    float _1862 = _1818 + 1.0;
    float _1864 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1856);
    float _1866 = fma(_1858, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1868 = 1.0 / _1854;
    float _1870 = _1838 * 0.693147182464599609375;
    float _1872 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1864);
    float _1874 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1860);
    float _1876 = fma(_1858, _1866, -0.212114393711090087890625);
    float _1878 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1880 = sqrt(_1848);
    float _1882 = -_1818;
    float _1884 = fma(_1852, _1862, _1882);
    float _1886 = fma(_1858, _1876, 1.570728778839111328125);
    float _1888 = fma(_1884, 0.5, 0.5);
    float _1890 = _1872 * _1868;
    float _1892 = _1874 * _1868;
    float _1894 = fma(_1890, 0.5, 0.5);
    float _1896 = fma(_1892, -0.5, 0.5);
    float _1898 = _1880 * 0.636619746685028076171875;
    float3 _4907 = float3(_1894, _1896, _1878);
    float _1900 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4907, float3(0.0), isnan(_4907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4907, float3(0.0), isnan(_4907)), level(0.0)).x;
    float3 _4918 = float3(_1894, _1896, _1878);
    float4 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4918, float3(0.0), isnan(_4918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4918, float3(0.0), isnan(_4918)), level(0.0)).xyzw;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = _1903.w;
    float _1913 = -_1886;
    float _1915 = fma(_1898, _1913, 1.0);
    float2 _4940 = float2(_1915, _1888);
    float3 _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4940, float2(0.0), isnan(_4940)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4940, float2(0.0), isnan(_4940)), level(0.0)).xyz;
    float _1919 = _1917.x;
    float _1921 = _1917.y;
    float _1923 = _1917.z;
    float _1925 = _823 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1927 = _823 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1929 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1931 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1925);
    float _1933 = fma(_719, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1927);
    float _1935 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1929);
    float _1937 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1931);
    float _1939 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1933);
    float _1941 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1935);
    float _1943 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1945 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1947 = 1.0 / _1943;
    bool _1949 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1951 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(0.5);
    bool _1957 = _1953 || _1955;
    float _1959 = _1945 + _1943;
    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1963 = _1929;
    float _1965 = _1798;
    if (!_1957)
    {
        _1961 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1967 = _1961;
    float _1969 = _1959 * _1947;
    float _1971 = _1969 * 0.5;
    float _1973 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1975 = _1967;
    float _1977 = _1971;
    if (_1957)
    {
        _1963 = 1.0;
    }
    float _1979 = _1963;
    float _1981 = _1979;
    if (!_1957)
    {
        float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1985 = fma(_1971, _1967, _1983);
        _1975 = _1985;
    }
    float _1987 = _1975;
    if (!_1957)
    {
        _1977 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1989 = _1977;
    float _1991 = exp2(_1973);
    if (!_1957)
    {
        float _1993 = -_1989;
        float _1995 = _1993 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _725 = _1995;
    }
    float _1997 = _725;
    float _1999 = _1987;
    if (!_1957)
    {
        float _2001 = 1.0 / _1987;
        _1999 = _2001;
    }
    float _2003 = _1999;
    float _2005 = _1896;
    if (!_1957)
    {
        float _2007 = 1.0 / _1997;
        _2005 = _2007;
    }
    float _2009 = _2005;
    if (!_1957)
    {
        float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2013 = -_1989;
        float _2015 = fma(_2003, _2011, _2013);
        _1965 = _2015;
    }
    float _2017 = _1965;
    float _2019 = -_1991;
    float _2021 = _2019 + 1.0;
    float _2023 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1957)
    {
        float _2025 = _2017 * _2009;
        float _2027 = precise::clamp(_2025, 0.0, 1.0);
        _1981 = _2027;
    }
    float _2029 = _1981;
    float _2031 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1941);
    float _2033 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2035 = _2031 + _1854;
    bool _2037 = _2029 > 0.0;
    bool _2039 = isnan(_2029);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(0.0);
    bool _2045 = _2041 || _2043;
    out.gl_Position.x = _1872;
    out.gl_Position.y = _1874;
    out.gl_Position.z = _2031;
    out.gl_Position.w = _1854;
    float _2047 = _2033 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2049 = _2035 * 0.5;
    out.m_49.x = _2047;
    out.m_71.z = _2049;
    out.m_71.w = _1854;
    float _2051 = _2023 * _1900;
    float _2053 = -_2023;
    float _2055 = _2053 + 1.0;
    float _2057 = _1911 * _2051;
    float _2059 = _1923 * _2051;
    float _2061 = fma(_1919, _2057, _1905);
    float _2063 = fma(_1921, _2057, _1907);
    float _2065 = _1911 * _2055;
    float _2067 = fma(_1911, _2059, _1909);
    out.m_73.x = _2061;
    out.m_73.y = _2063;
    out.m_73.z = _2067;
    out.m_73.w = _2065;
    if (_2045)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2069 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2069;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

