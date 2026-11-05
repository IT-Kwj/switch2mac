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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c11 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    const device _33* vp_s0 [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_88 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_86 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_104 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_92 [[user(locn6)]];
    float4 m_96 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_102 [[user(locn10)]];
    float4 m_98 [[user(locn11)]];
    float4 m_100 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_80 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
    float4 m_70 [[attribute(10)]];
    float4 m_84 [[attribute(11)]];
    float4 m_76 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2341 = false;
    bool _589 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_53.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_56.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2626 = as_type<float>(_139);
        out.gl_Position.z = _2626;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_58.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = 0.0;
    if (_153)
    {
        float _161 = float(_123);
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _133;
    if (_169)
    {
        out.m_56.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2694 = as_type<float>(_175);
        out.gl_Position.z = _2694;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = _177 * _177;
    float _197 = _179 * _179;
    float _199 = _181 * _181;
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = sqrt(_207);
    float _215 = sqrt(_209);
    float _217 = sqrt(_211);
    bool _219 = _213 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = _215;
    if (_219)
    {
        float _225 = rsqrt(_207);
        _223 = _225;
    }
    float _227 = _223;
    float _229 = 0.0;
    if (!_219)
    {
        _229 = 0.0;
    }
    float _231 = _229;
    bool _233 = _217 > 0.0;
    float _235 = 0.0;
    float _237 = _231;
    if (!_219)
    {
        _235 = 0.0;
    }
    float _239 = _235;
    float _241 = 0.0;
    float _243 = _239;
    if (!_219)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = _217;
    float _249 = _245;
    if (_221)
    {
        float _251 = rsqrt(_209);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_221)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_221)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (!_221)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = _213;
    float _273 = _269;
    if (_233)
    {
        float _275 = rsqrt(_211);
        _271 = _275;
    }
    float _277 = _271;
    if (_219)
    {
        float _279 = _227 * _183;
        _237 = _279;
    }
    float _281 = _237;
    if (_219)
    {
        float _283 = _227 * _177;
        _243 = _283;
    }
    float _285 = _243;
    if (_219)
    {
        float _287 = _227 * _189;
        _249 = _287;
    }
    float _289 = _249;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _293 = 0.0;
    if (!_233)
    {
        _293 = 0.0;
    }
    float _295 = _293;
    float _297 = 0.0;
    float _299 = _295;
    if (!_233)
    {
        _297 = 0.0;
    }
    float _301 = _297;
    float _303 = _301;
    if (_221)
    {
        float _305 = _253 * _185;
        _261 = _305;
    }
    float _307 = _261;
    float _309 = 0.0;
    if (!_233)
    {
        _309 = 0.0;
    }
    float _311 = _309;
    float _313 = _311;
    if (_221)
    {
        float _315 = _253 * _179;
        _267 = _315;
    }
    float _317 = _267;
    if (_221)
    {
        float _319 = _253 * _191;
        _273 = _319;
    }
    float _321 = _273;
    if (_233)
    {
        float _323 = _277 * _187;
        _299 = _323;
    }
    float _325 = _299;
    if (_233)
    {
        float _327 = _277 * _181;
        _303 = _327;
    }
    float _329 = _303;
    if (_233)
    {
        float _331 = _277 * _193;
        _313 = _331;
    }
    float _333 = _313;
    bool _335 = !_291;
    float _353;
    if (!_335)
    {
        float _337 = in.m_66.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_123);
        float _359 = 1.0 / _357;
        float _361 = _157 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _363 + _369;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = in.m_66.x;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = _363 + _399;
    float _403 = 1.0 / _387;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _407 = 1.0 / _397;
    float _409 = 1.0 / _393;
    float _411 = _367 * _403;
    bool _413 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _415 = isnan(_363);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -_383;
    float _427 = _425 + 1.0;
    float _429 = _423 * _427;
    float _431 = _371 * _407;
    bool _433 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _435 = isnan(_363);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _445;
    bool _449 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _451 = isnan(_363);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = -_423;
    float _467 = _465 + 1.0;
    float _469 = -_443;
    float _471 = _469 + 1.0;
    float _473 = _401 * _409;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _479;
    float _483 = _459 * _471;
    float _485 = fma(_447, _473, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _487 = fma(_477, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _489 = fma(_481, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _491 = -_459;
    float _493 = _491 + 1.0;
    float _495 = _485 * _483;
    float _497 = _487 * _483;
    float _499 = _489 * _483;
    float _501 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _503 = _443 * _467;
    float _505 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].x, _497);
    float _507 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].y, _499);
    float _509 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].z, _495);
    float _511 = _501 * _389;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _521 = fma(_463, _431, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _523 = fma(_515, _431, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _525 = trunc(_511);
    int _527 = int(_525);
    float _529 = fma(_521, _503, _505);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _535;
    float _539 = fma(_519, _431, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _541;
    float _545 = fma(_523, _503, _507);
    float _547 = fma(_533, _411, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = fma(_537, _411, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _551 = fma(_543, _411, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _553 = fma(_539, _503, _509);
    float _555 = fma(_547, _429, _529);
    float _557 = fma(_549, _429, _545);
    float _559 = fma(_551, _429, _553);
    float _561 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[146].x, _555);
    float _563 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[146].y, _557);
    int _565 = _527 << 4;
    int _567 = _565 + 1712;
    float _569 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[146].z, _559);
    bool _571 = !_405;
    float _587;
    if (!_571)
    {
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _575 = _389 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        float _591 = float(_123);
        float _593 = 1.0 / _591;
        float _595 = _157 * _593;
        _587 = _595;
    }
    _589 = false;
    float _597 = _587;
    float _599 = in.m_68.w;
    float _601 = in.m_70.x;
    float _603 = in.m_70.y;
    float _605 = in.m_70.z;
    float _607 = in.m_53.x;
    float _609 = in.m_53.y;
    float _611 = in.m_53.z;
    float _613 = in.m_72.x;
    float _615 = in.m_72.y;
    float _617 = in.m_72.z;
    float _619 = in.m_64.w;
    float _621 = in.m_62.w;
    float _623 = trunc(_599);
    int _625 = int(_623);
    int _627 = _625 << 5;
    uint _630 = uint(int(uint(_627) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_630)];
    float _632 = as_type<float>(_dmw0.x);
    int _634 = _627 + 4;
    uint _636 = uint(int(uint(_634) >> uint(2)));
    float _638 = as_type<float>(_dmw0.y);
    int _640 = _627 + 8;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    float _644 = as_type<float>(_dmw0.z);
    int _646 = _627 + 12;
    uint _648 = uint(int(uint(_646) >> uint(2)));
    float _650 = as_type<float>(_dmw0.w);
    float _652 = _569 * _605;
    float _654 = _185 * _609;
    float _656 = _563 * _603;
    float _658 = _191 * _609;
    float _660 = _561 * _601;
    float _662 = fma(_183, _607, _654);
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _615);
    float _666 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _668 = fma(_189, _607, _658);
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _613);
    float _672 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _674 = _664 * _666;
    float _676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _617);
    float _678 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _680 = _670 * _672;
    float _682 = _674 * _321;
    float _684 = fma(_193, _611, _668);
    float _686 = _676 * _678;
    float _688 = _674 * _307;
    float _690 = fma(_680, _289, _682);
    float _692 = fma(_187, _611, _662);
    float _694 = _684 + _619;
    float _696 = fma(_680, _281, _688);
    float _698 = fma(_686, _333, _690);
    float _700 = _692 + _621;
    float _702 = _179 * _609;
    float _704 = fma(_686, _325, _696);
    float _706 = _694 + _698;
    float _708 = _674 * _317;
    float _710 = in.m_60.w;
    float _712 = _700 + _704;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _716 = _706 + _714;
    float _718 = fma(_177, _607, _702);
    float _720 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _722 = _712 + _720;
    float _724 = _716 * _716;
    float _726 = fma(_181, _611, _718);
    float _728 = fma(_680, _285, _708);
    bool _730 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _732 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.5);
    bool _738 = _734 || _736;
    float _740 = fma(_722, _722, _724);
    float _742 = sqrt(_740);
    bool _744 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _748 = _744 || _746;
    bool _750 = isnan(0.5);
    bool _752 = _748 || _750;
    float _754 = _726 + _710;
    float _756 = fma(_686, _329, _728);
    float _758 = _754 + _756;
    bool _760 = _742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _762 = _756;
    float _764 = _619;
    float _766 = _680;
    float _768 = _740;
    if (!_760)
    {
        _762 = _712;
    }
    float _770 = _762;
    float _772 = _650 * 2.0;
    float _774 = _632 * 2.0;
    float _776 = _638 * 2.0;
    float _778 = _638 * _638;
    float _780 = _644 * _772;
    float _782 = _638 * _772;
    float _784 = _632 * _772;
    float _786 = _644 * _644;
    float _788 = -_780;
    float _790 = fma(_638, _774, _788);
    float _792 = fma(_638, _774, _780);
    float _794 = fma(_644, _774, _782);
    float _796 = -_782;
    float _798 = fma(_644, _774, _796);
    float _800 = -_784;
    float _802 = fma(_644, _776, _800);
    float _804 = fma(_644, _776, _784);
    float _806 = _632 * _632;
    float _808 = _632;
    float _810 = _638;
    float _812 = _770;
    if (!_760)
    {
        _808 = _706;
    }
    float _814 = _808;
    float _816 = _814;
    if (!_760)
    {
        _810 = _758;
    }
    float _818 = _810;
    bool _820 = !_760;
    float _822 = _818;
    if (!_820)
    {
        float _824 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _828 = _742 + _826;
        float _830 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _832 = rsqrt(_740);
        float _834 = _828 * _824;
        float _836 = _834 * 0.15915493667125701904296875;
        float _838 = _836 * 6.283185482025146484375;
        float _840 = cos(_838);
        float _842 = _836 * 6.283185482025146484375;
        float _844 = sin(_842);
        float _846 = _840 + (-1.0);
        float _848 = _846 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = fma(_844, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _852 = fma(_758, _840, _848);
        float _854 = _832 * _850;
        float _856 = fma(_722, _854, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _858 = fma(_716, _854, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _822 = _852;
        _812 = _856;
        _816 = _858;
    }
    float _860 = _822;
    float _862 = _812;
    float _864 = _816;
    float _866 = -_754;
    float _868 = _866 + _860;
    float _870 = -_700;
    float _872 = _870 + _862;
    float _874 = fma(_778, -2.0, 1.0);
    float _876 = -_694;
    float _878 = _876 + _864;
    float _880 = _868 * _317;
    float _882 = _868 * _285;
    float _884 = fma(_806, -2.0, 1.0);
    float _886 = _868 * _329;
    float _888 = fma(_872, _307, _880);
    float _890 = fma(_786, -2.0, _874);
    float _892 = fma(_872, _281, _882);
    float _894 = fma(_786, -2.0, _884);
    float _896 = fma(_878, _321, _888);
    float _898 = fma(_872, _325, _886);
    float _900 = fma(_878, _289, _892);
    float _902 = fma(_778, -2.0, _884);
    float _904 = _896 * _790;
    float _906 = _896 * _894;
    float _908 = _896 * _804;
    float _910 = fma(_878, _333, _898);
    float _912 = fma(_900, _890, _904);
    float _914 = fma(_900, _792, _906);
    float _916 = fma(_900, _798, _908);
    float _918 = _908;
    if (_752)
    {
        _764 = 1.0;
    }
    float _920 = _764;
    float _922 = fma(_910, _794, _912);
    float _924 = fma(_910, _802, _914);
    float _926 = fma(_910, _902, _916);
    float _928 = _700 + _922;
    float _930 = _754 + _924;
    float _932 = _694 + _926;
    float _934 = _930;
    float _936 = _928;
    float _938 = _932;
    float _940 = _920;
    if (!_738)
    {
        float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _944 = _754 + _942;
        float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _948 = _700 + _946;
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _952 = _944 * _944;
        float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _956 = _694 + _954;
        float _958 = fma(_948, _948, _952);
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _962 = fma(_956, _956, _958);
        float _964 = sqrt(_962);
        float _966 = _950 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _968 = precise::min(_964, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _970 = _968 * _960;
        float _972 = _966 * _970;
        float _974 = fma(_922, _972, _700);
        float _976 = fma(_924, _972, _754);
        float _978 = fma(_926, _972, _694);
        _934 = _976;
        _936 = _974;
        _938 = _978;
    }
    float _980 = _934;
    float _982 = _936;
    float _984 = _938;
    if (!_752)
    {
        float _986 = in.m_74.w;
        int _988 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _990 = _988 == 4;
        bool _992 = _988 == 8;
        bool _994 = _988 == 12;
        int _996 = as_type<int>(_986) << 16;
        int _998 = as_type<int>(_986) << 8;
        int _1000 = as_type<int>(_986) << 24;
        int _1002 = _996 >> 24;
        int _1004 = _998 >> 24;
        int _1006 = as_type<int>(_986) >> 24;
        int _1008 = _1000 >> 24;
        float _1010 = float(_1002);
        float _1012 = float(_1004);
        float _1014 = float(_1006);
        float _1016 = _1010 * 0.0078740157186985015869140625;
        float _1018 = float(_1008);
        float _1020 = _1012 * 0.0078740157186985015869140625;
        float _1022 = _1014 * 0.0078740157186985015869140625;
        float _1024 = precise::min(_1016, 1.0);
        float _1026 = _1018 * 0.0078740157186985015869140625;
        float _1028 = precise::min(_1020, 1.0);
        float _1030 = precise::min(_1022, 1.0);
        float _1032 = precise::min(_1026, 1.0);
        float _1034 = precise::max(_1024, -1.0);
        float _1036 = precise::max(_1028, -1.0);
        float _1038 = precise::max(_1030, -1.0);
        float _1040 = precise::max(_1032, -1.0);
        float _1042 = _1040;
        _918 = as_type<float>(_988);
        if (_990)
        {
            _1042 = _1034;
        }
        float _1044 = _1042;
        float _1046 = _1044;
        if (_992)
        {
            _1046 = _1036;
        }
        float _1048 = _1046;
        float _1050 = _1048;
        if (_994)
        {
            _1050 = _1038;
        }
        float _1052 = _1050;
        float _1054 = abs(_1052);
        float _1056 = (-0.0) + _1054;
        _940 = _1056;
    }
    float _1058 = _940;
    float _1060 = _918;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _980 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1068 = _982 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1072 = _984 + _1070;
    float _1074 = _1064 * _1064;
    bool _1076 = _1058 != 0.0;
    bool _1078 = isnan(_1058);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_1068, _1068, _1074);
    float _1088 = fma(_1072, _1072, _1086);
    float _1090 = rsqrt(_1088);
    float _1092 = sqrt(_1088);
    float _1094 = _1090 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1096 = _1068 * _1094;
    float _1098 = _1072 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _1090;
    float _1116 = _1104;
    float _1118 = _1112;
    float _1120 = _1064;
    if (_1108)
    {
        float _1122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1122;
    }
    float _1124 = _1114;
    if (_1108)
    {
        float _1126 = rsqrt(_1104);
        _1116 = _1126;
    }
    float _1128 = _1116;
    float _1130 = _1128;
    if (_1108)
    {
        float _1132 = _1112 * _1124;
        _1118 = _1132;
    }
    float _1134 = _1118;
    if (_1108)
    {
        float _1136 = _1134 * 0.15915493667125701904296875;
        _766 = _1136;
    }
    float _1138 = _766;
    float _1140 = _1060;
    if (_1108)
    {
        float _1142 = _1138 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        _1140 = _1144;
    }
    float _1146 = _1140;
    float _1148 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1150 = precise::max(0.0, _1148);
    float _1152 = _1072;
    float _1154 = _1150;
    float _1156 = _1148;
    if (_1108)
    {
        float _1158 = _1138 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        _1152 = _1160;
    }
    float _1162 = _1152;
    float _1164 = -_1094;
    float _1166 = -_1150;
    float _1168 = fma(_1064, _1164, _1166);
    float _1170 = _1168;
    if (!_1108)
    {
        _1120 = _1096;
    }
    float _1172 = _1120;
    float _1174 = _1172;
    if (_1108)
    {
        float _1176 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1154 = _1176;
    }
    float _1178 = _1154;
    float _1180 = _1146;
    float _1182 = _1178;
    if (_1108)
    {
        float _1184 = fma(_1146, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1180 = _1184;
    }
    float _1186 = _1180;
    if (_1108)
    {
        float _1188 = _1162 + (-1.0);
        _1156 = _1188;
    }
    float _1190 = _1156;
    float _1192 = _1190;
    if (_1108)
    {
        float _1194 = _1128 * _1186;
        _768 = _1194;
    }
    float _1196 = _768;
    float _1198 = _980 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1200 = _1198;
    if (!_1108)
    {
        _1130 = _1100;
    }
    float _1202 = _1130;
    float _1204 = _1202;
    if (_1108)
    {
        float _1206 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1206;
    }
    float _1208 = _1182;
    if (_1108)
    {
        float _1210 = _1096 * _1196;
        _1174 = _1210;
    }
    float _1212 = _1174;
    if (!_1108)
    {
        _1192 = _1098;
    }
    float _1214 = _1192;
    float _1216 = _1214;
    if (_1108)
    {
        float _1218 = _1098 * _1196;
        _1216 = _1218;
    }
    float _1220 = _1216;
    if (_1108)
    {
        float _1222 = fma(_1168, _1162, _1208);
        _1170 = _1222;
    }
    float _1224 = _1170;
    if (_1108)
    {
        float _1226 = _1212 * _1212;
        _1204 = _1226;
    }
    float _1228 = _1204;
    float _1230 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1232 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1198);
    float _1234 = _1230;
    if (!_1108)
    {
        _1200 = _1102;
    }
    float _1236 = _1200;
    float _1238 = _1236;
    if (_1108)
    {
        float _1240 = _1220 * _1220;
        _1238 = _1240;
    }
    float _1242 = _1238;
    float _1244 = fma(_1224, _1224, _1228);
    float _1246 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1232);
    float _1248 = _980 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1250 = _1244 + _1242;
    float _1252 = _980 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1254 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1258 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1248);
    float _1260 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1252);
    float _1262 = rsqrt(_1250);
    float _1264 = fma(_694, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1266 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1268 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1270 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1258);
    float _1272 = -_1266;
    float _1274 = fma(_1272, _1256, 1.0);
    float _1276 = _980 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1280 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1278);
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1286 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1288 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1276);
    float _1290 = -_1282;
    float _1292 = _1290 + 1.0;
    float _1294 = floor(_1230);
    float _1296 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1288);
    float _1298 = _1262 * _1212;
    float _1300 = _1262 * _1224;
    float _1302 = _1262 * _1220;
    float _1304 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1306 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1308 = abs(_1292);
    float _1310 = log2(_1308);
    float _1312 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1306);
    float _1316 = -_1312;
    float _1318 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1316);
    float _1320 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1314);
    float _1322 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1324 = -_1302;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1318);
    float _1328 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1330 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1320);
    float _1332 = floor(_1264);
    float _1334 = fma(_1326, -0.5, 0.5);
    float _1336 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1328);
    float _1338 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1322);
    float _1340 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1342 = fma(_1326, 0.5, 0.5);
    float _1344 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1336);
    float _1346 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1338);
    float _1348 = 1.0 / _1330;
    float _1350 = -_1294;
    float _1352 = _1230 + _1350;
    float _1354 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1344);
    float _1356 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1346);
    float _1358 = fma(_1342, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1360 = _1300 + 1.0;
    float _1362 = _1294;
    float _1364 = _1330;
    float _1366 = _1356;
    if (_1084)
    {
        _1362 = _1354;
    }
    float _1368 = _1362;
    float _1370 = log2(_1274);
    float _1372 = _1368;
    if (_1084)
    {
        _1234 = _1356;
    }
    float _1374 = _1234;
    float _1376 = -_1332;
    float _1378 = _1264 + _1376;
    float _1380 = _1374;
    if (!_1084)
    {
        _1372 = 0.0;
    }
    float _1382 = _1372;
    float _1384 = fma(_1342, _1358, -0.212114393711090087890625);
    if (!_1084)
    {
        _1380 = 0.0;
    }
    float _1386 = _1380;
    float _1388 = sqrt(_1334);
    float _1390 = _1348 * _1382;
    float _1392 = _1348 * _1386;
    float _1394 = exp2(_1340);
    float _1396 = _1370 * 0.693147182464599609375;
    float2 _4592 = float2(_1352, _1378);
    float _1398 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4592, float2(0.0), isnan(_4592)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4592, float2(0.0), isnan(_4592)), level(0.0)).x;
    float _1400 = fma(_1342, _1384, 1.570728778839111328125);
    float _1402 = fma(_1390, 0.5, 0.5);
    float _1404 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1406 = fma(_1392, -0.5, 0.5);
    float _1408 = _1388 * 0.636619746685028076171875;
    float3 _4618 = float3(_1402, _1406, _1404);
    float _1410 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4618, float3(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4618, float3(0.0), isnan(_4618)), level(0.0)).x;
    float _1412 = -_1400;
    float _1414 = fma(_1408, _1412, 1.0);
    float _1416 = -_1300;
    float _1418 = fma(_1394, _1360, _1416);
    float _1420 = fma(_1418, 0.5, 0.5);
    float3 _4642 = float3(_1402, _1406, _1404);
    float4 _1423 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4642, float3(0.0), isnan(_4642)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4642, float3(0.0), isnan(_4642)), level(0.0)).xyzw;
    float _1425 = _1423.x;
    float _1427 = _1423.y;
    float _1429 = _1423.z;
    float _1431 = _1423.w;
    float2 _4658 = float2(_1414, _1420);
    float3 _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4658, float2(0.0), isnan(_4658)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4658, float2(0.0), isnan(_4658)), level(0.0)).xyz;
    float _1437 = _1435.x;
    float _1439 = _1435.y;
    float _1441 = _1435.z;
    float _1443 = in.m_66.w;
    float _1445 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1447 = in.m_66.y;
    int _1449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1451 = _1449 != 0;
    float _1453 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1445);
    float _1455 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1457 = in.m_76.y;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1461 = _1459 != 0;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1469 = _1467 != 0;
    float _1471 = _1455 * _389;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1475 = _1473 != 0;
    float _1477 = in.m_76.x;
    float _1479 = trunc(_1471);
    int _1481 = int(_1479);
    float _1483 = _1402;
    bool _1485 = _1469;
    if (_1451)
    {
        float _1487 = in.m_66.z;
        _1483 = _1487;
    }
    float _1489 = _1483;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1493 = _1491 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1495 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1453);
    float _1497 = 1.0 / _1465;
    bool _1499 = _1443 > 0.5;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1503 = _1501 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1505;
    bool _1509 = _1447 > 0.5;
    out.m_78.x = _982;
    out.m_78.y = _980;
    out.m_78.z = _984;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1513 = _1511 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1515 = 1.0 / _1493;
    float _1517 = -_1457;
    float _1519 = _1517 + 1.0;
    int _1521 = _1481 << 4;
    int _1523 = _1521 + 1968;
    float _1525 = 0.0;
    bool _1527 = _1499;
    float _1529 = _1457;
    float _1531 = _1477;
    if (!_1461)
    {
        _1525 = _1477;
    }
    float _1533 = _1525;
    float _1535 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    int _1537 = _1523 + 8;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    uint _1541 = uint(int(uint(int(_1539)) >> uint(2)));
    int _1543 = int(_1539) & 3;
    float _1545 = (*spvDescriptorSet0.vp_c9)._m0[int(_1541)][_1543];
    float _1547 = 1.0 / _1513;
    int _1549 = _1499 ? as_type<int>(_1519) : as_type<int>(_1457);
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1553 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1551);
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1555;
    float _1559 = _1533;
    if (_1461)
    {
        bool _1561 = _389 > 0.5;
        _1527 = _1561;
    }
    bool _1563 = _1527;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1567 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1565);
    float _1569 = _1469 ? as_type<float>(_1549) : _1457;
    float _1571 = _1557 * _1497;
    float _1573 = _1503 * _1515;
    if (_1451)
    {
        bool _1575 = _1489 > 0.5;
        _1485 = _1575;
    }
    bool _1577 = _1485;
    uint _1579 = uint(int(uint(_1523) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[int(_1589)][_1591];
    float _1595 = in.m_80.x;
    float _1597 = in.m_80.y;
    float _1599 = in.m_80.z;
    bool _1601 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1603 = isnan(_597);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1609 = _1605 || _1607;
    float _1611 = float(_1609);
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1615 = _597 + _1613;
    if (_1475)
    {
        float _1617 = _1509 ? _1519 : _1457;
        _1529 = _1617;
    }
    float _1619 = _1529;
    float _1621 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1553);
    float _1623 = _1507 * _1547;
    bool _1625 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1627 = isnan(_597);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1633 = _1629 || _1631;
    float _1635 = float(_1633);
    float _1637 = -_1611;
    float _1639 = _1637 + 1.0;
    bool _1641 = _615 != 0.0;
    bool _1643 = isnan(_615);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.0);
    bool _1649 = _1645 || _1647;
    float _1651 = fma(_1571, _1615, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1653 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1655 = isnan(_597);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = -_1635;
    float _1667 = _1665 + 1.0;
    bool _1669 = _613 == 0.0;
    bool _1671 = !_1649;
    bool _1673 = _1669 && _1671;
    float _1675 = _1635 * _1639;
    bool _1677 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1679 = isnan(_597);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    float _1689 = _1663 * _1667;
    bool _1691 = _617 == 0.0;
    bool _1693 = _1691 && _1673;
    float _1695 = -_1663;
    float _1697 = _1695 + 1.0;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1701 = _597 + _1699;
    float _1703 = -_1687;
    float _1705 = _1703 + 1.0;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1709 = _597 + _1707;
    float _1711 = _1687 * _1697;
    float _1713 = fma(_1573, _1701, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1715 = as_type<int>(_1701);
    int _1717 = as_type<int>(_1651);
    float _1719 = _1687;
    float _1721 = _1709;
    float _1723 = _1697;
    if (_1461)
    {
        float _1725 = -_1477;
        float _1727 = _1725 + 1.0;
        _1715 = as_type<int>(_1727);
    }
    int _1729 = _1715;
    float _1731 = fma(_1623, _1709, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1733 = _1651 * _1711;
    float _1735 = as_type<float>(_1729);
    float _1737 = _1733;
    if (_1451)
    {
        float _1739 = -_1477;
        float _1741 = _1739 + 1.0;
        _1717 = as_type<int>(_1741);
    }
    int _1743 = _1717;
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1747 = as_type<float>(_1743);
    if (_1461)
    {
        float _1749 = _1563 ? as_type<float>(_1729) : _1477;
        _1559 = _1749;
    }
    float _1751 = _1559;
    float _1753 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1733);
    if (_1693)
    {
        _1735 = _1597;
    }
    float _1755 = _1735;
    float _1757 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1567);
    float _1759 = _1755;
    if (_1693)
    {
        _1737 = _1599;
    }
    float _1761 = _1737;
    float _1763 = _700 + _1621;
    float _1765 = _1761;
    if (_1693)
    {
        _1719 = _1755;
    }
    float _1767 = _1719;
    float _1769 = _694 + _1757;
    float _1771 = _1767;
    if (!_1693)
    {
        _1759 = _1597;
    }
    float _1773 = _1759;
    float _1775 = _754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1693)
    {
        _1721 = _1595;
    }
    float _1777 = _1721;
    float _1779 = fma(_1713, _1689, _1753);
    float _1781 = _1777;
    float _1783 = _1779;
    if (_1693)
    {
        _1723 = _1761;
    }
    float _1785 = _1723;
    float _1787 = -_1763;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1791 = _1785;
    if (!_1693)
    {
        _1765 = _1599;
    }
    float _1793 = _1765;
    float _1795 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1775);
    if (_1451)
    {
        float _1797 = _1577 ? as_type<float>(_1743) : _1477;
        _1531 = _1797;
    }
    float _1799 = _1531;
    float _1801 = _754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1693)
    {
        _1747 = _1777;
    }
    float _1803 = _1747;
    float _1805 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1795);
    float _1807 = _1803;
    if (!_1693)
    {
        _1781 = _1595;
    }
    float _1809 = _1781;
    float _1811 = _1545 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1813 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1815 = isnan(0.0);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1821 = _1817 || _1819;
    float _1823 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1825 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_1693)
    {
        float _1827 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1809);
        _1807 = _1827;
    }
    float _1829 = _1807;
    float _1831 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1835 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1801);
    float _1837 = _1593 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1839 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1841 = -_1769;
    float _1843 = _1841 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1845 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1835);
    float _1847 = _1837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = fma(_1731, _1675, _1779);
    float _1851 = 1.0 / _1823;
    float _1853 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1821)
    {
        float _1855 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1783 = _1855;
    }
    float _1857 = _1783;
    float _1859 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1861 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_82.x = _1839;
    out.m_82.y = _1847;
    out.m_82.z = _1831;
    float _1863 = precise::min(_1763, _1789);
    float _1865 = _1857;
    if (!_1693)
    {
        float _1867 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1793);
        _1791 = _1867;
    }
    float _1869 = _1791;
    float _1871 = precise::min(_1769, _1843);
    float _1873 = _1853 + _1823;
    float _1875 = _1859 * _1833;
    float _1877 = _1861 * _1745;
    float _1879 = precise::min(_1863, _1871);
    float _1881 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1883 = in.m_84.x;
    float _1885 = in.m_84.y;
    float _1887 = in.m_84.z;
    float _1889 = in.m_84.w;
    float _1891 = _1873 * _1851;
    float _1893 = _1891 * 0.5;
    uint _1895 = uint(int(uint(_567) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[int(_1905)][_1907];
    float _1911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1913 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1917 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1915);
    if (!_1693)
    {
        float _1919 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1773);
        _1771 = _1919;
    }
    float _1921 = _1771;
    float _1923 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1849);
    if (_1821)
    {
        float _1925 = precise::min(_1857, 20.0);
        _1865 = _1925;
    }
    float _1927 = _1865;
    int _1929 = _567 + 8;
    uint _1931 = uint(int(uint(_1929) >> uint(2)));
    uint _1933 = uint(int(uint(int(_1931)) >> uint(2)));
    int _1935 = int(_1931) & 3;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[int(_1933)][_1935];
    float _1939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1941 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1943 = isnan(_1092);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1949 = _1945 || _1947;
    float _1951 = 1.0 / _1917;
    float _1953 = _1881 * _1911;
    float _1955 = _317 * _1885;
    float _1957 = _307 * _1885;
    float _1959 = _321 * _1885;
    float _1961 = _1913 * _1939;
    float _1963 = _1887 * _1809;
    float _1965 = fma(_285, _1883, _1955);
    float _1967 = _1769;
    float _1969 = _1939;
    if (_1821)
    {
        float _1971 = 1.0 / _1927;
        _1967 = _1971;
    }
    float _1973 = _1967;
    float _1975 = fma(_281, _1883, _1957);
    out.m_86.x = _1877;
    out.m_86.y = _1953;
    out.m_86.z = _1961;
    out.m_86.w = _1875;
    float _1977 = fma(_289, _1883, _1959);
    float _1979 = -_1963;
    float _1981 = fma(_1883, _1793, _1979);
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1985 = _1951 * _1983;
    float _1987 = _1883 * _1773;
    float _1989 = _1885 * _1793;
    float _1991 = fma(_325, _1887, _1975);
    float _1993 = fma(_329, _1887, _1965);
    float _1995 = -_1987;
    float _1997 = fma(_1885, _1809, _1995);
    float _1999 = _1981 * _1889;
    float _2001 = fma(_333, _1887, _1977);
    float _2003 = -_1989;
    float _2005 = fma(_1887, _1773, _2003);
    float _2007 = _307 * _1921;
    if (!_1821)
    {
        _1969 = 1.0;
    }
    float _2009 = _1969;
    float _2011 = abs(_1985);
    float _2013 = log2(_2011);
    float _2015 = _2009;
    if (_1821)
    {
        float _2017 = _1879 * _1973;
        float _2019 = precise::clamp(_2017, 0.0, 1.0);
        _2015 = _2019;
    }
    float _2021 = _2015;
    float _2023 = _317 * _1921;
    float _2025 = _321 * _1921;
    float _2027 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2029 = _1999 * _307;
    float _2031 = fma(_281, _1829, _2007);
    float _2033 = fma(_285, _1829, _2023);
    float _2035 = fma(_289, _1829, _2025);
    float _2037 = _2005 * _1889;
    float _2039 = _1999 * _317;
    float _2041 = _1999 * _321;
    float _2043 = _1997 * _1889;
    float _2045 = _1901 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2047 = _1937 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2049 = _1993 * _790;
    float _2051 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2053 = _1993 * _894;
    float _2055 = fma(_2037, _281, _2029);
    float _2057 = _1993 * _804;
    float _2059 = fma(_2037, _285, _2039);
    float _2061 = fma(_2037, _289, _2041);
    float _2063 = exp2(_2051);
    float _2065 = fma(_325, _1869, _2031);
    float _2067 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2069 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2071 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2073 = _1923 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2075 = fma(_1991, _890, _2049);
    float _2077 = fma(_1991, _792, _2053);
    float _2079 = fma(_2043, _325, _2055);
    float _2081 = fma(_329, _1869, _2033);
    float _2083 = fma(_1991, _798, _2057);
    float _2085 = fma(_2043, _329, _2059);
    float _2087 = fma(_333, _1869, _2035);
    float _2089 = fma(_2043, _333, _2061);
    float _2091 = fma(_2001, _794, _2075);
    float _2093 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2095 = precise::clamp(_2093, 0.0, 1.0);
    out.m_88.x = _2067;
    out.m_88.y = _2069;
    out.m_88.z = _2071;
    out.m_88.w = _2073;
    float _2097 = fma(_2001, _802, _2077);
    float _2099 = fma(_2001, _902, _2083);
    float _2101 = fma(_2095, -2.0, 3.0);
    float _2103 = _2095 * _2095;
    float _2105 = _2081 * _894;
    bool _2107 = _1985 <= 8000.0;
    bool _2109 = isnan(_1985);
    bool _2111 = _2107 || _2109;
    bool _2113 = isnan(8000.0);
    bool _2115 = _2111 || _2113;
    float _2117 = float(_2115);
    out.m_90.x = _2091;
    out.m_90.y = _2097;
    out.m_90.z = _2099;
    float _2119 = _2103 * _2101;
    float _2121 = fma(_2065, _792, _2105);
    float _2123 = _2081 * _790;
    float _2125 = _2085 * _790;
    float _2127 = _2085 * _894;
    float _2129 = _2085 * _804;
    float _2131 = fma(_2065, _890, _2123);
    float _2133 = fma(_2079, _890, _2125);
    float _2135 = fma(_2079, _792, _2127);
    float _2137 = fma(_2079, _798, _2129);
    float _2139 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2141 = -_2119;
    float _2143 = _2141 + 1.0;
    float _2145 = fma(_2089, _802, _2135);
    float _2147 = fma(_2089, _794, _2133);
    float _2149 = fma(_2089, _902, _2137);
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2119);
    float _2153 = exp2(_2139);
    float _2155 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1495);
    float _2157 = _2081 * _804;
    float _2159 = in.m_74.x;
    float _2161 = _2117 * _2151;
    float _2163 = _2021 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2165 = fma(_2065, _798, _2157);
    out.m_92.x = _2147;
    out.m_92.y = _2145;
    out.m_92.z = _2149;
    float _2167 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2169 = _2155 + _1330;
    int _2171 = as_type<int>(_2099);
    float _2173 = _2131;
    float _2175 = 0.0;
    float _2177 = _2155;
    if (!_1084)
    {
        float _2179 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _2171 = as_type<int>(_2179);
    }
    int _2181 = _2171;
    out.gl_Position.x = _1354;
    out.gl_Position.y = _1356;
    out.gl_Position.z = _2155;
    out.gl_Position.w = _1330;
    float _2183 = _2169 * 0.5;
    float _2185 = -_2153;
    float _2187 = _2185 + 1.0;
    float _2189 = _2163 * _1058;
    if (!_1084)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5933 = as_type<float>(_2181);
        out.gl_Position.z = _5933;
    }
    float _2191 = fma(_2087, _802, _2121);
    float _2193 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2195 = fma(_2087, _794, _2131);
    float _2197 = fma(_2087, _902, _2165);
    out.m_94.z = _2183;
    out.m_94.w = _1330;
    if (_1084)
    {
        _2173 = _2189;
    }
    float _2199 = _2173;
    float _2201 = _2199;
    if (!_1084)
    {
        _2201 = 0.0;
    }
    float _2203 = _2201;
    float _2205 = -_2193;
    float _2207 = _2205 + 1.0;
    out.m_96.x = _2195;
    out.m_96.y = _2191;
    out.m_96.z = _2197;
    float _2209 = _2207;
    if (!_1949)
    {
        _2175 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2211 = _2175;
    float _2213 = -_1398;
    float _2215 = _2213 + 1.0;
    float _2217 = _2211;
    float _2219 = _2211;
    if (!_1949)
    {
        _1364 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2221 = _1364;
    float _2223 = _2221;
    float _2225 = _2221;
    if (!_1949)
    {
        _2177 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2227 = _2177;
    float _2229 = _2215 * _2167;
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = _2227;
    float _2235 = _2227;
    if (!_1949)
    {
        _1366 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2237 = _1366;
    float _2239 = _2193 * _1410;
    float _2241 = -_2231;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2245 = _2243 * _2159;
    float _2247 = _2245 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2249 = _1431 * _2239;
    float _2251 = _1431 * _2207;
    out.m_98.x = _2247;
    float _2253 = _2249;
    float _2255 = _2237;
    float _2257 = _2237;
    if (!_1949)
    {
        _2209 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2259 = _2209;
    float _2261 = _1441 * _2239;
    float _2263 = fma(_1437, _2249, _1425);
    float _2265 = fma(_1439, _2249, _1427);
    float _2267 = _2259;
    float _2269 = _2259;
    if (!_1949)
    {
        _2253 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2271 = _2253;
    float _2273 = fma(_1431, _2261, _1429);
    out.m_100.x = _2263;
    out.m_100.y = _2265;
    out.m_100.z = _2273;
    out.m_100.w = _2251;
    bool _2275 = !_1949;
    float _2277 = _2271;
    float _2279 = _2271;
    if (!_2275)
    {
        bool _2281 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2283 = isnan(_1092);
        bool _2285 = _2281 || _2283;
        bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2289 = _2285 || _2287;
        if (!_2289)
        {
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = _1092 + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2297 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2295;
            float _2299 = 1.0 / _2297;
            float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2321 = _2293 * _2299;
            float _2323 = precise::clamp(_2321, 0.0, 1.0);
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2329 = fma(_2323, _2303, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2331 = fma(_2323, _2327, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2333 = fma(_2323, _2307, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2335 = fma(_2323, _2311, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2337 = fma(_2323, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2339 = fma(_2323, _2319, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2225 = _2331;
            _2269 = _2337;
            _2219 = _2329;
            _2257 = _2335;
            _2235 = _2333;
            _2279 = _2339;
            _2341 = true;
        }
        else
        {
            bool _2343 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2345 = isnan(_1092);
            bool _2347 = _2343 || _2345;
            bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2351 = _2347 || _2349;
            if (!_2351)
            {
                _2217 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2353 = _2217;
            _2219 = _2353;
            if (!_2351)
            {
                _2223 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2355 = _2223;
            _2225 = _2355;
            if (!_2351)
            {
                _2233 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2357 = _2233;
            _2235 = _2357;
            if (!_2351)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2359 = _2255;
            _2257 = _2359;
            if (!_2351)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2361 = _2267;
            _2269 = _2361;
            if (!_2351)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2363 = _2277;
            bool _2365 = !_2351;
            _2279 = _2363;
            if (!_2365)
            {
                bool _2367 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2369 = isnan(_1092);
                bool _2371 = _2367 || _2369;
                bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2375 = _2371 || _2373;
                if (!_2375)
                {
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = _1092 + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2381;
                    float _2385 = 1.0 / _2383;
                    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2407 = _2379 * _2385;
                    float _2409 = precise::clamp(_2407, 0.0, 1.0);
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2415 = fma(_2409, _2389, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2417 = fma(_2409, _2413, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2419 = fma(_2409, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2421 = fma(_2409, _2397, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2423 = fma(_2409, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2425 = fma(_2409, _2405, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2225 = _2417;
                    _2269 = _2423;
                    _2219 = _2415;
                    _2257 = _2421;
                    _2235 = _2419;
                    _2279 = _2425;
                    _2341 = true;
                }
                else
                {
                    _2225 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2219 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2235 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2341 = false;
    float _2427 = _2225;
    float _2429 = _2269;
    float _2431 = _2219;
    float _2433 = _2257;
    float _2435 = _2235;
    float _2437 = _2279;
    float _2439 = fma(_2191, -0.5, 0.5);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    float _2451 = -_2435;
    float _2453 = _2451 + _2437;
    bool _2455 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2457 = fma(_2441, _2445, _2427);
    float _2459 = fma(_2441, _2449, _2431);
    float _2461 = fma(_2441, _2453, _2435);
    float _2463 = _2203 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2465 = _2457 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _2467 = fma(_2459, 0.298911988735198974609375, _2465);
    out.m_98.w = _2463;
    float _2469 = fma(_2461, 0.114477999508380889892578125, _2467);
    out.m_56.x = 1.0;
    float _2471 = -_2469;
    float _2473 = _2459 + _2471;
    float _2475 = -_2469;
    float _2477 = _2457 + _2475;
    float _2479 = -_2469;
    float _2481 = _2461 + _2479;
    float _2483 = fma(_2473, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2469);
    float _2485 = fma(_2477, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2469);
    float _2487 = fma(_2481, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2469);
    out.m_104.x = _2483;
    out.m_104.y = _2485;
    out.m_104.z = _2487;
    if (!_2455)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2489 = -_980;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2493 = -_982;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2497 = -_984;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2501 = _2491 * _2491;
    float _2503 = fma(_2495, _2495, _2501);
    float _2505 = fma(_2499, _2499, _2503);
    float _2507 = sqrt(_2505);
    float _2509 = rsqrt(_2505);
    float _2511 = -_2507;
    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2515 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = _2495 * _2509;
    float _2521 = _2491 * _2509;
    float _2523 = abs(_2517);
    float _2525 = log2(_2523);
    float _2527 = _2499 * _2509;
    float _2529 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2531 = _2191 * _2521;
    float _2533 = -_2521;
    float _2535 = -_2529;
    float _2537 = fma(_2533, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2535);
    float _2539 = fma(_2195, _2519, _2531);
    float _2541 = -_2527;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2537);
    float _2545 = fma(_2197, _2527, _2539);
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2551 = _2543 + _2549;
    float _2553 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2555 = _2551 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = exp2(_2553);
    float _2561 = _2559 * _2557;
    float _2563 = _2547 * _2561;
    float _2565 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2567 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2569 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _2565;
    out.m_102.y = _2567;
    out.m_102.z = _2569;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2341 = false;
    bool _589 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_53.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_56.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2626 = as_type<float>(_139);
        out.gl_Position.z = _2626;
    }
    if (!_127)
    {
        return out;
    }
    float _143 = in.m_58.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = 0.0;
    if (_153)
    {
        float _161 = float(_123);
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _133;
    if (_169)
    {
        out.m_56.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2694 = as_type<float>(_175);
        out.gl_Position.z = _2694;
    }
    if (_169)
    {
        return out;
    }
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = _177 * _177;
    float _197 = _179 * _179;
    float _199 = _181 * _181;
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = sqrt(_207);
    float _215 = sqrt(_209);
    float _217 = sqrt(_211);
    bool _219 = _213 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = _215;
    if (_219)
    {
        float _225 = rsqrt(_207);
        _223 = _225;
    }
    float _227 = _223;
    float _229 = 0.0;
    if (!_219)
    {
        _229 = 0.0;
    }
    float _231 = _229;
    bool _233 = _217 > 0.0;
    float _235 = 0.0;
    float _237 = _231;
    if (!_219)
    {
        _235 = 0.0;
    }
    float _239 = _235;
    float _241 = 0.0;
    float _243 = _239;
    if (!_219)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = _217;
    float _249 = _245;
    if (_221)
    {
        float _251 = rsqrt(_209);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_221)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_221)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (!_221)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = _213;
    float _273 = _269;
    if (_233)
    {
        float _275 = rsqrt(_211);
        _271 = _275;
    }
    float _277 = _271;
    if (_219)
    {
        float _279 = _227 * _183;
        _237 = _279;
    }
    float _281 = _237;
    if (_219)
    {
        float _283 = _227 * _177;
        _243 = _283;
    }
    float _285 = _243;
    if (_219)
    {
        float _287 = _227 * _189;
        _249 = _287;
    }
    float _289 = _249;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _293 = 0.0;
    if (!_233)
    {
        _293 = 0.0;
    }
    float _295 = _293;
    float _297 = 0.0;
    float _299 = _295;
    if (!_233)
    {
        _297 = 0.0;
    }
    float _301 = _297;
    float _303 = _301;
    if (_221)
    {
        float _305 = _253 * _185;
        _261 = _305;
    }
    float _307 = _261;
    float _309 = 0.0;
    if (!_233)
    {
        _309 = 0.0;
    }
    float _311 = _309;
    float _313 = _311;
    if (_221)
    {
        float _315 = _253 * _179;
        _267 = _315;
    }
    float _317 = _267;
    if (_221)
    {
        float _319 = _253 * _191;
        _273 = _319;
    }
    float _321 = _273;
    if (_233)
    {
        float _323 = _277 * _187;
        _299 = _323;
    }
    float _325 = _299;
    if (_233)
    {
        float _327 = _277 * _181;
        _303 = _327;
    }
    float _329 = _303;
    if (_233)
    {
        float _331 = _277 * _193;
        _313 = _331;
    }
    float _333 = _313;
    bool _335 = !_291;
    float _353;
    if (!_335)
    {
        float _337 = in.m_66.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_123);
        float _359 = 1.0 / _357;
        float _361 = _157 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _363 + _369;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = in.m_66.x;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = _363 + _399;
    float _403 = 1.0 / _387;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _407 = 1.0 / _397;
    float _409 = 1.0 / _393;
    float _411 = _367 * _403;
    bool _413 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _415 = isnan(_363);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -_383;
    float _427 = _425 + 1.0;
    float _429 = _423 * _427;
    float _431 = _371 * _407;
    bool _433 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _435 = isnan(_363);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _445;
    bool _449 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _451 = isnan(_363);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = -_423;
    float _467 = _465 + 1.0;
    float _469 = -_443;
    float _471 = _469 + 1.0;
    float _473 = _401 * _409;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _479;
    float _483 = _459 * _471;
    float _485 = fma(_447, _473, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _487 = fma(_477, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _489 = fma(_481, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _491 = -_459;
    float _493 = _491 + 1.0;
    float _495 = _485 * _483;
    float _497 = _487 * _483;
    float _499 = _489 * _483;
    float _501 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _503 = _443 * _467;
    float _505 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].x, _497);
    float _507 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].y, _499);
    float _509 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].z, _495);
    float _511 = _501 * _389;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _521 = fma(_463, _431, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _523 = fma(_515, _431, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _525 = trunc(_511);
    int _527 = int(_525);
    float _529 = fma(_521, _503, _505);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _535;
    float _539 = fma(_519, _431, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _541;
    float _545 = fma(_523, _503, _507);
    float _547 = fma(_533, _411, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = fma(_537, _411, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _551 = fma(_543, _411, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _553 = fma(_539, _503, _509);
    float _555 = fma(_547, _429, _529);
    float _557 = fma(_549, _429, _545);
    float _559 = fma(_551, _429, _553);
    float _561 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[146].x, _555);
    float _563 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[146].y, _557);
    int _565 = _527 << 4;
    int _567 = _565 + 1712;
    float _569 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[146].z, _559);
    bool _571 = !_405;
    float _587;
    if (!_571)
    {
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _575 = _389 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        float _591 = float(_123);
        float _593 = 1.0 / _591;
        float _595 = _157 * _593;
        _587 = _595;
    }
    _589 = false;
    float _597 = _587;
    float _599 = in.m_68.w;
    float _601 = in.m_70.x;
    float _603 = in.m_70.y;
    float _605 = in.m_70.z;
    float _607 = in.m_53.x;
    float _609 = in.m_53.y;
    float _611 = in.m_53.z;
    float _613 = in.m_72.x;
    float _615 = in.m_72.y;
    float _617 = in.m_72.z;
    float _619 = in.m_64.w;
    float _621 = in.m_62.w;
    float _623 = trunc(_599);
    int _625 = int(_623);
    int _627 = _625 << 5;
    uint _630 = uint(int(uint(_627) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_630)];
    float _632 = as_type<float>(_dmw0.x);
    int _634 = _627 + 4;
    uint _636 = uint(int(uint(_634) >> uint(2)));
    float _638 = as_type<float>(_dmw0.y);
    int _640 = _627 + 8;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    float _644 = as_type<float>(_dmw0.z);
    int _646 = _627 + 12;
    uint _648 = uint(int(uint(_646) >> uint(2)));
    float _650 = as_type<float>(_dmw0.w);
    float _652 = _569 * _605;
    float _654 = _185 * _609;
    float _656 = _563 * _603;
    float _658 = _191 * _609;
    float _660 = _561 * _601;
    float _662 = fma(_183, _607, _654);
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _615);
    float _666 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _668 = fma(_189, _607, _658);
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _613);
    float _672 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _674 = _664 * _666;
    float _676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _617);
    float _678 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _680 = _670 * _672;
    float _682 = _674 * _321;
    float _684 = fma(_193, _611, _668);
    float _686 = _676 * _678;
    float _688 = _674 * _307;
    float _690 = fma(_680, _289, _682);
    float _692 = fma(_187, _611, _662);
    float _694 = _684 + _619;
    float _696 = fma(_680, _281, _688);
    float _698 = fma(_686, _333, _690);
    float _700 = _692 + _621;
    float _702 = _179 * _609;
    float _704 = fma(_686, _325, _696);
    float _706 = _694 + _698;
    float _708 = _674 * _317;
    float _710 = in.m_60.w;
    float _712 = _700 + _704;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _716 = _706 + _714;
    float _718 = fma(_177, _607, _702);
    float _720 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _722 = _712 + _720;
    float _724 = _716 * _716;
    float _726 = fma(_181, _611, _718);
    float _728 = fma(_680, _285, _708);
    bool _730 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _732 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.5);
    bool _738 = _734 || _736;
    float _740 = fma(_722, _722, _724);
    float _742 = sqrt(_740);
    bool _744 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _748 = _744 || _746;
    bool _750 = isnan(0.5);
    bool _752 = _748 || _750;
    float _754 = _726 + _710;
    float _756 = fma(_686, _329, _728);
    float _758 = _754 + _756;
    bool _760 = _742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _762 = _756;
    float _764 = _619;
    float _766 = _680;
    float _768 = _740;
    if (!_760)
    {
        _762 = _712;
    }
    float _770 = _762;
    float _772 = _650 * 2.0;
    float _774 = _632 * 2.0;
    float _776 = _638 * 2.0;
    float _778 = _638 * _638;
    float _780 = _644 * _772;
    float _782 = _638 * _772;
    float _784 = _632 * _772;
    float _786 = _644 * _644;
    float _788 = -_780;
    float _790 = fma(_638, _774, _788);
    float _792 = fma(_638, _774, _780);
    float _794 = fma(_644, _774, _782);
    float _796 = -_782;
    float _798 = fma(_644, _774, _796);
    float _800 = -_784;
    float _802 = fma(_644, _776, _800);
    float _804 = fma(_644, _776, _784);
    float _806 = _632 * _632;
    float _808 = _632;
    float _810 = _638;
    float _812 = _770;
    if (!_760)
    {
        _808 = _706;
    }
    float _814 = _808;
    float _816 = _814;
    if (!_760)
    {
        _810 = _758;
    }
    float _818 = _810;
    bool _820 = !_760;
    float _822 = _818;
    if (!_820)
    {
        float _824 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _828 = _742 + _826;
        float _830 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _832 = rsqrt(_740);
        float _834 = _828 * _824;
        float _836 = _834 * 0.15915493667125701904296875;
        float _838 = _836 * 6.283185482025146484375;
        float _840 = cos(_838);
        float _842 = _836 * 6.283185482025146484375;
        float _844 = sin(_842);
        float _846 = _840 + (-1.0);
        float _848 = _846 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = fma(_844, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _852 = fma(_758, _840, _848);
        float _854 = _832 * _850;
        float _856 = fma(_722, _854, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _858 = fma(_716, _854, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _822 = _852;
        _812 = _856;
        _816 = _858;
    }
    float _860 = _822;
    float _862 = _812;
    float _864 = _816;
    float _866 = -_754;
    float _868 = _866 + _860;
    float _870 = -_700;
    float _872 = _870 + _862;
    float _874 = fma(_778, -2.0, 1.0);
    float _876 = -_694;
    float _878 = _876 + _864;
    float _880 = _868 * _317;
    float _882 = _868 * _285;
    float _884 = fma(_806, -2.0, 1.0);
    float _886 = _868 * _329;
    float _888 = fma(_872, _307, _880);
    float _890 = fma(_786, -2.0, _874);
    float _892 = fma(_872, _281, _882);
    float _894 = fma(_786, -2.0, _884);
    float _896 = fma(_878, _321, _888);
    float _898 = fma(_872, _325, _886);
    float _900 = fma(_878, _289, _892);
    float _902 = fma(_778, -2.0, _884);
    float _904 = _896 * _790;
    float _906 = _896 * _894;
    float _908 = _896 * _804;
    float _910 = fma(_878, _333, _898);
    float _912 = fma(_900, _890, _904);
    float _914 = fma(_900, _792, _906);
    float _916 = fma(_900, _798, _908);
    float _918 = _908;
    if (_752)
    {
        _764 = 1.0;
    }
    float _920 = _764;
    float _922 = fma(_910, _794, _912);
    float _924 = fma(_910, _802, _914);
    float _926 = fma(_910, _902, _916);
    float _928 = _700 + _922;
    float _930 = _754 + _924;
    float _932 = _694 + _926;
    float _934 = _930;
    float _936 = _928;
    float _938 = _932;
    float _940 = _920;
    if (!_738)
    {
        float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _944 = _754 + _942;
        float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _948 = _700 + _946;
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _952 = _944 * _944;
        float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _956 = _694 + _954;
        float _958 = fma(_948, _948, _952);
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _962 = fma(_956, _956, _958);
        float _964 = sqrt(_962);
        float _966 = _950 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _968 = precise::min(_964, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _970 = _968 * _960;
        float _972 = _966 * _970;
        float _974 = fma(_922, _972, _700);
        float _976 = fma(_924, _972, _754);
        float _978 = fma(_926, _972, _694);
        _934 = _976;
        _936 = _974;
        _938 = _978;
    }
    float _980 = _934;
    float _982 = _936;
    float _984 = _938;
    if (!_752)
    {
        float _986 = in.m_74.w;
        int _988 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _990 = _988 == 4;
        bool _992 = _988 == 8;
        bool _994 = _988 == 12;
        int _996 = as_type<int>(_986) << 16;
        int _998 = as_type<int>(_986) << 8;
        int _1000 = as_type<int>(_986) << 24;
        int _1002 = _996 >> 24;
        int _1004 = _998 >> 24;
        int _1006 = as_type<int>(_986) >> 24;
        int _1008 = _1000 >> 24;
        float _1010 = float(_1002);
        float _1012 = float(_1004);
        float _1014 = float(_1006);
        float _1016 = _1010 * 0.0078740157186985015869140625;
        float _1018 = float(_1008);
        float _1020 = _1012 * 0.0078740157186985015869140625;
        float _1022 = _1014 * 0.0078740157186985015869140625;
        float _1024 = precise::min(_1016, 1.0);
        float _1026 = _1018 * 0.0078740157186985015869140625;
        float _1028 = precise::min(_1020, 1.0);
        float _1030 = precise::min(_1022, 1.0);
        float _1032 = precise::min(_1026, 1.0);
        float _1034 = precise::max(_1024, -1.0);
        float _1036 = precise::max(_1028, -1.0);
        float _1038 = precise::max(_1030, -1.0);
        float _1040 = precise::max(_1032, -1.0);
        float _1042 = _1040;
        _918 = as_type<float>(_988);
        if (_990)
        {
            _1042 = _1034;
        }
        float _1044 = _1042;
        float _1046 = _1044;
        if (_992)
        {
            _1046 = _1036;
        }
        float _1048 = _1046;
        float _1050 = _1048;
        if (_994)
        {
            _1050 = _1038;
        }
        float _1052 = _1050;
        float _1054 = abs(_1052);
        float _1056 = (-0.0) + _1054;
        _940 = _1056;
    }
    float _1058 = _940;
    float _1060 = _918;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _980 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1068 = _982 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1072 = _984 + _1070;
    float _1074 = _1064 * _1064;
    bool _1076 = _1058 != 0.0;
    bool _1078 = isnan(_1058);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_1068, _1068, _1074);
    float _1088 = fma(_1072, _1072, _1086);
    float _1090 = rsqrt(_1088);
    float _1092 = sqrt(_1088);
    float _1094 = _1090 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1096 = _1068 * _1094;
    float _1098 = _1072 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _1090;
    float _1116 = _1104;
    float _1118 = _1112;
    float _1120 = _1064;
    if (_1108)
    {
        float _1122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1122;
    }
    float _1124 = _1114;
    if (_1108)
    {
        float _1126 = rsqrt(_1104);
        _1116 = _1126;
    }
    float _1128 = _1116;
    float _1130 = _1128;
    if (_1108)
    {
        float _1132 = _1112 * _1124;
        _1118 = _1132;
    }
    float _1134 = _1118;
    if (_1108)
    {
        float _1136 = _1134 * 0.15915493667125701904296875;
        _766 = _1136;
    }
    float _1138 = _766;
    float _1140 = _1060;
    if (_1108)
    {
        float _1142 = _1138 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        _1140 = _1144;
    }
    float _1146 = _1140;
    float _1148 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1150 = precise::max(0.0, _1148);
    float _1152 = _1072;
    float _1154 = _1150;
    float _1156 = _1148;
    if (_1108)
    {
        float _1158 = _1138 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        _1152 = _1160;
    }
    float _1162 = _1152;
    float _1164 = -_1094;
    float _1166 = -_1150;
    float _1168 = fma(_1064, _1164, _1166);
    float _1170 = _1168;
    if (!_1108)
    {
        _1120 = _1096;
    }
    float _1172 = _1120;
    float _1174 = _1172;
    if (_1108)
    {
        float _1176 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1154 = _1176;
    }
    float _1178 = _1154;
    float _1180 = _1146;
    float _1182 = _1178;
    if (_1108)
    {
        float _1184 = fma(_1146, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1180 = _1184;
    }
    float _1186 = _1180;
    if (_1108)
    {
        float _1188 = _1162 + (-1.0);
        _1156 = _1188;
    }
    float _1190 = _1156;
    float _1192 = _1190;
    if (_1108)
    {
        float _1194 = _1128 * _1186;
        _768 = _1194;
    }
    float _1196 = _768;
    float _1198 = _980 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1200 = _1198;
    if (!_1108)
    {
        _1130 = _1100;
    }
    float _1202 = _1130;
    float _1204 = _1202;
    if (_1108)
    {
        float _1206 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1206;
    }
    float _1208 = _1182;
    if (_1108)
    {
        float _1210 = _1096 * _1196;
        _1174 = _1210;
    }
    float _1212 = _1174;
    if (!_1108)
    {
        _1192 = _1098;
    }
    float _1214 = _1192;
    float _1216 = _1214;
    if (_1108)
    {
        float _1218 = _1098 * _1196;
        _1216 = _1218;
    }
    float _1220 = _1216;
    if (_1108)
    {
        float _1222 = fma(_1168, _1162, _1208);
        _1170 = _1222;
    }
    float _1224 = _1170;
    if (_1108)
    {
        float _1226 = _1212 * _1212;
        _1204 = _1226;
    }
    float _1228 = _1204;
    float _1230 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1232 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1198);
    float _1234 = _1230;
    if (!_1108)
    {
        _1200 = _1102;
    }
    float _1236 = _1200;
    float _1238 = _1236;
    if (_1108)
    {
        float _1240 = _1220 * _1220;
        _1238 = _1240;
    }
    float _1242 = _1238;
    float _1244 = fma(_1224, _1224, _1228);
    float _1246 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1232);
    float _1248 = _980 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1250 = _1244 + _1242;
    float _1252 = _980 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1254 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1258 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1248);
    float _1260 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1252);
    float _1262 = rsqrt(_1250);
    float _1264 = fma(_694, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1266 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1268 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1270 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1258);
    float _1272 = -_1266;
    float _1274 = fma(_1272, _1256, 1.0);
    float _1276 = _980 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1280 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1278);
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1286 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1288 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1276);
    float _1290 = -_1282;
    float _1292 = _1290 + 1.0;
    float _1294 = floor(_1230);
    float _1296 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1288);
    float _1298 = _1262 * _1212;
    float _1300 = _1262 * _1224;
    float _1302 = _1262 * _1220;
    float _1304 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1306 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1308 = abs(_1292);
    float _1310 = log2(_1308);
    float _1312 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1306);
    float _1316 = -_1312;
    float _1318 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1316);
    float _1320 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1314);
    float _1322 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1324 = -_1302;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1318);
    float _1328 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1330 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1320);
    float _1332 = floor(_1264);
    float _1334 = fma(_1326, -0.5, 0.5);
    float _1336 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1328);
    float _1338 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1322);
    float _1340 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1342 = fma(_1326, 0.5, 0.5);
    float _1344 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1336);
    float _1346 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1338);
    float _1348 = 1.0 / _1330;
    float _1350 = -_1294;
    float _1352 = _1230 + _1350;
    float _1354 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1344);
    float _1356 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1346);
    float _1358 = fma(_1342, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1360 = _1300 + 1.0;
    float _1362 = _1294;
    float _1364 = _1330;
    float _1366 = _1356;
    if (_1084)
    {
        _1362 = _1354;
    }
    float _1368 = _1362;
    float _1370 = log2(_1274);
    float _1372 = _1368;
    if (_1084)
    {
        _1234 = _1356;
    }
    float _1374 = _1234;
    float _1376 = -_1332;
    float _1378 = _1264 + _1376;
    float _1380 = _1374;
    if (!_1084)
    {
        _1372 = 0.0;
    }
    float _1382 = _1372;
    float _1384 = fma(_1342, _1358, -0.212114393711090087890625);
    if (!_1084)
    {
        _1380 = 0.0;
    }
    float _1386 = _1380;
    float _1388 = sqrt(_1334);
    float _1390 = _1348 * _1382;
    float _1392 = _1348 * _1386;
    float _1394 = exp2(_1340);
    float _1396 = _1370 * 0.693147182464599609375;
    float2 _4592 = float2(_1352, _1378);
    float _1398 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4592, float2(0.0), isnan(_4592)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4592, float2(0.0), isnan(_4592)), level(0.0)).x;
    float _1400 = fma(_1342, _1384, 1.570728778839111328125);
    float _1402 = fma(_1390, 0.5, 0.5);
    float _1404 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1406 = fma(_1392, -0.5, 0.5);
    float _1408 = _1388 * 0.636619746685028076171875;
    float3 _4618 = float3(_1402, _1406, _1404);
    float _1410 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4618, float3(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4618, float3(0.0), isnan(_4618)), level(0.0)).x;
    float _1412 = -_1400;
    float _1414 = fma(_1408, _1412, 1.0);
    float _1416 = -_1300;
    float _1418 = fma(_1394, _1360, _1416);
    float _1420 = fma(_1418, 0.5, 0.5);
    float3 _4642 = float3(_1402, _1406, _1404);
    float4 _1423 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4642, float3(0.0), isnan(_4642)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4642, float3(0.0), isnan(_4642)), level(0.0)).xyzw;
    float _1425 = _1423.x;
    float _1427 = _1423.y;
    float _1429 = _1423.z;
    float _1431 = _1423.w;
    float2 _4658 = float2(_1414, _1420);
    float3 _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4658, float2(0.0), isnan(_4658)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4658, float2(0.0), isnan(_4658)), level(0.0)).xyz;
    float _1437 = _1435.x;
    float _1439 = _1435.y;
    float _1441 = _1435.z;
    float _1443 = in.m_66.w;
    float _1445 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1447 = in.m_66.y;
    int _1449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1451 = _1449 != 0;
    float _1453 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1445);
    float _1455 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1457 = in.m_76.y;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1461 = _1459 != 0;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1469 = _1467 != 0;
    float _1471 = _1455 * _389;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1475 = _1473 != 0;
    float _1477 = in.m_76.x;
    float _1479 = trunc(_1471);
    int _1481 = int(_1479);
    float _1483 = _1402;
    bool _1485 = _1469;
    if (_1451)
    {
        float _1487 = in.m_66.z;
        _1483 = _1487;
    }
    float _1489 = _1483;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1493 = _1491 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1495 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1453);
    float _1497 = 1.0 / _1465;
    bool _1499 = _1443 > 0.5;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1503 = _1501 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1505;
    bool _1509 = _1447 > 0.5;
    out.m_78.x = _982;
    out.m_78.y = _980;
    out.m_78.z = _984;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1513 = _1511 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1515 = 1.0 / _1493;
    float _1517 = -_1457;
    float _1519 = _1517 + 1.0;
    int _1521 = _1481 << 4;
    int _1523 = _1521 + 1968;
    float _1525 = 0.0;
    bool _1527 = _1499;
    float _1529 = _1457;
    float _1531 = _1477;
    if (!_1461)
    {
        _1525 = _1477;
    }
    float _1533 = _1525;
    float _1535 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    int _1537 = _1523 + 8;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    uint _1541 = uint(int(uint(int(_1539)) >> uint(2)));
    int _1543 = int(_1539) & 3;
    float _1545 = (*spvDescriptorSet0.vp_c9)._m0[int(_1541)][_1543];
    float _1547 = 1.0 / _1513;
    int _1549 = _1499 ? as_type<int>(_1519) : as_type<int>(_1457);
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1553 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1551);
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1555;
    float _1559 = _1533;
    if (_1461)
    {
        bool _1561 = _389 > 0.5;
        _1527 = _1561;
    }
    bool _1563 = _1527;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1567 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1565);
    float _1569 = _1469 ? as_type<float>(_1549) : _1457;
    float _1571 = _1557 * _1497;
    float _1573 = _1503 * _1515;
    if (_1451)
    {
        bool _1575 = _1489 > 0.5;
        _1485 = _1575;
    }
    bool _1577 = _1485;
    uint _1579 = uint(int(uint(_1523) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[int(_1589)][_1591];
    float _1595 = in.m_80.x;
    float _1597 = in.m_80.y;
    float _1599 = in.m_80.z;
    bool _1601 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1603 = isnan(_597);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1609 = _1605 || _1607;
    float _1611 = float(_1609);
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1615 = _597 + _1613;
    if (_1475)
    {
        float _1617 = _1509 ? _1519 : _1457;
        _1529 = _1617;
    }
    float _1619 = _1529;
    float _1621 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1553);
    float _1623 = _1507 * _1547;
    bool _1625 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1627 = isnan(_597);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1633 = _1629 || _1631;
    float _1635 = float(_1633);
    float _1637 = -_1611;
    float _1639 = _1637 + 1.0;
    bool _1641 = _615 != 0.0;
    bool _1643 = isnan(_615);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.0);
    bool _1649 = _1645 || _1647;
    float _1651 = fma(_1571, _1615, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1653 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1655 = isnan(_597);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = -_1635;
    float _1667 = _1665 + 1.0;
    bool _1669 = _613 == 0.0;
    bool _1671 = !_1649;
    bool _1673 = _1669 && _1671;
    float _1675 = _1635 * _1639;
    bool _1677 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1679 = isnan(_597);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    float _1689 = _1663 * _1667;
    bool _1691 = _617 == 0.0;
    bool _1693 = _1691 && _1673;
    float _1695 = -_1663;
    float _1697 = _1695 + 1.0;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1701 = _597 + _1699;
    float _1703 = -_1687;
    float _1705 = _1703 + 1.0;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1709 = _597 + _1707;
    float _1711 = _1687 * _1697;
    float _1713 = fma(_1573, _1701, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1715 = as_type<int>(_1701);
    int _1717 = as_type<int>(_1651);
    float _1719 = _1687;
    float _1721 = _1709;
    float _1723 = _1697;
    if (_1461)
    {
        float _1725 = -_1477;
        float _1727 = _1725 + 1.0;
        _1715 = as_type<int>(_1727);
    }
    int _1729 = _1715;
    float _1731 = fma(_1623, _1709, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1733 = _1651 * _1711;
    float _1735 = as_type<float>(_1729);
    float _1737 = _1733;
    if (_1451)
    {
        float _1739 = -_1477;
        float _1741 = _1739 + 1.0;
        _1717 = as_type<int>(_1741);
    }
    int _1743 = _1717;
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1747 = as_type<float>(_1743);
    if (_1461)
    {
        float _1749 = _1563 ? as_type<float>(_1729) : _1477;
        _1559 = _1749;
    }
    float _1751 = _1559;
    float _1753 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1733);
    if (_1693)
    {
        _1735 = _1597;
    }
    float _1755 = _1735;
    float _1757 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1567);
    float _1759 = _1755;
    if (_1693)
    {
        _1737 = _1599;
    }
    float _1761 = _1737;
    float _1763 = _700 + _1621;
    float _1765 = _1761;
    if (_1693)
    {
        _1719 = _1755;
    }
    float _1767 = _1719;
    float _1769 = _694 + _1757;
    float _1771 = _1767;
    if (!_1693)
    {
        _1759 = _1597;
    }
    float _1773 = _1759;
    float _1775 = _754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1693)
    {
        _1721 = _1595;
    }
    float _1777 = _1721;
    float _1779 = fma(_1713, _1689, _1753);
    float _1781 = _1777;
    float _1783 = _1779;
    if (_1693)
    {
        _1723 = _1761;
    }
    float _1785 = _1723;
    float _1787 = -_1763;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1791 = _1785;
    if (!_1693)
    {
        _1765 = _1599;
    }
    float _1793 = _1765;
    float _1795 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1775);
    if (_1451)
    {
        float _1797 = _1577 ? as_type<float>(_1743) : _1477;
        _1531 = _1797;
    }
    float _1799 = _1531;
    float _1801 = _754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1693)
    {
        _1747 = _1777;
    }
    float _1803 = _1747;
    float _1805 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1795);
    float _1807 = _1803;
    if (!_1693)
    {
        _1781 = _1595;
    }
    float _1809 = _1781;
    float _1811 = _1545 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1813 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1815 = isnan(0.0);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1821 = _1817 || _1819;
    float _1823 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1825 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_1693)
    {
        float _1827 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1809);
        _1807 = _1827;
    }
    float _1829 = _1807;
    float _1831 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1835 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1801);
    float _1837 = _1593 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1839 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1841 = -_1769;
    float _1843 = _1841 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1845 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1835);
    float _1847 = _1837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = fma(_1731, _1675, _1779);
    float _1851 = 1.0 / _1823;
    float _1853 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1821)
    {
        float _1855 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1783 = _1855;
    }
    float _1857 = _1783;
    float _1859 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1861 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_82.x = _1839;
    out.m_82.y = _1847;
    out.m_82.z = _1831;
    float _1863 = precise::min(_1763, _1789);
    float _1865 = _1857;
    if (!_1693)
    {
        float _1867 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1793);
        _1791 = _1867;
    }
    float _1869 = _1791;
    float _1871 = precise::min(_1769, _1843);
    float _1873 = _1853 + _1823;
    float _1875 = _1859 * _1833;
    float _1877 = _1861 * _1745;
    float _1879 = precise::min(_1863, _1871);
    float _1881 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1883 = in.m_84.x;
    float _1885 = in.m_84.y;
    float _1887 = in.m_84.z;
    float _1889 = in.m_84.w;
    float _1891 = _1873 * _1851;
    float _1893 = _1891 * 0.5;
    uint _1895 = uint(int(uint(_567) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[int(_1905)][_1907];
    float _1911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1913 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1917 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1915);
    if (!_1693)
    {
        float _1919 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1773);
        _1771 = _1919;
    }
    float _1921 = _1771;
    float _1923 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1849);
    if (_1821)
    {
        float _1925 = precise::min(_1857, 20.0);
        _1865 = _1925;
    }
    float _1927 = _1865;
    int _1929 = _567 + 8;
    uint _1931 = uint(int(uint(_1929) >> uint(2)));
    uint _1933 = uint(int(uint(int(_1931)) >> uint(2)));
    int _1935 = int(_1931) & 3;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[int(_1933)][_1935];
    float _1939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1941 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1943 = isnan(_1092);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1949 = _1945 || _1947;
    float _1951 = 1.0 / _1917;
    float _1953 = _1881 * _1911;
    float _1955 = _317 * _1885;
    float _1957 = _307 * _1885;
    float _1959 = _321 * _1885;
    float _1961 = _1913 * _1939;
    float _1963 = _1887 * _1809;
    float _1965 = fma(_285, _1883, _1955);
    float _1967 = _1769;
    float _1969 = _1939;
    if (_1821)
    {
        float _1971 = 1.0 / _1927;
        _1967 = _1971;
    }
    float _1973 = _1967;
    float _1975 = fma(_281, _1883, _1957);
    out.m_86.x = _1877;
    out.m_86.y = _1953;
    out.m_86.z = _1961;
    out.m_86.w = _1875;
    float _1977 = fma(_289, _1883, _1959);
    float _1979 = -_1963;
    float _1981 = fma(_1883, _1793, _1979);
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1985 = _1951 * _1983;
    float _1987 = _1883 * _1773;
    float _1989 = _1885 * _1793;
    float _1991 = fma(_325, _1887, _1975);
    float _1993 = fma(_329, _1887, _1965);
    float _1995 = -_1987;
    float _1997 = fma(_1885, _1809, _1995);
    float _1999 = _1981 * _1889;
    float _2001 = fma(_333, _1887, _1977);
    float _2003 = -_1989;
    float _2005 = fma(_1887, _1773, _2003);
    float _2007 = _307 * _1921;
    if (!_1821)
    {
        _1969 = 1.0;
    }
    float _2009 = _1969;
    float _2011 = abs(_1985);
    float _2013 = log2(_2011);
    float _2015 = _2009;
    if (_1821)
    {
        float _2017 = _1879 * _1973;
        float _2019 = precise::clamp(_2017, 0.0, 1.0);
        _2015 = _2019;
    }
    float _2021 = _2015;
    float _2023 = _317 * _1921;
    float _2025 = _321 * _1921;
    float _2027 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2029 = _1999 * _307;
    float _2031 = fma(_281, _1829, _2007);
    float _2033 = fma(_285, _1829, _2023);
    float _2035 = fma(_289, _1829, _2025);
    float _2037 = _2005 * _1889;
    float _2039 = _1999 * _317;
    float _2041 = _1999 * _321;
    float _2043 = _1997 * _1889;
    float _2045 = _1901 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2047 = _1937 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2049 = _1993 * _790;
    float _2051 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2053 = _1993 * _894;
    float _2055 = fma(_2037, _281, _2029);
    float _2057 = _1993 * _804;
    float _2059 = fma(_2037, _285, _2039);
    float _2061 = fma(_2037, _289, _2041);
    float _2063 = exp2(_2051);
    float _2065 = fma(_325, _1869, _2031);
    float _2067 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2069 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2071 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2073 = _1923 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2075 = fma(_1991, _890, _2049);
    float _2077 = fma(_1991, _792, _2053);
    float _2079 = fma(_2043, _325, _2055);
    float _2081 = fma(_329, _1869, _2033);
    float _2083 = fma(_1991, _798, _2057);
    float _2085 = fma(_2043, _329, _2059);
    float _2087 = fma(_333, _1869, _2035);
    float _2089 = fma(_2043, _333, _2061);
    float _2091 = fma(_2001, _794, _2075);
    float _2093 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2095 = precise::clamp(_2093, 0.0, 1.0);
    out.m_88.x = _2067;
    out.m_88.y = _2069;
    out.m_88.z = _2071;
    out.m_88.w = _2073;
    float _2097 = fma(_2001, _802, _2077);
    float _2099 = fma(_2001, _902, _2083);
    float _2101 = fma(_2095, -2.0, 3.0);
    float _2103 = _2095 * _2095;
    float _2105 = _2081 * _894;
    bool _2107 = _1985 <= 8000.0;
    bool _2109 = isnan(_1985);
    bool _2111 = _2107 || _2109;
    bool _2113 = isnan(8000.0);
    bool _2115 = _2111 || _2113;
    float _2117 = float(_2115);
    out.m_90.x = _2091;
    out.m_90.y = _2097;
    out.m_90.z = _2099;
    float _2119 = _2103 * _2101;
    float _2121 = fma(_2065, _792, _2105);
    float _2123 = _2081 * _790;
    float _2125 = _2085 * _790;
    float _2127 = _2085 * _894;
    float _2129 = _2085 * _804;
    float _2131 = fma(_2065, _890, _2123);
    float _2133 = fma(_2079, _890, _2125);
    float _2135 = fma(_2079, _792, _2127);
    float _2137 = fma(_2079, _798, _2129);
    float _2139 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2141 = -_2119;
    float _2143 = _2141 + 1.0;
    float _2145 = fma(_2089, _802, _2135);
    float _2147 = fma(_2089, _794, _2133);
    float _2149 = fma(_2089, _902, _2137);
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2119);
    float _2153 = exp2(_2139);
    float _2155 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1495);
    float _2157 = _2081 * _804;
    float _2159 = in.m_74.x;
    float _2161 = _2117 * _2151;
    float _2163 = _2021 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2165 = fma(_2065, _798, _2157);
    out.m_92.x = _2147;
    out.m_92.y = _2145;
    out.m_92.z = _2149;
    float _2167 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2169 = _2155 + _1330;
    int _2171 = as_type<int>(_2099);
    float _2173 = _2131;
    float _2175 = 0.0;
    float _2177 = _2155;
    if (!_1084)
    {
        float _2179 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _2171 = as_type<int>(_2179);
    }
    int _2181 = _2171;
    out.gl_Position.x = _1354;
    out.gl_Position.y = _1356;
    out.gl_Position.z = _2155;
    out.gl_Position.w = _1330;
    float _2183 = _2169 * 0.5;
    float _2185 = -_2153;
    float _2187 = _2185 + 1.0;
    float _2189 = _2163 * _1058;
    if (!_1084)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5933 = as_type<float>(_2181);
        out.gl_Position.z = _5933;
    }
    float _2191 = fma(_2087, _802, _2121);
    float _2193 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2195 = fma(_2087, _794, _2131);
    float _2197 = fma(_2087, _902, _2165);
    out.m_94.z = _2183;
    out.m_94.w = _1330;
    if (_1084)
    {
        _2173 = _2189;
    }
    float _2199 = _2173;
    float _2201 = _2199;
    if (!_1084)
    {
        _2201 = 0.0;
    }
    float _2203 = _2201;
    float _2205 = -_2193;
    float _2207 = _2205 + 1.0;
    out.m_96.x = _2195;
    out.m_96.y = _2191;
    out.m_96.z = _2197;
    float _2209 = _2207;
    if (!_1949)
    {
        _2175 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2211 = _2175;
    float _2213 = -_1398;
    float _2215 = _2213 + 1.0;
    float _2217 = _2211;
    float _2219 = _2211;
    if (!_1949)
    {
        _1364 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2221 = _1364;
    float _2223 = _2221;
    float _2225 = _2221;
    if (!_1949)
    {
        _2177 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2227 = _2177;
    float _2229 = _2215 * _2167;
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = _2227;
    float _2235 = _2227;
    if (!_1949)
    {
        _1366 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2237 = _1366;
    float _2239 = _2193 * _1410;
    float _2241 = -_2231;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2245 = _2243 * _2159;
    float _2247 = _2245 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2249 = _1431 * _2239;
    float _2251 = _1431 * _2207;
    out.m_98.x = _2247;
    float _2253 = _2249;
    float _2255 = _2237;
    float _2257 = _2237;
    if (!_1949)
    {
        _2209 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2259 = _2209;
    float _2261 = _1441 * _2239;
    float _2263 = fma(_1437, _2249, _1425);
    float _2265 = fma(_1439, _2249, _1427);
    float _2267 = _2259;
    float _2269 = _2259;
    if (!_1949)
    {
        _2253 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2271 = _2253;
    float _2273 = fma(_1431, _2261, _1429);
    out.m_100.x = _2263;
    out.m_100.y = _2265;
    out.m_100.z = _2273;
    out.m_100.w = _2251;
    bool _2275 = !_1949;
    float _2277 = _2271;
    float _2279 = _2271;
    if (!_2275)
    {
        bool _2281 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2283 = isnan(_1092);
        bool _2285 = _2281 || _2283;
        bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2289 = _2285 || _2287;
        if (!_2289)
        {
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = _1092 + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2297 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2295;
            float _2299 = 1.0 / _2297;
            float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2321 = _2293 * _2299;
            float _2323 = precise::clamp(_2321, 0.0, 1.0);
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2329 = fma(_2323, _2303, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2331 = fma(_2323, _2327, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2333 = fma(_2323, _2307, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2335 = fma(_2323, _2311, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2337 = fma(_2323, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2339 = fma(_2323, _2319, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2225 = _2331;
            _2269 = _2337;
            _2219 = _2329;
            _2257 = _2335;
            _2235 = _2333;
            _2279 = _2339;
            _2341 = true;
        }
        else
        {
            bool _2343 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2345 = isnan(_1092);
            bool _2347 = _2343 || _2345;
            bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2351 = _2347 || _2349;
            if (!_2351)
            {
                _2217 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2353 = _2217;
            _2219 = _2353;
            if (!_2351)
            {
                _2223 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2355 = _2223;
            _2225 = _2355;
            if (!_2351)
            {
                _2233 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2357 = _2233;
            _2235 = _2357;
            if (!_2351)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2359 = _2255;
            _2257 = _2359;
            if (!_2351)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2361 = _2267;
            _2269 = _2361;
            if (!_2351)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2363 = _2277;
            bool _2365 = !_2351;
            _2279 = _2363;
            if (!_2365)
            {
                bool _2367 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2369 = isnan(_1092);
                bool _2371 = _2367 || _2369;
                bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2375 = _2371 || _2373;
                if (!_2375)
                {
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = _1092 + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2381;
                    float _2385 = 1.0 / _2383;
                    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2407 = _2379 * _2385;
                    float _2409 = precise::clamp(_2407, 0.0, 1.0);
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2415 = fma(_2409, _2389, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2417 = fma(_2409, _2413, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2419 = fma(_2409, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2421 = fma(_2409, _2397, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2423 = fma(_2409, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2425 = fma(_2409, _2405, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2225 = _2417;
                    _2269 = _2423;
                    _2219 = _2415;
                    _2257 = _2421;
                    _2235 = _2419;
                    _2279 = _2425;
                    _2341 = true;
                }
                else
                {
                    _2225 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2219 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2235 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2341 = false;
    float _2427 = _2225;
    float _2429 = _2269;
    float _2431 = _2219;
    float _2433 = _2257;
    float _2435 = _2235;
    float _2437 = _2279;
    float _2439 = fma(_2191, -0.5, 0.5);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    float _2451 = -_2435;
    float _2453 = _2451 + _2437;
    bool _2455 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2457 = fma(_2441, _2445, _2427);
    float _2459 = fma(_2441, _2449, _2431);
    float _2461 = fma(_2441, _2453, _2435);
    float _2463 = _2203 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2465 = _2457 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _2467 = fma(_2459, 0.298911988735198974609375, _2465);
    out.m_98.w = _2463;
    float _2469 = fma(_2461, 0.114477999508380889892578125, _2467);
    out.m_56.x = 1.0;
    float _2471 = -_2469;
    float _2473 = _2459 + _2471;
    float _2475 = -_2469;
    float _2477 = _2457 + _2475;
    float _2479 = -_2469;
    float _2481 = _2461 + _2479;
    float _2483 = fma(_2473, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2469);
    float _2485 = fma(_2477, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2469);
    float _2487 = fma(_2481, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2469);
    out.m_104.x = _2483;
    out.m_104.y = _2485;
    out.m_104.z = _2487;
    if (!_2455)
    {
        return out;
    }
    float _2489 = -_980;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2493 = -_982;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2497 = -_984;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2501 = _2491 * _2491;
    float _2503 = fma(_2495, _2495, _2501);
    float _2505 = fma(_2499, _2499, _2503);
    float _2507 = sqrt(_2505);
    float _2509 = rsqrt(_2505);
    float _2511 = -_2507;
    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2515 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = _2495 * _2509;
    float _2521 = _2491 * _2509;
    float _2523 = abs(_2517);
    float _2525 = log2(_2523);
    float _2527 = _2499 * _2509;
    float _2529 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2531 = _2191 * _2521;
    float _2533 = -_2521;
    float _2535 = -_2529;
    float _2537 = fma(_2533, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2535);
    float _2539 = fma(_2195, _2519, _2531);
    float _2541 = -_2527;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2537);
    float _2545 = fma(_2197, _2527, _2539);
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2551 = _2543 + _2549;
    float _2553 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2555 = _2551 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = exp2(_2553);
    float _2561 = _2559 * _2557;
    float _2563 = _2547 * _2561;
    float _2565 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2567 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2569 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _2565;
    out.m_102.y = _2567;
    out.m_102.z = _2569;
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
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2341 = false;
    bool _589 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_53.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_56.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2626 = as_type<float>(_139);
        out.gl_Position.z = _2626;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_58.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = 0.0;
    if (_153)
    {
        float _161 = float(_123);
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _133;
    if (_169)
    {
        out.m_56.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2694 = as_type<float>(_175);
        out.gl_Position.z = _2694;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = _177 * _177;
    float _197 = _179 * _179;
    float _199 = _181 * _181;
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = sqrt(_207);
    float _215 = sqrt(_209);
    float _217 = sqrt(_211);
    bool _219 = _213 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = _215;
    if (_219)
    {
        float _225 = rsqrt(_207);
        _223 = _225;
    }
    float _227 = _223;
    float _229 = 0.0;
    if (!_219)
    {
        _229 = 0.0;
    }
    float _231 = _229;
    bool _233 = _217 > 0.0;
    float _235 = 0.0;
    float _237 = _231;
    if (!_219)
    {
        _235 = 0.0;
    }
    float _239 = _235;
    float _241 = 0.0;
    float _243 = _239;
    if (!_219)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = _217;
    float _249 = _245;
    if (_221)
    {
        float _251 = rsqrt(_209);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_221)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_221)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (!_221)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = _213;
    float _273 = _269;
    if (_233)
    {
        float _275 = rsqrt(_211);
        _271 = _275;
    }
    float _277 = _271;
    if (_219)
    {
        float _279 = _227 * _183;
        _237 = _279;
    }
    float _281 = _237;
    if (_219)
    {
        float _283 = _227 * _177;
        _243 = _283;
    }
    float _285 = _243;
    if (_219)
    {
        float _287 = _227 * _189;
        _249 = _287;
    }
    float _289 = _249;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _293 = 0.0;
    if (!_233)
    {
        _293 = 0.0;
    }
    float _295 = _293;
    float _297 = 0.0;
    float _299 = _295;
    if (!_233)
    {
        _297 = 0.0;
    }
    float _301 = _297;
    float _303 = _301;
    if (_221)
    {
        float _305 = _253 * _185;
        _261 = _305;
    }
    float _307 = _261;
    float _309 = 0.0;
    if (!_233)
    {
        _309 = 0.0;
    }
    float _311 = _309;
    float _313 = _311;
    if (_221)
    {
        float _315 = _253 * _179;
        _267 = _315;
    }
    float _317 = _267;
    if (_221)
    {
        float _319 = _253 * _191;
        _273 = _319;
    }
    float _321 = _273;
    if (_233)
    {
        float _323 = _277 * _187;
        _299 = _323;
    }
    float _325 = _299;
    if (_233)
    {
        float _327 = _277 * _181;
        _303 = _327;
    }
    float _329 = _303;
    if (_233)
    {
        float _331 = _277 * _193;
        _313 = _331;
    }
    float _333 = _313;
    bool _335 = !_291;
    float _353;
    if (!_335)
    {
        float _337 = in.m_66.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_123);
        float _359 = 1.0 / _357;
        float _361 = _157 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _363 + _369;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = in.m_66.x;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _401 = _363 + _399;
    float _403 = 1.0 / _387;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _407 = 1.0 / _397;
    float _409 = 1.0 / _393;
    float _411 = _367 * _403;
    bool _413 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _415 = isnan(_363);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -_383;
    float _427 = _425 + 1.0;
    float _429 = _423 * _427;
    float _431 = _371 * _407;
    bool _433 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _435 = isnan(_363);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _445;
    bool _449 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _451 = isnan(_363);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = -_423;
    float _467 = _465 + 1.0;
    float _469 = -_443;
    float _471 = _469 + 1.0;
    float _473 = _401 * _409;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _479;
    float _483 = _459 * _471;
    float _485 = fma(_447, _473, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _487 = fma(_477, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _489 = fma(_481, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _491 = -_459;
    float _493 = _491 + 1.0;
    float _495 = _485 * _483;
    float _497 = _487 * _483;
    float _499 = _489 * _483;
    float _501 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _503 = _443 * _467;
    float _505 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].x, _497);
    float _507 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].y, _499);
    float _509 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[143].z, _495);
    float _511 = _501 * _389;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _521 = fma(_463, _431, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _523 = fma(_515, _431, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _525 = trunc(_511);
    int _527 = int(_525);
    float _529 = fma(_521, _503, _505);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _535;
    float _539 = fma(_519, _431, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _541;
    float _545 = fma(_523, _503, _507);
    float _547 = fma(_533, _411, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = fma(_537, _411, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _551 = fma(_543, _411, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _553 = fma(_539, _503, _509);
    float _555 = fma(_547, _429, _529);
    float _557 = fma(_549, _429, _545);
    float _559 = fma(_551, _429, _553);
    float _561 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[146].x, _555);
    float _563 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[146].y, _557);
    int _565 = _527 << 4;
    int _567 = _565 + 1712;
    float _569 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[146].z, _559);
    bool _571 = !_405;
    float _587;
    if (!_571)
    {
        float _573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _575 = _389 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _579 = _577 * _573;
        float _581 = floor(_579);
        float _583 = -_581;
        float _585 = _579 + _583;
        _587 = _585;
        _589 = true;
    }
    else
    {
        float _591 = float(_123);
        float _593 = 1.0 / _591;
        float _595 = _157 * _593;
        _587 = _595;
    }
    _589 = false;
    float _597 = _587;
    float _599 = in.m_68.w;
    float _601 = in.m_70.x;
    float _603 = in.m_70.y;
    float _605 = in.m_70.z;
    float _607 = in.m_53.x;
    float _609 = in.m_53.y;
    float _611 = in.m_53.z;
    float _613 = in.m_72.x;
    float _615 = in.m_72.y;
    float _617 = in.m_72.z;
    float _619 = in.m_64.w;
    float _621 = in.m_62.w;
    float _623 = trunc(_599);
    int _625 = int(_623);
    int _627 = _625 << 5;
    uint _630 = uint(int(uint(_627) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_630)];
    float _632 = as_type<float>(_dmw0.x);
    int _634 = _627 + 4;
    uint _636 = uint(int(uint(_634) >> uint(2)));
    float _638 = as_type<float>(_dmw0.y);
    int _640 = _627 + 8;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    float _644 = as_type<float>(_dmw0.z);
    int _646 = _627 + 12;
    uint _648 = uint(int(uint(_646) >> uint(2)));
    float _650 = as_type<float>(_dmw0.w);
    float _652 = _569 * _605;
    float _654 = _185 * _609;
    float _656 = _563 * _603;
    float _658 = _191 * _609;
    float _660 = _561 * _601;
    float _662 = fma(_183, _607, _654);
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _615);
    float _666 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _668 = fma(_189, _607, _658);
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _613);
    float _672 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _674 = _664 * _666;
    float _676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _617);
    float _678 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _680 = _670 * _672;
    float _682 = _674 * _321;
    float _684 = fma(_193, _611, _668);
    float _686 = _676 * _678;
    float _688 = _674 * _307;
    float _690 = fma(_680, _289, _682);
    float _692 = fma(_187, _611, _662);
    float _694 = _684 + _619;
    float _696 = fma(_680, _281, _688);
    float _698 = fma(_686, _333, _690);
    float _700 = _692 + _621;
    float _702 = _179 * _609;
    float _704 = fma(_686, _325, _696);
    float _706 = _694 + _698;
    float _708 = _674 * _317;
    float _710 = in.m_60.w;
    float _712 = _700 + _704;
    float _714 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _716 = _706 + _714;
    float _718 = fma(_177, _607, _702);
    float _720 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _722 = _712 + _720;
    float _724 = _716 * _716;
    float _726 = fma(_181, _611, _718);
    float _728 = fma(_680, _285, _708);
    bool _730 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _732 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.5);
    bool _738 = _734 || _736;
    float _740 = fma(_722, _722, _724);
    float _742 = sqrt(_740);
    bool _744 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _748 = _744 || _746;
    bool _750 = isnan(0.5);
    bool _752 = _748 || _750;
    float _754 = _726 + _710;
    float _756 = fma(_686, _329, _728);
    float _758 = _754 + _756;
    bool _760 = _742 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _762 = _756;
    float _764 = _619;
    float _766 = _680;
    float _768 = _740;
    if (!_760)
    {
        _762 = _712;
    }
    float _770 = _762;
    float _772 = _650 * 2.0;
    float _774 = _632 * 2.0;
    float _776 = _638 * 2.0;
    float _778 = _638 * _638;
    float _780 = _644 * _772;
    float _782 = _638 * _772;
    float _784 = _632 * _772;
    float _786 = _644 * _644;
    float _788 = -_780;
    float _790 = fma(_638, _774, _788);
    float _792 = fma(_638, _774, _780);
    float _794 = fma(_644, _774, _782);
    float _796 = -_782;
    float _798 = fma(_644, _774, _796);
    float _800 = -_784;
    float _802 = fma(_644, _776, _800);
    float _804 = fma(_644, _776, _784);
    float _806 = _632 * _632;
    float _808 = _632;
    float _810 = _638;
    float _812 = _770;
    if (!_760)
    {
        _808 = _706;
    }
    float _814 = _808;
    float _816 = _814;
    if (!_760)
    {
        _810 = _758;
    }
    float _818 = _810;
    bool _820 = !_760;
    float _822 = _818;
    if (!_820)
    {
        float _824 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _828 = _742 + _826;
        float _830 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _832 = rsqrt(_740);
        float _834 = _828 * _824;
        float _836 = _834 * 0.15915493667125701904296875;
        float _838 = _836 * 6.283185482025146484375;
        float _840 = cos(_838);
        float _842 = _836 * 6.283185482025146484375;
        float _844 = sin(_842);
        float _846 = _840 + (-1.0);
        float _848 = _846 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = fma(_844, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _852 = fma(_758, _840, _848);
        float _854 = _832 * _850;
        float _856 = fma(_722, _854, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _858 = fma(_716, _854, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _822 = _852;
        _812 = _856;
        _816 = _858;
    }
    float _860 = _822;
    float _862 = _812;
    float _864 = _816;
    float _866 = -_754;
    float _868 = _866 + _860;
    float _870 = -_700;
    float _872 = _870 + _862;
    float _874 = fma(_778, -2.0, 1.0);
    float _876 = -_694;
    float _878 = _876 + _864;
    float _880 = _868 * _317;
    float _882 = _868 * _285;
    float _884 = fma(_806, -2.0, 1.0);
    float _886 = _868 * _329;
    float _888 = fma(_872, _307, _880);
    float _890 = fma(_786, -2.0, _874);
    float _892 = fma(_872, _281, _882);
    float _894 = fma(_786, -2.0, _884);
    float _896 = fma(_878, _321, _888);
    float _898 = fma(_872, _325, _886);
    float _900 = fma(_878, _289, _892);
    float _902 = fma(_778, -2.0, _884);
    float _904 = _896 * _790;
    float _906 = _896 * _894;
    float _908 = _896 * _804;
    float _910 = fma(_878, _333, _898);
    float _912 = fma(_900, _890, _904);
    float _914 = fma(_900, _792, _906);
    float _916 = fma(_900, _798, _908);
    float _918 = _908;
    if (_752)
    {
        _764 = 1.0;
    }
    float _920 = _764;
    float _922 = fma(_910, _794, _912);
    float _924 = fma(_910, _802, _914);
    float _926 = fma(_910, _902, _916);
    float _928 = _700 + _922;
    float _930 = _754 + _924;
    float _932 = _694 + _926;
    float _934 = _930;
    float _936 = _928;
    float _938 = _932;
    float _940 = _920;
    if (!_738)
    {
        float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _944 = _754 + _942;
        float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _948 = _700 + _946;
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _952 = _944 * _944;
        float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _956 = _694 + _954;
        float _958 = fma(_948, _948, _952);
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _962 = fma(_956, _956, _958);
        float _964 = sqrt(_962);
        float _966 = _950 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _968 = precise::min(_964, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _970 = _968 * _960;
        float _972 = _966 * _970;
        float _974 = fma(_922, _972, _700);
        float _976 = fma(_924, _972, _754);
        float _978 = fma(_926, _972, _694);
        _934 = _976;
        _936 = _974;
        _938 = _978;
    }
    float _980 = _934;
    float _982 = _936;
    float _984 = _938;
    if (!_752)
    {
        float _986 = in.m_74.w;
        int _988 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _990 = _988 == 4;
        bool _992 = _988 == 8;
        bool _994 = _988 == 12;
        int _996 = as_type<int>(_986) << 16;
        int _998 = as_type<int>(_986) << 8;
        int _1000 = as_type<int>(_986) << 24;
        int _1002 = _996 >> 24;
        int _1004 = _998 >> 24;
        int _1006 = as_type<int>(_986) >> 24;
        int _1008 = _1000 >> 24;
        float _1010 = float(_1002);
        float _1012 = float(_1004);
        float _1014 = float(_1006);
        float _1016 = _1010 * 0.0078740157186985015869140625;
        float _1018 = float(_1008);
        float _1020 = _1012 * 0.0078740157186985015869140625;
        float _1022 = _1014 * 0.0078740157186985015869140625;
        float _1024 = precise::min(_1016, 1.0);
        float _1026 = _1018 * 0.0078740157186985015869140625;
        float _1028 = precise::min(_1020, 1.0);
        float _1030 = precise::min(_1022, 1.0);
        float _1032 = precise::min(_1026, 1.0);
        float _1034 = precise::max(_1024, -1.0);
        float _1036 = precise::max(_1028, -1.0);
        float _1038 = precise::max(_1030, -1.0);
        float _1040 = precise::max(_1032, -1.0);
        float _1042 = _1040;
        _918 = as_type<float>(_988);
        if (_990)
        {
            _1042 = _1034;
        }
        float _1044 = _1042;
        float _1046 = _1044;
        if (_992)
        {
            _1046 = _1036;
        }
        float _1048 = _1046;
        float _1050 = _1048;
        if (_994)
        {
            _1050 = _1038;
        }
        float _1052 = _1050;
        float _1054 = abs(_1052);
        float _1056 = (-0.0) + _1054;
        _940 = _1056;
    }
    float _1058 = _940;
    float _1060 = _918;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _980 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1068 = _982 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1072 = _984 + _1070;
    float _1074 = _1064 * _1064;
    bool _1076 = _1058 != 0.0;
    bool _1078 = isnan(_1058);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_1068, _1068, _1074);
    float _1088 = fma(_1072, _1072, _1086);
    float _1090 = rsqrt(_1088);
    float _1092 = sqrt(_1088);
    float _1094 = _1090 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1096 = _1068 * _1094;
    float _1098 = _1072 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _1090;
    float _1116 = _1104;
    float _1118 = _1112;
    float _1120 = _1064;
    if (_1108)
    {
        float _1122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1122;
    }
    float _1124 = _1114;
    if (_1108)
    {
        float _1126 = rsqrt(_1104);
        _1116 = _1126;
    }
    float _1128 = _1116;
    float _1130 = _1128;
    if (_1108)
    {
        float _1132 = _1112 * _1124;
        _1118 = _1132;
    }
    float _1134 = _1118;
    if (_1108)
    {
        float _1136 = _1134 * 0.15915493667125701904296875;
        _766 = _1136;
    }
    float _1138 = _766;
    float _1140 = _1060;
    if (_1108)
    {
        float _1142 = _1138 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        _1140 = _1144;
    }
    float _1146 = _1140;
    float _1148 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1150 = precise::max(0.0, _1148);
    float _1152 = _1072;
    float _1154 = _1150;
    float _1156 = _1148;
    if (_1108)
    {
        float _1158 = _1138 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        _1152 = _1160;
    }
    float _1162 = _1152;
    float _1164 = -_1094;
    float _1166 = -_1150;
    float _1168 = fma(_1064, _1164, _1166);
    float _1170 = _1168;
    if (!_1108)
    {
        _1120 = _1096;
    }
    float _1172 = _1120;
    float _1174 = _1172;
    if (_1108)
    {
        float _1176 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1154 = _1176;
    }
    float _1178 = _1154;
    float _1180 = _1146;
    float _1182 = _1178;
    if (_1108)
    {
        float _1184 = fma(_1146, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1180 = _1184;
    }
    float _1186 = _1180;
    if (_1108)
    {
        float _1188 = _1162 + (-1.0);
        _1156 = _1188;
    }
    float _1190 = _1156;
    float _1192 = _1190;
    if (_1108)
    {
        float _1194 = _1128 * _1186;
        _768 = _1194;
    }
    float _1196 = _768;
    float _1198 = _980 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1200 = _1198;
    if (!_1108)
    {
        _1130 = _1100;
    }
    float _1202 = _1130;
    float _1204 = _1202;
    if (_1108)
    {
        float _1206 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1206;
    }
    float _1208 = _1182;
    if (_1108)
    {
        float _1210 = _1096 * _1196;
        _1174 = _1210;
    }
    float _1212 = _1174;
    if (!_1108)
    {
        _1192 = _1098;
    }
    float _1214 = _1192;
    float _1216 = _1214;
    if (_1108)
    {
        float _1218 = _1098 * _1196;
        _1216 = _1218;
    }
    float _1220 = _1216;
    if (_1108)
    {
        float _1222 = fma(_1168, _1162, _1208);
        _1170 = _1222;
    }
    float _1224 = _1170;
    if (_1108)
    {
        float _1226 = _1212 * _1212;
        _1204 = _1226;
    }
    float _1228 = _1204;
    float _1230 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1232 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1198);
    float _1234 = _1230;
    if (!_1108)
    {
        _1200 = _1102;
    }
    float _1236 = _1200;
    float _1238 = _1236;
    if (_1108)
    {
        float _1240 = _1220 * _1220;
        _1238 = _1240;
    }
    float _1242 = _1238;
    float _1244 = fma(_1224, _1224, _1228);
    float _1246 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1232);
    float _1248 = _980 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1250 = _1244 + _1242;
    float _1252 = _980 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1254 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1258 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1248);
    float _1260 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1252);
    float _1262 = rsqrt(_1250);
    float _1264 = fma(_694, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1266 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1268 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1270 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1258);
    float _1272 = -_1266;
    float _1274 = fma(_1272, _1256, 1.0);
    float _1276 = _980 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1280 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1278);
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1286 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1288 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1276);
    float _1290 = -_1282;
    float _1292 = _1290 + 1.0;
    float _1294 = floor(_1230);
    float _1296 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1288);
    float _1298 = _1262 * _1212;
    float _1300 = _1262 * _1224;
    float _1302 = _1262 * _1220;
    float _1304 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1306 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1308 = abs(_1292);
    float _1310 = log2(_1308);
    float _1312 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1306);
    float _1316 = -_1312;
    float _1318 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1316);
    float _1320 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1314);
    float _1322 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1324 = -_1302;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1318);
    float _1328 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1330 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1320);
    float _1332 = floor(_1264);
    float _1334 = fma(_1326, -0.5, 0.5);
    float _1336 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1328);
    float _1338 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1322);
    float _1340 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1342 = fma(_1326, 0.5, 0.5);
    float _1344 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1336);
    float _1346 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1338);
    float _1348 = 1.0 / _1330;
    float _1350 = -_1294;
    float _1352 = _1230 + _1350;
    float _1354 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1344);
    float _1356 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1346);
    float _1358 = fma(_1342, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1360 = _1300 + 1.0;
    float _1362 = _1294;
    float _1364 = _1330;
    float _1366 = _1356;
    if (_1084)
    {
        _1362 = _1354;
    }
    float _1368 = _1362;
    float _1370 = log2(_1274);
    float _1372 = _1368;
    if (_1084)
    {
        _1234 = _1356;
    }
    float _1374 = _1234;
    float _1376 = -_1332;
    float _1378 = _1264 + _1376;
    float _1380 = _1374;
    if (!_1084)
    {
        _1372 = 0.0;
    }
    float _1382 = _1372;
    float _1384 = fma(_1342, _1358, -0.212114393711090087890625);
    if (!_1084)
    {
        _1380 = 0.0;
    }
    float _1386 = _1380;
    float _1388 = sqrt(_1334);
    float _1390 = _1348 * _1382;
    float _1392 = _1348 * _1386;
    float _1394 = exp2(_1340);
    float _1396 = _1370 * 0.693147182464599609375;
    float2 _4592 = float2(_1352, _1378);
    float _1398 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4592, float2(0.0), isnan(_4592)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4592, float2(0.0), isnan(_4592)), level(0.0)).x;
    float _1400 = fma(_1342, _1384, 1.570728778839111328125);
    float _1402 = fma(_1390, 0.5, 0.5);
    float _1404 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1406 = fma(_1392, -0.5, 0.5);
    float _1408 = _1388 * 0.636619746685028076171875;
    float3 _4618 = float3(_1402, _1406, _1404);
    float _1410 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4618, float3(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4618, float3(0.0), isnan(_4618)), level(0.0)).x;
    float _1412 = -_1400;
    float _1414 = fma(_1408, _1412, 1.0);
    float _1416 = -_1300;
    float _1418 = fma(_1394, _1360, _1416);
    float _1420 = fma(_1418, 0.5, 0.5);
    float3 _4642 = float3(_1402, _1406, _1404);
    float4 _1423 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4642, float3(0.0), isnan(_4642)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4642, float3(0.0), isnan(_4642)), level(0.0)).xyzw;
    float _1425 = _1423.x;
    float _1427 = _1423.y;
    float _1429 = _1423.z;
    float _1431 = _1423.w;
    float2 _4658 = float2(_1414, _1420);
    float3 _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4658, float2(0.0), isnan(_4658)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4658, float2(0.0), isnan(_4658)), level(0.0)).xyz;
    float _1437 = _1435.x;
    float _1439 = _1435.y;
    float _1441 = _1435.z;
    float _1443 = in.m_66.w;
    float _1445 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1447 = in.m_66.y;
    int _1449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1451 = _1449 != 0;
    float _1453 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1445);
    float _1455 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1457 = in.m_76.y;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1461 = _1459 != 0;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1469 = _1467 != 0;
    float _1471 = _1455 * _389;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1475 = _1473 != 0;
    float _1477 = in.m_76.x;
    float _1479 = trunc(_1471);
    int _1481 = int(_1479);
    float _1483 = _1402;
    bool _1485 = _1469;
    if (_1451)
    {
        float _1487 = in.m_66.z;
        _1483 = _1487;
    }
    float _1489 = _1483;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1493 = _1491 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1495 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1453);
    float _1497 = 1.0 / _1465;
    bool _1499 = _1443 > 0.5;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1503 = _1501 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1505;
    bool _1509 = _1447 > 0.5;
    out.m_78.x = _982;
    out.m_78.y = _980;
    out.m_78.z = _984;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1513 = _1511 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1515 = 1.0 / _1493;
    float _1517 = -_1457;
    float _1519 = _1517 + 1.0;
    int _1521 = _1481 << 4;
    int _1523 = _1521 + 1968;
    float _1525 = 0.0;
    bool _1527 = _1499;
    float _1529 = _1457;
    float _1531 = _1477;
    if (!_1461)
    {
        _1525 = _1477;
    }
    float _1533 = _1525;
    float _1535 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    int _1537 = _1523 + 8;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    uint _1541 = uint(int(uint(int(_1539)) >> uint(2)));
    int _1543 = int(_1539) & 3;
    float _1545 = (*spvDescriptorSet0.vp_c9)._m0[int(_1541)][_1543];
    float _1547 = 1.0 / _1513;
    int _1549 = _1499 ? as_type<int>(_1519) : as_type<int>(_1457);
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1553 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1551);
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1555;
    float _1559 = _1533;
    if (_1461)
    {
        bool _1561 = _389 > 0.5;
        _1527 = _1561;
    }
    bool _1563 = _1527;
    float _1565 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1567 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1565);
    float _1569 = _1469 ? as_type<float>(_1549) : _1457;
    float _1571 = _1557 * _1497;
    float _1573 = _1503 * _1515;
    if (_1451)
    {
        bool _1575 = _1489 > 0.5;
        _1485 = _1575;
    }
    bool _1577 = _1485;
    uint _1579 = uint(int(uint(_1523) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[int(_1589)][_1591];
    float _1595 = in.m_80.x;
    float _1597 = in.m_80.y;
    float _1599 = in.m_80.z;
    bool _1601 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1603 = isnan(_597);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1609 = _1605 || _1607;
    float _1611 = float(_1609);
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1615 = _597 + _1613;
    if (_1475)
    {
        float _1617 = _1509 ? _1519 : _1457;
        _1529 = _1617;
    }
    float _1619 = _1529;
    float _1621 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1553);
    float _1623 = _1507 * _1547;
    bool _1625 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1627 = isnan(_597);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1633 = _1629 || _1631;
    float _1635 = float(_1633);
    float _1637 = -_1611;
    float _1639 = _1637 + 1.0;
    bool _1641 = _615 != 0.0;
    bool _1643 = isnan(_615);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.0);
    bool _1649 = _1645 || _1647;
    float _1651 = fma(_1571, _1615, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1653 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1655 = isnan(_597);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = -_1635;
    float _1667 = _1665 + 1.0;
    bool _1669 = _613 == 0.0;
    bool _1671 = !_1649;
    bool _1673 = _1669 && _1671;
    float _1675 = _1635 * _1639;
    bool _1677 = _597 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1679 = isnan(_597);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    float _1689 = _1663 * _1667;
    bool _1691 = _617 == 0.0;
    bool _1693 = _1691 && _1673;
    float _1695 = -_1663;
    float _1697 = _1695 + 1.0;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1701 = _597 + _1699;
    float _1703 = -_1687;
    float _1705 = _1703 + 1.0;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1709 = _597 + _1707;
    float _1711 = _1687 * _1697;
    float _1713 = fma(_1573, _1701, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1715 = as_type<int>(_1701);
    int _1717 = as_type<int>(_1651);
    float _1719 = _1687;
    float _1721 = _1709;
    float _1723 = _1697;
    if (_1461)
    {
        float _1725 = -_1477;
        float _1727 = _1725 + 1.0;
        _1715 = as_type<int>(_1727);
    }
    int _1729 = _1715;
    float _1731 = fma(_1623, _1709, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1733 = _1651 * _1711;
    float _1735 = as_type<float>(_1729);
    float _1737 = _1733;
    if (_1451)
    {
        float _1739 = -_1477;
        float _1741 = _1739 + 1.0;
        _1717 = as_type<int>(_1741);
    }
    int _1743 = _1717;
    float _1745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1747 = as_type<float>(_1743);
    if (_1461)
    {
        float _1749 = _1563 ? as_type<float>(_1729) : _1477;
        _1559 = _1749;
    }
    float _1751 = _1559;
    float _1753 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1733);
    if (_1693)
    {
        _1735 = _1597;
    }
    float _1755 = _1735;
    float _1757 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1567);
    float _1759 = _1755;
    if (_1693)
    {
        _1737 = _1599;
    }
    float _1761 = _1737;
    float _1763 = _700 + _1621;
    float _1765 = _1761;
    if (_1693)
    {
        _1719 = _1755;
    }
    float _1767 = _1719;
    float _1769 = _694 + _1757;
    float _1771 = _1767;
    if (!_1693)
    {
        _1759 = _1597;
    }
    float _1773 = _1759;
    float _1775 = _754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1693)
    {
        _1721 = _1595;
    }
    float _1777 = _1721;
    float _1779 = fma(_1713, _1689, _1753);
    float _1781 = _1777;
    float _1783 = _1779;
    if (_1693)
    {
        _1723 = _1761;
    }
    float _1785 = _1723;
    float _1787 = -_1763;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1791 = _1785;
    if (!_1693)
    {
        _1765 = _1599;
    }
    float _1793 = _1765;
    float _1795 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1775);
    if (_1451)
    {
        float _1797 = _1577 ? as_type<float>(_1743) : _1477;
        _1531 = _1797;
    }
    float _1799 = _1531;
    float _1801 = _754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1693)
    {
        _1747 = _1777;
    }
    float _1803 = _1747;
    float _1805 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1795);
    float _1807 = _1803;
    if (!_1693)
    {
        _1781 = _1595;
    }
    float _1809 = _1781;
    float _1811 = _1545 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1813 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1815 = isnan(0.0);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1821 = _1817 || _1819;
    float _1823 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1825 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_1693)
    {
        float _1827 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1809);
        _1807 = _1827;
    }
    float _1829 = _1807;
    float _1831 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1835 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1801);
    float _1837 = _1593 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1839 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1841 = -_1769;
    float _1843 = _1841 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1845 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1835);
    float _1847 = _1837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = fma(_1731, _1675, _1779);
    float _1851 = 1.0 / _1823;
    float _1853 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1821)
    {
        float _1855 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1783 = _1855;
    }
    float _1857 = _1783;
    float _1859 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1861 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_82.x = _1839;
    out.m_82.y = _1847;
    out.m_82.z = _1831;
    float _1863 = precise::min(_1763, _1789);
    float _1865 = _1857;
    if (!_1693)
    {
        float _1867 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1793);
        _1791 = _1867;
    }
    float _1869 = _1791;
    float _1871 = precise::min(_1769, _1843);
    float _1873 = _1853 + _1823;
    float _1875 = _1859 * _1833;
    float _1877 = _1861 * _1745;
    float _1879 = precise::min(_1863, _1871);
    float _1881 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1883 = in.m_84.x;
    float _1885 = in.m_84.y;
    float _1887 = in.m_84.z;
    float _1889 = in.m_84.w;
    float _1891 = _1873 * _1851;
    float _1893 = _1891 * 0.5;
    uint _1895 = uint(int(uint(_567) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[int(_1905)][_1907];
    float _1911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1913 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1917 = fma(_1893, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1915);
    if (!_1693)
    {
        float _1919 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1773);
        _1771 = _1919;
    }
    float _1921 = _1771;
    float _1923 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1849);
    if (_1821)
    {
        float _1925 = precise::min(_1857, 20.0);
        _1865 = _1925;
    }
    float _1927 = _1865;
    int _1929 = _567 + 8;
    uint _1931 = uint(int(uint(_1929) >> uint(2)));
    uint _1933 = uint(int(uint(int(_1931)) >> uint(2)));
    int _1935 = int(_1931) & 3;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[int(_1933)][_1935];
    float _1939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1941 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1943 = isnan(_1092);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1949 = _1945 || _1947;
    float _1951 = 1.0 / _1917;
    float _1953 = _1881 * _1911;
    float _1955 = _317 * _1885;
    float _1957 = _307 * _1885;
    float _1959 = _321 * _1885;
    float _1961 = _1913 * _1939;
    float _1963 = _1887 * _1809;
    float _1965 = fma(_285, _1883, _1955);
    float _1967 = _1769;
    float _1969 = _1939;
    if (_1821)
    {
        float _1971 = 1.0 / _1927;
        _1967 = _1971;
    }
    float _1973 = _1967;
    float _1975 = fma(_281, _1883, _1957);
    out.m_86.x = _1877;
    out.m_86.y = _1953;
    out.m_86.z = _1961;
    out.m_86.w = _1875;
    float _1977 = fma(_289, _1883, _1959);
    float _1979 = -_1963;
    float _1981 = fma(_1883, _1793, _1979);
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1985 = _1951 * _1983;
    float _1987 = _1883 * _1773;
    float _1989 = _1885 * _1793;
    float _1991 = fma(_325, _1887, _1975);
    float _1993 = fma(_329, _1887, _1965);
    float _1995 = -_1987;
    float _1997 = fma(_1885, _1809, _1995);
    float _1999 = _1981 * _1889;
    float _2001 = fma(_333, _1887, _1977);
    float _2003 = -_1989;
    float _2005 = fma(_1887, _1773, _2003);
    float _2007 = _307 * _1921;
    if (!_1821)
    {
        _1969 = 1.0;
    }
    float _2009 = _1969;
    float _2011 = abs(_1985);
    float _2013 = log2(_2011);
    float _2015 = _2009;
    if (_1821)
    {
        float _2017 = _1879 * _1973;
        float _2019 = precise::clamp(_2017, 0.0, 1.0);
        _2015 = _2019;
    }
    float _2021 = _2015;
    float _2023 = _317 * _1921;
    float _2025 = _321 * _1921;
    float _2027 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2029 = _1999 * _307;
    float _2031 = fma(_281, _1829, _2007);
    float _2033 = fma(_285, _1829, _2023);
    float _2035 = fma(_289, _1829, _2025);
    float _2037 = _2005 * _1889;
    float _2039 = _1999 * _317;
    float _2041 = _1999 * _321;
    float _2043 = _1997 * _1889;
    float _2045 = _1901 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2047 = _1937 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2049 = _1993 * _790;
    float _2051 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2053 = _1993 * _894;
    float _2055 = fma(_2037, _281, _2029);
    float _2057 = _1993 * _804;
    float _2059 = fma(_2037, _285, _2039);
    float _2061 = fma(_2037, _289, _2041);
    float _2063 = exp2(_2051);
    float _2065 = fma(_325, _1869, _2031);
    float _2067 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2069 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2071 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2073 = _1923 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2075 = fma(_1991, _890, _2049);
    float _2077 = fma(_1991, _792, _2053);
    float _2079 = fma(_2043, _325, _2055);
    float _2081 = fma(_329, _1869, _2033);
    float _2083 = fma(_1991, _798, _2057);
    float _2085 = fma(_2043, _329, _2059);
    float _2087 = fma(_333, _1869, _2035);
    float _2089 = fma(_2043, _333, _2061);
    float _2091 = fma(_2001, _794, _2075);
    float _2093 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2095 = precise::clamp(_2093, 0.0, 1.0);
    out.m_88.x = _2067;
    out.m_88.y = _2069;
    out.m_88.z = _2071;
    out.m_88.w = _2073;
    float _2097 = fma(_2001, _802, _2077);
    float _2099 = fma(_2001, _902, _2083);
    float _2101 = fma(_2095, -2.0, 3.0);
    float _2103 = _2095 * _2095;
    float _2105 = _2081 * _894;
    bool _2107 = _1985 <= 8000.0;
    bool _2109 = isnan(_1985);
    bool _2111 = _2107 || _2109;
    bool _2113 = isnan(8000.0);
    bool _2115 = _2111 || _2113;
    float _2117 = float(_2115);
    out.m_90.x = _2091;
    out.m_90.y = _2097;
    out.m_90.z = _2099;
    float _2119 = _2103 * _2101;
    float _2121 = fma(_2065, _792, _2105);
    float _2123 = _2081 * _790;
    float _2125 = _2085 * _790;
    float _2127 = _2085 * _894;
    float _2129 = _2085 * _804;
    float _2131 = fma(_2065, _890, _2123);
    float _2133 = fma(_2079, _890, _2125);
    float _2135 = fma(_2079, _792, _2127);
    float _2137 = fma(_2079, _798, _2129);
    float _2139 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2141 = -_2119;
    float _2143 = _2141 + 1.0;
    float _2145 = fma(_2089, _802, _2135);
    float _2147 = fma(_2089, _794, _2133);
    float _2149 = fma(_2089, _902, _2137);
    float _2151 = fma(_2143, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2119);
    float _2153 = exp2(_2139);
    float _2155 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1495);
    float _2157 = _2081 * _804;
    float _2159 = in.m_74.x;
    float _2161 = _2117 * _2151;
    float _2163 = _2021 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2165 = fma(_2065, _798, _2157);
    out.m_92.x = _2147;
    out.m_92.y = _2145;
    out.m_92.z = _2149;
    float _2167 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2169 = _2155 + _1330;
    int _2171 = as_type<int>(_2099);
    float _2173 = _2131;
    float _2175 = 0.0;
    float _2177 = _2155;
    if (!_1084)
    {
        float _2179 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _2171 = as_type<int>(_2179);
    }
    int _2181 = _2171;
    out.gl_Position.x = _1354;
    out.gl_Position.y = _1356;
    out.gl_Position.z = _2155;
    out.gl_Position.w = _1330;
    float _2183 = _2169 * 0.5;
    float _2185 = -_2153;
    float _2187 = _2185 + 1.0;
    float _2189 = _2163 * _1058;
    if (!_1084)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5933 = as_type<float>(_2181);
        out.gl_Position.z = _5933;
    }
    float _2191 = fma(_2087, _802, _2121);
    float _2193 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2195 = fma(_2087, _794, _2131);
    float _2197 = fma(_2087, _902, _2165);
    out.m_94.z = _2183;
    out.m_94.w = _1330;
    if (_1084)
    {
        _2173 = _2189;
    }
    float _2199 = _2173;
    float _2201 = _2199;
    if (!_1084)
    {
        _2201 = 0.0;
    }
    float _2203 = _2201;
    float _2205 = -_2193;
    float _2207 = _2205 + 1.0;
    out.m_96.x = _2195;
    out.m_96.y = _2191;
    out.m_96.z = _2197;
    float _2209 = _2207;
    if (!_1949)
    {
        _2175 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2211 = _2175;
    float _2213 = -_1398;
    float _2215 = _2213 + 1.0;
    float _2217 = _2211;
    float _2219 = _2211;
    if (!_1949)
    {
        _1364 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2221 = _1364;
    float _2223 = _2221;
    float _2225 = _2221;
    if (!_1949)
    {
        _2177 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2227 = _2177;
    float _2229 = _2215 * _2167;
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = _2227;
    float _2235 = _2227;
    if (!_1949)
    {
        _1366 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2237 = _1366;
    float _2239 = _2193 * _1410;
    float _2241 = -_2231;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2245 = _2243 * _2159;
    float _2247 = _2245 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2249 = _1431 * _2239;
    float _2251 = _1431 * _2207;
    out.m_98.x = _2247;
    float _2253 = _2249;
    float _2255 = _2237;
    float _2257 = _2237;
    if (!_1949)
    {
        _2209 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2259 = _2209;
    float _2261 = _1441 * _2239;
    float _2263 = fma(_1437, _2249, _1425);
    float _2265 = fma(_1439, _2249, _1427);
    float _2267 = _2259;
    float _2269 = _2259;
    if (!_1949)
    {
        _2253 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2271 = _2253;
    float _2273 = fma(_1431, _2261, _1429);
    out.m_100.x = _2263;
    out.m_100.y = _2265;
    out.m_100.z = _2273;
    out.m_100.w = _2251;
    bool _2275 = !_1949;
    float _2277 = _2271;
    float _2279 = _2271;
    if (!_2275)
    {
        bool _2281 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2283 = isnan(_1092);
        bool _2285 = _2281 || _2283;
        bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2289 = _2285 || _2287;
        if (!_2289)
        {
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = _1092 + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2297 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2295;
            float _2299 = 1.0 / _2297;
            float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2321 = _2293 * _2299;
            float _2323 = precise::clamp(_2321, 0.0, 1.0);
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2329 = fma(_2323, _2303, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2331 = fma(_2323, _2327, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2333 = fma(_2323, _2307, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2335 = fma(_2323, _2311, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2337 = fma(_2323, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2339 = fma(_2323, _2319, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2225 = _2331;
            _2269 = _2337;
            _2219 = _2329;
            _2257 = _2335;
            _2235 = _2333;
            _2279 = _2339;
            _2341 = true;
        }
        else
        {
            bool _2343 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2345 = isnan(_1092);
            bool _2347 = _2343 || _2345;
            bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2351 = _2347 || _2349;
            if (!_2351)
            {
                _2217 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2353 = _2217;
            _2219 = _2353;
            if (!_2351)
            {
                _2223 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2355 = _2223;
            _2225 = _2355;
            if (!_2351)
            {
                _2233 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2357 = _2233;
            _2235 = _2357;
            if (!_2351)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2359 = _2255;
            _2257 = _2359;
            if (!_2351)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2361 = _2267;
            _2269 = _2361;
            if (!_2351)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2363 = _2277;
            bool _2365 = !_2351;
            _2279 = _2363;
            if (!_2365)
            {
                bool _2367 = _1092 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2369 = isnan(_1092);
                bool _2371 = _2367 || _2369;
                bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2375 = _2371 || _2373;
                if (!_2375)
                {
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = _1092 + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2381;
                    float _2385 = 1.0 / _2383;
                    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2407 = _2379 * _2385;
                    float _2409 = precise::clamp(_2407, 0.0, 1.0);
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2415 = fma(_2409, _2389, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2417 = fma(_2409, _2413, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2419 = fma(_2409, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2421 = fma(_2409, _2397, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2423 = fma(_2409, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2425 = fma(_2409, _2405, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2225 = _2417;
                    _2269 = _2423;
                    _2219 = _2415;
                    _2257 = _2421;
                    _2235 = _2419;
                    _2279 = _2425;
                    _2341 = true;
                }
                else
                {
                    _2225 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2219 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2235 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2341 = false;
    float _2427 = _2225;
    float _2429 = _2269;
    float _2431 = _2219;
    float _2433 = _2257;
    float _2435 = _2235;
    float _2437 = _2279;
    float _2439 = fma(_2191, -0.5, 0.5);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    float _2451 = -_2435;
    float _2453 = _2451 + _2437;
    bool _2455 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2457 = fma(_2441, _2445, _2427);
    float _2459 = fma(_2441, _2449, _2431);
    float _2461 = fma(_2441, _2453, _2435);
    float _2463 = _2203 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2465 = _2457 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _2467 = fma(_2459, 0.298911988735198974609375, _2465);
    out.m_98.w = _2463;
    float _2469 = fma(_2461, 0.114477999508380889892578125, _2467);
    out.m_56.x = 1.0;
    float _2471 = -_2469;
    float _2473 = _2459 + _2471;
    float _2475 = -_2469;
    float _2477 = _2457 + _2475;
    float _2479 = -_2469;
    float _2481 = _2461 + _2479;
    float _2483 = fma(_2473, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2469);
    float _2485 = fma(_2477, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2469);
    float _2487 = fma(_2481, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2469);
    out.m_104.x = _2483;
    out.m_104.y = _2485;
    out.m_104.z = _2487;
    if (!_2455)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2489 = -_980;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2493 = -_982;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2497 = -_984;
    float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2501 = _2491 * _2491;
    float _2503 = fma(_2495, _2495, _2501);
    float _2505 = fma(_2499, _2499, _2503);
    float _2507 = sqrt(_2505);
    float _2509 = rsqrt(_2505);
    float _2511 = -_2507;
    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2515 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = _2495 * _2509;
    float _2521 = _2491 * _2509;
    float _2523 = abs(_2517);
    float _2525 = log2(_2523);
    float _2527 = _2499 * _2509;
    float _2529 = _2519 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2531 = _2191 * _2521;
    float _2533 = -_2521;
    float _2535 = -_2529;
    float _2537 = fma(_2533, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2535);
    float _2539 = fma(_2195, _2519, _2531);
    float _2541 = -_2527;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2537);
    float _2545 = fma(_2197, _2527, _2539);
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2551 = _2543 + _2549;
    float _2553 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2555 = _2551 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = exp2(_2553);
    float _2561 = _2559 * _2557;
    float _2563 = _2547 * _2561;
    float _2565 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2567 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2569 = _2563 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _2565;
    out.m_102.y = _2567;
    out.m_102.z = _2569;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

