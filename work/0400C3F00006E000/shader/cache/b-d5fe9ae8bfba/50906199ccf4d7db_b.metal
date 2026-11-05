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
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_83 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _98(thread const int& _9469, thread const int& _9470, constant _10& support_buffer)
{
    float _9473 = as_type<float>(support_buffer._m4);
    int _9475 = _9470 + as_type<int>(_9473);
    int _9477 = 1 + _9475;
    float _9479 = support_buffer._m5[_9477].x;
    float _9481 = abs(_9479);
    bool _9483 = _9481 == 1.0;
    if (_9483)
    {
        return _9469;
    }
    float _9485 = float(_9469);
    float _9487 = _9485 / _9481;
    int _9489 = int(_9487);
    return _9489;
}

static inline __attribute__((always_inline))
int _99(thread const int& _9519, thread const int& _9520, constant _10& support_buffer)
{
    float _9523 = as_type<float>(support_buffer._m4);
    int _9525 = _9520 + as_type<int>(_9523);
    int _9527 = 1 + _9525;
    float _9529 = support_buffer._m5[_9527].x;
    bool _9531 = _9529 == 1.0;
    if (_9531)
    {
        return _9519;
    }
    float _9533 = float(_9519);
    float _9535 = _9533 * _9529;
    int _9537 = int(_9535);
    return _9537;
}

static inline __attribute__((always_inline))
void _96(thread const int& _9167, thread const int& _9168, thread const int& _9169, thread const int& _9170, thread int& _9171, thread int& _9172, thread int& _9173, thread int& _9174, thread int& _9175, thread int& _9176, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _9179 = _9168;
    int _9181 = _9167;
    int _9183 = _9169;
    float _9185 = 0.0 + as_type<float>(_9167);
    bool _9187 = _9185 != 0.0;
    bool _9189 = isnan(_9185);
    bool _9191 = _9187 || _9189;
    bool _9193 = isnan(0.0);
    bool _9195 = _9191 || _9193;
    int _9197 = _9195 ? (-1) : 0;
    if (!_9195)
    {
        float _9199 = as_type<float>(_9167) * 1.0;
        _9179 = as_type<int>(_9199);
    }
    int _9201 = _9179;
    bool _9203 = !_9195;
    int _9205 = _9201;
    int _9207 = _9201;
    if (!_9203)
    {
        bool _9209 = _9185 >= 0.0;
        bool _9211 = isnan(_9185);
        bool _9213 = _9209 || _9211;
        bool _9215 = isnan(0.0);
        bool _9217 = _9213 || _9215;
        _9197 = _9217 ? (-1) : 0;
        if (!_9217)
        {
            _9205 = 2147483647;
        }
        int _9219 = _9205;
        bool _9221 = !_9217;
        int _9223 = _9219;
        _9207 = _9219;
        if (!_9221)
        {
            float _9225 = abs(as_type<float>(_9167));
            float _9227 = 0.0 + _9225;
            bool _9229 = _9227 > as_type<float>(0x7f800000u /* inf */);
            bool _9231 = isnan(_9227);
            bool _9233 = _9229 || _9231;
            bool _9235 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _9237 = _9233 || _9235;
            _9197 = _9237 ? (-1) : 0;
            if (_9237)
            {
                float _9239 = as_type<float>(_9167) + 1.0;
                _9223 = as_type<int>(_9239);
            }
            int _9241 = _9223;
            int _9243 = _9241;
            _9207 = _9241;
            if (!_9237)
            {
                bool _9245 = _9227 != as_type<float>(0x7f800000u /* inf */);
                bool _9247 = isnan(_9227);
                bool _9249 = _9245 || _9247;
                bool _9251 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _9253 = _9249 || _9251;
                _9197 = _9253 ? (-1) : 0;
                if (!_9253)
                {
                    _9243 = _9167;
                }
                int _9255 = _9243;
                bool _9257 = !_9253;
                _9207 = _9255;
                if (!_9257)
                {
                    float _9259 = as_type<float>(_9167) * 18446744073709551616.0;
                    float _9261 = rsqrt(_9259);
                    float _9263 = _9259 * _9261;
                    float _9265 = _9261 * 0.5;
                    float _9267 = -_9263;
                    float _9269 = 0.0 + _9267;
                    float _9271 = fma(_9265, _9269, 0.5);
                    float _9273 = fma(_9263, _9271, _9263);
                    float _9275 = -_9273;
                    float _9277 = 0.0 + _9275;
                    float _9279 = fma(_9273, _9277, _9259);
                    float _9281 = fma(_9265, _9279, _9273);
                    float _9283 = _9281 * 2.3283064365386962890625e-10;
                    _9181 = as_type<int>(_9259);
                    _9207 = as_type<int>(_9283);
                    _9183 = as_type<int>(_9269);
                }
            }
        }
    }
    int _9285 = _9181;
    int _9287 = _9207;
    int _9289 = _9183;
    int _9291 = _9197;
    _9171 = _9285;
    _9172 = _9170;
    _9173 = 0;
    _9174 = _9287;
    _9175 = _9289;
    _9176 = _9291;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3217 = false;
    bool _2397 = false;
    bool _2207 = false;
    bool _1645 = false;
    bool _1325 = false;
    bool _1195 = false;
    bool _1091 = false;
    bool _911 = false;
    bool _635 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3696 = as_type<float>(_123);
        out.gl_Position.z = _3696;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = 0.0;
    float _147 = _141;
    if (_137)
    {
        float _149 = float(_107);
        _117 = _149;
    }
    float _151 = _117;
    bool _153 = _141 >= _151;
    bool _155 = !_137;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _125 = as_type<int>(_163);
    }
    int _165 = _125;
    float _167 = as_type<float>(_165);
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3768 = as_type<float>(_165);
        out.gl_Position.z = _3768;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_51.x;
    float _171 = in.m_51.y;
    float _173 = in.m_51.z;
    float _175 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = _175;
    if (!_185)
    {
        float _189 = _175 * _175;
        float _191 = _189 * 0.5;
        _167 = _191;
    }
    float _193 = _167;
    float _195 = 0.0;
    float _197 = _193;
    if (!_185)
    {
        float _199 = _141 * _141;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    if (!_185)
    {
        float _205 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _205;
    }
    float _207 = _197;
    bool _209 = !_185;
    float _211 = _207;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _175 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _175);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _143 = _227;
        _211 = _241;
        _145 = _229;
    }
    float _243 = _143;
    float _245 = _211;
    float _247 = _145;
    bool _249 = !_185;
    float _251 = _243;
    float _253 = _247;
    if (!_249)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _175 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _251 = _267;
        _253 = _261;
        _187 = _273;
    }
    float _275 = _251;
    float _277 = _253;
    float _279 = _187;
    float _281 = _277;
    float _283 = _275;
    if (!_185)
    {
        _281 = _141;
    }
    float _285 = _281;
    float _287 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _285;
    if (!_185)
    {
        float _291 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _291;
    }
    float _293 = _283;
    bool _295 = !_185;
    float _297 = _293;
    if (!_295)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _141 * _301;
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = 1.0 / _309;
        float _313 = _303 * 0.693147182464599609375;
        float _315 = exp2(_305);
        float _317 = 1.0 / _313;
        float _319 = _315 + (-1.0);
        float _321 = -_319;
        float _323 = fma(_321, _317, _141);
        float _325 = _323 * _311;
        float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _327;
    }
    float _329 = _297;
    bool _331 = !_185;
    if (!_331)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _141 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _289 = _351;
    }
    float _353 = _289;
    float _355 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = fma(_279, _171, _287);
    float _359 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_353, _171, _355);
    float _365 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = fma(_279, _169, _359);
    float _371 = fma(_353, _169, _361);
    float _373 = -_363;
    float _375 = _357 + _373;
    float _377 = fma(_279, _173, _365);
    float _379 = fma(_353, _173, _367);
    float _381 = -_371;
    float _383 = _369 + _381;
    float _385 = _375 * _375;
    float _387 = in.m_53.w;
    float _389 = -_379;
    float _391 = _377 + _389;
    float _393 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = fma(_383, _383, _385);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _401 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _403 = fma(_391, _391, _395);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _407 = in.m_46.x;
    float _409 = in.m_46.y;
    float _411 = in.m_46.z;
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _399);
    float _415 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _401);
    float _417 = sqrt(_403);
    float _419 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _405);
    float _421 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _413);
    bool _423 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan(9.9999999747524270787835121154785e-07);
    bool _431 = _427 || _429;
    float _433 = fma(_369, _387, _407);
    float _435 = fma(_357, _387, _409);
    float _437 = fma(_377, _387, _411);
    float _439 = _419;
    float _441 = _415;
    float _443 = _421;
    float _445 = _437;
    if (!_431)
    {
        bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _449 = !_447;
        if (!_449)
        {
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _455 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _461);
            float _469 = _463 * _463;
            float _471 = fma(_465, _465, _469);
            float _473 = fma(_467, _467, _471);
            float _475 = rsqrt(_473);
            float _477 = _475 * 9.9999999747524270787835121154785e-07;
            float _479 = _465 * _477;
            float _481 = _463 * _477;
            float _483 = _467 * _477;
            _439 = _481;
            _441 = _479;
            _443 = _483;
            _485 = true;
        }
        else
        {
            float _487 = _171 * _171;
            float _489 = fma(_169, _169, _487);
            float _491 = fma(_173, _173, _489);
            float _493 = sqrt(_491);
            bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
            bool _497 = isnan(_493);
            bool _499 = _495 || _497;
            bool _501 = isnan(9.9999999747524270787835121154785e-07);
            bool _503 = _499 || _501;
            if (!_503)
            {
                float _505 = _409 * _409;
                float _507 = fma(_407, _407, _505);
                float _509 = fma(_411, _411, _507);
                float _511 = sqrt(_509);
                bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
                bool _515 = isnan(_511);
                bool _517 = _513 || _515;
                bool _519 = isnan(9.9999999747524270787835121154785e-07);
                bool _521 = _517 || _519;
                if (!_521)
                {
                    float _523 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _523);
                    float _527 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _525);
                    float _529 = rsqrt(_527);
                    float _531 = _529 * 9.9999999747524270787835121154785e-07;
                    float _533 = _531 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _531 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = _531 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _535;
                    _441 = _533;
                    _443 = _537;
                    _485 = true;
                }
                else
                {
                    float _539 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _541 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _543 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _545 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
                    float _547 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _541);
                    float _549 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
                    float _551 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
                    float _553 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
                    float _555 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
                    float _557 = _551 * _551;
                    float _559 = fma(_553, _553, _557);
                    float _561 = fma(_555, _555, _559);
                    float _563 = rsqrt(_561);
                    float _565 = _563 * 9.9999999747524270787835121154785e-07;
                    float _567 = _553 * _565;
                    float _569 = _551 * _565;
                    float _571 = _555 * _565;
                    _439 = _569;
                    _441 = _567;
                    _443 = _571;
                    _485 = true;
                }
            }
            else
            {
                float _573 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _575 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _577 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _579 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
                float _581 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
                float _583 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
                float _585 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _579);
                float _587 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _581);
                float _589 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
                float _591 = _585 * _585;
                float _593 = fma(_587, _587, _591);
                float _595 = fma(_589, _589, _593);
                float _597 = rsqrt(_595);
                float _599 = _597 * 9.9999999747524270787835121154785e-07;
                float _601 = _587 * _599;
                float _603 = _585 * _599;
                float _605 = _589 * _599;
                _439 = _603;
                _441 = _601;
                _443 = _605;
            }
        }
    }
    _485 = false;
    float _607 = _439;
    float _609 = _441;
    float _611 = _443;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _615 = !_613;
    float _633;
    if (!_615)
    {
        float _617 = in.m_55.x;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_107);
        float _639 = 1.0 / _637;
        float _641 = _141 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _647 = _643 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _651 = _643 + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _669 = 1.0 / _655;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _673 = _643 + _671;
    float _675 = 1.0 / _663;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _679 = _643 + _677;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _683 = 1.0 / _659;
    float _685 = _673 * _669;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _687;
    float _691 = fma(_689, _685, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _693 = 1.0 / _667;
    float _695 = _647 * _675;
    bool _697 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _699 = isnan(_643);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _709;
    float _713 = -_707;
    float _715 = _713 + 1.0;
    float _717 = _651 * _683;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _719;
    float _723 = fma(_711, _685, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _725 = fma(_721, _685, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _727 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _729 = isnan(_643);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = _679 * _693;
    bool _741 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _743 = isnan(_643);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    bool _753 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _755 = isnan(_643);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = -_751;
    float _767 = _765 + 1.0;
    float _769 = _763 * _715;
    float _771 = -_763;
    float _773 = _771 + 1.0;
    float _775 = _707 * _767;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _781 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _783 = isnan(_643);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = _737 * _773;
    float _795 = -_737;
    float _797 = _795 + 1.0;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = fma(_779, _717, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _809 = _791 * _797;
    float _811 = fma(_801, _717, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _813 = fma(_805, _717, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _815 = _725 * _809;
    float _817 = _691 * _809;
    float _819 = -_791;
    float _821 = _819 + 1.0;
    float _823 = _723 * _809;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _829;
    float _833 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].x, _815);
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].y, _817);
    float _837 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].z, _823);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _839;
    float _843 = fma(_811, _793, _833);
    float _845 = fma(_827, _695, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _847 = fma(_813, _793, _835);
    float _849 = fma(_807, _793, _837);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _859 = fma(_831, _695, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _861 = fma(_841, _695, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _867 = fma(_845, _769, _843);
    float _869 = fma(_853, _739, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _871 = fma(_857, _739, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _873 = fma(_865, _739, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _875 = fma(_859, _769, _847);
    float _877 = fma(_861, _769, _849);
    float _879 = fma(_869, _775, _867);
    float _881 = fma(_871, _775, _875);
    float _883 = fma(_873, _775, _877);
    float _885 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[147].x, _879);
    float _887 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[147].y, _881);
    float _889 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[147].z, _883);
    bool _891 = !_681;
    float _909;
    if (!_891)
    {
        float _893 = in.m_55.x;
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _897 = _893 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _901 = _899 * _895;
        float _903 = floor(_901);
        float _905 = -_903;
        float _907 = _901 + _905;
        _909 = _907;
        _911 = true;
    }
    else
    {
        float _913 = float(_107);
        float _915 = 1.0 / _913;
        float _917 = _141 * _915;
        _909 = _917;
    }
    _911 = false;
    float _919 = _909;
    float _921 = in.m_53.x;
    float _923 = in.m_53.y;
    float _925 = in.m_53.z;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _929 = _919 + _927;
    bool _931 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _933 = isnan(_919);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _951 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _953 = isnan(_919);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = 1.0 / _949;
    bool _965 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _967 = 1.0 / _945;
    float _969 = _889 * _925;
    float _971 = _887 * _923;
    float _973 = -_941;
    float _975 = _973 + 1.0;
    float _977 = _885 * _921;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _979;
    float _983 = _929 * _967;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _987 = _919 + _985;
    bool _989 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _991 = isnan(_919);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_981, _983, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1003 = _987 * _963;
    float _1005 = _999 * _975;
    float _1007 = -_999;
    float _1009 = _1007 + 1.0;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1015;
    float _1019 = _961 * _1009;
    float _1021 = fma(_1013, _983, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1023 = fma(_1017, _983, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1025 = -_961;
    float _1027 = _1025 + 1.0;
    float _1029 = _1001 * _1019;
    float _1031 = _1021 * _1019;
    float _1033 = _1023 * _1019;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1047 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1031);
    float _1049 = fma(_1037, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1051 = fma(_1041, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1053 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1029);
    float _1055 = fma(_1045, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1057 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1033);
    float _1059 = fma(_1049, _1005, _1047);
    float _1061 = fma(_1051, _1005, _1053);
    float _1063 = fma(_1055, _1005, _1057);
    float _1065 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1059);
    float _1067 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1061);
    float _1069 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1063);
    bool _1071 = !_965;
    float _1089;
    if (!_1071)
    {
        float _1073 = in.m_55.x;
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1077 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1079 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _1081 = _1079 * _1075;
        float _1083 = floor(_1081);
        float _1085 = -_1083;
        float _1087 = _1081 + _1085;
        _1089 = _1087;
        _1091 = true;
    }
    else
    {
        float _1093 = float(_107);
        float _1095 = 1.0 / _1093;
        float _1097 = _141 * _1095;
        _1089 = _1097;
    }
    _1091 = false;
    float _1099 = _1089;
    bool _1101 = _1099 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1103 = isnan(_1099);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1117 = _1099 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1119 = isnan(_1099);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _1099 + _1133;
    float _1137 = -_1111;
    float _1139 = _1137 + 1.0;
    bool _1141 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1143 = 1.0 / _1115;
    float _1145 = _1127 * _1139;
    float _1147 = -_1127;
    float _1149 = _1147 + 1.0;
    float _1151 = _1131 * _1143;
    float _1153 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1155 = fma(_1151, _1135, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1157 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1155 * _1145;
    float _1163 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1165 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1161);
    float _1169 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1167);
    float _1173 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1169;
    out.m_57.y = _1165;
    out.m_57.z = _1159;
    out.m_57.w = _1173;
    bool _1175 = !_1141;
    float _1193;
    if (!_1175)
    {
        float _1177 = in.m_55.x;
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1181 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _1185 = _1183 * _1179;
        float _1187 = floor(_1185);
        float _1189 = -_1187;
        float _1191 = _1185 + _1189;
        _1193 = _1191;
        _1195 = true;
    }
    else
    {
        float _1197 = float(_107);
        float _1199 = 1.0 / _1197;
        float _1201 = _141 * _1199;
        _1193 = _1201;
    }
    _1195 = false;
    float _1203 = _1193;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1207 = _1203 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1211 = _1209 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1213 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1215 = isnan(_1203);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1229 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1231 = isnan(_1203);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1241;
    bool _1245 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1247 = isnan(_1203);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = 1.0 / _1211;
    float _1259 = -_1223;
    float _1261 = _1259 + 1.0;
    bool _1263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1265 = 1.0 / _1227;
    float _1267 = _1243 * _1257;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1273 = fma(_1267, _1207, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1275 = _1239 * _1261;
    float _1277 = -_1255;
    float _1279 = _1277 + 1.0;
    float _1281 = -_1239;
    float _1283 = _1281 + 1.0;
    float _1285 = _1271 * _1265;
    float _1287 = _1273 * _1275;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1291 = _1203 + _1289;
    float _1293 = _1223 * _1279;
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1287);
    float _1297 = fma(_1285, _1291, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1299 = fma(_1297, _1293, _1295);
    float _1301 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1299);
    float _1303 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1303;
    bool _1305 = !_1263;
    float _1323;
    if (!_1305)
    {
        float _1307 = in.m_55.x;
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1311 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _1315 = _1313 * _1309;
        float _1317 = floor(_1315);
        float _1319 = -_1317;
        float _1321 = _1315 + _1319;
        _1323 = _1321;
        _1325 = true;
    }
    else
    {
        float _1327 = float(_107);
        float _1329 = 1.0 / _1327;
        float _1331 = _141 * _1329;
        _1323 = _1331;
    }
    _1325 = false;
    float _1333 = _1323;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1337 = _1333 + _1335;
    bool _1339 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1341 = isnan(_1333);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1355 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1357 = isnan(_1333);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1367;
    bool _1371 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1373 = isnan(_1333);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = -_1349;
    float _1385 = _1383 + 1.0;
    float _1387 = 1.0 / _1353;
    bool _1389 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1391 = isnan(_1333);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1403 = _1401 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1405 = 1.0 / _1403;
    bool _1407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1409 = _1369 * _1387;
    float _1411 = -_1365;
    float _1413 = _1411 + 1.0;
    float _1415 = _1365 * _1385;
    bool _1417 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1419 = isnan(_1333);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    float _1429 = fma(_1409, _1337, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1431 = _1381 * _1413;
    float _1433 = -_1381;
    float _1435 = _1433 + 1.0;
    float _1437 = -_1427;
    float _1439 = _1437 + 1.0;
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1443 = _1441 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1445 = _1427 * _1435;
    bool _1447 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1449 = isnan(_1333);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = -_1399;
    float _1461 = _1459 + 1.0;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1467 = _1399 * _1439;
    bool _1469 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1471 = isnan(_1333);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = _1457 * _1461;
    float _1483 = 1.0 / _1465;
    float _1485 = -_1457;
    float _1487 = _1485 + 1.0;
    float _1489 = _1479 * _1487;
    float _1491 = -_1479;
    float _1493 = _1491 + 1.0;
    float _1495 = 1.0 / _1443;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1503 = _1501 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1505 = _1429 * _1489;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1509 = _1507 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1511;
    float _1515 = _1503 * _1405;
    float _1517 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1505);
    float _1519 = 1.0 / _1499;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1523 = _1333 + _1521;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1527 = _1525 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1529 = _1513 * _1483;
    float _1531 = fma(_1515, _1523, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1535 = _1333 + _1533;
    float _1537 = 1.0 / _1509;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1543 = fma(_1529, _1535, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1545 = fma(_1531, _1481, _1517);
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1547;
    float _1551 = _1541 * _1495;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1555 = _1333 + _1553;
    float _1557 = 1.0 / _1527;
    float _1559 = fma(_1543, _1467, _1545);
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1565 = _1549 * _1519;
    float _1567 = fma(_1551, _1555, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1571 = _1333 + _1569;
    bool _1573 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1575 = isnan(_1333);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1581 = _1577 || _1579;
    float _1583 = float(_1581);
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1587 = _1333 + _1585;
    float _1589 = _1563 * _1537;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1591;
    float _1595 = fma(_1565, _1571, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1597 = fma(_1567, _1445, _1559);
    float _1599 = fma(_1589, _1587, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1601 = -_1583;
    float _1603 = _1601 + 1.0;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1607 = _1333 + _1605;
    float _1609 = fma(_1595, _1431, _1597);
    float _1611 = _1593 * _1557;
    float _1613 = _1349 * _1603;
    float _1615 = fma(_1599, _1415, _1609);
    float _1617 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1619 = fma(_1617, _1613, _1615);
    float _1621 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1619);
    float _1623 = precise::clamp(_1621, 0.0, 1.0);
    bool _1625 = !_1407;
    float _1643;
    if (!_1625)
    {
        float _1627 = in.m_55.x;
        float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1631 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[14].z, _141);
        float _1635 = _1633 * _1629;
        float _1637 = floor(_1635);
        float _1639 = -_1637;
        float _1641 = _1635 + _1639;
        _1643 = _1641;
        _1645 = true;
    }
    else
    {
        float _1647 = float(_107);
        float _1649 = 1.0 / _1647;
        float _1651 = _141 * _1649;
        _1643 = _1651;
    }
    _1645 = false;
    float _1653 = _1643;
    int _1655 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1657 = _1655;
    int _1659 = 0;
    int _1661 = _98(_1657, _1659, (*spvDescriptorSet0.support_buffer));
    float _1663 = in.m_61.z;
    float _1665 = trunc(_1663);
    int _1667 = int(_1665);
    int _1669 = _1661 + (-1);
    float _1671 = float(_1669);
    float _1673 = _1623 * _1671;
    float _1675 = trunc(_1673);
    int _1677 = int(_1675);
    int _1679 = _1677;
    int _1681 = 0;
    int _1683 = _99(_1679, _1681, (*spvDescriptorSet0.support_buffer));
    int _1685 = _1667;
    int _1687 = 0;
    int _1689 = _99(_1685, _1687, (*spvDescriptorSet0.support_buffer));
    float4 _1692 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1683, _1689)), 0).xyzw;
    float _1694 = _1692.x;
    float _1696 = _1692.y;
    float _1698 = _1692.z;
    float _1700 = _1692.w;
    float _1702 = in.m_55.w;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1716 = 1.0 / _1706;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1724 = _1722 != 0;
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1728 = _1726 != 0;
    float _1730 = 1.0 / _1710;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1734 = _1732 != 0;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1736;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1742 = _1740 != 0;
    bool _1744 = _1702 > 0.5;
    bool _1746 = _1744 && _1724;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1752 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1754 = isnan(_1653);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = 1.0 / _1714;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1766;
    float _1770 = _1750 * _1716;
    bool _1772 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1774 = isnan(_1653);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    float _1784 = -_1762;
    float _1786 = _1784 + 1.0;
    bool _1788 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1790 = isnan(_1653);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = 1.0 / _1720;
    bool _1802 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1804 = isnan(_1653);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = _1768 * _1730;
    float _1816 = _1782 * _1786;
    bool _1818 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1820 = isnan(_1653);
    bool _1822 = _1818 || _1820;
    bool _1824 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1826 = _1822 || _1824;
    float _1828 = float(_1826);
    float _1830 = -_1812;
    float _1832 = _1830 + 1.0;
    float _1834 = -_1782;
    float _1836 = _1834 + 1.0;
    float _1838 = _1738 * _1764;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1844 = _1762 * _1832;
    bool _1846 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1848 = isnan(_1653);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1862 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1864 = isnan(_1653);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = _1842 * _1800;
    float _1876 = 1.0 / _1860;
    float _1878 = -_1856;
    float _1880 = _1878 + 1.0;
    float _1882 = -_1828;
    float _1884 = _1882 + 1.0;
    float _1886 = _1856 * _1836;
    float _1888 = _1828 * _1880;
    float _1890 = _1798 * _1884;
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1894 = _1653 + _1892;
    float _1896 = -_1798;
    float _1898 = _1896 + 1.0;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1902 = _1900 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1904;
    float _1908 = fma(_1838, _1894, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1910 = _1872 * _1898;
    float _1912 = 1.0 / _1902;
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1916 = _1653 + _1914;
    float _1918 = _1908 * _1910;
    float _1920 = -_1872;
    float _1922 = _1920 + 1.0;
    float _1924 = _1906 * _1876;
    float _1926 = fma(_1770, _1916, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1928 = in.m_61.x;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1932 = _1653 + _1930;
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1918);
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1940 = in.m_61.y;
    float _1942 = fma(_1814, _1932, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1944 = fma(_1926, _1890, _1934);
    float _1946 = _1890;
    float _1948 = _1812;
    float _1950 = _1844;
    int _1952 = as_type<int>(_1653);
    if (_1728)
    {
        float _1954 = in.m_55.x;
        _1946 = _1954;
    }
    float _1956 = _1946;
    float _1958 = _1938 * _1912;
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1962 = _1653 + _1960;
    float _1964 = fma(_1942, _1888, _1944);
    bool _1966 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1968 = isnan(_1653);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1980 = _1653 + _1978;
    float _1982 = fma(_1874, _1962, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1986 = _1984 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1994 = _1653 + _1992;
    float _1996 = fma(_1924, _1980, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1998 = fma(_1982, _1886, _1964);
    float _2000 = -_1976;
    float _2002 = _2000 + 1.0;
    float _2004 = 1.0 / _1986;
    float _2006 = fma(_1958, _1994, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2008 = fma(_1996, _1816, _1998);
    float _2010 = _1812 * _2002;
    if (!_1728)
    {
        _1948 = _1928;
    }
    float _2012 = _1948;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2016 = _2012;
    if (_1734)
    {
        float _2018 = in.m_55.z;
        _2014 = _2018;
    }
    float _2020 = _2014;
    float _2022 = fma(_2006, _1844, _2008);
    float _2024 = -_1940;
    float _2026 = _2024 + 1.0;
    int _2028 = as_type<int>(_1940);
    if (!_1728)
    {
        _1950 = _2012;
    }
    float _2030 = _1950;
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2034 = _1653 + _2032;
    float _2036 = _2030;
    if (_1728)
    {
        _2016 = _1928;
    }
    float _2038 = _2016;
    float _2040 = in.m_55.y;
    float _2042 = _1746 ? _2026 : _1940;
    bool _2044 = false;
    float _2046 = _2038;
    if (_1728)
    {
        bool _2048 = _1956 > 0.5;
        _2044 = _2048;
    }
    bool _2050 = _2044;
    if (_1728)
    {
        float _2052 = -_2038;
        float _2054 = _2052 + 1.0;
        _1952 = as_type<int>(_2054);
    }
    int _2056 = _1952;
    float _2058 = _1990 * _2004;
    float _2060 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1728)
    {
        float _2062 = _2050 ? as_type<float>(_2056) : _2038;
        _2036 = _2062;
    }
    float _2064 = _2036;
    float _2066 = fma(_2058, _2034, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    int _2068 = _1677 + 1;
    float _2070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2072 = fma(_2066, _2010, _2022);
    int _2074 = min(_1669, _2068);
    int _2076 = as_type<int>(_2066);
    if (_1734)
    {
        float _2078 = -_2038;
        float _2080 = _2078 + 1.0;
        _2076 = as_type<int>(_2080);
    }
    int _2082 = _2076;
    bool _2084 = false;
    if (_1734)
    {
        bool _2086 = _2020 > 0.5;
        _2084 = _2086;
    }
    bool _2088 = _2084;
    float _2090 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2072);
    float _2092 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1734)
    {
        float _2094 = _2088 ? as_type<float>(_2082) : _2038;
        _2046 = _2094;
    }
    float _2096 = _2046;
    out.m_63.x = _2090;
    bool _2098 = _2040 > 0.5;
    bool _2100 = _2098 && _1742;
    float _2102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2104 = _2100 ? _2026 : _1940;
    float _2106 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2110 = _2106 * _2092;
    float _2112 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2114 = _2060 * _2102;
    float _2116 = _2112 * _2108;
    uint _2119 = as_type<uint>(half2(float2(_1700, 0.0)));
    uint _2121 = extract_bits(_2119, 0u, 8u);
    int _2123 = int(_2121) & 255;
    uint _2125 = extract_bits(_2119, 8u, 8u);
    int _2127 = int(_2125) & 255;
    int _2129 = _2127 << 8;
    int _2131 = _2123 | _2129;
    bool _2133 = _2131 >= 32768;
    int _2135 = _2131 + (-1024);
    int _2137 = _2135;
    if (_2133)
    {
        int _2139 = ~_2131;
        int _2141 = _2139 + 33792;
        int _2143 = _2141 + 1;
        _2137 = _2143;
    }
    int _2145 = _2137;
    int _2147 = _2145 + 30719;
    float _2149 = float(_2147);
    float _2151 = fma(_2149, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2153 = abs(_2151);
    float _2155 = -_2153;
    float _2157 = _2155 + 1.0;
    float _2159 = abs(_2151);
    float _2161 = fma(_2159, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2163 = as_type<int>(_2157) + (-218103808);
    float _2165 = abs(_2151);
    float _2167 = fma(_2165, _2161, -0.212114393711090087890625);
    bool _2169 = uint(_2163) >= 1920991232u;
    float _2171 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2173 = _2151 < 0.0;
    float _2175 = float(_2173);
    float _2177 = abs(_2151);
    float _2179 = fma(_2177, _2167, 1.570728778839111328125);
    float _2181 = _2171 * _2070;
    bool _2183 = !_2169;
    float _2205;
    if (!_2183)
    {
        int _2185 = as_type<int>(_2157);
        int _2187 = as_type<int>(_2020);
        int _2189 = as_type<int>(_1940);
        int _2191 = 11056;
        int _2193;
        int _2195;
        int _2197;
        int _2199;
        int _2201;
        int _2203;
        _96(_2185, _2187, _2189, _2191, _2193, _2195, _2197, _2199, _2201, _2203, out.gl_Position, out.gl_PointSize);
        _2205 = as_type<float>(_2199);
        _2028 = _2201;
        _2207 = true;
    }
    else
    {
        float _2209 = rsqrt(_2157);
        float _2211 = _2157 * _2209;
        float _2213 = _2209 * 0.5;
        float _2215 = -_2211;
        float _2217 = 0.0 + _2215;
        float _2219 = fma(_2213, _2217, 0.5);
        float _2221 = fma(_2211, _2219, _2211);
        float _2223 = -_2221;
        float _2225 = 0.0 + _2223;
        float _2227 = fma(_2221, _2225, _2157);
        float _2229 = fma(_2213, _2227, _2221);
        _2205 = _2229;
    }
    _2207 = false;
    float _2231 = _2205;
    int _2233 = _2028;
    int _2235 = _2074;
    int _2237 = 0;
    int _2239 = _99(_2235, _2237, (*spvDescriptorSet0.support_buffer));
    int _2241 = _1667;
    int _2243 = 0;
    int _2245 = _99(_2241, _2243, (*spvDescriptorSet0.support_buffer));
    float4 _2247 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2239, _2245)), 0).xyzw;
    float _2249 = _2247.x;
    float _2251 = _2247.y;
    float _2253 = _2247.z;
    float _2255 = _2247.w;
    float _2257 = _2179 * _2231;
    float _2259 = _2175 * 2.0;
    float _2261 = _2149 * 3.883221149444580078125;
    float _2263 = floor(_1673);
    float _2265 = -_2259;
    float _2267 = fma(_2257, _2265, _2257);
    float _2269 = _2261 * 0.15915493667125701904296875;
    float _2271 = fma(_2175, 3.1415927410125732421875, _2267);
    float _2273 = _2269 * 6.283185482025146484375;
    float _2275 = cos(_2273);
    float _2277 = _2271 * 0.15915493667125701904296875;
    float _2279 = _2277 * 6.283185482025146484375;
    float _2281 = sin(_2279);
    float _2283 = -_2263;
    float _2285 = _1673 + _2283;
    float _2287 = _2269 * 6.283185482025146484375;
    float _2289 = sin(_2287);
    float _2291 = _2281 * _2275;
    float _2293 = _2281 * _2289;
    uint _2295 = as_type<uint>(half2(float2(_2255, 0.0)));
    uint _2297 = extract_bits(_2295, 0u, 8u);
    int _2299 = int(_2297) & 255;
    uint _2301 = extract_bits(_2295, 8u, 8u);
    int _2303 = int(_2301) & 255;
    int _2305 = _2303 << 8;
    int _2307 = _2299 | _2305;
    bool _2309 = _2307 >= 32768;
    int _2311 = _2307 + (-1024);
    int _2313 = _2311;
    if (_2309)
    {
        int _2315 = ~_2307;
        int _2317 = _2315 + 33792;
        int _2319 = _2317 + 1;
        _2313 = _2319;
    }
    int _2321 = _2313;
    float _2323 = -_1698;
    float _2325 = _2323 + _2253;
    int _2327 = _2321 + 30719;
    float _2329 = fma(_2285, _2325, _1698);
    float _2331 = float(_2327);
    float _2333 = fma(_2331, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2335 = -_1694;
    float _2337 = _2335 + _2249;
    float _2339 = abs(_2333);
    float _2341 = -_2339;
    float _2343 = _2341 + 1.0;
    float _2345 = abs(_2333);
    float _2347 = fma(_2345, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _2349 = fma(_2285, _2337, _1694);
    bool _2351 = _2333 < 0.0;
    float _2353 = float(_2351);
    int _2355 = as_type<int>(_2343) + (-218103808);
    float _2357 = abs(_2333);
    float _2359 = fma(_2357, _2347, -0.212114393711090087890625);
    bool _2361 = uint(_2355) >= 1920991232u;
    float _2363 = -_1696;
    float _2365 = _2363 + _2251;
    float _2367 = abs(_2333);
    float _2369 = fma(_2367, _2359, 1.570728778839111328125);
    float _2371 = fma(_2285, _2365, _1696);
    bool _2373 = !_2361;
    float _2395;
    if (!_2373)
    {
        int _2375 = as_type<int>(_2343);
        int _2377 = as_type<int>(_2277);
        int _2379 = _2233;
        int _2381 = 11936;
        int _2383;
        int _2385;
        int _2387;
        int _2389;
        int _2391;
        int _2393;
        _96(_2375, _2377, _2379, _2381, _2383, _2385, _2387, _2389, _2391, _2393, out.gl_Position, out.gl_PointSize);
        _2395 = as_type<float>(_2389);
        _2397 = true;
    }
    else
    {
        float _2399 = rsqrt(_2343);
        float _2401 = _2343 * _2399;
        float _2403 = _2399 * 0.5;
        float _2405 = -_2401;
        float _2407 = 0.0 + _2405;
        float _2409 = fma(_2403, _2407, 0.5);
        float _2411 = fma(_2401, _2409, _2401);
        float _2413 = -_2411;
        float _2415 = 0.0 + _2413;
        float _2417 = fma(_2411, _2415, _2343);
        float _2419 = fma(_2403, _2417, _2411);
        _2395 = _2419;
    }
    _2397 = false;
    float _2421 = _2395;
    float _2423 = in.m_55.x;
    float _2425 = in.m_55.y;
    float _2427 = in.m_55.z;
    float _2429 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2431 = log2(_2429);
    float _2433 = _607 * _607;
    float _2435 = _2369 * _2421;
    float _2437 = fma(_609, _609, _2433);
    int _2439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2441 = _2439 != 0;
    int _2443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2445 = _2443 != 0;
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2449 = _2447 != 0;
    float _2451 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2453 = _971 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2455 = fma(_611, _611, _2437);
    float _2457 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2459 = rsqrt(_2455);
    float _2461 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2457);
    float _2463 = _2427 * 2.0;
    float _2465 = _2423 * 2.0;
    float _2467 = _2423 + _2427;
    float _2469 = _2425 * 2.0;
    float _2471 = floor(_2465);
    float _2473 = _2467 + (-1.0);
    float _2475 = _2459 * _609;
    float _2477 = _2459 * _607;
    float _2479 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2481 = _2475 * _2479;
    float _2483 = floor(_2463);
    float _2485 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2487 = _2425 + _2423;
    float _2489 = _2487 + (-1.0);
    float _2491 = floor(_2469);
    bool _2493 = _2471 >= 0.0;
    bool _2495 = isnan(_2471);
    bool _2497 = _2493 || _2495;
    bool _2499 = isnan(0.0);
    bool _2501 = _2497 || _2499;
    float _2503 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2505 = _2501 ? 0 : 1;
    bool _2507 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2509 = isnan(0.0);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2515 = _2511 || _2513;
    bool _2517 = _2483 > 0.0;
    bool _2519 = _2483 >= 0.0;
    bool _2521 = isnan(_2483);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan(0.0);
    bool _2527 = _2523 || _2525;
    float _2529 = _2431 * _141;
    int _2531 = _2527 ? 0 : 1;
    bool _2533 = _2471 > 0.0;
    float _2535 = exp2(_2529);
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2539 = 1.0 + _2537;
    bool _2541 = !_2441;
    int _2543 = _2541 ? 0 : 1;
    int _2545 = ~_2531;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    int _2551 = _2549;
    if (!_2517)
    {
        int _2553 = ~_2531;
        int _2555 = _2553 + 1;
        _2551 = _2555;
    }
    int _2557 = _2551;
    float _2559 = _2459 * _611;
    float _2561 = 1.0 / _2539;
    int _2563 = abs(_2543);
    bool _2565 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2567 = isnan(1.0);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2573 = _2569 || _2571;
    bool _2575 = _2491 > 0.0;
    bool _2577 = _2491 >= 0.0;
    bool _2579 = isnan(_2491);
    bool _2581 = _2577 || _2579;
    bool _2583 = isnan(0.0);
    bool _2585 = _2581 || _2583;
    float _2587 = -_2535;
    float _2589 = _2587 + 1.0;
    float _2591 = float(_2563);
    float _2593 = in.m_65.x;
    float _2595 = in.m_65.y;
    float _2597 = in.m_65.z;
    float _2599 = float(_2557);
    float _2601 = _2515 ? _2589 : 0.0;
    int _2603 = _2585 ? 0 : 1;
    float _2605 = _2591 * _2599;
    float _2607 = _2423 + (-0.5);
    if (_2573)
    {
        float _2609 = _2601 * _2561;
        _147 = _2609;
    }
    float _2611 = _147;
    float _2613 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2615 = _2559 * _2613;
    bool _2617 = !_2449;
    int _2619 = _2617 ? 0 : 1;
    int _2621 = ~_2603;
    int _2623 = _2621 + 1;
    int _2625 = _2623 + 1;
    float _2627 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2629 = -_2615;
    float _2631 = fma(_2475, _2627, _2629);
    int _2633 = _2625;
    if (!_2575)
    {
        int _2635 = ~_2603;
        int _2637 = _2635 + 1;
        _2633 = _2637;
    }
    int _2639 = _2633;
    float _2641 = _2605 * (-2.0);
    int _2643 = abs(_2619);
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2647 = _2477 * _2645;
    float _2649 = float(_2639);
    float _2651 = _2631 * _2631;
    float _2653 = float(_2643);
    float _2655 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2657 = -_2647;
    float _2659 = fma(_2559, _2655, _2657);
    int _2661 = ~_2505;
    int _2663 = _2661 + 1;
    int _2665 = _2663 + 1;
    float _2667 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2669 = -_2481;
    float _2671 = fma(_2477, _2667, _2669);
    float _2673 = fma(_2641, _2593, _2593);
    int _2675 = _2665;
    if (!_2533)
    {
        int _2677 = ~_2505;
        int _2679 = _2677 + 1;
        _2675 = _2679;
    }
    int _2681 = _2675;
    float _2683 = fma(_2503, _2641, _2503);
    bool _2685 = !_2445;
    int _2687 = _2685 ? 0 : 1;
    float _2689 = fma(_2607, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2673);
    float _2691 = _2653 * _2649;
    float _2693 = fma(_2659, _2659, _2651);
    int _2695 = abs(_2687);
    float _2697 = fma(_2683, _2611, _2689);
    float _2699 = _2691 * (-2.0);
    float _2701 = _2427 + (-0.5);
    float _2703 = float(_2695);
    float _2705 = _2697 * 0.15915493667125701904296875;
    float _2707 = fma(_2699, _2597, _2597);
    float _2709 = float(_2681);
    float _2711 = fma(_2485, _2699, _2485);
    float _2713 = fma(_2701, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2707);
    float _2715 = _2425 + _2427;
    float _2717 = _2703 * _2709;
    float _2719 = _2425 + (-0.5);
    float _2721 = fma(_2711, _2611, _2713);
    float _2723 = _2715 + (-1.0);
    float _2725 = _2717 * (-2.0);
    float _2727 = fma(_2671, _2671, _2693);
    float _2729 = _2721 * 0.15915493667125701904296875;
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2733 = fma(_2725, _2595, _2595);
    float _2735 = _2705 * 6.283185482025146484375;
    float _2737 = sin(_2735);
    float _2739 = fma(_2731, _2725, _2731);
    float _2741 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2733);
    float _2743 = _977 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2745 = _2331 * 3.883221149444580078125;
    float _2747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2371);
    float _2749 = fma(_2739, _2611, _2741);
    float _2751 = _2705 * 6.283185482025146484375;
    float _2753 = cos(_2751);
    float _2755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2349);
    float _2757 = _2453 * _2747;
    float _2759 = _2749 * 0.15915493667125701904296875;
    float _2761 = _2353 * 2.0;
    float _2763 = _2743 * _2755;
    float _2765 = _2745 * 0.15915493667125701904296875;
    float _2767 = -_2151;
    float _2769 = _2767 + _2333;
    float _2771 = _2729 * 6.283185482025146484375;
    float _2773 = sin(_2771);
    float _2775 = -_2761;
    float _2777 = fma(_2435, _2775, _2435);
    float _2779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2329);
    bool _2781 = _2371 != 0.0;
    bool _2783 = isnan(_2371);
    bool _2785 = _2781 || _2783;
    bool _2787 = isnan(0.0);
    bool _2789 = _2785 || _2787;
    float _2791 = fma(_2285, _2769, _2151);
    float _2793 = fma(_2353, 3.1415927410125732421875, _2777);
    float _2795 = _2451 * _2779;
    bool _2797 = _2349 == 0.0;
    bool _2799 = !_2789;
    bool _2801 = _2797 && _2799;
    float _2803 = _2729 * 6.283185482025146484375;
    float _2805 = cos(_2803);
    float _2807 = fma(_2371, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2791);
    bool _2809 = _2329 == 0.0;
    bool _2811 = _2809 && _2801;
    float _2813 = _2759 * 6.283185482025146484375;
    float _2815 = sin(_2813);
    float _2817 = _2753 * _2773;
    float _2819 = _2737 * _2773;
    float _2821 = rsqrt(_2727);
    float _2823 = _2737 * _2805;
    float _2825 = _2753 * _2805;
    float _2827 = _2759 * 6.283185482025146484375;
    float _2829 = cos(_2827);
    float _2831 = -_2817;
    float _2833 = fma(_2815, _2823, _2831);
    float _2835 = -_2823;
    float _2837 = fma(_2815, _2817, _2835);
    float _2839 = fma(_2815, _2819, _2825);
    float _2841 = fma(_2815, _2825, _2819);
    float _2843 = _2837 * _2475;
    float _2845 = _2839 * _2475;
    float _2847 = _2671 * _2821;
    float _2849 = _2659 * _2821;
    float _2851 = _2631 * _2821;
    float _2853 = _2839 * _2559;
    float _2855 = _2477 * _2847;
    float _2857 = fma(_2833, _2849, _2845);
    float _2859 = fma(_2841, _2849, _2843);
    float _2861 = _2837 * _2559;
    float _2863 = _2829 * _2773;
    float _2865 = _2829 * _2805;
    float _2867 = _2737 * _2829;
    float _2869 = _2753 * _2829;
    float _2871 = _2863 * _2475;
    float _2873 = -_2855;
    float _2875 = fma(_2559, _2851, _2873);
    float _2877 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2879 = fma(_2833, _2847, _2853);
    float _2881 = fma(_2865, _2849, _2871);
    float _2883 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2885 = fma(_2867, _2875, _2857);
    float _2887 = fma(_2869, _2875, _2859);
    float _2889 = -_2815;
    float _2891 = fma(_2889, _2875, _2881);
    float _2893 = _2475 * _2851;
    float _2895 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2883);
    float _2897 = _2863 * _2559;
    float _2899 = fma(_2841, _2847, _2861);
    float _2901 = -_2893;
    float _2903 = fma(_2477, _2849, _2901);
    float _2905 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2877);
    float _2907 = fma(_2865, _2847, _2897);
    float _2909 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2895);
    float _2911 = fma(_2867, _2903, _2879);
    float _2913 = fma(_2869, _2903, _2899);
    float _2915 = -_2815;
    float _2917 = fma(_2915, _2903, _2907);
    float _2919 = _2757 * _2885;
    float _2921 = _2757 * _2911;
    float _2923 = _2793 * 0.15915493667125701904296875;
    float _2925 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2905);
    float _2927 = fma(_2763, _2891, _2919);
    float _2929 = fma(_2763, _2917, _2921);
    float _2931 = _2765 * 6.283185482025146484375;
    float _2933 = sin(_2931);
    float _2935 = _2909 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2937 = fma(_2795, _2887, _2927);
    float _2939 = _2925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2941 = fma(_2795, _2913, _2929);
    float _2943 = _2559 * _2849;
    float _2945 = _2935 + _2937;
    float _2947 = _2863 * _2477;
    float _2949 = _2923 * 6.283185482025146484375;
    float _2951 = sin(_2949);
    float _2953 = _2939 + _2941;
    float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2957 = _2945 + _2955;
    float _2959 = -_2943;
    float _2961 = fma(_2475, _2847, _2959);
    float _2963 = _2839 * _2477;
    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2967 = _2953 + _2965;
    float _2969 = _2957 * _2957;
    float _2971 = fma(_2865, _2851, _2947);
    float _2973 = fma(_2833, _2851, _2963);
    float _2975 = _2967 * _2967;
    float _2977 = _2837 * _2477;
    float _2979 = _2811 ? _2791 : _2807;
    float _2981 = fma(_2867, _2961, _2973);
    float _2983 = _2969 + _2975;
    float _2985 = fma(_2841, _2851, _2977);
    float _2987 = -_2815;
    float _2989 = fma(_2987, _2961, _2971);
    float _2991 = -_2293;
    float _2993 = fma(_2951, _2933, _2991);
    float _2995 = _2757 * _2981;
    float _2997 = _2765 * 6.283185482025146484375;
    float _2999 = cos(_2997);
    float _3001 = _2979 * _2979;
    float _3003 = fma(_2285, _2993, _2293);
    float _3005 = fma(_2763, _2989, _2995);
    float _3007 = fma(_2869, _2961, _2985);
    float _3009 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2461);
    float _3011 = fma(_2329, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3003);
    float _3013 = sqrt(_2983);
    float _3015 = fma(_2795, _3007, _3005);
    float _3017 = _3009 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3019 = _2811 ? _3003 : _3011;
    float _3021 = _3017 + _3015;
    float _3023 = fma(_3019, _3019, _3001);
    float _3025 = -_2291;
    float _3027 = fma(_2951, _2999, _3025);
    float _3029 = rsqrt(_3023);
    float _3031 = fma(_2285, _3027, _2291);
    bool _3033 = _3013 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3035 = _2969;
    float _3037 = _2975;
    float _3039 = _2945;
    float _3041 = _2953;
    float _3043 = _2791;
    float _3045 = _3031;
    float _3047 = _3003;
    float _3049 = _3011;
    if (!_3033)
    {
        _445 = _3021;
    }
    float _3051 = _445;
    bool _3053 = !_3033;
    float _3055 = _3051;
    if (!_3053)
    {
        float _3057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3061 = _3013 + _3059;
        float _3063 = rsqrt(_2983);
        float _3065 = _3061 * _3057;
        float _3067 = _3021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3069 = _3065 * 0.15915493667125701904296875;
        float _3071 = _3069 * 6.283185482025146484375;
        float _3073 = sin(_3071);
        float _3075 = _3069 * 6.283185482025146484375;
        float _3077 = cos(_3075);
        float _3079 = fma(_3073, _3067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3081 = _3063 * _3079;
        float _3083 = _3077 + (-1.0);
        float _3085 = _2957 * _3081;
        float _3087 = _2967 * _3081;
        float _3089 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3091 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3093 = _3085 * _3085;
        float _3095 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3097 = fma(_3021, _3077, _3089);
        float _3099 = _3087 * _3087;
        _3055 = _3097;
        _3035 = _3093;
        _3037 = _3099;
        _3039 = _3091;
        _3041 = _3095;
    }
    float _3101 = _3055;
    float _3103 = _3035;
    float _3105 = _3037;
    float _3107 = _3039;
    float _3109 = _3041;
    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3113 = _3101 + _3111;
    float _3115 = _3101;
    if (!_2811)
    {
        _3043 = _2807;
    }
    float _3117 = _3043;
    float _3119 = _2979 * _3029;
    if (!_2811)
    {
        float _3121 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3031);
        _3045 = _3121;
    }
    float _3123 = _3045;
    float _3125 = fma(_3113, _3113, _3103);
    if (!_2811)
    {
        _3047 = _3011;
    }
    float _3127 = _3047;
    float _3129 = _2885 * _3117;
    float _3131 = _2981 * _3117;
    float _3133 = _3125 + _3105;
    float _3135 = _2911 * _3117;
    float _3137 = _3019 * _3029;
    float _3139 = -_3119;
    float _3141 = _2887 * _3139;
    float _3143 = -_3119;
    float _3145 = _3007 * _3143;
    float _3147 = -_3119;
    float _3149 = _2913 * _3147;
    float _3151 = sqrt(_3133);
    float _3153 = fma(_2891, _3123, _3129);
    float _3155 = fma(_2989, _3123, _3131);
    float _3157 = fma(_2917, _3123, _3135);
    float _3159 = fma(_2885, _3137, _3141);
    float _3161 = fma(_2981, _3137, _3145);
    float _3163 = fma(_2911, _3137, _3149);
    float _3165 = fma(_2887, _3127, _3153);
    float _3167 = fma(_3007, _3127, _3155);
    float _3169 = fma(_2913, _3127, _3157);
    out.m_67.x = _2181;
    out.m_67.y = _2110;
    out.m_67.z = _2116;
    out.m_67.w = _2114;
    out.m_69.x = _2891;
    out.m_69.y = _2989;
    out.m_69.z = _2917;
    bool _3171 = _3151 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3173 = isnan(_3151);
    bool _3175 = _3171 || _3173;
    bool _3177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3179 = _3175 || _3177;
    out.m_71.x = _3159;
    out.m_71.y = _3161;
    out.m_71.z = _3163;
    out.m_73.x = _3165;
    out.m_73.y = _3167;
    out.m_73.z = _3169;
    float _3181 = _3129;
    if (!_3179)
    {
        _3181 = 1.0;
    }
    float _3183 = _3181;
    bool _3185 = !_3179;
    float _3187 = _3183;
    if (!_3185)
    {
        bool _3189 = _3151 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3191 = isnan(_3151);
        bool _3193 = _3189 || _3191;
        bool _3195 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3197 = _3193 || _3195;
        if (!_3197)
        {
            float _3199 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3201 = _3151 + _3199;
            float _3203 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3205 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3203;
            float _3207 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3209 = _3207 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3211 = 1.0 / _3205;
            float _3213 = _3201 * _3211;
            float _3215 = fma(_3213, _3209, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3187 = _3215;
            _3217 = true;
        }
        else
        {
            bool _3219 = _3151 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3221 = isnan(_3151);
            bool _3223 = _3219 || _3221;
            bool _3225 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3227 = _3223 || _3225;
            if (!_3227)
            {
                float _3229 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3231 = _3151 + _3229;
                float _3233 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3235 = _3233 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3237 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3239 = _3237 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3241 = 1.0 / _3235;
                float _3243 = _3231 * _3241;
                float _3245 = fma(_3243, _3239, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3187 = _3245;
                _3217 = true;
            }
            else
            {
                _3187 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3217 = false;
    float _3247 = _3187;
    float _3249 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3251 = _3101 + _3249;
    float _3253 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3255 = _3107 + _3253;
    float _3257 = fma(_3251, _3247, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3259 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3261 = _3109 + _3259;
    float _3263 = fma(_3255, _3247, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3267 = _3257 + _3265;
    float _3269 = fma(_3261, _3247, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3273 = _3263 + _3271;
    float _3275 = _3267 * _3267;
    float _3277 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3279 = _3269 + _3277;
    float _3281 = fma(_3273, _3273, _3275);
    float _3283 = fma(_3279, _3279, _3281);
    float _3285 = rsqrt(_3283);
    float _3287 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3289 = _3273 * _3287;
    float _3291 = _3279 * _3287;
    float _3293 = _3289 * _3289;
    float _3295 = _3291 * _3291;
    float _3297 = _3293 + _3295;
    float _3299 = sqrt(_3297);
    bool _3301 = _3299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3305 = _3299 + _3303;
    float _3307 = _3285;
    float _3309 = _3305;
    float _3311 = _3247;
    float _3313 = _3267;
    float _3315 = _3289;
    if (_3301)
    {
        float _3317 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3307 = _3317;
    }
    float _3319 = _3307;
    if (_3301)
    {
        float _3321 = rsqrt(_3297);
        _3115 = _3321;
    }
    float _3323 = _3115;
    float _3325 = _3323;
    if (_3301)
    {
        float _3327 = _3305 * _3319;
        _3309 = _3327;
    }
    float _3329 = _3309;
    float _3331 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3301)
    {
        float _3333 = _3329 * 0.15915493667125701904296875;
        _3311 = _3333;
    }
    float _3335 = _3311;
    float _3337 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3331);
    float _3339 = _3279;
    if (_3301)
    {
        float _3341 = _3335 * 6.283185482025146484375;
        float _3343 = sin(_3341);
        _3339 = _3343;
    }
    float _3345 = _3339;
    float _3347 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3349 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3337);
    float _3351 = precise::max(0.0, _3347);
    float _3353 = _3319;
    float _3355 = _3351;
    if (_3301)
    {
        float _3357 = _3335 * 6.283185482025146484375;
        float _3359 = cos(_3357);
        _3353 = _3359;
    }
    float _3361 = _3353;
    float _3363 = -_3287;
    float _3365 = -_3351;
    float _3367 = fma(_3267, _3363, _3365);
    if (_3301)
    {
        float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3313 = _3369;
    }
    float _3371 = _3313;
    float _3373 = sqrt(_3283);
    float _3375 = _3371;
    float _3377 = _3345;
    if (_3301)
    {
        float _3379 = fma(_3345, _3371, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3375 = _3379;
    }
    float _3381 = _3375;
    float _3383 = _3381;
    if (!_3301)
    {
        _3377 = _3291;
    }
    float _3385 = _3377;
    float _3387 = _3385;
    if (_3301)
    {
        float _3389 = _3361 + (-1.0);
        _3355 = _3389;
    }
    float _3391 = _3355;
    float _3393 = _3391;
    if (_3301)
    {
        float _3395 = _3323 * _3381;
        _3049 = _3395;
    }
    float _3397 = _3049;
    if (!_3301)
    {
        _3325 = _3367;
    }
    float _3399 = _3325;
    float _3401 = _3399;
    if (_3301)
    {
        float _3403 = _3391 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3393 = _3403;
    }
    float _3405 = _3393;
    float _3407 = _3405;
    if (_3301)
    {
        float _3409 = _3289 * _3397;
        _3315 = _3409;
    }
    float _3411 = _3315;
    if (!_3301)
    {
        _3383 = _3293;
    }
    float _3413 = _3383;
    float _3415 = _3413;
    if (_3301)
    {
        float _3417 = _3291 * _3397;
        _3387 = _3417;
    }
    float _3419 = _3387;
    if (_3301)
    {
        float _3421 = fma(_3367, _3361, _3405);
        _3401 = _3421;
    }
    float _3423 = _3401;
    if (_3301)
    {
        float _3425 = _3411 * _3411;
        _3415 = _3425;
    }
    float _3427 = _3415;
    if (!_3301)
    {
        _3407 = _3295;
    }
    float _3429 = _3407;
    float _3431 = _3429;
    if (_3301)
    {
        float _3433 = _3419 * _3419;
        _3431 = _3433;
    }
    float _3435 = _3431;
    float _3437 = fma(_3423, _3423, _3427);
    float _3439 = _3437 + _3435;
    float _3441 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3445 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3443);
    float _3447 = precise::clamp(_3445, 0.0, 1.0);
    float _3449 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3451 = rsqrt(_3439);
    float _3453 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3441);
    float _3455 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3457 = -_3447;
    float _3459 = _3457 + 1.0;
    float _3461 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3453);
    float _3463 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3465 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3455);
    float _3467 = _3461 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3469 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3463);
    float _3471 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3465);
    float _3473 = abs(_3459);
    float _3475 = log2(_3473);
    float _3477 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3479 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3469);
    float _3481 = _3471 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3483 = _3451 * _3411;
    float _3485 = -_3477;
    float _3487 = fma(_3485, _3449, 1.0);
    float _3489 = _3479 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3491 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3493 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3495 = _3451 * _3419;
    float _3497 = _3349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3499 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3491);
    float _3501 = _3451 * _3423;
    float _3503 = log2(_3487);
    float _3505 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3507 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3499);
    float _3509 = -_3493;
    float _3511 = fma(_3501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3509);
    float _3513 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3515 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3505);
    float _3517 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3507);
    float _3519 = -_3495;
    float _3521 = fma(_3519, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3511);
    float _3523 = exp2(_3513);
    float _3525 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3527 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3515);
    float _3529 = fma(_3521, -0.5, 0.5);
    float _3531 = fma(_3521, 0.5, 0.5);
    float _3533 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3525);
    float _3535 = _3501 + 1.0;
    float _3537 = 1.0 / _3517;
    float _3539 = fma(_3531, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3541 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3533);
    float _3543 = _3503 * 0.693147182464599609375;
    float _3545 = fma(_3531, _3539, -0.212114393711090087890625);
    float _3547 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3541);
    float _3549 = sqrt(_3529);
    float _3551 = -_3501;
    float _3553 = fma(_3523, _3535, _3551);
    float _3555 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3527);
    float _3557 = fma(_3531, _3545, 1.570728778839111328125);
    float _3559 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3561 = fma(_3553, 0.5, 0.5);
    float _3563 = _3547 * _3537;
    float _3565 = _3555 * _3537;
    float _3567 = fma(_3563, 0.5, 0.5);
    float _3569 = fma(_3565, -0.5, 0.5);
    float _3571 = _3549 * 0.636619746685028076171875;
    float3 _9016 = float3(_3567, _3569, _3559);
    float _3573 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9016, float3(0.0), isnan(_9016)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9016, float3(0.0), isnan(_9016)), level(0.0)).x;
    float3 _9027 = float3(_3567, _3569, _3559);
    float4 _3575 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9027, float3(0.0), isnan(_9027)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9027, float3(0.0), isnan(_9027)), level(0.0)).xyzw;
    float _3577 = _3575.x;
    float _3579 = _3575.y;
    float _3581 = _3575.z;
    float _3583 = _3575.w;
    float _3585 = -_3557;
    float _3587 = fma(_3571, _3585, 1.0);
    float2 _9048 = float2(_3587, _3561);
    float3 _3591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9048, float2(0.0), isnan(_9048)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9048, float2(0.0), isnan(_9048)), level(0.0)).xyz;
    float _3593 = _3591.x;
    float _3595 = _3591.y;
    float _3597 = _3591.z;
    float _3599 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3601 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2935;
    out.m_75.y = _3017;
    out.m_75.z = _2939;
    float _3603 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3601);
    float _3605 = exp2(_3599);
    out.m_49.x = 1.0;
    float _3607 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3603);
    out.m_77.x = _3263;
    out.m_77.y = _3257;
    out.m_77.z = _3269;
    float _3609 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3607);
    float _3611 = _3609 + _3517;
    out.gl_Position.x = _3547;
    out.gl_Position.y = _3555;
    out.gl_Position.z = _3609;
    out.gl_Position.w = _3517;
    float _3613 = -_3605;
    float _3615 = _3613 + 1.0;
    float _3617 = _3615 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3619 = _3611 * 0.5;
    float _3621 = -_3617;
    float _3623 = _3621 + 1.0;
    float _3625 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3619;
    out.m_79.w = _3517;
    out.m_81.w = _3625;
    float _3627 = _3617 * _3573;
    float _3629 = _3583 * _3627;
    float _3631 = _3597 * _3627;
    float _3633 = fma(_3593, _3629, _3577);
    float _3635 = fma(_3595, _3629, _3579);
    float _3637 = _3583 * _3623;
    float _3639 = fma(_3583, _3631, _3581);
    out.m_83.x = _3633;
    out.m_83.y = _3635;
    out.m_83.z = _3639;
    out.m_83.w = _3637;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3217 = false;
    bool _2397 = false;
    bool _2207 = false;
    bool _1645 = false;
    bool _1325 = false;
    bool _1195 = false;
    bool _1091 = false;
    bool _911 = false;
    bool _635 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3696 = as_type<float>(_123);
        out.gl_Position.z = _3696;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = 0.0;
    float _147 = _141;
    if (_137)
    {
        float _149 = float(_107);
        _117 = _149;
    }
    float _151 = _117;
    bool _153 = _141 >= _151;
    bool _155 = !_137;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _125 = as_type<int>(_163);
    }
    int _165 = _125;
    float _167 = as_type<float>(_165);
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3768 = as_type<float>(_165);
        out.gl_Position.z = _3768;
    }
    if (_157)
    {
        return out;
    }
    float _169 = in.m_51.x;
    float _171 = in.m_51.y;
    float _173 = in.m_51.z;
    float _175 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = _175;
    if (!_185)
    {
        float _189 = _175 * _175;
        float _191 = _189 * 0.5;
        _167 = _191;
    }
    float _193 = _167;
    float _195 = 0.0;
    float _197 = _193;
    if (!_185)
    {
        float _199 = _141 * _141;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    if (!_185)
    {
        float _205 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _205;
    }
    float _207 = _197;
    bool _209 = !_185;
    float _211 = _207;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _175 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _175);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _143 = _227;
        _211 = _241;
        _145 = _229;
    }
    float _243 = _143;
    float _245 = _211;
    float _247 = _145;
    bool _249 = !_185;
    float _251 = _243;
    float _253 = _247;
    if (!_249)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _175 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _251 = _267;
        _253 = _261;
        _187 = _273;
    }
    float _275 = _251;
    float _277 = _253;
    float _279 = _187;
    float _281 = _277;
    float _283 = _275;
    if (!_185)
    {
        _281 = _141;
    }
    float _285 = _281;
    float _287 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _285;
    if (!_185)
    {
        float _291 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _291;
    }
    float _293 = _283;
    bool _295 = !_185;
    float _297 = _293;
    if (!_295)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _141 * _301;
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = 1.0 / _309;
        float _313 = _303 * 0.693147182464599609375;
        float _315 = exp2(_305);
        float _317 = 1.0 / _313;
        float _319 = _315 + (-1.0);
        float _321 = -_319;
        float _323 = fma(_321, _317, _141);
        float _325 = _323 * _311;
        float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _327;
    }
    float _329 = _297;
    bool _331 = !_185;
    if (!_331)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _141 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _289 = _351;
    }
    float _353 = _289;
    float _355 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = fma(_279, _171, _287);
    float _359 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_353, _171, _355);
    float _365 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = fma(_279, _169, _359);
    float _371 = fma(_353, _169, _361);
    float _373 = -_363;
    float _375 = _357 + _373;
    float _377 = fma(_279, _173, _365);
    float _379 = fma(_353, _173, _367);
    float _381 = -_371;
    float _383 = _369 + _381;
    float _385 = _375 * _375;
    float _387 = in.m_53.w;
    float _389 = -_379;
    float _391 = _377 + _389;
    float _393 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = fma(_383, _383, _385);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _401 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _403 = fma(_391, _391, _395);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _407 = in.m_46.x;
    float _409 = in.m_46.y;
    float _411 = in.m_46.z;
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _399);
    float _415 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _401);
    float _417 = sqrt(_403);
    float _419 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _405);
    float _421 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _413);
    bool _423 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan(9.9999999747524270787835121154785e-07);
    bool _431 = _427 || _429;
    float _433 = fma(_369, _387, _407);
    float _435 = fma(_357, _387, _409);
    float _437 = fma(_377, _387, _411);
    float _439 = _419;
    float _441 = _415;
    float _443 = _421;
    float _445 = _437;
    if (!_431)
    {
        bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _449 = !_447;
        if (!_449)
        {
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _455 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _461);
            float _469 = _463 * _463;
            float _471 = fma(_465, _465, _469);
            float _473 = fma(_467, _467, _471);
            float _475 = rsqrt(_473);
            float _477 = _475 * 9.9999999747524270787835121154785e-07;
            float _479 = _465 * _477;
            float _481 = _463 * _477;
            float _483 = _467 * _477;
            _439 = _481;
            _441 = _479;
            _443 = _483;
            _485 = true;
        }
        else
        {
            float _487 = _171 * _171;
            float _489 = fma(_169, _169, _487);
            float _491 = fma(_173, _173, _489);
            float _493 = sqrt(_491);
            bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
            bool _497 = isnan(_493);
            bool _499 = _495 || _497;
            bool _501 = isnan(9.9999999747524270787835121154785e-07);
            bool _503 = _499 || _501;
            if (!_503)
            {
                float _505 = _409 * _409;
                float _507 = fma(_407, _407, _505);
                float _509 = fma(_411, _411, _507);
                float _511 = sqrt(_509);
                bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
                bool _515 = isnan(_511);
                bool _517 = _513 || _515;
                bool _519 = isnan(9.9999999747524270787835121154785e-07);
                bool _521 = _517 || _519;
                if (!_521)
                {
                    float _523 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _523);
                    float _527 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _525);
                    float _529 = rsqrt(_527);
                    float _531 = _529 * 9.9999999747524270787835121154785e-07;
                    float _533 = _531 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _531 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = _531 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _535;
                    _441 = _533;
                    _443 = _537;
                    _485 = true;
                }
                else
                {
                    float _539 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _541 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _543 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _545 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
                    float _547 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _541);
                    float _549 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
                    float _551 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
                    float _553 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
                    float _555 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
                    float _557 = _551 * _551;
                    float _559 = fma(_553, _553, _557);
                    float _561 = fma(_555, _555, _559);
                    float _563 = rsqrt(_561);
                    float _565 = _563 * 9.9999999747524270787835121154785e-07;
                    float _567 = _553 * _565;
                    float _569 = _551 * _565;
                    float _571 = _555 * _565;
                    _439 = _569;
                    _441 = _567;
                    _443 = _571;
                    _485 = true;
                }
            }
            else
            {
                float _573 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _575 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _577 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _579 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
                float _581 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
                float _583 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
                float _585 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _579);
                float _587 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _581);
                float _589 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
                float _591 = _585 * _585;
                float _593 = fma(_587, _587, _591);
                float _595 = fma(_589, _589, _593);
                float _597 = rsqrt(_595);
                float _599 = _597 * 9.9999999747524270787835121154785e-07;
                float _601 = _587 * _599;
                float _603 = _585 * _599;
                float _605 = _589 * _599;
                _439 = _603;
                _441 = _601;
                _443 = _605;
            }
        }
    }
    _485 = false;
    float _607 = _439;
    float _609 = _441;
    float _611 = _443;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _615 = !_613;
    float _633;
    if (!_615)
    {
        float _617 = in.m_55.x;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_107);
        float _639 = 1.0 / _637;
        float _641 = _141 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _647 = _643 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _651 = _643 + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _669 = 1.0 / _655;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _673 = _643 + _671;
    float _675 = 1.0 / _663;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _679 = _643 + _677;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _683 = 1.0 / _659;
    float _685 = _673 * _669;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _687;
    float _691 = fma(_689, _685, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _693 = 1.0 / _667;
    float _695 = _647 * _675;
    bool _697 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _699 = isnan(_643);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _709;
    float _713 = -_707;
    float _715 = _713 + 1.0;
    float _717 = _651 * _683;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _719;
    float _723 = fma(_711, _685, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _725 = fma(_721, _685, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _727 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _729 = isnan(_643);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = _679 * _693;
    bool _741 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _743 = isnan(_643);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    bool _753 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _755 = isnan(_643);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = -_751;
    float _767 = _765 + 1.0;
    float _769 = _763 * _715;
    float _771 = -_763;
    float _773 = _771 + 1.0;
    float _775 = _707 * _767;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _781 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _783 = isnan(_643);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = _737 * _773;
    float _795 = -_737;
    float _797 = _795 + 1.0;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = fma(_779, _717, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _809 = _791 * _797;
    float _811 = fma(_801, _717, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _813 = fma(_805, _717, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _815 = _725 * _809;
    float _817 = _691 * _809;
    float _819 = -_791;
    float _821 = _819 + 1.0;
    float _823 = _723 * _809;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _829;
    float _833 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].x, _815);
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].y, _817);
    float _837 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].z, _823);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _839;
    float _843 = fma(_811, _793, _833);
    float _845 = fma(_827, _695, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _847 = fma(_813, _793, _835);
    float _849 = fma(_807, _793, _837);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _859 = fma(_831, _695, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _861 = fma(_841, _695, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _867 = fma(_845, _769, _843);
    float _869 = fma(_853, _739, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _871 = fma(_857, _739, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _873 = fma(_865, _739, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _875 = fma(_859, _769, _847);
    float _877 = fma(_861, _769, _849);
    float _879 = fma(_869, _775, _867);
    float _881 = fma(_871, _775, _875);
    float _883 = fma(_873, _775, _877);
    float _885 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[147].x, _879);
    float _887 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[147].y, _881);
    float _889 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[147].z, _883);
    bool _891 = !_681;
    float _909;
    if (!_891)
    {
        float _893 = in.m_55.x;
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _897 = _893 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _901 = _899 * _895;
        float _903 = floor(_901);
        float _905 = -_903;
        float _907 = _901 + _905;
        _909 = _907;
        _911 = true;
    }
    else
    {
        float _913 = float(_107);
        float _915 = 1.0 / _913;
        float _917 = _141 * _915;
        _909 = _917;
    }
    _911 = false;
    float _919 = _909;
    float _921 = in.m_53.x;
    float _923 = in.m_53.y;
    float _925 = in.m_53.z;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _929 = _919 + _927;
    bool _931 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _933 = isnan(_919);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _951 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _953 = isnan(_919);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = 1.0 / _949;
    bool _965 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _967 = 1.0 / _945;
    float _969 = _889 * _925;
    float _971 = _887 * _923;
    float _973 = -_941;
    float _975 = _973 + 1.0;
    float _977 = _885 * _921;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _979;
    float _983 = _929 * _967;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _987 = _919 + _985;
    bool _989 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _991 = isnan(_919);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_981, _983, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1003 = _987 * _963;
    float _1005 = _999 * _975;
    float _1007 = -_999;
    float _1009 = _1007 + 1.0;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1015;
    float _1019 = _961 * _1009;
    float _1021 = fma(_1013, _983, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1023 = fma(_1017, _983, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1025 = -_961;
    float _1027 = _1025 + 1.0;
    float _1029 = _1001 * _1019;
    float _1031 = _1021 * _1019;
    float _1033 = _1023 * _1019;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1047 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1031);
    float _1049 = fma(_1037, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1051 = fma(_1041, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1053 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1029);
    float _1055 = fma(_1045, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1057 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1033);
    float _1059 = fma(_1049, _1005, _1047);
    float _1061 = fma(_1051, _1005, _1053);
    float _1063 = fma(_1055, _1005, _1057);
    float _1065 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1059);
    float _1067 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1061);
    float _1069 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1063);
    bool _1071 = !_965;
    float _1089;
    if (!_1071)
    {
        float _1073 = in.m_55.x;
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1077 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1079 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _1081 = _1079 * _1075;
        float _1083 = floor(_1081);
        float _1085 = -_1083;
        float _1087 = _1081 + _1085;
        _1089 = _1087;
        _1091 = true;
    }
    else
    {
        float _1093 = float(_107);
        float _1095 = 1.0 / _1093;
        float _1097 = _141 * _1095;
        _1089 = _1097;
    }
    _1091 = false;
    float _1099 = _1089;
    bool _1101 = _1099 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1103 = isnan(_1099);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1117 = _1099 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1119 = isnan(_1099);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _1099 + _1133;
    float _1137 = -_1111;
    float _1139 = _1137 + 1.0;
    bool _1141 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1143 = 1.0 / _1115;
    float _1145 = _1127 * _1139;
    float _1147 = -_1127;
    float _1149 = _1147 + 1.0;
    float _1151 = _1131 * _1143;
    float _1153 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1155 = fma(_1151, _1135, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1157 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1155 * _1145;
    float _1163 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1165 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1161);
    float _1169 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1167);
    float _1173 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1169;
    out.m_57.y = _1165;
    out.m_57.z = _1159;
    out.m_57.w = _1173;
    bool _1175 = !_1141;
    float _1193;
    if (!_1175)
    {
        float _1177 = in.m_55.x;
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1181 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _1185 = _1183 * _1179;
        float _1187 = floor(_1185);
        float _1189 = -_1187;
        float _1191 = _1185 + _1189;
        _1193 = _1191;
        _1195 = true;
    }
    else
    {
        float _1197 = float(_107);
        float _1199 = 1.0 / _1197;
        float _1201 = _141 * _1199;
        _1193 = _1201;
    }
    _1195 = false;
    float _1203 = _1193;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1207 = _1203 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1211 = _1209 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1213 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1215 = isnan(_1203);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1229 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1231 = isnan(_1203);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1241;
    bool _1245 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1247 = isnan(_1203);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = 1.0 / _1211;
    float _1259 = -_1223;
    float _1261 = _1259 + 1.0;
    bool _1263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1265 = 1.0 / _1227;
    float _1267 = _1243 * _1257;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1273 = fma(_1267, _1207, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1275 = _1239 * _1261;
    float _1277 = -_1255;
    float _1279 = _1277 + 1.0;
    float _1281 = -_1239;
    float _1283 = _1281 + 1.0;
    float _1285 = _1271 * _1265;
    float _1287 = _1273 * _1275;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1291 = _1203 + _1289;
    float _1293 = _1223 * _1279;
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1287);
    float _1297 = fma(_1285, _1291, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1299 = fma(_1297, _1293, _1295);
    float _1301 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1299);
    float _1303 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1303;
    bool _1305 = !_1263;
    float _1323;
    if (!_1305)
    {
        float _1307 = in.m_55.x;
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1311 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _1315 = _1313 * _1309;
        float _1317 = floor(_1315);
        float _1319 = -_1317;
        float _1321 = _1315 + _1319;
        _1323 = _1321;
        _1325 = true;
    }
    else
    {
        float _1327 = float(_107);
        float _1329 = 1.0 / _1327;
        float _1331 = _141 * _1329;
        _1323 = _1331;
    }
    _1325 = false;
    float _1333 = _1323;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1337 = _1333 + _1335;
    bool _1339 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1341 = isnan(_1333);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1355 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1357 = isnan(_1333);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1367;
    bool _1371 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1373 = isnan(_1333);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = -_1349;
    float _1385 = _1383 + 1.0;
    float _1387 = 1.0 / _1353;
    bool _1389 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1391 = isnan(_1333);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1403 = _1401 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1405 = 1.0 / _1403;
    bool _1407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1409 = _1369 * _1387;
    float _1411 = -_1365;
    float _1413 = _1411 + 1.0;
    float _1415 = _1365 * _1385;
    bool _1417 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1419 = isnan(_1333);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    float _1429 = fma(_1409, _1337, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1431 = _1381 * _1413;
    float _1433 = -_1381;
    float _1435 = _1433 + 1.0;
    float _1437 = -_1427;
    float _1439 = _1437 + 1.0;
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1443 = _1441 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1445 = _1427 * _1435;
    bool _1447 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1449 = isnan(_1333);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = -_1399;
    float _1461 = _1459 + 1.0;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1467 = _1399 * _1439;
    bool _1469 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1471 = isnan(_1333);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = _1457 * _1461;
    float _1483 = 1.0 / _1465;
    float _1485 = -_1457;
    float _1487 = _1485 + 1.0;
    float _1489 = _1479 * _1487;
    float _1491 = -_1479;
    float _1493 = _1491 + 1.0;
    float _1495 = 1.0 / _1443;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1503 = _1501 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1505 = _1429 * _1489;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1509 = _1507 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1511;
    float _1515 = _1503 * _1405;
    float _1517 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1505);
    float _1519 = 1.0 / _1499;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1523 = _1333 + _1521;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1527 = _1525 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1529 = _1513 * _1483;
    float _1531 = fma(_1515, _1523, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1535 = _1333 + _1533;
    float _1537 = 1.0 / _1509;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1543 = fma(_1529, _1535, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1545 = fma(_1531, _1481, _1517);
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1547;
    float _1551 = _1541 * _1495;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1555 = _1333 + _1553;
    float _1557 = 1.0 / _1527;
    float _1559 = fma(_1543, _1467, _1545);
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1565 = _1549 * _1519;
    float _1567 = fma(_1551, _1555, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1571 = _1333 + _1569;
    bool _1573 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1575 = isnan(_1333);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1581 = _1577 || _1579;
    float _1583 = float(_1581);
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1587 = _1333 + _1585;
    float _1589 = _1563 * _1537;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1591;
    float _1595 = fma(_1565, _1571, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1597 = fma(_1567, _1445, _1559);
    float _1599 = fma(_1589, _1587, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1601 = -_1583;
    float _1603 = _1601 + 1.0;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1607 = _1333 + _1605;
    float _1609 = fma(_1595, _1431, _1597);
    float _1611 = _1593 * _1557;
    float _1613 = _1349 * _1603;
    float _1615 = fma(_1599, _1415, _1609);
    float _1617 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1619 = fma(_1617, _1613, _1615);
    float _1621 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1619);
    float _1623 = precise::clamp(_1621, 0.0, 1.0);
    bool _1625 = !_1407;
    float _1643;
    if (!_1625)
    {
        float _1627 = in.m_55.x;
        float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1631 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[14].z, _141);
        float _1635 = _1633 * _1629;
        float _1637 = floor(_1635);
        float _1639 = -_1637;
        float _1641 = _1635 + _1639;
        _1643 = _1641;
        _1645 = true;
    }
    else
    {
        float _1647 = float(_107);
        float _1649 = 1.0 / _1647;
        float _1651 = _141 * _1649;
        _1643 = _1651;
    }
    _1645 = false;
    float _1653 = _1643;
    int _1655 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1657 = _1655;
    int _1659 = 0;
    int _1661 = _98(_1657, _1659, (*spvDescriptorSet0.support_buffer));
    float _1663 = in.m_61.z;
    float _1665 = trunc(_1663);
    int _1667 = int(_1665);
    int _1669 = _1661 + (-1);
    float _1671 = float(_1669);
    float _1673 = _1623 * _1671;
    float _1675 = trunc(_1673);
    int _1677 = int(_1675);
    int _1679 = _1677;
    int _1681 = 0;
    int _1683 = _99(_1679, _1681, (*spvDescriptorSet0.support_buffer));
    int _1685 = _1667;
    int _1687 = 0;
    int _1689 = _99(_1685, _1687, (*spvDescriptorSet0.support_buffer));
    float4 _1692 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1683, _1689)), 0).xyzw;
    float _1694 = _1692.x;
    float _1696 = _1692.y;
    float _1698 = _1692.z;
    float _1700 = _1692.w;
    float _1702 = in.m_55.w;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1716 = 1.0 / _1706;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1724 = _1722 != 0;
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1728 = _1726 != 0;
    float _1730 = 1.0 / _1710;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1734 = _1732 != 0;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1736;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1742 = _1740 != 0;
    bool _1744 = _1702 > 0.5;
    bool _1746 = _1744 && _1724;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1752 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1754 = isnan(_1653);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = 1.0 / _1714;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1766;
    float _1770 = _1750 * _1716;
    bool _1772 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1774 = isnan(_1653);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    float _1784 = -_1762;
    float _1786 = _1784 + 1.0;
    bool _1788 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1790 = isnan(_1653);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = 1.0 / _1720;
    bool _1802 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1804 = isnan(_1653);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = _1768 * _1730;
    float _1816 = _1782 * _1786;
    bool _1818 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1820 = isnan(_1653);
    bool _1822 = _1818 || _1820;
    bool _1824 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1826 = _1822 || _1824;
    float _1828 = float(_1826);
    float _1830 = -_1812;
    float _1832 = _1830 + 1.0;
    float _1834 = -_1782;
    float _1836 = _1834 + 1.0;
    float _1838 = _1738 * _1764;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1844 = _1762 * _1832;
    bool _1846 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1848 = isnan(_1653);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1862 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1864 = isnan(_1653);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = _1842 * _1800;
    float _1876 = 1.0 / _1860;
    float _1878 = -_1856;
    float _1880 = _1878 + 1.0;
    float _1882 = -_1828;
    float _1884 = _1882 + 1.0;
    float _1886 = _1856 * _1836;
    float _1888 = _1828 * _1880;
    float _1890 = _1798 * _1884;
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1894 = _1653 + _1892;
    float _1896 = -_1798;
    float _1898 = _1896 + 1.0;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1902 = _1900 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1904;
    float _1908 = fma(_1838, _1894, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1910 = _1872 * _1898;
    float _1912 = 1.0 / _1902;
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1916 = _1653 + _1914;
    float _1918 = _1908 * _1910;
    float _1920 = -_1872;
    float _1922 = _1920 + 1.0;
    float _1924 = _1906 * _1876;
    float _1926 = fma(_1770, _1916, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1928 = in.m_61.x;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1932 = _1653 + _1930;
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1918);
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1940 = in.m_61.y;
    float _1942 = fma(_1814, _1932, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1944 = fma(_1926, _1890, _1934);
    float _1946 = _1890;
    float _1948 = _1812;
    float _1950 = _1844;
    int _1952 = as_type<int>(_1653);
    if (_1728)
    {
        float _1954 = in.m_55.x;
        _1946 = _1954;
    }
    float _1956 = _1946;
    float _1958 = _1938 * _1912;
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1962 = _1653 + _1960;
    float _1964 = fma(_1942, _1888, _1944);
    bool _1966 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1968 = isnan(_1653);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1980 = _1653 + _1978;
    float _1982 = fma(_1874, _1962, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1986 = _1984 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1994 = _1653 + _1992;
    float _1996 = fma(_1924, _1980, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1998 = fma(_1982, _1886, _1964);
    float _2000 = -_1976;
    float _2002 = _2000 + 1.0;
    float _2004 = 1.0 / _1986;
    float _2006 = fma(_1958, _1994, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2008 = fma(_1996, _1816, _1998);
    float _2010 = _1812 * _2002;
    if (!_1728)
    {
        _1948 = _1928;
    }
    float _2012 = _1948;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2016 = _2012;
    if (_1734)
    {
        float _2018 = in.m_55.z;
        _2014 = _2018;
    }
    float _2020 = _2014;
    float _2022 = fma(_2006, _1844, _2008);
    float _2024 = -_1940;
    float _2026 = _2024 + 1.0;
    int _2028 = as_type<int>(_1940);
    if (!_1728)
    {
        _1950 = _2012;
    }
    float _2030 = _1950;
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2034 = _1653 + _2032;
    float _2036 = _2030;
    if (_1728)
    {
        _2016 = _1928;
    }
    float _2038 = _2016;
    float _2040 = in.m_55.y;
    float _2042 = _1746 ? _2026 : _1940;
    bool _2044 = false;
    float _2046 = _2038;
    if (_1728)
    {
        bool _2048 = _1956 > 0.5;
        _2044 = _2048;
    }
    bool _2050 = _2044;
    if (_1728)
    {
        float _2052 = -_2038;
        float _2054 = _2052 + 1.0;
        _1952 = as_type<int>(_2054);
    }
    int _2056 = _1952;
    float _2058 = _1990 * _2004;
    float _2060 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1728)
    {
        float _2062 = _2050 ? as_type<float>(_2056) : _2038;
        _2036 = _2062;
    }
    float _2064 = _2036;
    float _2066 = fma(_2058, _2034, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    int _2068 = _1677 + 1;
    float _2070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2072 = fma(_2066, _2010, _2022);
    int _2074 = min(_1669, _2068);
    int _2076 = as_type<int>(_2066);
    if (_1734)
    {
        float _2078 = -_2038;
        float _2080 = _2078 + 1.0;
        _2076 = as_type<int>(_2080);
    }
    int _2082 = _2076;
    bool _2084 = false;
    if (_1734)
    {
        bool _2086 = _2020 > 0.5;
        _2084 = _2086;
    }
    bool _2088 = _2084;
    float _2090 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2072);
    float _2092 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1734)
    {
        float _2094 = _2088 ? as_type<float>(_2082) : _2038;
        _2046 = _2094;
    }
    float _2096 = _2046;
    out.m_63.x = _2090;
    bool _2098 = _2040 > 0.5;
    bool _2100 = _2098 && _1742;
    float _2102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2104 = _2100 ? _2026 : _1940;
    float _2106 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2110 = _2106 * _2092;
    float _2112 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2114 = _2060 * _2102;
    float _2116 = _2112 * _2108;
    uint _2119 = as_type<uint>(half2(float2(_1700, 0.0)));
    uint _2121 = extract_bits(_2119, 0u, 8u);
    int _2123 = int(_2121) & 255;
    uint _2125 = extract_bits(_2119, 8u, 8u);
    int _2127 = int(_2125) & 255;
    int _2129 = _2127 << 8;
    int _2131 = _2123 | _2129;
    bool _2133 = _2131 >= 32768;
    int _2135 = _2131 + (-1024);
    int _2137 = _2135;
    if (_2133)
    {
        int _2139 = ~_2131;
        int _2141 = _2139 + 33792;
        int _2143 = _2141 + 1;
        _2137 = _2143;
    }
    int _2145 = _2137;
    int _2147 = _2145 + 30719;
    float _2149 = float(_2147);
    float _2151 = fma(_2149, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2153 = abs(_2151);
    float _2155 = -_2153;
    float _2157 = _2155 + 1.0;
    float _2159 = abs(_2151);
    float _2161 = fma(_2159, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2163 = as_type<int>(_2157) + (-218103808);
    float _2165 = abs(_2151);
    float _2167 = fma(_2165, _2161, -0.212114393711090087890625);
    bool _2169 = uint(_2163) >= 1920991232u;
    float _2171 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2173 = _2151 < 0.0;
    float _2175 = float(_2173);
    float _2177 = abs(_2151);
    float _2179 = fma(_2177, _2167, 1.570728778839111328125);
    float _2181 = _2171 * _2070;
    bool _2183 = !_2169;
    float _2205;
    if (!_2183)
    {
        int _2185 = as_type<int>(_2157);
        int _2187 = as_type<int>(_2020);
        int _2189 = as_type<int>(_1940);
        int _2191 = 11056;
        int _2193;
        int _2195;
        int _2197;
        int _2199;
        int _2201;
        int _2203;
        _96(_2185, _2187, _2189, _2191, _2193, _2195, _2197, _2199, _2201, _2203, out.gl_Position, out.gl_PointSize);
        _2205 = as_type<float>(_2199);
        _2028 = _2201;
        _2207 = true;
    }
    else
    {
        float _2209 = rsqrt(_2157);
        float _2211 = _2157 * _2209;
        float _2213 = _2209 * 0.5;
        float _2215 = -_2211;
        float _2217 = 0.0 + _2215;
        float _2219 = fma(_2213, _2217, 0.5);
        float _2221 = fma(_2211, _2219, _2211);
        float _2223 = -_2221;
        float _2225 = 0.0 + _2223;
        float _2227 = fma(_2221, _2225, _2157);
        float _2229 = fma(_2213, _2227, _2221);
        _2205 = _2229;
    }
    _2207 = false;
    float _2231 = _2205;
    int _2233 = _2028;
    int _2235 = _2074;
    int _2237 = 0;
    int _2239 = _99(_2235, _2237, (*spvDescriptorSet0.support_buffer));
    int _2241 = _1667;
    int _2243 = 0;
    int _2245 = _99(_2241, _2243, (*spvDescriptorSet0.support_buffer));
    float4 _2247 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2239, _2245)), 0).xyzw;
    float _2249 = _2247.x;
    float _2251 = _2247.y;
    float _2253 = _2247.z;
    float _2255 = _2247.w;
    float _2257 = _2179 * _2231;
    float _2259 = _2175 * 2.0;
    float _2261 = _2149 * 3.883221149444580078125;
    float _2263 = floor(_1673);
    float _2265 = -_2259;
    float _2267 = fma(_2257, _2265, _2257);
    float _2269 = _2261 * 0.15915493667125701904296875;
    float _2271 = fma(_2175, 3.1415927410125732421875, _2267);
    float _2273 = _2269 * 6.283185482025146484375;
    float _2275 = cos(_2273);
    float _2277 = _2271 * 0.15915493667125701904296875;
    float _2279 = _2277 * 6.283185482025146484375;
    float _2281 = sin(_2279);
    float _2283 = -_2263;
    float _2285 = _1673 + _2283;
    float _2287 = _2269 * 6.283185482025146484375;
    float _2289 = sin(_2287);
    float _2291 = _2281 * _2275;
    float _2293 = _2281 * _2289;
    uint _2295 = as_type<uint>(half2(float2(_2255, 0.0)));
    uint _2297 = extract_bits(_2295, 0u, 8u);
    int _2299 = int(_2297) & 255;
    uint _2301 = extract_bits(_2295, 8u, 8u);
    int _2303 = int(_2301) & 255;
    int _2305 = _2303 << 8;
    int _2307 = _2299 | _2305;
    bool _2309 = _2307 >= 32768;
    int _2311 = _2307 + (-1024);
    int _2313 = _2311;
    if (_2309)
    {
        int _2315 = ~_2307;
        int _2317 = _2315 + 33792;
        int _2319 = _2317 + 1;
        _2313 = _2319;
    }
    int _2321 = _2313;
    float _2323 = -_1698;
    float _2325 = _2323 + _2253;
    int _2327 = _2321 + 30719;
    float _2329 = fma(_2285, _2325, _1698);
    float _2331 = float(_2327);
    float _2333 = fma(_2331, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2335 = -_1694;
    float _2337 = _2335 + _2249;
    float _2339 = abs(_2333);
    float _2341 = -_2339;
    float _2343 = _2341 + 1.0;
    float _2345 = abs(_2333);
    float _2347 = fma(_2345, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _2349 = fma(_2285, _2337, _1694);
    bool _2351 = _2333 < 0.0;
    float _2353 = float(_2351);
    int _2355 = as_type<int>(_2343) + (-218103808);
    float _2357 = abs(_2333);
    float _2359 = fma(_2357, _2347, -0.212114393711090087890625);
    bool _2361 = uint(_2355) >= 1920991232u;
    float _2363 = -_1696;
    float _2365 = _2363 + _2251;
    float _2367 = abs(_2333);
    float _2369 = fma(_2367, _2359, 1.570728778839111328125);
    float _2371 = fma(_2285, _2365, _1696);
    bool _2373 = !_2361;
    float _2395;
    if (!_2373)
    {
        int _2375 = as_type<int>(_2343);
        int _2377 = as_type<int>(_2277);
        int _2379 = _2233;
        int _2381 = 11936;
        int _2383;
        int _2385;
        int _2387;
        int _2389;
        int _2391;
        int _2393;
        _96(_2375, _2377, _2379, _2381, _2383, _2385, _2387, _2389, _2391, _2393, out.gl_Position, out.gl_PointSize);
        _2395 = as_type<float>(_2389);
        _2397 = true;
    }
    else
    {
        float _2399 = rsqrt(_2343);
        float _2401 = _2343 * _2399;
        float _2403 = _2399 * 0.5;
        float _2405 = -_2401;
        float _2407 = 0.0 + _2405;
        float _2409 = fma(_2403, _2407, 0.5);
        float _2411 = fma(_2401, _2409, _2401);
        float _2413 = -_2411;
        float _2415 = 0.0 + _2413;
        float _2417 = fma(_2411, _2415, _2343);
        float _2419 = fma(_2403, _2417, _2411);
        _2395 = _2419;
    }
    _2397 = false;
    float _2421 = _2395;
    float _2423 = in.m_55.x;
    float _2425 = in.m_55.y;
    float _2427 = in.m_55.z;
    float _2429 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2431 = log2(_2429);
    float _2433 = _607 * _607;
    float _2435 = _2369 * _2421;
    float _2437 = fma(_609, _609, _2433);
    int _2439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2441 = _2439 != 0;
    int _2443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2445 = _2443 != 0;
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2449 = _2447 != 0;
    float _2451 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2453 = _971 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2455 = fma(_611, _611, _2437);
    float _2457 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2459 = rsqrt(_2455);
    float _2461 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2457);
    float _2463 = _2427 * 2.0;
    float _2465 = _2423 * 2.0;
    float _2467 = _2423 + _2427;
    float _2469 = _2425 * 2.0;
    float _2471 = floor(_2465);
    float _2473 = _2467 + (-1.0);
    float _2475 = _2459 * _609;
    float _2477 = _2459 * _607;
    float _2479 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2481 = _2475 * _2479;
    float _2483 = floor(_2463);
    float _2485 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2487 = _2425 + _2423;
    float _2489 = _2487 + (-1.0);
    float _2491 = floor(_2469);
    bool _2493 = _2471 >= 0.0;
    bool _2495 = isnan(_2471);
    bool _2497 = _2493 || _2495;
    bool _2499 = isnan(0.0);
    bool _2501 = _2497 || _2499;
    float _2503 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2505 = _2501 ? 0 : 1;
    bool _2507 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2509 = isnan(0.0);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2515 = _2511 || _2513;
    bool _2517 = _2483 > 0.0;
    bool _2519 = _2483 >= 0.0;
    bool _2521 = isnan(_2483);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan(0.0);
    bool _2527 = _2523 || _2525;
    float _2529 = _2431 * _141;
    int _2531 = _2527 ? 0 : 1;
    bool _2533 = _2471 > 0.0;
    float _2535 = exp2(_2529);
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2539 = 1.0 + _2537;
    bool _2541 = !_2441;
    int _2543 = _2541 ? 0 : 1;
    int _2545 = ~_2531;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    int _2551 = _2549;
    if (!_2517)
    {
        int _2553 = ~_2531;
        int _2555 = _2553 + 1;
        _2551 = _2555;
    }
    int _2557 = _2551;
    float _2559 = _2459 * _611;
    float _2561 = 1.0 / _2539;
    int _2563 = abs(_2543);
    bool _2565 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2567 = isnan(1.0);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2573 = _2569 || _2571;
    bool _2575 = _2491 > 0.0;
    bool _2577 = _2491 >= 0.0;
    bool _2579 = isnan(_2491);
    bool _2581 = _2577 || _2579;
    bool _2583 = isnan(0.0);
    bool _2585 = _2581 || _2583;
    float _2587 = -_2535;
    float _2589 = _2587 + 1.0;
    float _2591 = float(_2563);
    float _2593 = in.m_65.x;
    float _2595 = in.m_65.y;
    float _2597 = in.m_65.z;
    float _2599 = float(_2557);
    float _2601 = _2515 ? _2589 : 0.0;
    int _2603 = _2585 ? 0 : 1;
    float _2605 = _2591 * _2599;
    float _2607 = _2423 + (-0.5);
    if (_2573)
    {
        float _2609 = _2601 * _2561;
        _147 = _2609;
    }
    float _2611 = _147;
    float _2613 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2615 = _2559 * _2613;
    bool _2617 = !_2449;
    int _2619 = _2617 ? 0 : 1;
    int _2621 = ~_2603;
    int _2623 = _2621 + 1;
    int _2625 = _2623 + 1;
    float _2627 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2629 = -_2615;
    float _2631 = fma(_2475, _2627, _2629);
    int _2633 = _2625;
    if (!_2575)
    {
        int _2635 = ~_2603;
        int _2637 = _2635 + 1;
        _2633 = _2637;
    }
    int _2639 = _2633;
    float _2641 = _2605 * (-2.0);
    int _2643 = abs(_2619);
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2647 = _2477 * _2645;
    float _2649 = float(_2639);
    float _2651 = _2631 * _2631;
    float _2653 = float(_2643);
    float _2655 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2657 = -_2647;
    float _2659 = fma(_2559, _2655, _2657);
    int _2661 = ~_2505;
    int _2663 = _2661 + 1;
    int _2665 = _2663 + 1;
    float _2667 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2669 = -_2481;
    float _2671 = fma(_2477, _2667, _2669);
    float _2673 = fma(_2641, _2593, _2593);
    int _2675 = _2665;
    if (!_2533)
    {
        int _2677 = ~_2505;
        int _2679 = _2677 + 1;
        _2675 = _2679;
    }
    int _2681 = _2675;
    float _2683 = fma(_2503, _2641, _2503);
    bool _2685 = !_2445;
    int _2687 = _2685 ? 0 : 1;
    float _2689 = fma(_2607, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2673);
    float _2691 = _2653 * _2649;
    float _2693 = fma(_2659, _2659, _2651);
    int _2695 = abs(_2687);
    float _2697 = fma(_2683, _2611, _2689);
    float _2699 = _2691 * (-2.0);
    float _2701 = _2427 + (-0.5);
    float _2703 = float(_2695);
    float _2705 = _2697 * 0.15915493667125701904296875;
    float _2707 = fma(_2699, _2597, _2597);
    float _2709 = float(_2681);
    float _2711 = fma(_2485, _2699, _2485);
    float _2713 = fma(_2701, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2707);
    float _2715 = _2425 + _2427;
    float _2717 = _2703 * _2709;
    float _2719 = _2425 + (-0.5);
    float _2721 = fma(_2711, _2611, _2713);
    float _2723 = _2715 + (-1.0);
    float _2725 = _2717 * (-2.0);
    float _2727 = fma(_2671, _2671, _2693);
    float _2729 = _2721 * 0.15915493667125701904296875;
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2733 = fma(_2725, _2595, _2595);
    float _2735 = _2705 * 6.283185482025146484375;
    float _2737 = sin(_2735);
    float _2739 = fma(_2731, _2725, _2731);
    float _2741 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2733);
    float _2743 = _977 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2745 = _2331 * 3.883221149444580078125;
    float _2747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2371);
    float _2749 = fma(_2739, _2611, _2741);
    float _2751 = _2705 * 6.283185482025146484375;
    float _2753 = cos(_2751);
    float _2755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2349);
    float _2757 = _2453 * _2747;
    float _2759 = _2749 * 0.15915493667125701904296875;
    float _2761 = _2353 * 2.0;
    float _2763 = _2743 * _2755;
    float _2765 = _2745 * 0.15915493667125701904296875;
    float _2767 = -_2151;
    float _2769 = _2767 + _2333;
    float _2771 = _2729 * 6.283185482025146484375;
    float _2773 = sin(_2771);
    float _2775 = -_2761;
    float _2777 = fma(_2435, _2775, _2435);
    float _2779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2329);
    bool _2781 = _2371 != 0.0;
    bool _2783 = isnan(_2371);
    bool _2785 = _2781 || _2783;
    bool _2787 = isnan(0.0);
    bool _2789 = _2785 || _2787;
    float _2791 = fma(_2285, _2769, _2151);
    float _2793 = fma(_2353, 3.1415927410125732421875, _2777);
    float _2795 = _2451 * _2779;
    bool _2797 = _2349 == 0.0;
    bool _2799 = !_2789;
    bool _2801 = _2797 && _2799;
    float _2803 = _2729 * 6.283185482025146484375;
    float _2805 = cos(_2803);
    float _2807 = fma(_2371, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2791);
    bool _2809 = _2329 == 0.0;
    bool _2811 = _2809 && _2801;
    float _2813 = _2759 * 6.283185482025146484375;
    float _2815 = sin(_2813);
    float _2817 = _2753 * _2773;
    float _2819 = _2737 * _2773;
    float _2821 = rsqrt(_2727);
    float _2823 = _2737 * _2805;
    float _2825 = _2753 * _2805;
    float _2827 = _2759 * 6.283185482025146484375;
    float _2829 = cos(_2827);
    float _2831 = -_2817;
    float _2833 = fma(_2815, _2823, _2831);
    float _2835 = -_2823;
    float _2837 = fma(_2815, _2817, _2835);
    float _2839 = fma(_2815, _2819, _2825);
    float _2841 = fma(_2815, _2825, _2819);
    float _2843 = _2837 * _2475;
    float _2845 = _2839 * _2475;
    float _2847 = _2671 * _2821;
    float _2849 = _2659 * _2821;
    float _2851 = _2631 * _2821;
    float _2853 = _2839 * _2559;
    float _2855 = _2477 * _2847;
    float _2857 = fma(_2833, _2849, _2845);
    float _2859 = fma(_2841, _2849, _2843);
    float _2861 = _2837 * _2559;
    float _2863 = _2829 * _2773;
    float _2865 = _2829 * _2805;
    float _2867 = _2737 * _2829;
    float _2869 = _2753 * _2829;
    float _2871 = _2863 * _2475;
    float _2873 = -_2855;
    float _2875 = fma(_2559, _2851, _2873);
    float _2877 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2879 = fma(_2833, _2847, _2853);
    float _2881 = fma(_2865, _2849, _2871);
    float _2883 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2885 = fma(_2867, _2875, _2857);
    float _2887 = fma(_2869, _2875, _2859);
    float _2889 = -_2815;
    float _2891 = fma(_2889, _2875, _2881);
    float _2893 = _2475 * _2851;
    float _2895 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2883);
    float _2897 = _2863 * _2559;
    float _2899 = fma(_2841, _2847, _2861);
    float _2901 = -_2893;
    float _2903 = fma(_2477, _2849, _2901);
    float _2905 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2877);
    float _2907 = fma(_2865, _2847, _2897);
    float _2909 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2895);
    float _2911 = fma(_2867, _2903, _2879);
    float _2913 = fma(_2869, _2903, _2899);
    float _2915 = -_2815;
    float _2917 = fma(_2915, _2903, _2907);
    float _2919 = _2757 * _2885;
    float _2921 = _2757 * _2911;
    float _2923 = _2793 * 0.15915493667125701904296875;
    float _2925 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2905);
    float _2927 = fma(_2763, _2891, _2919);
    float _2929 = fma(_2763, _2917, _2921);
    float _2931 = _2765 * 6.283185482025146484375;
    float _2933 = sin(_2931);
    float _2935 = _2909 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2937 = fma(_2795, _2887, _2927);
    float _2939 = _2925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2941 = fma(_2795, _2913, _2929);
    float _2943 = _2559 * _2849;
    float _2945 = _2935 + _2937;
    float _2947 = _2863 * _2477;
    float _2949 = _2923 * 6.283185482025146484375;
    float _2951 = sin(_2949);
    float _2953 = _2939 + _2941;
    float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2957 = _2945 + _2955;
    float _2959 = -_2943;
    float _2961 = fma(_2475, _2847, _2959);
    float _2963 = _2839 * _2477;
    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2967 = _2953 + _2965;
    float _2969 = _2957 * _2957;
    float _2971 = fma(_2865, _2851, _2947);
    float _2973 = fma(_2833, _2851, _2963);
    float _2975 = _2967 * _2967;
    float _2977 = _2837 * _2477;
    float _2979 = _2811 ? _2791 : _2807;
    float _2981 = fma(_2867, _2961, _2973);
    float _2983 = _2969 + _2975;
    float _2985 = fma(_2841, _2851, _2977);
    float _2987 = -_2815;
    float _2989 = fma(_2987, _2961, _2971);
    float _2991 = -_2293;
    float _2993 = fma(_2951, _2933, _2991);
    float _2995 = _2757 * _2981;
    float _2997 = _2765 * 6.283185482025146484375;
    float _2999 = cos(_2997);
    float _3001 = _2979 * _2979;
    float _3003 = fma(_2285, _2993, _2293);
    float _3005 = fma(_2763, _2989, _2995);
    float _3007 = fma(_2869, _2961, _2985);
    float _3009 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2461);
    float _3011 = fma(_2329, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3003);
    float _3013 = sqrt(_2983);
    float _3015 = fma(_2795, _3007, _3005);
    float _3017 = _3009 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3019 = _2811 ? _3003 : _3011;
    float _3021 = _3017 + _3015;
    float _3023 = fma(_3019, _3019, _3001);
    float _3025 = -_2291;
    float _3027 = fma(_2951, _2999, _3025);
    float _3029 = rsqrt(_3023);
    float _3031 = fma(_2285, _3027, _2291);
    bool _3033 = _3013 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3035 = _2969;
    float _3037 = _2975;
    float _3039 = _2945;
    float _3041 = _2953;
    float _3043 = _2791;
    float _3045 = _3031;
    float _3047 = _3003;
    float _3049 = _3011;
    if (!_3033)
    {
        _445 = _3021;
    }
    float _3051 = _445;
    bool _3053 = !_3033;
    float _3055 = _3051;
    if (!_3053)
    {
        float _3057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3061 = _3013 + _3059;
        float _3063 = rsqrt(_2983);
        float _3065 = _3061 * _3057;
        float _3067 = _3021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3069 = _3065 * 0.15915493667125701904296875;
        float _3071 = _3069 * 6.283185482025146484375;
        float _3073 = sin(_3071);
        float _3075 = _3069 * 6.283185482025146484375;
        float _3077 = cos(_3075);
        float _3079 = fma(_3073, _3067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3081 = _3063 * _3079;
        float _3083 = _3077 + (-1.0);
        float _3085 = _2957 * _3081;
        float _3087 = _2967 * _3081;
        float _3089 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3091 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3093 = _3085 * _3085;
        float _3095 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3097 = fma(_3021, _3077, _3089);
        float _3099 = _3087 * _3087;
        _3055 = _3097;
        _3035 = _3093;
        _3037 = _3099;
        _3039 = _3091;
        _3041 = _3095;
    }
    float _3101 = _3055;
    float _3103 = _3035;
    float _3105 = _3037;
    float _3107 = _3039;
    float _3109 = _3041;
    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3113 = _3101 + _3111;
    float _3115 = _3101;
    if (!_2811)
    {
        _3043 = _2807;
    }
    float _3117 = _3043;
    float _3119 = _2979 * _3029;
    if (!_2811)
    {
        float _3121 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3031);
        _3045 = _3121;
    }
    float _3123 = _3045;
    float _3125 = fma(_3113, _3113, _3103);
    if (!_2811)
    {
        _3047 = _3011;
    }
    float _3127 = _3047;
    float _3129 = _2885 * _3117;
    float _3131 = _2981 * _3117;
    float _3133 = _3125 + _3105;
    float _3135 = _2911 * _3117;
    float _3137 = _3019 * _3029;
    float _3139 = -_3119;
    float _3141 = _2887 * _3139;
    float _3143 = -_3119;
    float _3145 = _3007 * _3143;
    float _3147 = -_3119;
    float _3149 = _2913 * _3147;
    float _3151 = sqrt(_3133);
    float _3153 = fma(_2891, _3123, _3129);
    float _3155 = fma(_2989, _3123, _3131);
    float _3157 = fma(_2917, _3123, _3135);
    float _3159 = fma(_2885, _3137, _3141);
    float _3161 = fma(_2981, _3137, _3145);
    float _3163 = fma(_2911, _3137, _3149);
    float _3165 = fma(_2887, _3127, _3153);
    float _3167 = fma(_3007, _3127, _3155);
    float _3169 = fma(_2913, _3127, _3157);
    out.m_67.x = _2181;
    out.m_67.y = _2110;
    out.m_67.z = _2116;
    out.m_67.w = _2114;
    out.m_69.x = _2891;
    out.m_69.y = _2989;
    out.m_69.z = _2917;
    bool _3171 = _3151 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3173 = isnan(_3151);
    bool _3175 = _3171 || _3173;
    bool _3177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3179 = _3175 || _3177;
    out.m_71.x = _3159;
    out.m_71.y = _3161;
    out.m_71.z = _3163;
    out.m_73.x = _3165;
    out.m_73.y = _3167;
    out.m_73.z = _3169;
    float _3181 = _3129;
    if (!_3179)
    {
        _3181 = 1.0;
    }
    float _3183 = _3181;
    bool _3185 = !_3179;
    float _3187 = _3183;
    if (!_3185)
    {
        bool _3189 = _3151 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3191 = isnan(_3151);
        bool _3193 = _3189 || _3191;
        bool _3195 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3197 = _3193 || _3195;
        if (!_3197)
        {
            float _3199 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3201 = _3151 + _3199;
            float _3203 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3205 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3203;
            float _3207 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3209 = _3207 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3211 = 1.0 / _3205;
            float _3213 = _3201 * _3211;
            float _3215 = fma(_3213, _3209, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3187 = _3215;
            _3217 = true;
        }
        else
        {
            bool _3219 = _3151 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3221 = isnan(_3151);
            bool _3223 = _3219 || _3221;
            bool _3225 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3227 = _3223 || _3225;
            if (!_3227)
            {
                float _3229 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3231 = _3151 + _3229;
                float _3233 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3235 = _3233 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3237 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3239 = _3237 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3241 = 1.0 / _3235;
                float _3243 = _3231 * _3241;
                float _3245 = fma(_3243, _3239, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3187 = _3245;
                _3217 = true;
            }
            else
            {
                _3187 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3217 = false;
    float _3247 = _3187;
    float _3249 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3251 = _3101 + _3249;
    float _3253 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3255 = _3107 + _3253;
    float _3257 = fma(_3251, _3247, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3259 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3261 = _3109 + _3259;
    float _3263 = fma(_3255, _3247, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3267 = _3257 + _3265;
    float _3269 = fma(_3261, _3247, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3273 = _3263 + _3271;
    float _3275 = _3267 * _3267;
    float _3277 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3279 = _3269 + _3277;
    float _3281 = fma(_3273, _3273, _3275);
    float _3283 = fma(_3279, _3279, _3281);
    float _3285 = rsqrt(_3283);
    float _3287 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3289 = _3273 * _3287;
    float _3291 = _3279 * _3287;
    float _3293 = _3289 * _3289;
    float _3295 = _3291 * _3291;
    float _3297 = _3293 + _3295;
    float _3299 = sqrt(_3297);
    bool _3301 = _3299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3305 = _3299 + _3303;
    float _3307 = _3285;
    float _3309 = _3305;
    float _3311 = _3247;
    float _3313 = _3267;
    float _3315 = _3289;
    if (_3301)
    {
        float _3317 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3307 = _3317;
    }
    float _3319 = _3307;
    if (_3301)
    {
        float _3321 = rsqrt(_3297);
        _3115 = _3321;
    }
    float _3323 = _3115;
    float _3325 = _3323;
    if (_3301)
    {
        float _3327 = _3305 * _3319;
        _3309 = _3327;
    }
    float _3329 = _3309;
    float _3331 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3301)
    {
        float _3333 = _3329 * 0.15915493667125701904296875;
        _3311 = _3333;
    }
    float _3335 = _3311;
    float _3337 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3331);
    float _3339 = _3279;
    if (_3301)
    {
        float _3341 = _3335 * 6.283185482025146484375;
        float _3343 = sin(_3341);
        _3339 = _3343;
    }
    float _3345 = _3339;
    float _3347 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3349 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3337);
    float _3351 = precise::max(0.0, _3347);
    float _3353 = _3319;
    float _3355 = _3351;
    if (_3301)
    {
        float _3357 = _3335 * 6.283185482025146484375;
        float _3359 = cos(_3357);
        _3353 = _3359;
    }
    float _3361 = _3353;
    float _3363 = -_3287;
    float _3365 = -_3351;
    float _3367 = fma(_3267, _3363, _3365);
    if (_3301)
    {
        float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3313 = _3369;
    }
    float _3371 = _3313;
    float _3373 = sqrt(_3283);
    float _3375 = _3371;
    float _3377 = _3345;
    if (_3301)
    {
        float _3379 = fma(_3345, _3371, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3375 = _3379;
    }
    float _3381 = _3375;
    float _3383 = _3381;
    if (!_3301)
    {
        _3377 = _3291;
    }
    float _3385 = _3377;
    float _3387 = _3385;
    if (_3301)
    {
        float _3389 = _3361 + (-1.0);
        _3355 = _3389;
    }
    float _3391 = _3355;
    float _3393 = _3391;
    if (_3301)
    {
        float _3395 = _3323 * _3381;
        _3049 = _3395;
    }
    float _3397 = _3049;
    if (!_3301)
    {
        _3325 = _3367;
    }
    float _3399 = _3325;
    float _3401 = _3399;
    if (_3301)
    {
        float _3403 = _3391 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3393 = _3403;
    }
    float _3405 = _3393;
    float _3407 = _3405;
    if (_3301)
    {
        float _3409 = _3289 * _3397;
        _3315 = _3409;
    }
    float _3411 = _3315;
    if (!_3301)
    {
        _3383 = _3293;
    }
    float _3413 = _3383;
    float _3415 = _3413;
    if (_3301)
    {
        float _3417 = _3291 * _3397;
        _3387 = _3417;
    }
    float _3419 = _3387;
    if (_3301)
    {
        float _3421 = fma(_3367, _3361, _3405);
        _3401 = _3421;
    }
    float _3423 = _3401;
    if (_3301)
    {
        float _3425 = _3411 * _3411;
        _3415 = _3425;
    }
    float _3427 = _3415;
    if (!_3301)
    {
        _3407 = _3295;
    }
    float _3429 = _3407;
    float _3431 = _3429;
    if (_3301)
    {
        float _3433 = _3419 * _3419;
        _3431 = _3433;
    }
    float _3435 = _3431;
    float _3437 = fma(_3423, _3423, _3427);
    float _3439 = _3437 + _3435;
    float _3441 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3445 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3443);
    float _3447 = precise::clamp(_3445, 0.0, 1.0);
    float _3449 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3451 = rsqrt(_3439);
    float _3453 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3441);
    float _3455 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3457 = -_3447;
    float _3459 = _3457 + 1.0;
    float _3461 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3453);
    float _3463 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3465 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3455);
    float _3467 = _3461 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3469 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3463);
    float _3471 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3465);
    float _3473 = abs(_3459);
    float _3475 = log2(_3473);
    float _3477 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3479 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3469);
    float _3481 = _3471 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3483 = _3451 * _3411;
    float _3485 = -_3477;
    float _3487 = fma(_3485, _3449, 1.0);
    float _3489 = _3479 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3491 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3493 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3495 = _3451 * _3419;
    float _3497 = _3349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3499 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3491);
    float _3501 = _3451 * _3423;
    float _3503 = log2(_3487);
    float _3505 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3507 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3499);
    float _3509 = -_3493;
    float _3511 = fma(_3501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3509);
    float _3513 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3515 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3505);
    float _3517 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3507);
    float _3519 = -_3495;
    float _3521 = fma(_3519, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3511);
    float _3523 = exp2(_3513);
    float _3525 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3527 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3515);
    float _3529 = fma(_3521, -0.5, 0.5);
    float _3531 = fma(_3521, 0.5, 0.5);
    float _3533 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3525);
    float _3535 = _3501 + 1.0;
    float _3537 = 1.0 / _3517;
    float _3539 = fma(_3531, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3541 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3533);
    float _3543 = _3503 * 0.693147182464599609375;
    float _3545 = fma(_3531, _3539, -0.212114393711090087890625);
    float _3547 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3541);
    float _3549 = sqrt(_3529);
    float _3551 = -_3501;
    float _3553 = fma(_3523, _3535, _3551);
    float _3555 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3527);
    float _3557 = fma(_3531, _3545, 1.570728778839111328125);
    float _3559 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3561 = fma(_3553, 0.5, 0.5);
    float _3563 = _3547 * _3537;
    float _3565 = _3555 * _3537;
    float _3567 = fma(_3563, 0.5, 0.5);
    float _3569 = fma(_3565, -0.5, 0.5);
    float _3571 = _3549 * 0.636619746685028076171875;
    float3 _9016 = float3(_3567, _3569, _3559);
    float _3573 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9016, float3(0.0), isnan(_9016)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9016, float3(0.0), isnan(_9016)), level(0.0)).x;
    float3 _9027 = float3(_3567, _3569, _3559);
    float4 _3575 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9027, float3(0.0), isnan(_9027)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9027, float3(0.0), isnan(_9027)), level(0.0)).xyzw;
    float _3577 = _3575.x;
    float _3579 = _3575.y;
    float _3581 = _3575.z;
    float _3583 = _3575.w;
    float _3585 = -_3557;
    float _3587 = fma(_3571, _3585, 1.0);
    float2 _9048 = float2(_3587, _3561);
    float3 _3591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9048, float2(0.0), isnan(_9048)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9048, float2(0.0), isnan(_9048)), level(0.0)).xyz;
    float _3593 = _3591.x;
    float _3595 = _3591.y;
    float _3597 = _3591.z;
    float _3599 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3601 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2935;
    out.m_75.y = _3017;
    out.m_75.z = _2939;
    float _3603 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3601);
    float _3605 = exp2(_3599);
    out.m_49.x = 1.0;
    float _3607 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3603);
    out.m_77.x = _3263;
    out.m_77.y = _3257;
    out.m_77.z = _3269;
    float _3609 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3607);
    float _3611 = _3609 + _3517;
    out.gl_Position.x = _3547;
    out.gl_Position.y = _3555;
    out.gl_Position.z = _3609;
    out.gl_Position.w = _3517;
    float _3613 = -_3605;
    float _3615 = _3613 + 1.0;
    float _3617 = _3615 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3619 = _3611 * 0.5;
    float _3621 = -_3617;
    float _3623 = _3621 + 1.0;
    float _3625 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3619;
    out.m_79.w = _3517;
    out.m_81.w = _3625;
    float _3627 = _3617 * _3573;
    float _3629 = _3583 * _3627;
    float _3631 = _3597 * _3627;
    float _3633 = fma(_3593, _3629, _3577);
    float _3635 = fma(_3595, _3629, _3579);
    float _3637 = _3583 * _3623;
    float _3639 = fma(_3583, _3631, _3581);
    out.m_83.x = _3633;
    out.m_83.y = _3635;
    out.m_83.z = _3639;
    out.m_83.w = _3637;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3217 = false;
    bool _2397 = false;
    bool _2207 = false;
    bool _1645 = false;
    bool _1325 = false;
    bool _1195 = false;
    bool _1091 = false;
    bool _911 = false;
    bool _635 = false;
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _107 = int(_105);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_49.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3696 = as_type<float>(_123);
        out.gl_Position.z = _3696;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_51.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = 0.0;
    float _147 = _141;
    if (_137)
    {
        float _149 = float(_107);
        _117 = _149;
    }
    float _151 = _117;
    bool _153 = _141 >= _151;
    bool _155 = !_137;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _125 = as_type<int>(_163);
    }
    int _165 = _125;
    float _167 = as_type<float>(_165);
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3768 = as_type<float>(_165);
        out.gl_Position.z = _3768;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_51.x;
    float _171 = in.m_51.y;
    float _173 = in.m_51.z;
    float _175 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = _175;
    if (!_185)
    {
        float _189 = _175 * _175;
        float _191 = _189 * 0.5;
        _167 = _191;
    }
    float _193 = _167;
    float _195 = 0.0;
    float _197 = _193;
    if (!_185)
    {
        float _199 = _141 * _141;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    if (!_185)
    {
        float _205 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _205;
    }
    float _207 = _197;
    bool _209 = !_185;
    float _211 = _207;
    if (!_209)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _175 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _175);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _143 = _227;
        _211 = _241;
        _145 = _229;
    }
    float _243 = _143;
    float _245 = _211;
    float _247 = _145;
    bool _249 = !_185;
    float _251 = _243;
    float _253 = _247;
    if (!_249)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _175 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _251 = _267;
        _253 = _261;
        _187 = _273;
    }
    float _275 = _251;
    float _277 = _253;
    float _279 = _187;
    float _281 = _277;
    float _283 = _275;
    if (!_185)
    {
        _281 = _141;
    }
    float _285 = _281;
    float _287 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _285;
    if (!_185)
    {
        float _291 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _291;
    }
    float _293 = _283;
    bool _295 = !_185;
    float _297 = _293;
    if (!_295)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _141 * _301;
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = 1.0 / _309;
        float _313 = _303 * 0.693147182464599609375;
        float _315 = exp2(_305);
        float _317 = 1.0 / _313;
        float _319 = _315 + (-1.0);
        float _321 = -_319;
        float _323 = fma(_321, _317, _141);
        float _325 = _323 * _311;
        float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _327;
    }
    float _329 = _297;
    bool _331 = !_185;
    if (!_331)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _141 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _289 = _351;
    }
    float _353 = _289;
    float _355 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = fma(_279, _171, _287);
    float _359 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_353, _171, _355);
    float _365 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = fma(_279, _169, _359);
    float _371 = fma(_353, _169, _361);
    float _373 = -_363;
    float _375 = _357 + _373;
    float _377 = fma(_279, _173, _365);
    float _379 = fma(_353, _173, _367);
    float _381 = -_371;
    float _383 = _369 + _381;
    float _385 = _375 * _375;
    float _387 = in.m_53.w;
    float _389 = -_379;
    float _391 = _377 + _389;
    float _393 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = fma(_383, _383, _385);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _401 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _403 = fma(_391, _391, _395);
    float _405 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _407 = in.m_46.x;
    float _409 = in.m_46.y;
    float _411 = in.m_46.z;
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _399);
    float _415 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _401);
    float _417 = sqrt(_403);
    float _419 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _405);
    float _421 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _413);
    bool _423 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan(9.9999999747524270787835121154785e-07);
    bool _431 = _427 || _429;
    float _433 = fma(_369, _387, _407);
    float _435 = fma(_357, _387, _409);
    float _437 = fma(_377, _387, _411);
    float _439 = _419;
    float _441 = _415;
    float _443 = _421;
    float _445 = _437;
    if (!_431)
    {
        bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _449 = !_447;
        if (!_449)
        {
            float _451 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _453 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _455 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _453);
            float _461 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _461);
            float _469 = _463 * _463;
            float _471 = fma(_465, _465, _469);
            float _473 = fma(_467, _467, _471);
            float _475 = rsqrt(_473);
            float _477 = _475 * 9.9999999747524270787835121154785e-07;
            float _479 = _465 * _477;
            float _481 = _463 * _477;
            float _483 = _467 * _477;
            _439 = _481;
            _441 = _479;
            _443 = _483;
            _485 = true;
        }
        else
        {
            float _487 = _171 * _171;
            float _489 = fma(_169, _169, _487);
            float _491 = fma(_173, _173, _489);
            float _493 = sqrt(_491);
            bool _495 = _493 >= 9.9999999747524270787835121154785e-07;
            bool _497 = isnan(_493);
            bool _499 = _495 || _497;
            bool _501 = isnan(9.9999999747524270787835121154785e-07);
            bool _503 = _499 || _501;
            if (!_503)
            {
                float _505 = _409 * _409;
                float _507 = fma(_407, _407, _505);
                float _509 = fma(_411, _411, _507);
                float _511 = sqrt(_509);
                bool _513 = _511 >= 9.9999999747524270787835121154785e-07;
                bool _515 = isnan(_511);
                bool _517 = _513 || _515;
                bool _519 = isnan(9.9999999747524270787835121154785e-07);
                bool _521 = _517 || _519;
                if (!_521)
                {
                    float _523 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _523);
                    float _527 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _525);
                    float _529 = rsqrt(_527);
                    float _531 = _529 * 9.9999999747524270787835121154785e-07;
                    float _533 = _531 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _531 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = _531 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _439 = _535;
                    _441 = _533;
                    _443 = _537;
                    _485 = true;
                }
                else
                {
                    float _539 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _541 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _543 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _545 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
                    float _547 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _541);
                    float _549 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _543);
                    float _551 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
                    float _553 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _547);
                    float _555 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _549);
                    float _557 = _551 * _551;
                    float _559 = fma(_553, _553, _557);
                    float _561 = fma(_555, _555, _559);
                    float _563 = rsqrt(_561);
                    float _565 = _563 * 9.9999999747524270787835121154785e-07;
                    float _567 = _553 * _565;
                    float _569 = _551 * _565;
                    float _571 = _555 * _565;
                    _439 = _569;
                    _441 = _567;
                    _443 = _571;
                    _485 = true;
                }
            }
            else
            {
                float _573 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _575 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _577 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _579 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
                float _581 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
                float _583 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
                float _585 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _579);
                float _587 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _581);
                float _589 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _583);
                float _591 = _585 * _585;
                float _593 = fma(_587, _587, _591);
                float _595 = fma(_589, _589, _593);
                float _597 = rsqrt(_595);
                float _599 = _597 * 9.9999999747524270787835121154785e-07;
                float _601 = _587 * _599;
                float _603 = _585 * _599;
                float _605 = _589 * _599;
                _439 = _603;
                _441 = _601;
                _443 = _605;
            }
        }
    }
    _485 = false;
    float _607 = _439;
    float _609 = _441;
    float _611 = _443;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _615 = !_613;
    float _633;
    if (!_615)
    {
        float _617 = in.m_55.x;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_107);
        float _639 = 1.0 / _637;
        float _641 = _141 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _647 = _643 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _651 = _643 + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _667 = _665 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _669 = 1.0 / _655;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _673 = _643 + _671;
    float _675 = 1.0 / _663;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _679 = _643 + _677;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _683 = 1.0 / _659;
    float _685 = _673 * _669;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _687;
    float _691 = fma(_689, _685, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _693 = 1.0 / _667;
    float _695 = _647 * _675;
    bool _697 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _699 = isnan(_643);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _709;
    float _713 = -_707;
    float _715 = _713 + 1.0;
    float _717 = _651 * _683;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _719;
    float _723 = fma(_711, _685, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _725 = fma(_721, _685, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _727 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _729 = isnan(_643);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = _679 * _693;
    bool _741 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _743 = isnan(_643);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    bool _753 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _755 = isnan(_643);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = -_751;
    float _767 = _765 + 1.0;
    float _769 = _763 * _715;
    float _771 = -_763;
    float _773 = _771 + 1.0;
    float _775 = _707 * _767;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _781 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _783 = isnan(_643);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = _737 * _773;
    float _795 = -_737;
    float _797 = _795 + 1.0;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = fma(_779, _717, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _809 = _791 * _797;
    float _811 = fma(_801, _717, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _813 = fma(_805, _717, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _815 = _725 * _809;
    float _817 = _691 * _809;
    float _819 = -_791;
    float _821 = _819 + 1.0;
    float _823 = _723 * _809;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _829;
    float _833 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].x, _815);
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].y, _817);
    float _837 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[143].z, _823);
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _839;
    float _843 = fma(_811, _793, _833);
    float _845 = fma(_827, _695, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _847 = fma(_813, _793, _835);
    float _849 = fma(_807, _793, _837);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _859 = fma(_831, _695, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _861 = fma(_841, _695, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _867 = fma(_845, _769, _843);
    float _869 = fma(_853, _739, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _871 = fma(_857, _739, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _873 = fma(_865, _739, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _875 = fma(_859, _769, _847);
    float _877 = fma(_861, _769, _849);
    float _879 = fma(_869, _775, _867);
    float _881 = fma(_871, _775, _875);
    float _883 = fma(_873, _775, _877);
    float _885 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[147].x, _879);
    float _887 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[147].y, _881);
    float _889 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[147].z, _883);
    bool _891 = !_681;
    float _909;
    if (!_891)
    {
        float _893 = in.m_55.x;
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _897 = _893 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _899 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[11].x, _141);
        float _901 = _899 * _895;
        float _903 = floor(_901);
        float _905 = -_903;
        float _907 = _901 + _905;
        _909 = _907;
        _911 = true;
    }
    else
    {
        float _913 = float(_107);
        float _915 = 1.0 / _913;
        float _917 = _141 * _915;
        _909 = _917;
    }
    _911 = false;
    float _919 = _909;
    float _921 = in.m_53.x;
    float _923 = in.m_53.y;
    float _925 = in.m_53.z;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _929 = _919 + _927;
    bool _931 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _933 = isnan(_919);
    bool _935 = _931 || _933;
    bool _937 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _951 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _953 = isnan(_919);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = 1.0 / _949;
    bool _965 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _967 = 1.0 / _945;
    float _969 = _889 * _925;
    float _971 = _887 * _923;
    float _973 = -_941;
    float _975 = _973 + 1.0;
    float _977 = _885 * _921;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _979;
    float _983 = _929 * _967;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _987 = _919 + _985;
    bool _989 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _991 = isnan(_919);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_981, _983, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1003 = _987 * _963;
    float _1005 = _999 * _975;
    float _1007 = -_999;
    float _1009 = _1007 + 1.0;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1011;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1015;
    float _1019 = _961 * _1009;
    float _1021 = fma(_1013, _983, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1023 = fma(_1017, _983, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1025 = -_961;
    float _1027 = _1025 + 1.0;
    float _1029 = _1001 * _1019;
    float _1031 = _1021 * _1019;
    float _1033 = _1023 * _1019;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1047 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1031);
    float _1049 = fma(_1037, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1051 = fma(_1041, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1053 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1029);
    float _1055 = fma(_1045, _1003, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1057 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1033);
    float _1059 = fma(_1049, _1005, _1047);
    float _1061 = fma(_1051, _1005, _1053);
    float _1063 = fma(_1055, _1005, _1057);
    float _1065 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1059);
    float _1067 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1061);
    float _1069 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1063);
    bool _1071 = !_965;
    float _1089;
    if (!_1071)
    {
        float _1073 = in.m_55.x;
        float _1075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1077 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1079 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _1081 = _1079 * _1075;
        float _1083 = floor(_1081);
        float _1085 = -_1083;
        float _1087 = _1081 + _1085;
        _1089 = _1087;
        _1091 = true;
    }
    else
    {
        float _1093 = float(_107);
        float _1095 = 1.0 / _1093;
        float _1097 = _141 * _1095;
        _1089 = _1097;
    }
    _1091 = false;
    float _1099 = _1089;
    bool _1101 = _1099 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1103 = isnan(_1099);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1117 = _1099 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1119 = isnan(_1099);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _1099 + _1133;
    float _1137 = -_1111;
    float _1139 = _1137 + 1.0;
    bool _1141 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1143 = 1.0 / _1115;
    float _1145 = _1127 * _1139;
    float _1147 = -_1127;
    float _1149 = _1147 + 1.0;
    float _1151 = _1131 * _1143;
    float _1153 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1155 = fma(_1151, _1135, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1157 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1161 = _1155 * _1145;
    float _1163 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1165 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1161);
    float _1169 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1167);
    float _1173 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1169;
    out.m_57.y = _1165;
    out.m_57.z = _1159;
    out.m_57.w = _1173;
    bool _1175 = !_1141;
    float _1193;
    if (!_1175)
    {
        float _1177 = in.m_55.x;
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1181 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1183 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _1185 = _1183 * _1179;
        float _1187 = floor(_1185);
        float _1189 = -_1187;
        float _1191 = _1185 + _1189;
        _1193 = _1191;
        _1195 = true;
    }
    else
    {
        float _1197 = float(_107);
        float _1199 = 1.0 / _1197;
        float _1201 = _141 * _1199;
        _1193 = _1201;
    }
    _1195 = false;
    float _1203 = _1193;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1207 = _1203 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1211 = _1209 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1213 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1215 = isnan(_1203);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1229 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1231 = isnan(_1203);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1241;
    bool _1245 = _1203 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1247 = isnan(_1203);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = 1.0 / _1211;
    float _1259 = -_1223;
    float _1261 = _1259 + 1.0;
    bool _1263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1265 = 1.0 / _1227;
    float _1267 = _1243 * _1257;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1273 = fma(_1267, _1207, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1275 = _1239 * _1261;
    float _1277 = -_1255;
    float _1279 = _1277 + 1.0;
    float _1281 = -_1239;
    float _1283 = _1281 + 1.0;
    float _1285 = _1271 * _1265;
    float _1287 = _1273 * _1275;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1291 = _1203 + _1289;
    float _1293 = _1223 * _1279;
    float _1295 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1287);
    float _1297 = fma(_1285, _1291, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1299 = fma(_1297, _1293, _1295);
    float _1301 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1299);
    float _1303 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1303;
    bool _1305 = !_1263;
    float _1323;
    if (!_1305)
    {
        float _1307 = in.m_55.x;
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1311 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1313 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _1315 = _1313 * _1309;
        float _1317 = floor(_1315);
        float _1319 = -_1317;
        float _1321 = _1315 + _1319;
        _1323 = _1321;
        _1325 = true;
    }
    else
    {
        float _1327 = float(_107);
        float _1329 = 1.0 / _1327;
        float _1331 = _141 * _1329;
        _1323 = _1331;
    }
    _1325 = false;
    float _1333 = _1323;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1337 = _1333 + _1335;
    bool _1339 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1341 = isnan(_1333);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1353 = _1351 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1355 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1357 = isnan(_1333);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1367;
    bool _1371 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1373 = isnan(_1333);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = -_1349;
    float _1385 = _1383 + 1.0;
    float _1387 = 1.0 / _1353;
    bool _1389 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1391 = isnan(_1333);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1403 = _1401 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1405 = 1.0 / _1403;
    bool _1407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1409 = _1369 * _1387;
    float _1411 = -_1365;
    float _1413 = _1411 + 1.0;
    float _1415 = _1365 * _1385;
    bool _1417 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1419 = isnan(_1333);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    float _1429 = fma(_1409, _1337, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1431 = _1381 * _1413;
    float _1433 = -_1381;
    float _1435 = _1433 + 1.0;
    float _1437 = -_1427;
    float _1439 = _1437 + 1.0;
    float _1441 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1443 = _1441 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1445 = _1427 * _1435;
    bool _1447 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1449 = isnan(_1333);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = -_1399;
    float _1461 = _1459 + 1.0;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1465 = _1463 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1467 = _1399 * _1439;
    bool _1469 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1471 = isnan(_1333);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = _1457 * _1461;
    float _1483 = 1.0 / _1465;
    float _1485 = -_1457;
    float _1487 = _1485 + 1.0;
    float _1489 = _1479 * _1487;
    float _1491 = -_1479;
    float _1493 = _1491 + 1.0;
    float _1495 = 1.0 / _1443;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1503 = _1501 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1505 = _1429 * _1489;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1509 = _1507 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1511;
    float _1515 = _1503 * _1405;
    float _1517 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1505);
    float _1519 = 1.0 / _1499;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1523 = _1333 + _1521;
    float _1525 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1527 = _1525 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1529 = _1513 * _1483;
    float _1531 = fma(_1515, _1523, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1535 = _1333 + _1533;
    float _1537 = 1.0 / _1509;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1543 = fma(_1529, _1535, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1545 = fma(_1531, _1481, _1517);
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1547;
    float _1551 = _1541 * _1495;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1555 = _1333 + _1553;
    float _1557 = 1.0 / _1527;
    float _1559 = fma(_1543, _1467, _1545);
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1565 = _1549 * _1519;
    float _1567 = fma(_1551, _1555, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1571 = _1333 + _1569;
    bool _1573 = _1333 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1575 = isnan(_1333);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1581 = _1577 || _1579;
    float _1583 = float(_1581);
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1587 = _1333 + _1585;
    float _1589 = _1563 * _1537;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1591;
    float _1595 = fma(_1565, _1571, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1597 = fma(_1567, _1445, _1559);
    float _1599 = fma(_1589, _1587, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1601 = -_1583;
    float _1603 = _1601 + 1.0;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1607 = _1333 + _1605;
    float _1609 = fma(_1595, _1431, _1597);
    float _1611 = _1593 * _1557;
    float _1613 = _1349 * _1603;
    float _1615 = fma(_1599, _1415, _1609);
    float _1617 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1619 = fma(_1617, _1613, _1615);
    float _1621 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1619);
    float _1623 = precise::clamp(_1621, 0.0, 1.0);
    bool _1625 = !_1407;
    float _1643;
    if (!_1625)
    {
        float _1627 = in.m_55.x;
        float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1631 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1633 = fma(_1631, (*spvDescriptorSet0.vp_c9)._m0[14].z, _141);
        float _1635 = _1633 * _1629;
        float _1637 = floor(_1635);
        float _1639 = -_1637;
        float _1641 = _1635 + _1639;
        _1643 = _1641;
        _1645 = true;
    }
    else
    {
        float _1647 = float(_107);
        float _1649 = 1.0 / _1647;
        float _1651 = _141 * _1649;
        _1643 = _1651;
    }
    _1645 = false;
    float _1653 = _1643;
    int _1655 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1657 = _1655;
    int _1659 = 0;
    int _1661 = _98(_1657, _1659, (*spvDescriptorSet0.support_buffer));
    float _1663 = in.m_61.z;
    float _1665 = trunc(_1663);
    int _1667 = int(_1665);
    int _1669 = _1661 + (-1);
    float _1671 = float(_1669);
    float _1673 = _1623 * _1671;
    float _1675 = trunc(_1673);
    int _1677 = int(_1675);
    int _1679 = _1677;
    int _1681 = 0;
    int _1683 = _99(_1679, _1681, (*spvDescriptorSet0.support_buffer));
    int _1685 = _1667;
    int _1687 = 0;
    int _1689 = _99(_1685, _1687, (*spvDescriptorSet0.support_buffer));
    float4 _1692 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1683, _1689)), 0).xyzw;
    float _1694 = _1692.x;
    float _1696 = _1692.y;
    float _1698 = _1692.z;
    float _1700 = _1692.w;
    float _1702 = in.m_55.w;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1716 = 1.0 / _1706;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1724 = _1722 != 0;
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1728 = _1726 != 0;
    float _1730 = 1.0 / _1710;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1734 = _1732 != 0;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1736;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1742 = _1740 != 0;
    bool _1744 = _1702 > 0.5;
    bool _1746 = _1744 && _1724;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1752 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1754 = isnan(_1653);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = 1.0 / _1714;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1766;
    float _1770 = _1750 * _1716;
    bool _1772 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1774 = isnan(_1653);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    float _1784 = -_1762;
    float _1786 = _1784 + 1.0;
    bool _1788 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1790 = isnan(_1653);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = 1.0 / _1720;
    bool _1802 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1804 = isnan(_1653);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = _1768 * _1730;
    float _1816 = _1782 * _1786;
    bool _1818 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1820 = isnan(_1653);
    bool _1822 = _1818 || _1820;
    bool _1824 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1826 = _1822 || _1824;
    float _1828 = float(_1826);
    float _1830 = -_1812;
    float _1832 = _1830 + 1.0;
    float _1834 = -_1782;
    float _1836 = _1834 + 1.0;
    float _1838 = _1738 * _1764;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1844 = _1762 * _1832;
    bool _1846 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1848 = isnan(_1653);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1862 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1864 = isnan(_1653);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = _1842 * _1800;
    float _1876 = 1.0 / _1860;
    float _1878 = -_1856;
    float _1880 = _1878 + 1.0;
    float _1882 = -_1828;
    float _1884 = _1882 + 1.0;
    float _1886 = _1856 * _1836;
    float _1888 = _1828 * _1880;
    float _1890 = _1798 * _1884;
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1894 = _1653 + _1892;
    float _1896 = -_1798;
    float _1898 = _1896 + 1.0;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1902 = _1900 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1904;
    float _1908 = fma(_1838, _1894, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1910 = _1872 * _1898;
    float _1912 = 1.0 / _1902;
    float _1914 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1916 = _1653 + _1914;
    float _1918 = _1908 * _1910;
    float _1920 = -_1872;
    float _1922 = _1920 + 1.0;
    float _1924 = _1906 * _1876;
    float _1926 = fma(_1770, _1916, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1928 = in.m_61.x;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1932 = _1653 + _1930;
    float _1934 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1918);
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1940 = in.m_61.y;
    float _1942 = fma(_1814, _1932, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1944 = fma(_1926, _1890, _1934);
    float _1946 = _1890;
    float _1948 = _1812;
    float _1950 = _1844;
    int _1952 = as_type<int>(_1653);
    if (_1728)
    {
        float _1954 = in.m_55.x;
        _1946 = _1954;
    }
    float _1956 = _1946;
    float _1958 = _1938 * _1912;
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1962 = _1653 + _1960;
    float _1964 = fma(_1942, _1888, _1944);
    bool _1966 = _1653 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1968 = isnan(_1653);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1980 = _1653 + _1978;
    float _1982 = fma(_1874, _1962, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1986 = _1984 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1994 = _1653 + _1992;
    float _1996 = fma(_1924, _1980, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1998 = fma(_1982, _1886, _1964);
    float _2000 = -_1976;
    float _2002 = _2000 + 1.0;
    float _2004 = 1.0 / _1986;
    float _2006 = fma(_1958, _1994, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2008 = fma(_1996, _1816, _1998);
    float _2010 = _1812 * _2002;
    if (!_1728)
    {
        _1948 = _1928;
    }
    float _2012 = _1948;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2016 = _2012;
    if (_1734)
    {
        float _2018 = in.m_55.z;
        _2014 = _2018;
    }
    float _2020 = _2014;
    float _2022 = fma(_2006, _1844, _2008);
    float _2024 = -_1940;
    float _2026 = _2024 + 1.0;
    int _2028 = as_type<int>(_1940);
    if (!_1728)
    {
        _1950 = _2012;
    }
    float _2030 = _1950;
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2034 = _1653 + _2032;
    float _2036 = _2030;
    if (_1728)
    {
        _2016 = _1928;
    }
    float _2038 = _2016;
    float _2040 = in.m_55.y;
    float _2042 = _1746 ? _2026 : _1940;
    bool _2044 = false;
    float _2046 = _2038;
    if (_1728)
    {
        bool _2048 = _1956 > 0.5;
        _2044 = _2048;
    }
    bool _2050 = _2044;
    if (_1728)
    {
        float _2052 = -_2038;
        float _2054 = _2052 + 1.0;
        _1952 = as_type<int>(_2054);
    }
    int _2056 = _1952;
    float _2058 = _1990 * _2004;
    float _2060 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1728)
    {
        float _2062 = _2050 ? as_type<float>(_2056) : _2038;
        _2036 = _2062;
    }
    float _2064 = _2036;
    float _2066 = fma(_2058, _2034, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    int _2068 = _1677 + 1;
    float _2070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2072 = fma(_2066, _2010, _2022);
    int _2074 = min(_1669, _2068);
    int _2076 = as_type<int>(_2066);
    if (_1734)
    {
        float _2078 = -_2038;
        float _2080 = _2078 + 1.0;
        _2076 = as_type<int>(_2080);
    }
    int _2082 = _2076;
    bool _2084 = false;
    if (_1734)
    {
        bool _2086 = _2020 > 0.5;
        _2084 = _2086;
    }
    bool _2088 = _2084;
    float _2090 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2072);
    float _2092 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1734)
    {
        float _2094 = _2088 ? as_type<float>(_2082) : _2038;
        _2046 = _2094;
    }
    float _2096 = _2046;
    out.m_63.x = _2090;
    bool _2098 = _2040 > 0.5;
    bool _2100 = _2098 && _1742;
    float _2102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2104 = _2100 ? _2026 : _1940;
    float _2106 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2110 = _2106 * _2092;
    float _2112 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2114 = _2060 * _2102;
    float _2116 = _2112 * _2108;
    uint _2119 = as_type<uint>(half2(float2(_1700, 0.0)));
    uint _2121 = extract_bits(_2119, 0u, 8u);
    int _2123 = int(_2121) & 255;
    uint _2125 = extract_bits(_2119, 8u, 8u);
    int _2127 = int(_2125) & 255;
    int _2129 = _2127 << 8;
    int _2131 = _2123 | _2129;
    bool _2133 = _2131 >= 32768;
    int _2135 = _2131 + (-1024);
    int _2137 = _2135;
    if (_2133)
    {
        int _2139 = ~_2131;
        int _2141 = _2139 + 33792;
        int _2143 = _2141 + 1;
        _2137 = _2143;
    }
    int _2145 = _2137;
    int _2147 = _2145 + 30719;
    float _2149 = float(_2147);
    float _2151 = fma(_2149, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2153 = abs(_2151);
    float _2155 = -_2153;
    float _2157 = _2155 + 1.0;
    float _2159 = abs(_2151);
    float _2161 = fma(_2159, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2163 = as_type<int>(_2157) + (-218103808);
    float _2165 = abs(_2151);
    float _2167 = fma(_2165, _2161, -0.212114393711090087890625);
    bool _2169 = uint(_2163) >= 1920991232u;
    float _2171 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2173 = _2151 < 0.0;
    float _2175 = float(_2173);
    float _2177 = abs(_2151);
    float _2179 = fma(_2177, _2167, 1.570728778839111328125);
    float _2181 = _2171 * _2070;
    bool _2183 = !_2169;
    float _2205;
    if (!_2183)
    {
        int _2185 = as_type<int>(_2157);
        int _2187 = as_type<int>(_2020);
        int _2189 = as_type<int>(_1940);
        int _2191 = 11056;
        int _2193;
        int _2195;
        int _2197;
        int _2199;
        int _2201;
        int _2203;
        _96(_2185, _2187, _2189, _2191, _2193, _2195, _2197, _2199, _2201, _2203, out.gl_Position, out.gl_PointSize);
        _2205 = as_type<float>(_2199);
        _2028 = _2201;
        _2207 = true;
    }
    else
    {
        float _2209 = rsqrt(_2157);
        float _2211 = _2157 * _2209;
        float _2213 = _2209 * 0.5;
        float _2215 = -_2211;
        float _2217 = 0.0 + _2215;
        float _2219 = fma(_2213, _2217, 0.5);
        float _2221 = fma(_2211, _2219, _2211);
        float _2223 = -_2221;
        float _2225 = 0.0 + _2223;
        float _2227 = fma(_2221, _2225, _2157);
        float _2229 = fma(_2213, _2227, _2221);
        _2205 = _2229;
    }
    _2207 = false;
    float _2231 = _2205;
    int _2233 = _2028;
    int _2235 = _2074;
    int _2237 = 0;
    int _2239 = _99(_2235, _2237, (*spvDescriptorSet0.support_buffer));
    int _2241 = _1667;
    int _2243 = 0;
    int _2245 = _99(_2241, _2243, (*spvDescriptorSet0.support_buffer));
    float4 _2247 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2239, _2245)), 0).xyzw;
    float _2249 = _2247.x;
    float _2251 = _2247.y;
    float _2253 = _2247.z;
    float _2255 = _2247.w;
    float _2257 = _2179 * _2231;
    float _2259 = _2175 * 2.0;
    float _2261 = _2149 * 3.883221149444580078125;
    float _2263 = floor(_1673);
    float _2265 = -_2259;
    float _2267 = fma(_2257, _2265, _2257);
    float _2269 = _2261 * 0.15915493667125701904296875;
    float _2271 = fma(_2175, 3.1415927410125732421875, _2267);
    float _2273 = _2269 * 6.283185482025146484375;
    float _2275 = cos(_2273);
    float _2277 = _2271 * 0.15915493667125701904296875;
    float _2279 = _2277 * 6.283185482025146484375;
    float _2281 = sin(_2279);
    float _2283 = -_2263;
    float _2285 = _1673 + _2283;
    float _2287 = _2269 * 6.283185482025146484375;
    float _2289 = sin(_2287);
    float _2291 = _2281 * _2275;
    float _2293 = _2281 * _2289;
    uint _2295 = as_type<uint>(half2(float2(_2255, 0.0)));
    uint _2297 = extract_bits(_2295, 0u, 8u);
    int _2299 = int(_2297) & 255;
    uint _2301 = extract_bits(_2295, 8u, 8u);
    int _2303 = int(_2301) & 255;
    int _2305 = _2303 << 8;
    int _2307 = _2299 | _2305;
    bool _2309 = _2307 >= 32768;
    int _2311 = _2307 + (-1024);
    int _2313 = _2311;
    if (_2309)
    {
        int _2315 = ~_2307;
        int _2317 = _2315 + 33792;
        int _2319 = _2317 + 1;
        _2313 = _2319;
    }
    int _2321 = _2313;
    float _2323 = -_1698;
    float _2325 = _2323 + _2253;
    int _2327 = _2321 + 30719;
    float _2329 = fma(_2285, _2325, _1698);
    float _2331 = float(_2327);
    float _2333 = fma(_2331, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2335 = -_1694;
    float _2337 = _2335 + _2249;
    float _2339 = abs(_2333);
    float _2341 = -_2339;
    float _2343 = _2341 + 1.0;
    float _2345 = abs(_2333);
    float _2347 = fma(_2345, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _2349 = fma(_2285, _2337, _1694);
    bool _2351 = _2333 < 0.0;
    float _2353 = float(_2351);
    int _2355 = as_type<int>(_2343) + (-218103808);
    float _2357 = abs(_2333);
    float _2359 = fma(_2357, _2347, -0.212114393711090087890625);
    bool _2361 = uint(_2355) >= 1920991232u;
    float _2363 = -_1696;
    float _2365 = _2363 + _2251;
    float _2367 = abs(_2333);
    float _2369 = fma(_2367, _2359, 1.570728778839111328125);
    float _2371 = fma(_2285, _2365, _1696);
    bool _2373 = !_2361;
    float _2395;
    if (!_2373)
    {
        int _2375 = as_type<int>(_2343);
        int _2377 = as_type<int>(_2277);
        int _2379 = _2233;
        int _2381 = 11936;
        int _2383;
        int _2385;
        int _2387;
        int _2389;
        int _2391;
        int _2393;
        _96(_2375, _2377, _2379, _2381, _2383, _2385, _2387, _2389, _2391, _2393, out.gl_Position, out.gl_PointSize);
        _2395 = as_type<float>(_2389);
        _2397 = true;
    }
    else
    {
        float _2399 = rsqrt(_2343);
        float _2401 = _2343 * _2399;
        float _2403 = _2399 * 0.5;
        float _2405 = -_2401;
        float _2407 = 0.0 + _2405;
        float _2409 = fma(_2403, _2407, 0.5);
        float _2411 = fma(_2401, _2409, _2401);
        float _2413 = -_2411;
        float _2415 = 0.0 + _2413;
        float _2417 = fma(_2411, _2415, _2343);
        float _2419 = fma(_2403, _2417, _2411);
        _2395 = _2419;
    }
    _2397 = false;
    float _2421 = _2395;
    float _2423 = in.m_55.x;
    float _2425 = in.m_55.y;
    float _2427 = in.m_55.z;
    float _2429 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2431 = log2(_2429);
    float _2433 = _607 * _607;
    float _2435 = _2369 * _2421;
    float _2437 = fma(_609, _609, _2433);
    int _2439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2441 = _2439 != 0;
    int _2443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2445 = _2443 != 0;
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2449 = _2447 != 0;
    float _2451 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2453 = _971 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2455 = fma(_611, _611, _2437);
    float _2457 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2459 = rsqrt(_2455);
    float _2461 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2457);
    float _2463 = _2427 * 2.0;
    float _2465 = _2423 * 2.0;
    float _2467 = _2423 + _2427;
    float _2469 = _2425 * 2.0;
    float _2471 = floor(_2465);
    float _2473 = _2467 + (-1.0);
    float _2475 = _2459 * _609;
    float _2477 = _2459 * _607;
    float _2479 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2481 = _2475 * _2479;
    float _2483 = floor(_2463);
    float _2485 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2487 = _2425 + _2423;
    float _2489 = _2487 + (-1.0);
    float _2491 = floor(_2469);
    bool _2493 = _2471 >= 0.0;
    bool _2495 = isnan(_2471);
    bool _2497 = _2493 || _2495;
    bool _2499 = isnan(0.0);
    bool _2501 = _2497 || _2499;
    float _2503 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2505 = _2501 ? 0 : 1;
    bool _2507 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2509 = isnan(0.0);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2515 = _2511 || _2513;
    bool _2517 = _2483 > 0.0;
    bool _2519 = _2483 >= 0.0;
    bool _2521 = isnan(_2483);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan(0.0);
    bool _2527 = _2523 || _2525;
    float _2529 = _2431 * _141;
    int _2531 = _2527 ? 0 : 1;
    bool _2533 = _2471 > 0.0;
    float _2535 = exp2(_2529);
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2539 = 1.0 + _2537;
    bool _2541 = !_2441;
    int _2543 = _2541 ? 0 : 1;
    int _2545 = ~_2531;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    int _2551 = _2549;
    if (!_2517)
    {
        int _2553 = ~_2531;
        int _2555 = _2553 + 1;
        _2551 = _2555;
    }
    int _2557 = _2551;
    float _2559 = _2459 * _611;
    float _2561 = 1.0 / _2539;
    int _2563 = abs(_2543);
    bool _2565 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2567 = isnan(1.0);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2573 = _2569 || _2571;
    bool _2575 = _2491 > 0.0;
    bool _2577 = _2491 >= 0.0;
    bool _2579 = isnan(_2491);
    bool _2581 = _2577 || _2579;
    bool _2583 = isnan(0.0);
    bool _2585 = _2581 || _2583;
    float _2587 = -_2535;
    float _2589 = _2587 + 1.0;
    float _2591 = float(_2563);
    float _2593 = in.m_65.x;
    float _2595 = in.m_65.y;
    float _2597 = in.m_65.z;
    float _2599 = float(_2557);
    float _2601 = _2515 ? _2589 : 0.0;
    int _2603 = _2585 ? 0 : 1;
    float _2605 = _2591 * _2599;
    float _2607 = _2423 + (-0.5);
    if (_2573)
    {
        float _2609 = _2601 * _2561;
        _147 = _2609;
    }
    float _2611 = _147;
    float _2613 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2615 = _2559 * _2613;
    bool _2617 = !_2449;
    int _2619 = _2617 ? 0 : 1;
    int _2621 = ~_2603;
    int _2623 = _2621 + 1;
    int _2625 = _2623 + 1;
    float _2627 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2629 = -_2615;
    float _2631 = fma(_2475, _2627, _2629);
    int _2633 = _2625;
    if (!_2575)
    {
        int _2635 = ~_2603;
        int _2637 = _2635 + 1;
        _2633 = _2637;
    }
    int _2639 = _2633;
    float _2641 = _2605 * (-2.0);
    int _2643 = abs(_2619);
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2647 = _2477 * _2645;
    float _2649 = float(_2639);
    float _2651 = _2631 * _2631;
    float _2653 = float(_2643);
    float _2655 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2657 = -_2647;
    float _2659 = fma(_2559, _2655, _2657);
    int _2661 = ~_2505;
    int _2663 = _2661 + 1;
    int _2665 = _2663 + 1;
    float _2667 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2669 = -_2481;
    float _2671 = fma(_2477, _2667, _2669);
    float _2673 = fma(_2641, _2593, _2593);
    int _2675 = _2665;
    if (!_2533)
    {
        int _2677 = ~_2505;
        int _2679 = _2677 + 1;
        _2675 = _2679;
    }
    int _2681 = _2675;
    float _2683 = fma(_2503, _2641, _2503);
    bool _2685 = !_2445;
    int _2687 = _2685 ? 0 : 1;
    float _2689 = fma(_2607, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2673);
    float _2691 = _2653 * _2649;
    float _2693 = fma(_2659, _2659, _2651);
    int _2695 = abs(_2687);
    float _2697 = fma(_2683, _2611, _2689);
    float _2699 = _2691 * (-2.0);
    float _2701 = _2427 + (-0.5);
    float _2703 = float(_2695);
    float _2705 = _2697 * 0.15915493667125701904296875;
    float _2707 = fma(_2699, _2597, _2597);
    float _2709 = float(_2681);
    float _2711 = fma(_2485, _2699, _2485);
    float _2713 = fma(_2701, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2707);
    float _2715 = _2425 + _2427;
    float _2717 = _2703 * _2709;
    float _2719 = _2425 + (-0.5);
    float _2721 = fma(_2711, _2611, _2713);
    float _2723 = _2715 + (-1.0);
    float _2725 = _2717 * (-2.0);
    float _2727 = fma(_2671, _2671, _2693);
    float _2729 = _2721 * 0.15915493667125701904296875;
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2733 = fma(_2725, _2595, _2595);
    float _2735 = _2705 * 6.283185482025146484375;
    float _2737 = sin(_2735);
    float _2739 = fma(_2731, _2725, _2731);
    float _2741 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2733);
    float _2743 = _977 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2745 = _2331 * 3.883221149444580078125;
    float _2747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2371);
    float _2749 = fma(_2739, _2611, _2741);
    float _2751 = _2705 * 6.283185482025146484375;
    float _2753 = cos(_2751);
    float _2755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2349);
    float _2757 = _2453 * _2747;
    float _2759 = _2749 * 0.15915493667125701904296875;
    float _2761 = _2353 * 2.0;
    float _2763 = _2743 * _2755;
    float _2765 = _2745 * 0.15915493667125701904296875;
    float _2767 = -_2151;
    float _2769 = _2767 + _2333;
    float _2771 = _2729 * 6.283185482025146484375;
    float _2773 = sin(_2771);
    float _2775 = -_2761;
    float _2777 = fma(_2435, _2775, _2435);
    float _2779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2329);
    bool _2781 = _2371 != 0.0;
    bool _2783 = isnan(_2371);
    bool _2785 = _2781 || _2783;
    bool _2787 = isnan(0.0);
    bool _2789 = _2785 || _2787;
    float _2791 = fma(_2285, _2769, _2151);
    float _2793 = fma(_2353, 3.1415927410125732421875, _2777);
    float _2795 = _2451 * _2779;
    bool _2797 = _2349 == 0.0;
    bool _2799 = !_2789;
    bool _2801 = _2797 && _2799;
    float _2803 = _2729 * 6.283185482025146484375;
    float _2805 = cos(_2803);
    float _2807 = fma(_2371, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2791);
    bool _2809 = _2329 == 0.0;
    bool _2811 = _2809 && _2801;
    float _2813 = _2759 * 6.283185482025146484375;
    float _2815 = sin(_2813);
    float _2817 = _2753 * _2773;
    float _2819 = _2737 * _2773;
    float _2821 = rsqrt(_2727);
    float _2823 = _2737 * _2805;
    float _2825 = _2753 * _2805;
    float _2827 = _2759 * 6.283185482025146484375;
    float _2829 = cos(_2827);
    float _2831 = -_2817;
    float _2833 = fma(_2815, _2823, _2831);
    float _2835 = -_2823;
    float _2837 = fma(_2815, _2817, _2835);
    float _2839 = fma(_2815, _2819, _2825);
    float _2841 = fma(_2815, _2825, _2819);
    float _2843 = _2837 * _2475;
    float _2845 = _2839 * _2475;
    float _2847 = _2671 * _2821;
    float _2849 = _2659 * _2821;
    float _2851 = _2631 * _2821;
    float _2853 = _2839 * _2559;
    float _2855 = _2477 * _2847;
    float _2857 = fma(_2833, _2849, _2845);
    float _2859 = fma(_2841, _2849, _2843);
    float _2861 = _2837 * _2559;
    float _2863 = _2829 * _2773;
    float _2865 = _2829 * _2805;
    float _2867 = _2737 * _2829;
    float _2869 = _2753 * _2829;
    float _2871 = _2863 * _2475;
    float _2873 = -_2855;
    float _2875 = fma(_2559, _2851, _2873);
    float _2877 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2879 = fma(_2833, _2847, _2853);
    float _2881 = fma(_2865, _2849, _2871);
    float _2883 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2885 = fma(_2867, _2875, _2857);
    float _2887 = fma(_2869, _2875, _2859);
    float _2889 = -_2815;
    float _2891 = fma(_2889, _2875, _2881);
    float _2893 = _2475 * _2851;
    float _2895 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2883);
    float _2897 = _2863 * _2559;
    float _2899 = fma(_2841, _2847, _2861);
    float _2901 = -_2893;
    float _2903 = fma(_2477, _2849, _2901);
    float _2905 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2877);
    float _2907 = fma(_2865, _2847, _2897);
    float _2909 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2895);
    float _2911 = fma(_2867, _2903, _2879);
    float _2913 = fma(_2869, _2903, _2899);
    float _2915 = -_2815;
    float _2917 = fma(_2915, _2903, _2907);
    float _2919 = _2757 * _2885;
    float _2921 = _2757 * _2911;
    float _2923 = _2793 * 0.15915493667125701904296875;
    float _2925 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2905);
    float _2927 = fma(_2763, _2891, _2919);
    float _2929 = fma(_2763, _2917, _2921);
    float _2931 = _2765 * 6.283185482025146484375;
    float _2933 = sin(_2931);
    float _2935 = _2909 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2937 = fma(_2795, _2887, _2927);
    float _2939 = _2925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2941 = fma(_2795, _2913, _2929);
    float _2943 = _2559 * _2849;
    float _2945 = _2935 + _2937;
    float _2947 = _2863 * _2477;
    float _2949 = _2923 * 6.283185482025146484375;
    float _2951 = sin(_2949);
    float _2953 = _2939 + _2941;
    float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2957 = _2945 + _2955;
    float _2959 = -_2943;
    float _2961 = fma(_2475, _2847, _2959);
    float _2963 = _2839 * _2477;
    float _2965 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2967 = _2953 + _2965;
    float _2969 = _2957 * _2957;
    float _2971 = fma(_2865, _2851, _2947);
    float _2973 = fma(_2833, _2851, _2963);
    float _2975 = _2967 * _2967;
    float _2977 = _2837 * _2477;
    float _2979 = _2811 ? _2791 : _2807;
    float _2981 = fma(_2867, _2961, _2973);
    float _2983 = _2969 + _2975;
    float _2985 = fma(_2841, _2851, _2977);
    float _2987 = -_2815;
    float _2989 = fma(_2987, _2961, _2971);
    float _2991 = -_2293;
    float _2993 = fma(_2951, _2933, _2991);
    float _2995 = _2757 * _2981;
    float _2997 = _2765 * 6.283185482025146484375;
    float _2999 = cos(_2997);
    float _3001 = _2979 * _2979;
    float _3003 = fma(_2285, _2993, _2293);
    float _3005 = fma(_2763, _2989, _2995);
    float _3007 = fma(_2869, _2961, _2985);
    float _3009 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2461);
    float _3011 = fma(_2329, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3003);
    float _3013 = sqrt(_2983);
    float _3015 = fma(_2795, _3007, _3005);
    float _3017 = _3009 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3019 = _2811 ? _3003 : _3011;
    float _3021 = _3017 + _3015;
    float _3023 = fma(_3019, _3019, _3001);
    float _3025 = -_2291;
    float _3027 = fma(_2951, _2999, _3025);
    float _3029 = rsqrt(_3023);
    float _3031 = fma(_2285, _3027, _2291);
    bool _3033 = _3013 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3035 = _2969;
    float _3037 = _2975;
    float _3039 = _2945;
    float _3041 = _2953;
    float _3043 = _2791;
    float _3045 = _3031;
    float _3047 = _3003;
    float _3049 = _3011;
    if (!_3033)
    {
        _445 = _3021;
    }
    float _3051 = _445;
    bool _3053 = !_3033;
    float _3055 = _3051;
    if (!_3053)
    {
        float _3057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3061 = _3013 + _3059;
        float _3063 = rsqrt(_2983);
        float _3065 = _3061 * _3057;
        float _3067 = _3021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3069 = _3065 * 0.15915493667125701904296875;
        float _3071 = _3069 * 6.283185482025146484375;
        float _3073 = sin(_3071);
        float _3075 = _3069 * 6.283185482025146484375;
        float _3077 = cos(_3075);
        float _3079 = fma(_3073, _3067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3081 = _3063 * _3079;
        float _3083 = _3077 + (-1.0);
        float _3085 = _2957 * _3081;
        float _3087 = _2967 * _3081;
        float _3089 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3091 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3093 = _3085 * _3085;
        float _3095 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3097 = fma(_3021, _3077, _3089);
        float _3099 = _3087 * _3087;
        _3055 = _3097;
        _3035 = _3093;
        _3037 = _3099;
        _3039 = _3091;
        _3041 = _3095;
    }
    float _3101 = _3055;
    float _3103 = _3035;
    float _3105 = _3037;
    float _3107 = _3039;
    float _3109 = _3041;
    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3113 = _3101 + _3111;
    float _3115 = _3101;
    if (!_2811)
    {
        _3043 = _2807;
    }
    float _3117 = _3043;
    float _3119 = _2979 * _3029;
    if (!_2811)
    {
        float _3121 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3031);
        _3045 = _3121;
    }
    float _3123 = _3045;
    float _3125 = fma(_3113, _3113, _3103);
    if (!_2811)
    {
        _3047 = _3011;
    }
    float _3127 = _3047;
    float _3129 = _2885 * _3117;
    float _3131 = _2981 * _3117;
    float _3133 = _3125 + _3105;
    float _3135 = _2911 * _3117;
    float _3137 = _3019 * _3029;
    float _3139 = -_3119;
    float _3141 = _2887 * _3139;
    float _3143 = -_3119;
    float _3145 = _3007 * _3143;
    float _3147 = -_3119;
    float _3149 = _2913 * _3147;
    float _3151 = sqrt(_3133);
    float _3153 = fma(_2891, _3123, _3129);
    float _3155 = fma(_2989, _3123, _3131);
    float _3157 = fma(_2917, _3123, _3135);
    float _3159 = fma(_2885, _3137, _3141);
    float _3161 = fma(_2981, _3137, _3145);
    float _3163 = fma(_2911, _3137, _3149);
    float _3165 = fma(_2887, _3127, _3153);
    float _3167 = fma(_3007, _3127, _3155);
    float _3169 = fma(_2913, _3127, _3157);
    out.m_67.x = _2181;
    out.m_67.y = _2110;
    out.m_67.z = _2116;
    out.m_67.w = _2114;
    out.m_69.x = _2891;
    out.m_69.y = _2989;
    out.m_69.z = _2917;
    bool _3171 = _3151 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3173 = isnan(_3151);
    bool _3175 = _3171 || _3173;
    bool _3177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3179 = _3175 || _3177;
    out.m_71.x = _3159;
    out.m_71.y = _3161;
    out.m_71.z = _3163;
    out.m_73.x = _3165;
    out.m_73.y = _3167;
    out.m_73.z = _3169;
    float _3181 = _3129;
    if (!_3179)
    {
        _3181 = 1.0;
    }
    float _3183 = _3181;
    bool _3185 = !_3179;
    float _3187 = _3183;
    if (!_3185)
    {
        bool _3189 = _3151 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3191 = isnan(_3151);
        bool _3193 = _3189 || _3191;
        bool _3195 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3197 = _3193 || _3195;
        if (!_3197)
        {
            float _3199 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3201 = _3151 + _3199;
            float _3203 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3205 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3203;
            float _3207 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3209 = _3207 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3211 = 1.0 / _3205;
            float _3213 = _3201 * _3211;
            float _3215 = fma(_3213, _3209, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3187 = _3215;
            _3217 = true;
        }
        else
        {
            bool _3219 = _3151 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3221 = isnan(_3151);
            bool _3223 = _3219 || _3221;
            bool _3225 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3227 = _3223 || _3225;
            if (!_3227)
            {
                float _3229 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3231 = _3151 + _3229;
                float _3233 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3235 = _3233 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3237 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3239 = _3237 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3241 = 1.0 / _3235;
                float _3243 = _3231 * _3241;
                float _3245 = fma(_3243, _3239, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3187 = _3245;
                _3217 = true;
            }
            else
            {
                _3187 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3217 = false;
    float _3247 = _3187;
    float _3249 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3251 = _3101 + _3249;
    float _3253 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3255 = _3107 + _3253;
    float _3257 = fma(_3251, _3247, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3259 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3261 = _3109 + _3259;
    float _3263 = fma(_3255, _3247, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3267 = _3257 + _3265;
    float _3269 = fma(_3261, _3247, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3271 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3273 = _3263 + _3271;
    float _3275 = _3267 * _3267;
    float _3277 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3279 = _3269 + _3277;
    float _3281 = fma(_3273, _3273, _3275);
    float _3283 = fma(_3279, _3279, _3281);
    float _3285 = rsqrt(_3283);
    float _3287 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3289 = _3273 * _3287;
    float _3291 = _3279 * _3287;
    float _3293 = _3289 * _3289;
    float _3295 = _3291 * _3291;
    float _3297 = _3293 + _3295;
    float _3299 = sqrt(_3297);
    bool _3301 = _3299 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3303 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3305 = _3299 + _3303;
    float _3307 = _3285;
    float _3309 = _3305;
    float _3311 = _3247;
    float _3313 = _3267;
    float _3315 = _3289;
    if (_3301)
    {
        float _3317 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3307 = _3317;
    }
    float _3319 = _3307;
    if (_3301)
    {
        float _3321 = rsqrt(_3297);
        _3115 = _3321;
    }
    float _3323 = _3115;
    float _3325 = _3323;
    if (_3301)
    {
        float _3327 = _3305 * _3319;
        _3309 = _3327;
    }
    float _3329 = _3309;
    float _3331 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3301)
    {
        float _3333 = _3329 * 0.15915493667125701904296875;
        _3311 = _3333;
    }
    float _3335 = _3311;
    float _3337 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3331);
    float _3339 = _3279;
    if (_3301)
    {
        float _3341 = _3335 * 6.283185482025146484375;
        float _3343 = sin(_3341);
        _3339 = _3343;
    }
    float _3345 = _3339;
    float _3347 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3349 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3337);
    float _3351 = precise::max(0.0, _3347);
    float _3353 = _3319;
    float _3355 = _3351;
    if (_3301)
    {
        float _3357 = _3335 * 6.283185482025146484375;
        float _3359 = cos(_3357);
        _3353 = _3359;
    }
    float _3361 = _3353;
    float _3363 = -_3287;
    float _3365 = -_3351;
    float _3367 = fma(_3267, _3363, _3365);
    if (_3301)
    {
        float _3369 = _3367 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3313 = _3369;
    }
    float _3371 = _3313;
    float _3373 = sqrt(_3283);
    float _3375 = _3371;
    float _3377 = _3345;
    if (_3301)
    {
        float _3379 = fma(_3345, _3371, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3375 = _3379;
    }
    float _3381 = _3375;
    float _3383 = _3381;
    if (!_3301)
    {
        _3377 = _3291;
    }
    float _3385 = _3377;
    float _3387 = _3385;
    if (_3301)
    {
        float _3389 = _3361 + (-1.0);
        _3355 = _3389;
    }
    float _3391 = _3355;
    float _3393 = _3391;
    if (_3301)
    {
        float _3395 = _3323 * _3381;
        _3049 = _3395;
    }
    float _3397 = _3049;
    if (!_3301)
    {
        _3325 = _3367;
    }
    float _3399 = _3325;
    float _3401 = _3399;
    if (_3301)
    {
        float _3403 = _3391 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3393 = _3403;
    }
    float _3405 = _3393;
    float _3407 = _3405;
    if (_3301)
    {
        float _3409 = _3289 * _3397;
        _3315 = _3409;
    }
    float _3411 = _3315;
    if (!_3301)
    {
        _3383 = _3293;
    }
    float _3413 = _3383;
    float _3415 = _3413;
    if (_3301)
    {
        float _3417 = _3291 * _3397;
        _3387 = _3417;
    }
    float _3419 = _3387;
    if (_3301)
    {
        float _3421 = fma(_3367, _3361, _3405);
        _3401 = _3421;
    }
    float _3423 = _3401;
    if (_3301)
    {
        float _3425 = _3411 * _3411;
        _3415 = _3425;
    }
    float _3427 = _3415;
    if (!_3301)
    {
        _3407 = _3295;
    }
    float _3429 = _3407;
    float _3431 = _3429;
    if (_3301)
    {
        float _3433 = _3419 * _3419;
        _3431 = _3433;
    }
    float _3435 = _3431;
    float _3437 = fma(_3423, _3423, _3427);
    float _3439 = _3437 + _3435;
    float _3441 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3445 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3443);
    float _3447 = precise::clamp(_3445, 0.0, 1.0);
    float _3449 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3451 = rsqrt(_3439);
    float _3453 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3441);
    float _3455 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3457 = -_3447;
    float _3459 = _3457 + 1.0;
    float _3461 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3453);
    float _3463 = _3257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3465 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3455);
    float _3467 = _3461 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3469 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3463);
    float _3471 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3465);
    float _3473 = abs(_3459);
    float _3475 = log2(_3473);
    float _3477 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3479 = fma(_3269, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3469);
    float _3481 = _3471 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3483 = _3451 * _3411;
    float _3485 = -_3477;
    float _3487 = fma(_3485, _3449, 1.0);
    float _3489 = _3479 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3491 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3493 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3495 = _3451 * _3419;
    float _3497 = _3349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3499 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3491);
    float _3501 = _3451 * _3423;
    float _3503 = log2(_3487);
    float _3505 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3507 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3499);
    float _3509 = -_3493;
    float _3511 = fma(_3501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3509);
    float _3513 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3515 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3505);
    float _3517 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3507);
    float _3519 = -_3495;
    float _3521 = fma(_3519, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3511);
    float _3523 = exp2(_3513);
    float _3525 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3527 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3515);
    float _3529 = fma(_3521, -0.5, 0.5);
    float _3531 = fma(_3521, 0.5, 0.5);
    float _3533 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3525);
    float _3535 = _3501 + 1.0;
    float _3537 = 1.0 / _3517;
    float _3539 = fma(_3531, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3541 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3533);
    float _3543 = _3503 * 0.693147182464599609375;
    float _3545 = fma(_3531, _3539, -0.212114393711090087890625);
    float _3547 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3541);
    float _3549 = sqrt(_3529);
    float _3551 = -_3501;
    float _3553 = fma(_3523, _3535, _3551);
    float _3555 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3527);
    float _3557 = fma(_3531, _3545, 1.570728778839111328125);
    float _3559 = _3543 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3561 = fma(_3553, 0.5, 0.5);
    float _3563 = _3547 * _3537;
    float _3565 = _3555 * _3537;
    float _3567 = fma(_3563, 0.5, 0.5);
    float _3569 = fma(_3565, -0.5, 0.5);
    float _3571 = _3549 * 0.636619746685028076171875;
    float3 _9016 = float3(_3567, _3569, _3559);
    float _3573 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9016, float3(0.0), isnan(_9016)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9016, float3(0.0), isnan(_9016)), level(0.0)).x;
    float3 _9027 = float3(_3567, _3569, _3559);
    float4 _3575 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9027, float3(0.0), isnan(_9027)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9027, float3(0.0), isnan(_9027)), level(0.0)).xyzw;
    float _3577 = _3575.x;
    float _3579 = _3575.y;
    float _3581 = _3575.z;
    float _3583 = _3575.w;
    float _3585 = -_3557;
    float _3587 = fma(_3571, _3585, 1.0);
    float2 _9048 = float2(_3587, _3561);
    float3 _3591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9048, float2(0.0), isnan(_9048)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9048, float2(0.0), isnan(_9048)), level(0.0)).xyz;
    float _3593 = _3591.x;
    float _3595 = _3591.y;
    float _3597 = _3591.z;
    float _3599 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3601 = _3481 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2935;
    out.m_75.y = _3017;
    out.m_75.z = _2939;
    float _3603 = fma(_3489, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3601);
    float _3605 = exp2(_3599);
    out.m_49.x = 1.0;
    float _3607 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3603);
    out.m_77.x = _3263;
    out.m_77.y = _3257;
    out.m_77.z = _3269;
    float _3609 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3607);
    float _3611 = _3609 + _3517;
    out.gl_Position.x = _3547;
    out.gl_Position.y = _3555;
    out.gl_Position.z = _3609;
    out.gl_Position.w = _3517;
    float _3613 = -_3605;
    float _3615 = _3613 + 1.0;
    float _3617 = _3615 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3619 = _3611 * 0.5;
    float _3621 = -_3617;
    float _3623 = _3621 + 1.0;
    float _3625 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3619;
    out.m_79.w = _3517;
    out.m_81.w = _3625;
    float _3627 = _3617 * _3573;
    float _3629 = _3583 * _3627;
    float _3631 = _3597 * _3627;
    float _3633 = fma(_3593, _3629, _3577);
    float _3635 = fma(_3595, _3629, _3579);
    float _3637 = _3583 * _3623;
    float _3639 = fma(_3583, _3631, _3581);
    out.m_83.x = _3633;
    out.m_83.y = _3635;
    out.m_83.z = _3639;
    out.m_83.w = _3637;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

