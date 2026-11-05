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
    float4 m_69 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_65 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _86(thread const int& _4787, thread const int& _4788, constant _10& support_buffer)
{
    float _4791 = as_type<float>(support_buffer._m4);
    int _4793 = _4788 + as_type<int>(_4791);
    int _4795 = 1 + _4793;
    float _4797 = support_buffer._m5[_4795].x;
    float _4799 = abs(_4797);
    bool _4801 = _4799 == 1.0;
    if (_4801)
    {
        return _4787;
    }
    float _4803 = float(_4787);
    float _4805 = _4803 / _4799;
    int _4807 = int(_4805);
    return _4807;
}

static inline __attribute__((always_inline))
int _87(thread const int& _4837, thread const int& _4838, constant _10& support_buffer)
{
    float _4841 = as_type<float>(support_buffer._m4);
    int _4843 = _4838 + as_type<int>(_4841);
    int _4845 = 1 + _4843;
    float _4847 = support_buffer._m5[_4845].x;
    bool _4849 = _4847 == 1.0;
    if (_4849)
    {
        return _4837;
    }
    float _4851 = float(_4837);
    float _4853 = _4851 * _4847;
    int _4855 = int(_4853);
    return _4855;
}

static inline __attribute__((always_inline))
void _84(thread int& _4784, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _4784 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1269 = false;
    bool _293 = false;
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
    float _103 = as_type<float>(_95);
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1953 = as_type<float>(_111);
        out.gl_Position.z = _1953;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_51.w;
    float _117 = float(_95);
    float _119 = -_115;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_115);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    bool _133 = _121 >= _117;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = _121;
    if (_137)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_137)
    {
        out.m_49.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _113 = as_type<int>(_143);
    }
    int _145 = _113;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2017 = as_type<float>(_145);
        out.gl_Position.z = _2017;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_53.w;
    float _149 = 1.0 / _117;
    float _151 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_51.x;
    float _165 = in.m_51.y;
    float _167 = in.m_51.z;
    float _169 = in.m_46.x;
    float _171 = in.m_46.y;
    float _173 = in.m_46.z;
    float _175 = 0.0;
    float _177 = _151;
    if (!_161)
    {
        float _179 = _151 * _151;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_161)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_161;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _151 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _151);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_161;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _151 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = _121 * _149;
    float _261 = fma(_249, _163, _253);
    float _263 = fma(_249, _165, _255);
    float _265 = fma(_249, _167, _257);
    float _267 = fma(_261, _147, _169);
    float _269 = fma(_263, _147, _171);
    float _271 = fma(_265, _147, _173);
    bool _273 = !_251;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        _291 = _259;
    }
    _293 = false;
    float _295 = _291;
    int _297 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _299 = _297;
    int _301 = 0;
    int _303 = _86(_299, _301, (*spvDescriptorSet0.support_buffer));
    float _305 = in.m_57.z;
    float _307 = 0.0 + _259;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = trunc(_305);
    int _313 = int(_311);
    int _315 = _303 + (-1);
    float _317 = float(_315);
    float _319 = _309 * _317;
    float _321 = trunc(_319);
    int _323 = int(_321);
    int _325 = _323;
    int _327 = 0;
    int _329 = _87(_325, _327, (*spvDescriptorSet0.support_buffer));
    int _331 = _313;
    int _333 = 0;
    int _335 = _87(_331, _333, (*spvDescriptorSet0.support_buffer));
    float4 _338 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_329, _335)), 0).xyzw;
    float _340 = _338.x;
    float _342 = _338.y;
    float _344 = _338.z;
    float _346 = _338.w;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _295 + _348;
    bool _352 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_295);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _364;
    float _368 = -_362;
    float _370 = _368 + 1.0;
    bool _372 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _374 = isnan(_295);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = 1.0 / _366;
    float _386 = _382 * _370;
    float _388 = -_382;
    float _390 = _388 + 1.0;
    float _392 = _350 * _384;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _402;
    float _406 = fma(_396, _392, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = fma(_400, _392, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _410 = fma(_404, _392, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _412 = _406 * _386;
    float _414 = in.m_53.x;
    float _416 = in.m_53.y;
    float _418 = in.m_53.z;
    float _420 = _408 * _386;
    float _422 = _410 * _386;
    float _424 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _412);
    float _426 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[144].z, _424);
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _434 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[144].x, _426);
    float _436 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[144].y, _428);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _444 = _432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _446;
    out.m_59.y = _448;
    out.m_59.z = _444;
    out.m_59.w = _442;
    float _450 = _434 * _414;
    float _452 = _436 * _416;
    int _454 = _323 + 1;
    float _456 = _430 * _418;
    int _458 = min(_315, _454);
    uint _461 = as_type<uint>(half2(float2(_346, 0.0)));
    uint _463 = extract_bits(_461, 0u, 8u);
    int _465 = int(_463) & 255;
    uint _467 = extract_bits(_461, 8u, 8u);
    int _469 = int(_467) & 255;
    int _471 = _469 << 8;
    int _473 = _465 | _471;
    bool _475 = _473 >= 32768;
    int _477 = _473 + (-1024);
    int _479 = _477;
    float _481 = _450;
    if (_475)
    {
        int _483 = ~_473;
        int _485 = _483 + 33792;
        int _487 = _485 + 1;
        _479 = _487;
    }
    int _489 = _479;
    int _491 = _489 + 30719;
    float _493 = float(_491);
    float _495 = fma(_493, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _497 = abs(_495);
    float _499 = -_497;
    float _501 = _499 + 1.0;
    int _503 = as_type<int>(_501) + (-218103808);
    bool _505 = uint(_503) >= 1920991232u;
    bool _507 = !_505;
    if (!_507)
    {
        int _509;
        _84(_509, out.gl_Position, out.gl_PointSize);
    }
    int _511 = _458;
    int _513 = 0;
    int _515 = _87(_511, _513, (*spvDescriptorSet0.support_buffer));
    int _517 = _313;
    int _519 = 0;
    int _521 = _87(_517, _519, (*spvDescriptorSet0.support_buffer));
    float4 _523 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_515, _521)), 0).xyzw;
    float _525 = _523.x;
    float _527 = _523.y;
    float _529 = _523.z;
    float _531 = _523.w;
    float _533 = floor(_319);
    float _535 = -_533;
    float _537 = _319 + _535;
    uint _539 = as_type<uint>(half2(float2(_531, 0.0)));
    float _541 = -_340;
    float _543 = _541 + _525;
    float _545 = -_344;
    float _547 = _545 + _529;
    uint _549 = extract_bits(_539, 0u, 8u);
    int _551 = int(_549) & 255;
    uint _553 = extract_bits(_539, 8u, 8u);
    int _555 = int(_553) & 255;
    int _557 = _555 << 8;
    int _559 = _551 | _557;
    float _561 = fma(_537, _547, _344);
    bool _563 = _559 >= 32768;
    int _565 = _559 + (-1024);
    int _567 = _565;
    if (_563)
    {
        int _569 = ~_559;
        int _571 = _569 + 33792;
        int _573 = _571 + 1;
        _567 = _573;
    }
    int _575 = _567;
    float _577 = fma(_537, _543, _340);
    int _579 = _575 + 30719;
    float _581 = float(_579);
    float _583 = fma(_581, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _585 = abs(_583);
    float _587 = -_585;
    float _589 = _587 + 1.0;
    int _591 = as_type<int>(_589) + (-218103808);
    bool _593 = uint(_591) >= 1920991232u;
    float _595 = -_342;
    float _597 = _595 + _527;
    float _599 = fma(_537, _597, _342);
    bool _601 = !_593;
    if (!_601)
    {
        int _603;
        _84(_603, out.gl_Position, out.gl_PointSize);
    }
    float _605 = in.m_55.x;
    float _607 = in.m_55.y;
    float _609 = in.m_55.z;
    float _611 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _613 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _615 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _617 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _619 = log2(_617);
    float _621 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _611);
    float _623 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _613);
    float _625 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _615);
    float _627 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _621);
    float _629 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _623);
    float _631 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _625);
    float _633 = _627 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _635 = _629 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _637 = _631 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _641 = _633 + _639;
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _645 = _635 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _649 = _637 + _647;
    float _651 = _619 * _121;
    float _653 = _641 * _641;
    float _655 = _609 * 2.0;
    float _657 = _605 * 2.0;
    float _659 = fma(_645, _645, _653);
    float _661 = _607 * 2.0;
    float _663 = floor(_657);
    float _665 = floor(_655);
    float _667 = fma(_649, _649, _659);
    float _669 = rsqrt(_667);
    bool _671 = _665 > 0.0;
    float _673 = floor(_661);
    bool _675 = _665 >= 0.0;
    bool _677 = isnan(_665);
    bool _679 = _675 || _677;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    float _685 = _607 + _609;
    int _687 = _683 ? 0 : 1;
    float _689 = _685 + (-1.0);
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _701 = _699 != 0;
    float _703 = _641 * _669;
    int _705 = ~_687;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    float _711 = _645 * _669;
    bool _713 = _663 > 0.0;
    float _715 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _717 = _709;
    if (!_671)
    {
        int _719 = ~_687;
        int _721 = _719 + 1;
        _717 = _721;
    }
    int _723 = _717;
    float _725 = _641 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _727 = _663 >= 0.0;
    bool _729 = isnan(_663);
    bool _731 = _727 || _729;
    bool _733 = isnan(0.0);
    bool _735 = _731 || _733;
    float _737 = _649 * _669;
    bool _739 = _673 > 0.0;
    float _741 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[28].x, _725);
    float _743 = -_703;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _641);
    bool _747 = _673 >= 0.0;
    bool _749 = isnan(_673);
    bool _751 = _747 || _749;
    bool _753 = isnan(0.0);
    bool _755 = _751 || _753;
    float _757 = -_711;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _645);
    int _761 = _735 ? 0 : 1;
    float _763 = exp2(_651);
    float _765 = _745 * _745;
    float _767 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[28].z, _741);
    int _769 = ~_761;
    int _771 = _769 + 1;
    int _773 = _771 + 1;
    int _775 = _773;
    if (!_713)
    {
        int _777 = ~_761;
        int _779 = _777 + 1;
        _775 = _779;
    }
    int _781 = _775;
    float _783 = fma(_759, _759, _765);
    float _785 = -_737;
    float _787 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    bool _789 = !_693;
    int _791 = _789 ? 0 : 1;
    float _793 = fma(_787, _787, _783);
    bool _795 = _767 >= 0.0;
    float _797 = _607 + _605;
    bool _799 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(1.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _811 = 1.0 + _809;
    float _813 = sqrt(_793);
    bool _815 = !_697;
    int _817 = _815 ? 0 : 1;
    float _819 = in.m_61.x;
    float _821 = in.m_61.y;
    float _823 = in.m_61.z;
    int _825 = abs(_791);
    float _827 = -_763;
    float _829 = _827 + 1.0;
    bool _831 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _839 = _835 || _837;
    float _841 = _797 + (-1.0);
    int _843 = abs(_817);
    float _845 = 1.0 / _811;
    float _847 = float(_723);
    float _849 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _851 = _839 ? _829 : 0.0;
    int _853 = as_type<int>(_849);
    if (_795)
    {
        out.m_49.x = 0.0;
    }
    float _855 = float(_781);
    int _857 = _755 ? 0 : 1;
    float _859 = _669 * _813;
    float _861 = float(_825);
    float _863 = float(_843);
    int _865 = ~_857;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = _861 * _847;
    float _873 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _875 = _869;
    if (_807)
    {
        float _877 = _851 * _845;
        _139 = _877;
    }
    float _879 = _139;
    float _881 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _883 = _863 * _855;
    float _885 = _871 * (-2.0);
    if (_795)
    {
        _481 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _887 = _481;
    float _889 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _891 = _881 * _859;
    float _893 = fma(_849, _885, _849);
    float _895 = _873 * _859;
    if (_795)
    {
        float _897 = _887 * 5.0;
        _853 = as_type<int>(_897);
    }
    int _899 = _853;
    float _901 = _889 * _859;
    float _903 = fma(_885, _819, _819);
    float _905 = _823;
    if (!_739)
    {
        int _907 = ~_857;
        int _909 = _907 + 1;
        _875 = _909;
    }
    int _911 = _875;
    float _913 = _605 + (-0.5);
    if (_795)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3144 = as_type<float>(_899);
        out.gl_Position.z = _3144;
    }
    bool _915 = !_701;
    int _917 = _915 ? 0 : 1;
    out.m_63.x = _891;
    out.m_63.y = _895;
    out.m_63.z = _901;
    if (_795)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _919 = -_703;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _633);
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    float _925 = _883 * (-2.0);
    int _927 = abs(_917);
    float _929 = -_711;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _921 + _933;
    float _937 = fma(_715, _925, _715);
    float _939 = fma(_925, _821, _821);
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _931 + _941;
    float _945 = _935 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _947 = fma(_893, _879, _923);
    float _949 = _607 + (-0.5);
    float _951 = float(_927);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[28].x, _945);
    float _955 = float(_911);
    float _957 = _947 * 0.15915493667125701904296875;
    float _959 = -_737;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _637);
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].y, _939);
    float _965 = _609 + _605;
    float _967 = _951 * _955;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _971 = _961 + _969;
    float _973 = fma(_937, _879, _963);
    float _975 = _965 + (-1.0);
    float _977 = _967 * (-2.0);
    float _979 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[28].z, _953);
    float _981 = _609 + (-0.5);
    float _983 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _985 = fma(_977, _823, _823);
    float _987 = _973 * 0.15915493667125701904296875;
    bool _989 = _979 >= 0.0;
    float _991 = fma(_983, _977, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _985);
    float _995 = _957 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = fma(_991, _879, _993);
    float _1001 = _999 * 0.15915493667125701904296875;
    float _1003 = _957 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    if (_989)
    {
        _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1007 = _905;
    int _1009 = as_type<int>(_1007);
    if (_989)
    {
        out.m_49.x = 0.0;
    }
    if (_989)
    {
        float _1011 = _1007 * 5.0;
        _1009 = as_type<int>(_1011);
    }
    int _1013 = _1009;
    float _1015 = _987 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    if (_989)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3332 = as_type<float>(_1013);
        out.gl_Position.z = _3332;
    }
    float _1019 = _987 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _1001 * 6.283185482025146484375;
    float _1025 = sin(_1023);
    if (_989)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1027 = _1001 * 6.283185482025146484375;
    float _1029 = cos(_1027);
    float _1031 = _997 * _1017;
    float _1033 = _1005 * _1021;
    float _1035 = _997 * _1021;
    float _1037 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _599);
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _577);
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _561);
    float _1043 = _895 * _1037;
    float _1045 = _891 * _1039;
    float _1047 = fma(_1025, _1033, _1031);
    float _1049 = _1005 * _1017;
    float _1051 = _901 * _1041;
    float _1053 = fma(_1025, _1031, _1033);
    float _1055 = _1029 * _1043;
    float _1057 = _1017 * _1029;
    float _1059 = _1021 * _1029;
    float _1061 = -_1043;
    float _1063 = _1025 * _1061;
    float _1065 = _1005 * _1055;
    float _1067 = _997 * _1055;
    float _1069 = fma(_1059, _1045, _1063);
    float _1071 = fma(_1047, _1045, _1065);
    float _1073 = -_1035;
    float _1075 = fma(_1025, _1049, _1073);
    float _1077 = -_1049;
    float _1079 = fma(_1025, _1035, _1077);
    float _1081 = fma(_1057, _1051, _1069);
    float _1083 = fma(_1075, _1051, _1071);
    float _1085 = fma(_1079, _1045, _1067);
    float _1087 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1089 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1091 = fma(_1053, _1051, _1085);
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1087);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1089);
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1093);
    float _1101 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1095);
    float _1103 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1097);
    float _1105 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1099);
    float _1107 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1109 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1111 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1113 = _635 + _1107;
    float _1115 = _637 + _1109;
    float _1117 = _633 + _1111;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1121 = _1113 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1125 = _1115 + _1123;
    float _1127 = _1121 * _1121;
    float _1129 = _1125 * _1125;
    float _1131 = _1127 + _1129;
    float _1133 = sqrt(_1131);
    bool _1135 = _1133 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _1091;
    float _1139 = _1111;
    float _1141 = _1127;
    float _1143 = _1129;
    float _1145 = _1113;
    float _1147 = _1125;
    if (!_1135)
    {
        _1137 = _1115;
    }
    float _1149 = _1137;
    float _1151 = _1149;
    if (!_1135)
    {
        _1139 = _1117;
    }
    float _1153 = _1139;
    bool _1155 = !_1135;
    float _1157 = _1153;
    if (!_1155)
    {
        float _1159 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1163 = _1133 + _1161;
        float _1165 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1167 = rsqrt(_1131);
        float _1169 = _1163 * _1159;
        float _1171 = _1169 * 0.15915493667125701904296875;
        float _1173 = _1171 * 6.283185482025146484375;
        float _1175 = sin(_1173);
        float _1177 = _1171 * 6.283185482025146484375;
        float _1179 = cos(_1177);
        float _1181 = fma(_1175, _1165, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1183 = _1167 * _1181;
        float _1185 = _1179 + (-1.0);
        float _1187 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = _1121 * _1183;
        float _1191 = _1125 * _1183;
        float _1193 = fma(_1117, _1179, _1187);
        float _1195 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1197 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1199 = _1189 * _1189;
        float _1201 = _1191 * _1191;
        _1157 = _1193;
        _1141 = _1199;
        _1143 = _1201;
        _1145 = _1195;
        _1151 = _1197;
    }
    float _1203 = _1157;
    float _1205 = _1141;
    float _1207 = _1143;
    float _1209 = _1145;
    float _1211 = _1151;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1215 = _1203 + _1213;
    float _1217 = fma(_1215, _1215, _1205);
    float _1219 = _1217 + _1207;
    float _1221 = sqrt(_1219);
    bool _1223 = _1221 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1225 = isnan(_1221);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1231 = _1227 || _1229;
    float _1233 = _1205;
    if (!_1231)
    {
        _1233 = 1.0;
    }
    float _1235 = _1233;
    bool _1237 = !_1231;
    float _1239 = _1235;
    if (!_1237)
    {
        bool _1241 = _1221 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1243 = isnan(_1221);
        bool _1245 = _1241 || _1243;
        bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1249 = _1245 || _1247;
        if (!_1249)
        {
            float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1253 = _1221 + _1251;
            float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1257 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1255;
            float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1261 = _1259 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1263 = 1.0 / _1257;
            float _1265 = _1253 * _1263;
            float _1267 = fma(_1265, _1261, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1239 = _1267;
            _1269 = true;
        }
        else
        {
            bool _1271 = _1221 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1273 = isnan(_1221);
            bool _1275 = _1271 || _1273;
            bool _1277 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1279 = _1275 || _1277;
            if (!_1279)
            {
                float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1283 = _1221 + _1281;
                float _1285 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1287 = _1285 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1291 = _1289 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1293 = 1.0 / _1287;
                float _1295 = _1283 * _1293;
                float _1297 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1239 = _1297;
                _1269 = true;
            }
            else
            {
                _1239 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1269 = false;
    float _1299 = _1239;
    float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1303 = _1203 + _1301;
    float _1305 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1307 = _1209 + _1305;
    float _1309 = fma(_1303, _1299, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1311 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1313 = _1211 + _1311;
    float _1315 = fma(_1307, _1299, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1317 = -_703;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1321 = fma(_1313, _1299, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1323 = -_711;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1315);
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1329 = _1319 + _1327;
    float _1331 = -_737;
    float _1333 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1321);
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1337 = _1325 + _1335;
    float _1339 = _1329 * _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _1333 + _1341;
    float _1345 = fma(_1337, _1337, _1339);
    float _1347 = fma(_1343, _1343, _1345);
    float _1349 = rsqrt(_1347);
    float _1351 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1353 = _1337 * _1351;
    float _1355 = _1343 * _1351;
    float _1357 = _1353 * _1353;
    float _1359 = _1355 * _1355;
    float _1361 = _1357 + _1359;
    float _1363 = sqrt(_1361);
    bool _1365 = _1363 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1369 = _1363 + _1367;
    float _1371 = _1131;
    float _1373 = _1361;
    float _1375 = _1369;
    float _1377 = _1329;
    float _1379 = _1351;
    float _1381 = _1353;
    if (_1365)
    {
        float _1383 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1383;
    }
    float _1385 = _1371;
    if (_1365)
    {
        float _1387 = rsqrt(_1361);
        _1373 = _1387;
    }
    float _1389 = _1373;
    float _1391 = _1385;
    float _1393 = _1389;
    if (_1365)
    {
        float _1395 = _1369 * _1385;
        _1375 = _1395;
    }
    float _1397 = _1375;
    if (_1365)
    {
        float _1399 = _1397 * 0.15915493667125701904296875;
        _1147 = _1399;
    }
    float _1401 = _1147;
    float _1403 = _1343;
    if (_1365)
    {
        float _1405 = _1401 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        _1403 = _1407;
    }
    float _1409 = _1403;
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1413 = precise::max(0.0, _1411);
    float _1415 = _1221;
    float _1417 = _1413;
    if (_1365)
    {
        float _1419 = _1401 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        _1415 = _1421;
    }
    float _1423 = _1415;
    float _1425 = -_1351;
    float _1427 = -_1413;
    float _1429 = fma(_1329, _1425, _1427);
    if (_1365)
    {
        float _1431 = _1429 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1431;
    }
    float _1433 = _1377;
    float _1435 = sqrt(_1347);
    float _1437 = _1409;
    float _1439 = _1433;
    if (_1365)
    {
        float _1441 = fma(_1409, _1433, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = _1443;
    if (!_1365)
    {
        _1439 = _1355;
    }
    float _1447 = _1439;
    float _1449 = _1447;
    if (_1365)
    {
        float _1451 = _1423 + (-1.0);
        _1417 = _1451;
    }
    float _1453 = _1417;
    float _1455 = _1453;
    if (_1365)
    {
        float _1457 = _1389 * _1443;
        _1379 = _1457;
    }
    float _1459 = _1379;
    if (!_1365)
    {
        _1445 = _1429;
    }
    float _1461 = _1445;
    float _1463 = _1461;
    if (_1365)
    {
        float _1465 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1391 = _1465;
    }
    float _1467 = _1391;
    if (_1365)
    {
        float _1469 = _1353 * _1459;
        _1381 = _1469;
    }
    float _1471 = _1381;
    if (!_1365)
    {
        _1393 = _1357;
    }
    float _1473 = _1393;
    float _1475 = _1473;
    if (_1365)
    {
        float _1477 = _1355 * _1459;
        _1449 = _1477;
    }
    float _1479 = _1449;
    if (_1365)
    {
        float _1481 = fma(_1429, _1423, _1467);
        _1463 = _1481;
    }
    float _1483 = _1463;
    if (_1365)
    {
        float _1485 = _1471 * _1471;
        _1475 = _1485;
    }
    float _1487 = _1475;
    if (!_1365)
    {
        _1455 = _1359;
    }
    float _1489 = _1455;
    float _1491 = _1489;
    if (_1365)
    {
        float _1493 = _1479 * _1479;
        _1491 = _1493;
    }
    float _1495 = _1491;
    float _1497 = fma(_1483, _1483, _1487);
    float _1499 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1501 = _1497 + _1495;
    float _1503 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1507 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1505);
    float _1509 = precise::clamp(_1507, 0.0, 1.0);
    float _1511 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1499);
    float _1513 = rsqrt(_1501);
    float _1515 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1503);
    float _1517 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1519 = -_1509;
    float _1521 = _1519 + 1.0;
    float _1523 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1525 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1515);
    float _1527 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1517);
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1531 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1523);
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1535 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1527);
    float _1537 = abs(_1521);
    float _1539 = log2(_1537);
    float _1541 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1531);
    float _1543 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1545 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1547 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1511);
    float _1549 = _1513 * _1471;
    float _1551 = _1513 * _1483;
    float _1553 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1555 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1559 = _1513 * _1479;
    float _1561 = -_1543;
    float _1563 = fma(_1561, _1529, 1.0);
    float _1565 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1555);
    float _1567 = -_1557;
    float _1569 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1567);
    float _1571 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1573 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1575 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1577 = -_1559;
    float _1579 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1569);
    float _1581 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    float _1583 = log2(_1563);
    float _1585 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1587 = fma(_1579, -0.5, 0.5);
    float _1589 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1581);
    float _1591 = fma(_1579, 0.5, 0.5);
    float _1593 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1585);
    float _1595 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1573);
    float _1597 = _1551 + 1.0;
    float _1599 = exp2(_1575);
    float _1601 = fma(_1591, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1603 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1593);
    float _1605 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1595);
    float _1607 = fma(_1591, _1601, -0.212114393711090087890625);
    float _1609 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1603);
    float _1611 = 1.0 / _1589;
    float _1613 = fma(_1591, _1607, 1.570728778839111328125);
    float _1615 = _1583 * 0.693147182464599609375;
    float _1617 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1619 = sqrt(_1587);
    float _1621 = -_1551;
    float _1623 = fma(_1599, _1597, _1621);
    float _1625 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1605);
    float _1627 = fma(_1623, 0.5, 0.5);
    float _1629 = _1609 * _1611;
    float _1631 = _1625 * _1611;
    float _1633 = fma(_1629, 0.5, 0.5);
    float _1635 = fma(_1631, -0.5, 0.5);
    float _1637 = _1619 * 0.636619746685028076171875;
    float _1639 = -_1613;
    float _1641 = fma(_1637, _1639, 1.0);
    float3 _4361 = float3(_1633, _1635, _1617);
    float _1643 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4361, float3(0.0), isnan(_4361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4361, float3(0.0), isnan(_4361)), level(0.0)).x;
    float3 _4372 = float3(_1633, _1635, _1617);
    float4 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4372, float3(0.0), isnan(_4372)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4372, float3(0.0), isnan(_4372)), level(0.0)).xyzw;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = _1645.w;
    float2 _4388 = float2(_1641, _1627);
    float3 _1657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4388, float2(0.0), isnan(_4388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4388, float2(0.0), isnan(_4388)), level(0.0)).xyz;
    float _1659 = _1657.x;
    float _1661 = _1657.y;
    float _1663 = _1657.z;
    float _1665 = _921 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_65.x = _931;
    out.m_65.y = _921;
    out.m_65.z = _961;
    float _1667 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1665);
    float _1669 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1667);
    float _1671 = _921 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1673 = _1669 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1675 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1671);
    float _1677 = 1.0 / _1673;
    float _1679 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1675);
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1683 = _1681 + _1673;
    float _1685 = _1683 * _1677;
    float _1687 = _1685 * 0.5;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1691 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1689);
    bool _1693 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan(0.5);
    bool _1701 = _1697 || _1699;
    float _1703 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1705 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1707 = 1.0 / _1691;
    float _1709 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1703);
    float _1711 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1709);
    float _1713 = exp2(_1705);
    float _1715 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1711);
    float _1717 = _1709;
    float _1719 = _1533;
    if (_1701)
    {
        _1717 = 1.0;
    }
    float _1721 = _1717;
    float _1723 = _1721;
    if (_1701)
    {
        _1719 = 1.0;
    }
    float _1725 = _1719;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1729 = _1707 * _1727;
    float _1731 = _1725;
    if (!_1701)
    {
        float _1733 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = _1735 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1743 = _1741 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1739;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = 1.0 / _1761;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1767 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1765;
        float _1769 = 1.0 / _1767;
        float _1771 = _1759 * _1763;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1775 = fma(_1729, _1771, _1773);
        float _1777 = _1775 * _1769;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1723 = _1779;
    }
    float _1781 = _1723;
    if (!_1701)
    {
        float _1783 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1785 = _1783 * 0.15915493667125701904296875;
        float _1787 = _1785 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        float _1791 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1785 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = 1.0 / _1789;
        float _1801 = _1793 * 6.283185482025146484375;
        float _1803 = cos(_1801);
        float _1805 = _1797 * _1799;
        float _1807 = _1793 * 6.283185482025146484375;
        float _1809 = sin(_1807);
        float _1811 = _1803 * _1805;
        float _1813 = 1.0 / _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1817 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1815;
        float _1819 = 1.0 / _1817;
        float _1821 = _1809 * _1813;
        float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1825 = fma(_1729, _1821, _1823);
        float _1827 = _1825 * _1819;
        float _1829 = precise::clamp(_1827, 0.0, 1.0);
        float _1831 = -_1829;
        float _1833 = _1831 + 1.0;
        _1731 = _1833;
    }
    float _1835 = _1731;
    float _1837 = -_1713;
    float _1839 = _1837 + 1.0;
    bool _1841 = _1781 > 0.0;
    bool _1843 = isnan(_1781);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(0.0);
    bool _1849 = _1845 || _1847;
    float _1851 = _1781 * _1835;
    float _1853 = _1715 + _1589;
    float _1855 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1857 = _1835 <= 0.0;
    bool _1859 = !_1849;
    bool _1861 = _1857 || _1859;
    float _1863 = _1609 + _1589;
    float _1865 = _1589 * 0.5;
    float _1867 = _1855 * _1643;
    float _1869 = -_1855;
    float _1871 = _1869 + 1.0;
    float _1873 = _1851 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_67.x = _1325;
    out.m_67.y = _1319;
    out.m_67.z = _1333;
    float _1875 = _1653 * _1867;
    float _1877 = _1663 * _1867;
    float _1879 = _1853 * 0.5;
    float _1881 = fma(_1659, _1875, _1647);
    float _1883 = fma(_1661, _1875, _1649);
    float _1885 = _1653 * _1871;
    float _1887 = _1863 * 0.5;
    float _1889 = fma(_1625, -0.5, _1865);
    float _1891 = _1873 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1893 = fma(_1653, _1877, _1651);
    out.gl_Position.x = _1609;
    out.gl_Position.y = _1625;
    out.gl_Position.z = _1715;
    out.gl_Position.w = _1589;
    out.m_69.x = _1887;
    out.m_69.y = _1889;
    out.m_69.z = _1879;
    out.m_69.w = _1589;
    out.m_49.x = _1891;
    out.m_71.x = _1881;
    out.m_71.y = _1883;
    out.m_71.z = _1893;
    out.m_71.w = _1885;
    if (!_1861)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _1895 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1895;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1269 = false;
    bool _293 = false;
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
    float _103 = as_type<float>(_95);
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1953 = as_type<float>(_111);
        out.gl_Position.z = _1953;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_51.w;
    float _117 = float(_95);
    float _119 = -_115;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_115);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    bool _133 = _121 >= _117;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = _121;
    if (_137)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_137)
    {
        out.m_49.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _113 = as_type<int>(_143);
    }
    int _145 = _113;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2017 = as_type<float>(_145);
        out.gl_Position.z = _2017;
    }
    if (_137)
    {
        return out;
    }
    float _147 = in.m_53.w;
    float _149 = 1.0 / _117;
    float _151 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_51.x;
    float _165 = in.m_51.y;
    float _167 = in.m_51.z;
    float _169 = in.m_46.x;
    float _171 = in.m_46.y;
    float _173 = in.m_46.z;
    float _175 = 0.0;
    float _177 = _151;
    if (!_161)
    {
        float _179 = _151 * _151;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_161)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_161;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _151 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _151);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_161;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _151 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = _121 * _149;
    float _261 = fma(_249, _163, _253);
    float _263 = fma(_249, _165, _255);
    float _265 = fma(_249, _167, _257);
    float _267 = fma(_261, _147, _169);
    float _269 = fma(_263, _147, _171);
    float _271 = fma(_265, _147, _173);
    bool _273 = !_251;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        _291 = _259;
    }
    _293 = false;
    float _295 = _291;
    int _297 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _299 = _297;
    int _301 = 0;
    int _303 = _86(_299, _301, (*spvDescriptorSet0.support_buffer));
    float _305 = in.m_57.z;
    float _307 = 0.0 + _259;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = trunc(_305);
    int _313 = int(_311);
    int _315 = _303 + (-1);
    float _317 = float(_315);
    float _319 = _309 * _317;
    float _321 = trunc(_319);
    int _323 = int(_321);
    int _325 = _323;
    int _327 = 0;
    int _329 = _87(_325, _327, (*spvDescriptorSet0.support_buffer));
    int _331 = _313;
    int _333 = 0;
    int _335 = _87(_331, _333, (*spvDescriptorSet0.support_buffer));
    float4 _338 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_329, _335)), 0).xyzw;
    float _340 = _338.x;
    float _342 = _338.y;
    float _344 = _338.z;
    float _346 = _338.w;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _295 + _348;
    bool _352 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_295);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _364;
    float _368 = -_362;
    float _370 = _368 + 1.0;
    bool _372 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _374 = isnan(_295);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = 1.0 / _366;
    float _386 = _382 * _370;
    float _388 = -_382;
    float _390 = _388 + 1.0;
    float _392 = _350 * _384;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _402;
    float _406 = fma(_396, _392, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = fma(_400, _392, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _410 = fma(_404, _392, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _412 = _406 * _386;
    float _414 = in.m_53.x;
    float _416 = in.m_53.y;
    float _418 = in.m_53.z;
    float _420 = _408 * _386;
    float _422 = _410 * _386;
    float _424 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _412);
    float _426 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[144].z, _424);
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _434 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[144].x, _426);
    float _436 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[144].y, _428);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _444 = _432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _446;
    out.m_59.y = _448;
    out.m_59.z = _444;
    out.m_59.w = _442;
    float _450 = _434 * _414;
    float _452 = _436 * _416;
    int _454 = _323 + 1;
    float _456 = _430 * _418;
    int _458 = min(_315, _454);
    uint _461 = as_type<uint>(half2(float2(_346, 0.0)));
    uint _463 = extract_bits(_461, 0u, 8u);
    int _465 = int(_463) & 255;
    uint _467 = extract_bits(_461, 8u, 8u);
    int _469 = int(_467) & 255;
    int _471 = _469 << 8;
    int _473 = _465 | _471;
    bool _475 = _473 >= 32768;
    int _477 = _473 + (-1024);
    int _479 = _477;
    float _481 = _450;
    if (_475)
    {
        int _483 = ~_473;
        int _485 = _483 + 33792;
        int _487 = _485 + 1;
        _479 = _487;
    }
    int _489 = _479;
    int _491 = _489 + 30719;
    float _493 = float(_491);
    float _495 = fma(_493, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _497 = abs(_495);
    float _499 = -_497;
    float _501 = _499 + 1.0;
    int _503 = as_type<int>(_501) + (-218103808);
    bool _505 = uint(_503) >= 1920991232u;
    bool _507 = !_505;
    if (!_507)
    {
        int _509;
        _84(_509, out.gl_Position, out.gl_PointSize);
    }
    int _511 = _458;
    int _513 = 0;
    int _515 = _87(_511, _513, (*spvDescriptorSet0.support_buffer));
    int _517 = _313;
    int _519 = 0;
    int _521 = _87(_517, _519, (*spvDescriptorSet0.support_buffer));
    float4 _523 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_515, _521)), 0).xyzw;
    float _525 = _523.x;
    float _527 = _523.y;
    float _529 = _523.z;
    float _531 = _523.w;
    float _533 = floor(_319);
    float _535 = -_533;
    float _537 = _319 + _535;
    uint _539 = as_type<uint>(half2(float2(_531, 0.0)));
    float _541 = -_340;
    float _543 = _541 + _525;
    float _545 = -_344;
    float _547 = _545 + _529;
    uint _549 = extract_bits(_539, 0u, 8u);
    int _551 = int(_549) & 255;
    uint _553 = extract_bits(_539, 8u, 8u);
    int _555 = int(_553) & 255;
    int _557 = _555 << 8;
    int _559 = _551 | _557;
    float _561 = fma(_537, _547, _344);
    bool _563 = _559 >= 32768;
    int _565 = _559 + (-1024);
    int _567 = _565;
    if (_563)
    {
        int _569 = ~_559;
        int _571 = _569 + 33792;
        int _573 = _571 + 1;
        _567 = _573;
    }
    int _575 = _567;
    float _577 = fma(_537, _543, _340);
    int _579 = _575 + 30719;
    float _581 = float(_579);
    float _583 = fma(_581, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _585 = abs(_583);
    float _587 = -_585;
    float _589 = _587 + 1.0;
    int _591 = as_type<int>(_589) + (-218103808);
    bool _593 = uint(_591) >= 1920991232u;
    float _595 = -_342;
    float _597 = _595 + _527;
    float _599 = fma(_537, _597, _342);
    bool _601 = !_593;
    if (!_601)
    {
        int _603;
        _84(_603, out.gl_Position, out.gl_PointSize);
    }
    float _605 = in.m_55.x;
    float _607 = in.m_55.y;
    float _609 = in.m_55.z;
    float _611 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _613 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _615 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _617 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _619 = log2(_617);
    float _621 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _611);
    float _623 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _613);
    float _625 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _615);
    float _627 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _621);
    float _629 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _623);
    float _631 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _625);
    float _633 = _627 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _635 = _629 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _637 = _631 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _641 = _633 + _639;
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _645 = _635 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _649 = _637 + _647;
    float _651 = _619 * _121;
    float _653 = _641 * _641;
    float _655 = _609 * 2.0;
    float _657 = _605 * 2.0;
    float _659 = fma(_645, _645, _653);
    float _661 = _607 * 2.0;
    float _663 = floor(_657);
    float _665 = floor(_655);
    float _667 = fma(_649, _649, _659);
    float _669 = rsqrt(_667);
    bool _671 = _665 > 0.0;
    float _673 = floor(_661);
    bool _675 = _665 >= 0.0;
    bool _677 = isnan(_665);
    bool _679 = _675 || _677;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    float _685 = _607 + _609;
    int _687 = _683 ? 0 : 1;
    float _689 = _685 + (-1.0);
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _701 = _699 != 0;
    float _703 = _641 * _669;
    int _705 = ~_687;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    float _711 = _645 * _669;
    bool _713 = _663 > 0.0;
    float _715 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _717 = _709;
    if (!_671)
    {
        int _719 = ~_687;
        int _721 = _719 + 1;
        _717 = _721;
    }
    int _723 = _717;
    float _725 = _641 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _727 = _663 >= 0.0;
    bool _729 = isnan(_663);
    bool _731 = _727 || _729;
    bool _733 = isnan(0.0);
    bool _735 = _731 || _733;
    float _737 = _649 * _669;
    bool _739 = _673 > 0.0;
    float _741 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[28].x, _725);
    float _743 = -_703;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _641);
    bool _747 = _673 >= 0.0;
    bool _749 = isnan(_673);
    bool _751 = _747 || _749;
    bool _753 = isnan(0.0);
    bool _755 = _751 || _753;
    float _757 = -_711;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _645);
    int _761 = _735 ? 0 : 1;
    float _763 = exp2(_651);
    float _765 = _745 * _745;
    float _767 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[28].z, _741);
    int _769 = ~_761;
    int _771 = _769 + 1;
    int _773 = _771 + 1;
    int _775 = _773;
    if (!_713)
    {
        int _777 = ~_761;
        int _779 = _777 + 1;
        _775 = _779;
    }
    int _781 = _775;
    float _783 = fma(_759, _759, _765);
    float _785 = -_737;
    float _787 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    bool _789 = !_693;
    int _791 = _789 ? 0 : 1;
    float _793 = fma(_787, _787, _783);
    bool _795 = _767 >= 0.0;
    float _797 = _607 + _605;
    bool _799 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(1.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _811 = 1.0 + _809;
    float _813 = sqrt(_793);
    bool _815 = !_697;
    int _817 = _815 ? 0 : 1;
    float _819 = in.m_61.x;
    float _821 = in.m_61.y;
    float _823 = in.m_61.z;
    int _825 = abs(_791);
    float _827 = -_763;
    float _829 = _827 + 1.0;
    bool _831 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _839 = _835 || _837;
    float _841 = _797 + (-1.0);
    int _843 = abs(_817);
    float _845 = 1.0 / _811;
    float _847 = float(_723);
    float _849 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _851 = _839 ? _829 : 0.0;
    int _853 = as_type<int>(_849);
    if (_795)
    {
        out.m_49.x = 0.0;
    }
    float _855 = float(_781);
    int _857 = _755 ? 0 : 1;
    float _859 = _669 * _813;
    float _861 = float(_825);
    float _863 = float(_843);
    int _865 = ~_857;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = _861 * _847;
    float _873 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _875 = _869;
    if (_807)
    {
        float _877 = _851 * _845;
        _139 = _877;
    }
    float _879 = _139;
    float _881 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _883 = _863 * _855;
    float _885 = _871 * (-2.0);
    if (_795)
    {
        _481 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _887 = _481;
    float _889 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _891 = _881 * _859;
    float _893 = fma(_849, _885, _849);
    float _895 = _873 * _859;
    if (_795)
    {
        float _897 = _887 * 5.0;
        _853 = as_type<int>(_897);
    }
    int _899 = _853;
    float _901 = _889 * _859;
    float _903 = fma(_885, _819, _819);
    float _905 = _823;
    if (!_739)
    {
        int _907 = ~_857;
        int _909 = _907 + 1;
        _875 = _909;
    }
    int _911 = _875;
    float _913 = _605 + (-0.5);
    if (_795)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3144 = as_type<float>(_899);
        out.gl_Position.z = _3144;
    }
    bool _915 = !_701;
    int _917 = _915 ? 0 : 1;
    out.m_63.x = _891;
    out.m_63.y = _895;
    out.m_63.z = _901;
    if (_795)
    {
        return out;
    }
    float _919 = -_703;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _633);
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    float _925 = _883 * (-2.0);
    int _927 = abs(_917);
    float _929 = -_711;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _921 + _933;
    float _937 = fma(_715, _925, _715);
    float _939 = fma(_925, _821, _821);
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _931 + _941;
    float _945 = _935 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _947 = fma(_893, _879, _923);
    float _949 = _607 + (-0.5);
    float _951 = float(_927);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[28].x, _945);
    float _955 = float(_911);
    float _957 = _947 * 0.15915493667125701904296875;
    float _959 = -_737;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _637);
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].y, _939);
    float _965 = _609 + _605;
    float _967 = _951 * _955;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _971 = _961 + _969;
    float _973 = fma(_937, _879, _963);
    float _975 = _965 + (-1.0);
    float _977 = _967 * (-2.0);
    float _979 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[28].z, _953);
    float _981 = _609 + (-0.5);
    float _983 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _985 = fma(_977, _823, _823);
    float _987 = _973 * 0.15915493667125701904296875;
    bool _989 = _979 >= 0.0;
    float _991 = fma(_983, _977, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _985);
    float _995 = _957 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = fma(_991, _879, _993);
    float _1001 = _999 * 0.15915493667125701904296875;
    float _1003 = _957 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    if (_989)
    {
        _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1007 = _905;
    int _1009 = as_type<int>(_1007);
    if (_989)
    {
        out.m_49.x = 0.0;
    }
    if (_989)
    {
        float _1011 = _1007 * 5.0;
        _1009 = as_type<int>(_1011);
    }
    int _1013 = _1009;
    float _1015 = _987 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    if (_989)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3332 = as_type<float>(_1013);
        out.gl_Position.z = _3332;
    }
    float _1019 = _987 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _1001 * 6.283185482025146484375;
    float _1025 = sin(_1023);
    if (_989)
    {
        return out;
    }
    float _1027 = _1001 * 6.283185482025146484375;
    float _1029 = cos(_1027);
    float _1031 = _997 * _1017;
    float _1033 = _1005 * _1021;
    float _1035 = _997 * _1021;
    float _1037 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _599);
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _577);
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _561);
    float _1043 = _895 * _1037;
    float _1045 = _891 * _1039;
    float _1047 = fma(_1025, _1033, _1031);
    float _1049 = _1005 * _1017;
    float _1051 = _901 * _1041;
    float _1053 = fma(_1025, _1031, _1033);
    float _1055 = _1029 * _1043;
    float _1057 = _1017 * _1029;
    float _1059 = _1021 * _1029;
    float _1061 = -_1043;
    float _1063 = _1025 * _1061;
    float _1065 = _1005 * _1055;
    float _1067 = _997 * _1055;
    float _1069 = fma(_1059, _1045, _1063);
    float _1071 = fma(_1047, _1045, _1065);
    float _1073 = -_1035;
    float _1075 = fma(_1025, _1049, _1073);
    float _1077 = -_1049;
    float _1079 = fma(_1025, _1035, _1077);
    float _1081 = fma(_1057, _1051, _1069);
    float _1083 = fma(_1075, _1051, _1071);
    float _1085 = fma(_1079, _1045, _1067);
    float _1087 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1089 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1091 = fma(_1053, _1051, _1085);
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1087);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1089);
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1093);
    float _1101 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1095);
    float _1103 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1097);
    float _1105 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1099);
    float _1107 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1109 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1111 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1113 = _635 + _1107;
    float _1115 = _637 + _1109;
    float _1117 = _633 + _1111;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1121 = _1113 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1125 = _1115 + _1123;
    float _1127 = _1121 * _1121;
    float _1129 = _1125 * _1125;
    float _1131 = _1127 + _1129;
    float _1133 = sqrt(_1131);
    bool _1135 = _1133 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _1091;
    float _1139 = _1111;
    float _1141 = _1127;
    float _1143 = _1129;
    float _1145 = _1113;
    float _1147 = _1125;
    if (!_1135)
    {
        _1137 = _1115;
    }
    float _1149 = _1137;
    float _1151 = _1149;
    if (!_1135)
    {
        _1139 = _1117;
    }
    float _1153 = _1139;
    bool _1155 = !_1135;
    float _1157 = _1153;
    if (!_1155)
    {
        float _1159 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1163 = _1133 + _1161;
        float _1165 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1167 = rsqrt(_1131);
        float _1169 = _1163 * _1159;
        float _1171 = _1169 * 0.15915493667125701904296875;
        float _1173 = _1171 * 6.283185482025146484375;
        float _1175 = sin(_1173);
        float _1177 = _1171 * 6.283185482025146484375;
        float _1179 = cos(_1177);
        float _1181 = fma(_1175, _1165, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1183 = _1167 * _1181;
        float _1185 = _1179 + (-1.0);
        float _1187 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = _1121 * _1183;
        float _1191 = _1125 * _1183;
        float _1193 = fma(_1117, _1179, _1187);
        float _1195 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1197 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1199 = _1189 * _1189;
        float _1201 = _1191 * _1191;
        _1157 = _1193;
        _1141 = _1199;
        _1143 = _1201;
        _1145 = _1195;
        _1151 = _1197;
    }
    float _1203 = _1157;
    float _1205 = _1141;
    float _1207 = _1143;
    float _1209 = _1145;
    float _1211 = _1151;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1215 = _1203 + _1213;
    float _1217 = fma(_1215, _1215, _1205);
    float _1219 = _1217 + _1207;
    float _1221 = sqrt(_1219);
    bool _1223 = _1221 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1225 = isnan(_1221);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1231 = _1227 || _1229;
    float _1233 = _1205;
    if (!_1231)
    {
        _1233 = 1.0;
    }
    float _1235 = _1233;
    bool _1237 = !_1231;
    float _1239 = _1235;
    if (!_1237)
    {
        bool _1241 = _1221 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1243 = isnan(_1221);
        bool _1245 = _1241 || _1243;
        bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1249 = _1245 || _1247;
        if (!_1249)
        {
            float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1253 = _1221 + _1251;
            float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1257 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1255;
            float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1261 = _1259 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1263 = 1.0 / _1257;
            float _1265 = _1253 * _1263;
            float _1267 = fma(_1265, _1261, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1239 = _1267;
            _1269 = true;
        }
        else
        {
            bool _1271 = _1221 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1273 = isnan(_1221);
            bool _1275 = _1271 || _1273;
            bool _1277 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1279 = _1275 || _1277;
            if (!_1279)
            {
                float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1283 = _1221 + _1281;
                float _1285 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1287 = _1285 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1291 = _1289 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1293 = 1.0 / _1287;
                float _1295 = _1283 * _1293;
                float _1297 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1239 = _1297;
                _1269 = true;
            }
            else
            {
                _1239 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1269 = false;
    float _1299 = _1239;
    float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1303 = _1203 + _1301;
    float _1305 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1307 = _1209 + _1305;
    float _1309 = fma(_1303, _1299, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1311 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1313 = _1211 + _1311;
    float _1315 = fma(_1307, _1299, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1317 = -_703;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1321 = fma(_1313, _1299, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1323 = -_711;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1315);
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1329 = _1319 + _1327;
    float _1331 = -_737;
    float _1333 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1321);
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1337 = _1325 + _1335;
    float _1339 = _1329 * _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _1333 + _1341;
    float _1345 = fma(_1337, _1337, _1339);
    float _1347 = fma(_1343, _1343, _1345);
    float _1349 = rsqrt(_1347);
    float _1351 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1353 = _1337 * _1351;
    float _1355 = _1343 * _1351;
    float _1357 = _1353 * _1353;
    float _1359 = _1355 * _1355;
    float _1361 = _1357 + _1359;
    float _1363 = sqrt(_1361);
    bool _1365 = _1363 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1369 = _1363 + _1367;
    float _1371 = _1131;
    float _1373 = _1361;
    float _1375 = _1369;
    float _1377 = _1329;
    float _1379 = _1351;
    float _1381 = _1353;
    if (_1365)
    {
        float _1383 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1383;
    }
    float _1385 = _1371;
    if (_1365)
    {
        float _1387 = rsqrt(_1361);
        _1373 = _1387;
    }
    float _1389 = _1373;
    float _1391 = _1385;
    float _1393 = _1389;
    if (_1365)
    {
        float _1395 = _1369 * _1385;
        _1375 = _1395;
    }
    float _1397 = _1375;
    if (_1365)
    {
        float _1399 = _1397 * 0.15915493667125701904296875;
        _1147 = _1399;
    }
    float _1401 = _1147;
    float _1403 = _1343;
    if (_1365)
    {
        float _1405 = _1401 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        _1403 = _1407;
    }
    float _1409 = _1403;
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1413 = precise::max(0.0, _1411);
    float _1415 = _1221;
    float _1417 = _1413;
    if (_1365)
    {
        float _1419 = _1401 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        _1415 = _1421;
    }
    float _1423 = _1415;
    float _1425 = -_1351;
    float _1427 = -_1413;
    float _1429 = fma(_1329, _1425, _1427);
    if (_1365)
    {
        float _1431 = _1429 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1431;
    }
    float _1433 = _1377;
    float _1435 = sqrt(_1347);
    float _1437 = _1409;
    float _1439 = _1433;
    if (_1365)
    {
        float _1441 = fma(_1409, _1433, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = _1443;
    if (!_1365)
    {
        _1439 = _1355;
    }
    float _1447 = _1439;
    float _1449 = _1447;
    if (_1365)
    {
        float _1451 = _1423 + (-1.0);
        _1417 = _1451;
    }
    float _1453 = _1417;
    float _1455 = _1453;
    if (_1365)
    {
        float _1457 = _1389 * _1443;
        _1379 = _1457;
    }
    float _1459 = _1379;
    if (!_1365)
    {
        _1445 = _1429;
    }
    float _1461 = _1445;
    float _1463 = _1461;
    if (_1365)
    {
        float _1465 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1391 = _1465;
    }
    float _1467 = _1391;
    if (_1365)
    {
        float _1469 = _1353 * _1459;
        _1381 = _1469;
    }
    float _1471 = _1381;
    if (!_1365)
    {
        _1393 = _1357;
    }
    float _1473 = _1393;
    float _1475 = _1473;
    if (_1365)
    {
        float _1477 = _1355 * _1459;
        _1449 = _1477;
    }
    float _1479 = _1449;
    if (_1365)
    {
        float _1481 = fma(_1429, _1423, _1467);
        _1463 = _1481;
    }
    float _1483 = _1463;
    if (_1365)
    {
        float _1485 = _1471 * _1471;
        _1475 = _1485;
    }
    float _1487 = _1475;
    if (!_1365)
    {
        _1455 = _1359;
    }
    float _1489 = _1455;
    float _1491 = _1489;
    if (_1365)
    {
        float _1493 = _1479 * _1479;
        _1491 = _1493;
    }
    float _1495 = _1491;
    float _1497 = fma(_1483, _1483, _1487);
    float _1499 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1501 = _1497 + _1495;
    float _1503 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1507 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1505);
    float _1509 = precise::clamp(_1507, 0.0, 1.0);
    float _1511 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1499);
    float _1513 = rsqrt(_1501);
    float _1515 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1503);
    float _1517 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1519 = -_1509;
    float _1521 = _1519 + 1.0;
    float _1523 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1525 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1515);
    float _1527 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1517);
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1531 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1523);
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1535 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1527);
    float _1537 = abs(_1521);
    float _1539 = log2(_1537);
    float _1541 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1531);
    float _1543 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1545 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1547 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1511);
    float _1549 = _1513 * _1471;
    float _1551 = _1513 * _1483;
    float _1553 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1555 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1559 = _1513 * _1479;
    float _1561 = -_1543;
    float _1563 = fma(_1561, _1529, 1.0);
    float _1565 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1555);
    float _1567 = -_1557;
    float _1569 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1567);
    float _1571 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1573 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1575 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1577 = -_1559;
    float _1579 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1569);
    float _1581 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    float _1583 = log2(_1563);
    float _1585 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1587 = fma(_1579, -0.5, 0.5);
    float _1589 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1581);
    float _1591 = fma(_1579, 0.5, 0.5);
    float _1593 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1585);
    float _1595 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1573);
    float _1597 = _1551 + 1.0;
    float _1599 = exp2(_1575);
    float _1601 = fma(_1591, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1603 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1593);
    float _1605 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1595);
    float _1607 = fma(_1591, _1601, -0.212114393711090087890625);
    float _1609 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1603);
    float _1611 = 1.0 / _1589;
    float _1613 = fma(_1591, _1607, 1.570728778839111328125);
    float _1615 = _1583 * 0.693147182464599609375;
    float _1617 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1619 = sqrt(_1587);
    float _1621 = -_1551;
    float _1623 = fma(_1599, _1597, _1621);
    float _1625 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1605);
    float _1627 = fma(_1623, 0.5, 0.5);
    float _1629 = _1609 * _1611;
    float _1631 = _1625 * _1611;
    float _1633 = fma(_1629, 0.5, 0.5);
    float _1635 = fma(_1631, -0.5, 0.5);
    float _1637 = _1619 * 0.636619746685028076171875;
    float _1639 = -_1613;
    float _1641 = fma(_1637, _1639, 1.0);
    float3 _4361 = float3(_1633, _1635, _1617);
    float _1643 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4361, float3(0.0), isnan(_4361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4361, float3(0.0), isnan(_4361)), level(0.0)).x;
    float3 _4372 = float3(_1633, _1635, _1617);
    float4 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4372, float3(0.0), isnan(_4372)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4372, float3(0.0), isnan(_4372)), level(0.0)).xyzw;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = _1645.w;
    float2 _4388 = float2(_1641, _1627);
    float3 _1657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4388, float2(0.0), isnan(_4388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4388, float2(0.0), isnan(_4388)), level(0.0)).xyz;
    float _1659 = _1657.x;
    float _1661 = _1657.y;
    float _1663 = _1657.z;
    float _1665 = _921 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_65.x = _931;
    out.m_65.y = _921;
    out.m_65.z = _961;
    float _1667 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1665);
    float _1669 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1667);
    float _1671 = _921 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1673 = _1669 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1675 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1671);
    float _1677 = 1.0 / _1673;
    float _1679 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1675);
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1683 = _1681 + _1673;
    float _1685 = _1683 * _1677;
    float _1687 = _1685 * 0.5;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1691 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1689);
    bool _1693 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan(0.5);
    bool _1701 = _1697 || _1699;
    float _1703 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1705 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1707 = 1.0 / _1691;
    float _1709 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1703);
    float _1711 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1709);
    float _1713 = exp2(_1705);
    float _1715 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1711);
    float _1717 = _1709;
    float _1719 = _1533;
    if (_1701)
    {
        _1717 = 1.0;
    }
    float _1721 = _1717;
    float _1723 = _1721;
    if (_1701)
    {
        _1719 = 1.0;
    }
    float _1725 = _1719;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1729 = _1707 * _1727;
    float _1731 = _1725;
    if (!_1701)
    {
        float _1733 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = _1735 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1743 = _1741 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1739;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = 1.0 / _1761;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1767 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1765;
        float _1769 = 1.0 / _1767;
        float _1771 = _1759 * _1763;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1775 = fma(_1729, _1771, _1773);
        float _1777 = _1775 * _1769;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1723 = _1779;
    }
    float _1781 = _1723;
    if (!_1701)
    {
        float _1783 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1785 = _1783 * 0.15915493667125701904296875;
        float _1787 = _1785 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        float _1791 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1785 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = 1.0 / _1789;
        float _1801 = _1793 * 6.283185482025146484375;
        float _1803 = cos(_1801);
        float _1805 = _1797 * _1799;
        float _1807 = _1793 * 6.283185482025146484375;
        float _1809 = sin(_1807);
        float _1811 = _1803 * _1805;
        float _1813 = 1.0 / _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1817 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1815;
        float _1819 = 1.0 / _1817;
        float _1821 = _1809 * _1813;
        float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1825 = fma(_1729, _1821, _1823);
        float _1827 = _1825 * _1819;
        float _1829 = precise::clamp(_1827, 0.0, 1.0);
        float _1831 = -_1829;
        float _1833 = _1831 + 1.0;
        _1731 = _1833;
    }
    float _1835 = _1731;
    float _1837 = -_1713;
    float _1839 = _1837 + 1.0;
    bool _1841 = _1781 > 0.0;
    bool _1843 = isnan(_1781);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(0.0);
    bool _1849 = _1845 || _1847;
    float _1851 = _1781 * _1835;
    float _1853 = _1715 + _1589;
    float _1855 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1857 = _1835 <= 0.0;
    bool _1859 = !_1849;
    bool _1861 = _1857 || _1859;
    float _1863 = _1609 + _1589;
    float _1865 = _1589 * 0.5;
    float _1867 = _1855 * _1643;
    float _1869 = -_1855;
    float _1871 = _1869 + 1.0;
    float _1873 = _1851 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_67.x = _1325;
    out.m_67.y = _1319;
    out.m_67.z = _1333;
    float _1875 = _1653 * _1867;
    float _1877 = _1663 * _1867;
    float _1879 = _1853 * 0.5;
    float _1881 = fma(_1659, _1875, _1647);
    float _1883 = fma(_1661, _1875, _1649);
    float _1885 = _1653 * _1871;
    float _1887 = _1863 * 0.5;
    float _1889 = fma(_1625, -0.5, _1865);
    float _1891 = _1873 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1893 = fma(_1653, _1877, _1651);
    out.gl_Position.x = _1609;
    out.gl_Position.y = _1625;
    out.gl_Position.z = _1715;
    out.gl_Position.w = _1589;
    out.m_69.x = _1887;
    out.m_69.y = _1889;
    out.m_69.z = _1879;
    out.m_69.w = _1589;
    out.m_49.x = _1891;
    out.m_71.x = _1881;
    out.m_71.y = _1883;
    out.m_71.z = _1893;
    out.m_71.w = _1885;
    if (!_1861)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _1895 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1895;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1269 = false;
    bool _293 = false;
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
    float _103 = as_type<float>(_95);
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _105 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1953 = as_type<float>(_111);
        out.gl_Position.z = _1953;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_51.w;
    float _117 = float(_95);
    float _119 = -_115;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_115);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    bool _133 = _121 >= _117;
    bool _135 = !_131;
    bool _137 = _133 || _135;
    float _139 = _121;
    if (_137)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _103;
    if (_137)
    {
        out.m_49.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _113 = as_type<int>(_143);
    }
    int _145 = _113;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2017 = as_type<float>(_145);
        out.gl_Position.z = _2017;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_53.w;
    float _149 = 1.0 / _117;
    float _151 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_51.x;
    float _165 = in.m_51.y;
    float _167 = in.m_51.z;
    float _169 = in.m_46.x;
    float _171 = in.m_46.y;
    float _173 = in.m_46.z;
    float _175 = 0.0;
    float _177 = _151;
    if (!_161)
    {
        float _179 = _151 * _151;
        float _181 = _179 * 0.5;
        _175 = _181;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_161)
    {
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_161;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _151 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _151);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_161;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _151 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _177 = _247;
    }
    float _249 = _177;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = _121 * _149;
    float _261 = fma(_249, _163, _253);
    float _263 = fma(_249, _165, _255);
    float _265 = fma(_249, _167, _257);
    float _267 = fma(_261, _147, _169);
    float _269 = fma(_263, _147, _171);
    float _271 = fma(_265, _147, _173);
    bool _273 = !_251;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        _291 = _259;
    }
    _293 = false;
    float _295 = _291;
    int _297 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _299 = _297;
    int _301 = 0;
    int _303 = _86(_299, _301, (*spvDescriptorSet0.support_buffer));
    float _305 = in.m_57.z;
    float _307 = 0.0 + _259;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = trunc(_305);
    int _313 = int(_311);
    int _315 = _303 + (-1);
    float _317 = float(_315);
    float _319 = _309 * _317;
    float _321 = trunc(_319);
    int _323 = int(_321);
    int _325 = _323;
    int _327 = 0;
    int _329 = _87(_325, _327, (*spvDescriptorSet0.support_buffer));
    int _331 = _313;
    int _333 = 0;
    int _335 = _87(_331, _333, (*spvDescriptorSet0.support_buffer));
    float4 _338 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_329, _335)), 0).xyzw;
    float _340 = _338.x;
    float _342 = _338.y;
    float _344 = _338.z;
    float _346 = _338.w;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = _295 + _348;
    bool _352 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_295);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _364;
    float _368 = -_362;
    float _370 = _368 + 1.0;
    bool _372 = _295 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _374 = isnan(_295);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = 1.0 / _366;
    float _386 = _382 * _370;
    float _388 = -_382;
    float _390 = _388 + 1.0;
    float _392 = _350 * _384;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _402;
    float _406 = fma(_396, _392, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = fma(_400, _392, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _410 = fma(_404, _392, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _412 = _406 * _386;
    float _414 = in.m_53.x;
    float _416 = in.m_53.y;
    float _418 = in.m_53.z;
    float _420 = _408 * _386;
    float _422 = _410 * _386;
    float _424 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _412);
    float _426 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _430 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[144].z, _424);
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _434 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[144].x, _426);
    float _436 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[144].y, _428);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _444 = _432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _446;
    out.m_59.y = _448;
    out.m_59.z = _444;
    out.m_59.w = _442;
    float _450 = _434 * _414;
    float _452 = _436 * _416;
    int _454 = _323 + 1;
    float _456 = _430 * _418;
    int _458 = min(_315, _454);
    uint _461 = as_type<uint>(half2(float2(_346, 0.0)));
    uint _463 = extract_bits(_461, 0u, 8u);
    int _465 = int(_463) & 255;
    uint _467 = extract_bits(_461, 8u, 8u);
    int _469 = int(_467) & 255;
    int _471 = _469 << 8;
    int _473 = _465 | _471;
    bool _475 = _473 >= 32768;
    int _477 = _473 + (-1024);
    int _479 = _477;
    float _481 = _450;
    if (_475)
    {
        int _483 = ~_473;
        int _485 = _483 + 33792;
        int _487 = _485 + 1;
        _479 = _487;
    }
    int _489 = _479;
    int _491 = _489 + 30719;
    float _493 = float(_491);
    float _495 = fma(_493, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _497 = abs(_495);
    float _499 = -_497;
    float _501 = _499 + 1.0;
    int _503 = as_type<int>(_501) + (-218103808);
    bool _505 = uint(_503) >= 1920991232u;
    bool _507 = !_505;
    if (!_507)
    {
        int _509;
        _84(_509, out.gl_Position, out.gl_PointSize);
    }
    int _511 = _458;
    int _513 = 0;
    int _515 = _87(_511, _513, (*spvDescriptorSet0.support_buffer));
    int _517 = _313;
    int _519 = 0;
    int _521 = _87(_517, _519, (*spvDescriptorSet0.support_buffer));
    float4 _523 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_515, _521)), 0).xyzw;
    float _525 = _523.x;
    float _527 = _523.y;
    float _529 = _523.z;
    float _531 = _523.w;
    float _533 = floor(_319);
    float _535 = -_533;
    float _537 = _319 + _535;
    uint _539 = as_type<uint>(half2(float2(_531, 0.0)));
    float _541 = -_340;
    float _543 = _541 + _525;
    float _545 = -_344;
    float _547 = _545 + _529;
    uint _549 = extract_bits(_539, 0u, 8u);
    int _551 = int(_549) & 255;
    uint _553 = extract_bits(_539, 8u, 8u);
    int _555 = int(_553) & 255;
    int _557 = _555 << 8;
    int _559 = _551 | _557;
    float _561 = fma(_537, _547, _344);
    bool _563 = _559 >= 32768;
    int _565 = _559 + (-1024);
    int _567 = _565;
    if (_563)
    {
        int _569 = ~_559;
        int _571 = _569 + 33792;
        int _573 = _571 + 1;
        _567 = _573;
    }
    int _575 = _567;
    float _577 = fma(_537, _543, _340);
    int _579 = _575 + 30719;
    float _581 = float(_579);
    float _583 = fma(_581, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _585 = abs(_583);
    float _587 = -_585;
    float _589 = _587 + 1.0;
    int _591 = as_type<int>(_589) + (-218103808);
    bool _593 = uint(_591) >= 1920991232u;
    float _595 = -_342;
    float _597 = _595 + _527;
    float _599 = fma(_537, _597, _342);
    bool _601 = !_593;
    if (!_601)
    {
        int _603;
        _84(_603, out.gl_Position, out.gl_PointSize);
    }
    float _605 = in.m_55.x;
    float _607 = in.m_55.y;
    float _609 = in.m_55.z;
    float _611 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _613 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _615 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _617 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _619 = log2(_617);
    float _621 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _611);
    float _623 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _613);
    float _625 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _615);
    float _627 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _621);
    float _629 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _623);
    float _631 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _625);
    float _633 = _627 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _635 = _629 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _637 = _631 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _639 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _641 = _633 + _639;
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _645 = _635 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _649 = _637 + _647;
    float _651 = _619 * _121;
    float _653 = _641 * _641;
    float _655 = _609 * 2.0;
    float _657 = _605 * 2.0;
    float _659 = fma(_645, _645, _653);
    float _661 = _607 * 2.0;
    float _663 = floor(_657);
    float _665 = floor(_655);
    float _667 = fma(_649, _649, _659);
    float _669 = rsqrt(_667);
    bool _671 = _665 > 0.0;
    float _673 = floor(_661);
    bool _675 = _665 >= 0.0;
    bool _677 = isnan(_665);
    bool _679 = _675 || _677;
    bool _681 = isnan(0.0);
    bool _683 = _679 || _681;
    float _685 = _607 + _609;
    int _687 = _683 ? 0 : 1;
    float _689 = _685 + (-1.0);
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _701 = _699 != 0;
    float _703 = _641 * _669;
    int _705 = ~_687;
    int _707 = _705 + 1;
    int _709 = _707 + 1;
    float _711 = _645 * _669;
    bool _713 = _663 > 0.0;
    float _715 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _717 = _709;
    if (!_671)
    {
        int _719 = ~_687;
        int _721 = _719 + 1;
        _717 = _721;
    }
    int _723 = _717;
    float _725 = _641 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _727 = _663 >= 0.0;
    bool _729 = isnan(_663);
    bool _731 = _727 || _729;
    bool _733 = isnan(0.0);
    bool _735 = _731 || _733;
    float _737 = _649 * _669;
    bool _739 = _673 > 0.0;
    float _741 = fma(_645, (*spvDescriptorSet0.vp_c8)._m0[28].x, _725);
    float _743 = -_703;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _641);
    bool _747 = _673 >= 0.0;
    bool _749 = isnan(_673);
    bool _751 = _747 || _749;
    bool _753 = isnan(0.0);
    bool _755 = _751 || _753;
    float _757 = -_711;
    float _759 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[18].w, _645);
    int _761 = _735 ? 0 : 1;
    float _763 = exp2(_651);
    float _765 = _745 * _745;
    float _767 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[28].z, _741);
    int _769 = ~_761;
    int _771 = _769 + 1;
    int _773 = _771 + 1;
    int _775 = _773;
    if (!_713)
    {
        int _777 = ~_761;
        int _779 = _777 + 1;
        _775 = _779;
    }
    int _781 = _775;
    float _783 = fma(_759, _759, _765);
    float _785 = -_737;
    float _787 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    bool _789 = !_693;
    int _791 = _789 ? 0 : 1;
    float _793 = fma(_787, _787, _783);
    bool _795 = _767 >= 0.0;
    float _797 = _607 + _605;
    bool _799 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _801 = isnan(1.0);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _807 = _803 || _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _811 = 1.0 + _809;
    float _813 = sqrt(_793);
    bool _815 = !_697;
    int _817 = _815 ? 0 : 1;
    float _819 = in.m_61.x;
    float _821 = in.m_61.y;
    float _823 = in.m_61.z;
    int _825 = abs(_791);
    float _827 = -_763;
    float _829 = _827 + 1.0;
    bool _831 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _839 = _835 || _837;
    float _841 = _797 + (-1.0);
    int _843 = abs(_817);
    float _845 = 1.0 / _811;
    float _847 = float(_723);
    float _849 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _851 = _839 ? _829 : 0.0;
    int _853 = as_type<int>(_849);
    if (_795)
    {
        out.m_49.x = 0.0;
    }
    float _855 = float(_781);
    int _857 = _755 ? 0 : 1;
    float _859 = _669 * _813;
    float _861 = float(_825);
    float _863 = float(_843);
    int _865 = ~_857;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = _861 * _847;
    float _873 = _452 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _875 = _869;
    if (_807)
    {
        float _877 = _851 * _845;
        _139 = _877;
    }
    float _879 = _139;
    float _881 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _883 = _863 * _855;
    float _885 = _871 * (-2.0);
    if (_795)
    {
        _481 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _887 = _481;
    float _889 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _891 = _881 * _859;
    float _893 = fma(_849, _885, _849);
    float _895 = _873 * _859;
    if (_795)
    {
        float _897 = _887 * 5.0;
        _853 = as_type<int>(_897);
    }
    int _899 = _853;
    float _901 = _889 * _859;
    float _903 = fma(_885, _819, _819);
    float _905 = _823;
    if (!_739)
    {
        int _907 = ~_857;
        int _909 = _907 + 1;
        _875 = _909;
    }
    int _911 = _875;
    float _913 = _605 + (-0.5);
    if (_795)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3144 = as_type<float>(_899);
        out.gl_Position.z = _3144;
    }
    bool _915 = !_701;
    int _917 = _915 ? 0 : 1;
    out.m_63.x = _891;
    out.m_63.y = _895;
    out.m_63.z = _901;
    if (_795)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _919 = -_703;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _633);
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    float _925 = _883 * (-2.0);
    int _927 = abs(_917);
    float _929 = -_711;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _921 + _933;
    float _937 = fma(_715, _925, _715);
    float _939 = fma(_925, _821, _821);
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _931 + _941;
    float _945 = _935 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _947 = fma(_893, _879, _923);
    float _949 = _607 + (-0.5);
    float _951 = float(_927);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[28].x, _945);
    float _955 = float(_911);
    float _957 = _947 * 0.15915493667125701904296875;
    float _959 = -_737;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _637);
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].y, _939);
    float _965 = _609 + _605;
    float _967 = _951 * _955;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _971 = _961 + _969;
    float _973 = fma(_937, _879, _963);
    float _975 = _965 + (-1.0);
    float _977 = _967 * (-2.0);
    float _979 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[28].z, _953);
    float _981 = _609 + (-0.5);
    float _983 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _985 = fma(_977, _823, _823);
    float _987 = _973 * 0.15915493667125701904296875;
    bool _989 = _979 >= 0.0;
    float _991 = fma(_983, _977, _983);
    float _993 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _985);
    float _995 = _957 * 6.283185482025146484375;
    float _997 = sin(_995);
    float _999 = fma(_991, _879, _993);
    float _1001 = _999 * 0.15915493667125701904296875;
    float _1003 = _957 * 6.283185482025146484375;
    float _1005 = cos(_1003);
    if (_989)
    {
        _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1007 = _905;
    int _1009 = as_type<int>(_1007);
    if (_989)
    {
        out.m_49.x = 0.0;
    }
    if (_989)
    {
        float _1011 = _1007 * 5.0;
        _1009 = as_type<int>(_1011);
    }
    int _1013 = _1009;
    float _1015 = _987 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    if (_989)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3332 = as_type<float>(_1013);
        out.gl_Position.z = _3332;
    }
    float _1019 = _987 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _1001 * 6.283185482025146484375;
    float _1025 = sin(_1023);
    if (_989)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1027 = _1001 * 6.283185482025146484375;
    float _1029 = cos(_1027);
    float _1031 = _997 * _1017;
    float _1033 = _1005 * _1021;
    float _1035 = _997 * _1021;
    float _1037 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _599);
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _577);
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _561);
    float _1043 = _895 * _1037;
    float _1045 = _891 * _1039;
    float _1047 = fma(_1025, _1033, _1031);
    float _1049 = _1005 * _1017;
    float _1051 = _901 * _1041;
    float _1053 = fma(_1025, _1031, _1033);
    float _1055 = _1029 * _1043;
    float _1057 = _1017 * _1029;
    float _1059 = _1021 * _1029;
    float _1061 = -_1043;
    float _1063 = _1025 * _1061;
    float _1065 = _1005 * _1055;
    float _1067 = _997 * _1055;
    float _1069 = fma(_1059, _1045, _1063);
    float _1071 = fma(_1047, _1045, _1065);
    float _1073 = -_1035;
    float _1075 = fma(_1025, _1049, _1073);
    float _1077 = -_1049;
    float _1079 = fma(_1025, _1035, _1077);
    float _1081 = fma(_1057, _1051, _1069);
    float _1083 = fma(_1075, _1051, _1071);
    float _1085 = fma(_1079, _1045, _1067);
    float _1087 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1089 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1091 = fma(_1053, _1051, _1085);
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1087);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1089);
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1093);
    float _1101 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1095);
    float _1103 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1097);
    float _1105 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1099);
    float _1107 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1109 = _1103 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1111 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1113 = _635 + _1107;
    float _1115 = _637 + _1109;
    float _1117 = _633 + _1111;
    float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1121 = _1113 + _1119;
    float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1125 = _1115 + _1123;
    float _1127 = _1121 * _1121;
    float _1129 = _1125 * _1125;
    float _1131 = _1127 + _1129;
    float _1133 = sqrt(_1131);
    bool _1135 = _1133 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _1091;
    float _1139 = _1111;
    float _1141 = _1127;
    float _1143 = _1129;
    float _1145 = _1113;
    float _1147 = _1125;
    if (!_1135)
    {
        _1137 = _1115;
    }
    float _1149 = _1137;
    float _1151 = _1149;
    if (!_1135)
    {
        _1139 = _1117;
    }
    float _1153 = _1139;
    bool _1155 = !_1135;
    float _1157 = _1153;
    if (!_1155)
    {
        float _1159 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1163 = _1133 + _1161;
        float _1165 = _1117 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1167 = rsqrt(_1131);
        float _1169 = _1163 * _1159;
        float _1171 = _1169 * 0.15915493667125701904296875;
        float _1173 = _1171 * 6.283185482025146484375;
        float _1175 = sin(_1173);
        float _1177 = _1171 * 6.283185482025146484375;
        float _1179 = cos(_1177);
        float _1181 = fma(_1175, _1165, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1183 = _1167 * _1181;
        float _1185 = _1179 + (-1.0);
        float _1187 = _1185 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1189 = _1121 * _1183;
        float _1191 = _1125 * _1183;
        float _1193 = fma(_1117, _1179, _1187);
        float _1195 = _1189 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1197 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1199 = _1189 * _1189;
        float _1201 = _1191 * _1191;
        _1157 = _1193;
        _1141 = _1199;
        _1143 = _1201;
        _1145 = _1195;
        _1151 = _1197;
    }
    float _1203 = _1157;
    float _1205 = _1141;
    float _1207 = _1143;
    float _1209 = _1145;
    float _1211 = _1151;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1215 = _1203 + _1213;
    float _1217 = fma(_1215, _1215, _1205);
    float _1219 = _1217 + _1207;
    float _1221 = sqrt(_1219);
    bool _1223 = _1221 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1225 = isnan(_1221);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1231 = _1227 || _1229;
    float _1233 = _1205;
    if (!_1231)
    {
        _1233 = 1.0;
    }
    float _1235 = _1233;
    bool _1237 = !_1231;
    float _1239 = _1235;
    if (!_1237)
    {
        bool _1241 = _1221 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1243 = isnan(_1221);
        bool _1245 = _1241 || _1243;
        bool _1247 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1249 = _1245 || _1247;
        if (!_1249)
        {
            float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1253 = _1221 + _1251;
            float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1257 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1255;
            float _1259 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1261 = _1259 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1263 = 1.0 / _1257;
            float _1265 = _1253 * _1263;
            float _1267 = fma(_1265, _1261, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1239 = _1267;
            _1269 = true;
        }
        else
        {
            bool _1271 = _1221 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1273 = isnan(_1221);
            bool _1275 = _1271 || _1273;
            bool _1277 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1279 = _1275 || _1277;
            if (!_1279)
            {
                float _1281 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1283 = _1221 + _1281;
                float _1285 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1287 = _1285 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1291 = _1289 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1293 = 1.0 / _1287;
                float _1295 = _1283 * _1293;
                float _1297 = fma(_1295, _1291, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1239 = _1297;
                _1269 = true;
            }
            else
            {
                _1239 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1269 = false;
    float _1299 = _1239;
    float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1303 = _1203 + _1301;
    float _1305 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1307 = _1209 + _1305;
    float _1309 = fma(_1303, _1299, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1311 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1313 = _1211 + _1311;
    float _1315 = fma(_1307, _1299, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1317 = -_703;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1321 = fma(_1313, _1299, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1323 = -_711;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1315);
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1329 = _1319 + _1327;
    float _1331 = -_737;
    float _1333 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1321);
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1337 = _1325 + _1335;
    float _1339 = _1329 * _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _1333 + _1341;
    float _1345 = fma(_1337, _1337, _1339);
    float _1347 = fma(_1343, _1343, _1345);
    float _1349 = rsqrt(_1347);
    float _1351 = _1349 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1353 = _1337 * _1351;
    float _1355 = _1343 * _1351;
    float _1357 = _1353 * _1353;
    float _1359 = _1355 * _1355;
    float _1361 = _1357 + _1359;
    float _1363 = sqrt(_1361);
    bool _1365 = _1363 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1369 = _1363 + _1367;
    float _1371 = _1131;
    float _1373 = _1361;
    float _1375 = _1369;
    float _1377 = _1329;
    float _1379 = _1351;
    float _1381 = _1353;
    if (_1365)
    {
        float _1383 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1383;
    }
    float _1385 = _1371;
    if (_1365)
    {
        float _1387 = rsqrt(_1361);
        _1373 = _1387;
    }
    float _1389 = _1373;
    float _1391 = _1385;
    float _1393 = _1389;
    if (_1365)
    {
        float _1395 = _1369 * _1385;
        _1375 = _1395;
    }
    float _1397 = _1375;
    if (_1365)
    {
        float _1399 = _1397 * 0.15915493667125701904296875;
        _1147 = _1399;
    }
    float _1401 = _1147;
    float _1403 = _1343;
    if (_1365)
    {
        float _1405 = _1401 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        _1403 = _1407;
    }
    float _1409 = _1403;
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1413 = precise::max(0.0, _1411);
    float _1415 = _1221;
    float _1417 = _1413;
    if (_1365)
    {
        float _1419 = _1401 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        _1415 = _1421;
    }
    float _1423 = _1415;
    float _1425 = -_1351;
    float _1427 = -_1413;
    float _1429 = fma(_1329, _1425, _1427);
    if (_1365)
    {
        float _1431 = _1429 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1377 = _1431;
    }
    float _1433 = _1377;
    float _1435 = sqrt(_1347);
    float _1437 = _1409;
    float _1439 = _1433;
    if (_1365)
    {
        float _1441 = fma(_1409, _1433, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = _1443;
    if (!_1365)
    {
        _1439 = _1355;
    }
    float _1447 = _1439;
    float _1449 = _1447;
    if (_1365)
    {
        float _1451 = _1423 + (-1.0);
        _1417 = _1451;
    }
    float _1453 = _1417;
    float _1455 = _1453;
    if (_1365)
    {
        float _1457 = _1389 * _1443;
        _1379 = _1457;
    }
    float _1459 = _1379;
    if (!_1365)
    {
        _1445 = _1429;
    }
    float _1461 = _1445;
    float _1463 = _1461;
    if (_1365)
    {
        float _1465 = _1453 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1391 = _1465;
    }
    float _1467 = _1391;
    if (_1365)
    {
        float _1469 = _1353 * _1459;
        _1381 = _1469;
    }
    float _1471 = _1381;
    if (!_1365)
    {
        _1393 = _1357;
    }
    float _1473 = _1393;
    float _1475 = _1473;
    if (_1365)
    {
        float _1477 = _1355 * _1459;
        _1449 = _1477;
    }
    float _1479 = _1449;
    if (_1365)
    {
        float _1481 = fma(_1429, _1423, _1467);
        _1463 = _1481;
    }
    float _1483 = _1463;
    if (_1365)
    {
        float _1485 = _1471 * _1471;
        _1475 = _1485;
    }
    float _1487 = _1475;
    if (!_1365)
    {
        _1455 = _1359;
    }
    float _1489 = _1455;
    float _1491 = _1489;
    if (_1365)
    {
        float _1493 = _1479 * _1479;
        _1491 = _1493;
    }
    float _1495 = _1491;
    float _1497 = fma(_1483, _1483, _1487);
    float _1499 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1501 = _1497 + _1495;
    float _1503 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1507 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1505);
    float _1509 = precise::clamp(_1507, 0.0, 1.0);
    float _1511 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1499);
    float _1513 = rsqrt(_1501);
    float _1515 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1503);
    float _1517 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1519 = -_1509;
    float _1521 = _1519 + 1.0;
    float _1523 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1525 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1515);
    float _1527 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1517);
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1531 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1523);
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1535 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1527);
    float _1537 = abs(_1521);
    float _1539 = log2(_1537);
    float _1541 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1531);
    float _1543 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1545 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1547 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1511);
    float _1549 = _1513 * _1471;
    float _1551 = _1513 * _1483;
    float _1553 = _1541 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1555 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1557 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1559 = _1513 * _1479;
    float _1561 = -_1543;
    float _1563 = fma(_1561, _1529, 1.0);
    float _1565 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1555);
    float _1567 = -_1557;
    float _1569 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1567);
    float _1571 = _1547 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1573 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1575 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1577 = -_1559;
    float _1579 = fma(_1577, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1569);
    float _1581 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1565);
    float _1583 = log2(_1563);
    float _1585 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1587 = fma(_1579, -0.5, 0.5);
    float _1589 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1581);
    float _1591 = fma(_1579, 0.5, 0.5);
    float _1593 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1585);
    float _1595 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1573);
    float _1597 = _1551 + 1.0;
    float _1599 = exp2(_1575);
    float _1601 = fma(_1591, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1603 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1593);
    float _1605 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1595);
    float _1607 = fma(_1591, _1601, -0.212114393711090087890625);
    float _1609 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1603);
    float _1611 = 1.0 / _1589;
    float _1613 = fma(_1591, _1607, 1.570728778839111328125);
    float _1615 = _1583 * 0.693147182464599609375;
    float _1617 = _1615 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1619 = sqrt(_1587);
    float _1621 = -_1551;
    float _1623 = fma(_1599, _1597, _1621);
    float _1625 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1605);
    float _1627 = fma(_1623, 0.5, 0.5);
    float _1629 = _1609 * _1611;
    float _1631 = _1625 * _1611;
    float _1633 = fma(_1629, 0.5, 0.5);
    float _1635 = fma(_1631, -0.5, 0.5);
    float _1637 = _1619 * 0.636619746685028076171875;
    float _1639 = -_1613;
    float _1641 = fma(_1637, _1639, 1.0);
    float3 _4361 = float3(_1633, _1635, _1617);
    float _1643 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4361, float3(0.0), isnan(_4361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4361, float3(0.0), isnan(_4361)), level(0.0)).x;
    float3 _4372 = float3(_1633, _1635, _1617);
    float4 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4372, float3(0.0), isnan(_4372)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4372, float3(0.0), isnan(_4372)), level(0.0)).xyzw;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = _1645.w;
    float2 _4388 = float2(_1641, _1627);
    float3 _1657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4388, float2(0.0), isnan(_4388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4388, float2(0.0), isnan(_4388)), level(0.0)).xyz;
    float _1659 = _1657.x;
    float _1661 = _1657.y;
    float _1663 = _1657.z;
    float _1665 = _921 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_65.x = _931;
    out.m_65.y = _921;
    out.m_65.z = _961;
    float _1667 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1665);
    float _1669 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1667);
    float _1671 = _921 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1673 = _1669 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1675 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1671);
    float _1677 = 1.0 / _1673;
    float _1679 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1675);
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1683 = _1681 + _1673;
    float _1685 = _1683 * _1677;
    float _1687 = _1685 * 0.5;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1691 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1689);
    bool _1693 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1695 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan(0.5);
    bool _1701 = _1697 || _1699;
    float _1703 = _1545 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1705 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1707 = 1.0 / _1691;
    float _1709 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1703);
    float _1711 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1709);
    float _1713 = exp2(_1705);
    float _1715 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1711);
    float _1717 = _1709;
    float _1719 = _1533;
    if (_1701)
    {
        _1717 = 1.0;
    }
    float _1721 = _1717;
    float _1723 = _1721;
    if (_1701)
    {
        _1719 = 1.0;
    }
    float _1725 = _1719;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1729 = _1707 * _1727;
    float _1731 = _1725;
    if (!_1701)
    {
        float _1733 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1735 = _1733 * 0.15915493667125701904296875;
        float _1737 = _1735 * 6.283185482025146484375;
        float _1739 = cos(_1737);
        float _1741 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1743 = _1741 * 0.15915493667125701904296875;
        float _1745 = _1735 * 6.283185482025146484375;
        float _1747 = sin(_1745);
        float _1749 = 1.0 / _1739;
        float _1751 = _1743 * 6.283185482025146484375;
        float _1753 = cos(_1751);
        float _1755 = _1747 * _1749;
        float _1757 = _1743 * 6.283185482025146484375;
        float _1759 = sin(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = 1.0 / _1761;
        float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1767 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1765;
        float _1769 = 1.0 / _1767;
        float _1771 = _1759 * _1763;
        float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1775 = fma(_1729, _1771, _1773);
        float _1777 = _1775 * _1769;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1723 = _1779;
    }
    float _1781 = _1723;
    if (!_1701)
    {
        float _1783 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1785 = _1783 * 0.15915493667125701904296875;
        float _1787 = _1785 * 6.283185482025146484375;
        float _1789 = cos(_1787);
        float _1791 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1785 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = 1.0 / _1789;
        float _1801 = _1793 * 6.283185482025146484375;
        float _1803 = cos(_1801);
        float _1805 = _1797 * _1799;
        float _1807 = _1793 * 6.283185482025146484375;
        float _1809 = sin(_1807);
        float _1811 = _1803 * _1805;
        float _1813 = 1.0 / _1811;
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1817 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1815;
        float _1819 = 1.0 / _1817;
        float _1821 = _1809 * _1813;
        float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1825 = fma(_1729, _1821, _1823);
        float _1827 = _1825 * _1819;
        float _1829 = precise::clamp(_1827, 0.0, 1.0);
        float _1831 = -_1829;
        float _1833 = _1831 + 1.0;
        _1731 = _1833;
    }
    float _1835 = _1731;
    float _1837 = -_1713;
    float _1839 = _1837 + 1.0;
    bool _1841 = _1781 > 0.0;
    bool _1843 = isnan(_1781);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(0.0);
    bool _1849 = _1845 || _1847;
    float _1851 = _1781 * _1835;
    float _1853 = _1715 + _1589;
    float _1855 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1857 = _1835 <= 0.0;
    bool _1859 = !_1849;
    bool _1861 = _1857 || _1859;
    float _1863 = _1609 + _1589;
    float _1865 = _1589 * 0.5;
    float _1867 = _1855 * _1643;
    float _1869 = -_1855;
    float _1871 = _1869 + 1.0;
    float _1873 = _1851 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_67.x = _1325;
    out.m_67.y = _1319;
    out.m_67.z = _1333;
    float _1875 = _1653 * _1867;
    float _1877 = _1663 * _1867;
    float _1879 = _1853 * 0.5;
    float _1881 = fma(_1659, _1875, _1647);
    float _1883 = fma(_1661, _1875, _1649);
    float _1885 = _1653 * _1871;
    float _1887 = _1863 * 0.5;
    float _1889 = fma(_1625, -0.5, _1865);
    float _1891 = _1873 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1893 = fma(_1653, _1877, _1651);
    out.gl_Position.x = _1609;
    out.gl_Position.y = _1625;
    out.gl_Position.z = _1715;
    out.gl_Position.w = _1589;
    out.m_69.x = _1887;
    out.m_69.y = _1889;
    out.m_69.z = _1879;
    out.m_69.w = _1589;
    out.m_49.x = _1891;
    out.m_71.x = _1881;
    out.m_71.y = _1883;
    out.m_71.z = _1893;
    out.m_71.w = _1885;
    if (!_1861)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _1895 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1895;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

