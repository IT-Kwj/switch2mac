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
    float4 m_65 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_71 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _86(thread const int& _6296, thread const int& _6297, constant _10& support_buffer)
{
    float _6300 = as_type<float>(support_buffer._m4);
    int _6302 = _6297 + as_type<int>(_6300);
    int _6304 = 1 + _6302;
    float _6306 = support_buffer._m5[_6304].x;
    float _6308 = abs(_6306);
    bool _6310 = _6308 == 1.0;
    if (_6310)
    {
        return _6296;
    }
    float _6312 = float(_6296);
    float _6314 = _6312 / _6308;
    int _6316 = int(_6314);
    return _6316;
}

static inline __attribute__((always_inline))
int _87(thread const int& _6346, thread const int& _6347, constant _10& support_buffer)
{
    float _6350 = as_type<float>(support_buffer._m4);
    int _6352 = _6347 + as_type<int>(_6350);
    int _6354 = 1 + _6352;
    float _6356 = support_buffer._m5[_6354].x;
    bool _6358 = _6356 == 1.0;
    if (_6358)
    {
        return _6346;
    }
    float _6360 = float(_6346);
    float _6362 = _6360 * _6356;
    int _6364 = int(_6362);
    return _6364;
}

static inline __attribute__((always_inline))
void _84(thread int& _6293, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _6293 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1919 = false;
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
        float _2538 = as_type<float>(_111);
        out.gl_Position.z = _2538;
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
        float _2608 = as_type<float>(_149);
        out.gl_Position.z = _2608;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_53.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    int _303 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _305 = _303;
    int _307 = 0;
    int _309 = _86(_305, _307, (*spvDescriptorSet0.support_buffer));
    float _311 = in.m_55.x;
    float _313 = in.m_55.y;
    float _315 = in.m_55.z;
    float _317 = _129 + _315;
    float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _321 = float(_309);
    int _323 = abs(_309);
    bool _325 = _309 == 0;
    float _327 = _319 * _321;
    float _329 = float(uint(_323));
    float _331 = trunc(_327);
    int _333 = int(_331);
    float _335 = 1.0 / _329;
    int _337 = abs(_333);
    uint _340 = uint(int(uint(_333) >> uint(31)));
    float _342 = float(uint(_337));
    int _344 = ~int(_340);
    int _346 = _344 + 1;
    int _348 = as_type<int>(_335) + (-2);
    float _350 = as_type<float>(_348) * _342;
    float _352 = trunc(_350);
    float _354 = precise::max(_352, 0.0);
    uint _356 = uint(_354);
    int _358 = ~int(_356);
    int _360 = _358 + 1;
    int _362 = _360 * _323;
    int _364 = _362 + _337;
    float _366 = float(uint(_364));
    float _368 = as_type<float>(_348) * _366;
    float _370 = in.m_57.z;
    float _372 = trunc(_368);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = int(_356) + int(_376);
    int _380 = ~_378;
    int _382 = _380 + 1;
    float _384 = trunc(_370);
    int _386 = int(_384);
    int _388 = _382 * _323;
    int _390 = _388 + _337;
    bool _392 = uint(_390) >= uint(_323);
    bool _394 = !_392;
    int _396 = _394 ? 0 : (-1);
    int _398 = ~_378;
    int _400 = _398 + _396;
    int _402 = _400 + 1;
    int _404 = _402 * _323;
    int _406 = _404 + _337;
    int _408 = _406 ^ _346;
    int _410 = ~_346;
    int _412 = _410 + _408;
    int _414 = _412 + 1;
    bool _416 = !_325;
    int _418 = _416 ? _414 : (-1);
    int _420 = _418;
    int _422 = 0;
    int _424 = _87(_420, _422, (*spvDescriptorSet0.support_buffer));
    int _426 = _386;
    int _428 = 0;
    int _430 = _87(_426, _428, (*spvDescriptorSet0.support_buffer));
    float4 _433 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_424, _430)), 0).xyzw;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    float _441 = _433.w;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _445 = _301 + _443;
    float _447 = in.m_57.y;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _451 = _449 != 0;
    float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _465;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _471 = _469 != 0;
    float _473 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[79].z, _463);
    float _475 = 1.0 / _457;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _483;
    float _487 = 0.0;
    float _489 = _447;
    if (_451)
    {
        float _491 = in.m_55.x;
        _487 = _491;
    }
    float _493 = _487;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _497 = _313 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _499 = 1.0 / _467;
    float _501 = _311 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _503 = _313 > 0.5;
    bool _505 = _503 && _471;
    float _507 = in.m_57.x;
    float _509 = -_481;
    float _511 = fma(_501, 2.0, _509);
    float _513 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _473);
    float _515 = 1.0 / _461;
    float _517 = _453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _519 = _513 * (-0.15915493667125701904296875);
    float _521 = 1.0 / _479;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _523;
    bool _527 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _529 = isnan(_301);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _539;
    bool _543 = _493 > 0.5;
    bool _545 = _543 && _451;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _549 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[78].z, _495);
    float _551 = 1.0 / _485;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _555 = _301 + _553;
    float _557 = fma(_497, -2.0, _547);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _563 = _301 + _561;
    float _565 = _555 * _499;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _569 = _301 + _567;
    float _571 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].w, _559);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _575 = _301 + _573;
    float _577 = _563 * _475;
    float _579 = _569 * _515;
    float _581 = _575 * _521;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _591;
    float _595 = _445 * _551;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _601 = fma(_585, _577, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _603 = fma(_589, _577, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _605 = fma(_593, _577, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _627 = fma(_613, _565, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _629 = fma(_617, _565, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _631 = fma(_621, _565, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    bool _645 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _647 = isnan(_301);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_625, _579, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _659 = fma(_599, _579, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _661 = fma(_609, _579, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _663 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _665 = isnan(_301);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_635, _581, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _677 = fma(_639, _581, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _679 = fma(_643, _581, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _681 = -_655;
    float _683 = _681 + 1.0;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _689;
    bool _693 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _695 = isnan(_301);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = _673 * _683;
    float _707 = fma(_525, _595, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _709 = _537 * _687;
    float _711 = -_537;
    float _713 = _711 + 1.0;
    float _715 = fma(_541, _595, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _717 = fma(_691, _595, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    bool _719 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _721 = isnan(_301);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _703 * _713;
    bool _733 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _735 = isnan(_301);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -_703;
    float _747 = _745 + 1.0;
    float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _751 = _507;
    if (_505)
    {
        float _753 = -_447;
        float _755 = _753 + 1.0;
        _489 = _755;
    }
    float _757 = _489;
    float _759 = _743 * _747;
    float _761 = -_743;
    float _763 = _761 + 1.0;
    float _765 = fma(_517, _757, -0.5);
    float _767 = _757;
    if (_451)
    {
        _767 = _507;
    }
    float _769 = _767;
    float _771 = _729 * _763;
    float _773 = _519 * 6.283185482025146484375;
    float _775 = sin(_773);
    float _777 = -_729;
    float _779 = _777 + 1.0;
    float _781 = _769;
    if (_545)
    {
        float _783 = -_769;
        float _785 = _783 + 1.0;
        _781 = _785;
    }
    float _787 = _781;
    float _789 = _601 * _771;
    float _791 = _603 * _771;
    float _793 = _605 * _771;
    float _795 = -_129;
    float _797 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[76].x, _511);
    float _799 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].x, _789);
    float _801 = _519 * 6.283185482025146484375;
    float _803 = cos(_801);
    float _805 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].y, _791);
    float _807 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].z, _793);
    if (_451)
    {
        _751 = _787;
    }
    float _809 = _751;
    float _811 = _749 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _813 = _418 + 1;
    float _815 = fma(_661, _759, _807);
    float _817 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _571);
    float _819 = fma(_811, _809, -0.5);
    float _821 = fma(_657, _759, _799);
    float _823 = fma(_631, _731, _815);
    float _825 = _775 * _765;
    float _827 = fma(_659, _759, _805);
    float _829 = fma(_627, _731, _821);
    float _831 = fma(_679, _709, _823);
    float _833 = _803 * _765;
    float _835 = -_825;
    float _837 = fma(_803, _819, _835);
    float _839 = fma(_629, _731, _827);
    float _841 = fma(_675, _709, _829);
    float _843 = fma(_775, _819, _833);
    float _845 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _549);
    float _847 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _557);
    float _849 = fma(_677, _709, _839);
    float _851 = fma(_707, _705, _841);
    float _853 = fma(_845, _837, _797);
    int _855 = abs(_813);
    float _857 = -_847;
    float _859 = fma(_817, _843, _857);
    float _861 = fma(_715, _705, _849);
    float _863 = fma(_717, _705, _831);
    float _865 = float(uint(_855));
    float _867 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[112].x, _851);
    float _869 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[112].y, _861);
    float _871 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[112].z, _863);
    float _873 = as_type<float>(_348) * _865;
    float _875 = _867 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _879 = _869 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _883 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = trunc(_873);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    float _891 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _895 = uint(int(uint(_813) >> uint(31)));
    out.m_59.x = _883;
    out.m_59.y = _891;
    out.m_59.z = _893;
    out.m_59.w = _877;
    int _897 = ~int(_895);
    int _899 = _897 + 1;
    int _901 = ~int(_889);
    int _903 = _901 + 1;
    int _905 = _903 * _323;
    int _907 = _905 + _855;
    float _909 = float(uint(_907));
    float _911 = as_type<float>(_348) * _909;
    float _913 = _853 + 0.5;
    float _915 = trunc(_911);
    float _917 = precise::max(_915, 0.0);
    uint _919 = uint(_917);
    int _921 = int(_889) + int(_919);
    int _923 = ~_921;
    int _925 = _923 + 1;
    int _927 = _925 * _323;
    int _929 = _927 + _855;
    bool _931 = uint(_929) >= uint(_323);
    bool _933 = !_931;
    int _935 = _933 ? 0 : (-1);
    int _937 = ~_921;
    int _939 = _937 + _935;
    int _941 = _939 + 1;
    int _943 = _941 * _323;
    int _945 = _943 + _855;
    int _947 = _945 ^ _899;
    int _949 = ~_899;
    int _951 = _949 + _947;
    int _953 = _951 + 1;
    float _955 = _859 + 0.5;
    bool _957 = !_325;
    int _959 = _957 ? _953 : (-1);
    uint _961 = as_type<uint>(half2(float2(_441, 0.0)));
    uint _963 = extract_bits(_961, 0u, 8u);
    int _965 = int(_963) & 255;
    uint _967 = extract_bits(_961, 8u, 8u);
    int _969 = int(_967) & 255;
    int _971 = _969 << 8;
    int _973 = _965 | _971;
    bool _975 = _973 >= 32768;
    int _977 = _973 + (-1024);
    int _979 = _977;
    if (_975)
    {
        int _981 = ~_973;
        int _983 = _981 + 33792;
        int _985 = _983 + 1;
        _979 = _985;
    }
    int _987 = _979;
    int _989 = _987 + 30719;
    float _991 = float(_989);
    float _993 = fma(_991, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _995 = abs(_993);
    float _997 = -_995;
    float _999 = _997 + 1.0;
    int _1001 = as_type<int>(_999) + (-218103808);
    bool _1003 = uint(_1001) >= 1920991232u;
    bool _1005 = !_1003;
    if (!_1005)
    {
        int _1007;
        _84(_1007, out.gl_Position, out.gl_PointSize);
    }
    int _1009 = _959;
    int _1011 = 0;
    int _1013 = _87(_1009, _1011, (*spvDescriptorSet0.support_buffer));
    int _1015 = _386;
    int _1017 = 0;
    int _1019 = _87(_1015, _1017, (*spvDescriptorSet0.support_buffer));
    float4 _1021 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1013, _1019)), 0).xyzw;
    float _1023 = _1021.x;
    float _1025 = _1021.y;
    float _1027 = _1021.z;
    float _1029 = _1021.w;
    float _1031 = floor(_327);
    float _1033 = -_1031;
    float _1035 = _327 + _1033;
    uint _1037 = as_type<uint>(half2(float2(_1029, 0.0)));
    float _1039 = -_435;
    float _1041 = _1039 + _1023;
    float _1043 = -_439;
    float _1045 = _1043 + _1027;
    uint _1047 = extract_bits(_1037, 0u, 8u);
    int _1049 = int(_1047) & 255;
    uint _1051 = extract_bits(_1037, 8u, 8u);
    int _1053 = int(_1051) & 255;
    int _1055 = _1053 << 8;
    int _1057 = _1049 | _1055;
    float _1059 = fma(_1035, _1045, _439);
    bool _1061 = _1057 >= 32768;
    int _1063 = _1057 + (-1024);
    int _1065 = _1063;
    if (_1061)
    {
        int _1067 = ~_1057;
        int _1069 = _1067 + 33792;
        int _1071 = _1069 + 1;
        _1065 = _1071;
    }
    int _1073 = _1065;
    int _1075 = _1073 + 30719;
    float _1077 = float(_1075);
    float _1079 = fma(_1077, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1081 = abs(_1079);
    float _1083 = -_1081;
    float _1085 = _1083 + 1.0;
    int _1087 = as_type<int>(_1085) + (-218103808);
    bool _1089 = uint(_1087) >= 1920991232u;
    float _1091 = -_437;
    float _1093 = _1091 + _1025;
    float _1095 = fma(_1035, _1041, _435);
    float _1097 = fma(_1035, _1093, _437);
    bool _1099 = !_1089;
    if (!_1099)
    {
        int _1101;
        _84(_1101, out.gl_Position, out.gl_PointSize);
    }
    float _1103 = in.m_55.x;
    float _1105 = in.m_55.y;
    float _1107 = in.m_55.z;
    float _1109 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1111 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1113 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1115 = in.m_61.w;
    float _1117 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1109);
    float _1119 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1111);
    float _1121 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1113);
    out.m_63.x = _913;
    out.m_63.y = _955;
    float _1123 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1117);
    float _1125 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1119);
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1133 = _1131 != 0;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1137 = _1135 != 0;
    float _1139 = _1103 * 2.0;
    float _1141 = _1105 + _1107;
    float _1143 = _1107 + _1103;
    float _1145 = _1107 + (-0.5);
    float _1147 = _1107 * 2.0;
    out.m_65.w = _1115;
    float _1149 = floor(_1139);
    float _1151 = _1105 + _1103;
    float _1153 = _1103 + (-0.5);
    float _1155 = _1105 * 2.0;
    float _1157 = _1151 + (-1.0);
    float _1159 = _1105 + (-0.5);
    float _1161 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1121);
    float _1163 = floor(_1147);
    float _1165 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1167 = _1141 + (-1.0);
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1165);
    float _1171 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1173 = log2(_1171);
    float _1175 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1177 = _1149 > 0.0;
    float _1179 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1181 = _1149 >= 0.0;
    bool _1183 = isnan(_1149);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan(0.0);
    bool _1189 = _1185 || _1187;
    float _1191 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1175);
    float _1193 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1179);
    float _1195 = floor(_1155);
    int _1197 = _1189 ? 0 : 1;
    float _1199 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1191);
    float _1201 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1203 = _1163 > 0.0;
    float _1205 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1169);
    float _1207 = _1173 * _129;
    float _1209 = _1125 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1211 = ~_1197;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    float _1217 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1219 = _1163 >= 0.0;
    bool _1221 = isnan(_1163);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan(0.0);
    bool _1227 = _1223 || _1225;
    float _1229 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1231 = _1215;
    float _1233 = _1209;
    if (!_1177)
    {
        int _1235 = ~_1197;
        int _1237 = _1235 + 1;
        _1231 = _1237;
    }
    int _1239 = _1231;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1243 = _1209 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1247 = _1217 + _1245;
    int _1249 = _1227 ? 0 : 1;
    float _1251 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1253 = _1195 > 0.0;
    float _1255 = _1161 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1257 = _1195 >= 0.0;
    bool _1259 = isnan(_1195);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan(0.0);
    bool _1265 = _1261 || _1263;
    float _1267 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1193);
    bool _1269 = !_1129;
    int _1271 = _1269 ? 0 : 1;
    float _1273 = exp2(_1207);
    int _1275 = ~_1249;
    int _1277 = _1275 + 1;
    int _1279 = _1277 + 1;
    float _1281 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1251);
    int _1283 = _1279;
    float _1285 = _1247;
    if (!_1203)
    {
        int _1287 = ~_1249;
        int _1289 = _1287 + 1;
        _1283 = _1289;
    }
    int _1291 = _1283;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1295 = _1255 + _1293;
    int _1297 = abs(_1271);
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    bool _1303 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1305 = isnan(1.0);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1311 = _1307 || _1309;
    float _1313 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1281);
    float _1315 = float(_1297);
    float _1317 = in.m_67.x;
    float _1319 = in.m_67.y;
    float _1321 = in.m_67.z;
    float _1323 = float(_1291);
    float _1325 = 1.0 / _1301;
    bool _1327 = !_1133;
    int _1329 = _1327 ? 0 : 1;
    bool _1331 = _1313 >= 0.0;
    float _1333 = _1315 * _1323;
    int _1335 = abs(_1329);
    float _1337 = _1243 * _1243;
    float _1339 = -_1273;
    float _1341 = _1339 + 1.0;
    float _1343 = float(_1239);
    float _1345 = rsqrt(_1267);
    float _1347 = float(_1335);
    float _1349 = fma(_1247, _1247, _1337);
    bool _1351 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1359 = _1355 || _1357;
    int _1361 = _1265 ? 0 : 1;
    float _1363 = _1347 * _1343;
    float _1365 = _1359 ? _1341 : 0.0;
    float _1367 = fma(_1295, _1295, _1349);
    float _1369 = rsqrt(_1199);
    float _1371 = _1363 * (-2.0);
    float _1373 = _1333;
    if (_1331)
    {
        out.m_49.x = 0.0;
    }
    if (_1311)
    {
        float _1375 = _1365 * _1325;
        _131 = _1375;
    }
    float _1377 = _131;
    float _1379 = _1333 * (-2.0);
    if (_1331)
    {
        _1373 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1381 = _1373;
    float _1383 = fma(_1371, _1319, _1319);
    int _1385 = ~_1361;
    int _1387 = _1385 + 1;
    int _1389 = _1387 + 1;
    float _1391 = rsqrt(_1367);
    float _1393 = fma(_1201, _1379, _1201);
    float _1395 = fma(_1379, _1317, _1317);
    int _1397 = as_type<int>(_1381);
    int _1399 = _1389;
    if (_1331)
    {
        float _1401 = _1381 * 5.0;
        _1397 = as_type<int>(_1401);
    }
    int _1403 = _1397;
    bool _1405 = !_1137;
    int _1407 = _1405 ? 0 : 1;
    float _1409 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1395);
    if (!_1253)
    {
        int _1411 = ~_1361;
        int _1413 = _1411 + 1;
        _1399 = _1413;
    }
    int _1415 = _1399;
    float _1417 = fma(_1229, _1371, _1229);
    if (_1331)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4537 = as_type<float>(_1403);
        out.gl_Position.z = _4537;
    }
    float _1419 = rsqrt(_1205);
    float _1421 = fma(_1393, _1377, _1409);
    int _1423 = abs(_1407);
    float _1425 = _1243 * _1391;
    float _1427 = _1247 * _1391;
    if (_1331)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1429 = -_1425;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    float _1433 = -_1427;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1217);
    float _1437 = _1295 * _1391;
    float _1439 = _1421 * 0.15915493667125701904296875;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1443 = _1431 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1447 = _1435 + _1445;
    float _1449 = float(_1423);
    float _1451 = sqrt(_1205);
    float _1453 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1455 = -_1437;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1255);
    float _1459 = float(_1415);
    float _1461 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1453);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1465 = _1457 + _1463;
    float _1467 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1383);
    float _1469 = _1449 * _1459;
    float _1471 = _1143 + (-1.0);
    float _1473 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1461);
    float _1475 = fma(_1417, _1377, _1467);
    float _1477 = _1469 * (-2.0);
    float _1479 = _1439 * 6.283185482025146484375;
    float _1481 = sin(_1479);
    bool _1483 = _1473 >= 0.0;
    float _1485 = _1475 * 0.15915493667125701904296875;
    float _1487 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1489 = fma(_1477, _1321, _1321);
    float _1491 = -_1425;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1495 = -_1427;
    float _1497 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1499 = fma(_1487, _1477, _1487);
    float _1501 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1489);
    float _1503 = _1493 * _1493;
    float _1505 = _1439 * 6.283185482025146484375;
    float _1507 = cos(_1505);
    float _1509 = fma(_1499, _1377, _1501);
    float _1511 = fma(_1497, _1497, _1503);
    int _1513 = as_type<int>(_1493);
    if (_1483)
    {
        _1285 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1515 = _1285;
    float _1517 = -_1437;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1295);
    if (_1483)
    {
        out.m_49.x = 0.0;
    }
    float _1521 = _1485 * 6.283185482025146484375;
    float _1523 = sin(_1521);
    if (_1483)
    {
        float _1525 = _1515 * 5.0;
        _1513 = as_type<int>(_1525);
    }
    int _1527 = _1513;
    float _1529 = _1509 * 0.15915493667125701904296875;
    if (_1483)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4733 = as_type<float>(_1527);
        out.gl_Position.z = _4733;
    }
    float _1531 = _1485 * 6.283185482025146484375;
    float _1533 = cos(_1531);
    float _1535 = _1529 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    if (_1483)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1539 = -_1209;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1543 = fma(_1519, _1519, _1511);
    float _1545 = -_1217;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1549 = -_1255;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1541 * _1541;
    float _1555 = _1097 * _1345;
    float _1557 = _1095 * _1419;
    float _1559 = sqrt(_1543);
    float _1561 = fma(_1547, _1547, _1553);
    float _1563 = _1451 * _1555;
    float _1565 = in.m_53.x;
    float _1567 = in.m_53.y;
    float _1569 = in.m_53.z;
    float _1571 = _1451 * _1557;
    float _1573 = fma(_1551, _1551, _1561);
    float _1575 = _1059 * _1369;
    float _1577 = _1481 * _1523;
    float _1579 = _1507 * _1533;
    float _1581 = rsqrt(_1573);
    float _1583 = _1451 * _1575;
    float _1585 = _1481 * _1533;
    float _1587 = fma(_1537, _1579, _1577);
    float _1589 = fma(_1537, _1577, _1579);
    float _1591 = _1391 * _1559;
    float _1593 = _1529 * 6.283185482025146484375;
    float _1595 = cos(_1593);
    float _1597 = _1507 * _1523;
    float _1599 = _1547 * _1581;
    float _1601 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1603 = _1551 * _1581;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1607 = _1599 * _1605;
    float _1609 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1611 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1613 = _1541 * _1581;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1617 = _1603 * _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1621 = -_1607;
    float _1623 = fma(_1603, _1619, _1621);
    float _1625 = _1609 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1629 = _1613 * _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1633 = -_1617;
    float _1635 = fma(_1613, _1631, _1633);
    float _1637 = _1623 * _1623;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1641 = -_1629;
    float _1643 = fma(_1599, _1639, _1641);
    float _1645 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1647 = fma(_1635, _1635, _1637);
    float _1649 = -_1597;
    float _1651 = fma(_1537, _1585, _1649);
    float _1653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1571);
    float _1655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1563);
    float _1657 = fma(_1643, _1643, _1647);
    float _1659 = _1591 * _1625;
    float _1661 = -_1585;
    float _1663 = fma(_1537, _1597, _1661);
    float _1665 = _1591 * _1645;
    float _1667 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1669 = _1655 * _1659;
    float _1671 = rsqrt(_1657);
    float _1673 = _1653 * _1665;
    float _1675 = _1591 * _1667;
    float _1677 = -_1669;
    float _1679 = _1537 * _1677;
    float _1681 = _1595 * _1669;
    float _1683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1583);
    float _1685 = _1533 * _1595;
    float _1687 = _1523 * _1595;
    float _1689 = _1507 * _1681;
    float _1691 = _1683 * _1675;
    float _1693 = _1481 * _1681;
    float _1695 = fma(_1685, _1673, _1679);
    float _1697 = fma(_1587, _1673, _1689);
    float _1699 = fma(_1651, _1673, _1693);
    float _1701 = fma(_1687, _1691, _1695);
    float _1703 = _1623 * _1671;
    float _1705 = _1635 * _1671;
    float _1707 = _1643 * _1671;
    float _1709 = fma(_1663, _1691, _1697);
    float _1711 = _1603 * _1703;
    float _1713 = _1613 * _1705;
    float _1715 = fma(_1589, _1691, _1699);
    float _1717 = -_1711;
    float _1719 = fma(_1613, _1707, _1717);
    float _1721 = -_1713;
    float _1723 = fma(_1599, _1703, _1721);
    float _1725 = _1719 * _1709;
    float _1727 = _1723 * _1709;
    float _1729 = fma(_1705, _1701, _1725);
    float _1731 = fma(_1707, _1701, _1727);
    float _1733 = fma(_1599, _1715, _1729);
    float _1735 = fma(_1603, _1715, _1731);
    float _1737 = _1599 * _1707;
    float _1739 = _1217 + _1733;
    float _1741 = _1255 + _1735;
    float _1743 = -_1737;
    float _1745 = fma(_1603, _1705, _1743);
    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1749 = _1739 + _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1753 = _1741 + _1751;
    float _1755 = _1745 * _1709;
    float _1757 = _1749 * _1749;
    float _1759 = _1753 * _1753;
    float _1761 = fma(_1703, _1701, _1755);
    float _1763 = _1757 + _1759;
    float _1765 = fma(_1613, _1715, _1761);
    float _1767 = sqrt(_1763);
    float _1769 = _1209 + _1765;
    bool _1771 = _1767 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1773 = _1603;
    float _1775 = _1715;
    float _1777 = _1765;
    float _1779 = _1745;
    float _1781 = _1761;
    if (!_1771)
    {
        _1233 = _1759;
    }
    float _1783 = _1233;
    float _1785 = _1783;
    if (!_1771)
    {
        _1773 = _1757;
    }
    float _1787 = _1773;
    float _1789 = _1787;
    if (!_1771)
    {
        _1775 = _1739;
    }
    float _1791 = _1775;
    float _1793 = _1791;
    if (!_1771)
    {
        _1777 = _1741;
    }
    float _1795 = _1777;
    float _1797 = _1795;
    if (!_1771)
    {
        _1779 = _1769;
    }
    float _1799 = _1779;
    bool _1801 = !_1771;
    float _1803 = _1799;
    if (!_1801)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1809 = _1767 + _1807;
        float _1811 = rsqrt(_1763);
        float _1813 = _1809 * _1805;
        float _1815 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1817 = _1813 * 0.15915493667125701904296875;
        float _1819 = _1817 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = _1817 * 6.283185482025146484375;
        float _1825 = cos(_1823);
        float _1827 = fma(_1821, _1815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1829 = _1811 * _1827;
        float _1831 = _1825 + (-1.0);
        float _1833 = _1753 * _1829;
        float _1835 = _1831 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1837 = _1749 * _1829;
        float _1839 = _1833 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1841 = fma(_1769, _1825, _1835);
        float _1843 = _1837 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1845 = _1837 * _1837;
        float _1847 = _1833 * _1833;
        _1803 = _1841;
        _1789 = _1845;
        _1785 = _1847;
        _1793 = _1843;
        _1797 = _1839;
    }
    float _1849 = _1803;
    float _1851 = _1789;
    float _1853 = _1785;
    float _1855 = _1793;
    float _1857 = _1797;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1861 = _1849 + _1859;
    float _1863 = fma(_1861, _1861, _1851);
    float _1865 = _1863 + _1853;
    float _1867 = sqrt(_1865);
    bool _1869 = _1867 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1871 = isnan(_1867);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1877 = _1873 || _1875;
    float _1879 = _1851;
    float _1881 = _1863;
    float _1883 = _1867;
    if (!_1877)
    {
        _1879 = 1.0;
    }
    float _1885 = _1879;
    bool _1887 = !_1877;
    float _1889 = _1885;
    if (!_1887)
    {
        bool _1891 = _1867 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1893 = isnan(_1867);
        bool _1895 = _1891 || _1893;
        bool _1897 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1899 = _1895 || _1897;
        if (!_1899)
        {
            float _1901 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1903 = _1867 + _1901;
            float _1905 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1907 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1905;
            float _1909 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1913 = 1.0 / _1907;
            float _1915 = _1903 * _1913;
            float _1917 = fma(_1915, _1911, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1889 = _1917;
            _1881 = _1911;
            _1919 = true;
        }
        else
        {
            bool _1921 = _1867 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1923 = isnan(_1867);
            bool _1925 = _1921 || _1923;
            bool _1927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1929 = _1925 || _1927;
            if (!_1929)
            {
                float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1933 = _1867 + _1931;
                float _1935 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1937 = _1935 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1939 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1941 = _1939 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1943 = 1.0 / _1937;
                float _1945 = _1933 * _1943;
                float _1947 = fma(_1945, _1941, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1889 = _1947;
                _1881 = _1941;
                _1919 = true;
            }
            else
            {
                _1889 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1919 = false;
    float _1949 = _1889;
    float _1951 = _1881;
    float _1953 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1955 = _1849 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1959 = _1855 + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1963 = _1857 + _1961;
    float _1965 = fma(_1955, _1949, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1967 = fma(_1959, _1949, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1969 = fma(_1963, _1949, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1971 = -_1425;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1965);
    float _1975 = -_1427;
    float _1977 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1967);
    float _1979 = -_1437;
    float _1981 = fma(_1979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1969);
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1985 = _1973 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1989 = _1977 + _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1993 = _1981 + _1991;
    float _1995 = _1985 * _1985;
    float _1997 = fma(_1989, _1989, _1995);
    float _1999 = fma(_1993, _1993, _1997);
    float _2001 = rsqrt(_1999);
    float _2003 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2005 = _1989 * _2003;
    float _2007 = _1993 * _2003;
    float _2009 = _2005 * _2005;
    float _2011 = _2007 * _2007;
    float _2013 = _2009 + _2011;
    float _2015 = sqrt(_2013);
    bool _2017 = _2015 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = _2015 + _2019;
    float _2023 = _1993;
    float _2025 = _2013;
    float _2027 = _2021;
    float _2029 = _1951;
    float _2031 = _1985;
    if (_2017)
    {
        float _2033 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2023 = _2033;
    }
    float _2035 = _2023;
    if (_2017)
    {
        float _2037 = rsqrt(_2013);
        _2025 = _2037;
    }
    float _2039 = _2025;
    float _2041 = _2039;
    if (_2017)
    {
        float _2043 = _2021 * _2035;
        _2027 = _2043;
    }
    float _2045 = _2027;
    if (_2017)
    {
        float _2047 = _2045 * 0.15915493667125701904296875;
        _2029 = _2047;
    }
    float _2049 = _2029;
    float _2051 = _2035;
    if (_2017)
    {
        float _2053 = _2049 * 6.283185482025146484375;
        float _2055 = sin(_2053);
        _2051 = _2055;
    }
    float _2057 = _2051;
    float _2059 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2061 = precise::max(0.0, _2059);
    float _2063 = _2001;
    float _2065 = _2061;
    if (_2017)
    {
        float _2067 = _2049 * 6.283185482025146484375;
        float _2069 = cos(_2067);
        _2063 = _2069;
    }
    float _2071 = _2063;
    float _2073 = -_2003;
    float _2075 = -_2061;
    float _2077 = fma(_1985, _2073, _2075);
    if (!_2017)
    {
        _2031 = _2005;
    }
    float _2079 = _2031;
    float _2081 = _2079;
    if (_2017)
    {
        float _2083 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2065 = _2083;
    }
    float _2085 = _2065;
    float _2087 = sqrt(_1999);
    float _2089 = _2057;
    float _2091 = _2085;
    if (_2017)
    {
        float _2093 = fma(_2057, _2085, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2089 = _2093;
    }
    float _2095 = _2089;
    float _2097 = _2095;
    float _2099 = _2071;
    if (_2017)
    {
        float _2101 = _2071 + (-1.0);
        _2091 = _2101;
    }
    float _2103 = _2091;
    float _2105 = _2103;
    if (_2017)
    {
        float _2107 = _2039 * _2095;
        _1781 = _2107;
    }
    float _2109 = _1781;
    if (!_2017)
    {
        _2097 = _2077;
    }
    float _2111 = _2097;
    float _2113 = _2111;
    if (_2017)
    {
        float _2115 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1883 = _2115;
    }
    float _2117 = _1883;
    if (_2017)
    {
        float _2119 = _2005 * _2109;
        _2081 = _2119;
    }
    float _2121 = _2081;
    if (!_2017)
    {
        _2105 = _2007;
    }
    float _2123 = _2105;
    float _2125 = _2123;
    if (_2017)
    {
        float _2127 = _2007 * _2109;
        _2125 = _2127;
    }
    float _2129 = _2125;
    if (!_2017)
    {
        _2041 = _2009;
    }
    float _2131 = _2041;
    float _2133 = _2131;
    if (_2017)
    {
        float _2135 = fma(_2077, _2071, _2117);
        _2113 = _2135;
    }
    float _2137 = _2113;
    if (_2017)
    {
        float _2139 = _2121 * _2121;
        _2133 = _2139;
    }
    float _2141 = _2133;
    if (!_2017)
    {
        _2099 = _2011;
    }
    float _2143 = _2099;
    float _2145 = _2143;
    if (_2017)
    {
        float _2147 = _2129 * _2129;
        _2145 = _2147;
    }
    float _2149 = _2145;
    float _2151 = fma(_2137, _2137, _2141);
    float _2153 = _2151 + _2149;
    float _2155 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2159 = fma(_2087, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2157);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2165 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2155);
    float _2167 = rsqrt(_2153);
    float _2169 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2171 = -_2161;
    float _2173 = _2171 + 1.0;
    float _2175 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2165);
    float _2177 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2179 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2169);
    float _2181 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2183 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2185 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2177);
    float _2187 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2179);
    float _2189 = abs(_2173);
    float _2191 = log2(_2189);
    float _2193 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2195 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2185);
    float _2197 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2199 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2181);
    float _2201 = -_2193;
    float _2203 = fma(_2201, _2163, 1.0);
    float _2205 = _2167 * _2121;
    float _2207 = _2167 * _2137;
    float _2209 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2211 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2213 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2215 = _2167 * _2129;
    float _2217 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2199);
    float _2219 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2211);
    float _2221 = -_2213;
    float _2223 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2221);
    float _2225 = log2(_2203);
    float _2227 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2229 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2219);
    float _2231 = -_2215;
    float _2233 = fma(_2231, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2223);
    float _2235 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2237 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2239 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2229);
    float _2241 = fma(_2233, -0.5, 0.5);
    float _2243 = exp2(_2235);
    float _2245 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2247 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2237);
    float _2249 = fma(_2233, 0.5, 0.5);
    float _2251 = _2207 + 1.0;
    float _2253 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2245);
    float _2255 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2247);
    float _2257 = fma(_2249, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2259 = 1.0 / _2239;
    float _2261 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2253);
    float _2263 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2265 = fma(_2249, _2257, -0.212114393711090087890625);
    float _2267 = _2225 * 0.693147182464599609375;
    float _2269 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2261);
    float _2271 = fma(_2249, _2265, 1.570728778839111328125);
    float _2273 = sqrt(_2241);
    float _2275 = -_2207;
    float _2277 = fma(_2243, _2251, _2275);
    float _2279 = fma(_2277, 0.5, 0.5);
    float _2281 = _2263 * _2259;
    float _2283 = _2269 * _2259;
    float _2285 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2287 = fma(_2281, 0.5, 0.5);
    float _2289 = fma(_2283, -0.5, 0.5);
    float _2291 = _2273 * 0.636619746685028076171875;
    float _2293 = -_2271;
    float _2295 = fma(_2291, _2293, 1.0);
    float3 _5971 = float3(_2287, _2289, _2285);
    float _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5971, float3(0.0), isnan(_5971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5971, float3(0.0), isnan(_5971)), level(0.0)).x;
    float3 _5982 = float3(_2287, _2289, _2285);
    float4 _2299 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5982, float3(0.0), isnan(_5982)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5982, float3(0.0), isnan(_5982)), level(0.0)).xyzw;
    float _2301 = _2299.x;
    float _2303 = _2299.y;
    float _2305 = _2299.z;
    float _2307 = _2299.w;
    float2 _5998 = float2(_2295, _2279);
    float3 _2311 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _2313 = _2311.x;
    float _2315 = _2311.y;
    float _2317 = _2311.z;
    float _2319 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2321 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2319);
    float _2323 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2325 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2327 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2321);
    float _2329 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2323);
    float _2331 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2333 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2329);
    float _2335 = 1.0 / _2331;
    bool _2337 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.5);
    bool _2345 = _2341 || _2343;
    float _2347 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2349 = _2333 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2351 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2347);
    float _2353 = _2349 + _2331;
    float _2355 = exp2(_2325);
    float _2357 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2351);
    float _2359 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2357);
    float _2361 = _2191;
    if (_2345)
    {
        _2361 = 1.0;
    }
    float _2363 = _2361;
    float _2365 = _2353 * _2335;
    float _2367 = _2365 * 0.5;
    float _2369 = _2363;
    if (!_2345)
    {
        float _2371 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2375 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2373);
        float _2377 = _2371 * 0.15915493667125701904296875;
        float _2379 = _2377 * 6.283185482025146484375;
        float _2381 = cos(_2379);
        float _2383 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2385 = _2383 * 0.15915493667125701904296875;
        float _2387 = _2377 * 6.283185482025146484375;
        float _2389 = sin(_2387);
        float _2391 = 1.0 / _2381;
        float _2393 = _2385 * 6.283185482025146484375;
        float _2395 = cos(_2393);
        float _2397 = _2389 * _2391;
        float _2399 = 1.0 / _2375;
        float _2401 = _2395 * _2397;
        float _2403 = _2385 * 6.283185482025146484375;
        float _2405 = sin(_2403);
        float _2407 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2409 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2407;
        float _2411 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2413 = _2399 * _2411;
        float _2415 = 1.0 / _2401;
        float _2417 = 1.0 / _2409;
        float _2419 = _2405 * _2415;
        float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2423 = fma(_2419, _2413, _2421);
        float _2425 = _2423 * _2417;
        float _2427 = precise::clamp(_2425, 0.0, 1.0);
        _2369 = _2427;
    }
    float _2429 = _2369;
    float _2431 = -_2355;
    float _2433 = _2431 + 1.0;
    float _2435 = _2239 * 0.5;
    float _2437 = _2429 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2439 = _2429 > 0.0;
    bool _2441 = isnan(_2429);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan(0.0);
    bool _2447 = _2443 || _2445;
    float _2449 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2451 = fma(_2269, -0.5, _2435);
    float _2453 = _2437 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2455 = _2359 + _2239;
    float _2457 = _2449 * _2297;
    float _2459 = -_2449;
    float _2461 = _2459 + 1.0;
    float _2463 = _2263 + _2239;
    out.gl_Position.x = _2263;
    out.gl_Position.y = _2269;
    out.gl_Position.z = _2359;
    out.gl_Position.w = _2239;
    float _2465 = _2307 * _2457;
    float _2467 = _2317 * _2457;
    float _2469 = _2307 * _2461;
    float _2471 = _2455 * 0.5;
    float _2473 = _2463 * 0.5;
    float _2475 = fma(_2313, _2465, _2301);
    float _2477 = fma(_2315, _2465, _2303);
    float _2479 = fma(_2307, _2467, _2305);
    out.m_49.x = _2453;
    out.m_69.x = _2473;
    out.m_69.y = _2451;
    out.m_69.z = _2471;
    out.m_69.w = _2239;
    out.m_71.x = _2475;
    out.m_71.y = _2477;
    out.m_71.z = _2479;
    out.m_71.w = _2469;
    if (_2447)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2481;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1919 = false;
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
        float _2538 = as_type<float>(_111);
        out.gl_Position.z = _2538;
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
        float _2608 = as_type<float>(_149);
        out.gl_Position.z = _2608;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_53.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    int _303 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _305 = _303;
    int _307 = 0;
    int _309 = _86(_305, _307, (*spvDescriptorSet0.support_buffer));
    float _311 = in.m_55.x;
    float _313 = in.m_55.y;
    float _315 = in.m_55.z;
    float _317 = _129 + _315;
    float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _321 = float(_309);
    int _323 = abs(_309);
    bool _325 = _309 == 0;
    float _327 = _319 * _321;
    float _329 = float(uint(_323));
    float _331 = trunc(_327);
    int _333 = int(_331);
    float _335 = 1.0 / _329;
    int _337 = abs(_333);
    uint _340 = uint(int(uint(_333) >> uint(31)));
    float _342 = float(uint(_337));
    int _344 = ~int(_340);
    int _346 = _344 + 1;
    int _348 = as_type<int>(_335) + (-2);
    float _350 = as_type<float>(_348) * _342;
    float _352 = trunc(_350);
    float _354 = precise::max(_352, 0.0);
    uint _356 = uint(_354);
    int _358 = ~int(_356);
    int _360 = _358 + 1;
    int _362 = _360 * _323;
    int _364 = _362 + _337;
    float _366 = float(uint(_364));
    float _368 = as_type<float>(_348) * _366;
    float _370 = in.m_57.z;
    float _372 = trunc(_368);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = int(_356) + int(_376);
    int _380 = ~_378;
    int _382 = _380 + 1;
    float _384 = trunc(_370);
    int _386 = int(_384);
    int _388 = _382 * _323;
    int _390 = _388 + _337;
    bool _392 = uint(_390) >= uint(_323);
    bool _394 = !_392;
    int _396 = _394 ? 0 : (-1);
    int _398 = ~_378;
    int _400 = _398 + _396;
    int _402 = _400 + 1;
    int _404 = _402 * _323;
    int _406 = _404 + _337;
    int _408 = _406 ^ _346;
    int _410 = ~_346;
    int _412 = _410 + _408;
    int _414 = _412 + 1;
    bool _416 = !_325;
    int _418 = _416 ? _414 : (-1);
    int _420 = _418;
    int _422 = 0;
    int _424 = _87(_420, _422, (*spvDescriptorSet0.support_buffer));
    int _426 = _386;
    int _428 = 0;
    int _430 = _87(_426, _428, (*spvDescriptorSet0.support_buffer));
    float4 _433 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_424, _430)), 0).xyzw;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    float _441 = _433.w;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _445 = _301 + _443;
    float _447 = in.m_57.y;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _451 = _449 != 0;
    float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _465;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _471 = _469 != 0;
    float _473 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[79].z, _463);
    float _475 = 1.0 / _457;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _483;
    float _487 = 0.0;
    float _489 = _447;
    if (_451)
    {
        float _491 = in.m_55.x;
        _487 = _491;
    }
    float _493 = _487;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _497 = _313 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _499 = 1.0 / _467;
    float _501 = _311 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _503 = _313 > 0.5;
    bool _505 = _503 && _471;
    float _507 = in.m_57.x;
    float _509 = -_481;
    float _511 = fma(_501, 2.0, _509);
    float _513 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _473);
    float _515 = 1.0 / _461;
    float _517 = _453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _519 = _513 * (-0.15915493667125701904296875);
    float _521 = 1.0 / _479;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _523;
    bool _527 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _529 = isnan(_301);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _539;
    bool _543 = _493 > 0.5;
    bool _545 = _543 && _451;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _549 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[78].z, _495);
    float _551 = 1.0 / _485;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _555 = _301 + _553;
    float _557 = fma(_497, -2.0, _547);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _563 = _301 + _561;
    float _565 = _555 * _499;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _569 = _301 + _567;
    float _571 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].w, _559);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _575 = _301 + _573;
    float _577 = _563 * _475;
    float _579 = _569 * _515;
    float _581 = _575 * _521;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _591;
    float _595 = _445 * _551;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _601 = fma(_585, _577, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _603 = fma(_589, _577, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _605 = fma(_593, _577, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _627 = fma(_613, _565, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _629 = fma(_617, _565, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _631 = fma(_621, _565, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    bool _645 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _647 = isnan(_301);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_625, _579, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _659 = fma(_599, _579, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _661 = fma(_609, _579, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _663 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _665 = isnan(_301);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_635, _581, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _677 = fma(_639, _581, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _679 = fma(_643, _581, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _681 = -_655;
    float _683 = _681 + 1.0;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _689;
    bool _693 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _695 = isnan(_301);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = _673 * _683;
    float _707 = fma(_525, _595, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _709 = _537 * _687;
    float _711 = -_537;
    float _713 = _711 + 1.0;
    float _715 = fma(_541, _595, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _717 = fma(_691, _595, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    bool _719 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _721 = isnan(_301);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _703 * _713;
    bool _733 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _735 = isnan(_301);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -_703;
    float _747 = _745 + 1.0;
    float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _751 = _507;
    if (_505)
    {
        float _753 = -_447;
        float _755 = _753 + 1.0;
        _489 = _755;
    }
    float _757 = _489;
    float _759 = _743 * _747;
    float _761 = -_743;
    float _763 = _761 + 1.0;
    float _765 = fma(_517, _757, -0.5);
    float _767 = _757;
    if (_451)
    {
        _767 = _507;
    }
    float _769 = _767;
    float _771 = _729 * _763;
    float _773 = _519 * 6.283185482025146484375;
    float _775 = sin(_773);
    float _777 = -_729;
    float _779 = _777 + 1.0;
    float _781 = _769;
    if (_545)
    {
        float _783 = -_769;
        float _785 = _783 + 1.0;
        _781 = _785;
    }
    float _787 = _781;
    float _789 = _601 * _771;
    float _791 = _603 * _771;
    float _793 = _605 * _771;
    float _795 = -_129;
    float _797 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[76].x, _511);
    float _799 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].x, _789);
    float _801 = _519 * 6.283185482025146484375;
    float _803 = cos(_801);
    float _805 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].y, _791);
    float _807 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].z, _793);
    if (_451)
    {
        _751 = _787;
    }
    float _809 = _751;
    float _811 = _749 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _813 = _418 + 1;
    float _815 = fma(_661, _759, _807);
    float _817 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _571);
    float _819 = fma(_811, _809, -0.5);
    float _821 = fma(_657, _759, _799);
    float _823 = fma(_631, _731, _815);
    float _825 = _775 * _765;
    float _827 = fma(_659, _759, _805);
    float _829 = fma(_627, _731, _821);
    float _831 = fma(_679, _709, _823);
    float _833 = _803 * _765;
    float _835 = -_825;
    float _837 = fma(_803, _819, _835);
    float _839 = fma(_629, _731, _827);
    float _841 = fma(_675, _709, _829);
    float _843 = fma(_775, _819, _833);
    float _845 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _549);
    float _847 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _557);
    float _849 = fma(_677, _709, _839);
    float _851 = fma(_707, _705, _841);
    float _853 = fma(_845, _837, _797);
    int _855 = abs(_813);
    float _857 = -_847;
    float _859 = fma(_817, _843, _857);
    float _861 = fma(_715, _705, _849);
    float _863 = fma(_717, _705, _831);
    float _865 = float(uint(_855));
    float _867 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[112].x, _851);
    float _869 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[112].y, _861);
    float _871 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[112].z, _863);
    float _873 = as_type<float>(_348) * _865;
    float _875 = _867 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _879 = _869 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _883 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = trunc(_873);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    float _891 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _895 = uint(int(uint(_813) >> uint(31)));
    out.m_59.x = _883;
    out.m_59.y = _891;
    out.m_59.z = _893;
    out.m_59.w = _877;
    int _897 = ~int(_895);
    int _899 = _897 + 1;
    int _901 = ~int(_889);
    int _903 = _901 + 1;
    int _905 = _903 * _323;
    int _907 = _905 + _855;
    float _909 = float(uint(_907));
    float _911 = as_type<float>(_348) * _909;
    float _913 = _853 + 0.5;
    float _915 = trunc(_911);
    float _917 = precise::max(_915, 0.0);
    uint _919 = uint(_917);
    int _921 = int(_889) + int(_919);
    int _923 = ~_921;
    int _925 = _923 + 1;
    int _927 = _925 * _323;
    int _929 = _927 + _855;
    bool _931 = uint(_929) >= uint(_323);
    bool _933 = !_931;
    int _935 = _933 ? 0 : (-1);
    int _937 = ~_921;
    int _939 = _937 + _935;
    int _941 = _939 + 1;
    int _943 = _941 * _323;
    int _945 = _943 + _855;
    int _947 = _945 ^ _899;
    int _949 = ~_899;
    int _951 = _949 + _947;
    int _953 = _951 + 1;
    float _955 = _859 + 0.5;
    bool _957 = !_325;
    int _959 = _957 ? _953 : (-1);
    uint _961 = as_type<uint>(half2(float2(_441, 0.0)));
    uint _963 = extract_bits(_961, 0u, 8u);
    int _965 = int(_963) & 255;
    uint _967 = extract_bits(_961, 8u, 8u);
    int _969 = int(_967) & 255;
    int _971 = _969 << 8;
    int _973 = _965 | _971;
    bool _975 = _973 >= 32768;
    int _977 = _973 + (-1024);
    int _979 = _977;
    if (_975)
    {
        int _981 = ~_973;
        int _983 = _981 + 33792;
        int _985 = _983 + 1;
        _979 = _985;
    }
    int _987 = _979;
    int _989 = _987 + 30719;
    float _991 = float(_989);
    float _993 = fma(_991, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _995 = abs(_993);
    float _997 = -_995;
    float _999 = _997 + 1.0;
    int _1001 = as_type<int>(_999) + (-218103808);
    bool _1003 = uint(_1001) >= 1920991232u;
    bool _1005 = !_1003;
    if (!_1005)
    {
        int _1007;
        _84(_1007, out.gl_Position, out.gl_PointSize);
    }
    int _1009 = _959;
    int _1011 = 0;
    int _1013 = _87(_1009, _1011, (*spvDescriptorSet0.support_buffer));
    int _1015 = _386;
    int _1017 = 0;
    int _1019 = _87(_1015, _1017, (*spvDescriptorSet0.support_buffer));
    float4 _1021 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1013, _1019)), 0).xyzw;
    float _1023 = _1021.x;
    float _1025 = _1021.y;
    float _1027 = _1021.z;
    float _1029 = _1021.w;
    float _1031 = floor(_327);
    float _1033 = -_1031;
    float _1035 = _327 + _1033;
    uint _1037 = as_type<uint>(half2(float2(_1029, 0.0)));
    float _1039 = -_435;
    float _1041 = _1039 + _1023;
    float _1043 = -_439;
    float _1045 = _1043 + _1027;
    uint _1047 = extract_bits(_1037, 0u, 8u);
    int _1049 = int(_1047) & 255;
    uint _1051 = extract_bits(_1037, 8u, 8u);
    int _1053 = int(_1051) & 255;
    int _1055 = _1053 << 8;
    int _1057 = _1049 | _1055;
    float _1059 = fma(_1035, _1045, _439);
    bool _1061 = _1057 >= 32768;
    int _1063 = _1057 + (-1024);
    int _1065 = _1063;
    if (_1061)
    {
        int _1067 = ~_1057;
        int _1069 = _1067 + 33792;
        int _1071 = _1069 + 1;
        _1065 = _1071;
    }
    int _1073 = _1065;
    int _1075 = _1073 + 30719;
    float _1077 = float(_1075);
    float _1079 = fma(_1077, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1081 = abs(_1079);
    float _1083 = -_1081;
    float _1085 = _1083 + 1.0;
    int _1087 = as_type<int>(_1085) + (-218103808);
    bool _1089 = uint(_1087) >= 1920991232u;
    float _1091 = -_437;
    float _1093 = _1091 + _1025;
    float _1095 = fma(_1035, _1041, _435);
    float _1097 = fma(_1035, _1093, _437);
    bool _1099 = !_1089;
    if (!_1099)
    {
        int _1101;
        _84(_1101, out.gl_Position, out.gl_PointSize);
    }
    float _1103 = in.m_55.x;
    float _1105 = in.m_55.y;
    float _1107 = in.m_55.z;
    float _1109 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1111 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1113 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1115 = in.m_61.w;
    float _1117 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1109);
    float _1119 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1111);
    float _1121 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1113);
    out.m_63.x = _913;
    out.m_63.y = _955;
    float _1123 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1117);
    float _1125 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1119);
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1133 = _1131 != 0;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1137 = _1135 != 0;
    float _1139 = _1103 * 2.0;
    float _1141 = _1105 + _1107;
    float _1143 = _1107 + _1103;
    float _1145 = _1107 + (-0.5);
    float _1147 = _1107 * 2.0;
    out.m_65.w = _1115;
    float _1149 = floor(_1139);
    float _1151 = _1105 + _1103;
    float _1153 = _1103 + (-0.5);
    float _1155 = _1105 * 2.0;
    float _1157 = _1151 + (-1.0);
    float _1159 = _1105 + (-0.5);
    float _1161 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1121);
    float _1163 = floor(_1147);
    float _1165 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1167 = _1141 + (-1.0);
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1165);
    float _1171 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1173 = log2(_1171);
    float _1175 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1177 = _1149 > 0.0;
    float _1179 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1181 = _1149 >= 0.0;
    bool _1183 = isnan(_1149);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan(0.0);
    bool _1189 = _1185 || _1187;
    float _1191 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1175);
    float _1193 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1179);
    float _1195 = floor(_1155);
    int _1197 = _1189 ? 0 : 1;
    float _1199 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1191);
    float _1201 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1203 = _1163 > 0.0;
    float _1205 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1169);
    float _1207 = _1173 * _129;
    float _1209 = _1125 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1211 = ~_1197;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    float _1217 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1219 = _1163 >= 0.0;
    bool _1221 = isnan(_1163);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan(0.0);
    bool _1227 = _1223 || _1225;
    float _1229 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1231 = _1215;
    float _1233 = _1209;
    if (!_1177)
    {
        int _1235 = ~_1197;
        int _1237 = _1235 + 1;
        _1231 = _1237;
    }
    int _1239 = _1231;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1243 = _1209 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1247 = _1217 + _1245;
    int _1249 = _1227 ? 0 : 1;
    float _1251 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1253 = _1195 > 0.0;
    float _1255 = _1161 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1257 = _1195 >= 0.0;
    bool _1259 = isnan(_1195);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan(0.0);
    bool _1265 = _1261 || _1263;
    float _1267 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1193);
    bool _1269 = !_1129;
    int _1271 = _1269 ? 0 : 1;
    float _1273 = exp2(_1207);
    int _1275 = ~_1249;
    int _1277 = _1275 + 1;
    int _1279 = _1277 + 1;
    float _1281 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1251);
    int _1283 = _1279;
    float _1285 = _1247;
    if (!_1203)
    {
        int _1287 = ~_1249;
        int _1289 = _1287 + 1;
        _1283 = _1289;
    }
    int _1291 = _1283;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1295 = _1255 + _1293;
    int _1297 = abs(_1271);
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    bool _1303 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1305 = isnan(1.0);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1311 = _1307 || _1309;
    float _1313 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1281);
    float _1315 = float(_1297);
    float _1317 = in.m_67.x;
    float _1319 = in.m_67.y;
    float _1321 = in.m_67.z;
    float _1323 = float(_1291);
    float _1325 = 1.0 / _1301;
    bool _1327 = !_1133;
    int _1329 = _1327 ? 0 : 1;
    bool _1331 = _1313 >= 0.0;
    float _1333 = _1315 * _1323;
    int _1335 = abs(_1329);
    float _1337 = _1243 * _1243;
    float _1339 = -_1273;
    float _1341 = _1339 + 1.0;
    float _1343 = float(_1239);
    float _1345 = rsqrt(_1267);
    float _1347 = float(_1335);
    float _1349 = fma(_1247, _1247, _1337);
    bool _1351 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1359 = _1355 || _1357;
    int _1361 = _1265 ? 0 : 1;
    float _1363 = _1347 * _1343;
    float _1365 = _1359 ? _1341 : 0.0;
    float _1367 = fma(_1295, _1295, _1349);
    float _1369 = rsqrt(_1199);
    float _1371 = _1363 * (-2.0);
    float _1373 = _1333;
    if (_1331)
    {
        out.m_49.x = 0.0;
    }
    if (_1311)
    {
        float _1375 = _1365 * _1325;
        _131 = _1375;
    }
    float _1377 = _131;
    float _1379 = _1333 * (-2.0);
    if (_1331)
    {
        _1373 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1381 = _1373;
    float _1383 = fma(_1371, _1319, _1319);
    int _1385 = ~_1361;
    int _1387 = _1385 + 1;
    int _1389 = _1387 + 1;
    float _1391 = rsqrt(_1367);
    float _1393 = fma(_1201, _1379, _1201);
    float _1395 = fma(_1379, _1317, _1317);
    int _1397 = as_type<int>(_1381);
    int _1399 = _1389;
    if (_1331)
    {
        float _1401 = _1381 * 5.0;
        _1397 = as_type<int>(_1401);
    }
    int _1403 = _1397;
    bool _1405 = !_1137;
    int _1407 = _1405 ? 0 : 1;
    float _1409 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1395);
    if (!_1253)
    {
        int _1411 = ~_1361;
        int _1413 = _1411 + 1;
        _1399 = _1413;
    }
    int _1415 = _1399;
    float _1417 = fma(_1229, _1371, _1229);
    if (_1331)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4537 = as_type<float>(_1403);
        out.gl_Position.z = _4537;
    }
    float _1419 = rsqrt(_1205);
    float _1421 = fma(_1393, _1377, _1409);
    int _1423 = abs(_1407);
    float _1425 = _1243 * _1391;
    float _1427 = _1247 * _1391;
    if (_1331)
    {
        return out;
    }
    float _1429 = -_1425;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    float _1433 = -_1427;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1217);
    float _1437 = _1295 * _1391;
    float _1439 = _1421 * 0.15915493667125701904296875;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1443 = _1431 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1447 = _1435 + _1445;
    float _1449 = float(_1423);
    float _1451 = sqrt(_1205);
    float _1453 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1455 = -_1437;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1255);
    float _1459 = float(_1415);
    float _1461 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1453);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1465 = _1457 + _1463;
    float _1467 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1383);
    float _1469 = _1449 * _1459;
    float _1471 = _1143 + (-1.0);
    float _1473 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1461);
    float _1475 = fma(_1417, _1377, _1467);
    float _1477 = _1469 * (-2.0);
    float _1479 = _1439 * 6.283185482025146484375;
    float _1481 = sin(_1479);
    bool _1483 = _1473 >= 0.0;
    float _1485 = _1475 * 0.15915493667125701904296875;
    float _1487 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1489 = fma(_1477, _1321, _1321);
    float _1491 = -_1425;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1495 = -_1427;
    float _1497 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1499 = fma(_1487, _1477, _1487);
    float _1501 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1489);
    float _1503 = _1493 * _1493;
    float _1505 = _1439 * 6.283185482025146484375;
    float _1507 = cos(_1505);
    float _1509 = fma(_1499, _1377, _1501);
    float _1511 = fma(_1497, _1497, _1503);
    int _1513 = as_type<int>(_1493);
    if (_1483)
    {
        _1285 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1515 = _1285;
    float _1517 = -_1437;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1295);
    if (_1483)
    {
        out.m_49.x = 0.0;
    }
    float _1521 = _1485 * 6.283185482025146484375;
    float _1523 = sin(_1521);
    if (_1483)
    {
        float _1525 = _1515 * 5.0;
        _1513 = as_type<int>(_1525);
    }
    int _1527 = _1513;
    float _1529 = _1509 * 0.15915493667125701904296875;
    if (_1483)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4733 = as_type<float>(_1527);
        out.gl_Position.z = _4733;
    }
    float _1531 = _1485 * 6.283185482025146484375;
    float _1533 = cos(_1531);
    float _1535 = _1529 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    if (_1483)
    {
        return out;
    }
    float _1539 = -_1209;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1543 = fma(_1519, _1519, _1511);
    float _1545 = -_1217;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1549 = -_1255;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1541 * _1541;
    float _1555 = _1097 * _1345;
    float _1557 = _1095 * _1419;
    float _1559 = sqrt(_1543);
    float _1561 = fma(_1547, _1547, _1553);
    float _1563 = _1451 * _1555;
    float _1565 = in.m_53.x;
    float _1567 = in.m_53.y;
    float _1569 = in.m_53.z;
    float _1571 = _1451 * _1557;
    float _1573 = fma(_1551, _1551, _1561);
    float _1575 = _1059 * _1369;
    float _1577 = _1481 * _1523;
    float _1579 = _1507 * _1533;
    float _1581 = rsqrt(_1573);
    float _1583 = _1451 * _1575;
    float _1585 = _1481 * _1533;
    float _1587 = fma(_1537, _1579, _1577);
    float _1589 = fma(_1537, _1577, _1579);
    float _1591 = _1391 * _1559;
    float _1593 = _1529 * 6.283185482025146484375;
    float _1595 = cos(_1593);
    float _1597 = _1507 * _1523;
    float _1599 = _1547 * _1581;
    float _1601 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1603 = _1551 * _1581;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1607 = _1599 * _1605;
    float _1609 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1611 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1613 = _1541 * _1581;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1617 = _1603 * _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1621 = -_1607;
    float _1623 = fma(_1603, _1619, _1621);
    float _1625 = _1609 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1629 = _1613 * _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1633 = -_1617;
    float _1635 = fma(_1613, _1631, _1633);
    float _1637 = _1623 * _1623;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1641 = -_1629;
    float _1643 = fma(_1599, _1639, _1641);
    float _1645 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1647 = fma(_1635, _1635, _1637);
    float _1649 = -_1597;
    float _1651 = fma(_1537, _1585, _1649);
    float _1653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1571);
    float _1655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1563);
    float _1657 = fma(_1643, _1643, _1647);
    float _1659 = _1591 * _1625;
    float _1661 = -_1585;
    float _1663 = fma(_1537, _1597, _1661);
    float _1665 = _1591 * _1645;
    float _1667 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1669 = _1655 * _1659;
    float _1671 = rsqrt(_1657);
    float _1673 = _1653 * _1665;
    float _1675 = _1591 * _1667;
    float _1677 = -_1669;
    float _1679 = _1537 * _1677;
    float _1681 = _1595 * _1669;
    float _1683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1583);
    float _1685 = _1533 * _1595;
    float _1687 = _1523 * _1595;
    float _1689 = _1507 * _1681;
    float _1691 = _1683 * _1675;
    float _1693 = _1481 * _1681;
    float _1695 = fma(_1685, _1673, _1679);
    float _1697 = fma(_1587, _1673, _1689);
    float _1699 = fma(_1651, _1673, _1693);
    float _1701 = fma(_1687, _1691, _1695);
    float _1703 = _1623 * _1671;
    float _1705 = _1635 * _1671;
    float _1707 = _1643 * _1671;
    float _1709 = fma(_1663, _1691, _1697);
    float _1711 = _1603 * _1703;
    float _1713 = _1613 * _1705;
    float _1715 = fma(_1589, _1691, _1699);
    float _1717 = -_1711;
    float _1719 = fma(_1613, _1707, _1717);
    float _1721 = -_1713;
    float _1723 = fma(_1599, _1703, _1721);
    float _1725 = _1719 * _1709;
    float _1727 = _1723 * _1709;
    float _1729 = fma(_1705, _1701, _1725);
    float _1731 = fma(_1707, _1701, _1727);
    float _1733 = fma(_1599, _1715, _1729);
    float _1735 = fma(_1603, _1715, _1731);
    float _1737 = _1599 * _1707;
    float _1739 = _1217 + _1733;
    float _1741 = _1255 + _1735;
    float _1743 = -_1737;
    float _1745 = fma(_1603, _1705, _1743);
    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1749 = _1739 + _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1753 = _1741 + _1751;
    float _1755 = _1745 * _1709;
    float _1757 = _1749 * _1749;
    float _1759 = _1753 * _1753;
    float _1761 = fma(_1703, _1701, _1755);
    float _1763 = _1757 + _1759;
    float _1765 = fma(_1613, _1715, _1761);
    float _1767 = sqrt(_1763);
    float _1769 = _1209 + _1765;
    bool _1771 = _1767 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1773 = _1603;
    float _1775 = _1715;
    float _1777 = _1765;
    float _1779 = _1745;
    float _1781 = _1761;
    if (!_1771)
    {
        _1233 = _1759;
    }
    float _1783 = _1233;
    float _1785 = _1783;
    if (!_1771)
    {
        _1773 = _1757;
    }
    float _1787 = _1773;
    float _1789 = _1787;
    if (!_1771)
    {
        _1775 = _1739;
    }
    float _1791 = _1775;
    float _1793 = _1791;
    if (!_1771)
    {
        _1777 = _1741;
    }
    float _1795 = _1777;
    float _1797 = _1795;
    if (!_1771)
    {
        _1779 = _1769;
    }
    float _1799 = _1779;
    bool _1801 = !_1771;
    float _1803 = _1799;
    if (!_1801)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1809 = _1767 + _1807;
        float _1811 = rsqrt(_1763);
        float _1813 = _1809 * _1805;
        float _1815 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1817 = _1813 * 0.15915493667125701904296875;
        float _1819 = _1817 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = _1817 * 6.283185482025146484375;
        float _1825 = cos(_1823);
        float _1827 = fma(_1821, _1815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1829 = _1811 * _1827;
        float _1831 = _1825 + (-1.0);
        float _1833 = _1753 * _1829;
        float _1835 = _1831 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1837 = _1749 * _1829;
        float _1839 = _1833 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1841 = fma(_1769, _1825, _1835);
        float _1843 = _1837 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1845 = _1837 * _1837;
        float _1847 = _1833 * _1833;
        _1803 = _1841;
        _1789 = _1845;
        _1785 = _1847;
        _1793 = _1843;
        _1797 = _1839;
    }
    float _1849 = _1803;
    float _1851 = _1789;
    float _1853 = _1785;
    float _1855 = _1793;
    float _1857 = _1797;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1861 = _1849 + _1859;
    float _1863 = fma(_1861, _1861, _1851);
    float _1865 = _1863 + _1853;
    float _1867 = sqrt(_1865);
    bool _1869 = _1867 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1871 = isnan(_1867);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1877 = _1873 || _1875;
    float _1879 = _1851;
    float _1881 = _1863;
    float _1883 = _1867;
    if (!_1877)
    {
        _1879 = 1.0;
    }
    float _1885 = _1879;
    bool _1887 = !_1877;
    float _1889 = _1885;
    if (!_1887)
    {
        bool _1891 = _1867 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1893 = isnan(_1867);
        bool _1895 = _1891 || _1893;
        bool _1897 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1899 = _1895 || _1897;
        if (!_1899)
        {
            float _1901 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1903 = _1867 + _1901;
            float _1905 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1907 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1905;
            float _1909 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1913 = 1.0 / _1907;
            float _1915 = _1903 * _1913;
            float _1917 = fma(_1915, _1911, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1889 = _1917;
            _1881 = _1911;
            _1919 = true;
        }
        else
        {
            bool _1921 = _1867 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1923 = isnan(_1867);
            bool _1925 = _1921 || _1923;
            bool _1927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1929 = _1925 || _1927;
            if (!_1929)
            {
                float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1933 = _1867 + _1931;
                float _1935 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1937 = _1935 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1939 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1941 = _1939 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1943 = 1.0 / _1937;
                float _1945 = _1933 * _1943;
                float _1947 = fma(_1945, _1941, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1889 = _1947;
                _1881 = _1941;
                _1919 = true;
            }
            else
            {
                _1889 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1919 = false;
    float _1949 = _1889;
    float _1951 = _1881;
    float _1953 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1955 = _1849 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1959 = _1855 + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1963 = _1857 + _1961;
    float _1965 = fma(_1955, _1949, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1967 = fma(_1959, _1949, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1969 = fma(_1963, _1949, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1971 = -_1425;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1965);
    float _1975 = -_1427;
    float _1977 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1967);
    float _1979 = -_1437;
    float _1981 = fma(_1979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1969);
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1985 = _1973 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1989 = _1977 + _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1993 = _1981 + _1991;
    float _1995 = _1985 * _1985;
    float _1997 = fma(_1989, _1989, _1995);
    float _1999 = fma(_1993, _1993, _1997);
    float _2001 = rsqrt(_1999);
    float _2003 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2005 = _1989 * _2003;
    float _2007 = _1993 * _2003;
    float _2009 = _2005 * _2005;
    float _2011 = _2007 * _2007;
    float _2013 = _2009 + _2011;
    float _2015 = sqrt(_2013);
    bool _2017 = _2015 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = _2015 + _2019;
    float _2023 = _1993;
    float _2025 = _2013;
    float _2027 = _2021;
    float _2029 = _1951;
    float _2031 = _1985;
    if (_2017)
    {
        float _2033 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2023 = _2033;
    }
    float _2035 = _2023;
    if (_2017)
    {
        float _2037 = rsqrt(_2013);
        _2025 = _2037;
    }
    float _2039 = _2025;
    float _2041 = _2039;
    if (_2017)
    {
        float _2043 = _2021 * _2035;
        _2027 = _2043;
    }
    float _2045 = _2027;
    if (_2017)
    {
        float _2047 = _2045 * 0.15915493667125701904296875;
        _2029 = _2047;
    }
    float _2049 = _2029;
    float _2051 = _2035;
    if (_2017)
    {
        float _2053 = _2049 * 6.283185482025146484375;
        float _2055 = sin(_2053);
        _2051 = _2055;
    }
    float _2057 = _2051;
    float _2059 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2061 = precise::max(0.0, _2059);
    float _2063 = _2001;
    float _2065 = _2061;
    if (_2017)
    {
        float _2067 = _2049 * 6.283185482025146484375;
        float _2069 = cos(_2067);
        _2063 = _2069;
    }
    float _2071 = _2063;
    float _2073 = -_2003;
    float _2075 = -_2061;
    float _2077 = fma(_1985, _2073, _2075);
    if (!_2017)
    {
        _2031 = _2005;
    }
    float _2079 = _2031;
    float _2081 = _2079;
    if (_2017)
    {
        float _2083 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2065 = _2083;
    }
    float _2085 = _2065;
    float _2087 = sqrt(_1999);
    float _2089 = _2057;
    float _2091 = _2085;
    if (_2017)
    {
        float _2093 = fma(_2057, _2085, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2089 = _2093;
    }
    float _2095 = _2089;
    float _2097 = _2095;
    float _2099 = _2071;
    if (_2017)
    {
        float _2101 = _2071 + (-1.0);
        _2091 = _2101;
    }
    float _2103 = _2091;
    float _2105 = _2103;
    if (_2017)
    {
        float _2107 = _2039 * _2095;
        _1781 = _2107;
    }
    float _2109 = _1781;
    if (!_2017)
    {
        _2097 = _2077;
    }
    float _2111 = _2097;
    float _2113 = _2111;
    if (_2017)
    {
        float _2115 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1883 = _2115;
    }
    float _2117 = _1883;
    if (_2017)
    {
        float _2119 = _2005 * _2109;
        _2081 = _2119;
    }
    float _2121 = _2081;
    if (!_2017)
    {
        _2105 = _2007;
    }
    float _2123 = _2105;
    float _2125 = _2123;
    if (_2017)
    {
        float _2127 = _2007 * _2109;
        _2125 = _2127;
    }
    float _2129 = _2125;
    if (!_2017)
    {
        _2041 = _2009;
    }
    float _2131 = _2041;
    float _2133 = _2131;
    if (_2017)
    {
        float _2135 = fma(_2077, _2071, _2117);
        _2113 = _2135;
    }
    float _2137 = _2113;
    if (_2017)
    {
        float _2139 = _2121 * _2121;
        _2133 = _2139;
    }
    float _2141 = _2133;
    if (!_2017)
    {
        _2099 = _2011;
    }
    float _2143 = _2099;
    float _2145 = _2143;
    if (_2017)
    {
        float _2147 = _2129 * _2129;
        _2145 = _2147;
    }
    float _2149 = _2145;
    float _2151 = fma(_2137, _2137, _2141);
    float _2153 = _2151 + _2149;
    float _2155 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2159 = fma(_2087, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2157);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2165 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2155);
    float _2167 = rsqrt(_2153);
    float _2169 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2171 = -_2161;
    float _2173 = _2171 + 1.0;
    float _2175 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2165);
    float _2177 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2179 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2169);
    float _2181 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2183 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2185 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2177);
    float _2187 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2179);
    float _2189 = abs(_2173);
    float _2191 = log2(_2189);
    float _2193 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2195 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2185);
    float _2197 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2199 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2181);
    float _2201 = -_2193;
    float _2203 = fma(_2201, _2163, 1.0);
    float _2205 = _2167 * _2121;
    float _2207 = _2167 * _2137;
    float _2209 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2211 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2213 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2215 = _2167 * _2129;
    float _2217 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2199);
    float _2219 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2211);
    float _2221 = -_2213;
    float _2223 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2221);
    float _2225 = log2(_2203);
    float _2227 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2229 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2219);
    float _2231 = -_2215;
    float _2233 = fma(_2231, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2223);
    float _2235 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2237 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2239 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2229);
    float _2241 = fma(_2233, -0.5, 0.5);
    float _2243 = exp2(_2235);
    float _2245 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2247 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2237);
    float _2249 = fma(_2233, 0.5, 0.5);
    float _2251 = _2207 + 1.0;
    float _2253 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2245);
    float _2255 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2247);
    float _2257 = fma(_2249, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2259 = 1.0 / _2239;
    float _2261 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2253);
    float _2263 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2265 = fma(_2249, _2257, -0.212114393711090087890625);
    float _2267 = _2225 * 0.693147182464599609375;
    float _2269 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2261);
    float _2271 = fma(_2249, _2265, 1.570728778839111328125);
    float _2273 = sqrt(_2241);
    float _2275 = -_2207;
    float _2277 = fma(_2243, _2251, _2275);
    float _2279 = fma(_2277, 0.5, 0.5);
    float _2281 = _2263 * _2259;
    float _2283 = _2269 * _2259;
    float _2285 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2287 = fma(_2281, 0.5, 0.5);
    float _2289 = fma(_2283, -0.5, 0.5);
    float _2291 = _2273 * 0.636619746685028076171875;
    float _2293 = -_2271;
    float _2295 = fma(_2291, _2293, 1.0);
    float3 _5971 = float3(_2287, _2289, _2285);
    float _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5971, float3(0.0), isnan(_5971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5971, float3(0.0), isnan(_5971)), level(0.0)).x;
    float3 _5982 = float3(_2287, _2289, _2285);
    float4 _2299 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5982, float3(0.0), isnan(_5982)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5982, float3(0.0), isnan(_5982)), level(0.0)).xyzw;
    float _2301 = _2299.x;
    float _2303 = _2299.y;
    float _2305 = _2299.z;
    float _2307 = _2299.w;
    float2 _5998 = float2(_2295, _2279);
    float3 _2311 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _2313 = _2311.x;
    float _2315 = _2311.y;
    float _2317 = _2311.z;
    float _2319 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2321 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2319);
    float _2323 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2325 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2327 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2321);
    float _2329 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2323);
    float _2331 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2333 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2329);
    float _2335 = 1.0 / _2331;
    bool _2337 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.5);
    bool _2345 = _2341 || _2343;
    float _2347 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2349 = _2333 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2351 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2347);
    float _2353 = _2349 + _2331;
    float _2355 = exp2(_2325);
    float _2357 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2351);
    float _2359 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2357);
    float _2361 = _2191;
    if (_2345)
    {
        _2361 = 1.0;
    }
    float _2363 = _2361;
    float _2365 = _2353 * _2335;
    float _2367 = _2365 * 0.5;
    float _2369 = _2363;
    if (!_2345)
    {
        float _2371 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2375 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2373);
        float _2377 = _2371 * 0.15915493667125701904296875;
        float _2379 = _2377 * 6.283185482025146484375;
        float _2381 = cos(_2379);
        float _2383 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2385 = _2383 * 0.15915493667125701904296875;
        float _2387 = _2377 * 6.283185482025146484375;
        float _2389 = sin(_2387);
        float _2391 = 1.0 / _2381;
        float _2393 = _2385 * 6.283185482025146484375;
        float _2395 = cos(_2393);
        float _2397 = _2389 * _2391;
        float _2399 = 1.0 / _2375;
        float _2401 = _2395 * _2397;
        float _2403 = _2385 * 6.283185482025146484375;
        float _2405 = sin(_2403);
        float _2407 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2409 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2407;
        float _2411 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2413 = _2399 * _2411;
        float _2415 = 1.0 / _2401;
        float _2417 = 1.0 / _2409;
        float _2419 = _2405 * _2415;
        float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2423 = fma(_2419, _2413, _2421);
        float _2425 = _2423 * _2417;
        float _2427 = precise::clamp(_2425, 0.0, 1.0);
        _2369 = _2427;
    }
    float _2429 = _2369;
    float _2431 = -_2355;
    float _2433 = _2431 + 1.0;
    float _2435 = _2239 * 0.5;
    float _2437 = _2429 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2439 = _2429 > 0.0;
    bool _2441 = isnan(_2429);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan(0.0);
    bool _2447 = _2443 || _2445;
    float _2449 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2451 = fma(_2269, -0.5, _2435);
    float _2453 = _2437 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2455 = _2359 + _2239;
    float _2457 = _2449 * _2297;
    float _2459 = -_2449;
    float _2461 = _2459 + 1.0;
    float _2463 = _2263 + _2239;
    out.gl_Position.x = _2263;
    out.gl_Position.y = _2269;
    out.gl_Position.z = _2359;
    out.gl_Position.w = _2239;
    float _2465 = _2307 * _2457;
    float _2467 = _2317 * _2457;
    float _2469 = _2307 * _2461;
    float _2471 = _2455 * 0.5;
    float _2473 = _2463 * 0.5;
    float _2475 = fma(_2313, _2465, _2301);
    float _2477 = fma(_2315, _2465, _2303);
    float _2479 = fma(_2307, _2467, _2305);
    out.m_49.x = _2453;
    out.m_69.x = _2473;
    out.m_69.y = _2451;
    out.m_69.z = _2471;
    out.m_69.w = _2239;
    out.m_71.x = _2475;
    out.m_71.y = _2477;
    out.m_71.z = _2479;
    out.m_71.w = _2469;
    if (_2447)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2481;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1919 = false;
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
        float _2538 = as_type<float>(_111);
        out.gl_Position.z = _2538;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2608 = as_type<float>(_149);
        out.gl_Position.z = _2608;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_53.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    int _303 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _305 = _303;
    int _307 = 0;
    int _309 = _86(_305, _307, (*spvDescriptorSet0.support_buffer));
    float _311 = in.m_55.x;
    float _313 = in.m_55.y;
    float _315 = in.m_55.z;
    float _317 = _129 + _315;
    float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _321 = float(_309);
    int _323 = abs(_309);
    bool _325 = _309 == 0;
    float _327 = _319 * _321;
    float _329 = float(uint(_323));
    float _331 = trunc(_327);
    int _333 = int(_331);
    float _335 = 1.0 / _329;
    int _337 = abs(_333);
    uint _340 = uint(int(uint(_333) >> uint(31)));
    float _342 = float(uint(_337));
    int _344 = ~int(_340);
    int _346 = _344 + 1;
    int _348 = as_type<int>(_335) + (-2);
    float _350 = as_type<float>(_348) * _342;
    float _352 = trunc(_350);
    float _354 = precise::max(_352, 0.0);
    uint _356 = uint(_354);
    int _358 = ~int(_356);
    int _360 = _358 + 1;
    int _362 = _360 * _323;
    int _364 = _362 + _337;
    float _366 = float(uint(_364));
    float _368 = as_type<float>(_348) * _366;
    float _370 = in.m_57.z;
    float _372 = trunc(_368);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = int(_356) + int(_376);
    int _380 = ~_378;
    int _382 = _380 + 1;
    float _384 = trunc(_370);
    int _386 = int(_384);
    int _388 = _382 * _323;
    int _390 = _388 + _337;
    bool _392 = uint(_390) >= uint(_323);
    bool _394 = !_392;
    int _396 = _394 ? 0 : (-1);
    int _398 = ~_378;
    int _400 = _398 + _396;
    int _402 = _400 + 1;
    int _404 = _402 * _323;
    int _406 = _404 + _337;
    int _408 = _406 ^ _346;
    int _410 = ~_346;
    int _412 = _410 + _408;
    int _414 = _412 + 1;
    bool _416 = !_325;
    int _418 = _416 ? _414 : (-1);
    int _420 = _418;
    int _422 = 0;
    int _424 = _87(_420, _422, (*spvDescriptorSet0.support_buffer));
    int _426 = _386;
    int _428 = 0;
    int _430 = _87(_426, _428, (*spvDescriptorSet0.support_buffer));
    float4 _433 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_424, _430)), 0).xyzw;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    float _441 = _433.w;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _445 = _301 + _443;
    float _447 = in.m_57.y;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _451 = _449 != 0;
    float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _465;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _471 = _469 != 0;
    float _473 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[79].z, _463);
    float _475 = 1.0 / _457;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _483;
    float _487 = 0.0;
    float _489 = _447;
    if (_451)
    {
        float _491 = in.m_55.x;
        _487 = _491;
    }
    float _493 = _487;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _497 = _313 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _499 = 1.0 / _467;
    float _501 = _311 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _503 = _313 > 0.5;
    bool _505 = _503 && _471;
    float _507 = in.m_57.x;
    float _509 = -_481;
    float _511 = fma(_501, 2.0, _509);
    float _513 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _473);
    float _515 = 1.0 / _461;
    float _517 = _453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _519 = _513 * (-0.15915493667125701904296875);
    float _521 = 1.0 / _479;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _523;
    bool _527 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _529 = isnan(_301);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _539;
    bool _543 = _493 > 0.5;
    bool _545 = _543 && _451;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _549 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[78].z, _495);
    float _551 = 1.0 / _485;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _555 = _301 + _553;
    float _557 = fma(_497, -2.0, _547);
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _563 = _301 + _561;
    float _565 = _555 * _499;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _569 = _301 + _567;
    float _571 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].w, _559);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _575 = _301 + _573;
    float _577 = _563 * _475;
    float _579 = _569 * _515;
    float _581 = _575 * _521;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _591;
    float _595 = _445 * _551;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _601 = fma(_585, _577, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _603 = fma(_589, _577, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _605 = fma(_593, _577, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _627 = fma(_613, _565, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _629 = fma(_617, _565, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _631 = fma(_621, _565, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    bool _645 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _647 = isnan(_301);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = fma(_625, _579, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _659 = fma(_599, _579, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _661 = fma(_609, _579, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _663 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _665 = isnan(_301);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_635, _581, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _677 = fma(_639, _581, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _679 = fma(_643, _581, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _681 = -_655;
    float _683 = _681 + 1.0;
    float _685 = -_673;
    float _687 = _685 + 1.0;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _689;
    bool _693 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _695 = isnan(_301);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = _673 * _683;
    float _707 = fma(_525, _595, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _709 = _537 * _687;
    float _711 = -_537;
    float _713 = _711 + 1.0;
    float _715 = fma(_541, _595, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _717 = fma(_691, _595, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    bool _719 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _721 = isnan(_301);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = _703 * _713;
    bool _733 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _735 = isnan(_301);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = -_703;
    float _747 = _745 + 1.0;
    float _749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _751 = _507;
    if (_505)
    {
        float _753 = -_447;
        float _755 = _753 + 1.0;
        _489 = _755;
    }
    float _757 = _489;
    float _759 = _743 * _747;
    float _761 = -_743;
    float _763 = _761 + 1.0;
    float _765 = fma(_517, _757, -0.5);
    float _767 = _757;
    if (_451)
    {
        _767 = _507;
    }
    float _769 = _767;
    float _771 = _729 * _763;
    float _773 = _519 * 6.283185482025146484375;
    float _775 = sin(_773);
    float _777 = -_729;
    float _779 = _777 + 1.0;
    float _781 = _769;
    if (_545)
    {
        float _783 = -_769;
        float _785 = _783 + 1.0;
        _781 = _785;
    }
    float _787 = _781;
    float _789 = _601 * _771;
    float _791 = _603 * _771;
    float _793 = _605 * _771;
    float _795 = -_129;
    float _797 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[76].x, _511);
    float _799 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].x, _789);
    float _801 = _519 * 6.283185482025146484375;
    float _803 = cos(_801);
    float _805 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].y, _791);
    float _807 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[107].z, _793);
    if (_451)
    {
        _751 = _787;
    }
    float _809 = _751;
    float _811 = _749 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _813 = _418 + 1;
    float _815 = fma(_661, _759, _807);
    float _817 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _571);
    float _819 = fma(_811, _809, -0.5);
    float _821 = fma(_657, _759, _799);
    float _823 = fma(_631, _731, _815);
    float _825 = _775 * _765;
    float _827 = fma(_659, _759, _805);
    float _829 = fma(_627, _731, _821);
    float _831 = fma(_679, _709, _823);
    float _833 = _803 * _765;
    float _835 = -_825;
    float _837 = fma(_803, _819, _835);
    float _839 = fma(_629, _731, _827);
    float _841 = fma(_675, _709, _829);
    float _843 = fma(_775, _819, _833);
    float _845 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _549);
    float _847 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _557);
    float _849 = fma(_677, _709, _839);
    float _851 = fma(_707, _705, _841);
    float _853 = fma(_845, _837, _797);
    int _855 = abs(_813);
    float _857 = -_847;
    float _859 = fma(_817, _843, _857);
    float _861 = fma(_715, _705, _849);
    float _863 = fma(_717, _705, _831);
    float _865 = float(uint(_855));
    float _867 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[112].x, _851);
    float _869 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[112].y, _861);
    float _871 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[112].z, _863);
    float _873 = as_type<float>(_348) * _865;
    float _875 = _867 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _879 = _869 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _883 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = trunc(_873);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    float _891 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _895 = uint(int(uint(_813) >> uint(31)));
    out.m_59.x = _883;
    out.m_59.y = _891;
    out.m_59.z = _893;
    out.m_59.w = _877;
    int _897 = ~int(_895);
    int _899 = _897 + 1;
    int _901 = ~int(_889);
    int _903 = _901 + 1;
    int _905 = _903 * _323;
    int _907 = _905 + _855;
    float _909 = float(uint(_907));
    float _911 = as_type<float>(_348) * _909;
    float _913 = _853 + 0.5;
    float _915 = trunc(_911);
    float _917 = precise::max(_915, 0.0);
    uint _919 = uint(_917);
    int _921 = int(_889) + int(_919);
    int _923 = ~_921;
    int _925 = _923 + 1;
    int _927 = _925 * _323;
    int _929 = _927 + _855;
    bool _931 = uint(_929) >= uint(_323);
    bool _933 = !_931;
    int _935 = _933 ? 0 : (-1);
    int _937 = ~_921;
    int _939 = _937 + _935;
    int _941 = _939 + 1;
    int _943 = _941 * _323;
    int _945 = _943 + _855;
    int _947 = _945 ^ _899;
    int _949 = ~_899;
    int _951 = _949 + _947;
    int _953 = _951 + 1;
    float _955 = _859 + 0.5;
    bool _957 = !_325;
    int _959 = _957 ? _953 : (-1);
    uint _961 = as_type<uint>(half2(float2(_441, 0.0)));
    uint _963 = extract_bits(_961, 0u, 8u);
    int _965 = int(_963) & 255;
    uint _967 = extract_bits(_961, 8u, 8u);
    int _969 = int(_967) & 255;
    int _971 = _969 << 8;
    int _973 = _965 | _971;
    bool _975 = _973 >= 32768;
    int _977 = _973 + (-1024);
    int _979 = _977;
    if (_975)
    {
        int _981 = ~_973;
        int _983 = _981 + 33792;
        int _985 = _983 + 1;
        _979 = _985;
    }
    int _987 = _979;
    int _989 = _987 + 30719;
    float _991 = float(_989);
    float _993 = fma(_991, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _995 = abs(_993);
    float _997 = -_995;
    float _999 = _997 + 1.0;
    int _1001 = as_type<int>(_999) + (-218103808);
    bool _1003 = uint(_1001) >= 1920991232u;
    bool _1005 = !_1003;
    if (!_1005)
    {
        int _1007;
        _84(_1007, out.gl_Position, out.gl_PointSize);
    }
    int _1009 = _959;
    int _1011 = 0;
    int _1013 = _87(_1009, _1011, (*spvDescriptorSet0.support_buffer));
    int _1015 = _386;
    int _1017 = 0;
    int _1019 = _87(_1015, _1017, (*spvDescriptorSet0.support_buffer));
    float4 _1021 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1013, _1019)), 0).xyzw;
    float _1023 = _1021.x;
    float _1025 = _1021.y;
    float _1027 = _1021.z;
    float _1029 = _1021.w;
    float _1031 = floor(_327);
    float _1033 = -_1031;
    float _1035 = _327 + _1033;
    uint _1037 = as_type<uint>(half2(float2(_1029, 0.0)));
    float _1039 = -_435;
    float _1041 = _1039 + _1023;
    float _1043 = -_439;
    float _1045 = _1043 + _1027;
    uint _1047 = extract_bits(_1037, 0u, 8u);
    int _1049 = int(_1047) & 255;
    uint _1051 = extract_bits(_1037, 8u, 8u);
    int _1053 = int(_1051) & 255;
    int _1055 = _1053 << 8;
    int _1057 = _1049 | _1055;
    float _1059 = fma(_1035, _1045, _439);
    bool _1061 = _1057 >= 32768;
    int _1063 = _1057 + (-1024);
    int _1065 = _1063;
    if (_1061)
    {
        int _1067 = ~_1057;
        int _1069 = _1067 + 33792;
        int _1071 = _1069 + 1;
        _1065 = _1071;
    }
    int _1073 = _1065;
    int _1075 = _1073 + 30719;
    float _1077 = float(_1075);
    float _1079 = fma(_1077, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1081 = abs(_1079);
    float _1083 = -_1081;
    float _1085 = _1083 + 1.0;
    int _1087 = as_type<int>(_1085) + (-218103808);
    bool _1089 = uint(_1087) >= 1920991232u;
    float _1091 = -_437;
    float _1093 = _1091 + _1025;
    float _1095 = fma(_1035, _1041, _435);
    float _1097 = fma(_1035, _1093, _437);
    bool _1099 = !_1089;
    if (!_1099)
    {
        int _1101;
        _84(_1101, out.gl_Position, out.gl_PointSize);
    }
    float _1103 = in.m_55.x;
    float _1105 = in.m_55.y;
    float _1107 = in.m_55.z;
    float _1109 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1111 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1113 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1115 = in.m_61.w;
    float _1117 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1109);
    float _1119 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1111);
    float _1121 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1113);
    out.m_63.x = _913;
    out.m_63.y = _955;
    float _1123 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1117);
    float _1125 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1119);
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1129 = _1127 != 0;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1133 = _1131 != 0;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1137 = _1135 != 0;
    float _1139 = _1103 * 2.0;
    float _1141 = _1105 + _1107;
    float _1143 = _1107 + _1103;
    float _1145 = _1107 + (-0.5);
    float _1147 = _1107 * 2.0;
    out.m_65.w = _1115;
    float _1149 = floor(_1139);
    float _1151 = _1105 + _1103;
    float _1153 = _1103 + (-0.5);
    float _1155 = _1105 * 2.0;
    float _1157 = _1151 + (-1.0);
    float _1159 = _1105 + (-0.5);
    float _1161 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1121);
    float _1163 = floor(_1147);
    float _1165 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1167 = _1141 + (-1.0);
    float _1169 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1165);
    float _1171 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1173 = log2(_1171);
    float _1175 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1177 = _1149 > 0.0;
    float _1179 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1181 = _1149 >= 0.0;
    bool _1183 = isnan(_1149);
    bool _1185 = _1181 || _1183;
    bool _1187 = isnan(0.0);
    bool _1189 = _1185 || _1187;
    float _1191 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1175);
    float _1193 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1179);
    float _1195 = floor(_1155);
    int _1197 = _1189 ? 0 : 1;
    float _1199 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1191);
    float _1201 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1203 = _1163 > 0.0;
    float _1205 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1169);
    float _1207 = _1173 * _129;
    float _1209 = _1125 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1211 = ~_1197;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    float _1217 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1219 = _1163 >= 0.0;
    bool _1221 = isnan(_1163);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan(0.0);
    bool _1227 = _1223 || _1225;
    float _1229 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1231 = _1215;
    float _1233 = _1209;
    if (!_1177)
    {
        int _1235 = ~_1197;
        int _1237 = _1235 + 1;
        _1231 = _1237;
    }
    int _1239 = _1231;
    float _1241 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1243 = _1209 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1247 = _1217 + _1245;
    int _1249 = _1227 ? 0 : 1;
    float _1251 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1253 = _1195 > 0.0;
    float _1255 = _1161 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1257 = _1195 >= 0.0;
    bool _1259 = isnan(_1195);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan(0.0);
    bool _1265 = _1261 || _1263;
    float _1267 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1193);
    bool _1269 = !_1129;
    int _1271 = _1269 ? 0 : 1;
    float _1273 = exp2(_1207);
    int _1275 = ~_1249;
    int _1277 = _1275 + 1;
    int _1279 = _1277 + 1;
    float _1281 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1251);
    int _1283 = _1279;
    float _1285 = _1247;
    if (!_1203)
    {
        int _1287 = ~_1249;
        int _1289 = _1287 + 1;
        _1283 = _1289;
    }
    int _1291 = _1283;
    float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1295 = _1255 + _1293;
    int _1297 = abs(_1271);
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    bool _1303 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1305 = isnan(1.0);
    bool _1307 = _1303 || _1305;
    bool _1309 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1311 = _1307 || _1309;
    float _1313 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1281);
    float _1315 = float(_1297);
    float _1317 = in.m_67.x;
    float _1319 = in.m_67.y;
    float _1321 = in.m_67.z;
    float _1323 = float(_1291);
    float _1325 = 1.0 / _1301;
    bool _1327 = !_1133;
    int _1329 = _1327 ? 0 : 1;
    bool _1331 = _1313 >= 0.0;
    float _1333 = _1315 * _1323;
    int _1335 = abs(_1329);
    float _1337 = _1243 * _1243;
    float _1339 = -_1273;
    float _1341 = _1339 + 1.0;
    float _1343 = float(_1239);
    float _1345 = rsqrt(_1267);
    float _1347 = float(_1335);
    float _1349 = fma(_1247, _1247, _1337);
    bool _1351 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1359 = _1355 || _1357;
    int _1361 = _1265 ? 0 : 1;
    float _1363 = _1347 * _1343;
    float _1365 = _1359 ? _1341 : 0.0;
    float _1367 = fma(_1295, _1295, _1349);
    float _1369 = rsqrt(_1199);
    float _1371 = _1363 * (-2.0);
    float _1373 = _1333;
    if (_1331)
    {
        out.m_49.x = 0.0;
    }
    if (_1311)
    {
        float _1375 = _1365 * _1325;
        _131 = _1375;
    }
    float _1377 = _131;
    float _1379 = _1333 * (-2.0);
    if (_1331)
    {
        _1373 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1381 = _1373;
    float _1383 = fma(_1371, _1319, _1319);
    int _1385 = ~_1361;
    int _1387 = _1385 + 1;
    int _1389 = _1387 + 1;
    float _1391 = rsqrt(_1367);
    float _1393 = fma(_1201, _1379, _1201);
    float _1395 = fma(_1379, _1317, _1317);
    int _1397 = as_type<int>(_1381);
    int _1399 = _1389;
    if (_1331)
    {
        float _1401 = _1381 * 5.0;
        _1397 = as_type<int>(_1401);
    }
    int _1403 = _1397;
    bool _1405 = !_1137;
    int _1407 = _1405 ? 0 : 1;
    float _1409 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1395);
    if (!_1253)
    {
        int _1411 = ~_1361;
        int _1413 = _1411 + 1;
        _1399 = _1413;
    }
    int _1415 = _1399;
    float _1417 = fma(_1229, _1371, _1229);
    if (_1331)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4537 = as_type<float>(_1403);
        out.gl_Position.z = _4537;
    }
    float _1419 = rsqrt(_1205);
    float _1421 = fma(_1393, _1377, _1409);
    int _1423 = abs(_1407);
    float _1425 = _1243 * _1391;
    float _1427 = _1247 * _1391;
    if (_1331)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1429 = -_1425;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1209);
    float _1433 = -_1427;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1217);
    float _1437 = _1295 * _1391;
    float _1439 = _1421 * 0.15915493667125701904296875;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1443 = _1431 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1447 = _1435 + _1445;
    float _1449 = float(_1423);
    float _1451 = sqrt(_1205);
    float _1453 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1455 = -_1437;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1255);
    float _1459 = float(_1415);
    float _1461 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1453);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1465 = _1457 + _1463;
    float _1467 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1383);
    float _1469 = _1449 * _1459;
    float _1471 = _1143 + (-1.0);
    float _1473 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1461);
    float _1475 = fma(_1417, _1377, _1467);
    float _1477 = _1469 * (-2.0);
    float _1479 = _1439 * 6.283185482025146484375;
    float _1481 = sin(_1479);
    bool _1483 = _1473 >= 0.0;
    float _1485 = _1475 * 0.15915493667125701904296875;
    float _1487 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1489 = fma(_1477, _1321, _1321);
    float _1491 = -_1425;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1495 = -_1427;
    float _1497 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1499 = fma(_1487, _1477, _1487);
    float _1501 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1489);
    float _1503 = _1493 * _1493;
    float _1505 = _1439 * 6.283185482025146484375;
    float _1507 = cos(_1505);
    float _1509 = fma(_1499, _1377, _1501);
    float _1511 = fma(_1497, _1497, _1503);
    int _1513 = as_type<int>(_1493);
    if (_1483)
    {
        _1285 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1515 = _1285;
    float _1517 = -_1437;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1295);
    if (_1483)
    {
        out.m_49.x = 0.0;
    }
    float _1521 = _1485 * 6.283185482025146484375;
    float _1523 = sin(_1521);
    if (_1483)
    {
        float _1525 = _1515 * 5.0;
        _1513 = as_type<int>(_1525);
    }
    int _1527 = _1513;
    float _1529 = _1509 * 0.15915493667125701904296875;
    if (_1483)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4733 = as_type<float>(_1527);
        out.gl_Position.z = _4733;
    }
    float _1531 = _1485 * 6.283185482025146484375;
    float _1533 = cos(_1531);
    float _1535 = _1529 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    if (_1483)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1539 = -_1209;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1543 = fma(_1519, _1519, _1511);
    float _1545 = -_1217;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1549 = -_1255;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1553 = _1541 * _1541;
    float _1555 = _1097 * _1345;
    float _1557 = _1095 * _1419;
    float _1559 = sqrt(_1543);
    float _1561 = fma(_1547, _1547, _1553);
    float _1563 = _1451 * _1555;
    float _1565 = in.m_53.x;
    float _1567 = in.m_53.y;
    float _1569 = in.m_53.z;
    float _1571 = _1451 * _1557;
    float _1573 = fma(_1551, _1551, _1561);
    float _1575 = _1059 * _1369;
    float _1577 = _1481 * _1523;
    float _1579 = _1507 * _1533;
    float _1581 = rsqrt(_1573);
    float _1583 = _1451 * _1575;
    float _1585 = _1481 * _1533;
    float _1587 = fma(_1537, _1579, _1577);
    float _1589 = fma(_1537, _1577, _1579);
    float _1591 = _1391 * _1559;
    float _1593 = _1529 * 6.283185482025146484375;
    float _1595 = cos(_1593);
    float _1597 = _1507 * _1523;
    float _1599 = _1547 * _1581;
    float _1601 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1603 = _1551 * _1581;
    float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1607 = _1599 * _1605;
    float _1609 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1611 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1613 = _1541 * _1581;
    float _1615 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1617 = _1603 * _1615;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1621 = -_1607;
    float _1623 = fma(_1603, _1619, _1621);
    float _1625 = _1609 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1629 = _1613 * _1627;
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1633 = -_1617;
    float _1635 = fma(_1613, _1631, _1633);
    float _1637 = _1623 * _1623;
    float _1639 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1641 = -_1629;
    float _1643 = fma(_1599, _1639, _1641);
    float _1645 = _1601 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1647 = fma(_1635, _1635, _1637);
    float _1649 = -_1597;
    float _1651 = fma(_1537, _1585, _1649);
    float _1653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1571);
    float _1655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1563);
    float _1657 = fma(_1643, _1643, _1647);
    float _1659 = _1591 * _1625;
    float _1661 = -_1585;
    float _1663 = fma(_1537, _1597, _1661);
    float _1665 = _1591 * _1645;
    float _1667 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1669 = _1655 * _1659;
    float _1671 = rsqrt(_1657);
    float _1673 = _1653 * _1665;
    float _1675 = _1591 * _1667;
    float _1677 = -_1669;
    float _1679 = _1537 * _1677;
    float _1681 = _1595 * _1669;
    float _1683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1583);
    float _1685 = _1533 * _1595;
    float _1687 = _1523 * _1595;
    float _1689 = _1507 * _1681;
    float _1691 = _1683 * _1675;
    float _1693 = _1481 * _1681;
    float _1695 = fma(_1685, _1673, _1679);
    float _1697 = fma(_1587, _1673, _1689);
    float _1699 = fma(_1651, _1673, _1693);
    float _1701 = fma(_1687, _1691, _1695);
    float _1703 = _1623 * _1671;
    float _1705 = _1635 * _1671;
    float _1707 = _1643 * _1671;
    float _1709 = fma(_1663, _1691, _1697);
    float _1711 = _1603 * _1703;
    float _1713 = _1613 * _1705;
    float _1715 = fma(_1589, _1691, _1699);
    float _1717 = -_1711;
    float _1719 = fma(_1613, _1707, _1717);
    float _1721 = -_1713;
    float _1723 = fma(_1599, _1703, _1721);
    float _1725 = _1719 * _1709;
    float _1727 = _1723 * _1709;
    float _1729 = fma(_1705, _1701, _1725);
    float _1731 = fma(_1707, _1701, _1727);
    float _1733 = fma(_1599, _1715, _1729);
    float _1735 = fma(_1603, _1715, _1731);
    float _1737 = _1599 * _1707;
    float _1739 = _1217 + _1733;
    float _1741 = _1255 + _1735;
    float _1743 = -_1737;
    float _1745 = fma(_1603, _1705, _1743);
    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1749 = _1739 + _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1753 = _1741 + _1751;
    float _1755 = _1745 * _1709;
    float _1757 = _1749 * _1749;
    float _1759 = _1753 * _1753;
    float _1761 = fma(_1703, _1701, _1755);
    float _1763 = _1757 + _1759;
    float _1765 = fma(_1613, _1715, _1761);
    float _1767 = sqrt(_1763);
    float _1769 = _1209 + _1765;
    bool _1771 = _1767 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1773 = _1603;
    float _1775 = _1715;
    float _1777 = _1765;
    float _1779 = _1745;
    float _1781 = _1761;
    if (!_1771)
    {
        _1233 = _1759;
    }
    float _1783 = _1233;
    float _1785 = _1783;
    if (!_1771)
    {
        _1773 = _1757;
    }
    float _1787 = _1773;
    float _1789 = _1787;
    if (!_1771)
    {
        _1775 = _1739;
    }
    float _1791 = _1775;
    float _1793 = _1791;
    if (!_1771)
    {
        _1777 = _1741;
    }
    float _1795 = _1777;
    float _1797 = _1795;
    if (!_1771)
    {
        _1779 = _1769;
    }
    float _1799 = _1779;
    bool _1801 = !_1771;
    float _1803 = _1799;
    if (!_1801)
    {
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1809 = _1767 + _1807;
        float _1811 = rsqrt(_1763);
        float _1813 = _1809 * _1805;
        float _1815 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1817 = _1813 * 0.15915493667125701904296875;
        float _1819 = _1817 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = _1817 * 6.283185482025146484375;
        float _1825 = cos(_1823);
        float _1827 = fma(_1821, _1815, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1829 = _1811 * _1827;
        float _1831 = _1825 + (-1.0);
        float _1833 = _1753 * _1829;
        float _1835 = _1831 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1837 = _1749 * _1829;
        float _1839 = _1833 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1841 = fma(_1769, _1825, _1835);
        float _1843 = _1837 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1845 = _1837 * _1837;
        float _1847 = _1833 * _1833;
        _1803 = _1841;
        _1789 = _1845;
        _1785 = _1847;
        _1793 = _1843;
        _1797 = _1839;
    }
    float _1849 = _1803;
    float _1851 = _1789;
    float _1853 = _1785;
    float _1855 = _1793;
    float _1857 = _1797;
    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1861 = _1849 + _1859;
    float _1863 = fma(_1861, _1861, _1851);
    float _1865 = _1863 + _1853;
    float _1867 = sqrt(_1865);
    bool _1869 = _1867 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1871 = isnan(_1867);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1877 = _1873 || _1875;
    float _1879 = _1851;
    float _1881 = _1863;
    float _1883 = _1867;
    if (!_1877)
    {
        _1879 = 1.0;
    }
    float _1885 = _1879;
    bool _1887 = !_1877;
    float _1889 = _1885;
    if (!_1887)
    {
        bool _1891 = _1867 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1893 = isnan(_1867);
        bool _1895 = _1891 || _1893;
        bool _1897 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1899 = _1895 || _1897;
        if (!_1899)
        {
            float _1901 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1903 = _1867 + _1901;
            float _1905 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1907 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1905;
            float _1909 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1913 = 1.0 / _1907;
            float _1915 = _1903 * _1913;
            float _1917 = fma(_1915, _1911, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1889 = _1917;
            _1881 = _1911;
            _1919 = true;
        }
        else
        {
            bool _1921 = _1867 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1923 = isnan(_1867);
            bool _1925 = _1921 || _1923;
            bool _1927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1929 = _1925 || _1927;
            if (!_1929)
            {
                float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1933 = _1867 + _1931;
                float _1935 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1937 = _1935 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1939 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1941 = _1939 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1943 = 1.0 / _1937;
                float _1945 = _1933 * _1943;
                float _1947 = fma(_1945, _1941, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1889 = _1947;
                _1881 = _1941;
                _1919 = true;
            }
            else
            {
                _1889 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1919 = false;
    float _1949 = _1889;
    float _1951 = _1881;
    float _1953 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1955 = _1849 + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1959 = _1855 + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1963 = _1857 + _1961;
    float _1965 = fma(_1955, _1949, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1967 = fma(_1959, _1949, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1969 = fma(_1963, _1949, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1971 = -_1425;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1965);
    float _1975 = -_1427;
    float _1977 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1967);
    float _1979 = -_1437;
    float _1981 = fma(_1979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1969);
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1985 = _1973 + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1989 = _1977 + _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1993 = _1981 + _1991;
    float _1995 = _1985 * _1985;
    float _1997 = fma(_1989, _1989, _1995);
    float _1999 = fma(_1993, _1993, _1997);
    float _2001 = rsqrt(_1999);
    float _2003 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2005 = _1989 * _2003;
    float _2007 = _1993 * _2003;
    float _2009 = _2005 * _2005;
    float _2011 = _2007 * _2007;
    float _2013 = _2009 + _2011;
    float _2015 = sqrt(_2013);
    bool _2017 = _2015 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = _2015 + _2019;
    float _2023 = _1993;
    float _2025 = _2013;
    float _2027 = _2021;
    float _2029 = _1951;
    float _2031 = _1985;
    if (_2017)
    {
        float _2033 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2023 = _2033;
    }
    float _2035 = _2023;
    if (_2017)
    {
        float _2037 = rsqrt(_2013);
        _2025 = _2037;
    }
    float _2039 = _2025;
    float _2041 = _2039;
    if (_2017)
    {
        float _2043 = _2021 * _2035;
        _2027 = _2043;
    }
    float _2045 = _2027;
    if (_2017)
    {
        float _2047 = _2045 * 0.15915493667125701904296875;
        _2029 = _2047;
    }
    float _2049 = _2029;
    float _2051 = _2035;
    if (_2017)
    {
        float _2053 = _2049 * 6.283185482025146484375;
        float _2055 = sin(_2053);
        _2051 = _2055;
    }
    float _2057 = _2051;
    float _2059 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2061 = precise::max(0.0, _2059);
    float _2063 = _2001;
    float _2065 = _2061;
    if (_2017)
    {
        float _2067 = _2049 * 6.283185482025146484375;
        float _2069 = cos(_2067);
        _2063 = _2069;
    }
    float _2071 = _2063;
    float _2073 = -_2003;
    float _2075 = -_2061;
    float _2077 = fma(_1985, _2073, _2075);
    if (!_2017)
    {
        _2031 = _2005;
    }
    float _2079 = _2031;
    float _2081 = _2079;
    if (_2017)
    {
        float _2083 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2065 = _2083;
    }
    float _2085 = _2065;
    float _2087 = sqrt(_1999);
    float _2089 = _2057;
    float _2091 = _2085;
    if (_2017)
    {
        float _2093 = fma(_2057, _2085, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2089 = _2093;
    }
    float _2095 = _2089;
    float _2097 = _2095;
    float _2099 = _2071;
    if (_2017)
    {
        float _2101 = _2071 + (-1.0);
        _2091 = _2101;
    }
    float _2103 = _2091;
    float _2105 = _2103;
    if (_2017)
    {
        float _2107 = _2039 * _2095;
        _1781 = _2107;
    }
    float _2109 = _1781;
    if (!_2017)
    {
        _2097 = _2077;
    }
    float _2111 = _2097;
    float _2113 = _2111;
    if (_2017)
    {
        float _2115 = _2103 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1883 = _2115;
    }
    float _2117 = _1883;
    if (_2017)
    {
        float _2119 = _2005 * _2109;
        _2081 = _2119;
    }
    float _2121 = _2081;
    if (!_2017)
    {
        _2105 = _2007;
    }
    float _2123 = _2105;
    float _2125 = _2123;
    if (_2017)
    {
        float _2127 = _2007 * _2109;
        _2125 = _2127;
    }
    float _2129 = _2125;
    if (!_2017)
    {
        _2041 = _2009;
    }
    float _2131 = _2041;
    float _2133 = _2131;
    if (_2017)
    {
        float _2135 = fma(_2077, _2071, _2117);
        _2113 = _2135;
    }
    float _2137 = _2113;
    if (_2017)
    {
        float _2139 = _2121 * _2121;
        _2133 = _2139;
    }
    float _2141 = _2133;
    if (!_2017)
    {
        _2099 = _2011;
    }
    float _2143 = _2099;
    float _2145 = _2143;
    if (_2017)
    {
        float _2147 = _2129 * _2129;
        _2145 = _2147;
    }
    float _2149 = _2145;
    float _2151 = fma(_2137, _2137, _2141);
    float _2153 = _2151 + _2149;
    float _2155 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2159 = fma(_2087, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2157);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2165 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2155);
    float _2167 = rsqrt(_2153);
    float _2169 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2171 = -_2161;
    float _2173 = _2171 + 1.0;
    float _2175 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2165);
    float _2177 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2179 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2169);
    float _2181 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2183 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2185 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2177);
    float _2187 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2179);
    float _2189 = abs(_2173);
    float _2191 = log2(_2189);
    float _2193 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2195 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2185);
    float _2197 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2199 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2181);
    float _2201 = -_2193;
    float _2203 = fma(_2201, _2163, 1.0);
    float _2205 = _2167 * _2121;
    float _2207 = _2167 * _2137;
    float _2209 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2211 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2213 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2215 = _2167 * _2129;
    float _2217 = fma(_1981, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2199);
    float _2219 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2211);
    float _2221 = -_2213;
    float _2223 = fma(_2207, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2221);
    float _2225 = log2(_2203);
    float _2227 = _2217 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2229 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2219);
    float _2231 = -_2215;
    float _2233 = fma(_2231, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2223);
    float _2235 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2237 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2239 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2229);
    float _2241 = fma(_2233, -0.5, 0.5);
    float _2243 = exp2(_2235);
    float _2245 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2247 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2237);
    float _2249 = fma(_2233, 0.5, 0.5);
    float _2251 = _2207 + 1.0;
    float _2253 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2245);
    float _2255 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2247);
    float _2257 = fma(_2249, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2259 = 1.0 / _2239;
    float _2261 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2253);
    float _2263 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2265 = fma(_2249, _2257, -0.212114393711090087890625);
    float _2267 = _2225 * 0.693147182464599609375;
    float _2269 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2261);
    float _2271 = fma(_2249, _2265, 1.570728778839111328125);
    float _2273 = sqrt(_2241);
    float _2275 = -_2207;
    float _2277 = fma(_2243, _2251, _2275);
    float _2279 = fma(_2277, 0.5, 0.5);
    float _2281 = _2263 * _2259;
    float _2283 = _2269 * _2259;
    float _2285 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2287 = fma(_2281, 0.5, 0.5);
    float _2289 = fma(_2283, -0.5, 0.5);
    float _2291 = _2273 * 0.636619746685028076171875;
    float _2293 = -_2271;
    float _2295 = fma(_2291, _2293, 1.0);
    float3 _5971 = float3(_2287, _2289, _2285);
    float _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5971, float3(0.0), isnan(_5971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5971, float3(0.0), isnan(_5971)), level(0.0)).x;
    float3 _5982 = float3(_2287, _2289, _2285);
    float4 _2299 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5982, float3(0.0), isnan(_5982)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5982, float3(0.0), isnan(_5982)), level(0.0)).xyzw;
    float _2301 = _2299.x;
    float _2303 = _2299.y;
    float _2305 = _2299.z;
    float _2307 = _2299.w;
    float2 _5998 = float2(_2295, _2279);
    float3 _2311 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _2313 = _2311.x;
    float _2315 = _2311.y;
    float _2317 = _2311.z;
    float _2319 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2321 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2319);
    float _2323 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2325 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2327 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2321);
    float _2329 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2323);
    float _2331 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2333 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2329);
    float _2335 = 1.0 / _2331;
    bool _2337 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.5);
    bool _2345 = _2341 || _2343;
    float _2347 = _2197 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2349 = _2333 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2351 = fma(_2209, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2347);
    float _2353 = _2349 + _2331;
    float _2355 = exp2(_2325);
    float _2357 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2351);
    float _2359 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2357);
    float _2361 = _2191;
    if (_2345)
    {
        _2361 = 1.0;
    }
    float _2363 = _2361;
    float _2365 = _2353 * _2335;
    float _2367 = _2365 * 0.5;
    float _2369 = _2363;
    if (!_2345)
    {
        float _2371 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2375 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2373);
        float _2377 = _2371 * 0.15915493667125701904296875;
        float _2379 = _2377 * 6.283185482025146484375;
        float _2381 = cos(_2379);
        float _2383 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2385 = _2383 * 0.15915493667125701904296875;
        float _2387 = _2377 * 6.283185482025146484375;
        float _2389 = sin(_2387);
        float _2391 = 1.0 / _2381;
        float _2393 = _2385 * 6.283185482025146484375;
        float _2395 = cos(_2393);
        float _2397 = _2389 * _2391;
        float _2399 = 1.0 / _2375;
        float _2401 = _2395 * _2397;
        float _2403 = _2385 * 6.283185482025146484375;
        float _2405 = sin(_2403);
        float _2407 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2409 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2407;
        float _2411 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2413 = _2399 * _2411;
        float _2415 = 1.0 / _2401;
        float _2417 = 1.0 / _2409;
        float _2419 = _2405 * _2415;
        float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2423 = fma(_2419, _2413, _2421);
        float _2425 = _2423 * _2417;
        float _2427 = precise::clamp(_2425, 0.0, 1.0);
        _2369 = _2427;
    }
    float _2429 = _2369;
    float _2431 = -_2355;
    float _2433 = _2431 + 1.0;
    float _2435 = _2239 * 0.5;
    float _2437 = _2429 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2439 = _2429 > 0.0;
    bool _2441 = isnan(_2429);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan(0.0);
    bool _2447 = _2443 || _2445;
    float _2449 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2451 = fma(_2269, -0.5, _2435);
    float _2453 = _2437 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2455 = _2359 + _2239;
    float _2457 = _2449 * _2297;
    float _2459 = -_2449;
    float _2461 = _2459 + 1.0;
    float _2463 = _2263 + _2239;
    out.gl_Position.x = _2263;
    out.gl_Position.y = _2269;
    out.gl_Position.z = _2359;
    out.gl_Position.w = _2239;
    float _2465 = _2307 * _2457;
    float _2467 = _2317 * _2457;
    float _2469 = _2307 * _2461;
    float _2471 = _2455 * 0.5;
    float _2473 = _2463 * 0.5;
    float _2475 = fma(_2313, _2465, _2301);
    float _2477 = fma(_2315, _2465, _2303);
    float _2479 = fma(_2307, _2467, _2305);
    out.m_49.x = _2453;
    out.m_69.x = _2473;
    out.m_69.y = _2451;
    out.m_69.z = _2471;
    out.m_69.w = _2239;
    out.m_71.x = _2475;
    out.m_71.y = _2477;
    out.m_71.z = _2479;
    out.m_71.w = _2469;
    if (_2447)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2481;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

