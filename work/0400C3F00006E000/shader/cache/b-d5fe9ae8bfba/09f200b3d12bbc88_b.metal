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
    float4 m_61 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_73 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _92(thread const int& _7216, thread const int& _7217, constant _10& support_buffer)
{
    float _7220 = as_type<float>(support_buffer._m4);
    int _7222 = _7217 + as_type<int>(_7220);
    int _7224 = 1 + _7222;
    float _7226 = support_buffer._m5[_7224].x;
    float _7228 = abs(_7226);
    bool _7230 = _7228 == 1.0;
    if (_7230)
    {
        return _7216;
    }
    float _7232 = float(_7216);
    float _7234 = _7232 / _7228;
    int _7236 = int(_7234);
    return _7236;
}

static inline __attribute__((always_inline))
int _93(thread const int& _7266, thread const int& _7267, constant _10& support_buffer)
{
    float _7270 = as_type<float>(support_buffer._m4);
    int _7272 = _7267 + as_type<int>(_7270);
    int _7274 = 1 + _7272;
    float _7276 = support_buffer._m5[_7274].x;
    bool _7278 = _7276 == 1.0;
    if (_7278)
    {
        return _7266;
    }
    float _7280 = float(_7266);
    float _7282 = _7280 * _7276;
    int _7284 = int(_7282);
    return _7284;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2200 = false;
    bool _999 = false;
    bool _875 = false;
    bool _763 = false;
    bool _477 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _101 = int(_99);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2888 = as_type<float>(_117);
        out.gl_Position.z = _2888;
    }
    if (!_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_51.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _111 = _141;
    }
    float _143 = _111;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _119 = as_type<int>(_155);
    }
    int _157 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2958 = as_type<float>(_157);
        out.gl_Position.z = _2958;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = in.m_51.x;
    float _161 = in.m_51.y;
    float _163 = in.m_51.z;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = _165;
    if (!_175)
    {
        float _179 = _165 * _165;
        float _181 = _179 * 0.5;
        _137 = _181;
    }
    float _183 = _137;
    float _185 = 0.0;
    float _187 = _183;
    if (!_175)
    {
        float _189 = _135 * _135;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    if (!_175)
    {
        float _195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _195;
    }
    float _197 = _187;
    bool _199 = !_175;
    float _201 = 0.0;
    float _203 = _197;
    float _205 = 0.0;
    if (!_199)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _165 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _165);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _223;
        _203 = _235;
        _205 = _225;
    }
    float _237 = _201;
    float _239 = _203;
    float _241 = _205;
    bool _243 = !_175;
    float _245 = _237;
    float _247 = _241;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _165 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _245 = _261;
        _247 = _255;
        _177 = _267;
    }
    float _269 = _245;
    float _271 = _247;
    float _273 = _177;
    float _275 = _271;
    float _277 = _269;
    if (!_175)
    {
        _275 = _135;
    }
    float _279 = _275;
    float _281 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _283 = _279;
    if (!_175)
    {
        float _285 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _285;
    }
    float _287 = _277;
    bool _289 = !_175;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _135 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _135);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
    }
    float _323 = _291;
    bool _325 = !_175;
    if (!_325)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = 1.0 / _333;
        float _337 = _135 * _329;
        float _339 = exp2(_337);
        float _341 = -_339;
        float _343 = _341 + 1.0;
        float _345 = _343 * _335;
        _283 = _345;
    }
    float _347 = _283;
    float _349 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _351 = fma(_273, _161, _281);
    float _353 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = fma(_347, _161, _349);
    float _359 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_273, _159, _353);
    float _365 = fma(_347, _159, _355);
    float _367 = -_357;
    float _369 = _351 + _367;
    float _371 = fma(_273, _163, _359);
    float _373 = fma(_347, _163, _361);
    float _375 = -_365;
    float _377 = _363 + _375;
    float _379 = _369 * _369;
    float _381 = in.m_53.w;
    float _383 = -_373;
    float _385 = _371 + _383;
    float _387 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_377, _377, _379);
    float _391 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _393 = in.m_46.x;
    float _395 = in.m_46.y;
    float _397 = in.m_46.z;
    float _399 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _401 = fma(_385, _385, _389);
    float _403 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _405 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _391);
    float _407 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _399);
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _411 = sqrt(_401);
    float _413 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _405);
    bool _417 = _411 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_411);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_363, _381, _393);
    float _429 = fma(_351, _381, _395);
    float _431 = fma(_371, _381, _397);
    float _433 = _415;
    float _435 = _409;
    float _437 = _413;
    if (!_425)
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
            _435 = _471;
            _437 = _475;
            _477 = true;
        }
        else
        {
            float _479 = _161 * _161;
            float _481 = fma(_159, _159, _479);
            float _483 = fma(_163, _163, _481);
            float _485 = sqrt(_483);
            bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
            bool _489 = isnan(_485);
            bool _491 = _487 || _489;
            bool _493 = isnan(9.9999999747524270787835121154785e-07);
            bool _495 = _491 || _493;
            if (!_495)
            {
                float _497 = _395 * _395;
                float _499 = fma(_393, _393, _497);
                float _501 = fma(_397, _397, _499);
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
                    _435 = _525;
                    _437 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _433 = _561;
                    _435 = _559;
                    _437 = _563;
                    _477 = true;
                }
            }
            else
            {
                float _565 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _567 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _569 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _571 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
                float _573 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _567);
                float _575 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
                float _577 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
                float _579 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
                float _581 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _575);
                float _583 = _577 * _577;
                float _585 = fma(_579, _579, _583);
                float _587 = fma(_581, _581, _585);
                float _589 = rsqrt(_587);
                float _591 = _589 * 9.9999999747524270787835121154785e-07;
                float _593 = _579 * _591;
                float _595 = _577 * _591;
                float _597 = _581 * _591;
                _433 = _595;
                _435 = _593;
                _437 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _433;
    float _601 = _435;
    float _603 = _437;
    float _605 = in.m_55.x;
    float _607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _609 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _611 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _619 = _617 != 0;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _623 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _625 = _623 != 0;
    float _627 = _609 * _607;
    float _629 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].x, _627);
    float _631 = _611 * _621;
    float _633 = floor(_629);
    float _635 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].y, _631);
    float _637 = _629 * 6.283185482025146484375;
    float _639 = _637 * 0.15915493667125701904296875;
    bool _641 = !_615;
    int _643 = _641 ? 0 : 1;
    float _645 = floor(_635);
    int _647 = abs(_643);
    float _649 = -_633;
    float _651 = _629 + _649;
    float _653 = _635 * 6.283185482025146484375;
    float _655 = _639 * 6.283185482025146484375;
    float _657 = cos(_655);
    bool _659 = !_619;
    int _661 = _659 ? 0 : 1;
    float _663 = _653 * 0.15915493667125701904296875;
    float _665 = -_645;
    float _667 = _635 + _665;
    bool _669 = !_625;
    int _671 = _669 ? 0 : 1;
    float _673 = -_651;
    float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _677 = _663 * 6.283185482025146484375;
    float _679 = cos(_677);
    bool _681 = _651 < 0.5;
    float _683 = float(_681);
    float _685 = -_667;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _691 = float(_647);
    float _693 = -_683;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _697 = fma(_657, 0.5, 0.5);
    int _699 = abs(_671);
    int _701 = abs(_661);
    float _703 = -_697;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _707 = float(_699);
    float _709 = abs(_675);
    float _711 = _691 * _709;
    float _713 = abs(_687);
    float _715 = _691 * _713;
    float _717 = fma(_679, 0.5, 0.5);
    bool _719 = _667 < 0.5;
    float _721 = float(_719);
    float _723 = fma(_707, _705, _711);
    float _725 = float(_701);
    float _727 = -_717;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _731 = -_721;
    float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _735 = fma(_707, _729, _715);
    float _737 = abs(_695);
    float _739 = fma(_725, _737, _723);
    float _741 = abs(_733);
    float _743 = fma(_725, _741, _735);
    bool _745 = !_689;
    float _761;
    if (!_745)
    {
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _749 = _605 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_101);
        float _767 = 1.0 / _765;
        float _769 = _135 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _775 = _771 + _773;
    bool _777 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _779 = isnan(_771);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _789;
    bool _793 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _795 = isnan(_771);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_787;
    float _807 = _805 + 1.0;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _809;
    float _813 = 1.0 / _791;
    bool _815 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _817 = _803 * _807;
    float _819 = -_803;
    float _821 = _819 + 1.0;
    float _823 = _775 * _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _825;
    float _829 = fma(_811, _823, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _831;
    float _835 = fma(_827, _823, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _837 = fma(_833, _823, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _839 = _829 * _817;
    float _841 = _837 * _817;
    float _843 = _835 * _817;
    float _845 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].x, _839);
    float _847 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].y, _841);
    float _849 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].z, _843);
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[144].x, _845);
    float _853 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[144].y, _847);
    float _855 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[144].z, _849);
    bool _857 = !_815;
    float _873;
    if (!_857)
    {
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _861 = _605 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[11].x, _135);
        float _865 = _863 * _859;
        float _867 = floor(_865);
        float _869 = -_867;
        float _871 = _865 + _869;
        _873 = _871;
        _875 = true;
    }
    else
    {
        float _877 = float(_101);
        float _879 = 1.0 / _877;
        float _881 = _135 * _879;
        _873 = _881;
    }
    _875 = false;
    float _883 = _873;
    float _885 = in.m_53.x;
    float _887 = in.m_53.y;
    float _889 = in.m_53.z;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _893 = _883 + _891;
    bool _895 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _897 = isnan(_883);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _907;
    bool _911 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _913 = 1.0 / _909;
    float _915 = _855 * _889;
    float _917 = _853 * _887;
    float _919 = -_905;
    float _921 = _919 + 1.0;
    float _923 = _893 * _913;
    bool _925 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _927 = isnan(_883);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _941;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _945;
    float _949 = _851 * _885;
    float _951 = _935 * _921;
    float _953 = fma(_939, _923, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _955 = fma(_947, _923, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _957 = fma(_943, _923, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _959 = -_935;
    float _961 = _959 + 1.0;
    float _963 = _953 * _951;
    float _965 = _955 * _951;
    float _967 = _957 * _951;
    float _969 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[107].x, _963);
    float _971 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[107].y, _965);
    float _973 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[107].z, _967);
    float _975 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[108].x, _969);
    float _977 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[108].y, _971);
    float _979 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[108].z, _973);
    bool _981 = !_911;
    float _997;
    if (!_981)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _985 = _605 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _989 = _987 * _983;
        float _991 = floor(_989);
        float _993 = -_991;
        float _995 = _989 + _993;
        _997 = _995;
        _999 = true;
    }
    else
    {
        float _1001 = float(_101);
        float _1003 = 1.0 / _1001;
        float _1005 = _135 * _1003;
        _997 = _1005;
    }
    _999 = false;
    float _1007 = _997;
    int _1009 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1011 = _1009;
    int _1013 = 0;
    int _1015 = _92(_1011, _1013, (*spvDescriptorSet0.support_buffer));
    float _1017 = _605 * 8.0;
    float _1019 = in.m_57.z;
    float _1021 = in.m_57.y;
    float _1023 = rint(_1017);
    float _1025 = _1023 * 0.125;
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = in.m_55.y;
    int _1031 = _1015 + (-1);
    float _1033 = float(_1031);
    float _1035 = _1027 * _1033;
    float _1037 = trunc(_1019);
    int _1039 = int(_1037);
    float _1041 = trunc(_1035);
    int _1043 = int(_1041);
    int _1045 = _1043 + 1;
    int _1047 = min(_1031, _1045);
    int _1049 = _1043;
    int _1051 = 0;
    int _1053 = _93(_1049, _1051, (*spvDescriptorSet0.support_buffer));
    int _1055 = _1039;
    int _1057 = 0;
    int _1059 = _93(_1055, _1057, (*spvDescriptorSet0.support_buffer));
    float3 _1063 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1053, _1059)), 0).xyz;
    float _1065 = _1063.x;
    float _1067 = _1063.y;
    float _1069 = _1063.z;
    int _1071 = _1047;
    int _1073 = 0;
    int _1075 = _93(_1071, _1073, (*spvDescriptorSet0.support_buffer));
    int _1077 = _1039;
    int _1079 = 0;
    int _1081 = _93(_1077, _1079, (*spvDescriptorSet0.support_buffer));
    float3 _1083 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1075, _1081)), 0).xyz;
    float _1085 = _1083.x;
    float _1087 = _1083.y;
    float _1089 = _1083.z;
    float _1091 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1095 = _1093 != 0;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1103 = _1101 != 0;
    float _1105 = in.m_57.x;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1109 = _1107 != 0;
    float _1111 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1091);
    float _1113 = in.m_55.z;
    bool _1115 = _1029 > 0.5;
    float _1117 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1119 = -_1021;
    float _1121 = _1119 + 1.0;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1127 = _1125 != 0;
    float _1129 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1135 = _1021;
    float _1137 = _1105;
    if (_1109)
    {
        float _1139 = _1115 ? _1121 : _1021;
        _1135 = _1139;
    }
    float _1141 = _1135;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1147 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1129);
    float _1149 = 1.0 / _1133;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1151;
    float _1155 = _605 * 2.0;
    float _1157 = _739 * _949;
    float _1159 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1117);
    bool _1161 = _605 > 0.5;
    bool _1163 = _1161 && _1127;
    float _1165 = 1.0 / _1145;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1169 = _605 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1173 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1147);
    float _1175 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1111);
    float _1177 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1159);
    float _1179 = floor(_1155);
    float _1181 = -_1171;
    float _1183 = fma(_1169, 2.0, _1181);
    float _1185 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1187 = _1029 * 2.0;
    float _1189 = -_135;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1183);
    float _1193 = fma(_1185, _1141, -0.5);
    float _1195 = _605 + _1113;
    float _1197 = _1153 * _1165;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1201 = _1199 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1203 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1205 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1207 = log2(_1205);
    float _1209 = _1201 * _1149;
    float _1211 = _599 * _599;
    float _1213 = fma(_1203, -2.0, _1167);
    float _1215 = _605 + _1029;
    float _1217 = _1029 + _1113;
    float _1219 = fma(_601, _601, _1211);
    bool _1221 = _1179 > 0.0;
    float _1223 = _1215 + (-1.0);
    bool _1225 = _1179 >= 0.0;
    bool _1227 = isnan(_1179);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan(0.0);
    bool _1233 = _1229 || _1231;
    float _1235 = fma(_603, _603, _1219);
    float _1237 = _1219;
    if (_1127)
    {
        _1237 = _1105;
    }
    float _1239 = _1237;
    float _1241 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1243 = _1113 * 2.0;
    float _1245 = floor(_1187);
    float _1247 = _1195 + (-1.0);
    float _1249 = _1239;
    if (_1163)
    {
        float _1251 = -_1239;
        float _1253 = _1251 + 1.0;
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = _1217 + (-1.0);
    float _1259 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1261 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1263 = floor(_1243);
    if (_1127)
    {
        _1137 = _1255;
    }
    float _1265 = _1137;
    float _1267 = _1207 * _135;
    int _1269 = _1233 ? 0 : 1;
    float _1271 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1213);
    bool _1273 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1275 = isnan(_1007);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = _1029 + (-0.5);
    int _1287 = ~_1269;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    float _1293 = rsqrt(_1235);
    int _1295 = _1291;
    if (!_1221)
    {
        int _1297 = ~_1269;
        int _1299 = _1297 + 1;
        _1295 = _1299;
    }
    int _1301 = _1295;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1305 = _1007 + _1303;
    bool _1307 = _1245 > 0.0;
    float _1309 = _1175 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1311 = _1245 >= 0.0;
    bool _1313 = isnan(_1245);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan(0.0);
    bool _1319 = _1315 || _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1323 = _1007 + _1321;
    float _1325 = fma(_1197, _1305, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1327 = exp2(_1267);
    bool _1329 = _1263 > 0.0;
    float _1331 = fma(_1209, _1323, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1333 = _1263 >= 0.0;
    bool _1335 = isnan(_1263);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan(0.0);
    bool _1341 = _1337 || _1339;
    float _1343 = _1173 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1345 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1347 = isnan(_1007);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = _1177 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1359 = _1293 * _601;
    bool _1361 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1363 = isnan(_1007);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = _1293 * _599;
    float _1375 = _1293 * _603;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1379 = 1.0 + _1377;
    bool _1381 = !_1099;
    int _1383 = _1381 ? 0 : 1;
    float _1385 = -_1371;
    float _1387 = _1385 + 1.0;
    float _1389 = -_1327;
    float _1391 = _1389 + 1.0;
    bool _1393 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1401 = _1397 || _1399;
    float _1403 = 1.0 / _1379;
    float _1405 = _1283 * _1387;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1409 = _1401 ? _1391 : 0.0;
    float _1411 = -_1283;
    float _1413 = _1411 + 1.0;
    bool _1415 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1417 = isnan(1.0);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1423 = _1419 || _1421;
    float _1425 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1407);
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1431 = _1355 * _1413;
    float _1433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1435 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1427);
    float _1437 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1429);
    float _1439 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1425);
    float _1441 = float(_1301);
    float _1443 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1435);
    float _1445 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1437);
    float _1447 = _1325 * _1431;
    if (_1423)
    {
        float _1449 = _1409 * _1403;
        _139 = _1449;
    }
    float _1451 = _139;
    int _1453 = abs(_1383);
    float _1455 = _1439 * (-0.15915493667125701904296875);
    float _1457 = in.m_59.x;
    float _1459 = in.m_59.y;
    float _1461 = in.m_59.z;
    float _1463 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1465 = -_1355;
    float _1467 = _1465 + 1.0;
    float _1469 = float(_1453);
    float _1471 = _1455 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1477 = _1463 * _605;
    int _1479 = _1341 ? 0 : 1;
    float _1481 = _1469 * _1441;
    float _1483 = fma(_1475, _1265, -0.5);
    int _1485 = _1319 ? 0 : 1;
    float _1487 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1447);
    float _1489 = trunc(_1477);
    int _1491 = int(_1489);
    int _1493 = ~_1479;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1501 = _1375 * _1499;
    int _1503 = _1497;
    if (!_1329)
    {
        int _1505 = ~_1479;
        int _1507 = _1505 + 1;
        _1503 = _1507;
    }
    int _1509 = _1503;
    float _1511 = _1481 * (-2.0);
    int _1513 = ~_1485;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    float _1519 = fma(_1331, _1405, _1487);
    int _1521 = _1517;
    if (!_1307)
    {
        int _1523 = ~_1485;
        int _1525 = _1523 + 1;
        _1521 = _1525;
    }
    int _1527 = _1521;
    float _1529 = _1455 * 6.283185482025146484375;
    float _1531 = cos(_1529);
    float _1533 = _1473 * _1193;
    float _1535 = fma(_1261, _1511, _1261);
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1539 = _1343 + _1537;
    float _1541 = fma(_1511, _1459, _1459);
    float _1543 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1545 = _1309 + _1543;
    bool _1547 = !_1095;
    int _1549 = _1547 ? 0 : 1;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1553 = _1373 * _1551;
    int _1555 = _1491 << 4;
    int _1557 = _1555 + 1968;
    float _1559 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1541);
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1563 = -_1501;
    float _1565 = fma(_1359, _1561, _1563);
    int _1567 = abs(_1549);
    uint _1570 = uint(int(uint(_1557) >> uint(2)));
    uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
    int _1574 = int(_1570) & 3;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[int(_1572)][_1574];
    int _1578 = int(_1570) + 1;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    int _1582 = _1578 & 3;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[int(_1580)][_1582];
    float _1586 = fma(_1535, _1451, _1559);
    bool _1588 = !_1103;
    int _1590 = _1588 ? 0 : 1;
    float _1592 = _1565 * _1565;
    float _1594 = -_1533;
    float _1596 = fma(_1531, _1483, _1594);
    float _1598 = _1545 * _1545;
    float _1600 = _1531 * _1193;
    float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1604 = _1357 + _1602;
    int _1606 = _1557 + 8;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
    int _1612 = int(_1608) & 3;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[int(_1610)][_1612];
    float _1616 = fma(_1539, _1539, _1598);
    float _1618 = float(_1567);
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1622 = -_1553;
    float _1624 = fma(_1375, _1620, _1622);
    int _1626 = abs(_1590);
    float _1628 = fma(_1604, _1604, _1616);
    float _1630 = float(_1509);
    float _1632 = fma(_1624, _1624, _1592);
    float _1634 = float(_1626);
    float _1636 = rsqrt(_1628);
    float _1638 = float(_1527);
    float _1640 = _1618 * _1630;
    float _1642 = fma(_1473, _1483, _1600);
    float _1644 = _605 + (-0.5);
    float _1646 = _1113 + (-0.5);
    float _1648 = _1640 * (-2.0);
    float _1650 = _1634 * _1638;
    float _1652 = -_1271;
    float _1654 = fma(_1445, _1642, _1652);
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1658 = _1359 * _1656;
    float _1660 = fma(_1648, _1457, _1457);
    float _1662 = fma(_1241, _1648, _1241);
    float _1664 = _1650 * (-2.0);
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1668 = -_1658;
    float _1670 = fma(_1373, _1666, _1668);
    float _1672 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1660);
    float _1674 = _1586 * 0.15915493667125701904296875;
    float _1676 = _1545 * _1636;
    float _1678 = fma(_1664, _1461, _1461);
    float _1680 = fma(_1662, _1451, _1672);
    float _1682 = _1539 * _1636;
    float _1684 = -_1676;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1545);
    float _1688 = fma(_1259, _1664, _1259);
    float _1690 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1678);
    float _1692 = -_1682;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1539);
    float _1696 = _1686 * _1686;
    float _1698 = _1604 * _1636;
    float _1700 = _1680 * 0.15915493667125701904296875;
    float _1702 = fma(_1688, _1451, _1690);
    float _1704 = fma(_1670, _1670, _1632);
    float _1706 = fma(_1694, _1694, _1696);
    float _1708 = -_1698;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1604);
    float _1712 = fma(_1443, _1596, _1191);
    float _1714 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1519);
    float _1716 = _1674 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = _1702 * 0.15915493667125701904296875;
    float _1722 = fma(_1710, _1710, _1706);
    float _1724 = _1576 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1726 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1728 = _743 * _917;
    float _1730 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1732 = _979 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1734 = _1674 * 6.283185482025146484375;
    float _1736 = cos(_1734);
    float _1738 = _977 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1740 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1746 = _1712 + 0.5;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1750 = _1700 * 6.283185482025146484375;
    float _1752 = sin(_1750);
    float _1754 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1758 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1762 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1744;
    out.m_61.y = _1742;
    out.m_61.z = _1754;
    out.m_61.w = _1748;
    float _1764 = _1654 + 0.5;
    float _1766 = _1700 * 6.283185482025146484375;
    float _1768 = cos(_1766);
    float _1770 = _1728 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_63.x = _1758;
    out.m_63.y = _1760;
    out.m_63.z = _1762;
    out.m_63.w = _1756;
    float _1772 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_65.x = _1746;
    out.m_65.y = _1764;
    float _1774 = rsqrt(_1704);
    float _1776 = _1752 * _1736;
    float _1778 = _1720 * 6.283185482025146484375;
    float _1780 = sin(_1778);
    float _1782 = _1768 * _1718;
    float _1784 = _1768 * _1736;
    float _1786 = sqrt(_1722);
    float _1788 = _1624 * _1774;
    float _1790 = _1565 * _1774;
    float _1792 = _1752 * _1718;
    float _1794 = _1670 * _1774;
    float _1796 = _1375 * _1788;
    float _1798 = _1720 * 6.283185482025146484375;
    float _1800 = cos(_1798);
    float _1802 = -_1782;
    float _1804 = fma(_1780, _1776, _1802);
    float _1806 = -_1776;
    float _1808 = fma(_1780, _1782, _1806);
    float _1810 = _1359 * _1790;
    float _1812 = fma(_1780, _1784, _1792);
    float _1814 = fma(_1780, _1792, _1784);
    float _1816 = _1373 * _1794;
    float _1818 = -_1810;
    float _1820 = fma(_1373, _1788, _1818);
    float _1822 = _1636 * _1786;
    float _1824 = _1812 * _1359;
    float _1826 = floor(_1035);
    float _1828 = _1770 * _1822;
    float _1830 = _1772 * _1822;
    float _1832 = _1768 * _1800;
    float _1834 = _1718 * _1800;
    float _1836 = _1736 * _1800;
    float _1838 = -_1796;
    float _1840 = fma(_1359, _1794, _1838);
    float _1842 = _1832 * _1359;
    float _1844 = _1832 * _1373;
    float _1846 = _1808 * _1359;
    float _1848 = _1808 * _1373;
    float _1850 = _1752 * _1800;
    float _1852 = _1808 * _1375;
    float _1854 = _1832 * _1375;
    float _1856 = -_1780;
    float _1858 = fma(_1856, _1788, _1842);
    float _1860 = -_1780;
    float _1862 = fma(_1860, _1790, _1844);
    float _1864 = _1812 * _1373;
    float _1866 = -_1816;
    float _1868 = fma(_1375, _1790, _1866);
    float _1870 = _1812 * _1375;
    float _1872 = fma(_1836, _1788, _1824);
    float _1874 = fma(_1834, _1788, _1846);
    float _1876 = fma(_1834, _1790, _1848);
    float _1878 = fma(_1834, _1794, _1852);
    float _1880 = fma(_1836, _1790, _1864);
    float _1882 = fma(_1836, _1794, _1870);
    float _1884 = fma(_1850, _1868, _1858);
    float _1886 = fma(_1804, _1868, _1872);
    float _1888 = fma(_1814, _1868, _1874);
    float _1890 = fma(_1814, _1840, _1876);
    float _1892 = fma(_1814, _1820, _1878);
    float _1894 = -_1826;
    float _1896 = _1035 + _1894;
    float _1898 = -_1067;
    float _1900 = _1898 + _1087;
    float _1902 = fma(_1804, _1840, _1880);
    float _1904 = fma(_1804, _1820, _1882);
    float _1906 = -_1065;
    float _1908 = _1906 + _1085;
    float _1910 = fma(_1896, _1900, _1067);
    float _1912 = -_1780;
    float _1914 = fma(_1912, _1794, _1854);
    float _1916 = -_1069;
    float _1918 = _1916 + _1089;
    float _1920 = fma(_1896, _1908, _1065);
    float _1922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1910);
    float _1924 = fma(_1850, _1820, _1914);
    float _1926 = _915 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1920);
    float _1930 = fma(_1896, _1918, _1069);
    float _1932 = _1828 * _1922;
    float _1934 = _1926 * _1822;
    float _1936 = _1830 * _1928;
    float _1938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1930);
    float _1940 = _1932 * _1884;
    float _1942 = _1932 * _1924;
    float _1944 = fma(_1850, _1840, _1862);
    float _1946 = _1934 * _1938;
    float _1948 = fma(_1936, _1886, _1940);
    float _1950 = fma(_1936, _1904, _1942);
    float _1952 = _1932 * _1944;
    bool _1954 = _1910 != 0.0;
    bool _1956 = isnan(_1910);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(0.0);
    bool _1962 = _1958 || _1960;
    float _1964 = fma(_1946, _1888, _1948);
    float _1966 = fma(_1946, _1892, _1950);
    float _1968 = fma(_1936, _1902, _1952);
    bool _1970 = _1920 == 0.0;
    bool _1972 = !_1962;
    bool _1974 = _1970 && _1972;
    float _1976 = _1343 + _1964;
    float _1978 = _1357 + _1966;
    float _1980 = fma(_1946, _1890, _1968);
    float _1982 = in.m_67.x;
    float _1984 = in.m_67.y;
    float _1986 = in.m_67.z;
    float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1990 = _1976 + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1994 = _1978 + _1992;
    float _1996 = _1309 + _1980;
    bool _1998 = _1930 == 0.0;
    bool _2000 = _1998 && _1974;
    float _2002 = _1990 * _1990;
    float _2004 = _1994 * _1994;
    float _2006 = _2002 + _2004;
    float _2008 = sqrt(_2006);
    bool _2010 = _2008 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2012 = _1946;
    float _2014 = _1936;
    float _2016 = _1980;
    float _2018 = _2002;
    float _2020 = _2004;
    float _2022 = _1886;
    if (!_2010)
    {
        _2012 = _1976;
    }
    float _2024 = _2012;
    float _2026 = _2024;
    if (!_2010)
    {
        _2014 = _1978;
    }
    float _2028 = _2014;
    float _2030 = _2028;
    if (!_2010)
    {
        _2016 = _1996;
    }
    float _2032 = _2016;
    bool _2034 = !_2010;
    float _2036 = _2032;
    float _2038 = _1984;
    float _2040 = _1982;
    float _2042 = _1986;
    if (!_2034)
    {
        float _2044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2048 = _2008 + _2046;
        float _2050 = rsqrt(_2006);
        float _2052 = _2048 * _2044;
        float _2054 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2056 = _2052 * 0.15915493667125701904296875;
        float _2058 = _2056 * 6.283185482025146484375;
        float _2060 = sin(_2058);
        float _2062 = _2056 * 6.283185482025146484375;
        float _2064 = cos(_2062);
        float _2066 = fma(_2060, _2054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2068 = _2050 * _2066;
        float _2070 = _2064 + (-1.0);
        float _2072 = fma(_1990, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2074 = fma(_1994, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2076 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2080 = _2072 + _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2084 = _2074 + _2082;
        float _2086 = fma(_1996, _2064, _2076);
        float _2088 = _2080 * _2080;
        float _2090 = _2084 * _2084;
        _2036 = _2086;
        _2018 = _2088;
        _2020 = _2090;
        _2030 = _2074;
        _2026 = _2072;
    }
    float _2092 = _2036;
    float _2094 = _2018;
    float _2096 = _2020;
    float _2098 = _2030;
    float _2100 = _2026;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2104 = _2092 + _2102;
    float _2106 = in.m_69.x;
    float _2108 = _2092;
    if (!_2000)
    {
        float _2110 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1984);
        _2038 = _2110;
    }
    float _2112 = _2038;
    if (!_2000)
    {
        float _2114 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1982);
        _2040 = _2114;
    }
    float _2116 = _2040;
    float _2118 = fma(_2104, _2104, _2094);
    float _2120 = in.m_69.y;
    float _2122 = _1884 * _2112;
    float _2124 = _1944 * _2112;
    float _2126 = _2118 + _2096;
    float _2128 = in.m_69.z;
    float _2130 = _1924 * _2112;
    float _2132 = fma(_1886, _2116, _2122);
    float _2134 = _2132;
    if (!_2000)
    {
        float _2136 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1986);
        _2042 = _2136;
    }
    float _2138 = _2042;
    float _2140 = in.m_69.w;
    float _2142 = sqrt(_2126);
    float _2144 = fma(_1902, _2116, _2124);
    float _2146 = fma(_1904, _2116, _2130);
    float _2148 = fma(_1888, _2138, _2132);
    float _2150 = fma(_1890, _2138, _2144);
    float _2152 = fma(_1892, _2138, _2146);
    out.m_71.x = _2106;
    out.m_71.y = _2120;
    bool _2154 = _2142 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2156 = isnan(_2142);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2162 = _2158 || _2160;
    out.m_71.z = _2128;
    out.m_71.w = _2140;
    out.m_73.x = _2148;
    out.m_73.y = _2150;
    out.m_73.z = _2152;
    float _2164 = _2120;
    if (!_2162)
    {
        _2022 = 1.0;
    }
    float _2166 = _2022;
    bool _2168 = !_2162;
    float _2170 = _2166;
    if (!_2168)
    {
        bool _2172 = _2142 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2174 = isnan(_2142);
        bool _2176 = _2172 || _2174;
        bool _2178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2180 = _2176 || _2178;
        if (!_2180)
        {
            float _2182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2184 = _2142 + _2182;
            float _2186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2186;
            float _2190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2192 = _2190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2194 = 1.0 / _2188;
            float _2196 = _2184 * _2194;
            float _2198 = fma(_2196, _2192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2170 = _2198;
            _2200 = true;
        }
        else
        {
            bool _2202 = _2142 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2204 = isnan(_2142);
            bool _2206 = _2202 || _2204;
            bool _2208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2210 = _2206 || _2208;
            if (!_2210)
            {
                float _2212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2214 = _2142 + _2212;
                float _2216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2218 = _2216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2222 = _2220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2224 = 1.0 / _2218;
                float _2226 = _2214 * _2224;
                float _2228 = fma(_2226, _2222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2170 = _2228;
                _2200 = true;
            }
            else
            {
                _2170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2200 = false;
    float _2230 = _2170;
    float _2232 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2234 = _2098 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2238 = _2100 + _2236;
    bool _2240 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2242 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan(0.5);
    bool _2248 = _2244 || _2246;
    float _2250 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2252 = _2092 + _2250;
    float _2254 = fma(_2234, _2230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2256 = fma(_2238, _2230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2258 = fma(_2252, _2230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2260 = -_1698;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2254);
    float _2264 = -_1682;
    float _2266 = fma(_2264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1343);
    float _2268 = -_1682;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2256);
    float _2272 = -_1676;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2258);
    float _2276 = -_1676;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _2280 = -_1698;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _2284 = _2274;
    float _2286 = _2270;
    float _2288 = _2262;
    float _2290 = _2256;
    if (!_2248)
    {
        float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2294 = _2278 + _2292;
        float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2298 = _2266 + _2296;
        float _2300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2302 = -_1357;
        float _2304 = _2302 + _2254;
        float _2306 = _2294 * _2294;
        float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2310 = _2282 + _2308;
        float _2312 = -_1309;
        float _2314 = _2312 + _2258;
        float _2316 = fma(_2298, _2298, _2306);
        float _2318 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2320 = fma(_2310, _2310, _2316);
        float _2322 = sqrt(_2320);
        float _2324 = 1.0 / _1822;
        float _2326 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2328 = precise::min(_2322, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2330 = _2328 * _2300;
        float _2332 = -_1343;
        float _2334 = _2332 + _2256;
        float _2336 = _2330 * _2324;
        float _2338 = _2326 * _2336;
        float _2340 = _2304 * _2336;
        float _2342 = fma(_2334, _2338, _2266);
        float _2344 = fma(_2314, _2338, _2278);
        float _2346 = fma(_2326, _2340, _2282);
        _2284 = _2344;
        _2286 = _2342;
        _2288 = _2346;
        _2134 = _2338;
    }
    float _2348 = _2284;
    float _2350 = _2286;
    float _2352 = _2288;
    float _2354 = _2134;
    float _2356 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2358 = _2348 + _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2362 = _2350 + _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2366 = _2352 + _2364;
    float _2368 = _2358 * _2358;
    float _2370 = fma(_2362, _2362, _2368);
    float _2372 = fma(_2366, _2366, _2370);
    float _2374 = rsqrt(_2372);
    float _2376 = sqrt(_2372);
    float _2378 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2380 = _2362 * _2378;
    float _2382 = _2366 * _2378;
    float _2384 = _2380 * _2380;
    float _2386 = _2382 * _2382;
    float _2388 = _2384 + _2386;
    float _2390 = sqrt(_2388);
    bool _2392 = _2390 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2396 = _2390 + _2394;
    float _2398 = _2370;
    float _2400 = _2396;
    float _2402 = _2378;
    float _2404 = _2380;
    if (_2392)
    {
        float _2406 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2398 = _2406;
    }
    float _2408 = _2398;
    if (_2392)
    {
        float _2410 = rsqrt(_2388);
        _2290 = _2410;
    }
    float _2412 = _2290;
    float _2414 = _2412;
    if (_2392)
    {
        float _2416 = _2396 * _2408;
        _2400 = _2416;
    }
    float _2418 = _2400;
    if (_2392)
    {
        float _2420 = _2418 * 0.15915493667125701904296875;
        _2108 = _2420;
    }
    float _2422 = _2108;
    float _2424 = _2408;
    float _2426 = _2422;
    if (_2392)
    {
        float _2428 = _2422 * 6.283185482025146484375;
        float _2430 = sin(_2428);
        _2424 = _2430;
    }
    float _2432 = _2424;
    float _2434 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2436 = precise::max(0.0, _2434);
    float _2438 = _2354;
    float _2440 = _2436;
    if (_2392)
    {
        float _2442 = _2422 * 6.283185482025146484375;
        float _2444 = cos(_2442);
        _2438 = _2444;
    }
    float _2446 = _2438;
    float _2448 = -_2378;
    float _2450 = -_2436;
    float _2452 = fma(_2358, _2448, _2450);
    if (_2392)
    {
        float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2440 = _2454;
    }
    float _2456 = _2440;
    float _2458 = _2456;
    if (!_2392)
    {
        _2426 = _2384;
    }
    float _2460 = _2426;
    float _2462 = _2432;
    float _2464 = _2460;
    if (_2392)
    {
        float _2466 = fma(_2432, _2456, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2462 = _2466;
    }
    float _2468 = _2462;
    float _2470 = _2468;
    if (_2392)
    {
        float _2472 = _2446 + (-1.0);
        _2458 = _2472;
    }
    float _2474 = _2458;
    float _2476 = _2474;
    if (_2392)
    {
        float _2478 = _2412 * _2468;
        _2164 = _2478;
    }
    float _2480 = _2164;
    if (!_2392)
    {
        _2414 = _2452;
    }
    float _2482 = _2414;
    float _2484 = _2482;
    if (_2392)
    {
        float _2486 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2402 = _2486;
    }
    float _2488 = _2402;
    if (_2392)
    {
        float _2490 = _2380 * _2480;
        _2404 = _2490;
    }
    float _2492 = _2404;
    if (!_2392)
    {
        _2470 = _2382;
    }
    float _2494 = _2470;
    float _2496 = _2494;
    if (_2392)
    {
        float _2498 = _2382 * _2480;
        _2496 = _2498;
    }
    float _2500 = _2496;
    if (_2392)
    {
        float _2502 = fma(_2452, _2446, _2488);
        _2484 = _2502;
    }
    float _2504 = _2484;
    if (_2392)
    {
        float _2506 = _2492 * _2492;
        _2464 = _2506;
    }
    float _2508 = _2464;
    if (!_2392)
    {
        _2476 = _2386;
    }
    float _2510 = _2476;
    float _2512 = _2510;
    if (_2392)
    {
        float _2514 = _2500 * _2500;
        _2512 = _2514;
    }
    float _2516 = _2512;
    float _2518 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2520 = fma(_2504, _2504, _2508);
    float _2522 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2524 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2518);
    float _2526 = _2520 + _2516;
    float _2528 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2532 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2530);
    float _2534 = precise::clamp(_2532, 0.0, 1.0);
    float _2536 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2524);
    float _2538 = rsqrt(_2526);
    float _2540 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2528);
    float _2542 = -_2534;
    float _2544 = _2542 + 1.0;
    float _2546 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2548 = _2536 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2550 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2540);
    float _2552 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2522);
    float _2554 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2546);
    float _2556 = abs(_2544);
    float _2558 = log2(_2556);
    float _2560 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2562 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2552);
    float _2564 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2554);
    float _2566 = _2550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2568 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2570 = _2562 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2572 = _2564 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2574 = _2538 * _2492;
    float _2576 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2578 = _2538 * _2504;
    float _2580 = _2538 * _2500;
    float _2582 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2584 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2576);
    float _2586 = -_2568;
    float _2588 = fma(_2586, _2560, 1.0);
    float _2590 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2592 = -_2582;
    float _2594 = fma(_2578, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2592);
    float _2596 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2584);
    float _2598 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2600 = log2(_2588);
    float _2602 = -_2580;
    float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2594);
    float _2606 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2596);
    float _2608 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2610 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2598);
    float _2612 = fma(_2604, -0.5, 0.5);
    float _2614 = fma(_2604, 0.5, 0.5);
    float _2616 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2608);
    float _2618 = exp2(_2590);
    float _2620 = _2578 + 1.0;
    float _2622 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2610);
    float _2624 = fma(_2614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2626 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2616);
    float _2628 = 1.0 / _2606;
    float _2630 = _2600 * 0.693147182464599609375;
    float _2632 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2634 = sqrt(_2612);
    float _2636 = -_2578;
    float _2638 = fma(_2618, _2620, _2636);
    float _2640 = fma(_2614, _2624, -0.212114393711090087890625);
    float _2642 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2622);
    float _2644 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2626);
    float _2646 = fma(_2614, _2640, 1.570728778839111328125);
    float _2648 = _2642 * _2628;
    float _2650 = _2644 * _2628;
    float _2652 = fma(_2648, 0.5, 0.5);
    float _2654 = fma(_2650, -0.5, 0.5);
    float _2656 = fma(_2638, 0.5, 0.5);
    float _2658 = _2634 * 0.636619746685028076171875;
    float3 _6889 = float3(_2652, _2654, _2632);
    float _2660 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6889, float3(0.0), isnan(_6889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6889, float3(0.0), isnan(_6889)), level(0.0)).x;
    float3 _6900 = float3(_2652, _2654, _2632);
    float4 _2663 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6900, float3(0.0), isnan(_6900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6900, float3(0.0), isnan(_6900)), level(0.0)).xyzw;
    float _2665 = _2663.x;
    float _2667 = _2663.y;
    float _2669 = _2663.z;
    float _2671 = _2663.w;
    float _2673 = -_2646;
    float _2675 = fma(_2658, _2673, 1.0);
    float2 _6922 = float2(_2675, _2656);
    float3 _2677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6922, float2(0.0), isnan(_6922)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6922, float2(0.0), isnan(_6922)), level(0.0)).xyz;
    float _2679 = _2677.x;
    float _2681 = _2677.y;
    float _2683 = _2677.z;
    float _2685 = _2278 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_75.x = _2362;
    out.m_75.y = _2358;
    out.m_75.z = _2366;
    float _2687 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2685);
    float _2689 = _2278 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2691 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2687);
    float _2693 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2689);
    float _2695 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2697 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2693);
    float _2699 = 1.0 / _2695;
    bool _2701 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2703 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(0.5);
    bool _2709 = _2705 || _2707;
    float _2711 = _2697 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2713 = _2711 + _2695;
    float _2715 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2717 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2719 = _2654;
    float _2721 = _2658;
    float _2723 = _2566;
    if (!_2709)
    {
        _2717 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2725 = _2717;
    float _2727 = exp2(_2715);
    float _2729 = _2713 * _2699;
    float _2731 = _2729 * 0.5;
    float _2733 = _2731;
    if (!_2709)
    {
        _2719 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2735 = _2719;
    float _2737 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2739 = _2737;
    if (!_2709)
    {
        float _2741 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2743 = fma(_2731, _2725, _2741);
        _2733 = _2743;
    }
    float _2745 = _2733;
    if (!_2709)
    {
        float _2747 = -_2735;
        float _2749 = _2747 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2721 = _2749;
    }
    float _2751 = _2721;
    float _2753 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2737);
    if (_2709)
    {
        _2739 = 1.0;
    }
    float _2755 = _2739;
    float _2757 = _2745;
    float _2759 = _2755;
    if (!_2709)
    {
        float _2761 = 1.0 / _2745;
        _2757 = _2761;
    }
    float _2763 = _2757;
    float _2765 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2753);
    float _2767 = -_2727;
    float _2769 = _2767 + 1.0;
    float _2771 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2765);
    float _2773 = _2751;
    if (!_2709)
    {
        float _2775 = 1.0 / _2751;
        _2773 = _2775;
    }
    float _2777 = _2773;
    float _2779 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2642;
    out.gl_Position.y = _2644;
    out.gl_Position.z = _2771;
    out.gl_Position.w = _2606;
    if (!_2709)
    {
        float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2783 = -_2735;
        float _2785 = fma(_2763, _2781, _2783);
        _2723 = _2785;
    }
    float _2787 = _2723;
    if (!_2709)
    {
        float _2789 = _2787 * _2777;
        float _2791 = precise::clamp(_2789, 0.0, 1.0);
        _2759 = _2791;
    }
    float _2793 = _2759;
    float _2795 = _2771 + _2606;
    float _2797 = _2793 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2799 = _2793 > 0.0;
    bool _2801 = isnan(_2793);
    bool _2803 = _2799 || _2801;
    bool _2805 = isnan(0.0);
    bool _2807 = _2803 || _2805;
    float _2809 = _2795 * 0.5;
    float _2811 = _2797 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.z = _2809;
    out.m_77.w = _2606;
    out.m_49.x = _2811;
    float _2813 = _2779 * _2660;
    float _2815 = -_2779;
    float _2817 = _2815 + 1.0;
    float _2819 = _2671 * _2813;
    float _2821 = _2683 * _2813;
    float _2823 = fma(_2679, _2819, _2665);
    float _2825 = fma(_2681, _2819, _2667);
    float _2827 = _2671 * _2817;
    float _2829 = fma(_2671, _2821, _2669);
    out.m_79.x = _2823;
    out.m_79.y = _2825;
    out.m_79.z = _2829;
    out.m_79.w = _2827;
    if (_2807)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2831;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2200 = false;
    bool _999 = false;
    bool _875 = false;
    bool _763 = false;
    bool _477 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _101 = int(_99);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2888 = as_type<float>(_117);
        out.gl_Position.z = _2888;
    }
    if (!_105)
    {
        return out;
    }
    float _121 = in.m_51.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _111 = _141;
    }
    float _143 = _111;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _119 = as_type<int>(_155);
    }
    int _157 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2958 = as_type<float>(_157);
        out.gl_Position.z = _2958;
    }
    if (_149)
    {
        return out;
    }
    float _159 = in.m_51.x;
    float _161 = in.m_51.y;
    float _163 = in.m_51.z;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = _165;
    if (!_175)
    {
        float _179 = _165 * _165;
        float _181 = _179 * 0.5;
        _137 = _181;
    }
    float _183 = _137;
    float _185 = 0.0;
    float _187 = _183;
    if (!_175)
    {
        float _189 = _135 * _135;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    if (!_175)
    {
        float _195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _195;
    }
    float _197 = _187;
    bool _199 = !_175;
    float _201 = 0.0;
    float _203 = _197;
    float _205 = 0.0;
    if (!_199)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _165 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _165);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _223;
        _203 = _235;
        _205 = _225;
    }
    float _237 = _201;
    float _239 = _203;
    float _241 = _205;
    bool _243 = !_175;
    float _245 = _237;
    float _247 = _241;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _165 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _245 = _261;
        _247 = _255;
        _177 = _267;
    }
    float _269 = _245;
    float _271 = _247;
    float _273 = _177;
    float _275 = _271;
    float _277 = _269;
    if (!_175)
    {
        _275 = _135;
    }
    float _279 = _275;
    float _281 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _283 = _279;
    if (!_175)
    {
        float _285 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _285;
    }
    float _287 = _277;
    bool _289 = !_175;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _135 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _135);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
    }
    float _323 = _291;
    bool _325 = !_175;
    if (!_325)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = 1.0 / _333;
        float _337 = _135 * _329;
        float _339 = exp2(_337);
        float _341 = -_339;
        float _343 = _341 + 1.0;
        float _345 = _343 * _335;
        _283 = _345;
    }
    float _347 = _283;
    float _349 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _351 = fma(_273, _161, _281);
    float _353 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = fma(_347, _161, _349);
    float _359 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_273, _159, _353);
    float _365 = fma(_347, _159, _355);
    float _367 = -_357;
    float _369 = _351 + _367;
    float _371 = fma(_273, _163, _359);
    float _373 = fma(_347, _163, _361);
    float _375 = -_365;
    float _377 = _363 + _375;
    float _379 = _369 * _369;
    float _381 = in.m_53.w;
    float _383 = -_373;
    float _385 = _371 + _383;
    float _387 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_377, _377, _379);
    float _391 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _393 = in.m_46.x;
    float _395 = in.m_46.y;
    float _397 = in.m_46.z;
    float _399 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _401 = fma(_385, _385, _389);
    float _403 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _405 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _391);
    float _407 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _399);
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _411 = sqrt(_401);
    float _413 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _405);
    bool _417 = _411 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_411);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_363, _381, _393);
    float _429 = fma(_351, _381, _395);
    float _431 = fma(_371, _381, _397);
    float _433 = _415;
    float _435 = _409;
    float _437 = _413;
    if (!_425)
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
            _435 = _471;
            _437 = _475;
            _477 = true;
        }
        else
        {
            float _479 = _161 * _161;
            float _481 = fma(_159, _159, _479);
            float _483 = fma(_163, _163, _481);
            float _485 = sqrt(_483);
            bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
            bool _489 = isnan(_485);
            bool _491 = _487 || _489;
            bool _493 = isnan(9.9999999747524270787835121154785e-07);
            bool _495 = _491 || _493;
            if (!_495)
            {
                float _497 = _395 * _395;
                float _499 = fma(_393, _393, _497);
                float _501 = fma(_397, _397, _499);
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
                    _435 = _525;
                    _437 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _433 = _561;
                    _435 = _559;
                    _437 = _563;
                    _477 = true;
                }
            }
            else
            {
                float _565 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _567 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _569 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _571 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
                float _573 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _567);
                float _575 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
                float _577 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
                float _579 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
                float _581 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _575);
                float _583 = _577 * _577;
                float _585 = fma(_579, _579, _583);
                float _587 = fma(_581, _581, _585);
                float _589 = rsqrt(_587);
                float _591 = _589 * 9.9999999747524270787835121154785e-07;
                float _593 = _579 * _591;
                float _595 = _577 * _591;
                float _597 = _581 * _591;
                _433 = _595;
                _435 = _593;
                _437 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _433;
    float _601 = _435;
    float _603 = _437;
    float _605 = in.m_55.x;
    float _607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _609 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _611 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _619 = _617 != 0;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _623 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _625 = _623 != 0;
    float _627 = _609 * _607;
    float _629 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].x, _627);
    float _631 = _611 * _621;
    float _633 = floor(_629);
    float _635 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].y, _631);
    float _637 = _629 * 6.283185482025146484375;
    float _639 = _637 * 0.15915493667125701904296875;
    bool _641 = !_615;
    int _643 = _641 ? 0 : 1;
    float _645 = floor(_635);
    int _647 = abs(_643);
    float _649 = -_633;
    float _651 = _629 + _649;
    float _653 = _635 * 6.283185482025146484375;
    float _655 = _639 * 6.283185482025146484375;
    float _657 = cos(_655);
    bool _659 = !_619;
    int _661 = _659 ? 0 : 1;
    float _663 = _653 * 0.15915493667125701904296875;
    float _665 = -_645;
    float _667 = _635 + _665;
    bool _669 = !_625;
    int _671 = _669 ? 0 : 1;
    float _673 = -_651;
    float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _677 = _663 * 6.283185482025146484375;
    float _679 = cos(_677);
    bool _681 = _651 < 0.5;
    float _683 = float(_681);
    float _685 = -_667;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _691 = float(_647);
    float _693 = -_683;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _697 = fma(_657, 0.5, 0.5);
    int _699 = abs(_671);
    int _701 = abs(_661);
    float _703 = -_697;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _707 = float(_699);
    float _709 = abs(_675);
    float _711 = _691 * _709;
    float _713 = abs(_687);
    float _715 = _691 * _713;
    float _717 = fma(_679, 0.5, 0.5);
    bool _719 = _667 < 0.5;
    float _721 = float(_719);
    float _723 = fma(_707, _705, _711);
    float _725 = float(_701);
    float _727 = -_717;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _731 = -_721;
    float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _735 = fma(_707, _729, _715);
    float _737 = abs(_695);
    float _739 = fma(_725, _737, _723);
    float _741 = abs(_733);
    float _743 = fma(_725, _741, _735);
    bool _745 = !_689;
    float _761;
    if (!_745)
    {
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _749 = _605 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_101);
        float _767 = 1.0 / _765;
        float _769 = _135 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _775 = _771 + _773;
    bool _777 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _779 = isnan(_771);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _789;
    bool _793 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _795 = isnan(_771);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_787;
    float _807 = _805 + 1.0;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _809;
    float _813 = 1.0 / _791;
    bool _815 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _817 = _803 * _807;
    float _819 = -_803;
    float _821 = _819 + 1.0;
    float _823 = _775 * _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _825;
    float _829 = fma(_811, _823, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _831;
    float _835 = fma(_827, _823, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _837 = fma(_833, _823, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _839 = _829 * _817;
    float _841 = _837 * _817;
    float _843 = _835 * _817;
    float _845 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].x, _839);
    float _847 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].y, _841);
    float _849 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].z, _843);
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[144].x, _845);
    float _853 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[144].y, _847);
    float _855 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[144].z, _849);
    bool _857 = !_815;
    float _873;
    if (!_857)
    {
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _861 = _605 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[11].x, _135);
        float _865 = _863 * _859;
        float _867 = floor(_865);
        float _869 = -_867;
        float _871 = _865 + _869;
        _873 = _871;
        _875 = true;
    }
    else
    {
        float _877 = float(_101);
        float _879 = 1.0 / _877;
        float _881 = _135 * _879;
        _873 = _881;
    }
    _875 = false;
    float _883 = _873;
    float _885 = in.m_53.x;
    float _887 = in.m_53.y;
    float _889 = in.m_53.z;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _893 = _883 + _891;
    bool _895 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _897 = isnan(_883);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _907;
    bool _911 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _913 = 1.0 / _909;
    float _915 = _855 * _889;
    float _917 = _853 * _887;
    float _919 = -_905;
    float _921 = _919 + 1.0;
    float _923 = _893 * _913;
    bool _925 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _927 = isnan(_883);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _941;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _945;
    float _949 = _851 * _885;
    float _951 = _935 * _921;
    float _953 = fma(_939, _923, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _955 = fma(_947, _923, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _957 = fma(_943, _923, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _959 = -_935;
    float _961 = _959 + 1.0;
    float _963 = _953 * _951;
    float _965 = _955 * _951;
    float _967 = _957 * _951;
    float _969 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[107].x, _963);
    float _971 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[107].y, _965);
    float _973 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[107].z, _967);
    float _975 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[108].x, _969);
    float _977 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[108].y, _971);
    float _979 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[108].z, _973);
    bool _981 = !_911;
    float _997;
    if (!_981)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _985 = _605 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _989 = _987 * _983;
        float _991 = floor(_989);
        float _993 = -_991;
        float _995 = _989 + _993;
        _997 = _995;
        _999 = true;
    }
    else
    {
        float _1001 = float(_101);
        float _1003 = 1.0 / _1001;
        float _1005 = _135 * _1003;
        _997 = _1005;
    }
    _999 = false;
    float _1007 = _997;
    int _1009 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1011 = _1009;
    int _1013 = 0;
    int _1015 = _92(_1011, _1013, (*spvDescriptorSet0.support_buffer));
    float _1017 = _605 * 8.0;
    float _1019 = in.m_57.z;
    float _1021 = in.m_57.y;
    float _1023 = rint(_1017);
    float _1025 = _1023 * 0.125;
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = in.m_55.y;
    int _1031 = _1015 + (-1);
    float _1033 = float(_1031);
    float _1035 = _1027 * _1033;
    float _1037 = trunc(_1019);
    int _1039 = int(_1037);
    float _1041 = trunc(_1035);
    int _1043 = int(_1041);
    int _1045 = _1043 + 1;
    int _1047 = min(_1031, _1045);
    int _1049 = _1043;
    int _1051 = 0;
    int _1053 = _93(_1049, _1051, (*spvDescriptorSet0.support_buffer));
    int _1055 = _1039;
    int _1057 = 0;
    int _1059 = _93(_1055, _1057, (*spvDescriptorSet0.support_buffer));
    float3 _1063 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1053, _1059)), 0).xyz;
    float _1065 = _1063.x;
    float _1067 = _1063.y;
    float _1069 = _1063.z;
    int _1071 = _1047;
    int _1073 = 0;
    int _1075 = _93(_1071, _1073, (*spvDescriptorSet0.support_buffer));
    int _1077 = _1039;
    int _1079 = 0;
    int _1081 = _93(_1077, _1079, (*spvDescriptorSet0.support_buffer));
    float3 _1083 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1075, _1081)), 0).xyz;
    float _1085 = _1083.x;
    float _1087 = _1083.y;
    float _1089 = _1083.z;
    float _1091 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1095 = _1093 != 0;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1103 = _1101 != 0;
    float _1105 = in.m_57.x;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1109 = _1107 != 0;
    float _1111 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1091);
    float _1113 = in.m_55.z;
    bool _1115 = _1029 > 0.5;
    float _1117 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1119 = -_1021;
    float _1121 = _1119 + 1.0;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1127 = _1125 != 0;
    float _1129 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1135 = _1021;
    float _1137 = _1105;
    if (_1109)
    {
        float _1139 = _1115 ? _1121 : _1021;
        _1135 = _1139;
    }
    float _1141 = _1135;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1147 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1129);
    float _1149 = 1.0 / _1133;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1151;
    float _1155 = _605 * 2.0;
    float _1157 = _739 * _949;
    float _1159 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1117);
    bool _1161 = _605 > 0.5;
    bool _1163 = _1161 && _1127;
    float _1165 = 1.0 / _1145;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1169 = _605 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1173 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1147);
    float _1175 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1111);
    float _1177 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1159);
    float _1179 = floor(_1155);
    float _1181 = -_1171;
    float _1183 = fma(_1169, 2.0, _1181);
    float _1185 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1187 = _1029 * 2.0;
    float _1189 = -_135;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1183);
    float _1193 = fma(_1185, _1141, -0.5);
    float _1195 = _605 + _1113;
    float _1197 = _1153 * _1165;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1201 = _1199 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1203 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1205 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1207 = log2(_1205);
    float _1209 = _1201 * _1149;
    float _1211 = _599 * _599;
    float _1213 = fma(_1203, -2.0, _1167);
    float _1215 = _605 + _1029;
    float _1217 = _1029 + _1113;
    float _1219 = fma(_601, _601, _1211);
    bool _1221 = _1179 > 0.0;
    float _1223 = _1215 + (-1.0);
    bool _1225 = _1179 >= 0.0;
    bool _1227 = isnan(_1179);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan(0.0);
    bool _1233 = _1229 || _1231;
    float _1235 = fma(_603, _603, _1219);
    float _1237 = _1219;
    if (_1127)
    {
        _1237 = _1105;
    }
    float _1239 = _1237;
    float _1241 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1243 = _1113 * 2.0;
    float _1245 = floor(_1187);
    float _1247 = _1195 + (-1.0);
    float _1249 = _1239;
    if (_1163)
    {
        float _1251 = -_1239;
        float _1253 = _1251 + 1.0;
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = _1217 + (-1.0);
    float _1259 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1261 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1263 = floor(_1243);
    if (_1127)
    {
        _1137 = _1255;
    }
    float _1265 = _1137;
    float _1267 = _1207 * _135;
    int _1269 = _1233 ? 0 : 1;
    float _1271 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1213);
    bool _1273 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1275 = isnan(_1007);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = _1029 + (-0.5);
    int _1287 = ~_1269;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    float _1293 = rsqrt(_1235);
    int _1295 = _1291;
    if (!_1221)
    {
        int _1297 = ~_1269;
        int _1299 = _1297 + 1;
        _1295 = _1299;
    }
    int _1301 = _1295;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1305 = _1007 + _1303;
    bool _1307 = _1245 > 0.0;
    float _1309 = _1175 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1311 = _1245 >= 0.0;
    bool _1313 = isnan(_1245);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan(0.0);
    bool _1319 = _1315 || _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1323 = _1007 + _1321;
    float _1325 = fma(_1197, _1305, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1327 = exp2(_1267);
    bool _1329 = _1263 > 0.0;
    float _1331 = fma(_1209, _1323, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1333 = _1263 >= 0.0;
    bool _1335 = isnan(_1263);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan(0.0);
    bool _1341 = _1337 || _1339;
    float _1343 = _1173 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1345 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1347 = isnan(_1007);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = _1177 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1359 = _1293 * _601;
    bool _1361 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1363 = isnan(_1007);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = _1293 * _599;
    float _1375 = _1293 * _603;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1379 = 1.0 + _1377;
    bool _1381 = !_1099;
    int _1383 = _1381 ? 0 : 1;
    float _1385 = -_1371;
    float _1387 = _1385 + 1.0;
    float _1389 = -_1327;
    float _1391 = _1389 + 1.0;
    bool _1393 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1401 = _1397 || _1399;
    float _1403 = 1.0 / _1379;
    float _1405 = _1283 * _1387;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1409 = _1401 ? _1391 : 0.0;
    float _1411 = -_1283;
    float _1413 = _1411 + 1.0;
    bool _1415 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1417 = isnan(1.0);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1423 = _1419 || _1421;
    float _1425 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1407);
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1431 = _1355 * _1413;
    float _1433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1435 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1427);
    float _1437 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1429);
    float _1439 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1425);
    float _1441 = float(_1301);
    float _1443 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1435);
    float _1445 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1437);
    float _1447 = _1325 * _1431;
    if (_1423)
    {
        float _1449 = _1409 * _1403;
        _139 = _1449;
    }
    float _1451 = _139;
    int _1453 = abs(_1383);
    float _1455 = _1439 * (-0.15915493667125701904296875);
    float _1457 = in.m_59.x;
    float _1459 = in.m_59.y;
    float _1461 = in.m_59.z;
    float _1463 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1465 = -_1355;
    float _1467 = _1465 + 1.0;
    float _1469 = float(_1453);
    float _1471 = _1455 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1477 = _1463 * _605;
    int _1479 = _1341 ? 0 : 1;
    float _1481 = _1469 * _1441;
    float _1483 = fma(_1475, _1265, -0.5);
    int _1485 = _1319 ? 0 : 1;
    float _1487 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1447);
    float _1489 = trunc(_1477);
    int _1491 = int(_1489);
    int _1493 = ~_1479;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1501 = _1375 * _1499;
    int _1503 = _1497;
    if (!_1329)
    {
        int _1505 = ~_1479;
        int _1507 = _1505 + 1;
        _1503 = _1507;
    }
    int _1509 = _1503;
    float _1511 = _1481 * (-2.0);
    int _1513 = ~_1485;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    float _1519 = fma(_1331, _1405, _1487);
    int _1521 = _1517;
    if (!_1307)
    {
        int _1523 = ~_1485;
        int _1525 = _1523 + 1;
        _1521 = _1525;
    }
    int _1527 = _1521;
    float _1529 = _1455 * 6.283185482025146484375;
    float _1531 = cos(_1529);
    float _1533 = _1473 * _1193;
    float _1535 = fma(_1261, _1511, _1261);
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1539 = _1343 + _1537;
    float _1541 = fma(_1511, _1459, _1459);
    float _1543 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1545 = _1309 + _1543;
    bool _1547 = !_1095;
    int _1549 = _1547 ? 0 : 1;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1553 = _1373 * _1551;
    int _1555 = _1491 << 4;
    int _1557 = _1555 + 1968;
    float _1559 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1541);
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1563 = -_1501;
    float _1565 = fma(_1359, _1561, _1563);
    int _1567 = abs(_1549);
    uint _1570 = uint(int(uint(_1557) >> uint(2)));
    uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
    int _1574 = int(_1570) & 3;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[int(_1572)][_1574];
    int _1578 = int(_1570) + 1;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    int _1582 = _1578 & 3;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[int(_1580)][_1582];
    float _1586 = fma(_1535, _1451, _1559);
    bool _1588 = !_1103;
    int _1590 = _1588 ? 0 : 1;
    float _1592 = _1565 * _1565;
    float _1594 = -_1533;
    float _1596 = fma(_1531, _1483, _1594);
    float _1598 = _1545 * _1545;
    float _1600 = _1531 * _1193;
    float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1604 = _1357 + _1602;
    int _1606 = _1557 + 8;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
    int _1612 = int(_1608) & 3;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[int(_1610)][_1612];
    float _1616 = fma(_1539, _1539, _1598);
    float _1618 = float(_1567);
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1622 = -_1553;
    float _1624 = fma(_1375, _1620, _1622);
    int _1626 = abs(_1590);
    float _1628 = fma(_1604, _1604, _1616);
    float _1630 = float(_1509);
    float _1632 = fma(_1624, _1624, _1592);
    float _1634 = float(_1626);
    float _1636 = rsqrt(_1628);
    float _1638 = float(_1527);
    float _1640 = _1618 * _1630;
    float _1642 = fma(_1473, _1483, _1600);
    float _1644 = _605 + (-0.5);
    float _1646 = _1113 + (-0.5);
    float _1648 = _1640 * (-2.0);
    float _1650 = _1634 * _1638;
    float _1652 = -_1271;
    float _1654 = fma(_1445, _1642, _1652);
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1658 = _1359 * _1656;
    float _1660 = fma(_1648, _1457, _1457);
    float _1662 = fma(_1241, _1648, _1241);
    float _1664 = _1650 * (-2.0);
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1668 = -_1658;
    float _1670 = fma(_1373, _1666, _1668);
    float _1672 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1660);
    float _1674 = _1586 * 0.15915493667125701904296875;
    float _1676 = _1545 * _1636;
    float _1678 = fma(_1664, _1461, _1461);
    float _1680 = fma(_1662, _1451, _1672);
    float _1682 = _1539 * _1636;
    float _1684 = -_1676;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1545);
    float _1688 = fma(_1259, _1664, _1259);
    float _1690 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1678);
    float _1692 = -_1682;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1539);
    float _1696 = _1686 * _1686;
    float _1698 = _1604 * _1636;
    float _1700 = _1680 * 0.15915493667125701904296875;
    float _1702 = fma(_1688, _1451, _1690);
    float _1704 = fma(_1670, _1670, _1632);
    float _1706 = fma(_1694, _1694, _1696);
    float _1708 = -_1698;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1604);
    float _1712 = fma(_1443, _1596, _1191);
    float _1714 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1519);
    float _1716 = _1674 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = _1702 * 0.15915493667125701904296875;
    float _1722 = fma(_1710, _1710, _1706);
    float _1724 = _1576 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1726 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1728 = _743 * _917;
    float _1730 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1732 = _979 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1734 = _1674 * 6.283185482025146484375;
    float _1736 = cos(_1734);
    float _1738 = _977 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1740 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1746 = _1712 + 0.5;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1750 = _1700 * 6.283185482025146484375;
    float _1752 = sin(_1750);
    float _1754 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1758 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1762 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1744;
    out.m_61.y = _1742;
    out.m_61.z = _1754;
    out.m_61.w = _1748;
    float _1764 = _1654 + 0.5;
    float _1766 = _1700 * 6.283185482025146484375;
    float _1768 = cos(_1766);
    float _1770 = _1728 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_63.x = _1758;
    out.m_63.y = _1760;
    out.m_63.z = _1762;
    out.m_63.w = _1756;
    float _1772 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_65.x = _1746;
    out.m_65.y = _1764;
    float _1774 = rsqrt(_1704);
    float _1776 = _1752 * _1736;
    float _1778 = _1720 * 6.283185482025146484375;
    float _1780 = sin(_1778);
    float _1782 = _1768 * _1718;
    float _1784 = _1768 * _1736;
    float _1786 = sqrt(_1722);
    float _1788 = _1624 * _1774;
    float _1790 = _1565 * _1774;
    float _1792 = _1752 * _1718;
    float _1794 = _1670 * _1774;
    float _1796 = _1375 * _1788;
    float _1798 = _1720 * 6.283185482025146484375;
    float _1800 = cos(_1798);
    float _1802 = -_1782;
    float _1804 = fma(_1780, _1776, _1802);
    float _1806 = -_1776;
    float _1808 = fma(_1780, _1782, _1806);
    float _1810 = _1359 * _1790;
    float _1812 = fma(_1780, _1784, _1792);
    float _1814 = fma(_1780, _1792, _1784);
    float _1816 = _1373 * _1794;
    float _1818 = -_1810;
    float _1820 = fma(_1373, _1788, _1818);
    float _1822 = _1636 * _1786;
    float _1824 = _1812 * _1359;
    float _1826 = floor(_1035);
    float _1828 = _1770 * _1822;
    float _1830 = _1772 * _1822;
    float _1832 = _1768 * _1800;
    float _1834 = _1718 * _1800;
    float _1836 = _1736 * _1800;
    float _1838 = -_1796;
    float _1840 = fma(_1359, _1794, _1838);
    float _1842 = _1832 * _1359;
    float _1844 = _1832 * _1373;
    float _1846 = _1808 * _1359;
    float _1848 = _1808 * _1373;
    float _1850 = _1752 * _1800;
    float _1852 = _1808 * _1375;
    float _1854 = _1832 * _1375;
    float _1856 = -_1780;
    float _1858 = fma(_1856, _1788, _1842);
    float _1860 = -_1780;
    float _1862 = fma(_1860, _1790, _1844);
    float _1864 = _1812 * _1373;
    float _1866 = -_1816;
    float _1868 = fma(_1375, _1790, _1866);
    float _1870 = _1812 * _1375;
    float _1872 = fma(_1836, _1788, _1824);
    float _1874 = fma(_1834, _1788, _1846);
    float _1876 = fma(_1834, _1790, _1848);
    float _1878 = fma(_1834, _1794, _1852);
    float _1880 = fma(_1836, _1790, _1864);
    float _1882 = fma(_1836, _1794, _1870);
    float _1884 = fma(_1850, _1868, _1858);
    float _1886 = fma(_1804, _1868, _1872);
    float _1888 = fma(_1814, _1868, _1874);
    float _1890 = fma(_1814, _1840, _1876);
    float _1892 = fma(_1814, _1820, _1878);
    float _1894 = -_1826;
    float _1896 = _1035 + _1894;
    float _1898 = -_1067;
    float _1900 = _1898 + _1087;
    float _1902 = fma(_1804, _1840, _1880);
    float _1904 = fma(_1804, _1820, _1882);
    float _1906 = -_1065;
    float _1908 = _1906 + _1085;
    float _1910 = fma(_1896, _1900, _1067);
    float _1912 = -_1780;
    float _1914 = fma(_1912, _1794, _1854);
    float _1916 = -_1069;
    float _1918 = _1916 + _1089;
    float _1920 = fma(_1896, _1908, _1065);
    float _1922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1910);
    float _1924 = fma(_1850, _1820, _1914);
    float _1926 = _915 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1920);
    float _1930 = fma(_1896, _1918, _1069);
    float _1932 = _1828 * _1922;
    float _1934 = _1926 * _1822;
    float _1936 = _1830 * _1928;
    float _1938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1930);
    float _1940 = _1932 * _1884;
    float _1942 = _1932 * _1924;
    float _1944 = fma(_1850, _1840, _1862);
    float _1946 = _1934 * _1938;
    float _1948 = fma(_1936, _1886, _1940);
    float _1950 = fma(_1936, _1904, _1942);
    float _1952 = _1932 * _1944;
    bool _1954 = _1910 != 0.0;
    bool _1956 = isnan(_1910);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(0.0);
    bool _1962 = _1958 || _1960;
    float _1964 = fma(_1946, _1888, _1948);
    float _1966 = fma(_1946, _1892, _1950);
    float _1968 = fma(_1936, _1902, _1952);
    bool _1970 = _1920 == 0.0;
    bool _1972 = !_1962;
    bool _1974 = _1970 && _1972;
    float _1976 = _1343 + _1964;
    float _1978 = _1357 + _1966;
    float _1980 = fma(_1946, _1890, _1968);
    float _1982 = in.m_67.x;
    float _1984 = in.m_67.y;
    float _1986 = in.m_67.z;
    float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1990 = _1976 + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1994 = _1978 + _1992;
    float _1996 = _1309 + _1980;
    bool _1998 = _1930 == 0.0;
    bool _2000 = _1998 && _1974;
    float _2002 = _1990 * _1990;
    float _2004 = _1994 * _1994;
    float _2006 = _2002 + _2004;
    float _2008 = sqrt(_2006);
    bool _2010 = _2008 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2012 = _1946;
    float _2014 = _1936;
    float _2016 = _1980;
    float _2018 = _2002;
    float _2020 = _2004;
    float _2022 = _1886;
    if (!_2010)
    {
        _2012 = _1976;
    }
    float _2024 = _2012;
    float _2026 = _2024;
    if (!_2010)
    {
        _2014 = _1978;
    }
    float _2028 = _2014;
    float _2030 = _2028;
    if (!_2010)
    {
        _2016 = _1996;
    }
    float _2032 = _2016;
    bool _2034 = !_2010;
    float _2036 = _2032;
    float _2038 = _1984;
    float _2040 = _1982;
    float _2042 = _1986;
    if (!_2034)
    {
        float _2044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2048 = _2008 + _2046;
        float _2050 = rsqrt(_2006);
        float _2052 = _2048 * _2044;
        float _2054 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2056 = _2052 * 0.15915493667125701904296875;
        float _2058 = _2056 * 6.283185482025146484375;
        float _2060 = sin(_2058);
        float _2062 = _2056 * 6.283185482025146484375;
        float _2064 = cos(_2062);
        float _2066 = fma(_2060, _2054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2068 = _2050 * _2066;
        float _2070 = _2064 + (-1.0);
        float _2072 = fma(_1990, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2074 = fma(_1994, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2076 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2080 = _2072 + _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2084 = _2074 + _2082;
        float _2086 = fma(_1996, _2064, _2076);
        float _2088 = _2080 * _2080;
        float _2090 = _2084 * _2084;
        _2036 = _2086;
        _2018 = _2088;
        _2020 = _2090;
        _2030 = _2074;
        _2026 = _2072;
    }
    float _2092 = _2036;
    float _2094 = _2018;
    float _2096 = _2020;
    float _2098 = _2030;
    float _2100 = _2026;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2104 = _2092 + _2102;
    float _2106 = in.m_69.x;
    float _2108 = _2092;
    if (!_2000)
    {
        float _2110 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1984);
        _2038 = _2110;
    }
    float _2112 = _2038;
    if (!_2000)
    {
        float _2114 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1982);
        _2040 = _2114;
    }
    float _2116 = _2040;
    float _2118 = fma(_2104, _2104, _2094);
    float _2120 = in.m_69.y;
    float _2122 = _1884 * _2112;
    float _2124 = _1944 * _2112;
    float _2126 = _2118 + _2096;
    float _2128 = in.m_69.z;
    float _2130 = _1924 * _2112;
    float _2132 = fma(_1886, _2116, _2122);
    float _2134 = _2132;
    if (!_2000)
    {
        float _2136 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1986);
        _2042 = _2136;
    }
    float _2138 = _2042;
    float _2140 = in.m_69.w;
    float _2142 = sqrt(_2126);
    float _2144 = fma(_1902, _2116, _2124);
    float _2146 = fma(_1904, _2116, _2130);
    float _2148 = fma(_1888, _2138, _2132);
    float _2150 = fma(_1890, _2138, _2144);
    float _2152 = fma(_1892, _2138, _2146);
    out.m_71.x = _2106;
    out.m_71.y = _2120;
    bool _2154 = _2142 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2156 = isnan(_2142);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2162 = _2158 || _2160;
    out.m_71.z = _2128;
    out.m_71.w = _2140;
    out.m_73.x = _2148;
    out.m_73.y = _2150;
    out.m_73.z = _2152;
    float _2164 = _2120;
    if (!_2162)
    {
        _2022 = 1.0;
    }
    float _2166 = _2022;
    bool _2168 = !_2162;
    float _2170 = _2166;
    if (!_2168)
    {
        bool _2172 = _2142 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2174 = isnan(_2142);
        bool _2176 = _2172 || _2174;
        bool _2178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2180 = _2176 || _2178;
        if (!_2180)
        {
            float _2182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2184 = _2142 + _2182;
            float _2186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2186;
            float _2190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2192 = _2190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2194 = 1.0 / _2188;
            float _2196 = _2184 * _2194;
            float _2198 = fma(_2196, _2192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2170 = _2198;
            _2200 = true;
        }
        else
        {
            bool _2202 = _2142 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2204 = isnan(_2142);
            bool _2206 = _2202 || _2204;
            bool _2208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2210 = _2206 || _2208;
            if (!_2210)
            {
                float _2212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2214 = _2142 + _2212;
                float _2216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2218 = _2216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2222 = _2220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2224 = 1.0 / _2218;
                float _2226 = _2214 * _2224;
                float _2228 = fma(_2226, _2222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2170 = _2228;
                _2200 = true;
            }
            else
            {
                _2170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2200 = false;
    float _2230 = _2170;
    float _2232 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2234 = _2098 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2238 = _2100 + _2236;
    bool _2240 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2242 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan(0.5);
    bool _2248 = _2244 || _2246;
    float _2250 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2252 = _2092 + _2250;
    float _2254 = fma(_2234, _2230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2256 = fma(_2238, _2230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2258 = fma(_2252, _2230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2260 = -_1698;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2254);
    float _2264 = -_1682;
    float _2266 = fma(_2264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1343);
    float _2268 = -_1682;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2256);
    float _2272 = -_1676;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2258);
    float _2276 = -_1676;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _2280 = -_1698;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _2284 = _2274;
    float _2286 = _2270;
    float _2288 = _2262;
    float _2290 = _2256;
    if (!_2248)
    {
        float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2294 = _2278 + _2292;
        float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2298 = _2266 + _2296;
        float _2300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2302 = -_1357;
        float _2304 = _2302 + _2254;
        float _2306 = _2294 * _2294;
        float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2310 = _2282 + _2308;
        float _2312 = -_1309;
        float _2314 = _2312 + _2258;
        float _2316 = fma(_2298, _2298, _2306);
        float _2318 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2320 = fma(_2310, _2310, _2316);
        float _2322 = sqrt(_2320);
        float _2324 = 1.0 / _1822;
        float _2326 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2328 = precise::min(_2322, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2330 = _2328 * _2300;
        float _2332 = -_1343;
        float _2334 = _2332 + _2256;
        float _2336 = _2330 * _2324;
        float _2338 = _2326 * _2336;
        float _2340 = _2304 * _2336;
        float _2342 = fma(_2334, _2338, _2266);
        float _2344 = fma(_2314, _2338, _2278);
        float _2346 = fma(_2326, _2340, _2282);
        _2284 = _2344;
        _2286 = _2342;
        _2288 = _2346;
        _2134 = _2338;
    }
    float _2348 = _2284;
    float _2350 = _2286;
    float _2352 = _2288;
    float _2354 = _2134;
    float _2356 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2358 = _2348 + _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2362 = _2350 + _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2366 = _2352 + _2364;
    float _2368 = _2358 * _2358;
    float _2370 = fma(_2362, _2362, _2368);
    float _2372 = fma(_2366, _2366, _2370);
    float _2374 = rsqrt(_2372);
    float _2376 = sqrt(_2372);
    float _2378 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2380 = _2362 * _2378;
    float _2382 = _2366 * _2378;
    float _2384 = _2380 * _2380;
    float _2386 = _2382 * _2382;
    float _2388 = _2384 + _2386;
    float _2390 = sqrt(_2388);
    bool _2392 = _2390 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2396 = _2390 + _2394;
    float _2398 = _2370;
    float _2400 = _2396;
    float _2402 = _2378;
    float _2404 = _2380;
    if (_2392)
    {
        float _2406 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2398 = _2406;
    }
    float _2408 = _2398;
    if (_2392)
    {
        float _2410 = rsqrt(_2388);
        _2290 = _2410;
    }
    float _2412 = _2290;
    float _2414 = _2412;
    if (_2392)
    {
        float _2416 = _2396 * _2408;
        _2400 = _2416;
    }
    float _2418 = _2400;
    if (_2392)
    {
        float _2420 = _2418 * 0.15915493667125701904296875;
        _2108 = _2420;
    }
    float _2422 = _2108;
    float _2424 = _2408;
    float _2426 = _2422;
    if (_2392)
    {
        float _2428 = _2422 * 6.283185482025146484375;
        float _2430 = sin(_2428);
        _2424 = _2430;
    }
    float _2432 = _2424;
    float _2434 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2436 = precise::max(0.0, _2434);
    float _2438 = _2354;
    float _2440 = _2436;
    if (_2392)
    {
        float _2442 = _2422 * 6.283185482025146484375;
        float _2444 = cos(_2442);
        _2438 = _2444;
    }
    float _2446 = _2438;
    float _2448 = -_2378;
    float _2450 = -_2436;
    float _2452 = fma(_2358, _2448, _2450);
    if (_2392)
    {
        float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2440 = _2454;
    }
    float _2456 = _2440;
    float _2458 = _2456;
    if (!_2392)
    {
        _2426 = _2384;
    }
    float _2460 = _2426;
    float _2462 = _2432;
    float _2464 = _2460;
    if (_2392)
    {
        float _2466 = fma(_2432, _2456, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2462 = _2466;
    }
    float _2468 = _2462;
    float _2470 = _2468;
    if (_2392)
    {
        float _2472 = _2446 + (-1.0);
        _2458 = _2472;
    }
    float _2474 = _2458;
    float _2476 = _2474;
    if (_2392)
    {
        float _2478 = _2412 * _2468;
        _2164 = _2478;
    }
    float _2480 = _2164;
    if (!_2392)
    {
        _2414 = _2452;
    }
    float _2482 = _2414;
    float _2484 = _2482;
    if (_2392)
    {
        float _2486 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2402 = _2486;
    }
    float _2488 = _2402;
    if (_2392)
    {
        float _2490 = _2380 * _2480;
        _2404 = _2490;
    }
    float _2492 = _2404;
    if (!_2392)
    {
        _2470 = _2382;
    }
    float _2494 = _2470;
    float _2496 = _2494;
    if (_2392)
    {
        float _2498 = _2382 * _2480;
        _2496 = _2498;
    }
    float _2500 = _2496;
    if (_2392)
    {
        float _2502 = fma(_2452, _2446, _2488);
        _2484 = _2502;
    }
    float _2504 = _2484;
    if (_2392)
    {
        float _2506 = _2492 * _2492;
        _2464 = _2506;
    }
    float _2508 = _2464;
    if (!_2392)
    {
        _2476 = _2386;
    }
    float _2510 = _2476;
    float _2512 = _2510;
    if (_2392)
    {
        float _2514 = _2500 * _2500;
        _2512 = _2514;
    }
    float _2516 = _2512;
    float _2518 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2520 = fma(_2504, _2504, _2508);
    float _2522 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2524 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2518);
    float _2526 = _2520 + _2516;
    float _2528 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2532 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2530);
    float _2534 = precise::clamp(_2532, 0.0, 1.0);
    float _2536 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2524);
    float _2538 = rsqrt(_2526);
    float _2540 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2528);
    float _2542 = -_2534;
    float _2544 = _2542 + 1.0;
    float _2546 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2548 = _2536 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2550 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2540);
    float _2552 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2522);
    float _2554 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2546);
    float _2556 = abs(_2544);
    float _2558 = log2(_2556);
    float _2560 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2562 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2552);
    float _2564 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2554);
    float _2566 = _2550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2568 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2570 = _2562 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2572 = _2564 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2574 = _2538 * _2492;
    float _2576 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2578 = _2538 * _2504;
    float _2580 = _2538 * _2500;
    float _2582 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2584 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2576);
    float _2586 = -_2568;
    float _2588 = fma(_2586, _2560, 1.0);
    float _2590 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2592 = -_2582;
    float _2594 = fma(_2578, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2592);
    float _2596 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2584);
    float _2598 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2600 = log2(_2588);
    float _2602 = -_2580;
    float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2594);
    float _2606 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2596);
    float _2608 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2610 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2598);
    float _2612 = fma(_2604, -0.5, 0.5);
    float _2614 = fma(_2604, 0.5, 0.5);
    float _2616 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2608);
    float _2618 = exp2(_2590);
    float _2620 = _2578 + 1.0;
    float _2622 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2610);
    float _2624 = fma(_2614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2626 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2616);
    float _2628 = 1.0 / _2606;
    float _2630 = _2600 * 0.693147182464599609375;
    float _2632 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2634 = sqrt(_2612);
    float _2636 = -_2578;
    float _2638 = fma(_2618, _2620, _2636);
    float _2640 = fma(_2614, _2624, -0.212114393711090087890625);
    float _2642 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2622);
    float _2644 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2626);
    float _2646 = fma(_2614, _2640, 1.570728778839111328125);
    float _2648 = _2642 * _2628;
    float _2650 = _2644 * _2628;
    float _2652 = fma(_2648, 0.5, 0.5);
    float _2654 = fma(_2650, -0.5, 0.5);
    float _2656 = fma(_2638, 0.5, 0.5);
    float _2658 = _2634 * 0.636619746685028076171875;
    float3 _6889 = float3(_2652, _2654, _2632);
    float _2660 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6889, float3(0.0), isnan(_6889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6889, float3(0.0), isnan(_6889)), level(0.0)).x;
    float3 _6900 = float3(_2652, _2654, _2632);
    float4 _2663 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6900, float3(0.0), isnan(_6900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6900, float3(0.0), isnan(_6900)), level(0.0)).xyzw;
    float _2665 = _2663.x;
    float _2667 = _2663.y;
    float _2669 = _2663.z;
    float _2671 = _2663.w;
    float _2673 = -_2646;
    float _2675 = fma(_2658, _2673, 1.0);
    float2 _6922 = float2(_2675, _2656);
    float3 _2677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6922, float2(0.0), isnan(_6922)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6922, float2(0.0), isnan(_6922)), level(0.0)).xyz;
    float _2679 = _2677.x;
    float _2681 = _2677.y;
    float _2683 = _2677.z;
    float _2685 = _2278 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_75.x = _2362;
    out.m_75.y = _2358;
    out.m_75.z = _2366;
    float _2687 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2685);
    float _2689 = _2278 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2691 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2687);
    float _2693 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2689);
    float _2695 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2697 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2693);
    float _2699 = 1.0 / _2695;
    bool _2701 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2703 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(0.5);
    bool _2709 = _2705 || _2707;
    float _2711 = _2697 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2713 = _2711 + _2695;
    float _2715 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2717 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2719 = _2654;
    float _2721 = _2658;
    float _2723 = _2566;
    if (!_2709)
    {
        _2717 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2725 = _2717;
    float _2727 = exp2(_2715);
    float _2729 = _2713 * _2699;
    float _2731 = _2729 * 0.5;
    float _2733 = _2731;
    if (!_2709)
    {
        _2719 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2735 = _2719;
    float _2737 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2739 = _2737;
    if (!_2709)
    {
        float _2741 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2743 = fma(_2731, _2725, _2741);
        _2733 = _2743;
    }
    float _2745 = _2733;
    if (!_2709)
    {
        float _2747 = -_2735;
        float _2749 = _2747 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2721 = _2749;
    }
    float _2751 = _2721;
    float _2753 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2737);
    if (_2709)
    {
        _2739 = 1.0;
    }
    float _2755 = _2739;
    float _2757 = _2745;
    float _2759 = _2755;
    if (!_2709)
    {
        float _2761 = 1.0 / _2745;
        _2757 = _2761;
    }
    float _2763 = _2757;
    float _2765 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2753);
    float _2767 = -_2727;
    float _2769 = _2767 + 1.0;
    float _2771 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2765);
    float _2773 = _2751;
    if (!_2709)
    {
        float _2775 = 1.0 / _2751;
        _2773 = _2775;
    }
    float _2777 = _2773;
    float _2779 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2642;
    out.gl_Position.y = _2644;
    out.gl_Position.z = _2771;
    out.gl_Position.w = _2606;
    if (!_2709)
    {
        float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2783 = -_2735;
        float _2785 = fma(_2763, _2781, _2783);
        _2723 = _2785;
    }
    float _2787 = _2723;
    if (!_2709)
    {
        float _2789 = _2787 * _2777;
        float _2791 = precise::clamp(_2789, 0.0, 1.0);
        _2759 = _2791;
    }
    float _2793 = _2759;
    float _2795 = _2771 + _2606;
    float _2797 = _2793 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2799 = _2793 > 0.0;
    bool _2801 = isnan(_2793);
    bool _2803 = _2799 || _2801;
    bool _2805 = isnan(0.0);
    bool _2807 = _2803 || _2805;
    float _2809 = _2795 * 0.5;
    float _2811 = _2797 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.z = _2809;
    out.m_77.w = _2606;
    out.m_49.x = _2811;
    float _2813 = _2779 * _2660;
    float _2815 = -_2779;
    float _2817 = _2815 + 1.0;
    float _2819 = _2671 * _2813;
    float _2821 = _2683 * _2813;
    float _2823 = fma(_2679, _2819, _2665);
    float _2825 = fma(_2681, _2819, _2667);
    float _2827 = _2671 * _2817;
    float _2829 = fma(_2671, _2821, _2669);
    out.m_79.x = _2823;
    out.m_79.y = _2825;
    out.m_79.z = _2829;
    out.m_79.w = _2827;
    if (_2807)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2831;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2200 = false;
    bool _999 = false;
    bool _875 = false;
    bool _763 = false;
    bool _477 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _101 = int(_99);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    float _111 = _109;
    if (!_105)
    {
        out.m_49.x = 0.0;
    }
    int _113 = 0;
    if (!_105)
    {
        float _115 = _109 * 5.0;
        _113 = as_type<int>(_115);
    }
    int _117 = _113;
    int _119 = _117;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2888 = as_type<float>(_117);
        out.gl_Position.z = _2888;
    }
    if (!_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_51.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _137 = 0.0;
    float _139 = _135;
    if (_131)
    {
        float _141 = float(_101);
        _111 = _141;
    }
    float _143 = _111;
    bool _145 = _135 >= _143;
    bool _147 = !_131;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _119 = as_type<int>(_155);
    }
    int _157 = _119;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2958 = as_type<float>(_157);
        out.gl_Position.z = _2958;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = in.m_51.x;
    float _161 = in.m_51.y;
    float _163 = in.m_51.z;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = _165;
    if (!_175)
    {
        float _179 = _165 * _165;
        float _181 = _179 * 0.5;
        _137 = _181;
    }
    float _183 = _137;
    float _185 = 0.0;
    float _187 = _183;
    if (!_175)
    {
        float _189 = _135 * _135;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    if (!_175)
    {
        float _195 = _183 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _195;
    }
    float _197 = _187;
    bool _199 = !_175;
    float _201 = 0.0;
    float _203 = _197;
    float _205 = 0.0;
    if (!_199)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _165 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _165);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _223;
        _203 = _235;
        _205 = _225;
    }
    float _237 = _201;
    float _239 = _203;
    float _241 = _205;
    bool _243 = !_175;
    float _245 = _237;
    float _247 = _241;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _165 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _245 = _261;
        _247 = _255;
        _177 = _267;
    }
    float _269 = _245;
    float _271 = _247;
    float _273 = _177;
    float _275 = _271;
    float _277 = _269;
    if (!_175)
    {
        _275 = _135;
    }
    float _279 = _275;
    float _281 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _283 = _279;
    if (!_175)
    {
        float _285 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _285;
    }
    float _287 = _277;
    bool _289 = !_175;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _135 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _135);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
    }
    float _323 = _291;
    bool _325 = !_175;
    if (!_325)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = 1.0 / _333;
        float _337 = _135 * _329;
        float _339 = exp2(_337);
        float _341 = -_339;
        float _343 = _341 + 1.0;
        float _345 = _343 * _335;
        _283 = _345;
    }
    float _347 = _283;
    float _349 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _351 = fma(_273, _161, _281);
    float _353 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = fma(_347, _161, _349);
    float _359 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_273, _159, _353);
    float _365 = fma(_347, _159, _355);
    float _367 = -_357;
    float _369 = _351 + _367;
    float _371 = fma(_273, _163, _359);
    float _373 = fma(_347, _163, _361);
    float _375 = -_365;
    float _377 = _363 + _375;
    float _379 = _369 * _369;
    float _381 = in.m_53.w;
    float _383 = -_373;
    float _385 = _371 + _383;
    float _387 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_377, _377, _379);
    float _391 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _393 = in.m_46.x;
    float _395 = in.m_46.y;
    float _397 = in.m_46.z;
    float _399 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _401 = fma(_385, _385, _389);
    float _403 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _405 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _391);
    float _407 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _399);
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _411 = sqrt(_401);
    float _413 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _405);
    bool _417 = _411 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_411);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_363, _381, _393);
    float _429 = fma(_351, _381, _395);
    float _431 = fma(_371, _381, _397);
    float _433 = _415;
    float _435 = _409;
    float _437 = _413;
    if (!_425)
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
            _435 = _471;
            _437 = _475;
            _477 = true;
        }
        else
        {
            float _479 = _161 * _161;
            float _481 = fma(_159, _159, _479);
            float _483 = fma(_163, _163, _481);
            float _485 = sqrt(_483);
            bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
            bool _489 = isnan(_485);
            bool _491 = _487 || _489;
            bool _493 = isnan(9.9999999747524270787835121154785e-07);
            bool _495 = _491 || _493;
            if (!_495)
            {
                float _497 = _395 * _395;
                float _499 = fma(_393, _393, _497);
                float _501 = fma(_397, _397, _499);
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
                    _435 = _525;
                    _437 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _395 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _395 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _395 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _433 = _561;
                    _435 = _559;
                    _437 = _563;
                    _477 = true;
                }
            }
            else
            {
                float _565 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _567 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _569 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _571 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
                float _573 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _567);
                float _575 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
                float _577 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
                float _579 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
                float _581 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _575);
                float _583 = _577 * _577;
                float _585 = fma(_579, _579, _583);
                float _587 = fma(_581, _581, _585);
                float _589 = rsqrt(_587);
                float _591 = _589 * 9.9999999747524270787835121154785e-07;
                float _593 = _579 * _591;
                float _595 = _577 * _591;
                float _597 = _581 * _591;
                _433 = _595;
                _435 = _593;
                _437 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _433;
    float _601 = _435;
    float _603 = _437;
    float _605 = in.m_55.x;
    float _607 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _609 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _611 = _135 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _615 = _613 != 0;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _619 = _617 != 0;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    int _623 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _625 = _623 != 0;
    float _627 = _609 * _607;
    float _629 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].x, _627);
    float _631 = _611 * _621;
    float _633 = floor(_629);
    float _635 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[20].y, _631);
    float _637 = _629 * 6.283185482025146484375;
    float _639 = _637 * 0.15915493667125701904296875;
    bool _641 = !_615;
    int _643 = _641 ? 0 : 1;
    float _645 = floor(_635);
    int _647 = abs(_643);
    float _649 = -_633;
    float _651 = _629 + _649;
    float _653 = _635 * 6.283185482025146484375;
    float _655 = _639 * 6.283185482025146484375;
    float _657 = cos(_655);
    bool _659 = !_619;
    int _661 = _659 ? 0 : 1;
    float _663 = _653 * 0.15915493667125701904296875;
    float _665 = -_645;
    float _667 = _635 + _665;
    bool _669 = !_625;
    int _671 = _669 ? 0 : 1;
    float _673 = -_651;
    float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _677 = _663 * 6.283185482025146484375;
    float _679 = cos(_677);
    bool _681 = _651 < 0.5;
    float _683 = float(_681);
    float _685 = -_667;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _691 = float(_647);
    float _693 = -_683;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _697 = fma(_657, 0.5, 0.5);
    int _699 = abs(_671);
    int _701 = abs(_661);
    float _703 = -_697;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _707 = float(_699);
    float _709 = abs(_675);
    float _711 = _691 * _709;
    float _713 = abs(_687);
    float _715 = _691 * _713;
    float _717 = fma(_679, 0.5, 0.5);
    bool _719 = _667 < 0.5;
    float _721 = float(_719);
    float _723 = fma(_707, _705, _711);
    float _725 = float(_701);
    float _727 = -_717;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _731 = -_721;
    float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _735 = fma(_707, _729, _715);
    float _737 = abs(_695);
    float _739 = fma(_725, _737, _723);
    float _741 = abs(_733);
    float _743 = fma(_725, _741, _735);
    bool _745 = !_689;
    float _761;
    if (!_745)
    {
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _749 = _605 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_101);
        float _767 = 1.0 / _765;
        float _769 = _135 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _775 = _771 + _773;
    bool _777 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _779 = isnan(_771);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _789;
    bool _793 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _795 = isnan(_771);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_787;
    float _807 = _805 + 1.0;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _809;
    float _813 = 1.0 / _791;
    bool _815 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _817 = _803 * _807;
    float _819 = -_803;
    float _821 = _819 + 1.0;
    float _823 = _775 * _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _825;
    float _829 = fma(_811, _823, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _831;
    float _835 = fma(_827, _823, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _837 = fma(_833, _823, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _839 = _829 * _817;
    float _841 = _837 * _817;
    float _843 = _835 * _817;
    float _845 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].x, _839);
    float _847 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].y, _841);
    float _849 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].z, _843);
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[144].x, _845);
    float _853 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[144].y, _847);
    float _855 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[144].z, _849);
    bool _857 = !_815;
    float _873;
    if (!_857)
    {
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _861 = _605 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _863 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[11].x, _135);
        float _865 = _863 * _859;
        float _867 = floor(_865);
        float _869 = -_867;
        float _871 = _865 + _869;
        _873 = _871;
        _875 = true;
    }
    else
    {
        float _877 = float(_101);
        float _879 = 1.0 / _877;
        float _881 = _135 * _879;
        _873 = _881;
    }
    _875 = false;
    float _883 = _873;
    float _885 = in.m_53.x;
    float _887 = in.m_53.y;
    float _889 = in.m_53.z;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _893 = _883 + _891;
    bool _895 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _897 = isnan(_883);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _907;
    bool _911 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _913 = 1.0 / _909;
    float _915 = _855 * _889;
    float _917 = _853 * _887;
    float _919 = -_905;
    float _921 = _919 + 1.0;
    float _923 = _893 * _913;
    bool _925 = _883 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _927 = isnan(_883);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _941;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _945;
    float _949 = _851 * _885;
    float _951 = _935 * _921;
    float _953 = fma(_939, _923, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _955 = fma(_947, _923, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _957 = fma(_943, _923, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _959 = -_935;
    float _961 = _959 + 1.0;
    float _963 = _953 * _951;
    float _965 = _955 * _951;
    float _967 = _957 * _951;
    float _969 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[107].x, _963);
    float _971 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[107].y, _965);
    float _973 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[107].z, _967);
    float _975 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[108].x, _969);
    float _977 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[108].y, _971);
    float _979 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[108].z, _973);
    bool _981 = !_911;
    float _997;
    if (!_981)
    {
        float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _985 = _605 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _989 = _987 * _983;
        float _991 = floor(_989);
        float _993 = -_991;
        float _995 = _989 + _993;
        _997 = _995;
        _999 = true;
    }
    else
    {
        float _1001 = float(_101);
        float _1003 = 1.0 / _1001;
        float _1005 = _135 * _1003;
        _997 = _1005;
    }
    _999 = false;
    float _1007 = _997;
    int _1009 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1011 = _1009;
    int _1013 = 0;
    int _1015 = _92(_1011, _1013, (*spvDescriptorSet0.support_buffer));
    float _1017 = _605 * 8.0;
    float _1019 = in.m_57.z;
    float _1021 = in.m_57.y;
    float _1023 = rint(_1017);
    float _1025 = _1023 * 0.125;
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = in.m_55.y;
    int _1031 = _1015 + (-1);
    float _1033 = float(_1031);
    float _1035 = _1027 * _1033;
    float _1037 = trunc(_1019);
    int _1039 = int(_1037);
    float _1041 = trunc(_1035);
    int _1043 = int(_1041);
    int _1045 = _1043 + 1;
    int _1047 = min(_1031, _1045);
    int _1049 = _1043;
    int _1051 = 0;
    int _1053 = _93(_1049, _1051, (*spvDescriptorSet0.support_buffer));
    int _1055 = _1039;
    int _1057 = 0;
    int _1059 = _93(_1055, _1057, (*spvDescriptorSet0.support_buffer));
    float3 _1063 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1053, _1059)), 0).xyz;
    float _1065 = _1063.x;
    float _1067 = _1063.y;
    float _1069 = _1063.z;
    int _1071 = _1047;
    int _1073 = 0;
    int _1075 = _93(_1071, _1073, (*spvDescriptorSet0.support_buffer));
    int _1077 = _1039;
    int _1079 = 0;
    int _1081 = _93(_1077, _1079, (*spvDescriptorSet0.support_buffer));
    float3 _1083 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1075, _1081)), 0).xyz;
    float _1085 = _1083.x;
    float _1087 = _1083.y;
    float _1089 = _1083.z;
    float _1091 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1095 = _1093 != 0;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1103 = _1101 != 0;
    float _1105 = in.m_57.x;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1109 = _1107 != 0;
    float _1111 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1091);
    float _1113 = in.m_55.z;
    bool _1115 = _1029 > 0.5;
    float _1117 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1119 = -_1021;
    float _1121 = _1119 + 1.0;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1127 = _1125 != 0;
    float _1129 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1135 = _1021;
    float _1137 = _1105;
    if (_1109)
    {
        float _1139 = _1115 ? _1121 : _1021;
        _1135 = _1139;
    }
    float _1141 = _1135;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1147 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1129);
    float _1149 = 1.0 / _1133;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1151;
    float _1155 = _605 * 2.0;
    float _1157 = _739 * _949;
    float _1159 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1117);
    bool _1161 = _605 > 0.5;
    bool _1163 = _1161 && _1127;
    float _1165 = 1.0 / _1145;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1169 = _605 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1173 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1147);
    float _1175 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1111);
    float _1177 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1159);
    float _1179 = floor(_1155);
    float _1181 = -_1171;
    float _1183 = fma(_1169, 2.0, _1181);
    float _1185 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1187 = _1029 * 2.0;
    float _1189 = -_135;
    float _1191 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1183);
    float _1193 = fma(_1185, _1141, -0.5);
    float _1195 = _605 + _1113;
    float _1197 = _1153 * _1165;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1201 = _1199 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1203 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1205 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1207 = log2(_1205);
    float _1209 = _1201 * _1149;
    float _1211 = _599 * _599;
    float _1213 = fma(_1203, -2.0, _1167);
    float _1215 = _605 + _1029;
    float _1217 = _1029 + _1113;
    float _1219 = fma(_601, _601, _1211);
    bool _1221 = _1179 > 0.0;
    float _1223 = _1215 + (-1.0);
    bool _1225 = _1179 >= 0.0;
    bool _1227 = isnan(_1179);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan(0.0);
    bool _1233 = _1229 || _1231;
    float _1235 = fma(_603, _603, _1219);
    float _1237 = _1219;
    if (_1127)
    {
        _1237 = _1105;
    }
    float _1239 = _1237;
    float _1241 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1243 = _1113 * 2.0;
    float _1245 = floor(_1187);
    float _1247 = _1195 + (-1.0);
    float _1249 = _1239;
    if (_1163)
    {
        float _1251 = -_1239;
        float _1253 = _1251 + 1.0;
        _1249 = _1253;
    }
    float _1255 = _1249;
    float _1257 = _1217 + (-1.0);
    float _1259 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1261 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1263 = floor(_1243);
    if (_1127)
    {
        _1137 = _1255;
    }
    float _1265 = _1137;
    float _1267 = _1207 * _135;
    int _1269 = _1233 ? 0 : 1;
    float _1271 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1213);
    bool _1273 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1275 = isnan(_1007);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = _1029 + (-0.5);
    int _1287 = ~_1269;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    float _1293 = rsqrt(_1235);
    int _1295 = _1291;
    if (!_1221)
    {
        int _1297 = ~_1269;
        int _1299 = _1297 + 1;
        _1295 = _1299;
    }
    int _1301 = _1295;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1305 = _1007 + _1303;
    bool _1307 = _1245 > 0.0;
    float _1309 = _1175 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1311 = _1245 >= 0.0;
    bool _1313 = isnan(_1245);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan(0.0);
    bool _1319 = _1315 || _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1323 = _1007 + _1321;
    float _1325 = fma(_1197, _1305, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1327 = exp2(_1267);
    bool _1329 = _1263 > 0.0;
    float _1331 = fma(_1209, _1323, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1333 = _1263 >= 0.0;
    bool _1335 = isnan(_1263);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan(0.0);
    bool _1341 = _1337 || _1339;
    float _1343 = _1173 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1345 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1347 = isnan(_1007);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = _1177 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1359 = _1293 * _601;
    bool _1361 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1363 = isnan(_1007);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = _1293 * _599;
    float _1375 = _1293 * _603;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1379 = 1.0 + _1377;
    bool _1381 = !_1099;
    int _1383 = _1381 ? 0 : 1;
    float _1385 = -_1371;
    float _1387 = _1385 + 1.0;
    float _1389 = -_1327;
    float _1391 = _1389 + 1.0;
    bool _1393 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1401 = _1397 || _1399;
    float _1403 = 1.0 / _1379;
    float _1405 = _1283 * _1387;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1409 = _1401 ? _1391 : 0.0;
    float _1411 = -_1283;
    float _1413 = _1411 + 1.0;
    bool _1415 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1417 = isnan(1.0);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1423 = _1419 || _1421;
    float _1425 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1407);
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1431 = _1355 * _1413;
    float _1433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1435 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1427);
    float _1437 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1429);
    float _1439 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1425);
    float _1441 = float(_1301);
    float _1443 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1435);
    float _1445 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1437);
    float _1447 = _1325 * _1431;
    if (_1423)
    {
        float _1449 = _1409 * _1403;
        _139 = _1449;
    }
    float _1451 = _139;
    int _1453 = abs(_1383);
    float _1455 = _1439 * (-0.15915493667125701904296875);
    float _1457 = in.m_59.x;
    float _1459 = in.m_59.y;
    float _1461 = in.m_59.z;
    float _1463 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1465 = -_1355;
    float _1467 = _1465 + 1.0;
    float _1469 = float(_1453);
    float _1471 = _1455 * 6.283185482025146484375;
    float _1473 = sin(_1471);
    float _1475 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1477 = _1463 * _605;
    int _1479 = _1341 ? 0 : 1;
    float _1481 = _1469 * _1441;
    float _1483 = fma(_1475, _1265, -0.5);
    int _1485 = _1319 ? 0 : 1;
    float _1487 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1447);
    float _1489 = trunc(_1477);
    int _1491 = int(_1489);
    int _1493 = ~_1479;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1501 = _1375 * _1499;
    int _1503 = _1497;
    if (!_1329)
    {
        int _1505 = ~_1479;
        int _1507 = _1505 + 1;
        _1503 = _1507;
    }
    int _1509 = _1503;
    float _1511 = _1481 * (-2.0);
    int _1513 = ~_1485;
    int _1515 = _1513 + 1;
    int _1517 = _1515 + 1;
    float _1519 = fma(_1331, _1405, _1487);
    int _1521 = _1517;
    if (!_1307)
    {
        int _1523 = ~_1485;
        int _1525 = _1523 + 1;
        _1521 = _1525;
    }
    int _1527 = _1521;
    float _1529 = _1455 * 6.283185482025146484375;
    float _1531 = cos(_1529);
    float _1533 = _1473 * _1193;
    float _1535 = fma(_1261, _1511, _1261);
    float _1537 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1539 = _1343 + _1537;
    float _1541 = fma(_1511, _1459, _1459);
    float _1543 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1545 = _1309 + _1543;
    bool _1547 = !_1095;
    int _1549 = _1547 ? 0 : 1;
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1553 = _1373 * _1551;
    int _1555 = _1491 << 4;
    int _1557 = _1555 + 1968;
    float _1559 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1541);
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1563 = -_1501;
    float _1565 = fma(_1359, _1561, _1563);
    int _1567 = abs(_1549);
    uint _1570 = uint(int(uint(_1557) >> uint(2)));
    uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
    int _1574 = int(_1570) & 3;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[int(_1572)][_1574];
    int _1578 = int(_1570) + 1;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    int _1582 = _1578 & 3;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[int(_1580)][_1582];
    float _1586 = fma(_1535, _1451, _1559);
    bool _1588 = !_1103;
    int _1590 = _1588 ? 0 : 1;
    float _1592 = _1565 * _1565;
    float _1594 = -_1533;
    float _1596 = fma(_1531, _1483, _1594);
    float _1598 = _1545 * _1545;
    float _1600 = _1531 * _1193;
    float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1604 = _1357 + _1602;
    int _1606 = _1557 + 8;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
    int _1612 = int(_1608) & 3;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[int(_1610)][_1612];
    float _1616 = fma(_1539, _1539, _1598);
    float _1618 = float(_1567);
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1622 = -_1553;
    float _1624 = fma(_1375, _1620, _1622);
    int _1626 = abs(_1590);
    float _1628 = fma(_1604, _1604, _1616);
    float _1630 = float(_1509);
    float _1632 = fma(_1624, _1624, _1592);
    float _1634 = float(_1626);
    float _1636 = rsqrt(_1628);
    float _1638 = float(_1527);
    float _1640 = _1618 * _1630;
    float _1642 = fma(_1473, _1483, _1600);
    float _1644 = _605 + (-0.5);
    float _1646 = _1113 + (-0.5);
    float _1648 = _1640 * (-2.0);
    float _1650 = _1634 * _1638;
    float _1652 = -_1271;
    float _1654 = fma(_1445, _1642, _1652);
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1658 = _1359 * _1656;
    float _1660 = fma(_1648, _1457, _1457);
    float _1662 = fma(_1241, _1648, _1241);
    float _1664 = _1650 * (-2.0);
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1668 = -_1658;
    float _1670 = fma(_1373, _1666, _1668);
    float _1672 = fma(_1644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1660);
    float _1674 = _1586 * 0.15915493667125701904296875;
    float _1676 = _1545 * _1636;
    float _1678 = fma(_1664, _1461, _1461);
    float _1680 = fma(_1662, _1451, _1672);
    float _1682 = _1539 * _1636;
    float _1684 = -_1676;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1545);
    float _1688 = fma(_1259, _1664, _1259);
    float _1690 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1678);
    float _1692 = -_1682;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1539);
    float _1696 = _1686 * _1686;
    float _1698 = _1604 * _1636;
    float _1700 = _1680 * 0.15915493667125701904296875;
    float _1702 = fma(_1688, _1451, _1690);
    float _1704 = fma(_1670, _1670, _1632);
    float _1706 = fma(_1694, _1694, _1696);
    float _1708 = -_1698;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1604);
    float _1712 = fma(_1443, _1596, _1191);
    float _1714 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1519);
    float _1716 = _1674 * 6.283185482025146484375;
    float _1718 = sin(_1716);
    float _1720 = _1702 * 0.15915493667125701904296875;
    float _1722 = fma(_1710, _1710, _1706);
    float _1724 = _1576 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1726 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1728 = _743 * _917;
    float _1730 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1732 = _979 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1734 = _1674 * 6.283185482025146484375;
    float _1736 = cos(_1734);
    float _1738 = _977 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1740 = _1614 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1744 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1746 = _1712 + 0.5;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1750 = _1700 * 6.283185482025146484375;
    float _1752 = sin(_1750);
    float _1754 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1758 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1762 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1744;
    out.m_61.y = _1742;
    out.m_61.z = _1754;
    out.m_61.w = _1748;
    float _1764 = _1654 + 0.5;
    float _1766 = _1700 * 6.283185482025146484375;
    float _1768 = cos(_1766);
    float _1770 = _1728 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    out.m_63.x = _1758;
    out.m_63.y = _1760;
    out.m_63.z = _1762;
    out.m_63.w = _1756;
    float _1772 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_65.x = _1746;
    out.m_65.y = _1764;
    float _1774 = rsqrt(_1704);
    float _1776 = _1752 * _1736;
    float _1778 = _1720 * 6.283185482025146484375;
    float _1780 = sin(_1778);
    float _1782 = _1768 * _1718;
    float _1784 = _1768 * _1736;
    float _1786 = sqrt(_1722);
    float _1788 = _1624 * _1774;
    float _1790 = _1565 * _1774;
    float _1792 = _1752 * _1718;
    float _1794 = _1670 * _1774;
    float _1796 = _1375 * _1788;
    float _1798 = _1720 * 6.283185482025146484375;
    float _1800 = cos(_1798);
    float _1802 = -_1782;
    float _1804 = fma(_1780, _1776, _1802);
    float _1806 = -_1776;
    float _1808 = fma(_1780, _1782, _1806);
    float _1810 = _1359 * _1790;
    float _1812 = fma(_1780, _1784, _1792);
    float _1814 = fma(_1780, _1792, _1784);
    float _1816 = _1373 * _1794;
    float _1818 = -_1810;
    float _1820 = fma(_1373, _1788, _1818);
    float _1822 = _1636 * _1786;
    float _1824 = _1812 * _1359;
    float _1826 = floor(_1035);
    float _1828 = _1770 * _1822;
    float _1830 = _1772 * _1822;
    float _1832 = _1768 * _1800;
    float _1834 = _1718 * _1800;
    float _1836 = _1736 * _1800;
    float _1838 = -_1796;
    float _1840 = fma(_1359, _1794, _1838);
    float _1842 = _1832 * _1359;
    float _1844 = _1832 * _1373;
    float _1846 = _1808 * _1359;
    float _1848 = _1808 * _1373;
    float _1850 = _1752 * _1800;
    float _1852 = _1808 * _1375;
    float _1854 = _1832 * _1375;
    float _1856 = -_1780;
    float _1858 = fma(_1856, _1788, _1842);
    float _1860 = -_1780;
    float _1862 = fma(_1860, _1790, _1844);
    float _1864 = _1812 * _1373;
    float _1866 = -_1816;
    float _1868 = fma(_1375, _1790, _1866);
    float _1870 = _1812 * _1375;
    float _1872 = fma(_1836, _1788, _1824);
    float _1874 = fma(_1834, _1788, _1846);
    float _1876 = fma(_1834, _1790, _1848);
    float _1878 = fma(_1834, _1794, _1852);
    float _1880 = fma(_1836, _1790, _1864);
    float _1882 = fma(_1836, _1794, _1870);
    float _1884 = fma(_1850, _1868, _1858);
    float _1886 = fma(_1804, _1868, _1872);
    float _1888 = fma(_1814, _1868, _1874);
    float _1890 = fma(_1814, _1840, _1876);
    float _1892 = fma(_1814, _1820, _1878);
    float _1894 = -_1826;
    float _1896 = _1035 + _1894;
    float _1898 = -_1067;
    float _1900 = _1898 + _1087;
    float _1902 = fma(_1804, _1840, _1880);
    float _1904 = fma(_1804, _1820, _1882);
    float _1906 = -_1065;
    float _1908 = _1906 + _1085;
    float _1910 = fma(_1896, _1900, _1067);
    float _1912 = -_1780;
    float _1914 = fma(_1912, _1794, _1854);
    float _1916 = -_1069;
    float _1918 = _1916 + _1089;
    float _1920 = fma(_1896, _1908, _1065);
    float _1922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1910);
    float _1924 = fma(_1850, _1820, _1914);
    float _1926 = _915 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1920);
    float _1930 = fma(_1896, _1918, _1069);
    float _1932 = _1828 * _1922;
    float _1934 = _1926 * _1822;
    float _1936 = _1830 * _1928;
    float _1938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1930);
    float _1940 = _1932 * _1884;
    float _1942 = _1932 * _1924;
    float _1944 = fma(_1850, _1840, _1862);
    float _1946 = _1934 * _1938;
    float _1948 = fma(_1936, _1886, _1940);
    float _1950 = fma(_1936, _1904, _1942);
    float _1952 = _1932 * _1944;
    bool _1954 = _1910 != 0.0;
    bool _1956 = isnan(_1910);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(0.0);
    bool _1962 = _1958 || _1960;
    float _1964 = fma(_1946, _1888, _1948);
    float _1966 = fma(_1946, _1892, _1950);
    float _1968 = fma(_1936, _1902, _1952);
    bool _1970 = _1920 == 0.0;
    bool _1972 = !_1962;
    bool _1974 = _1970 && _1972;
    float _1976 = _1343 + _1964;
    float _1978 = _1357 + _1966;
    float _1980 = fma(_1946, _1890, _1968);
    float _1982 = in.m_67.x;
    float _1984 = in.m_67.y;
    float _1986 = in.m_67.z;
    float _1988 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1990 = _1976 + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1994 = _1978 + _1992;
    float _1996 = _1309 + _1980;
    bool _1998 = _1930 == 0.0;
    bool _2000 = _1998 && _1974;
    float _2002 = _1990 * _1990;
    float _2004 = _1994 * _1994;
    float _2006 = _2002 + _2004;
    float _2008 = sqrt(_2006);
    bool _2010 = _2008 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2012 = _1946;
    float _2014 = _1936;
    float _2016 = _1980;
    float _2018 = _2002;
    float _2020 = _2004;
    float _2022 = _1886;
    if (!_2010)
    {
        _2012 = _1976;
    }
    float _2024 = _2012;
    float _2026 = _2024;
    if (!_2010)
    {
        _2014 = _1978;
    }
    float _2028 = _2014;
    float _2030 = _2028;
    if (!_2010)
    {
        _2016 = _1996;
    }
    float _2032 = _2016;
    bool _2034 = !_2010;
    float _2036 = _2032;
    float _2038 = _1984;
    float _2040 = _1982;
    float _2042 = _1986;
    if (!_2034)
    {
        float _2044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2048 = _2008 + _2046;
        float _2050 = rsqrt(_2006);
        float _2052 = _2048 * _2044;
        float _2054 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2056 = _2052 * 0.15915493667125701904296875;
        float _2058 = _2056 * 6.283185482025146484375;
        float _2060 = sin(_2058);
        float _2062 = _2056 * 6.283185482025146484375;
        float _2064 = cos(_2062);
        float _2066 = fma(_2060, _2054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2068 = _2050 * _2066;
        float _2070 = _2064 + (-1.0);
        float _2072 = fma(_1990, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2074 = fma(_1994, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2076 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2080 = _2072 + _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2084 = _2074 + _2082;
        float _2086 = fma(_1996, _2064, _2076);
        float _2088 = _2080 * _2080;
        float _2090 = _2084 * _2084;
        _2036 = _2086;
        _2018 = _2088;
        _2020 = _2090;
        _2030 = _2074;
        _2026 = _2072;
    }
    float _2092 = _2036;
    float _2094 = _2018;
    float _2096 = _2020;
    float _2098 = _2030;
    float _2100 = _2026;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2104 = _2092 + _2102;
    float _2106 = in.m_69.x;
    float _2108 = _2092;
    if (!_2000)
    {
        float _2110 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1984);
        _2038 = _2110;
    }
    float _2112 = _2038;
    if (!_2000)
    {
        float _2114 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1982);
        _2040 = _2114;
    }
    float _2116 = _2040;
    float _2118 = fma(_2104, _2104, _2094);
    float _2120 = in.m_69.y;
    float _2122 = _1884 * _2112;
    float _2124 = _1944 * _2112;
    float _2126 = _2118 + _2096;
    float _2128 = in.m_69.z;
    float _2130 = _1924 * _2112;
    float _2132 = fma(_1886, _2116, _2122);
    float _2134 = _2132;
    if (!_2000)
    {
        float _2136 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1986);
        _2042 = _2136;
    }
    float _2138 = _2042;
    float _2140 = in.m_69.w;
    float _2142 = sqrt(_2126);
    float _2144 = fma(_1902, _2116, _2124);
    float _2146 = fma(_1904, _2116, _2130);
    float _2148 = fma(_1888, _2138, _2132);
    float _2150 = fma(_1890, _2138, _2144);
    float _2152 = fma(_1892, _2138, _2146);
    out.m_71.x = _2106;
    out.m_71.y = _2120;
    bool _2154 = _2142 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2156 = isnan(_2142);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2162 = _2158 || _2160;
    out.m_71.z = _2128;
    out.m_71.w = _2140;
    out.m_73.x = _2148;
    out.m_73.y = _2150;
    out.m_73.z = _2152;
    float _2164 = _2120;
    if (!_2162)
    {
        _2022 = 1.0;
    }
    float _2166 = _2022;
    bool _2168 = !_2162;
    float _2170 = _2166;
    if (!_2168)
    {
        bool _2172 = _2142 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2174 = isnan(_2142);
        bool _2176 = _2172 || _2174;
        bool _2178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2180 = _2176 || _2178;
        if (!_2180)
        {
            float _2182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2184 = _2142 + _2182;
            float _2186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2186;
            float _2190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2192 = _2190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2194 = 1.0 / _2188;
            float _2196 = _2184 * _2194;
            float _2198 = fma(_2196, _2192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2170 = _2198;
            _2200 = true;
        }
        else
        {
            bool _2202 = _2142 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2204 = isnan(_2142);
            bool _2206 = _2202 || _2204;
            bool _2208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2210 = _2206 || _2208;
            if (!_2210)
            {
                float _2212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2214 = _2142 + _2212;
                float _2216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2218 = _2216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2222 = _2220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2224 = 1.0 / _2218;
                float _2226 = _2214 * _2224;
                float _2228 = fma(_2226, _2222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2170 = _2228;
                _2200 = true;
            }
            else
            {
                _2170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2200 = false;
    float _2230 = _2170;
    float _2232 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2234 = _2098 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2238 = _2100 + _2236;
    bool _2240 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2242 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan(0.5);
    bool _2248 = _2244 || _2246;
    float _2250 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2252 = _2092 + _2250;
    float _2254 = fma(_2234, _2230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2256 = fma(_2238, _2230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2258 = fma(_2252, _2230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2260 = -_1698;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2254);
    float _2264 = -_1682;
    float _2266 = fma(_2264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1343);
    float _2268 = -_1682;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2256);
    float _2272 = -_1676;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2258);
    float _2276 = -_1676;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _2280 = -_1698;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _2284 = _2274;
    float _2286 = _2270;
    float _2288 = _2262;
    float _2290 = _2256;
    if (!_2248)
    {
        float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2294 = _2278 + _2292;
        float _2296 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2298 = _2266 + _2296;
        float _2300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2302 = -_1357;
        float _2304 = _2302 + _2254;
        float _2306 = _2294 * _2294;
        float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2310 = _2282 + _2308;
        float _2312 = -_1309;
        float _2314 = _2312 + _2258;
        float _2316 = fma(_2298, _2298, _2306);
        float _2318 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2320 = fma(_2310, _2310, _2316);
        float _2322 = sqrt(_2320);
        float _2324 = 1.0 / _1822;
        float _2326 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2328 = precise::min(_2322, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2330 = _2328 * _2300;
        float _2332 = -_1343;
        float _2334 = _2332 + _2256;
        float _2336 = _2330 * _2324;
        float _2338 = _2326 * _2336;
        float _2340 = _2304 * _2336;
        float _2342 = fma(_2334, _2338, _2266);
        float _2344 = fma(_2314, _2338, _2278);
        float _2346 = fma(_2326, _2340, _2282);
        _2284 = _2344;
        _2286 = _2342;
        _2288 = _2346;
        _2134 = _2338;
    }
    float _2348 = _2284;
    float _2350 = _2286;
    float _2352 = _2288;
    float _2354 = _2134;
    float _2356 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2358 = _2348 + _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2362 = _2350 + _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2366 = _2352 + _2364;
    float _2368 = _2358 * _2358;
    float _2370 = fma(_2362, _2362, _2368);
    float _2372 = fma(_2366, _2366, _2370);
    float _2374 = rsqrt(_2372);
    float _2376 = sqrt(_2372);
    float _2378 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2380 = _2362 * _2378;
    float _2382 = _2366 * _2378;
    float _2384 = _2380 * _2380;
    float _2386 = _2382 * _2382;
    float _2388 = _2384 + _2386;
    float _2390 = sqrt(_2388);
    bool _2392 = _2390 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2396 = _2390 + _2394;
    float _2398 = _2370;
    float _2400 = _2396;
    float _2402 = _2378;
    float _2404 = _2380;
    if (_2392)
    {
        float _2406 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2398 = _2406;
    }
    float _2408 = _2398;
    if (_2392)
    {
        float _2410 = rsqrt(_2388);
        _2290 = _2410;
    }
    float _2412 = _2290;
    float _2414 = _2412;
    if (_2392)
    {
        float _2416 = _2396 * _2408;
        _2400 = _2416;
    }
    float _2418 = _2400;
    if (_2392)
    {
        float _2420 = _2418 * 0.15915493667125701904296875;
        _2108 = _2420;
    }
    float _2422 = _2108;
    float _2424 = _2408;
    float _2426 = _2422;
    if (_2392)
    {
        float _2428 = _2422 * 6.283185482025146484375;
        float _2430 = sin(_2428);
        _2424 = _2430;
    }
    float _2432 = _2424;
    float _2434 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2436 = precise::max(0.0, _2434);
    float _2438 = _2354;
    float _2440 = _2436;
    if (_2392)
    {
        float _2442 = _2422 * 6.283185482025146484375;
        float _2444 = cos(_2442);
        _2438 = _2444;
    }
    float _2446 = _2438;
    float _2448 = -_2378;
    float _2450 = -_2436;
    float _2452 = fma(_2358, _2448, _2450);
    if (_2392)
    {
        float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2440 = _2454;
    }
    float _2456 = _2440;
    float _2458 = _2456;
    if (!_2392)
    {
        _2426 = _2384;
    }
    float _2460 = _2426;
    float _2462 = _2432;
    float _2464 = _2460;
    if (_2392)
    {
        float _2466 = fma(_2432, _2456, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2462 = _2466;
    }
    float _2468 = _2462;
    float _2470 = _2468;
    if (_2392)
    {
        float _2472 = _2446 + (-1.0);
        _2458 = _2472;
    }
    float _2474 = _2458;
    float _2476 = _2474;
    if (_2392)
    {
        float _2478 = _2412 * _2468;
        _2164 = _2478;
    }
    float _2480 = _2164;
    if (!_2392)
    {
        _2414 = _2452;
    }
    float _2482 = _2414;
    float _2484 = _2482;
    if (_2392)
    {
        float _2486 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2402 = _2486;
    }
    float _2488 = _2402;
    if (_2392)
    {
        float _2490 = _2380 * _2480;
        _2404 = _2490;
    }
    float _2492 = _2404;
    if (!_2392)
    {
        _2470 = _2382;
    }
    float _2494 = _2470;
    float _2496 = _2494;
    if (_2392)
    {
        float _2498 = _2382 * _2480;
        _2496 = _2498;
    }
    float _2500 = _2496;
    if (_2392)
    {
        float _2502 = fma(_2452, _2446, _2488);
        _2484 = _2502;
    }
    float _2504 = _2484;
    if (_2392)
    {
        float _2506 = _2492 * _2492;
        _2464 = _2506;
    }
    float _2508 = _2464;
    if (!_2392)
    {
        _2476 = _2386;
    }
    float _2510 = _2476;
    float _2512 = _2510;
    if (_2392)
    {
        float _2514 = _2500 * _2500;
        _2512 = _2514;
    }
    float _2516 = _2512;
    float _2518 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2520 = fma(_2504, _2504, _2508);
    float _2522 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2524 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2518);
    float _2526 = _2520 + _2516;
    float _2528 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2532 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2530);
    float _2534 = precise::clamp(_2532, 0.0, 1.0);
    float _2536 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2524);
    float _2538 = rsqrt(_2526);
    float _2540 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2528);
    float _2542 = -_2534;
    float _2544 = _2542 + 1.0;
    float _2546 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2548 = _2536 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2550 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2540);
    float _2552 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2522);
    float _2554 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2546);
    float _2556 = abs(_2544);
    float _2558 = log2(_2556);
    float _2560 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2562 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2552);
    float _2564 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2554);
    float _2566 = _2550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2568 = _2548 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2570 = _2562 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2572 = _2564 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2574 = _2538 * _2492;
    float _2576 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2578 = _2538 * _2504;
    float _2580 = _2538 * _2500;
    float _2582 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2584 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2576);
    float _2586 = -_2568;
    float _2588 = fma(_2586, _2560, 1.0);
    float _2590 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2592 = -_2582;
    float _2594 = fma(_2578, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2592);
    float _2596 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2584);
    float _2598 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2600 = log2(_2588);
    float _2602 = -_2580;
    float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2594);
    float _2606 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2596);
    float _2608 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2610 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2598);
    float _2612 = fma(_2604, -0.5, 0.5);
    float _2614 = fma(_2604, 0.5, 0.5);
    float _2616 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2608);
    float _2618 = exp2(_2590);
    float _2620 = _2578 + 1.0;
    float _2622 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2610);
    float _2624 = fma(_2614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2626 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2616);
    float _2628 = 1.0 / _2606;
    float _2630 = _2600 * 0.693147182464599609375;
    float _2632 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2634 = sqrt(_2612);
    float _2636 = -_2578;
    float _2638 = fma(_2618, _2620, _2636);
    float _2640 = fma(_2614, _2624, -0.212114393711090087890625);
    float _2642 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2622);
    float _2644 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2626);
    float _2646 = fma(_2614, _2640, 1.570728778839111328125);
    float _2648 = _2642 * _2628;
    float _2650 = _2644 * _2628;
    float _2652 = fma(_2648, 0.5, 0.5);
    float _2654 = fma(_2650, -0.5, 0.5);
    float _2656 = fma(_2638, 0.5, 0.5);
    float _2658 = _2634 * 0.636619746685028076171875;
    float3 _6889 = float3(_2652, _2654, _2632);
    float _2660 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6889, float3(0.0), isnan(_6889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6889, float3(0.0), isnan(_6889)), level(0.0)).x;
    float3 _6900 = float3(_2652, _2654, _2632);
    float4 _2663 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6900, float3(0.0), isnan(_6900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6900, float3(0.0), isnan(_6900)), level(0.0)).xyzw;
    float _2665 = _2663.x;
    float _2667 = _2663.y;
    float _2669 = _2663.z;
    float _2671 = _2663.w;
    float _2673 = -_2646;
    float _2675 = fma(_2658, _2673, 1.0);
    float2 _6922 = float2(_2675, _2656);
    float3 _2677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6922, float2(0.0), isnan(_6922)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6922, float2(0.0), isnan(_6922)), level(0.0)).xyz;
    float _2679 = _2677.x;
    float _2681 = _2677.y;
    float _2683 = _2677.z;
    float _2685 = _2278 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_75.x = _2362;
    out.m_75.y = _2358;
    out.m_75.z = _2366;
    float _2687 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2685);
    float _2689 = _2278 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2691 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2687);
    float _2693 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2689);
    float _2695 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2697 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2693);
    float _2699 = 1.0 / _2695;
    bool _2701 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2703 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(0.5);
    bool _2709 = _2705 || _2707;
    float _2711 = _2697 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2713 = _2711 + _2695;
    float _2715 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2717 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2719 = _2654;
    float _2721 = _2658;
    float _2723 = _2566;
    if (!_2709)
    {
        _2717 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2725 = _2717;
    float _2727 = exp2(_2715);
    float _2729 = _2713 * _2699;
    float _2731 = _2729 * 0.5;
    float _2733 = _2731;
    if (!_2709)
    {
        _2719 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2735 = _2719;
    float _2737 = _2566 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2739 = _2737;
    if (!_2709)
    {
        float _2741 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2743 = fma(_2731, _2725, _2741);
        _2733 = _2743;
    }
    float _2745 = _2733;
    if (!_2709)
    {
        float _2747 = -_2735;
        float _2749 = _2747 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2721 = _2749;
    }
    float _2751 = _2721;
    float _2753 = fma(_2572, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2737);
    if (_2709)
    {
        _2739 = 1.0;
    }
    float _2755 = _2739;
    float _2757 = _2745;
    float _2759 = _2755;
    if (!_2709)
    {
        float _2761 = 1.0 / _2745;
        _2757 = _2761;
    }
    float _2763 = _2757;
    float _2765 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2753);
    float _2767 = -_2727;
    float _2769 = _2767 + 1.0;
    float _2771 = fma(_2570, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2765);
    float _2773 = _2751;
    if (!_2709)
    {
        float _2775 = 1.0 / _2751;
        _2773 = _2775;
    }
    float _2777 = _2773;
    float _2779 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2642;
    out.gl_Position.y = _2644;
    out.gl_Position.z = _2771;
    out.gl_Position.w = _2606;
    if (!_2709)
    {
        float _2781 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2783 = -_2735;
        float _2785 = fma(_2763, _2781, _2783);
        _2723 = _2785;
    }
    float _2787 = _2723;
    if (!_2709)
    {
        float _2789 = _2787 * _2777;
        float _2791 = precise::clamp(_2789, 0.0, 1.0);
        _2759 = _2791;
    }
    float _2793 = _2759;
    float _2795 = _2771 + _2606;
    float _2797 = _2793 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2799 = _2793 > 0.0;
    bool _2801 = isnan(_2793);
    bool _2803 = _2799 || _2801;
    bool _2805 = isnan(0.0);
    bool _2807 = _2803 || _2805;
    float _2809 = _2795 * 0.5;
    float _2811 = _2797 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.z = _2809;
    out.m_77.w = _2606;
    out.m_49.x = _2811;
    float _2813 = _2779 * _2660;
    float _2815 = -_2779;
    float _2817 = _2815 + 1.0;
    float _2819 = _2671 * _2813;
    float _2821 = _2683 * _2813;
    float _2823 = fma(_2679, _2819, _2665);
    float _2825 = fma(_2681, _2819, _2667);
    float _2827 = _2671 * _2817;
    float _2829 = fma(_2671, _2821, _2669);
    out.m_79.x = _2823;
    out.m_79.y = _2825;
    out.m_79.z = _2829;
    out.m_79.w = _2827;
    if (_2807)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2831;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

