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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_64 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_76 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 m_88 [[user(locn13)]];
    float4 m_90 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3641 = false;
    bool _2736 = false;
    bool _487 = false;
    bool _337 = false;
    bool _235 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3940 = as_type<float>(_129);
        out.gl_Position.z = _3940;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4009 = as_type<float>(_167);
        out.gl_Position.z = _4009;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _215 = _211;
    float _233;
    if (!_213)
    {
        float _217 = in.m_60.x;
        float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _225 = _223 * _219;
        float _227 = floor(_225);
        float _229 = -_227;
        float _231 = _225 + _229;
        _233 = _231;
        _235 = true;
    }
    else
    {
        float _237 = float(_113);
        float _239 = 1.0 / _237;
        float _241 = _147 * _239;
        _233 = _241;
    }
    _235 = false;
    float _243 = _233;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    bool _249 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _251 = isnan(_243);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _261;
    float _265 = -_259;
    float _267 = _265 + 1.0;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _281;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _263;
    float _289 = _279 * _267;
    float _291 = -_279;
    float _293 = _291 + 1.0;
    float _295 = _247 * _287;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _297;
    float _301 = fma(_283, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_299, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = _301 * _289;
    float _307 = _303 * _289;
    float _309 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _305);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _307);
    float _313 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].x, _309);
    float _315 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].y, _311);
    bool _317 = !_285;
    float _335;
    if (!_317)
    {
        float _319 = in.m_60.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        float _339 = float(_113);
        float _341 = 1.0 / _339;
        float _343 = _147 * _341;
        _335 = _343;
    }
    _337 = false;
    float _345 = _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _349 = _345 + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = isnan(_345);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _371 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _373 = isnan(_345);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _383;
    bool _387 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _389 = isnan(_345);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = 1.0 / _353;
    float _401 = -_365;
    float _403 = _401 + 1.0;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _407 = _381 * _403;
    float _409 = -_381;
    float _411 = _409 + 1.0;
    float _413 = 1.0 / _369;
    float _415 = _385 * _399;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _421 = fma(_415, _349, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _423 = _419 * _413;
    float _425 = _421 * _407;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = _345 + _431;
    float _435 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[115].x, _425);
    float _437 = _365 * _429;
    float _439 = fma(_423, _433, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _443 = fma(_439, _437, _435);
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _447 = _441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _449 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[117].x, _443);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _453 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _455 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _457 = in.m_62.x;
    float _459 = in.m_62.y;
    float _461 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _447;
    out.m_64.y = _461;
    out.m_64.z = _453;
    out.m_64.w = _455;
    float _463 = _315 * _459;
    float _465 = _313 * _457;
    bool _467 = !_405;
    float _485;
    if (!_467)
    {
        float _469 = in.m_60.x;
        float _471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _473 = _469 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _477 = _475 * _471;
        float _479 = floor(_477);
        float _481 = -_479;
        float _483 = _477 + _481;
        _485 = _483;
        _487 = true;
    }
    else
    {
        float _489 = float(_113);
        float _491 = 1.0 / _489;
        float _493 = _147 * _491;
        _485 = _493;
    }
    _487 = false;
    float _495 = _485;
    float _497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _499 = int(_497);
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _503 = _501 != 0;
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _507 = int(_505);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _511 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _513 = isnan(_495);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _525 = float(_499);
    float _527 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _529 = int(_527);
    float _531 = float(_507);
    float _533 = 1.0 / _525;
    float _535 = 1.0 / _531;
    float _537 = float(uint(_529));
    int _539 = ~_529;
    int _541 = _539 + 1;
    float _543 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _545 = int(_543);
    float _547 = _533 * _147;
    float _549 = _535 * _147;
    float _551 = 1.0 / _537;
    float _553 = float(uint(_545));
    float _555 = trunc(_547);
    int _557 = int(_555);
    int _559 = ~_545;
    int _561 = _559 + 1;
    float _563 = float(_545);
    float _565 = 1.0 / _553;
    int _567 = as_type<int>(_551) + (-2);
    float _569 = in.m_60.x;
    float _571 = in.m_60.y;
    float _573 = in.m_60.z;
    float _575 = in.m_60.w;
    float _577 = trunc(_549);
    int _579 = int(_577);
    float _581 = float(uint(_557));
    float _583 = as_type<float>(_567) * _581;
    int _585 = as_type<int>(_565) + (-2);
    float _587 = _581;
    if (_503)
    {
        float _589 = in.m_60.x;
        _587 = _589;
    }
    float _591 = _587;
    float _593 = trunc(_583);
    float _595 = precise::max(_593, 0.0);
    uint _598 = uint(_595);
    float _600 = _591;
    if (!_503)
    {
        float _602 = in.m_60.y;
        _600 = _602;
    }
    float _604 = _600;
    float _606 = float(uint(_579));
    float _608 = float(_579);
    float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _612 = _571 > 0.5;
    float _614 = as_type<float>(_585) * _606;
    float _616 = _606;
    if (_503)
    {
        _616 = 1.0;
    }
    float _618 = _616;
    float _620 = _618;
    if (!_503)
    {
        _620 = 7.345489978790283203125;
    }
    float _622 = _620;
    int _624 = _541 * int(_598);
    int _626 = _624 + _557;
    float _628 = trunc(_614);
    float _630 = precise::max(_628, 0.0);
    uint _632 = uint(_630);
    bool _634 = _608 >= _563;
    bool _636 = isnan(_608);
    bool _638 = _634 || _636;
    bool _640 = isnan(_563);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _622 * _569;
    float _648 = trunc(_644);
    int _650 = int(_648);
    float _652 = _610 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _654 = _561 * int(_632);
    int _656 = _654 + _579;
    float _658 = float(uint(_626));
    float _660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _662 = float(uint(_656));
    float _664 = as_type<float>(_567) * _658;
    float _666 = trunc(_664);
    float _668 = precise::max(_666, 0.0);
    uint _670 = uint(_668);
    float _672 = as_type<float>(_585) * _662;
    float _674 = _662;
    if (_503)
    {
        _674 = 1.0;
    }
    float _676 = _674;
    float _678 = _676;
    if (!_503)
    {
        _678 = 1.2345600128173828125;
    }
    float _680 = _678;
    bool _682 = _575 > 0.5;
    float _684 = floor(_646);
    float _686 = _680 * _604;
    int _688 = ~_529;
    int _690 = _688 + 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _702 = _700 != 0;
    bool _704 = _573 > 0.5;
    float _706 = trunc(_672);
    float _708 = precise::max(_706, 0.0);
    uint _710 = uint(_708);
    int _712 = int(_598) + int(_670);
    float _714 = float(_113);
    float _716 = -_205;
    int _718 = _682 ? as_type<int>(_716) : as_type<int>(_205);
    int _720 = _690 * _712;
    int _722 = _720 + _557;
    float _724 = -_195;
    int _726 = _612 ? as_type<int>(_724) : as_type<int>(_195);
    float _728 = -_684;
    float _730 = _646 + _728;
    float _732 = -_205;
    int _734 = _704 ? as_type<int>(_732) : as_type<int>(_205);
    float _736 = 1.0 / _714;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _740 = _738 != 0;
    bool _742 = !_698;
    float _744 = _742 ? _195 : as_type<float>(_726);
    int _746 = int(_632) + int(_710);
    float _748 = floor(_686);
    bool _750 = !_702;
    float _752 = _750 ? _205 : as_type<float>(_734);
    float _754 = _744 + 0.5;
    bool _756 = !_740;
    int _758 = _756 ? 0 : 1;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _770 = _768 != 0;
    bool _772 = uint(_722) >= uint(_529);
    float _774 = _736 * _147;
    float _776 = float(_529);
    float _778 = float(_557);
    int _780 = ~_545;
    int _782 = _780 + 1;
    bool _784 = _778 >= _776;
    bool _786 = isnan(_778);
    bool _788 = _784 || _786;
    bool _790 = isnan(_776);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -_748;
    float _798 = _686 + _796;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _802 = _800 != 0;
    int _804 = _782 * _746;
    int _806 = _804 + _579;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _810 = _808 != 0;
    float _812 = _798 * _563;
    bool _814 = !_802;
    int _816 = _814 ? 0 : 1;
    float _818 = trunc(_794);
    int _820 = int(_818);
    bool _822 = uint(_806) >= uint(_545);
    bool _824 = !_772;
    int _826 = _824 ? 0 : (-1);
    bool _828 = !_694;
    float _830 = _828 ? _205 : as_type<float>(_718);
    bool _832 = !_810;
    int _834 = _832 ? 0 : 1;
    float _836 = trunc(_812);
    int _838 = int(_836);
    bool _840 = !_822;
    int _842 = _840 ? 0 : (-1);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _858 = _856 != 0;
    int _860 = ~_712;
    int _862 = _860 + _826;
    int _864 = _862 + 1;
    float _866 = _730 * _776;
    float _868 = _776 * _774;
    bool _870 = !_850;
    int _872 = _870 ? 0 : 1;
    int _874 = _529 * _864;
    int _876 = _874 + _557;
    bool _878 = _529 == 0;
    float _880 = trunc(_866);
    int _882 = int(_880);
    int _884 = ~_820;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    bool _890 = !_878;
    int _892 = _890 ? _876 : (-1);
    bool _894 = !_766;
    int _896 = _894 ? 0 : 1;
    int _898 = _529 + (-1);
    float _900 = trunc(_868);
    int _902 = int(_900);
    int _904 = _892 * _888;
    bool _906 = !_762;
    int _908 = _906 ? 0 : 1;
    int _910 = abs(_896);
    int _912 = _820 * _898;
    int _914 = _912 + _904;
    int _916 = abs(_758);
    int _918 = abs(_908);
    int _920 = _914 * _910;
    float _922 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _924 = log2(_922);
    float _926 = _563 * _774;
    int _928 = ~_746;
    int _930 = _928 + _842;
    int _932 = _930 + 1;
    int _934 = _882 * _916;
    int _936 = _934 + _557;
    bool _938 = !_770;
    int _940 = _938 ? 0 : 1;
    int _942 = _902 * _918;
    int _944 = _942 + _920;
    bool _946 = !_846;
    int _948 = _946 ? 0 : 1;
    int _950 = _545 * _932;
    int _952 = _950 + _579;
    int _954 = abs(_940);
    float _956 = trunc(_926);
    int _958 = int(_956);
    bool _960 = _545 == 0;
    int _962 = abs(_816);
    int _964 = _936 * _954;
    int _966 = _964 + _944;
    int _968 = abs(_834);
    int _970 = ~_650;
    int _972 = _970 + 1;
    int _974 = _972 + 1;
    int _976 = _882 * _962;
    int _978 = _976 + _966;
    bool _980 = !_960;
    int _982 = _980 ? _952 : (-1);
    float _984 = _571 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _986 = _545 + (-1);
    int _988 = _982 * _974;
    float _990 = float(uint(_978));
    int _992 = _838 * _968;
    int _994 = _992 + _579;
    int _996 = abs(_872);
    int _998 = _650 * _986;
    int _1000 = _998 + _988;
    bool _1002 = !_854;
    int _1004 = _1002 ? 0 : 1;
    float _1006 = as_type<float>(_567) * _990;
    int _1008 = abs(_948);
    float _1010 = fma(_984, -2.0, _509);
    bool _1012 = !_858;
    int _1014 = _1012 ? 0 : 1;
    int _1016 = abs(_1004);
    int _1018 = _1000 * _996;
    int _1020 = abs(_1014);
    float _1022 = trunc(_1006);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = _958 * _1008;
    int _1030 = _1028 + _1018;
    float _1032 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    int _1034 = ~_529;
    int _1036 = _1034 + 1;
    int _1038 = _994 * _1016;
    int _1040 = _1038 + _1030;
    int _1042 = ~_545;
    int _1044 = _1042 + 1;
    int _1046 = ~_529;
    int _1048 = _1046 + 1;
    int _1050 = _838 * _1020;
    int _1052 = _1050 + _1040;
    bool _1054 = _571 > 0.5;
    float _1056 = float(uint(_1052));
    int _1058 = _1036 * int(_1026);
    int _1060 = _1058 + _978;
    float _1062 = -_205;
    int _1064 = _1054 ? as_type<int>(_1062) : as_type<int>(_205);
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1068 = _1066 != 0;
    float _1070 = as_type<float>(_585) * _1056;
    float _1072 = float(uint(_1060));
    float _1074 = float(uint(_936));
    float _1076 = trunc(_1070);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    float _1082 = as_type<float>(_567) * _1072;
    float _1084 = float(uint(_994));
    float _1086 = as_type<float>(_567) * _1074;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1090 = ~_545;
    int _1092 = _1090 + 1;
    float _1094 = trunc(_1082);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    float _1100 = as_type<float>(_585) * _1084;
    bool _1102 = _573 > 0.5;
    int _1104 = _1044 * int(_1080);
    int _1106 = _1104 + _1052;
    float _1108 = trunc(_1086);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = float(uint(_1106));
    int _1116 = int(_1026) + int(_1098);
    float _1118 = trunc(_1100);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    float _1124 = as_type<float>(_585) * _1114;
    int _1126 = ~_529;
    int _1128 = _1126 + 1;
    int _1130 = _1048 * _1116;
    int _1132 = _1130 + _978;
    float _1134 = trunc(_1124);
    float _1136 = precise::max(_1134, 0.0);
    uint _1138 = uint(_1136);
    bool _1140 = uint(_1132) >= uint(_529);
    int _1142 = _1128 * int(_1112);
    int _1144 = _1142 + _936;
    bool _1146 = !_1140;
    int _1148 = _1146 ? 0 : (-1);
    float _1150 = float(uint(_1144));
    int _1152 = _1092 * int(_1122);
    int _1154 = _1152 + _994;
    int _1156 = ~_1116;
    int _1158 = _1156 + _1148;
    int _1160 = _1158 + 1;
    int _1162 = ~_545;
    int _1164 = _1162 + 1;
    float _1166 = as_type<float>(_567) * _1150;
    int _1168 = _529 * _1160;
    int _1170 = _1168 + _978;
    float _1172 = float(uint(_1154));
    int _1174 = int(_1080) + int(_1138);
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1178 = !_878;
    int _1180 = _1178 ? _1170 : (-1);
    float _1182 = as_type<float>(_585) * _1172;
    int _1184 = _1164 * _1174;
    int _1186 = _1184 + _1052;
    int _1188 = _1180 & 3;
    bool _1190 = _1188 != 0;
    float _1192 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1176);
    int _1194 = _1180 & 3;
    bool _1196 = _1194 != 0;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1200 = uint(_1186) >= uint(_545);
    float _1202 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1192);
    int _1204 = _1196 ? 0 : 1;
    float _1206 = trunc(_1166);
    float _1208 = precise::max(_1206, 0.0);
    uint _1210 = uint(_1208);
    bool _1212 = !_1200;
    int _1214 = _1212 ? 0 : (-1);
    float _1216 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1198);
    bool _1218 = uint(_1188) > 1u;
    float _1220 = _571 * 2.0;
    int _1222 = ~_1174;
    int _1224 = _1222 + _1214;
    int _1226 = _1224 + 1;
    float _1228 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1216);
    bool _1230 = _1188 != 3;
    float _1232 = -_1202;
    float _1234 = _1232 + 1.0;
    int _1236 = ~_1204;
    int _1238 = _1236 + 1;
    int _1240 = _1238 + 1;
    int _1242 = _545 * _1226;
    int _1244 = _1242 + _1052;
    int _1246 = _1052;
    int _1248 = _1240;
    int _1250 = _1204;
    float _1252 = as_type<float>(_1244);
    float _1254 = as_type<float>(_1138);
    float _1256 = as_type<float>(_1174);
    if (_1068)
    {
        _1246 = 0;
    }
    int _1258 = _1246;
    float _1260 = floor(_1220);
    int _1262 = _1258;
    if (!_1068)
    {
        _1262 = 2;
    }
    int _1264 = _1262;
    bool _1266 = !_960;
    int _1268 = _1266 ? _1244 : (-1);
    float _1270 = as_type<float>(_1264);
    if (!_1218)
    {
        int _1272 = ~_1204;
        int _1274 = _1272 + 1;
        _1248 = _1274;
    }
    int _1276 = _1248;
    bool _1278 = uint(_1188) >= 2u;
    if (_1068)
    {
        _1250 = 0;
    }
    int _1280 = _1250;
    int _1282 = _1278 ? 0 : 1;
    int _1284 = _1268 & 3;
    bool _1286 = _1284 != 0;
    int _1288 = ~_1282;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    int _1294 = _1292;
    int _1296 = _1280;
    if (_1230)
    {
        int _1298 = ~_1282;
        int _1300 = _1298 + 1;
        _1294 = _1300;
    }
    int _1302 = _1294;
    bool _1304 = uint(_1284) > 1u;
    if (!_1068)
    {
        _1296 = 1;
    }
    int _1306 = _1296;
    int _1308 = _1268 & 3;
    bool _1310 = _1308 != 0;
    float _1312 = _1310 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1314 = _1306 != 1;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1318 = ~as_type<int>(_1312);
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    int _1324 = _1322;
    float _1326 = _1312;
    if (!_1304)
    {
        int _1328 = ~as_type<int>(_1312);
        int _1330 = _1328 + 1;
        _1324 = _1330;
    }
    int _1332 = _1324;
    float _1334 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1316);
    bool _1336 = uint(_1284) >= 2u;
    float _1338 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1334);
    int _1340 = _1336 ? 0 : 1;
    bool _1342 = _1264 != 2;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1314)
    {
        _1252 = _573;
    }
    float _1346 = _1252;
    float _1348 = -_1338;
    float _1350 = _1348 + 1.0;
    float _1352 = _1346;
    if (_1314)
    {
        _1352 = _571;
    }
    float _1354 = _1352;
    if (!_1314)
    {
        _1326 = _571;
    }
    float _1356 = _1326;
    float _1358 = _1356;
    if (!_1314)
    {
        _1254 = _573;
    }
    float _1360 = _1254;
    float _1362 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1088);
    float _1364 = _1360;
    if (!_1314)
    {
        _1256 = _1356;
    }
    float _1366 = _1256;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1370 = _1366;
    if (_1314)
    {
        _1370 = _569;
    }
    float _1372 = _1370;
    float _1374 = _924 * _147;
    if (_1342)
    {
        _1270 = _569;
    }
    float _1376 = _1270;
    float _1378 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1362);
    float _1380 = _1376;
    if (!_1342)
    {
        _1380 = _573;
    }
    float _1382 = _1380;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1314)
    {
        _1358 = _569;
    }
    float _1386 = _1358;
    float _1388 = exp2(_1374);
    if (_1314)
    {
        _1364 = _571;
    }
    float _1390 = _1364;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1394 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1396 = _1394 != 0;
    float _1398 = _569 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1400 = ~_1340;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    float _1406 = -_1344;
    float _1408 = fma(_1392, 2.0, _1406);
    float _1410 = -_523;
    float _1412 = fma(_1398, 2.0, _1410);
    float _1414 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1416 = int(_1112) + int(_1210);
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1420 = -_147;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1412);
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1426 = fma(_1414, -2.0, _1368);
    float _1428 = -_1418;
    float _1430 = fma(_1384, 2.0, _1428);
    float _1432 = _1418;
    int _1434 = _1404;
    if (_1342)
    {
        _1432 = _571;
    }
    float _1436 = _1432;
    float _1438 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1424);
    float _1440 = _1436;
    if (!_1342)
    {
        _1440 = _569;
    }
    float _1442 = _1440;
    float _1444 = -_1388;
    float _1446 = _1444 + 1.0;
    float _1448 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1438);
    bool _1450 = _1284 != 3;
    float _1452 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1454 = -_195;
    int _1456 = _1102 ? as_type<int>(_1454) : as_type<int>(_195);
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1460 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1468 = _1464 || _1466;
    float _1470 = -_147;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1430);
    float _1474 = fma(_1452, -2.0, _1458);
    float _1476 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1426);
    float _1478 = _1468 ? _1446 : 0.0;
    float _1480 = _569 * 2.0;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1450)
    {
        int _1484 = ~_1340;
        int _1486 = _1484 + 1;
        _1434 = _1486;
    }
    int _1488 = _1434;
    float _1490 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1474);
    bool _1492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1494 = isnan(1.0);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1500 = _1496 || _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1504 = 1.0 + _1502;
    float _1506 = floor(_1480);
    float _1508 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1482);
    bool _1510 = _569 > 0.5;
    float _1512 = _573 * 2.0;
    int _1514 = ~_529;
    int _1516 = _1514 + 1;
    float _1518 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1508);
    float _1520 = -_195;
    int _1522 = _1510 ? as_type<int>(_1520) : as_type<int>(_195);
    float _1524 = -_1448;
    float _1526 = _1524 + 1.0;
    float _1528 = 1.0 / _1504;
    float _1530 = -_147;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1408);
    int _1534 = _1516 * _1416;
    int _1536 = _1534 + _936;
    bool _1538 = !_1396;
    float _1540 = _1538 ? _205 : as_type<float>(_1064);
    float _1542 = -_1518;
    float _1544 = _1542 + 1.0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1548 = _1546 != 0;
    float _1550 = -_1378;
    float _1552 = _1550 + 1.0;
    float _1554 = trunc(_1182);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    bool _1560 = _1506 > 0.0;
    float _1562 = _573 + _571;
    bool _1564 = !_1190;
    int _1566 = _1564 ? 0 : 1;
    float _1568 = _1562 + (-1.0);
    bool _1570 = !_1286;
    int _1572 = _1570 ? 0 : 1;
    if (_1500)
    {
        float _1574 = _1478 * _1528;
        _151 = _1574;
    }
    float _1576 = _151;
    bool _1578 = _1506 >= 0.0;
    bool _1580 = isnan(_1506);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan(0.0);
    bool _1586 = _1582 || _1584;
    float _1588 = floor(_1512);
    int _1590 = ~_545;
    int _1592 = _1590 + 1;
    float _1594 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1596 = _1586 ? 0 : 1;
    int _1598 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1600 = _1598 != 0;
    int _1602 = int(_1122) + int(_1558);
    int _1604 = ~_1596;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    bool _1610 = !_1548;
    float _1612 = _1610 ? _195 : as_type<float>(_1456);
    int _1614 = _1592 * _1602;
    int _1616 = _1614 + _994;
    int _1618 = _1608;
    if (!_1560)
    {
        int _1620 = ~_1596;
        int _1622 = _1620 + 1;
        _1618 = _1622;
    }
    int _1624 = _1618;
    bool _1626 = uint(_1536) >= uint(_529);
    bool _1628 = !_1600;
    float _1630 = _1628 ? _195 : as_type<float>(_1522);
    bool _1632 = _1260 >= 0.0;
    bool _1634 = isnan(_1260);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    bool _1642 = _1260 > 0.0;
    float _1644 = in.m_48.x;
    float _1646 = in.m_48.y;
    float _1648 = in.m_48.z;
    bool _1650 = !_1626;
    int _1652 = _1650 ? 0 : (-1);
    bool _1654 = uint(_1616) >= uint(_545);
    int _1656 = _1640 ? 0 : 1;
    bool _1658 = !_1654;
    int _1660 = _1658 ? 0 : (-1);
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1664 = _1662 != 0;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1668 = _1666 != 0;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1672 = _1670 != 0;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1678 = ~_1656;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    int _1684 = _1682;
    if (!_1642)
    {
        int _1686 = ~_1656;
        int _1688 = _1686 + 1;
        _1684 = _1688;
    }
    int _1690 = _1684;
    float _1692 = _569 + _571;
    bool _1694 = !_1668;
    int _1696 = _1694 ? 0 : 1;
    float _1698 = 1.0 / _1676;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1702 = _1700 != 0;
    float _1704 = _1692 + (-1.0);
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1708 = _1706 != 0;
    float _1710 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1712 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1714 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1716 = !_1664;
    int _1718 = _1716 ? 0 : 1;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1720;
    float _1724 = fma(_1644, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1710);
    float _1726 = fma(_1644, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1712);
    float _1728 = fma(_1644, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1714);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1732 = _495 + _1730;
    bool _1734 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1736 = isnan(_495);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = _1722 * _1698;
    float _1748 = -_521;
    float _1750 = _1748 + 1.0;
    float _1752 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1726);
    float _1754 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1724);
    float _1756 = fma(_1746, _1732, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1758 = _1744 * _1750;
    bool _1760 = _1588 >= 0.0;
    bool _1762 = isnan(_1588);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    float _1770 = -_1744;
    float _1772 = _1770 + 1.0;
    float _1774 = _1754 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1776 = _1756 * _1758;
    float _1778 = _1752 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1780 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1782 = _1768 ? 0 : 1;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1776);
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1788 = _1778 + _1786;
    bool _1790 = _1588 > 0.0;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1794 = _1774 + _1792;
    float _1796 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1728);
    float _1798 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1800 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1784);
    float _1802 = _1540 + (-0.5);
    int _1804 = ~_1782;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1798);
    int _1812 = _1180 >> 31;
    float _1814 = -_1802;
    float _1816 = -_1032;
    float _1818 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1816);
    int _1820 = _1268 >> 31;
    float _1822 = _1796 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1824 = _1812 & 3;
    float _1826 = _1630 + 0.5;
    int _1828 = _1808;
    if (!_1790)
    {
        int _1830 = ~_1782;
        int _1832 = _1830 + 1;
        _1828 = _1832;
    }
    int _1834 = _1828;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1838 = _1822 + _1836;
    int _1840 = _1820 & 3;
    float _1842 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1422);
    int _1844 = _1180 + _1824;
    float _1846 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1810);
    int _1848 = _1268 + _1840;
    int _1850 = _1844 >> 2;
    int _1852 = _1848 >> 2;
    int _1854 = _1850 << 4;
    int _1856 = _1854 + 368;
    bool _1858 = _1188 != 3;
    int _1860 = _1852 << 4;
    int _1862 = _1860 + 512;
    uint _1864 = uint(int(uint(_1856) >> uint(2)));
    uint _1866 = uint(int(uint(int(_1864)) >> uint(2)));
    int _1868 = int(_1864) & 3;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[int(_1866)][_1868];
    int _1872 = int(_1864) + 1;
    uint _1874 = uint(int(uint(_1872) >> uint(2)));
    int _1876 = _1872 & 3;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[int(_1874)][_1876];
    bool _1880 = !_1858;
    int _1882 = _1880 ? 0 : (-1);
    bool _1884 = _1284 != 3;
    int _1886 = abs(_1696);
    int _1888 = abs(_1718);
    uint _1890 = uint(int(uint(_1862) >> uint(2)));
    uint _1892 = uint(int(uint(int(_1890)) >> uint(2)));
    int _1894 = int(_1890) & 3;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[int(_1892)][_1894];
    int _1898 = int(_1890) + 1;
    uint _1900 = uint(int(uint(_1898) >> uint(2)));
    int _1902 = _1898 & 3;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[int(_1900)][_1902];
    float _1906 = float(_1834);
    float _1908 = float(_1888);
    float _1910 = float(_1624);
    float _1912 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1914 = fma(_652, _754, _1532);
    int _1916 = _1856 + 8;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    uint _1920 = uint(int(uint(int(_1918)) >> uint(2)));
    int _1922 = int(_1918) & 3;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[int(_1920)][_1922];
    int _1926 = int(_1918) + 1;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    int _1930 = _1926 & 3;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[int(_1928)][_1930];
    float _1934 = _1908 * _1906;
    bool _1936 = !_1884;
    int _1938 = _1936 ? 0 : (-1);
    float _1940 = _1612 + 0.5;
    bool _1942 = _1846 >= 0.0;
    float _1944 = -_1350;
    float _1946 = fma(_744, _1944, _1914);
    float _1948 = in.m_66.x;
    float _1950 = in.m_66.y;
    float _1952 = in.m_66.z;
    int _1954 = _1862 + 8;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1974 = float(_1886);
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1978 = abs(_1882);
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1982 = 0.0;
    int _1984 = _1888;
    if (_1942)
    {
        _1982 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1986 = _1982;
    float _1988 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1990 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1994 = _1974 * _1910;
    if (_1942)
    {
        float _1996 = _1986 * 5.0;
        _1984 = as_type<int>(_1996);
    }
    int _1998 = _1984;
    int _2000 = ~_1416;
    int _2002 = _2000 + _1652;
    int _2004 = _2002 + 1;
    float _2006 = _660 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_68.x = _1988;
    out.m_68.y = _1990;
    out.m_68.z = _1992;
    out.m_68.w = _1912;
    int _2008 = ~_1602;
    int _2010 = _2008 + _1660;
    int _2012 = _2010 + 1;
    float _2014 = _752 + (-0.5);
    int _2016 = _529 * _2004;
    int _2018 = _2016 + _936;
    if (_1942)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6757 = as_type<float>(_1998);
        out.gl_Position.z = _6757;
    }
    float _2020 = _830 + (-0.5);
    int _2022 = _545 * _2012;
    int _2024 = _2022 + _994;
    float _2026 = _1934 * (-2.0);
    if (_1942)
    {
        out.m_51.x = 0.0;
    }
    float _2028 = fma(_2026, _1948, _1948);
    int _2030 = abs(_1276);
    float _2032 = -_2006;
    float _2034 = -_1490;
    float _2036 = fma(_2032, _2014, _2034);
    int _2038 = abs(_1332);
    float _2040 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1472);
    int _2042 = abs(_1566);
    float _2044 = -_2020;
    float _2046 = -_1476;
    float _2048 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2046);
    int _2050 = ~_2030;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    float _2056 = -_1526;
    float _2058 = fma(_1612, _2056, _2040);
    int _2060 = ~_2038;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    float _2066 = fma(_830, _1552, _2048);
    int _2068 = ~_2042;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    int _2074 = _2054 * as_type<int>(_1878);
    int _2076 = abs(_1572);
    int _2078 = _2064 * as_type<int>(_1904);
    int _2080 = abs(_1302);
    int _2082 = _2072 * as_type<int>(_1870);
    int _2084 = _2082 + _2074;
    int _2086 = ~_2076;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    float _2092 = _1788 * _1788;
    int _2094 = abs(_1488);
    float _2096 = fma(_1780, _2026, _1780);
    int _2098 = ~_2080;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    int _2104 = _2090 * as_type<int>(_1896);
    int _2106 = _2104 + _2078;
    int _2108 = abs(_1938);
    int _2110 = ~_2094;
    int _2112 = _2110 + 1;
    int _2114 = _2112 + 1;
    int _2116 = _2102 * as_type<int>(_1924);
    int _2118 = _2116 + _2084;
    bool _2120 = !_1708;
    int _2122 = _2120 ? 0 : 1;
    int _2124 = ~_2108;
    int _2126 = _2124 + 1;
    int _2128 = _2126 + 1;
    int _2130 = _2114 * as_type<int>(_1962);
    int _2132 = _2130 + _2106;
    bool _2134 = !_1702;
    int _2136 = _2134 ? 0 : 1;
    int _2138 = abs(_2122);
    int _2140 = _2128 * as_type<int>(_1970);
    int _2142 = _2140 + _2132;
    int _2144 = abs(_2136);
    float _2146 = fma(_1794, _1794, _2092);
    float _2148 = _1994 * (-2.0);
    int _2150 = ~_1978;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    float _2156 = fma(_752, _1544, _2036);
    int _2158 = ~_2144;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = fma(_2148, _1950, _1950);
    float _2166 = fma(_1838, _1838, _2146);
    int _2168 = _2154 * as_type<int>(_1932);
    int _2170 = _2168 + _2118;
    int _2172 = ~_2138;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    float _2178 = -_1228;
    float _2180 = _2178 + 1.0;
    out.m_70.x = _1946;
    out.m_70.y = _2156;
    int _2182 = _2170 * _2162;
    float _2184 = rsqrt(_2166);
    bool _2186 = !_878;
    int _2188 = _2186 ? _2018 : (-1);
    float _2190 = fma(_1594, _2148, _1594);
    int _2192 = _2142 * _2176;
    float _2194 = fma(_1540, _2180, _1818);
    int _2196 = _2188 * _2144;
    int _2198 = _2196 + _2182;
    float _2200 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _2202 = !_960;
    int _2204 = _2202 ? _2024 : (-1);
    float _2206 = _2200 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2208 = float(_2198);
    int _2210 = _2204 * _2138;
    int _2212 = _2210 + _2192;
    float _2214 = -_1234;
    float _2216 = fma(_1630, _2214, _1842);
    float _2218 = _569 + (-0.5);
    float _2220 = _2206 * _2184;
    float _2222 = float(_2212);
    out.m_72.x = _2216;
    out.m_72.y = _2194;
    out.m_72.z = _2058;
    out.m_72.w = _2066;
    float _2224 = _1788 * _2220;
    float _2226 = _1794 * _2220;
    float _2228 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2028);
    out.m_74.x = _2208;
    out.m_74.y = _2222;
    float _2230 = -_2224;
    float _2232 = _1788 + _2230;
    bool _2234 = !_1672;
    int _2236 = _2234 ? 0 : 1;
    float _2238 = -_2226;
    float _2240 = _1794 + _2238;
    float _2242 = _2232 * _2232;
    float _2244 = _2224;
    if (_1942)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2246 = -_2224;
    float _2248 = _1778 + _2246;
    float _2250 = _1838 * _2220;
    float _2252 = -_2226;
    float _2254 = _1774 + _2252;
    int _2256 = abs(_2236);
    float _2258 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2260 = _2248 + _2258;
    float _2262 = -_2250;
    float _2264 = _1822 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2268 = _2254 + _2266;
    float _2270 = _571 + (-0.5);
    float _2272 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2276 = _2264 + _2274;
    float _2278 = float(_1690);
    float _2280 = _573 + _569;
    float _2282 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2272);
    float _2284 = float(_2256);
    float _2286 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2164);
    float _2288 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2282);
    float _2290 = _2280 + (-1.0);
    float _2292 = _2284 * _2278;
    float _2294 = fma(_2190, _1576, _2286);
    float _2296 = _573 + (-0.5);
    bool _2298 = _2288 >= 0.0;
    float _2300 = _2292 * (-2.0);
    float _2302 = fma(_2290, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2304 = fma(_2240, _2240, _2242);
    float _2306 = -_2250;
    float _2308 = _1838 + _2306;
    float _2310 = fma(_2300, _1952, _1952);
    float _2312 = fma(_2096, _1576, _2228);
    float _2314 = _2294 * 0.15915493667125701904296875;
    float _2316 = fma(_2302, _2300, _2302);
    float _2318 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2310);
    float _2320 = fma(_2308, _2308, _2304);
    float _2322 = _2312 * 0.15915493667125701904296875;
    float _2324 = _2314 * 6.283185482025146484375;
    float _2326 = sin(_2324);
    float _2328 = _2288;
    int _2330 = as_type<int>(_2296);
    float _2332 = _2250;
    float _2334 = _2254;
    if (_2298)
    {
        _2328 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2336 = _2328;
    float _2338 = fma(_2316, _1576, _2318);
    if (_2298)
    {
        out.m_51.x = 0.0;
    }
    if (_2298)
    {
        float _2340 = _2336 * 5.0;
        _2330 = as_type<int>(_2340);
    }
    int _2342 = _2330;
    float _2344 = _2338 * 0.15915493667125701904296875;
    float _2346 = sqrt(_2320);
    if (_2298)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7250 = as_type<float>(_2342);
        out.gl_Position.z = _7250;
    }
    float _2348 = _2322 * 6.283185482025146484375;
    float _2350 = sin(_2348);
    float _2352 = _2322 * 6.283185482025146484375;
    float _2354 = cos(_2352);
    float _2356 = _2314 * 6.283185482025146484375;
    float _2358 = cos(_2356);
    if (_2298)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2360 = _2344 * 6.283185482025146484375;
    float _2362 = cos(_2360);
    float _2364 = _2184 * _2346;
    float _2366 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _2370 = _2354 * _2358;
    float _2372 = _2200 * _2364;
    float _2374 = _2364 * _2366;
    float _2376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _2378 = _2344 * 6.283185482025146484375;
    float _2380 = sin(_2378);
    float _2382 = _2350 * _2358;
    float _2384 = _2368 * _2374;
    float _2386 = _2350 * _2326;
    float _2388 = _2354 * _2326;
    float _2390 = _2376 * _2372;
    float _2392 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2394 = _2354 * _2362;
    float _2396 = _2350 * _2362;
    float _2398 = _2358 * _2362;
    float _2400 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2402 = _2400 * 0.5;
    float _2404 = _2394 * _2384;
    float _2406 = _2326 * _2362;
    float _2408 = fma(_2380, _2370, _2386);
    float _2410 = -_2382;
    float _2412 = fma(_2380, _2388, _2410);
    float _2414 = -_2384;
    float _2416 = _2380 * _2414;
    float _2418 = -_2388;
    float _2420 = fma(_2380, _2382, _2418);
    float _2422 = fma(_2408, _2390, _2404);
    float _2424 = _2396 * _2384;
    float _2426 = fma(_2398, _2390, _2416);
    float _2428 = fma(_2380, _2386, _2370);
    float _2430 = fma(_2412, _2402, _2422);
    float _2432 = fma(_2420, _2390, _2424);
    float _2434 = fma(_2406, _2402, _2426);
    float _2436 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2438 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2440 = fma(_2428, _2402, _2432);
    float _2442 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2444 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2436);
    float _2446 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2438);
    float _2448 = _2408 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2450 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2442);
    float _2452 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2444);
    float _2454 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2446);
    float _2456 = _2408 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2458 = fma(_2392, _2392, 1.0);
    float _2460 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2462 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2464 = _2408 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2466 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2448);
    float _2468 = _1774 + _2460;
    float _2470 = _1822 + _2462;
    float _2472 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2464);
    float _2474 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2478 = _2468 + _2476;
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2482 = _2470 + _2480;
    float _2484 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2450);
    float _2486 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2456);
    float _2488 = _2478 * _2478;
    float _2490 = _2482 * _2482;
    float _2492 = rsqrt(_2458);
    float _2494 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2496 = -_2380;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2474);
    float _2500 = _2488 + _2490;
    float _2502 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2504 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2506 = -_2380;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2494);
    float _2510 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2512 = sqrt(_2500);
    float _2514 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2516 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2518 = _1778 + _2502;
    float _2520 = -_2380;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2504);
    float _2524 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2510);
    float _2526 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2514);
    float _2528 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2516);
    bool _2530 = _2512 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2532 = _2510;
    float _2534 = _2406;
    float _2536 = _2502;
    float _2538 = _2514;
    float _2540 = _2470;
    if (!_2530)
    {
        _2532 = _2470;
    }
    float _2542 = _2532;
    float _2544 = _2542;
    if (!_2530)
    {
        _2534 = _2490;
    }
    float _2546 = _2534;
    float _2548 = _2546;
    if (!_2530)
    {
        _2536 = _2488;
    }
    float _2550 = _2536;
    float _2552 = _2550;
    if (!_2530)
    {
        _2538 = _2468;
    }
    float _2554 = _2538;
    float _2556 = _2554;
    if (!_2530)
    {
        _2540 = _2518;
    }
    float _2558 = _2540;
    bool _2560 = !_2530;
    float _2562 = _2558;
    if (!_2560)
    {
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2568 = _2512 + _2566;
        float _2570 = rsqrt(_2500);
        float _2572 = _2568 * _2564;
        float _2574 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2576 = _2572 * 0.15915493667125701904296875;
        float _2578 = _2576 * 6.283185482025146484375;
        float _2580 = sin(_2578);
        float _2582 = _2576 * 6.283185482025146484375;
        float _2584 = cos(_2582);
        float _2586 = fma(_2580, _2574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2588 = _2570 * _2586;
        float _2590 = _2584 + (-1.0);
        float _2592 = fma(_2478, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2594 = fma(_2482, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2596 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2600 = _2592 + _2598;
        float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2604 = _2594 + _2602;
        float _2606 = fma(_2518, _2584, _2596);
        float _2608 = _2600 * _2600;
        float _2610 = _2604 * _2604;
        _2562 = _2606;
        _2552 = _2608;
        _2548 = _2610;
        _2556 = _2592;
        _2544 = _2594;
    }
    float _2612 = _2562;
    float _2614 = _2552;
    float _2616 = _2548;
    float _2618 = _2556;
    float _2620 = _2544;
    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2624 = _2612 + _2622;
    float _2626 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2498);
    float _2628 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2508);
    float _2630 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2522);
    float _2632 = fma(_2624, _2624, _2614);
    float _2634 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2524);
    float _2636 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2526);
    float _2638 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2528);
    float _2640 = _2632 + _2616;
    float _2642 = _2392 * _2492;
    float _2644 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2472);
    float _2646 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2648 = _2392 * _2626;
    float _2650 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2466);
    float _2652 = _2392 * _2628;
    float _2654 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2486);
    float _2656 = _2392 * _2630;
    float _2658 = -_2634;
    float _2660 = _2642 * _2658;
    float _2662 = -_2636;
    float _2664 = _2642 * _2662;
    float _2666 = -_2638;
    float _2668 = _2642 * _2666;
    float _2670 = fma(_2646, _2644, _2648);
    float _2672 = sqrt(_2640);
    float _2674 = fma(_2646, _2650, _2652);
    float _2676 = fma(_2646, _2654, _2656);
    float _2678 = fma(_2492, _2626, _2660);
    float _2680 = fma(_2492, _2628, _2664);
    float _2682 = _2636 + _2674;
    float _2684 = fma(_2492, _2630, _2668);
    float _2686 = _2634 + _2670;
    float _2688 = _2638 + _2676;
    out.m_76.x = _2644;
    out.m_76.y = _2650;
    out.m_76.z = _2654;
    out.m_78.x = _2678;
    out.m_78.y = _2680;
    out.m_78.z = _2684;
    bool _2690 = _2672 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2692 = isnan(_2672);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2698 = _2694 || _2696;
    out.m_80.x = _2686;
    out.m_80.y = _2682;
    out.m_80.z = _2688;
    float _2700 = _2676;
    if (!_2698)
    {
        _2700 = 1.0;
    }
    float _2702 = _2700;
    bool _2704 = !_2698;
    float _2706 = _2702;
    if (!_2704)
    {
        bool _2708 = _2672 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2710 = isnan(_2672);
        bool _2712 = _2708 || _2710;
        bool _2714 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2716 = _2712 || _2714;
        if (!_2716)
        {
            float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2720 = _2672 + _2718;
            float _2722 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2724 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2722;
            float _2726 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2730 = 1.0 / _2724;
            float _2732 = _2720 * _2730;
            float _2734 = fma(_2732, _2728, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2706 = _2734;
            _2736 = true;
        }
        else
        {
            bool _2738 = _2672 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2740 = isnan(_2672);
            bool _2742 = _2738 || _2740;
            bool _2744 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2746 = _2742 || _2744;
            if (!_2746)
            {
                float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2750 = _2672 + _2748;
                float _2752 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2754 = _2752 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2756 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2758 = _2756 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2760 = 1.0 / _2754;
                float _2762 = _2750 * _2760;
                float _2764 = fma(_2762, _2758, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2706 = _2764;
                _2736 = true;
            }
            else
            {
                _2706 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2736 = false;
    float _2766 = _2706;
    float _2768 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2770 = _2612 + _2768;
    float _2772 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2776 = _2618 + _2774;
    float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2780 = _2620 + _2778;
    float _2782 = fma(_2770, _2766, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2784 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2772);
    float _2786 = fma(_2776, _2766, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2788 = fma(_2780, _2766, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2790 = -_1778;
    float _2792 = _2790 + _2782;
    float _2794 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2796 = -_1774;
    float _2798 = _2796 + _2786;
    float _2800 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2802 = _2792 * _2792;
    float _2804 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2806 = -_1822;
    float _2808 = _2806 + _2788;
    float _2810 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2800);
    float _2812 = fma(_2798, _2798, _2802);
    float _2814 = 1.0 / _2804;
    float _2816 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2810);
    float _2818 = fma(_2808, _2808, _2812);
    float _2820 = _2816 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2822 = sqrt(_2818);
    float _2824 = _2820 + _2804;
    bool _2826 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2828 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan(0.5);
    bool _2834 = _2830 || _2832;
    float _2836 = _2824 * _2814;
    float _2838 = _2836 * 0.5;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2842 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2840);
    bool _2844 = _2822 > 0.0;
    float _2846 = 1.0 / _2842;
    bool _2848 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2850 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2852 = _2848 || _2850;
    bool _2854 = isnan(0.5);
    bool _2856 = _2852 || _2854;
    float _2858 = _2794;
    float _2860 = _2780;
    float _2862 = _2814;
    if (!_2844)
    {
        _2858 = _2786;
    }
    float _2864 = _2858;
    float _2866 = _2864;
    float _2868 = _2864;
    if (!_2844)
    {
        _2860 = _2782;
    }
    float _2870 = _2860;
    float _2872 = _2870;
    float _2874 = _2870;
    if (!_2844)
    {
        _2862 = _2788;
    }
    float _2876 = _2862;
    bool _2878 = !_2844;
    float _2880 = _2876;
    float _2882 = _2876;
    if (!_2878)
    {
        float _2884 = _209 * _209;
        float _2886 = fma(_207, _207, _2884);
        float _2888 = fma(_211, _211, _2886);
        float _2890 = rsqrt(_2818);
        float _2892 = sqrt(_2888);
        float _2894 = _2798 * _2890;
        float _2896 = _2792 * _2890;
        float _2898 = _2808 * _2890;
        bool _2900 = _2892 > 0.0;
        if (!_2900)
        {
            _2866 = _2786;
        }
        float _2902 = _2866;
        _2868 = _2902;
        if (!_2900)
        {
            _2872 = _2782;
        }
        float _2904 = _2872;
        _2874 = _2904;
        if (!_2900)
        {
            _2880 = _2788;
        }
        float _2906 = _2880;
        bool _2908 = !_2900;
        _2882 = _2906;
        if (!_2908)
        {
            float _2910 = rsqrt(_2888);
            float _2912 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2914 = _209 * _2910;
            float _2916 = _207 * _2910;
            float _2918 = _211 * _2910;
            float _2920 = _2896 * _2914;
            float _2922 = fma(_2894, _2916, _2920);
            float _2924 = _2912 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2926 = fma(_2898, _2918, _2922);
            float _2928 = _2926 * _2924;
            float _2930 = fma(_207, _2928, _2786);
            float _2932 = fma(_209, _2928, _2782);
            float _2934 = fma(_211, _2928, _2788);
            _2874 = _2932;
            _2868 = _2930;
            _2882 = _2934;
        }
    }
    float _2936 = _2874;
    float _2938 = _2868;
    float _2940 = _2882;
    float _2942 = -_2224;
    float _2944 = _2942 + _2936;
    float _2946 = -_2226;
    float _2948 = _2946 + _2938;
    float _2950 = -_2250;
    float _2952 = _2950 + _2940;
    float _2954 = _2944;
    float _2956 = _2948;
    float _2958 = _2952;
    if (_2834)
    {
        _2244 = 1.0;
    }
    float _2960 = _2244;
    float _2962 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2964 = _2846 * _2962;
    float _2966 = _2960;
    if (!_2856)
    {
        float _2968 = _2260 * _2260;
        float _2970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2972 = -_1822;
        float _2974 = _2972 + _2940;
        float _2976 = -_1774;
        float _2978 = _2976 + _2938;
        float _2980 = fma(_2268, _2268, _2968);
        float _2982 = fma(_2276, _2276, _2980);
        float _2984 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2986 = sqrt(_2982);
        float _2988 = 1.0 / _2364;
        float _2990 = _2984 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2992 = precise::min(_2986, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2994 = _2992 * _2970;
        float _2996 = _2994 * _2988;
        float _2998 = -_1778;
        float _3000 = _2998 + _2936;
        float _3002 = _2990 * _2996;
        float _3004 = _2974 * _2996;
        float _3006 = fma(_3000, _3002, _2248);
        float _3008 = fma(_2978, _3002, _2254);
        float _3010 = fma(_2990, _3004, _2264);
        _2954 = _3006;
        _2956 = _3008;
        _2958 = _3010;
    }
    float _3012 = _2954;
    float _3014 = _2956;
    float _3016 = _2958;
    if (!_2834)
    {
        float _3018 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3020 = _3018 * 0.15915493667125701904296875;
        float _3022 = _3020 * 6.283185482025146484375;
        float _3024 = cos(_3022);
        float _3026 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3028 = _3026 * 0.15915493667125701904296875;
        float _3030 = _3020 * 6.283185482025146484375;
        float _3032 = sin(_3030);
        float _3034 = 1.0 / _3024;
        float _3036 = _3028 * 6.283185482025146484375;
        float _3038 = cos(_3036);
        float _3040 = _3032 * _3034;
        float _3042 = _3028 * 6.283185482025146484375;
        float _3044 = sin(_3042);
        float _3046 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3048 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3046;
        float _3050 = _3038 * _3040;
        float _3052 = 1.0 / _3050;
        float _3054 = 1.0 / _3048;
        float _3056 = _3044 * _3052;
        float _3058 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3060 = fma(_2964, _3056, _3058);
        float _3062 = _3060 * _3054;
        float _3064 = precise::clamp(_3062, 0.0, 1.0);
        _2966 = _3064;
    }
    float _3066 = _2966;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3070 = _3012 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3074 = _3014 + _3072;
    float _3076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3078 = _3016 + _3076;
    float _3080 = _3070 * _3070;
    float _3082 = fma(_3074, _3074, _3080);
    float _3084 = fma(_3078, _3078, _3082);
    float _3086 = rsqrt(_3084);
    float _3088 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3090 = _3074 * _3088;
    float _3092 = _3078 * _3088;
    float _3094 = _3090 * _3090;
    float _3096 = _3092 * _3092;
    float _3098 = _3094 + _3096;
    float _3100 = sqrt(_3098);
    bool _3102 = _3100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3106 = _3100 + _3104;
    float _3108 = _3082;
    float _3110 = _3106;
    float _3112 = _3098;
    if (_3102)
    {
        float _3114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3108 = _3114;
    }
    float _3116 = _3108;
    if (_3102)
    {
        float _3118 = _3106 * _3116;
        _3110 = _3118;
    }
    float _3120 = _3110;
    if (_3102)
    {
        float _3122 = _3120 * 0.15915493667125701904296875;
        _2332 = _3122;
    }
    float _3124 = _2332;
    float _3126 = _3078;
    if (_3102)
    {
        float _3128 = _3124 * 6.283185482025146484375;
        float _3130 = sin(_3128);
        _3126 = _3130;
    }
    float _3132 = _3126;
    float _3134 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3136 = precise::max(0.0, _3134);
    float _3138 = _3086;
    float _3140 = _3136;
    if (_3102)
    {
        float _3142 = _3124 * 6.283185482025146484375;
        float _3144 = cos(_3142);
        _3138 = _3144;
    }
    float _3146 = _3138;
    float _3148 = -_3088;
    float _3150 = -_3136;
    float _3152 = fma(_3070, _3148, _3150);
    float _3154 = _3134;
    float _3156 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3102)
    {
        float _3158 = rsqrt(_3098);
        _3154 = _3158;
    }
    float _3160 = _3154;
    if (_3102)
    {
        float _3162 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3140 = _3162;
    }
    float _3164 = _3140;
    float _3166 = fma(_2254, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3168 = _3164;
    if (!_3102)
    {
        _2334 = _3094;
    }
    float _3170 = _2334;
    float _3172 = _3132;
    float _3174 = _3170;
    if (_3102)
    {
        float _3176 = fma(_3132, _3164, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3168 = _3176;
    }
    float _3178 = _3168;
    float _3180 = _3178;
    if (!_3102)
    {
        _3172 = _3152;
    }
    float _3182 = _3172;
    float _3184 = _3182;
    float _3186 = _3146;
    if (_3102)
    {
        float _3188 = _3146 + (-1.0);
        _3156 = _3188;
    }
    float _3190 = _3156;
    float _3192 = _3190;
    if (_3102)
    {
        float _3194 = _3190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3112 = _3194;
    }
    float _3196 = _3112;
    if (!_3102)
    {
        _3192 = _3092;
    }
    float _3198 = _3192;
    float _3200 = _3198;
    if (_3102)
    {
        float _3202 = _3160 * _3178;
        _215 = _3202;
    }
    float _3204 = _215;
    if (!_3102)
    {
        _3180 = _3090;
    }
    float _3206 = _3180;
    float _3208 = _3206;
    if (_3102)
    {
        float _3210 = fma(_3152, _3146, _3196);
        _3184 = _3210;
    }
    float _3212 = _3184;
    float _3214 = sqrt(_3084);
    if (_3102)
    {
        float _3216 = _3090 * _3204;
        _3208 = _3216;
    }
    float _3218 = _3208;
    if (_3102)
    {
        float _3220 = _3092 * _3204;
        _3200 = _3220;
    }
    float _3222 = _3200;
    if (!_3102)
    {
        _3186 = _3096;
    }
    float _3224 = _3186;
    float _3226 = _3224;
    if (_3102)
    {
        float _3228 = _3218 * _3218;
        _3174 = _3228;
    }
    float _3230 = _3174;
    if (_3102)
    {
        float _3232 = _3222 * _3222;
        _3226 = _3232;
    }
    float _3234 = _3226;
    float _3236 = floor(_3166);
    float _3238 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3240 = fma(_3212, _3212, _3230);
    float _3242 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3244 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3238);
    float _3246 = _3240 + _3234;
    float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3250 = fma(_3214, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3248);
    float _3252 = precise::clamp(_3250, 0.0, 1.0);
    float _3254 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3244);
    float _3256 = rsqrt(_3246);
    float _3258 = -_3252;
    float _3260 = _3258 + 1.0;
    float _3262 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3264 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3266 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3268 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3270 = abs(_3260);
    float _3272 = log2(_3270);
    float _3274 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3276 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3266);
    float _3278 = -_3268;
    float _3280 = fma(_3278, _3242, 1.0);
    float _3282 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3284 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3274);
    float _3286 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3276);
    float _3288 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3282);
    float _3290 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3284);
    float _3292 = _3256 * _3218;
    float _3294 = _3256 * _3212;
    float _3296 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3288);
    float _3298 = _3290 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3300 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3302 = _3256 * _3222;
    float _3304 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3306 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3308 = -_3300;
    float _3310 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3308);
    float _3312 = floor(_3264);
    float _3314 = _3272 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3316 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3306);
    float _3318 = -_3302;
    float _3320 = fma(_3318, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3310);
    float _3322 = -_3236;
    float _3324 = _3166 + _3322;
    float _3326 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3328 = fma(_3320, -0.5, 0.5);
    float _3330 = log2(_3280);
    float _3332 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3334 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3332);
    float _3336 = exp2(_3314);
    float _3338 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3340 = fma(_3320, 0.5, 0.5);
    float _3342 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3344 = -_3312;
    float _3346 = _3264 + _3344;
    float _3348 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3326);
    float _3350 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3342);
    float _3352 = sqrt(_3328);
    float _3354 = _3294 + 1.0;
    float _3356 = _3330 * 0.693147182464599609375;
    float _3358 = fma(_3340, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3360 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3350);
    float _3362 = fma(_3340, _3358, -0.212114393711090087890625);
    float _3364 = 1.0 / _3348;
    float _3366 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3334);
    float _3368 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3360);
    float _3370 = -_3294;
    float _3372 = fma(_3336, _3354, _3370);
    float _3374 = fma(_3340, _3362, 1.570728778839111328125);
    float _3376 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3366);
    float2 _8970 = float2(_3324, _3346);
    float _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8970, float2(0.0), isnan(_8970)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8970, float2(0.0), isnan(_8970)), level(0.0)).x;
    float _3380 = _3352 * 0.636619746685028076171875;
    float _3382 = -_3374;
    float _3384 = fma(_3380, _3382, 1.0);
    float _3386 = _3356 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3388 = fma(_3372, 0.5, 0.5);
    float _3390 = _3376 * _3364;
    float _3392 = _3368 * _3364;
    float _3394 = fma(_3390, 0.5, 0.5);
    float _3396 = fma(_3392, -0.5, 0.5);
    float3 _9005 = float3(_3394, _3396, _3386);
    float _3398 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9005, float3(0.0), isnan(_9005)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9005, float3(0.0), isnan(_9005)), level(0.0)).x;
    float3 _9016 = float3(_3394, _3396, _3386);
    float4 _3401 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9016, float3(0.0), isnan(_9016)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9016, float3(0.0), isnan(_9016)), level(0.0)).xyzw;
    float _3403 = _3401.x;
    float _3405 = _3401.y;
    float _3407 = _3401.z;
    float _3409 = _3401.w;
    float2 _9032 = float2(_3384, _3388);
    float3 _3413 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9032, float2(0.0), isnan(_9032)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9032, float2(0.0), isnan(_9032)), level(0.0)).xyz;
    float _3415 = _3413.x;
    float _3417 = _3413.y;
    float _3419 = _3413.z;
    float _3421 = abs(_2964);
    float _3423 = log2(_3421);
    out.m_82.x = _3014;
    out.m_82.y = _3012;
    out.m_82.z = _3016;
    bool _3425 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3427 = isnan(_3214);
    bool _3429 = _3425 || _3427;
    bool _3431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3433 = _3429 || _3431;
    bool _3435 = _2964 <= 8000.0;
    bool _3437 = isnan(_2964);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan(8000.0);
    bool _3443 = _3439 || _3441;
    float _3445 = float(_3443);
    float _3447 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3449 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3451 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3449);
    float _3453 = exp2(_3447);
    float _3455 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3451);
    float _3457 = in.m_84.x;
    float _3459 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3455);
    out.gl_Position.x = _3376;
    out.gl_Position.y = _3368;
    out.gl_Position.z = _3459;
    out.gl_Position.w = _3348;
    float _3461 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3463 = precise::clamp(_3461, 0.0, 1.0);
    float _3465 = fma(_3463, -2.0, 3.0);
    float _3467 = _3463 * _3463;
    float _3469 = _3467 * _3465;
    float _3471 = _3272 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3473 = _3368;
    float _3475 = _3348;
    float _3477 = _3459;
    if (!_3433)
    {
        _3473 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3479 = _3473;
    float _3481 = -_3469;
    float _3483 = _3481 + 1.0;
    float _3485 = exp2(_3471);
    float _3487 = fma(_3483, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3469);
    float _3489 = _3459 + _3348;
    float _3491 = _3479;
    float _3493 = _3479;
    if (!_3433)
    {
        _3475 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3495 = _3475;
    float _3497 = _3445 * _3487;
    float _3499 = _3489 * 0.5;
    float _3501 = _3066 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3503 = _3495;
    float _3505 = _3495;
    if (!_3433)
    {
        _3477 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3507 = _3477;
    float _3509 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_86.z = _3499;
    out.m_86.w = _3348;
    float _3511 = -_3485;
    float _3513 = _3511 + 1.0;
    float _3515 = _3513 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3517 = -_3515;
    float _3519 = _3517 + 1.0;
    float _3521 = -_3378;
    float _3523 = _3521 + 1.0;
    float _3525 = _3523 * _3509;
    float _3527 = precise::clamp(_3525, 0.0, 1.0);
    float _3529 = -_3527;
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3533 = _3531 * _3457;
    float _3535 = _3533 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3537 = _3515 * _3398;
    out.m_88.x = _3535;
    float _3539 = _3409 * _3537;
    float _3541 = _3419 * _3537;
    float _3543 = fma(_3415, _3539, _3403);
    float _3545 = fma(_3417, _3539, _3405);
    float _3547 = _3409 * _3519;
    float _3549 = fma(_3409, _3541, _3407);
    float _3551 = _3407;
    float _3553 = _3519;
    float _3555 = _3539;
    float _3557 = _3507;
    float _3559 = _3507;
    if (!_3433)
    {
        _3551 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3561 = _3551;
    float _3563 = _3561;
    float _3565 = _3561;
    if (!_3433)
    {
        _3553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3567 = _3553;
    out.m_90.x = _3543;
    out.m_90.y = _3545;
    out.m_90.z = _3549;
    out.m_90.w = _3547;
    float _3569 = _3567;
    float _3571 = _3567;
    if (!_3433)
    {
        _3555 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3573 = _3555;
    bool _3575 = !_3433;
    float _3577 = _3573;
    float _3579 = _3573;
    if (!_3575)
    {
        bool _3581 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3583 = isnan(_3214);
        bool _3585 = _3581 || _3583;
        bool _3587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3589 = _3585 || _3587;
        if (!_3589)
        {
            float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3593 = _3214 + _3591;
            float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3595;
            float _3599 = 1.0 / _3597;
            float _3601 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3603 = _3601 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3605 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3607 = _3605 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3615 = _3613 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3621 = _3593 * _3599;
            float _3623 = precise::clamp(_3621, 0.0, 1.0);
            float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3627 = _3625 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3629 = fma(_3623, _3603, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3631 = fma(_3623, _3627, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3633 = fma(_3623, _3607, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3635 = fma(_3623, _3611, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3637 = fma(_3623, _3615, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3639 = fma(_3623, _3619, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3505 = _3631;
            _3571 = _3637;
            _3565 = _3629;
            _3493 = _3635;
            _3559 = _3633;
            _3579 = _3639;
            _3641 = true;
        }
        else
        {
            bool _3643 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3645 = isnan(_3214);
            bool _3647 = _3643 || _3645;
            bool _3649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3651 = _3647 || _3649;
            if (!_3651)
            {
                _3563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3653 = _3563;
            _3565 = _3653;
            if (!_3651)
            {
                _3503 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3655 = _3503;
            _3505 = _3655;
            if (!_3651)
            {
                _3557 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3657 = _3557;
            _3559 = _3657;
            if (!_3651)
            {
                _3491 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3659 = _3491;
            _3493 = _3659;
            if (!_3651)
            {
                _3569 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3661 = _3569;
            _3571 = _3661;
            if (!_3651)
            {
                _3577 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3663 = _3577;
            bool _3665 = !_3651;
            _3579 = _3663;
            if (!_3665)
            {
                bool _3667 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3669 = isnan(_3214);
                bool _3671 = _3667 || _3669;
                bool _3673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3675 = _3671 || _3673;
                if (!_3675)
                {
                    float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3679 = _3214 + _3677;
                    float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3683 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3681;
                    float _3685 = 1.0 / _3683;
                    float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3703 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3707 = _3679 * _3685;
                    float _3709 = precise::clamp(_3707, 0.0, 1.0);
                    float _3711 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3713 = _3711 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3715 = fma(_3709, _3689, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3717 = fma(_3709, _3713, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3719 = fma(_3709, _3693, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3721 = fma(_3709, _3697, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3723 = fma(_3709, _3701, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3725 = fma(_3709, _3705, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3505 = _3717;
                    _3571 = _3723;
                    _3565 = _3715;
                    _3493 = _3721;
                    _3559 = _3719;
                    _3579 = _3725;
                    _3641 = true;
                }
                else
                {
                    _3505 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3571 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3493 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3559 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3579 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3641 = false;
    float _3727 = _3505;
    float _3729 = _3571;
    float _3731 = _3565;
    float _3733 = _3493;
    float _3735 = _3559;
    float _3737 = _3579;
    float _3739 = fma(_2682, -0.5, 0.5);
    float _3741 = precise::clamp(_3739, 0.0, 1.0);
    float _3743 = -_3727;
    float _3745 = _3743 + _3729;
    float _3747 = _3501 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3749 = -_3731;
    float _3751 = _3749 + _3733;
    out.m_92.x = 0.0;
    float _3753 = fma(_3741, _3745, _3727);
    float _3755 = fma(_3741, _3751, _3731);
    out.m_51.x = _3747;
    float _3757 = -_3735;
    float _3759 = _3757 + _3737;
    float _3761 = _3753 * 0.586610972881317138671875;
    bool _3763 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3765 = fma(_3741, _3759, _3735);
    float _3767 = fma(_3755, 0.298911988735198974609375, _3761);
    bool _3769 = _3066 > 0.0;
    bool _3771 = isnan(_3066);
    bool _3773 = _3769 || _3771;
    bool _3775 = isnan(0.0);
    bool _3777 = _3773 || _3775;
    float _3779 = fma(_3765, 0.114477999508380889892578125, _3767);
    float _3781 = -_3779;
    float _3783 = _3755 + _3781;
    float _3785 = -_3779;
    float _3787 = _3753 + _3785;
    float _3789 = -_3779;
    float _3791 = _3765 + _3789;
    float _3793 = fma(_3783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3779);
    float _3795 = fma(_3787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3779);
    float _3797 = fma(_3791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3779);
    bool _3799 = !_3763;
    if (!_3799)
    {
        float _3801 = -_3012;
        float _3803 = _3801 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3805 = -_3014;
        float _3807 = _3805 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3809 = -_3016;
        float _3811 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3813 = _3803 * _3803;
        float _3815 = fma(_3807, _3807, _3813);
        float _3817 = fma(_3811, _3811, _3815);
        float _3819 = sqrt(_3817);
        float _3821 = rsqrt(_3817);
        float _3823 = -_3819;
        float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3827 = _3825 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3829 = precise::clamp(_3827, 0.0, 1.0);
        float _3831 = _3807 * _3821;
        float _3833 = _3803 * _3821;
        float _3835 = abs(_3829);
        float _3837 = log2(_3835);
        float _3839 = _3811 * _3821;
        float _3841 = _3831 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3843 = _2682 * _3833;
        float _3845 = -_3833;
        float _3847 = -_3841;
        float _3849 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3847);
        float _3851 = fma(_2686, _3831, _3843);
        float _3853 = -_3839;
        float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3849);
        float _3857 = fma(_2688, _3839, _3851);
        float _3859 = precise::clamp(_3857, 0.0, 1.0);
        float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3863 = _3855 + _3861;
        float _3865 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3867 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3869 = precise::clamp(_3867, 0.0, 1.0);
        float _3871 = exp2(_3865);
        float _3873 = _3871 * _3869;
        float _3875 = _3859 * _3873;
        float _3877 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3879 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3881 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3877;
        out.m_92.y = _3879;
        out.m_92.z = _3881;
    }
    out.m_94.x = _3793;
    out.m_94.y = _3795;
    out.m_94.z = _3797;
    if (_3777)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3883 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3883;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3641 = false;
    bool _2736 = false;
    bool _487 = false;
    bool _337 = false;
    bool _235 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3940 = as_type<float>(_129);
        out.gl_Position.z = _3940;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4009 = as_type<float>(_167);
        out.gl_Position.z = _4009;
    }
    if (_161)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _215 = _211;
    float _233;
    if (!_213)
    {
        float _217 = in.m_60.x;
        float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _225 = _223 * _219;
        float _227 = floor(_225);
        float _229 = -_227;
        float _231 = _225 + _229;
        _233 = _231;
        _235 = true;
    }
    else
    {
        float _237 = float(_113);
        float _239 = 1.0 / _237;
        float _241 = _147 * _239;
        _233 = _241;
    }
    _235 = false;
    float _243 = _233;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    bool _249 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _251 = isnan(_243);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _261;
    float _265 = -_259;
    float _267 = _265 + 1.0;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _281;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _263;
    float _289 = _279 * _267;
    float _291 = -_279;
    float _293 = _291 + 1.0;
    float _295 = _247 * _287;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _297;
    float _301 = fma(_283, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_299, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = _301 * _289;
    float _307 = _303 * _289;
    float _309 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _305);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _307);
    float _313 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].x, _309);
    float _315 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].y, _311);
    bool _317 = !_285;
    float _335;
    if (!_317)
    {
        float _319 = in.m_60.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        float _339 = float(_113);
        float _341 = 1.0 / _339;
        float _343 = _147 * _341;
        _335 = _343;
    }
    _337 = false;
    float _345 = _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _349 = _345 + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = isnan(_345);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _371 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _373 = isnan(_345);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _383;
    bool _387 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _389 = isnan(_345);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = 1.0 / _353;
    float _401 = -_365;
    float _403 = _401 + 1.0;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _407 = _381 * _403;
    float _409 = -_381;
    float _411 = _409 + 1.0;
    float _413 = 1.0 / _369;
    float _415 = _385 * _399;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _421 = fma(_415, _349, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _423 = _419 * _413;
    float _425 = _421 * _407;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = _345 + _431;
    float _435 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[115].x, _425);
    float _437 = _365 * _429;
    float _439 = fma(_423, _433, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _443 = fma(_439, _437, _435);
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _447 = _441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _449 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[117].x, _443);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _453 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _455 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _457 = in.m_62.x;
    float _459 = in.m_62.y;
    float _461 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _447;
    out.m_64.y = _461;
    out.m_64.z = _453;
    out.m_64.w = _455;
    float _463 = _315 * _459;
    float _465 = _313 * _457;
    bool _467 = !_405;
    float _485;
    if (!_467)
    {
        float _469 = in.m_60.x;
        float _471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _473 = _469 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _477 = _475 * _471;
        float _479 = floor(_477);
        float _481 = -_479;
        float _483 = _477 + _481;
        _485 = _483;
        _487 = true;
    }
    else
    {
        float _489 = float(_113);
        float _491 = 1.0 / _489;
        float _493 = _147 * _491;
        _485 = _493;
    }
    _487 = false;
    float _495 = _485;
    float _497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _499 = int(_497);
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _503 = _501 != 0;
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _507 = int(_505);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _511 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _513 = isnan(_495);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _525 = float(_499);
    float _527 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _529 = int(_527);
    float _531 = float(_507);
    float _533 = 1.0 / _525;
    float _535 = 1.0 / _531;
    float _537 = float(uint(_529));
    int _539 = ~_529;
    int _541 = _539 + 1;
    float _543 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _545 = int(_543);
    float _547 = _533 * _147;
    float _549 = _535 * _147;
    float _551 = 1.0 / _537;
    float _553 = float(uint(_545));
    float _555 = trunc(_547);
    int _557 = int(_555);
    int _559 = ~_545;
    int _561 = _559 + 1;
    float _563 = float(_545);
    float _565 = 1.0 / _553;
    int _567 = as_type<int>(_551) + (-2);
    float _569 = in.m_60.x;
    float _571 = in.m_60.y;
    float _573 = in.m_60.z;
    float _575 = in.m_60.w;
    float _577 = trunc(_549);
    int _579 = int(_577);
    float _581 = float(uint(_557));
    float _583 = as_type<float>(_567) * _581;
    int _585 = as_type<int>(_565) + (-2);
    float _587 = _581;
    if (_503)
    {
        float _589 = in.m_60.x;
        _587 = _589;
    }
    float _591 = _587;
    float _593 = trunc(_583);
    float _595 = precise::max(_593, 0.0);
    uint _598 = uint(_595);
    float _600 = _591;
    if (!_503)
    {
        float _602 = in.m_60.y;
        _600 = _602;
    }
    float _604 = _600;
    float _606 = float(uint(_579));
    float _608 = float(_579);
    float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _612 = _571 > 0.5;
    float _614 = as_type<float>(_585) * _606;
    float _616 = _606;
    if (_503)
    {
        _616 = 1.0;
    }
    float _618 = _616;
    float _620 = _618;
    if (!_503)
    {
        _620 = 7.345489978790283203125;
    }
    float _622 = _620;
    int _624 = _541 * int(_598);
    int _626 = _624 + _557;
    float _628 = trunc(_614);
    float _630 = precise::max(_628, 0.0);
    uint _632 = uint(_630);
    bool _634 = _608 >= _563;
    bool _636 = isnan(_608);
    bool _638 = _634 || _636;
    bool _640 = isnan(_563);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _622 * _569;
    float _648 = trunc(_644);
    int _650 = int(_648);
    float _652 = _610 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _654 = _561 * int(_632);
    int _656 = _654 + _579;
    float _658 = float(uint(_626));
    float _660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _662 = float(uint(_656));
    float _664 = as_type<float>(_567) * _658;
    float _666 = trunc(_664);
    float _668 = precise::max(_666, 0.0);
    uint _670 = uint(_668);
    float _672 = as_type<float>(_585) * _662;
    float _674 = _662;
    if (_503)
    {
        _674 = 1.0;
    }
    float _676 = _674;
    float _678 = _676;
    if (!_503)
    {
        _678 = 1.2345600128173828125;
    }
    float _680 = _678;
    bool _682 = _575 > 0.5;
    float _684 = floor(_646);
    float _686 = _680 * _604;
    int _688 = ~_529;
    int _690 = _688 + 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _702 = _700 != 0;
    bool _704 = _573 > 0.5;
    float _706 = trunc(_672);
    float _708 = precise::max(_706, 0.0);
    uint _710 = uint(_708);
    int _712 = int(_598) + int(_670);
    float _714 = float(_113);
    float _716 = -_205;
    int _718 = _682 ? as_type<int>(_716) : as_type<int>(_205);
    int _720 = _690 * _712;
    int _722 = _720 + _557;
    float _724 = -_195;
    int _726 = _612 ? as_type<int>(_724) : as_type<int>(_195);
    float _728 = -_684;
    float _730 = _646 + _728;
    float _732 = -_205;
    int _734 = _704 ? as_type<int>(_732) : as_type<int>(_205);
    float _736 = 1.0 / _714;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _740 = _738 != 0;
    bool _742 = !_698;
    float _744 = _742 ? _195 : as_type<float>(_726);
    int _746 = int(_632) + int(_710);
    float _748 = floor(_686);
    bool _750 = !_702;
    float _752 = _750 ? _205 : as_type<float>(_734);
    float _754 = _744 + 0.5;
    bool _756 = !_740;
    int _758 = _756 ? 0 : 1;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _770 = _768 != 0;
    bool _772 = uint(_722) >= uint(_529);
    float _774 = _736 * _147;
    float _776 = float(_529);
    float _778 = float(_557);
    int _780 = ~_545;
    int _782 = _780 + 1;
    bool _784 = _778 >= _776;
    bool _786 = isnan(_778);
    bool _788 = _784 || _786;
    bool _790 = isnan(_776);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -_748;
    float _798 = _686 + _796;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _802 = _800 != 0;
    int _804 = _782 * _746;
    int _806 = _804 + _579;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _810 = _808 != 0;
    float _812 = _798 * _563;
    bool _814 = !_802;
    int _816 = _814 ? 0 : 1;
    float _818 = trunc(_794);
    int _820 = int(_818);
    bool _822 = uint(_806) >= uint(_545);
    bool _824 = !_772;
    int _826 = _824 ? 0 : (-1);
    bool _828 = !_694;
    float _830 = _828 ? _205 : as_type<float>(_718);
    bool _832 = !_810;
    int _834 = _832 ? 0 : 1;
    float _836 = trunc(_812);
    int _838 = int(_836);
    bool _840 = !_822;
    int _842 = _840 ? 0 : (-1);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _858 = _856 != 0;
    int _860 = ~_712;
    int _862 = _860 + _826;
    int _864 = _862 + 1;
    float _866 = _730 * _776;
    float _868 = _776 * _774;
    bool _870 = !_850;
    int _872 = _870 ? 0 : 1;
    int _874 = _529 * _864;
    int _876 = _874 + _557;
    bool _878 = _529 == 0;
    float _880 = trunc(_866);
    int _882 = int(_880);
    int _884 = ~_820;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    bool _890 = !_878;
    int _892 = _890 ? _876 : (-1);
    bool _894 = !_766;
    int _896 = _894 ? 0 : 1;
    int _898 = _529 + (-1);
    float _900 = trunc(_868);
    int _902 = int(_900);
    int _904 = _892 * _888;
    bool _906 = !_762;
    int _908 = _906 ? 0 : 1;
    int _910 = abs(_896);
    int _912 = _820 * _898;
    int _914 = _912 + _904;
    int _916 = abs(_758);
    int _918 = abs(_908);
    int _920 = _914 * _910;
    float _922 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _924 = log2(_922);
    float _926 = _563 * _774;
    int _928 = ~_746;
    int _930 = _928 + _842;
    int _932 = _930 + 1;
    int _934 = _882 * _916;
    int _936 = _934 + _557;
    bool _938 = !_770;
    int _940 = _938 ? 0 : 1;
    int _942 = _902 * _918;
    int _944 = _942 + _920;
    bool _946 = !_846;
    int _948 = _946 ? 0 : 1;
    int _950 = _545 * _932;
    int _952 = _950 + _579;
    int _954 = abs(_940);
    float _956 = trunc(_926);
    int _958 = int(_956);
    bool _960 = _545 == 0;
    int _962 = abs(_816);
    int _964 = _936 * _954;
    int _966 = _964 + _944;
    int _968 = abs(_834);
    int _970 = ~_650;
    int _972 = _970 + 1;
    int _974 = _972 + 1;
    int _976 = _882 * _962;
    int _978 = _976 + _966;
    bool _980 = !_960;
    int _982 = _980 ? _952 : (-1);
    float _984 = _571 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _986 = _545 + (-1);
    int _988 = _982 * _974;
    float _990 = float(uint(_978));
    int _992 = _838 * _968;
    int _994 = _992 + _579;
    int _996 = abs(_872);
    int _998 = _650 * _986;
    int _1000 = _998 + _988;
    bool _1002 = !_854;
    int _1004 = _1002 ? 0 : 1;
    float _1006 = as_type<float>(_567) * _990;
    int _1008 = abs(_948);
    float _1010 = fma(_984, -2.0, _509);
    bool _1012 = !_858;
    int _1014 = _1012 ? 0 : 1;
    int _1016 = abs(_1004);
    int _1018 = _1000 * _996;
    int _1020 = abs(_1014);
    float _1022 = trunc(_1006);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = _958 * _1008;
    int _1030 = _1028 + _1018;
    float _1032 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    int _1034 = ~_529;
    int _1036 = _1034 + 1;
    int _1038 = _994 * _1016;
    int _1040 = _1038 + _1030;
    int _1042 = ~_545;
    int _1044 = _1042 + 1;
    int _1046 = ~_529;
    int _1048 = _1046 + 1;
    int _1050 = _838 * _1020;
    int _1052 = _1050 + _1040;
    bool _1054 = _571 > 0.5;
    float _1056 = float(uint(_1052));
    int _1058 = _1036 * int(_1026);
    int _1060 = _1058 + _978;
    float _1062 = -_205;
    int _1064 = _1054 ? as_type<int>(_1062) : as_type<int>(_205);
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1068 = _1066 != 0;
    float _1070 = as_type<float>(_585) * _1056;
    float _1072 = float(uint(_1060));
    float _1074 = float(uint(_936));
    float _1076 = trunc(_1070);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    float _1082 = as_type<float>(_567) * _1072;
    float _1084 = float(uint(_994));
    float _1086 = as_type<float>(_567) * _1074;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1090 = ~_545;
    int _1092 = _1090 + 1;
    float _1094 = trunc(_1082);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    float _1100 = as_type<float>(_585) * _1084;
    bool _1102 = _573 > 0.5;
    int _1104 = _1044 * int(_1080);
    int _1106 = _1104 + _1052;
    float _1108 = trunc(_1086);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = float(uint(_1106));
    int _1116 = int(_1026) + int(_1098);
    float _1118 = trunc(_1100);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    float _1124 = as_type<float>(_585) * _1114;
    int _1126 = ~_529;
    int _1128 = _1126 + 1;
    int _1130 = _1048 * _1116;
    int _1132 = _1130 + _978;
    float _1134 = trunc(_1124);
    float _1136 = precise::max(_1134, 0.0);
    uint _1138 = uint(_1136);
    bool _1140 = uint(_1132) >= uint(_529);
    int _1142 = _1128 * int(_1112);
    int _1144 = _1142 + _936;
    bool _1146 = !_1140;
    int _1148 = _1146 ? 0 : (-1);
    float _1150 = float(uint(_1144));
    int _1152 = _1092 * int(_1122);
    int _1154 = _1152 + _994;
    int _1156 = ~_1116;
    int _1158 = _1156 + _1148;
    int _1160 = _1158 + 1;
    int _1162 = ~_545;
    int _1164 = _1162 + 1;
    float _1166 = as_type<float>(_567) * _1150;
    int _1168 = _529 * _1160;
    int _1170 = _1168 + _978;
    float _1172 = float(uint(_1154));
    int _1174 = int(_1080) + int(_1138);
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1178 = !_878;
    int _1180 = _1178 ? _1170 : (-1);
    float _1182 = as_type<float>(_585) * _1172;
    int _1184 = _1164 * _1174;
    int _1186 = _1184 + _1052;
    int _1188 = _1180 & 3;
    bool _1190 = _1188 != 0;
    float _1192 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1176);
    int _1194 = _1180 & 3;
    bool _1196 = _1194 != 0;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1200 = uint(_1186) >= uint(_545);
    float _1202 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1192);
    int _1204 = _1196 ? 0 : 1;
    float _1206 = trunc(_1166);
    float _1208 = precise::max(_1206, 0.0);
    uint _1210 = uint(_1208);
    bool _1212 = !_1200;
    int _1214 = _1212 ? 0 : (-1);
    float _1216 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1198);
    bool _1218 = uint(_1188) > 1u;
    float _1220 = _571 * 2.0;
    int _1222 = ~_1174;
    int _1224 = _1222 + _1214;
    int _1226 = _1224 + 1;
    float _1228 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1216);
    bool _1230 = _1188 != 3;
    float _1232 = -_1202;
    float _1234 = _1232 + 1.0;
    int _1236 = ~_1204;
    int _1238 = _1236 + 1;
    int _1240 = _1238 + 1;
    int _1242 = _545 * _1226;
    int _1244 = _1242 + _1052;
    int _1246 = _1052;
    int _1248 = _1240;
    int _1250 = _1204;
    float _1252 = as_type<float>(_1244);
    float _1254 = as_type<float>(_1138);
    float _1256 = as_type<float>(_1174);
    if (_1068)
    {
        _1246 = 0;
    }
    int _1258 = _1246;
    float _1260 = floor(_1220);
    int _1262 = _1258;
    if (!_1068)
    {
        _1262 = 2;
    }
    int _1264 = _1262;
    bool _1266 = !_960;
    int _1268 = _1266 ? _1244 : (-1);
    float _1270 = as_type<float>(_1264);
    if (!_1218)
    {
        int _1272 = ~_1204;
        int _1274 = _1272 + 1;
        _1248 = _1274;
    }
    int _1276 = _1248;
    bool _1278 = uint(_1188) >= 2u;
    if (_1068)
    {
        _1250 = 0;
    }
    int _1280 = _1250;
    int _1282 = _1278 ? 0 : 1;
    int _1284 = _1268 & 3;
    bool _1286 = _1284 != 0;
    int _1288 = ~_1282;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    int _1294 = _1292;
    int _1296 = _1280;
    if (_1230)
    {
        int _1298 = ~_1282;
        int _1300 = _1298 + 1;
        _1294 = _1300;
    }
    int _1302 = _1294;
    bool _1304 = uint(_1284) > 1u;
    if (!_1068)
    {
        _1296 = 1;
    }
    int _1306 = _1296;
    int _1308 = _1268 & 3;
    bool _1310 = _1308 != 0;
    float _1312 = _1310 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1314 = _1306 != 1;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1318 = ~as_type<int>(_1312);
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    int _1324 = _1322;
    float _1326 = _1312;
    if (!_1304)
    {
        int _1328 = ~as_type<int>(_1312);
        int _1330 = _1328 + 1;
        _1324 = _1330;
    }
    int _1332 = _1324;
    float _1334 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1316);
    bool _1336 = uint(_1284) >= 2u;
    float _1338 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1334);
    int _1340 = _1336 ? 0 : 1;
    bool _1342 = _1264 != 2;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1314)
    {
        _1252 = _573;
    }
    float _1346 = _1252;
    float _1348 = -_1338;
    float _1350 = _1348 + 1.0;
    float _1352 = _1346;
    if (_1314)
    {
        _1352 = _571;
    }
    float _1354 = _1352;
    if (!_1314)
    {
        _1326 = _571;
    }
    float _1356 = _1326;
    float _1358 = _1356;
    if (!_1314)
    {
        _1254 = _573;
    }
    float _1360 = _1254;
    float _1362 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1088);
    float _1364 = _1360;
    if (!_1314)
    {
        _1256 = _1356;
    }
    float _1366 = _1256;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1370 = _1366;
    if (_1314)
    {
        _1370 = _569;
    }
    float _1372 = _1370;
    float _1374 = _924 * _147;
    if (_1342)
    {
        _1270 = _569;
    }
    float _1376 = _1270;
    float _1378 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1362);
    float _1380 = _1376;
    if (!_1342)
    {
        _1380 = _573;
    }
    float _1382 = _1380;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1314)
    {
        _1358 = _569;
    }
    float _1386 = _1358;
    float _1388 = exp2(_1374);
    if (_1314)
    {
        _1364 = _571;
    }
    float _1390 = _1364;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1394 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1396 = _1394 != 0;
    float _1398 = _569 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1400 = ~_1340;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    float _1406 = -_1344;
    float _1408 = fma(_1392, 2.0, _1406);
    float _1410 = -_523;
    float _1412 = fma(_1398, 2.0, _1410);
    float _1414 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1416 = int(_1112) + int(_1210);
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1420 = -_147;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1412);
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1426 = fma(_1414, -2.0, _1368);
    float _1428 = -_1418;
    float _1430 = fma(_1384, 2.0, _1428);
    float _1432 = _1418;
    int _1434 = _1404;
    if (_1342)
    {
        _1432 = _571;
    }
    float _1436 = _1432;
    float _1438 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1424);
    float _1440 = _1436;
    if (!_1342)
    {
        _1440 = _569;
    }
    float _1442 = _1440;
    float _1444 = -_1388;
    float _1446 = _1444 + 1.0;
    float _1448 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1438);
    bool _1450 = _1284 != 3;
    float _1452 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1454 = -_195;
    int _1456 = _1102 ? as_type<int>(_1454) : as_type<int>(_195);
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1460 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1468 = _1464 || _1466;
    float _1470 = -_147;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1430);
    float _1474 = fma(_1452, -2.0, _1458);
    float _1476 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1426);
    float _1478 = _1468 ? _1446 : 0.0;
    float _1480 = _569 * 2.0;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1450)
    {
        int _1484 = ~_1340;
        int _1486 = _1484 + 1;
        _1434 = _1486;
    }
    int _1488 = _1434;
    float _1490 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1474);
    bool _1492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1494 = isnan(1.0);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1500 = _1496 || _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1504 = 1.0 + _1502;
    float _1506 = floor(_1480);
    float _1508 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1482);
    bool _1510 = _569 > 0.5;
    float _1512 = _573 * 2.0;
    int _1514 = ~_529;
    int _1516 = _1514 + 1;
    float _1518 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1508);
    float _1520 = -_195;
    int _1522 = _1510 ? as_type<int>(_1520) : as_type<int>(_195);
    float _1524 = -_1448;
    float _1526 = _1524 + 1.0;
    float _1528 = 1.0 / _1504;
    float _1530 = -_147;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1408);
    int _1534 = _1516 * _1416;
    int _1536 = _1534 + _936;
    bool _1538 = !_1396;
    float _1540 = _1538 ? _205 : as_type<float>(_1064);
    float _1542 = -_1518;
    float _1544 = _1542 + 1.0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1548 = _1546 != 0;
    float _1550 = -_1378;
    float _1552 = _1550 + 1.0;
    float _1554 = trunc(_1182);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    bool _1560 = _1506 > 0.0;
    float _1562 = _573 + _571;
    bool _1564 = !_1190;
    int _1566 = _1564 ? 0 : 1;
    float _1568 = _1562 + (-1.0);
    bool _1570 = !_1286;
    int _1572 = _1570 ? 0 : 1;
    if (_1500)
    {
        float _1574 = _1478 * _1528;
        _151 = _1574;
    }
    float _1576 = _151;
    bool _1578 = _1506 >= 0.0;
    bool _1580 = isnan(_1506);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan(0.0);
    bool _1586 = _1582 || _1584;
    float _1588 = floor(_1512);
    int _1590 = ~_545;
    int _1592 = _1590 + 1;
    float _1594 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1596 = _1586 ? 0 : 1;
    int _1598 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1600 = _1598 != 0;
    int _1602 = int(_1122) + int(_1558);
    int _1604 = ~_1596;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    bool _1610 = !_1548;
    float _1612 = _1610 ? _195 : as_type<float>(_1456);
    int _1614 = _1592 * _1602;
    int _1616 = _1614 + _994;
    int _1618 = _1608;
    if (!_1560)
    {
        int _1620 = ~_1596;
        int _1622 = _1620 + 1;
        _1618 = _1622;
    }
    int _1624 = _1618;
    bool _1626 = uint(_1536) >= uint(_529);
    bool _1628 = !_1600;
    float _1630 = _1628 ? _195 : as_type<float>(_1522);
    bool _1632 = _1260 >= 0.0;
    bool _1634 = isnan(_1260);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    bool _1642 = _1260 > 0.0;
    float _1644 = in.m_48.x;
    float _1646 = in.m_48.y;
    float _1648 = in.m_48.z;
    bool _1650 = !_1626;
    int _1652 = _1650 ? 0 : (-1);
    bool _1654 = uint(_1616) >= uint(_545);
    int _1656 = _1640 ? 0 : 1;
    bool _1658 = !_1654;
    int _1660 = _1658 ? 0 : (-1);
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1664 = _1662 != 0;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1668 = _1666 != 0;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1672 = _1670 != 0;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1678 = ~_1656;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    int _1684 = _1682;
    if (!_1642)
    {
        int _1686 = ~_1656;
        int _1688 = _1686 + 1;
        _1684 = _1688;
    }
    int _1690 = _1684;
    float _1692 = _569 + _571;
    bool _1694 = !_1668;
    int _1696 = _1694 ? 0 : 1;
    float _1698 = 1.0 / _1676;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1702 = _1700 != 0;
    float _1704 = _1692 + (-1.0);
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1708 = _1706 != 0;
    float _1710 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1712 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1714 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1716 = !_1664;
    int _1718 = _1716 ? 0 : 1;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1720;
    float _1724 = fma(_1644, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1710);
    float _1726 = fma(_1644, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1712);
    float _1728 = fma(_1644, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1714);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1732 = _495 + _1730;
    bool _1734 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1736 = isnan(_495);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = _1722 * _1698;
    float _1748 = -_521;
    float _1750 = _1748 + 1.0;
    float _1752 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1726);
    float _1754 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1724);
    float _1756 = fma(_1746, _1732, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1758 = _1744 * _1750;
    bool _1760 = _1588 >= 0.0;
    bool _1762 = isnan(_1588);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    float _1770 = -_1744;
    float _1772 = _1770 + 1.0;
    float _1774 = _1754 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1776 = _1756 * _1758;
    float _1778 = _1752 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1780 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1782 = _1768 ? 0 : 1;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1776);
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1788 = _1778 + _1786;
    bool _1790 = _1588 > 0.0;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1794 = _1774 + _1792;
    float _1796 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1728);
    float _1798 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1800 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1784);
    float _1802 = _1540 + (-0.5);
    int _1804 = ~_1782;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1798);
    int _1812 = _1180 >> 31;
    float _1814 = -_1802;
    float _1816 = -_1032;
    float _1818 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1816);
    int _1820 = _1268 >> 31;
    float _1822 = _1796 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1824 = _1812 & 3;
    float _1826 = _1630 + 0.5;
    int _1828 = _1808;
    if (!_1790)
    {
        int _1830 = ~_1782;
        int _1832 = _1830 + 1;
        _1828 = _1832;
    }
    int _1834 = _1828;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1838 = _1822 + _1836;
    int _1840 = _1820 & 3;
    float _1842 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1422);
    int _1844 = _1180 + _1824;
    float _1846 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1810);
    int _1848 = _1268 + _1840;
    int _1850 = _1844 >> 2;
    int _1852 = _1848 >> 2;
    int _1854 = _1850 << 4;
    int _1856 = _1854 + 368;
    bool _1858 = _1188 != 3;
    int _1860 = _1852 << 4;
    int _1862 = _1860 + 512;
    uint _1864 = uint(int(uint(_1856) >> uint(2)));
    uint _1866 = uint(int(uint(int(_1864)) >> uint(2)));
    int _1868 = int(_1864) & 3;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[int(_1866)][_1868];
    int _1872 = int(_1864) + 1;
    uint _1874 = uint(int(uint(_1872) >> uint(2)));
    int _1876 = _1872 & 3;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[int(_1874)][_1876];
    bool _1880 = !_1858;
    int _1882 = _1880 ? 0 : (-1);
    bool _1884 = _1284 != 3;
    int _1886 = abs(_1696);
    int _1888 = abs(_1718);
    uint _1890 = uint(int(uint(_1862) >> uint(2)));
    uint _1892 = uint(int(uint(int(_1890)) >> uint(2)));
    int _1894 = int(_1890) & 3;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[int(_1892)][_1894];
    int _1898 = int(_1890) + 1;
    uint _1900 = uint(int(uint(_1898) >> uint(2)));
    int _1902 = _1898 & 3;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[int(_1900)][_1902];
    float _1906 = float(_1834);
    float _1908 = float(_1888);
    float _1910 = float(_1624);
    float _1912 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1914 = fma(_652, _754, _1532);
    int _1916 = _1856 + 8;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    uint _1920 = uint(int(uint(int(_1918)) >> uint(2)));
    int _1922 = int(_1918) & 3;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[int(_1920)][_1922];
    int _1926 = int(_1918) + 1;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    int _1930 = _1926 & 3;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[int(_1928)][_1930];
    float _1934 = _1908 * _1906;
    bool _1936 = !_1884;
    int _1938 = _1936 ? 0 : (-1);
    float _1940 = _1612 + 0.5;
    bool _1942 = _1846 >= 0.0;
    float _1944 = -_1350;
    float _1946 = fma(_744, _1944, _1914);
    float _1948 = in.m_66.x;
    float _1950 = in.m_66.y;
    float _1952 = in.m_66.z;
    int _1954 = _1862 + 8;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1974 = float(_1886);
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1978 = abs(_1882);
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1982 = 0.0;
    int _1984 = _1888;
    if (_1942)
    {
        _1982 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1986 = _1982;
    float _1988 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1990 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1994 = _1974 * _1910;
    if (_1942)
    {
        float _1996 = _1986 * 5.0;
        _1984 = as_type<int>(_1996);
    }
    int _1998 = _1984;
    int _2000 = ~_1416;
    int _2002 = _2000 + _1652;
    int _2004 = _2002 + 1;
    float _2006 = _660 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_68.x = _1988;
    out.m_68.y = _1990;
    out.m_68.z = _1992;
    out.m_68.w = _1912;
    int _2008 = ~_1602;
    int _2010 = _2008 + _1660;
    int _2012 = _2010 + 1;
    float _2014 = _752 + (-0.5);
    int _2016 = _529 * _2004;
    int _2018 = _2016 + _936;
    if (_1942)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6757 = as_type<float>(_1998);
        out.gl_Position.z = _6757;
    }
    float _2020 = _830 + (-0.5);
    int _2022 = _545 * _2012;
    int _2024 = _2022 + _994;
    float _2026 = _1934 * (-2.0);
    if (_1942)
    {
        out.m_51.x = 0.0;
    }
    float _2028 = fma(_2026, _1948, _1948);
    int _2030 = abs(_1276);
    float _2032 = -_2006;
    float _2034 = -_1490;
    float _2036 = fma(_2032, _2014, _2034);
    int _2038 = abs(_1332);
    float _2040 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1472);
    int _2042 = abs(_1566);
    float _2044 = -_2020;
    float _2046 = -_1476;
    float _2048 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2046);
    int _2050 = ~_2030;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    float _2056 = -_1526;
    float _2058 = fma(_1612, _2056, _2040);
    int _2060 = ~_2038;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    float _2066 = fma(_830, _1552, _2048);
    int _2068 = ~_2042;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    int _2074 = _2054 * as_type<int>(_1878);
    int _2076 = abs(_1572);
    int _2078 = _2064 * as_type<int>(_1904);
    int _2080 = abs(_1302);
    int _2082 = _2072 * as_type<int>(_1870);
    int _2084 = _2082 + _2074;
    int _2086 = ~_2076;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    float _2092 = _1788 * _1788;
    int _2094 = abs(_1488);
    float _2096 = fma(_1780, _2026, _1780);
    int _2098 = ~_2080;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    int _2104 = _2090 * as_type<int>(_1896);
    int _2106 = _2104 + _2078;
    int _2108 = abs(_1938);
    int _2110 = ~_2094;
    int _2112 = _2110 + 1;
    int _2114 = _2112 + 1;
    int _2116 = _2102 * as_type<int>(_1924);
    int _2118 = _2116 + _2084;
    bool _2120 = !_1708;
    int _2122 = _2120 ? 0 : 1;
    int _2124 = ~_2108;
    int _2126 = _2124 + 1;
    int _2128 = _2126 + 1;
    int _2130 = _2114 * as_type<int>(_1962);
    int _2132 = _2130 + _2106;
    bool _2134 = !_1702;
    int _2136 = _2134 ? 0 : 1;
    int _2138 = abs(_2122);
    int _2140 = _2128 * as_type<int>(_1970);
    int _2142 = _2140 + _2132;
    int _2144 = abs(_2136);
    float _2146 = fma(_1794, _1794, _2092);
    float _2148 = _1994 * (-2.0);
    int _2150 = ~_1978;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    float _2156 = fma(_752, _1544, _2036);
    int _2158 = ~_2144;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = fma(_2148, _1950, _1950);
    float _2166 = fma(_1838, _1838, _2146);
    int _2168 = _2154 * as_type<int>(_1932);
    int _2170 = _2168 + _2118;
    int _2172 = ~_2138;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    float _2178 = -_1228;
    float _2180 = _2178 + 1.0;
    out.m_70.x = _1946;
    out.m_70.y = _2156;
    int _2182 = _2170 * _2162;
    float _2184 = rsqrt(_2166);
    bool _2186 = !_878;
    int _2188 = _2186 ? _2018 : (-1);
    float _2190 = fma(_1594, _2148, _1594);
    int _2192 = _2142 * _2176;
    float _2194 = fma(_1540, _2180, _1818);
    int _2196 = _2188 * _2144;
    int _2198 = _2196 + _2182;
    float _2200 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _2202 = !_960;
    int _2204 = _2202 ? _2024 : (-1);
    float _2206 = _2200 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2208 = float(_2198);
    int _2210 = _2204 * _2138;
    int _2212 = _2210 + _2192;
    float _2214 = -_1234;
    float _2216 = fma(_1630, _2214, _1842);
    float _2218 = _569 + (-0.5);
    float _2220 = _2206 * _2184;
    float _2222 = float(_2212);
    out.m_72.x = _2216;
    out.m_72.y = _2194;
    out.m_72.z = _2058;
    out.m_72.w = _2066;
    float _2224 = _1788 * _2220;
    float _2226 = _1794 * _2220;
    float _2228 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2028);
    out.m_74.x = _2208;
    out.m_74.y = _2222;
    float _2230 = -_2224;
    float _2232 = _1788 + _2230;
    bool _2234 = !_1672;
    int _2236 = _2234 ? 0 : 1;
    float _2238 = -_2226;
    float _2240 = _1794 + _2238;
    float _2242 = _2232 * _2232;
    float _2244 = _2224;
    if (_1942)
    {
        return out;
    }
    float _2246 = -_2224;
    float _2248 = _1778 + _2246;
    float _2250 = _1838 * _2220;
    float _2252 = -_2226;
    float _2254 = _1774 + _2252;
    int _2256 = abs(_2236);
    float _2258 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2260 = _2248 + _2258;
    float _2262 = -_2250;
    float _2264 = _1822 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2268 = _2254 + _2266;
    float _2270 = _571 + (-0.5);
    float _2272 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2276 = _2264 + _2274;
    float _2278 = float(_1690);
    float _2280 = _573 + _569;
    float _2282 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2272);
    float _2284 = float(_2256);
    float _2286 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2164);
    float _2288 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2282);
    float _2290 = _2280 + (-1.0);
    float _2292 = _2284 * _2278;
    float _2294 = fma(_2190, _1576, _2286);
    float _2296 = _573 + (-0.5);
    bool _2298 = _2288 >= 0.0;
    float _2300 = _2292 * (-2.0);
    float _2302 = fma(_2290, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2304 = fma(_2240, _2240, _2242);
    float _2306 = -_2250;
    float _2308 = _1838 + _2306;
    float _2310 = fma(_2300, _1952, _1952);
    float _2312 = fma(_2096, _1576, _2228);
    float _2314 = _2294 * 0.15915493667125701904296875;
    float _2316 = fma(_2302, _2300, _2302);
    float _2318 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2310);
    float _2320 = fma(_2308, _2308, _2304);
    float _2322 = _2312 * 0.15915493667125701904296875;
    float _2324 = _2314 * 6.283185482025146484375;
    float _2326 = sin(_2324);
    float _2328 = _2288;
    int _2330 = as_type<int>(_2296);
    float _2332 = _2250;
    float _2334 = _2254;
    if (_2298)
    {
        _2328 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2336 = _2328;
    float _2338 = fma(_2316, _1576, _2318);
    if (_2298)
    {
        out.m_51.x = 0.0;
    }
    if (_2298)
    {
        float _2340 = _2336 * 5.0;
        _2330 = as_type<int>(_2340);
    }
    int _2342 = _2330;
    float _2344 = _2338 * 0.15915493667125701904296875;
    float _2346 = sqrt(_2320);
    if (_2298)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7250 = as_type<float>(_2342);
        out.gl_Position.z = _7250;
    }
    float _2348 = _2322 * 6.283185482025146484375;
    float _2350 = sin(_2348);
    float _2352 = _2322 * 6.283185482025146484375;
    float _2354 = cos(_2352);
    float _2356 = _2314 * 6.283185482025146484375;
    float _2358 = cos(_2356);
    if (_2298)
    {
        return out;
    }
    float _2360 = _2344 * 6.283185482025146484375;
    float _2362 = cos(_2360);
    float _2364 = _2184 * _2346;
    float _2366 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _2370 = _2354 * _2358;
    float _2372 = _2200 * _2364;
    float _2374 = _2364 * _2366;
    float _2376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _2378 = _2344 * 6.283185482025146484375;
    float _2380 = sin(_2378);
    float _2382 = _2350 * _2358;
    float _2384 = _2368 * _2374;
    float _2386 = _2350 * _2326;
    float _2388 = _2354 * _2326;
    float _2390 = _2376 * _2372;
    float _2392 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2394 = _2354 * _2362;
    float _2396 = _2350 * _2362;
    float _2398 = _2358 * _2362;
    float _2400 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2402 = _2400 * 0.5;
    float _2404 = _2394 * _2384;
    float _2406 = _2326 * _2362;
    float _2408 = fma(_2380, _2370, _2386);
    float _2410 = -_2382;
    float _2412 = fma(_2380, _2388, _2410);
    float _2414 = -_2384;
    float _2416 = _2380 * _2414;
    float _2418 = -_2388;
    float _2420 = fma(_2380, _2382, _2418);
    float _2422 = fma(_2408, _2390, _2404);
    float _2424 = _2396 * _2384;
    float _2426 = fma(_2398, _2390, _2416);
    float _2428 = fma(_2380, _2386, _2370);
    float _2430 = fma(_2412, _2402, _2422);
    float _2432 = fma(_2420, _2390, _2424);
    float _2434 = fma(_2406, _2402, _2426);
    float _2436 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2438 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2440 = fma(_2428, _2402, _2432);
    float _2442 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2444 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2436);
    float _2446 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2438);
    float _2448 = _2408 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2450 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2442);
    float _2452 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2444);
    float _2454 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2446);
    float _2456 = _2408 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2458 = fma(_2392, _2392, 1.0);
    float _2460 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2462 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2464 = _2408 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2466 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2448);
    float _2468 = _1774 + _2460;
    float _2470 = _1822 + _2462;
    float _2472 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2464);
    float _2474 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2478 = _2468 + _2476;
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2482 = _2470 + _2480;
    float _2484 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2450);
    float _2486 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2456);
    float _2488 = _2478 * _2478;
    float _2490 = _2482 * _2482;
    float _2492 = rsqrt(_2458);
    float _2494 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2496 = -_2380;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2474);
    float _2500 = _2488 + _2490;
    float _2502 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2504 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2506 = -_2380;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2494);
    float _2510 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2512 = sqrt(_2500);
    float _2514 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2516 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2518 = _1778 + _2502;
    float _2520 = -_2380;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2504);
    float _2524 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2510);
    float _2526 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2514);
    float _2528 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2516);
    bool _2530 = _2512 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2532 = _2510;
    float _2534 = _2406;
    float _2536 = _2502;
    float _2538 = _2514;
    float _2540 = _2470;
    if (!_2530)
    {
        _2532 = _2470;
    }
    float _2542 = _2532;
    float _2544 = _2542;
    if (!_2530)
    {
        _2534 = _2490;
    }
    float _2546 = _2534;
    float _2548 = _2546;
    if (!_2530)
    {
        _2536 = _2488;
    }
    float _2550 = _2536;
    float _2552 = _2550;
    if (!_2530)
    {
        _2538 = _2468;
    }
    float _2554 = _2538;
    float _2556 = _2554;
    if (!_2530)
    {
        _2540 = _2518;
    }
    float _2558 = _2540;
    bool _2560 = !_2530;
    float _2562 = _2558;
    if (!_2560)
    {
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2568 = _2512 + _2566;
        float _2570 = rsqrt(_2500);
        float _2572 = _2568 * _2564;
        float _2574 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2576 = _2572 * 0.15915493667125701904296875;
        float _2578 = _2576 * 6.283185482025146484375;
        float _2580 = sin(_2578);
        float _2582 = _2576 * 6.283185482025146484375;
        float _2584 = cos(_2582);
        float _2586 = fma(_2580, _2574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2588 = _2570 * _2586;
        float _2590 = _2584 + (-1.0);
        float _2592 = fma(_2478, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2594 = fma(_2482, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2596 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2600 = _2592 + _2598;
        float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2604 = _2594 + _2602;
        float _2606 = fma(_2518, _2584, _2596);
        float _2608 = _2600 * _2600;
        float _2610 = _2604 * _2604;
        _2562 = _2606;
        _2552 = _2608;
        _2548 = _2610;
        _2556 = _2592;
        _2544 = _2594;
    }
    float _2612 = _2562;
    float _2614 = _2552;
    float _2616 = _2548;
    float _2618 = _2556;
    float _2620 = _2544;
    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2624 = _2612 + _2622;
    float _2626 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2498);
    float _2628 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2508);
    float _2630 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2522);
    float _2632 = fma(_2624, _2624, _2614);
    float _2634 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2524);
    float _2636 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2526);
    float _2638 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2528);
    float _2640 = _2632 + _2616;
    float _2642 = _2392 * _2492;
    float _2644 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2472);
    float _2646 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2648 = _2392 * _2626;
    float _2650 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2466);
    float _2652 = _2392 * _2628;
    float _2654 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2486);
    float _2656 = _2392 * _2630;
    float _2658 = -_2634;
    float _2660 = _2642 * _2658;
    float _2662 = -_2636;
    float _2664 = _2642 * _2662;
    float _2666 = -_2638;
    float _2668 = _2642 * _2666;
    float _2670 = fma(_2646, _2644, _2648);
    float _2672 = sqrt(_2640);
    float _2674 = fma(_2646, _2650, _2652);
    float _2676 = fma(_2646, _2654, _2656);
    float _2678 = fma(_2492, _2626, _2660);
    float _2680 = fma(_2492, _2628, _2664);
    float _2682 = _2636 + _2674;
    float _2684 = fma(_2492, _2630, _2668);
    float _2686 = _2634 + _2670;
    float _2688 = _2638 + _2676;
    out.m_76.x = _2644;
    out.m_76.y = _2650;
    out.m_76.z = _2654;
    out.m_78.x = _2678;
    out.m_78.y = _2680;
    out.m_78.z = _2684;
    bool _2690 = _2672 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2692 = isnan(_2672);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2698 = _2694 || _2696;
    out.m_80.x = _2686;
    out.m_80.y = _2682;
    out.m_80.z = _2688;
    float _2700 = _2676;
    if (!_2698)
    {
        _2700 = 1.0;
    }
    float _2702 = _2700;
    bool _2704 = !_2698;
    float _2706 = _2702;
    if (!_2704)
    {
        bool _2708 = _2672 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2710 = isnan(_2672);
        bool _2712 = _2708 || _2710;
        bool _2714 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2716 = _2712 || _2714;
        if (!_2716)
        {
            float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2720 = _2672 + _2718;
            float _2722 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2724 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2722;
            float _2726 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2730 = 1.0 / _2724;
            float _2732 = _2720 * _2730;
            float _2734 = fma(_2732, _2728, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2706 = _2734;
            _2736 = true;
        }
        else
        {
            bool _2738 = _2672 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2740 = isnan(_2672);
            bool _2742 = _2738 || _2740;
            bool _2744 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2746 = _2742 || _2744;
            if (!_2746)
            {
                float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2750 = _2672 + _2748;
                float _2752 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2754 = _2752 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2756 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2758 = _2756 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2760 = 1.0 / _2754;
                float _2762 = _2750 * _2760;
                float _2764 = fma(_2762, _2758, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2706 = _2764;
                _2736 = true;
            }
            else
            {
                _2706 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2736 = false;
    float _2766 = _2706;
    float _2768 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2770 = _2612 + _2768;
    float _2772 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2776 = _2618 + _2774;
    float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2780 = _2620 + _2778;
    float _2782 = fma(_2770, _2766, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2784 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2772);
    float _2786 = fma(_2776, _2766, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2788 = fma(_2780, _2766, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2790 = -_1778;
    float _2792 = _2790 + _2782;
    float _2794 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2796 = -_1774;
    float _2798 = _2796 + _2786;
    float _2800 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2802 = _2792 * _2792;
    float _2804 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2806 = -_1822;
    float _2808 = _2806 + _2788;
    float _2810 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2800);
    float _2812 = fma(_2798, _2798, _2802);
    float _2814 = 1.0 / _2804;
    float _2816 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2810);
    float _2818 = fma(_2808, _2808, _2812);
    float _2820 = _2816 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2822 = sqrt(_2818);
    float _2824 = _2820 + _2804;
    bool _2826 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2828 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan(0.5);
    bool _2834 = _2830 || _2832;
    float _2836 = _2824 * _2814;
    float _2838 = _2836 * 0.5;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2842 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2840);
    bool _2844 = _2822 > 0.0;
    float _2846 = 1.0 / _2842;
    bool _2848 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2850 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2852 = _2848 || _2850;
    bool _2854 = isnan(0.5);
    bool _2856 = _2852 || _2854;
    float _2858 = _2794;
    float _2860 = _2780;
    float _2862 = _2814;
    if (!_2844)
    {
        _2858 = _2786;
    }
    float _2864 = _2858;
    float _2866 = _2864;
    float _2868 = _2864;
    if (!_2844)
    {
        _2860 = _2782;
    }
    float _2870 = _2860;
    float _2872 = _2870;
    float _2874 = _2870;
    if (!_2844)
    {
        _2862 = _2788;
    }
    float _2876 = _2862;
    bool _2878 = !_2844;
    float _2880 = _2876;
    float _2882 = _2876;
    if (!_2878)
    {
        float _2884 = _209 * _209;
        float _2886 = fma(_207, _207, _2884);
        float _2888 = fma(_211, _211, _2886);
        float _2890 = rsqrt(_2818);
        float _2892 = sqrt(_2888);
        float _2894 = _2798 * _2890;
        float _2896 = _2792 * _2890;
        float _2898 = _2808 * _2890;
        bool _2900 = _2892 > 0.0;
        if (!_2900)
        {
            _2866 = _2786;
        }
        float _2902 = _2866;
        _2868 = _2902;
        if (!_2900)
        {
            _2872 = _2782;
        }
        float _2904 = _2872;
        _2874 = _2904;
        if (!_2900)
        {
            _2880 = _2788;
        }
        float _2906 = _2880;
        bool _2908 = !_2900;
        _2882 = _2906;
        if (!_2908)
        {
            float _2910 = rsqrt(_2888);
            float _2912 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2914 = _209 * _2910;
            float _2916 = _207 * _2910;
            float _2918 = _211 * _2910;
            float _2920 = _2896 * _2914;
            float _2922 = fma(_2894, _2916, _2920);
            float _2924 = _2912 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2926 = fma(_2898, _2918, _2922);
            float _2928 = _2926 * _2924;
            float _2930 = fma(_207, _2928, _2786);
            float _2932 = fma(_209, _2928, _2782);
            float _2934 = fma(_211, _2928, _2788);
            _2874 = _2932;
            _2868 = _2930;
            _2882 = _2934;
        }
    }
    float _2936 = _2874;
    float _2938 = _2868;
    float _2940 = _2882;
    float _2942 = -_2224;
    float _2944 = _2942 + _2936;
    float _2946 = -_2226;
    float _2948 = _2946 + _2938;
    float _2950 = -_2250;
    float _2952 = _2950 + _2940;
    float _2954 = _2944;
    float _2956 = _2948;
    float _2958 = _2952;
    if (_2834)
    {
        _2244 = 1.0;
    }
    float _2960 = _2244;
    float _2962 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2964 = _2846 * _2962;
    float _2966 = _2960;
    if (!_2856)
    {
        float _2968 = _2260 * _2260;
        float _2970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2972 = -_1822;
        float _2974 = _2972 + _2940;
        float _2976 = -_1774;
        float _2978 = _2976 + _2938;
        float _2980 = fma(_2268, _2268, _2968);
        float _2982 = fma(_2276, _2276, _2980);
        float _2984 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2986 = sqrt(_2982);
        float _2988 = 1.0 / _2364;
        float _2990 = _2984 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2992 = precise::min(_2986, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2994 = _2992 * _2970;
        float _2996 = _2994 * _2988;
        float _2998 = -_1778;
        float _3000 = _2998 + _2936;
        float _3002 = _2990 * _2996;
        float _3004 = _2974 * _2996;
        float _3006 = fma(_3000, _3002, _2248);
        float _3008 = fma(_2978, _3002, _2254);
        float _3010 = fma(_2990, _3004, _2264);
        _2954 = _3006;
        _2956 = _3008;
        _2958 = _3010;
    }
    float _3012 = _2954;
    float _3014 = _2956;
    float _3016 = _2958;
    if (!_2834)
    {
        float _3018 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3020 = _3018 * 0.15915493667125701904296875;
        float _3022 = _3020 * 6.283185482025146484375;
        float _3024 = cos(_3022);
        float _3026 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3028 = _3026 * 0.15915493667125701904296875;
        float _3030 = _3020 * 6.283185482025146484375;
        float _3032 = sin(_3030);
        float _3034 = 1.0 / _3024;
        float _3036 = _3028 * 6.283185482025146484375;
        float _3038 = cos(_3036);
        float _3040 = _3032 * _3034;
        float _3042 = _3028 * 6.283185482025146484375;
        float _3044 = sin(_3042);
        float _3046 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3048 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3046;
        float _3050 = _3038 * _3040;
        float _3052 = 1.0 / _3050;
        float _3054 = 1.0 / _3048;
        float _3056 = _3044 * _3052;
        float _3058 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3060 = fma(_2964, _3056, _3058);
        float _3062 = _3060 * _3054;
        float _3064 = precise::clamp(_3062, 0.0, 1.0);
        _2966 = _3064;
    }
    float _3066 = _2966;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3070 = _3012 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3074 = _3014 + _3072;
    float _3076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3078 = _3016 + _3076;
    float _3080 = _3070 * _3070;
    float _3082 = fma(_3074, _3074, _3080);
    float _3084 = fma(_3078, _3078, _3082);
    float _3086 = rsqrt(_3084);
    float _3088 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3090 = _3074 * _3088;
    float _3092 = _3078 * _3088;
    float _3094 = _3090 * _3090;
    float _3096 = _3092 * _3092;
    float _3098 = _3094 + _3096;
    float _3100 = sqrt(_3098);
    bool _3102 = _3100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3106 = _3100 + _3104;
    float _3108 = _3082;
    float _3110 = _3106;
    float _3112 = _3098;
    if (_3102)
    {
        float _3114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3108 = _3114;
    }
    float _3116 = _3108;
    if (_3102)
    {
        float _3118 = _3106 * _3116;
        _3110 = _3118;
    }
    float _3120 = _3110;
    if (_3102)
    {
        float _3122 = _3120 * 0.15915493667125701904296875;
        _2332 = _3122;
    }
    float _3124 = _2332;
    float _3126 = _3078;
    if (_3102)
    {
        float _3128 = _3124 * 6.283185482025146484375;
        float _3130 = sin(_3128);
        _3126 = _3130;
    }
    float _3132 = _3126;
    float _3134 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3136 = precise::max(0.0, _3134);
    float _3138 = _3086;
    float _3140 = _3136;
    if (_3102)
    {
        float _3142 = _3124 * 6.283185482025146484375;
        float _3144 = cos(_3142);
        _3138 = _3144;
    }
    float _3146 = _3138;
    float _3148 = -_3088;
    float _3150 = -_3136;
    float _3152 = fma(_3070, _3148, _3150);
    float _3154 = _3134;
    float _3156 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3102)
    {
        float _3158 = rsqrt(_3098);
        _3154 = _3158;
    }
    float _3160 = _3154;
    if (_3102)
    {
        float _3162 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3140 = _3162;
    }
    float _3164 = _3140;
    float _3166 = fma(_2254, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3168 = _3164;
    if (!_3102)
    {
        _2334 = _3094;
    }
    float _3170 = _2334;
    float _3172 = _3132;
    float _3174 = _3170;
    if (_3102)
    {
        float _3176 = fma(_3132, _3164, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3168 = _3176;
    }
    float _3178 = _3168;
    float _3180 = _3178;
    if (!_3102)
    {
        _3172 = _3152;
    }
    float _3182 = _3172;
    float _3184 = _3182;
    float _3186 = _3146;
    if (_3102)
    {
        float _3188 = _3146 + (-1.0);
        _3156 = _3188;
    }
    float _3190 = _3156;
    float _3192 = _3190;
    if (_3102)
    {
        float _3194 = _3190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3112 = _3194;
    }
    float _3196 = _3112;
    if (!_3102)
    {
        _3192 = _3092;
    }
    float _3198 = _3192;
    float _3200 = _3198;
    if (_3102)
    {
        float _3202 = _3160 * _3178;
        _215 = _3202;
    }
    float _3204 = _215;
    if (!_3102)
    {
        _3180 = _3090;
    }
    float _3206 = _3180;
    float _3208 = _3206;
    if (_3102)
    {
        float _3210 = fma(_3152, _3146, _3196);
        _3184 = _3210;
    }
    float _3212 = _3184;
    float _3214 = sqrt(_3084);
    if (_3102)
    {
        float _3216 = _3090 * _3204;
        _3208 = _3216;
    }
    float _3218 = _3208;
    if (_3102)
    {
        float _3220 = _3092 * _3204;
        _3200 = _3220;
    }
    float _3222 = _3200;
    if (!_3102)
    {
        _3186 = _3096;
    }
    float _3224 = _3186;
    float _3226 = _3224;
    if (_3102)
    {
        float _3228 = _3218 * _3218;
        _3174 = _3228;
    }
    float _3230 = _3174;
    if (_3102)
    {
        float _3232 = _3222 * _3222;
        _3226 = _3232;
    }
    float _3234 = _3226;
    float _3236 = floor(_3166);
    float _3238 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3240 = fma(_3212, _3212, _3230);
    float _3242 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3244 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3238);
    float _3246 = _3240 + _3234;
    float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3250 = fma(_3214, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3248);
    float _3252 = precise::clamp(_3250, 0.0, 1.0);
    float _3254 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3244);
    float _3256 = rsqrt(_3246);
    float _3258 = -_3252;
    float _3260 = _3258 + 1.0;
    float _3262 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3264 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3266 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3268 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3270 = abs(_3260);
    float _3272 = log2(_3270);
    float _3274 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3276 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3266);
    float _3278 = -_3268;
    float _3280 = fma(_3278, _3242, 1.0);
    float _3282 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3284 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3274);
    float _3286 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3276);
    float _3288 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3282);
    float _3290 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3284);
    float _3292 = _3256 * _3218;
    float _3294 = _3256 * _3212;
    float _3296 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3288);
    float _3298 = _3290 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3300 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3302 = _3256 * _3222;
    float _3304 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3306 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3308 = -_3300;
    float _3310 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3308);
    float _3312 = floor(_3264);
    float _3314 = _3272 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3316 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3306);
    float _3318 = -_3302;
    float _3320 = fma(_3318, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3310);
    float _3322 = -_3236;
    float _3324 = _3166 + _3322;
    float _3326 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3328 = fma(_3320, -0.5, 0.5);
    float _3330 = log2(_3280);
    float _3332 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3334 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3332);
    float _3336 = exp2(_3314);
    float _3338 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3340 = fma(_3320, 0.5, 0.5);
    float _3342 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3344 = -_3312;
    float _3346 = _3264 + _3344;
    float _3348 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3326);
    float _3350 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3342);
    float _3352 = sqrt(_3328);
    float _3354 = _3294 + 1.0;
    float _3356 = _3330 * 0.693147182464599609375;
    float _3358 = fma(_3340, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3360 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3350);
    float _3362 = fma(_3340, _3358, -0.212114393711090087890625);
    float _3364 = 1.0 / _3348;
    float _3366 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3334);
    float _3368 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3360);
    float _3370 = -_3294;
    float _3372 = fma(_3336, _3354, _3370);
    float _3374 = fma(_3340, _3362, 1.570728778839111328125);
    float _3376 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3366);
    float2 _8970 = float2(_3324, _3346);
    float _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8970, float2(0.0), isnan(_8970)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8970, float2(0.0), isnan(_8970)), level(0.0)).x;
    float _3380 = _3352 * 0.636619746685028076171875;
    float _3382 = -_3374;
    float _3384 = fma(_3380, _3382, 1.0);
    float _3386 = _3356 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3388 = fma(_3372, 0.5, 0.5);
    float _3390 = _3376 * _3364;
    float _3392 = _3368 * _3364;
    float _3394 = fma(_3390, 0.5, 0.5);
    float _3396 = fma(_3392, -0.5, 0.5);
    float3 _9005 = float3(_3394, _3396, _3386);
    float _3398 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9005, float3(0.0), isnan(_9005)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9005, float3(0.0), isnan(_9005)), level(0.0)).x;
    float3 _9016 = float3(_3394, _3396, _3386);
    float4 _3401 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9016, float3(0.0), isnan(_9016)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9016, float3(0.0), isnan(_9016)), level(0.0)).xyzw;
    float _3403 = _3401.x;
    float _3405 = _3401.y;
    float _3407 = _3401.z;
    float _3409 = _3401.w;
    float2 _9032 = float2(_3384, _3388);
    float3 _3413 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9032, float2(0.0), isnan(_9032)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9032, float2(0.0), isnan(_9032)), level(0.0)).xyz;
    float _3415 = _3413.x;
    float _3417 = _3413.y;
    float _3419 = _3413.z;
    float _3421 = abs(_2964);
    float _3423 = log2(_3421);
    out.m_82.x = _3014;
    out.m_82.y = _3012;
    out.m_82.z = _3016;
    bool _3425 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3427 = isnan(_3214);
    bool _3429 = _3425 || _3427;
    bool _3431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3433 = _3429 || _3431;
    bool _3435 = _2964 <= 8000.0;
    bool _3437 = isnan(_2964);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan(8000.0);
    bool _3443 = _3439 || _3441;
    float _3445 = float(_3443);
    float _3447 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3449 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3451 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3449);
    float _3453 = exp2(_3447);
    float _3455 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3451);
    float _3457 = in.m_84.x;
    float _3459 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3455);
    out.gl_Position.x = _3376;
    out.gl_Position.y = _3368;
    out.gl_Position.z = _3459;
    out.gl_Position.w = _3348;
    float _3461 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3463 = precise::clamp(_3461, 0.0, 1.0);
    float _3465 = fma(_3463, -2.0, 3.0);
    float _3467 = _3463 * _3463;
    float _3469 = _3467 * _3465;
    float _3471 = _3272 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3473 = _3368;
    float _3475 = _3348;
    float _3477 = _3459;
    if (!_3433)
    {
        _3473 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3479 = _3473;
    float _3481 = -_3469;
    float _3483 = _3481 + 1.0;
    float _3485 = exp2(_3471);
    float _3487 = fma(_3483, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3469);
    float _3489 = _3459 + _3348;
    float _3491 = _3479;
    float _3493 = _3479;
    if (!_3433)
    {
        _3475 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3495 = _3475;
    float _3497 = _3445 * _3487;
    float _3499 = _3489 * 0.5;
    float _3501 = _3066 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3503 = _3495;
    float _3505 = _3495;
    if (!_3433)
    {
        _3477 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3507 = _3477;
    float _3509 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_86.z = _3499;
    out.m_86.w = _3348;
    float _3511 = -_3485;
    float _3513 = _3511 + 1.0;
    float _3515 = _3513 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3517 = -_3515;
    float _3519 = _3517 + 1.0;
    float _3521 = -_3378;
    float _3523 = _3521 + 1.0;
    float _3525 = _3523 * _3509;
    float _3527 = precise::clamp(_3525, 0.0, 1.0);
    float _3529 = -_3527;
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3533 = _3531 * _3457;
    float _3535 = _3533 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3537 = _3515 * _3398;
    out.m_88.x = _3535;
    float _3539 = _3409 * _3537;
    float _3541 = _3419 * _3537;
    float _3543 = fma(_3415, _3539, _3403);
    float _3545 = fma(_3417, _3539, _3405);
    float _3547 = _3409 * _3519;
    float _3549 = fma(_3409, _3541, _3407);
    float _3551 = _3407;
    float _3553 = _3519;
    float _3555 = _3539;
    float _3557 = _3507;
    float _3559 = _3507;
    if (!_3433)
    {
        _3551 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3561 = _3551;
    float _3563 = _3561;
    float _3565 = _3561;
    if (!_3433)
    {
        _3553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3567 = _3553;
    out.m_90.x = _3543;
    out.m_90.y = _3545;
    out.m_90.z = _3549;
    out.m_90.w = _3547;
    float _3569 = _3567;
    float _3571 = _3567;
    if (!_3433)
    {
        _3555 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3573 = _3555;
    bool _3575 = !_3433;
    float _3577 = _3573;
    float _3579 = _3573;
    if (!_3575)
    {
        bool _3581 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3583 = isnan(_3214);
        bool _3585 = _3581 || _3583;
        bool _3587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3589 = _3585 || _3587;
        if (!_3589)
        {
            float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3593 = _3214 + _3591;
            float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3595;
            float _3599 = 1.0 / _3597;
            float _3601 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3603 = _3601 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3605 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3607 = _3605 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3615 = _3613 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3621 = _3593 * _3599;
            float _3623 = precise::clamp(_3621, 0.0, 1.0);
            float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3627 = _3625 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3629 = fma(_3623, _3603, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3631 = fma(_3623, _3627, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3633 = fma(_3623, _3607, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3635 = fma(_3623, _3611, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3637 = fma(_3623, _3615, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3639 = fma(_3623, _3619, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3505 = _3631;
            _3571 = _3637;
            _3565 = _3629;
            _3493 = _3635;
            _3559 = _3633;
            _3579 = _3639;
            _3641 = true;
        }
        else
        {
            bool _3643 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3645 = isnan(_3214);
            bool _3647 = _3643 || _3645;
            bool _3649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3651 = _3647 || _3649;
            if (!_3651)
            {
                _3563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3653 = _3563;
            _3565 = _3653;
            if (!_3651)
            {
                _3503 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3655 = _3503;
            _3505 = _3655;
            if (!_3651)
            {
                _3557 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3657 = _3557;
            _3559 = _3657;
            if (!_3651)
            {
                _3491 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3659 = _3491;
            _3493 = _3659;
            if (!_3651)
            {
                _3569 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3661 = _3569;
            _3571 = _3661;
            if (!_3651)
            {
                _3577 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3663 = _3577;
            bool _3665 = !_3651;
            _3579 = _3663;
            if (!_3665)
            {
                bool _3667 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3669 = isnan(_3214);
                bool _3671 = _3667 || _3669;
                bool _3673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3675 = _3671 || _3673;
                if (!_3675)
                {
                    float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3679 = _3214 + _3677;
                    float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3683 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3681;
                    float _3685 = 1.0 / _3683;
                    float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3703 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3707 = _3679 * _3685;
                    float _3709 = precise::clamp(_3707, 0.0, 1.0);
                    float _3711 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3713 = _3711 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3715 = fma(_3709, _3689, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3717 = fma(_3709, _3713, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3719 = fma(_3709, _3693, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3721 = fma(_3709, _3697, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3723 = fma(_3709, _3701, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3725 = fma(_3709, _3705, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3505 = _3717;
                    _3571 = _3723;
                    _3565 = _3715;
                    _3493 = _3721;
                    _3559 = _3719;
                    _3579 = _3725;
                    _3641 = true;
                }
                else
                {
                    _3505 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3571 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3493 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3559 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3579 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3641 = false;
    float _3727 = _3505;
    float _3729 = _3571;
    float _3731 = _3565;
    float _3733 = _3493;
    float _3735 = _3559;
    float _3737 = _3579;
    float _3739 = fma(_2682, -0.5, 0.5);
    float _3741 = precise::clamp(_3739, 0.0, 1.0);
    float _3743 = -_3727;
    float _3745 = _3743 + _3729;
    float _3747 = _3501 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3749 = -_3731;
    float _3751 = _3749 + _3733;
    out.m_92.x = 0.0;
    float _3753 = fma(_3741, _3745, _3727);
    float _3755 = fma(_3741, _3751, _3731);
    out.m_51.x = _3747;
    float _3757 = -_3735;
    float _3759 = _3757 + _3737;
    float _3761 = _3753 * 0.586610972881317138671875;
    bool _3763 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3765 = fma(_3741, _3759, _3735);
    float _3767 = fma(_3755, 0.298911988735198974609375, _3761);
    bool _3769 = _3066 > 0.0;
    bool _3771 = isnan(_3066);
    bool _3773 = _3769 || _3771;
    bool _3775 = isnan(0.0);
    bool _3777 = _3773 || _3775;
    float _3779 = fma(_3765, 0.114477999508380889892578125, _3767);
    float _3781 = -_3779;
    float _3783 = _3755 + _3781;
    float _3785 = -_3779;
    float _3787 = _3753 + _3785;
    float _3789 = -_3779;
    float _3791 = _3765 + _3789;
    float _3793 = fma(_3783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3779);
    float _3795 = fma(_3787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3779);
    float _3797 = fma(_3791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3779);
    bool _3799 = !_3763;
    if (!_3799)
    {
        float _3801 = -_3012;
        float _3803 = _3801 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3805 = -_3014;
        float _3807 = _3805 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3809 = -_3016;
        float _3811 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3813 = _3803 * _3803;
        float _3815 = fma(_3807, _3807, _3813);
        float _3817 = fma(_3811, _3811, _3815);
        float _3819 = sqrt(_3817);
        float _3821 = rsqrt(_3817);
        float _3823 = -_3819;
        float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3827 = _3825 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3829 = precise::clamp(_3827, 0.0, 1.0);
        float _3831 = _3807 * _3821;
        float _3833 = _3803 * _3821;
        float _3835 = abs(_3829);
        float _3837 = log2(_3835);
        float _3839 = _3811 * _3821;
        float _3841 = _3831 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3843 = _2682 * _3833;
        float _3845 = -_3833;
        float _3847 = -_3841;
        float _3849 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3847);
        float _3851 = fma(_2686, _3831, _3843);
        float _3853 = -_3839;
        float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3849);
        float _3857 = fma(_2688, _3839, _3851);
        float _3859 = precise::clamp(_3857, 0.0, 1.0);
        float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3863 = _3855 + _3861;
        float _3865 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3867 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3869 = precise::clamp(_3867, 0.0, 1.0);
        float _3871 = exp2(_3865);
        float _3873 = _3871 * _3869;
        float _3875 = _3859 * _3873;
        float _3877 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3879 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3881 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3877;
        out.m_92.y = _3879;
        out.m_92.z = _3881;
    }
    out.m_94.x = _3793;
    out.m_94.y = _3795;
    out.m_94.z = _3797;
    if (_3777)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3883 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3883;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3641 = false;
    bool _2736 = false;
    bool _487 = false;
    bool _337 = false;
    bool _235 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3940 = as_type<float>(_129);
        out.gl_Position.z = _3940;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4009 = as_type<float>(_167);
        out.gl_Position.z = _4009;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _215 = _211;
    float _233;
    if (!_213)
    {
        float _217 = in.m_60.x;
        float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _225 = _223 * _219;
        float _227 = floor(_225);
        float _229 = -_227;
        float _231 = _225 + _229;
        _233 = _231;
        _235 = true;
    }
    else
    {
        float _237 = float(_113);
        float _239 = 1.0 / _237;
        float _241 = _147 * _239;
        _233 = _241;
    }
    _235 = false;
    float _243 = _233;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    bool _249 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _251 = isnan(_243);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _261;
    float _265 = -_259;
    float _267 = _265 + 1.0;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _281;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = 1.0 / _263;
    float _289 = _279 * _267;
    float _291 = -_279;
    float _293 = _291 + 1.0;
    float _295 = _247 * _287;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _297;
    float _301 = fma(_283, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _303 = fma(_299, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _305 = _301 * _289;
    float _307 = _303 * _289;
    float _309 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _305);
    float _311 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _307);
    float _313 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].x, _309);
    float _315 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[144].y, _311);
    bool _317 = !_285;
    float _335;
    if (!_317)
    {
        float _319 = in.m_60.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        float _339 = float(_113);
        float _341 = 1.0 / _339;
        float _343 = _147 * _341;
        _335 = _343;
    }
    _337 = false;
    float _345 = _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _349 = _345 + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = isnan(_345);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _371 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _373 = isnan(_345);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _383;
    bool _387 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _389 = isnan(_345);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = 1.0 / _353;
    float _401 = -_365;
    float _403 = _401 + 1.0;
    bool _405 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _407 = _381 * _403;
    float _409 = -_381;
    float _411 = _409 + 1.0;
    float _413 = 1.0 / _369;
    float _415 = _385 * _399;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _421 = fma(_415, _349, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _423 = _419 * _413;
    float _425 = _421 * _407;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = _345 + _431;
    float _435 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[115].x, _425);
    float _437 = _365 * _429;
    float _439 = fma(_423, _433, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _443 = fma(_439, _437, _435);
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _447 = _441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _449 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[117].x, _443);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _453 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _455 = _449 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _457 = in.m_62.x;
    float _459 = in.m_62.y;
    float _461 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _447;
    out.m_64.y = _461;
    out.m_64.z = _453;
    out.m_64.w = _455;
    float _463 = _315 * _459;
    float _465 = _313 * _457;
    bool _467 = !_405;
    float _485;
    if (!_467)
    {
        float _469 = in.m_60.x;
        float _471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _473 = _469 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _477 = _475 * _471;
        float _479 = floor(_477);
        float _481 = -_479;
        float _483 = _477 + _481;
        _485 = _483;
        _487 = true;
    }
    else
    {
        float _489 = float(_113);
        float _491 = 1.0 / _489;
        float _493 = _147 * _491;
        _485 = _493;
    }
    _487 = false;
    float _495 = _485;
    float _497 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _499 = int(_497);
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _503 = _501 != 0;
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _507 = int(_505);
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _511 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _513 = isnan(_495);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _525 = float(_499);
    float _527 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _529 = int(_527);
    float _531 = float(_507);
    float _533 = 1.0 / _525;
    float _535 = 1.0 / _531;
    float _537 = float(uint(_529));
    int _539 = ~_529;
    int _541 = _539 + 1;
    float _543 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _545 = int(_543);
    float _547 = _533 * _147;
    float _549 = _535 * _147;
    float _551 = 1.0 / _537;
    float _553 = float(uint(_545));
    float _555 = trunc(_547);
    int _557 = int(_555);
    int _559 = ~_545;
    int _561 = _559 + 1;
    float _563 = float(_545);
    float _565 = 1.0 / _553;
    int _567 = as_type<int>(_551) + (-2);
    float _569 = in.m_60.x;
    float _571 = in.m_60.y;
    float _573 = in.m_60.z;
    float _575 = in.m_60.w;
    float _577 = trunc(_549);
    int _579 = int(_577);
    float _581 = float(uint(_557));
    float _583 = as_type<float>(_567) * _581;
    int _585 = as_type<int>(_565) + (-2);
    float _587 = _581;
    if (_503)
    {
        float _589 = in.m_60.x;
        _587 = _589;
    }
    float _591 = _587;
    float _593 = trunc(_583);
    float _595 = precise::max(_593, 0.0);
    uint _598 = uint(_595);
    float _600 = _591;
    if (!_503)
    {
        float _602 = in.m_60.y;
        _600 = _602;
    }
    float _604 = _600;
    float _606 = float(uint(_579));
    float _608 = float(_579);
    float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _612 = _571 > 0.5;
    float _614 = as_type<float>(_585) * _606;
    float _616 = _606;
    if (_503)
    {
        _616 = 1.0;
    }
    float _618 = _616;
    float _620 = _618;
    if (!_503)
    {
        _620 = 7.345489978790283203125;
    }
    float _622 = _620;
    int _624 = _541 * int(_598);
    int _626 = _624 + _557;
    float _628 = trunc(_614);
    float _630 = precise::max(_628, 0.0);
    uint _632 = uint(_630);
    bool _634 = _608 >= _563;
    bool _636 = isnan(_608);
    bool _638 = _634 || _636;
    bool _640 = isnan(_563);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _622 * _569;
    float _648 = trunc(_644);
    int _650 = int(_648);
    float _652 = _610 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _654 = _561 * int(_632);
    int _656 = _654 + _579;
    float _658 = float(uint(_626));
    float _660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _662 = float(uint(_656));
    float _664 = as_type<float>(_567) * _658;
    float _666 = trunc(_664);
    float _668 = precise::max(_666, 0.0);
    uint _670 = uint(_668);
    float _672 = as_type<float>(_585) * _662;
    float _674 = _662;
    if (_503)
    {
        _674 = 1.0;
    }
    float _676 = _674;
    float _678 = _676;
    if (!_503)
    {
        _678 = 1.2345600128173828125;
    }
    float _680 = _678;
    bool _682 = _575 > 0.5;
    float _684 = floor(_646);
    float _686 = _680 * _604;
    int _688 = ~_529;
    int _690 = _688 + 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _702 = _700 != 0;
    bool _704 = _573 > 0.5;
    float _706 = trunc(_672);
    float _708 = precise::max(_706, 0.0);
    uint _710 = uint(_708);
    int _712 = int(_598) + int(_670);
    float _714 = float(_113);
    float _716 = -_205;
    int _718 = _682 ? as_type<int>(_716) : as_type<int>(_205);
    int _720 = _690 * _712;
    int _722 = _720 + _557;
    float _724 = -_195;
    int _726 = _612 ? as_type<int>(_724) : as_type<int>(_195);
    float _728 = -_684;
    float _730 = _646 + _728;
    float _732 = -_205;
    int _734 = _704 ? as_type<int>(_732) : as_type<int>(_205);
    float _736 = 1.0 / _714;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _740 = _738 != 0;
    bool _742 = !_698;
    float _744 = _742 ? _195 : as_type<float>(_726);
    int _746 = int(_632) + int(_710);
    float _748 = floor(_686);
    bool _750 = !_702;
    float _752 = _750 ? _205 : as_type<float>(_734);
    float _754 = _744 + 0.5;
    bool _756 = !_740;
    int _758 = _756 ? 0 : 1;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _770 = _768 != 0;
    bool _772 = uint(_722) >= uint(_529);
    float _774 = _736 * _147;
    float _776 = float(_529);
    float _778 = float(_557);
    int _780 = ~_545;
    int _782 = _780 + 1;
    bool _784 = _778 >= _776;
    bool _786 = isnan(_778);
    bool _788 = _784 || _786;
    bool _790 = isnan(_776);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -_748;
    float _798 = _686 + _796;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _802 = _800 != 0;
    int _804 = _782 * _746;
    int _806 = _804 + _579;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _810 = _808 != 0;
    float _812 = _798 * _563;
    bool _814 = !_802;
    int _816 = _814 ? 0 : 1;
    float _818 = trunc(_794);
    int _820 = int(_818);
    bool _822 = uint(_806) >= uint(_545);
    bool _824 = !_772;
    int _826 = _824 ? 0 : (-1);
    bool _828 = !_694;
    float _830 = _828 ? _205 : as_type<float>(_718);
    bool _832 = !_810;
    int _834 = _832 ? 0 : 1;
    float _836 = trunc(_812);
    int _838 = int(_836);
    bool _840 = !_822;
    int _842 = _840 ? 0 : (-1);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _858 = _856 != 0;
    int _860 = ~_712;
    int _862 = _860 + _826;
    int _864 = _862 + 1;
    float _866 = _730 * _776;
    float _868 = _776 * _774;
    bool _870 = !_850;
    int _872 = _870 ? 0 : 1;
    int _874 = _529 * _864;
    int _876 = _874 + _557;
    bool _878 = _529 == 0;
    float _880 = trunc(_866);
    int _882 = int(_880);
    int _884 = ~_820;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    bool _890 = !_878;
    int _892 = _890 ? _876 : (-1);
    bool _894 = !_766;
    int _896 = _894 ? 0 : 1;
    int _898 = _529 + (-1);
    float _900 = trunc(_868);
    int _902 = int(_900);
    int _904 = _892 * _888;
    bool _906 = !_762;
    int _908 = _906 ? 0 : 1;
    int _910 = abs(_896);
    int _912 = _820 * _898;
    int _914 = _912 + _904;
    int _916 = abs(_758);
    int _918 = abs(_908);
    int _920 = _914 * _910;
    float _922 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _924 = log2(_922);
    float _926 = _563 * _774;
    int _928 = ~_746;
    int _930 = _928 + _842;
    int _932 = _930 + 1;
    int _934 = _882 * _916;
    int _936 = _934 + _557;
    bool _938 = !_770;
    int _940 = _938 ? 0 : 1;
    int _942 = _902 * _918;
    int _944 = _942 + _920;
    bool _946 = !_846;
    int _948 = _946 ? 0 : 1;
    int _950 = _545 * _932;
    int _952 = _950 + _579;
    int _954 = abs(_940);
    float _956 = trunc(_926);
    int _958 = int(_956);
    bool _960 = _545 == 0;
    int _962 = abs(_816);
    int _964 = _936 * _954;
    int _966 = _964 + _944;
    int _968 = abs(_834);
    int _970 = ~_650;
    int _972 = _970 + 1;
    int _974 = _972 + 1;
    int _976 = _882 * _962;
    int _978 = _976 + _966;
    bool _980 = !_960;
    int _982 = _980 ? _952 : (-1);
    float _984 = _571 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _986 = _545 + (-1);
    int _988 = _982 * _974;
    float _990 = float(uint(_978));
    int _992 = _838 * _968;
    int _994 = _992 + _579;
    int _996 = abs(_872);
    int _998 = _650 * _986;
    int _1000 = _998 + _988;
    bool _1002 = !_854;
    int _1004 = _1002 ? 0 : 1;
    float _1006 = as_type<float>(_567) * _990;
    int _1008 = abs(_948);
    float _1010 = fma(_984, -2.0, _509);
    bool _1012 = !_858;
    int _1014 = _1012 ? 0 : 1;
    int _1016 = abs(_1004);
    int _1018 = _1000 * _996;
    int _1020 = abs(_1014);
    float _1022 = trunc(_1006);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    int _1028 = _958 * _1008;
    int _1030 = _1028 + _1018;
    float _1032 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    int _1034 = ~_529;
    int _1036 = _1034 + 1;
    int _1038 = _994 * _1016;
    int _1040 = _1038 + _1030;
    int _1042 = ~_545;
    int _1044 = _1042 + 1;
    int _1046 = ~_529;
    int _1048 = _1046 + 1;
    int _1050 = _838 * _1020;
    int _1052 = _1050 + _1040;
    bool _1054 = _571 > 0.5;
    float _1056 = float(uint(_1052));
    int _1058 = _1036 * int(_1026);
    int _1060 = _1058 + _978;
    float _1062 = -_205;
    int _1064 = _1054 ? as_type<int>(_1062) : as_type<int>(_205);
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1068 = _1066 != 0;
    float _1070 = as_type<float>(_585) * _1056;
    float _1072 = float(uint(_1060));
    float _1074 = float(uint(_936));
    float _1076 = trunc(_1070);
    float _1078 = precise::max(_1076, 0.0);
    uint _1080 = uint(_1078);
    float _1082 = as_type<float>(_567) * _1072;
    float _1084 = float(uint(_994));
    float _1086 = as_type<float>(_567) * _1074;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1090 = ~_545;
    int _1092 = _1090 + 1;
    float _1094 = trunc(_1082);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    float _1100 = as_type<float>(_585) * _1084;
    bool _1102 = _573 > 0.5;
    int _1104 = _1044 * int(_1080);
    int _1106 = _1104 + _1052;
    float _1108 = trunc(_1086);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = float(uint(_1106));
    int _1116 = int(_1026) + int(_1098);
    float _1118 = trunc(_1100);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    float _1124 = as_type<float>(_585) * _1114;
    int _1126 = ~_529;
    int _1128 = _1126 + 1;
    int _1130 = _1048 * _1116;
    int _1132 = _1130 + _978;
    float _1134 = trunc(_1124);
    float _1136 = precise::max(_1134, 0.0);
    uint _1138 = uint(_1136);
    bool _1140 = uint(_1132) >= uint(_529);
    int _1142 = _1128 * int(_1112);
    int _1144 = _1142 + _936;
    bool _1146 = !_1140;
    int _1148 = _1146 ? 0 : (-1);
    float _1150 = float(uint(_1144));
    int _1152 = _1092 * int(_1122);
    int _1154 = _1152 + _994;
    int _1156 = ~_1116;
    int _1158 = _1156 + _1148;
    int _1160 = _1158 + 1;
    int _1162 = ~_545;
    int _1164 = _1162 + 1;
    float _1166 = as_type<float>(_567) * _1150;
    int _1168 = _529 * _1160;
    int _1170 = _1168 + _978;
    float _1172 = float(uint(_1154));
    int _1174 = int(_1080) + int(_1138);
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1178 = !_878;
    int _1180 = _1178 ? _1170 : (-1);
    float _1182 = as_type<float>(_585) * _1172;
    int _1184 = _1164 * _1174;
    int _1186 = _1184 + _1052;
    int _1188 = _1180 & 3;
    bool _1190 = _1188 != 0;
    float _1192 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1176);
    int _1194 = _1180 & 3;
    bool _1196 = _1194 != 0;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1200 = uint(_1186) >= uint(_545);
    float _1202 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1192);
    int _1204 = _1196 ? 0 : 1;
    float _1206 = trunc(_1166);
    float _1208 = precise::max(_1206, 0.0);
    uint _1210 = uint(_1208);
    bool _1212 = !_1200;
    int _1214 = _1212 ? 0 : (-1);
    float _1216 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1198);
    bool _1218 = uint(_1188) > 1u;
    float _1220 = _571 * 2.0;
    int _1222 = ~_1174;
    int _1224 = _1222 + _1214;
    int _1226 = _1224 + 1;
    float _1228 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1216);
    bool _1230 = _1188 != 3;
    float _1232 = -_1202;
    float _1234 = _1232 + 1.0;
    int _1236 = ~_1204;
    int _1238 = _1236 + 1;
    int _1240 = _1238 + 1;
    int _1242 = _545 * _1226;
    int _1244 = _1242 + _1052;
    int _1246 = _1052;
    int _1248 = _1240;
    int _1250 = _1204;
    float _1252 = as_type<float>(_1244);
    float _1254 = as_type<float>(_1138);
    float _1256 = as_type<float>(_1174);
    if (_1068)
    {
        _1246 = 0;
    }
    int _1258 = _1246;
    float _1260 = floor(_1220);
    int _1262 = _1258;
    if (!_1068)
    {
        _1262 = 2;
    }
    int _1264 = _1262;
    bool _1266 = !_960;
    int _1268 = _1266 ? _1244 : (-1);
    float _1270 = as_type<float>(_1264);
    if (!_1218)
    {
        int _1272 = ~_1204;
        int _1274 = _1272 + 1;
        _1248 = _1274;
    }
    int _1276 = _1248;
    bool _1278 = uint(_1188) >= 2u;
    if (_1068)
    {
        _1250 = 0;
    }
    int _1280 = _1250;
    int _1282 = _1278 ? 0 : 1;
    int _1284 = _1268 & 3;
    bool _1286 = _1284 != 0;
    int _1288 = ~_1282;
    int _1290 = _1288 + 1;
    int _1292 = _1290 + 1;
    int _1294 = _1292;
    int _1296 = _1280;
    if (_1230)
    {
        int _1298 = ~_1282;
        int _1300 = _1298 + 1;
        _1294 = _1300;
    }
    int _1302 = _1294;
    bool _1304 = uint(_1284) > 1u;
    if (!_1068)
    {
        _1296 = 1;
    }
    int _1306 = _1296;
    int _1308 = _1268 & 3;
    bool _1310 = _1308 != 0;
    float _1312 = _1310 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1314 = _1306 != 1;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1318 = ~as_type<int>(_1312);
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    int _1324 = _1322;
    float _1326 = _1312;
    if (!_1304)
    {
        int _1328 = ~as_type<int>(_1312);
        int _1330 = _1328 + 1;
        _1324 = _1330;
    }
    int _1332 = _1324;
    float _1334 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1316);
    bool _1336 = uint(_1284) >= 2u;
    float _1338 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1334);
    int _1340 = _1336 ? 0 : 1;
    bool _1342 = _1264 != 2;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1314)
    {
        _1252 = _573;
    }
    float _1346 = _1252;
    float _1348 = -_1338;
    float _1350 = _1348 + 1.0;
    float _1352 = _1346;
    if (_1314)
    {
        _1352 = _571;
    }
    float _1354 = _1352;
    if (!_1314)
    {
        _1326 = _571;
    }
    float _1356 = _1326;
    float _1358 = _1356;
    if (!_1314)
    {
        _1254 = _573;
    }
    float _1360 = _1254;
    float _1362 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1088);
    float _1364 = _1360;
    if (!_1314)
    {
        _1256 = _1356;
    }
    float _1366 = _1256;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1370 = _1366;
    if (_1314)
    {
        _1370 = _569;
    }
    float _1372 = _1370;
    float _1374 = _924 * _147;
    if (_1342)
    {
        _1270 = _569;
    }
    float _1376 = _1270;
    float _1378 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1362);
    float _1380 = _1376;
    if (!_1342)
    {
        _1380 = _573;
    }
    float _1382 = _1380;
    float _1384 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1314)
    {
        _1358 = _569;
    }
    float _1386 = _1358;
    float _1388 = exp2(_1374);
    if (_1314)
    {
        _1364 = _571;
    }
    float _1390 = _1364;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1394 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1396 = _1394 != 0;
    float _1398 = _569 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1400 = ~_1340;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    float _1406 = -_1344;
    float _1408 = fma(_1392, 2.0, _1406);
    float _1410 = -_523;
    float _1412 = fma(_1398, 2.0, _1410);
    float _1414 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1416 = int(_1112) + int(_1210);
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1420 = -_147;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1412);
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1426 = fma(_1414, -2.0, _1368);
    float _1428 = -_1418;
    float _1430 = fma(_1384, 2.0, _1428);
    float _1432 = _1418;
    int _1434 = _1404;
    if (_1342)
    {
        _1432 = _571;
    }
    float _1436 = _1432;
    float _1438 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1424);
    float _1440 = _1436;
    if (!_1342)
    {
        _1440 = _569;
    }
    float _1442 = _1440;
    float _1444 = -_1388;
    float _1446 = _1444 + 1.0;
    float _1448 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1438);
    bool _1450 = _1284 != 3;
    float _1452 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1454 = -_195;
    int _1456 = _1102 ? as_type<int>(_1454) : as_type<int>(_195);
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1460 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    bool _1466 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1468 = _1464 || _1466;
    float _1470 = -_147;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1430);
    float _1474 = fma(_1452, -2.0, _1458);
    float _1476 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1426);
    float _1478 = _1468 ? _1446 : 0.0;
    float _1480 = _569 * 2.0;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_1450)
    {
        int _1484 = ~_1340;
        int _1486 = _1484 + 1;
        _1434 = _1486;
    }
    int _1488 = _1434;
    float _1490 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1474);
    bool _1492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1494 = isnan(1.0);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1500 = _1496 || _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1504 = 1.0 + _1502;
    float _1506 = floor(_1480);
    float _1508 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1482);
    bool _1510 = _569 > 0.5;
    float _1512 = _573 * 2.0;
    int _1514 = ~_529;
    int _1516 = _1514 + 1;
    float _1518 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1508);
    float _1520 = -_195;
    int _1522 = _1510 ? as_type<int>(_1520) : as_type<int>(_195);
    float _1524 = -_1448;
    float _1526 = _1524 + 1.0;
    float _1528 = 1.0 / _1504;
    float _1530 = -_147;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1408);
    int _1534 = _1516 * _1416;
    int _1536 = _1534 + _936;
    bool _1538 = !_1396;
    float _1540 = _1538 ? _205 : as_type<float>(_1064);
    float _1542 = -_1518;
    float _1544 = _1542 + 1.0;
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1548 = _1546 != 0;
    float _1550 = -_1378;
    float _1552 = _1550 + 1.0;
    float _1554 = trunc(_1182);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    bool _1560 = _1506 > 0.0;
    float _1562 = _573 + _571;
    bool _1564 = !_1190;
    int _1566 = _1564 ? 0 : 1;
    float _1568 = _1562 + (-1.0);
    bool _1570 = !_1286;
    int _1572 = _1570 ? 0 : 1;
    if (_1500)
    {
        float _1574 = _1478 * _1528;
        _151 = _1574;
    }
    float _1576 = _151;
    bool _1578 = _1506 >= 0.0;
    bool _1580 = isnan(_1506);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan(0.0);
    bool _1586 = _1582 || _1584;
    float _1588 = floor(_1512);
    int _1590 = ~_545;
    int _1592 = _1590 + 1;
    float _1594 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1596 = _1586 ? 0 : 1;
    int _1598 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1600 = _1598 != 0;
    int _1602 = int(_1122) + int(_1558);
    int _1604 = ~_1596;
    int _1606 = _1604 + 1;
    int _1608 = _1606 + 1;
    bool _1610 = !_1548;
    float _1612 = _1610 ? _195 : as_type<float>(_1456);
    int _1614 = _1592 * _1602;
    int _1616 = _1614 + _994;
    int _1618 = _1608;
    if (!_1560)
    {
        int _1620 = ~_1596;
        int _1622 = _1620 + 1;
        _1618 = _1622;
    }
    int _1624 = _1618;
    bool _1626 = uint(_1536) >= uint(_529);
    bool _1628 = !_1600;
    float _1630 = _1628 ? _195 : as_type<float>(_1522);
    bool _1632 = _1260 >= 0.0;
    bool _1634 = isnan(_1260);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    bool _1642 = _1260 > 0.0;
    float _1644 = in.m_48.x;
    float _1646 = in.m_48.y;
    float _1648 = in.m_48.z;
    bool _1650 = !_1626;
    int _1652 = _1650 ? 0 : (-1);
    bool _1654 = uint(_1616) >= uint(_545);
    int _1656 = _1640 ? 0 : 1;
    bool _1658 = !_1654;
    int _1660 = _1658 ? 0 : (-1);
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1664 = _1662 != 0;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1668 = _1666 != 0;
    int _1670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1672 = _1670 != 0;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1678 = ~_1656;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    int _1684 = _1682;
    if (!_1642)
    {
        int _1686 = ~_1656;
        int _1688 = _1686 + 1;
        _1684 = _1688;
    }
    int _1690 = _1684;
    float _1692 = _569 + _571;
    bool _1694 = !_1668;
    int _1696 = _1694 ? 0 : 1;
    float _1698 = 1.0 / _1676;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1702 = _1700 != 0;
    float _1704 = _1692 + (-1.0);
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1708 = _1706 != 0;
    float _1710 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1712 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1714 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1716 = !_1664;
    int _1718 = _1716 ? 0 : 1;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1720;
    float _1724 = fma(_1644, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1710);
    float _1726 = fma(_1644, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1712);
    float _1728 = fma(_1644, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1714);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1732 = _495 + _1730;
    bool _1734 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1736 = isnan(_495);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = _1722 * _1698;
    float _1748 = -_521;
    float _1750 = _1748 + 1.0;
    float _1752 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1726);
    float _1754 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1724);
    float _1756 = fma(_1746, _1732, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1758 = _1744 * _1750;
    bool _1760 = _1588 >= 0.0;
    bool _1762 = isnan(_1588);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.0);
    bool _1768 = _1764 || _1766;
    float _1770 = -_1744;
    float _1772 = _1770 + 1.0;
    float _1774 = _1754 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1776 = _1756 * _1758;
    float _1778 = _1752 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1780 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1782 = _1768 ? 0 : 1;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1776);
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1788 = _1778 + _1786;
    bool _1790 = _1588 > 0.0;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1794 = _1774 + _1792;
    float _1796 = fma(_1648, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1728);
    float _1798 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1800 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1784);
    float _1802 = _1540 + (-0.5);
    int _1804 = ~_1782;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1798);
    int _1812 = _1180 >> 31;
    float _1814 = -_1802;
    float _1816 = -_1032;
    float _1818 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1816);
    int _1820 = _1268 >> 31;
    float _1822 = _1796 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1824 = _1812 & 3;
    float _1826 = _1630 + 0.5;
    int _1828 = _1808;
    if (!_1790)
    {
        int _1830 = ~_1782;
        int _1832 = _1830 + 1;
        _1828 = _1832;
    }
    int _1834 = _1828;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1838 = _1822 + _1836;
    int _1840 = _1820 & 3;
    float _1842 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1422);
    int _1844 = _1180 + _1824;
    float _1846 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1810);
    int _1848 = _1268 + _1840;
    int _1850 = _1844 >> 2;
    int _1852 = _1848 >> 2;
    int _1854 = _1850 << 4;
    int _1856 = _1854 + 368;
    bool _1858 = _1188 != 3;
    int _1860 = _1852 << 4;
    int _1862 = _1860 + 512;
    uint _1864 = uint(int(uint(_1856) >> uint(2)));
    uint _1866 = uint(int(uint(int(_1864)) >> uint(2)));
    int _1868 = int(_1864) & 3;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[int(_1866)][_1868];
    int _1872 = int(_1864) + 1;
    uint _1874 = uint(int(uint(_1872) >> uint(2)));
    int _1876 = _1872 & 3;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[int(_1874)][_1876];
    bool _1880 = !_1858;
    int _1882 = _1880 ? 0 : (-1);
    bool _1884 = _1284 != 3;
    int _1886 = abs(_1696);
    int _1888 = abs(_1718);
    uint _1890 = uint(int(uint(_1862) >> uint(2)));
    uint _1892 = uint(int(uint(int(_1890)) >> uint(2)));
    int _1894 = int(_1890) & 3;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[int(_1892)][_1894];
    int _1898 = int(_1890) + 1;
    uint _1900 = uint(int(uint(_1898) >> uint(2)));
    int _1902 = _1898 & 3;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[int(_1900)][_1902];
    float _1906 = float(_1834);
    float _1908 = float(_1888);
    float _1910 = float(_1624);
    float _1912 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1914 = fma(_652, _754, _1532);
    int _1916 = _1856 + 8;
    uint _1918 = uint(int(uint(_1916) >> uint(2)));
    uint _1920 = uint(int(uint(int(_1918)) >> uint(2)));
    int _1922 = int(_1918) & 3;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[int(_1920)][_1922];
    int _1926 = int(_1918) + 1;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    int _1930 = _1926 & 3;
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[int(_1928)][_1930];
    float _1934 = _1908 * _1906;
    bool _1936 = !_1884;
    int _1938 = _1936 ? 0 : (-1);
    float _1940 = _1612 + 0.5;
    bool _1942 = _1846 >= 0.0;
    float _1944 = -_1350;
    float _1946 = fma(_744, _1944, _1914);
    float _1948 = in.m_66.x;
    float _1950 = in.m_66.y;
    float _1952 = in.m_66.z;
    int _1954 = _1862 + 8;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1974 = float(_1886);
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1978 = abs(_1882);
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1982 = 0.0;
    int _1984 = _1888;
    if (_1942)
    {
        _1982 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1986 = _1982;
    float _1988 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1990 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1994 = _1974 * _1910;
    if (_1942)
    {
        float _1996 = _1986 * 5.0;
        _1984 = as_type<int>(_1996);
    }
    int _1998 = _1984;
    int _2000 = ~_1416;
    int _2002 = _2000 + _1652;
    int _2004 = _2002 + 1;
    float _2006 = _660 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_68.x = _1988;
    out.m_68.y = _1990;
    out.m_68.z = _1992;
    out.m_68.w = _1912;
    int _2008 = ~_1602;
    int _2010 = _2008 + _1660;
    int _2012 = _2010 + 1;
    float _2014 = _752 + (-0.5);
    int _2016 = _529 * _2004;
    int _2018 = _2016 + _936;
    if (_1942)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6757 = as_type<float>(_1998);
        out.gl_Position.z = _6757;
    }
    float _2020 = _830 + (-0.5);
    int _2022 = _545 * _2012;
    int _2024 = _2022 + _994;
    float _2026 = _1934 * (-2.0);
    if (_1942)
    {
        out.m_51.x = 0.0;
    }
    float _2028 = fma(_2026, _1948, _1948);
    int _2030 = abs(_1276);
    float _2032 = -_2006;
    float _2034 = -_1490;
    float _2036 = fma(_2032, _2014, _2034);
    int _2038 = abs(_1332);
    float _2040 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1472);
    int _2042 = abs(_1566);
    float _2044 = -_2020;
    float _2046 = -_1476;
    float _2048 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2046);
    int _2050 = ~_2030;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    float _2056 = -_1526;
    float _2058 = fma(_1612, _2056, _2040);
    int _2060 = ~_2038;
    int _2062 = _2060 + 1;
    int _2064 = _2062 + 1;
    float _2066 = fma(_830, _1552, _2048);
    int _2068 = ~_2042;
    int _2070 = _2068 + 1;
    int _2072 = _2070 + 1;
    int _2074 = _2054 * as_type<int>(_1878);
    int _2076 = abs(_1572);
    int _2078 = _2064 * as_type<int>(_1904);
    int _2080 = abs(_1302);
    int _2082 = _2072 * as_type<int>(_1870);
    int _2084 = _2082 + _2074;
    int _2086 = ~_2076;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    float _2092 = _1788 * _1788;
    int _2094 = abs(_1488);
    float _2096 = fma(_1780, _2026, _1780);
    int _2098 = ~_2080;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    int _2104 = _2090 * as_type<int>(_1896);
    int _2106 = _2104 + _2078;
    int _2108 = abs(_1938);
    int _2110 = ~_2094;
    int _2112 = _2110 + 1;
    int _2114 = _2112 + 1;
    int _2116 = _2102 * as_type<int>(_1924);
    int _2118 = _2116 + _2084;
    bool _2120 = !_1708;
    int _2122 = _2120 ? 0 : 1;
    int _2124 = ~_2108;
    int _2126 = _2124 + 1;
    int _2128 = _2126 + 1;
    int _2130 = _2114 * as_type<int>(_1962);
    int _2132 = _2130 + _2106;
    bool _2134 = !_1702;
    int _2136 = _2134 ? 0 : 1;
    int _2138 = abs(_2122);
    int _2140 = _2128 * as_type<int>(_1970);
    int _2142 = _2140 + _2132;
    int _2144 = abs(_2136);
    float _2146 = fma(_1794, _1794, _2092);
    float _2148 = _1994 * (-2.0);
    int _2150 = ~_1978;
    int _2152 = _2150 + 1;
    int _2154 = _2152 + 1;
    float _2156 = fma(_752, _1544, _2036);
    int _2158 = ~_2144;
    int _2160 = _2158 + 1;
    int _2162 = _2160 + 1;
    float _2164 = fma(_2148, _1950, _1950);
    float _2166 = fma(_1838, _1838, _2146);
    int _2168 = _2154 * as_type<int>(_1932);
    int _2170 = _2168 + _2118;
    int _2172 = ~_2138;
    int _2174 = _2172 + 1;
    int _2176 = _2174 + 1;
    float _2178 = -_1228;
    float _2180 = _2178 + 1.0;
    out.m_70.x = _1946;
    out.m_70.y = _2156;
    int _2182 = _2170 * _2162;
    float _2184 = rsqrt(_2166);
    bool _2186 = !_878;
    int _2188 = _2186 ? _2018 : (-1);
    float _2190 = fma(_1594, _2148, _1594);
    int _2192 = _2142 * _2176;
    float _2194 = fma(_1540, _2180, _1818);
    int _2196 = _2188 * _2144;
    int _2198 = _2196 + _2182;
    float _2200 = _465 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _2202 = !_960;
    int _2204 = _2202 ? _2024 : (-1);
    float _2206 = _2200 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2208 = float(_2198);
    int _2210 = _2204 * _2138;
    int _2212 = _2210 + _2192;
    float _2214 = -_1234;
    float _2216 = fma(_1630, _2214, _1842);
    float _2218 = _569 + (-0.5);
    float _2220 = _2206 * _2184;
    float _2222 = float(_2212);
    out.m_72.x = _2216;
    out.m_72.y = _2194;
    out.m_72.z = _2058;
    out.m_72.w = _2066;
    float _2224 = _1788 * _2220;
    float _2226 = _1794 * _2220;
    float _2228 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2028);
    out.m_74.x = _2208;
    out.m_74.y = _2222;
    float _2230 = -_2224;
    float _2232 = _1788 + _2230;
    bool _2234 = !_1672;
    int _2236 = _2234 ? 0 : 1;
    float _2238 = -_2226;
    float _2240 = _1794 + _2238;
    float _2242 = _2232 * _2232;
    float _2244 = _2224;
    if (_1942)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2246 = -_2224;
    float _2248 = _1778 + _2246;
    float _2250 = _1838 * _2220;
    float _2252 = -_2226;
    float _2254 = _1774 + _2252;
    int _2256 = abs(_2236);
    float _2258 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2260 = _2248 + _2258;
    float _2262 = -_2250;
    float _2264 = _1822 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2268 = _2254 + _2266;
    float _2270 = _571 + (-0.5);
    float _2272 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2276 = _2264 + _2274;
    float _2278 = float(_1690);
    float _2280 = _573 + _569;
    float _2282 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2272);
    float _2284 = float(_2256);
    float _2286 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2164);
    float _2288 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2282);
    float _2290 = _2280 + (-1.0);
    float _2292 = _2284 * _2278;
    float _2294 = fma(_2190, _1576, _2286);
    float _2296 = _573 + (-0.5);
    bool _2298 = _2288 >= 0.0;
    float _2300 = _2292 * (-2.0);
    float _2302 = fma(_2290, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2304 = fma(_2240, _2240, _2242);
    float _2306 = -_2250;
    float _2308 = _1838 + _2306;
    float _2310 = fma(_2300, _1952, _1952);
    float _2312 = fma(_2096, _1576, _2228);
    float _2314 = _2294 * 0.15915493667125701904296875;
    float _2316 = fma(_2302, _2300, _2302);
    float _2318 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2310);
    float _2320 = fma(_2308, _2308, _2304);
    float _2322 = _2312 * 0.15915493667125701904296875;
    float _2324 = _2314 * 6.283185482025146484375;
    float _2326 = sin(_2324);
    float _2328 = _2288;
    int _2330 = as_type<int>(_2296);
    float _2332 = _2250;
    float _2334 = _2254;
    if (_2298)
    {
        _2328 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2336 = _2328;
    float _2338 = fma(_2316, _1576, _2318);
    if (_2298)
    {
        out.m_51.x = 0.0;
    }
    if (_2298)
    {
        float _2340 = _2336 * 5.0;
        _2330 = as_type<int>(_2340);
    }
    int _2342 = _2330;
    float _2344 = _2338 * 0.15915493667125701904296875;
    float _2346 = sqrt(_2320);
    if (_2298)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7250 = as_type<float>(_2342);
        out.gl_Position.z = _7250;
    }
    float _2348 = _2322 * 6.283185482025146484375;
    float _2350 = sin(_2348);
    float _2352 = _2322 * 6.283185482025146484375;
    float _2354 = cos(_2352);
    float _2356 = _2314 * 6.283185482025146484375;
    float _2358 = cos(_2356);
    if (_2298)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2360 = _2344 * 6.283185482025146484375;
    float _2362 = cos(_2360);
    float _2364 = _2184 * _2346;
    float _2366 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _2370 = _2354 * _2358;
    float _2372 = _2200 * _2364;
    float _2374 = _2364 * _2366;
    float _2376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _2378 = _2344 * 6.283185482025146484375;
    float _2380 = sin(_2378);
    float _2382 = _2350 * _2358;
    float _2384 = _2368 * _2374;
    float _2386 = _2350 * _2326;
    float _2388 = _2354 * _2326;
    float _2390 = _2376 * _2372;
    float _2392 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2394 = _2354 * _2362;
    float _2396 = _2350 * _2362;
    float _2398 = _2358 * _2362;
    float _2400 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2402 = _2400 * 0.5;
    float _2404 = _2394 * _2384;
    float _2406 = _2326 * _2362;
    float _2408 = fma(_2380, _2370, _2386);
    float _2410 = -_2382;
    float _2412 = fma(_2380, _2388, _2410);
    float _2414 = -_2384;
    float _2416 = _2380 * _2414;
    float _2418 = -_2388;
    float _2420 = fma(_2380, _2382, _2418);
    float _2422 = fma(_2408, _2390, _2404);
    float _2424 = _2396 * _2384;
    float _2426 = fma(_2398, _2390, _2416);
    float _2428 = fma(_2380, _2386, _2370);
    float _2430 = fma(_2412, _2402, _2422);
    float _2432 = fma(_2420, _2390, _2424);
    float _2434 = fma(_2406, _2402, _2426);
    float _2436 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2438 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2440 = fma(_2428, _2402, _2432);
    float _2442 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2444 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2436);
    float _2446 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2438);
    float _2448 = _2408 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2450 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2442);
    float _2452 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2444);
    float _2454 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2446);
    float _2456 = _2408 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2458 = fma(_2392, _2392, 1.0);
    float _2460 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2462 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2464 = _2408 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2466 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2448);
    float _2468 = _1774 + _2460;
    float _2470 = _1822 + _2462;
    float _2472 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2464);
    float _2474 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2478 = _2468 + _2476;
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2482 = _2470 + _2480;
    float _2484 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2450);
    float _2486 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2456);
    float _2488 = _2478 * _2478;
    float _2490 = _2482 * _2482;
    float _2492 = rsqrt(_2458);
    float _2494 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2496 = -_2380;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2474);
    float _2500 = _2488 + _2490;
    float _2502 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2504 = _2394 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2506 = -_2380;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2494);
    float _2510 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2512 = sqrt(_2500);
    float _2514 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2516 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2518 = _1778 + _2502;
    float _2520 = -_2380;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2504);
    float _2524 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2510);
    float _2526 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2514);
    float _2528 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2516);
    bool _2530 = _2512 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2532 = _2510;
    float _2534 = _2406;
    float _2536 = _2502;
    float _2538 = _2514;
    float _2540 = _2470;
    if (!_2530)
    {
        _2532 = _2470;
    }
    float _2542 = _2532;
    float _2544 = _2542;
    if (!_2530)
    {
        _2534 = _2490;
    }
    float _2546 = _2534;
    float _2548 = _2546;
    if (!_2530)
    {
        _2536 = _2488;
    }
    float _2550 = _2536;
    float _2552 = _2550;
    if (!_2530)
    {
        _2538 = _2468;
    }
    float _2554 = _2538;
    float _2556 = _2554;
    if (!_2530)
    {
        _2540 = _2518;
    }
    float _2558 = _2540;
    bool _2560 = !_2530;
    float _2562 = _2558;
    if (!_2560)
    {
        float _2564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2568 = _2512 + _2566;
        float _2570 = rsqrt(_2500);
        float _2572 = _2568 * _2564;
        float _2574 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2576 = _2572 * 0.15915493667125701904296875;
        float _2578 = _2576 * 6.283185482025146484375;
        float _2580 = sin(_2578);
        float _2582 = _2576 * 6.283185482025146484375;
        float _2584 = cos(_2582);
        float _2586 = fma(_2580, _2574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2588 = _2570 * _2586;
        float _2590 = _2584 + (-1.0);
        float _2592 = fma(_2478, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2594 = fma(_2482, _2588, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2596 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2600 = _2592 + _2598;
        float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2604 = _2594 + _2602;
        float _2606 = fma(_2518, _2584, _2596);
        float _2608 = _2600 * _2600;
        float _2610 = _2604 * _2604;
        _2562 = _2606;
        _2552 = _2608;
        _2548 = _2610;
        _2556 = _2592;
        _2544 = _2594;
    }
    float _2612 = _2562;
    float _2614 = _2552;
    float _2616 = _2548;
    float _2618 = _2556;
    float _2620 = _2544;
    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2624 = _2612 + _2622;
    float _2626 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2498);
    float _2628 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2508);
    float _2630 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2522);
    float _2632 = fma(_2624, _2624, _2614);
    float _2634 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2524);
    float _2636 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2526);
    float _2638 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2528);
    float _2640 = _2632 + _2616;
    float _2642 = _2392 * _2492;
    float _2644 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2472);
    float _2646 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2648 = _2392 * _2626;
    float _2650 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2466);
    float _2652 = _2392 * _2628;
    float _2654 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2486);
    float _2656 = _2392 * _2630;
    float _2658 = -_2634;
    float _2660 = _2642 * _2658;
    float _2662 = -_2636;
    float _2664 = _2642 * _2662;
    float _2666 = -_2638;
    float _2668 = _2642 * _2666;
    float _2670 = fma(_2646, _2644, _2648);
    float _2672 = sqrt(_2640);
    float _2674 = fma(_2646, _2650, _2652);
    float _2676 = fma(_2646, _2654, _2656);
    float _2678 = fma(_2492, _2626, _2660);
    float _2680 = fma(_2492, _2628, _2664);
    float _2682 = _2636 + _2674;
    float _2684 = fma(_2492, _2630, _2668);
    float _2686 = _2634 + _2670;
    float _2688 = _2638 + _2676;
    out.m_76.x = _2644;
    out.m_76.y = _2650;
    out.m_76.z = _2654;
    out.m_78.x = _2678;
    out.m_78.y = _2680;
    out.m_78.z = _2684;
    bool _2690 = _2672 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2692 = isnan(_2672);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2698 = _2694 || _2696;
    out.m_80.x = _2686;
    out.m_80.y = _2682;
    out.m_80.z = _2688;
    float _2700 = _2676;
    if (!_2698)
    {
        _2700 = 1.0;
    }
    float _2702 = _2700;
    bool _2704 = !_2698;
    float _2706 = _2702;
    if (!_2704)
    {
        bool _2708 = _2672 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2710 = isnan(_2672);
        bool _2712 = _2708 || _2710;
        bool _2714 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2716 = _2712 || _2714;
        if (!_2716)
        {
            float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2720 = _2672 + _2718;
            float _2722 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2724 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2722;
            float _2726 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2730 = 1.0 / _2724;
            float _2732 = _2720 * _2730;
            float _2734 = fma(_2732, _2728, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2706 = _2734;
            _2736 = true;
        }
        else
        {
            bool _2738 = _2672 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2740 = isnan(_2672);
            bool _2742 = _2738 || _2740;
            bool _2744 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2746 = _2742 || _2744;
            if (!_2746)
            {
                float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2750 = _2672 + _2748;
                float _2752 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2754 = _2752 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2756 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2758 = _2756 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2760 = 1.0 / _2754;
                float _2762 = _2750 * _2760;
                float _2764 = fma(_2762, _2758, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2706 = _2764;
                _2736 = true;
            }
            else
            {
                _2706 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2736 = false;
    float _2766 = _2706;
    float _2768 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2770 = _2612 + _2768;
    float _2772 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2776 = _2618 + _2774;
    float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2780 = _2620 + _2778;
    float _2782 = fma(_2770, _2766, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2784 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2772);
    float _2786 = fma(_2776, _2766, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2788 = fma(_2780, _2766, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2790 = -_1778;
    float _2792 = _2790 + _2782;
    float _2794 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2796 = -_1774;
    float _2798 = _2796 + _2786;
    float _2800 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2802 = _2792 * _2792;
    float _2804 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2806 = -_1822;
    float _2808 = _2806 + _2788;
    float _2810 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2800);
    float _2812 = fma(_2798, _2798, _2802);
    float _2814 = 1.0 / _2804;
    float _2816 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2810);
    float _2818 = fma(_2808, _2808, _2812);
    float _2820 = _2816 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2822 = sqrt(_2818);
    float _2824 = _2820 + _2804;
    bool _2826 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2828 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan(0.5);
    bool _2834 = _2830 || _2832;
    float _2836 = _2824 * _2814;
    float _2838 = _2836 * 0.5;
    float _2840 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2842 = fma(_2838, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2840);
    bool _2844 = _2822 > 0.0;
    float _2846 = 1.0 / _2842;
    bool _2848 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2850 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2852 = _2848 || _2850;
    bool _2854 = isnan(0.5);
    bool _2856 = _2852 || _2854;
    float _2858 = _2794;
    float _2860 = _2780;
    float _2862 = _2814;
    if (!_2844)
    {
        _2858 = _2786;
    }
    float _2864 = _2858;
    float _2866 = _2864;
    float _2868 = _2864;
    if (!_2844)
    {
        _2860 = _2782;
    }
    float _2870 = _2860;
    float _2872 = _2870;
    float _2874 = _2870;
    if (!_2844)
    {
        _2862 = _2788;
    }
    float _2876 = _2862;
    bool _2878 = !_2844;
    float _2880 = _2876;
    float _2882 = _2876;
    if (!_2878)
    {
        float _2884 = _209 * _209;
        float _2886 = fma(_207, _207, _2884);
        float _2888 = fma(_211, _211, _2886);
        float _2890 = rsqrt(_2818);
        float _2892 = sqrt(_2888);
        float _2894 = _2798 * _2890;
        float _2896 = _2792 * _2890;
        float _2898 = _2808 * _2890;
        bool _2900 = _2892 > 0.0;
        if (!_2900)
        {
            _2866 = _2786;
        }
        float _2902 = _2866;
        _2868 = _2902;
        if (!_2900)
        {
            _2872 = _2782;
        }
        float _2904 = _2872;
        _2874 = _2904;
        if (!_2900)
        {
            _2880 = _2788;
        }
        float _2906 = _2880;
        bool _2908 = !_2900;
        _2882 = _2906;
        if (!_2908)
        {
            float _2910 = rsqrt(_2888);
            float _2912 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2914 = _209 * _2910;
            float _2916 = _207 * _2910;
            float _2918 = _211 * _2910;
            float _2920 = _2896 * _2914;
            float _2922 = fma(_2894, _2916, _2920);
            float _2924 = _2912 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2926 = fma(_2898, _2918, _2922);
            float _2928 = _2926 * _2924;
            float _2930 = fma(_207, _2928, _2786);
            float _2932 = fma(_209, _2928, _2782);
            float _2934 = fma(_211, _2928, _2788);
            _2874 = _2932;
            _2868 = _2930;
            _2882 = _2934;
        }
    }
    float _2936 = _2874;
    float _2938 = _2868;
    float _2940 = _2882;
    float _2942 = -_2224;
    float _2944 = _2942 + _2936;
    float _2946 = -_2226;
    float _2948 = _2946 + _2938;
    float _2950 = -_2250;
    float _2952 = _2950 + _2940;
    float _2954 = _2944;
    float _2956 = _2948;
    float _2958 = _2952;
    if (_2834)
    {
        _2244 = 1.0;
    }
    float _2960 = _2244;
    float _2962 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2964 = _2846 * _2962;
    float _2966 = _2960;
    if (!_2856)
    {
        float _2968 = _2260 * _2260;
        float _2970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2972 = -_1822;
        float _2974 = _2972 + _2940;
        float _2976 = -_1774;
        float _2978 = _2976 + _2938;
        float _2980 = fma(_2268, _2268, _2968);
        float _2982 = fma(_2276, _2276, _2980);
        float _2984 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2986 = sqrt(_2982);
        float _2988 = 1.0 / _2364;
        float _2990 = _2984 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2992 = precise::min(_2986, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2994 = _2992 * _2970;
        float _2996 = _2994 * _2988;
        float _2998 = -_1778;
        float _3000 = _2998 + _2936;
        float _3002 = _2990 * _2996;
        float _3004 = _2974 * _2996;
        float _3006 = fma(_3000, _3002, _2248);
        float _3008 = fma(_2978, _3002, _2254);
        float _3010 = fma(_2990, _3004, _2264);
        _2954 = _3006;
        _2956 = _3008;
        _2958 = _3010;
    }
    float _3012 = _2954;
    float _3014 = _2956;
    float _3016 = _2958;
    if (!_2834)
    {
        float _3018 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3020 = _3018 * 0.15915493667125701904296875;
        float _3022 = _3020 * 6.283185482025146484375;
        float _3024 = cos(_3022);
        float _3026 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3028 = _3026 * 0.15915493667125701904296875;
        float _3030 = _3020 * 6.283185482025146484375;
        float _3032 = sin(_3030);
        float _3034 = 1.0 / _3024;
        float _3036 = _3028 * 6.283185482025146484375;
        float _3038 = cos(_3036);
        float _3040 = _3032 * _3034;
        float _3042 = _3028 * 6.283185482025146484375;
        float _3044 = sin(_3042);
        float _3046 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3048 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3046;
        float _3050 = _3038 * _3040;
        float _3052 = 1.0 / _3050;
        float _3054 = 1.0 / _3048;
        float _3056 = _3044 * _3052;
        float _3058 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3060 = fma(_2964, _3056, _3058);
        float _3062 = _3060 * _3054;
        float _3064 = precise::clamp(_3062, 0.0, 1.0);
        _2966 = _3064;
    }
    float _3066 = _2966;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3070 = _3012 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3074 = _3014 + _3072;
    float _3076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3078 = _3016 + _3076;
    float _3080 = _3070 * _3070;
    float _3082 = fma(_3074, _3074, _3080);
    float _3084 = fma(_3078, _3078, _3082);
    float _3086 = rsqrt(_3084);
    float _3088 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3090 = _3074 * _3088;
    float _3092 = _3078 * _3088;
    float _3094 = _3090 * _3090;
    float _3096 = _3092 * _3092;
    float _3098 = _3094 + _3096;
    float _3100 = sqrt(_3098);
    bool _3102 = _3100 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3106 = _3100 + _3104;
    float _3108 = _3082;
    float _3110 = _3106;
    float _3112 = _3098;
    if (_3102)
    {
        float _3114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3108 = _3114;
    }
    float _3116 = _3108;
    if (_3102)
    {
        float _3118 = _3106 * _3116;
        _3110 = _3118;
    }
    float _3120 = _3110;
    if (_3102)
    {
        float _3122 = _3120 * 0.15915493667125701904296875;
        _2332 = _3122;
    }
    float _3124 = _2332;
    float _3126 = _3078;
    if (_3102)
    {
        float _3128 = _3124 * 6.283185482025146484375;
        float _3130 = sin(_3128);
        _3126 = _3130;
    }
    float _3132 = _3126;
    float _3134 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3136 = precise::max(0.0, _3134);
    float _3138 = _3086;
    float _3140 = _3136;
    if (_3102)
    {
        float _3142 = _3124 * 6.283185482025146484375;
        float _3144 = cos(_3142);
        _3138 = _3144;
    }
    float _3146 = _3138;
    float _3148 = -_3088;
    float _3150 = -_3136;
    float _3152 = fma(_3070, _3148, _3150);
    float _3154 = _3134;
    float _3156 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3102)
    {
        float _3158 = rsqrt(_3098);
        _3154 = _3158;
    }
    float _3160 = _3154;
    if (_3102)
    {
        float _3162 = _3152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3140 = _3162;
    }
    float _3164 = _3140;
    float _3166 = fma(_2254, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3168 = _3164;
    if (!_3102)
    {
        _2334 = _3094;
    }
    float _3170 = _2334;
    float _3172 = _3132;
    float _3174 = _3170;
    if (_3102)
    {
        float _3176 = fma(_3132, _3164, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3168 = _3176;
    }
    float _3178 = _3168;
    float _3180 = _3178;
    if (!_3102)
    {
        _3172 = _3152;
    }
    float _3182 = _3172;
    float _3184 = _3182;
    float _3186 = _3146;
    if (_3102)
    {
        float _3188 = _3146 + (-1.0);
        _3156 = _3188;
    }
    float _3190 = _3156;
    float _3192 = _3190;
    if (_3102)
    {
        float _3194 = _3190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3112 = _3194;
    }
    float _3196 = _3112;
    if (!_3102)
    {
        _3192 = _3092;
    }
    float _3198 = _3192;
    float _3200 = _3198;
    if (_3102)
    {
        float _3202 = _3160 * _3178;
        _215 = _3202;
    }
    float _3204 = _215;
    if (!_3102)
    {
        _3180 = _3090;
    }
    float _3206 = _3180;
    float _3208 = _3206;
    if (_3102)
    {
        float _3210 = fma(_3152, _3146, _3196);
        _3184 = _3210;
    }
    float _3212 = _3184;
    float _3214 = sqrt(_3084);
    if (_3102)
    {
        float _3216 = _3090 * _3204;
        _3208 = _3216;
    }
    float _3218 = _3208;
    if (_3102)
    {
        float _3220 = _3092 * _3204;
        _3200 = _3220;
    }
    float _3222 = _3200;
    if (!_3102)
    {
        _3186 = _3096;
    }
    float _3224 = _3186;
    float _3226 = _3224;
    if (_3102)
    {
        float _3228 = _3218 * _3218;
        _3174 = _3228;
    }
    float _3230 = _3174;
    if (_3102)
    {
        float _3232 = _3222 * _3222;
        _3226 = _3232;
    }
    float _3234 = _3226;
    float _3236 = floor(_3166);
    float _3238 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3240 = fma(_3212, _3212, _3230);
    float _3242 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3244 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3238);
    float _3246 = _3240 + _3234;
    float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3250 = fma(_3214, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3248);
    float _3252 = precise::clamp(_3250, 0.0, 1.0);
    float _3254 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3244);
    float _3256 = rsqrt(_3246);
    float _3258 = -_3252;
    float _3260 = _3258 + 1.0;
    float _3262 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3264 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3266 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3268 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3270 = abs(_3260);
    float _3272 = log2(_3270);
    float _3274 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3276 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3266);
    float _3278 = -_3268;
    float _3280 = fma(_3278, _3242, 1.0);
    float _3282 = _3012 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3284 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3274);
    float _3286 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3276);
    float _3288 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3282);
    float _3290 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3284);
    float _3292 = _3256 * _3218;
    float _3294 = _3256 * _3212;
    float _3296 = fma(_3016, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3288);
    float _3298 = _3290 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3300 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3302 = _3256 * _3222;
    float _3304 = _3296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3306 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3308 = -_3300;
    float _3310 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3308);
    float _3312 = floor(_3264);
    float _3314 = _3272 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3316 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3306);
    float _3318 = -_3302;
    float _3320 = fma(_3318, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3310);
    float _3322 = -_3236;
    float _3324 = _3166 + _3322;
    float _3326 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3316);
    float _3328 = fma(_3320, -0.5, 0.5);
    float _3330 = log2(_3280);
    float _3332 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3334 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3332);
    float _3336 = exp2(_3314);
    float _3338 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3340 = fma(_3320, 0.5, 0.5);
    float _3342 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3344 = -_3312;
    float _3346 = _3264 + _3344;
    float _3348 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3326);
    float _3350 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3342);
    float _3352 = sqrt(_3328);
    float _3354 = _3294 + 1.0;
    float _3356 = _3330 * 0.693147182464599609375;
    float _3358 = fma(_3340, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3360 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3350);
    float _3362 = fma(_3340, _3358, -0.212114393711090087890625);
    float _3364 = 1.0 / _3348;
    float _3366 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3334);
    float _3368 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3360);
    float _3370 = -_3294;
    float _3372 = fma(_3336, _3354, _3370);
    float _3374 = fma(_3340, _3362, 1.570728778839111328125);
    float _3376 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3366);
    float2 _8970 = float2(_3324, _3346);
    float _3378 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8970, float2(0.0), isnan(_8970)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8970, float2(0.0), isnan(_8970)), level(0.0)).x;
    float _3380 = _3352 * 0.636619746685028076171875;
    float _3382 = -_3374;
    float _3384 = fma(_3380, _3382, 1.0);
    float _3386 = _3356 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3388 = fma(_3372, 0.5, 0.5);
    float _3390 = _3376 * _3364;
    float _3392 = _3368 * _3364;
    float _3394 = fma(_3390, 0.5, 0.5);
    float _3396 = fma(_3392, -0.5, 0.5);
    float3 _9005 = float3(_3394, _3396, _3386);
    float _3398 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9005, float3(0.0), isnan(_9005)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9005, float3(0.0), isnan(_9005)), level(0.0)).x;
    float3 _9016 = float3(_3394, _3396, _3386);
    float4 _3401 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9016, float3(0.0), isnan(_9016)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9016, float3(0.0), isnan(_9016)), level(0.0)).xyzw;
    float _3403 = _3401.x;
    float _3405 = _3401.y;
    float _3407 = _3401.z;
    float _3409 = _3401.w;
    float2 _9032 = float2(_3384, _3388);
    float3 _3413 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9032, float2(0.0), isnan(_9032)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9032, float2(0.0), isnan(_9032)), level(0.0)).xyz;
    float _3415 = _3413.x;
    float _3417 = _3413.y;
    float _3419 = _3413.z;
    float _3421 = abs(_2964);
    float _3423 = log2(_3421);
    out.m_82.x = _3014;
    out.m_82.y = _3012;
    out.m_82.z = _3016;
    bool _3425 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3427 = isnan(_3214);
    bool _3429 = _3425 || _3427;
    bool _3431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3433 = _3429 || _3431;
    bool _3435 = _2964 <= 8000.0;
    bool _3437 = isnan(_2964);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan(8000.0);
    bool _3443 = _3439 || _3441;
    float _3445 = float(_3443);
    float _3447 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3449 = _3298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3451 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3449);
    float _3453 = exp2(_3447);
    float _3455 = fma(_3262, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3451);
    float _3457 = in.m_84.x;
    float _3459 = fma(_3338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3455);
    out.gl_Position.x = _3376;
    out.gl_Position.y = _3368;
    out.gl_Position.z = _3459;
    out.gl_Position.w = _3348;
    float _3461 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3463 = precise::clamp(_3461, 0.0, 1.0);
    float _3465 = fma(_3463, -2.0, 3.0);
    float _3467 = _3463 * _3463;
    float _3469 = _3467 * _3465;
    float _3471 = _3272 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3473 = _3368;
    float _3475 = _3348;
    float _3477 = _3459;
    if (!_3433)
    {
        _3473 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3479 = _3473;
    float _3481 = -_3469;
    float _3483 = _3481 + 1.0;
    float _3485 = exp2(_3471);
    float _3487 = fma(_3483, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3469);
    float _3489 = _3459 + _3348;
    float _3491 = _3479;
    float _3493 = _3479;
    if (!_3433)
    {
        _3475 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3495 = _3475;
    float _3497 = _3445 * _3487;
    float _3499 = _3489 * 0.5;
    float _3501 = _3066 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3503 = _3495;
    float _3505 = _3495;
    if (!_3433)
    {
        _3477 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3507 = _3477;
    float _3509 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_86.z = _3499;
    out.m_86.w = _3348;
    float _3511 = -_3485;
    float _3513 = _3511 + 1.0;
    float _3515 = _3513 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3517 = -_3515;
    float _3519 = _3517 + 1.0;
    float _3521 = -_3378;
    float _3523 = _3521 + 1.0;
    float _3525 = _3523 * _3509;
    float _3527 = precise::clamp(_3525, 0.0, 1.0);
    float _3529 = -_3527;
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3533 = _3531 * _3457;
    float _3535 = _3533 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3537 = _3515 * _3398;
    out.m_88.x = _3535;
    float _3539 = _3409 * _3537;
    float _3541 = _3419 * _3537;
    float _3543 = fma(_3415, _3539, _3403);
    float _3545 = fma(_3417, _3539, _3405);
    float _3547 = _3409 * _3519;
    float _3549 = fma(_3409, _3541, _3407);
    float _3551 = _3407;
    float _3553 = _3519;
    float _3555 = _3539;
    float _3557 = _3507;
    float _3559 = _3507;
    if (!_3433)
    {
        _3551 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3561 = _3551;
    float _3563 = _3561;
    float _3565 = _3561;
    if (!_3433)
    {
        _3553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3567 = _3553;
    out.m_90.x = _3543;
    out.m_90.y = _3545;
    out.m_90.z = _3549;
    out.m_90.w = _3547;
    float _3569 = _3567;
    float _3571 = _3567;
    if (!_3433)
    {
        _3555 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3573 = _3555;
    bool _3575 = !_3433;
    float _3577 = _3573;
    float _3579 = _3573;
    if (!_3575)
    {
        bool _3581 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3583 = isnan(_3214);
        bool _3585 = _3581 || _3583;
        bool _3587 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3589 = _3585 || _3587;
        if (!_3589)
        {
            float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3593 = _3214 + _3591;
            float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3597 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3595;
            float _3599 = 1.0 / _3597;
            float _3601 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3603 = _3601 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3605 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3607 = _3605 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3615 = _3613 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3621 = _3593 * _3599;
            float _3623 = precise::clamp(_3621, 0.0, 1.0);
            float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3627 = _3625 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3629 = fma(_3623, _3603, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3631 = fma(_3623, _3627, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3633 = fma(_3623, _3607, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3635 = fma(_3623, _3611, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3637 = fma(_3623, _3615, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3639 = fma(_3623, _3619, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3505 = _3631;
            _3571 = _3637;
            _3565 = _3629;
            _3493 = _3635;
            _3559 = _3633;
            _3579 = _3639;
            _3641 = true;
        }
        else
        {
            bool _3643 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3645 = isnan(_3214);
            bool _3647 = _3643 || _3645;
            bool _3649 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3651 = _3647 || _3649;
            if (!_3651)
            {
                _3563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3653 = _3563;
            _3565 = _3653;
            if (!_3651)
            {
                _3503 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3655 = _3503;
            _3505 = _3655;
            if (!_3651)
            {
                _3557 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3657 = _3557;
            _3559 = _3657;
            if (!_3651)
            {
                _3491 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3659 = _3491;
            _3493 = _3659;
            if (!_3651)
            {
                _3569 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3661 = _3569;
            _3571 = _3661;
            if (!_3651)
            {
                _3577 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3663 = _3577;
            bool _3665 = !_3651;
            _3579 = _3663;
            if (!_3665)
            {
                bool _3667 = _3214 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3669 = isnan(_3214);
                bool _3671 = _3667 || _3669;
                bool _3673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3675 = _3671 || _3673;
                if (!_3675)
                {
                    float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3679 = _3214 + _3677;
                    float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3683 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3681;
                    float _3685 = 1.0 / _3683;
                    float _3687 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3689 = _3687 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3693 = _3691 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3697 = _3695 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3703 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3705 = _3703 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3707 = _3679 * _3685;
                    float _3709 = precise::clamp(_3707, 0.0, 1.0);
                    float _3711 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3713 = _3711 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3715 = fma(_3709, _3689, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3717 = fma(_3709, _3713, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3719 = fma(_3709, _3693, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3721 = fma(_3709, _3697, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3723 = fma(_3709, _3701, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3725 = fma(_3709, _3705, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3505 = _3717;
                    _3571 = _3723;
                    _3565 = _3715;
                    _3493 = _3721;
                    _3559 = _3719;
                    _3579 = _3725;
                    _3641 = true;
                }
                else
                {
                    _3505 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3571 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3493 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3559 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3579 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3641 = false;
    float _3727 = _3505;
    float _3729 = _3571;
    float _3731 = _3565;
    float _3733 = _3493;
    float _3735 = _3559;
    float _3737 = _3579;
    float _3739 = fma(_2682, -0.5, 0.5);
    float _3741 = precise::clamp(_3739, 0.0, 1.0);
    float _3743 = -_3727;
    float _3745 = _3743 + _3729;
    float _3747 = _3501 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3749 = -_3731;
    float _3751 = _3749 + _3733;
    out.m_92.x = 0.0;
    float _3753 = fma(_3741, _3745, _3727);
    float _3755 = fma(_3741, _3751, _3731);
    out.m_51.x = _3747;
    float _3757 = -_3735;
    float _3759 = _3757 + _3737;
    float _3761 = _3753 * 0.586610972881317138671875;
    bool _3763 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3765 = fma(_3741, _3759, _3735);
    float _3767 = fma(_3755, 0.298911988735198974609375, _3761);
    bool _3769 = _3066 > 0.0;
    bool _3771 = isnan(_3066);
    bool _3773 = _3769 || _3771;
    bool _3775 = isnan(0.0);
    bool _3777 = _3773 || _3775;
    float _3779 = fma(_3765, 0.114477999508380889892578125, _3767);
    float _3781 = -_3779;
    float _3783 = _3755 + _3781;
    float _3785 = -_3779;
    float _3787 = _3753 + _3785;
    float _3789 = -_3779;
    float _3791 = _3765 + _3789;
    float _3793 = fma(_3783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3779);
    float _3795 = fma(_3787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3779);
    float _3797 = fma(_3791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3779);
    bool _3799 = !_3763;
    if (!_3799)
    {
        float _3801 = -_3012;
        float _3803 = _3801 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3805 = -_3014;
        float _3807 = _3805 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3809 = -_3016;
        float _3811 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3813 = _3803 * _3803;
        float _3815 = fma(_3807, _3807, _3813);
        float _3817 = fma(_3811, _3811, _3815);
        float _3819 = sqrt(_3817);
        float _3821 = rsqrt(_3817);
        float _3823 = -_3819;
        float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3827 = _3825 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3829 = precise::clamp(_3827, 0.0, 1.0);
        float _3831 = _3807 * _3821;
        float _3833 = _3803 * _3821;
        float _3835 = abs(_3829);
        float _3837 = log2(_3835);
        float _3839 = _3811 * _3821;
        float _3841 = _3831 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3843 = _2682 * _3833;
        float _3845 = -_3833;
        float _3847 = -_3841;
        float _3849 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3847);
        float _3851 = fma(_2686, _3831, _3843);
        float _3853 = -_3839;
        float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3849);
        float _3857 = fma(_2688, _3839, _3851);
        float _3859 = precise::clamp(_3857, 0.0, 1.0);
        float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3863 = _3855 + _3861;
        float _3865 = _3837 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3867 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3869 = precise::clamp(_3867, 0.0, 1.0);
        float _3871 = exp2(_3865);
        float _3873 = _3871 * _3869;
        float _3875 = _3859 * _3873;
        float _3877 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3879 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3881 = _3875 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _3877;
        out.m_92.y = _3879;
        out.m_92.z = _3881;
    }
    out.m_94.x = _3793;
    out.m_94.y = _3795;
    out.m_94.z = _3797;
    if (_3777)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3883 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3883;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

