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
    float4 m_55 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

static inline __attribute__((always_inline))
int _86(thread const int& _7949, thread const int& _7950, constant _10& support_buffer)
{
    float _7953 = as_type<float>(support_buffer._m4);
    int _7955 = _7950 + as_type<int>(_7953);
    int _7957 = 1 + _7955;
    float _7959 = support_buffer._m5[_7957].x;
    float _7961 = abs(_7959);
    bool _7963 = _7961 == 1.0;
    if (_7963)
    {
        return _7949;
    }
    float _7965 = float(_7949);
    float _7967 = _7965 / _7961;
    int _7969 = int(_7967);
    return _7969;
}

static inline __attribute__((always_inline))
int _87(thread const int& _7999, thread const int& _8000, constant _10& support_buffer)
{
    float _8003 = as_type<float>(support_buffer._m4);
    int _8005 = _8000 + as_type<int>(_8003);
    int _8007 = 1 + _8005;
    float _8009 = support_buffer._m5[_8007].x;
    bool _8011 = _8009 == 1.0;
    if (_8011)
    {
        return _7999;
    }
    float _8013 = float(_7999);
    float _8015 = _8013 * _8009;
    int _8017 = int(_8015);
    return _8017;
}

static inline __attribute__((always_inline))
void _84(thread int& _7946, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _7946 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _933 = false;
    bool _767 = false;
    bool _551 = false;
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3220 = as_type<float>(_111);
        out.gl_Position.z = _3220;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _3289 = as_type<float>(_149);
        out.gl_Position.z = _3289;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_51.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    int _169 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _171 = _169 != 0;
    float _173 = _155 * _153;
    float _175 = 0.0;
    if (!_167)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _175 = _179;
    }
    float _181 = _175;
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _185 = _181;
    if (!_167)
    {
        float _187 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    float _191 = _183 * 6.283185482025146484375;
    float _193 = floor(_183);
    float _195 = _191 * 0.15915493667125701904296875;
    float _197 = in.m_49.x;
    float _199 = in.m_49.y;
    float _201 = in.m_49.z;
    float _203 = _195 * 6.283185482025146484375;
    float _205 = cos(_203);
    float _207 = -_193;
    float _209 = _183 + _207;
    float _211 = _193;
    float _213 = _189;
    if (!_167)
    {
        _211 = _157;
    }
    float _215 = _211;
    float _217 = fma(_205, 0.5, 0.5);
    bool _219 = !_167;
    float _221 = _215;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _157 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _157);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _251;
    }
    float _253 = _213;
    bool _255 = !_167;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _157 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _221 = _275;
    }
    float _277 = _221;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_53.w;
    bool _289 = _209 < 0.5;
    float _291 = float(_289);
    float _293 = in.m_44.x;
    float _295 = in.m_44.y;
    float _297 = in.m_44.z;
    bool _299 = !_281;
    int _301 = _299 ? 0 : 1;
    float _303 = -_209;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _307 = !_171;
    int _309 = _307 ? 0 : 1;
    float _311 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _313 = abs(_301);
    float _315 = -_291;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = -_217;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _323 = fma(_277, _197, _311);
    int _325 = abs(_309);
    float _327 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = fma(_277, _199, _327);
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _337 = abs(_331);
    float _339 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = float(_313);
    float _343 = float(_325);
    float _345 = fma(_277, _201, _339);
    float _347 = abs(_305);
    float _349 = _341 * _347;
    float _351 = fma(_333, _287, _295);
    float _353 = float(_337);
    float _355 = fma(_343, _321, _349);
    float _357 = fma(_323, _287, _293);
    float _359 = fma(_345, _287, _297);
    float _361 = abs(_317);
    float _363 = fma(_353, _361, _355);
    bool _365 = !_335;
    bool _367 = _281;
    float _383;
    if (!_365)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _371 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_95);
        float _389 = 1.0 / _387;
        float _391 = _129 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _393 + _395;
    bool _399 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _413 = _393 + _411;
    bool _415 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _417 = isnan(_393);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _435 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _437 = isnan(_393);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = 1.0 / _429;
    float _453 = _445 * _449;
    float _455 = -_445;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _459;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = 1.0 / _433;
    float _467 = _425 * _457;
    float _469 = -_425;
    float _471 = _469 + 1.0;
    float _473 = _397 * _451;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _479;
    float _483 = fma(_461, _473, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _485 = fma(_477, _473, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _487 = fma(_481, _473, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _489 = _413 * _465;
    float _491 = _483 * _467;
    float _493 = _485 * _467;
    float _495 = _487 * _467;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _509 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _511 = fma(_499, _489, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _513 = fma(_503, _489, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _515 = fma(_507, _489, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _517 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].y, _493);
    float _519 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].z, _495);
    float _521 = fma(_511, _453, _509);
    float _523 = fma(_513, _453, _517);
    float _525 = fma(_515, _453, _519);
    float _527 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _521);
    float _529 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _525);
    bool _533 = !_463;
    float _549;
    if (!_533)
    {
        float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _537 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _541 = _539 * _535;
        float _543 = floor(_541);
        float _545 = -_543;
        float _547 = _541 + _545;
        _549 = _547;
        _551 = true;
    }
    else
    {
        float _553 = float(_95);
        float _555 = 1.0 / _553;
        float _557 = _129 * _555;
        _549 = _557;
    }
    _551 = false;
    float _559 = _549;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _559 + _561;
    float _565 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _575;
    bool _579 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = isnan(_559);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = 1.0 / _569;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _597 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _599 = isnan(_559);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _611 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _615 = 1.0 / _573;
    float _617 = _577 * _591;
    bool _619 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _621 = isnan(_559);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = 1.0 / _595;
    float _633 = -_589;
    float _635 = _633 + 1.0;
    float _637 = fma(_617, _563, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _643 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _645 = isnan(_559);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -_629;
    float _657 = _655 + 1.0;
    float _659 = _629 * _635;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _665 = 1.0 / _641;
    float _667 = -_653;
    float _669 = _667 + 1.0;
    float _671 = _607 * _657;
    float _673 = _663 * _615;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _675;
    float _679 = _589 * _669;
    float _681 = _637 * _671;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _685 = _559 + _683;
    float _687 = -_607;
    float _689 = _687 + 1.0;
    bool _691 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _693 = isnan(_559);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = _677 * _631;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _711 = _559 + _709;
    float _713 = fma(_673, _685, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _715 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[115].x, _681);
    float _717 = -_701;
    float _719 = _717 + 1.0;
    float _721 = _707 * _665;
    float _723 = fma(_703, _711, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _727 = _559 + _725;
    float _729 = fma(_713, _659, _715);
    float _731 = _653 * _719;
    float _733 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = fma(_721, _727, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _737 = fma(_723, _679, _729);
    float _739 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = fma(_735, _731, _737);
    float _745 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[119].x, _743);
    float _747 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _739;
    out.m_55.y = _733;
    out.m_55.z = _741;
    out.m_55.w = _747;
    bool _749 = !_613;
    float _765;
    if (!_749)
    {
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _753 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].z, _129);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_95);
        float _771 = 1.0 / _769;
        float _773 = _129 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _779 = _775 + _777;
    bool _781 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _783 = isnan(_775);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _795 = _775 + _793;
    bool _797 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _799 = isnan(_775);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _817 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _819 = isnan(_775);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_791;
    float _831 = _829 + 1.0;
    float _833 = 1.0 / _811;
    float _835 = _827 * _831;
    float _837 = -_827;
    float _839 = _837 + 1.0;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _841;
    bool _845 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _847 = 1.0 / _815;
    float _849 = _807 * _839;
    float _851 = -_807;
    float _853 = _851 + 1.0;
    float _855 = _779 * _833;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _861;
    float _865 = fma(_843, _855, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _867 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _869 = fma(_863, _855, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _871 = _795 * _847;
    float _873 = _865 * _849;
    float _875 = _867 * _849;
    float _877 = _869 * _849;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _891 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[123].x, _873);
    float _893 = fma(_881, _871, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _895 = fma(_885, _871, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _897 = fma(_889, _871, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _899 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[123].y, _875);
    float _901 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[123].z, _877);
    float _903 = fma(_893, _835, _891);
    float _905 = fma(_895, _835, _899);
    float _907 = fma(_897, _835, _901);
    float _909 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[125].x, _903);
    float _911 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[125].y, _905);
    float _913 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[125].z, _907);
    bool _915 = !_845;
    float _931;
    if (!_915)
    {
        float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _919 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _923 = _921 * _917;
        float _925 = floor(_923);
        float _927 = -_925;
        float _929 = _923 + _927;
        _931 = _929;
        _933 = true;
    }
    else
    {
        float _935 = float(_95);
        float _937 = 1.0 / _935;
        float _939 = _129 * _937;
        _931 = _939;
    }
    _933 = false;
    float _941 = _931;
    int _943 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _945 = _943;
    int _947 = 0;
    int _949 = _86(_945, _947, (*spvDescriptorSet0.support_buffer));
    float _951 = in.m_51.y;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _955 = in.m_57.z;
    float _957 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _151);
    float _959 = _957 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _961 = -_953;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _965 = fma(_963, _951, _953);
    float _967 = _959 * _965;
    float _969 = trunc(_955);
    int _971 = int(_969);
    float _973 = float(_949);
    int _975 = abs(_949);
    bool _977 = _949 == 0;
    float _979 = _967 * _973;
    float _981 = float(uint(_975));
    float _983 = trunc(_979);
    int _985 = int(_983);
    float _987 = 1.0 / _981;
    int _989 = abs(_985);
    uint _992 = uint(int(uint(_985) >> uint(31)));
    float _994 = float(uint(_989));
    int _996 = ~int(_992);
    int _998 = _996 + 1;
    int _1000 = as_type<int>(_987) + (-2);
    float _1002 = as_type<float>(_1000) * _994;
    float _1004 = trunc(_1002);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    int _1010 = ~int(_1008);
    int _1012 = _1010 + 1;
    int _1014 = _1012 * _975;
    int _1016 = _1014 + _989;
    float _1018 = float(uint(_1016));
    float _1020 = as_type<float>(_1000) * _1018;
    float _1022 = trunc(_1020);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = int(_1008) + int(_1026);
    int _1030 = ~_1028;
    int _1032 = _1030 + 1;
    int _1034 = _1032 * _975;
    int _1036 = _1034 + _989;
    bool _1038 = uint(_1036) >= uint(_975);
    bool _1040 = !_1038;
    int _1042 = _1040 ? 0 : (-1);
    int _1044 = ~_1028;
    int _1046 = _1044 + _1042;
    int _1048 = _1046 + 1;
    int _1050 = _1048 * _975;
    int _1052 = _1050 + _989;
    int _1054 = _1052 ^ _998;
    int _1056 = ~_998;
    int _1058 = _1056 + _1054;
    int _1060 = _1058 + 1;
    bool _1062 = !_977;
    int _1064 = _1062 ? _1060 : (-1);
    int _1066 = _1064;
    int _1068 = 0;
    int _1070 = _87(_1066, _1068, (*spvDescriptorSet0.support_buffer));
    int _1072 = _971;
    int _1074 = 0;
    int _1076 = _87(_1072, _1074, (*spvDescriptorSet0.support_buffer));
    float4 _1079 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1070, _1076)), 0).xyzw;
    float _1081 = _1079.x;
    float _1083 = _1079.y;
    float _1085 = _1079.z;
    float _1087 = _1079.w;
    float _1089 = in.m_57.x;
    float _1091 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1095 = _1093 != 0;
    float _1097 = in.m_57.y;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1101 = _1099 != 0;
    float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1107 = _1105 != 0;
    float _1109 = in.m_51.w;
    float _1111 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1115 = _1113 != 0;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1121 = _871;
    bool _1123 = _1038;
    int _1125 = _1036;
    float _1127 = as_type<float>(_989);
    if (_1095)
    {
        float _1129 = in.m_51.z;
        _1121 = _1129;
    }
    float _1131 = _1121;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    if (_1101)
    {
        bool _1137 = _151 > 0.5;
        _1123 = _1137;
    }
    bool _1139 = _1123;
    float _1141 = 1.0 / _1119;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1145 = _1089;
    if (_1101)
    {
        float _1147 = -_1089;
        float _1149 = _1147 + 1.0;
        _1125 = as_type<int>(_1149);
    }
    int _1151 = _1125;
    if (!_1101)
    {
        _1127 = _1089;
    }
    float _1153 = _1127;
    int _1155 = 0;
    float _1157 = _1153;
    if (_1095)
    {
        float _1159 = -_1089;
        float _1161 = _1159 + 1.0;
        _1155 = as_type<int>(_1161);
    }
    int _1163 = _1155;
    float _1165 = 0.0;
    if (!_1095)
    {
        _1165 = _1089;
    }
    float _1167 = _1165;
    float _1169 = 1.0 / _1135;
    float _1171 = _1167;
    if (_1101)
    {
        float _1173 = _1139 ? as_type<float>(_1151) : _1089;
        _1157 = _1173;
    }
    float _1175 = _1157;
    float _1177 = -_1097;
    float _1179 = _1177 + 1.0;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1183 = _1181 != 0;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1189 = _1187 != 0;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1193 = 0;
    float _1195 = _1175;
    if (_1115)
    {
        float _1197 = -_1089;
        float _1199 = _1197 + 1.0;
        _1193 = as_type<int>(_1199);
    }
    int _1201 = _1193;
    float _1203 = fma(_1111, -2.0, _1185);
    float _1205 = -_1143;
    float _1207 = fma(_1091, 2.0, _1205);
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1211 = _941 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1215 = _941 + _1213;
    if (_1095)
    {
        bool _1217 = _1131 > 0.5;
        _367 = _1217;
    }
    bool _1219 = _367;
    float _1221 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1191);
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1225 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1203);
    if (_1095)
    {
        float _1227 = _1219 ? as_type<float>(_1163) : _1089;
        _1171 = _1227;
    }
    float _1229 = _1171;
    bool _1231 = _951 > 0.5;
    bool _1233 = _1231 && _1183;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1237 = _1235 != 0;
    float _1239 = _1233 ? _1179 : _1097;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1247 = _1245 != 0;
    bool _1249 = _1109 > 0.5;
    bool _1251 = _1249 && _1243;
    float _1253 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1265 = _1251 ? _1179 : _1097;
    int _1267 = 0;
    if (_1237)
    {
        float _1269 = -_1089;
        float _1271 = _1269 + 1.0;
        _1267 = as_type<int>(_1271);
    }
    int _1273 = _1267;
    float _1275 = _1259 * _1141;
    bool _1277 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1279 = isnan(_941);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = _1263 * _1169;
    float _1291 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1221);
    float _1293 = fma(_1275, _1211, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1295 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1297 = isnan(_941);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = -_1287;
    float _1309 = _1307 + 1.0;
    float _1311 = fma(_1289, _1215, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1313 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1315 = isnan(_941);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1327 = _1305 * _1309;
    float _1329 = -_1305;
    float _1331 = _1329 + 1.0;
    float _1333 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1335 = fma(_1253, _1239, -0.5);
    float _1337 = _1323 * _1331;
    float _1339 = fma(_1333, _1265, -0.5);
    float _1341 = -_1323;
    float _1343 = _1341 + 1.0;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1347 = _1293 * _1337;
    bool _1349 = _951 > 0.5;
    float _1351 = _1337;
    float _1353 = _1293;
    bool _1355 = _1349;
    float _1357 = as_type<float>(_1273);
    int _1359 = as_type<int>(_1335);
    if (_1107)
    {
        float _1361 = in.m_51.z;
        _1351 = _1361;
    }
    float _1363 = _1351;
    float _1365 = -_1225;
    float _1367 = fma(_1291, _1335, _1365);
    float _1369 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1347);
    float _1371 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1373 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1379 = _1373;
    float _1381 = _1371;
    if (!_1237)
    {
        _1353 = _1089;
    }
    float _1383 = _1353;
    float _1385 = fma(_1311, _1327, _1369);
    float _1387 = _1383;
    if (_1237)
    {
        float _1389 = _1349 ? as_type<float>(_1273) : _1089;
        _1387 = _1389;
    }
    float _1391 = _1387;
    float _1393 = fma(_1373, _1175, -0.5);
    if (_1115)
    {
        float _1395 = _1349 ? as_type<float>(_1201) : _1089;
        _1145 = _1395;
    }
    float _1397 = _1145;
    float _1399 = fma(_1371, _1229, -0.5);
    if (_1107)
    {
        _1355 = false;
    }
    bool _1401 = _1355;
    float _1403 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1377);
    bool _1405 = _1401;
    if (_1107)
    {
        _1357 = _151;
    }
    float _1407 = _1357;
    int _1409 = 0;
    float _1411 = _1407;
    if (_1107)
    {
        _1409 = as_type<int>(_951);
    }
    int _1413 = _1409;
    float _1415 = _1363;
    int _1417 = _1413;
    if (_1107)
    {
        _1359 = as_type<int>(_1363);
    }
    int _1419 = _1359;
    int _1421 = _1419;
    if (!_1107)
    {
        float _1423 = in.m_51.z;
        float _1425 = _151 * 3.1415927410125732421875;
        float _1427 = _1425 * 0.15915493667125701904296875;
        float _1429 = _951 * 3.1415927410125732421875;
        float _1431 = _1429 * 0.15915493667125701904296875;
        float _1433 = _1427 * 6.283185482025146484375;
        float _1435 = sin(_1433);
        float _1437 = _1431 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = _1423 * 3.1415927410125732421875;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        _1415 = _1423;
        _1405 = true;
        _1411 = _1435;
        _1421 = as_type<int>(_1447);
        _1417 = as_type<int>(_1439);
        _1195 = _1443;
    }
    float _1449 = _1415;
    bool _1451 = _1405;
    float _1453 = _1411;
    int _1455 = _1421;
    int _1457 = _1417;
    float _1459 = _1195;
    float _1461 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _1463 = _1449 > 0.5;
    float _1465 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1385);
    float _1467 = _1459;
    float _1469 = _1449;
    if (_1451)
    {
        _1379 = _951;
    }
    float _1471 = _1379;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1475 = _1471;
    if (_1451)
    {
        _1381 = _951;
    }
    float _1477 = _1381;
    float _1479 = fma(_1461, _1391, -0.5);
    float _1481 = _1477;
    if (_1451)
    {
        _1467 = _1449;
    }
    float _1483 = _1467;
    float _1485 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1403);
    float _1487 = _1483;
    if (!_1451)
    {
        _1475 = _151;
    }
    float _1489 = _1475;
    float _1491 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    if (!_1451)
    {
        _1481 = _151;
    }
    float _1493 = _1481;
    float _1495 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    if (!_1451)
    {
        _1487 = _951;
    }
    float _1497 = _1487;
    float _1499 = fma(_1491, _1397, -0.5);
    if (!_1451)
    {
        _1469 = _951;
    }
    float _1501 = _1469;
    float _1503 = -_1473;
    float _1505 = fma(_1495, 2.0, _1503);
    float _1507 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1509 = -_129;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1505);
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1515 = _1451 ? as_type<float>(_1455) : as_type<float>(_1457);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1519 = fma(as_type<float>(_1457), (*spvDescriptorSet0.vp_c9)._m0[93].w, _1513);
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1523 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1517);
    float _1525 = _1451 ? as_type<float>(_1457) : _1453;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1529 = as_type<float>(_1457) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1531 = -_129;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1207);
    float _1535 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1527);
    float _1537 = fma(_1529, -2.0, _1521);
    int _1539 = _1463 ? as_type<int>(_1179) : as_type<int>(_1097);
    float _1541 = fma(_1485, _1393, _1533);
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1545 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1549 = -_1543;
    float _1551 = fma(_1545, 2.0, _1549);
    float _1553 = _1189 ? as_type<float>(_1539) : _1097;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _1557 = _1247 ? as_type<float>(_1539) : _1097;
    float _1559 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1563 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1555);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1567 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1559);
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1571 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1523);
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1575 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _1577 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1565);
    float _1579 = -_1569;
    float _1581 = fma(_1507, 2.0, _1579);
    float _1583 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1519);
    float _1585 = fma(_1571, _1479, _1511);
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1589 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1591 = fma(_1575, -2.0, _1573);
    float _1593 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _1595 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1597 = fma(_1589, -2.0, _1587);
    float _1599 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[97].w, _1577);
    float _1601 = fma(_1593, _1557, -0.5);
    float _1603 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1591);
    float _1605 = fma(_1595, _1553, -0.5);
    float _1607 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1537);
    float _1609 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1535);
    float _1611 = -_1603;
    float _1613 = fma(_1599, _1601, _1611);
    float _1615 = -_129;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1581);
    int _1619 = _1064 + 1;
    float _1621 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1563);
    float _1623 = -_129;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1551);
    float _1627 = -_1607;
    float _1629 = fma(_1583, _1605, _1627);
    float _1631 = fma(_1609, _1399, _1617);
    int _1633 = abs(_1619);
    float _1635 = fma(_1621, _1499, _1625);
    float _1637 = _1629 + 0.5;
    float _1639 = _909 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1641 = float(uint(_1633));
    float _1643 = _911 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1645 = _913 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1651 = as_type<float>(_1000) * _1641;
    float _1653 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1655 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _1657 = as_type<uint>(half2(float2(_1087, 0.0)));
    float _1659 = _1585 + 0.5;
    uint _1661 = uint(int(uint(_1619) >> uint(31)));
    float _1663 = trunc(_1651);
    float _1665 = precise::max(_1663, 0.0);
    uint _1667 = uint(_1665);
    out.m_59.x = _1647;
    out.m_59.y = _1653;
    out.m_59.z = _1655;
    out.m_59.w = _1649;
    uint _1669 = extract_bits(_1657, 0u, 8u);
    int _1671 = int(_1669) & 255;
    uint _1673 = extract_bits(_1657, 8u, 8u);
    int _1675 = int(_1673) & 255;
    int _1677 = _1675 << 8;
    int _1679 = _1671 | _1677;
    float _1681 = _1635 + 0.5;
    int _1683 = ~int(_1661);
    int _1685 = _1683 + 1;
    float _1687 = _1613 + 0.5;
    out.m_61.x = _1659;
    out.m_61.y = _1637;
    float _1689 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1567);
    float _1691 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1597);
    out.m_63.x = _1681;
    out.m_63.y = _1687;
    float _1693 = -_1691;
    float _1695 = fma(_1689, _1339, _1693);
    int _1697 = ~int(_1667);
    int _1699 = _1697 + 1;
    int _1701 = _1699 * _975;
    int _1703 = _1701 + _1633;
    float _1705 = float(uint(_1703));
    float _1707 = as_type<float>(_1000) * _1705;
    float _1709 = trunc(_1707);
    float _1711 = precise::max(_1709, 0.0);
    uint _1713 = uint(_1711);
    int _1715 = int(_1667) + int(_1713);
    int _1717 = ~_1715;
    int _1719 = _1717 + 1;
    int _1721 = _1719 * _975;
    int _1723 = _1721 + _1633;
    bool _1725 = uint(_1723) >= uint(_975);
    float _1727 = _1631 + 0.5;
    bool _1729 = !_1725;
    int _1731 = _1729 ? 0 : (-1);
    bool _1733 = _1679 >= 32768;
    int _1735 = ~_1715;
    int _1737 = _1735 + _1731;
    int _1739 = _1737 + 1;
    float _1741 = _1695 + 0.5;
    int _1743 = _1739 * _975;
    int _1745 = _1743 + _1633;
    int _1747 = _1745 ^ _1685;
    int _1749 = ~_1685;
    int _1751 = _1749 + _1747;
    int _1753 = _1751 + 1;
    int _1755 = _1679 + (-1024);
    int _1757 = _1755;
    if (_1733)
    {
        int _1759 = ~_1679;
        int _1761 = _1759 + 33792;
        int _1763 = _1761 + 1;
        _1757 = _1763;
    }
    int _1765 = _1757;
    bool _1767 = !_977;
    int _1769 = _1767 ? _1753 : (-1);
    int _1771 = _1765 + 30719;
    float _1773 = float(_1771);
    float _1775 = fma(_1773, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1777 = _1367 + 0.5;
    float _1779 = abs(_1775);
    float _1781 = -_1779;
    float _1783 = _1781 + 1.0;
    int _1785 = as_type<int>(_1783) + (-218103808);
    bool _1787 = uint(_1785) >= 1920991232u;
    float _1789 = _1541 + 0.5;
    bool _1791 = !_1787;
    if (!_1791)
    {
        int _1793;
        _84(_1793, out.gl_Position, out.gl_PointSize);
    }
    int _1795 = _1769;
    int _1797 = 0;
    int _1799 = _87(_1795, _1797, (*spvDescriptorSet0.support_buffer));
    int _1801 = _971;
    int _1803 = 0;
    int _1805 = _87(_1801, _1803, (*spvDescriptorSet0.support_buffer));
    float4 _1807 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1799, _1805)), 0).xyzw;
    float _1809 = _1807.x;
    float _1811 = _1807.y;
    float _1813 = _1807.z;
    float _1815 = _1807.w;
    float _1817 = floor(_979);
    float _1819 = -_1817;
    float _1821 = _979 + _1819;
    uint _1823 = as_type<uint>(half2(float2(_1815, 0.0)));
    float _1825 = -_1081;
    float _1827 = _1825 + _1809;
    float _1829 = -_1083;
    float _1831 = _1829 + _1811;
    float _1833 = -_1085;
    float _1835 = _1833 + _1813;
    uint _1837 = extract_bits(_1823, 0u, 8u);
    int _1839 = int(_1837) & 255;
    uint _1841 = extract_bits(_1823, 8u, 8u);
    int _1843 = int(_1841) & 255;
    int _1845 = _1843 << 8;
    int _1847 = _1839 | _1845;
    float _1849 = fma(_1821, _1827, _1081);
    float _1851 = fma(_1821, _1831, _1083);
    float _1853 = fma(_1821, _1835, _1085);
    bool _1855 = _1847 >= 32768;
    int _1857 = _1847 + (-1024);
    int _1859 = _1857;
    if (_1855)
    {
        int _1861 = ~_1847;
        int _1863 = _1861 + 33792;
        int _1865 = _1863 + 1;
        _1859 = _1865;
    }
    int _1867 = _1859;
    int _1869 = _1867 + 30719;
    float _1871 = float(_1869);
    float _1873 = fma(_1871, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1875 = abs(_1873);
    float _1877 = -_1875;
    float _1879 = _1877 + 1.0;
    int _1881 = as_type<int>(_1879) + (-218103808);
    bool _1883 = uint(_1881) >= 1920991232u;
    bool _1885 = !_1883;
    if (!_1885)
    {
        int _1887;
        _84(_1887, out.gl_Position, out.gl_PointSize);
    }
    float _1889 = in.m_51.x;
    float _1891 = in.m_51.y;
    float _1893 = in.m_51.z;
    float _1895 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1897 = log2(_1895);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1901 = 1.0 + _1899;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1905 = _1903 != 0;
    int _1907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1909 = _1907 != 0;
    int _1911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1913 = _1911 != 0;
    bool _1915 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1917 = isnan(1.0);
    bool _1919 = _1915 || _1917;
    bool _1921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1923 = _1919 || _1921;
    float _1925 = 1.0 / _1901;
    bool _1927 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1929 = isnan(0.0);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1935 = _1931 || _1933;
    float _1937 = _1897 * _129;
    float _1939 = exp2(_1937);
    float _1941 = _1893 * 2.0;
    float _1943 = _1889 * 2.0;
    float _1945 = _1891 * 2.0;
    float _1947 = _1891 + _1889;
    float _1949 = floor(_1941);
    float _1951 = _1891 + _1893;
    float _1953 = _1947 + (-1.0);
    float _1955 = _1951 + (-1.0);
    float _1957 = -_1939;
    float _1959 = _1957 + 1.0;
    float _1961 = floor(_1943);
    float _1963 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1965 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1967 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1969 = _1935 ? _1959 : 0.0;
    float _1971 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1967);
    bool _1973 = _1949 > 0.0;
    float _1975 = floor(_1945);
    bool _1977 = _1949 >= 0.0;
    bool _1979 = isnan(_1949);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.0);
    bool _1985 = _1981 || _1983;
    if (_1923)
    {
        float _1987 = _1969 * _1925;
        _133 = _1987;
    }
    float _1989 = _133;
    float _1991 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1993 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1971);
    int _1995 = _1985 ? 0 : 1;
    float _1997 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1991);
    bool _1999 = _1961 > 0.0;
    int _2001 = ~_1995;
    int _2003 = _2001 + 1;
    int _2005 = _2003 + 1;
    float _2007 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1997);
    int _2009 = _2005;
    int _2011 = as_type<int>(_1989);
    if (!_1973)
    {
        int _2013 = ~_1995;
        int _2015 = _2013 + 1;
        _2009 = _2015;
    }
    int _2017 = _2009;
    bool _2019 = !_1905;
    int _2021 = _2019 ? 0 : 1;
    float _2023 = _2007 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2025 = _1961 >= 0.0;
    bool _2027 = isnan(_1961);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan(0.0);
    bool _2033 = _2029 || _2031;
    int _2035 = abs(_2021);
    float _2037 = _1993 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2039 = _1975 > 0.0;
    float _2041 = -_2023;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _2045 = _1975 >= 0.0;
    bool _2047 = isnan(_1975);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(0.0);
    bool _2053 = _2049 || _2051;
    float _2055 = in.m_65.x;
    float _2057 = in.m_65.y;
    float _2059 = in.m_65.z;
    float _2061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2063 = _2037 + _2061;
    int _2065 = _2033 ? 0 : 1;
    float _2067 = float(_2035);
    float _2069 = abs(_2063);
    float _2071 = abs(_2043);
    float _2073 = precise::max(_2069, _2071);
    int _2075 = ~_2065;
    int _2077 = _2075 + 1;
    int _2079 = _2077 + 1;
    int _2081 = _2079;
    float _2083 = _2063;
    float _2085 = _2043;
    bool _2087 = _2039;
    if (!_1999)
    {
        int _2089 = ~_2065;
        int _2091 = _2089 + 1;
        _2081 = _2091;
    }
    int _2093 = _2081;
    float _2095 = float(_2017);
    bool _2097 = _2073 >= 16.0;
    int _2099 = _2053 ? 0 : 1;
    float _2101 = _2067 * _2095;
    bool _2103 = !_1913;
    int _2105 = _2103 ? 0 : 1;
    float _2107 = _1889 + (-0.5);
    int _2109 = ~_2099;
    int _2111 = _2109 + 1;
    int _2113 = _2111 + 1;
    float _2115 = _1889 + _1893;
    int _2117 = _2113;
    if (!_2039)
    {
        int _2119 = ~_2099;
        int _2121 = _2119 + 1;
        _2117 = _2121;
    }
    int _2123 = _2117;
    float _2125 = _2101 * (-2.0);
    bool _2127 = !_1909;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = abs(_2105);
    float _2133 = fma(_2125, _2055, _2055);
    int _2135 = abs(_2129);
    if (_2097)
    {
        float _2137 = _2063 * 0.0625;
        _2083 = _2137;
    }
    float _2139 = _2083;
    float _2141 = fma(_1965, _2125, _1965);
    float _2143 = float(_2135);
    float _2145 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2133);
    float _2147 = float(_2093);
    if (_2097)
    {
        float _2149 = _2043 * 0.0625;
        _2085 = _2149;
    }
    float _2151 = _2085;
    float _2153 = abs(_2139);
    bool _2155 = _2153 != 0.0;
    bool _2157 = isnan(_2153);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(0.0);
    bool _2163 = _2159 || _2161;
    float _2165 = float(_2131);
    float _2167 = _2143 * _2147;
    float _2169 = float(_2123);
    float _2171 = fma(_2141, _1989, _2145);
    float _2173 = abs(_2151);
    bool _2175 = _2173 == 0.0;
    bool _2177 = !_2163;
    bool _2179 = _2175 && _2177;
    float _2181 = in.m_53.x;
    float _2183 = in.m_53.y;
    float _2185 = in.m_53.z;
    float _2187 = abs(_2151);
    bool _2189 = _2187 == 0.0;
    float _2191 = _2165 * _2169;
    float _2193 = _2171 * 0.15915493667125701904296875;
    float _2195 = _1893 + (-0.5);
    float _2197 = _2115 + (-1.0);
    float _2199 = _2167 * (-2.0);
    float _2201 = _1891 + (-0.5);
    float _2203 = _2191 * (-2.0);
    float _2205 = _2193 * 6.283185482025146484375;
    float _2207 = sin(_2205);
    float _2209 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2211 = fma(_2199, _2057, _2057);
    float _2213 = fma(_2203, _2059, _2059);
    int _2215 = as_type<int>(_2209);
    if (_2179)
    {
        bool _2217 = as_type<int>(_2151) >= 0;
        _2087 = _2217;
    }
    bool _2219 = _2087;
    float _2221 = fma(_1963, _2199, _1963);
    float _2223 = fma(_2209, _2203, _2209);
    float _2225 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2211);
    float _2227 = _2193 * 6.283185482025146484375;
    float _2229 = cos(_2227);
    float _2231 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2213);
    int _2233 = _2219 ? (-1) : 0;
    if (_2179)
    {
        int _2235 = _2219 ? 0 : 1078530011;
        _2215 = _2235;
    }
    int _2237 = _2215;
    float _2239 = fma(_2221, _1989, _2225);
    float _2241 = fma(_2223, _1989, _2231);
    if (_2179)
    {
        int _2243 = int(0x80000000) & as_type<int>(_2139);
        int _2245 = _2237 | _2243;
        _2011 = _2245;
    }
    int _2247 = _2011;
    bool _2249 = !_2163;
    bool _2251 = _2249 && _2189;
    int _2253 = _2247;
    float _2255 = as_type<float>(_2247);
    float _2257 = _2229;
    if (!_2251)
    {
        float _2259 = abs(_2139);
        bool _2261 = _2259 != as_type<float>(0x7f800000u /* inf */);
        bool _2263 = isnan(_2259);
        bool _2265 = _2261 || _2263;
        bool _2267 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2269 = _2265 || _2267;
        float _2271 = abs(_2151);
        bool _2273 = _2271 == as_type<float>(0x7f800000u /* inf */);
        float _2275 = abs(_2151);
        bool _2277 = _2275 == as_type<float>(0x7f800000u /* inf */);
        bool _2279 = !_2269;
        bool _2281 = _2277 && _2279;
        if (_2281)
        {
            bool _2283 = as_type<int>(_2151) >= 0;
            _2233 = _2283 ? (-1) : 0;
        }
        int _2285 = _2233;
        if (_2281)
        {
            _2253 = 1075235812;
        }
        int _2287 = _2253;
        int _2289 = _2287;
        if (_2281)
        {
            int _2291 = ~_2285;
            int _2293 = (_2291 != 0) ? _2287 : 1061752795;
            _2289 = _2293;
        }
        int _2295 = _2289;
        float _2297 = as_type<float>(_2295);
        if (_2281)
        {
            int _2299 = int(0x80000000) & as_type<int>(_2139);
            int _2301 = _2295 | _2299;
            _2297 = as_type<float>(_2301);
        }
        float _2303 = _2297;
        bool _2305 = !_2269;
        bool _2307 = _2305 && _2273;
        _2255 = _2303;
        if (!_2307)
        {
            float _2309 = abs(_2139);
            float _2311 = abs(_2151);
            float _2313 = precise::max(_2309, _2311);
            float _2315 = abs(_2139);
            float _2317 = abs(_2151);
            float _2319 = precise::min(_2315, _2317);
            float _2321 = 1.0 / _2313;
            float _2323 = abs(_2139);
            float _2325 = abs(_2151);
            bool _2327 = _2323 > _2325;
            bool _2329 = as_type<int>(_2151) >= 0;
            float _2331 = abs(_2139);
            float _2333 = abs(_2151);
            float _2335 = _2331 + _2333;
            int _2337 = as_type<int>(_2139) & int(0x80000000);
            bool _2339 = _2335 > as_type<float>(0x7f800000u /* inf */);
            bool _2341 = isnan(_2335);
            bool _2343 = _2339 || _2341;
            bool _2345 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2347 = _2343 || _2345;
            float _2349 = _2319 * _2321;
            float _2351 = _2349 * _2349;
            float _2353 = _2351 + 11.33538818359375;
            float _2355 = fma(_2351, _2353, 28.84246826171875);
            float _2357 = fma(_2351, _2355, 19.6966705322265625);
            float _2359 = fma(_2351, -0.82336294651031494140625, -5.674867153167724609375);
            float _2361 = fma(_2351, _2359, -6.565555095672607421875);
            float _2363 = 1.0 / _2357;
            float _2365 = _2351 * _2361;
            float _2367 = _2349 * _2365;
            float _2369 = fma(_2367, _2363, _2349);
            float _2371 = _2369;
            _2255 = _2335;
            if (_2327)
            {
                float _2373 = -_2369;
                float _2375 = _2373 + 1.57079637050628662109375;
                _2371 = _2375;
            }
            float _2377 = _2371;
            int _2379 = as_type<int>(_2377);
            if (!_2329)
            {
                float _2381 = -_2377;
                float _2383 = _2381 + 3.1415927410125732421875;
                _2379 = as_type<int>(_2383);
            }
            int _2385 = _2379;
            if (!_2347)
            {
                int _2387 = _2337 | _2385;
                _2255 = as_type<float>(_2387);
            }
        }
    }
    float _2389 = _2255;
    float _2391 = -_2389;
    float _2393 = _2239 + _2391;
    float _2395 = _2241 * 0.15915493667125701904296875;
    float _2397 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2399 = _2183 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2401 = _2393 * 0.15915493667125701904296875;
    float _2403 = _2395 * 6.283185482025146484375;
    float _2405 = cos(_2403);
    float _2407 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2409 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2411 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2397);
    float _2413 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1851);
    float _2417 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1849);
    float _2419 = _2401 * 6.283185482025146484375;
    float _2421 = sin(_2419);
    float _2423 = _2407 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2425 = _2409 * _2415;
    float _2427 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2411);
    float _2429 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1853);
    float _2431 = _2423 * _2417;
    float _2433 = _2413 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2435 = _2427 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2437 = _2401 * 6.283185482025146484375;
    float _2439 = cos(_2437);
    float _2441 = _2405 * _2425;
    float _2443 = _2433 * _2429;
    bool _2445 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2447 = isnan(0.5);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2453 = _2449 || _2451;
    float _2455 = _2207 * _2441;
    float _2457 = _2395 * 6.283185482025146484375;
    float _2459 = sin(_2457);
    float _2461 = _2229 * _2421;
    float _2463 = _2207 * _2439;
    float _2465 = _2229 * _2439;
    float _2467 = _2439 * _2405;
    float _2469 = -_2461;
    float _2471 = fma(_2459, _2463, _2469);
    float _2473 = fma(_2471, _2431, _2455);
    float _2475 = _2207 * _2421;
    float _2477 = -_2425;
    float _2479 = _2459 * _2477;
    float _2481 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2483 = _2421 * _2405;
    float _2485 = fma(_2459, _2475, _2465);
    float _2487 = fma(_2467, _2431, _2479);
    float _2489 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2481);
    float _2491 = fma(_2459, _2465, _2475);
    float _2493 = fma(_2485, _2443, _2473);
    float _2495 = fma(_2483, _2443, _2487);
    float _2497 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2489);
    float _2499 = _2023 + _2493;
    float _2501 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2503 = _2037 + _2495;
    float _2505 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2509 = _2499 + _2507;
    float _2511 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2501);
    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2515 = _2503 + _2513;
    float _2517 = 1.0 / _2505;
    float _2519 = _2509 * _2509;
    float _2521 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2511);
    float _2523 = -_2463;
    float _2525 = fma(_2459, _2461, _2523);
    float _2527 = _2461;
    float _2529 = _2443;
    float _2531 = _2463;
    if (_2453)
    {
        _2527 = 1.0;
    }
    float _2533 = _2527;
    float _2535 = fma(_2515, _2515, _2519);
    float _2537 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2539 = sqrt(_2535);
    float _2541 = _2537 + _2505;
    float _2543 = _2541 * _2517;
    float _2545 = _2543 * 0.5;
    float _2547 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2549 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2547);
    float _2551 = _2229 * _2441;
    bool _2553 = _2539 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2555 = fma(_2491, _2431, _2551);
    float _2557 = 1.0 / _2549;
    float _2559 = fma(_2525, _2443, _2555);
    float _2561 = _2435 + _2559;
    float _2563 = _2555;
    float _2565 = _2559;
    float _2567 = _2533;
    if (!_2553)
    {
        _2563 = _2503;
    }
    float _2569 = _2563;
    float _2571 = _2569;
    if (!_2553)
    {
        _2565 = _2499;
    }
    float _2573 = _2565;
    float _2575 = _2573;
    if (!_2553)
    {
        _2529 = _2561;
    }
    float _2577 = _2529;
    bool _2579 = !_2553;
    float _2581 = _2577;
    float _2583 = _2557;
    if (!_2579)
    {
        float _2585 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2589 = _2539 + _2587;
        float _2591 = rsqrt(_2535);
        float _2593 = _2589 * _2585;
        float _2595 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2597 = _2593 * 0.15915493667125701904296875;
        float _2599 = _2597 * 6.283185482025146484375;
        float _2601 = cos(_2599);
        float _2603 = _2597 * 6.283185482025146484375;
        float _2605 = sin(_2603);
        float _2607 = _2601 + (-1.0);
        float _2609 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2611 = fma(_2605, _2595, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2613 = fma(_2561, _2601, _2609);
        float _2615 = _2591 * _2611;
        float _2617 = fma(_2515, _2615, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2619 = fma(_2509, _2615, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2531 = _2615;
        _2581 = _2613;
        _2571 = _2617;
        _2575 = _2619;
    }
    float _2621 = _2531;
    float _2623 = _2581;
    float _2625 = _2571;
    float _2627 = _2575;
    float _2629 = _2621;
    if (_2453)
    {
        _2629 = 1.0;
    }
    float _2631 = _2629;
    float _2633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2635 = _2557 * _2633;
    float _2637 = _2631;
    if (!_2453)
    {
        float _2639 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2641 = _2639 * 0.15915493667125701904296875;
        float _2643 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2645 = _2641 * 6.283185482025146484375;
        float _2647 = cos(_2645);
        float _2649 = _2643 * 0.15915493667125701904296875;
        float _2651 = _2641 * 6.283185482025146484375;
        float _2653 = sin(_2651);
        float _2655 = 1.0 / _2647;
        float _2657 = _2649 * 6.283185482025146484375;
        float _2659 = cos(_2657);
        float _2661 = _2653 * _2655;
        float _2663 = _2649 * 6.283185482025146484375;
        float _2665 = sin(_2663);
        float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2669 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2667;
        float _2671 = _2659 * _2661;
        float _2673 = 1.0 / _2671;
        float _2675 = 1.0 / _2669;
        float _2677 = _2665 * _2673;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = fma(_2635, _2677, _2679);
        float _2683 = _2681 * _2675;
        float _2685 = precise::clamp(_2683, 0.0, 1.0);
        _2583 = _2671;
        _2257 = _2641;
        _2567 = _2685;
    }
    float _2687 = _2583;
    float _2689 = _2257;
    float _2691 = _2567;
    float _2693 = _2689;
    float _2695 = _2687;
    if (!_2453)
    {
        float _2697 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2703 = _2699 * 6.283185482025146484375;
        float _2705 = cos(_2703);
        float _2707 = _2701 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2705;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2635, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2693 = _2727;
        _2695 = _2713;
        _2637 = _2747;
    }
    float _2749 = _2693;
    float _2751 = _2695;
    float _2753 = _2637;
    float _2755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2757 = _2623 + _2755;
    float _2759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2761 = _2625 + _2759;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2765 = _2627 + _2763;
    float _2767 = _2757 * _2757;
    float _2769 = fma(_2761, _2761, _2767);
    float _2771 = fma(_2765, _2765, _2769);
    float _2773 = rsqrt(_2771);
    float _2775 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2777 = _2761 * _2775;
    float _2779 = _2765 * _2775;
    float _2781 = _2777 * _2777;
    float _2783 = _2779 * _2779;
    float _2785 = _2781 + _2783;
    float _2787 = sqrt(_2785);
    bool _2789 = _2787 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2793 = _2787 + _2791;
    float _2795 = _2773;
    float _2797 = _2751;
    float _2799 = _2793;
    float _2801 = _2749;
    float _2803 = _2757;
    float _2805 = _2775;
    float _2807 = _2777;
    if (_2789)
    {
        float _2809 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2795 = _2809;
    }
    float _2811 = _2795;
    if (_2789)
    {
        float _2813 = rsqrt(_2785);
        _2797 = _2813;
    }
    float _2815 = _2797;
    float _2817 = _2815;
    if (_2789)
    {
        float _2819 = _2793 * _2811;
        _2799 = _2819;
    }
    float _2821 = _2799;
    if (_2789)
    {
        float _2823 = _2821 * 0.15915493667125701904296875;
        _2801 = _2823;
    }
    float _2825 = _2801;
    float _2827 = _2811;
    float _2829 = _2825;
    if (_2789)
    {
        float _2831 = _2825 * 6.283185482025146484375;
        float _2833 = sin(_2831);
        _2827 = _2833;
    }
    float _2835 = _2827;
    float _2837 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2839 = precise::max(0.0, _2837);
    float _2841 = _2765;
    float _2843 = _2839;
    if (_2789)
    {
        float _2845 = _2825 * 6.283185482025146484375;
        float _2847 = cos(_2845);
        _2841 = _2847;
    }
    float _2849 = _2841;
    float _2851 = -_2775;
    float _2853 = -_2839;
    float _2855 = fma(_2757, _2851, _2853);
    if (_2789)
    {
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2843 = _2857;
    }
    float _2859 = _2843;
    float _2861 = _2859;
    if (!_2789)
    {
        _2829 = _2855;
    }
    float _2863 = _2829;
    float _2865 = _2863;
    if (_2789)
    {
        float _2867 = fma(_2835, _2859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2803 = _2867;
    }
    float _2869 = _2803;
    float _2871 = sqrt(_2771);
    float _2873 = _2869;
    if (_2789)
    {
        float _2875 = _2849 + (-1.0);
        _2861 = _2875;
    }
    float _2877 = _2861;
    float _2879 = _2877;
    if (_2789)
    {
        float _2881 = _2815 * _2869;
        _2805 = _2881;
    }
    float _2883 = _2805;
    if (!_2789)
    {
        _2817 = _2779;
    }
    float _2885 = _2817;
    float _2887 = _2885;
    if (_2789)
    {
        float _2889 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2873 = _2889;
    }
    float _2891 = _2873;
    float _2893 = _2891;
    if (_2789)
    {
        float _2895 = _2777 * _2883;
        _2807 = _2895;
    }
    float _2897 = _2807;
    if (!_2789)
    {
        _2879 = _2781;
    }
    float _2899 = _2879;
    float _2901 = _2899;
    if (_2789)
    {
        float _2903 = _2779 * _2883;
        _2887 = _2903;
    }
    float _2905 = _2887;
    if (_2789)
    {
        float _2907 = fma(_2855, _2849, _2891);
        _2865 = _2907;
    }
    float _2909 = _2865;
    if (_2789)
    {
        float _2911 = _2897 * _2897;
        _2901 = _2911;
    }
    float _2913 = _2901;
    if (!_2789)
    {
        _2893 = _2783;
    }
    float _2915 = _2893;
    float _2917 = _2915;
    if (_2789)
    {
        float _2919 = _2905 * _2905;
        _2917 = _2919;
    }
    float _2921 = _2917;
    float _2923 = fma(_2909, _2909, _2913);
    float _2925 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2927 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2929 = _2923 + _2921;
    float _2931 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2925);
    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2935 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2933);
    float _2937 = precise::clamp(_2935, 0.0, 1.0);
    float _2939 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2941 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2943 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2931);
    float _2945 = rsqrt(_2929);
    float _2947 = -_2937;
    float _2949 = _2947 + 1.0;
    float _2951 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2939);
    float _2953 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2955 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2957 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2941);
    float _2959 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2951);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2963 = abs(_2949);
    float _2965 = log2(_2963);
    float _2967 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2955);
    float _2969 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2957);
    float _2971 = _2959 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2973 = -_2961;
    float _2975 = fma(_2973, _2927, 1.0);
    float _2977 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2967);
    float _2979 = _2969 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2981 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2983 = _2945 * _2897;
    float _2985 = _2945 * _2909;
    float _2987 = _2977 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2989 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2981);
    float _2991 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2993 = _2945 * _2905;
    float _2995 = log2(_2975);
    float _2997 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2989);
    float _2999 = -_2991;
    float _3001 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2999);
    float _3003 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3005 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3007 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2997);
    float _3009 = -_2993;
    float _3011 = fma(_3009, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3001);
    float _3013 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3015 = exp2(_3003);
    float _3017 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3005);
    float _3019 = fma(_3011, -0.5, 0.5);
    float _3021 = fma(_3011, 0.5, 0.5);
    float _3023 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3013);
    float _3025 = _2985 + 1.0;
    float _3027 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3017);
    float _3029 = fma(_3021, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3031 = 1.0 / _3007;
    float _3033 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3023);
    float _3035 = _2995 * 0.693147182464599609375;
    float _3037 = fma(_3021, _3029, -0.212114393711090087890625);
    float _3039 = fma(_3021, _3037, 1.570728778839111328125);
    float _3041 = sqrt(_3019);
    float _3043 = -_2985;
    float _3045 = fma(_3015, _3025, _3043);
    float _3047 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3027);
    float _3049 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3033);
    float _3051 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3053 = fma(_3045, 0.5, 0.5);
    float _3055 = _3047 * _3031;
    float _3057 = _3049 * _3031;
    float _3059 = fma(_3055, 0.5, 0.5);
    float _3061 = fma(_3057, -0.5, 0.5);
    float _3063 = _3041 * 0.636619746685028076171875;
    float3 _7747 = float3(_3059, _3061, _3051);
    float _3065 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7747, float3(0.0), isnan(_7747)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7747, float3(0.0), isnan(_7747)), level(0.0)).x;
    float _3067 = -_3039;
    float _3069 = fma(_3063, _3067, 1.0);
    float3 _7763 = float3(_3059, _3061, _3051);
    float4 _3071 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7763, float3(0.0), isnan(_7763)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7763, float3(0.0), isnan(_7763)), level(0.0)).xyzw;
    float _3073 = _3071.x;
    float _3075 = _3071.y;
    float _3077 = _3071.z;
    float _3079 = _3071.w;
    float2 _7779 = float2(_3069, _3053);
    float3 _3083 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7779, float2(0.0), isnan(_7779)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7779, float2(0.0), isnan(_7779)), level(0.0)).xyz;
    float _3085 = _3083.x;
    float _3087 = _3083.y;
    float _3089 = _3083.z;
    float _3091 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3093 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3095 = _2691 * _2753;
    bool _3097 = _2691 > 0.0;
    bool _3099 = isnan(_2691);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.0);
    bool _3105 = _3101 || _3103;
    float _3107 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3091);
    float _3109 = _3007 * 0.5;
    float _3111 = _3095 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3113 = exp2(_3093);
    float _3115 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3107);
    bool _3117 = _2753 <= 0.0;
    bool _3119 = !_3105;
    bool _3121 = _3117 || _3119;
    float _3123 = _363 * _3111;
    float _3125 = _3047 + _3007;
    float _3127 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3115);
    out.m_67.x = _1789;
    out.m_67.y = _1777;
    out.m_67.z = _1727;
    out.m_67.w = _1741;
    float _3129 = _3123 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3131 = _3127 + _3007;
    float _3133 = _3125 * 0.5;
    out.gl_Position.x = _3047;
    out.gl_Position.y = _3049;
    out.gl_Position.z = _3127;
    out.gl_Position.w = _3007;
    float _3135 = _3131 * 0.5;
    out.m_47.x = _3129;
    float _3137 = -_3113;
    float _3139 = _3137 + 1.0;
    float _3141 = fma(_3049, -0.5, _3109);
    float _3143 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3133;
    out.m_69.y = _3141;
    out.m_69.z = _3135;
    out.m_69.w = _3007;
    float _3145 = -_3143;
    float _3147 = _3145 + 1.0;
    float _3149 = _3143 * _3065;
    float _3151 = _3079 * _3149;
    float _3153 = _3079 * _3147;
    float _3155 = _3089 * _3149;
    float _3157 = fma(_3085, _3151, _3073);
    float _3159 = fma(_3087, _3151, _3075);
    float _3161 = fma(_3079, _3155, _3077);
    out.m_71.x = _3157;
    out.m_71.y = _3159;
    out.m_71.z = _3161;
    out.m_71.w = _3153;
    if (!_3121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3163 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3163;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _933 = false;
    bool _767 = false;
    bool _551 = false;
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3220 = as_type<float>(_111);
        out.gl_Position.z = _3220;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _3289 = as_type<float>(_149);
        out.gl_Position.z = _3289;
    }
    if (_143)
    {
        return out;
    }
    float _151 = in.m_51.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    int _169 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _171 = _169 != 0;
    float _173 = _155 * _153;
    float _175 = 0.0;
    if (!_167)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _175 = _179;
    }
    float _181 = _175;
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _185 = _181;
    if (!_167)
    {
        float _187 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    float _191 = _183 * 6.283185482025146484375;
    float _193 = floor(_183);
    float _195 = _191 * 0.15915493667125701904296875;
    float _197 = in.m_49.x;
    float _199 = in.m_49.y;
    float _201 = in.m_49.z;
    float _203 = _195 * 6.283185482025146484375;
    float _205 = cos(_203);
    float _207 = -_193;
    float _209 = _183 + _207;
    float _211 = _193;
    float _213 = _189;
    if (!_167)
    {
        _211 = _157;
    }
    float _215 = _211;
    float _217 = fma(_205, 0.5, 0.5);
    bool _219 = !_167;
    float _221 = _215;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _157 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _157);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _251;
    }
    float _253 = _213;
    bool _255 = !_167;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _157 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _221 = _275;
    }
    float _277 = _221;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_53.w;
    bool _289 = _209 < 0.5;
    float _291 = float(_289);
    float _293 = in.m_44.x;
    float _295 = in.m_44.y;
    float _297 = in.m_44.z;
    bool _299 = !_281;
    int _301 = _299 ? 0 : 1;
    float _303 = -_209;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _307 = !_171;
    int _309 = _307 ? 0 : 1;
    float _311 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _313 = abs(_301);
    float _315 = -_291;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = -_217;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _323 = fma(_277, _197, _311);
    int _325 = abs(_309);
    float _327 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = fma(_277, _199, _327);
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _337 = abs(_331);
    float _339 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = float(_313);
    float _343 = float(_325);
    float _345 = fma(_277, _201, _339);
    float _347 = abs(_305);
    float _349 = _341 * _347;
    float _351 = fma(_333, _287, _295);
    float _353 = float(_337);
    float _355 = fma(_343, _321, _349);
    float _357 = fma(_323, _287, _293);
    float _359 = fma(_345, _287, _297);
    float _361 = abs(_317);
    float _363 = fma(_353, _361, _355);
    bool _365 = !_335;
    bool _367 = _281;
    float _383;
    if (!_365)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _371 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_95);
        float _389 = 1.0 / _387;
        float _391 = _129 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _393 + _395;
    bool _399 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _413 = _393 + _411;
    bool _415 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _417 = isnan(_393);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _435 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _437 = isnan(_393);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = 1.0 / _429;
    float _453 = _445 * _449;
    float _455 = -_445;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _459;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = 1.0 / _433;
    float _467 = _425 * _457;
    float _469 = -_425;
    float _471 = _469 + 1.0;
    float _473 = _397 * _451;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _479;
    float _483 = fma(_461, _473, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _485 = fma(_477, _473, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _487 = fma(_481, _473, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _489 = _413 * _465;
    float _491 = _483 * _467;
    float _493 = _485 * _467;
    float _495 = _487 * _467;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _509 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _511 = fma(_499, _489, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _513 = fma(_503, _489, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _515 = fma(_507, _489, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _517 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].y, _493);
    float _519 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].z, _495);
    float _521 = fma(_511, _453, _509);
    float _523 = fma(_513, _453, _517);
    float _525 = fma(_515, _453, _519);
    float _527 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _521);
    float _529 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _525);
    bool _533 = !_463;
    float _549;
    if (!_533)
    {
        float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _537 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _541 = _539 * _535;
        float _543 = floor(_541);
        float _545 = -_543;
        float _547 = _541 + _545;
        _549 = _547;
        _551 = true;
    }
    else
    {
        float _553 = float(_95);
        float _555 = 1.0 / _553;
        float _557 = _129 * _555;
        _549 = _557;
    }
    _551 = false;
    float _559 = _549;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _559 + _561;
    float _565 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _575;
    bool _579 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = isnan(_559);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = 1.0 / _569;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _597 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _599 = isnan(_559);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _611 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _615 = 1.0 / _573;
    float _617 = _577 * _591;
    bool _619 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _621 = isnan(_559);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = 1.0 / _595;
    float _633 = -_589;
    float _635 = _633 + 1.0;
    float _637 = fma(_617, _563, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _643 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _645 = isnan(_559);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -_629;
    float _657 = _655 + 1.0;
    float _659 = _629 * _635;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _665 = 1.0 / _641;
    float _667 = -_653;
    float _669 = _667 + 1.0;
    float _671 = _607 * _657;
    float _673 = _663 * _615;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _675;
    float _679 = _589 * _669;
    float _681 = _637 * _671;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _685 = _559 + _683;
    float _687 = -_607;
    float _689 = _687 + 1.0;
    bool _691 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _693 = isnan(_559);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = _677 * _631;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _711 = _559 + _709;
    float _713 = fma(_673, _685, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _715 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[115].x, _681);
    float _717 = -_701;
    float _719 = _717 + 1.0;
    float _721 = _707 * _665;
    float _723 = fma(_703, _711, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _727 = _559 + _725;
    float _729 = fma(_713, _659, _715);
    float _731 = _653 * _719;
    float _733 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = fma(_721, _727, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _737 = fma(_723, _679, _729);
    float _739 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = fma(_735, _731, _737);
    float _745 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[119].x, _743);
    float _747 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _739;
    out.m_55.y = _733;
    out.m_55.z = _741;
    out.m_55.w = _747;
    bool _749 = !_613;
    float _765;
    if (!_749)
    {
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _753 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].z, _129);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_95);
        float _771 = 1.0 / _769;
        float _773 = _129 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _779 = _775 + _777;
    bool _781 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _783 = isnan(_775);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _795 = _775 + _793;
    bool _797 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _799 = isnan(_775);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _817 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _819 = isnan(_775);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_791;
    float _831 = _829 + 1.0;
    float _833 = 1.0 / _811;
    float _835 = _827 * _831;
    float _837 = -_827;
    float _839 = _837 + 1.0;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _841;
    bool _845 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _847 = 1.0 / _815;
    float _849 = _807 * _839;
    float _851 = -_807;
    float _853 = _851 + 1.0;
    float _855 = _779 * _833;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _861;
    float _865 = fma(_843, _855, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _867 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _869 = fma(_863, _855, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _871 = _795 * _847;
    float _873 = _865 * _849;
    float _875 = _867 * _849;
    float _877 = _869 * _849;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _891 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[123].x, _873);
    float _893 = fma(_881, _871, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _895 = fma(_885, _871, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _897 = fma(_889, _871, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _899 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[123].y, _875);
    float _901 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[123].z, _877);
    float _903 = fma(_893, _835, _891);
    float _905 = fma(_895, _835, _899);
    float _907 = fma(_897, _835, _901);
    float _909 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[125].x, _903);
    float _911 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[125].y, _905);
    float _913 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[125].z, _907);
    bool _915 = !_845;
    float _931;
    if (!_915)
    {
        float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _919 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _923 = _921 * _917;
        float _925 = floor(_923);
        float _927 = -_925;
        float _929 = _923 + _927;
        _931 = _929;
        _933 = true;
    }
    else
    {
        float _935 = float(_95);
        float _937 = 1.0 / _935;
        float _939 = _129 * _937;
        _931 = _939;
    }
    _933 = false;
    float _941 = _931;
    int _943 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _945 = _943;
    int _947 = 0;
    int _949 = _86(_945, _947, (*spvDescriptorSet0.support_buffer));
    float _951 = in.m_51.y;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _955 = in.m_57.z;
    float _957 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _151);
    float _959 = _957 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _961 = -_953;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _965 = fma(_963, _951, _953);
    float _967 = _959 * _965;
    float _969 = trunc(_955);
    int _971 = int(_969);
    float _973 = float(_949);
    int _975 = abs(_949);
    bool _977 = _949 == 0;
    float _979 = _967 * _973;
    float _981 = float(uint(_975));
    float _983 = trunc(_979);
    int _985 = int(_983);
    float _987 = 1.0 / _981;
    int _989 = abs(_985);
    uint _992 = uint(int(uint(_985) >> uint(31)));
    float _994 = float(uint(_989));
    int _996 = ~int(_992);
    int _998 = _996 + 1;
    int _1000 = as_type<int>(_987) + (-2);
    float _1002 = as_type<float>(_1000) * _994;
    float _1004 = trunc(_1002);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    int _1010 = ~int(_1008);
    int _1012 = _1010 + 1;
    int _1014 = _1012 * _975;
    int _1016 = _1014 + _989;
    float _1018 = float(uint(_1016));
    float _1020 = as_type<float>(_1000) * _1018;
    float _1022 = trunc(_1020);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = int(_1008) + int(_1026);
    int _1030 = ~_1028;
    int _1032 = _1030 + 1;
    int _1034 = _1032 * _975;
    int _1036 = _1034 + _989;
    bool _1038 = uint(_1036) >= uint(_975);
    bool _1040 = !_1038;
    int _1042 = _1040 ? 0 : (-1);
    int _1044 = ~_1028;
    int _1046 = _1044 + _1042;
    int _1048 = _1046 + 1;
    int _1050 = _1048 * _975;
    int _1052 = _1050 + _989;
    int _1054 = _1052 ^ _998;
    int _1056 = ~_998;
    int _1058 = _1056 + _1054;
    int _1060 = _1058 + 1;
    bool _1062 = !_977;
    int _1064 = _1062 ? _1060 : (-1);
    int _1066 = _1064;
    int _1068 = 0;
    int _1070 = _87(_1066, _1068, (*spvDescriptorSet0.support_buffer));
    int _1072 = _971;
    int _1074 = 0;
    int _1076 = _87(_1072, _1074, (*spvDescriptorSet0.support_buffer));
    float4 _1079 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1070, _1076)), 0).xyzw;
    float _1081 = _1079.x;
    float _1083 = _1079.y;
    float _1085 = _1079.z;
    float _1087 = _1079.w;
    float _1089 = in.m_57.x;
    float _1091 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1095 = _1093 != 0;
    float _1097 = in.m_57.y;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1101 = _1099 != 0;
    float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1107 = _1105 != 0;
    float _1109 = in.m_51.w;
    float _1111 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1115 = _1113 != 0;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1121 = _871;
    bool _1123 = _1038;
    int _1125 = _1036;
    float _1127 = as_type<float>(_989);
    if (_1095)
    {
        float _1129 = in.m_51.z;
        _1121 = _1129;
    }
    float _1131 = _1121;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    if (_1101)
    {
        bool _1137 = _151 > 0.5;
        _1123 = _1137;
    }
    bool _1139 = _1123;
    float _1141 = 1.0 / _1119;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1145 = _1089;
    if (_1101)
    {
        float _1147 = -_1089;
        float _1149 = _1147 + 1.0;
        _1125 = as_type<int>(_1149);
    }
    int _1151 = _1125;
    if (!_1101)
    {
        _1127 = _1089;
    }
    float _1153 = _1127;
    int _1155 = 0;
    float _1157 = _1153;
    if (_1095)
    {
        float _1159 = -_1089;
        float _1161 = _1159 + 1.0;
        _1155 = as_type<int>(_1161);
    }
    int _1163 = _1155;
    float _1165 = 0.0;
    if (!_1095)
    {
        _1165 = _1089;
    }
    float _1167 = _1165;
    float _1169 = 1.0 / _1135;
    float _1171 = _1167;
    if (_1101)
    {
        float _1173 = _1139 ? as_type<float>(_1151) : _1089;
        _1157 = _1173;
    }
    float _1175 = _1157;
    float _1177 = -_1097;
    float _1179 = _1177 + 1.0;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1183 = _1181 != 0;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1189 = _1187 != 0;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1193 = 0;
    float _1195 = _1175;
    if (_1115)
    {
        float _1197 = -_1089;
        float _1199 = _1197 + 1.0;
        _1193 = as_type<int>(_1199);
    }
    int _1201 = _1193;
    float _1203 = fma(_1111, -2.0, _1185);
    float _1205 = -_1143;
    float _1207 = fma(_1091, 2.0, _1205);
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1211 = _941 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1215 = _941 + _1213;
    if (_1095)
    {
        bool _1217 = _1131 > 0.5;
        _367 = _1217;
    }
    bool _1219 = _367;
    float _1221 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1191);
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1225 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1203);
    if (_1095)
    {
        float _1227 = _1219 ? as_type<float>(_1163) : _1089;
        _1171 = _1227;
    }
    float _1229 = _1171;
    bool _1231 = _951 > 0.5;
    bool _1233 = _1231 && _1183;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1237 = _1235 != 0;
    float _1239 = _1233 ? _1179 : _1097;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1247 = _1245 != 0;
    bool _1249 = _1109 > 0.5;
    bool _1251 = _1249 && _1243;
    float _1253 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1265 = _1251 ? _1179 : _1097;
    int _1267 = 0;
    if (_1237)
    {
        float _1269 = -_1089;
        float _1271 = _1269 + 1.0;
        _1267 = as_type<int>(_1271);
    }
    int _1273 = _1267;
    float _1275 = _1259 * _1141;
    bool _1277 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1279 = isnan(_941);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = _1263 * _1169;
    float _1291 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1221);
    float _1293 = fma(_1275, _1211, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1295 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1297 = isnan(_941);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = -_1287;
    float _1309 = _1307 + 1.0;
    float _1311 = fma(_1289, _1215, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1313 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1315 = isnan(_941);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1327 = _1305 * _1309;
    float _1329 = -_1305;
    float _1331 = _1329 + 1.0;
    float _1333 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1335 = fma(_1253, _1239, -0.5);
    float _1337 = _1323 * _1331;
    float _1339 = fma(_1333, _1265, -0.5);
    float _1341 = -_1323;
    float _1343 = _1341 + 1.0;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1347 = _1293 * _1337;
    bool _1349 = _951 > 0.5;
    float _1351 = _1337;
    float _1353 = _1293;
    bool _1355 = _1349;
    float _1357 = as_type<float>(_1273);
    int _1359 = as_type<int>(_1335);
    if (_1107)
    {
        float _1361 = in.m_51.z;
        _1351 = _1361;
    }
    float _1363 = _1351;
    float _1365 = -_1225;
    float _1367 = fma(_1291, _1335, _1365);
    float _1369 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1347);
    float _1371 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1373 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1379 = _1373;
    float _1381 = _1371;
    if (!_1237)
    {
        _1353 = _1089;
    }
    float _1383 = _1353;
    float _1385 = fma(_1311, _1327, _1369);
    float _1387 = _1383;
    if (_1237)
    {
        float _1389 = _1349 ? as_type<float>(_1273) : _1089;
        _1387 = _1389;
    }
    float _1391 = _1387;
    float _1393 = fma(_1373, _1175, -0.5);
    if (_1115)
    {
        float _1395 = _1349 ? as_type<float>(_1201) : _1089;
        _1145 = _1395;
    }
    float _1397 = _1145;
    float _1399 = fma(_1371, _1229, -0.5);
    if (_1107)
    {
        _1355 = false;
    }
    bool _1401 = _1355;
    float _1403 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1377);
    bool _1405 = _1401;
    if (_1107)
    {
        _1357 = _151;
    }
    float _1407 = _1357;
    int _1409 = 0;
    float _1411 = _1407;
    if (_1107)
    {
        _1409 = as_type<int>(_951);
    }
    int _1413 = _1409;
    float _1415 = _1363;
    int _1417 = _1413;
    if (_1107)
    {
        _1359 = as_type<int>(_1363);
    }
    int _1419 = _1359;
    int _1421 = _1419;
    if (!_1107)
    {
        float _1423 = in.m_51.z;
        float _1425 = _151 * 3.1415927410125732421875;
        float _1427 = _1425 * 0.15915493667125701904296875;
        float _1429 = _951 * 3.1415927410125732421875;
        float _1431 = _1429 * 0.15915493667125701904296875;
        float _1433 = _1427 * 6.283185482025146484375;
        float _1435 = sin(_1433);
        float _1437 = _1431 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = _1423 * 3.1415927410125732421875;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        _1415 = _1423;
        _1405 = true;
        _1411 = _1435;
        _1421 = as_type<int>(_1447);
        _1417 = as_type<int>(_1439);
        _1195 = _1443;
    }
    float _1449 = _1415;
    bool _1451 = _1405;
    float _1453 = _1411;
    int _1455 = _1421;
    int _1457 = _1417;
    float _1459 = _1195;
    float _1461 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _1463 = _1449 > 0.5;
    float _1465 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1385);
    float _1467 = _1459;
    float _1469 = _1449;
    if (_1451)
    {
        _1379 = _951;
    }
    float _1471 = _1379;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1475 = _1471;
    if (_1451)
    {
        _1381 = _951;
    }
    float _1477 = _1381;
    float _1479 = fma(_1461, _1391, -0.5);
    float _1481 = _1477;
    if (_1451)
    {
        _1467 = _1449;
    }
    float _1483 = _1467;
    float _1485 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1403);
    float _1487 = _1483;
    if (!_1451)
    {
        _1475 = _151;
    }
    float _1489 = _1475;
    float _1491 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    if (!_1451)
    {
        _1481 = _151;
    }
    float _1493 = _1481;
    float _1495 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    if (!_1451)
    {
        _1487 = _951;
    }
    float _1497 = _1487;
    float _1499 = fma(_1491, _1397, -0.5);
    if (!_1451)
    {
        _1469 = _951;
    }
    float _1501 = _1469;
    float _1503 = -_1473;
    float _1505 = fma(_1495, 2.0, _1503);
    float _1507 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1509 = -_129;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1505);
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1515 = _1451 ? as_type<float>(_1455) : as_type<float>(_1457);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1519 = fma(as_type<float>(_1457), (*spvDescriptorSet0.vp_c9)._m0[93].w, _1513);
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1523 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1517);
    float _1525 = _1451 ? as_type<float>(_1457) : _1453;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1529 = as_type<float>(_1457) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1531 = -_129;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1207);
    float _1535 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1527);
    float _1537 = fma(_1529, -2.0, _1521);
    int _1539 = _1463 ? as_type<int>(_1179) : as_type<int>(_1097);
    float _1541 = fma(_1485, _1393, _1533);
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1545 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1549 = -_1543;
    float _1551 = fma(_1545, 2.0, _1549);
    float _1553 = _1189 ? as_type<float>(_1539) : _1097;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _1557 = _1247 ? as_type<float>(_1539) : _1097;
    float _1559 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1563 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1555);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1567 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1559);
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1571 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1523);
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1575 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _1577 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1565);
    float _1579 = -_1569;
    float _1581 = fma(_1507, 2.0, _1579);
    float _1583 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1519);
    float _1585 = fma(_1571, _1479, _1511);
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1589 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1591 = fma(_1575, -2.0, _1573);
    float _1593 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _1595 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1597 = fma(_1589, -2.0, _1587);
    float _1599 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[97].w, _1577);
    float _1601 = fma(_1593, _1557, -0.5);
    float _1603 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1591);
    float _1605 = fma(_1595, _1553, -0.5);
    float _1607 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1537);
    float _1609 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1535);
    float _1611 = -_1603;
    float _1613 = fma(_1599, _1601, _1611);
    float _1615 = -_129;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1581);
    int _1619 = _1064 + 1;
    float _1621 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1563);
    float _1623 = -_129;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1551);
    float _1627 = -_1607;
    float _1629 = fma(_1583, _1605, _1627);
    float _1631 = fma(_1609, _1399, _1617);
    int _1633 = abs(_1619);
    float _1635 = fma(_1621, _1499, _1625);
    float _1637 = _1629 + 0.5;
    float _1639 = _909 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1641 = float(uint(_1633));
    float _1643 = _911 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1645 = _913 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1651 = as_type<float>(_1000) * _1641;
    float _1653 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1655 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _1657 = as_type<uint>(half2(float2(_1087, 0.0)));
    float _1659 = _1585 + 0.5;
    uint _1661 = uint(int(uint(_1619) >> uint(31)));
    float _1663 = trunc(_1651);
    float _1665 = precise::max(_1663, 0.0);
    uint _1667 = uint(_1665);
    out.m_59.x = _1647;
    out.m_59.y = _1653;
    out.m_59.z = _1655;
    out.m_59.w = _1649;
    uint _1669 = extract_bits(_1657, 0u, 8u);
    int _1671 = int(_1669) & 255;
    uint _1673 = extract_bits(_1657, 8u, 8u);
    int _1675 = int(_1673) & 255;
    int _1677 = _1675 << 8;
    int _1679 = _1671 | _1677;
    float _1681 = _1635 + 0.5;
    int _1683 = ~int(_1661);
    int _1685 = _1683 + 1;
    float _1687 = _1613 + 0.5;
    out.m_61.x = _1659;
    out.m_61.y = _1637;
    float _1689 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1567);
    float _1691 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1597);
    out.m_63.x = _1681;
    out.m_63.y = _1687;
    float _1693 = -_1691;
    float _1695 = fma(_1689, _1339, _1693);
    int _1697 = ~int(_1667);
    int _1699 = _1697 + 1;
    int _1701 = _1699 * _975;
    int _1703 = _1701 + _1633;
    float _1705 = float(uint(_1703));
    float _1707 = as_type<float>(_1000) * _1705;
    float _1709 = trunc(_1707);
    float _1711 = precise::max(_1709, 0.0);
    uint _1713 = uint(_1711);
    int _1715 = int(_1667) + int(_1713);
    int _1717 = ~_1715;
    int _1719 = _1717 + 1;
    int _1721 = _1719 * _975;
    int _1723 = _1721 + _1633;
    bool _1725 = uint(_1723) >= uint(_975);
    float _1727 = _1631 + 0.5;
    bool _1729 = !_1725;
    int _1731 = _1729 ? 0 : (-1);
    bool _1733 = _1679 >= 32768;
    int _1735 = ~_1715;
    int _1737 = _1735 + _1731;
    int _1739 = _1737 + 1;
    float _1741 = _1695 + 0.5;
    int _1743 = _1739 * _975;
    int _1745 = _1743 + _1633;
    int _1747 = _1745 ^ _1685;
    int _1749 = ~_1685;
    int _1751 = _1749 + _1747;
    int _1753 = _1751 + 1;
    int _1755 = _1679 + (-1024);
    int _1757 = _1755;
    if (_1733)
    {
        int _1759 = ~_1679;
        int _1761 = _1759 + 33792;
        int _1763 = _1761 + 1;
        _1757 = _1763;
    }
    int _1765 = _1757;
    bool _1767 = !_977;
    int _1769 = _1767 ? _1753 : (-1);
    int _1771 = _1765 + 30719;
    float _1773 = float(_1771);
    float _1775 = fma(_1773, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1777 = _1367 + 0.5;
    float _1779 = abs(_1775);
    float _1781 = -_1779;
    float _1783 = _1781 + 1.0;
    int _1785 = as_type<int>(_1783) + (-218103808);
    bool _1787 = uint(_1785) >= 1920991232u;
    float _1789 = _1541 + 0.5;
    bool _1791 = !_1787;
    if (!_1791)
    {
        int _1793;
        _84(_1793, out.gl_Position, out.gl_PointSize);
    }
    int _1795 = _1769;
    int _1797 = 0;
    int _1799 = _87(_1795, _1797, (*spvDescriptorSet0.support_buffer));
    int _1801 = _971;
    int _1803 = 0;
    int _1805 = _87(_1801, _1803, (*spvDescriptorSet0.support_buffer));
    float4 _1807 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1799, _1805)), 0).xyzw;
    float _1809 = _1807.x;
    float _1811 = _1807.y;
    float _1813 = _1807.z;
    float _1815 = _1807.w;
    float _1817 = floor(_979);
    float _1819 = -_1817;
    float _1821 = _979 + _1819;
    uint _1823 = as_type<uint>(half2(float2(_1815, 0.0)));
    float _1825 = -_1081;
    float _1827 = _1825 + _1809;
    float _1829 = -_1083;
    float _1831 = _1829 + _1811;
    float _1833 = -_1085;
    float _1835 = _1833 + _1813;
    uint _1837 = extract_bits(_1823, 0u, 8u);
    int _1839 = int(_1837) & 255;
    uint _1841 = extract_bits(_1823, 8u, 8u);
    int _1843 = int(_1841) & 255;
    int _1845 = _1843 << 8;
    int _1847 = _1839 | _1845;
    float _1849 = fma(_1821, _1827, _1081);
    float _1851 = fma(_1821, _1831, _1083);
    float _1853 = fma(_1821, _1835, _1085);
    bool _1855 = _1847 >= 32768;
    int _1857 = _1847 + (-1024);
    int _1859 = _1857;
    if (_1855)
    {
        int _1861 = ~_1847;
        int _1863 = _1861 + 33792;
        int _1865 = _1863 + 1;
        _1859 = _1865;
    }
    int _1867 = _1859;
    int _1869 = _1867 + 30719;
    float _1871 = float(_1869);
    float _1873 = fma(_1871, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1875 = abs(_1873);
    float _1877 = -_1875;
    float _1879 = _1877 + 1.0;
    int _1881 = as_type<int>(_1879) + (-218103808);
    bool _1883 = uint(_1881) >= 1920991232u;
    bool _1885 = !_1883;
    if (!_1885)
    {
        int _1887;
        _84(_1887, out.gl_Position, out.gl_PointSize);
    }
    float _1889 = in.m_51.x;
    float _1891 = in.m_51.y;
    float _1893 = in.m_51.z;
    float _1895 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1897 = log2(_1895);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1901 = 1.0 + _1899;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1905 = _1903 != 0;
    int _1907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1909 = _1907 != 0;
    int _1911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1913 = _1911 != 0;
    bool _1915 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1917 = isnan(1.0);
    bool _1919 = _1915 || _1917;
    bool _1921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1923 = _1919 || _1921;
    float _1925 = 1.0 / _1901;
    bool _1927 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1929 = isnan(0.0);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1935 = _1931 || _1933;
    float _1937 = _1897 * _129;
    float _1939 = exp2(_1937);
    float _1941 = _1893 * 2.0;
    float _1943 = _1889 * 2.0;
    float _1945 = _1891 * 2.0;
    float _1947 = _1891 + _1889;
    float _1949 = floor(_1941);
    float _1951 = _1891 + _1893;
    float _1953 = _1947 + (-1.0);
    float _1955 = _1951 + (-1.0);
    float _1957 = -_1939;
    float _1959 = _1957 + 1.0;
    float _1961 = floor(_1943);
    float _1963 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1965 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1967 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1969 = _1935 ? _1959 : 0.0;
    float _1971 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1967);
    bool _1973 = _1949 > 0.0;
    float _1975 = floor(_1945);
    bool _1977 = _1949 >= 0.0;
    bool _1979 = isnan(_1949);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.0);
    bool _1985 = _1981 || _1983;
    if (_1923)
    {
        float _1987 = _1969 * _1925;
        _133 = _1987;
    }
    float _1989 = _133;
    float _1991 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1993 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1971);
    int _1995 = _1985 ? 0 : 1;
    float _1997 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1991);
    bool _1999 = _1961 > 0.0;
    int _2001 = ~_1995;
    int _2003 = _2001 + 1;
    int _2005 = _2003 + 1;
    float _2007 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1997);
    int _2009 = _2005;
    int _2011 = as_type<int>(_1989);
    if (!_1973)
    {
        int _2013 = ~_1995;
        int _2015 = _2013 + 1;
        _2009 = _2015;
    }
    int _2017 = _2009;
    bool _2019 = !_1905;
    int _2021 = _2019 ? 0 : 1;
    float _2023 = _2007 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2025 = _1961 >= 0.0;
    bool _2027 = isnan(_1961);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan(0.0);
    bool _2033 = _2029 || _2031;
    int _2035 = abs(_2021);
    float _2037 = _1993 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2039 = _1975 > 0.0;
    float _2041 = -_2023;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _2045 = _1975 >= 0.0;
    bool _2047 = isnan(_1975);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(0.0);
    bool _2053 = _2049 || _2051;
    float _2055 = in.m_65.x;
    float _2057 = in.m_65.y;
    float _2059 = in.m_65.z;
    float _2061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2063 = _2037 + _2061;
    int _2065 = _2033 ? 0 : 1;
    float _2067 = float(_2035);
    float _2069 = abs(_2063);
    float _2071 = abs(_2043);
    float _2073 = precise::max(_2069, _2071);
    int _2075 = ~_2065;
    int _2077 = _2075 + 1;
    int _2079 = _2077 + 1;
    int _2081 = _2079;
    float _2083 = _2063;
    float _2085 = _2043;
    bool _2087 = _2039;
    if (!_1999)
    {
        int _2089 = ~_2065;
        int _2091 = _2089 + 1;
        _2081 = _2091;
    }
    int _2093 = _2081;
    float _2095 = float(_2017);
    bool _2097 = _2073 >= 16.0;
    int _2099 = _2053 ? 0 : 1;
    float _2101 = _2067 * _2095;
    bool _2103 = !_1913;
    int _2105 = _2103 ? 0 : 1;
    float _2107 = _1889 + (-0.5);
    int _2109 = ~_2099;
    int _2111 = _2109 + 1;
    int _2113 = _2111 + 1;
    float _2115 = _1889 + _1893;
    int _2117 = _2113;
    if (!_2039)
    {
        int _2119 = ~_2099;
        int _2121 = _2119 + 1;
        _2117 = _2121;
    }
    int _2123 = _2117;
    float _2125 = _2101 * (-2.0);
    bool _2127 = !_1909;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = abs(_2105);
    float _2133 = fma(_2125, _2055, _2055);
    int _2135 = abs(_2129);
    if (_2097)
    {
        float _2137 = _2063 * 0.0625;
        _2083 = _2137;
    }
    float _2139 = _2083;
    float _2141 = fma(_1965, _2125, _1965);
    float _2143 = float(_2135);
    float _2145 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2133);
    float _2147 = float(_2093);
    if (_2097)
    {
        float _2149 = _2043 * 0.0625;
        _2085 = _2149;
    }
    float _2151 = _2085;
    float _2153 = abs(_2139);
    bool _2155 = _2153 != 0.0;
    bool _2157 = isnan(_2153);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(0.0);
    bool _2163 = _2159 || _2161;
    float _2165 = float(_2131);
    float _2167 = _2143 * _2147;
    float _2169 = float(_2123);
    float _2171 = fma(_2141, _1989, _2145);
    float _2173 = abs(_2151);
    bool _2175 = _2173 == 0.0;
    bool _2177 = !_2163;
    bool _2179 = _2175 && _2177;
    float _2181 = in.m_53.x;
    float _2183 = in.m_53.y;
    float _2185 = in.m_53.z;
    float _2187 = abs(_2151);
    bool _2189 = _2187 == 0.0;
    float _2191 = _2165 * _2169;
    float _2193 = _2171 * 0.15915493667125701904296875;
    float _2195 = _1893 + (-0.5);
    float _2197 = _2115 + (-1.0);
    float _2199 = _2167 * (-2.0);
    float _2201 = _1891 + (-0.5);
    float _2203 = _2191 * (-2.0);
    float _2205 = _2193 * 6.283185482025146484375;
    float _2207 = sin(_2205);
    float _2209 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2211 = fma(_2199, _2057, _2057);
    float _2213 = fma(_2203, _2059, _2059);
    int _2215 = as_type<int>(_2209);
    if (_2179)
    {
        bool _2217 = as_type<int>(_2151) >= 0;
        _2087 = _2217;
    }
    bool _2219 = _2087;
    float _2221 = fma(_1963, _2199, _1963);
    float _2223 = fma(_2209, _2203, _2209);
    float _2225 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2211);
    float _2227 = _2193 * 6.283185482025146484375;
    float _2229 = cos(_2227);
    float _2231 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2213);
    int _2233 = _2219 ? (-1) : 0;
    if (_2179)
    {
        int _2235 = _2219 ? 0 : 1078530011;
        _2215 = _2235;
    }
    int _2237 = _2215;
    float _2239 = fma(_2221, _1989, _2225);
    float _2241 = fma(_2223, _1989, _2231);
    if (_2179)
    {
        int _2243 = int(0x80000000) & as_type<int>(_2139);
        int _2245 = _2237 | _2243;
        _2011 = _2245;
    }
    int _2247 = _2011;
    bool _2249 = !_2163;
    bool _2251 = _2249 && _2189;
    int _2253 = _2247;
    float _2255 = as_type<float>(_2247);
    float _2257 = _2229;
    if (!_2251)
    {
        float _2259 = abs(_2139);
        bool _2261 = _2259 != as_type<float>(0x7f800000u /* inf */);
        bool _2263 = isnan(_2259);
        bool _2265 = _2261 || _2263;
        bool _2267 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2269 = _2265 || _2267;
        float _2271 = abs(_2151);
        bool _2273 = _2271 == as_type<float>(0x7f800000u /* inf */);
        float _2275 = abs(_2151);
        bool _2277 = _2275 == as_type<float>(0x7f800000u /* inf */);
        bool _2279 = !_2269;
        bool _2281 = _2277 && _2279;
        if (_2281)
        {
            bool _2283 = as_type<int>(_2151) >= 0;
            _2233 = _2283 ? (-1) : 0;
        }
        int _2285 = _2233;
        if (_2281)
        {
            _2253 = 1075235812;
        }
        int _2287 = _2253;
        int _2289 = _2287;
        if (_2281)
        {
            int _2291 = ~_2285;
            int _2293 = (_2291 != 0) ? _2287 : 1061752795;
            _2289 = _2293;
        }
        int _2295 = _2289;
        float _2297 = as_type<float>(_2295);
        if (_2281)
        {
            int _2299 = int(0x80000000) & as_type<int>(_2139);
            int _2301 = _2295 | _2299;
            _2297 = as_type<float>(_2301);
        }
        float _2303 = _2297;
        bool _2305 = !_2269;
        bool _2307 = _2305 && _2273;
        _2255 = _2303;
        if (!_2307)
        {
            float _2309 = abs(_2139);
            float _2311 = abs(_2151);
            float _2313 = precise::max(_2309, _2311);
            float _2315 = abs(_2139);
            float _2317 = abs(_2151);
            float _2319 = precise::min(_2315, _2317);
            float _2321 = 1.0 / _2313;
            float _2323 = abs(_2139);
            float _2325 = abs(_2151);
            bool _2327 = _2323 > _2325;
            bool _2329 = as_type<int>(_2151) >= 0;
            float _2331 = abs(_2139);
            float _2333 = abs(_2151);
            float _2335 = _2331 + _2333;
            int _2337 = as_type<int>(_2139) & int(0x80000000);
            bool _2339 = _2335 > as_type<float>(0x7f800000u /* inf */);
            bool _2341 = isnan(_2335);
            bool _2343 = _2339 || _2341;
            bool _2345 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2347 = _2343 || _2345;
            float _2349 = _2319 * _2321;
            float _2351 = _2349 * _2349;
            float _2353 = _2351 + 11.33538818359375;
            float _2355 = fma(_2351, _2353, 28.84246826171875);
            float _2357 = fma(_2351, _2355, 19.6966705322265625);
            float _2359 = fma(_2351, -0.82336294651031494140625, -5.674867153167724609375);
            float _2361 = fma(_2351, _2359, -6.565555095672607421875);
            float _2363 = 1.0 / _2357;
            float _2365 = _2351 * _2361;
            float _2367 = _2349 * _2365;
            float _2369 = fma(_2367, _2363, _2349);
            float _2371 = _2369;
            _2255 = _2335;
            if (_2327)
            {
                float _2373 = -_2369;
                float _2375 = _2373 + 1.57079637050628662109375;
                _2371 = _2375;
            }
            float _2377 = _2371;
            int _2379 = as_type<int>(_2377);
            if (!_2329)
            {
                float _2381 = -_2377;
                float _2383 = _2381 + 3.1415927410125732421875;
                _2379 = as_type<int>(_2383);
            }
            int _2385 = _2379;
            if (!_2347)
            {
                int _2387 = _2337 | _2385;
                _2255 = as_type<float>(_2387);
            }
        }
    }
    float _2389 = _2255;
    float _2391 = -_2389;
    float _2393 = _2239 + _2391;
    float _2395 = _2241 * 0.15915493667125701904296875;
    float _2397 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2399 = _2183 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2401 = _2393 * 0.15915493667125701904296875;
    float _2403 = _2395 * 6.283185482025146484375;
    float _2405 = cos(_2403);
    float _2407 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2409 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2411 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2397);
    float _2413 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1851);
    float _2417 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1849);
    float _2419 = _2401 * 6.283185482025146484375;
    float _2421 = sin(_2419);
    float _2423 = _2407 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2425 = _2409 * _2415;
    float _2427 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2411);
    float _2429 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1853);
    float _2431 = _2423 * _2417;
    float _2433 = _2413 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2435 = _2427 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2437 = _2401 * 6.283185482025146484375;
    float _2439 = cos(_2437);
    float _2441 = _2405 * _2425;
    float _2443 = _2433 * _2429;
    bool _2445 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2447 = isnan(0.5);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2453 = _2449 || _2451;
    float _2455 = _2207 * _2441;
    float _2457 = _2395 * 6.283185482025146484375;
    float _2459 = sin(_2457);
    float _2461 = _2229 * _2421;
    float _2463 = _2207 * _2439;
    float _2465 = _2229 * _2439;
    float _2467 = _2439 * _2405;
    float _2469 = -_2461;
    float _2471 = fma(_2459, _2463, _2469);
    float _2473 = fma(_2471, _2431, _2455);
    float _2475 = _2207 * _2421;
    float _2477 = -_2425;
    float _2479 = _2459 * _2477;
    float _2481 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2483 = _2421 * _2405;
    float _2485 = fma(_2459, _2475, _2465);
    float _2487 = fma(_2467, _2431, _2479);
    float _2489 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2481);
    float _2491 = fma(_2459, _2465, _2475);
    float _2493 = fma(_2485, _2443, _2473);
    float _2495 = fma(_2483, _2443, _2487);
    float _2497 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2489);
    float _2499 = _2023 + _2493;
    float _2501 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2503 = _2037 + _2495;
    float _2505 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2509 = _2499 + _2507;
    float _2511 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2501);
    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2515 = _2503 + _2513;
    float _2517 = 1.0 / _2505;
    float _2519 = _2509 * _2509;
    float _2521 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2511);
    float _2523 = -_2463;
    float _2525 = fma(_2459, _2461, _2523);
    float _2527 = _2461;
    float _2529 = _2443;
    float _2531 = _2463;
    if (_2453)
    {
        _2527 = 1.0;
    }
    float _2533 = _2527;
    float _2535 = fma(_2515, _2515, _2519);
    float _2537 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2539 = sqrt(_2535);
    float _2541 = _2537 + _2505;
    float _2543 = _2541 * _2517;
    float _2545 = _2543 * 0.5;
    float _2547 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2549 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2547);
    float _2551 = _2229 * _2441;
    bool _2553 = _2539 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2555 = fma(_2491, _2431, _2551);
    float _2557 = 1.0 / _2549;
    float _2559 = fma(_2525, _2443, _2555);
    float _2561 = _2435 + _2559;
    float _2563 = _2555;
    float _2565 = _2559;
    float _2567 = _2533;
    if (!_2553)
    {
        _2563 = _2503;
    }
    float _2569 = _2563;
    float _2571 = _2569;
    if (!_2553)
    {
        _2565 = _2499;
    }
    float _2573 = _2565;
    float _2575 = _2573;
    if (!_2553)
    {
        _2529 = _2561;
    }
    float _2577 = _2529;
    bool _2579 = !_2553;
    float _2581 = _2577;
    float _2583 = _2557;
    if (!_2579)
    {
        float _2585 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2589 = _2539 + _2587;
        float _2591 = rsqrt(_2535);
        float _2593 = _2589 * _2585;
        float _2595 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2597 = _2593 * 0.15915493667125701904296875;
        float _2599 = _2597 * 6.283185482025146484375;
        float _2601 = cos(_2599);
        float _2603 = _2597 * 6.283185482025146484375;
        float _2605 = sin(_2603);
        float _2607 = _2601 + (-1.0);
        float _2609 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2611 = fma(_2605, _2595, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2613 = fma(_2561, _2601, _2609);
        float _2615 = _2591 * _2611;
        float _2617 = fma(_2515, _2615, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2619 = fma(_2509, _2615, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2531 = _2615;
        _2581 = _2613;
        _2571 = _2617;
        _2575 = _2619;
    }
    float _2621 = _2531;
    float _2623 = _2581;
    float _2625 = _2571;
    float _2627 = _2575;
    float _2629 = _2621;
    if (_2453)
    {
        _2629 = 1.0;
    }
    float _2631 = _2629;
    float _2633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2635 = _2557 * _2633;
    float _2637 = _2631;
    if (!_2453)
    {
        float _2639 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2641 = _2639 * 0.15915493667125701904296875;
        float _2643 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2645 = _2641 * 6.283185482025146484375;
        float _2647 = cos(_2645);
        float _2649 = _2643 * 0.15915493667125701904296875;
        float _2651 = _2641 * 6.283185482025146484375;
        float _2653 = sin(_2651);
        float _2655 = 1.0 / _2647;
        float _2657 = _2649 * 6.283185482025146484375;
        float _2659 = cos(_2657);
        float _2661 = _2653 * _2655;
        float _2663 = _2649 * 6.283185482025146484375;
        float _2665 = sin(_2663);
        float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2669 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2667;
        float _2671 = _2659 * _2661;
        float _2673 = 1.0 / _2671;
        float _2675 = 1.0 / _2669;
        float _2677 = _2665 * _2673;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = fma(_2635, _2677, _2679);
        float _2683 = _2681 * _2675;
        float _2685 = precise::clamp(_2683, 0.0, 1.0);
        _2583 = _2671;
        _2257 = _2641;
        _2567 = _2685;
    }
    float _2687 = _2583;
    float _2689 = _2257;
    float _2691 = _2567;
    float _2693 = _2689;
    float _2695 = _2687;
    if (!_2453)
    {
        float _2697 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2703 = _2699 * 6.283185482025146484375;
        float _2705 = cos(_2703);
        float _2707 = _2701 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2705;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2635, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2693 = _2727;
        _2695 = _2713;
        _2637 = _2747;
    }
    float _2749 = _2693;
    float _2751 = _2695;
    float _2753 = _2637;
    float _2755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2757 = _2623 + _2755;
    float _2759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2761 = _2625 + _2759;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2765 = _2627 + _2763;
    float _2767 = _2757 * _2757;
    float _2769 = fma(_2761, _2761, _2767);
    float _2771 = fma(_2765, _2765, _2769);
    float _2773 = rsqrt(_2771);
    float _2775 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2777 = _2761 * _2775;
    float _2779 = _2765 * _2775;
    float _2781 = _2777 * _2777;
    float _2783 = _2779 * _2779;
    float _2785 = _2781 + _2783;
    float _2787 = sqrt(_2785);
    bool _2789 = _2787 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2793 = _2787 + _2791;
    float _2795 = _2773;
    float _2797 = _2751;
    float _2799 = _2793;
    float _2801 = _2749;
    float _2803 = _2757;
    float _2805 = _2775;
    float _2807 = _2777;
    if (_2789)
    {
        float _2809 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2795 = _2809;
    }
    float _2811 = _2795;
    if (_2789)
    {
        float _2813 = rsqrt(_2785);
        _2797 = _2813;
    }
    float _2815 = _2797;
    float _2817 = _2815;
    if (_2789)
    {
        float _2819 = _2793 * _2811;
        _2799 = _2819;
    }
    float _2821 = _2799;
    if (_2789)
    {
        float _2823 = _2821 * 0.15915493667125701904296875;
        _2801 = _2823;
    }
    float _2825 = _2801;
    float _2827 = _2811;
    float _2829 = _2825;
    if (_2789)
    {
        float _2831 = _2825 * 6.283185482025146484375;
        float _2833 = sin(_2831);
        _2827 = _2833;
    }
    float _2835 = _2827;
    float _2837 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2839 = precise::max(0.0, _2837);
    float _2841 = _2765;
    float _2843 = _2839;
    if (_2789)
    {
        float _2845 = _2825 * 6.283185482025146484375;
        float _2847 = cos(_2845);
        _2841 = _2847;
    }
    float _2849 = _2841;
    float _2851 = -_2775;
    float _2853 = -_2839;
    float _2855 = fma(_2757, _2851, _2853);
    if (_2789)
    {
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2843 = _2857;
    }
    float _2859 = _2843;
    float _2861 = _2859;
    if (!_2789)
    {
        _2829 = _2855;
    }
    float _2863 = _2829;
    float _2865 = _2863;
    if (_2789)
    {
        float _2867 = fma(_2835, _2859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2803 = _2867;
    }
    float _2869 = _2803;
    float _2871 = sqrt(_2771);
    float _2873 = _2869;
    if (_2789)
    {
        float _2875 = _2849 + (-1.0);
        _2861 = _2875;
    }
    float _2877 = _2861;
    float _2879 = _2877;
    if (_2789)
    {
        float _2881 = _2815 * _2869;
        _2805 = _2881;
    }
    float _2883 = _2805;
    if (!_2789)
    {
        _2817 = _2779;
    }
    float _2885 = _2817;
    float _2887 = _2885;
    if (_2789)
    {
        float _2889 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2873 = _2889;
    }
    float _2891 = _2873;
    float _2893 = _2891;
    if (_2789)
    {
        float _2895 = _2777 * _2883;
        _2807 = _2895;
    }
    float _2897 = _2807;
    if (!_2789)
    {
        _2879 = _2781;
    }
    float _2899 = _2879;
    float _2901 = _2899;
    if (_2789)
    {
        float _2903 = _2779 * _2883;
        _2887 = _2903;
    }
    float _2905 = _2887;
    if (_2789)
    {
        float _2907 = fma(_2855, _2849, _2891);
        _2865 = _2907;
    }
    float _2909 = _2865;
    if (_2789)
    {
        float _2911 = _2897 * _2897;
        _2901 = _2911;
    }
    float _2913 = _2901;
    if (!_2789)
    {
        _2893 = _2783;
    }
    float _2915 = _2893;
    float _2917 = _2915;
    if (_2789)
    {
        float _2919 = _2905 * _2905;
        _2917 = _2919;
    }
    float _2921 = _2917;
    float _2923 = fma(_2909, _2909, _2913);
    float _2925 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2927 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2929 = _2923 + _2921;
    float _2931 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2925);
    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2935 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2933);
    float _2937 = precise::clamp(_2935, 0.0, 1.0);
    float _2939 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2941 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2943 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2931);
    float _2945 = rsqrt(_2929);
    float _2947 = -_2937;
    float _2949 = _2947 + 1.0;
    float _2951 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2939);
    float _2953 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2955 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2957 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2941);
    float _2959 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2951);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2963 = abs(_2949);
    float _2965 = log2(_2963);
    float _2967 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2955);
    float _2969 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2957);
    float _2971 = _2959 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2973 = -_2961;
    float _2975 = fma(_2973, _2927, 1.0);
    float _2977 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2967);
    float _2979 = _2969 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2981 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2983 = _2945 * _2897;
    float _2985 = _2945 * _2909;
    float _2987 = _2977 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2989 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2981);
    float _2991 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2993 = _2945 * _2905;
    float _2995 = log2(_2975);
    float _2997 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2989);
    float _2999 = -_2991;
    float _3001 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2999);
    float _3003 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3005 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3007 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2997);
    float _3009 = -_2993;
    float _3011 = fma(_3009, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3001);
    float _3013 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3015 = exp2(_3003);
    float _3017 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3005);
    float _3019 = fma(_3011, -0.5, 0.5);
    float _3021 = fma(_3011, 0.5, 0.5);
    float _3023 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3013);
    float _3025 = _2985 + 1.0;
    float _3027 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3017);
    float _3029 = fma(_3021, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3031 = 1.0 / _3007;
    float _3033 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3023);
    float _3035 = _2995 * 0.693147182464599609375;
    float _3037 = fma(_3021, _3029, -0.212114393711090087890625);
    float _3039 = fma(_3021, _3037, 1.570728778839111328125);
    float _3041 = sqrt(_3019);
    float _3043 = -_2985;
    float _3045 = fma(_3015, _3025, _3043);
    float _3047 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3027);
    float _3049 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3033);
    float _3051 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3053 = fma(_3045, 0.5, 0.5);
    float _3055 = _3047 * _3031;
    float _3057 = _3049 * _3031;
    float _3059 = fma(_3055, 0.5, 0.5);
    float _3061 = fma(_3057, -0.5, 0.5);
    float _3063 = _3041 * 0.636619746685028076171875;
    float3 _7747 = float3(_3059, _3061, _3051);
    float _3065 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7747, float3(0.0), isnan(_7747)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7747, float3(0.0), isnan(_7747)), level(0.0)).x;
    float _3067 = -_3039;
    float _3069 = fma(_3063, _3067, 1.0);
    float3 _7763 = float3(_3059, _3061, _3051);
    float4 _3071 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7763, float3(0.0), isnan(_7763)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7763, float3(0.0), isnan(_7763)), level(0.0)).xyzw;
    float _3073 = _3071.x;
    float _3075 = _3071.y;
    float _3077 = _3071.z;
    float _3079 = _3071.w;
    float2 _7779 = float2(_3069, _3053);
    float3 _3083 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7779, float2(0.0), isnan(_7779)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7779, float2(0.0), isnan(_7779)), level(0.0)).xyz;
    float _3085 = _3083.x;
    float _3087 = _3083.y;
    float _3089 = _3083.z;
    float _3091 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3093 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3095 = _2691 * _2753;
    bool _3097 = _2691 > 0.0;
    bool _3099 = isnan(_2691);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.0);
    bool _3105 = _3101 || _3103;
    float _3107 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3091);
    float _3109 = _3007 * 0.5;
    float _3111 = _3095 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3113 = exp2(_3093);
    float _3115 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3107);
    bool _3117 = _2753 <= 0.0;
    bool _3119 = !_3105;
    bool _3121 = _3117 || _3119;
    float _3123 = _363 * _3111;
    float _3125 = _3047 + _3007;
    float _3127 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3115);
    out.m_67.x = _1789;
    out.m_67.y = _1777;
    out.m_67.z = _1727;
    out.m_67.w = _1741;
    float _3129 = _3123 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3131 = _3127 + _3007;
    float _3133 = _3125 * 0.5;
    out.gl_Position.x = _3047;
    out.gl_Position.y = _3049;
    out.gl_Position.z = _3127;
    out.gl_Position.w = _3007;
    float _3135 = _3131 * 0.5;
    out.m_47.x = _3129;
    float _3137 = -_3113;
    float _3139 = _3137 + 1.0;
    float _3141 = fma(_3049, -0.5, _3109);
    float _3143 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3133;
    out.m_69.y = _3141;
    out.m_69.z = _3135;
    out.m_69.w = _3007;
    float _3145 = -_3143;
    float _3147 = _3145 + 1.0;
    float _3149 = _3143 * _3065;
    float _3151 = _3079 * _3149;
    float _3153 = _3079 * _3147;
    float _3155 = _3089 * _3149;
    float _3157 = fma(_3085, _3151, _3073);
    float _3159 = fma(_3087, _3151, _3075);
    float _3161 = fma(_3079, _3155, _3077);
    out.m_71.x = _3157;
    out.m_71.y = _3159;
    out.m_71.z = _3161;
    out.m_71.w = _3153;
    if (!_3121)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3163 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3163;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _933 = false;
    bool _767 = false;
    bool _551 = false;
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3220 = as_type<float>(_111);
        out.gl_Position.z = _3220;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _3289 = as_type<float>(_149);
        out.gl_Position.z = _3289;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_51.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    int _169 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _171 = _169 != 0;
    float _173 = _155 * _153;
    float _175 = 0.0;
    if (!_167)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _175 = _179;
    }
    float _181 = _175;
    float _183 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _173);
    float _185 = _181;
    if (!_167)
    {
        float _187 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    float _191 = _183 * 6.283185482025146484375;
    float _193 = floor(_183);
    float _195 = _191 * 0.15915493667125701904296875;
    float _197 = in.m_49.x;
    float _199 = in.m_49.y;
    float _201 = in.m_49.z;
    float _203 = _195 * 6.283185482025146484375;
    float _205 = cos(_203);
    float _207 = -_193;
    float _209 = _183 + _207;
    float _211 = _193;
    float _213 = _189;
    if (!_167)
    {
        _211 = _157;
    }
    float _215 = _211;
    float _217 = fma(_205, 0.5, 0.5);
    bool _219 = !_167;
    float _221 = _215;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _157 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _157);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _251;
    }
    float _253 = _213;
    bool _255 = !_167;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _157 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _221 = _275;
    }
    float _277 = _221;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_53.w;
    bool _289 = _209 < 0.5;
    float _291 = float(_289);
    float _293 = in.m_44.x;
    float _295 = in.m_44.y;
    float _297 = in.m_44.z;
    bool _299 = !_281;
    int _301 = _299 ? 0 : 1;
    float _303 = -_209;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _307 = !_171;
    int _309 = _307 ? 0 : 1;
    float _311 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _313 = abs(_301);
    float _315 = -_291;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _319 = -_217;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _323 = fma(_277, _197, _311);
    int _325 = abs(_309);
    float _327 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = fma(_277, _199, _327);
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _337 = abs(_331);
    float _339 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = float(_313);
    float _343 = float(_325);
    float _345 = fma(_277, _201, _339);
    float _347 = abs(_305);
    float _349 = _341 * _347;
    float _351 = fma(_333, _287, _295);
    float _353 = float(_337);
    float _355 = fma(_343, _321, _349);
    float _357 = fma(_323, _287, _293);
    float _359 = fma(_345, _287, _297);
    float _361 = abs(_317);
    float _363 = fma(_353, _361, _355);
    bool _365 = !_335;
    bool _367 = _281;
    float _383;
    if (!_365)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _371 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_95);
        float _389 = 1.0 / _387;
        float _391 = _129 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _393 + _395;
    bool _399 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _413 = _393 + _411;
    bool _415 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _417 = isnan(_393);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _435 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _437 = isnan(_393);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = 1.0 / _429;
    float _453 = _445 * _449;
    float _455 = -_445;
    float _457 = _455 + 1.0;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _459;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = 1.0 / _433;
    float _467 = _425 * _457;
    float _469 = -_425;
    float _471 = _469 + 1.0;
    float _473 = _397 * _451;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _479;
    float _483 = fma(_461, _473, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _485 = fma(_477, _473, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _487 = fma(_481, _473, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _489 = _413 * _465;
    float _491 = _483 * _467;
    float _493 = _485 * _467;
    float _495 = _487 * _467;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _509 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].x, _491);
    float _511 = fma(_499, _489, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _513 = fma(_503, _489, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _515 = fma(_507, _489, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _517 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].y, _493);
    float _519 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[107].z, _495);
    float _521 = fma(_511, _453, _509);
    float _523 = fma(_513, _453, _517);
    float _525 = fma(_515, _453, _519);
    float _527 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _521);
    float _529 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _525);
    bool _533 = !_463;
    float _549;
    if (!_533)
    {
        float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _537 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _539 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _541 = _539 * _535;
        float _543 = floor(_541);
        float _545 = -_543;
        float _547 = _541 + _545;
        _549 = _547;
        _551 = true;
    }
    else
    {
        float _553 = float(_95);
        float _555 = 1.0 / _553;
        float _557 = _129 * _555;
        _549 = _557;
    }
    _551 = false;
    float _559 = _549;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _563 = _559 + _561;
    float _565 = _527 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _575;
    bool _579 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = isnan(_559);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = 1.0 / _569;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _597 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _599 = isnan(_559);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _611 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _615 = 1.0 / _573;
    float _617 = _577 * _591;
    bool _619 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _621 = isnan(_559);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = 1.0 / _595;
    float _633 = -_589;
    float _635 = _633 + 1.0;
    float _637 = fma(_617, _563, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _643 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _645 = isnan(_559);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -_629;
    float _657 = _655 + 1.0;
    float _659 = _629 * _635;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _665 = 1.0 / _641;
    float _667 = -_653;
    float _669 = _667 + 1.0;
    float _671 = _607 * _657;
    float _673 = _663 * _615;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _675;
    float _679 = _589 * _669;
    float _681 = _637 * _671;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _685 = _559 + _683;
    float _687 = -_607;
    float _689 = _687 + 1.0;
    bool _691 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _693 = isnan(_559);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = _677 * _631;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _711 = _559 + _709;
    float _713 = fma(_673, _685, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _715 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[115].x, _681);
    float _717 = -_701;
    float _719 = _717 + 1.0;
    float _721 = _707 * _665;
    float _723 = fma(_703, _711, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _727 = _559 + _725;
    float _729 = fma(_713, _659, _715);
    float _731 = _653 * _719;
    float _733 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = fma(_721, _727, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _737 = fma(_723, _679, _729);
    float _739 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = fma(_735, _731, _737);
    float _745 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[119].x, _743);
    float _747 = _745 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _739;
    out.m_55.y = _733;
    out.m_55.z = _741;
    out.m_55.w = _747;
    bool _749 = !_613;
    float _765;
    if (!_749)
    {
        float _751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _753 = _151 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _755 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[11].z, _129);
        float _757 = _755 * _751;
        float _759 = floor(_757);
        float _761 = -_759;
        float _763 = _757 + _761;
        _765 = _763;
        _767 = true;
    }
    else
    {
        float _769 = float(_95);
        float _771 = 1.0 / _769;
        float _773 = _129 * _771;
        _765 = _773;
    }
    _767 = false;
    float _775 = _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _779 = _775 + _777;
    bool _781 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _783 = isnan(_775);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _795 = _775 + _793;
    bool _797 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _799 = isnan(_775);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _809;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _817 = _775 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _819 = isnan(_775);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = -_791;
    float _831 = _829 + 1.0;
    float _833 = 1.0 / _811;
    float _835 = _827 * _831;
    float _837 = -_827;
    float _839 = _837 + 1.0;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _841;
    bool _845 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _847 = 1.0 / _815;
    float _849 = _807 * _839;
    float _851 = -_807;
    float _853 = _851 + 1.0;
    float _855 = _779 * _833;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _861;
    float _865 = fma(_843, _855, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _867 = fma(_859, _855, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _869 = fma(_863, _855, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _871 = _795 * _847;
    float _873 = _865 * _849;
    float _875 = _867 * _849;
    float _877 = _869 * _849;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _891 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[123].x, _873);
    float _893 = fma(_881, _871, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _895 = fma(_885, _871, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _897 = fma(_889, _871, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _899 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[123].y, _875);
    float _901 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[123].z, _877);
    float _903 = fma(_893, _835, _891);
    float _905 = fma(_895, _835, _899);
    float _907 = fma(_897, _835, _901);
    float _909 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[125].x, _903);
    float _911 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[125].y, _905);
    float _913 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[125].z, _907);
    bool _915 = !_845;
    float _931;
    if (!_915)
    {
        float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _919 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _923 = _921 * _917;
        float _925 = floor(_923);
        float _927 = -_925;
        float _929 = _923 + _927;
        _931 = _929;
        _933 = true;
    }
    else
    {
        float _935 = float(_95);
        float _937 = 1.0 / _935;
        float _939 = _129 * _937;
        _931 = _939;
    }
    _933 = false;
    float _941 = _931;
    int _943 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _945 = _943;
    int _947 = 0;
    int _949 = _86(_945, _947, (*spvDescriptorSet0.support_buffer));
    float _951 = in.m_51.y;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _955 = in.m_57.z;
    float _957 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _151);
    float _959 = _957 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _961 = -_953;
    float _963 = _961 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _965 = fma(_963, _951, _953);
    float _967 = _959 * _965;
    float _969 = trunc(_955);
    int _971 = int(_969);
    float _973 = float(_949);
    int _975 = abs(_949);
    bool _977 = _949 == 0;
    float _979 = _967 * _973;
    float _981 = float(uint(_975));
    float _983 = trunc(_979);
    int _985 = int(_983);
    float _987 = 1.0 / _981;
    int _989 = abs(_985);
    uint _992 = uint(int(uint(_985) >> uint(31)));
    float _994 = float(uint(_989));
    int _996 = ~int(_992);
    int _998 = _996 + 1;
    int _1000 = as_type<int>(_987) + (-2);
    float _1002 = as_type<float>(_1000) * _994;
    float _1004 = trunc(_1002);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    int _1010 = ~int(_1008);
    int _1012 = _1010 + 1;
    int _1014 = _1012 * _975;
    int _1016 = _1014 + _989;
    float _1018 = float(uint(_1016));
    float _1020 = as_type<float>(_1000) * _1018;
    float _1022 = trunc(_1020);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = int(_1008) + int(_1026);
    int _1030 = ~_1028;
    int _1032 = _1030 + 1;
    int _1034 = _1032 * _975;
    int _1036 = _1034 + _989;
    bool _1038 = uint(_1036) >= uint(_975);
    bool _1040 = !_1038;
    int _1042 = _1040 ? 0 : (-1);
    int _1044 = ~_1028;
    int _1046 = _1044 + _1042;
    int _1048 = _1046 + 1;
    int _1050 = _1048 * _975;
    int _1052 = _1050 + _989;
    int _1054 = _1052 ^ _998;
    int _1056 = ~_998;
    int _1058 = _1056 + _1054;
    int _1060 = _1058 + 1;
    bool _1062 = !_977;
    int _1064 = _1062 ? _1060 : (-1);
    int _1066 = _1064;
    int _1068 = 0;
    int _1070 = _87(_1066, _1068, (*spvDescriptorSet0.support_buffer));
    int _1072 = _971;
    int _1074 = 0;
    int _1076 = _87(_1072, _1074, (*spvDescriptorSet0.support_buffer));
    float4 _1079 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1070, _1076)), 0).xyzw;
    float _1081 = _1079.x;
    float _1083 = _1079.y;
    float _1085 = _1079.z;
    float _1087 = _1079.w;
    float _1089 = in.m_57.x;
    float _1091 = _151 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1095 = _1093 != 0;
    float _1097 = in.m_57.y;
    int _1099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1101 = _1099 != 0;
    float _1103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1107 = _1105 != 0;
    float _1109 = in.m_51.w;
    float _1111 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1115 = _1113 != 0;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1121 = _871;
    bool _1123 = _1038;
    int _1125 = _1036;
    float _1127 = as_type<float>(_989);
    if (_1095)
    {
        float _1129 = in.m_51.z;
        _1121 = _1129;
    }
    float _1131 = _1121;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    if (_1101)
    {
        bool _1137 = _151 > 0.5;
        _1123 = _1137;
    }
    bool _1139 = _1123;
    float _1141 = 1.0 / _1119;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1145 = _1089;
    if (_1101)
    {
        float _1147 = -_1089;
        float _1149 = _1147 + 1.0;
        _1125 = as_type<int>(_1149);
    }
    int _1151 = _1125;
    if (!_1101)
    {
        _1127 = _1089;
    }
    float _1153 = _1127;
    int _1155 = 0;
    float _1157 = _1153;
    if (_1095)
    {
        float _1159 = -_1089;
        float _1161 = _1159 + 1.0;
        _1155 = as_type<int>(_1161);
    }
    int _1163 = _1155;
    float _1165 = 0.0;
    if (!_1095)
    {
        _1165 = _1089;
    }
    float _1167 = _1165;
    float _1169 = 1.0 / _1135;
    float _1171 = _1167;
    if (_1101)
    {
        float _1173 = _1139 ? as_type<float>(_1151) : _1089;
        _1157 = _1173;
    }
    float _1175 = _1157;
    float _1177 = -_1097;
    float _1179 = _1177 + 1.0;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1183 = _1181 != 0;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1189 = _1187 != 0;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1193 = 0;
    float _1195 = _1175;
    if (_1115)
    {
        float _1197 = -_1089;
        float _1199 = _1197 + 1.0;
        _1193 = as_type<int>(_1199);
    }
    int _1201 = _1193;
    float _1203 = fma(_1111, -2.0, _1185);
    float _1205 = -_1143;
    float _1207 = fma(_1091, 2.0, _1205);
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1211 = _941 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1215 = _941 + _1213;
    if (_1095)
    {
        bool _1217 = _1131 > 0.5;
        _367 = _1217;
    }
    bool _1219 = _367;
    float _1221 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1191);
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1225 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1203);
    if (_1095)
    {
        float _1227 = _1219 ? as_type<float>(_1163) : _1089;
        _1171 = _1227;
    }
    float _1229 = _1171;
    bool _1231 = _951 > 0.5;
    bool _1233 = _1231 && _1183;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1237 = _1235 != 0;
    float _1239 = _1233 ? _1179 : _1097;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1247 = _1245 != 0;
    bool _1249 = _1109 > 0.5;
    bool _1251 = _1249 && _1243;
    float _1253 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1265 = _1251 ? _1179 : _1097;
    int _1267 = 0;
    if (_1237)
    {
        float _1269 = -_1089;
        float _1271 = _1269 + 1.0;
        _1267 = as_type<int>(_1271);
    }
    int _1273 = _1267;
    float _1275 = _1259 * _1141;
    bool _1277 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1279 = isnan(_941);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = _1263 * _1169;
    float _1291 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1221);
    float _1293 = fma(_1275, _1211, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1295 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1297 = isnan(_941);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = -_1287;
    float _1309 = _1307 + 1.0;
    float _1311 = fma(_1289, _1215, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1313 = _941 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1315 = isnan(_941);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1327 = _1305 * _1309;
    float _1329 = -_1305;
    float _1331 = _1329 + 1.0;
    float _1333 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1335 = fma(_1253, _1239, -0.5);
    float _1337 = _1323 * _1331;
    float _1339 = fma(_1333, _1265, -0.5);
    float _1341 = -_1323;
    float _1343 = _1341 + 1.0;
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1347 = _1293 * _1337;
    bool _1349 = _951 > 0.5;
    float _1351 = _1337;
    float _1353 = _1293;
    bool _1355 = _1349;
    float _1357 = as_type<float>(_1273);
    int _1359 = as_type<int>(_1335);
    if (_1107)
    {
        float _1361 = in.m_51.z;
        _1351 = _1361;
    }
    float _1363 = _1351;
    float _1365 = -_1225;
    float _1367 = fma(_1291, _1335, _1365);
    float _1369 = fma(_1343, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1347);
    float _1371 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1373 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1379 = _1373;
    float _1381 = _1371;
    if (!_1237)
    {
        _1353 = _1089;
    }
    float _1383 = _1353;
    float _1385 = fma(_1311, _1327, _1369);
    float _1387 = _1383;
    if (_1237)
    {
        float _1389 = _1349 ? as_type<float>(_1273) : _1089;
        _1387 = _1389;
    }
    float _1391 = _1387;
    float _1393 = fma(_1373, _1175, -0.5);
    if (_1115)
    {
        float _1395 = _1349 ? as_type<float>(_1201) : _1089;
        _1145 = _1395;
    }
    float _1397 = _1145;
    float _1399 = fma(_1371, _1229, -0.5);
    if (_1107)
    {
        _1355 = false;
    }
    bool _1401 = _1355;
    float _1403 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1377);
    bool _1405 = _1401;
    if (_1107)
    {
        _1357 = _151;
    }
    float _1407 = _1357;
    int _1409 = 0;
    float _1411 = _1407;
    if (_1107)
    {
        _1409 = as_type<int>(_951);
    }
    int _1413 = _1409;
    float _1415 = _1363;
    int _1417 = _1413;
    if (_1107)
    {
        _1359 = as_type<int>(_1363);
    }
    int _1419 = _1359;
    int _1421 = _1419;
    if (!_1107)
    {
        float _1423 = in.m_51.z;
        float _1425 = _151 * 3.1415927410125732421875;
        float _1427 = _1425 * 0.15915493667125701904296875;
        float _1429 = _951 * 3.1415927410125732421875;
        float _1431 = _1429 * 0.15915493667125701904296875;
        float _1433 = _1427 * 6.283185482025146484375;
        float _1435 = sin(_1433);
        float _1437 = _1431 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        float _1441 = _1423 * 3.1415927410125732421875;
        float _1443 = _1441 * 0.15915493667125701904296875;
        float _1445 = _1443 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        _1415 = _1423;
        _1405 = true;
        _1411 = _1435;
        _1421 = as_type<int>(_1447);
        _1417 = as_type<int>(_1439);
        _1195 = _1443;
    }
    float _1449 = _1415;
    bool _1451 = _1405;
    float _1453 = _1411;
    int _1455 = _1421;
    int _1457 = _1417;
    float _1459 = _1195;
    float _1461 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _1463 = _1449 > 0.5;
    float _1465 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1385);
    float _1467 = _1459;
    float _1469 = _1449;
    if (_1451)
    {
        _1379 = _951;
    }
    float _1471 = _1379;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1475 = _1471;
    if (_1451)
    {
        _1381 = _951;
    }
    float _1477 = _1381;
    float _1479 = fma(_1461, _1391, -0.5);
    float _1481 = _1477;
    if (_1451)
    {
        _1467 = _1449;
    }
    float _1483 = _1467;
    float _1485 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1403);
    float _1487 = _1483;
    if (!_1451)
    {
        _1475 = _151;
    }
    float _1489 = _1475;
    float _1491 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    if (!_1451)
    {
        _1481 = _151;
    }
    float _1493 = _1481;
    float _1495 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    if (!_1451)
    {
        _1487 = _951;
    }
    float _1497 = _1487;
    float _1499 = fma(_1491, _1397, -0.5);
    if (!_1451)
    {
        _1469 = _951;
    }
    float _1501 = _1469;
    float _1503 = -_1473;
    float _1505 = fma(_1495, 2.0, _1503);
    float _1507 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1509 = -_129;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1505);
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1515 = _1451 ? as_type<float>(_1455) : as_type<float>(_1457);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1519 = fma(as_type<float>(_1457), (*spvDescriptorSet0.vp_c9)._m0[93].w, _1513);
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1523 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1517);
    float _1525 = _1451 ? as_type<float>(_1457) : _1453;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1529 = as_type<float>(_1457) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1531 = -_129;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1207);
    float _1535 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1527);
    float _1537 = fma(_1529, -2.0, _1521);
    int _1539 = _1463 ? as_type<int>(_1179) : as_type<int>(_1097);
    float _1541 = fma(_1485, _1393, _1533);
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _1545 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1549 = -_1543;
    float _1551 = fma(_1545, 2.0, _1549);
    float _1553 = _1189 ? as_type<float>(_1539) : _1097;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _1557 = _1247 ? as_type<float>(_1539) : _1097;
    float _1559 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1563 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[98].z, _1555);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1567 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1559);
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1571 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1523);
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1575 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _1577 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1565);
    float _1579 = -_1569;
    float _1581 = fma(_1507, 2.0, _1579);
    float _1583 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1519);
    float _1585 = fma(_1571, _1479, _1511);
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1589 = _1497 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1591 = fma(_1575, -2.0, _1573);
    float _1593 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _1595 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1597 = fma(_1589, -2.0, _1587);
    float _1599 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[97].w, _1577);
    float _1601 = fma(_1593, _1557, -0.5);
    float _1603 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[96].y, _1591);
    float _1605 = fma(_1595, _1553, -0.5);
    float _1607 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1537);
    float _1609 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1535);
    float _1611 = -_1603;
    float _1613 = fma(_1599, _1601, _1611);
    float _1615 = -_129;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1581);
    int _1619 = _1064 + 1;
    float _1621 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[97].z, _1563);
    float _1623 = -_129;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[96].x, _1551);
    float _1627 = -_1607;
    float _1629 = fma(_1583, _1605, _1627);
    float _1631 = fma(_1609, _1399, _1617);
    int _1633 = abs(_1619);
    float _1635 = fma(_1621, _1499, _1625);
    float _1637 = _1629 + 0.5;
    float _1639 = _909 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1641 = float(uint(_1633));
    float _1643 = _911 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1645 = _913 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1647 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1465 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1651 = as_type<float>(_1000) * _1641;
    float _1653 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1655 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _1657 = as_type<uint>(half2(float2(_1087, 0.0)));
    float _1659 = _1585 + 0.5;
    uint _1661 = uint(int(uint(_1619) >> uint(31)));
    float _1663 = trunc(_1651);
    float _1665 = precise::max(_1663, 0.0);
    uint _1667 = uint(_1665);
    out.m_59.x = _1647;
    out.m_59.y = _1653;
    out.m_59.z = _1655;
    out.m_59.w = _1649;
    uint _1669 = extract_bits(_1657, 0u, 8u);
    int _1671 = int(_1669) & 255;
    uint _1673 = extract_bits(_1657, 8u, 8u);
    int _1675 = int(_1673) & 255;
    int _1677 = _1675 << 8;
    int _1679 = _1671 | _1677;
    float _1681 = _1635 + 0.5;
    int _1683 = ~int(_1661);
    int _1685 = _1683 + 1;
    float _1687 = _1613 + 0.5;
    out.m_61.x = _1659;
    out.m_61.y = _1637;
    float _1689 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1567);
    float _1691 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1597);
    out.m_63.x = _1681;
    out.m_63.y = _1687;
    float _1693 = -_1691;
    float _1695 = fma(_1689, _1339, _1693);
    int _1697 = ~int(_1667);
    int _1699 = _1697 + 1;
    int _1701 = _1699 * _975;
    int _1703 = _1701 + _1633;
    float _1705 = float(uint(_1703));
    float _1707 = as_type<float>(_1000) * _1705;
    float _1709 = trunc(_1707);
    float _1711 = precise::max(_1709, 0.0);
    uint _1713 = uint(_1711);
    int _1715 = int(_1667) + int(_1713);
    int _1717 = ~_1715;
    int _1719 = _1717 + 1;
    int _1721 = _1719 * _975;
    int _1723 = _1721 + _1633;
    bool _1725 = uint(_1723) >= uint(_975);
    float _1727 = _1631 + 0.5;
    bool _1729 = !_1725;
    int _1731 = _1729 ? 0 : (-1);
    bool _1733 = _1679 >= 32768;
    int _1735 = ~_1715;
    int _1737 = _1735 + _1731;
    int _1739 = _1737 + 1;
    float _1741 = _1695 + 0.5;
    int _1743 = _1739 * _975;
    int _1745 = _1743 + _1633;
    int _1747 = _1745 ^ _1685;
    int _1749 = ~_1685;
    int _1751 = _1749 + _1747;
    int _1753 = _1751 + 1;
    int _1755 = _1679 + (-1024);
    int _1757 = _1755;
    if (_1733)
    {
        int _1759 = ~_1679;
        int _1761 = _1759 + 33792;
        int _1763 = _1761 + 1;
        _1757 = _1763;
    }
    int _1765 = _1757;
    bool _1767 = !_977;
    int _1769 = _1767 ? _1753 : (-1);
    int _1771 = _1765 + 30719;
    float _1773 = float(_1771);
    float _1775 = fma(_1773, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1777 = _1367 + 0.5;
    float _1779 = abs(_1775);
    float _1781 = -_1779;
    float _1783 = _1781 + 1.0;
    int _1785 = as_type<int>(_1783) + (-218103808);
    bool _1787 = uint(_1785) >= 1920991232u;
    float _1789 = _1541 + 0.5;
    bool _1791 = !_1787;
    if (!_1791)
    {
        int _1793;
        _84(_1793, out.gl_Position, out.gl_PointSize);
    }
    int _1795 = _1769;
    int _1797 = 0;
    int _1799 = _87(_1795, _1797, (*spvDescriptorSet0.support_buffer));
    int _1801 = _971;
    int _1803 = 0;
    int _1805 = _87(_1801, _1803, (*spvDescriptorSet0.support_buffer));
    float4 _1807 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1799, _1805)), 0).xyzw;
    float _1809 = _1807.x;
    float _1811 = _1807.y;
    float _1813 = _1807.z;
    float _1815 = _1807.w;
    float _1817 = floor(_979);
    float _1819 = -_1817;
    float _1821 = _979 + _1819;
    uint _1823 = as_type<uint>(half2(float2(_1815, 0.0)));
    float _1825 = -_1081;
    float _1827 = _1825 + _1809;
    float _1829 = -_1083;
    float _1831 = _1829 + _1811;
    float _1833 = -_1085;
    float _1835 = _1833 + _1813;
    uint _1837 = extract_bits(_1823, 0u, 8u);
    int _1839 = int(_1837) & 255;
    uint _1841 = extract_bits(_1823, 8u, 8u);
    int _1843 = int(_1841) & 255;
    int _1845 = _1843 << 8;
    int _1847 = _1839 | _1845;
    float _1849 = fma(_1821, _1827, _1081);
    float _1851 = fma(_1821, _1831, _1083);
    float _1853 = fma(_1821, _1835, _1085);
    bool _1855 = _1847 >= 32768;
    int _1857 = _1847 + (-1024);
    int _1859 = _1857;
    if (_1855)
    {
        int _1861 = ~_1847;
        int _1863 = _1861 + 33792;
        int _1865 = _1863 + 1;
        _1859 = _1865;
    }
    int _1867 = _1859;
    int _1869 = _1867 + 30719;
    float _1871 = float(_1869);
    float _1873 = fma(_1871, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1875 = abs(_1873);
    float _1877 = -_1875;
    float _1879 = _1877 + 1.0;
    int _1881 = as_type<int>(_1879) + (-218103808);
    bool _1883 = uint(_1881) >= 1920991232u;
    bool _1885 = !_1883;
    if (!_1885)
    {
        int _1887;
        _84(_1887, out.gl_Position, out.gl_PointSize);
    }
    float _1889 = in.m_51.x;
    float _1891 = in.m_51.y;
    float _1893 = in.m_51.z;
    float _1895 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1897 = log2(_1895);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1901 = 1.0 + _1899;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1905 = _1903 != 0;
    int _1907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1909 = _1907 != 0;
    int _1911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1913 = _1911 != 0;
    bool _1915 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1917 = isnan(1.0);
    bool _1919 = _1915 || _1917;
    bool _1921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1923 = _1919 || _1921;
    float _1925 = 1.0 / _1901;
    bool _1927 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1929 = isnan(0.0);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1935 = _1931 || _1933;
    float _1937 = _1897 * _129;
    float _1939 = exp2(_1937);
    float _1941 = _1893 * 2.0;
    float _1943 = _1889 * 2.0;
    float _1945 = _1891 * 2.0;
    float _1947 = _1891 + _1889;
    float _1949 = floor(_1941);
    float _1951 = _1891 + _1893;
    float _1953 = _1947 + (-1.0);
    float _1955 = _1951 + (-1.0);
    float _1957 = -_1939;
    float _1959 = _1957 + 1.0;
    float _1961 = floor(_1943);
    float _1963 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1965 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1967 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1969 = _1935 ? _1959 : 0.0;
    float _1971 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1967);
    bool _1973 = _1949 > 0.0;
    float _1975 = floor(_1945);
    bool _1977 = _1949 >= 0.0;
    bool _1979 = isnan(_1949);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.0);
    bool _1985 = _1981 || _1983;
    if (_1923)
    {
        float _1987 = _1969 * _1925;
        _133 = _1987;
    }
    float _1989 = _133;
    float _1991 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1993 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1971);
    int _1995 = _1985 ? 0 : 1;
    float _1997 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1991);
    bool _1999 = _1961 > 0.0;
    int _2001 = ~_1995;
    int _2003 = _2001 + 1;
    int _2005 = _2003 + 1;
    float _2007 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1997);
    int _2009 = _2005;
    int _2011 = as_type<int>(_1989);
    if (!_1973)
    {
        int _2013 = ~_1995;
        int _2015 = _2013 + 1;
        _2009 = _2015;
    }
    int _2017 = _2009;
    bool _2019 = !_1905;
    int _2021 = _2019 ? 0 : 1;
    float _2023 = _2007 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2025 = _1961 >= 0.0;
    bool _2027 = isnan(_1961);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan(0.0);
    bool _2033 = _2029 || _2031;
    int _2035 = abs(_2021);
    float _2037 = _1993 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2039 = _1975 > 0.0;
    float _2041 = -_2023;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _2045 = _1975 >= 0.0;
    bool _2047 = isnan(_1975);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan(0.0);
    bool _2053 = _2049 || _2051;
    float _2055 = in.m_65.x;
    float _2057 = in.m_65.y;
    float _2059 = in.m_65.z;
    float _2061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2063 = _2037 + _2061;
    int _2065 = _2033 ? 0 : 1;
    float _2067 = float(_2035);
    float _2069 = abs(_2063);
    float _2071 = abs(_2043);
    float _2073 = precise::max(_2069, _2071);
    int _2075 = ~_2065;
    int _2077 = _2075 + 1;
    int _2079 = _2077 + 1;
    int _2081 = _2079;
    float _2083 = _2063;
    float _2085 = _2043;
    bool _2087 = _2039;
    if (!_1999)
    {
        int _2089 = ~_2065;
        int _2091 = _2089 + 1;
        _2081 = _2091;
    }
    int _2093 = _2081;
    float _2095 = float(_2017);
    bool _2097 = _2073 >= 16.0;
    int _2099 = _2053 ? 0 : 1;
    float _2101 = _2067 * _2095;
    bool _2103 = !_1913;
    int _2105 = _2103 ? 0 : 1;
    float _2107 = _1889 + (-0.5);
    int _2109 = ~_2099;
    int _2111 = _2109 + 1;
    int _2113 = _2111 + 1;
    float _2115 = _1889 + _1893;
    int _2117 = _2113;
    if (!_2039)
    {
        int _2119 = ~_2099;
        int _2121 = _2119 + 1;
        _2117 = _2121;
    }
    int _2123 = _2117;
    float _2125 = _2101 * (-2.0);
    bool _2127 = !_1909;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = abs(_2105);
    float _2133 = fma(_2125, _2055, _2055);
    int _2135 = abs(_2129);
    if (_2097)
    {
        float _2137 = _2063 * 0.0625;
        _2083 = _2137;
    }
    float _2139 = _2083;
    float _2141 = fma(_1965, _2125, _1965);
    float _2143 = float(_2135);
    float _2145 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2133);
    float _2147 = float(_2093);
    if (_2097)
    {
        float _2149 = _2043 * 0.0625;
        _2085 = _2149;
    }
    float _2151 = _2085;
    float _2153 = abs(_2139);
    bool _2155 = _2153 != 0.0;
    bool _2157 = isnan(_2153);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(0.0);
    bool _2163 = _2159 || _2161;
    float _2165 = float(_2131);
    float _2167 = _2143 * _2147;
    float _2169 = float(_2123);
    float _2171 = fma(_2141, _1989, _2145);
    float _2173 = abs(_2151);
    bool _2175 = _2173 == 0.0;
    bool _2177 = !_2163;
    bool _2179 = _2175 && _2177;
    float _2181 = in.m_53.x;
    float _2183 = in.m_53.y;
    float _2185 = in.m_53.z;
    float _2187 = abs(_2151);
    bool _2189 = _2187 == 0.0;
    float _2191 = _2165 * _2169;
    float _2193 = _2171 * 0.15915493667125701904296875;
    float _2195 = _1893 + (-0.5);
    float _2197 = _2115 + (-1.0);
    float _2199 = _2167 * (-2.0);
    float _2201 = _1891 + (-0.5);
    float _2203 = _2191 * (-2.0);
    float _2205 = _2193 * 6.283185482025146484375;
    float _2207 = sin(_2205);
    float _2209 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2211 = fma(_2199, _2057, _2057);
    float _2213 = fma(_2203, _2059, _2059);
    int _2215 = as_type<int>(_2209);
    if (_2179)
    {
        bool _2217 = as_type<int>(_2151) >= 0;
        _2087 = _2217;
    }
    bool _2219 = _2087;
    float _2221 = fma(_1963, _2199, _1963);
    float _2223 = fma(_2209, _2203, _2209);
    float _2225 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2211);
    float _2227 = _2193 * 6.283185482025146484375;
    float _2229 = cos(_2227);
    float _2231 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2213);
    int _2233 = _2219 ? (-1) : 0;
    if (_2179)
    {
        int _2235 = _2219 ? 0 : 1078530011;
        _2215 = _2235;
    }
    int _2237 = _2215;
    float _2239 = fma(_2221, _1989, _2225);
    float _2241 = fma(_2223, _1989, _2231);
    if (_2179)
    {
        int _2243 = int(0x80000000) & as_type<int>(_2139);
        int _2245 = _2237 | _2243;
        _2011 = _2245;
    }
    int _2247 = _2011;
    bool _2249 = !_2163;
    bool _2251 = _2249 && _2189;
    int _2253 = _2247;
    float _2255 = as_type<float>(_2247);
    float _2257 = _2229;
    if (!_2251)
    {
        float _2259 = abs(_2139);
        bool _2261 = _2259 != as_type<float>(0x7f800000u /* inf */);
        bool _2263 = isnan(_2259);
        bool _2265 = _2261 || _2263;
        bool _2267 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2269 = _2265 || _2267;
        float _2271 = abs(_2151);
        bool _2273 = _2271 == as_type<float>(0x7f800000u /* inf */);
        float _2275 = abs(_2151);
        bool _2277 = _2275 == as_type<float>(0x7f800000u /* inf */);
        bool _2279 = !_2269;
        bool _2281 = _2277 && _2279;
        if (_2281)
        {
            bool _2283 = as_type<int>(_2151) >= 0;
            _2233 = _2283 ? (-1) : 0;
        }
        int _2285 = _2233;
        if (_2281)
        {
            _2253 = 1075235812;
        }
        int _2287 = _2253;
        int _2289 = _2287;
        if (_2281)
        {
            int _2291 = ~_2285;
            int _2293 = (_2291 != 0) ? _2287 : 1061752795;
            _2289 = _2293;
        }
        int _2295 = _2289;
        float _2297 = as_type<float>(_2295);
        if (_2281)
        {
            int _2299 = int(0x80000000) & as_type<int>(_2139);
            int _2301 = _2295 | _2299;
            _2297 = as_type<float>(_2301);
        }
        float _2303 = _2297;
        bool _2305 = !_2269;
        bool _2307 = _2305 && _2273;
        _2255 = _2303;
        if (!_2307)
        {
            float _2309 = abs(_2139);
            float _2311 = abs(_2151);
            float _2313 = precise::max(_2309, _2311);
            float _2315 = abs(_2139);
            float _2317 = abs(_2151);
            float _2319 = precise::min(_2315, _2317);
            float _2321 = 1.0 / _2313;
            float _2323 = abs(_2139);
            float _2325 = abs(_2151);
            bool _2327 = _2323 > _2325;
            bool _2329 = as_type<int>(_2151) >= 0;
            float _2331 = abs(_2139);
            float _2333 = abs(_2151);
            float _2335 = _2331 + _2333;
            int _2337 = as_type<int>(_2139) & int(0x80000000);
            bool _2339 = _2335 > as_type<float>(0x7f800000u /* inf */);
            bool _2341 = isnan(_2335);
            bool _2343 = _2339 || _2341;
            bool _2345 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2347 = _2343 || _2345;
            float _2349 = _2319 * _2321;
            float _2351 = _2349 * _2349;
            float _2353 = _2351 + 11.33538818359375;
            float _2355 = fma(_2351, _2353, 28.84246826171875);
            float _2357 = fma(_2351, _2355, 19.6966705322265625);
            float _2359 = fma(_2351, -0.82336294651031494140625, -5.674867153167724609375);
            float _2361 = fma(_2351, _2359, -6.565555095672607421875);
            float _2363 = 1.0 / _2357;
            float _2365 = _2351 * _2361;
            float _2367 = _2349 * _2365;
            float _2369 = fma(_2367, _2363, _2349);
            float _2371 = _2369;
            _2255 = _2335;
            if (_2327)
            {
                float _2373 = -_2369;
                float _2375 = _2373 + 1.57079637050628662109375;
                _2371 = _2375;
            }
            float _2377 = _2371;
            int _2379 = as_type<int>(_2377);
            if (!_2329)
            {
                float _2381 = -_2377;
                float _2383 = _2381 + 3.1415927410125732421875;
                _2379 = as_type<int>(_2383);
            }
            int _2385 = _2379;
            if (!_2347)
            {
                int _2387 = _2337 | _2385;
                _2255 = as_type<float>(_2387);
            }
        }
    }
    float _2389 = _2255;
    float _2391 = -_2389;
    float _2393 = _2239 + _2391;
    float _2395 = _2241 * 0.15915493667125701904296875;
    float _2397 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2399 = _2183 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2401 = _2393 * 0.15915493667125701904296875;
    float _2403 = _2395 * 6.283185482025146484375;
    float _2405 = cos(_2403);
    float _2407 = _2181 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2409 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2411 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2397);
    float _2413 = _2185 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1851);
    float _2417 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1849);
    float _2419 = _2401 * 6.283185482025146484375;
    float _2421 = sin(_2419);
    float _2423 = _2407 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2425 = _2409 * _2415;
    float _2427 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2411);
    float _2429 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1853);
    float _2431 = _2423 * _2417;
    float _2433 = _2413 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2435 = _2427 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2437 = _2401 * 6.283185482025146484375;
    float _2439 = cos(_2437);
    float _2441 = _2405 * _2425;
    float _2443 = _2433 * _2429;
    bool _2445 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2447 = isnan(0.5);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2453 = _2449 || _2451;
    float _2455 = _2207 * _2441;
    float _2457 = _2395 * 6.283185482025146484375;
    float _2459 = sin(_2457);
    float _2461 = _2229 * _2421;
    float _2463 = _2207 * _2439;
    float _2465 = _2229 * _2439;
    float _2467 = _2439 * _2405;
    float _2469 = -_2461;
    float _2471 = fma(_2459, _2463, _2469);
    float _2473 = fma(_2471, _2431, _2455);
    float _2475 = _2207 * _2421;
    float _2477 = -_2425;
    float _2479 = _2459 * _2477;
    float _2481 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2483 = _2421 * _2405;
    float _2485 = fma(_2459, _2475, _2465);
    float _2487 = fma(_2467, _2431, _2479);
    float _2489 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2481);
    float _2491 = fma(_2459, _2465, _2475);
    float _2493 = fma(_2485, _2443, _2473);
    float _2495 = fma(_2483, _2443, _2487);
    float _2497 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2489);
    float _2499 = _2023 + _2493;
    float _2501 = _2435 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2503 = _2037 + _2495;
    float _2505 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2509 = _2499 + _2507;
    float _2511 = fma(_2037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2501);
    float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2515 = _2503 + _2513;
    float _2517 = 1.0 / _2505;
    float _2519 = _2509 * _2509;
    float _2521 = fma(_2023, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2511);
    float _2523 = -_2463;
    float _2525 = fma(_2459, _2461, _2523);
    float _2527 = _2461;
    float _2529 = _2443;
    float _2531 = _2463;
    if (_2453)
    {
        _2527 = 1.0;
    }
    float _2533 = _2527;
    float _2535 = fma(_2515, _2515, _2519);
    float _2537 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2539 = sqrt(_2535);
    float _2541 = _2537 + _2505;
    float _2543 = _2541 * _2517;
    float _2545 = _2543 * 0.5;
    float _2547 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2549 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2547);
    float _2551 = _2229 * _2441;
    bool _2553 = _2539 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2555 = fma(_2491, _2431, _2551);
    float _2557 = 1.0 / _2549;
    float _2559 = fma(_2525, _2443, _2555);
    float _2561 = _2435 + _2559;
    float _2563 = _2555;
    float _2565 = _2559;
    float _2567 = _2533;
    if (!_2553)
    {
        _2563 = _2503;
    }
    float _2569 = _2563;
    float _2571 = _2569;
    if (!_2553)
    {
        _2565 = _2499;
    }
    float _2573 = _2565;
    float _2575 = _2573;
    if (!_2553)
    {
        _2529 = _2561;
    }
    float _2577 = _2529;
    bool _2579 = !_2553;
    float _2581 = _2577;
    float _2583 = _2557;
    if (!_2579)
    {
        float _2585 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2587 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2589 = _2539 + _2587;
        float _2591 = rsqrt(_2535);
        float _2593 = _2589 * _2585;
        float _2595 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2597 = _2593 * 0.15915493667125701904296875;
        float _2599 = _2597 * 6.283185482025146484375;
        float _2601 = cos(_2599);
        float _2603 = _2597 * 6.283185482025146484375;
        float _2605 = sin(_2603);
        float _2607 = _2601 + (-1.0);
        float _2609 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2611 = fma(_2605, _2595, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2613 = fma(_2561, _2601, _2609);
        float _2615 = _2591 * _2611;
        float _2617 = fma(_2515, _2615, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2619 = fma(_2509, _2615, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2531 = _2615;
        _2581 = _2613;
        _2571 = _2617;
        _2575 = _2619;
    }
    float _2621 = _2531;
    float _2623 = _2581;
    float _2625 = _2571;
    float _2627 = _2575;
    float _2629 = _2621;
    if (_2453)
    {
        _2629 = 1.0;
    }
    float _2631 = _2629;
    float _2633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2635 = _2557 * _2633;
    float _2637 = _2631;
    if (!_2453)
    {
        float _2639 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2641 = _2639 * 0.15915493667125701904296875;
        float _2643 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2645 = _2641 * 6.283185482025146484375;
        float _2647 = cos(_2645);
        float _2649 = _2643 * 0.15915493667125701904296875;
        float _2651 = _2641 * 6.283185482025146484375;
        float _2653 = sin(_2651);
        float _2655 = 1.0 / _2647;
        float _2657 = _2649 * 6.283185482025146484375;
        float _2659 = cos(_2657);
        float _2661 = _2653 * _2655;
        float _2663 = _2649 * 6.283185482025146484375;
        float _2665 = sin(_2663);
        float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2669 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2667;
        float _2671 = _2659 * _2661;
        float _2673 = 1.0 / _2671;
        float _2675 = 1.0 / _2669;
        float _2677 = _2665 * _2673;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = fma(_2635, _2677, _2679);
        float _2683 = _2681 * _2675;
        float _2685 = precise::clamp(_2683, 0.0, 1.0);
        _2583 = _2671;
        _2257 = _2641;
        _2567 = _2685;
    }
    float _2687 = _2583;
    float _2689 = _2257;
    float _2691 = _2567;
    float _2693 = _2689;
    float _2695 = _2687;
    if (!_2453)
    {
        float _2697 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2703 = _2699 * 6.283185482025146484375;
        float _2705 = cos(_2703);
        float _2707 = _2701 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2705;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2635, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2693 = _2727;
        _2695 = _2713;
        _2637 = _2747;
    }
    float _2749 = _2693;
    float _2751 = _2695;
    float _2753 = _2637;
    float _2755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2757 = _2623 + _2755;
    float _2759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2761 = _2625 + _2759;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2765 = _2627 + _2763;
    float _2767 = _2757 * _2757;
    float _2769 = fma(_2761, _2761, _2767);
    float _2771 = fma(_2765, _2765, _2769);
    float _2773 = rsqrt(_2771);
    float _2775 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2777 = _2761 * _2775;
    float _2779 = _2765 * _2775;
    float _2781 = _2777 * _2777;
    float _2783 = _2779 * _2779;
    float _2785 = _2781 + _2783;
    float _2787 = sqrt(_2785);
    bool _2789 = _2787 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2793 = _2787 + _2791;
    float _2795 = _2773;
    float _2797 = _2751;
    float _2799 = _2793;
    float _2801 = _2749;
    float _2803 = _2757;
    float _2805 = _2775;
    float _2807 = _2777;
    if (_2789)
    {
        float _2809 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2795 = _2809;
    }
    float _2811 = _2795;
    if (_2789)
    {
        float _2813 = rsqrt(_2785);
        _2797 = _2813;
    }
    float _2815 = _2797;
    float _2817 = _2815;
    if (_2789)
    {
        float _2819 = _2793 * _2811;
        _2799 = _2819;
    }
    float _2821 = _2799;
    if (_2789)
    {
        float _2823 = _2821 * 0.15915493667125701904296875;
        _2801 = _2823;
    }
    float _2825 = _2801;
    float _2827 = _2811;
    float _2829 = _2825;
    if (_2789)
    {
        float _2831 = _2825 * 6.283185482025146484375;
        float _2833 = sin(_2831);
        _2827 = _2833;
    }
    float _2835 = _2827;
    float _2837 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2839 = precise::max(0.0, _2837);
    float _2841 = _2765;
    float _2843 = _2839;
    if (_2789)
    {
        float _2845 = _2825 * 6.283185482025146484375;
        float _2847 = cos(_2845);
        _2841 = _2847;
    }
    float _2849 = _2841;
    float _2851 = -_2775;
    float _2853 = -_2839;
    float _2855 = fma(_2757, _2851, _2853);
    if (_2789)
    {
        float _2857 = _2855 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2843 = _2857;
    }
    float _2859 = _2843;
    float _2861 = _2859;
    if (!_2789)
    {
        _2829 = _2855;
    }
    float _2863 = _2829;
    float _2865 = _2863;
    if (_2789)
    {
        float _2867 = fma(_2835, _2859, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2803 = _2867;
    }
    float _2869 = _2803;
    float _2871 = sqrt(_2771);
    float _2873 = _2869;
    if (_2789)
    {
        float _2875 = _2849 + (-1.0);
        _2861 = _2875;
    }
    float _2877 = _2861;
    float _2879 = _2877;
    if (_2789)
    {
        float _2881 = _2815 * _2869;
        _2805 = _2881;
    }
    float _2883 = _2805;
    if (!_2789)
    {
        _2817 = _2779;
    }
    float _2885 = _2817;
    float _2887 = _2885;
    if (_2789)
    {
        float _2889 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2873 = _2889;
    }
    float _2891 = _2873;
    float _2893 = _2891;
    if (_2789)
    {
        float _2895 = _2777 * _2883;
        _2807 = _2895;
    }
    float _2897 = _2807;
    if (!_2789)
    {
        _2879 = _2781;
    }
    float _2899 = _2879;
    float _2901 = _2899;
    if (_2789)
    {
        float _2903 = _2779 * _2883;
        _2887 = _2903;
    }
    float _2905 = _2887;
    if (_2789)
    {
        float _2907 = fma(_2855, _2849, _2891);
        _2865 = _2907;
    }
    float _2909 = _2865;
    if (_2789)
    {
        float _2911 = _2897 * _2897;
        _2901 = _2911;
    }
    float _2913 = _2901;
    if (!_2789)
    {
        _2893 = _2783;
    }
    float _2915 = _2893;
    float _2917 = _2915;
    if (_2789)
    {
        float _2919 = _2905 * _2905;
        _2917 = _2919;
    }
    float _2921 = _2917;
    float _2923 = fma(_2909, _2909, _2913);
    float _2925 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2927 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2929 = _2923 + _2921;
    float _2931 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2925);
    float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2935 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2933);
    float _2937 = precise::clamp(_2935, 0.0, 1.0);
    float _2939 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2941 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2943 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2931);
    float _2945 = rsqrt(_2929);
    float _2947 = -_2937;
    float _2949 = _2947 + 1.0;
    float _2951 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2939);
    float _2953 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2955 = _2623 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2957 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2941);
    float _2959 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2951);
    float _2961 = _2953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2963 = abs(_2949);
    float _2965 = log2(_2963);
    float _2967 = fma(_2625, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2955);
    float _2969 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2957);
    float _2971 = _2959 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2973 = -_2961;
    float _2975 = fma(_2973, _2927, 1.0);
    float _2977 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2967);
    float _2979 = _2969 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2981 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2983 = _2945 * _2897;
    float _2985 = _2945 * _2909;
    float _2987 = _2977 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2989 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2981);
    float _2991 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2993 = _2945 * _2905;
    float _2995 = log2(_2975);
    float _2997 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2989);
    float _2999 = -_2991;
    float _3001 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2999);
    float _3003 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3005 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3007 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2997);
    float _3009 = -_2993;
    float _3011 = fma(_3009, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3001);
    float _3013 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3015 = exp2(_3003);
    float _3017 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3005);
    float _3019 = fma(_3011, -0.5, 0.5);
    float _3021 = fma(_3011, 0.5, 0.5);
    float _3023 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3013);
    float _3025 = _2985 + 1.0;
    float _3027 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3017);
    float _3029 = fma(_3021, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3031 = 1.0 / _3007;
    float _3033 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3023);
    float _3035 = _2995 * 0.693147182464599609375;
    float _3037 = fma(_3021, _3029, -0.212114393711090087890625);
    float _3039 = fma(_3021, _3037, 1.570728778839111328125);
    float _3041 = sqrt(_3019);
    float _3043 = -_2985;
    float _3045 = fma(_3015, _3025, _3043);
    float _3047 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3027);
    float _3049 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3033);
    float _3051 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3053 = fma(_3045, 0.5, 0.5);
    float _3055 = _3047 * _3031;
    float _3057 = _3049 * _3031;
    float _3059 = fma(_3055, 0.5, 0.5);
    float _3061 = fma(_3057, -0.5, 0.5);
    float _3063 = _3041 * 0.636619746685028076171875;
    float3 _7747 = float3(_3059, _3061, _3051);
    float _3065 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7747, float3(0.0), isnan(_7747)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7747, float3(0.0), isnan(_7747)), level(0.0)).x;
    float _3067 = -_3039;
    float _3069 = fma(_3063, _3067, 1.0);
    float3 _7763 = float3(_3059, _3061, _3051);
    float4 _3071 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7763, float3(0.0), isnan(_7763)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7763, float3(0.0), isnan(_7763)), level(0.0)).xyzw;
    float _3073 = _3071.x;
    float _3075 = _3071.y;
    float _3077 = _3071.z;
    float _3079 = _3071.w;
    float2 _7779 = float2(_3069, _3053);
    float3 _3083 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7779, float2(0.0), isnan(_7779)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7779, float2(0.0), isnan(_7779)), level(0.0)).xyz;
    float _3085 = _3083.x;
    float _3087 = _3083.y;
    float _3089 = _3083.z;
    float _3091 = _2971 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3093 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3095 = _2691 * _2753;
    bool _3097 = _2691 > 0.0;
    bool _3099 = isnan(_2691);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.0);
    bool _3105 = _3101 || _3103;
    float _3107 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3091);
    float _3109 = _3007 * 0.5;
    float _3111 = _3095 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3113 = exp2(_3093);
    float _3115 = fma(_2953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3107);
    bool _3117 = _2753 <= 0.0;
    bool _3119 = !_3105;
    bool _3121 = _3117 || _3119;
    float _3123 = _363 * _3111;
    float _3125 = _3047 + _3007;
    float _3127 = fma(_2987, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3115);
    out.m_67.x = _1789;
    out.m_67.y = _1777;
    out.m_67.z = _1727;
    out.m_67.w = _1741;
    float _3129 = _3123 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3131 = _3127 + _3007;
    float _3133 = _3125 * 0.5;
    out.gl_Position.x = _3047;
    out.gl_Position.y = _3049;
    out.gl_Position.z = _3127;
    out.gl_Position.w = _3007;
    float _3135 = _3131 * 0.5;
    out.m_47.x = _3129;
    float _3137 = -_3113;
    float _3139 = _3137 + 1.0;
    float _3141 = fma(_3049, -0.5, _3109);
    float _3143 = _3139 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _3133;
    out.m_69.y = _3141;
    out.m_69.z = _3135;
    out.m_69.w = _3007;
    float _3145 = -_3143;
    float _3147 = _3145 + 1.0;
    float _3149 = _3143 * _3065;
    float _3151 = _3079 * _3149;
    float _3153 = _3079 * _3147;
    float _3155 = _3089 * _3149;
    float _3157 = fma(_3085, _3151, _3073);
    float _3159 = fma(_3087, _3151, _3075);
    float _3161 = fma(_3079, _3155, _3077);
    out.m_71.x = _3157;
    out.m_71.y = _3159;
    out.m_71.z = _3161;
    out.m_71.w = _3153;
    if (!_3121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3163 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3163;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

