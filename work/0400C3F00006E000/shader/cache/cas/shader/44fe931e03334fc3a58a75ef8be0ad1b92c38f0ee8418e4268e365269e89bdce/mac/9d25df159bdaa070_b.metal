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
int _86(thread const int& _7170, thread const int& _7171, constant _10& support_buffer)
{
    float _7174 = as_type<float>(support_buffer._m4);
    int _7176 = _7171 + as_type<int>(_7174);
    int _7178 = 1 + _7176;
    float _7180 = support_buffer._m5[_7178].x;
    float _7182 = abs(_7180);
    bool _7184 = _7182 == 1.0;
    if (_7184)
    {
        return _7170;
    }
    float _7186 = float(_7170);
    float _7188 = _7186 / _7182;
    int _7190 = int(_7188);
    return _7190;
}

static inline __attribute__((always_inline))
int _87(thread const int& _7220, thread const int& _7221, constant _10& support_buffer)
{
    float _7224 = as_type<float>(support_buffer._m4);
    int _7226 = _7221 + as_type<int>(_7224);
    int _7228 = 1 + _7226;
    float _7230 = support_buffer._m5[_7228].x;
    bool _7232 = _7230 == 1.0;
    if (_7232)
    {
        return _7220;
    }
    float _7234 = float(_7220);
    float _7236 = _7234 * _7230;
    int _7238 = int(_7236);
    return _7238;
}

static inline __attribute__((always_inline))
void _84(thread int& _7167, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _7167 = 0;
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
    bool _2259 = false;
    bool _857 = false;
    bool _515 = false;
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
    float _103 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    float _107 = _105;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_99)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2875 = as_type<float>(_113);
        out.gl_Position.z = _2875;
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
        _107 = _133;
    }
    float _135 = _107;
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
    int _147 = 0;
    if (_141)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2945 = as_type<float>(_151);
        out.gl_Position.z = _2945;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = in.m_53.w;
    float _155 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = in.m_46.x;
    float _175 = in.m_46.y;
    float _177 = in.m_46.z;
    float _179 = _155;
    if (!_165)
    {
        float _181 = _155 * _155;
        float _183 = _181 * 0.5;
        _103 = _183;
    }
    float _185 = _103;
    float _187 = _185;
    if (!_165)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_165;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _155 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _155);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_165;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _155 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _167, _255);
    float _263 = fma(_251, _169, _257);
    float _265 = fma(_251, _171, _259);
    float _267 = fma(_261, _153, _173);
    float _269 = fma(_263, _153, _175);
    float _271 = fma(_265, _153, _177);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
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
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _301 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = _301 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = _301 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _323;
    float _327 = 1.0 / _321;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _331 = 1.0 / _325;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _333;
    float _337 = 1.0 / _317;
    float _339 = _305 * _327;
    bool _341 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _343 = isnan(_301);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    bool _353 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _355 = isnan(_301);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _309 * _331;
    bool _367 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_301);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -_351;
    float _381 = _379 + 1.0;
    float _383 = _377 * _381;
    bool _385 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_301);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _313 * _337;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _403;
    float _407 = -_377;
    float _409 = _407 + 1.0;
    float _411 = fma(_335, _397, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _413 = fma(_401, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = fma(_405, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _417 = -_363;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = _363 * _409;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _431 = _395 * _419;
    float _433 = -_395;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = _413 * _431;
    float _443 = _415 * _431;
    float _445 = _411 * _431;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].x, _441);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].y, _443);
    float _451 = fma(_423, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _453;
    float _457 = fma(_439, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = fma(_429, _339, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _465 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].z, _445);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _467;
    float _471 = fma(_451, _425, _447);
    float _473 = fma(_455, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = fma(_461, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _477 = fma(_469, _365, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _479 = fma(_457, _425, _449);
    float _481 = fma(_463, _425, _465);
    float _483 = fma(_473, _383, _471);
    float _485 = fma(_475, _383, _479);
    float _487 = fma(_477, _383, _481);
    float _489 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[146].x, _483);
    float _491 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[146].y, _485);
    float _493 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[146].z, _487);
    bool _495 = !_329;
    float _513;
    if (!_495)
    {
        float _497 = in.m_55.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_95);
        float _519 = 1.0 / _517;
        float _521 = _129 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = in.m_53.x;
    float _527 = in.m_53.y;
    float _529 = in.m_53.z;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _533 = _523 + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _551 = 1.0 / _537;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _553;
    float _557 = 1.0 / _541;
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _561 = _491 * _527;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _565 = _523 + _563;
    float _567 = 1.0 / _545;
    float _569 = _493 * _529;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _573 = _523 + _571;
    bool _575 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _577 = isnan(_523);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = _533 * _551;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _595 = _523 + _593;
    float _597 = _489 * _525;
    float _599 = 1.0 / _549;
    float _601 = _565 * _557;
    bool _603 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _605 = isnan(_523);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _617 = _523 + _615;
    float _619 = -_585;
    float _621 = _619 + 1.0;
    bool _623 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _625 = isnan(_523);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = fma(_591, _587, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _637 = 1.0 / _555;
    float _639 = _573 * _567;
    float _641 = -_613;
    float _643 = _641 + 1.0;
    bool _645 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _647 = isnan(_523);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_633;
    float _659 = _657 + 1.0;
    float _661 = _585 * _643;
    float _663 = _617 * _599;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _669;
    float _673 = _655 * _621;
    float _675 = -_655;
    float _677 = _675 + 1.0;
    float _679 = fma(_667, _587, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _681 = fma(_671, _587, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _683 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _685 = isnan(_523);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = _595 * _637;
    bool _697 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _699 = isnan(_523);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _633 * _677;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _723 = _693 * _659;
    float _725 = -_693;
    float _727 = _725 + 1.0;
    float _729 = fma(_713, _601, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _731 = fma(_717, _601, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _733 = fma(_721, _601, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _735 = _707 * _727;
    float _737 = -_707;
    float _739 = _737 + 1.0;
    float _741 = _679 * _735;
    float _743 = _635 * _735;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _749;
    float _753 = _681 * _735;
    float _755 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[107].x, _741);
    float _757 = fma(_747, _639, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _759 = fma(_751, _639, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _765;
    float _769 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[107].y, _753);
    float _771 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[107].z, _743);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _777 = fma(_729, _723, _755);
    float _779 = fma(_763, _663, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _781 = fma(_767, _639, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _783 = fma(_775, _663, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _785 = fma(_731, _723, _769);
    float _787 = fma(_733, _723, _771);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _793 = fma(_757, _709, _777);
    float _795 = fma(_781, _709, _785);
    float _797 = fma(_759, _709, _787);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _803;
    float _807 = fma(_791, _663, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _809;
    float _813 = fma(_779, _673, _793);
    float _815 = fma(_801, _695, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _817 = fma(_805, _695, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _819 = fma(_811, _695, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _821 = fma(_783, _673, _795);
    float _823 = fma(_807, _673, _797);
    float _825 = fma(_815, _661, _813);
    float _827 = fma(_817, _661, _821);
    float _829 = fma(_819, _661, _823);
    float _831 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[112].x, _825);
    float _833 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[112].y, _827);
    float _835 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[112].z, _829);
    bool _837 = !_559;
    float _855;
    if (!_837)
    {
        float _839 = in.m_55.x;
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _843 = _839 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _847 = _845 * _841;
        float _849 = floor(_847);
        float _851 = -_849;
        float _853 = _847 + _851;
        _855 = _853;
        _857 = true;
    }
    else
    {
        float _859 = float(_95);
        float _861 = 1.0 / _859;
        float _863 = _129 * _861;
        _855 = _863;
    }
    _857 = false;
    float _865 = _855;
    int _867 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _869 = _867;
    int _871 = 0;
    int _873 = _86(_869, _871, (*spvDescriptorSet0.support_buffer));
    float _875 = in.m_55.x;
    float _877 = in.m_55.y;
    float _879 = in.m_55.z;
    float _881 = _129 + _879;
    float _883 = _881 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _885 = float(_873);
    int _887 = abs(_873);
    bool _889 = _873 == 0;
    float _891 = _883 * _885;
    float _893 = float(uint(_887));
    float _895 = trunc(_891);
    int _897 = int(_895);
    float _899 = 1.0 / _893;
    int _901 = abs(_897);
    uint _904 = uint(int(uint(_897) >> uint(31)));
    float _906 = float(uint(_901));
    int _908 = ~int(_904);
    int _910 = _908 + 1;
    int _912 = as_type<int>(_899) + (-2);
    float _914 = as_type<float>(_912) * _906;
    float _916 = trunc(_914);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    int _922 = ~int(_920);
    int _924 = _922 + 1;
    int _926 = _924 * _887;
    int _928 = _926 + _901;
    float _930 = float(uint(_928));
    float _932 = in.m_57.z;
    float _934 = as_type<float>(_912) * _930;
    float _936 = trunc(_934);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    int _942 = int(_920) + int(_940);
    float _944 = trunc(_932);
    int _946 = int(_944);
    int _948 = ~_942;
    int _950 = _948 + 1;
    int _952 = _950 * _887;
    int _954 = _952 + _901;
    bool _956 = uint(_954) >= uint(_887);
    bool _958 = !_956;
    int _960 = _958 ? 0 : (-1);
    int _962 = ~_942;
    int _964 = _962 + _960;
    int _966 = _964 + 1;
    int _968 = _966 * _887;
    int _970 = _968 + _901;
    int _972 = _970 ^ _910;
    int _974 = ~_910;
    int _976 = _974 + _972;
    int _978 = _976 + 1;
    bool _980 = !_889;
    int _982 = _980 ? _978 : (-1);
    int _984 = _982;
    int _986 = 0;
    int _988 = _87(_984, _986, (*spvDescriptorSet0.support_buffer));
    int _990 = _946;
    int _992 = 0;
    int _994 = _87(_990, _992, (*spvDescriptorSet0.support_buffer));
    float4 _997 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_988, _994)), 0).xyzw;
    float _999 = _997.x;
    float _1001 = _997.y;
    float _1003 = _997.z;
    float _1005 = _997.w;
    float _1007 = _875 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1009 = in.m_57.y;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1013 = _1011 != 0;
    float _1015 = _877 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1019 = _831 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1025 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1017);
    float _1027 = in.m_57.x;
    float _1029 = 1.0 / _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1035 = 0.0;
    float _1037 = _1009;
    float _1039 = _1027;
    if (_1013)
    {
        float _1041 = in.m_55.x;
        _1035 = _1041;
    }
    float _1043 = _1035;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1051 = _1049 != 0;
    float _1053 = 1.0 / _1033;
    float _1055 = -_1045;
    float _1057 = fma(_1007, 2.0, _1055);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1061 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1047);
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1063;
    bool _1067 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1069 = isnan(_865);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1075 = _1071 || _1073;
    float _1077 = float(_1075);
    float _1079 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1025);
    float _1081 = fma(_1015, -2.0, _1059);
    float _1083 = _1065 * _1029;
    bool _1085 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1087 = isnan(_865);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = -_1077;
    float _1099 = _1097 + 1.0;
    bool _1101 = _877 > 0.5;
    bool _1103 = _1101 && _1051;
    float _1105 = _1079 * (-0.15915493667125701904296875);
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1113 = _1095 * _1099;
    float _1115 = -_1095;
    float _1117 = _1115 + 1.0;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1121 = _865 + _1119;
    float _1123 = _1111 * _1053;
    bool _1125 = _1043 > 0.5;
    bool _1127 = _1125 && _1013;
    float _1129 = -_129;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1057);
    float _1133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1135 = _1053;
    if (_1013)
    {
        _1135 = _1027;
    }
    float _1137 = _1135;
    float _1139 = fma(_1083, _1121, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1141 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1143 = isnan(_865);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1155 = _865 + _1153;
    float _1157 = _1137;
    if (_1103)
    {
        float _1159 = -_1009;
        float _1161 = _1159 + 1.0;
        _1037 = _1161;
    }
    float _1163 = _1037;
    int _1165 = _982 + 1;
    float _1167 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1081);
    float _1169 = _1105 * 6.283185482025146484375;
    float _1171 = sin(_1169);
    float _1173 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1175 = _1151 * _1117;
    if (_1127)
    {
        float _1177 = -_1137;
        float _1179 = _1177 + 1.0;
        _1157 = _1179;
    }
    float _1181 = _1157;
    float _1183 = -_1151;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_1123, _1155, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1189 = _1139 * _1175;
    float _1191 = _1105 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1013)
    {
        _1039 = _1181;
    }
    float _1197 = _1039;
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1189);
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1203 = fma(_1195, _1163, -0.5);
    float _1205 = fma(_1173, _1197, -0.5);
    float _1207 = fma(_1187, _1113, _1199);
    float _1209 = _1171 * _1203;
    float _1211 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1201);
    float _1213 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1215 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1061);
    float _1217 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1211);
    float _1219 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1193 * _1203;
    float _1223 = -_1209;
    float _1225 = fma(_1193, _1205, _1223);
    float _1227 = fma(_1171, _1205, _1221);
    float _1229 = _835 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1231 = abs(_1165);
    float _1233 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1207);
    float _1235 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1239 = float(uint(_1231));
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1243 = uint(int(uint(_1165) >> uint(31)));
    float _1245 = fma(_1215, _1225, _1131);
    float _1247 = -_1167;
    float _1249 = fma(_1217, _1227, _1247);
    float _1251 = as_type<float>(_912) * _1239;
    out.m_59.x = _1235;
    out.m_59.y = _1219;
    out.m_59.z = _1237;
    out.m_59.w = _1241;
    int _1253 = ~int(_1243);
    int _1255 = _1253 + 1;
    float _1257 = trunc(_1251);
    float _1259 = precise::max(_1257, 0.0);
    uint _1261 = uint(_1259);
    int _1263 = ~int(_1261);
    int _1265 = _1263 + 1;
    int _1267 = _1265 * _887;
    int _1269 = _1267 + _1231;
    float _1271 = float(uint(_1269));
    float _1273 = as_type<float>(_912) * _1271;
    float _1275 = _1245 + 0.5;
    float _1277 = trunc(_1273);
    float _1279 = precise::max(_1277, 0.0);
    uint _1281 = uint(_1279);
    int _1283 = int(_1261) + int(_1281);
    int _1285 = ~_1283;
    int _1287 = _1285 + 1;
    int _1289 = _1287 * _887;
    int _1291 = _1289 + _1231;
    bool _1293 = uint(_1291) >= uint(_887);
    bool _1295 = !_1293;
    int _1297 = _1295 ? 0 : (-1);
    int _1299 = ~_1283;
    int _1301 = _1299 + _1297;
    int _1303 = _1301 + 1;
    int _1305 = _1303 * _887;
    int _1307 = _1305 + _1231;
    float _1309 = _1249 + 0.5;
    int _1311 = _1307 ^ _1255;
    int _1313 = ~_1255;
    int _1315 = _1313 + _1311;
    int _1317 = _1315 + 1;
    bool _1319 = !_889;
    int _1321 = _1319 ? _1317 : (-1);
    uint _1323 = as_type<uint>(half2(float2(_1005, 0.0)));
    uint _1325 = extract_bits(_1323, 0u, 8u);
    int _1327 = int(_1325) & 255;
    uint _1329 = extract_bits(_1323, 8u, 8u);
    int _1331 = int(_1329) & 255;
    int _1333 = _1331 << 8;
    int _1335 = _1327 | _1333;
    bool _1337 = _1335 >= 32768;
    int _1339 = _1335 + (-1024);
    int _1341 = _1339;
    if (_1337)
    {
        int _1343 = ~_1335;
        int _1345 = _1343 + 33792;
        int _1347 = _1345 + 1;
        _1341 = _1347;
    }
    int _1349 = _1341;
    int _1351 = _1349 + 30719;
    float _1353 = float(_1351);
    float _1355 = fma(_1353, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1357 = abs(_1355);
    float _1359 = -_1357;
    float _1361 = _1359 + 1.0;
    int _1363 = as_type<int>(_1361) + (-218103808);
    bool _1365 = uint(_1363) >= 1920991232u;
    bool _1367 = !_1365;
    if (!_1367)
    {
        int _1369;
        _84(_1369, out.gl_Position, out.gl_PointSize);
    }
    int _1371 = _1321;
    int _1373 = 0;
    int _1375 = _87(_1371, _1373, (*spvDescriptorSet0.support_buffer));
    int _1377 = _946;
    int _1379 = 0;
    int _1381 = _87(_1377, _1379, (*spvDescriptorSet0.support_buffer));
    float4 _1383 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1375, _1381)), 0).xyzw;
    float _1385 = _1383.x;
    float _1387 = _1383.y;
    float _1389 = _1383.z;
    float _1391 = _1383.w;
    float _1393 = floor(_891);
    float _1395 = -_1393;
    float _1397 = _891 + _1395;
    uint _1399 = as_type<uint>(half2(float2(_1391, 0.0)));
    float _1401 = -_1003;
    float _1403 = _1401 + _1389;
    uint _1405 = extract_bits(_1399, 0u, 8u);
    int _1407 = int(_1405) & 255;
    uint _1409 = extract_bits(_1399, 8u, 8u);
    int _1411 = int(_1409) & 255;
    int _1413 = _1411 << 8;
    int _1415 = _1407 | _1413;
    bool _1417 = _1415 >= 32768;
    int _1419 = _1415 + (-1024);
    int _1421 = _1419;
    if (_1417)
    {
        int _1423 = ~_1415;
        int _1425 = _1423 + 33792;
        int _1427 = _1425 + 1;
        _1421 = _1427;
    }
    int _1429 = _1421;
    int _1431 = _1429 + 30719;
    float _1433 = float(_1431);
    float _1435 = fma(_1433, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1437 = -_999;
    float _1439 = _1437 + _1385;
    float _1441 = fma(_1397, _1403, _1003);
    float _1443 = abs(_1435);
    float _1445 = -_1443;
    float _1447 = _1445 + 1.0;
    float _1449 = fma(_1397, _1439, _999);
    int _1451 = as_type<int>(_1447) + (-218103808);
    bool _1453 = uint(_1451) >= 1920991232u;
    float _1455 = -_1001;
    float _1457 = _1455 + _1387;
    float _1459 = fma(_1397, _1457, _1001);
    bool _1461 = !_1453;
    if (!_1461)
    {
        int _1463;
        _84(_1463, out.gl_Position, out.gl_PointSize);
    }
    float _1465 = in.m_55.x;
    float _1467 = in.m_55.y;
    float _1469 = in.m_55.z;
    float _1471 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1473 = log2(_1471);
    float _1475 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1477 = in.m_61.w;
    float _1479 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1483 = _1481 != 0;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1487 = _1485 != 0;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1491 = _1489 != 0;
    float _1493 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_63.x = _1275;
    out.m_63.y = _1309;
    float _1495 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1475);
    float _1497 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1479);
    float _1499 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1493);
    float _1501 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1497);
    float _1503 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1499);
    float _1505 = _1473 * _129;
    float _1507 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1509 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1495);
    float _1511 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1513 = exp2(_1505);
    float _1515 = _1501 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1517 = _1469 * 2.0;
    float _1519 = _1465 * 2.0;
    float _1521 = _1467 + _1465;
    float _1523 = _1467 + _1469;
    out.m_65.w = _1477;
    bool _1525 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1527 = isnan(0.0);
    bool _1529 = _1525 || _1527;
    bool _1531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1533 = _1529 || _1531;
    float _1535 = floor(_1517);
    float _1537 = _1521 + (-1.0);
    float _1539 = _1523 + (-1.0);
    float _1541 = _1509 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1543 = _1467 * 2.0;
    float _1545 = -_1513;
    float _1547 = _1545 + 1.0;
    float _1549 = floor(_1519);
    float _1551 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1555 = _1515 + _1553;
    float _1557 = _1533 ? _1547 : 0.0;
    float _1559 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1507);
    float _1561 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1511);
    float _1563 = floor(_1543);
    bool _1565 = _1535 > 0.0;
    float _1567 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1569 = _1535 >= 0.0;
    bool _1571 = isnan(_1535);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.0);
    bool _1577 = _1573 || _1575;
    float _1579 = _1503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1583 = _1541 + _1581;
    int _1585 = _1577 ? 0 : 1;
    float _1587 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1567);
    bool _1589 = _1549 > 0.0;
    float _1591 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1593 = ~_1585;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1601 = _1579 + _1599;
    bool _1603 = _1549 >= 0.0;
    bool _1605 = isnan(_1549);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan(0.0);
    bool _1611 = _1607 || _1609;
    float _1613 = _1555 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1615 = _1597;
    if (!_1565)
    {
        int _1617 = ~_1585;
        int _1619 = _1617 + 1;
        _1615 = _1619;
    }
    int _1621 = _1615;
    float _1623 = _1555 * _1555;
    bool _1625 = _1563 > 0.0;
    bool _1627 = _1563 >= 0.0;
    bool _1629 = isnan(_1563);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.0);
    bool _1635 = _1631 || _1633;
    float _1637 = fma(_1583, _1583, _1623);
    bool _1639 = !_1483;
    int _1641 = _1639 ? 0 : 1;
    float _1643 = fma(_1601, _1601, _1637);
    bool _1645 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1647 = isnan(1.0);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1653 = _1649 || _1651;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1657 = 1.0 + _1655;
    float _1659 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1613);
    float _1661 = 1.0 / _1657;
    float _1663 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1659);
    float _1665 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1561);
    int _1667 = abs(_1641);
    float _1669 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1587);
    int _1671 = _1611 ? 0 : 1;
    float _1673 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1559);
    bool _1675 = _1663 >= 0.0;
    float _1677 = in.m_67.x;
    float _1679 = in.m_67.y;
    float _1681 = in.m_67.z;
    float _1683 = rsqrt(_1665);
    bool _1685 = !_1487;
    int _1687 = _1685 ? 0 : 1;
    float _1689 = float(_1667);
    float _1691 = _1661;
    if (_1653)
    {
        float _1693 = _1557 * _1661;
        _131 = _1693;
    }
    float _1695 = _131;
    float _1697 = float(_1621);
    int _1699 = abs(_1687);
    float _1701 = rsqrt(_1669);
    int _1703 = ~_1671;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    float _1709 = _1689 * _1697;
    int _1711 = _1707;
    int _1713 = as_type<int>(_1709);
    if (_1675)
    {
        _1691 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1715 = _1691;
    if (_1675)
    {
        out.m_49.x = 0.0;
    }
    if (!_1589)
    {
        int _1717 = ~_1671;
        int _1719 = _1717 + 1;
        _1711 = _1719;
    }
    int _1721 = _1711;
    float _1723 = _1709 * (-2.0);
    float _1725 = rsqrt(_1643);
    if (_1675)
    {
        float _1727 = _1715 * 5.0;
        _1713 = as_type<int>(_1727);
    }
    int _1729 = _1713;
    int _1731 = _1635 ? 0 : 1;
    float _1733 = fma(_1591, _1723, _1591);
    float _1735 = float(_1699);
    float _1737 = fma(_1723, _1677, _1677);
    float _1739 = float(_1721);
    if (_1675)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5396 = as_type<float>(_1729);
        out.gl_Position.z = _5396;
    }
    int _1741 = ~_1731;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    int _1747 = _1745;
    if (!_1625)
    {
        int _1749 = ~_1731;
        int _1751 = _1749 + 1;
        _1747 = _1751;
    }
    int _1753 = _1747;
    float _1755 = _1735 * _1739;
    float _1757 = _1465 + (-0.5);
    bool _1759 = !_1491;
    int _1761 = _1759 ? 0 : 1;
    float _1763 = _1555 * _1725;
    float _1765 = _1583 * _1725;
    if (_1675)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1767 = -_1763;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1515);
    float _1771 = _1755 * (-2.0);
    float _1773 = -_1765;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1541);
    float _1777 = _1601 * _1725;
    float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1781 = _1769 + _1779;
    float _1783 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1737);
    float _1785 = fma(_1551, _1771, _1551);
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1789 = _1775 + _1787;
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1793 = fma(_1771, _1679, _1679);
    float _1795 = -_1777;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1579);
    float _1799 = fma(_1733, _1695, _1783);
    int _1801 = abs(_1761);
    float _1803 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1791);
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1807 = _1797 + _1805;
    float _1809 = _1799 * 0.15915493667125701904296875;
    float _1811 = _1467 + (-0.5);
    float _1813 = float(_1801);
    float _1815 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1803);
    float _1817 = float(_1753);
    float _1819 = _1469 + _1465;
    float _1821 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1793);
    float _1823 = _1469 + (-0.5);
    bool _1825 = _1815 >= 0.0;
    float _1827 = _1813 * _1817;
    float _1829 = _1819 + (-1.0);
    float _1831 = fma(_1785, _1695, _1821);
    float _1833 = _1827 * (-2.0);
    float _1835 = rsqrt(_1673);
    float _1837 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1839 = _1831 * 0.15915493667125701904296875;
    float _1841 = fma(_1833, _1681, _1681);
    float _1843 = -_1763;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1555);
    float _1847 = fma(_1837, _1833, _1837);
    float _1849 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1841);
    float _1851 = sqrt(_1673);
    float _1853 = as_type<float>(_1801);
    int _1855 = as_type<int>(_1823);
    if (_1825)
    {
        _1853 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1857 = _1853;
    float _1859 = fma(_1847, _1695, _1849);
    if (_1825)
    {
        out.m_49.x = 0.0;
    }
    if (_1825)
    {
        float _1861 = _1857 * 5.0;
        _1855 = as_type<int>(_1861);
    }
    int _1863 = _1855;
    float _1865 = _1809 * 6.283185482025146484375;
    float _1867 = sin(_1865);
    if (_1825)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5612 = as_type<float>(_1863);
        out.gl_Position.z = _5612;
    }
    float _1869 = _1809 * 6.283185482025146484375;
    float _1871 = cos(_1869);
    float _1873 = _1839 * 6.283185482025146484375;
    float _1875 = sin(_1873);
    float _1877 = _1839 * 6.283185482025146484375;
    float _1879 = cos(_1877);
    if (_1825)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1881 = -_1515;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1885 = -_1765;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1583);
    float _1889 = _1859 * 0.15915493667125701904296875;
    float _1891 = -_1541;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1895 = _1883 * _1883;
    float _1897 = _1845 * _1845;
    float _1899 = -_1579;
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1903 = _1889 * 6.283185482025146484375;
    float _1905 = sin(_1903);
    float _1907 = fma(_1893, _1893, _1895);
    float _1909 = fma(_1887, _1887, _1897);
    float _1911 = -_1777;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1601);
    float _1915 = _1459 * _1683;
    float _1917 = fma(_1901, _1901, _1907);
    float _1919 = _1867 * _1875;
    float _1921 = fma(_1913, _1913, _1909);
    float _1923 = _1871 * _1879;
    float _1925 = _1449 * _1835;
    float _1927 = _1851 * _1915;
    float _1929 = rsqrt(_1917);
    float _1931 = _1441 * _1701;
    float _1933 = _1851 * _1925;
    float _1935 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1937 = _569 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1939 = fma(_1905, _1923, _1919);
    float _1941 = fma(_1905, _1919, _1923);
    float _1943 = _1851 * _1931;
    float _1945 = sqrt(_1921);
    float _1947 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1949 = _1871 * _1875;
    float _1951 = _1893 * _1929;
    float _1953 = _1901 * _1929;
    float _1955 = _1883 * _1929;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1959 = _1951 * _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1963 = _1953 * _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1967 = -_1959;
    float _1969 = fma(_1953, _1965, _1967);
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1973 = _1955 * _1971;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1977 = -_1963;
    float _1979 = fma(_1955, _1975, _1977);
    float _1981 = _1725 * _1945;
    float _1983 = _1969 * _1969;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1987 = -_1973;
    float _1989 = fma(_1951, _1985, _1987);
    float _1991 = _1889 * 6.283185482025146484375;
    float _1993 = cos(_1991);
    float _1995 = fma(_1979, _1979, _1983);
    float _1997 = _1981 * _1935;
    float _1999 = _1981 * _1937;
    float _2001 = _1981 * _1947;
    float _2003 = fma(_1989, _1989, _1995);
    float _2005 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1927);
    float _2007 = _1867 * _1879;
    float _2009 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1933);
    float _2011 = _1997 * _2005;
    float _2013 = rsqrt(_2003);
    float _2015 = -_1949;
    float _2017 = fma(_1905, _2007, _2015);
    float _2019 = _2001 * _2009;
    float _2021 = -_2011;
    float _2023 = _1905 * _2021;
    float _2025 = _1993 * _2011;
    float _2027 = -_2007;
    float _2029 = fma(_1905, _1949, _2027);
    float _2031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1943);
    float _2033 = _1879 * _1993;
    float _2035 = _1871 * _2025;
    float _2037 = _1875 * _1993;
    float _2039 = _1999 * _2031;
    float _2041 = _1867 * _2025;
    float _2043 = fma(_1939, _2019, _2035);
    float _2045 = fma(_2033, _2019, _2023);
    float _2047 = fma(_2017, _2019, _2041);
    float _2049 = _1969 * _2013;
    float _2051 = _1979 * _2013;
    float _2053 = _1989 * _2013;
    float _2055 = fma(_2029, _2039, _2043);
    float _2057 = _1953 * _2049;
    float _2059 = _1955 * _2051;
    float _2061 = fma(_2037, _2039, _2045);
    float _2063 = fma(_1941, _2039, _2047);
    float _2065 = -_2057;
    float _2067 = fma(_1955, _2053, _2065);
    float _2069 = -_2059;
    float _2071 = fma(_1951, _2049, _2069);
    float _2073 = _2067 * _2055;
    float _2075 = _2071 * _2055;
    float _2077 = fma(_2051, _2061, _2073);
    float _2079 = fma(_2053, _2061, _2075);
    float _2081 = _1951 * _2053;
    float _2083 = fma(_1951, _2063, _2077);
    float _2085 = fma(_1953, _2063, _2079);
    float _2087 = -_2081;
    float _2089 = fma(_1953, _2051, _2087);
    float _2091 = _1541 + _2083;
    float _2093 = _1579 + _2085;
    float _2095 = _2089 * _2055;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2099 = _2091 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2103 = _2093 + _2101;
    float _2105 = fma(_2049, _2061, _2095);
    float _2107 = _2099 * _2099;
    float _2109 = _2103 * _2103;
    float _2111 = fma(_1955, _2063, _2105);
    float _2113 = _2107 + _2109;
    float _2115 = _1515 + _2111;
    float _2117 = sqrt(_2113);
    bool _2119 = _2117 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2121 = _2049;
    float _2123 = _1951;
    float _2125 = _1953;
    float _2127 = _2109;
    float _2129 = _2091;
    float _2131 = _2107;
    if (!_2119)
    {
        _2121 = _2107;
    }
    float _2133 = _2121;
    float _2135 = _2133;
    if (!_2119)
    {
        _2123 = _2093;
    }
    float _2137 = _2123;
    float _2139 = _2137;
    if (!_2119)
    {
        _2125 = _2115;
    }
    float _2141 = _2125;
    bool _2143 = !_2119;
    float _2145 = _2141;
    if (!_2143)
    {
        float _2147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2151 = _2117 + _2149;
        float _2153 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2155 = rsqrt(_2113);
        float _2157 = _2151 * _2147;
        float _2159 = _2157 * 0.15915493667125701904296875;
        float _2161 = _2159 * 6.283185482025146484375;
        float _2163 = sin(_2161);
        float _2165 = _2159 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        float _2169 = fma(_2163, _2153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2171 = _2155 * _2169;
        float _2173 = _2167 + (-1.0);
        float _2175 = _2103 * _2171;
        float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2179 = _2099 * _2171;
        float _2181 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2183 = _2175 * _2175;
        float _2185 = fma(_2115, _2167, _2177);
        float _2187 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2189 = _2179 * _2179;
        _2145 = _2185;
        _2135 = _2189;
        _2127 = _2183;
        _2129 = _2187;
        _2139 = _2181;
    }
    float _2191 = _2145;
    float _2193 = _2135;
    float _2195 = _2127;
    float _2197 = _2129;
    float _2199 = _2139;
    float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2203 = _2191 + _2201;
    float _2205 = fma(_2203, _2203, _2193);
    float _2207 = _2205 + _2195;
    float _2209 = sqrt(_2207);
    bool _2211 = _2209 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2213 = isnan(_2209);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2219 = _2215 || _2217;
    float _2221 = _2205;
    float _2223 = _2209;
    if (!_2219)
    {
        _2221 = 1.0;
    }
    float _2225 = _2221;
    bool _2227 = !_2219;
    float _2229 = _2225;
    if (!_2227)
    {
        bool _2231 = _2209 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2233 = isnan(_2209);
        bool _2235 = _2231 || _2233;
        bool _2237 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2239 = _2235 || _2237;
        if (!_2239)
        {
            float _2241 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2243 = _2209 + _2241;
            float _2245 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2247 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2245;
            float _2249 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2251 = _2249 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2253 = 1.0 / _2247;
            float _2255 = _2243 * _2253;
            float _2257 = fma(_2255, _2251, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2229 = _2257;
            _2259 = true;
        }
        else
        {
            bool _2261 = _2209 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2263 = isnan(_2209);
            bool _2265 = _2261 || _2263;
            bool _2267 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2269 = _2265 || _2267;
            if (!_2269)
            {
                float _2271 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2273 = _2209 + _2271;
                float _2275 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2277 = _2275 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2279 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2281 = _2279 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2283 = 1.0 / _2277;
                float _2285 = _2273 * _2283;
                float _2287 = fma(_2285, _2281, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2229 = _2287;
                _2259 = true;
            }
            else
            {
                _2229 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2259 = false;
    float _2289 = _2229;
    float _2291 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2293 = _2191 + _2291;
    float _2295 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2297 = _2197 + _2295;
    float _2299 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2301 = _2199 + _2299;
    float _2303 = fma(_2293, _2289, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2305 = fma(_2297, _2289, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2307 = fma(_2301, _2289, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2309 = -_1763;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2303);
    float _2313 = -_1765;
    float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2305);
    float _2317 = -_1777;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2307);
    float _2321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2323 = _2311 + _2321;
    float _2325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2327 = _2315 + _2325;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2331 = _2319 + _2329;
    float _2333 = _2323 * _2323;
    float _2335 = fma(_2327, _2327, _2333);
    float _2337 = fma(_2331, _2331, _2335);
    float _2339 = rsqrt(_2337);
    float _2341 = sqrt(_2337);
    float _2343 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2345 = _2327 * _2343;
    float _2347 = _2331 * _2343;
    float _2349 = _2345 * _2345;
    float _2351 = _2347 * _2347;
    float _2353 = _2349 + _2351;
    float _2355 = sqrt(_2353);
    bool _2357 = _2355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2361 = _2355 + _2359;
    float _2363 = _2331;
    float _2365 = _2353;
    float _2367 = _2361;
    float _2369 = _2323;
    if (_2357)
    {
        float _2371 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2363 = _2371;
    }
    float _2373 = _2363;
    if (_2357)
    {
        float _2375 = rsqrt(_2353);
        _2365 = _2375;
    }
    float _2377 = _2365;
    float _2379 = _2377;
    if (_2357)
    {
        float _2381 = _2361 * _2373;
        _2367 = _2381;
    }
    float _2383 = _2367;
    if (_2357)
    {
        float _2385 = _2383 * 0.15915493667125701904296875;
        _2223 = _2385;
    }
    float _2387 = _2223;
    float _2389 = _2373;
    float _2391 = _2387;
    if (_2357)
    {
        float _2393 = _2387 * 6.283185482025146484375;
        float _2395 = sin(_2393);
        _2389 = _2395;
    }
    float _2397 = _2389;
    float _2399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2401 = precise::max(0.0, _2399);
    float _2403 = _2333;
    float _2405 = _2401;
    if (_2357)
    {
        float _2407 = _2387 * 6.283185482025146484375;
        float _2409 = cos(_2407);
        _2403 = _2409;
    }
    float _2411 = _2403;
    float _2413 = -_2343;
    float _2415 = -_2401;
    float _2417 = fma(_2323, _2413, _2415);
    if (!_2357)
    {
        _2369 = _2345;
    }
    float _2419 = _2369;
    float _2421 = _2419;
    if (_2357)
    {
        float _2423 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2405 = _2423;
    }
    float _2425 = _2405;
    float _2427 = _2397;
    float _2429 = _2425;
    if (_2357)
    {
        float _2431 = fma(_2397, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2427 = _2431;
    }
    float _2433 = _2427;
    float _2435 = _2433;
    float _2437 = _2411;
    if (_2357)
    {
        float _2439 = _2411 + (-1.0);
        _2429 = _2439;
    }
    float _2441 = _2429;
    float _2443 = _2441;
    if (_2357)
    {
        float _2445 = _2377 * _2433;
        _2131 = _2445;
    }
    float _2447 = _2131;
    if (!_2357)
    {
        _2435 = _2417;
    }
    float _2449 = _2435;
    float _2451 = _2449;
    if (_2357)
    {
        float _2453 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2391 = _2453;
    }
    float _2455 = _2391;
    if (_2357)
    {
        float _2457 = _2345 * _2447;
        _2421 = _2457;
    }
    float _2459 = _2421;
    if (!_2357)
    {
        _2443 = _2347;
    }
    float _2461 = _2443;
    float _2463 = _2461;
    if (_2357)
    {
        float _2465 = _2347 * _2447;
        _2463 = _2465;
    }
    float _2467 = _2463;
    if (!_2357)
    {
        _2379 = _2349;
    }
    float _2469 = _2379;
    float _2471 = _2469;
    if (_2357)
    {
        float _2473 = fma(_2417, _2411, _2455);
        _2451 = _2473;
    }
    float _2475 = _2451;
    if (_2357)
    {
        float _2477 = _2459 * _2459;
        _2471 = _2477;
    }
    float _2479 = _2471;
    if (!_2357)
    {
        _2437 = _2351;
    }
    float _2481 = _2437;
    float _2483 = _2481;
    if (_2357)
    {
        float _2485 = _2467 * _2467;
        _2483 = _2485;
    }
    float _2487 = _2483;
    float _2489 = fma(_2475, _2475, _2479);
    float _2491 = _2489 + _2487;
    float _2493 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2497 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2495);
    float _2499 = precise::clamp(_2497, 0.0, 1.0);
    float _2501 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2503 = rsqrt(_2491);
    float _2505 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2493);
    float _2507 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2509 = -_2499;
    float _2511 = _2509 + 1.0;
    float _2513 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2501);
    float _2515 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2505);
    float _2517 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2519 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2521 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2513);
    float _2523 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2525 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2507);
    float _2527 = abs(_2511);
    float _2529 = log2(_2527);
    float _2531 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2533 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2535 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2525);
    float _2537 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2519);
    float _2539 = _2503 * _2475;
    float _2541 = -_2533;
    float _2543 = fma(_2541, _2517, 1.0);
    float _2545 = _2535 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2547 = _2503 * _2459;
    float _2549 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2551 = _2503 * _2467;
    float _2553 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2537);
    float _2555 = _2547 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2557 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2549);
    float _2559 = log2(_2543);
    float _2561 = _2553 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2563 = -_2555;
    float _2565 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2563);
    float _2567 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2569 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2557);
    float _2571 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2573 = -_2551;
    float _2575 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2565);
    float _2577 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2579 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2569);
    float _2581 = exp2(_2567);
    float _2583 = fma(_2575, -0.5, 0.5);
    float _2585 = fma(_2575, 0.5, 0.5);
    float _2587 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2577);
    float _2589 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2571);
    float _2591 = _2539 + 1.0;
    float _2593 = fma(_2585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2595 = 1.0 / _2579;
    float _2597 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2587);
    float _2599 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2589);
    float _2601 = fma(_2585, _2593, -0.212114393711090087890625);
    float _2603 = _2559 * 0.693147182464599609375;
    float _2605 = fma(_2585, _2601, 1.570728778839111328125);
    float _2607 = sqrt(_2583);
    float _2609 = -_2539;
    float _2611 = fma(_2581, _2591, _2609);
    float _2613 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2597);
    float _2615 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2599);
    float _2617 = fma(_2611, 0.5, 0.5);
    float _2619 = _2613 * _2595;
    float _2621 = _2615 * _2595;
    float _2623 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2625 = fma(_2619, 0.5, 0.5);
    float _2627 = fma(_2621, -0.5, 0.5);
    float _2629 = _2607 * 0.636619746685028076171875;
    float _2631 = -_2605;
    float _2633 = fma(_2629, _2631, 1.0);
    float3 _6845 = float3(_2625, _2627, _2623);
    float _2635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6845, float3(0.0), isnan(_6845)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6845, float3(0.0), isnan(_6845)), level(0.0)).x;
    float3 _6856 = float3(_2625, _2627, _2623);
    float4 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6856, float3(0.0), isnan(_6856)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6856, float3(0.0), isnan(_6856)), level(0.0)).xyzw;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _2637.w;
    float2 _6872 = float2(_2633, _2617);
    float3 _2649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6872, float2(0.0), isnan(_6872)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6872, float2(0.0), isnan(_6872)), level(0.0)).xyz;
    float _2651 = _2649.x;
    float _2653 = _2649.y;
    float _2655 = _2649.z;
    float _2657 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2659 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2661 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2657);
    float _2663 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2659);
    float _2665 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2661);
    float _2667 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2663);
    float _2669 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2671 = _2665 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2673 = _2667 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2675 = 1.0 / _2671;
    bool _2677 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan(0.5);
    bool _2685 = _2681 || _2683;
    float _2687 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2689 = _2673 + _2671;
    float _2691 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2687);
    float _2693 = exp2(_2669);
    float _2695 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2691);
    float _2697 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2695);
    float _2699 = _2529;
    if (_2685)
    {
        _2699 = 1.0;
    }
    float _2701 = _2699;
    float _2703 = _2689 * _2675;
    float _2705 = _2703 * 0.5;
    float _2707 = _2701;
    if (!_2685)
    {
        float _2709 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2711 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2713 = fma(_2705, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2711);
        float _2715 = _2709 * 0.15915493667125701904296875;
        float _2717 = _2715 * 6.283185482025146484375;
        float _2719 = cos(_2717);
        float _2721 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2723 = _2721 * 0.15915493667125701904296875;
        float _2725 = _2715 * 6.283185482025146484375;
        float _2727 = sin(_2725);
        float _2729 = 1.0 / _2719;
        float _2731 = _2723 * 6.283185482025146484375;
        float _2733 = cos(_2731);
        float _2735 = _2727 * _2729;
        float _2737 = 1.0 / _2713;
        float _2739 = _2733 * _2735;
        float _2741 = _2723 * 6.283185482025146484375;
        float _2743 = sin(_2741);
        float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2747 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2745;
        float _2749 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2751 = _2737 * _2749;
        float _2753 = 1.0 / _2739;
        float _2755 = 1.0 / _2747;
        float _2757 = _2743 * _2753;
        float _2759 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2761 = fma(_2757, _2751, _2759);
        float _2763 = _2761 * _2755;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        _2707 = _2765;
    }
    float _2767 = _2707;
    float _2769 = -_2693;
    float _2771 = _2769 + 1.0;
    float _2773 = _2579 * 0.5;
    float _2775 = _2767 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2777 = _2767 > 0.0;
    bool _2779 = isnan(_2767);
    bool _2781 = _2777 || _2779;
    bool _2783 = isnan(0.0);
    bool _2785 = _2781 || _2783;
    float _2787 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2789 = fma(_2615, -0.5, _2773);
    float _2791 = _2775 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2793 = _2697 + _2579;
    float _2795 = _2787 * _2635;
    float _2797 = -_2787;
    float _2799 = _2797 + 1.0;
    float _2801 = _2613 + _2579;
    out.gl_Position.x = _2613;
    out.gl_Position.y = _2615;
    out.gl_Position.z = _2697;
    out.gl_Position.w = _2579;
    float _2803 = _2645 * _2795;
    float _2805 = _2655 * _2795;
    float _2807 = _2645 * _2799;
    float _2809 = _2793 * 0.5;
    float _2811 = _2801 * 0.5;
    float _2813 = fma(_2651, _2803, _2639);
    float _2815 = fma(_2653, _2803, _2641);
    float _2817 = fma(_2645, _2805, _2643);
    out.m_49.x = _2791;
    out.m_69.x = _2811;
    out.m_69.y = _2789;
    out.m_69.z = _2809;
    out.m_69.w = _2579;
    out.m_71.x = _2813;
    out.m_71.y = _2815;
    out.m_71.z = _2817;
    out.m_71.w = _2807;
    if (_2785)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2819 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2819;
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
    bool _2259 = false;
    bool _857 = false;
    bool _515 = false;
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
    float _103 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    float _107 = _105;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_99)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2875 = as_type<float>(_113);
        out.gl_Position.z = _2875;
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
        _107 = _133;
    }
    float _135 = _107;
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
    int _147 = 0;
    if (_141)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2945 = as_type<float>(_151);
        out.gl_Position.z = _2945;
    }
    if (_141)
    {
        return out;
    }
    float _153 = in.m_53.w;
    float _155 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = in.m_46.x;
    float _175 = in.m_46.y;
    float _177 = in.m_46.z;
    float _179 = _155;
    if (!_165)
    {
        float _181 = _155 * _155;
        float _183 = _181 * 0.5;
        _103 = _183;
    }
    float _185 = _103;
    float _187 = _185;
    if (!_165)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_165;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _155 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _155);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_165;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _155 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _167, _255);
    float _263 = fma(_251, _169, _257);
    float _265 = fma(_251, _171, _259);
    float _267 = fma(_261, _153, _173);
    float _269 = fma(_263, _153, _175);
    float _271 = fma(_265, _153, _177);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
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
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _301 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = _301 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = _301 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _323;
    float _327 = 1.0 / _321;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _331 = 1.0 / _325;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _333;
    float _337 = 1.0 / _317;
    float _339 = _305 * _327;
    bool _341 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _343 = isnan(_301);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    bool _353 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _355 = isnan(_301);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _309 * _331;
    bool _367 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_301);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -_351;
    float _381 = _379 + 1.0;
    float _383 = _377 * _381;
    bool _385 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_301);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _313 * _337;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _403;
    float _407 = -_377;
    float _409 = _407 + 1.0;
    float _411 = fma(_335, _397, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _413 = fma(_401, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = fma(_405, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _417 = -_363;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = _363 * _409;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _431 = _395 * _419;
    float _433 = -_395;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = _413 * _431;
    float _443 = _415 * _431;
    float _445 = _411 * _431;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].x, _441);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].y, _443);
    float _451 = fma(_423, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _453;
    float _457 = fma(_439, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = fma(_429, _339, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _465 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].z, _445);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _467;
    float _471 = fma(_451, _425, _447);
    float _473 = fma(_455, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = fma(_461, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _477 = fma(_469, _365, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _479 = fma(_457, _425, _449);
    float _481 = fma(_463, _425, _465);
    float _483 = fma(_473, _383, _471);
    float _485 = fma(_475, _383, _479);
    float _487 = fma(_477, _383, _481);
    float _489 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[146].x, _483);
    float _491 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[146].y, _485);
    float _493 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[146].z, _487);
    bool _495 = !_329;
    float _513;
    if (!_495)
    {
        float _497 = in.m_55.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_95);
        float _519 = 1.0 / _517;
        float _521 = _129 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = in.m_53.x;
    float _527 = in.m_53.y;
    float _529 = in.m_53.z;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _533 = _523 + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _551 = 1.0 / _537;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _553;
    float _557 = 1.0 / _541;
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _561 = _491 * _527;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _565 = _523 + _563;
    float _567 = 1.0 / _545;
    float _569 = _493 * _529;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _573 = _523 + _571;
    bool _575 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _577 = isnan(_523);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = _533 * _551;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _595 = _523 + _593;
    float _597 = _489 * _525;
    float _599 = 1.0 / _549;
    float _601 = _565 * _557;
    bool _603 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _605 = isnan(_523);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _617 = _523 + _615;
    float _619 = -_585;
    float _621 = _619 + 1.0;
    bool _623 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _625 = isnan(_523);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = fma(_591, _587, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _637 = 1.0 / _555;
    float _639 = _573 * _567;
    float _641 = -_613;
    float _643 = _641 + 1.0;
    bool _645 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _647 = isnan(_523);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_633;
    float _659 = _657 + 1.0;
    float _661 = _585 * _643;
    float _663 = _617 * _599;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _669;
    float _673 = _655 * _621;
    float _675 = -_655;
    float _677 = _675 + 1.0;
    float _679 = fma(_667, _587, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _681 = fma(_671, _587, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _683 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _685 = isnan(_523);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = _595 * _637;
    bool _697 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _699 = isnan(_523);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _633 * _677;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _723 = _693 * _659;
    float _725 = -_693;
    float _727 = _725 + 1.0;
    float _729 = fma(_713, _601, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _731 = fma(_717, _601, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _733 = fma(_721, _601, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _735 = _707 * _727;
    float _737 = -_707;
    float _739 = _737 + 1.0;
    float _741 = _679 * _735;
    float _743 = _635 * _735;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _749;
    float _753 = _681 * _735;
    float _755 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[107].x, _741);
    float _757 = fma(_747, _639, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _759 = fma(_751, _639, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _765;
    float _769 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[107].y, _753);
    float _771 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[107].z, _743);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _777 = fma(_729, _723, _755);
    float _779 = fma(_763, _663, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _781 = fma(_767, _639, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _783 = fma(_775, _663, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _785 = fma(_731, _723, _769);
    float _787 = fma(_733, _723, _771);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _793 = fma(_757, _709, _777);
    float _795 = fma(_781, _709, _785);
    float _797 = fma(_759, _709, _787);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _803;
    float _807 = fma(_791, _663, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _809;
    float _813 = fma(_779, _673, _793);
    float _815 = fma(_801, _695, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _817 = fma(_805, _695, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _819 = fma(_811, _695, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _821 = fma(_783, _673, _795);
    float _823 = fma(_807, _673, _797);
    float _825 = fma(_815, _661, _813);
    float _827 = fma(_817, _661, _821);
    float _829 = fma(_819, _661, _823);
    float _831 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[112].x, _825);
    float _833 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[112].y, _827);
    float _835 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[112].z, _829);
    bool _837 = !_559;
    float _855;
    if (!_837)
    {
        float _839 = in.m_55.x;
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _843 = _839 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _847 = _845 * _841;
        float _849 = floor(_847);
        float _851 = -_849;
        float _853 = _847 + _851;
        _855 = _853;
        _857 = true;
    }
    else
    {
        float _859 = float(_95);
        float _861 = 1.0 / _859;
        float _863 = _129 * _861;
        _855 = _863;
    }
    _857 = false;
    float _865 = _855;
    int _867 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _869 = _867;
    int _871 = 0;
    int _873 = _86(_869, _871, (*spvDescriptorSet0.support_buffer));
    float _875 = in.m_55.x;
    float _877 = in.m_55.y;
    float _879 = in.m_55.z;
    float _881 = _129 + _879;
    float _883 = _881 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _885 = float(_873);
    int _887 = abs(_873);
    bool _889 = _873 == 0;
    float _891 = _883 * _885;
    float _893 = float(uint(_887));
    float _895 = trunc(_891);
    int _897 = int(_895);
    float _899 = 1.0 / _893;
    int _901 = abs(_897);
    uint _904 = uint(int(uint(_897) >> uint(31)));
    float _906 = float(uint(_901));
    int _908 = ~int(_904);
    int _910 = _908 + 1;
    int _912 = as_type<int>(_899) + (-2);
    float _914 = as_type<float>(_912) * _906;
    float _916 = trunc(_914);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    int _922 = ~int(_920);
    int _924 = _922 + 1;
    int _926 = _924 * _887;
    int _928 = _926 + _901;
    float _930 = float(uint(_928));
    float _932 = in.m_57.z;
    float _934 = as_type<float>(_912) * _930;
    float _936 = trunc(_934);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    int _942 = int(_920) + int(_940);
    float _944 = trunc(_932);
    int _946 = int(_944);
    int _948 = ~_942;
    int _950 = _948 + 1;
    int _952 = _950 * _887;
    int _954 = _952 + _901;
    bool _956 = uint(_954) >= uint(_887);
    bool _958 = !_956;
    int _960 = _958 ? 0 : (-1);
    int _962 = ~_942;
    int _964 = _962 + _960;
    int _966 = _964 + 1;
    int _968 = _966 * _887;
    int _970 = _968 + _901;
    int _972 = _970 ^ _910;
    int _974 = ~_910;
    int _976 = _974 + _972;
    int _978 = _976 + 1;
    bool _980 = !_889;
    int _982 = _980 ? _978 : (-1);
    int _984 = _982;
    int _986 = 0;
    int _988 = _87(_984, _986, (*spvDescriptorSet0.support_buffer));
    int _990 = _946;
    int _992 = 0;
    int _994 = _87(_990, _992, (*spvDescriptorSet0.support_buffer));
    float4 _997 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_988, _994)), 0).xyzw;
    float _999 = _997.x;
    float _1001 = _997.y;
    float _1003 = _997.z;
    float _1005 = _997.w;
    float _1007 = _875 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1009 = in.m_57.y;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1013 = _1011 != 0;
    float _1015 = _877 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1019 = _831 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1025 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1017);
    float _1027 = in.m_57.x;
    float _1029 = 1.0 / _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1035 = 0.0;
    float _1037 = _1009;
    float _1039 = _1027;
    if (_1013)
    {
        float _1041 = in.m_55.x;
        _1035 = _1041;
    }
    float _1043 = _1035;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1051 = _1049 != 0;
    float _1053 = 1.0 / _1033;
    float _1055 = -_1045;
    float _1057 = fma(_1007, 2.0, _1055);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1061 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1047);
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1063;
    bool _1067 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1069 = isnan(_865);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1075 = _1071 || _1073;
    float _1077 = float(_1075);
    float _1079 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1025);
    float _1081 = fma(_1015, -2.0, _1059);
    float _1083 = _1065 * _1029;
    bool _1085 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1087 = isnan(_865);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = -_1077;
    float _1099 = _1097 + 1.0;
    bool _1101 = _877 > 0.5;
    bool _1103 = _1101 && _1051;
    float _1105 = _1079 * (-0.15915493667125701904296875);
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1113 = _1095 * _1099;
    float _1115 = -_1095;
    float _1117 = _1115 + 1.0;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1121 = _865 + _1119;
    float _1123 = _1111 * _1053;
    bool _1125 = _1043 > 0.5;
    bool _1127 = _1125 && _1013;
    float _1129 = -_129;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1057);
    float _1133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1135 = _1053;
    if (_1013)
    {
        _1135 = _1027;
    }
    float _1137 = _1135;
    float _1139 = fma(_1083, _1121, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1141 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1143 = isnan(_865);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1155 = _865 + _1153;
    float _1157 = _1137;
    if (_1103)
    {
        float _1159 = -_1009;
        float _1161 = _1159 + 1.0;
        _1037 = _1161;
    }
    float _1163 = _1037;
    int _1165 = _982 + 1;
    float _1167 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1081);
    float _1169 = _1105 * 6.283185482025146484375;
    float _1171 = sin(_1169);
    float _1173 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1175 = _1151 * _1117;
    if (_1127)
    {
        float _1177 = -_1137;
        float _1179 = _1177 + 1.0;
        _1157 = _1179;
    }
    float _1181 = _1157;
    float _1183 = -_1151;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_1123, _1155, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1189 = _1139 * _1175;
    float _1191 = _1105 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1013)
    {
        _1039 = _1181;
    }
    float _1197 = _1039;
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1189);
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1203 = fma(_1195, _1163, -0.5);
    float _1205 = fma(_1173, _1197, -0.5);
    float _1207 = fma(_1187, _1113, _1199);
    float _1209 = _1171 * _1203;
    float _1211 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1201);
    float _1213 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1215 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1061);
    float _1217 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1211);
    float _1219 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1193 * _1203;
    float _1223 = -_1209;
    float _1225 = fma(_1193, _1205, _1223);
    float _1227 = fma(_1171, _1205, _1221);
    float _1229 = _835 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1231 = abs(_1165);
    float _1233 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1207);
    float _1235 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1239 = float(uint(_1231));
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1243 = uint(int(uint(_1165) >> uint(31)));
    float _1245 = fma(_1215, _1225, _1131);
    float _1247 = -_1167;
    float _1249 = fma(_1217, _1227, _1247);
    float _1251 = as_type<float>(_912) * _1239;
    out.m_59.x = _1235;
    out.m_59.y = _1219;
    out.m_59.z = _1237;
    out.m_59.w = _1241;
    int _1253 = ~int(_1243);
    int _1255 = _1253 + 1;
    float _1257 = trunc(_1251);
    float _1259 = precise::max(_1257, 0.0);
    uint _1261 = uint(_1259);
    int _1263 = ~int(_1261);
    int _1265 = _1263 + 1;
    int _1267 = _1265 * _887;
    int _1269 = _1267 + _1231;
    float _1271 = float(uint(_1269));
    float _1273 = as_type<float>(_912) * _1271;
    float _1275 = _1245 + 0.5;
    float _1277 = trunc(_1273);
    float _1279 = precise::max(_1277, 0.0);
    uint _1281 = uint(_1279);
    int _1283 = int(_1261) + int(_1281);
    int _1285 = ~_1283;
    int _1287 = _1285 + 1;
    int _1289 = _1287 * _887;
    int _1291 = _1289 + _1231;
    bool _1293 = uint(_1291) >= uint(_887);
    bool _1295 = !_1293;
    int _1297 = _1295 ? 0 : (-1);
    int _1299 = ~_1283;
    int _1301 = _1299 + _1297;
    int _1303 = _1301 + 1;
    int _1305 = _1303 * _887;
    int _1307 = _1305 + _1231;
    float _1309 = _1249 + 0.5;
    int _1311 = _1307 ^ _1255;
    int _1313 = ~_1255;
    int _1315 = _1313 + _1311;
    int _1317 = _1315 + 1;
    bool _1319 = !_889;
    int _1321 = _1319 ? _1317 : (-1);
    uint _1323 = as_type<uint>(half2(float2(_1005, 0.0)));
    uint _1325 = extract_bits(_1323, 0u, 8u);
    int _1327 = int(_1325) & 255;
    uint _1329 = extract_bits(_1323, 8u, 8u);
    int _1331 = int(_1329) & 255;
    int _1333 = _1331 << 8;
    int _1335 = _1327 | _1333;
    bool _1337 = _1335 >= 32768;
    int _1339 = _1335 + (-1024);
    int _1341 = _1339;
    if (_1337)
    {
        int _1343 = ~_1335;
        int _1345 = _1343 + 33792;
        int _1347 = _1345 + 1;
        _1341 = _1347;
    }
    int _1349 = _1341;
    int _1351 = _1349 + 30719;
    float _1353 = float(_1351);
    float _1355 = fma(_1353, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1357 = abs(_1355);
    float _1359 = -_1357;
    float _1361 = _1359 + 1.0;
    int _1363 = as_type<int>(_1361) + (-218103808);
    bool _1365 = uint(_1363) >= 1920991232u;
    bool _1367 = !_1365;
    if (!_1367)
    {
        int _1369;
        _84(_1369, out.gl_Position, out.gl_PointSize);
    }
    int _1371 = _1321;
    int _1373 = 0;
    int _1375 = _87(_1371, _1373, (*spvDescriptorSet0.support_buffer));
    int _1377 = _946;
    int _1379 = 0;
    int _1381 = _87(_1377, _1379, (*spvDescriptorSet0.support_buffer));
    float4 _1383 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1375, _1381)), 0).xyzw;
    float _1385 = _1383.x;
    float _1387 = _1383.y;
    float _1389 = _1383.z;
    float _1391 = _1383.w;
    float _1393 = floor(_891);
    float _1395 = -_1393;
    float _1397 = _891 + _1395;
    uint _1399 = as_type<uint>(half2(float2(_1391, 0.0)));
    float _1401 = -_1003;
    float _1403 = _1401 + _1389;
    uint _1405 = extract_bits(_1399, 0u, 8u);
    int _1407 = int(_1405) & 255;
    uint _1409 = extract_bits(_1399, 8u, 8u);
    int _1411 = int(_1409) & 255;
    int _1413 = _1411 << 8;
    int _1415 = _1407 | _1413;
    bool _1417 = _1415 >= 32768;
    int _1419 = _1415 + (-1024);
    int _1421 = _1419;
    if (_1417)
    {
        int _1423 = ~_1415;
        int _1425 = _1423 + 33792;
        int _1427 = _1425 + 1;
        _1421 = _1427;
    }
    int _1429 = _1421;
    int _1431 = _1429 + 30719;
    float _1433 = float(_1431);
    float _1435 = fma(_1433, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1437 = -_999;
    float _1439 = _1437 + _1385;
    float _1441 = fma(_1397, _1403, _1003);
    float _1443 = abs(_1435);
    float _1445 = -_1443;
    float _1447 = _1445 + 1.0;
    float _1449 = fma(_1397, _1439, _999);
    int _1451 = as_type<int>(_1447) + (-218103808);
    bool _1453 = uint(_1451) >= 1920991232u;
    float _1455 = -_1001;
    float _1457 = _1455 + _1387;
    float _1459 = fma(_1397, _1457, _1001);
    bool _1461 = !_1453;
    if (!_1461)
    {
        int _1463;
        _84(_1463, out.gl_Position, out.gl_PointSize);
    }
    float _1465 = in.m_55.x;
    float _1467 = in.m_55.y;
    float _1469 = in.m_55.z;
    float _1471 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1473 = log2(_1471);
    float _1475 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1477 = in.m_61.w;
    float _1479 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1483 = _1481 != 0;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1487 = _1485 != 0;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1491 = _1489 != 0;
    float _1493 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_63.x = _1275;
    out.m_63.y = _1309;
    float _1495 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1475);
    float _1497 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1479);
    float _1499 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1493);
    float _1501 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1497);
    float _1503 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1499);
    float _1505 = _1473 * _129;
    float _1507 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1509 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1495);
    float _1511 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1513 = exp2(_1505);
    float _1515 = _1501 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1517 = _1469 * 2.0;
    float _1519 = _1465 * 2.0;
    float _1521 = _1467 + _1465;
    float _1523 = _1467 + _1469;
    out.m_65.w = _1477;
    bool _1525 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1527 = isnan(0.0);
    bool _1529 = _1525 || _1527;
    bool _1531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1533 = _1529 || _1531;
    float _1535 = floor(_1517);
    float _1537 = _1521 + (-1.0);
    float _1539 = _1523 + (-1.0);
    float _1541 = _1509 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1543 = _1467 * 2.0;
    float _1545 = -_1513;
    float _1547 = _1545 + 1.0;
    float _1549 = floor(_1519);
    float _1551 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1555 = _1515 + _1553;
    float _1557 = _1533 ? _1547 : 0.0;
    float _1559 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1507);
    float _1561 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1511);
    float _1563 = floor(_1543);
    bool _1565 = _1535 > 0.0;
    float _1567 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1569 = _1535 >= 0.0;
    bool _1571 = isnan(_1535);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.0);
    bool _1577 = _1573 || _1575;
    float _1579 = _1503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1583 = _1541 + _1581;
    int _1585 = _1577 ? 0 : 1;
    float _1587 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1567);
    bool _1589 = _1549 > 0.0;
    float _1591 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1593 = ~_1585;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1601 = _1579 + _1599;
    bool _1603 = _1549 >= 0.0;
    bool _1605 = isnan(_1549);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan(0.0);
    bool _1611 = _1607 || _1609;
    float _1613 = _1555 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1615 = _1597;
    if (!_1565)
    {
        int _1617 = ~_1585;
        int _1619 = _1617 + 1;
        _1615 = _1619;
    }
    int _1621 = _1615;
    float _1623 = _1555 * _1555;
    bool _1625 = _1563 > 0.0;
    bool _1627 = _1563 >= 0.0;
    bool _1629 = isnan(_1563);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.0);
    bool _1635 = _1631 || _1633;
    float _1637 = fma(_1583, _1583, _1623);
    bool _1639 = !_1483;
    int _1641 = _1639 ? 0 : 1;
    float _1643 = fma(_1601, _1601, _1637);
    bool _1645 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1647 = isnan(1.0);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1653 = _1649 || _1651;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1657 = 1.0 + _1655;
    float _1659 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1613);
    float _1661 = 1.0 / _1657;
    float _1663 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1659);
    float _1665 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1561);
    int _1667 = abs(_1641);
    float _1669 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1587);
    int _1671 = _1611 ? 0 : 1;
    float _1673 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1559);
    bool _1675 = _1663 >= 0.0;
    float _1677 = in.m_67.x;
    float _1679 = in.m_67.y;
    float _1681 = in.m_67.z;
    float _1683 = rsqrt(_1665);
    bool _1685 = !_1487;
    int _1687 = _1685 ? 0 : 1;
    float _1689 = float(_1667);
    float _1691 = _1661;
    if (_1653)
    {
        float _1693 = _1557 * _1661;
        _131 = _1693;
    }
    float _1695 = _131;
    float _1697 = float(_1621);
    int _1699 = abs(_1687);
    float _1701 = rsqrt(_1669);
    int _1703 = ~_1671;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    float _1709 = _1689 * _1697;
    int _1711 = _1707;
    int _1713 = as_type<int>(_1709);
    if (_1675)
    {
        _1691 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1715 = _1691;
    if (_1675)
    {
        out.m_49.x = 0.0;
    }
    if (!_1589)
    {
        int _1717 = ~_1671;
        int _1719 = _1717 + 1;
        _1711 = _1719;
    }
    int _1721 = _1711;
    float _1723 = _1709 * (-2.0);
    float _1725 = rsqrt(_1643);
    if (_1675)
    {
        float _1727 = _1715 * 5.0;
        _1713 = as_type<int>(_1727);
    }
    int _1729 = _1713;
    int _1731 = _1635 ? 0 : 1;
    float _1733 = fma(_1591, _1723, _1591);
    float _1735 = float(_1699);
    float _1737 = fma(_1723, _1677, _1677);
    float _1739 = float(_1721);
    if (_1675)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5396 = as_type<float>(_1729);
        out.gl_Position.z = _5396;
    }
    int _1741 = ~_1731;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    int _1747 = _1745;
    if (!_1625)
    {
        int _1749 = ~_1731;
        int _1751 = _1749 + 1;
        _1747 = _1751;
    }
    int _1753 = _1747;
    float _1755 = _1735 * _1739;
    float _1757 = _1465 + (-0.5);
    bool _1759 = !_1491;
    int _1761 = _1759 ? 0 : 1;
    float _1763 = _1555 * _1725;
    float _1765 = _1583 * _1725;
    if (_1675)
    {
        return out;
    }
    float _1767 = -_1763;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1515);
    float _1771 = _1755 * (-2.0);
    float _1773 = -_1765;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1541);
    float _1777 = _1601 * _1725;
    float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1781 = _1769 + _1779;
    float _1783 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1737);
    float _1785 = fma(_1551, _1771, _1551);
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1789 = _1775 + _1787;
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1793 = fma(_1771, _1679, _1679);
    float _1795 = -_1777;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1579);
    float _1799 = fma(_1733, _1695, _1783);
    int _1801 = abs(_1761);
    float _1803 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1791);
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1807 = _1797 + _1805;
    float _1809 = _1799 * 0.15915493667125701904296875;
    float _1811 = _1467 + (-0.5);
    float _1813 = float(_1801);
    float _1815 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1803);
    float _1817 = float(_1753);
    float _1819 = _1469 + _1465;
    float _1821 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1793);
    float _1823 = _1469 + (-0.5);
    bool _1825 = _1815 >= 0.0;
    float _1827 = _1813 * _1817;
    float _1829 = _1819 + (-1.0);
    float _1831 = fma(_1785, _1695, _1821);
    float _1833 = _1827 * (-2.0);
    float _1835 = rsqrt(_1673);
    float _1837 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1839 = _1831 * 0.15915493667125701904296875;
    float _1841 = fma(_1833, _1681, _1681);
    float _1843 = -_1763;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1555);
    float _1847 = fma(_1837, _1833, _1837);
    float _1849 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1841);
    float _1851 = sqrt(_1673);
    float _1853 = as_type<float>(_1801);
    int _1855 = as_type<int>(_1823);
    if (_1825)
    {
        _1853 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1857 = _1853;
    float _1859 = fma(_1847, _1695, _1849);
    if (_1825)
    {
        out.m_49.x = 0.0;
    }
    if (_1825)
    {
        float _1861 = _1857 * 5.0;
        _1855 = as_type<int>(_1861);
    }
    int _1863 = _1855;
    float _1865 = _1809 * 6.283185482025146484375;
    float _1867 = sin(_1865);
    if (_1825)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5612 = as_type<float>(_1863);
        out.gl_Position.z = _5612;
    }
    float _1869 = _1809 * 6.283185482025146484375;
    float _1871 = cos(_1869);
    float _1873 = _1839 * 6.283185482025146484375;
    float _1875 = sin(_1873);
    float _1877 = _1839 * 6.283185482025146484375;
    float _1879 = cos(_1877);
    if (_1825)
    {
        return out;
    }
    float _1881 = -_1515;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1885 = -_1765;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1583);
    float _1889 = _1859 * 0.15915493667125701904296875;
    float _1891 = -_1541;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1895 = _1883 * _1883;
    float _1897 = _1845 * _1845;
    float _1899 = -_1579;
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1903 = _1889 * 6.283185482025146484375;
    float _1905 = sin(_1903);
    float _1907 = fma(_1893, _1893, _1895);
    float _1909 = fma(_1887, _1887, _1897);
    float _1911 = -_1777;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1601);
    float _1915 = _1459 * _1683;
    float _1917 = fma(_1901, _1901, _1907);
    float _1919 = _1867 * _1875;
    float _1921 = fma(_1913, _1913, _1909);
    float _1923 = _1871 * _1879;
    float _1925 = _1449 * _1835;
    float _1927 = _1851 * _1915;
    float _1929 = rsqrt(_1917);
    float _1931 = _1441 * _1701;
    float _1933 = _1851 * _1925;
    float _1935 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1937 = _569 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1939 = fma(_1905, _1923, _1919);
    float _1941 = fma(_1905, _1919, _1923);
    float _1943 = _1851 * _1931;
    float _1945 = sqrt(_1921);
    float _1947 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1949 = _1871 * _1875;
    float _1951 = _1893 * _1929;
    float _1953 = _1901 * _1929;
    float _1955 = _1883 * _1929;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1959 = _1951 * _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1963 = _1953 * _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1967 = -_1959;
    float _1969 = fma(_1953, _1965, _1967);
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1973 = _1955 * _1971;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1977 = -_1963;
    float _1979 = fma(_1955, _1975, _1977);
    float _1981 = _1725 * _1945;
    float _1983 = _1969 * _1969;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1987 = -_1973;
    float _1989 = fma(_1951, _1985, _1987);
    float _1991 = _1889 * 6.283185482025146484375;
    float _1993 = cos(_1991);
    float _1995 = fma(_1979, _1979, _1983);
    float _1997 = _1981 * _1935;
    float _1999 = _1981 * _1937;
    float _2001 = _1981 * _1947;
    float _2003 = fma(_1989, _1989, _1995);
    float _2005 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1927);
    float _2007 = _1867 * _1879;
    float _2009 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1933);
    float _2011 = _1997 * _2005;
    float _2013 = rsqrt(_2003);
    float _2015 = -_1949;
    float _2017 = fma(_1905, _2007, _2015);
    float _2019 = _2001 * _2009;
    float _2021 = -_2011;
    float _2023 = _1905 * _2021;
    float _2025 = _1993 * _2011;
    float _2027 = -_2007;
    float _2029 = fma(_1905, _1949, _2027);
    float _2031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1943);
    float _2033 = _1879 * _1993;
    float _2035 = _1871 * _2025;
    float _2037 = _1875 * _1993;
    float _2039 = _1999 * _2031;
    float _2041 = _1867 * _2025;
    float _2043 = fma(_1939, _2019, _2035);
    float _2045 = fma(_2033, _2019, _2023);
    float _2047 = fma(_2017, _2019, _2041);
    float _2049 = _1969 * _2013;
    float _2051 = _1979 * _2013;
    float _2053 = _1989 * _2013;
    float _2055 = fma(_2029, _2039, _2043);
    float _2057 = _1953 * _2049;
    float _2059 = _1955 * _2051;
    float _2061 = fma(_2037, _2039, _2045);
    float _2063 = fma(_1941, _2039, _2047);
    float _2065 = -_2057;
    float _2067 = fma(_1955, _2053, _2065);
    float _2069 = -_2059;
    float _2071 = fma(_1951, _2049, _2069);
    float _2073 = _2067 * _2055;
    float _2075 = _2071 * _2055;
    float _2077 = fma(_2051, _2061, _2073);
    float _2079 = fma(_2053, _2061, _2075);
    float _2081 = _1951 * _2053;
    float _2083 = fma(_1951, _2063, _2077);
    float _2085 = fma(_1953, _2063, _2079);
    float _2087 = -_2081;
    float _2089 = fma(_1953, _2051, _2087);
    float _2091 = _1541 + _2083;
    float _2093 = _1579 + _2085;
    float _2095 = _2089 * _2055;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2099 = _2091 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2103 = _2093 + _2101;
    float _2105 = fma(_2049, _2061, _2095);
    float _2107 = _2099 * _2099;
    float _2109 = _2103 * _2103;
    float _2111 = fma(_1955, _2063, _2105);
    float _2113 = _2107 + _2109;
    float _2115 = _1515 + _2111;
    float _2117 = sqrt(_2113);
    bool _2119 = _2117 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2121 = _2049;
    float _2123 = _1951;
    float _2125 = _1953;
    float _2127 = _2109;
    float _2129 = _2091;
    float _2131 = _2107;
    if (!_2119)
    {
        _2121 = _2107;
    }
    float _2133 = _2121;
    float _2135 = _2133;
    if (!_2119)
    {
        _2123 = _2093;
    }
    float _2137 = _2123;
    float _2139 = _2137;
    if (!_2119)
    {
        _2125 = _2115;
    }
    float _2141 = _2125;
    bool _2143 = !_2119;
    float _2145 = _2141;
    if (!_2143)
    {
        float _2147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2151 = _2117 + _2149;
        float _2153 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2155 = rsqrt(_2113);
        float _2157 = _2151 * _2147;
        float _2159 = _2157 * 0.15915493667125701904296875;
        float _2161 = _2159 * 6.283185482025146484375;
        float _2163 = sin(_2161);
        float _2165 = _2159 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        float _2169 = fma(_2163, _2153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2171 = _2155 * _2169;
        float _2173 = _2167 + (-1.0);
        float _2175 = _2103 * _2171;
        float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2179 = _2099 * _2171;
        float _2181 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2183 = _2175 * _2175;
        float _2185 = fma(_2115, _2167, _2177);
        float _2187 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2189 = _2179 * _2179;
        _2145 = _2185;
        _2135 = _2189;
        _2127 = _2183;
        _2129 = _2187;
        _2139 = _2181;
    }
    float _2191 = _2145;
    float _2193 = _2135;
    float _2195 = _2127;
    float _2197 = _2129;
    float _2199 = _2139;
    float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2203 = _2191 + _2201;
    float _2205 = fma(_2203, _2203, _2193);
    float _2207 = _2205 + _2195;
    float _2209 = sqrt(_2207);
    bool _2211 = _2209 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2213 = isnan(_2209);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2219 = _2215 || _2217;
    float _2221 = _2205;
    float _2223 = _2209;
    if (!_2219)
    {
        _2221 = 1.0;
    }
    float _2225 = _2221;
    bool _2227 = !_2219;
    float _2229 = _2225;
    if (!_2227)
    {
        bool _2231 = _2209 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2233 = isnan(_2209);
        bool _2235 = _2231 || _2233;
        bool _2237 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2239 = _2235 || _2237;
        if (!_2239)
        {
            float _2241 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2243 = _2209 + _2241;
            float _2245 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2247 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2245;
            float _2249 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2251 = _2249 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2253 = 1.0 / _2247;
            float _2255 = _2243 * _2253;
            float _2257 = fma(_2255, _2251, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2229 = _2257;
            _2259 = true;
        }
        else
        {
            bool _2261 = _2209 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2263 = isnan(_2209);
            bool _2265 = _2261 || _2263;
            bool _2267 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2269 = _2265 || _2267;
            if (!_2269)
            {
                float _2271 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2273 = _2209 + _2271;
                float _2275 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2277 = _2275 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2279 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2281 = _2279 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2283 = 1.0 / _2277;
                float _2285 = _2273 * _2283;
                float _2287 = fma(_2285, _2281, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2229 = _2287;
                _2259 = true;
            }
            else
            {
                _2229 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2259 = false;
    float _2289 = _2229;
    float _2291 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2293 = _2191 + _2291;
    float _2295 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2297 = _2197 + _2295;
    float _2299 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2301 = _2199 + _2299;
    float _2303 = fma(_2293, _2289, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2305 = fma(_2297, _2289, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2307 = fma(_2301, _2289, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2309 = -_1763;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2303);
    float _2313 = -_1765;
    float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2305);
    float _2317 = -_1777;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2307);
    float _2321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2323 = _2311 + _2321;
    float _2325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2327 = _2315 + _2325;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2331 = _2319 + _2329;
    float _2333 = _2323 * _2323;
    float _2335 = fma(_2327, _2327, _2333);
    float _2337 = fma(_2331, _2331, _2335);
    float _2339 = rsqrt(_2337);
    float _2341 = sqrt(_2337);
    float _2343 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2345 = _2327 * _2343;
    float _2347 = _2331 * _2343;
    float _2349 = _2345 * _2345;
    float _2351 = _2347 * _2347;
    float _2353 = _2349 + _2351;
    float _2355 = sqrt(_2353);
    bool _2357 = _2355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2361 = _2355 + _2359;
    float _2363 = _2331;
    float _2365 = _2353;
    float _2367 = _2361;
    float _2369 = _2323;
    if (_2357)
    {
        float _2371 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2363 = _2371;
    }
    float _2373 = _2363;
    if (_2357)
    {
        float _2375 = rsqrt(_2353);
        _2365 = _2375;
    }
    float _2377 = _2365;
    float _2379 = _2377;
    if (_2357)
    {
        float _2381 = _2361 * _2373;
        _2367 = _2381;
    }
    float _2383 = _2367;
    if (_2357)
    {
        float _2385 = _2383 * 0.15915493667125701904296875;
        _2223 = _2385;
    }
    float _2387 = _2223;
    float _2389 = _2373;
    float _2391 = _2387;
    if (_2357)
    {
        float _2393 = _2387 * 6.283185482025146484375;
        float _2395 = sin(_2393);
        _2389 = _2395;
    }
    float _2397 = _2389;
    float _2399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2401 = precise::max(0.0, _2399);
    float _2403 = _2333;
    float _2405 = _2401;
    if (_2357)
    {
        float _2407 = _2387 * 6.283185482025146484375;
        float _2409 = cos(_2407);
        _2403 = _2409;
    }
    float _2411 = _2403;
    float _2413 = -_2343;
    float _2415 = -_2401;
    float _2417 = fma(_2323, _2413, _2415);
    if (!_2357)
    {
        _2369 = _2345;
    }
    float _2419 = _2369;
    float _2421 = _2419;
    if (_2357)
    {
        float _2423 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2405 = _2423;
    }
    float _2425 = _2405;
    float _2427 = _2397;
    float _2429 = _2425;
    if (_2357)
    {
        float _2431 = fma(_2397, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2427 = _2431;
    }
    float _2433 = _2427;
    float _2435 = _2433;
    float _2437 = _2411;
    if (_2357)
    {
        float _2439 = _2411 + (-1.0);
        _2429 = _2439;
    }
    float _2441 = _2429;
    float _2443 = _2441;
    if (_2357)
    {
        float _2445 = _2377 * _2433;
        _2131 = _2445;
    }
    float _2447 = _2131;
    if (!_2357)
    {
        _2435 = _2417;
    }
    float _2449 = _2435;
    float _2451 = _2449;
    if (_2357)
    {
        float _2453 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2391 = _2453;
    }
    float _2455 = _2391;
    if (_2357)
    {
        float _2457 = _2345 * _2447;
        _2421 = _2457;
    }
    float _2459 = _2421;
    if (!_2357)
    {
        _2443 = _2347;
    }
    float _2461 = _2443;
    float _2463 = _2461;
    if (_2357)
    {
        float _2465 = _2347 * _2447;
        _2463 = _2465;
    }
    float _2467 = _2463;
    if (!_2357)
    {
        _2379 = _2349;
    }
    float _2469 = _2379;
    float _2471 = _2469;
    if (_2357)
    {
        float _2473 = fma(_2417, _2411, _2455);
        _2451 = _2473;
    }
    float _2475 = _2451;
    if (_2357)
    {
        float _2477 = _2459 * _2459;
        _2471 = _2477;
    }
    float _2479 = _2471;
    if (!_2357)
    {
        _2437 = _2351;
    }
    float _2481 = _2437;
    float _2483 = _2481;
    if (_2357)
    {
        float _2485 = _2467 * _2467;
        _2483 = _2485;
    }
    float _2487 = _2483;
    float _2489 = fma(_2475, _2475, _2479);
    float _2491 = _2489 + _2487;
    float _2493 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2497 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2495);
    float _2499 = precise::clamp(_2497, 0.0, 1.0);
    float _2501 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2503 = rsqrt(_2491);
    float _2505 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2493);
    float _2507 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2509 = -_2499;
    float _2511 = _2509 + 1.0;
    float _2513 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2501);
    float _2515 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2505);
    float _2517 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2519 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2521 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2513);
    float _2523 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2525 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2507);
    float _2527 = abs(_2511);
    float _2529 = log2(_2527);
    float _2531 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2533 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2535 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2525);
    float _2537 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2519);
    float _2539 = _2503 * _2475;
    float _2541 = -_2533;
    float _2543 = fma(_2541, _2517, 1.0);
    float _2545 = _2535 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2547 = _2503 * _2459;
    float _2549 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2551 = _2503 * _2467;
    float _2553 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2537);
    float _2555 = _2547 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2557 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2549);
    float _2559 = log2(_2543);
    float _2561 = _2553 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2563 = -_2555;
    float _2565 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2563);
    float _2567 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2569 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2557);
    float _2571 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2573 = -_2551;
    float _2575 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2565);
    float _2577 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2579 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2569);
    float _2581 = exp2(_2567);
    float _2583 = fma(_2575, -0.5, 0.5);
    float _2585 = fma(_2575, 0.5, 0.5);
    float _2587 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2577);
    float _2589 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2571);
    float _2591 = _2539 + 1.0;
    float _2593 = fma(_2585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2595 = 1.0 / _2579;
    float _2597 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2587);
    float _2599 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2589);
    float _2601 = fma(_2585, _2593, -0.212114393711090087890625);
    float _2603 = _2559 * 0.693147182464599609375;
    float _2605 = fma(_2585, _2601, 1.570728778839111328125);
    float _2607 = sqrt(_2583);
    float _2609 = -_2539;
    float _2611 = fma(_2581, _2591, _2609);
    float _2613 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2597);
    float _2615 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2599);
    float _2617 = fma(_2611, 0.5, 0.5);
    float _2619 = _2613 * _2595;
    float _2621 = _2615 * _2595;
    float _2623 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2625 = fma(_2619, 0.5, 0.5);
    float _2627 = fma(_2621, -0.5, 0.5);
    float _2629 = _2607 * 0.636619746685028076171875;
    float _2631 = -_2605;
    float _2633 = fma(_2629, _2631, 1.0);
    float3 _6845 = float3(_2625, _2627, _2623);
    float _2635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6845, float3(0.0), isnan(_6845)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6845, float3(0.0), isnan(_6845)), level(0.0)).x;
    float3 _6856 = float3(_2625, _2627, _2623);
    float4 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6856, float3(0.0), isnan(_6856)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6856, float3(0.0), isnan(_6856)), level(0.0)).xyzw;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _2637.w;
    float2 _6872 = float2(_2633, _2617);
    float3 _2649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6872, float2(0.0), isnan(_6872)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6872, float2(0.0), isnan(_6872)), level(0.0)).xyz;
    float _2651 = _2649.x;
    float _2653 = _2649.y;
    float _2655 = _2649.z;
    float _2657 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2659 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2661 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2657);
    float _2663 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2659);
    float _2665 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2661);
    float _2667 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2663);
    float _2669 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2671 = _2665 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2673 = _2667 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2675 = 1.0 / _2671;
    bool _2677 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan(0.5);
    bool _2685 = _2681 || _2683;
    float _2687 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2689 = _2673 + _2671;
    float _2691 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2687);
    float _2693 = exp2(_2669);
    float _2695 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2691);
    float _2697 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2695);
    float _2699 = _2529;
    if (_2685)
    {
        _2699 = 1.0;
    }
    float _2701 = _2699;
    float _2703 = _2689 * _2675;
    float _2705 = _2703 * 0.5;
    float _2707 = _2701;
    if (!_2685)
    {
        float _2709 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2711 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2713 = fma(_2705, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2711);
        float _2715 = _2709 * 0.15915493667125701904296875;
        float _2717 = _2715 * 6.283185482025146484375;
        float _2719 = cos(_2717);
        float _2721 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2723 = _2721 * 0.15915493667125701904296875;
        float _2725 = _2715 * 6.283185482025146484375;
        float _2727 = sin(_2725);
        float _2729 = 1.0 / _2719;
        float _2731 = _2723 * 6.283185482025146484375;
        float _2733 = cos(_2731);
        float _2735 = _2727 * _2729;
        float _2737 = 1.0 / _2713;
        float _2739 = _2733 * _2735;
        float _2741 = _2723 * 6.283185482025146484375;
        float _2743 = sin(_2741);
        float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2747 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2745;
        float _2749 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2751 = _2737 * _2749;
        float _2753 = 1.0 / _2739;
        float _2755 = 1.0 / _2747;
        float _2757 = _2743 * _2753;
        float _2759 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2761 = fma(_2757, _2751, _2759);
        float _2763 = _2761 * _2755;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        _2707 = _2765;
    }
    float _2767 = _2707;
    float _2769 = -_2693;
    float _2771 = _2769 + 1.0;
    float _2773 = _2579 * 0.5;
    float _2775 = _2767 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2777 = _2767 > 0.0;
    bool _2779 = isnan(_2767);
    bool _2781 = _2777 || _2779;
    bool _2783 = isnan(0.0);
    bool _2785 = _2781 || _2783;
    float _2787 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2789 = fma(_2615, -0.5, _2773);
    float _2791 = _2775 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2793 = _2697 + _2579;
    float _2795 = _2787 * _2635;
    float _2797 = -_2787;
    float _2799 = _2797 + 1.0;
    float _2801 = _2613 + _2579;
    out.gl_Position.x = _2613;
    out.gl_Position.y = _2615;
    out.gl_Position.z = _2697;
    out.gl_Position.w = _2579;
    float _2803 = _2645 * _2795;
    float _2805 = _2655 * _2795;
    float _2807 = _2645 * _2799;
    float _2809 = _2793 * 0.5;
    float _2811 = _2801 * 0.5;
    float _2813 = fma(_2651, _2803, _2639);
    float _2815 = fma(_2653, _2803, _2641);
    float _2817 = fma(_2645, _2805, _2643);
    out.m_49.x = _2791;
    out.m_69.x = _2811;
    out.m_69.y = _2789;
    out.m_69.z = _2809;
    out.m_69.w = _2579;
    out.m_71.x = _2813;
    out.m_71.y = _2815;
    out.m_71.z = _2817;
    out.m_71.w = _2807;
    if (_2785)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2819 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2819;
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
    bool _2259 = false;
    bool _857 = false;
    bool _515 = false;
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
    float _103 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _101;
    float _107 = _105;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_99)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2875 = as_type<float>(_113);
        out.gl_Position.z = _2875;
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
        _107 = _133;
    }
    float _135 = _107;
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
    int _147 = 0;
    if (_141)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2945 = as_type<float>(_151);
        out.gl_Position.z = _2945;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = in.m_53.w;
    float _155 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = in.m_46.x;
    float _175 = in.m_46.y;
    float _177 = in.m_46.z;
    float _179 = _155;
    if (!_165)
    {
        float _181 = _155 * _155;
        float _183 = _181 * 0.5;
        _103 = _183;
    }
    float _185 = _103;
    float _187 = _185;
    if (!_165)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_165;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _155 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _155);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_165;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _155 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _167, _255);
    float _263 = fma(_251, _169, _257);
    float _265 = fma(_251, _171, _259);
    float _267 = fma(_261, _153, _173);
    float _269 = fma(_263, _153, _175);
    float _271 = fma(_265, _153, _177);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_55.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
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
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _301 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = _301 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = _301 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _323;
    float _327 = 1.0 / _321;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _331 = 1.0 / _325;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _333;
    float _337 = 1.0 / _317;
    float _339 = _305 * _327;
    bool _341 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _343 = isnan(_301);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    bool _353 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _355 = isnan(_301);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = _309 * _331;
    bool _367 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _369 = isnan(_301);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -_351;
    float _381 = _379 + 1.0;
    float _383 = _377 * _381;
    bool _385 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_301);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _313 * _337;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _403;
    float _407 = -_377;
    float _409 = _407 + 1.0;
    float _411 = fma(_335, _397, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _413 = fma(_401, _397, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _415 = fma(_405, _397, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _417 = -_363;
    float _419 = _417 + 1.0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _425 = _363 * _409;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _431 = _395 * _419;
    float _433 = -_395;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = _413 * _431;
    float _443 = _415 * _431;
    float _445 = _411 * _431;
    float _447 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].x, _441);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].y, _443);
    float _451 = fma(_423, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _453;
    float _457 = fma(_439, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = fma(_429, _339, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _465 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].z, _445);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _467;
    float _471 = fma(_451, _425, _447);
    float _473 = fma(_455, _365, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = fma(_461, _365, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _477 = fma(_469, _365, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _479 = fma(_457, _425, _449);
    float _481 = fma(_463, _425, _465);
    float _483 = fma(_473, _383, _471);
    float _485 = fma(_475, _383, _479);
    float _487 = fma(_477, _383, _481);
    float _489 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[146].x, _483);
    float _491 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[146].y, _485);
    float _493 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[146].z, _487);
    bool _495 = !_329;
    float _513;
    if (!_495)
    {
        float _497 = in.m_55.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_95);
        float _519 = 1.0 / _517;
        float _521 = _129 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = in.m_53.x;
    float _527 = in.m_53.y;
    float _529 = in.m_53.z;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _533 = _523 + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _551 = 1.0 / _537;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _553;
    float _557 = 1.0 / _541;
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _561 = _491 * _527;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _565 = _523 + _563;
    float _567 = 1.0 / _545;
    float _569 = _493 * _529;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _573 = _523 + _571;
    bool _575 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _577 = isnan(_523);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = _533 * _551;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _589;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _595 = _523 + _593;
    float _597 = _489 * _525;
    float _599 = 1.0 / _549;
    float _601 = _565 * _557;
    bool _603 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _605 = isnan(_523);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _617 = _523 + _615;
    float _619 = -_585;
    float _621 = _619 + 1.0;
    bool _623 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _625 = isnan(_523);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = fma(_591, _587, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _637 = 1.0 / _555;
    float _639 = _573 * _567;
    float _641 = -_613;
    float _643 = _641 + 1.0;
    bool _645 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _647 = isnan(_523);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_633;
    float _659 = _657 + 1.0;
    float _661 = _585 * _643;
    float _663 = _617 * _599;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _669;
    float _673 = _655 * _621;
    float _675 = -_655;
    float _677 = _675 + 1.0;
    float _679 = fma(_667, _587, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _681 = fma(_671, _587, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _683 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _685 = isnan(_523);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = _595 * _637;
    bool _697 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _699 = isnan(_523);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = _633 * _677;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _723 = _693 * _659;
    float _725 = -_693;
    float _727 = _725 + 1.0;
    float _729 = fma(_713, _601, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _731 = fma(_717, _601, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _733 = fma(_721, _601, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _735 = _707 * _727;
    float _737 = -_707;
    float _739 = _737 + 1.0;
    float _741 = _679 * _735;
    float _743 = _635 * _735;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _745;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _749;
    float _753 = _681 * _735;
    float _755 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[107].x, _741);
    float _757 = fma(_747, _639, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _759 = fma(_751, _639, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _765;
    float _769 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[107].y, _753);
    float _771 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[107].z, _743);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _777 = fma(_729, _723, _755);
    float _779 = fma(_763, _663, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _781 = fma(_767, _639, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _783 = fma(_775, _663, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _785 = fma(_731, _723, _769);
    float _787 = fma(_733, _723, _771);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _793 = fma(_757, _709, _777);
    float _795 = fma(_781, _709, _785);
    float _797 = fma(_759, _709, _787);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _803;
    float _807 = fma(_791, _663, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _809;
    float _813 = fma(_779, _673, _793);
    float _815 = fma(_801, _695, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _817 = fma(_805, _695, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _819 = fma(_811, _695, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _821 = fma(_783, _673, _795);
    float _823 = fma(_807, _673, _797);
    float _825 = fma(_815, _661, _813);
    float _827 = fma(_817, _661, _821);
    float _829 = fma(_819, _661, _823);
    float _831 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[112].x, _825);
    float _833 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[112].y, _827);
    float _835 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[112].z, _829);
    bool _837 = !_559;
    float _855;
    if (!_837)
    {
        float _839 = in.m_55.x;
        float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _843 = _839 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _845 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _847 = _845 * _841;
        float _849 = floor(_847);
        float _851 = -_849;
        float _853 = _847 + _851;
        _855 = _853;
        _857 = true;
    }
    else
    {
        float _859 = float(_95);
        float _861 = 1.0 / _859;
        float _863 = _129 * _861;
        _855 = _863;
    }
    _857 = false;
    float _865 = _855;
    int _867 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _869 = _867;
    int _871 = 0;
    int _873 = _86(_869, _871, (*spvDescriptorSet0.support_buffer));
    float _875 = in.m_55.x;
    float _877 = in.m_55.y;
    float _879 = in.m_55.z;
    float _881 = _129 + _879;
    float _883 = _881 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _885 = float(_873);
    int _887 = abs(_873);
    bool _889 = _873 == 0;
    float _891 = _883 * _885;
    float _893 = float(uint(_887));
    float _895 = trunc(_891);
    int _897 = int(_895);
    float _899 = 1.0 / _893;
    int _901 = abs(_897);
    uint _904 = uint(int(uint(_897) >> uint(31)));
    float _906 = float(uint(_901));
    int _908 = ~int(_904);
    int _910 = _908 + 1;
    int _912 = as_type<int>(_899) + (-2);
    float _914 = as_type<float>(_912) * _906;
    float _916 = trunc(_914);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    int _922 = ~int(_920);
    int _924 = _922 + 1;
    int _926 = _924 * _887;
    int _928 = _926 + _901;
    float _930 = float(uint(_928));
    float _932 = in.m_57.z;
    float _934 = as_type<float>(_912) * _930;
    float _936 = trunc(_934);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    int _942 = int(_920) + int(_940);
    float _944 = trunc(_932);
    int _946 = int(_944);
    int _948 = ~_942;
    int _950 = _948 + 1;
    int _952 = _950 * _887;
    int _954 = _952 + _901;
    bool _956 = uint(_954) >= uint(_887);
    bool _958 = !_956;
    int _960 = _958 ? 0 : (-1);
    int _962 = ~_942;
    int _964 = _962 + _960;
    int _966 = _964 + 1;
    int _968 = _966 * _887;
    int _970 = _968 + _901;
    int _972 = _970 ^ _910;
    int _974 = ~_910;
    int _976 = _974 + _972;
    int _978 = _976 + 1;
    bool _980 = !_889;
    int _982 = _980 ? _978 : (-1);
    int _984 = _982;
    int _986 = 0;
    int _988 = _87(_984, _986, (*spvDescriptorSet0.support_buffer));
    int _990 = _946;
    int _992 = 0;
    int _994 = _87(_990, _992, (*spvDescriptorSet0.support_buffer));
    float4 _997 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_988, _994)), 0).xyzw;
    float _999 = _997.x;
    float _1001 = _997.y;
    float _1003 = _997.z;
    float _1005 = _997.w;
    float _1007 = _875 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1009 = in.m_57.y;
    int _1011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1013 = _1011 != 0;
    float _1015 = _877 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1019 = _831 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1025 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1017);
    float _1027 = in.m_57.x;
    float _1029 = 1.0 / _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1035 = 0.0;
    float _1037 = _1009;
    float _1039 = _1027;
    if (_1013)
    {
        float _1041 = in.m_55.x;
        _1035 = _1041;
    }
    float _1043 = _1035;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1051 = _1049 != 0;
    float _1053 = 1.0 / _1033;
    float _1055 = -_1045;
    float _1057 = fma(_1007, 2.0, _1055);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1061 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1047);
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1063;
    bool _1067 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1069 = isnan(_865);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1075 = _1071 || _1073;
    float _1077 = float(_1075);
    float _1079 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1025);
    float _1081 = fma(_1015, -2.0, _1059);
    float _1083 = _1065 * _1029;
    bool _1085 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1087 = isnan(_865);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    float _1097 = -_1077;
    float _1099 = _1097 + 1.0;
    bool _1101 = _877 > 0.5;
    bool _1103 = _1101 && _1051;
    float _1105 = _1079 * (-0.15915493667125701904296875);
    float _1107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1113 = _1095 * _1099;
    float _1115 = -_1095;
    float _1117 = _1115 + 1.0;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1121 = _865 + _1119;
    float _1123 = _1111 * _1053;
    bool _1125 = _1043 > 0.5;
    bool _1127 = _1125 && _1013;
    float _1129 = -_129;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1057);
    float _1133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1135 = _1053;
    if (_1013)
    {
        _1135 = _1027;
    }
    float _1137 = _1135;
    float _1139 = fma(_1083, _1121, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1141 = _865 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1143 = isnan(_865);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1155 = _865 + _1153;
    float _1157 = _1137;
    if (_1103)
    {
        float _1159 = -_1009;
        float _1161 = _1159 + 1.0;
        _1037 = _1161;
    }
    float _1163 = _1037;
    int _1165 = _982 + 1;
    float _1167 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1081);
    float _1169 = _1105 * 6.283185482025146484375;
    float _1171 = sin(_1169);
    float _1173 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1175 = _1151 * _1117;
    if (_1127)
    {
        float _1177 = -_1137;
        float _1179 = _1177 + 1.0;
        _1157 = _1179;
    }
    float _1181 = _1157;
    float _1183 = -_1151;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_1123, _1155, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1189 = _1139 * _1175;
    float _1191 = _1105 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1013)
    {
        _1039 = _1181;
    }
    float _1197 = _1039;
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1189);
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1203 = fma(_1195, _1163, -0.5);
    float _1205 = fma(_1173, _1197, -0.5);
    float _1207 = fma(_1187, _1113, _1199);
    float _1209 = _1171 * _1203;
    float _1211 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1201);
    float _1213 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1215 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1061);
    float _1217 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1211);
    float _1219 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1193 * _1203;
    float _1223 = -_1209;
    float _1225 = fma(_1193, _1205, _1223);
    float _1227 = fma(_1171, _1205, _1221);
    float _1229 = _835 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1231 = abs(_1165);
    float _1233 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1207);
    float _1235 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1239 = float(uint(_1231));
    float _1241 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1243 = uint(int(uint(_1165) >> uint(31)));
    float _1245 = fma(_1215, _1225, _1131);
    float _1247 = -_1167;
    float _1249 = fma(_1217, _1227, _1247);
    float _1251 = as_type<float>(_912) * _1239;
    out.m_59.x = _1235;
    out.m_59.y = _1219;
    out.m_59.z = _1237;
    out.m_59.w = _1241;
    int _1253 = ~int(_1243);
    int _1255 = _1253 + 1;
    float _1257 = trunc(_1251);
    float _1259 = precise::max(_1257, 0.0);
    uint _1261 = uint(_1259);
    int _1263 = ~int(_1261);
    int _1265 = _1263 + 1;
    int _1267 = _1265 * _887;
    int _1269 = _1267 + _1231;
    float _1271 = float(uint(_1269));
    float _1273 = as_type<float>(_912) * _1271;
    float _1275 = _1245 + 0.5;
    float _1277 = trunc(_1273);
    float _1279 = precise::max(_1277, 0.0);
    uint _1281 = uint(_1279);
    int _1283 = int(_1261) + int(_1281);
    int _1285 = ~_1283;
    int _1287 = _1285 + 1;
    int _1289 = _1287 * _887;
    int _1291 = _1289 + _1231;
    bool _1293 = uint(_1291) >= uint(_887);
    bool _1295 = !_1293;
    int _1297 = _1295 ? 0 : (-1);
    int _1299 = ~_1283;
    int _1301 = _1299 + _1297;
    int _1303 = _1301 + 1;
    int _1305 = _1303 * _887;
    int _1307 = _1305 + _1231;
    float _1309 = _1249 + 0.5;
    int _1311 = _1307 ^ _1255;
    int _1313 = ~_1255;
    int _1315 = _1313 + _1311;
    int _1317 = _1315 + 1;
    bool _1319 = !_889;
    int _1321 = _1319 ? _1317 : (-1);
    uint _1323 = as_type<uint>(half2(float2(_1005, 0.0)));
    uint _1325 = extract_bits(_1323, 0u, 8u);
    int _1327 = int(_1325) & 255;
    uint _1329 = extract_bits(_1323, 8u, 8u);
    int _1331 = int(_1329) & 255;
    int _1333 = _1331 << 8;
    int _1335 = _1327 | _1333;
    bool _1337 = _1335 >= 32768;
    int _1339 = _1335 + (-1024);
    int _1341 = _1339;
    if (_1337)
    {
        int _1343 = ~_1335;
        int _1345 = _1343 + 33792;
        int _1347 = _1345 + 1;
        _1341 = _1347;
    }
    int _1349 = _1341;
    int _1351 = _1349 + 30719;
    float _1353 = float(_1351);
    float _1355 = fma(_1353, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1357 = abs(_1355);
    float _1359 = -_1357;
    float _1361 = _1359 + 1.0;
    int _1363 = as_type<int>(_1361) + (-218103808);
    bool _1365 = uint(_1363) >= 1920991232u;
    bool _1367 = !_1365;
    if (!_1367)
    {
        int _1369;
        _84(_1369, out.gl_Position, out.gl_PointSize);
    }
    int _1371 = _1321;
    int _1373 = 0;
    int _1375 = _87(_1371, _1373, (*spvDescriptorSet0.support_buffer));
    int _1377 = _946;
    int _1379 = 0;
    int _1381 = _87(_1377, _1379, (*spvDescriptorSet0.support_buffer));
    float4 _1383 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1375, _1381)), 0).xyzw;
    float _1385 = _1383.x;
    float _1387 = _1383.y;
    float _1389 = _1383.z;
    float _1391 = _1383.w;
    float _1393 = floor(_891);
    float _1395 = -_1393;
    float _1397 = _891 + _1395;
    uint _1399 = as_type<uint>(half2(float2(_1391, 0.0)));
    float _1401 = -_1003;
    float _1403 = _1401 + _1389;
    uint _1405 = extract_bits(_1399, 0u, 8u);
    int _1407 = int(_1405) & 255;
    uint _1409 = extract_bits(_1399, 8u, 8u);
    int _1411 = int(_1409) & 255;
    int _1413 = _1411 << 8;
    int _1415 = _1407 | _1413;
    bool _1417 = _1415 >= 32768;
    int _1419 = _1415 + (-1024);
    int _1421 = _1419;
    if (_1417)
    {
        int _1423 = ~_1415;
        int _1425 = _1423 + 33792;
        int _1427 = _1425 + 1;
        _1421 = _1427;
    }
    int _1429 = _1421;
    int _1431 = _1429 + 30719;
    float _1433 = float(_1431);
    float _1435 = fma(_1433, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1437 = -_999;
    float _1439 = _1437 + _1385;
    float _1441 = fma(_1397, _1403, _1003);
    float _1443 = abs(_1435);
    float _1445 = -_1443;
    float _1447 = _1445 + 1.0;
    float _1449 = fma(_1397, _1439, _999);
    int _1451 = as_type<int>(_1447) + (-218103808);
    bool _1453 = uint(_1451) >= 1920991232u;
    float _1455 = -_1001;
    float _1457 = _1455 + _1387;
    float _1459 = fma(_1397, _1457, _1001);
    bool _1461 = !_1453;
    if (!_1461)
    {
        int _1463;
        _84(_1463, out.gl_Position, out.gl_PointSize);
    }
    float _1465 = in.m_55.x;
    float _1467 = in.m_55.y;
    float _1469 = in.m_55.z;
    float _1471 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1473 = log2(_1471);
    float _1475 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1477 = in.m_61.w;
    float _1479 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1483 = _1481 != 0;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1487 = _1485 != 0;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1491 = _1489 != 0;
    float _1493 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_63.x = _1275;
    out.m_63.y = _1309;
    float _1495 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1475);
    float _1497 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1479);
    float _1499 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1493);
    float _1501 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1497);
    float _1503 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1499);
    float _1505 = _1473 * _129;
    float _1507 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1509 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1495);
    float _1511 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1513 = exp2(_1505);
    float _1515 = _1501 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1517 = _1469 * 2.0;
    float _1519 = _1465 * 2.0;
    float _1521 = _1467 + _1465;
    float _1523 = _1467 + _1469;
    out.m_65.w = _1477;
    bool _1525 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1527 = isnan(0.0);
    bool _1529 = _1525 || _1527;
    bool _1531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1533 = _1529 || _1531;
    float _1535 = floor(_1517);
    float _1537 = _1521 + (-1.0);
    float _1539 = _1523 + (-1.0);
    float _1541 = _1509 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1543 = _1467 * 2.0;
    float _1545 = -_1513;
    float _1547 = _1545 + 1.0;
    float _1549 = floor(_1519);
    float _1551 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1555 = _1515 + _1553;
    float _1557 = _1533 ? _1547 : 0.0;
    float _1559 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1507);
    float _1561 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1511);
    float _1563 = floor(_1543);
    bool _1565 = _1535 > 0.0;
    float _1567 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1569 = _1535 >= 0.0;
    bool _1571 = isnan(_1535);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.0);
    bool _1577 = _1573 || _1575;
    float _1579 = _1503 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1581 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1583 = _1541 + _1581;
    int _1585 = _1577 ? 0 : 1;
    float _1587 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1567);
    bool _1589 = _1549 > 0.0;
    float _1591 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1593 = ~_1585;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    float _1599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1601 = _1579 + _1599;
    bool _1603 = _1549 >= 0.0;
    bool _1605 = isnan(_1549);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan(0.0);
    bool _1611 = _1607 || _1609;
    float _1613 = _1555 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1615 = _1597;
    if (!_1565)
    {
        int _1617 = ~_1585;
        int _1619 = _1617 + 1;
        _1615 = _1619;
    }
    int _1621 = _1615;
    float _1623 = _1555 * _1555;
    bool _1625 = _1563 > 0.0;
    bool _1627 = _1563 >= 0.0;
    bool _1629 = isnan(_1563);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.0);
    bool _1635 = _1631 || _1633;
    float _1637 = fma(_1583, _1583, _1623);
    bool _1639 = !_1483;
    int _1641 = _1639 ? 0 : 1;
    float _1643 = fma(_1601, _1601, _1637);
    bool _1645 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1647 = isnan(1.0);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1653 = _1649 || _1651;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1657 = 1.0 + _1655;
    float _1659 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1613);
    float _1661 = 1.0 / _1657;
    float _1663 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1659);
    float _1665 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1561);
    int _1667 = abs(_1641);
    float _1669 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1587);
    int _1671 = _1611 ? 0 : 1;
    float _1673 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1559);
    bool _1675 = _1663 >= 0.0;
    float _1677 = in.m_67.x;
    float _1679 = in.m_67.y;
    float _1681 = in.m_67.z;
    float _1683 = rsqrt(_1665);
    bool _1685 = !_1487;
    int _1687 = _1685 ? 0 : 1;
    float _1689 = float(_1667);
    float _1691 = _1661;
    if (_1653)
    {
        float _1693 = _1557 * _1661;
        _131 = _1693;
    }
    float _1695 = _131;
    float _1697 = float(_1621);
    int _1699 = abs(_1687);
    float _1701 = rsqrt(_1669);
    int _1703 = ~_1671;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    float _1709 = _1689 * _1697;
    int _1711 = _1707;
    int _1713 = as_type<int>(_1709);
    if (_1675)
    {
        _1691 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1715 = _1691;
    if (_1675)
    {
        out.m_49.x = 0.0;
    }
    if (!_1589)
    {
        int _1717 = ~_1671;
        int _1719 = _1717 + 1;
        _1711 = _1719;
    }
    int _1721 = _1711;
    float _1723 = _1709 * (-2.0);
    float _1725 = rsqrt(_1643);
    if (_1675)
    {
        float _1727 = _1715 * 5.0;
        _1713 = as_type<int>(_1727);
    }
    int _1729 = _1713;
    int _1731 = _1635 ? 0 : 1;
    float _1733 = fma(_1591, _1723, _1591);
    float _1735 = float(_1699);
    float _1737 = fma(_1723, _1677, _1677);
    float _1739 = float(_1721);
    if (_1675)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5396 = as_type<float>(_1729);
        out.gl_Position.z = _5396;
    }
    int _1741 = ~_1731;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    int _1747 = _1745;
    if (!_1625)
    {
        int _1749 = ~_1731;
        int _1751 = _1749 + 1;
        _1747 = _1751;
    }
    int _1753 = _1747;
    float _1755 = _1735 * _1739;
    float _1757 = _1465 + (-0.5);
    bool _1759 = !_1491;
    int _1761 = _1759 ? 0 : 1;
    float _1763 = _1555 * _1725;
    float _1765 = _1583 * _1725;
    if (_1675)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1767 = -_1763;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1515);
    float _1771 = _1755 * (-2.0);
    float _1773 = -_1765;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1541);
    float _1777 = _1601 * _1725;
    float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1781 = _1769 + _1779;
    float _1783 = fma(_1757, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1737);
    float _1785 = fma(_1551, _1771, _1551);
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1789 = _1775 + _1787;
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1793 = fma(_1771, _1679, _1679);
    float _1795 = -_1777;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1579);
    float _1799 = fma(_1733, _1695, _1783);
    int _1801 = abs(_1761);
    float _1803 = fma(_1789, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1791);
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1807 = _1797 + _1805;
    float _1809 = _1799 * 0.15915493667125701904296875;
    float _1811 = _1467 + (-0.5);
    float _1813 = float(_1801);
    float _1815 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1803);
    float _1817 = float(_1753);
    float _1819 = _1469 + _1465;
    float _1821 = fma(_1811, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1793);
    float _1823 = _1469 + (-0.5);
    bool _1825 = _1815 >= 0.0;
    float _1827 = _1813 * _1817;
    float _1829 = _1819 + (-1.0);
    float _1831 = fma(_1785, _1695, _1821);
    float _1833 = _1827 * (-2.0);
    float _1835 = rsqrt(_1673);
    float _1837 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1839 = _1831 * 0.15915493667125701904296875;
    float _1841 = fma(_1833, _1681, _1681);
    float _1843 = -_1763;
    float _1845 = fma(_1843, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1555);
    float _1847 = fma(_1837, _1833, _1837);
    float _1849 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1841);
    float _1851 = sqrt(_1673);
    float _1853 = as_type<float>(_1801);
    int _1855 = as_type<int>(_1823);
    if (_1825)
    {
        _1853 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1857 = _1853;
    float _1859 = fma(_1847, _1695, _1849);
    if (_1825)
    {
        out.m_49.x = 0.0;
    }
    if (_1825)
    {
        float _1861 = _1857 * 5.0;
        _1855 = as_type<int>(_1861);
    }
    int _1863 = _1855;
    float _1865 = _1809 * 6.283185482025146484375;
    float _1867 = sin(_1865);
    if (_1825)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5612 = as_type<float>(_1863);
        out.gl_Position.z = _5612;
    }
    float _1869 = _1809 * 6.283185482025146484375;
    float _1871 = cos(_1869);
    float _1873 = _1839 * 6.283185482025146484375;
    float _1875 = sin(_1873);
    float _1877 = _1839 * 6.283185482025146484375;
    float _1879 = cos(_1877);
    if (_1825)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1881 = -_1515;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1885 = -_1765;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1583);
    float _1889 = _1859 * 0.15915493667125701904296875;
    float _1891 = -_1541;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1895 = _1883 * _1883;
    float _1897 = _1845 * _1845;
    float _1899 = -_1579;
    float _1901 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1903 = _1889 * 6.283185482025146484375;
    float _1905 = sin(_1903);
    float _1907 = fma(_1893, _1893, _1895);
    float _1909 = fma(_1887, _1887, _1897);
    float _1911 = -_1777;
    float _1913 = fma(_1911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1601);
    float _1915 = _1459 * _1683;
    float _1917 = fma(_1901, _1901, _1907);
    float _1919 = _1867 * _1875;
    float _1921 = fma(_1913, _1913, _1909);
    float _1923 = _1871 * _1879;
    float _1925 = _1449 * _1835;
    float _1927 = _1851 * _1915;
    float _1929 = rsqrt(_1917);
    float _1931 = _1441 * _1701;
    float _1933 = _1851 * _1925;
    float _1935 = _561 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1937 = _569 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1939 = fma(_1905, _1923, _1919);
    float _1941 = fma(_1905, _1919, _1923);
    float _1943 = _1851 * _1931;
    float _1945 = sqrt(_1921);
    float _1947 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1949 = _1871 * _1875;
    float _1951 = _1893 * _1929;
    float _1953 = _1901 * _1929;
    float _1955 = _1883 * _1929;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1959 = _1951 * _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1963 = _1953 * _1961;
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1967 = -_1959;
    float _1969 = fma(_1953, _1965, _1967);
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1973 = _1955 * _1971;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1977 = -_1963;
    float _1979 = fma(_1955, _1975, _1977);
    float _1981 = _1725 * _1945;
    float _1983 = _1969 * _1969;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1987 = -_1973;
    float _1989 = fma(_1951, _1985, _1987);
    float _1991 = _1889 * 6.283185482025146484375;
    float _1993 = cos(_1991);
    float _1995 = fma(_1979, _1979, _1983);
    float _1997 = _1981 * _1935;
    float _1999 = _1981 * _1937;
    float _2001 = _1981 * _1947;
    float _2003 = fma(_1989, _1989, _1995);
    float _2005 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1927);
    float _2007 = _1867 * _1879;
    float _2009 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1933);
    float _2011 = _1997 * _2005;
    float _2013 = rsqrt(_2003);
    float _2015 = -_1949;
    float _2017 = fma(_1905, _2007, _2015);
    float _2019 = _2001 * _2009;
    float _2021 = -_2011;
    float _2023 = _1905 * _2021;
    float _2025 = _1993 * _2011;
    float _2027 = -_2007;
    float _2029 = fma(_1905, _1949, _2027);
    float _2031 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1943);
    float _2033 = _1879 * _1993;
    float _2035 = _1871 * _2025;
    float _2037 = _1875 * _1993;
    float _2039 = _1999 * _2031;
    float _2041 = _1867 * _2025;
    float _2043 = fma(_1939, _2019, _2035);
    float _2045 = fma(_2033, _2019, _2023);
    float _2047 = fma(_2017, _2019, _2041);
    float _2049 = _1969 * _2013;
    float _2051 = _1979 * _2013;
    float _2053 = _1989 * _2013;
    float _2055 = fma(_2029, _2039, _2043);
    float _2057 = _1953 * _2049;
    float _2059 = _1955 * _2051;
    float _2061 = fma(_2037, _2039, _2045);
    float _2063 = fma(_1941, _2039, _2047);
    float _2065 = -_2057;
    float _2067 = fma(_1955, _2053, _2065);
    float _2069 = -_2059;
    float _2071 = fma(_1951, _2049, _2069);
    float _2073 = _2067 * _2055;
    float _2075 = _2071 * _2055;
    float _2077 = fma(_2051, _2061, _2073);
    float _2079 = fma(_2053, _2061, _2075);
    float _2081 = _1951 * _2053;
    float _2083 = fma(_1951, _2063, _2077);
    float _2085 = fma(_1953, _2063, _2079);
    float _2087 = -_2081;
    float _2089 = fma(_1953, _2051, _2087);
    float _2091 = _1541 + _2083;
    float _2093 = _1579 + _2085;
    float _2095 = _2089 * _2055;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2099 = _2091 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2103 = _2093 + _2101;
    float _2105 = fma(_2049, _2061, _2095);
    float _2107 = _2099 * _2099;
    float _2109 = _2103 * _2103;
    float _2111 = fma(_1955, _2063, _2105);
    float _2113 = _2107 + _2109;
    float _2115 = _1515 + _2111;
    float _2117 = sqrt(_2113);
    bool _2119 = _2117 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2121 = _2049;
    float _2123 = _1951;
    float _2125 = _1953;
    float _2127 = _2109;
    float _2129 = _2091;
    float _2131 = _2107;
    if (!_2119)
    {
        _2121 = _2107;
    }
    float _2133 = _2121;
    float _2135 = _2133;
    if (!_2119)
    {
        _2123 = _2093;
    }
    float _2137 = _2123;
    float _2139 = _2137;
    if (!_2119)
    {
        _2125 = _2115;
    }
    float _2141 = _2125;
    bool _2143 = !_2119;
    float _2145 = _2141;
    if (!_2143)
    {
        float _2147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2151 = _2117 + _2149;
        float _2153 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2155 = rsqrt(_2113);
        float _2157 = _2151 * _2147;
        float _2159 = _2157 * 0.15915493667125701904296875;
        float _2161 = _2159 * 6.283185482025146484375;
        float _2163 = sin(_2161);
        float _2165 = _2159 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        float _2169 = fma(_2163, _2153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2171 = _2155 * _2169;
        float _2173 = _2167 + (-1.0);
        float _2175 = _2103 * _2171;
        float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2179 = _2099 * _2171;
        float _2181 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2183 = _2175 * _2175;
        float _2185 = fma(_2115, _2167, _2177);
        float _2187 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2189 = _2179 * _2179;
        _2145 = _2185;
        _2135 = _2189;
        _2127 = _2183;
        _2129 = _2187;
        _2139 = _2181;
    }
    float _2191 = _2145;
    float _2193 = _2135;
    float _2195 = _2127;
    float _2197 = _2129;
    float _2199 = _2139;
    float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2203 = _2191 + _2201;
    float _2205 = fma(_2203, _2203, _2193);
    float _2207 = _2205 + _2195;
    float _2209 = sqrt(_2207);
    bool _2211 = _2209 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2213 = isnan(_2209);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2219 = _2215 || _2217;
    float _2221 = _2205;
    float _2223 = _2209;
    if (!_2219)
    {
        _2221 = 1.0;
    }
    float _2225 = _2221;
    bool _2227 = !_2219;
    float _2229 = _2225;
    if (!_2227)
    {
        bool _2231 = _2209 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2233 = isnan(_2209);
        bool _2235 = _2231 || _2233;
        bool _2237 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2239 = _2235 || _2237;
        if (!_2239)
        {
            float _2241 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2243 = _2209 + _2241;
            float _2245 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2247 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2245;
            float _2249 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2251 = _2249 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2253 = 1.0 / _2247;
            float _2255 = _2243 * _2253;
            float _2257 = fma(_2255, _2251, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2229 = _2257;
            _2259 = true;
        }
        else
        {
            bool _2261 = _2209 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2263 = isnan(_2209);
            bool _2265 = _2261 || _2263;
            bool _2267 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2269 = _2265 || _2267;
            if (!_2269)
            {
                float _2271 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2273 = _2209 + _2271;
                float _2275 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2277 = _2275 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2279 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2281 = _2279 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2283 = 1.0 / _2277;
                float _2285 = _2273 * _2283;
                float _2287 = fma(_2285, _2281, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2229 = _2287;
                _2259 = true;
            }
            else
            {
                _2229 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2259 = false;
    float _2289 = _2229;
    float _2291 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2293 = _2191 + _2291;
    float _2295 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2297 = _2197 + _2295;
    float _2299 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2301 = _2199 + _2299;
    float _2303 = fma(_2293, _2289, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2305 = fma(_2297, _2289, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2307 = fma(_2301, _2289, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2309 = -_1763;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2303);
    float _2313 = -_1765;
    float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2305);
    float _2317 = -_1777;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2307);
    float _2321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2323 = _2311 + _2321;
    float _2325 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2327 = _2315 + _2325;
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2331 = _2319 + _2329;
    float _2333 = _2323 * _2323;
    float _2335 = fma(_2327, _2327, _2333);
    float _2337 = fma(_2331, _2331, _2335);
    float _2339 = rsqrt(_2337);
    float _2341 = sqrt(_2337);
    float _2343 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2345 = _2327 * _2343;
    float _2347 = _2331 * _2343;
    float _2349 = _2345 * _2345;
    float _2351 = _2347 * _2347;
    float _2353 = _2349 + _2351;
    float _2355 = sqrt(_2353);
    bool _2357 = _2355 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2361 = _2355 + _2359;
    float _2363 = _2331;
    float _2365 = _2353;
    float _2367 = _2361;
    float _2369 = _2323;
    if (_2357)
    {
        float _2371 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2363 = _2371;
    }
    float _2373 = _2363;
    if (_2357)
    {
        float _2375 = rsqrt(_2353);
        _2365 = _2375;
    }
    float _2377 = _2365;
    float _2379 = _2377;
    if (_2357)
    {
        float _2381 = _2361 * _2373;
        _2367 = _2381;
    }
    float _2383 = _2367;
    if (_2357)
    {
        float _2385 = _2383 * 0.15915493667125701904296875;
        _2223 = _2385;
    }
    float _2387 = _2223;
    float _2389 = _2373;
    float _2391 = _2387;
    if (_2357)
    {
        float _2393 = _2387 * 6.283185482025146484375;
        float _2395 = sin(_2393);
        _2389 = _2395;
    }
    float _2397 = _2389;
    float _2399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2401 = precise::max(0.0, _2399);
    float _2403 = _2333;
    float _2405 = _2401;
    if (_2357)
    {
        float _2407 = _2387 * 6.283185482025146484375;
        float _2409 = cos(_2407);
        _2403 = _2409;
    }
    float _2411 = _2403;
    float _2413 = -_2343;
    float _2415 = -_2401;
    float _2417 = fma(_2323, _2413, _2415);
    if (!_2357)
    {
        _2369 = _2345;
    }
    float _2419 = _2369;
    float _2421 = _2419;
    if (_2357)
    {
        float _2423 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2405 = _2423;
    }
    float _2425 = _2405;
    float _2427 = _2397;
    float _2429 = _2425;
    if (_2357)
    {
        float _2431 = fma(_2397, _2425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2427 = _2431;
    }
    float _2433 = _2427;
    float _2435 = _2433;
    float _2437 = _2411;
    if (_2357)
    {
        float _2439 = _2411 + (-1.0);
        _2429 = _2439;
    }
    float _2441 = _2429;
    float _2443 = _2441;
    if (_2357)
    {
        float _2445 = _2377 * _2433;
        _2131 = _2445;
    }
    float _2447 = _2131;
    if (!_2357)
    {
        _2435 = _2417;
    }
    float _2449 = _2435;
    float _2451 = _2449;
    if (_2357)
    {
        float _2453 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2391 = _2453;
    }
    float _2455 = _2391;
    if (_2357)
    {
        float _2457 = _2345 * _2447;
        _2421 = _2457;
    }
    float _2459 = _2421;
    if (!_2357)
    {
        _2443 = _2347;
    }
    float _2461 = _2443;
    float _2463 = _2461;
    if (_2357)
    {
        float _2465 = _2347 * _2447;
        _2463 = _2465;
    }
    float _2467 = _2463;
    if (!_2357)
    {
        _2379 = _2349;
    }
    float _2469 = _2379;
    float _2471 = _2469;
    if (_2357)
    {
        float _2473 = fma(_2417, _2411, _2455);
        _2451 = _2473;
    }
    float _2475 = _2451;
    if (_2357)
    {
        float _2477 = _2459 * _2459;
        _2471 = _2477;
    }
    float _2479 = _2471;
    if (!_2357)
    {
        _2437 = _2351;
    }
    float _2481 = _2437;
    float _2483 = _2481;
    if (_2357)
    {
        float _2485 = _2467 * _2467;
        _2483 = _2485;
    }
    float _2487 = _2483;
    float _2489 = fma(_2475, _2475, _2479);
    float _2491 = _2489 + _2487;
    float _2493 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2497 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2495);
    float _2499 = precise::clamp(_2497, 0.0, 1.0);
    float _2501 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2503 = rsqrt(_2491);
    float _2505 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2493);
    float _2507 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2509 = -_2499;
    float _2511 = _2509 + 1.0;
    float _2513 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2501);
    float _2515 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2505);
    float _2517 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2519 = _2311 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2521 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2513);
    float _2523 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2525 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2507);
    float _2527 = abs(_2511);
    float _2529 = log2(_2527);
    float _2531 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2533 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2535 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2525);
    float _2537 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2519);
    float _2539 = _2503 * _2475;
    float _2541 = -_2533;
    float _2543 = fma(_2541, _2517, 1.0);
    float _2545 = _2535 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2547 = _2503 * _2459;
    float _2549 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2551 = _2503 * _2467;
    float _2553 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2537);
    float _2555 = _2547 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2557 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2549);
    float _2559 = log2(_2543);
    float _2561 = _2553 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2563 = -_2555;
    float _2565 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2563);
    float _2567 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2569 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2557);
    float _2571 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2573 = -_2551;
    float _2575 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2565);
    float _2577 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2579 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2569);
    float _2581 = exp2(_2567);
    float _2583 = fma(_2575, -0.5, 0.5);
    float _2585 = fma(_2575, 0.5, 0.5);
    float _2587 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2577);
    float _2589 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2571);
    float _2591 = _2539 + 1.0;
    float _2593 = fma(_2585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2595 = 1.0 / _2579;
    float _2597 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2587);
    float _2599 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2589);
    float _2601 = fma(_2585, _2593, -0.212114393711090087890625);
    float _2603 = _2559 * 0.693147182464599609375;
    float _2605 = fma(_2585, _2601, 1.570728778839111328125);
    float _2607 = sqrt(_2583);
    float _2609 = -_2539;
    float _2611 = fma(_2581, _2591, _2609);
    float _2613 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2597);
    float _2615 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2599);
    float _2617 = fma(_2611, 0.5, 0.5);
    float _2619 = _2613 * _2595;
    float _2621 = _2615 * _2595;
    float _2623 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2625 = fma(_2619, 0.5, 0.5);
    float _2627 = fma(_2621, -0.5, 0.5);
    float _2629 = _2607 * 0.636619746685028076171875;
    float _2631 = -_2605;
    float _2633 = fma(_2629, _2631, 1.0);
    float3 _6845 = float3(_2625, _2627, _2623);
    float _2635 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6845, float3(0.0), isnan(_6845)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6845, float3(0.0), isnan(_6845)), level(0.0)).x;
    float3 _6856 = float3(_2625, _2627, _2623);
    float4 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6856, float3(0.0), isnan(_6856)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6856, float3(0.0), isnan(_6856)), level(0.0)).xyzw;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _2637.w;
    float2 _6872 = float2(_2633, _2617);
    float3 _2649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6872, float2(0.0), isnan(_6872)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6872, float2(0.0), isnan(_6872)), level(0.0)).xyz;
    float _2651 = _2649.x;
    float _2653 = _2649.y;
    float _2655 = _2649.z;
    float _2657 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2659 = _1769 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2661 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2657);
    float _2663 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2659);
    float _2665 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2661);
    float _2667 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2663);
    float _2669 = _2529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2671 = _2665 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2673 = _2667 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2675 = 1.0 / _2671;
    bool _2677 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2681 = _2677 || _2679;
    bool _2683 = isnan(0.5);
    bool _2685 = _2681 || _2683;
    float _2687 = _2531 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2689 = _2673 + _2671;
    float _2691 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2687);
    float _2693 = exp2(_2669);
    float _2695 = fma(_2523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2691);
    float _2697 = fma(_2561, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2695);
    float _2699 = _2529;
    if (_2685)
    {
        _2699 = 1.0;
    }
    float _2701 = _2699;
    float _2703 = _2689 * _2675;
    float _2705 = _2703 * 0.5;
    float _2707 = _2701;
    if (!_2685)
    {
        float _2709 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2711 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2713 = fma(_2705, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2711);
        float _2715 = _2709 * 0.15915493667125701904296875;
        float _2717 = _2715 * 6.283185482025146484375;
        float _2719 = cos(_2717);
        float _2721 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2723 = _2721 * 0.15915493667125701904296875;
        float _2725 = _2715 * 6.283185482025146484375;
        float _2727 = sin(_2725);
        float _2729 = 1.0 / _2719;
        float _2731 = _2723 * 6.283185482025146484375;
        float _2733 = cos(_2731);
        float _2735 = _2727 * _2729;
        float _2737 = 1.0 / _2713;
        float _2739 = _2733 * _2735;
        float _2741 = _2723 * 6.283185482025146484375;
        float _2743 = sin(_2741);
        float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2747 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2745;
        float _2749 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2751 = _2737 * _2749;
        float _2753 = 1.0 / _2739;
        float _2755 = 1.0 / _2747;
        float _2757 = _2743 * _2753;
        float _2759 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2761 = fma(_2757, _2751, _2759);
        float _2763 = _2761 * _2755;
        float _2765 = precise::clamp(_2763, 0.0, 1.0);
        _2707 = _2765;
    }
    float _2767 = _2707;
    float _2769 = -_2693;
    float _2771 = _2769 + 1.0;
    float _2773 = _2579 * 0.5;
    float _2775 = _2767 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2777 = _2767 > 0.0;
    bool _2779 = isnan(_2767);
    bool _2781 = _2777 || _2779;
    bool _2783 = isnan(0.0);
    bool _2785 = _2781 || _2783;
    float _2787 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2789 = fma(_2615, -0.5, _2773);
    float _2791 = _2775 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2793 = _2697 + _2579;
    float _2795 = _2787 * _2635;
    float _2797 = -_2787;
    float _2799 = _2797 + 1.0;
    float _2801 = _2613 + _2579;
    out.gl_Position.x = _2613;
    out.gl_Position.y = _2615;
    out.gl_Position.z = _2697;
    out.gl_Position.w = _2579;
    float _2803 = _2645 * _2795;
    float _2805 = _2655 * _2795;
    float _2807 = _2645 * _2799;
    float _2809 = _2793 * 0.5;
    float _2811 = _2801 * 0.5;
    float _2813 = fma(_2651, _2803, _2639);
    float _2815 = fma(_2653, _2803, _2641);
    float _2817 = fma(_2645, _2805, _2643);
    out.m_49.x = _2791;
    out.m_69.x = _2811;
    out.m_69.y = _2789;
    out.m_69.z = _2809;
    out.m_69.w = _2579;
    out.m_71.x = _2813;
    out.m_71.y = _2815;
    out.m_71.z = _2817;
    out.m_71.w = _2807;
    if (_2785)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2819 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2819;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

