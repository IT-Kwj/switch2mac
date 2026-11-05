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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_62 [[user(locn6)]];
    float4 m_66 [[user(locn7)]];
    float4 m_76 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

static inline __attribute__((always_inline))
void _89(thread const int& _9243, thread const int& _9244, thread const int& _9245, thread const int& _9246, thread int& _9247, thread int& _9248, thread int& _9249, thread int& _9250, thread int& _9251, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _9254 = _9243;
    int _9256 = _9244;
    float _9258 = as_type<float>(_9245) + 0.0;
    bool _9260 = _9258 != 0.0;
    bool _9262 = isnan(_9258);
    bool _9264 = _9260 || _9262;
    bool _9266 = isnan(0.0);
    bool _9268 = _9264 || _9266;
    int _9270 = _9268 ? (-1) : 0;
    if (!_9268)
    {
        float _9272 = as_type<float>(_9245) * 1.0;
        _9254 = as_type<int>(_9272);
    }
    int _9274 = _9254;
    bool _9276 = !_9268;
    int _9278 = _9274;
    int _9280 = _9274;
    if (!_9276)
    {
        float _9282 = as_type<float>(_9245) + 0.0;
        bool _9284 = _9282 >= 0.0;
        bool _9286 = isnan(_9282);
        bool _9288 = _9284 || _9286;
        bool _9290 = isnan(0.0);
        bool _9292 = _9288 || _9290;
        _9270 = _9292 ? (-1) : 0;
        if (!_9292)
        {
            _9278 = 2147483647;
        }
        int _9294 = _9278;
        bool _9296 = !_9292;
        int _9298 = _9294;
        _9280 = _9294;
        if (!_9296)
        {
            float _9300 = abs(as_type<float>(_9245));
            float _9302 = _9300 + 0.0;
            bool _9304 = _9302 > as_type<float>(0x7f800000u /* inf */);
            bool _9306 = isnan(_9302);
            bool _9308 = _9304 || _9306;
            bool _9310 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _9312 = _9308 || _9310;
            _9270 = _9312 ? (-1) : 0;
            if (_9312)
            {
                float _9314 = as_type<float>(_9245) + 1.0;
                _9298 = as_type<int>(_9314);
            }
            int _9316 = _9298;
            int _9318 = _9316;
            _9280 = _9316;
            if (!_9312)
            {
                float _9320 = abs(as_type<float>(_9245));
                float _9322 = _9320 + (-0.0);
                float _9324 = 0.0 + _9322;
                bool _9326 = _9324 != as_type<float>(0x7f800000u /* inf */);
                bool _9328 = isnan(_9324);
                bool _9330 = _9326 || _9328;
                bool _9332 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _9334 = _9330 || _9332;
                _9270 = _9334 ? (-1) : 0;
                if (!_9334)
                {
                    _9318 = _9245;
                }
                int _9336 = _9318;
                bool _9338 = !_9334;
                _9280 = _9336;
                if (!_9338)
                {
                    float _9340 = as_type<float>(_9245) * 18446744073709551616.0;
                    float _9342 = rsqrt(_9340);
                    float _9344 = _9340 * _9342;
                    float _9346 = _9342 * 0.5;
                    float _9348 = -_9344;
                    float _9350 = 0.0 + _9348;
                    float _9352 = fma(_9346, _9350, 0.5);
                    float _9354 = fma(_9344, _9352, _9344);
                    float _9356 = -_9354;
                    float _9358 = 0.0 + _9356;
                    float _9360 = fma(_9354, _9358, _9340);
                    float _9362 = fma(_9346, _9360, _9354);
                    float _9364 = _9362 * 2.3283064365386962890625e-10;
                    _9280 = as_type<int>(_9364);
                    _9256 = as_type<int>(_9354);
                }
            }
        }
    }
    int _9366 = _9280;
    int _9368 = _9256;
    int _9370 = _9270;
    _9247 = _9246;
    _9248 = 0;
    _9249 = _9366;
    _9250 = _9368;
    _9251 = _9370;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2612 = false;
    bool _947 = false;
    bool _831 = false;
    bool _717 = false;
    bool _607 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3776 = as_type<float>(_113);
        out.gl_Position.z = _3776;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_127)
    {
        float _133 = float(_97);
        _107 = _133;
    }
    float _135 = _107;
    bool _137 = _131 >= _135;
    bool _139 = !_127;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _115 = as_type<int>(_147);
    }
    int _149 = _115;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3845 = as_type<float>(_149);
        out.gl_Position.z = _3845;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_51.x;
    float _161 = in.m_51.y;
    float _163 = in.m_51.z;
    float _165 = in.m_53.x;
    float _167 = in.m_53.y;
    float _169 = in.m_53.z;
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_58.w;
    float _175 = _151 * _151;
    float _177 = _153 * _153;
    float _179 = fma(_159, _159, _175);
    float _181 = fma(_161, _161, _177);
    float _183 = fma(_165, _165, _179);
    float _185 = _155 * _155;
    float _187 = fma(_167, _167, _181);
    float _189 = sqrt(_183);
    float _191 = fma(_163, _163, _185);
    float _193 = fma(_169, _169, _191);
    float _195 = sqrt(_187);
    float _197 = sqrt(_193);
    bool _199 = _189 > 0.0;
    float _201 = in.m_47.x;
    float _203 = in.m_47.y;
    float _205 = in.m_47.z;
    bool _207 = _195 > 0.0;
    float _209 = 0.0;
    float _211 = _187;
    float _213 = _183;
    float _215 = _157;
    if (_199)
    {
        float _217 = rsqrt(_183);
        _209 = _217;
    }
    float _219 = _209;
    float _221 = 0.0;
    float _223 = 0.0;
    if (!_199)
    {
        _221 = 0.0;
        _223 = 0.0;
    }
    float _225 = _221;
    float _227 = _223;
    bool _229 = _197 > 0.0;
    float _231 = 0.0;
    float _233 = _227;
    float _235 = _225;
    if (!_199)
    {
        _231 = 0.0;
    }
    float _237 = _231;
    int _239 = as_type<int>(_171) & 1;
    bool _241 = _239 != 0;
    int _243 = as_type<int>(_171) & 2;
    bool _245 = _243 != 0;
    float _247 = in.m_42.x;
    float _249 = in.m_42.y;
    float _251 = in.m_42.z;
    float _253 = 0.0;
    float _255 = _237;
    if (_207)
    {
        float _257 = rsqrt(_187);
        _253 = _257;
    }
    float _259 = _253;
    bool _261 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _265 = _261 || _263;
    bool _267 = isnan(1.0);
    bool _269 = _265 || _267;
    float _271 = 0.0;
    if (!_207)
    {
        _271 = 0.0;
    }
    float _273 = _271;
    float _275 = 0.0;
    float _277 = _273;
    if (!_207)
    {
        _275 = 0.0;
    }
    float _279 = _275;
    float _281 = 0.0;
    float _283 = _279;
    if (!_207)
    {
        _281 = 0.0;
    }
    float _285 = _281;
    float _287 = _193;
    float _289 = _285;
    if (_229)
    {
        float _291 = rsqrt(_193);
        _287 = _291;
    }
    float _293 = _287;
    float _295 = _219;
    if (_199)
    {
        float _297 = _219 * _159;
        _233 = _297;
    }
    float _299 = _233;
    if (_199)
    {
        float _301 = _219 * _151;
        _235 = _301;
    }
    float _303 = _235;
    if (_199)
    {
        float _305 = _219 * _165;
        _255 = _305;
    }
    float _307 = _255;
    if (!_229)
    {
        _211 = 0.0;
    }
    float _309 = _211;
    float _311 = 0.0;
    float _313 = _309;
    if (!_269)
    {
        float _315 = _157 * _157;
        float _317 = _315 * 0.5;
        _311 = _317;
    }
    float _319 = _311;
    bool _321 = !_241;
    float _323 = _321 ? (-0.5) : 0.5;
    float _325 = _259;
    float _327 = _319;
    if (_207)
    {
        float _329 = _259 * _161;
        _277 = _329;
    }
    float _331 = _277;
    if (_207)
    {
        float _333 = _259 * _153;
        _283 = _333;
    }
    float _335 = _283;
    if (_207)
    {
        float _337 = _259 * _167;
        _289 = _337;
    }
    float _339 = _289;
    bool _341 = !_245;
    float _343 = _341 ? (-0.5) : 0.5;
    if (!_229)
    {
        _325 = 0.0;
        _295 = 0.0;
    }
    float _345 = _325;
    float _347 = _295;
    float _349 = _347;
    float _351 = _345;
    if (!_269)
    {
        float _353 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _353;
    }
    float _355 = _327;
    float _357 = _355;
    float _359 = _293;
    if (_229)
    {
        float _361 = _293 * _163;
        _349 = _361;
    }
    float _363 = _349;
    if (_229)
    {
        float _365 = _293 * _155;
        _313 = _365;
    }
    float _367 = _313;
    if (_229)
    {
        float _369 = _293 * _169;
        _351 = _369;
    }
    float _371 = _351;
    bool _373 = !_269;
    if (!_373)
    {
        float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = log2(_375);
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = _157 * _377;
        float _387 = 1.0 / _381;
        float _389 = _383 * 0.693147182464599609375;
        float _391 = exp2(_385);
        float _393 = 1.0 / _389;
        float _395 = _391 + (-1.0);
        float _397 = -_395;
        float _399 = fma(_397, _393, _157);
        float _401 = _399 * _387;
        float _403 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _403;
        _359 = _391;
        _213 = _393;
    }
    float _405 = _357;
    float _407 = _359;
    float _409 = _213;
    bool _411 = !_269;
    float _413 = _409;
    float _415 = _407;
    if (!_411)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _157 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _413 = _423;
        _215 = _435;
    }
    float _437 = _413;
    float _439 = _215;
    float _441 = _437;
    if (!_269)
    {
        float _443 = _131 * _131;
        float _445 = _443 * 0.5;
        _415 = _445;
    }
    float _447 = _415;
    float _449 = _447;
    if (!_269)
    {
        _441 = _131;
    }
    float _451 = _441;
    float _453 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _455 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _457 = _451;
    if (!_269)
    {
        float _459 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _449 = _459;
    }
    float _461 = _449;
    bool _463 = !_269;
    float _465 = _461;
    if (!_463)
    {
        float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _469 = log2(_467);
        float _471 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _473 = _471 + 1.0;
        float _475 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _477 = _131 * _469;
        float _479 = 1.0 / _473;
        float _481 = _475 * 0.693147182464599609375;
        float _483 = exp2(_477);
        float _485 = 1.0 / _481;
        float _487 = _483 + (-1.0);
        float _489 = -_487;
        float _491 = fma(_489, _485, _131);
        float _493 = _491 * _479;
        float _495 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _465 = _495;
    }
    float _497 = _465;
    bool _499 = !_269;
    if (!_499)
    {
        float _501 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _503 = log2(_501);
        float _505 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _507 = _505 + 1.0;
        float _509 = 1.0 / _507;
        float _511 = _131 * _503;
        float _513 = exp2(_511);
        float _515 = -_513;
        float _517 = _515 + 1.0;
        float _519 = _517 * _509;
        _457 = _519;
    }
    float _521 = _457;
    float _523 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _525 = fma(_439, _201, _453);
    float _527 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _529 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _531 = fma(_439, _205, _523);
    float _533 = fma(_439, _203, _455);
    float _535 = fma(_521, _203, _527);
    bool _537 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _539 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _541 = fma(_521, _201, _529);
    float _543 = -_535;
    float _545 = _533 + _543;
    float _547 = fma(_533, _173, _249);
    float _549 = fma(_521, _205, _539);
    float _551 = fma(_525, _173, _247);
    float _553 = -_541;
    float _555 = _525 + _553;
    float _557 = _545 * _161;
    float _559 = _545 * _153;
    float _561 = _545 * _167;
    float _563 = -_549;
    float _565 = _531 + _563;
    float _567 = fma(_555, _159, _557);
    float _569 = fma(_555, _151, _559);
    float _571 = fma(_555, _165, _561);
    float _573 = fma(_531, _173, _251);
    float _575 = fma(_565, _163, _567);
    float _577 = fma(_565, _155, _569);
    float _579 = fma(_565, _169, _571);
    bool _581 = !_537;
    float _583 = _577;
    float _585 = _575;
    float _587 = _579;
    float _605;
    if (!_581)
    {
        float _589 = in.m_60.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_97);
        float _611 = 1.0 / _609;
        float _613 = _131 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _619 = _615 + _617;
    float _621 = in.m_58.x;
    float _623 = in.m_58.y;
    bool _625 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _627 = isnan(_615);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _637;
    bool _641 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _643 = isnan(_615);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_635;
    float _655 = _653 + 1.0;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _657;
    float _661 = 1.0 / _639;
    bool _663 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _665 = _651 * _655;
    float _667 = -_651;
    float _669 = _667 + 1.0;
    float _671 = _619 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _673;
    float _677 = fma(_659, _671, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _679 = fma(_675, _671, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _681 = _677 * _665;
    float _683 = _679 * _665;
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[143].x, _681);
    float _687 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[143].y, _683);
    float _689 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[144].x, _685);
    float _691 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[144].y, _687);
    float _693 = _689 * _621;
    float _695 = _691 * _623;
    bool _697 = !_663;
    float _715;
    if (!_697)
    {
        float _699 = in.m_60.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        float _719 = float(_97);
        float _721 = 1.0 / _719;
        float _723 = _131 * _721;
        _715 = _723;
    }
    _717 = false;
    float _725 = _715;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _729 = _725 + _727;
    bool _731 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _733 = isnan(_725);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _743;
    bool _747 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _749 = isnan(_725);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -_741;
    float _761 = _759 + 1.0;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _763;
    float _767 = 1.0 / _745;
    bool _769 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _771 = _757 * _761;
    float _773 = -_757;
    float _775 = _773 + 1.0;
    float _777 = _729 * _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _779;
    float _783 = fma(_765, _777, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _785;
    float _789 = fma(_781, _777, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _791 = _783 * _771;
    float _793 = fma(_787, _777, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _795 = _789 * _771;
    float _797 = _793 * _771;
    float _799 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].x, _791);
    float _801 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].y, _797);
    float _803 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].z, _795);
    float _805 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[108].x, _799);
    float _807 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[108].y, _801);
    float _809 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[108].z, _803);
    bool _811 = !_769;
    float _829;
    if (!_811)
    {
        float _813 = in.m_60.x;
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _817 = _813 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _821 = _819 * _815;
        float _823 = floor(_821);
        float _825 = -_823;
        float _827 = _821 + _825;
        _829 = _827;
        _831 = true;
    }
    else
    {
        float _833 = float(_97);
        float _835 = 1.0 / _833;
        float _837 = _131 * _835;
        _829 = _837;
    }
    _831 = false;
    float _839 = _829;
    bool _841 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _843 = isnan(_839);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _857 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _859 = isnan(_839);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _875 = _839 + _873;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    bool _881 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _883 = 1.0 / _855;
    float _885 = _867 * _879;
    float _887 = -_867;
    float _889 = _887 + 1.0;
    float _891 = _871 * _883;
    float _893 = _807 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _895 = fma(_891, _875, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _897 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _899 = _895 * _885;
    float _901 = _809 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[115].x, _899);
    float _905 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[116].x, _903);
    float _913 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _915 = !_881;
    float _917 = _905;
    float _941;
    float _943;
    float _945;
    if (!_915)
    {
        float _919 = in.m_60.x;
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _923 = float(_97);
        float _925 = 1.0 / _923;
        float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _929 = _131 * _925;
        float _931 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _933 = _931 * _921;
        float _935 = floor(_933);
        float _937 = -_935;
        float _939 = _933 + _937;
        _941 = _923;
        _943 = _929;
        _945 = _939;
        _947 = true;
    }
    else
    {
        float _949 = float(_97);
        float _951 = 1.0 / _949;
        float _953 = _131 * _951;
        _941 = _949;
        _943 = _953;
        _945 = _953;
    }
    _947 = false;
    float _955 = _941;
    float _957 = _943;
    float _959 = _945;
    float _961 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _963 = int(_961);
    float _965 = _547 * _153;
    float _967 = _547 * _167;
    float _969 = in.m_51.w;
    float _971 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _973 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _975 = int(_973);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _981 = float(_963);
    float _983 = 1.0 / _979;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _989 = float(uint(_975));
    float _991 = 1.0 / _981;
    int _993 = ~_975;
    int _995 = _993 + 1;
    float _997 = float(_975);
    float _999 = 1.0 / _989;
    float _1001 = _131 * _991;
    int _1003 = ~_975;
    int _1005 = _1003 + 1;
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1009 = as_type<int>(_999) + (-2);
    float _1011 = trunc(_1001);
    int _1013 = int(_1011);
    float _1015 = float(uint(_1013));
    float _1017 = as_type<float>(_1009) * _1015;
    float _1019 = in.m_60.x;
    float _1021 = in.m_60.y;
    float _1023 = in.m_60.z;
    float _1025 = in.m_60.w;
    float _1027 = trunc(_1017);
    float _1029 = precise::max(_1027, 0.0);
    uint _1032 = uint(_1029);
    float _1034 = float(_1013);
    bool _1036 = _1034 >= _997;
    bool _1038 = isnan(_1034);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(_997);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    int _1048 = _1005 * int(_1032);
    int _1050 = _1048 + _1013;
    float _1052 = trunc(_1046);
    int _1054 = int(_1052);
    float _1056 = float(uint(_1050));
    float _1058 = as_type<float>(_1009) * _1056;
    float _1060 = _1021 * 1.2345600128173828125;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1064 = _1062 != 0;
    float _1066 = trunc(_1058);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    bool _1072 = !_1064;
    float _1074 = _1072 ? _1060 : _1019;
    float _1076 = floor(_1074);
    int _1078 = int(_1032) + int(_1070);
    int _1080 = _995 * _1078;
    int _1082 = _1080 + _1013;
    float _1084 = -_1076;
    float _1086 = _1074 + _1084;
    float _1088 = 1.0 / _955;
    bool _1090 = uint(_1082) >= uint(_975);
    bool _1092 = !_1090;
    int _1094 = _1092 ? 0 : (-1);
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1110 = _1108 != 0;
    int _1112 = ~_1078;
    int _1114 = _1112 + _1094;
    int _1116 = _1114 + 1;
    float _1118 = _1086 * _997;
    bool _1120 = _975 == 0;
    float _1122 = _131 * _997;
    int _1124 = ~_1054;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    int _1130 = _975 * _1116;
    int _1132 = _1130 + _1013;
    bool _1134 = !_1102;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = _1122 * _1088;
    float _1140 = trunc(_1118);
    int _1142 = int(_1140);
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1146 = _1144 != 0;
    bool _1148 = !_1120;
    int _1150 = _1148 ? _1132 : (-1);
    int _1152 = _975 + (-1);
    bool _1154 = !_1146;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1150 * _1128;
    float _1160 = trunc(_1138);
    int _1162 = int(_1160);
    int _1164 = abs(_1136);
    int _1166 = _1054 * _1152;
    int _1168 = _1166 + _1158;
    bool _1170 = !_1098;
    int _1172 = _1170 ? 0 : 1;
    int _1174 = abs(_1156);
    bool _1176 = !_1106;
    int _1178 = _1176 ? 0 : 1;
    int _1180 = abs(_1172);
    int _1182 = _1142 * _1174;
    int _1184 = _1182 + _1013;
    bool _1186 = !_1110;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = abs(_1178);
    int _1192 = _1168 * _1164;
    float _1194 = fma(_551, _165, _967);
    int _1196 = abs(_1188);
    int _1198 = _1162 * _1180;
    int _1200 = _1198 + _1192;
    int _1202 = ~_975;
    int _1204 = _1202 + 1;
    float _1206 = fma(_573, _169, _1194);
    int _1208 = _1184 * _1190;
    int _1210 = _1208 + _1200;
    float _1212 = float(uint(_1184));
    float _1214 = _967;
    if (!_1064)
    {
        _1214 = _1023;
    }
    float _1216 = _1214;
    int _1218 = _1142 * _1196;
    int _1220 = _1218 + _1210;
    int _1222 = ~_975;
    int _1224 = _1222 + 1;
    float _1226 = as_type<float>(_1009) * _1212;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1230 = _1216;
    if (_1064)
    {
        _1230 = _1021;
    }
    float _1232 = _1230;
    float _1234 = float(uint(_1220));
    float _1236 = trunc(_1226);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    float _1242 = as_type<float>(_1009) * _1234;
    float _1244 = trunc(_1242);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1254 = 1.0 / _1252;
    int _1256 = _1204 * int(_1248);
    int _1258 = _1256 + _1220;
    int _1260 = _1204 * int(_1240);
    int _1262 = _1260 + _1184;
    float _1264 = float(uint(_1258));
    float _1266 = float(uint(_1262));
    float _1268 = as_type<float>(_1009) * _1264;
    float _1270 = as_type<float>(_1009) * _1266;
    float _1272 = trunc(_1268);
    float _1274 = precise::max(_1272, 0.0);
    uint _1276 = uint(_1274);
    int _1278 = int(_1248) + int(_1276);
    float _1280 = trunc(_1270);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    int _1286 = _1224 * _1278;
    int _1288 = _1286 + _1220;
    bool _1290 = uint(_1288) >= uint(_975);
    bool _1292 = !_1290;
    int _1294 = _1292 ? 0 : (-1);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1300 = ~_1278;
    int _1302 = _1300 + _1294;
    int _1304 = _1302 + 1;
    int _1306 = int(_1240) + int(_1284);
    int _1308 = _975 * _1304;
    int _1310 = _1308 + _1220;
    float _1312 = 1.0 / _1298;
    int _1314 = _1224 * _1306;
    int _1316 = _1314 + _1184;
    float _1318 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1320 = !_1120;
    int _1322 = _1320 ? _1310 : (-1);
    float _1324 = _547 * _161;
    bool _1326 = uint(_1316) >= uint(_975);
    int _1328 = _1322 & 3;
    bool _1330 = _1328 != 0;
    float _1332 = fma(_551, _159, _1324);
    bool _1334 = !_1326;
    int _1336 = _1334 ? 0 : (-1);
    bool _1338 = uint(_1328) > 1u;
    float _1340 = fma(_573, _163, _1332);
    int _1342 = _1322 & 3;
    bool _1344 = _1342 != 0;
    float _1346 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1228);
    int _1348 = ~_1306;
    int _1350 = _1348 + _1336;
    int _1352 = _1350 + 1;
    float _1354 = fma(_551, _151, _965);
    int _1356 = _1344 ? 0 : 1;
    float _1358 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1346);
    bool _1360 = _1328 != 3;
    int _1362 = _975 * _1352;
    int _1364 = _1362 + _1184;
    int _1366 = ~_1356;
    int _1368 = _1366 + 1;
    int _1370 = _1368 + 1;
    float _1372 = fma(_573, _155, _1354);
    bool _1374 = uint(_1328) >= 2u;
    int _1376 = _1370;
    float _1378 = as_type<float>(_1328);
    if (!_1338)
    {
        int _1380 = ~_1356;
        int _1382 = _1380 + 1;
        _1376 = _1382;
    }
    int _1384 = _1376;
    bool _1386 = !_1330;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1392 = _1390 != 0;
    bool _1394 = _1021 > 0.5;
    bool _1396 = _1394 && _1392;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1400 = _1398 != 0;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1404 = -_343;
    float _1406 = _1396 ? _1404 : _343;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1410 = _1408 != 0;
    float _1412 = -_1402;
    float _1414 = fma(_1318, 2.0, _1412);
    float _1416 = _1374 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1418 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1420 = _1328 != 3;
    float _1422 = -_131;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1414);
    bool _1426 = _1019 > 0.5;
    bool _1428 = _1426 && _1400;
    bool _1430 = _1021 > 0.5;
    bool _1432 = _1430 && _1410;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _1438 = ~as_type<int>(_1416);
    int _1440 = _1438 + 1;
    int _1442 = _1440 + 1;
    int _1444 = _1442;
    float _1446 = _1416;
    if (_1360)
    {
        int _1448 = ~as_type<int>(_1416);
        int _1450 = _1448 + 1;
        _1444 = _1450;
    }
    int _1452 = _1444;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (!_1064)
    {
        _1446 = _1021;
    }
    float _1456 = _1446;
    float _1458 = 1.0 / _1436;
    float _1460 = _1456;
    if (!_1064)
    {
        _1378 = _1023;
    }
    float _1462 = _1378;
    float _1464 = fma(_1418, -2.0, _1454);
    bool _1466 = !_1420;
    int _1468 = _1466 ? 0 : (-1);
    float _1470 = in.m_53.w;
    bool _1472 = !_1120;
    int _1474 = _1472 ? _1364 : (-1);
    float _1476 = -_323;
    float _1478 = _1428 ? _1476 : _323;
    float _1480 = _1462;
    if (_1064)
    {
        _1460 = _1019;
    }
    float _1482 = _1460;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    if (_1064)
    {
        _1480 = _1021;
    }
    float _1488 = _1480;
    float _1490 = -_323;
    float _1492 = _1432 ? _1490 : _323;
    float _1494 = 1.0 / _1486;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1498 = _1496 != 0;
    float _1500 = _1492 + 0.5;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1504 = _1502 != 0;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1512 = _1510 != 0;
    float _1514 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1518 = _1516 != 0;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1522 = _1520 != 0;
    float _1524 = 1.0 / _1508;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1528 = _1526 != 0;
    float _1530 = _1514 * _1007;
    bool _1532 = _1023 > 0.5;
    bool _1534 = _1532 && _1504;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1538 = _1023 > 0.5;
    bool _1540 = _1538 && _1528;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1546 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1536);
    float _1548 = 1.0 / _1544;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1554;
    bool _1558 = _1025 > 0.5;
    bool _1560 = _1558 && _1512;
    float _1562 = 0.0;
    bool _1564 = _1540;
    bool _1566 = _1498;
    if (_1518)
    {
        float _1568 = in.m_60.w;
        _1562 = _1568;
    }
    float _1570 = _1562;
    float _1572 = _1552 * _1458;
    float _1574 = _1556 * _1312;
    float _1576 = in.m_49.w;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _1586 = abs(_1452);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1596 = _1580 * _1254;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1598;
    float _1602 = 1.0 / _1584;
    float _1604 = _1590 * _1524;
    float _1606 = _1594 * _1494;
    float _1608 = _1340 + _969;
    float _1610 = _1206 + _1470;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1620 = _1600 * _1548;
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1626 = _957 + _1624;
    float _1628 = _1618 * _983;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1632 = _957 + _1630;
    float _1634 = fma(_1606, _1626, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1638 = _957 + _1636;
    float _1640 = fma(_1596, _1632, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1642 = _1614 * _1602;
    float _1644 = _1372 + _1576;
    float _1646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1650 = _957 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1654 = _957 + _1652;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1660 = _957 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1664 = _959 + _1662;
    float _1666 = fma(_1572, _1650, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1668 = fma(_1604, _1654, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1672 = _957 + _1670;
    float _1674 = fma(_1620, _1638, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1676 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1656);
    float _1678 = fma(_1642, _1660, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1680 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1682 = isnan(_957);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    float _1692 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1694 = _1478 + 0.5;
    float _1696 = fma(_1574, _1664, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1698 = fma(_1628, _1672, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1700 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1702 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1464);
    float _1704 = _1406 + (-0.5);
    float _1706 = fma(_1692, _1694, _1424);
    bool _1708 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1710 = isnan(_957);
    bool _1712 = _1708 || _1710;
    bool _1714 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1716 = _1712 || _1714;
    float _1718 = float(_1716);
    float _1720 = -_1690;
    float _1722 = _1720 + 1.0;
    float _1724 = -_1700;
    float _1726 = -_1702;
    float _1728 = fma(_1724, _1704, _1726);
    bool _1730 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1732 = isnan(_957);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = 0.0;
    float _1744 = _1678;
    float _1746 = _1610;
    if (_1522)
    {
        float _1748 = in.m_60.x;
        _1742 = _1748;
    }
    float _1750 = _1742;
    int _1752 = _1322 >> 31;
    float _1754 = _1718 * _1722;
    bool _1756 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1758 = isnan(_957);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    float _1768 = -_1718;
    float _1770 = _1768 + 1.0;
    int _1772 = _1752 & 3;
    float _1774 = -_1740;
    float _1776 = _1774 + 1.0;
    bool _1778 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1780 = isnan(_957);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = -_1766;
    float _1792 = _1790 + 1.0;
    float _1794 = _1740 * _1770;
    int _1796 = _1322 + _1772;
    float _1798 = _1766 * _1776;
    bool _1800 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1802 = isnan(_959);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1808 = _1804 || _1806;
    float _1810 = float(_1808);
    float _1812 = _1788 * _1792;
    bool _1814 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1816 = isnan(_959);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = -_1788;
    float _1828 = _1826 + 1.0;
    bool _1830 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1832 = isnan(_957);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    float _1842 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1546);
    bool _1844 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1846 = isnan(_957);
    bool _1848 = _1844 || _1846;
    bool _1850 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1852 = _1848 || _1850;
    float _1854 = float(_1852);
    float _1856 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1676);
    bool _1858 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1860 = isnan(_957);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = _1840 * _1828;
    float _1872 = -_1840;
    float _1874 = _1872 + 1.0;
    float _1876 = _1840;
    float _1878 = _1868;
    if (_1518)
    {
        float _1880 = _1570 * 3.1415927410125732421875;
        _1876 = _1880;
    }
    float _1882 = _1876;
    int _1884 = _1796 >> 2;
    float _1886 = -_1868;
    float _1888 = _1886 + 1.0;
    float _1890 = _1868 * _1874;
    float _1892 = _1888;
    if (_1518)
    {
        float _1894 = _1882 * 0.15915493667125701904296875;
        _1878 = _1894;
    }
    float _1896 = _1878;
    float _1898 = -_1824;
    float _1900 = _1898 + 1.0;
    float _1902 = 0.0;
    if (_1522)
    {
        float _1904 = _1750 * 3.1415927410125732421875;
        _1902 = _1904;
    }
    float _1906 = _1902;
    int _1908 = _1884 << 4;
    int _1910 = _1908 + 512;
    float _1912 = _1854 * _1888;
    float _1914 = _1810 * _1900;
    float _1916 = _1896;
    if (_1518)
    {
        float _1918 = _1896 * 6.283185482025146484375;
        float _1920 = sin(_1918);
        _1916 = _1920;
    }
    float _1922 = _1916;
    float _1924 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[83].z, _985);
    float _1926 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    uint _1928 = uint(int(uint(_1910) >> uint(2)));
    uint _1930 = uint(int(uint(int(_1928)) >> uint(2)));
    int _1932 = int(_1928) & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    int _1936 = int(_1928) + 1;
    uint _1938 = uint(int(uint(_1936) >> uint(2)));
    int _1940 = _1936 & 3;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[int(_1938)][_1940];
    float _1944 = _1696 * _1914;
    float _1946 = -_987;
    float _1948 = fma(_1926, 2.0, _1946);
    float _1950 = _1666 * _1912;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1954 = -_1810;
    float _1956 = _1954 + 1.0;
    float _1958 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1960 = -_1854;
    float _1962 = _1960 + 1.0;
    if (_1522)
    {
        float _1964 = _1906 * 0.15915493667125701904296875;
        _1892 = _1964;
    }
    float _1966 = _1892;
    float _1968 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1944);
    float _1970 = fma(_1958, -2.0, _1952);
    float _1972 = -_343;
    float _1974 = _1540 ? _1972 : _343;
    float _1976 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1950);
    if (_1518)
    {
        bool _1978 = _1922 > 0.5;
        _1564 = _1978;
    }
    bool _1980 = _1564;
    float _1982 = _1966;
    if (_1522)
    {
        float _1984 = _1966 * 6.283185482025146484375;
        float _1986 = sin(_1984);
        _1982 = _1986;
    }
    float _1988 = _1982;
    int _1990 = _1910 + 8;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    float _2008 = -_1974;
    float _2010 = _2008 + 0.5;
    bool _2012 = !_1498;
    int _2014 = _2012 ? 0 : 1;
    float _2016 = fma(_1640, _1890, _1976);
    float _2018 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2020 = _1644 + _2018;
    float _2022 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2024 = -_1608;
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2030 = abs(_1384);
    float _2032 = _2020 * _2020;
    int _2034 = abs(_1388);
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2038 = _1610 + _2036;
    int _2040 = abs(_1468);
    float _2042 = fma(_1668, _1870, _2016);
    int _2044 = ~_2034;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    float _2050 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2052 = int(_2050);
    if (_1522)
    {
        bool _2054 = _1988 > 0.5;
        _1566 = _2054;
    }
    bool _2056 = _1566;
    float _2058 = -_1644;
    float _2060 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _2062 = abs(_2014);
    float _2064 = fma(_1634, _1812, _2042);
    int _2066 = ~_2040;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    float _2072 = _2060 * _2060;
    float _2074 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1968);
    float _2076 = _2022 * _2028;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2080 = _1608 + _2078;
    float _2082 = fma(_2026, _2026, _2072);
    int _2084 = ~_2030;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    float _2090 = fma(_1674, _1798, _2064);
    float _2092 = fma(_2080, _2080, _2032);
    float _2094 = -_1610;
    float _2096 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    out.m_62.x = _1530;
    out.m_62.y = _2076;
    int _2098 = ~_2052;
    int _2100 = _2098 + 1;
    float _2102 = fma(_2038, _2038, _2092);
    int _2104 = _2088 * as_type<int>(_1942);
    float _2106 = fma(_2096, _2096, _2082);
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2110 = -_1856;
    float _2112 = _2110 + 1.0;
    int _2114 = _2048 * as_type<int>(_1934);
    int _2116 = _2114 + _2104;
    float _2118 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1924);
    float _2120 = float(uint(_2052));
    int _2122 = ~_1586;
    int _2124 = _2122 + 1;
    int _2126 = _2124 + 1;
    float _2128 = rsqrt(_2102);
    int _2130 = abs(_2052);
    float _2132 = -_2118;
    float _2134 = _2132 + 1.0;
    int _2136 = _2126 * as_type<int>(_1998);
    int _2138 = _2136 + _2116;
    float _2140 = float(uint(_2130));
    float _2142 = 1.0 / _2120;
    int _2144 = _2070 * as_type<int>(_2006);
    int _2146 = _2144 + _2138;
    int _2148 = ~_2062;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = _2146 * _2152;
    float _2156 = rsqrt(_2106);
    float _2158 = _2020 * _2128;
    float _2160 = _2080 * _2128;
    int _2162 = _1474 * _2062;
    int _2164 = _2162 + _2154;
    float _2166 = _2038 * _2128;
    float _2168 = -_2158;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2020);
    float _2172 = -_2160;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2176 = 1.0 / _2140;
    int _2178 = as_type<int>(_2142) + (-2);
    float _2180 = _2170 * _2170;
    float _2182 = float(uint(_2164));
    float _2184 = -_2166;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2188 = fma(_2174, _2174, _2180);
    float _2190 = _2026 * _2156;
    int _2192 = abs(_2164);
    float _2194 = _2060 * _2156;
    float _2196 = _2096 * _2156;
    float _2198 = fma(_1698, _1794, _2090);
    float _2200 = fma(_2186, _2186, _2188);
    float _2202 = _2194 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _2206 = as_type<int>(_2176) + (-2);
    float _2208 = fma(_1678, _1754, _2198);
    float _2210 = as_type<float>(_2178) * _2182;
    float _2212 = _2190 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2214 = -_2204;
    float _2216 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2214);
    float _2218 = float(uint(_2192));
    float _2220 = -_2202;
    float _2222 = fma(_2196, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2220);
    float _2224 = _2212;
    if (!_1518)
    {
        _1744 = _323;
    }
    float _2226 = _1744;
    float _2228 = trunc(_2210);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    float _2234 = _2226;
    if (_1518)
    {
        float _2236 = -_323;
        float _2238 = _1980 ? _2236 : _323;
        _2234 = _2238;
    }
    float _2240 = _2234;
    float _2242 = -_2212;
    float _2244 = fma(_2194, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2242);
    float _2246 = as_type<float>(_2206) * _2218;
    if (!_1522)
    {
        _2224 = _343;
    }
    float _2248 = _2224;
    float _2250 = _2216 * _2216;
    float _2252 = _2248;
    if (_1522)
    {
        float _2254 = -_343;
        float _2256 = _2056 ? _2254 : _343;
        _2252 = _2256;
    }
    float _2258 = _2252;
    float _2260 = _2240 + 0.5;
    float _2262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2264 = fma(_2222, _2222, _2250);
    int _2266 = ~_2130;
    int _2268 = _2266 + 1;
    float _2270 = -_2258;
    float _2272 = _2270 + 0.5;
    float _2274 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2276 = fma(_2244, _2244, _2264);
    float _2278 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2208);
    float _2280 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2282 = trunc(_2246);
    float _2284 = precise::max(_2282, 0.0);
    uint _2286 = uint(_2284);
    int _2288 = _2100 * int(_2232);
    int _2290 = _2288 + _2164;
    float _2292 = _2274 * _2108;
    float _2294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _323);
    out.m_64.x = _2278;
    float _2296 = sqrt(_2200);
    float _2298 = _2280 * _2262;
    float _2300 = float(uint(_2290));
    out.m_66.x = _2292;
    out.m_66.y = _2298;
    float _2302 = as_type<float>(_2178) * _2300;
    float _2304 = rsqrt(_2276);
    int _2306 = _2268 * int(_2286);
    int _2308 = _2306 + _2192;
    float _2310 = float(uint(_2308));
    float _2312 = _2128 * _2296;
    float _2314 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2316 = trunc(_2302);
    float _2318 = precise::max(_2316, 0.0);
    uint _2320 = uint(_2318);
    float _2322 = as_type<float>(_2206) * _2310;
    float _2324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _343);
    float _2326 = _2314 * _2312;
    float _2328 = _971 * _2312;
    float _2330 = _2222 * _2304;
    float _2332 = _2216 * _2304;
    float _2334 = _2244 * _2304;
    float _2336 = trunc(_2322);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    float _2342 = _2330 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2344 = _2326 * _2294;
    float _2346 = _2334 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2348 = _2332 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2350 = -_2342;
    float _2352 = fma(_2334, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2350);
    float _2354 = _2328 * _2324;
    float _2356 = -_2346;
    float _2358 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2356);
    float _2360 = -_2348;
    float _2362 = fma(_2330, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2360);
    float _2364 = _2352 * _2352;
    int _2366 = int(_2232) + int(_2320);
    float _2368 = _2354 * _335;
    int _2370 = ~_2130;
    int _2372 = _2370 + 1;
    float _2374 = fma(_2358, _2358, _2364);
    int _2376 = ~_2052;
    int _2378 = _2376 + 1;
    float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2382 = int(_2286) + int(_2340);
    float _2384 = fma(_2362, _2362, _2374);
    float _2386 = _2354 * _331;
    int _2388 = _2378 * _2366;
    int _2390 = _2388 + _2164;
    float _2392 = _2354 * _339;
    float _2394 = fma(_2344, _303, _2368);
    int _2396 = _2372 * _2382;
    int _2398 = _2396 + _2192;
    float _2400 = rsqrt(_2384);
    bool _2402 = uint(_2390) >= uint(_2052);
    float _2404 = fma(_2344, _299, _2386);
    float _2406 = fma(_2344, _307, _2392);
    bool _2408 = uint(_2398) >= uint(_2130);
    int _2410 = _2164 ^ _2052;
    float _2412 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2414 = !_2408;
    int _2416 = _2414 ? 0 : (-1);
    float _2418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2420 = uint(int(uint(_2410) >> uint(31)));
    bool _2422 = !_2402;
    int _2424 = _2422 ? 0 : (-1);
    int _2426 = ~_2416;
    int _2428 = _2382 + _2426;
    int _2430 = _2428 + 1;
    int _2432 = ~int(_2420);
    int _2434 = _2432 + 1;
    float _2436 = _2352 * _2400;
    int _2438 = ~_2366;
    int _2440 = _2438 + _2424;
    int _2442 = _2440 + 1;
    float _2444 = _2362 * _2400;
    int _2446 = _2430 ^ _2434;
    bool _2448 = _2052 == 0;
    int _2450 = _2052 * _2442;
    int _2452 = _2450 + _2164;
    float _2454 = _2358 * _2400;
    int _2456 = ~_2434;
    int _2458 = _2456 + _2446;
    int _2460 = _2458 + 1;
    float _2462 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2464 = _2052 == 0;
    bool _2466 = !_2448;
    int _2468 = _2466 ? _2460 : (-1);
    bool _2470 = !_2464;
    int _2472 = _2470 ? _2452 : (-1);
    float _2474 = float(_2468);
    float _2476 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1970);
    float _2478 = -_323;
    float _2480 = _1534 ? _2478 : _323;
    float _2482 = -_131;
    float _2484 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1948);
    float _2486 = float(_2472);
    float _2488 = -_2476;
    float _2490 = fma(_2462, _2474, _2488);
    float _2492 = -_343;
    float _2494 = _1560 ? _2492 : _343;
    float _2496 = _2480 + 0.5;
    float _2498 = fma(_2412, _2486, _2484);
    float _2500 = -_1358;
    float _2502 = _2500 + 1.0;
    float _2504 = _2494 + (-0.5);
    float _2506 = fma(_2412, _2496, _2498);
    float _2508 = -_2502;
    float _2510 = fma(_1478, _2508, _1706);
    float _2512 = -_1842;
    float _2514 = _2512 + 1.0;
    float _2516 = _2436 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2518 = -_2462;
    float _2520 = fma(_2518, _2504, _2490);
    float _2522 = -_2134;
    float _2524 = fma(_2480, _2522, _2506);
    float _2526 = fma(_1406, _2514, _1728);
    float _2528 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2516);
    float _2530 = fma(_2494, _2112, _2520);
    float _2532 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2534 = _2532 * 0.5;
    float _2536 = fma(_2444, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2528);
    float _2538 = fma(_2534, _371, _2406);
    float _2540 = abs(_2536);
    float _2542 = -_2540;
    float _2544 = _2542 + 1.0;
    float _2546 = fma(_2534, _363, _2404);
    float _2548 = fma(_2534, _367, _2394);
    float _2550 = abs(_2536);
    float _2552 = fma(_2550, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2554 = as_type<int>(_2544) + (-218103808);
    out.m_68.x = _2510;
    out.m_68.y = _2526;
    out.m_68.z = _2524;
    out.m_68.w = _2530;
    float _2556 = abs(_2536);
    float _2558 = fma(_2556, _2552, -0.212114393711090087890625);
    bool _2560 = uint(_2554) >= 1920991232u;
    float _2562 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2566 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2568 = abs(_2536);
    float _2570 = fma(_2568, _2558, 1.570728778839111328125);
    bool _2572 = _2536 < 0.0;
    float _2574 = float(_2572);
    float _2576 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2578 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2580 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2582 = _2074 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2584 = !_2560;
    float _2586 = _2548;
    float _2588 = _2580;
    float _2590 = _2582;
    float _2610;
    if (!_2584)
    {
        int _2592 = as_type<int>(_2566);
        int _2594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[123].z);
        int _2596 = as_type<int>(_2544);
        int _2598 = 12848;
        int _2600;
        int _2602;
        int _2604;
        int _2606;
        int _2608;
        _89(_2592, _2594, _2596, _2598, _2600, _2602, _2604, _2606, _2608, out.gl_Position, out.gl_PointSize);
        _2610 = as_type<float>(_2604);
        _2612 = true;
    }
    else
    {
        float _2614 = rsqrt(_2544);
        float _2616 = _2544 * _2614;
        float _2618 = _2614 * 0.5;
        float _2620 = -_2616;
        float _2622 = 0.0 + _2620;
        float _2624 = fma(_2618, _2622, 0.5);
        float _2626 = fma(_2616, _2624, _2616);
        float _2628 = -_2626;
        float _2630 = 0.0 + _2628;
        float _2632 = fma(_2626, _2630, _2544);
        float _2634 = fma(_2618, _2632, _2626);
        _2610 = _2634;
    }
    _2612 = false;
    float _2636 = _2610;
    float _2638 = _2444 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2640 = _2436 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2642 = _2570 * _2636;
    float _2644 = -_2638;
    float _2646 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2644);
    float _2648 = _2454 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2650 = -_2640;
    float _2652 = fma(_2444, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2650);
    float _2654 = _2646 * _2646;
    float _2656 = -_2648;
    float _2658 = fma(_2436, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2656);
    float _2660 = fma(_2652, _2652, _2654);
    float _2662 = fma(_2658, _2658, _2660);
    float _2664 = _2574 * 2.0;
    float _2666 = -_2664;
    float _2668 = fma(_2642, _2666, _2642);
    float _2670 = rsqrt(_2662);
    float _2672 = fma(_2574, 3.1415927410125732421875, _2668);
    float _2674 = _2672 * 0.15915493667125701904296875;
    float _2676 = _2674 * 6.283185482025146484375;
    float _2678 = cos(_2676);
    float _2680 = _2646 * _2670;
    float _2682 = _2652 * _2670;
    float _2684 = _2658 * _2670;
    float _2686 = _2680 * _2680;
    float _2688 = _2674 * 6.283185482025146484375;
    float _2690 = sin(_2688);
    float _2692 = fma(_2682, _2682, _2686);
    float _2694 = -_2678;
    float _2696 = _2694 + 1.0;
    float _2698 = fma(_2684, _2684, _2692);
    float _2700 = rsqrt(_2698);
    float _2702 = _2682 * _2700;
    float _2704 = _2680 * _2700;
    float _2706 = _2684 * _2700;
    float _2708 = _2702 * _2690;
    float _2710 = _2704 * _2696;
    float _2712 = _2706 * _2690;
    float _2714 = _2702 * _2696;
    float _2716 = _2704 * _2690;
    float _2718 = fma(_2706, _2710, _2708);
    float _2720 = _2706 * _2706;
    float _2722 = -_2712;
    float _2724 = fma(_2704, _2714, _2722);
    float _2726 = -_2716;
    float _2728 = fma(_2706, _2714, _2726);
    float _2730 = _2548 * _2718;
    float _2732 = fma(_2702, _2714, _2678);
    float _2734 = _2548 * _2724;
    float _2736 = fma(_2696, _2720, _2678);
    float _2738 = fma(_2546, _2728, _2730);
    float _2740 = fma(_2706, _2714, _2716);
    float _2742 = fma(_2546, _2732, _2734);
    float _2744 = fma(_2704, _2714, _2712);
    float _2746 = fma(_2538, _2736, _2738);
    float _2748 = -_2708;
    float _2750 = fma(_2706, _2710, _2748);
    float _2752 = fma(_2538, _2740, _2742);
    float _2754 = _1610 + _2746;
    float _2756 = _1608 + _2752;
    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2760 = _2754 + _2758;
    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2764 = _2756 + _2762;
    float _2766 = _2760 * _2760;
    float _2768 = fma(_2764, _2764, _2766);
    float _2770 = fma(_2704, _2710, _2678);
    float _2772 = sqrt(_2768);
    float _2774 = _2548 * _2770;
    float _2776 = fma(_2546, _2744, _2774);
    float _2778 = fma(_2538, _2750, _2776);
    float _2780 = _1644 + _2778;
    bool _2782 = _2772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2784 = _2712;
    float _2786 = _2704;
    float _2788 = _2710;
    if (!_2782)
    {
        _2784 = _2756;
    }
    float _2790 = _2784;
    float _2792 = _2790;
    if (!_2782)
    {
        _2586 = _2754;
    }
    float _2794 = _2586;
    float _2796 = _2794;
    if (!_2782)
    {
        _2786 = _2780;
    }
    float _2798 = _2786;
    bool _2800 = !_2782;
    float _2802 = _2798;
    if (!_2800)
    {
        float _2804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2808 = _2772 + _2806;
        float _2810 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2812 = rsqrt(_2768);
        float _2814 = _2808 * _2804;
        float _2816 = _2814 * 0.15915493667125701904296875;
        float _2818 = _2816 * 6.283185482025146484375;
        float _2820 = cos(_2818);
        float _2822 = _2816 * 6.283185482025146484375;
        float _2824 = sin(_2822);
        float _2826 = _2820 + (-1.0);
        float _2828 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2830 = fma(_2824, _2810, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2832 = fma(_2780, _2820, _2828);
        float _2834 = _2812 * _2830;
        float _2836 = fma(_2764, _2834, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2838 = fma(_2760, _2834, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2802 = _2832;
        _2792 = _2836;
        _2796 = _2838;
    }
    float _2840 = _2802;
    float _2842 = _2792;
    float _2844 = _2796;
    float _2846 = -_1644;
    float _2848 = _2846 + _2840;
    float _2850 = -_1608;
    float _2852 = _2850 + _2842;
    float _2854 = -_1610;
    float _2856 = _2854 + _2844;
    out.m_70.x = _905;
    out.m_70.y = _907;
    out.m_70.z = _909;
    out.m_70.w = _913;
    float _2858 = _2848 * _2848;
    out.m_72.x = _2576;
    out.m_72.y = _2578;
    out.m_72.z = _2580;
    out.m_72.w = _2582;
    float _2860 = fma(_2852, _2852, _2858);
    float _2862 = fma(_2856, _2856, _2860);
    float _2864 = sqrt(_2862);
    bool _2866 = _2864 > 0.0;
    bool _2868 = !_2866;
    float _2870 = _2842;
    float _2872 = _2840;
    float _2874 = _2844;
    if (!_2868)
    {
        bool _2876 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2878 = _907;
        if (_2876)
        {
            float _2880 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2878 = _2880;
        }
        float _2882 = _2878;
        if (_2876)
        {
            float _2884 = _575 * _2882;
            _2588 = _2884;
        }
        float _2886 = _2588;
        float _2888 = _2886;
        if (_2876)
        {
            float _2890 = _577 * _2882;
            _2788 = _2890;
        }
        float _2892 = _2788;
        float _2894 = _2892;
        if (_2876)
        {
            float _2896 = _579 * _2882;
            _917 = _2896;
        }
        float _2898 = _917;
        float _2900 = _2898;
        if (!_2876)
        {
            float _2902 = in.m_47.x;
            float _2904 = in.m_47.y;
            float _2906 = in.m_47.z;
            float _2908 = _131 + 1.0;
            float _2910 = in.m_51.x;
            float _2912 = in.m_51.y;
            float _2914 = in.m_51.z;
            float _2916 = _2908;
            if (!_269)
            {
                float _2918 = _2908 * _2908;
                float _2920 = _2918 * 0.5;
                _2590 = _2920;
            }
            float _2922 = _2590;
            float _2924 = in.m_49.x;
            float _2926 = in.m_49.y;
            float _2928 = in.m_49.z;
            float _2930 = _2922;
            if (!_269)
            {
                float _2932 = _2922 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2930 = _2932;
            }
            float _2934 = _2930;
            float _2936 = in.m_53.x;
            float _2938 = in.m_53.y;
            float _2940 = in.m_53.z;
            bool _2942 = !_269;
            float _2944 = _2934;
            if (!_2942)
            {
                float _2946 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2948 = log2(_2946);
                float _2950 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2952 = _2948 * _2908;
                float _2954 = exp2(_2952);
                float _2956 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2958 = _2956 + 1.0;
                float _2960 = _2950 * 0.693147182464599609375;
                float _2962 = 1.0 / _2960;
                float _2964 = 1.0 / _2958;
                float _2966 = _2954 + (-1.0);
                float _2968 = -_2966;
                float _2970 = fma(_2968, _2962, _2908);
                float _2972 = _2970 * _2964;
                float _2974 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2944 = _2974;
            }
            float _2976 = _2944;
            float _2978 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2980 = !_269;
            if (!_2980)
            {
                float _2982 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2984 = log2(_2982);
                float _2986 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2988 = _2986 + 1.0;
                float _2990 = 1.0 / _2988;
                float _2992 = _2984 * _2908;
                float _2994 = exp2(_2992);
                float _2996 = -_2994;
                float _2998 = _2996 + 1.0;
                float _3000 = _2998 * _2990;
                _2916 = _3000;
            }
            float _3002 = _2916;
            float _3004 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3006 = fma(_3002, _2904, _2978);
            float _3008 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3010 = fma(_3002, _2902, _3004);
            float _3012 = -_535;
            float _3014 = _3012 + _3006;
            float _3016 = fma(_3002, _2906, _3008);
            float _3018 = -_541;
            float _3020 = _3018 + _3010;
            float _3022 = _3014 * _2912;
            float _3024 = _3014 * _2926;
            float _3026 = _3014 * _2938;
            float _3028 = -_549;
            float _3030 = _3028 + _3016;
            float _3032 = fma(_3020, _2910, _3022);
            float _3034 = fma(_3020, _2924, _3024);
            float _3036 = fma(_3020, _2936, _3026);
            float _3038 = fma(_3030, _2914, _3032);
            float _3040 = fma(_3030, _2928, _3034);
            float _3042 = fma(_3030, _2940, _3036);
            _583 = _3040;
            _585 = _3038;
            _587 = _3042;
            _2888 = _3038;
            _2894 = _3040;
            _2900 = _3042;
        }
        float _3044 = _583;
        float _3046 = _585;
        float _3048 = _587;
        float _3050 = _2888;
        float _3052 = _2894;
        float _3054 = _2900;
        float _3056 = _3044 * _3044;
        float _3058 = rsqrt(_2862);
        float _3060 = fma(_3046, _3046, _3056);
        float _3062 = fma(_3048, _3048, _3060);
        float _3064 = sqrt(_3062);
        float _3066 = _2852 * _3058;
        float _3068 = _2848 * _3058;
        float _3070 = _2856 * _3058;
        bool _3072 = _3064 > 0.0;
        bool _3074 = !_3072;
        if (!_3074)
        {
            float _3076 = rsqrt(_3062);
            float _3078 = _3076 * _3044;
            float _3080 = _3076 * _3046;
            float _3082 = _3076 * _3048;
            float _3084 = _3068 * _3078;
            float _3086 = fma(_3066, _3080, _3084);
            float _3088 = fma(_3070, _3082, _3086);
            float _3090 = _3088 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3092 = fma(_3050, _3090, _2842);
            float _3094 = fma(_3052, _3090, _2840);
            float _3096 = fma(_3054, _3090, _2844);
            _2870 = _3092;
            _2872 = _3094;
            _2874 = _3096;
        }
    }
    float _3098 = _2870;
    float _3100 = _2872;
    float _3102 = _2874;
    float _3104 = -_2158;
    float _3106 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1644);
    float _3108 = -_2160;
    float _3110 = fma(_3108, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1608);
    float _3112 = -_2166;
    float _3114 = fma(_3112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    float _3116 = -_2160;
    float _3118 = fma(_3116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3098);
    float _3120 = _3106 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3122 = _3106 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3124 = -_2158;
    float _3126 = fma(_3124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3100);
    float _3128 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3120);
    float _3130 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3122);
    float _3132 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3128);
    bool _3134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3136 = isnan(0.5);
    bool _3138 = _3134 || _3136;
    bool _3140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3142 = _3138 || _3140;
    float _3144 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3130);
    bool _3146 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3148 = isnan(0.5);
    bool _3150 = _3146 || _3148;
    bool _3152 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3154 = _3150 || _3152;
    float _3156 = _3132 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3158 = -_2166;
    float _3160 = fma(_3158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3102);
    float _3162 = _3144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3164 = 1.0 / _3156;
    float _3166 = _3162 + _3156;
    float _3168 = _3126;
    float _3170 = _3118;
    float _3172 = _3160;
    float _3174 = _3162;
    float _3176 = _3098;
    if (!_3142)
    {
        float _3178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3180 = _3106 + _3178;
        float _3182 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3184 = _3110 + _3182;
        float _3186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3188 = -_1610;
        float _3190 = _3188 + _3102;
        float _3192 = _3180 * _3180;
        float _3194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3196 = _3114 + _3194;
        float _3198 = fma(_3184, _3184, _3192);
        float _3200 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3202 = fma(_3196, _3196, _3198);
        float _3204 = sqrt(_3202);
        float _3206 = 1.0 / _2312;
        float _3208 = precise::min(_3204, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3210 = _3208 * _3186;
        float _3212 = _3200 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3214 = _3210 * _3206;
        float _3216 = -_1608;
        float _3218 = _3216 + _3098;
        float _3220 = -_1644;
        float _3222 = _3220 + _3100;
        float _3224 = _3212 * _3214;
        float _3226 = _3190 * _3214;
        float _3228 = fma(_3218, _3224, _3110);
        float _3230 = fma(_3222, _3224, _3106);
        float _3232 = fma(_3212, _3226, _3114);
        _3168 = _3230;
        _3170 = _3228;
        _3172 = _3232;
        _1746 = _3190;
        _3174 = _3226;
    }
    float _3234 = _3168;
    float _3236 = _3170;
    float _3238 = _3172;
    float _3240 = _1746;
    float _3242 = _3174;
    float _3244 = _3242;
    float _3246 = _3240;
    if (_3154)
    {
        _3244 = 1.0;
    }
    float _3248 = _3244;
    float _3250 = _3166 * _3164;
    float _3252 = _3250 * 0.5;
    float _3254 = _3248;
    float _3256 = _3252;
    if (!_3154)
    {
        float _3258 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3260 = _3258 * 0.15915493667125701904296875;
        float _3262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3266 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3264);
        float _3268 = _3260 * 6.283185482025146484375;
        float _3270 = cos(_3268);
        float _3272 = _3262 * 0.15915493667125701904296875;
        float _3274 = _3260 * 6.283185482025146484375;
        float _3276 = sin(_3274);
        float _3278 = 1.0 / _3270;
        float _3280 = _3272 * 6.283185482025146484375;
        float _3282 = cos(_3280);
        float _3284 = _3276 * _3278;
        float _3286 = _3272 * 6.283185482025146484375;
        float _3288 = sin(_3286);
        float _3290 = _3282 * _3284;
        float _3292 = 1.0 / _3266;
        float _3294 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3296 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3294;
        float _3298 = 1.0 / _3290;
        float _3300 = 1.0 / _3296;
        float _3302 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3304 = _3292 * _3302;
        float _3306 = _3288 * _3298;
        float _3308 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3310 = fma(_3306, _3304, _3308);
        float _3312 = _3310 * _3300;
        float _3314 = precise::clamp(_3312, 0.0, 1.0);
        _3246 = _3298;
        _3254 = _3314;
    }
    float _3316 = _3246;
    float _3318 = _3254;
    float _3320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3322 = _3234 + _3320;
    float _3324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3326 = _3236 + _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3330 = _3238 + _3328;
    float _3332 = _3322 * _3322;
    float _3334 = fma(_3326, _3326, _3332);
    float _3336 = fma(_3330, _3330, _3334);
    float _3338 = rsqrt(_3336);
    float _3340 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3342 = _3326 * _3340;
    float _3344 = _3330 * _3340;
    float _3346 = _3342 * _3342;
    float _3348 = _3344 * _3344;
    float _3350 = _3346 + _3348;
    float _3352 = sqrt(_3350);
    bool _3354 = _3352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3358 = _3352 + _3356;
    float _3360 = _3338;
    float _3362 = _3350;
    float _3364 = _3358;
    float _3366 = _3316;
    float _3368 = _3322;
    if (_3354)
    {
        float _3370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3360 = _3370;
    }
    float _3372 = _3360;
    if (_3354)
    {
        float _3374 = rsqrt(_3350);
        _3362 = _3374;
    }
    float _3376 = _3362;
    float _3378 = _3376;
    if (_3354)
    {
        float _3380 = _3358 * _3372;
        _3364 = _3380;
    }
    float _3382 = _3364;
    if (_3354)
    {
        float _3384 = _3382 * 0.15915493667125701904296875;
        _3366 = _3384;
    }
    float _3386 = _3366;
    float _3388 = _3330;
    if (_3354)
    {
        float _3390 = _3386 * 6.283185482025146484375;
        float _3392 = sin(_3390);
        _3388 = _3392;
    }
    float _3394 = _3388;
    float _3396 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3398 = precise::max(0.0, _3396);
    float _3400 = _3372;
    float _3402 = _3398;
    if (_3354)
    {
        float _3404 = _3386 * 6.283185482025146484375;
        float _3406 = cos(_3404);
        _3400 = _3406;
    }
    float _3408 = _3400;
    float _3410 = -_3340;
    float _3412 = -_3398;
    float _3414 = fma(_3322, _3410, _3412);
    if (_3354)
    {
        float _3416 = _3414 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3368 = _3416;
    }
    float _3418 = _3368;
    float _3420 = sqrt(_3336);
    float _3422 = _3418;
    float _3424 = _3394;
    if (_3354)
    {
        float _3426 = fma(_3394, _3418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3422 = _3426;
    }
    float _3428 = _3422;
    float _3430 = _3428;
    if (!_3354)
    {
        _3424 = _3342;
    }
    float _3432 = _3424;
    float _3434 = _3432;
    float _3436 = _3408;
    if (_3354)
    {
        float _3438 = _3408 + (-1.0);
        _3402 = _3438;
    }
    float _3440 = _3402;
    float _3442 = _3440;
    if (_3354)
    {
        float _3444 = _3376 * _3428;
        _3176 = _3444;
    }
    float _3446 = _3176;
    if (!_3354)
    {
        _3430 = _3414;
    }
    float _3448 = _3430;
    float _3450 = _3448;
    if (_3354)
    {
        float _3452 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3256 = _3452;
    }
    float _3454 = _3256;
    if (_3354)
    {
        float _3456 = _3342 * _3446;
        _3434 = _3456;
    }
    float _3458 = _3434;
    if (!_3354)
    {
        _3442 = _3344;
    }
    float _3460 = _3442;
    float _3462 = _3460;
    if (_3354)
    {
        float _3464 = _3344 * _3446;
        _3462 = _3464;
    }
    float _3466 = _3462;
    if (!_3354)
    {
        _3378 = _3346;
    }
    float _3468 = _3378;
    float _3470 = _3468;
    if (_3354)
    {
        float _3472 = fma(_3414, _3408, _3454);
        _3450 = _3472;
    }
    float _3474 = _3450;
    if (_3354)
    {
        float _3476 = _3458 * _3458;
        _3470 = _3476;
    }
    float _3478 = _3470;
    if (!_3354)
    {
        _3436 = _3348;
    }
    float _3480 = _3436;
    float _3482 = _3480;
    if (_3354)
    {
        float _3484 = _3466 * _3466;
        _3482 = _3484;
    }
    float _3486 = _3482;
    float _3488 = fma(_3474, _3474, _3478);
    float _3490 = _3488 + _3486;
    float _3492 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3494 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3496 = fma(_3420, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3494);
    float _3498 = precise::clamp(_3496, 0.0, 1.0);
    float _3500 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3502 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3504 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3492);
    float _3506 = rsqrt(_3490);
    float _3508 = -_3498;
    float _3510 = _3508 + 1.0;
    float _3512 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3514 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3504);
    float _3516 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3502);
    float _3518 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3520 = _3514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3522 = abs(_3510);
    float _3524 = log2(_3522);
    float _3526 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3512);
    float _3528 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3516);
    float _3530 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3518);
    float _3532 = _3520 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3534 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3526);
    float _3536 = _3528 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3538 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3530);
    float _3540 = _3506 * _3458;
    float _3542 = _3534 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3544 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3546 = _3506 * _3474;
    float _3548 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3550 = -_3532;
    float _3552 = fma(_3550, _3500, 1.0);
    float _3554 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3544);
    float _3556 = _3506 * _3466;
    float _3558 = _3524 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3560 = -_3548;
    float _3562 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3560);
    float _3564 = _3538 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3566 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3554);
    float _3568 = log2(_3552);
    float _3570 = -_3556;
    float _3572 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3562);
    float _3574 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3576 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3566);
    float _3578 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3580 = fma(_3572, -0.5, 0.5);
    float _3582 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3574);
    float _3584 = fma(_3572, 0.5, 0.5);
    float _3586 = exp2(_3558);
    float _3588 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3578);
    float _3590 = _3546 + 1.0;
    float _3592 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3582);
    float _3594 = fma(_3584, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3596 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3588);
    float _3598 = 1.0 / _3576;
    float _3600 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3596);
    float _3602 = fma(_3584, _3594, -0.212114393711090087890625);
    float _3604 = _3568 * 0.693147182464599609375;
    float _3606 = fma(_3584, _3602, 1.570728778839111328125);
    float _3608 = _3604 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3610 = sqrt(_3580);
    float _3612 = -_3546;
    float _3614 = fma(_3586, _3590, _3612);
    float _3616 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3592);
    float _3618 = fma(_3614, 0.5, 0.5);
    float _3620 = _3600 * _3598;
    float _3622 = _3616 * _3598;
    float _3624 = fma(_3620, 0.5, 0.5);
    float _3626 = fma(_3622, -0.5, 0.5);
    float _3628 = _3610 * 0.636619746685028076171875;
    float3 _9064 = float3(_3624, _3626, _3608);
    float _3630 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9064, float3(0.0), isnan(_9064)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9064, float3(0.0), isnan(_9064)), level(0.0)).x;
    float3 _9075 = float3(_3624, _3626, _3608);
    float4 _3633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9075, float3(0.0), isnan(_9075)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9075, float3(0.0), isnan(_9075)), level(0.0)).xyzw;
    float _3635 = _3633.x;
    float _3637 = _3633.y;
    float _3639 = _3633.z;
    float _3641 = _3633.w;
    float _3643 = -_3606;
    float _3645 = fma(_3628, _3643, 1.0);
    float2 _9097 = float2(_3645, _3618);
    float3 _3649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9097, float2(0.0), isnan(_9097)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9097, float2(0.0), isnan(_9097)), level(0.0)).xyz;
    float _3651 = _3649.x;
    float _3653 = _3649.y;
    float _3655 = _3649.z;
    float _3657 = _3524 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3659 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3661 = _3576 * 0.5;
    float _3663 = _3318 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3665 = _3318 > 0.0;
    bool _3667 = isnan(_3318);
    bool _3669 = _3665 || _3667;
    bool _3671 = isnan(0.0);
    bool _3673 = _3669 || _3671;
    float _3675 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3659);
    float _3677 = exp2(_3657);
    float _3679 = fma(_3616, -0.5, _3661);
    float _3681 = _3663 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3683 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3675);
    float _3685 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3683);
    float _3687 = _3600 + _3576;
    out.m_45.x = _3681;
    float _3689 = _3685 + _3576;
    float _3691 = -_3677;
    float _3693 = _3691 + 1.0;
    float _3695 = _3687 * 0.5;
    float _3697 = _3689 * 0.5;
    out.gl_Position.x = _3600;
    out.gl_Position.y = _3616;
    out.gl_Position.z = _3685;
    out.gl_Position.w = _3576;
    float _3699 = _3693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _3695;
    out.m_74.y = _3679;
    out.m_74.z = _3697;
    out.m_74.w = _3576;
    float _3701 = -_3699;
    float _3703 = _3701 + 1.0;
    float _3705 = _3699 * _3630;
    float _3707 = _3641 * _3703;
    float _3709 = _3641 * _3705;
    float _3711 = _3655 * _3705;
    float _3713 = fma(_3651, _3709, _3635);
    float _3715 = fma(_3653, _3709, _3637);
    float _3717 = fma(_3641, _3711, _3639);
    out.m_76.x = _3713;
    out.m_76.y = _3715;
    out.m_76.z = _3717;
    out.m_76.w = _3707;
    if (_3673)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3719 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3719;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2612 = false;
    bool _947 = false;
    bool _831 = false;
    bool _717 = false;
    bool _607 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3776 = as_type<float>(_113);
        out.gl_Position.z = _3776;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_127)
    {
        float _133 = float(_97);
        _107 = _133;
    }
    float _135 = _107;
    bool _137 = _131 >= _135;
    bool _139 = !_127;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _115 = as_type<int>(_147);
    }
    int _149 = _115;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3845 = as_type<float>(_149);
        out.gl_Position.z = _3845;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_51.x;
    float _161 = in.m_51.y;
    float _163 = in.m_51.z;
    float _165 = in.m_53.x;
    float _167 = in.m_53.y;
    float _169 = in.m_53.z;
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_58.w;
    float _175 = _151 * _151;
    float _177 = _153 * _153;
    float _179 = fma(_159, _159, _175);
    float _181 = fma(_161, _161, _177);
    float _183 = fma(_165, _165, _179);
    float _185 = _155 * _155;
    float _187 = fma(_167, _167, _181);
    float _189 = sqrt(_183);
    float _191 = fma(_163, _163, _185);
    float _193 = fma(_169, _169, _191);
    float _195 = sqrt(_187);
    float _197 = sqrt(_193);
    bool _199 = _189 > 0.0;
    float _201 = in.m_47.x;
    float _203 = in.m_47.y;
    float _205 = in.m_47.z;
    bool _207 = _195 > 0.0;
    float _209 = 0.0;
    float _211 = _187;
    float _213 = _183;
    float _215 = _157;
    if (_199)
    {
        float _217 = rsqrt(_183);
        _209 = _217;
    }
    float _219 = _209;
    float _221 = 0.0;
    float _223 = 0.0;
    if (!_199)
    {
        _221 = 0.0;
        _223 = 0.0;
    }
    float _225 = _221;
    float _227 = _223;
    bool _229 = _197 > 0.0;
    float _231 = 0.0;
    float _233 = _227;
    float _235 = _225;
    if (!_199)
    {
        _231 = 0.0;
    }
    float _237 = _231;
    int _239 = as_type<int>(_171) & 1;
    bool _241 = _239 != 0;
    int _243 = as_type<int>(_171) & 2;
    bool _245 = _243 != 0;
    float _247 = in.m_42.x;
    float _249 = in.m_42.y;
    float _251 = in.m_42.z;
    float _253 = 0.0;
    float _255 = _237;
    if (_207)
    {
        float _257 = rsqrt(_187);
        _253 = _257;
    }
    float _259 = _253;
    bool _261 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _265 = _261 || _263;
    bool _267 = isnan(1.0);
    bool _269 = _265 || _267;
    float _271 = 0.0;
    if (!_207)
    {
        _271 = 0.0;
    }
    float _273 = _271;
    float _275 = 0.0;
    float _277 = _273;
    if (!_207)
    {
        _275 = 0.0;
    }
    float _279 = _275;
    float _281 = 0.0;
    float _283 = _279;
    if (!_207)
    {
        _281 = 0.0;
    }
    float _285 = _281;
    float _287 = _193;
    float _289 = _285;
    if (_229)
    {
        float _291 = rsqrt(_193);
        _287 = _291;
    }
    float _293 = _287;
    float _295 = _219;
    if (_199)
    {
        float _297 = _219 * _159;
        _233 = _297;
    }
    float _299 = _233;
    if (_199)
    {
        float _301 = _219 * _151;
        _235 = _301;
    }
    float _303 = _235;
    if (_199)
    {
        float _305 = _219 * _165;
        _255 = _305;
    }
    float _307 = _255;
    if (!_229)
    {
        _211 = 0.0;
    }
    float _309 = _211;
    float _311 = 0.0;
    float _313 = _309;
    if (!_269)
    {
        float _315 = _157 * _157;
        float _317 = _315 * 0.5;
        _311 = _317;
    }
    float _319 = _311;
    bool _321 = !_241;
    float _323 = _321 ? (-0.5) : 0.5;
    float _325 = _259;
    float _327 = _319;
    if (_207)
    {
        float _329 = _259 * _161;
        _277 = _329;
    }
    float _331 = _277;
    if (_207)
    {
        float _333 = _259 * _153;
        _283 = _333;
    }
    float _335 = _283;
    if (_207)
    {
        float _337 = _259 * _167;
        _289 = _337;
    }
    float _339 = _289;
    bool _341 = !_245;
    float _343 = _341 ? (-0.5) : 0.5;
    if (!_229)
    {
        _325 = 0.0;
        _295 = 0.0;
    }
    float _345 = _325;
    float _347 = _295;
    float _349 = _347;
    float _351 = _345;
    if (!_269)
    {
        float _353 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _353;
    }
    float _355 = _327;
    float _357 = _355;
    float _359 = _293;
    if (_229)
    {
        float _361 = _293 * _163;
        _349 = _361;
    }
    float _363 = _349;
    if (_229)
    {
        float _365 = _293 * _155;
        _313 = _365;
    }
    float _367 = _313;
    if (_229)
    {
        float _369 = _293 * _169;
        _351 = _369;
    }
    float _371 = _351;
    bool _373 = !_269;
    if (!_373)
    {
        float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = log2(_375);
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = _157 * _377;
        float _387 = 1.0 / _381;
        float _389 = _383 * 0.693147182464599609375;
        float _391 = exp2(_385);
        float _393 = 1.0 / _389;
        float _395 = _391 + (-1.0);
        float _397 = -_395;
        float _399 = fma(_397, _393, _157);
        float _401 = _399 * _387;
        float _403 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _403;
        _359 = _391;
        _213 = _393;
    }
    float _405 = _357;
    float _407 = _359;
    float _409 = _213;
    bool _411 = !_269;
    float _413 = _409;
    float _415 = _407;
    if (!_411)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _157 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _413 = _423;
        _215 = _435;
    }
    float _437 = _413;
    float _439 = _215;
    float _441 = _437;
    if (!_269)
    {
        float _443 = _131 * _131;
        float _445 = _443 * 0.5;
        _415 = _445;
    }
    float _447 = _415;
    float _449 = _447;
    if (!_269)
    {
        _441 = _131;
    }
    float _451 = _441;
    float _453 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _455 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _457 = _451;
    if (!_269)
    {
        float _459 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _449 = _459;
    }
    float _461 = _449;
    bool _463 = !_269;
    float _465 = _461;
    if (!_463)
    {
        float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _469 = log2(_467);
        float _471 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _473 = _471 + 1.0;
        float _475 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _477 = _131 * _469;
        float _479 = 1.0 / _473;
        float _481 = _475 * 0.693147182464599609375;
        float _483 = exp2(_477);
        float _485 = 1.0 / _481;
        float _487 = _483 + (-1.0);
        float _489 = -_487;
        float _491 = fma(_489, _485, _131);
        float _493 = _491 * _479;
        float _495 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _465 = _495;
    }
    float _497 = _465;
    bool _499 = !_269;
    if (!_499)
    {
        float _501 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _503 = log2(_501);
        float _505 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _507 = _505 + 1.0;
        float _509 = 1.0 / _507;
        float _511 = _131 * _503;
        float _513 = exp2(_511);
        float _515 = -_513;
        float _517 = _515 + 1.0;
        float _519 = _517 * _509;
        _457 = _519;
    }
    float _521 = _457;
    float _523 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _525 = fma(_439, _201, _453);
    float _527 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _529 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _531 = fma(_439, _205, _523);
    float _533 = fma(_439, _203, _455);
    float _535 = fma(_521, _203, _527);
    bool _537 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _539 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _541 = fma(_521, _201, _529);
    float _543 = -_535;
    float _545 = _533 + _543;
    float _547 = fma(_533, _173, _249);
    float _549 = fma(_521, _205, _539);
    float _551 = fma(_525, _173, _247);
    float _553 = -_541;
    float _555 = _525 + _553;
    float _557 = _545 * _161;
    float _559 = _545 * _153;
    float _561 = _545 * _167;
    float _563 = -_549;
    float _565 = _531 + _563;
    float _567 = fma(_555, _159, _557);
    float _569 = fma(_555, _151, _559);
    float _571 = fma(_555, _165, _561);
    float _573 = fma(_531, _173, _251);
    float _575 = fma(_565, _163, _567);
    float _577 = fma(_565, _155, _569);
    float _579 = fma(_565, _169, _571);
    bool _581 = !_537;
    float _583 = _577;
    float _585 = _575;
    float _587 = _579;
    float _605;
    if (!_581)
    {
        float _589 = in.m_60.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_97);
        float _611 = 1.0 / _609;
        float _613 = _131 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _619 = _615 + _617;
    float _621 = in.m_58.x;
    float _623 = in.m_58.y;
    bool _625 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _627 = isnan(_615);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _637;
    bool _641 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _643 = isnan(_615);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_635;
    float _655 = _653 + 1.0;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _657;
    float _661 = 1.0 / _639;
    bool _663 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _665 = _651 * _655;
    float _667 = -_651;
    float _669 = _667 + 1.0;
    float _671 = _619 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _673;
    float _677 = fma(_659, _671, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _679 = fma(_675, _671, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _681 = _677 * _665;
    float _683 = _679 * _665;
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[143].x, _681);
    float _687 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[143].y, _683);
    float _689 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[144].x, _685);
    float _691 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[144].y, _687);
    float _693 = _689 * _621;
    float _695 = _691 * _623;
    bool _697 = !_663;
    float _715;
    if (!_697)
    {
        float _699 = in.m_60.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        float _719 = float(_97);
        float _721 = 1.0 / _719;
        float _723 = _131 * _721;
        _715 = _723;
    }
    _717 = false;
    float _725 = _715;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _729 = _725 + _727;
    bool _731 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _733 = isnan(_725);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _743;
    bool _747 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _749 = isnan(_725);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -_741;
    float _761 = _759 + 1.0;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _763;
    float _767 = 1.0 / _745;
    bool _769 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _771 = _757 * _761;
    float _773 = -_757;
    float _775 = _773 + 1.0;
    float _777 = _729 * _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _779;
    float _783 = fma(_765, _777, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _785;
    float _789 = fma(_781, _777, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _791 = _783 * _771;
    float _793 = fma(_787, _777, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _795 = _789 * _771;
    float _797 = _793 * _771;
    float _799 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].x, _791);
    float _801 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].y, _797);
    float _803 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].z, _795);
    float _805 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[108].x, _799);
    float _807 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[108].y, _801);
    float _809 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[108].z, _803);
    bool _811 = !_769;
    float _829;
    if (!_811)
    {
        float _813 = in.m_60.x;
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _817 = _813 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _821 = _819 * _815;
        float _823 = floor(_821);
        float _825 = -_823;
        float _827 = _821 + _825;
        _829 = _827;
        _831 = true;
    }
    else
    {
        float _833 = float(_97);
        float _835 = 1.0 / _833;
        float _837 = _131 * _835;
        _829 = _837;
    }
    _831 = false;
    float _839 = _829;
    bool _841 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _843 = isnan(_839);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _857 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _859 = isnan(_839);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _875 = _839 + _873;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    bool _881 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _883 = 1.0 / _855;
    float _885 = _867 * _879;
    float _887 = -_867;
    float _889 = _887 + 1.0;
    float _891 = _871 * _883;
    float _893 = _807 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _895 = fma(_891, _875, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _897 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _899 = _895 * _885;
    float _901 = _809 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[115].x, _899);
    float _905 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[116].x, _903);
    float _913 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _915 = !_881;
    float _917 = _905;
    float _941;
    float _943;
    float _945;
    if (!_915)
    {
        float _919 = in.m_60.x;
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _923 = float(_97);
        float _925 = 1.0 / _923;
        float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _929 = _131 * _925;
        float _931 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _933 = _931 * _921;
        float _935 = floor(_933);
        float _937 = -_935;
        float _939 = _933 + _937;
        _941 = _923;
        _943 = _929;
        _945 = _939;
        _947 = true;
    }
    else
    {
        float _949 = float(_97);
        float _951 = 1.0 / _949;
        float _953 = _131 * _951;
        _941 = _949;
        _943 = _953;
        _945 = _953;
    }
    _947 = false;
    float _955 = _941;
    float _957 = _943;
    float _959 = _945;
    float _961 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _963 = int(_961);
    float _965 = _547 * _153;
    float _967 = _547 * _167;
    float _969 = in.m_51.w;
    float _971 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _973 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _975 = int(_973);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _981 = float(_963);
    float _983 = 1.0 / _979;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _989 = float(uint(_975));
    float _991 = 1.0 / _981;
    int _993 = ~_975;
    int _995 = _993 + 1;
    float _997 = float(_975);
    float _999 = 1.0 / _989;
    float _1001 = _131 * _991;
    int _1003 = ~_975;
    int _1005 = _1003 + 1;
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1009 = as_type<int>(_999) + (-2);
    float _1011 = trunc(_1001);
    int _1013 = int(_1011);
    float _1015 = float(uint(_1013));
    float _1017 = as_type<float>(_1009) * _1015;
    float _1019 = in.m_60.x;
    float _1021 = in.m_60.y;
    float _1023 = in.m_60.z;
    float _1025 = in.m_60.w;
    float _1027 = trunc(_1017);
    float _1029 = precise::max(_1027, 0.0);
    uint _1032 = uint(_1029);
    float _1034 = float(_1013);
    bool _1036 = _1034 >= _997;
    bool _1038 = isnan(_1034);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(_997);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    int _1048 = _1005 * int(_1032);
    int _1050 = _1048 + _1013;
    float _1052 = trunc(_1046);
    int _1054 = int(_1052);
    float _1056 = float(uint(_1050));
    float _1058 = as_type<float>(_1009) * _1056;
    float _1060 = _1021 * 1.2345600128173828125;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1064 = _1062 != 0;
    float _1066 = trunc(_1058);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    bool _1072 = !_1064;
    float _1074 = _1072 ? _1060 : _1019;
    float _1076 = floor(_1074);
    int _1078 = int(_1032) + int(_1070);
    int _1080 = _995 * _1078;
    int _1082 = _1080 + _1013;
    float _1084 = -_1076;
    float _1086 = _1074 + _1084;
    float _1088 = 1.0 / _955;
    bool _1090 = uint(_1082) >= uint(_975);
    bool _1092 = !_1090;
    int _1094 = _1092 ? 0 : (-1);
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1110 = _1108 != 0;
    int _1112 = ~_1078;
    int _1114 = _1112 + _1094;
    int _1116 = _1114 + 1;
    float _1118 = _1086 * _997;
    bool _1120 = _975 == 0;
    float _1122 = _131 * _997;
    int _1124 = ~_1054;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    int _1130 = _975 * _1116;
    int _1132 = _1130 + _1013;
    bool _1134 = !_1102;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = _1122 * _1088;
    float _1140 = trunc(_1118);
    int _1142 = int(_1140);
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1146 = _1144 != 0;
    bool _1148 = !_1120;
    int _1150 = _1148 ? _1132 : (-1);
    int _1152 = _975 + (-1);
    bool _1154 = !_1146;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1150 * _1128;
    float _1160 = trunc(_1138);
    int _1162 = int(_1160);
    int _1164 = abs(_1136);
    int _1166 = _1054 * _1152;
    int _1168 = _1166 + _1158;
    bool _1170 = !_1098;
    int _1172 = _1170 ? 0 : 1;
    int _1174 = abs(_1156);
    bool _1176 = !_1106;
    int _1178 = _1176 ? 0 : 1;
    int _1180 = abs(_1172);
    int _1182 = _1142 * _1174;
    int _1184 = _1182 + _1013;
    bool _1186 = !_1110;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = abs(_1178);
    int _1192 = _1168 * _1164;
    float _1194 = fma(_551, _165, _967);
    int _1196 = abs(_1188);
    int _1198 = _1162 * _1180;
    int _1200 = _1198 + _1192;
    int _1202 = ~_975;
    int _1204 = _1202 + 1;
    float _1206 = fma(_573, _169, _1194);
    int _1208 = _1184 * _1190;
    int _1210 = _1208 + _1200;
    float _1212 = float(uint(_1184));
    float _1214 = _967;
    if (!_1064)
    {
        _1214 = _1023;
    }
    float _1216 = _1214;
    int _1218 = _1142 * _1196;
    int _1220 = _1218 + _1210;
    int _1222 = ~_975;
    int _1224 = _1222 + 1;
    float _1226 = as_type<float>(_1009) * _1212;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1230 = _1216;
    if (_1064)
    {
        _1230 = _1021;
    }
    float _1232 = _1230;
    float _1234 = float(uint(_1220));
    float _1236 = trunc(_1226);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    float _1242 = as_type<float>(_1009) * _1234;
    float _1244 = trunc(_1242);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1254 = 1.0 / _1252;
    int _1256 = _1204 * int(_1248);
    int _1258 = _1256 + _1220;
    int _1260 = _1204 * int(_1240);
    int _1262 = _1260 + _1184;
    float _1264 = float(uint(_1258));
    float _1266 = float(uint(_1262));
    float _1268 = as_type<float>(_1009) * _1264;
    float _1270 = as_type<float>(_1009) * _1266;
    float _1272 = trunc(_1268);
    float _1274 = precise::max(_1272, 0.0);
    uint _1276 = uint(_1274);
    int _1278 = int(_1248) + int(_1276);
    float _1280 = trunc(_1270);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    int _1286 = _1224 * _1278;
    int _1288 = _1286 + _1220;
    bool _1290 = uint(_1288) >= uint(_975);
    bool _1292 = !_1290;
    int _1294 = _1292 ? 0 : (-1);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1300 = ~_1278;
    int _1302 = _1300 + _1294;
    int _1304 = _1302 + 1;
    int _1306 = int(_1240) + int(_1284);
    int _1308 = _975 * _1304;
    int _1310 = _1308 + _1220;
    float _1312 = 1.0 / _1298;
    int _1314 = _1224 * _1306;
    int _1316 = _1314 + _1184;
    float _1318 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1320 = !_1120;
    int _1322 = _1320 ? _1310 : (-1);
    float _1324 = _547 * _161;
    bool _1326 = uint(_1316) >= uint(_975);
    int _1328 = _1322 & 3;
    bool _1330 = _1328 != 0;
    float _1332 = fma(_551, _159, _1324);
    bool _1334 = !_1326;
    int _1336 = _1334 ? 0 : (-1);
    bool _1338 = uint(_1328) > 1u;
    float _1340 = fma(_573, _163, _1332);
    int _1342 = _1322 & 3;
    bool _1344 = _1342 != 0;
    float _1346 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1228);
    int _1348 = ~_1306;
    int _1350 = _1348 + _1336;
    int _1352 = _1350 + 1;
    float _1354 = fma(_551, _151, _965);
    int _1356 = _1344 ? 0 : 1;
    float _1358 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1346);
    bool _1360 = _1328 != 3;
    int _1362 = _975 * _1352;
    int _1364 = _1362 + _1184;
    int _1366 = ~_1356;
    int _1368 = _1366 + 1;
    int _1370 = _1368 + 1;
    float _1372 = fma(_573, _155, _1354);
    bool _1374 = uint(_1328) >= 2u;
    int _1376 = _1370;
    float _1378 = as_type<float>(_1328);
    if (!_1338)
    {
        int _1380 = ~_1356;
        int _1382 = _1380 + 1;
        _1376 = _1382;
    }
    int _1384 = _1376;
    bool _1386 = !_1330;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1392 = _1390 != 0;
    bool _1394 = _1021 > 0.5;
    bool _1396 = _1394 && _1392;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1400 = _1398 != 0;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1404 = -_343;
    float _1406 = _1396 ? _1404 : _343;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1410 = _1408 != 0;
    float _1412 = -_1402;
    float _1414 = fma(_1318, 2.0, _1412);
    float _1416 = _1374 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1418 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1420 = _1328 != 3;
    float _1422 = -_131;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1414);
    bool _1426 = _1019 > 0.5;
    bool _1428 = _1426 && _1400;
    bool _1430 = _1021 > 0.5;
    bool _1432 = _1430 && _1410;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _1438 = ~as_type<int>(_1416);
    int _1440 = _1438 + 1;
    int _1442 = _1440 + 1;
    int _1444 = _1442;
    float _1446 = _1416;
    if (_1360)
    {
        int _1448 = ~as_type<int>(_1416);
        int _1450 = _1448 + 1;
        _1444 = _1450;
    }
    int _1452 = _1444;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (!_1064)
    {
        _1446 = _1021;
    }
    float _1456 = _1446;
    float _1458 = 1.0 / _1436;
    float _1460 = _1456;
    if (!_1064)
    {
        _1378 = _1023;
    }
    float _1462 = _1378;
    float _1464 = fma(_1418, -2.0, _1454);
    bool _1466 = !_1420;
    int _1468 = _1466 ? 0 : (-1);
    float _1470 = in.m_53.w;
    bool _1472 = !_1120;
    int _1474 = _1472 ? _1364 : (-1);
    float _1476 = -_323;
    float _1478 = _1428 ? _1476 : _323;
    float _1480 = _1462;
    if (_1064)
    {
        _1460 = _1019;
    }
    float _1482 = _1460;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    if (_1064)
    {
        _1480 = _1021;
    }
    float _1488 = _1480;
    float _1490 = -_323;
    float _1492 = _1432 ? _1490 : _323;
    float _1494 = 1.0 / _1486;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1498 = _1496 != 0;
    float _1500 = _1492 + 0.5;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1504 = _1502 != 0;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1512 = _1510 != 0;
    float _1514 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1518 = _1516 != 0;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1522 = _1520 != 0;
    float _1524 = 1.0 / _1508;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1528 = _1526 != 0;
    float _1530 = _1514 * _1007;
    bool _1532 = _1023 > 0.5;
    bool _1534 = _1532 && _1504;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1538 = _1023 > 0.5;
    bool _1540 = _1538 && _1528;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1546 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1536);
    float _1548 = 1.0 / _1544;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1554;
    bool _1558 = _1025 > 0.5;
    bool _1560 = _1558 && _1512;
    float _1562 = 0.0;
    bool _1564 = _1540;
    bool _1566 = _1498;
    if (_1518)
    {
        float _1568 = in.m_60.w;
        _1562 = _1568;
    }
    float _1570 = _1562;
    float _1572 = _1552 * _1458;
    float _1574 = _1556 * _1312;
    float _1576 = in.m_49.w;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _1586 = abs(_1452);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1596 = _1580 * _1254;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1598;
    float _1602 = 1.0 / _1584;
    float _1604 = _1590 * _1524;
    float _1606 = _1594 * _1494;
    float _1608 = _1340 + _969;
    float _1610 = _1206 + _1470;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1620 = _1600 * _1548;
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1626 = _957 + _1624;
    float _1628 = _1618 * _983;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1632 = _957 + _1630;
    float _1634 = fma(_1606, _1626, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1638 = _957 + _1636;
    float _1640 = fma(_1596, _1632, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1642 = _1614 * _1602;
    float _1644 = _1372 + _1576;
    float _1646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1650 = _957 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1654 = _957 + _1652;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1660 = _957 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1664 = _959 + _1662;
    float _1666 = fma(_1572, _1650, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1668 = fma(_1604, _1654, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1672 = _957 + _1670;
    float _1674 = fma(_1620, _1638, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1676 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1656);
    float _1678 = fma(_1642, _1660, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1680 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1682 = isnan(_957);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    float _1692 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1694 = _1478 + 0.5;
    float _1696 = fma(_1574, _1664, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1698 = fma(_1628, _1672, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1700 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1702 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1464);
    float _1704 = _1406 + (-0.5);
    float _1706 = fma(_1692, _1694, _1424);
    bool _1708 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1710 = isnan(_957);
    bool _1712 = _1708 || _1710;
    bool _1714 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1716 = _1712 || _1714;
    float _1718 = float(_1716);
    float _1720 = -_1690;
    float _1722 = _1720 + 1.0;
    float _1724 = -_1700;
    float _1726 = -_1702;
    float _1728 = fma(_1724, _1704, _1726);
    bool _1730 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1732 = isnan(_957);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = 0.0;
    float _1744 = _1678;
    float _1746 = _1610;
    if (_1522)
    {
        float _1748 = in.m_60.x;
        _1742 = _1748;
    }
    float _1750 = _1742;
    int _1752 = _1322 >> 31;
    float _1754 = _1718 * _1722;
    bool _1756 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1758 = isnan(_957);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    float _1768 = -_1718;
    float _1770 = _1768 + 1.0;
    int _1772 = _1752 & 3;
    float _1774 = -_1740;
    float _1776 = _1774 + 1.0;
    bool _1778 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1780 = isnan(_957);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = -_1766;
    float _1792 = _1790 + 1.0;
    float _1794 = _1740 * _1770;
    int _1796 = _1322 + _1772;
    float _1798 = _1766 * _1776;
    bool _1800 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1802 = isnan(_959);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1808 = _1804 || _1806;
    float _1810 = float(_1808);
    float _1812 = _1788 * _1792;
    bool _1814 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1816 = isnan(_959);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = -_1788;
    float _1828 = _1826 + 1.0;
    bool _1830 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1832 = isnan(_957);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    float _1842 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1546);
    bool _1844 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1846 = isnan(_957);
    bool _1848 = _1844 || _1846;
    bool _1850 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1852 = _1848 || _1850;
    float _1854 = float(_1852);
    float _1856 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1676);
    bool _1858 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1860 = isnan(_957);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = _1840 * _1828;
    float _1872 = -_1840;
    float _1874 = _1872 + 1.0;
    float _1876 = _1840;
    float _1878 = _1868;
    if (_1518)
    {
        float _1880 = _1570 * 3.1415927410125732421875;
        _1876 = _1880;
    }
    float _1882 = _1876;
    int _1884 = _1796 >> 2;
    float _1886 = -_1868;
    float _1888 = _1886 + 1.0;
    float _1890 = _1868 * _1874;
    float _1892 = _1888;
    if (_1518)
    {
        float _1894 = _1882 * 0.15915493667125701904296875;
        _1878 = _1894;
    }
    float _1896 = _1878;
    float _1898 = -_1824;
    float _1900 = _1898 + 1.0;
    float _1902 = 0.0;
    if (_1522)
    {
        float _1904 = _1750 * 3.1415927410125732421875;
        _1902 = _1904;
    }
    float _1906 = _1902;
    int _1908 = _1884 << 4;
    int _1910 = _1908 + 512;
    float _1912 = _1854 * _1888;
    float _1914 = _1810 * _1900;
    float _1916 = _1896;
    if (_1518)
    {
        float _1918 = _1896 * 6.283185482025146484375;
        float _1920 = sin(_1918);
        _1916 = _1920;
    }
    float _1922 = _1916;
    float _1924 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[83].z, _985);
    float _1926 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    uint _1928 = uint(int(uint(_1910) >> uint(2)));
    uint _1930 = uint(int(uint(int(_1928)) >> uint(2)));
    int _1932 = int(_1928) & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    int _1936 = int(_1928) + 1;
    uint _1938 = uint(int(uint(_1936) >> uint(2)));
    int _1940 = _1936 & 3;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[int(_1938)][_1940];
    float _1944 = _1696 * _1914;
    float _1946 = -_987;
    float _1948 = fma(_1926, 2.0, _1946);
    float _1950 = _1666 * _1912;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1954 = -_1810;
    float _1956 = _1954 + 1.0;
    float _1958 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1960 = -_1854;
    float _1962 = _1960 + 1.0;
    if (_1522)
    {
        float _1964 = _1906 * 0.15915493667125701904296875;
        _1892 = _1964;
    }
    float _1966 = _1892;
    float _1968 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1944);
    float _1970 = fma(_1958, -2.0, _1952);
    float _1972 = -_343;
    float _1974 = _1540 ? _1972 : _343;
    float _1976 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1950);
    if (_1518)
    {
        bool _1978 = _1922 > 0.5;
        _1564 = _1978;
    }
    bool _1980 = _1564;
    float _1982 = _1966;
    if (_1522)
    {
        float _1984 = _1966 * 6.283185482025146484375;
        float _1986 = sin(_1984);
        _1982 = _1986;
    }
    float _1988 = _1982;
    int _1990 = _1910 + 8;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    float _2008 = -_1974;
    float _2010 = _2008 + 0.5;
    bool _2012 = !_1498;
    int _2014 = _2012 ? 0 : 1;
    float _2016 = fma(_1640, _1890, _1976);
    float _2018 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2020 = _1644 + _2018;
    float _2022 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2024 = -_1608;
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2030 = abs(_1384);
    float _2032 = _2020 * _2020;
    int _2034 = abs(_1388);
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2038 = _1610 + _2036;
    int _2040 = abs(_1468);
    float _2042 = fma(_1668, _1870, _2016);
    int _2044 = ~_2034;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    float _2050 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2052 = int(_2050);
    if (_1522)
    {
        bool _2054 = _1988 > 0.5;
        _1566 = _2054;
    }
    bool _2056 = _1566;
    float _2058 = -_1644;
    float _2060 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _2062 = abs(_2014);
    float _2064 = fma(_1634, _1812, _2042);
    int _2066 = ~_2040;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    float _2072 = _2060 * _2060;
    float _2074 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1968);
    float _2076 = _2022 * _2028;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2080 = _1608 + _2078;
    float _2082 = fma(_2026, _2026, _2072);
    int _2084 = ~_2030;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    float _2090 = fma(_1674, _1798, _2064);
    float _2092 = fma(_2080, _2080, _2032);
    float _2094 = -_1610;
    float _2096 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    out.m_62.x = _1530;
    out.m_62.y = _2076;
    int _2098 = ~_2052;
    int _2100 = _2098 + 1;
    float _2102 = fma(_2038, _2038, _2092);
    int _2104 = _2088 * as_type<int>(_1942);
    float _2106 = fma(_2096, _2096, _2082);
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2110 = -_1856;
    float _2112 = _2110 + 1.0;
    int _2114 = _2048 * as_type<int>(_1934);
    int _2116 = _2114 + _2104;
    float _2118 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1924);
    float _2120 = float(uint(_2052));
    int _2122 = ~_1586;
    int _2124 = _2122 + 1;
    int _2126 = _2124 + 1;
    float _2128 = rsqrt(_2102);
    int _2130 = abs(_2052);
    float _2132 = -_2118;
    float _2134 = _2132 + 1.0;
    int _2136 = _2126 * as_type<int>(_1998);
    int _2138 = _2136 + _2116;
    float _2140 = float(uint(_2130));
    float _2142 = 1.0 / _2120;
    int _2144 = _2070 * as_type<int>(_2006);
    int _2146 = _2144 + _2138;
    int _2148 = ~_2062;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = _2146 * _2152;
    float _2156 = rsqrt(_2106);
    float _2158 = _2020 * _2128;
    float _2160 = _2080 * _2128;
    int _2162 = _1474 * _2062;
    int _2164 = _2162 + _2154;
    float _2166 = _2038 * _2128;
    float _2168 = -_2158;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2020);
    float _2172 = -_2160;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2176 = 1.0 / _2140;
    int _2178 = as_type<int>(_2142) + (-2);
    float _2180 = _2170 * _2170;
    float _2182 = float(uint(_2164));
    float _2184 = -_2166;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2188 = fma(_2174, _2174, _2180);
    float _2190 = _2026 * _2156;
    int _2192 = abs(_2164);
    float _2194 = _2060 * _2156;
    float _2196 = _2096 * _2156;
    float _2198 = fma(_1698, _1794, _2090);
    float _2200 = fma(_2186, _2186, _2188);
    float _2202 = _2194 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _2206 = as_type<int>(_2176) + (-2);
    float _2208 = fma(_1678, _1754, _2198);
    float _2210 = as_type<float>(_2178) * _2182;
    float _2212 = _2190 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2214 = -_2204;
    float _2216 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2214);
    float _2218 = float(uint(_2192));
    float _2220 = -_2202;
    float _2222 = fma(_2196, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2220);
    float _2224 = _2212;
    if (!_1518)
    {
        _1744 = _323;
    }
    float _2226 = _1744;
    float _2228 = trunc(_2210);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    float _2234 = _2226;
    if (_1518)
    {
        float _2236 = -_323;
        float _2238 = _1980 ? _2236 : _323;
        _2234 = _2238;
    }
    float _2240 = _2234;
    float _2242 = -_2212;
    float _2244 = fma(_2194, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2242);
    float _2246 = as_type<float>(_2206) * _2218;
    if (!_1522)
    {
        _2224 = _343;
    }
    float _2248 = _2224;
    float _2250 = _2216 * _2216;
    float _2252 = _2248;
    if (_1522)
    {
        float _2254 = -_343;
        float _2256 = _2056 ? _2254 : _343;
        _2252 = _2256;
    }
    float _2258 = _2252;
    float _2260 = _2240 + 0.5;
    float _2262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2264 = fma(_2222, _2222, _2250);
    int _2266 = ~_2130;
    int _2268 = _2266 + 1;
    float _2270 = -_2258;
    float _2272 = _2270 + 0.5;
    float _2274 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2276 = fma(_2244, _2244, _2264);
    float _2278 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2208);
    float _2280 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2282 = trunc(_2246);
    float _2284 = precise::max(_2282, 0.0);
    uint _2286 = uint(_2284);
    int _2288 = _2100 * int(_2232);
    int _2290 = _2288 + _2164;
    float _2292 = _2274 * _2108;
    float _2294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _323);
    out.m_64.x = _2278;
    float _2296 = sqrt(_2200);
    float _2298 = _2280 * _2262;
    float _2300 = float(uint(_2290));
    out.m_66.x = _2292;
    out.m_66.y = _2298;
    float _2302 = as_type<float>(_2178) * _2300;
    float _2304 = rsqrt(_2276);
    int _2306 = _2268 * int(_2286);
    int _2308 = _2306 + _2192;
    float _2310 = float(uint(_2308));
    float _2312 = _2128 * _2296;
    float _2314 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2316 = trunc(_2302);
    float _2318 = precise::max(_2316, 0.0);
    uint _2320 = uint(_2318);
    float _2322 = as_type<float>(_2206) * _2310;
    float _2324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _343);
    float _2326 = _2314 * _2312;
    float _2328 = _971 * _2312;
    float _2330 = _2222 * _2304;
    float _2332 = _2216 * _2304;
    float _2334 = _2244 * _2304;
    float _2336 = trunc(_2322);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    float _2342 = _2330 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2344 = _2326 * _2294;
    float _2346 = _2334 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2348 = _2332 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2350 = -_2342;
    float _2352 = fma(_2334, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2350);
    float _2354 = _2328 * _2324;
    float _2356 = -_2346;
    float _2358 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2356);
    float _2360 = -_2348;
    float _2362 = fma(_2330, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2360);
    float _2364 = _2352 * _2352;
    int _2366 = int(_2232) + int(_2320);
    float _2368 = _2354 * _335;
    int _2370 = ~_2130;
    int _2372 = _2370 + 1;
    float _2374 = fma(_2358, _2358, _2364);
    int _2376 = ~_2052;
    int _2378 = _2376 + 1;
    float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2382 = int(_2286) + int(_2340);
    float _2384 = fma(_2362, _2362, _2374);
    float _2386 = _2354 * _331;
    int _2388 = _2378 * _2366;
    int _2390 = _2388 + _2164;
    float _2392 = _2354 * _339;
    float _2394 = fma(_2344, _303, _2368);
    int _2396 = _2372 * _2382;
    int _2398 = _2396 + _2192;
    float _2400 = rsqrt(_2384);
    bool _2402 = uint(_2390) >= uint(_2052);
    float _2404 = fma(_2344, _299, _2386);
    float _2406 = fma(_2344, _307, _2392);
    bool _2408 = uint(_2398) >= uint(_2130);
    int _2410 = _2164 ^ _2052;
    float _2412 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2414 = !_2408;
    int _2416 = _2414 ? 0 : (-1);
    float _2418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2420 = uint(int(uint(_2410) >> uint(31)));
    bool _2422 = !_2402;
    int _2424 = _2422 ? 0 : (-1);
    int _2426 = ~_2416;
    int _2428 = _2382 + _2426;
    int _2430 = _2428 + 1;
    int _2432 = ~int(_2420);
    int _2434 = _2432 + 1;
    float _2436 = _2352 * _2400;
    int _2438 = ~_2366;
    int _2440 = _2438 + _2424;
    int _2442 = _2440 + 1;
    float _2444 = _2362 * _2400;
    int _2446 = _2430 ^ _2434;
    bool _2448 = _2052 == 0;
    int _2450 = _2052 * _2442;
    int _2452 = _2450 + _2164;
    float _2454 = _2358 * _2400;
    int _2456 = ~_2434;
    int _2458 = _2456 + _2446;
    int _2460 = _2458 + 1;
    float _2462 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2464 = _2052 == 0;
    bool _2466 = !_2448;
    int _2468 = _2466 ? _2460 : (-1);
    bool _2470 = !_2464;
    int _2472 = _2470 ? _2452 : (-1);
    float _2474 = float(_2468);
    float _2476 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1970);
    float _2478 = -_323;
    float _2480 = _1534 ? _2478 : _323;
    float _2482 = -_131;
    float _2484 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1948);
    float _2486 = float(_2472);
    float _2488 = -_2476;
    float _2490 = fma(_2462, _2474, _2488);
    float _2492 = -_343;
    float _2494 = _1560 ? _2492 : _343;
    float _2496 = _2480 + 0.5;
    float _2498 = fma(_2412, _2486, _2484);
    float _2500 = -_1358;
    float _2502 = _2500 + 1.0;
    float _2504 = _2494 + (-0.5);
    float _2506 = fma(_2412, _2496, _2498);
    float _2508 = -_2502;
    float _2510 = fma(_1478, _2508, _1706);
    float _2512 = -_1842;
    float _2514 = _2512 + 1.0;
    float _2516 = _2436 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2518 = -_2462;
    float _2520 = fma(_2518, _2504, _2490);
    float _2522 = -_2134;
    float _2524 = fma(_2480, _2522, _2506);
    float _2526 = fma(_1406, _2514, _1728);
    float _2528 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2516);
    float _2530 = fma(_2494, _2112, _2520);
    float _2532 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2534 = _2532 * 0.5;
    float _2536 = fma(_2444, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2528);
    float _2538 = fma(_2534, _371, _2406);
    float _2540 = abs(_2536);
    float _2542 = -_2540;
    float _2544 = _2542 + 1.0;
    float _2546 = fma(_2534, _363, _2404);
    float _2548 = fma(_2534, _367, _2394);
    float _2550 = abs(_2536);
    float _2552 = fma(_2550, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2554 = as_type<int>(_2544) + (-218103808);
    out.m_68.x = _2510;
    out.m_68.y = _2526;
    out.m_68.z = _2524;
    out.m_68.w = _2530;
    float _2556 = abs(_2536);
    float _2558 = fma(_2556, _2552, -0.212114393711090087890625);
    bool _2560 = uint(_2554) >= 1920991232u;
    float _2562 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2566 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2568 = abs(_2536);
    float _2570 = fma(_2568, _2558, 1.570728778839111328125);
    bool _2572 = _2536 < 0.0;
    float _2574 = float(_2572);
    float _2576 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2578 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2580 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2582 = _2074 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2584 = !_2560;
    float _2586 = _2548;
    float _2588 = _2580;
    float _2590 = _2582;
    float _2610;
    if (!_2584)
    {
        int _2592 = as_type<int>(_2566);
        int _2594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[123].z);
        int _2596 = as_type<int>(_2544);
        int _2598 = 12848;
        int _2600;
        int _2602;
        int _2604;
        int _2606;
        int _2608;
        _89(_2592, _2594, _2596, _2598, _2600, _2602, _2604, _2606, _2608, out.gl_Position, out.gl_PointSize);
        _2610 = as_type<float>(_2604);
        _2612 = true;
    }
    else
    {
        float _2614 = rsqrt(_2544);
        float _2616 = _2544 * _2614;
        float _2618 = _2614 * 0.5;
        float _2620 = -_2616;
        float _2622 = 0.0 + _2620;
        float _2624 = fma(_2618, _2622, 0.5);
        float _2626 = fma(_2616, _2624, _2616);
        float _2628 = -_2626;
        float _2630 = 0.0 + _2628;
        float _2632 = fma(_2626, _2630, _2544);
        float _2634 = fma(_2618, _2632, _2626);
        _2610 = _2634;
    }
    _2612 = false;
    float _2636 = _2610;
    float _2638 = _2444 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2640 = _2436 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2642 = _2570 * _2636;
    float _2644 = -_2638;
    float _2646 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2644);
    float _2648 = _2454 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2650 = -_2640;
    float _2652 = fma(_2444, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2650);
    float _2654 = _2646 * _2646;
    float _2656 = -_2648;
    float _2658 = fma(_2436, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2656);
    float _2660 = fma(_2652, _2652, _2654);
    float _2662 = fma(_2658, _2658, _2660);
    float _2664 = _2574 * 2.0;
    float _2666 = -_2664;
    float _2668 = fma(_2642, _2666, _2642);
    float _2670 = rsqrt(_2662);
    float _2672 = fma(_2574, 3.1415927410125732421875, _2668);
    float _2674 = _2672 * 0.15915493667125701904296875;
    float _2676 = _2674 * 6.283185482025146484375;
    float _2678 = cos(_2676);
    float _2680 = _2646 * _2670;
    float _2682 = _2652 * _2670;
    float _2684 = _2658 * _2670;
    float _2686 = _2680 * _2680;
    float _2688 = _2674 * 6.283185482025146484375;
    float _2690 = sin(_2688);
    float _2692 = fma(_2682, _2682, _2686);
    float _2694 = -_2678;
    float _2696 = _2694 + 1.0;
    float _2698 = fma(_2684, _2684, _2692);
    float _2700 = rsqrt(_2698);
    float _2702 = _2682 * _2700;
    float _2704 = _2680 * _2700;
    float _2706 = _2684 * _2700;
    float _2708 = _2702 * _2690;
    float _2710 = _2704 * _2696;
    float _2712 = _2706 * _2690;
    float _2714 = _2702 * _2696;
    float _2716 = _2704 * _2690;
    float _2718 = fma(_2706, _2710, _2708);
    float _2720 = _2706 * _2706;
    float _2722 = -_2712;
    float _2724 = fma(_2704, _2714, _2722);
    float _2726 = -_2716;
    float _2728 = fma(_2706, _2714, _2726);
    float _2730 = _2548 * _2718;
    float _2732 = fma(_2702, _2714, _2678);
    float _2734 = _2548 * _2724;
    float _2736 = fma(_2696, _2720, _2678);
    float _2738 = fma(_2546, _2728, _2730);
    float _2740 = fma(_2706, _2714, _2716);
    float _2742 = fma(_2546, _2732, _2734);
    float _2744 = fma(_2704, _2714, _2712);
    float _2746 = fma(_2538, _2736, _2738);
    float _2748 = -_2708;
    float _2750 = fma(_2706, _2710, _2748);
    float _2752 = fma(_2538, _2740, _2742);
    float _2754 = _1610 + _2746;
    float _2756 = _1608 + _2752;
    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2760 = _2754 + _2758;
    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2764 = _2756 + _2762;
    float _2766 = _2760 * _2760;
    float _2768 = fma(_2764, _2764, _2766);
    float _2770 = fma(_2704, _2710, _2678);
    float _2772 = sqrt(_2768);
    float _2774 = _2548 * _2770;
    float _2776 = fma(_2546, _2744, _2774);
    float _2778 = fma(_2538, _2750, _2776);
    float _2780 = _1644 + _2778;
    bool _2782 = _2772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2784 = _2712;
    float _2786 = _2704;
    float _2788 = _2710;
    if (!_2782)
    {
        _2784 = _2756;
    }
    float _2790 = _2784;
    float _2792 = _2790;
    if (!_2782)
    {
        _2586 = _2754;
    }
    float _2794 = _2586;
    float _2796 = _2794;
    if (!_2782)
    {
        _2786 = _2780;
    }
    float _2798 = _2786;
    bool _2800 = !_2782;
    float _2802 = _2798;
    if (!_2800)
    {
        float _2804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2808 = _2772 + _2806;
        float _2810 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2812 = rsqrt(_2768);
        float _2814 = _2808 * _2804;
        float _2816 = _2814 * 0.15915493667125701904296875;
        float _2818 = _2816 * 6.283185482025146484375;
        float _2820 = cos(_2818);
        float _2822 = _2816 * 6.283185482025146484375;
        float _2824 = sin(_2822);
        float _2826 = _2820 + (-1.0);
        float _2828 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2830 = fma(_2824, _2810, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2832 = fma(_2780, _2820, _2828);
        float _2834 = _2812 * _2830;
        float _2836 = fma(_2764, _2834, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2838 = fma(_2760, _2834, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2802 = _2832;
        _2792 = _2836;
        _2796 = _2838;
    }
    float _2840 = _2802;
    float _2842 = _2792;
    float _2844 = _2796;
    float _2846 = -_1644;
    float _2848 = _2846 + _2840;
    float _2850 = -_1608;
    float _2852 = _2850 + _2842;
    float _2854 = -_1610;
    float _2856 = _2854 + _2844;
    out.m_70.x = _905;
    out.m_70.y = _907;
    out.m_70.z = _909;
    out.m_70.w = _913;
    float _2858 = _2848 * _2848;
    out.m_72.x = _2576;
    out.m_72.y = _2578;
    out.m_72.z = _2580;
    out.m_72.w = _2582;
    float _2860 = fma(_2852, _2852, _2858);
    float _2862 = fma(_2856, _2856, _2860);
    float _2864 = sqrt(_2862);
    bool _2866 = _2864 > 0.0;
    bool _2868 = !_2866;
    float _2870 = _2842;
    float _2872 = _2840;
    float _2874 = _2844;
    if (!_2868)
    {
        bool _2876 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2878 = _907;
        if (_2876)
        {
            float _2880 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2878 = _2880;
        }
        float _2882 = _2878;
        if (_2876)
        {
            float _2884 = _575 * _2882;
            _2588 = _2884;
        }
        float _2886 = _2588;
        float _2888 = _2886;
        if (_2876)
        {
            float _2890 = _577 * _2882;
            _2788 = _2890;
        }
        float _2892 = _2788;
        float _2894 = _2892;
        if (_2876)
        {
            float _2896 = _579 * _2882;
            _917 = _2896;
        }
        float _2898 = _917;
        float _2900 = _2898;
        if (!_2876)
        {
            float _2902 = in.m_47.x;
            float _2904 = in.m_47.y;
            float _2906 = in.m_47.z;
            float _2908 = _131 + 1.0;
            float _2910 = in.m_51.x;
            float _2912 = in.m_51.y;
            float _2914 = in.m_51.z;
            float _2916 = _2908;
            if (!_269)
            {
                float _2918 = _2908 * _2908;
                float _2920 = _2918 * 0.5;
                _2590 = _2920;
            }
            float _2922 = _2590;
            float _2924 = in.m_49.x;
            float _2926 = in.m_49.y;
            float _2928 = in.m_49.z;
            float _2930 = _2922;
            if (!_269)
            {
                float _2932 = _2922 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2930 = _2932;
            }
            float _2934 = _2930;
            float _2936 = in.m_53.x;
            float _2938 = in.m_53.y;
            float _2940 = in.m_53.z;
            bool _2942 = !_269;
            float _2944 = _2934;
            if (!_2942)
            {
                float _2946 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2948 = log2(_2946);
                float _2950 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2952 = _2948 * _2908;
                float _2954 = exp2(_2952);
                float _2956 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2958 = _2956 + 1.0;
                float _2960 = _2950 * 0.693147182464599609375;
                float _2962 = 1.0 / _2960;
                float _2964 = 1.0 / _2958;
                float _2966 = _2954 + (-1.0);
                float _2968 = -_2966;
                float _2970 = fma(_2968, _2962, _2908);
                float _2972 = _2970 * _2964;
                float _2974 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2944 = _2974;
            }
            float _2976 = _2944;
            float _2978 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2980 = !_269;
            if (!_2980)
            {
                float _2982 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2984 = log2(_2982);
                float _2986 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2988 = _2986 + 1.0;
                float _2990 = 1.0 / _2988;
                float _2992 = _2984 * _2908;
                float _2994 = exp2(_2992);
                float _2996 = -_2994;
                float _2998 = _2996 + 1.0;
                float _3000 = _2998 * _2990;
                _2916 = _3000;
            }
            float _3002 = _2916;
            float _3004 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3006 = fma(_3002, _2904, _2978);
            float _3008 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3010 = fma(_3002, _2902, _3004);
            float _3012 = -_535;
            float _3014 = _3012 + _3006;
            float _3016 = fma(_3002, _2906, _3008);
            float _3018 = -_541;
            float _3020 = _3018 + _3010;
            float _3022 = _3014 * _2912;
            float _3024 = _3014 * _2926;
            float _3026 = _3014 * _2938;
            float _3028 = -_549;
            float _3030 = _3028 + _3016;
            float _3032 = fma(_3020, _2910, _3022);
            float _3034 = fma(_3020, _2924, _3024);
            float _3036 = fma(_3020, _2936, _3026);
            float _3038 = fma(_3030, _2914, _3032);
            float _3040 = fma(_3030, _2928, _3034);
            float _3042 = fma(_3030, _2940, _3036);
            _583 = _3040;
            _585 = _3038;
            _587 = _3042;
            _2888 = _3038;
            _2894 = _3040;
            _2900 = _3042;
        }
        float _3044 = _583;
        float _3046 = _585;
        float _3048 = _587;
        float _3050 = _2888;
        float _3052 = _2894;
        float _3054 = _2900;
        float _3056 = _3044 * _3044;
        float _3058 = rsqrt(_2862);
        float _3060 = fma(_3046, _3046, _3056);
        float _3062 = fma(_3048, _3048, _3060);
        float _3064 = sqrt(_3062);
        float _3066 = _2852 * _3058;
        float _3068 = _2848 * _3058;
        float _3070 = _2856 * _3058;
        bool _3072 = _3064 > 0.0;
        bool _3074 = !_3072;
        if (!_3074)
        {
            float _3076 = rsqrt(_3062);
            float _3078 = _3076 * _3044;
            float _3080 = _3076 * _3046;
            float _3082 = _3076 * _3048;
            float _3084 = _3068 * _3078;
            float _3086 = fma(_3066, _3080, _3084);
            float _3088 = fma(_3070, _3082, _3086);
            float _3090 = _3088 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3092 = fma(_3050, _3090, _2842);
            float _3094 = fma(_3052, _3090, _2840);
            float _3096 = fma(_3054, _3090, _2844);
            _2870 = _3092;
            _2872 = _3094;
            _2874 = _3096;
        }
    }
    float _3098 = _2870;
    float _3100 = _2872;
    float _3102 = _2874;
    float _3104 = -_2158;
    float _3106 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1644);
    float _3108 = -_2160;
    float _3110 = fma(_3108, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1608);
    float _3112 = -_2166;
    float _3114 = fma(_3112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    float _3116 = -_2160;
    float _3118 = fma(_3116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3098);
    float _3120 = _3106 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3122 = _3106 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3124 = -_2158;
    float _3126 = fma(_3124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3100);
    float _3128 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3120);
    float _3130 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3122);
    float _3132 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3128);
    bool _3134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3136 = isnan(0.5);
    bool _3138 = _3134 || _3136;
    bool _3140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3142 = _3138 || _3140;
    float _3144 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3130);
    bool _3146 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3148 = isnan(0.5);
    bool _3150 = _3146 || _3148;
    bool _3152 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3154 = _3150 || _3152;
    float _3156 = _3132 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3158 = -_2166;
    float _3160 = fma(_3158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3102);
    float _3162 = _3144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3164 = 1.0 / _3156;
    float _3166 = _3162 + _3156;
    float _3168 = _3126;
    float _3170 = _3118;
    float _3172 = _3160;
    float _3174 = _3162;
    float _3176 = _3098;
    if (!_3142)
    {
        float _3178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3180 = _3106 + _3178;
        float _3182 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3184 = _3110 + _3182;
        float _3186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3188 = -_1610;
        float _3190 = _3188 + _3102;
        float _3192 = _3180 * _3180;
        float _3194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3196 = _3114 + _3194;
        float _3198 = fma(_3184, _3184, _3192);
        float _3200 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3202 = fma(_3196, _3196, _3198);
        float _3204 = sqrt(_3202);
        float _3206 = 1.0 / _2312;
        float _3208 = precise::min(_3204, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3210 = _3208 * _3186;
        float _3212 = _3200 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3214 = _3210 * _3206;
        float _3216 = -_1608;
        float _3218 = _3216 + _3098;
        float _3220 = -_1644;
        float _3222 = _3220 + _3100;
        float _3224 = _3212 * _3214;
        float _3226 = _3190 * _3214;
        float _3228 = fma(_3218, _3224, _3110);
        float _3230 = fma(_3222, _3224, _3106);
        float _3232 = fma(_3212, _3226, _3114);
        _3168 = _3230;
        _3170 = _3228;
        _3172 = _3232;
        _1746 = _3190;
        _3174 = _3226;
    }
    float _3234 = _3168;
    float _3236 = _3170;
    float _3238 = _3172;
    float _3240 = _1746;
    float _3242 = _3174;
    float _3244 = _3242;
    float _3246 = _3240;
    if (_3154)
    {
        _3244 = 1.0;
    }
    float _3248 = _3244;
    float _3250 = _3166 * _3164;
    float _3252 = _3250 * 0.5;
    float _3254 = _3248;
    float _3256 = _3252;
    if (!_3154)
    {
        float _3258 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3260 = _3258 * 0.15915493667125701904296875;
        float _3262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3266 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3264);
        float _3268 = _3260 * 6.283185482025146484375;
        float _3270 = cos(_3268);
        float _3272 = _3262 * 0.15915493667125701904296875;
        float _3274 = _3260 * 6.283185482025146484375;
        float _3276 = sin(_3274);
        float _3278 = 1.0 / _3270;
        float _3280 = _3272 * 6.283185482025146484375;
        float _3282 = cos(_3280);
        float _3284 = _3276 * _3278;
        float _3286 = _3272 * 6.283185482025146484375;
        float _3288 = sin(_3286);
        float _3290 = _3282 * _3284;
        float _3292 = 1.0 / _3266;
        float _3294 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3296 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3294;
        float _3298 = 1.0 / _3290;
        float _3300 = 1.0 / _3296;
        float _3302 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3304 = _3292 * _3302;
        float _3306 = _3288 * _3298;
        float _3308 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3310 = fma(_3306, _3304, _3308);
        float _3312 = _3310 * _3300;
        float _3314 = precise::clamp(_3312, 0.0, 1.0);
        _3246 = _3298;
        _3254 = _3314;
    }
    float _3316 = _3246;
    float _3318 = _3254;
    float _3320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3322 = _3234 + _3320;
    float _3324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3326 = _3236 + _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3330 = _3238 + _3328;
    float _3332 = _3322 * _3322;
    float _3334 = fma(_3326, _3326, _3332);
    float _3336 = fma(_3330, _3330, _3334);
    float _3338 = rsqrt(_3336);
    float _3340 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3342 = _3326 * _3340;
    float _3344 = _3330 * _3340;
    float _3346 = _3342 * _3342;
    float _3348 = _3344 * _3344;
    float _3350 = _3346 + _3348;
    float _3352 = sqrt(_3350);
    bool _3354 = _3352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3358 = _3352 + _3356;
    float _3360 = _3338;
    float _3362 = _3350;
    float _3364 = _3358;
    float _3366 = _3316;
    float _3368 = _3322;
    if (_3354)
    {
        float _3370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3360 = _3370;
    }
    float _3372 = _3360;
    if (_3354)
    {
        float _3374 = rsqrt(_3350);
        _3362 = _3374;
    }
    float _3376 = _3362;
    float _3378 = _3376;
    if (_3354)
    {
        float _3380 = _3358 * _3372;
        _3364 = _3380;
    }
    float _3382 = _3364;
    if (_3354)
    {
        float _3384 = _3382 * 0.15915493667125701904296875;
        _3366 = _3384;
    }
    float _3386 = _3366;
    float _3388 = _3330;
    if (_3354)
    {
        float _3390 = _3386 * 6.283185482025146484375;
        float _3392 = sin(_3390);
        _3388 = _3392;
    }
    float _3394 = _3388;
    float _3396 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3398 = precise::max(0.0, _3396);
    float _3400 = _3372;
    float _3402 = _3398;
    if (_3354)
    {
        float _3404 = _3386 * 6.283185482025146484375;
        float _3406 = cos(_3404);
        _3400 = _3406;
    }
    float _3408 = _3400;
    float _3410 = -_3340;
    float _3412 = -_3398;
    float _3414 = fma(_3322, _3410, _3412);
    if (_3354)
    {
        float _3416 = _3414 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3368 = _3416;
    }
    float _3418 = _3368;
    float _3420 = sqrt(_3336);
    float _3422 = _3418;
    float _3424 = _3394;
    if (_3354)
    {
        float _3426 = fma(_3394, _3418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3422 = _3426;
    }
    float _3428 = _3422;
    float _3430 = _3428;
    if (!_3354)
    {
        _3424 = _3342;
    }
    float _3432 = _3424;
    float _3434 = _3432;
    float _3436 = _3408;
    if (_3354)
    {
        float _3438 = _3408 + (-1.0);
        _3402 = _3438;
    }
    float _3440 = _3402;
    float _3442 = _3440;
    if (_3354)
    {
        float _3444 = _3376 * _3428;
        _3176 = _3444;
    }
    float _3446 = _3176;
    if (!_3354)
    {
        _3430 = _3414;
    }
    float _3448 = _3430;
    float _3450 = _3448;
    if (_3354)
    {
        float _3452 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3256 = _3452;
    }
    float _3454 = _3256;
    if (_3354)
    {
        float _3456 = _3342 * _3446;
        _3434 = _3456;
    }
    float _3458 = _3434;
    if (!_3354)
    {
        _3442 = _3344;
    }
    float _3460 = _3442;
    float _3462 = _3460;
    if (_3354)
    {
        float _3464 = _3344 * _3446;
        _3462 = _3464;
    }
    float _3466 = _3462;
    if (!_3354)
    {
        _3378 = _3346;
    }
    float _3468 = _3378;
    float _3470 = _3468;
    if (_3354)
    {
        float _3472 = fma(_3414, _3408, _3454);
        _3450 = _3472;
    }
    float _3474 = _3450;
    if (_3354)
    {
        float _3476 = _3458 * _3458;
        _3470 = _3476;
    }
    float _3478 = _3470;
    if (!_3354)
    {
        _3436 = _3348;
    }
    float _3480 = _3436;
    float _3482 = _3480;
    if (_3354)
    {
        float _3484 = _3466 * _3466;
        _3482 = _3484;
    }
    float _3486 = _3482;
    float _3488 = fma(_3474, _3474, _3478);
    float _3490 = _3488 + _3486;
    float _3492 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3494 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3496 = fma(_3420, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3494);
    float _3498 = precise::clamp(_3496, 0.0, 1.0);
    float _3500 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3502 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3504 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3492);
    float _3506 = rsqrt(_3490);
    float _3508 = -_3498;
    float _3510 = _3508 + 1.0;
    float _3512 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3514 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3504);
    float _3516 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3502);
    float _3518 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3520 = _3514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3522 = abs(_3510);
    float _3524 = log2(_3522);
    float _3526 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3512);
    float _3528 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3516);
    float _3530 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3518);
    float _3532 = _3520 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3534 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3526);
    float _3536 = _3528 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3538 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3530);
    float _3540 = _3506 * _3458;
    float _3542 = _3534 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3544 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3546 = _3506 * _3474;
    float _3548 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3550 = -_3532;
    float _3552 = fma(_3550, _3500, 1.0);
    float _3554 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3544);
    float _3556 = _3506 * _3466;
    float _3558 = _3524 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3560 = -_3548;
    float _3562 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3560);
    float _3564 = _3538 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3566 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3554);
    float _3568 = log2(_3552);
    float _3570 = -_3556;
    float _3572 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3562);
    float _3574 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3576 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3566);
    float _3578 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3580 = fma(_3572, -0.5, 0.5);
    float _3582 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3574);
    float _3584 = fma(_3572, 0.5, 0.5);
    float _3586 = exp2(_3558);
    float _3588 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3578);
    float _3590 = _3546 + 1.0;
    float _3592 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3582);
    float _3594 = fma(_3584, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3596 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3588);
    float _3598 = 1.0 / _3576;
    float _3600 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3596);
    float _3602 = fma(_3584, _3594, -0.212114393711090087890625);
    float _3604 = _3568 * 0.693147182464599609375;
    float _3606 = fma(_3584, _3602, 1.570728778839111328125);
    float _3608 = _3604 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3610 = sqrt(_3580);
    float _3612 = -_3546;
    float _3614 = fma(_3586, _3590, _3612);
    float _3616 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3592);
    float _3618 = fma(_3614, 0.5, 0.5);
    float _3620 = _3600 * _3598;
    float _3622 = _3616 * _3598;
    float _3624 = fma(_3620, 0.5, 0.5);
    float _3626 = fma(_3622, -0.5, 0.5);
    float _3628 = _3610 * 0.636619746685028076171875;
    float3 _9064 = float3(_3624, _3626, _3608);
    float _3630 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9064, float3(0.0), isnan(_9064)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9064, float3(0.0), isnan(_9064)), level(0.0)).x;
    float3 _9075 = float3(_3624, _3626, _3608);
    float4 _3633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9075, float3(0.0), isnan(_9075)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9075, float3(0.0), isnan(_9075)), level(0.0)).xyzw;
    float _3635 = _3633.x;
    float _3637 = _3633.y;
    float _3639 = _3633.z;
    float _3641 = _3633.w;
    float _3643 = -_3606;
    float _3645 = fma(_3628, _3643, 1.0);
    float2 _9097 = float2(_3645, _3618);
    float3 _3649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9097, float2(0.0), isnan(_9097)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9097, float2(0.0), isnan(_9097)), level(0.0)).xyz;
    float _3651 = _3649.x;
    float _3653 = _3649.y;
    float _3655 = _3649.z;
    float _3657 = _3524 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3659 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3661 = _3576 * 0.5;
    float _3663 = _3318 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3665 = _3318 > 0.0;
    bool _3667 = isnan(_3318);
    bool _3669 = _3665 || _3667;
    bool _3671 = isnan(0.0);
    bool _3673 = _3669 || _3671;
    float _3675 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3659);
    float _3677 = exp2(_3657);
    float _3679 = fma(_3616, -0.5, _3661);
    float _3681 = _3663 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3683 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3675);
    float _3685 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3683);
    float _3687 = _3600 + _3576;
    out.m_45.x = _3681;
    float _3689 = _3685 + _3576;
    float _3691 = -_3677;
    float _3693 = _3691 + 1.0;
    float _3695 = _3687 * 0.5;
    float _3697 = _3689 * 0.5;
    out.gl_Position.x = _3600;
    out.gl_Position.y = _3616;
    out.gl_Position.z = _3685;
    out.gl_Position.w = _3576;
    float _3699 = _3693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _3695;
    out.m_74.y = _3679;
    out.m_74.z = _3697;
    out.m_74.w = _3576;
    float _3701 = -_3699;
    float _3703 = _3701 + 1.0;
    float _3705 = _3699 * _3630;
    float _3707 = _3641 * _3703;
    float _3709 = _3641 * _3705;
    float _3711 = _3655 * _3705;
    float _3713 = fma(_3651, _3709, _3635);
    float _3715 = fma(_3653, _3709, _3637);
    float _3717 = fma(_3641, _3711, _3639);
    out.m_76.x = _3713;
    out.m_76.y = _3715;
    out.m_76.z = _3717;
    out.m_76.w = _3707;
    if (_3673)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3719 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3719;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2612 = false;
    bool _947 = false;
    bool _831 = false;
    bool _717 = false;
    bool _607 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _97 = int(_95);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3776 = as_type<float>(_113);
        out.gl_Position.z = _3776;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_127)
    {
        float _133 = float(_97);
        _107 = _133;
    }
    float _135 = _107;
    bool _137 = _131 >= _135;
    bool _139 = !_127;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _115 = as_type<int>(_147);
    }
    int _149 = _115;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3845 = as_type<float>(_149);
        out.gl_Position.z = _3845;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_51.x;
    float _161 = in.m_51.y;
    float _163 = in.m_51.z;
    float _165 = in.m_53.x;
    float _167 = in.m_53.y;
    float _169 = in.m_53.z;
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_58.w;
    float _175 = _151 * _151;
    float _177 = _153 * _153;
    float _179 = fma(_159, _159, _175);
    float _181 = fma(_161, _161, _177);
    float _183 = fma(_165, _165, _179);
    float _185 = _155 * _155;
    float _187 = fma(_167, _167, _181);
    float _189 = sqrt(_183);
    float _191 = fma(_163, _163, _185);
    float _193 = fma(_169, _169, _191);
    float _195 = sqrt(_187);
    float _197 = sqrt(_193);
    bool _199 = _189 > 0.0;
    float _201 = in.m_47.x;
    float _203 = in.m_47.y;
    float _205 = in.m_47.z;
    bool _207 = _195 > 0.0;
    float _209 = 0.0;
    float _211 = _187;
    float _213 = _183;
    float _215 = _157;
    if (_199)
    {
        float _217 = rsqrt(_183);
        _209 = _217;
    }
    float _219 = _209;
    float _221 = 0.0;
    float _223 = 0.0;
    if (!_199)
    {
        _221 = 0.0;
        _223 = 0.0;
    }
    float _225 = _221;
    float _227 = _223;
    bool _229 = _197 > 0.0;
    float _231 = 0.0;
    float _233 = _227;
    float _235 = _225;
    if (!_199)
    {
        _231 = 0.0;
    }
    float _237 = _231;
    int _239 = as_type<int>(_171) & 1;
    bool _241 = _239 != 0;
    int _243 = as_type<int>(_171) & 2;
    bool _245 = _243 != 0;
    float _247 = in.m_42.x;
    float _249 = in.m_42.y;
    float _251 = in.m_42.z;
    float _253 = 0.0;
    float _255 = _237;
    if (_207)
    {
        float _257 = rsqrt(_187);
        _253 = _257;
    }
    float _259 = _253;
    bool _261 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _265 = _261 || _263;
    bool _267 = isnan(1.0);
    bool _269 = _265 || _267;
    float _271 = 0.0;
    if (!_207)
    {
        _271 = 0.0;
    }
    float _273 = _271;
    float _275 = 0.0;
    float _277 = _273;
    if (!_207)
    {
        _275 = 0.0;
    }
    float _279 = _275;
    float _281 = 0.0;
    float _283 = _279;
    if (!_207)
    {
        _281 = 0.0;
    }
    float _285 = _281;
    float _287 = _193;
    float _289 = _285;
    if (_229)
    {
        float _291 = rsqrt(_193);
        _287 = _291;
    }
    float _293 = _287;
    float _295 = _219;
    if (_199)
    {
        float _297 = _219 * _159;
        _233 = _297;
    }
    float _299 = _233;
    if (_199)
    {
        float _301 = _219 * _151;
        _235 = _301;
    }
    float _303 = _235;
    if (_199)
    {
        float _305 = _219 * _165;
        _255 = _305;
    }
    float _307 = _255;
    if (!_229)
    {
        _211 = 0.0;
    }
    float _309 = _211;
    float _311 = 0.0;
    float _313 = _309;
    if (!_269)
    {
        float _315 = _157 * _157;
        float _317 = _315 * 0.5;
        _311 = _317;
    }
    float _319 = _311;
    bool _321 = !_241;
    float _323 = _321 ? (-0.5) : 0.5;
    float _325 = _259;
    float _327 = _319;
    if (_207)
    {
        float _329 = _259 * _161;
        _277 = _329;
    }
    float _331 = _277;
    if (_207)
    {
        float _333 = _259 * _153;
        _283 = _333;
    }
    float _335 = _283;
    if (_207)
    {
        float _337 = _259 * _167;
        _289 = _337;
    }
    float _339 = _289;
    bool _341 = !_245;
    float _343 = _341 ? (-0.5) : 0.5;
    if (!_229)
    {
        _325 = 0.0;
        _295 = 0.0;
    }
    float _345 = _325;
    float _347 = _295;
    float _349 = _347;
    float _351 = _345;
    if (!_269)
    {
        float _353 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _353;
    }
    float _355 = _327;
    float _357 = _355;
    float _359 = _293;
    if (_229)
    {
        float _361 = _293 * _163;
        _349 = _361;
    }
    float _363 = _349;
    if (_229)
    {
        float _365 = _293 * _155;
        _313 = _365;
    }
    float _367 = _313;
    if (_229)
    {
        float _369 = _293 * _169;
        _351 = _369;
    }
    float _371 = _351;
    bool _373 = !_269;
    if (!_373)
    {
        float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = log2(_375);
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = _157 * _377;
        float _387 = 1.0 / _381;
        float _389 = _383 * 0.693147182464599609375;
        float _391 = exp2(_385);
        float _393 = 1.0 / _389;
        float _395 = _391 + (-1.0);
        float _397 = -_395;
        float _399 = fma(_397, _393, _157);
        float _401 = _399 * _387;
        float _403 = _401 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _357 = _403;
        _359 = _391;
        _213 = _393;
    }
    float _405 = _357;
    float _407 = _359;
    float _409 = _213;
    bool _411 = !_269;
    float _413 = _409;
    float _415 = _407;
    if (!_411)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _157 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _413 = _423;
        _215 = _435;
    }
    float _437 = _413;
    float _439 = _215;
    float _441 = _437;
    if (!_269)
    {
        float _443 = _131 * _131;
        float _445 = _443 * 0.5;
        _415 = _445;
    }
    float _447 = _415;
    float _449 = _447;
    if (!_269)
    {
        _441 = _131;
    }
    float _451 = _441;
    float _453 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _455 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _457 = _451;
    if (!_269)
    {
        float _459 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _449 = _459;
    }
    float _461 = _449;
    bool _463 = !_269;
    float _465 = _461;
    if (!_463)
    {
        float _467 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _469 = log2(_467);
        float _471 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _473 = _471 + 1.0;
        float _475 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _477 = _131 * _469;
        float _479 = 1.0 / _473;
        float _481 = _475 * 0.693147182464599609375;
        float _483 = exp2(_477);
        float _485 = 1.0 / _481;
        float _487 = _483 + (-1.0);
        float _489 = -_487;
        float _491 = fma(_489, _485, _131);
        float _493 = _491 * _479;
        float _495 = _493 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _465 = _495;
    }
    float _497 = _465;
    bool _499 = !_269;
    if (!_499)
    {
        float _501 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _503 = log2(_501);
        float _505 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _507 = _505 + 1.0;
        float _509 = 1.0 / _507;
        float _511 = _131 * _503;
        float _513 = exp2(_511);
        float _515 = -_513;
        float _517 = _515 + 1.0;
        float _519 = _517 * _509;
        _457 = _519;
    }
    float _521 = _457;
    float _523 = _405 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _525 = fma(_439, _201, _453);
    float _527 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _529 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _531 = fma(_439, _205, _523);
    float _533 = fma(_439, _203, _455);
    float _535 = fma(_521, _203, _527);
    bool _537 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _539 = _497 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _541 = fma(_521, _201, _529);
    float _543 = -_535;
    float _545 = _533 + _543;
    float _547 = fma(_533, _173, _249);
    float _549 = fma(_521, _205, _539);
    float _551 = fma(_525, _173, _247);
    float _553 = -_541;
    float _555 = _525 + _553;
    float _557 = _545 * _161;
    float _559 = _545 * _153;
    float _561 = _545 * _167;
    float _563 = -_549;
    float _565 = _531 + _563;
    float _567 = fma(_555, _159, _557);
    float _569 = fma(_555, _151, _559);
    float _571 = fma(_555, _165, _561);
    float _573 = fma(_531, _173, _251);
    float _575 = fma(_565, _163, _567);
    float _577 = fma(_565, _155, _569);
    float _579 = fma(_565, _169, _571);
    bool _581 = !_537;
    float _583 = _577;
    float _585 = _575;
    float _587 = _579;
    float _605;
    if (!_581)
    {
        float _589 = in.m_60.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_97);
        float _611 = 1.0 / _609;
        float _613 = _131 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _619 = _615 + _617;
    float _621 = in.m_58.x;
    float _623 = in.m_58.y;
    bool _625 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _627 = isnan(_615);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _637;
    bool _641 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _643 = isnan(_615);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_635;
    float _655 = _653 + 1.0;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _657;
    float _661 = 1.0 / _639;
    bool _663 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _665 = _651 * _655;
    float _667 = -_651;
    float _669 = _667 + 1.0;
    float _671 = _619 * _661;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _673;
    float _677 = fma(_659, _671, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _679 = fma(_675, _671, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _681 = _677 * _665;
    float _683 = _679 * _665;
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[143].x, _681);
    float _687 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[143].y, _683);
    float _689 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[144].x, _685);
    float _691 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[144].y, _687);
    float _693 = _689 * _621;
    float _695 = _691 * _623;
    bool _697 = !_663;
    float _715;
    if (!_697)
    {
        float _699 = in.m_60.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        float _719 = float(_97);
        float _721 = 1.0 / _719;
        float _723 = _131 * _721;
        _715 = _723;
    }
    _717 = false;
    float _725 = _715;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _729 = _725 + _727;
    bool _731 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _733 = isnan(_725);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _743;
    bool _747 = _725 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _749 = isnan(_725);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -_741;
    float _761 = _759 + 1.0;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _763;
    float _767 = 1.0 / _745;
    bool _769 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _771 = _757 * _761;
    float _773 = -_757;
    float _775 = _773 + 1.0;
    float _777 = _729 * _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _779;
    float _783 = fma(_765, _777, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _785;
    float _789 = fma(_781, _777, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _791 = _783 * _771;
    float _793 = fma(_787, _777, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _795 = _789 * _771;
    float _797 = _793 * _771;
    float _799 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].x, _791);
    float _801 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].y, _797);
    float _803 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[107].z, _795);
    float _805 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[108].x, _799);
    float _807 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[108].y, _801);
    float _809 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[108].z, _803);
    bool _811 = !_769;
    float _829;
    if (!_811)
    {
        float _813 = in.m_60.x;
        float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _817 = _813 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _819 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _821 = _819 * _815;
        float _823 = floor(_821);
        float _825 = -_823;
        float _827 = _821 + _825;
        _829 = _827;
        _831 = true;
    }
    else
    {
        float _833 = float(_97);
        float _835 = 1.0 / _833;
        float _837 = _131 * _835;
        _829 = _837;
    }
    _831 = false;
    float _839 = _829;
    bool _841 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _843 = isnan(_839);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _857 = _839 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _859 = isnan(_839);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _875 = _839 + _873;
    float _877 = -_851;
    float _879 = _877 + 1.0;
    bool _881 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _883 = 1.0 / _855;
    float _885 = _867 * _879;
    float _887 = -_867;
    float _889 = _887 + 1.0;
    float _891 = _871 * _883;
    float _893 = _807 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _895 = fma(_891, _875, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _897 = _805 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _899 = _895 * _885;
    float _901 = _809 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[115].x, _899);
    float _905 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _909 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _911 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[116].x, _903);
    float _913 = _911 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _915 = !_881;
    float _917 = _905;
    float _941;
    float _943;
    float _945;
    if (!_915)
    {
        float _919 = in.m_60.x;
        float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _923 = float(_97);
        float _925 = 1.0 / _923;
        float _927 = _919 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _929 = _131 * _925;
        float _931 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _933 = _931 * _921;
        float _935 = floor(_933);
        float _937 = -_935;
        float _939 = _933 + _937;
        _941 = _923;
        _943 = _929;
        _945 = _939;
        _947 = true;
    }
    else
    {
        float _949 = float(_97);
        float _951 = 1.0 / _949;
        float _953 = _131 * _951;
        _941 = _949;
        _943 = _953;
        _945 = _953;
    }
    _947 = false;
    float _955 = _941;
    float _957 = _943;
    float _959 = _945;
    float _961 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _963 = int(_961);
    float _965 = _547 * _153;
    float _967 = _547 * _167;
    float _969 = in.m_51.w;
    float _971 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _973 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _975 = int(_973);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _979 = _977 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _981 = float(_963);
    float _983 = 1.0 / _979;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _989 = float(uint(_975));
    float _991 = 1.0 / _981;
    int _993 = ~_975;
    int _995 = _993 + 1;
    float _997 = float(_975);
    float _999 = 1.0 / _989;
    float _1001 = _131 * _991;
    int _1003 = ~_975;
    int _1005 = _1003 + 1;
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1009 = as_type<int>(_999) + (-2);
    float _1011 = trunc(_1001);
    int _1013 = int(_1011);
    float _1015 = float(uint(_1013));
    float _1017 = as_type<float>(_1009) * _1015;
    float _1019 = in.m_60.x;
    float _1021 = in.m_60.y;
    float _1023 = in.m_60.z;
    float _1025 = in.m_60.w;
    float _1027 = trunc(_1017);
    float _1029 = precise::max(_1027, 0.0);
    uint _1032 = uint(_1029);
    float _1034 = float(_1013);
    bool _1036 = _1034 >= _997;
    bool _1038 = isnan(_1034);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(_997);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    int _1048 = _1005 * int(_1032);
    int _1050 = _1048 + _1013;
    float _1052 = trunc(_1046);
    int _1054 = int(_1052);
    float _1056 = float(uint(_1050));
    float _1058 = as_type<float>(_1009) * _1056;
    float _1060 = _1021 * 1.2345600128173828125;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1064 = _1062 != 0;
    float _1066 = trunc(_1058);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    bool _1072 = !_1064;
    float _1074 = _1072 ? _1060 : _1019;
    float _1076 = floor(_1074);
    int _1078 = int(_1032) + int(_1070);
    int _1080 = _995 * _1078;
    int _1082 = _1080 + _1013;
    float _1084 = -_1076;
    float _1086 = _1074 + _1084;
    float _1088 = 1.0 / _955;
    bool _1090 = uint(_1082) >= uint(_975);
    bool _1092 = !_1090;
    int _1094 = _1092 ? 0 : (-1);
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1098 = _1096 != 0;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1110 = _1108 != 0;
    int _1112 = ~_1078;
    int _1114 = _1112 + _1094;
    int _1116 = _1114 + 1;
    float _1118 = _1086 * _997;
    bool _1120 = _975 == 0;
    float _1122 = _131 * _997;
    int _1124 = ~_1054;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    int _1130 = _975 * _1116;
    int _1132 = _1130 + _1013;
    bool _1134 = !_1102;
    int _1136 = _1134 ? 0 : 1;
    float _1138 = _1122 * _1088;
    float _1140 = trunc(_1118);
    int _1142 = int(_1140);
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1146 = _1144 != 0;
    bool _1148 = !_1120;
    int _1150 = _1148 ? _1132 : (-1);
    int _1152 = _975 + (-1);
    bool _1154 = !_1146;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1150 * _1128;
    float _1160 = trunc(_1138);
    int _1162 = int(_1160);
    int _1164 = abs(_1136);
    int _1166 = _1054 * _1152;
    int _1168 = _1166 + _1158;
    bool _1170 = !_1098;
    int _1172 = _1170 ? 0 : 1;
    int _1174 = abs(_1156);
    bool _1176 = !_1106;
    int _1178 = _1176 ? 0 : 1;
    int _1180 = abs(_1172);
    int _1182 = _1142 * _1174;
    int _1184 = _1182 + _1013;
    bool _1186 = !_1110;
    int _1188 = _1186 ? 0 : 1;
    int _1190 = abs(_1178);
    int _1192 = _1168 * _1164;
    float _1194 = fma(_551, _165, _967);
    int _1196 = abs(_1188);
    int _1198 = _1162 * _1180;
    int _1200 = _1198 + _1192;
    int _1202 = ~_975;
    int _1204 = _1202 + 1;
    float _1206 = fma(_573, _169, _1194);
    int _1208 = _1184 * _1190;
    int _1210 = _1208 + _1200;
    float _1212 = float(uint(_1184));
    float _1214 = _967;
    if (!_1064)
    {
        _1214 = _1023;
    }
    float _1216 = _1214;
    int _1218 = _1142 * _1196;
    int _1220 = _1218 + _1210;
    int _1222 = ~_975;
    int _1224 = _1222 + 1;
    float _1226 = as_type<float>(_1009) * _1212;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1230 = _1216;
    if (_1064)
    {
        _1230 = _1021;
    }
    float _1232 = _1230;
    float _1234 = float(uint(_1220));
    float _1236 = trunc(_1226);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    float _1242 = as_type<float>(_1009) * _1234;
    float _1244 = trunc(_1242);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1254 = 1.0 / _1252;
    int _1256 = _1204 * int(_1248);
    int _1258 = _1256 + _1220;
    int _1260 = _1204 * int(_1240);
    int _1262 = _1260 + _1184;
    float _1264 = float(uint(_1258));
    float _1266 = float(uint(_1262));
    float _1268 = as_type<float>(_1009) * _1264;
    float _1270 = as_type<float>(_1009) * _1266;
    float _1272 = trunc(_1268);
    float _1274 = precise::max(_1272, 0.0);
    uint _1276 = uint(_1274);
    int _1278 = int(_1248) + int(_1276);
    float _1280 = trunc(_1270);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    int _1286 = _1224 * _1278;
    int _1288 = _1286 + _1220;
    bool _1290 = uint(_1288) >= uint(_975);
    bool _1292 = !_1290;
    int _1294 = _1292 ? 0 : (-1);
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1300 = ~_1278;
    int _1302 = _1300 + _1294;
    int _1304 = _1302 + 1;
    int _1306 = int(_1240) + int(_1284);
    int _1308 = _975 * _1304;
    int _1310 = _1308 + _1220;
    float _1312 = 1.0 / _1298;
    int _1314 = _1224 * _1306;
    int _1316 = _1314 + _1184;
    float _1318 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1320 = !_1120;
    int _1322 = _1320 ? _1310 : (-1);
    float _1324 = _547 * _161;
    bool _1326 = uint(_1316) >= uint(_975);
    int _1328 = _1322 & 3;
    bool _1330 = _1328 != 0;
    float _1332 = fma(_551, _159, _1324);
    bool _1334 = !_1326;
    int _1336 = _1334 ? 0 : (-1);
    bool _1338 = uint(_1328) > 1u;
    float _1340 = fma(_573, _163, _1332);
    int _1342 = _1322 & 3;
    bool _1344 = _1342 != 0;
    float _1346 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1228);
    int _1348 = ~_1306;
    int _1350 = _1348 + _1336;
    int _1352 = _1350 + 1;
    float _1354 = fma(_551, _151, _965);
    int _1356 = _1344 ? 0 : 1;
    float _1358 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1346);
    bool _1360 = _1328 != 3;
    int _1362 = _975 * _1352;
    int _1364 = _1362 + _1184;
    int _1366 = ~_1356;
    int _1368 = _1366 + 1;
    int _1370 = _1368 + 1;
    float _1372 = fma(_573, _155, _1354);
    bool _1374 = uint(_1328) >= 2u;
    int _1376 = _1370;
    float _1378 = as_type<float>(_1328);
    if (!_1338)
    {
        int _1380 = ~_1356;
        int _1382 = _1380 + 1;
        _1376 = _1382;
    }
    int _1384 = _1376;
    bool _1386 = !_1330;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1392 = _1390 != 0;
    bool _1394 = _1021 > 0.5;
    bool _1396 = _1394 && _1392;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1400 = _1398 != 0;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1404 = -_343;
    float _1406 = _1396 ? _1404 : _343;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1410 = _1408 != 0;
    float _1412 = -_1402;
    float _1414 = fma(_1318, 2.0, _1412);
    float _1416 = _1374 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1418 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1420 = _1328 != 3;
    float _1422 = -_131;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1414);
    bool _1426 = _1019 > 0.5;
    bool _1428 = _1426 && _1400;
    bool _1430 = _1021 > 0.5;
    bool _1432 = _1430 && _1410;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _1438 = ~as_type<int>(_1416);
    int _1440 = _1438 + 1;
    int _1442 = _1440 + 1;
    int _1444 = _1442;
    float _1446 = _1416;
    if (_1360)
    {
        int _1448 = ~as_type<int>(_1416);
        int _1450 = _1448 + 1;
        _1444 = _1450;
    }
    int _1452 = _1444;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (!_1064)
    {
        _1446 = _1021;
    }
    float _1456 = _1446;
    float _1458 = 1.0 / _1436;
    float _1460 = _1456;
    if (!_1064)
    {
        _1378 = _1023;
    }
    float _1462 = _1378;
    float _1464 = fma(_1418, -2.0, _1454);
    bool _1466 = !_1420;
    int _1468 = _1466 ? 0 : (-1);
    float _1470 = in.m_53.w;
    bool _1472 = !_1120;
    int _1474 = _1472 ? _1364 : (-1);
    float _1476 = -_323;
    float _1478 = _1428 ? _1476 : _323;
    float _1480 = _1462;
    if (_1064)
    {
        _1460 = _1019;
    }
    float _1482 = _1460;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    if (_1064)
    {
        _1480 = _1021;
    }
    float _1488 = _1480;
    float _1490 = -_323;
    float _1492 = _1432 ? _1490 : _323;
    float _1494 = 1.0 / _1486;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1498 = _1496 != 0;
    float _1500 = _1492 + 0.5;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1504 = _1502 != 0;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1508 = _1506 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1512 = _1510 != 0;
    float _1514 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1518 = _1516 != 0;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1522 = _1520 != 0;
    float _1524 = 1.0 / _1508;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1528 = _1526 != 0;
    float _1530 = _1514 * _1007;
    bool _1532 = _1023 > 0.5;
    bool _1534 = _1532 && _1504;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1538 = _1023 > 0.5;
    bool _1540 = _1538 && _1528;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1546 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1536);
    float _1548 = 1.0 / _1544;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1554;
    bool _1558 = _1025 > 0.5;
    bool _1560 = _1558 && _1512;
    float _1562 = 0.0;
    bool _1564 = _1540;
    bool _1566 = _1498;
    if (_1518)
    {
        float _1568 = in.m_60.w;
        _1562 = _1568;
    }
    float _1570 = _1562;
    float _1572 = _1552 * _1458;
    float _1574 = _1556 * _1312;
    float _1576 = in.m_49.w;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _1586 = abs(_1452);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1596 = _1580 * _1254;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1598;
    float _1602 = 1.0 / _1584;
    float _1604 = _1590 * _1524;
    float _1606 = _1594 * _1494;
    float _1608 = _1340 + _969;
    float _1610 = _1206 + _1470;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1620 = _1600 * _1548;
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1626 = _957 + _1624;
    float _1628 = _1618 * _983;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1632 = _957 + _1630;
    float _1634 = fma(_1606, _1626, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1638 = _957 + _1636;
    float _1640 = fma(_1596, _1632, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1642 = _1614 * _1602;
    float _1644 = _1372 + _1576;
    float _1646 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1650 = _957 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1654 = _957 + _1652;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1660 = _957 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1664 = _959 + _1662;
    float _1666 = fma(_1572, _1650, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1668 = fma(_1604, _1654, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1672 = _957 + _1670;
    float _1674 = fma(_1620, _1638, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1676 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1656);
    float _1678 = fma(_1642, _1660, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1680 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1682 = isnan(_957);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    float _1692 = _1622 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1694 = _1478 + 0.5;
    float _1696 = fma(_1574, _1664, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1698 = fma(_1628, _1672, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1700 = _1646 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1702 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1464);
    float _1704 = _1406 + (-0.5);
    float _1706 = fma(_1692, _1694, _1424);
    bool _1708 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1710 = isnan(_957);
    bool _1712 = _1708 || _1710;
    bool _1714 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1716 = _1712 || _1714;
    float _1718 = float(_1716);
    float _1720 = -_1690;
    float _1722 = _1720 + 1.0;
    float _1724 = -_1700;
    float _1726 = -_1702;
    float _1728 = fma(_1724, _1704, _1726);
    bool _1730 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1732 = isnan(_957);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = 0.0;
    float _1744 = _1678;
    float _1746 = _1610;
    if (_1522)
    {
        float _1748 = in.m_60.x;
        _1742 = _1748;
    }
    float _1750 = _1742;
    int _1752 = _1322 >> 31;
    float _1754 = _1718 * _1722;
    bool _1756 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1758 = isnan(_957);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    float _1768 = -_1718;
    float _1770 = _1768 + 1.0;
    int _1772 = _1752 & 3;
    float _1774 = -_1740;
    float _1776 = _1774 + 1.0;
    bool _1778 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1780 = isnan(_957);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = -_1766;
    float _1792 = _1790 + 1.0;
    float _1794 = _1740 * _1770;
    int _1796 = _1322 + _1772;
    float _1798 = _1766 * _1776;
    bool _1800 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1802 = isnan(_959);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1808 = _1804 || _1806;
    float _1810 = float(_1808);
    float _1812 = _1788 * _1792;
    bool _1814 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1816 = isnan(_959);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1822 = _1818 || _1820;
    float _1824 = float(_1822);
    float _1826 = -_1788;
    float _1828 = _1826 + 1.0;
    bool _1830 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1832 = isnan(_957);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    float _1842 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1546);
    bool _1844 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1846 = isnan(_957);
    bool _1848 = _1844 || _1846;
    bool _1850 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1852 = _1848 || _1850;
    float _1854 = float(_1852);
    float _1856 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1676);
    bool _1858 = _957 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1860 = isnan(_957);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = _1840 * _1828;
    float _1872 = -_1840;
    float _1874 = _1872 + 1.0;
    float _1876 = _1840;
    float _1878 = _1868;
    if (_1518)
    {
        float _1880 = _1570 * 3.1415927410125732421875;
        _1876 = _1880;
    }
    float _1882 = _1876;
    int _1884 = _1796 >> 2;
    float _1886 = -_1868;
    float _1888 = _1886 + 1.0;
    float _1890 = _1868 * _1874;
    float _1892 = _1888;
    if (_1518)
    {
        float _1894 = _1882 * 0.15915493667125701904296875;
        _1878 = _1894;
    }
    float _1896 = _1878;
    float _1898 = -_1824;
    float _1900 = _1898 + 1.0;
    float _1902 = 0.0;
    if (_1522)
    {
        float _1904 = _1750 * 3.1415927410125732421875;
        _1902 = _1904;
    }
    float _1906 = _1902;
    int _1908 = _1884 << 4;
    int _1910 = _1908 + 512;
    float _1912 = _1854 * _1888;
    float _1914 = _1810 * _1900;
    float _1916 = _1896;
    if (_1518)
    {
        float _1918 = _1896 * 6.283185482025146484375;
        float _1920 = sin(_1918);
        _1916 = _1920;
    }
    float _1922 = _1916;
    float _1924 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[83].z, _985);
    float _1926 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    uint _1928 = uint(int(uint(_1910) >> uint(2)));
    uint _1930 = uint(int(uint(int(_1928)) >> uint(2)));
    int _1932 = int(_1928) & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    int _1936 = int(_1928) + 1;
    uint _1938 = uint(int(uint(_1936) >> uint(2)));
    int _1940 = _1936 & 3;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[int(_1938)][_1940];
    float _1944 = _1696 * _1914;
    float _1946 = -_987;
    float _1948 = fma(_1926, 2.0, _1946);
    float _1950 = _1666 * _1912;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1954 = -_1810;
    float _1956 = _1954 + 1.0;
    float _1958 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1960 = -_1854;
    float _1962 = _1960 + 1.0;
    if (_1522)
    {
        float _1964 = _1906 * 0.15915493667125701904296875;
        _1892 = _1964;
    }
    float _1966 = _1892;
    float _1968 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1944);
    float _1970 = fma(_1958, -2.0, _1952);
    float _1972 = -_343;
    float _1974 = _1540 ? _1972 : _343;
    float _1976 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1950);
    if (_1518)
    {
        bool _1978 = _1922 > 0.5;
        _1564 = _1978;
    }
    bool _1980 = _1564;
    float _1982 = _1966;
    if (_1522)
    {
        float _1984 = _1966 * 6.283185482025146484375;
        float _1986 = sin(_1984);
        _1982 = _1986;
    }
    float _1988 = _1982;
    int _1990 = _1910 + 8;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    float _2008 = -_1974;
    float _2010 = _2008 + 0.5;
    bool _2012 = !_1498;
    int _2014 = _2012 ? 0 : 1;
    float _2016 = fma(_1640, _1890, _1976);
    float _2018 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2020 = _1644 + _2018;
    float _2022 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2024 = -_1608;
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2030 = abs(_1384);
    float _2032 = _2020 * _2020;
    int _2034 = abs(_1388);
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2038 = _1610 + _2036;
    int _2040 = abs(_1468);
    float _2042 = fma(_1668, _1870, _2016);
    int _2044 = ~_2034;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    float _2050 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2052 = int(_2050);
    if (_1522)
    {
        bool _2054 = _1988 > 0.5;
        _1566 = _2054;
    }
    bool _2056 = _1566;
    float _2058 = -_1644;
    float _2060 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _2062 = abs(_2014);
    float _2064 = fma(_1634, _1812, _2042);
    int _2066 = ~_2040;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    float _2072 = _2060 * _2060;
    float _2074 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1968);
    float _2076 = _2022 * _2028;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2080 = _1608 + _2078;
    float _2082 = fma(_2026, _2026, _2072);
    int _2084 = ~_2030;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    float _2090 = fma(_1674, _1798, _2064);
    float _2092 = fma(_2080, _2080, _2032);
    float _2094 = -_1610;
    float _2096 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    out.m_62.x = _1530;
    out.m_62.y = _2076;
    int _2098 = ~_2052;
    int _2100 = _2098 + 1;
    float _2102 = fma(_2038, _2038, _2092);
    int _2104 = _2088 * as_type<int>(_1942);
    float _2106 = fma(_2096, _2096, _2082);
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2110 = -_1856;
    float _2112 = _2110 + 1.0;
    int _2114 = _2048 * as_type<int>(_1934);
    int _2116 = _2114 + _2104;
    float _2118 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1924);
    float _2120 = float(uint(_2052));
    int _2122 = ~_1586;
    int _2124 = _2122 + 1;
    int _2126 = _2124 + 1;
    float _2128 = rsqrt(_2102);
    int _2130 = abs(_2052);
    float _2132 = -_2118;
    float _2134 = _2132 + 1.0;
    int _2136 = _2126 * as_type<int>(_1998);
    int _2138 = _2136 + _2116;
    float _2140 = float(uint(_2130));
    float _2142 = 1.0 / _2120;
    int _2144 = _2070 * as_type<int>(_2006);
    int _2146 = _2144 + _2138;
    int _2148 = ~_2062;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = _2146 * _2152;
    float _2156 = rsqrt(_2106);
    float _2158 = _2020 * _2128;
    float _2160 = _2080 * _2128;
    int _2162 = _1474 * _2062;
    int _2164 = _2162 + _2154;
    float _2166 = _2038 * _2128;
    float _2168 = -_2158;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2020);
    float _2172 = -_2160;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2176 = 1.0 / _2140;
    int _2178 = as_type<int>(_2142) + (-2);
    float _2180 = _2170 * _2170;
    float _2182 = float(uint(_2164));
    float _2184 = -_2166;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2188 = fma(_2174, _2174, _2180);
    float _2190 = _2026 * _2156;
    int _2192 = abs(_2164);
    float _2194 = _2060 * _2156;
    float _2196 = _2096 * _2156;
    float _2198 = fma(_1698, _1794, _2090);
    float _2200 = fma(_2186, _2186, _2188);
    float _2202 = _2194 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _2206 = as_type<int>(_2176) + (-2);
    float _2208 = fma(_1678, _1754, _2198);
    float _2210 = as_type<float>(_2178) * _2182;
    float _2212 = _2190 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2214 = -_2204;
    float _2216 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2214);
    float _2218 = float(uint(_2192));
    float _2220 = -_2202;
    float _2222 = fma(_2196, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2220);
    float _2224 = _2212;
    if (!_1518)
    {
        _1744 = _323;
    }
    float _2226 = _1744;
    float _2228 = trunc(_2210);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    float _2234 = _2226;
    if (_1518)
    {
        float _2236 = -_323;
        float _2238 = _1980 ? _2236 : _323;
        _2234 = _2238;
    }
    float _2240 = _2234;
    float _2242 = -_2212;
    float _2244 = fma(_2194, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2242);
    float _2246 = as_type<float>(_2206) * _2218;
    if (!_1522)
    {
        _2224 = _343;
    }
    float _2248 = _2224;
    float _2250 = _2216 * _2216;
    float _2252 = _2248;
    if (_1522)
    {
        float _2254 = -_343;
        float _2256 = _2056 ? _2254 : _343;
        _2252 = _2256;
    }
    float _2258 = _2252;
    float _2260 = _2240 + 0.5;
    float _2262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2264 = fma(_2222, _2222, _2250);
    int _2266 = ~_2130;
    int _2268 = _2266 + 1;
    float _2270 = -_2258;
    float _2272 = _2270 + 0.5;
    float _2274 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2276 = fma(_2244, _2244, _2264);
    float _2278 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2208);
    float _2280 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2282 = trunc(_2246);
    float _2284 = precise::max(_2282, 0.0);
    uint _2286 = uint(_2284);
    int _2288 = _2100 * int(_2232);
    int _2290 = _2288 + _2164;
    float _2292 = _2274 * _2108;
    float _2294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _323);
    out.m_64.x = _2278;
    float _2296 = sqrt(_2200);
    float _2298 = _2280 * _2262;
    float _2300 = float(uint(_2290));
    out.m_66.x = _2292;
    out.m_66.y = _2298;
    float _2302 = as_type<float>(_2178) * _2300;
    float _2304 = rsqrt(_2276);
    int _2306 = _2268 * int(_2286);
    int _2308 = _2306 + _2192;
    float _2310 = float(uint(_2308));
    float _2312 = _2128 * _2296;
    float _2314 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2316 = trunc(_2302);
    float _2318 = precise::max(_2316, 0.0);
    uint _2320 = uint(_2318);
    float _2322 = as_type<float>(_2206) * _2310;
    float _2324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _343);
    float _2326 = _2314 * _2312;
    float _2328 = _971 * _2312;
    float _2330 = _2222 * _2304;
    float _2332 = _2216 * _2304;
    float _2334 = _2244 * _2304;
    float _2336 = trunc(_2322);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    float _2342 = _2330 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2344 = _2326 * _2294;
    float _2346 = _2334 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2348 = _2332 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2350 = -_2342;
    float _2352 = fma(_2334, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2350);
    float _2354 = _2328 * _2324;
    float _2356 = -_2346;
    float _2358 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2356);
    float _2360 = -_2348;
    float _2362 = fma(_2330, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2360);
    float _2364 = _2352 * _2352;
    int _2366 = int(_2232) + int(_2320);
    float _2368 = _2354 * _335;
    int _2370 = ~_2130;
    int _2372 = _2370 + 1;
    float _2374 = fma(_2358, _2358, _2364);
    int _2376 = ~_2052;
    int _2378 = _2376 + 1;
    float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2382 = int(_2286) + int(_2340);
    float _2384 = fma(_2362, _2362, _2374);
    float _2386 = _2354 * _331;
    int _2388 = _2378 * _2366;
    int _2390 = _2388 + _2164;
    float _2392 = _2354 * _339;
    float _2394 = fma(_2344, _303, _2368);
    int _2396 = _2372 * _2382;
    int _2398 = _2396 + _2192;
    float _2400 = rsqrt(_2384);
    bool _2402 = uint(_2390) >= uint(_2052);
    float _2404 = fma(_2344, _299, _2386);
    float _2406 = fma(_2344, _307, _2392);
    bool _2408 = uint(_2398) >= uint(_2130);
    int _2410 = _2164 ^ _2052;
    float _2412 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2414 = !_2408;
    int _2416 = _2414 ? 0 : (-1);
    float _2418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2420 = uint(int(uint(_2410) >> uint(31)));
    bool _2422 = !_2402;
    int _2424 = _2422 ? 0 : (-1);
    int _2426 = ~_2416;
    int _2428 = _2382 + _2426;
    int _2430 = _2428 + 1;
    int _2432 = ~int(_2420);
    int _2434 = _2432 + 1;
    float _2436 = _2352 * _2400;
    int _2438 = ~_2366;
    int _2440 = _2438 + _2424;
    int _2442 = _2440 + 1;
    float _2444 = _2362 * _2400;
    int _2446 = _2430 ^ _2434;
    bool _2448 = _2052 == 0;
    int _2450 = _2052 * _2442;
    int _2452 = _2450 + _2164;
    float _2454 = _2358 * _2400;
    int _2456 = ~_2434;
    int _2458 = _2456 + _2446;
    int _2460 = _2458 + 1;
    float _2462 = _2418 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2464 = _2052 == 0;
    bool _2466 = !_2448;
    int _2468 = _2466 ? _2460 : (-1);
    bool _2470 = !_2464;
    int _2472 = _2470 ? _2452 : (-1);
    float _2474 = float(_2468);
    float _2476 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1970);
    float _2478 = -_323;
    float _2480 = _1534 ? _2478 : _323;
    float _2482 = -_131;
    float _2484 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1948);
    float _2486 = float(_2472);
    float _2488 = -_2476;
    float _2490 = fma(_2462, _2474, _2488);
    float _2492 = -_343;
    float _2494 = _1560 ? _2492 : _343;
    float _2496 = _2480 + 0.5;
    float _2498 = fma(_2412, _2486, _2484);
    float _2500 = -_1358;
    float _2502 = _2500 + 1.0;
    float _2504 = _2494 + (-0.5);
    float _2506 = fma(_2412, _2496, _2498);
    float _2508 = -_2502;
    float _2510 = fma(_1478, _2508, _1706);
    float _2512 = -_1842;
    float _2514 = _2512 + 1.0;
    float _2516 = _2436 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2518 = -_2462;
    float _2520 = fma(_2518, _2504, _2490);
    float _2522 = -_2134;
    float _2524 = fma(_2480, _2522, _2506);
    float _2526 = fma(_1406, _2514, _1728);
    float _2528 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2516);
    float _2530 = fma(_2494, _2112, _2520);
    float _2532 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2534 = _2532 * 0.5;
    float _2536 = fma(_2444, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2528);
    float _2538 = fma(_2534, _371, _2406);
    float _2540 = abs(_2536);
    float _2542 = -_2540;
    float _2544 = _2542 + 1.0;
    float _2546 = fma(_2534, _363, _2404);
    float _2548 = fma(_2534, _367, _2394);
    float _2550 = abs(_2536);
    float _2552 = fma(_2550, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2554 = as_type<int>(_2544) + (-218103808);
    out.m_68.x = _2510;
    out.m_68.y = _2526;
    out.m_68.z = _2524;
    out.m_68.w = _2530;
    float _2556 = abs(_2536);
    float _2558 = fma(_2556, _2552, -0.212114393711090087890625);
    bool _2560 = uint(_2554) >= 1920991232u;
    float _2562 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2564 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2566 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2568 = abs(_2536);
    float _2570 = fma(_2568, _2558, 1.570728778839111328125);
    bool _2572 = _2536 < 0.0;
    float _2574 = float(_2572);
    float _2576 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2578 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2580 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2582 = _2074 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2584 = !_2560;
    float _2586 = _2548;
    float _2588 = _2580;
    float _2590 = _2582;
    float _2610;
    if (!_2584)
    {
        int _2592 = as_type<int>(_2566);
        int _2594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[123].z);
        int _2596 = as_type<int>(_2544);
        int _2598 = 12848;
        int _2600;
        int _2602;
        int _2604;
        int _2606;
        int _2608;
        _89(_2592, _2594, _2596, _2598, _2600, _2602, _2604, _2606, _2608, out.gl_Position, out.gl_PointSize);
        _2610 = as_type<float>(_2604);
        _2612 = true;
    }
    else
    {
        float _2614 = rsqrt(_2544);
        float _2616 = _2544 * _2614;
        float _2618 = _2614 * 0.5;
        float _2620 = -_2616;
        float _2622 = 0.0 + _2620;
        float _2624 = fma(_2618, _2622, 0.5);
        float _2626 = fma(_2616, _2624, _2616);
        float _2628 = -_2626;
        float _2630 = 0.0 + _2628;
        float _2632 = fma(_2626, _2630, _2544);
        float _2634 = fma(_2618, _2632, _2626);
        _2610 = _2634;
    }
    _2612 = false;
    float _2636 = _2610;
    float _2638 = _2444 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2640 = _2436 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2642 = _2570 * _2636;
    float _2644 = -_2638;
    float _2646 = fma(_2454, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2644);
    float _2648 = _2454 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2650 = -_2640;
    float _2652 = fma(_2444, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2650);
    float _2654 = _2646 * _2646;
    float _2656 = -_2648;
    float _2658 = fma(_2436, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2656);
    float _2660 = fma(_2652, _2652, _2654);
    float _2662 = fma(_2658, _2658, _2660);
    float _2664 = _2574 * 2.0;
    float _2666 = -_2664;
    float _2668 = fma(_2642, _2666, _2642);
    float _2670 = rsqrt(_2662);
    float _2672 = fma(_2574, 3.1415927410125732421875, _2668);
    float _2674 = _2672 * 0.15915493667125701904296875;
    float _2676 = _2674 * 6.283185482025146484375;
    float _2678 = cos(_2676);
    float _2680 = _2646 * _2670;
    float _2682 = _2652 * _2670;
    float _2684 = _2658 * _2670;
    float _2686 = _2680 * _2680;
    float _2688 = _2674 * 6.283185482025146484375;
    float _2690 = sin(_2688);
    float _2692 = fma(_2682, _2682, _2686);
    float _2694 = -_2678;
    float _2696 = _2694 + 1.0;
    float _2698 = fma(_2684, _2684, _2692);
    float _2700 = rsqrt(_2698);
    float _2702 = _2682 * _2700;
    float _2704 = _2680 * _2700;
    float _2706 = _2684 * _2700;
    float _2708 = _2702 * _2690;
    float _2710 = _2704 * _2696;
    float _2712 = _2706 * _2690;
    float _2714 = _2702 * _2696;
    float _2716 = _2704 * _2690;
    float _2718 = fma(_2706, _2710, _2708);
    float _2720 = _2706 * _2706;
    float _2722 = -_2712;
    float _2724 = fma(_2704, _2714, _2722);
    float _2726 = -_2716;
    float _2728 = fma(_2706, _2714, _2726);
    float _2730 = _2548 * _2718;
    float _2732 = fma(_2702, _2714, _2678);
    float _2734 = _2548 * _2724;
    float _2736 = fma(_2696, _2720, _2678);
    float _2738 = fma(_2546, _2728, _2730);
    float _2740 = fma(_2706, _2714, _2716);
    float _2742 = fma(_2546, _2732, _2734);
    float _2744 = fma(_2704, _2714, _2712);
    float _2746 = fma(_2538, _2736, _2738);
    float _2748 = -_2708;
    float _2750 = fma(_2706, _2710, _2748);
    float _2752 = fma(_2538, _2740, _2742);
    float _2754 = _1610 + _2746;
    float _2756 = _1608 + _2752;
    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2760 = _2754 + _2758;
    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2764 = _2756 + _2762;
    float _2766 = _2760 * _2760;
    float _2768 = fma(_2764, _2764, _2766);
    float _2770 = fma(_2704, _2710, _2678);
    float _2772 = sqrt(_2768);
    float _2774 = _2548 * _2770;
    float _2776 = fma(_2546, _2744, _2774);
    float _2778 = fma(_2538, _2750, _2776);
    float _2780 = _1644 + _2778;
    bool _2782 = _2772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2784 = _2712;
    float _2786 = _2704;
    float _2788 = _2710;
    if (!_2782)
    {
        _2784 = _2756;
    }
    float _2790 = _2784;
    float _2792 = _2790;
    if (!_2782)
    {
        _2586 = _2754;
    }
    float _2794 = _2586;
    float _2796 = _2794;
    if (!_2782)
    {
        _2786 = _2780;
    }
    float _2798 = _2786;
    bool _2800 = !_2782;
    float _2802 = _2798;
    if (!_2800)
    {
        float _2804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2808 = _2772 + _2806;
        float _2810 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2812 = rsqrt(_2768);
        float _2814 = _2808 * _2804;
        float _2816 = _2814 * 0.15915493667125701904296875;
        float _2818 = _2816 * 6.283185482025146484375;
        float _2820 = cos(_2818);
        float _2822 = _2816 * 6.283185482025146484375;
        float _2824 = sin(_2822);
        float _2826 = _2820 + (-1.0);
        float _2828 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2830 = fma(_2824, _2810, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2832 = fma(_2780, _2820, _2828);
        float _2834 = _2812 * _2830;
        float _2836 = fma(_2764, _2834, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2838 = fma(_2760, _2834, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2802 = _2832;
        _2792 = _2836;
        _2796 = _2838;
    }
    float _2840 = _2802;
    float _2842 = _2792;
    float _2844 = _2796;
    float _2846 = -_1644;
    float _2848 = _2846 + _2840;
    float _2850 = -_1608;
    float _2852 = _2850 + _2842;
    float _2854 = -_1610;
    float _2856 = _2854 + _2844;
    out.m_70.x = _905;
    out.m_70.y = _907;
    out.m_70.z = _909;
    out.m_70.w = _913;
    float _2858 = _2848 * _2848;
    out.m_72.x = _2576;
    out.m_72.y = _2578;
    out.m_72.z = _2580;
    out.m_72.w = _2582;
    float _2860 = fma(_2852, _2852, _2858);
    float _2862 = fma(_2856, _2856, _2860);
    float _2864 = sqrt(_2862);
    bool _2866 = _2864 > 0.0;
    bool _2868 = !_2866;
    float _2870 = _2842;
    float _2872 = _2840;
    float _2874 = _2844;
    if (!_2868)
    {
        bool _2876 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2878 = _907;
        if (_2876)
        {
            float _2880 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2878 = _2880;
        }
        float _2882 = _2878;
        if (_2876)
        {
            float _2884 = _575 * _2882;
            _2588 = _2884;
        }
        float _2886 = _2588;
        float _2888 = _2886;
        if (_2876)
        {
            float _2890 = _577 * _2882;
            _2788 = _2890;
        }
        float _2892 = _2788;
        float _2894 = _2892;
        if (_2876)
        {
            float _2896 = _579 * _2882;
            _917 = _2896;
        }
        float _2898 = _917;
        float _2900 = _2898;
        if (!_2876)
        {
            float _2902 = in.m_47.x;
            float _2904 = in.m_47.y;
            float _2906 = in.m_47.z;
            float _2908 = _131 + 1.0;
            float _2910 = in.m_51.x;
            float _2912 = in.m_51.y;
            float _2914 = in.m_51.z;
            float _2916 = _2908;
            if (!_269)
            {
                float _2918 = _2908 * _2908;
                float _2920 = _2918 * 0.5;
                _2590 = _2920;
            }
            float _2922 = _2590;
            float _2924 = in.m_49.x;
            float _2926 = in.m_49.y;
            float _2928 = in.m_49.z;
            float _2930 = _2922;
            if (!_269)
            {
                float _2932 = _2922 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2930 = _2932;
            }
            float _2934 = _2930;
            float _2936 = in.m_53.x;
            float _2938 = in.m_53.y;
            float _2940 = in.m_53.z;
            bool _2942 = !_269;
            float _2944 = _2934;
            if (!_2942)
            {
                float _2946 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2948 = log2(_2946);
                float _2950 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2952 = _2948 * _2908;
                float _2954 = exp2(_2952);
                float _2956 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2958 = _2956 + 1.0;
                float _2960 = _2950 * 0.693147182464599609375;
                float _2962 = 1.0 / _2960;
                float _2964 = 1.0 / _2958;
                float _2966 = _2954 + (-1.0);
                float _2968 = -_2966;
                float _2970 = fma(_2968, _2962, _2908);
                float _2972 = _2970 * _2964;
                float _2974 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2944 = _2974;
            }
            float _2976 = _2944;
            float _2978 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2980 = !_269;
            if (!_2980)
            {
                float _2982 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2984 = log2(_2982);
                float _2986 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2988 = _2986 + 1.0;
                float _2990 = 1.0 / _2988;
                float _2992 = _2984 * _2908;
                float _2994 = exp2(_2992);
                float _2996 = -_2994;
                float _2998 = _2996 + 1.0;
                float _3000 = _2998 * _2990;
                _2916 = _3000;
            }
            float _3002 = _2916;
            float _3004 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3006 = fma(_3002, _2904, _2978);
            float _3008 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3010 = fma(_3002, _2902, _3004);
            float _3012 = -_535;
            float _3014 = _3012 + _3006;
            float _3016 = fma(_3002, _2906, _3008);
            float _3018 = -_541;
            float _3020 = _3018 + _3010;
            float _3022 = _3014 * _2912;
            float _3024 = _3014 * _2926;
            float _3026 = _3014 * _2938;
            float _3028 = -_549;
            float _3030 = _3028 + _3016;
            float _3032 = fma(_3020, _2910, _3022);
            float _3034 = fma(_3020, _2924, _3024);
            float _3036 = fma(_3020, _2936, _3026);
            float _3038 = fma(_3030, _2914, _3032);
            float _3040 = fma(_3030, _2928, _3034);
            float _3042 = fma(_3030, _2940, _3036);
            _583 = _3040;
            _585 = _3038;
            _587 = _3042;
            _2888 = _3038;
            _2894 = _3040;
            _2900 = _3042;
        }
        float _3044 = _583;
        float _3046 = _585;
        float _3048 = _587;
        float _3050 = _2888;
        float _3052 = _2894;
        float _3054 = _2900;
        float _3056 = _3044 * _3044;
        float _3058 = rsqrt(_2862);
        float _3060 = fma(_3046, _3046, _3056);
        float _3062 = fma(_3048, _3048, _3060);
        float _3064 = sqrt(_3062);
        float _3066 = _2852 * _3058;
        float _3068 = _2848 * _3058;
        float _3070 = _2856 * _3058;
        bool _3072 = _3064 > 0.0;
        bool _3074 = !_3072;
        if (!_3074)
        {
            float _3076 = rsqrt(_3062);
            float _3078 = _3076 * _3044;
            float _3080 = _3076 * _3046;
            float _3082 = _3076 * _3048;
            float _3084 = _3068 * _3078;
            float _3086 = fma(_3066, _3080, _3084);
            float _3088 = fma(_3070, _3082, _3086);
            float _3090 = _3088 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3092 = fma(_3050, _3090, _2842);
            float _3094 = fma(_3052, _3090, _2840);
            float _3096 = fma(_3054, _3090, _2844);
            _2870 = _3092;
            _2872 = _3094;
            _2874 = _3096;
        }
    }
    float _3098 = _2870;
    float _3100 = _2872;
    float _3102 = _2874;
    float _3104 = -_2158;
    float _3106 = fma(_3104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1644);
    float _3108 = -_2160;
    float _3110 = fma(_3108, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1608);
    float _3112 = -_2166;
    float _3114 = fma(_3112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    float _3116 = -_2160;
    float _3118 = fma(_3116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3098);
    float _3120 = _3106 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3122 = _3106 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3124 = -_2158;
    float _3126 = fma(_3124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3100);
    float _3128 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3120);
    float _3130 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3122);
    float _3132 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3128);
    bool _3134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3136 = isnan(0.5);
    bool _3138 = _3134 || _3136;
    bool _3140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3142 = _3138 || _3140;
    float _3144 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3130);
    bool _3146 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3148 = isnan(0.5);
    bool _3150 = _3146 || _3148;
    bool _3152 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3154 = _3150 || _3152;
    float _3156 = _3132 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3158 = -_2166;
    float _3160 = fma(_3158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3102);
    float _3162 = _3144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3164 = 1.0 / _3156;
    float _3166 = _3162 + _3156;
    float _3168 = _3126;
    float _3170 = _3118;
    float _3172 = _3160;
    float _3174 = _3162;
    float _3176 = _3098;
    if (!_3142)
    {
        float _3178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3180 = _3106 + _3178;
        float _3182 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3184 = _3110 + _3182;
        float _3186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3188 = -_1610;
        float _3190 = _3188 + _3102;
        float _3192 = _3180 * _3180;
        float _3194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3196 = _3114 + _3194;
        float _3198 = fma(_3184, _3184, _3192);
        float _3200 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3202 = fma(_3196, _3196, _3198);
        float _3204 = sqrt(_3202);
        float _3206 = 1.0 / _2312;
        float _3208 = precise::min(_3204, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3210 = _3208 * _3186;
        float _3212 = _3200 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3214 = _3210 * _3206;
        float _3216 = -_1608;
        float _3218 = _3216 + _3098;
        float _3220 = -_1644;
        float _3222 = _3220 + _3100;
        float _3224 = _3212 * _3214;
        float _3226 = _3190 * _3214;
        float _3228 = fma(_3218, _3224, _3110);
        float _3230 = fma(_3222, _3224, _3106);
        float _3232 = fma(_3212, _3226, _3114);
        _3168 = _3230;
        _3170 = _3228;
        _3172 = _3232;
        _1746 = _3190;
        _3174 = _3226;
    }
    float _3234 = _3168;
    float _3236 = _3170;
    float _3238 = _3172;
    float _3240 = _1746;
    float _3242 = _3174;
    float _3244 = _3242;
    float _3246 = _3240;
    if (_3154)
    {
        _3244 = 1.0;
    }
    float _3248 = _3244;
    float _3250 = _3166 * _3164;
    float _3252 = _3250 * 0.5;
    float _3254 = _3248;
    float _3256 = _3252;
    if (!_3154)
    {
        float _3258 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3260 = _3258 * 0.15915493667125701904296875;
        float _3262 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3264 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3266 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3264);
        float _3268 = _3260 * 6.283185482025146484375;
        float _3270 = cos(_3268);
        float _3272 = _3262 * 0.15915493667125701904296875;
        float _3274 = _3260 * 6.283185482025146484375;
        float _3276 = sin(_3274);
        float _3278 = 1.0 / _3270;
        float _3280 = _3272 * 6.283185482025146484375;
        float _3282 = cos(_3280);
        float _3284 = _3276 * _3278;
        float _3286 = _3272 * 6.283185482025146484375;
        float _3288 = sin(_3286);
        float _3290 = _3282 * _3284;
        float _3292 = 1.0 / _3266;
        float _3294 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3296 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3294;
        float _3298 = 1.0 / _3290;
        float _3300 = 1.0 / _3296;
        float _3302 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3304 = _3292 * _3302;
        float _3306 = _3288 * _3298;
        float _3308 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3310 = fma(_3306, _3304, _3308);
        float _3312 = _3310 * _3300;
        float _3314 = precise::clamp(_3312, 0.0, 1.0);
        _3246 = _3298;
        _3254 = _3314;
    }
    float _3316 = _3246;
    float _3318 = _3254;
    float _3320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3322 = _3234 + _3320;
    float _3324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3326 = _3236 + _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3330 = _3238 + _3328;
    float _3332 = _3322 * _3322;
    float _3334 = fma(_3326, _3326, _3332);
    float _3336 = fma(_3330, _3330, _3334);
    float _3338 = rsqrt(_3336);
    float _3340 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3342 = _3326 * _3340;
    float _3344 = _3330 * _3340;
    float _3346 = _3342 * _3342;
    float _3348 = _3344 * _3344;
    float _3350 = _3346 + _3348;
    float _3352 = sqrt(_3350);
    bool _3354 = _3352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3358 = _3352 + _3356;
    float _3360 = _3338;
    float _3362 = _3350;
    float _3364 = _3358;
    float _3366 = _3316;
    float _3368 = _3322;
    if (_3354)
    {
        float _3370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3360 = _3370;
    }
    float _3372 = _3360;
    if (_3354)
    {
        float _3374 = rsqrt(_3350);
        _3362 = _3374;
    }
    float _3376 = _3362;
    float _3378 = _3376;
    if (_3354)
    {
        float _3380 = _3358 * _3372;
        _3364 = _3380;
    }
    float _3382 = _3364;
    if (_3354)
    {
        float _3384 = _3382 * 0.15915493667125701904296875;
        _3366 = _3384;
    }
    float _3386 = _3366;
    float _3388 = _3330;
    if (_3354)
    {
        float _3390 = _3386 * 6.283185482025146484375;
        float _3392 = sin(_3390);
        _3388 = _3392;
    }
    float _3394 = _3388;
    float _3396 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3398 = precise::max(0.0, _3396);
    float _3400 = _3372;
    float _3402 = _3398;
    if (_3354)
    {
        float _3404 = _3386 * 6.283185482025146484375;
        float _3406 = cos(_3404);
        _3400 = _3406;
    }
    float _3408 = _3400;
    float _3410 = -_3340;
    float _3412 = -_3398;
    float _3414 = fma(_3322, _3410, _3412);
    if (_3354)
    {
        float _3416 = _3414 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3368 = _3416;
    }
    float _3418 = _3368;
    float _3420 = sqrt(_3336);
    float _3422 = _3418;
    float _3424 = _3394;
    if (_3354)
    {
        float _3426 = fma(_3394, _3418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3422 = _3426;
    }
    float _3428 = _3422;
    float _3430 = _3428;
    if (!_3354)
    {
        _3424 = _3342;
    }
    float _3432 = _3424;
    float _3434 = _3432;
    float _3436 = _3408;
    if (_3354)
    {
        float _3438 = _3408 + (-1.0);
        _3402 = _3438;
    }
    float _3440 = _3402;
    float _3442 = _3440;
    if (_3354)
    {
        float _3444 = _3376 * _3428;
        _3176 = _3444;
    }
    float _3446 = _3176;
    if (!_3354)
    {
        _3430 = _3414;
    }
    float _3448 = _3430;
    float _3450 = _3448;
    if (_3354)
    {
        float _3452 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3256 = _3452;
    }
    float _3454 = _3256;
    if (_3354)
    {
        float _3456 = _3342 * _3446;
        _3434 = _3456;
    }
    float _3458 = _3434;
    if (!_3354)
    {
        _3442 = _3344;
    }
    float _3460 = _3442;
    float _3462 = _3460;
    if (_3354)
    {
        float _3464 = _3344 * _3446;
        _3462 = _3464;
    }
    float _3466 = _3462;
    if (!_3354)
    {
        _3378 = _3346;
    }
    float _3468 = _3378;
    float _3470 = _3468;
    if (_3354)
    {
        float _3472 = fma(_3414, _3408, _3454);
        _3450 = _3472;
    }
    float _3474 = _3450;
    if (_3354)
    {
        float _3476 = _3458 * _3458;
        _3470 = _3476;
    }
    float _3478 = _3470;
    if (!_3354)
    {
        _3436 = _3348;
    }
    float _3480 = _3436;
    float _3482 = _3480;
    if (_3354)
    {
        float _3484 = _3466 * _3466;
        _3482 = _3484;
    }
    float _3486 = _3482;
    float _3488 = fma(_3474, _3474, _3478);
    float _3490 = _3488 + _3486;
    float _3492 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3494 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3496 = fma(_3420, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3494);
    float _3498 = precise::clamp(_3496, 0.0, 1.0);
    float _3500 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3502 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3504 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3492);
    float _3506 = rsqrt(_3490);
    float _3508 = -_3498;
    float _3510 = _3508 + 1.0;
    float _3512 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3514 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3504);
    float _3516 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3502);
    float _3518 = _3234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3520 = _3514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3522 = abs(_3510);
    float _3524 = log2(_3522);
    float _3526 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3512);
    float _3528 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3516);
    float _3530 = fma(_3236, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3518);
    float _3532 = _3520 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3534 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3526);
    float _3536 = _3528 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3538 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3530);
    float _3540 = _3506 * _3458;
    float _3542 = _3534 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3544 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3546 = _3506 * _3474;
    float _3548 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3550 = -_3532;
    float _3552 = fma(_3550, _3500, 1.0);
    float _3554 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3544);
    float _3556 = _3506 * _3466;
    float _3558 = _3524 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3560 = -_3548;
    float _3562 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3560);
    float _3564 = _3538 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3566 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3554);
    float _3568 = log2(_3552);
    float _3570 = -_3556;
    float _3572 = fma(_3570, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3562);
    float _3574 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3576 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3566);
    float _3578 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3580 = fma(_3572, -0.5, 0.5);
    float _3582 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3574);
    float _3584 = fma(_3572, 0.5, 0.5);
    float _3586 = exp2(_3558);
    float _3588 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3578);
    float _3590 = _3546 + 1.0;
    float _3592 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3582);
    float _3594 = fma(_3584, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3596 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3588);
    float _3598 = 1.0 / _3576;
    float _3600 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3596);
    float _3602 = fma(_3584, _3594, -0.212114393711090087890625);
    float _3604 = _3568 * 0.693147182464599609375;
    float _3606 = fma(_3584, _3602, 1.570728778839111328125);
    float _3608 = _3604 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3610 = sqrt(_3580);
    float _3612 = -_3546;
    float _3614 = fma(_3586, _3590, _3612);
    float _3616 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3592);
    float _3618 = fma(_3614, 0.5, 0.5);
    float _3620 = _3600 * _3598;
    float _3622 = _3616 * _3598;
    float _3624 = fma(_3620, 0.5, 0.5);
    float _3626 = fma(_3622, -0.5, 0.5);
    float _3628 = _3610 * 0.636619746685028076171875;
    float3 _9064 = float3(_3624, _3626, _3608);
    float _3630 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9064, float3(0.0), isnan(_9064)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9064, float3(0.0), isnan(_9064)), level(0.0)).x;
    float3 _9075 = float3(_3624, _3626, _3608);
    float4 _3633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9075, float3(0.0), isnan(_9075)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9075, float3(0.0), isnan(_9075)), level(0.0)).xyzw;
    float _3635 = _3633.x;
    float _3637 = _3633.y;
    float _3639 = _3633.z;
    float _3641 = _3633.w;
    float _3643 = -_3606;
    float _3645 = fma(_3628, _3643, 1.0);
    float2 _9097 = float2(_3645, _3618);
    float3 _3649 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9097, float2(0.0), isnan(_9097)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9097, float2(0.0), isnan(_9097)), level(0.0)).xyz;
    float _3651 = _3649.x;
    float _3653 = _3649.y;
    float _3655 = _3649.z;
    float _3657 = _3524 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3659 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3661 = _3576 * 0.5;
    float _3663 = _3318 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3665 = _3318 > 0.0;
    bool _3667 = isnan(_3318);
    bool _3669 = _3665 || _3667;
    bool _3671 = isnan(0.0);
    bool _3673 = _3669 || _3671;
    float _3675 = fma(_3542, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3659);
    float _3677 = exp2(_3657);
    float _3679 = fma(_3616, -0.5, _3661);
    float _3681 = _3663 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3683 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3675);
    float _3685 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3683);
    float _3687 = _3600 + _3576;
    out.m_45.x = _3681;
    float _3689 = _3685 + _3576;
    float _3691 = -_3677;
    float _3693 = _3691 + 1.0;
    float _3695 = _3687 * 0.5;
    float _3697 = _3689 * 0.5;
    out.gl_Position.x = _3600;
    out.gl_Position.y = _3616;
    out.gl_Position.z = _3685;
    out.gl_Position.w = _3576;
    float _3699 = _3693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _3695;
    out.m_74.y = _3679;
    out.m_74.z = _3697;
    out.m_74.w = _3576;
    float _3701 = -_3699;
    float _3703 = _3701 + 1.0;
    float _3705 = _3699 * _3630;
    float _3707 = _3641 * _3703;
    float _3709 = _3641 * _3705;
    float _3711 = _3655 * _3705;
    float _3713 = fma(_3651, _3709, _3635);
    float _3715 = fma(_3653, _3709, _3637);
    float _3717 = fma(_3641, _3711, _3639);
    out.m_76.x = _3713;
    out.m_76.y = _3715;
    out.m_76.z = _3717;
    out.m_76.w = _3707;
    if (_3673)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3719 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3719;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

