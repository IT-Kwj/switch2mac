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
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_69 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _82(thread const int& _4675, thread const int& _4676, constant _10& support_buffer)
{
    float _4679 = as_type<float>(support_buffer._m4);
    int _4681 = _4676 + as_type<int>(_4679);
    int _4683 = 1 + _4681;
    float _4685 = support_buffer._m5[_4683].x;
    float _4687 = abs(_4685);
    bool _4689 = _4687 == 1.0;
    if (_4689)
    {
        return _4675;
    }
    float _4691 = float(_4675);
    float _4693 = _4691 / _4687;
    int _4695 = int(_4693);
    return _4695;
}

static inline __attribute__((always_inline))
int _83(thread const int& _4725, thread const int& _4726, constant _10& support_buffer)
{
    float _4729 = as_type<float>(support_buffer._m4);
    int _4731 = _4726 + as_type<int>(_4729);
    int _4733 = 1 + _4731;
    float _4735 = support_buffer._m5[_4733].x;
    bool _4737 = _4735 == 1.0;
    if (_4737)
    {
        return _4725;
    }
    float _4739 = float(_4725);
    float _4741 = _4739 * _4735;
    int _4743 = int(_4741);
    return _4743;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _763 = false;
    bool _477 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _91 = int(_89);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    float _99 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _97;
    float _103 = _101;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_95)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    float _111 = as_type<float>(_109);
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1877 = as_type<float>(_109);
        out.gl_Position.z = _1877;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    float _131 = 0.0;
    if (_123)
    {
        float _133 = float(_91);
        _129 = _133;
    }
    float _135 = _129;
    bool _137 = _127 >= _135;
    bool _139 = !_123;
    bool _141 = _137 || _139;
    if (_141)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _103;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    int _145 = 0;
    if (_141)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1945 = as_type<float>(_149);
        out.gl_Position.z = _1945;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = _157;
    if (!_167)
    {
        float _171 = _157 * _157;
        float _173 = _171 * 0.5;
        _131 = _173;
    }
    float _175 = _131;
    float _177 = 0.0;
    float _179 = _175;
    if (!_167)
    {
        float _181 = _127 * _127;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    if (!_167)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _187;
    }
    float _189 = _179;
    bool _191 = !_167;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _157 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _157);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _111 = _211;
        _193 = _223;
        _99 = _213;
    }
    float _225 = _111;
    float _227 = _193;
    float _229 = _99;
    bool _231 = !_167;
    float _233 = _225;
    float _235 = _229;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _157 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _233 = _249;
        _235 = _243;
        _169 = _255;
    }
    float _257 = _233;
    float _259 = _235;
    float _261 = _169;
    float _263 = _259;
    float _265 = _257;
    if (!_167)
    {
        _263 = _127;
    }
    float _267 = _263;
    float _269 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _267;
    if (!_167)
    {
        float _273 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _265 = _273;
    }
    float _275 = _265;
    bool _277 = !_167;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _127 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _127);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _309;
    }
    float _311 = _279;
    bool _313 = !_167;
    if (!_313)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = 1.0 / _321;
        float _325 = _127 * _317;
        float _327 = exp2(_325);
        float _329 = -_327;
        float _331 = _329 + 1.0;
        float _333 = _331 * _323;
        _271 = _333;
    }
    float _335 = _271;
    float _337 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = fma(_261, _153, _269);
    float _341 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = fma(_335, _153, _337);
    float _347 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_261, _151, _341);
    float _353 = fma(_335, _151, _343);
    float _355 = -_345;
    float _357 = _339 + _355;
    float _359 = fma(_261, _155, _347);
    float _361 = fma(_335, _155, _349);
    float _363 = -_353;
    float _365 = _351 + _363;
    float _367 = _357 * _357;
    float _369 = in.m_51.w;
    float _371 = -_361;
    float _373 = _359 + _371;
    float _375 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _377 = fma(_365, _365, _367);
    float _379 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _381 = in.m_44.x;
    float _383 = in.m_44.y;
    float _385 = in.m_44.z;
    float _387 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _389 = fma(_373, _373, _377);
    float _391 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _375);
    float _393 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _379);
    float _395 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _387);
    float _397 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _391);
    float _399 = sqrt(_389);
    float _401 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _395);
    bool _403 = _399 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_399);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _393);
    float _415 = fma(_351, _369, _381);
    float _417 = fma(_339, _369, _383);
    float _419 = fma(_359, _369, _385);
    float _421 = _393;
    float _423 = _397;
    float _425 = _413;
    if (_411)
    {
        _421 = _397;
    }
    float _427 = _421;
    float _429 = _427;
    if (_411)
    {
        _423 = _413;
    }
    float _431 = _423;
    float _433 = _431;
    if (_411)
    {
        _425 = _401;
    }
    float _435 = _425;
    float _437 = _435;
    if (!_411)
    {
        bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _441 = !_439;
        if (!_441)
        {
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _453);
            float _461 = _455 * _455;
            float _463 = fma(_457, _457, _461);
            float _465 = fma(_459, _459, _463);
            float _467 = rsqrt(_465);
            float _469 = _467 * 9.9999999747524270787835121154785e-07;
            float _471 = _457 * _469;
            float _473 = _455 * _469;
            float _475 = _459 * _469;
            _433 = _473;
            _429 = _471;
            _437 = _475;
            _477 = true;
        }
        else
        {
            float _479 = _153 * _153;
            float _481 = fma(_151, _151, _479);
            float _483 = fma(_155, _155, _481);
            float _485 = sqrt(_483);
            bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
            bool _489 = isnan(_485);
            bool _491 = _487 || _489;
            bool _493 = isnan(9.9999999747524270787835121154785e-07);
            bool _495 = _491 || _493;
            if (!_495)
            {
                float _497 = _383 * _383;
                float _499 = fma(_381, _381, _497);
                float _501 = fma(_385, _385, _499);
                float _503 = sqrt(_501);
                bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
                bool _507 = isnan(_503);
                bool _509 = _505 || _507;
                bool _511 = isnan(9.9999999747524270787835121154785e-07);
                bool _513 = _509 || _511;
                if (!_513)
                {
                    float _515 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _515);
                    float _519 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _517);
                    float _521 = rsqrt(_519);
                    float _523 = _521 * 9.9999999747524270787835121154785e-07;
                    float _525 = _523 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _527 = _523 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _529 = _523 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _433 = _527;
                    _429 = _525;
                    _437 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _433 = _561;
                    _429 = _559;
                    _437 = _563;
                    _477 = true;
                }
            }
            else
            {
                float _565 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _567 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _569 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _571 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
                float _573 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _567);
                float _575 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
                float _577 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
                float _579 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
                float _581 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _575);
                float _583 = _577 * _577;
                float _585 = fma(_579, _579, _583);
                float _587 = fma(_581, _581, _585);
                float _589 = rsqrt(_587);
                float _591 = _589 * 9.9999999747524270787835121154785e-07;
                float _593 = _579 * _591;
                float _595 = _577 * _591;
                float _597 = _581 * _591;
                _433 = _595;
                _429 = _593;
                _437 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _433;
    float _601 = _429;
    float _603 = _437;
    float _605 = in.m_53.x;
    float _607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _609 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _613 = _609 * _607;
    float _615 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _617 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].x, _613);
    float _619 = _615 * _611;
    float _621 = floor(_617);
    float _623 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].y, _619);
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _631 = _629 != 0;
    float _633 = _617 * 6.283185482025146484375;
    int _635 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _637 = _635 != 0;
    float _639 = _633 * 0.15915493667125701904296875;
    float _641 = floor(_623);
    bool _643 = !_627;
    int _645 = _643 ? 0 : 1;
    int _647 = abs(_645);
    float _649 = -_621;
    float _651 = _617 + _649;
    float _653 = _623 * 6.283185482025146484375;
    float _655 = _639 * 6.283185482025146484375;
    float _657 = cos(_655);
    bool _659 = !_631;
    int _661 = _659 ? 0 : 1;
    float _663 = _653 * 0.15915493667125701904296875;
    float _665 = -_641;
    float _667 = _623 + _665;
    float _669 = -_651;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _673 = _663 * 6.283185482025146484375;
    float _675 = cos(_673);
    float _677 = float(_647);
    float _679 = -_667;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _683 = !_637;
    int _685 = _683 ? 0 : 1;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _689 = abs(_671);
    float _691 = _677 * _689;
    float _693 = fma(_657, 0.5, 0.5);
    int _695 = abs(_685);
    float _697 = abs(_681);
    float _699 = _677 * _697;
    bool _701 = _651 < 0.5;
    float _703 = float(_701);
    float _705 = -_693;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _709 = abs(_661);
    bool _711 = _667 < 0.5;
    float _713 = float(_711);
    float _715 = -_703;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _719 = fma(_675, 0.5, 0.5);
    float _721 = float(_695);
    float _723 = -_719;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _727 = float(_709);
    float _729 = -_713;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _733 = fma(_721, _707, _691);
    float _735 = fma(_721, _725, _699);
    float _737 = abs(_717);
    float _739 = fma(_727, _737, _733);
    float _741 = abs(_731);
    float _743 = fma(_727, _741, _735);
    bool _745 = !_687;
    float _761;
    if (!_745)
    {
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _749 = _605 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_91);
        float _767 = 1.0 / _765;
        float _769 = _127 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    int _773 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _775 = _773;
    int _777 = 0;
    int _779 = _82(_775, _777, (*spvDescriptorSet0.support_buffer));
    float _781 = _605 * 8.0;
    float _783 = in.m_55.z;
    float _785 = rint(_781);
    float _787 = _785 * 0.125;
    float _789 = precise::clamp(_787, 0.0, 1.0);
    float _791 = trunc(_783);
    int _793 = int(_791);
    int _795 = _779 + (-1);
    float _797 = float(_795);
    float _799 = _789 * _797;
    float _801 = trunc(_799);
    int _803 = int(_801);
    int _805 = _803 + 1;
    int _807 = min(_795, _805);
    int _809 = _803;
    int _811 = 0;
    int _813 = _83(_809, _811, (*spvDescriptorSet0.support_buffer));
    int _815 = _793;
    int _817 = 0;
    int _819 = _83(_815, _817, (*spvDescriptorSet0.support_buffer));
    float3 _823 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_813, _819)), 0).xyz;
    float _825 = _823.x;
    float _827 = _823.y;
    float _829 = _823.z;
    int _831 = _807;
    int _833 = 0;
    int _835 = _83(_831, _833, (*spvDescriptorSet0.support_buffer));
    int _837 = _793;
    int _839 = 0;
    int _841 = _83(_837, _839, (*spvDescriptorSet0.support_buffer));
    float3 _843 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_835, _841)), 0).xyz;
    float _845 = _843.x;
    float _847 = _843.y;
    float _849 = _843.z;
    float _851 = _599 * _599;
    float _853 = in.m_51.x;
    float _855 = in.m_51.y;
    float _857 = in.m_51.z;
    float _859 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _861 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _863 = fma(_601, _601, _851);
    float _865 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _867 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _861);
    float _869 = fma(_603, _603, _863);
    float _871 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _859);
    float _873 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _865);
    float _875 = rsqrt(_869);
    float _877 = _853 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _879 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _871);
    float _881 = _857 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _883 = _875 * _603;
    float _885 = _875 * _601;
    float _887 = _875 * _599;
    float _889 = _855 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _891 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _893 = _883 * _891;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _897 = _885 * _895;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _901 = _887 * _899;
    float _903 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].z, _867);
    float _905 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _907 = -_893;
    float _909 = fma(_885, _905, _907);
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _913 = -_897;
    float _915 = fma(_887, _911, _913);
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _919 = -_901;
    float _921 = fma(_883, _917, _919);
    float _923 = _743 * _889;
    float _925 = _909 * _909;
    float _927 = floor(_799);
    float _929 = _739 * _877;
    float _931 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _933 = fma(_921, _921, _925);
    float _935 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _937 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _939 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    float _941 = fma(_915, _915, _933);
    float _943 = _879 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _945 = _903 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _947 = _939 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _949 = rsqrt(_941);
    float _951 = -_927;
    float _953 = _799 + _951;
    float _955 = _921 * _949;
    float _957 = -_827;
    float _959 = _957 + _847;
    float _961 = -_825;
    float _963 = _961 + _845;
    float _965 = _909 * _949;
    float _967 = -_829;
    float _969 = _967 + _849;
    float _971 = fma(_953, _959, _827);
    float _973 = fma(_953, _963, _825);
    float _975 = _915 * _949;
    float _977 = fma(_953, _969, _829);
    float _979 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _971);
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _973);
    float _983 = _887 * _975;
    float _985 = _883 * _955;
    float _987 = _931 * _979;
    float _989 = _937 * _981;
    float _991 = -_983;
    float _993 = fma(_883, _965, _991);
    float _995 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _977);
    float _997 = _987 * _883;
    float _999 = _885 * _965;
    float _1001 = -_985;
    float _1003 = fma(_885, _975, _1001);
    float _1005 = _935 * _995;
    float _1007 = fma(_989, _975, _997);
    float _1009 = _987 * _885;
    float _1011 = -_999;
    float _1013 = fma(_887, _955, _1011);
    float _1015 = _987 * _887;
    float _1017 = fma(_989, _955, _1009);
    float _1019 = fma(_1005, _1013, _1007);
    float _1021 = fma(_989, _965, _1015);
    float _1023 = fma(_1005, _993, _1017);
    float _1025 = _947 + _1019;
    float _1027 = fma(_1005, _1003, _1021);
    float _1029 = _943 + _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1033 = _1025 + _1031;
    float _1035 = _945 + _1027;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1039 = _1029 + _1037;
    float _1041 = _1033 * _1033;
    float _1043 = fma(_1039, _1039, _1041);
    float _1045 = sqrt(_1043);
    bool _1047 = _1045 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1049 = _945;
    float _1051 = _947;
    float _1053 = _1029;
    float _1055 = _1003;
    float _1057 = _935;
    if (!_1047)
    {
        _1049 = _1025;
    }
    float _1059 = _1049;
    float _1061 = _1059;
    if (!_1047)
    {
        _1051 = _1035;
    }
    float _1063 = _1051;
    bool _1065 = !_1047;
    float _1067 = _1063;
    if (!_1065)
    {
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1073 = _1045 + _1071;
        float _1075 = rsqrt(_1043);
        float _1077 = _1073 * _1069;
        float _1079 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = _1077 * 0.15915493667125701904296875;
        float _1083 = _1081 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = _1081 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 + (-1.0);
        float _1093 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1095 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = fma(_1035, _1085, _1093);
        float _1099 = _1075 * _1095;
        float _1101 = fma(_1039, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1103 = fma(_1033, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1067 = _1097;
        _1053 = _1101;
        _1061 = _1103;
    }
    float _1105 = _1067;
    float _1107 = _1053;
    float _1109 = _1061;
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1113 = _1105 + _1111;
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1117 = _1107 + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = _1109 + _1119;
    float _1123 = _1113 * _1113;
    float _1125 = fma(_1117, _1117, _1123);
    float _1127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1129 = fma(_1121, _1121, _1125);
    float _1131 = rsqrt(_1129);
    float _1133 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1135 = _1117 * _1133;
    float _1137 = _1121 * _1133;
    float _1139 = _1135 * _1135;
    float _1141 = _1137 * _1137;
    float _1143 = _1139 + _1141;
    float _1145 = sqrt(_1143);
    bool _1147 = _1145 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1151 = _1145 + _1149;
    float _1153 = _1131;
    float _1155 = _1143;
    float _1157 = _1151;
    float _1159 = _1113;
    float _1161 = _1135;
    if (_1147)
    {
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1153 = _1163;
    }
    float _1165 = _1153;
    if (_1147)
    {
        float _1167 = rsqrt(_1143);
        _1155 = _1167;
    }
    float _1169 = _1155;
    if (_1147)
    {
        float _1171 = _1151 * _1165;
        _1157 = _1171;
    }
    float _1173 = _1157;
    if (_1147)
    {
        float _1175 = _1173 * 0.15915493667125701904296875;
        _1055 = _1175;
    }
    float _1177 = _1055;
    float _1179 = _1121;
    if (_1147)
    {
        float _1181 = _1177 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        _1179 = _1183;
    }
    float _1185 = _1179;
    float _1187 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1189 = precise::max(0.0, _1187);
    float _1191 = _1039;
    float _1193 = _1189;
    float _1195 = _1187;
    if (_1147)
    {
        float _1197 = _1177 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        _1191 = _1199;
    }
    float _1201 = _1191;
    float _1203 = -_1133;
    float _1205 = -_1189;
    float _1207 = fma(_1113, _1203, _1205);
    if (_1147)
    {
        float _1209 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1193 = _1209;
    }
    float _1211 = _1193;
    float _1213 = _1211;
    float _1215 = _1185;
    if (_1147)
    {
        float _1217 = fma(_1185, _1211, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1213 = _1217;
    }
    float _1219 = _1213;
    float _1221 = _1219;
    if (!_1147)
    {
        _1215 = _1137;
    }
    float _1223 = _1215;
    float _1225 = _1223;
    if (_1147)
    {
        float _1227 = _1201 + (-1.0);
        _1195 = _1227;
    }
    float _1229 = _1195;
    float _1231 = _1229;
    if (_1147)
    {
        float _1233 = _1169 * _1219;
        _1057 = _1233;
    }
    float _1235 = _1057;
    if (!_1147)
    {
        _1221 = _1207;
    }
    float _1237 = _1221;
    float _1239 = sqrt(_1129);
    float _1241 = _1237;
    if (_1147)
    {
        float _1243 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1159 = _1243;
    }
    float _1245 = _1159;
    float _1247 = _1245;
    if (_1147)
    {
        float _1249 = _1135 * _1235;
        _1161 = _1249;
    }
    float _1251 = _1161;
    if (!_1147)
    {
        _1231 = _1139;
    }
    float _1253 = _1231;
    float _1255 = _1253;
    if (_1147)
    {
        float _1257 = _1137 * _1235;
        _1225 = _1257;
    }
    float _1259 = _1225;
    if (_1147)
    {
        float _1261 = fma(_1207, _1201, _1245);
        _1241 = _1261;
    }
    float _1263 = _1241;
    if (_1147)
    {
        float _1265 = _1251 * _1251;
        _1255 = _1265;
    }
    float _1267 = _1255;
    if (!_1147)
    {
        _1247 = _1141;
    }
    float _1269 = _1247;
    float _1271 = _1269;
    if (_1147)
    {
        float _1273 = _1259 * _1259;
        _1271 = _1273;
    }
    float _1275 = _1271;
    float _1277 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1279 = fma(_1263, _1263, _1267);
    float _1281 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1283 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1277);
    float _1285 = _1279 + _1275;
    float _1287 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1281);
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1291 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1289);
    float _1293 = precise::clamp(_1291, 0.0, 1.0);
    float _1295 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1297 = rsqrt(_1285);
    float _1299 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1287);
    float _1301 = -_1293;
    float _1303 = _1301 + 1.0;
    float _1305 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1307 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1295);
    float _1309 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1311 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1305);
    float _1313 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1307);
    float _1315 = abs(_1303);
    float _1317 = log2(_1315);
    float _1319 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1283);
    float _1321 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1311);
    float _1323 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1325 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1327 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1329 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1331 = _1297 * _1251;
    float _1333 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1335 = _1297 * _1263;
    float _1337 = _1297 * _1259;
    float _1339 = _1331 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1333);
    float _1343 = -_1325;
    float _1345 = fma(_1343, _1127, 1.0);
    float _1347 = -_1339;
    float _1349 = fma(_1335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1347);
    float _1351 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1341);
    float _1353 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1355 = log2(_1345);
    float _1357 = -_1337;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1349);
    float _1361 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1351);
    float _1363 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1365 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1367 = fma(_1359, -0.5, 0.5);
    float _1369 = fma(_1359, 0.5, 0.5);
    float _1371 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1363);
    float _1373 = exp2(_1353);
    float _1375 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1365);
    float _1377 = _1335 + 1.0;
    float _1379 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1371);
    float _1381 = fma(_1369, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1383 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1375);
    float _1385 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1379);
    float _1387 = 1.0 / _1361;
    float _1389 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1383);
    float _1391 = fma(_1369, _1381, -0.212114393711090087890625);
    float _1393 = _1355 * 0.693147182464599609375;
    float _1395 = fma(_1369, _1391, 1.570728778839111328125);
    float _1397 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1399 = sqrt(_1367);
    float _1401 = -_1335;
    float _1403 = fma(_1373, _1377, _1401);
    float _1405 = fma(_1403, 0.5, 0.5);
    float _1407 = _1385 * _1387;
    float _1409 = _1389 * _1387;
    float _1411 = fma(_1407, 0.5, 0.5);
    float _1413 = fma(_1409, -0.5, 0.5);
    float _1415 = _1399 * 0.636619746685028076171875;
    float3 _3939 = float3(_1411, _1413, _1397);
    float _1417 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3939, float3(0.0), isnan(_3939)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3939, float3(0.0), isnan(_3939)), level(0.0)).x;
    float3 _3950 = float3(_1411, _1413, _1397);
    float4 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3950, float3(0.0), isnan(_3950)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3950, float3(0.0), isnan(_3950)), level(0.0)).xyzw;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = _1420.w;
    float _1430 = -_1395;
    float _1432 = fma(_1415, _1430, 1.0);
    float2 _3972 = float2(_1432, _1405);
    float3 _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3972, float2(0.0), isnan(_3972)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3972, float2(0.0), isnan(_3972)), level(0.0)).xyz;
    float _1436 = _1434.x;
    float _1438 = _1434.y;
    float _1440 = _1434.z;
    float _1442 = in.m_53.z;
    float _1444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1446 = in.m_55.y;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1450 = _605 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1452 = in.m_53.y;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1456 = _1454 != 0;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1460 = in.m_55.x;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1464 = _1462 != 0;
    float _1466 = -_1458;
    float _1468 = fma(_1450, 2.0, _1466);
    float _1470 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1472;
    float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1478 = _1470 * _605;
    float _1480 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1448);
    float _1482 = 1.0 / _1474;
    float _1484 = -_1446;
    float _1486 = _1484 + 1.0;
    float _1488 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1480);
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1492;
    bool _1496 = _1452 > 0.5;
    float _1498 = _1488 * (-0.15915493667125701904296875);
    float _1500 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1490);
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1504 = trunc(_1478);
    int _1506 = int(_1504);
    float _1508 = _1446;
    if (_1456)
    {
        float _1510 = _1496 ? _1486 : _1446;
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1518 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1520 = _605 > 0.5;
    bool _1522 = _1520 && _1464;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1528 = _771 + _1526;
    float _1530 = fma(_1518, -2.0, _1502);
    float _1532 = 1.0 / _1516;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1536 = _771 + _1534;
    float _1538 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1524);
    float _1540 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1500);
    float _1542 = -_127;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1468);
    float _1546 = _1536 * _1482;
    float _1548 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1550 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1552 = isnan(_771);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = _1498 * 6.283185482025146484375;
    float _1564 = cos(_1562);
    int _1566 = _1506 << 4;
    int _1568 = _1566 + 1968;
    float _1570 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1530);
    float _1572 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1538);
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1574;
    uint _1579 = uint(int(uint(_1568) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[int(_1589)][_1591];
    float _1595 = fma(_1548, _1512, -0.5);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1601 = _1528 * _1532;
    float _1603 = fma(_1576, _1546, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1605 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1607 = fma(_1599, _1601, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    int _1609 = _1568 + 8;
    uint _1611 = uint(int(uint(_1609) >> uint(2)));
    uint _1613 = uint(int(uint(int(_1611)) >> uint(2)));
    int _1615 = int(_1611) & 3;
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[int(_1613)][_1615];
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1625 = _1623 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1629 = _1627 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1631 = fma(_1621, _1546, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1633 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1635 = isnan(_771);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = fma(_1494, _1546, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1647 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1649 = isnan(_771);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1655 = _1651 || _1653;
    float _1657 = float(_1655);
    float _1659 = _1498 * 6.283185482025146484375;
    float _1661 = sin(_1659);
    float _1663 = fma(_1625, _1601, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1665 = -_1643;
    float _1667 = _1665 + 1.0;
    float _1669 = fma(_1629, _1601, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1671 = _1657 * _1667;
    float _1673 = -_1657;
    float _1675 = _1673 + 1.0;
    float _1677 = _1657;
    float _1679 = _1460;
    if (!_1464)
    {
        _1677 = _1460;
    }
    float _1681 = _1677;
    float _1683 = _1681;
    if (_1522)
    {
        float _1685 = -_1460;
        float _1687 = _1685 + 1.0;
        _1679 = _1687;
    }
    float _1689 = _1679;
    float _1691 = _1560 * _1675;
    float _1693 = -_1560;
    float _1695 = _1693 + 1.0;
    if (_1464)
    {
        _1683 = _1689;
    }
    float _1697 = _1683;
    float _1699 = _1603 * _1691;
    float _1701 = _1631 * _1691;
    float _1703 = _1645 * _1691;
    float _1705 = _1661 * _1595;
    float _1707 = fma(_1605, _1697, -0.5);
    float _1709 = _1564 * _1595;
    float _1711 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1699);
    float _1713 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1701);
    float _1715 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1703);
    float _1717 = -_1705;
    float _1719 = fma(_1564, _1707, _1717);
    float _1721 = fma(_1607, _1671, _1711);
    float _1723 = fma(_1663, _1671, _1713);
    float _1725 = fma(_1669, _1671, _1715);
    float _1727 = fma(_1540, _1719, _1544);
    float _1729 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1721);
    float _1731 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1723);
    float _1733 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1735 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1725);
    float _1737 = fma(_1661, _1707, _1709);
    float _1739 = _1593 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1741 = _1733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1743 = _1727 + 0.5;
    float _1745 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1747 = -_1570;
    float _1749 = fma(_1572, _1737, _1747);
    float _1751 = _1739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1753 = _1617 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1755 = _1749 + 0.5;
    float _1757 = exp2(_1745);
    float _1759 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1761 = in.m_57.x;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1765 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1767 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1759);
    float _1769 = in.m_57.y;
    float _1771 = _1731 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1773 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1775 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1767);
    float _1777 = in.m_57.z;
    float _1779 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1781 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1783 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1775);
    float _1785 = in.m_57.w;
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1789 = -_1757;
    float _1791 = _1789 + 1.0;
    out.m_59.x = _1743;
    out.m_59.y = _1755;
    float _1793 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1791 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1797 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _1741;
    out.m_61.y = _1751;
    out.m_61.z = _1779;
    out.m_63.x = _1781;
    out.m_63.y = _1787;
    out.m_63.z = _1793;
    out.m_63.w = _1763;
    float _1799 = _1783 + _1361;
    out.m_65.x = _1761;
    float _1801 = _1799 * 0.5;
    out.m_65.y = _1769;
    out.m_65.z = _1777;
    out.m_65.w = _1785;
    out.gl_Position.x = _1385;
    out.gl_Position.y = _1389;
    out.gl_Position.z = _1783;
    out.gl_Position.w = _1361;
    out.m_67.z = _1801;
    out.m_67.w = _1361;
    out.m_47.x = _1797;
    float _1803 = _1795 * _1417;
    float _1805 = -_1795;
    float _1807 = _1805 + 1.0;
    float _1809 = _1428 * _1803;
    float _1811 = _1440 * _1803;
    float _1813 = fma(_1436, _1809, _1422);
    float _1815 = fma(_1438, _1809, _1424);
    float _1817 = _1428 * _1807;
    float _1819 = fma(_1428, _1811, _1426);
    out.m_69.x = _1813;
    out.m_69.y = _1815;
    out.m_69.z = _1819;
    out.m_69.w = _1817;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _763 = false;
    bool _477 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _91 = int(_89);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    float _99 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _97;
    float _103 = _101;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_95)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    float _111 = as_type<float>(_109);
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1877 = as_type<float>(_109);
        out.gl_Position.z = _1877;
    }
    if (!_95)
    {
        return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    float _131 = 0.0;
    if (_123)
    {
        float _133 = float(_91);
        _129 = _133;
    }
    float _135 = _129;
    bool _137 = _127 >= _135;
    bool _139 = !_123;
    bool _141 = _137 || _139;
    if (_141)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _103;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    int _145 = 0;
    if (_141)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1945 = as_type<float>(_149);
        out.gl_Position.z = _1945;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = _157;
    if (!_167)
    {
        float _171 = _157 * _157;
        float _173 = _171 * 0.5;
        _131 = _173;
    }
    float _175 = _131;
    float _177 = 0.0;
    float _179 = _175;
    if (!_167)
    {
        float _181 = _127 * _127;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    if (!_167)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _187;
    }
    float _189 = _179;
    bool _191 = !_167;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _157 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _157);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _111 = _211;
        _193 = _223;
        _99 = _213;
    }
    float _225 = _111;
    float _227 = _193;
    float _229 = _99;
    bool _231 = !_167;
    float _233 = _225;
    float _235 = _229;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _157 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _233 = _249;
        _235 = _243;
        _169 = _255;
    }
    float _257 = _233;
    float _259 = _235;
    float _261 = _169;
    float _263 = _259;
    float _265 = _257;
    if (!_167)
    {
        _263 = _127;
    }
    float _267 = _263;
    float _269 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _267;
    if (!_167)
    {
        float _273 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _265 = _273;
    }
    float _275 = _265;
    bool _277 = !_167;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _127 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _127);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _309;
    }
    float _311 = _279;
    bool _313 = !_167;
    if (!_313)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = 1.0 / _321;
        float _325 = _127 * _317;
        float _327 = exp2(_325);
        float _329 = -_327;
        float _331 = _329 + 1.0;
        float _333 = _331 * _323;
        _271 = _333;
    }
    float _335 = _271;
    float _337 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = fma(_261, _153, _269);
    float _341 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = fma(_335, _153, _337);
    float _347 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_261, _151, _341);
    float _353 = fma(_335, _151, _343);
    float _355 = -_345;
    float _357 = _339 + _355;
    float _359 = fma(_261, _155, _347);
    float _361 = fma(_335, _155, _349);
    float _363 = -_353;
    float _365 = _351 + _363;
    float _367 = _357 * _357;
    float _369 = in.m_51.w;
    float _371 = -_361;
    float _373 = _359 + _371;
    float _375 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _377 = fma(_365, _365, _367);
    float _379 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _381 = in.m_44.x;
    float _383 = in.m_44.y;
    float _385 = in.m_44.z;
    float _387 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _389 = fma(_373, _373, _377);
    float _391 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _375);
    float _393 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _379);
    float _395 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _387);
    float _397 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _391);
    float _399 = sqrt(_389);
    float _401 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _395);
    bool _403 = _399 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_399);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _393);
    float _415 = fma(_351, _369, _381);
    float _417 = fma(_339, _369, _383);
    float _419 = fma(_359, _369, _385);
    float _421 = _393;
    float _423 = _397;
    float _425 = _413;
    if (_411)
    {
        _421 = _397;
    }
    float _427 = _421;
    float _429 = _427;
    if (_411)
    {
        _423 = _413;
    }
    float _431 = _423;
    float _433 = _431;
    if (_411)
    {
        _425 = _401;
    }
    float _435 = _425;
    float _437 = _435;
    if (!_411)
    {
        bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _441 = !_439;
        if (!_441)
        {
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _453);
            float _461 = _455 * _455;
            float _463 = fma(_457, _457, _461);
            float _465 = fma(_459, _459, _463);
            float _467 = rsqrt(_465);
            float _469 = _467 * 9.9999999747524270787835121154785e-07;
            float _471 = _457 * _469;
            float _473 = _455 * _469;
            float _475 = _459 * _469;
            _433 = _473;
            _429 = _471;
            _437 = _475;
            _477 = true;
        }
        else
        {
            float _479 = _153 * _153;
            float _481 = fma(_151, _151, _479);
            float _483 = fma(_155, _155, _481);
            float _485 = sqrt(_483);
            bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
            bool _489 = isnan(_485);
            bool _491 = _487 || _489;
            bool _493 = isnan(9.9999999747524270787835121154785e-07);
            bool _495 = _491 || _493;
            if (!_495)
            {
                float _497 = _383 * _383;
                float _499 = fma(_381, _381, _497);
                float _501 = fma(_385, _385, _499);
                float _503 = sqrt(_501);
                bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
                bool _507 = isnan(_503);
                bool _509 = _505 || _507;
                bool _511 = isnan(9.9999999747524270787835121154785e-07);
                bool _513 = _509 || _511;
                if (!_513)
                {
                    float _515 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _515);
                    float _519 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _517);
                    float _521 = rsqrt(_519);
                    float _523 = _521 * 9.9999999747524270787835121154785e-07;
                    float _525 = _523 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _527 = _523 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _529 = _523 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _433 = _527;
                    _429 = _525;
                    _437 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _433 = _561;
                    _429 = _559;
                    _437 = _563;
                    _477 = true;
                }
            }
            else
            {
                float _565 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _567 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _569 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _571 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
                float _573 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _567);
                float _575 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
                float _577 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
                float _579 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
                float _581 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _575);
                float _583 = _577 * _577;
                float _585 = fma(_579, _579, _583);
                float _587 = fma(_581, _581, _585);
                float _589 = rsqrt(_587);
                float _591 = _589 * 9.9999999747524270787835121154785e-07;
                float _593 = _579 * _591;
                float _595 = _577 * _591;
                float _597 = _581 * _591;
                _433 = _595;
                _429 = _593;
                _437 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _433;
    float _601 = _429;
    float _603 = _437;
    float _605 = in.m_53.x;
    float _607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _609 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _613 = _609 * _607;
    float _615 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _617 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].x, _613);
    float _619 = _615 * _611;
    float _621 = floor(_617);
    float _623 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].y, _619);
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _631 = _629 != 0;
    float _633 = _617 * 6.283185482025146484375;
    int _635 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _637 = _635 != 0;
    float _639 = _633 * 0.15915493667125701904296875;
    float _641 = floor(_623);
    bool _643 = !_627;
    int _645 = _643 ? 0 : 1;
    int _647 = abs(_645);
    float _649 = -_621;
    float _651 = _617 + _649;
    float _653 = _623 * 6.283185482025146484375;
    float _655 = _639 * 6.283185482025146484375;
    float _657 = cos(_655);
    bool _659 = !_631;
    int _661 = _659 ? 0 : 1;
    float _663 = _653 * 0.15915493667125701904296875;
    float _665 = -_641;
    float _667 = _623 + _665;
    float _669 = -_651;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _673 = _663 * 6.283185482025146484375;
    float _675 = cos(_673);
    float _677 = float(_647);
    float _679 = -_667;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _683 = !_637;
    int _685 = _683 ? 0 : 1;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _689 = abs(_671);
    float _691 = _677 * _689;
    float _693 = fma(_657, 0.5, 0.5);
    int _695 = abs(_685);
    float _697 = abs(_681);
    float _699 = _677 * _697;
    bool _701 = _651 < 0.5;
    float _703 = float(_701);
    float _705 = -_693;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _709 = abs(_661);
    bool _711 = _667 < 0.5;
    float _713 = float(_711);
    float _715 = -_703;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _719 = fma(_675, 0.5, 0.5);
    float _721 = float(_695);
    float _723 = -_719;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _727 = float(_709);
    float _729 = -_713;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _733 = fma(_721, _707, _691);
    float _735 = fma(_721, _725, _699);
    float _737 = abs(_717);
    float _739 = fma(_727, _737, _733);
    float _741 = abs(_731);
    float _743 = fma(_727, _741, _735);
    bool _745 = !_687;
    float _761;
    if (!_745)
    {
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _749 = _605 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_91);
        float _767 = 1.0 / _765;
        float _769 = _127 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    int _773 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _775 = _773;
    int _777 = 0;
    int _779 = _82(_775, _777, (*spvDescriptorSet0.support_buffer));
    float _781 = _605 * 8.0;
    float _783 = in.m_55.z;
    float _785 = rint(_781);
    float _787 = _785 * 0.125;
    float _789 = precise::clamp(_787, 0.0, 1.0);
    float _791 = trunc(_783);
    int _793 = int(_791);
    int _795 = _779 + (-1);
    float _797 = float(_795);
    float _799 = _789 * _797;
    float _801 = trunc(_799);
    int _803 = int(_801);
    int _805 = _803 + 1;
    int _807 = min(_795, _805);
    int _809 = _803;
    int _811 = 0;
    int _813 = _83(_809, _811, (*spvDescriptorSet0.support_buffer));
    int _815 = _793;
    int _817 = 0;
    int _819 = _83(_815, _817, (*spvDescriptorSet0.support_buffer));
    float3 _823 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_813, _819)), 0).xyz;
    float _825 = _823.x;
    float _827 = _823.y;
    float _829 = _823.z;
    int _831 = _807;
    int _833 = 0;
    int _835 = _83(_831, _833, (*spvDescriptorSet0.support_buffer));
    int _837 = _793;
    int _839 = 0;
    int _841 = _83(_837, _839, (*spvDescriptorSet0.support_buffer));
    float3 _843 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_835, _841)), 0).xyz;
    float _845 = _843.x;
    float _847 = _843.y;
    float _849 = _843.z;
    float _851 = _599 * _599;
    float _853 = in.m_51.x;
    float _855 = in.m_51.y;
    float _857 = in.m_51.z;
    float _859 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _861 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _863 = fma(_601, _601, _851);
    float _865 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _867 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _861);
    float _869 = fma(_603, _603, _863);
    float _871 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _859);
    float _873 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _865);
    float _875 = rsqrt(_869);
    float _877 = _853 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _879 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _871);
    float _881 = _857 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _883 = _875 * _603;
    float _885 = _875 * _601;
    float _887 = _875 * _599;
    float _889 = _855 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _891 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _893 = _883 * _891;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _897 = _885 * _895;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _901 = _887 * _899;
    float _903 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].z, _867);
    float _905 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _907 = -_893;
    float _909 = fma(_885, _905, _907);
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _913 = -_897;
    float _915 = fma(_887, _911, _913);
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _919 = -_901;
    float _921 = fma(_883, _917, _919);
    float _923 = _743 * _889;
    float _925 = _909 * _909;
    float _927 = floor(_799);
    float _929 = _739 * _877;
    float _931 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _933 = fma(_921, _921, _925);
    float _935 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _937 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _939 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    float _941 = fma(_915, _915, _933);
    float _943 = _879 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _945 = _903 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _947 = _939 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _949 = rsqrt(_941);
    float _951 = -_927;
    float _953 = _799 + _951;
    float _955 = _921 * _949;
    float _957 = -_827;
    float _959 = _957 + _847;
    float _961 = -_825;
    float _963 = _961 + _845;
    float _965 = _909 * _949;
    float _967 = -_829;
    float _969 = _967 + _849;
    float _971 = fma(_953, _959, _827);
    float _973 = fma(_953, _963, _825);
    float _975 = _915 * _949;
    float _977 = fma(_953, _969, _829);
    float _979 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _971);
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _973);
    float _983 = _887 * _975;
    float _985 = _883 * _955;
    float _987 = _931 * _979;
    float _989 = _937 * _981;
    float _991 = -_983;
    float _993 = fma(_883, _965, _991);
    float _995 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _977);
    float _997 = _987 * _883;
    float _999 = _885 * _965;
    float _1001 = -_985;
    float _1003 = fma(_885, _975, _1001);
    float _1005 = _935 * _995;
    float _1007 = fma(_989, _975, _997);
    float _1009 = _987 * _885;
    float _1011 = -_999;
    float _1013 = fma(_887, _955, _1011);
    float _1015 = _987 * _887;
    float _1017 = fma(_989, _955, _1009);
    float _1019 = fma(_1005, _1013, _1007);
    float _1021 = fma(_989, _965, _1015);
    float _1023 = fma(_1005, _993, _1017);
    float _1025 = _947 + _1019;
    float _1027 = fma(_1005, _1003, _1021);
    float _1029 = _943 + _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1033 = _1025 + _1031;
    float _1035 = _945 + _1027;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1039 = _1029 + _1037;
    float _1041 = _1033 * _1033;
    float _1043 = fma(_1039, _1039, _1041);
    float _1045 = sqrt(_1043);
    bool _1047 = _1045 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1049 = _945;
    float _1051 = _947;
    float _1053 = _1029;
    float _1055 = _1003;
    float _1057 = _935;
    if (!_1047)
    {
        _1049 = _1025;
    }
    float _1059 = _1049;
    float _1061 = _1059;
    if (!_1047)
    {
        _1051 = _1035;
    }
    float _1063 = _1051;
    bool _1065 = !_1047;
    float _1067 = _1063;
    if (!_1065)
    {
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1073 = _1045 + _1071;
        float _1075 = rsqrt(_1043);
        float _1077 = _1073 * _1069;
        float _1079 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = _1077 * 0.15915493667125701904296875;
        float _1083 = _1081 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = _1081 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 + (-1.0);
        float _1093 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1095 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = fma(_1035, _1085, _1093);
        float _1099 = _1075 * _1095;
        float _1101 = fma(_1039, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1103 = fma(_1033, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1067 = _1097;
        _1053 = _1101;
        _1061 = _1103;
    }
    float _1105 = _1067;
    float _1107 = _1053;
    float _1109 = _1061;
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1113 = _1105 + _1111;
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1117 = _1107 + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = _1109 + _1119;
    float _1123 = _1113 * _1113;
    float _1125 = fma(_1117, _1117, _1123);
    float _1127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1129 = fma(_1121, _1121, _1125);
    float _1131 = rsqrt(_1129);
    float _1133 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1135 = _1117 * _1133;
    float _1137 = _1121 * _1133;
    float _1139 = _1135 * _1135;
    float _1141 = _1137 * _1137;
    float _1143 = _1139 + _1141;
    float _1145 = sqrt(_1143);
    bool _1147 = _1145 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1151 = _1145 + _1149;
    float _1153 = _1131;
    float _1155 = _1143;
    float _1157 = _1151;
    float _1159 = _1113;
    float _1161 = _1135;
    if (_1147)
    {
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1153 = _1163;
    }
    float _1165 = _1153;
    if (_1147)
    {
        float _1167 = rsqrt(_1143);
        _1155 = _1167;
    }
    float _1169 = _1155;
    if (_1147)
    {
        float _1171 = _1151 * _1165;
        _1157 = _1171;
    }
    float _1173 = _1157;
    if (_1147)
    {
        float _1175 = _1173 * 0.15915493667125701904296875;
        _1055 = _1175;
    }
    float _1177 = _1055;
    float _1179 = _1121;
    if (_1147)
    {
        float _1181 = _1177 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        _1179 = _1183;
    }
    float _1185 = _1179;
    float _1187 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1189 = precise::max(0.0, _1187);
    float _1191 = _1039;
    float _1193 = _1189;
    float _1195 = _1187;
    if (_1147)
    {
        float _1197 = _1177 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        _1191 = _1199;
    }
    float _1201 = _1191;
    float _1203 = -_1133;
    float _1205 = -_1189;
    float _1207 = fma(_1113, _1203, _1205);
    if (_1147)
    {
        float _1209 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1193 = _1209;
    }
    float _1211 = _1193;
    float _1213 = _1211;
    float _1215 = _1185;
    if (_1147)
    {
        float _1217 = fma(_1185, _1211, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1213 = _1217;
    }
    float _1219 = _1213;
    float _1221 = _1219;
    if (!_1147)
    {
        _1215 = _1137;
    }
    float _1223 = _1215;
    float _1225 = _1223;
    if (_1147)
    {
        float _1227 = _1201 + (-1.0);
        _1195 = _1227;
    }
    float _1229 = _1195;
    float _1231 = _1229;
    if (_1147)
    {
        float _1233 = _1169 * _1219;
        _1057 = _1233;
    }
    float _1235 = _1057;
    if (!_1147)
    {
        _1221 = _1207;
    }
    float _1237 = _1221;
    float _1239 = sqrt(_1129);
    float _1241 = _1237;
    if (_1147)
    {
        float _1243 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1159 = _1243;
    }
    float _1245 = _1159;
    float _1247 = _1245;
    if (_1147)
    {
        float _1249 = _1135 * _1235;
        _1161 = _1249;
    }
    float _1251 = _1161;
    if (!_1147)
    {
        _1231 = _1139;
    }
    float _1253 = _1231;
    float _1255 = _1253;
    if (_1147)
    {
        float _1257 = _1137 * _1235;
        _1225 = _1257;
    }
    float _1259 = _1225;
    if (_1147)
    {
        float _1261 = fma(_1207, _1201, _1245);
        _1241 = _1261;
    }
    float _1263 = _1241;
    if (_1147)
    {
        float _1265 = _1251 * _1251;
        _1255 = _1265;
    }
    float _1267 = _1255;
    if (!_1147)
    {
        _1247 = _1141;
    }
    float _1269 = _1247;
    float _1271 = _1269;
    if (_1147)
    {
        float _1273 = _1259 * _1259;
        _1271 = _1273;
    }
    float _1275 = _1271;
    float _1277 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1279 = fma(_1263, _1263, _1267);
    float _1281 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1283 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1277);
    float _1285 = _1279 + _1275;
    float _1287 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1281);
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1291 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1289);
    float _1293 = precise::clamp(_1291, 0.0, 1.0);
    float _1295 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1297 = rsqrt(_1285);
    float _1299 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1287);
    float _1301 = -_1293;
    float _1303 = _1301 + 1.0;
    float _1305 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1307 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1295);
    float _1309 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1311 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1305);
    float _1313 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1307);
    float _1315 = abs(_1303);
    float _1317 = log2(_1315);
    float _1319 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1283);
    float _1321 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1311);
    float _1323 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1325 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1327 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1329 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1331 = _1297 * _1251;
    float _1333 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1335 = _1297 * _1263;
    float _1337 = _1297 * _1259;
    float _1339 = _1331 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1333);
    float _1343 = -_1325;
    float _1345 = fma(_1343, _1127, 1.0);
    float _1347 = -_1339;
    float _1349 = fma(_1335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1347);
    float _1351 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1341);
    float _1353 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1355 = log2(_1345);
    float _1357 = -_1337;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1349);
    float _1361 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1351);
    float _1363 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1365 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1367 = fma(_1359, -0.5, 0.5);
    float _1369 = fma(_1359, 0.5, 0.5);
    float _1371 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1363);
    float _1373 = exp2(_1353);
    float _1375 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1365);
    float _1377 = _1335 + 1.0;
    float _1379 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1371);
    float _1381 = fma(_1369, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1383 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1375);
    float _1385 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1379);
    float _1387 = 1.0 / _1361;
    float _1389 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1383);
    float _1391 = fma(_1369, _1381, -0.212114393711090087890625);
    float _1393 = _1355 * 0.693147182464599609375;
    float _1395 = fma(_1369, _1391, 1.570728778839111328125);
    float _1397 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1399 = sqrt(_1367);
    float _1401 = -_1335;
    float _1403 = fma(_1373, _1377, _1401);
    float _1405 = fma(_1403, 0.5, 0.5);
    float _1407 = _1385 * _1387;
    float _1409 = _1389 * _1387;
    float _1411 = fma(_1407, 0.5, 0.5);
    float _1413 = fma(_1409, -0.5, 0.5);
    float _1415 = _1399 * 0.636619746685028076171875;
    float3 _3939 = float3(_1411, _1413, _1397);
    float _1417 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3939, float3(0.0), isnan(_3939)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3939, float3(0.0), isnan(_3939)), level(0.0)).x;
    float3 _3950 = float3(_1411, _1413, _1397);
    float4 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3950, float3(0.0), isnan(_3950)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3950, float3(0.0), isnan(_3950)), level(0.0)).xyzw;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = _1420.w;
    float _1430 = -_1395;
    float _1432 = fma(_1415, _1430, 1.0);
    float2 _3972 = float2(_1432, _1405);
    float3 _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3972, float2(0.0), isnan(_3972)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3972, float2(0.0), isnan(_3972)), level(0.0)).xyz;
    float _1436 = _1434.x;
    float _1438 = _1434.y;
    float _1440 = _1434.z;
    float _1442 = in.m_53.z;
    float _1444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1446 = in.m_55.y;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1450 = _605 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1452 = in.m_53.y;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1456 = _1454 != 0;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1460 = in.m_55.x;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1464 = _1462 != 0;
    float _1466 = -_1458;
    float _1468 = fma(_1450, 2.0, _1466);
    float _1470 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1472;
    float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1478 = _1470 * _605;
    float _1480 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1448);
    float _1482 = 1.0 / _1474;
    float _1484 = -_1446;
    float _1486 = _1484 + 1.0;
    float _1488 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1480);
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1492;
    bool _1496 = _1452 > 0.5;
    float _1498 = _1488 * (-0.15915493667125701904296875);
    float _1500 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1490);
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1504 = trunc(_1478);
    int _1506 = int(_1504);
    float _1508 = _1446;
    if (_1456)
    {
        float _1510 = _1496 ? _1486 : _1446;
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1518 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1520 = _605 > 0.5;
    bool _1522 = _1520 && _1464;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1528 = _771 + _1526;
    float _1530 = fma(_1518, -2.0, _1502);
    float _1532 = 1.0 / _1516;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1536 = _771 + _1534;
    float _1538 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1524);
    float _1540 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1500);
    float _1542 = -_127;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1468);
    float _1546 = _1536 * _1482;
    float _1548 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1550 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1552 = isnan(_771);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = _1498 * 6.283185482025146484375;
    float _1564 = cos(_1562);
    int _1566 = _1506 << 4;
    int _1568 = _1566 + 1968;
    float _1570 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1530);
    float _1572 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1538);
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1574;
    uint _1579 = uint(int(uint(_1568) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[int(_1589)][_1591];
    float _1595 = fma(_1548, _1512, -0.5);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1601 = _1528 * _1532;
    float _1603 = fma(_1576, _1546, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1605 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1607 = fma(_1599, _1601, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    int _1609 = _1568 + 8;
    uint _1611 = uint(int(uint(_1609) >> uint(2)));
    uint _1613 = uint(int(uint(int(_1611)) >> uint(2)));
    int _1615 = int(_1611) & 3;
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[int(_1613)][_1615];
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1625 = _1623 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1629 = _1627 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1631 = fma(_1621, _1546, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1633 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1635 = isnan(_771);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = fma(_1494, _1546, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1647 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1649 = isnan(_771);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1655 = _1651 || _1653;
    float _1657 = float(_1655);
    float _1659 = _1498 * 6.283185482025146484375;
    float _1661 = sin(_1659);
    float _1663 = fma(_1625, _1601, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1665 = -_1643;
    float _1667 = _1665 + 1.0;
    float _1669 = fma(_1629, _1601, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1671 = _1657 * _1667;
    float _1673 = -_1657;
    float _1675 = _1673 + 1.0;
    float _1677 = _1657;
    float _1679 = _1460;
    if (!_1464)
    {
        _1677 = _1460;
    }
    float _1681 = _1677;
    float _1683 = _1681;
    if (_1522)
    {
        float _1685 = -_1460;
        float _1687 = _1685 + 1.0;
        _1679 = _1687;
    }
    float _1689 = _1679;
    float _1691 = _1560 * _1675;
    float _1693 = -_1560;
    float _1695 = _1693 + 1.0;
    if (_1464)
    {
        _1683 = _1689;
    }
    float _1697 = _1683;
    float _1699 = _1603 * _1691;
    float _1701 = _1631 * _1691;
    float _1703 = _1645 * _1691;
    float _1705 = _1661 * _1595;
    float _1707 = fma(_1605, _1697, -0.5);
    float _1709 = _1564 * _1595;
    float _1711 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1699);
    float _1713 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1701);
    float _1715 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1703);
    float _1717 = -_1705;
    float _1719 = fma(_1564, _1707, _1717);
    float _1721 = fma(_1607, _1671, _1711);
    float _1723 = fma(_1663, _1671, _1713);
    float _1725 = fma(_1669, _1671, _1715);
    float _1727 = fma(_1540, _1719, _1544);
    float _1729 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1721);
    float _1731 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1723);
    float _1733 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1735 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1725);
    float _1737 = fma(_1661, _1707, _1709);
    float _1739 = _1593 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1741 = _1733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1743 = _1727 + 0.5;
    float _1745 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1747 = -_1570;
    float _1749 = fma(_1572, _1737, _1747);
    float _1751 = _1739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1753 = _1617 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1755 = _1749 + 0.5;
    float _1757 = exp2(_1745);
    float _1759 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1761 = in.m_57.x;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1765 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1767 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1759);
    float _1769 = in.m_57.y;
    float _1771 = _1731 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1773 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1775 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1767);
    float _1777 = in.m_57.z;
    float _1779 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1781 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1783 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1775);
    float _1785 = in.m_57.w;
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1789 = -_1757;
    float _1791 = _1789 + 1.0;
    out.m_59.x = _1743;
    out.m_59.y = _1755;
    float _1793 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1791 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1797 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _1741;
    out.m_61.y = _1751;
    out.m_61.z = _1779;
    out.m_63.x = _1781;
    out.m_63.y = _1787;
    out.m_63.z = _1793;
    out.m_63.w = _1763;
    float _1799 = _1783 + _1361;
    out.m_65.x = _1761;
    float _1801 = _1799 * 0.5;
    out.m_65.y = _1769;
    out.m_65.z = _1777;
    out.m_65.w = _1785;
    out.gl_Position.x = _1385;
    out.gl_Position.y = _1389;
    out.gl_Position.z = _1783;
    out.gl_Position.w = _1361;
    out.m_67.z = _1801;
    out.m_67.w = _1361;
    out.m_47.x = _1797;
    float _1803 = _1795 * _1417;
    float _1805 = -_1795;
    float _1807 = _1805 + 1.0;
    float _1809 = _1428 * _1803;
    float _1811 = _1440 * _1803;
    float _1813 = fma(_1436, _1809, _1422);
    float _1815 = fma(_1438, _1809, _1424);
    float _1817 = _1428 * _1807;
    float _1819 = fma(_1428, _1811, _1426);
    out.m_69.x = _1813;
    out.m_69.y = _1815;
    out.m_69.z = _1819;
    out.m_69.w = _1817;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _763 = false;
    bool _477 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _91 = int(_89);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    float _99 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _97;
    float _103 = _101;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_95)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    float _111 = as_type<float>(_109);
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1877 = as_type<float>(_109);
        out.gl_Position.z = _1877;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    float _131 = 0.0;
    if (_123)
    {
        float _133 = float(_91);
        _129 = _133;
    }
    float _135 = _129;
    bool _137 = _127 >= _135;
    bool _139 = !_123;
    bool _141 = _137 || _139;
    if (_141)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _103;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    int _145 = 0;
    if (_141)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1945 = as_type<float>(_149);
        out.gl_Position.z = _1945;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = _157;
    if (!_167)
    {
        float _171 = _157 * _157;
        float _173 = _171 * 0.5;
        _131 = _173;
    }
    float _175 = _131;
    float _177 = 0.0;
    float _179 = _175;
    if (!_167)
    {
        float _181 = _127 * _127;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    if (!_167)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _187;
    }
    float _189 = _179;
    bool _191 = !_167;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _157 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _157);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _111 = _211;
        _193 = _223;
        _99 = _213;
    }
    float _225 = _111;
    float _227 = _193;
    float _229 = _99;
    bool _231 = !_167;
    float _233 = _225;
    float _235 = _229;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _157 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _233 = _249;
        _235 = _243;
        _169 = _255;
    }
    float _257 = _233;
    float _259 = _235;
    float _261 = _169;
    float _263 = _259;
    float _265 = _257;
    if (!_167)
    {
        _263 = _127;
    }
    float _267 = _263;
    float _269 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _267;
    if (!_167)
    {
        float _273 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _265 = _273;
    }
    float _275 = _265;
    bool _277 = !_167;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _127 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _127);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _309;
    }
    float _311 = _279;
    bool _313 = !_167;
    if (!_313)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = 1.0 / _321;
        float _325 = _127 * _317;
        float _327 = exp2(_325);
        float _329 = -_327;
        float _331 = _329 + 1.0;
        float _333 = _331 * _323;
        _271 = _333;
    }
    float _335 = _271;
    float _337 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = fma(_261, _153, _269);
    float _341 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = fma(_335, _153, _337);
    float _347 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_261, _151, _341);
    float _353 = fma(_335, _151, _343);
    float _355 = -_345;
    float _357 = _339 + _355;
    float _359 = fma(_261, _155, _347);
    float _361 = fma(_335, _155, _349);
    float _363 = -_353;
    float _365 = _351 + _363;
    float _367 = _357 * _357;
    float _369 = in.m_51.w;
    float _371 = -_361;
    float _373 = _359 + _371;
    float _375 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _377 = fma(_365, _365, _367);
    float _379 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _381 = in.m_44.x;
    float _383 = in.m_44.y;
    float _385 = in.m_44.z;
    float _387 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _389 = fma(_373, _373, _377);
    float _391 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _375);
    float _393 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _379);
    float _395 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _387);
    float _397 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _391);
    float _399 = sqrt(_389);
    float _401 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _395);
    bool _403 = _399 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_399);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _393);
    float _415 = fma(_351, _369, _381);
    float _417 = fma(_339, _369, _383);
    float _419 = fma(_359, _369, _385);
    float _421 = _393;
    float _423 = _397;
    float _425 = _413;
    if (_411)
    {
        _421 = _397;
    }
    float _427 = _421;
    float _429 = _427;
    if (_411)
    {
        _423 = _413;
    }
    float _431 = _423;
    float _433 = _431;
    if (_411)
    {
        _425 = _401;
    }
    float _435 = _425;
    float _437 = _435;
    if (!_411)
    {
        bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _441 = !_439;
        if (!_441)
        {
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _453);
            float _461 = _455 * _455;
            float _463 = fma(_457, _457, _461);
            float _465 = fma(_459, _459, _463);
            float _467 = rsqrt(_465);
            float _469 = _467 * 9.9999999747524270787835121154785e-07;
            float _471 = _457 * _469;
            float _473 = _455 * _469;
            float _475 = _459 * _469;
            _433 = _473;
            _429 = _471;
            _437 = _475;
            _477 = true;
        }
        else
        {
            float _479 = _153 * _153;
            float _481 = fma(_151, _151, _479);
            float _483 = fma(_155, _155, _481);
            float _485 = sqrt(_483);
            bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
            bool _489 = isnan(_485);
            bool _491 = _487 || _489;
            bool _493 = isnan(9.9999999747524270787835121154785e-07);
            bool _495 = _491 || _493;
            if (!_495)
            {
                float _497 = _383 * _383;
                float _499 = fma(_381, _381, _497);
                float _501 = fma(_385, _385, _499);
                float _503 = sqrt(_501);
                bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
                bool _507 = isnan(_503);
                bool _509 = _505 || _507;
                bool _511 = isnan(9.9999999747524270787835121154785e-07);
                bool _513 = _509 || _511;
                if (!_513)
                {
                    float _515 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _515);
                    float _519 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _517);
                    float _521 = rsqrt(_519);
                    float _523 = _521 * 9.9999999747524270787835121154785e-07;
                    float _525 = _523 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _527 = _523 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _529 = _523 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _433 = _527;
                    _429 = _525;
                    _437 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _433 = _561;
                    _429 = _559;
                    _437 = _563;
                    _477 = true;
                }
            }
            else
            {
                float _565 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _567 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _569 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _571 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
                float _573 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _567);
                float _575 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
                float _577 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
                float _579 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
                float _581 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _575);
                float _583 = _577 * _577;
                float _585 = fma(_579, _579, _583);
                float _587 = fma(_581, _581, _585);
                float _589 = rsqrt(_587);
                float _591 = _589 * 9.9999999747524270787835121154785e-07;
                float _593 = _579 * _591;
                float _595 = _577 * _591;
                float _597 = _581 * _591;
                _433 = _595;
                _429 = _593;
                _437 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _433;
    float _601 = _429;
    float _603 = _437;
    float _605 = in.m_53.x;
    float _607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _609 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _613 = _609 * _607;
    float _615 = _127 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _617 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].x, _613);
    float _619 = _615 * _611;
    float _621 = floor(_617);
    float _623 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].y, _619);
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _631 = _629 != 0;
    float _633 = _617 * 6.283185482025146484375;
    int _635 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _637 = _635 != 0;
    float _639 = _633 * 0.15915493667125701904296875;
    float _641 = floor(_623);
    bool _643 = !_627;
    int _645 = _643 ? 0 : 1;
    int _647 = abs(_645);
    float _649 = -_621;
    float _651 = _617 + _649;
    float _653 = _623 * 6.283185482025146484375;
    float _655 = _639 * 6.283185482025146484375;
    float _657 = cos(_655);
    bool _659 = !_631;
    int _661 = _659 ? 0 : 1;
    float _663 = _653 * 0.15915493667125701904296875;
    float _665 = -_641;
    float _667 = _623 + _665;
    float _669 = -_651;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _673 = _663 * 6.283185482025146484375;
    float _675 = cos(_673);
    float _677 = float(_647);
    float _679 = -_667;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _683 = !_637;
    int _685 = _683 ? 0 : 1;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _689 = abs(_671);
    float _691 = _677 * _689;
    float _693 = fma(_657, 0.5, 0.5);
    int _695 = abs(_685);
    float _697 = abs(_681);
    float _699 = _677 * _697;
    bool _701 = _651 < 0.5;
    float _703 = float(_701);
    float _705 = -_693;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _709 = abs(_661);
    bool _711 = _667 < 0.5;
    float _713 = float(_711);
    float _715 = -_703;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _719 = fma(_675, 0.5, 0.5);
    float _721 = float(_695);
    float _723 = -_719;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _727 = float(_709);
    float _729 = -_713;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _733 = fma(_721, _707, _691);
    float _735 = fma(_721, _725, _699);
    float _737 = abs(_717);
    float _739 = fma(_727, _737, _733);
    float _741 = abs(_731);
    float _743 = fma(_727, _741, _735);
    bool _745 = !_687;
    float _761;
    if (!_745)
    {
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _749 = _605 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_91);
        float _767 = 1.0 / _765;
        float _769 = _127 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    int _773 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _775 = _773;
    int _777 = 0;
    int _779 = _82(_775, _777, (*spvDescriptorSet0.support_buffer));
    float _781 = _605 * 8.0;
    float _783 = in.m_55.z;
    float _785 = rint(_781);
    float _787 = _785 * 0.125;
    float _789 = precise::clamp(_787, 0.0, 1.0);
    float _791 = trunc(_783);
    int _793 = int(_791);
    int _795 = _779 + (-1);
    float _797 = float(_795);
    float _799 = _789 * _797;
    float _801 = trunc(_799);
    int _803 = int(_801);
    int _805 = _803 + 1;
    int _807 = min(_795, _805);
    int _809 = _803;
    int _811 = 0;
    int _813 = _83(_809, _811, (*spvDescriptorSet0.support_buffer));
    int _815 = _793;
    int _817 = 0;
    int _819 = _83(_815, _817, (*spvDescriptorSet0.support_buffer));
    float3 _823 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_813, _819)), 0).xyz;
    float _825 = _823.x;
    float _827 = _823.y;
    float _829 = _823.z;
    int _831 = _807;
    int _833 = 0;
    int _835 = _83(_831, _833, (*spvDescriptorSet0.support_buffer));
    int _837 = _793;
    int _839 = 0;
    int _841 = _83(_837, _839, (*spvDescriptorSet0.support_buffer));
    float3 _843 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_835, _841)), 0).xyz;
    float _845 = _843.x;
    float _847 = _843.y;
    float _849 = _843.z;
    float _851 = _599 * _599;
    float _853 = in.m_51.x;
    float _855 = in.m_51.y;
    float _857 = in.m_51.z;
    float _859 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _861 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _863 = fma(_601, _601, _851);
    float _865 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _867 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _861);
    float _869 = fma(_603, _603, _863);
    float _871 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _859);
    float _873 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _865);
    float _875 = rsqrt(_869);
    float _877 = _853 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _879 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].z, _871);
    float _881 = _857 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _883 = _875 * _603;
    float _885 = _875 * _601;
    float _887 = _875 * _599;
    float _889 = _855 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _891 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _893 = _883 * _891;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _897 = _885 * _895;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _901 = _887 * _899;
    float _903 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].z, _867);
    float _905 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _907 = -_893;
    float _909 = fma(_885, _905, _907);
    float _911 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _913 = -_897;
    float _915 = fma(_887, _911, _913);
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _919 = -_901;
    float _921 = fma(_883, _917, _919);
    float _923 = _743 * _889;
    float _925 = _909 * _909;
    float _927 = floor(_799);
    float _929 = _739 * _877;
    float _931 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _933 = fma(_921, _921, _925);
    float _935 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _937 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _939 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    float _941 = fma(_915, _915, _933);
    float _943 = _879 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _945 = _903 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _947 = _939 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _949 = rsqrt(_941);
    float _951 = -_927;
    float _953 = _799 + _951;
    float _955 = _921 * _949;
    float _957 = -_827;
    float _959 = _957 + _847;
    float _961 = -_825;
    float _963 = _961 + _845;
    float _965 = _909 * _949;
    float _967 = -_829;
    float _969 = _967 + _849;
    float _971 = fma(_953, _959, _827);
    float _973 = fma(_953, _963, _825);
    float _975 = _915 * _949;
    float _977 = fma(_953, _969, _829);
    float _979 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _971);
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _973);
    float _983 = _887 * _975;
    float _985 = _883 * _955;
    float _987 = _931 * _979;
    float _989 = _937 * _981;
    float _991 = -_983;
    float _993 = fma(_883, _965, _991);
    float _995 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _977);
    float _997 = _987 * _883;
    float _999 = _885 * _965;
    float _1001 = -_985;
    float _1003 = fma(_885, _975, _1001);
    float _1005 = _935 * _995;
    float _1007 = fma(_989, _975, _997);
    float _1009 = _987 * _885;
    float _1011 = -_999;
    float _1013 = fma(_887, _955, _1011);
    float _1015 = _987 * _887;
    float _1017 = fma(_989, _955, _1009);
    float _1019 = fma(_1005, _1013, _1007);
    float _1021 = fma(_989, _965, _1015);
    float _1023 = fma(_1005, _993, _1017);
    float _1025 = _947 + _1019;
    float _1027 = fma(_1005, _1003, _1021);
    float _1029 = _943 + _1023;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1033 = _1025 + _1031;
    float _1035 = _945 + _1027;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1039 = _1029 + _1037;
    float _1041 = _1033 * _1033;
    float _1043 = fma(_1039, _1039, _1041);
    float _1045 = sqrt(_1043);
    bool _1047 = _1045 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1049 = _945;
    float _1051 = _947;
    float _1053 = _1029;
    float _1055 = _1003;
    float _1057 = _935;
    if (!_1047)
    {
        _1049 = _1025;
    }
    float _1059 = _1049;
    float _1061 = _1059;
    if (!_1047)
    {
        _1051 = _1035;
    }
    float _1063 = _1051;
    bool _1065 = !_1047;
    float _1067 = _1063;
    if (!_1065)
    {
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1073 = _1045 + _1071;
        float _1075 = rsqrt(_1043);
        float _1077 = _1073 * _1069;
        float _1079 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = _1077 * 0.15915493667125701904296875;
        float _1083 = _1081 * 6.283185482025146484375;
        float _1085 = cos(_1083);
        float _1087 = _1081 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 + (-1.0);
        float _1093 = _1091 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1095 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = fma(_1035, _1085, _1093);
        float _1099 = _1075 * _1095;
        float _1101 = fma(_1039, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1103 = fma(_1033, _1099, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1067 = _1097;
        _1053 = _1101;
        _1061 = _1103;
    }
    float _1105 = _1067;
    float _1107 = _1053;
    float _1109 = _1061;
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1113 = _1105 + _1111;
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1117 = _1107 + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = _1109 + _1119;
    float _1123 = _1113 * _1113;
    float _1125 = fma(_1117, _1117, _1123);
    float _1127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1129 = fma(_1121, _1121, _1125);
    float _1131 = rsqrt(_1129);
    float _1133 = _1131 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1135 = _1117 * _1133;
    float _1137 = _1121 * _1133;
    float _1139 = _1135 * _1135;
    float _1141 = _1137 * _1137;
    float _1143 = _1139 + _1141;
    float _1145 = sqrt(_1143);
    bool _1147 = _1145 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1151 = _1145 + _1149;
    float _1153 = _1131;
    float _1155 = _1143;
    float _1157 = _1151;
    float _1159 = _1113;
    float _1161 = _1135;
    if (_1147)
    {
        float _1163 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1153 = _1163;
    }
    float _1165 = _1153;
    if (_1147)
    {
        float _1167 = rsqrt(_1143);
        _1155 = _1167;
    }
    float _1169 = _1155;
    if (_1147)
    {
        float _1171 = _1151 * _1165;
        _1157 = _1171;
    }
    float _1173 = _1157;
    if (_1147)
    {
        float _1175 = _1173 * 0.15915493667125701904296875;
        _1055 = _1175;
    }
    float _1177 = _1055;
    float _1179 = _1121;
    if (_1147)
    {
        float _1181 = _1177 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        _1179 = _1183;
    }
    float _1185 = _1179;
    float _1187 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1189 = precise::max(0.0, _1187);
    float _1191 = _1039;
    float _1193 = _1189;
    float _1195 = _1187;
    if (_1147)
    {
        float _1197 = _1177 * 6.283185482025146484375;
        float _1199 = cos(_1197);
        _1191 = _1199;
    }
    float _1201 = _1191;
    float _1203 = -_1133;
    float _1205 = -_1189;
    float _1207 = fma(_1113, _1203, _1205);
    if (_1147)
    {
        float _1209 = _1207 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1193 = _1209;
    }
    float _1211 = _1193;
    float _1213 = _1211;
    float _1215 = _1185;
    if (_1147)
    {
        float _1217 = fma(_1185, _1211, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1213 = _1217;
    }
    float _1219 = _1213;
    float _1221 = _1219;
    if (!_1147)
    {
        _1215 = _1137;
    }
    float _1223 = _1215;
    float _1225 = _1223;
    if (_1147)
    {
        float _1227 = _1201 + (-1.0);
        _1195 = _1227;
    }
    float _1229 = _1195;
    float _1231 = _1229;
    if (_1147)
    {
        float _1233 = _1169 * _1219;
        _1057 = _1233;
    }
    float _1235 = _1057;
    if (!_1147)
    {
        _1221 = _1207;
    }
    float _1237 = _1221;
    float _1239 = sqrt(_1129);
    float _1241 = _1237;
    if (_1147)
    {
        float _1243 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1159 = _1243;
    }
    float _1245 = _1159;
    float _1247 = _1245;
    if (_1147)
    {
        float _1249 = _1135 * _1235;
        _1161 = _1249;
    }
    float _1251 = _1161;
    if (!_1147)
    {
        _1231 = _1139;
    }
    float _1253 = _1231;
    float _1255 = _1253;
    if (_1147)
    {
        float _1257 = _1137 * _1235;
        _1225 = _1257;
    }
    float _1259 = _1225;
    if (_1147)
    {
        float _1261 = fma(_1207, _1201, _1245);
        _1241 = _1261;
    }
    float _1263 = _1241;
    if (_1147)
    {
        float _1265 = _1251 * _1251;
        _1255 = _1265;
    }
    float _1267 = _1255;
    if (!_1147)
    {
        _1247 = _1141;
    }
    float _1269 = _1247;
    float _1271 = _1269;
    if (_1147)
    {
        float _1273 = _1259 * _1259;
        _1271 = _1273;
    }
    float _1275 = _1271;
    float _1277 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1279 = fma(_1263, _1263, _1267);
    float _1281 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1283 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1277);
    float _1285 = _1279 + _1275;
    float _1287 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1281);
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1291 = fma(_1239, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1289);
    float _1293 = precise::clamp(_1291, 0.0, 1.0);
    float _1295 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1297 = rsqrt(_1285);
    float _1299 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1287);
    float _1301 = -_1293;
    float _1303 = _1301 + 1.0;
    float _1305 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1307 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1295);
    float _1309 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1311 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1305);
    float _1313 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1307);
    float _1315 = abs(_1303);
    float _1317 = log2(_1315);
    float _1319 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1283);
    float _1321 = fma(_1109, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1311);
    float _1323 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1325 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1327 = _1319 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1329 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1331 = _1297 * _1251;
    float _1333 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1335 = _1297 * _1263;
    float _1337 = _1297 * _1259;
    float _1339 = _1331 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1333);
    float _1343 = -_1325;
    float _1345 = fma(_1343, _1127, 1.0);
    float _1347 = -_1339;
    float _1349 = fma(_1335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1347);
    float _1351 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1341);
    float _1353 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1355 = log2(_1345);
    float _1357 = -_1337;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1349);
    float _1361 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1351);
    float _1363 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1365 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1367 = fma(_1359, -0.5, 0.5);
    float _1369 = fma(_1359, 0.5, 0.5);
    float _1371 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1363);
    float _1373 = exp2(_1353);
    float _1375 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1365);
    float _1377 = _1335 + 1.0;
    float _1379 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1371);
    float _1381 = fma(_1369, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1383 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1375);
    float _1385 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1379);
    float _1387 = 1.0 / _1361;
    float _1389 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1383);
    float _1391 = fma(_1369, _1381, -0.212114393711090087890625);
    float _1393 = _1355 * 0.693147182464599609375;
    float _1395 = fma(_1369, _1391, 1.570728778839111328125);
    float _1397 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1399 = sqrt(_1367);
    float _1401 = -_1335;
    float _1403 = fma(_1373, _1377, _1401);
    float _1405 = fma(_1403, 0.5, 0.5);
    float _1407 = _1385 * _1387;
    float _1409 = _1389 * _1387;
    float _1411 = fma(_1407, 0.5, 0.5);
    float _1413 = fma(_1409, -0.5, 0.5);
    float _1415 = _1399 * 0.636619746685028076171875;
    float3 _3939 = float3(_1411, _1413, _1397);
    float _1417 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3939, float3(0.0), isnan(_3939)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3939, float3(0.0), isnan(_3939)), level(0.0)).x;
    float3 _3950 = float3(_1411, _1413, _1397);
    float4 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3950, float3(0.0), isnan(_3950)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3950, float3(0.0), isnan(_3950)), level(0.0)).xyzw;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = _1420.w;
    float _1430 = -_1395;
    float _1432 = fma(_1415, _1430, 1.0);
    float2 _3972 = float2(_1432, _1405);
    float3 _1434 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3972, float2(0.0), isnan(_3972)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3972, float2(0.0), isnan(_3972)), level(0.0)).xyz;
    float _1436 = _1434.x;
    float _1438 = _1434.y;
    float _1440 = _1434.z;
    float _1442 = in.m_53.z;
    float _1444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1446 = in.m_55.y;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1450 = _605 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1452 = in.m_53.y;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1456 = _1454 != 0;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1460 = in.m_55.x;
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1464 = _1462 != 0;
    float _1466 = -_1458;
    float _1468 = fma(_1450, 2.0, _1466);
    float _1470 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1472;
    float _1476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1478 = _1470 * _605;
    float _1480 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1448);
    float _1482 = 1.0 / _1474;
    float _1484 = -_1446;
    float _1486 = _1484 + 1.0;
    float _1488 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1480);
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1492;
    bool _1496 = _1452 > 0.5;
    float _1498 = _1488 * (-0.15915493667125701904296875);
    float _1500 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1490);
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1504 = trunc(_1478);
    int _1506 = int(_1504);
    float _1508 = _1446;
    if (_1456)
    {
        float _1510 = _1496 ? _1486 : _1446;
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1518 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1520 = _605 > 0.5;
    bool _1522 = _1520 && _1464;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1528 = _771 + _1526;
    float _1530 = fma(_1518, -2.0, _1502);
    float _1532 = 1.0 / _1516;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1536 = _771 + _1534;
    float _1538 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1524);
    float _1540 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1500);
    float _1542 = -_127;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1468);
    float _1546 = _1536 * _1482;
    float _1548 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1550 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1552 = isnan(_771);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = _1498 * 6.283185482025146484375;
    float _1564 = cos(_1562);
    int _1566 = _1506 << 4;
    int _1568 = _1566 + 1968;
    float _1570 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1530);
    float _1572 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1538);
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1574;
    uint _1579 = uint(int(uint(_1568) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c9)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[int(_1589)][_1591];
    float _1595 = fma(_1548, _1512, -0.5);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1601 = _1528 * _1532;
    float _1603 = fma(_1576, _1546, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1605 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1607 = fma(_1599, _1601, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    int _1609 = _1568 + 8;
    uint _1611 = uint(int(uint(_1609) >> uint(2)));
    uint _1613 = uint(int(uint(int(_1611)) >> uint(2)));
    int _1615 = int(_1611) & 3;
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[int(_1613)][_1615];
    float _1619 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1619;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1625 = _1623 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1627 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1629 = _1627 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1631 = fma(_1621, _1546, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1633 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1635 = isnan(_771);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = fma(_1494, _1546, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1647 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1649 = isnan(_771);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1655 = _1651 || _1653;
    float _1657 = float(_1655);
    float _1659 = _1498 * 6.283185482025146484375;
    float _1661 = sin(_1659);
    float _1663 = fma(_1625, _1601, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1665 = -_1643;
    float _1667 = _1665 + 1.0;
    float _1669 = fma(_1629, _1601, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1671 = _1657 * _1667;
    float _1673 = -_1657;
    float _1675 = _1673 + 1.0;
    float _1677 = _1657;
    float _1679 = _1460;
    if (!_1464)
    {
        _1677 = _1460;
    }
    float _1681 = _1677;
    float _1683 = _1681;
    if (_1522)
    {
        float _1685 = -_1460;
        float _1687 = _1685 + 1.0;
        _1679 = _1687;
    }
    float _1689 = _1679;
    float _1691 = _1560 * _1675;
    float _1693 = -_1560;
    float _1695 = _1693 + 1.0;
    if (_1464)
    {
        _1683 = _1689;
    }
    float _1697 = _1683;
    float _1699 = _1603 * _1691;
    float _1701 = _1631 * _1691;
    float _1703 = _1645 * _1691;
    float _1705 = _1661 * _1595;
    float _1707 = fma(_1605, _1697, -0.5);
    float _1709 = _1564 * _1595;
    float _1711 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1699);
    float _1713 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1701);
    float _1715 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1703);
    float _1717 = -_1705;
    float _1719 = fma(_1564, _1707, _1717);
    float _1721 = fma(_1607, _1671, _1711);
    float _1723 = fma(_1663, _1671, _1713);
    float _1725 = fma(_1669, _1671, _1715);
    float _1727 = fma(_1540, _1719, _1544);
    float _1729 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1721);
    float _1731 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1723);
    float _1733 = _1585 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1735 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1725);
    float _1737 = fma(_1661, _1707, _1709);
    float _1739 = _1593 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1741 = _1733 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1743 = _1727 + 0.5;
    float _1745 = _1317 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1747 = -_1570;
    float _1749 = fma(_1572, _1737, _1747);
    float _1751 = _1739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1753 = _1617 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1755 = _1749 + 0.5;
    float _1757 = exp2(_1745);
    float _1759 = _1323 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1761 = in.m_57.x;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1765 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1767 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1759);
    float _1769 = in.m_57.y;
    float _1771 = _1731 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1773 = _1735 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1775 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1767);
    float _1777 = in.m_57.z;
    float _1779 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1781 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1783 = fma(_1327, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1775);
    float _1785 = in.m_57.w;
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1789 = -_1757;
    float _1791 = _1789 + 1.0;
    out.m_59.x = _1743;
    out.m_59.y = _1755;
    float _1793 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1791 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1797 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.x = _1741;
    out.m_61.y = _1751;
    out.m_61.z = _1779;
    out.m_63.x = _1781;
    out.m_63.y = _1787;
    out.m_63.z = _1793;
    out.m_63.w = _1763;
    float _1799 = _1783 + _1361;
    out.m_65.x = _1761;
    float _1801 = _1799 * 0.5;
    out.m_65.y = _1769;
    out.m_65.z = _1777;
    out.m_65.w = _1785;
    out.gl_Position.x = _1385;
    out.gl_Position.y = _1389;
    out.gl_Position.z = _1783;
    out.gl_Position.w = _1361;
    out.m_67.z = _1801;
    out.m_67.w = _1361;
    out.m_47.x = _1797;
    float _1803 = _1795 * _1417;
    float _1805 = -_1795;
    float _1807 = _1805 + 1.0;
    float _1809 = _1428 * _1803;
    float _1811 = _1440 * _1803;
    float _1813 = fma(_1436, _1809, _1422);
    float _1815 = fma(_1438, _1809, _1424);
    float _1817 = _1428 * _1807;
    float _1819 = fma(_1428, _1811, _1426);
    out.m_69.x = _1813;
    out.m_69.y = _1815;
    out.m_69.z = _1819;
    out.m_69.w = _1817;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

