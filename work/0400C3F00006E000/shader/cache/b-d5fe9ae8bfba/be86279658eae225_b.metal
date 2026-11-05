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
    float4 m_79 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _96(thread const int& _8833, thread const int& _8834, constant _10& support_buffer)
{
    float _8837 = as_type<float>(support_buffer._m4);
    int _8839 = _8834 + as_type<int>(_8837);
    int _8841 = 1 + _8839;
    float _8843 = support_buffer._m5[_8841].x;
    float _8845 = abs(_8843);
    bool _8847 = _8845 == 1.0;
    if (_8847)
    {
        return _8833;
    }
    float _8849 = float(_8833);
    float _8851 = _8849 / _8845;
    int _8853 = int(_8851);
    return _8853;
}

static inline __attribute__((always_inline))
int _97(thread const int& _8883, thread const int& _8884, constant _10& support_buffer)
{
    float _8887 = as_type<float>(support_buffer._m4);
    int _8889 = _8884 + as_type<int>(_8887);
    int _8891 = 1 + _8889;
    float _8893 = support_buffer._m5[_8891].x;
    bool _8895 = _8893 == 1.0;
    if (_8895)
    {
        return _8883;
    }
    float _8897 = float(_8883);
    float _8899 = _8897 * _8893;
    int _8901 = int(_8899);
    return _8901;
}

static inline __attribute__((always_inline))
void _94(thread const int& _8532, thread const int& _8533, thread const int& _8534, thread const int& _8535, thread int& _8536, thread int& _8537, thread int& _8538, thread int& _8539, thread int& _8540, thread int& _8541, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8544 = _8535;
    int _8546 = _8532;
    float _8548 = 0.0 + as_type<float>(_8532);
    bool _8550 = _8548 != 0.0;
    bool _8552 = isnan(_8548);
    bool _8554 = _8550 || _8552;
    bool _8556 = isnan(0.0);
    bool _8558 = _8554 || _8556;
    int _8560 = 0;
    int _8562 = _8558 ? (-1) : 0;
    if (!_8558)
    {
        float _8564 = as_type<float>(_8532) * 1.0;
        _8544 = as_type<int>(_8564);
    }
    int _8566 = _8544;
    bool _8568 = !_8558;
    int _8570 = _8566;
    int _8572 = _8566;
    if (!_8568)
    {
        bool _8574 = _8548 >= 0.0;
        bool _8576 = isnan(_8548);
        bool _8578 = _8574 || _8576;
        bool _8580 = isnan(0.0);
        bool _8582 = _8578 || _8580;
        _8562 = _8582 ? (-1) : 0;
        if (!_8582)
        {
            _8570 = 2147483647;
        }
        int _8584 = _8570;
        bool _8586 = !_8582;
        int _8588 = _8584;
        _8572 = _8584;
        if (!_8586)
        {
            float _8590 = abs(as_type<float>(_8532));
            float _8592 = 0.0 + _8590;
            bool _8594 = _8592 > as_type<float>(0x7f800000u /* inf */);
            bool _8596 = isnan(_8592);
            bool _8598 = _8594 || _8596;
            bool _8600 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _8602 = _8598 || _8600;
            _8560 = 2139095040;
            _8562 = _8602 ? (-1) : 0;
            if (_8602)
            {
                float _8604 = as_type<float>(_8532) + 1.0;
                _8588 = as_type<int>(_8604);
            }
            int _8606 = _8588;
            int _8608 = _8606;
            _8572 = _8606;
            if (!_8602)
            {
                bool _8610 = _8592 != as_type<float>(0x7f800000u /* inf */);
                bool _8612 = isnan(_8592);
                bool _8614 = _8610 || _8612;
                bool _8616 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _8618 = _8614 || _8616;
                _8562 = _8618 ? (-1) : 0;
                if (!_8618)
                {
                    _8608 = _8532;
                }
                int _8620 = _8608;
                bool _8622 = !_8618;
                _8572 = _8620;
                if (!_8622)
                {
                    float _8624 = as_type<float>(_8532) * 18446744073709551616.0;
                    float _8626 = rsqrt(_8624);
                    float _8628 = _8624 * _8626;
                    float _8630 = _8626 * 0.5;
                    float _8632 = -_8628;
                    float _8634 = 0.0 + _8632;
                    float _8636 = fma(_8630, _8634, 0.5);
                    float _8638 = fma(_8628, _8636, _8628);
                    float _8640 = -_8638;
                    float _8642 = 0.0 + _8640;
                    float _8644 = fma(_8638, _8642, _8624);
                    float _8646 = fma(_8630, _8644, _8638);
                    float _8648 = _8646 * 2.3283064365386962890625e-10;
                    _8546 = as_type<int>(_8624);
                    _8560 = as_type<int>(_8630);
                    _8572 = as_type<int>(_8648);
                }
            }
        }
    }
    int _8650 = _8546;
    int _8652 = _8560;
    int _8654 = _8572;
    int _8656 = _8562;
    _8536 = _8650;
    _8537 = _8652;
    _8538 = _8534;
    _8539 = 0;
    _8540 = _8654;
    _8541 = _8656;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3013 = false;
    bool _2125 = false;
    bool _1935 = false;
    bool _1441 = false;
    bool _1125 = false;
    bool _807 = false;
    bool _705 = false;
    bool _527 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3485 = as_type<float>(_119);
        out.gl_Position.z = _3485;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_51.w;
    float _125 = in.m_53.x;
    bool _127 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_123);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_123;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _125;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    float _159 = _157;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _161 = _157 * 5.0;
        _121 = as_type<int>(_161);
    }
    int _163 = _121;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3560 = as_type<float>(_163);
        out.gl_Position.z = _3560;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_57.w;
    float _167 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_51.x;
    float _181 = in.m_51.y;
    float _183 = in.m_51.z;
    float _185 = in.m_46.x;
    float _187 = in.m_46.y;
    float _189 = in.m_46.z;
    float _191 = _167;
    if (!_177)
    {
        float _193 = _167 * _167;
        float _195 = _193 * 0.5;
        _159 = _195;
    }
    float _197 = _159;
    float _199 = _197;
    if (!_177)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_177;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _167 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _167);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_177;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _167 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _191 = _261;
    }
    float _263 = _191;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _179, _267);
    float _275 = fma(_263, _181, _269);
    float _277 = fma(_263, _183, _271);
    float _279 = fma(_273, _165, _185);
    float _281 = fma(_275, _165, _187);
    float _283 = fma(_277, _165, _189);
    bool _285 = !_265;
    float _287 = _279;
    float _289 = _283;
    float _305;
    if (!_285)
    {
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_105);
        float _311 = 1.0 / _309;
        float _313 = _139 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _315 + _321;
    bool _325 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _327 = isnan(_315);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = _315 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = 1.0 / _339;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _357 = 1.0 / _351;
    float _359 = 1.0 / _347;
    float _361 = _319 * _353;
    bool _363 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _365 = isnan(_315);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -_335;
    float _377 = _375 + 1.0;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _379;
    float _383 = _373 * _377;
    float _385 = _323 * _357;
    bool _387 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_315);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_373;
    float _401 = _399 + 1.0;
    bool _403 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_315);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = -_397;
    float _421 = _419 + 1.0;
    float _423 = _397 * _401;
    float _425 = _343 * _359;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    float _435 = _413 * _421;
    float _437 = fma(_381, _425, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _439 = fma(_429, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _441 = fma(_433, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = -_413;
    float _449 = _447 + 1.0;
    float _451 = _439 * _435;
    float _453 = _441 * _435;
    float _455 = _437 * _435;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _461 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _463 = fma(_417, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _471;
    float _475 = fma(_445, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _477 = fma(_459, _385, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _479 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].z, _455);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _481;
    float _485 = fma(_463, _423, _465);
    float _487 = fma(_469, _361, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_473, _361, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = fma(_483, _361, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _493 = fma(_475, _423, _461);
    float _495 = fma(_477, _423, _479);
    float _497 = fma(_487, _383, _485);
    float _499 = fma(_489, _383, _493);
    float _501 = fma(_491, _383, _495);
    float _503 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[146].x, _497);
    float _505 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[146].y, _499);
    float _507 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[146].z, _501);
    bool _509 = !_355;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _513 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_105);
        float _531 = 1.0 / _529;
        float _533 = _139 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = in.m_57.x;
    float _539 = in.m_57.y;
    float _541 = in.m_57.z;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _545 = _535 + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _547;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _555 = 1.0 / _549;
    bool _557 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _559 = 1.0 / _553;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _561;
    float _565 = _507 * _541;
    float _567 = _505 * _539;
    bool _569 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _571 = isnan(_535);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _545 * _555;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _585 = _535 + _583;
    bool _587 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _589 = isnan(_535);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _599;
    bool _603 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _605 = isnan(_535);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_579;
    float _617 = _615 + 1.0;
    float _619 = fma(_563, _581, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _621 = fma(_601, _581, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _623 = _585 * _559;
    float _625 = _613 * _617;
    float _627 = -_613;
    float _629 = _627 + 1.0;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _631;
    float _635 = _597 * _629;
    float _637 = fma(_633, _581, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _639 = -_597;
    float _641 = _639 + 1.0;
    float _643 = _619 * _635;
    float _645 = _637 * _635;
    float _647 = _621 * _635;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[107].x, _645);
    float _663 = fma(_651, _623, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _665 = fma(_655, _623, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _667 = fma(_659, _623, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _669 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[107].y, _643);
    float _671 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[107].z, _647);
    float _673 = fma(_663, _625, _661);
    float _675 = fma(_665, _625, _669);
    float _677 = fma(_667, _625, _671);
    float _679 = _503 * _537;
    float _681 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[109].x, _673);
    float _683 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[109].y, _675);
    float _685 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[109].z, _677);
    bool _687 = !_557;
    float _703;
    if (!_687)
    {
        float _689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _691 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _695 = _693 * _689;
        float _697 = floor(_695);
        float _699 = -_697;
        float _701 = _695 + _699;
        _703 = _701;
        _705 = true;
    }
    else
    {
        float _707 = float(_105);
        float _709 = 1.0 / _707;
        float _711 = _139 * _709;
        _703 = _711;
    }
    _705 = false;
    float _713 = _703;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _717 = _713 + _715;
    bool _719 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _721 = isnan(_713);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _735 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _737 = isnan(_713);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _747;
    float _751 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _753 = -_729;
    float _755 = _753 + 1.0;
    bool _757 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _759 = 1.0 / _733;
    float _761 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _745 * _755;
    float _765 = -_745;
    float _767 = _765 + 1.0;
    float _769 = _749 * _759;
    float _771 = _685 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _773 = fma(_769, _717, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _773 * _763;
    float _779 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _781 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[115].x, _777);
    float _783 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[116].x, _781);
    float _787 = _785 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _761;
    out.m_59.y = _783;
    out.m_59.z = _775;
    out.m_59.w = _787;
    bool _789 = !_757;
    float _805;
    if (!_789)
    {
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _793 = _125 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _797 = _795 * _791;
        float _799 = floor(_797);
        float _801 = -_799;
        float _803 = _797 + _801;
        _805 = _803;
        _807 = true;
    }
    else
    {
        float _809 = float(_105);
        float _811 = 1.0 / _809;
        float _813 = _139 * _811;
        _805 = _813;
    }
    _807 = false;
    float _815 = _805;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _819 = _815 + _817;
    bool _821 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _823 = isnan(_815);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _837 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _839 = isnan(_815);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _849;
    bool _853 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _855 = isnan(_815);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = 1.0 / _835;
    bool _867 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _869 = isnan(_815);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _883 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _885 = isnan(_815);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = 1.0 / _881;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _899 = _851 * _865;
    float _901 = -_831;
    float _903 = _901 + 1.0;
    float _905 = fma(_899, _819, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _907 = _847 * _903;
    float _909 = -_847;
    float _911 = _909 + 1.0;
    bool _913 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _915 = isnan(_815);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _863 * _911;
    float _927 = -_863;
    float _929 = _927 + 1.0;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _935 = _877 * _929;
    float _937 = -_877;
    float _939 = _937 + 1.0;
    float _941 = 1.0 / _933;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _947 = -_893;
    float _949 = _947 + 1.0;
    float _951 = _893 * _939;
    bool _953 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _955 = isnan(_815);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = -_923;
    float _967 = _965 + 1.0;
    float _969 = _923 * _949;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _975 = 1.0 / _945;
    float _977 = _963 * _967;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _983 = -_963;
    float _985 = _983 + 1.0;
    float _987 = _973 * _895;
    float _989 = _905 * _977;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _995 = 1.0 / _981;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _999 = _815 + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1001;
    float _1005 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[159].x, _989);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1011 = fma(_987, _999, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1017 = _1003 * _941;
    float _1019 = 1.0 / _993;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1023 = _815 + _1021;
    float _1025 = fma(_1011, _969, _1005);
    float _1027 = _1015 * _975;
    float _1029 = fma(_1017, _1023, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1033 = _815 + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1035;
    float _1039 = 1.0 / _1009;
    float _1041 = fma(_1027, _1033, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1047 = _1037 * _995;
    float _1049 = fma(_1029, _951, _1025);
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1053 = _815 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1055;
    bool _1059 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1061 = isnan(_815);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = _1045 * _1019;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1075 = _815 + _1073;
    float _1077 = fma(_1047, _1053, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1079 = fma(_1041, _935, _1049);
    float _1081 = -_1069;
    float _1083 = _1081 + 1.0;
    float _1085 = fma(_1071, _1075, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1089 = _815 + _1087;
    float _1091 = _1057 * _1039;
    float _1093 = fma(_1077, _925, _1079);
    float _1095 = _831 * _1083;
    float _1097 = fma(_1091, _1089, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1099 = fma(_1085, _907, _1093);
    float _1101 = fma(_1097, _1095, _1099);
    float _1103 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1101);
    float _1105 = precise::clamp(_1103, 0.0, 1.0);
    bool _1107 = !_897;
    float _1123;
    if (!_1107)
    {
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1111 = _125 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[14].y, _139);
        float _1115 = _1113 * _1109;
        float _1117 = floor(_1115);
        float _1119 = -_1117;
        float _1121 = _1115 + _1119;
        _1123 = _1121;
        _1125 = true;
    }
    else
    {
        float _1127 = float(_105);
        float _1129 = 1.0 / _1127;
        float _1131 = _139 * _1129;
        _1123 = _1131;
    }
    _1125 = false;
    float _1133 = _1123;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1137 = _1133 + _1135;
    bool _1139 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1141 = isnan(_1133);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1155;
    bool _1159 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1161 = isnan(_1133);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    bool _1171 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1173 = isnan(_1133);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = 1.0 / _1153;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1189 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1191 = isnan(_1133);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = -_1181;
    float _1203 = _1201 + 1.0;
    bool _1205 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1207 = isnan(_1133);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = 1.0 / _1187;
    float _1219 = -_1199;
    float _1221 = _1219 + 1.0;
    bool _1223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1225 = _1157 * _1183;
    float _1227 = -_1149;
    float _1229 = _1227 + 1.0;
    float _1231 = -_1169;
    float _1233 = _1231 + 1.0;
    float _1235 = -_1215;
    float _1237 = _1235 + 1.0;
    float _1239 = fma(_1225, _1137, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1241 = _1169 * _1229;
    float _1243 = _1181 * _1233;
    float _1245 = _1199 * _1203;
    bool _1247 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1249 = isnan(_1133);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1265 = _1263 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1267 = _1215 * _1221;
    bool _1269 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1271 = isnan(_1133);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1257 * _1237;
    float _1283 = 1.0 / _1265;
    float _1285 = -_1257;
    float _1287 = _1285 + 1.0;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1293 = _1279 * _1287;
    float _1295 = -_1279;
    float _1297 = _1295 + 1.0;
    float _1299 = _1291 * _1217;
    float _1301 = 1.0 / _1261;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1307 = _1239 * _1293;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1313;
    float _1317 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1307);
    float _1319 = 1.0 / _1305;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1323 = _1133 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1327 = _1325 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1329 = _1315 * _1283;
    float _1331 = fma(_1299, _1323, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1335 = _1133 + _1333;
    float _1337 = 1.0 / _1311;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1343 = fma(_1329, _1335, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1345 = fma(_1331, _1281, _1317);
    float _1347 = _1341 * _1301;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1351 = _1133 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1353;
    float _1357 = 1.0 / _1327;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1363 = fma(_1347, _1351, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1365 = _1355 * _1319;
    float _1367 = fma(_1343, _1267, _1345);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1371 = _1133 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1375 = _1133 + _1373;
    float _1377 = _1361 * _1337;
    bool _1379 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1381 = isnan(_1133);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1391;
    float _1395 = fma(_1365, _1371, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1397 = fma(_1363, _1245, _1367);
    float _1399 = fma(_1377, _1375, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1401 = -_1389;
    float _1403 = _1401 + 1.0;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1407 = _1133 + _1405;
    float _1409 = _1393 * _1357;
    float _1411 = fma(_1395, _1243, _1397);
    float _1413 = _1149 * _1403;
    float _1415 = fma(_1409, _1407, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1417 = fma(_1399, _1241, _1411);
    float _1419 = fma(_1415, _1413, _1417);
    float _1421 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1419);
    out.m_61.x = _1421;
    bool _1423 = !_1223;
    float _1439;
    if (!_1423)
    {
        float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1427 = _125 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[14].z, _139);
        float _1431 = _1429 * _1425;
        float _1433 = floor(_1431);
        float _1435 = -_1433;
        float _1437 = _1431 + _1435;
        _1439 = _1437;
        _1441 = true;
    }
    else
    {
        float _1443 = float(_105);
        float _1445 = 1.0 / _1443;
        float _1447 = _139 * _1445;
        _1439 = _1447;
    }
    _1441 = false;
    float _1449 = _1439;
    int _1451 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1453 = _1451;
    int _1455 = 0;
    int _1457 = _96(_1453, _1455, (*spvDescriptorSet0.support_buffer));
    float _1459 = in.m_63.z;
    float _1461 = trunc(_1459);
    int _1463 = int(_1461);
    int _1465 = _1457 + (-1);
    float _1467 = float(_1465);
    float _1469 = _1105 * _1467;
    float _1471 = trunc(_1469);
    int _1473 = int(_1471);
    int _1475 = _1473;
    int _1477 = 0;
    int _1479 = _97(_1475, _1477, (*spvDescriptorSet0.support_buffer));
    int _1481 = _1463;
    int _1483 = 0;
    int _1485 = _97(_1481, _1483, (*spvDescriptorSet0.support_buffer));
    float4 _1488 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1479, _1485)), 0).xyzw;
    float _1490 = _1488.x;
    float _1492 = _1488.y;
    float _1494 = _1488.z;
    float _1496 = _1488.w;
    float _1498 = in.m_53.y;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1502 = _1500 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1512 = 1.0 / _1502;
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1518 = in.m_63.x;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1522 = _1520 != 0;
    float _1524 = 1.0 / _1506;
    bool _1526 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1528 = isnan(_1449);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1540 = _1538 != 0;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1542;
    bool _1546 = _125 > 0.5;
    bool _1548 = _1546 && _1522;
    float _1550 = -_1536;
    float _1552 = _1550 + 1.0;
    bool _1554 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1556 = isnan(_1449);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = 1.0 / _1510;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1568;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1576 = _1570 * _1512;
    bool _1578 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1580 = isnan(_1449);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = 1.0 / _1516;
    bool _1592 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1594 = isnan(_1449);
    bool _1596 = _1592 || _1594;
    bool _1598 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1600 = _1596 || _1598;
    float _1602 = float(_1600);
    float _1604 = _1574 * _1524;
    bool _1606 = _1498 > 0.5;
    bool _1608 = _1606 && _1540;
    float _1610 = _1602 * _1552;
    float _1612 = -_1602;
    float _1614 = _1612 + 1.0;
    bool _1616 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1618 = isnan(_1449);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1632 = _1544 * _1566;
    float _1634 = _1564 * _1614;
    float _1636 = -_1564;
    float _1638 = _1636 + 1.0;
    bool _1640 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1642 = isnan(_1449);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1654 = _1449 + _1652;
    float _1656 = _1630 * _1590;
    float _1658 = -_1626;
    float _1660 = _1658 + 1.0;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1666 = _1626 * _1638;
    bool _1668 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1670 = isnan(_1449);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = _1650 * _1660;
    float _1682 = -_1650;
    float _1684 = _1682 + 1.0;
    float _1686 = 1.0 / _1664;
    float _1688 = fma(_1576, _1654, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1690 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1692 = isnan(_1449);
    bool _1694 = _1690 || _1692;
    bool _1696 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1698 = _1694 || _1696;
    float _1700 = float(_1698);
    float _1702 = _1678 * _1684;
    float _1704 = -_1678;
    float _1706 = _1704 + 1.0;
    float _1708 = _1700 * _1706;
    float _1710 = -_1700;
    float _1712 = _1710 + 1.0;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1724 = _1449 + _1722;
    float _1726 = _1588 * _1712;
    float _1728 = -_1588;
    float _1730 = _1728 + 1.0;
    float _1732 = _1716 * _1686;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1736 = _1449 + _1734;
    float _1738 = 1.0 / _1720;
    float _1740 = _1688 * _1726;
    float _1742 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1744 = _1742 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1746 = fma(_1632, _1736, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1748 = fma(_1604, _1724, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1750 = in.m_63.y;
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1740);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1756 = _1449 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1760 = _1758 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1762 = 1.0 / _1744;
    float _1764 = fma(_1748, _1708, _1752);
    float _1766 = fma(_1656, _1756, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1770 = _1449 + _1768;
    float _1772 = fma(_1746, _1702, _1764);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1776 = _1449 + _1774;
    float _1778 = _1760 * _1738;
    float _1780 = fma(_1732, _1770, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1782 = fma(_1766, _1680, _1772);
    float _1784 = fma(_1778, _1776, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1788 = _1449 + _1786;
    float _1790 = fma(_1780, _1666, _1782);
    int _1792 = _1473 + 1;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1794;
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1800 = fma(_1784, _1634, _1790);
    float _1802 = _1634;
    float _1804 = _1788;
    if (_1522)
    {
        _1802 = _1518;
    }
    float _1806 = _1802;
    float _1808 = _1796 * _1762;
    float _1810 = _1750;
    float _1812 = _1806;
    if (_1608)
    {
        float _1814 = -_1750;
        float _1816 = _1814 + 1.0;
        _1810 = _1816;
    }
    float _1818 = _1810;
    int _1820 = min(_1465, _1792);
    if (_1548)
    {
        float _1822 = -_1806;
        float _1824 = _1822 + 1.0;
        _1812 = _1824;
    }
    float _1826 = _1812;
    float _1828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1830 = fma(_1808, _1788, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    if (!_1522)
    {
        _1804 = _1518;
    }
    float _1832 = _1804;
    float _1834 = _1832;
    if (_1522)
    {
        _1834 = _1826;
    }
    float _1836 = _1834;
    float _1838 = fma(_1830, _1610, _1800);
    float _1840 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1842 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1844 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1838);
    float _1846 = _1840 * _1798;
    out.m_65.x = _1844;
    float _1848 = _1842 * _1828;
    uint _1851 = as_type<uint>(half2(float2(_1496, 0.0)));
    uint _1853 = extract_bits(_1851, 0u, 8u);
    int _1855 = int(_1853) & 255;
    uint _1857 = extract_bits(_1851, 8u, 8u);
    int _1859 = int(_1857) & 255;
    int _1861 = _1859 << 8;
    int _1863 = _1855 | _1861;
    bool _1865 = _1863 >= 32768;
    int _1867 = _1863 + (-1024);
    int _1869 = _1867;
    if (_1865)
    {
        int _1871 = ~_1863;
        int _1873 = _1871 + 33792;
        int _1875 = _1873 + 1;
        _1869 = _1875;
    }
    int _1877 = _1869;
    int _1879 = _1877 + 30719;
    float _1881 = float(_1879);
    float _1883 = fma(_1881, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1885 = abs(_1883);
    float _1887 = -_1885;
    float _1889 = _1887 + 1.0;
    float _1891 = abs(_1883);
    float _1893 = fma(_1891, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1895 = _1883 < 0.0;
    float _1897 = float(_1895);
    int _1899 = as_type<int>(_1889) + (-218103808);
    float _1901 = abs(_1883);
    float _1903 = fma(_1901, _1893, -0.212114393711090087890625);
    bool _1905 = uint(_1899) >= 1920991232u;
    float _1907 = abs(_1883);
    float _1909 = fma(_1907, _1903, 1.570728778839111328125);
    bool _1911 = !_1905;
    float _1933;
    if (!_1911)
    {
        int _1913 = as_type<int>(_1889);
        int _1915 = as_type<int>(_1842);
        int _1917 = 9248;
        int _1919 = as_type<int>(_1730);
        int _1921;
        int _1923;
        int _1925;
        int _1927;
        int _1929;
        int _1931;
        _94(_1913, _1915, _1917, _1919, _1921, _1923, _1925, _1927, _1929, _1931, out.gl_Position, out.gl_PointSize);
        _1933 = as_type<float>(_1929);
        _1935 = true;
    }
    else
    {
        float _1937 = rsqrt(_1889);
        float _1939 = _1889 * _1937;
        float _1941 = _1937 * 0.5;
        float _1943 = -_1939;
        float _1945 = 0.0 + _1943;
        float _1947 = fma(_1941, _1945, 0.5);
        float _1949 = fma(_1939, _1947, _1939);
        float _1951 = -_1949;
        float _1953 = 0.0 + _1951;
        float _1955 = fma(_1949, _1953, _1889);
        float _1957 = fma(_1941, _1955, _1949);
        _1933 = _1957;
    }
    _1935 = false;
    float _1959 = _1933;
    int _1961 = _1820;
    int _1963 = 0;
    int _1965 = _97(_1961, _1963, (*spvDescriptorSet0.support_buffer));
    int _1967 = _1463;
    int _1969 = 0;
    int _1971 = _97(_1967, _1969, (*spvDescriptorSet0.support_buffer));
    float4 _1973 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1965, _1971)), 0).xyzw;
    float _1975 = _1973.x;
    float _1977 = _1973.y;
    float _1979 = _1973.z;
    float _1981 = _1973.w;
    float _1983 = _1909 * _1959;
    float _1985 = _1897 * 2.0;
    float _1987 = _1881 * 3.883221149444580078125;
    float _1989 = floor(_1469);
    float _1991 = -_1985;
    float _1993 = fma(_1983, _1991, _1983);
    float _1995 = _1987 * 0.15915493667125701904296875;
    float _1997 = fma(_1897, 3.1415927410125732421875, _1993);
    float _1999 = _1995 * 6.283185482025146484375;
    float _2001 = cos(_1999);
    float _2003 = _1997 * 0.15915493667125701904296875;
    float _2005 = _2003 * 6.283185482025146484375;
    float _2007 = sin(_2005);
    float _2009 = -_1989;
    float _2011 = _1469 + _2009;
    float _2013 = _1995 * 6.283185482025146484375;
    float _2015 = sin(_2013);
    float _2017 = _2007 * _2001;
    float _2019 = _2007 * _2015;
    uint _2021 = as_type<uint>(half2(float2(_1981, 0.0)));
    float _2023 = -_1490;
    float _2025 = _2023 + _1975;
    uint _2027 = extract_bits(_2021, 0u, 8u);
    int _2029 = int(_2027) & 255;
    uint _2031 = extract_bits(_2021, 8u, 8u);
    int _2033 = int(_2031) & 255;
    int _2035 = _2033 << 8;
    int _2037 = _2029 | _2035;
    float _2039 = fma(_2011, _2025, _1490);
    bool _2041 = _2037 >= 32768;
    int _2043 = _2037 + (-1024);
    int _2045 = _2043;
    float _2047 = _2011;
    if (_2041)
    {
        int _2049 = ~_2037;
        int _2051 = _2049 + 33792;
        int _2053 = _2051 + 1;
        _2045 = _2053;
    }
    int _2055 = _2045;
    float _2057 = -_1494;
    float _2059 = _2057 + _1979;
    int _2061 = _2055 + 30719;
    float _2063 = fma(_2011, _2059, _1494);
    float _2065 = float(_2061);
    float _2067 = fma(_2065, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2069 = abs(_2067);
    float _2071 = -_2069;
    float _2073 = _2071 + 1.0;
    float _2075 = abs(_2067);
    float _2077 = fma(_2075, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2079 = as_type<int>(_2073) + (-218103808);
    float _2081 = abs(_2067);
    float _2083 = fma(_2081, _2077, -0.212114393711090087890625);
    bool _2085 = uint(_2079) >= 1920991232u;
    float _2087 = -_1492;
    float _2089 = _2087 + _1977;
    bool _2091 = _2067 < 0.0;
    float _2093 = float(_2091);
    float _2095 = abs(_2067);
    float _2097 = fma(_2095, _2083, 1.570728778839111328125);
    float _2099 = fma(_2011, _2089, _1492);
    bool _2101 = !_2085;
    float _2123;
    if (!_2101)
    {
        int _2103 = as_type<int>(_2073);
        int _2105 = as_type<int>(_1979);
        int _2107 = 10144;
        int _2109 = as_type<int>(_1983);
        int _2111;
        int _2113;
        int _2115;
        int _2117;
        int _2119;
        int _2121;
        _94(_2103, _2105, _2107, _2109, _2111, _2113, _2115, _2117, _2119, _2121, out.gl_Position, out.gl_PointSize);
        _2123 = as_type<float>(_2119);
        _2125 = true;
    }
    else
    {
        float _2127 = rsqrt(_2073);
        float _2129 = _2073 * _2127;
        float _2131 = _2127 * 0.5;
        float _2133 = -_2129;
        float _2135 = 0.0 + _2133;
        float _2137 = fma(_2131, _2135, 0.5);
        float _2139 = fma(_2129, _2137, _2129);
        float _2141 = -_2139;
        float _2143 = 0.0 + _2141;
        float _2145 = fma(_2139, _2143, _2073);
        float _2147 = fma(_2131, _2145, _2139);
        _2123 = _2147;
    }
    _2125 = false;
    float _2149 = _2123;
    float _2151 = in.m_53.x;
    float _2153 = in.m_53.y;
    float _2155 = in.m_53.z;
    float _2157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2159 = log2(_2157);
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2163 = _2161 != 0;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2167 = _2165 != 0;
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2171 = _2169 != 0;
    bool _2173 = !_2171;
    int _2175 = _2173 ? 0 : 1;
    bool _2177 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2179 = isnan(1.0);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2185 = _2181 || _2183;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2189 = 1.0 + _2187;
    int _2191 = abs(_2175);
    float _2193 = _2159 * _139;
    float _2195 = 1.0 / _2189;
    float _2197 = _2155 * 2.0;
    float _2199 = _2155 + _2151;
    float _2201 = _2153 * 2.0;
    float _2203 = _2153 + _2151;
    float _2205 = _2151 * 2.0;
    float _2207 = _2199 + (-1.0);
    float _2209 = floor(_2197);
    float _2211 = _2203 + (-1.0);
    float _2213 = _2151 + (-0.5);
    float _2215 = fma(_2207, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2217 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2219 = fma(_2211, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2221 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2223 = floor(_2201);
    float _2225 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2217);
    float _2227 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2221);
    float _2229 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2225);
    float _2231 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2227);
    float _2233 = exp2(_2193);
    bool _2235 = _2209 > 0.0;
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2239 = _2209 >= 0.0;
    bool _2241 = isnan(_2209);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(0.0);
    bool _2247 = _2243 || _2245;
    float _2249 = _2229 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2251 = _2247 ? 0 : 1;
    float _2253 = floor(_2205);
    bool _2255 = _2223 > 0.0;
    int _2257 = ~_2251;
    int _2259 = _2257 + 1;
    int _2261 = _2259 + 1;
    bool _2263 = _2223 >= 0.0;
    bool _2265 = isnan(_2223);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan(0.0);
    bool _2271 = _2267 || _2269;
    int _2273 = _2261;
    bool _2275 = _2185;
    if (!_2235)
    {
        int _2277 = ~_2251;
        int _2279 = _2277 + 1;
        _2273 = _2279;
    }
    int _2281 = _2273;
    float _2283 = -_2233;
    float _2285 = _2283 + 1.0;
    float _2287 = in.m_67.x;
    float _2289 = in.m_67.y;
    float _2291 = in.m_67.z;
    bool _2293 = !_2163;
    int _2295 = _2293 ? 0 : 1;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2299 = _2237 + _2297;
    bool _2301 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2303 = isnan(0.0);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2309 = _2305 || _2307;
    int _2311 = abs(_2295);
    float _2313 = -_2249;
    float _2315 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2317 = _2309 ? _2285 : 0.0;
    int _2319 = _2271 ? 0 : 1;
    bool _2321 = _2253 > 0.0;
    float _2323 = _2299;
    float _2325 = _2315;
    if (_2185)
    {
        float _2327 = _2317 * _2195;
        _143 = _2327;
    }
    float _2329 = _143;
    bool _2331 = _2253 >= 0.0;
    bool _2333 = isnan(_2253);
    bool _2335 = _2331 || _2333;
    bool _2337 = isnan(0.0);
    bool _2339 = _2335 || _2337;
    float _2341 = float(_2311);
    float _2343 = float(_2281);
    float _2345 = abs(_2299);
    float _2347 = abs(_2315);
    float _2349 = precise::max(_2345, _2347);
    int _2351 = ~_2319;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    float _2357 = _2341 * _2343;
    bool _2359 = !_2167;
    int _2361 = _2359 ? 0 : 1;
    int _2363 = _2355;
    float _2365 = _2329;
    if (!_2255)
    {
        int _2367 = ~_2319;
        int _2369 = _2367 + 1;
        _2363 = _2369;
    }
    int _2371 = _2363;
    float _2373 = _2357 * (-2.0);
    bool _2375 = _2349 >= 16.0;
    int _2377 = abs(_2361);
    float _2379 = fma(_2373, _2287, _2287);
    float _2381 = float(_2191);
    float _2383 = fma(_2219, _2373, _2219);
    float _2385 = float(_2371);
    float _2387 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2379);
    int _2389 = _2339 ? 0 : 1;
    float _2391 = _2155 + (-0.5);
    float _2393 = _2381 * _2385;
    int _2395 = ~_2389;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    int _2401 = _2399;
    if (_2375)
    {
        float _2403 = _2299 * 0.0625;
        _2323 = _2403;
    }
    float _2405 = _2323;
    if (!_2321)
    {
        int _2407 = ~_2389;
        int _2409 = _2407 + 1;
        _2401 = _2409;
    }
    int _2411 = _2401;
    float _2413 = _2393 * (-2.0);
    if (_2375)
    {
        float _2415 = _2315 * 0.0625;
        _2325 = _2415;
    }
    float _2417 = _2325;
    float _2419 = fma(_2383, _2329, _2387);
    float _2421 = abs(_2405);
    bool _2423 = _2421 != 0.0;
    bool _2425 = isnan(_2421);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(0.0);
    bool _2431 = _2427 || _2429;
    float _2433 = fma(_2413, _2291, _2291);
    float _2435 = fma(_2215, _2413, _2215);
    float _2437 = float(_2377);
    float _2439 = _2155 + _2153;
    float _2441 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2433);
    float _2443 = float(_2411);
    float _2445 = _2419 * 0.15915493667125701904296875;
    float _2447 = abs(_2417);
    bool _2449 = _2447 == 0.0;
    bool _2451 = !_2431;
    bool _2453 = _2449 && _2451;
    float _2455 = fma(_2435, _2329, _2441);
    float _2457 = abs(_2417);
    bool _2459 = _2457 == 0.0;
    float _2461 = _2437 * _2443;
    float _2463 = _2455 * 0.15915493667125701904296875;
    float _2465 = _2439 + (-1.0);
    float _2467 = _2461 * (-2.0);
    float _2469 = _2445 * 6.283185482025146484375;
    float _2471 = sin(_2469);
    float _2473 = _2153 + (-0.5);
    float _2475 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2477 = fma(_2467, _2289, _2289);
    int _2479 = as_type<int>(_2477);
    if (_2453)
    {
        bool _2481 = as_type<int>(_2417) >= 0;
        _2275 = _2481;
    }
    bool _2483 = _2275;
    float _2485 = fma(_2475, _2467, _2475);
    float _2487 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2477);
    float _2489 = _2445 * 6.283185482025146484375;
    float _2491 = cos(_2489);
    int _2493 = _2483 ? (-1) : 0;
    if (_2453)
    {
        int _2495 = _2483 ? 0 : 1078530011;
        _2479 = _2495;
    }
    int _2497 = _2479;
    float _2499 = fma(_2485, _2329, _2487);
    int _2501 = _2497;
    if (_2453)
    {
        int _2503 = int(0x80000000) & as_type<int>(_2405);
        int _2505 = _2497 | _2503;
        _2365 = as_type<float>(_2505);
    }
    float _2507 = _2365;
    float _2509 = _2463 * 6.283185482025146484375;
    float _2511 = sin(_2509);
    bool _2513 = !_2431;
    bool _2515 = _2513 && _2459;
    float _2517 = _2507;
    float _2519 = _2507;
    if (!_2515)
    {
        float _2521 = abs(_2405);
        bool _2523 = _2521 != as_type<float>(0x7f800000u /* inf */);
        bool _2525 = isnan(_2521);
        bool _2527 = _2523 || _2525;
        bool _2529 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2531 = _2527 || _2529;
        float _2533 = abs(_2417);
        bool _2535 = _2533 == as_type<float>(0x7f800000u /* inf */);
        float _2537 = abs(_2417);
        bool _2539 = _2537 == as_type<float>(0x7f800000u /* inf */);
        bool _2541 = !_2531;
        bool _2543 = _2539 && _2541;
        if (_2543)
        {
            bool _2545 = as_type<int>(_2417) >= 0;
            _2493 = _2545 ? (-1) : 0;
        }
        int _2547 = _2493;
        if (_2543)
        {
            _2501 = 1075235812;
        }
        int _2549 = _2501;
        int _2551 = _2549;
        if (_2543)
        {
            int _2553 = ~_2547;
            int _2555 = (_2553 != 0) ? _2549 : 1061752795;
            _2551 = _2555;
        }
        int _2557 = _2551;
        if (_2543)
        {
            int _2559 = int(0x80000000) & as_type<int>(_2405);
            int _2561 = _2557 | _2559;
            _2517 = as_type<float>(_2561);
        }
        float _2563 = _2517;
        bool _2565 = !_2531;
        bool _2567 = _2565 && _2535;
        _2519 = _2563;
        if (!_2567)
        {
            float _2569 = abs(_2405);
            float _2571 = abs(_2417);
            float _2573 = precise::max(_2569, _2571);
            float _2575 = abs(_2405);
            float _2577 = abs(_2417);
            float _2579 = precise::min(_2575, _2577);
            float _2581 = 1.0 / _2573;
            float _2583 = abs(_2405);
            float _2585 = abs(_2417);
            bool _2587 = _2583 > _2585;
            bool _2589 = as_type<int>(_2417) >= 0;
            float _2591 = _2579 * _2581;
            float _2593 = abs(_2405);
            float _2595 = abs(_2417);
            float _2597 = _2593 + _2595;
            int _2599 = as_type<int>(_2405) & int(0x80000000);
            float _2601 = _2591 * _2591;
            bool _2603 = _2597 > as_type<float>(0x7f800000u /* inf */);
            bool _2605 = isnan(_2597);
            bool _2607 = _2603 || _2605;
            bool _2609 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2611 = _2607 || _2609;
            float _2613 = _2601 + 11.33538818359375;
            float _2615 = fma(_2601, _2613, 28.84246826171875);
            float _2617 = fma(_2601, _2615, 19.6966705322265625);
            float _2619 = fma(_2601, -0.82336294651031494140625, -5.674867153167724609375);
            float _2621 = fma(_2601, _2619, -6.565555095672607421875);
            float _2623 = 1.0 / _2617;
            float _2625 = _2601 * _2621;
            float _2627 = _2591 * _2625;
            float _2629 = fma(_2627, _2623, _2591);
            float _2631 = _2629;
            _2519 = _2597;
            if (_2587)
            {
                float _2633 = -_2629;
                float _2635 = _2633 + 1.57079637050628662109375;
                _2631 = _2635;
            }
            float _2637 = _2631;
            int _2639 = as_type<int>(_2637);
            if (!_2589)
            {
                float _2641 = -_2637;
                float _2643 = _2641 + 3.1415927410125732421875;
                _2639 = as_type<int>(_2643);
            }
            int _2645 = _2639;
            if (!_2611)
            {
                int _2647 = _2599 | _2645;
                _2519 = as_type<float>(_2647);
            }
        }
    }
    float _2649 = _2519;
    float _2651 = -_2649;
    float _2653 = _2499 + _2651;
    float _2655 = _2463 * 6.283185482025146484375;
    float _2657 = cos(_2655);
    float _2659 = _679 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2661 = _2653 * 0.15915493667125701904296875;
    float _2663 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2665 = _2491 * _2511;
    float _2667 = _2097 * _2149;
    float _2669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2039);
    float _2671 = _2661 * 6.283185482025146484375;
    float _2673 = sin(_2671);
    float _2675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2099);
    float _2677 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2679 = _2669 * _2659;
    float _2681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2063);
    float _2683 = _2675 * _2663;
    float _2685 = _2471 * _2511;
    float _2687 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2689 = _2661 * 6.283185482025146484375;
    float _2691 = cos(_2689);
    float _2693 = _2471 * _2657;
    float _2695 = _2491 * _2657;
    float _2697 = _2681 * _2677;
    float _2699 = -_1883;
    float _2701 = _2699 + _2067;
    float _2703 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2687);
    bool _2705 = _2099 != 0.0;
    bool _2707 = isnan(_2099);
    bool _2709 = _2705 || _2707;
    bool _2711 = isnan(0.0);
    bool _2713 = _2709 || _2711;
    float _2715 = -_2665;
    float _2717 = fma(_2673, _2693, _2715);
    float _2719 = _2065 * 3.883221149444580078125;
    float _2721 = _2093 * 2.0;
    float _2723 = fma(_2673, _2695, _2685);
    float _2725 = _2717 * _2683;
    float _2727 = _2719 * 0.15915493667125701904296875;
    float _2729 = -_2721;
    float _2731 = fma(_2667, _2729, _2667);
    float _2733 = fma(_2673, _2685, _2695);
    float _2735 = _2471 * _2691;
    float _2737 = _2691 * _2657;
    float _2739 = _2491 * _2691;
    float _2741 = fma(_2093, 3.1415927410125732421875, _2731);
    float _2743 = _2735 * _2683;
    float _2745 = fma(_2737, _2679, _2725);
    float _2747 = _2691 * _2511;
    float _2749 = _2733 * _2683;
    float _2751 = -_2673;
    float _2753 = fma(_2751, _2679, _2743);
    float _2755 = fma(_2723, _2697, _2745);
    float _2757 = _2741 * 0.15915493667125701904296875;
    float _2759 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2703);
    float _2761 = fma(_2739, _2697, _2753);
    float _2763 = _2237 + _2755;
    float _2765 = _2727 * 6.283185482025146484375;
    float _2767 = cos(_2765);
    float _2769 = -_2693;
    float _2771 = fma(_2673, _2665, _2769);
    float _2773 = _2249 + _2761;
    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2777 = _2763 + _2775;
    float _2779 = fma(_2747, _2679, _2749);
    float _2781 = _2759 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2785 = _2773 + _2783;
    float _2787 = _2777 * _2777;
    float _2789 = _2757 * 6.283185482025146484375;
    float _2791 = sin(_2789);
    bool _2793 = _2039 == 0.0;
    bool _2795 = !_2713;
    bool _2797 = _2793 && _2795;
    float _2799 = _2785 * _2785;
    float _2801 = fma(_2011, _2701, _1883);
    bool _2803 = _2063 == 0.0;
    bool _2805 = _2803 && _2797;
    float _2807 = _2787 + _2799;
    float _2809 = _2727 * 6.283185482025146484375;
    float _2811 = sin(_2809);
    float _2813 = sqrt(_2807);
    float _2815 = -_2017;
    float _2817 = fma(_2791, _2767, _2815);
    float _2819 = fma(_2011, _2817, _2017);
    float _2821 = -_2019;
    float _2823 = fma(_2791, _2811, _2821);
    float _2825 = fma(_2771, _2697, _2779);
    float _2827 = fma(_2011, _2823, _2019);
    float _2829 = _2781 + _2825;
    bool _2831 = _2813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2833 = _2697;
    float _2835 = _2701;
    float _2837 = _2819;
    float _2839 = _2739;
    float _2841 = _2723;
    if (!_2831)
    {
        _2047 = _2799;
    }
    float _2843 = _2047;
    float _2845 = _2843;
    if (!_2831)
    {
        _2833 = _2787;
    }
    float _2847 = _2833;
    float _2849 = _2847;
    if (!_2831)
    {
        _287 = _2763;
    }
    float _2851 = _287;
    float _2853 = _2851;
    if (!_2831)
    {
        _2835 = _2773;
    }
    float _2855 = _2835;
    float _2857 = _2855;
    if (!_2831)
    {
        _289 = _2829;
    }
    float _2859 = _289;
    bool _2861 = !_2831;
    float _2863 = _2859;
    if (!_2861)
    {
        float _2865 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2869 = _2813 + _2867;
        float _2871 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2873 = rsqrt(_2807);
        float _2875 = _2869 * _2865;
        float _2877 = _2875 * 0.15915493667125701904296875;
        float _2879 = _2877 * 6.283185482025146484375;
        float _2881 = sin(_2879);
        float _2883 = _2877 * 6.283185482025146484375;
        float _2885 = cos(_2883);
        float _2887 = fma(_2881, _2871, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2889 = _2873 * _2887;
        float _2891 = _2885 + (-1.0);
        float _2893 = _2777 * _2889;
        float _2895 = _2785 * _2889;
        float _2897 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2899 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2901 = _2893 * _2893;
        float _2903 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2905 = fma(_2829, _2885, _2897);
        float _2907 = _2895 * _2895;
        _2863 = _2905;
        _2849 = _2901;
        _2845 = _2907;
        _2853 = _2899;
        _2857 = _2903;
    }
    float _2909 = _2863;
    float _2911 = _2849;
    float _2913 = _2845;
    float _2915 = _2853;
    float _2917 = _2857;
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2921 = _2909 + _2919;
    float _2923 = _2801;
    float _2925 = _2909;
    if (!_2805)
    {
        float _2927 = fma(_2039, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2819);
        _2837 = _2927;
    }
    float _2929 = _2837;
    float _2931 = fma(_2921, _2921, _2911);
    out.m_69.x = _1848;
    out.m_69.y = _1846;
    float _2933 = _2827;
    float _2935 = _2929;
    if (!_2805)
    {
        float _2937 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2801);
        _2923 = _2937;
    }
    float _2939 = _2923;
    float _2941 = _2931 + _2913;
    if (!_2805)
    {
        float _2943 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2827);
        _2933 = _2943;
    }
    float _2945 = _2933;
    float _2947 = _2717 * _2939;
    float _2949 = _2733 * _2939;
    float _2951 = _2735 * _2939;
    float _2953 = sqrt(_2941);
    float _2955 = fma(_2737, _2929, _2947);
    float _2957 = fma(_2747, _2929, _2949);
    float _2959 = -_2673;
    float _2961 = fma(_2959, _2929, _2951);
    float _2963 = fma(_2723, _2945, _2955);
    float _2965 = fma(_2771, _2945, _2957);
    float _2967 = fma(_2739, _2945, _2961);
    out.m_71.x = _2963;
    out.m_71.y = _2965;
    out.m_71.z = _2967;
    bool _2969 = _2953 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2971 = isnan(_2953);
    bool _2973 = _2969 || _2971;
    bool _2975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2977 = _2973 || _2975;
    if (!_2977)
    {
        _2839 = 1.0;
    }
    float _2979 = _2839;
    bool _2981 = !_2977;
    float _2983 = _2979;
    if (!_2981)
    {
        bool _2985 = _2953 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2987 = isnan(_2953);
        bool _2989 = _2985 || _2987;
        bool _2991 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2993 = _2989 || _2991;
        if (!_2993)
        {
            float _2995 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2997 = _2953 + _2995;
            float _2999 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3001 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2999;
            float _3003 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3005 = _3003 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3007 = 1.0 / _3001;
            float _3009 = _2997 * _3007;
            float _3011 = fma(_3009, _3005, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2983 = _3011;
            _3013 = true;
        }
        else
        {
            bool _3015 = _2953 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3017 = isnan(_2953);
            bool _3019 = _3015 || _3017;
            bool _3021 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3023 = _3019 || _3021;
            if (!_3023)
            {
                float _3025 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3027 = _2953 + _3025;
                float _3029 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3031 = _3029 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3033 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3035 = _3033 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3037 = 1.0 / _3031;
                float _3039 = _3027 * _3037;
                float _3041 = fma(_3039, _3035, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2983 = _3041;
                _3013 = true;
            }
            else
            {
                _2983 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3013 = false;
    float _3043 = _2983;
    float _3045 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3047 = _2909 + _3045;
    float _3049 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3051 = _2915 + _3049;
    float _3053 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3055 = _2917 + _3053;
    float _3057 = fma(_3047, _3043, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3059 = fma(_3051, _3043, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3061 = fma(_3055, _3043, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3065 = _3057 + _3063;
    float _3067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3069 = _3059 + _3067;
    float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3073 = _3061 + _3071;
    float _3075 = _3065 * _3065;
    float _3077 = fma(_3069, _3069, _3075);
    float _3079 = fma(_3073, _3073, _3077);
    float _3081 = rsqrt(_3079);
    float _3083 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3085 = _3069 * _3083;
    float _3087 = _3073 * _3083;
    float _3089 = _3085 * _3085;
    float _3091 = _3087 * _3087;
    float _3093 = _3089 + _3091;
    float _3095 = sqrt(_3093);
    bool _3097 = _3095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3101 = _3095 + _3099;
    float _3103 = _3073;
    float _3105 = _3101;
    float _3107 = _3065;
    float _3109 = _3085;
    if (_3097)
    {
        float _3111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3103 = _3111;
    }
    float _3113 = _3103;
    if (_3097)
    {
        float _3115 = rsqrt(_3093);
        _2925 = _3115;
    }
    float _3117 = _2925;
    float _3119 = _3117;
    if (_3097)
    {
        float _3121 = _3101 * _3113;
        _3105 = _3121;
    }
    float _3123 = _3105;
    if (_3097)
    {
        float _3125 = _3123 * 0.15915493667125701904296875;
        _2841 = _3125;
    }
    float _3127 = _2841;
    float _3129 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3131 = _3081;
    if (_3097)
    {
        float _3133 = _3127 * 6.283185482025146484375;
        float _3135 = sin(_3133);
        _3131 = _3135;
    }
    float _3137 = _3131;
    float _3139 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3141 = precise::max(0.0, _3139);
    float _3143 = _3113;
    float _3145 = _3141;
    if (_3097)
    {
        float _3147 = _3127 * 6.283185482025146484375;
        float _3149 = cos(_3147);
        _3143 = _3149;
    }
    float _3151 = _3143;
    float _3153 = -_3083;
    float _3155 = -_3141;
    float _3157 = fma(_3065, _3153, _3155);
    float _3159 = _3157;
    if (_3097)
    {
        float _3161 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3107 = _3161;
    }
    float _3163 = _3107;
    float _3165 = sqrt(_3079);
    float _3167 = _3163;
    float _3169 = _3137;
    if (_3097)
    {
        float _3171 = fma(_3137, _3163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3167 = _3171;
    }
    float _3173 = _3167;
    float _3175 = _3173;
    if (_3097)
    {
        float _3177 = _3151 + (-1.0);
        _3145 = _3177;
    }
    float _3179 = _3145;
    float _3181 = _3179;
    if (_3097)
    {
        float _3183 = _3117 * _3173;
        _2935 = _3183;
    }
    float _3185 = _2935;
    if (!_3097)
    {
        _3119 = _3087;
    }
    float _3187 = _3119;
    float _3189 = _3187;
    if (_3097)
    {
        float _3191 = _3179 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3169 = _3191;
    }
    float _3193 = _3169;
    if (_3097)
    {
        float _3195 = _3085 * _3185;
        _3109 = _3195;
    }
    float _3197 = _3109;
    if (!_3097)
    {
        _3181 = _3089;
    }
    float _3199 = _3181;
    float _3201 = _3199;
    if (_3097)
    {
        float _3203 = _3087 * _3185;
        _3189 = _3203;
    }
    float _3205 = _3189;
    if (_3097)
    {
        float _3207 = fma(_3157, _3151, _3193);
        _3159 = _3207;
    }
    float _3209 = _3159;
    if (_3097)
    {
        float _3211 = _3197 * _3197;
        _3201 = _3211;
    }
    float _3213 = _3201;
    if (!_3097)
    {
        _3175 = _3091;
    }
    float _3215 = _3175;
    float _3217 = _3215;
    if (_3097)
    {
        float _3219 = _3205 * _3205;
        _3217 = _3219;
    }
    float _3221 = _3217;
    float _3223 = fma(_3209, _3209, _3213);
    float _3225 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3227 = _3223 + _3221;
    float _3229 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3233 = fma(_3165, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3231);
    float _3235 = precise::clamp(_3233, 0.0, 1.0);
    float _3237 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3225);
    float _3239 = rsqrt(_3227);
    float _3241 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3229);
    float _3243 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3245 = -_3235;
    float _3247 = _3245 + 1.0;
    float _3249 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3241);
    float _3251 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3253 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3243);
    float _3255 = _3249 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3257 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3251);
    float _3259 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3253);
    float _3261 = abs(_3247);
    float _3263 = log2(_3261);
    float _3265 = _3255 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3267 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3257);
    float _3269 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3271 = _3239 * _3197;
    float _3273 = -_3265;
    float _3275 = fma(_3273, _3129, 1.0);
    float _3277 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3237);
    float _3279 = _3267 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3281 = _3239 * _3209;
    float _3283 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3285 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3287 = _3239 * _3205;
    float _3289 = _3277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3291 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3283);
    float _3293 = -_3285;
    float _3295 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3293);
    float _3297 = log2(_3275);
    float _3299 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3301 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3291);
    float _3303 = -_3287;
    float _3305 = fma(_3303, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3295);
    float _3307 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3309 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3311 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3301);
    float _3313 = fma(_3305, -0.5, 0.5);
    float _3315 = exp2(_3299);
    float _3317 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3307);
    float _3319 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3309);
    float _3321 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3317);
    float _3323 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3319);
    float _3325 = 1.0 / _3311;
    float _3327 = fma(_3305, 0.5, 0.5);
    float _3329 = _3281 + 1.0;
    float _3331 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3321);
    float _3333 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3323);
    float _3335 = fma(_3327, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3337 = _3297 * 0.693147182464599609375;
    float _3339 = sqrt(_3313);
    float _3341 = -_3281;
    float _3343 = fma(_3315, _3329, _3341);
    float _3345 = fma(_3327, _3335, -0.212114393711090087890625);
    float _3347 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3349 = fma(_3343, 0.5, 0.5);
    float _3351 = fma(_3327, _3345, 1.570728778839111328125);
    float _3353 = _3331 * _3325;
    float _3355 = _3333 * _3325;
    float _3357 = fma(_3353, 0.5, 0.5);
    float _3359 = fma(_3355, -0.5, 0.5);
    float _3361 = _3339 * 0.636619746685028076171875;
    float3 _8381 = float3(_3357, _3359, _3347);
    float _3363 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8381, float3(0.0), isnan(_8381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8381, float3(0.0), isnan(_8381)), level(0.0)).x;
    float3 _8392 = float3(_3357, _3359, _3347);
    float4 _3365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8392, float3(0.0), isnan(_8392)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8392, float3(0.0), isnan(_8392)), level(0.0)).xyzw;
    float _3367 = _3365.x;
    float _3369 = _3365.y;
    float _3371 = _3365.z;
    float _3373 = _3365.w;
    float _3375 = -_3351;
    float _3377 = fma(_3361, _3375, 1.0);
    float2 _8413 = float2(_3377, _3349);
    float3 _3381 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8413, float2(0.0), isnan(_8413)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8413, float2(0.0), isnan(_8413)), level(0.0)).xyz;
    float _3383 = _3381.x;
    float _3385 = _3381.y;
    float _3387 = _3381.z;
    float _3389 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3391 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _2237;
    out.m_73.y = _2781;
    out.m_73.z = _2249;
    float _3393 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3391);
    float _3395 = exp2(_3389);
    out.m_75.x = _3059;
    out.m_75.y = _3057;
    out.m_75.z = _3061;
    float _3397 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3393);
    float _3399 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3401 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3397);
    out.m_49.x = 1.0;
    float _3403 = _3401 + _3311;
    out.gl_Position.x = _3331;
    out.gl_Position.y = _3333;
    out.gl_Position.z = _3401;
    out.gl_Position.w = _3311;
    float _3405 = _3403 * 0.5;
    float _3407 = -_3395;
    float _3409 = _3407 + 1.0;
    out.m_77.w = _3399;
    float _3411 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _3405;
    out.m_79.w = _3311;
    float _3413 = _3411 * _3363;
    float _3415 = -_3411;
    float _3417 = _3415 + 1.0;
    float _3419 = _3373 * _3413;
    float _3421 = _3373 * _3417;
    float _3423 = _3387 * _3413;
    float _3425 = fma(_3383, _3419, _3367);
    float _3427 = fma(_3385, _3419, _3369);
    float _3429 = fma(_3373, _3423, _3371);
    out.m_81.x = _3425;
    out.m_81.y = _3427;
    out.m_81.z = _3429;
    out.m_81.w = _3421;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3013 = false;
    bool _2125 = false;
    bool _1935 = false;
    bool _1441 = false;
    bool _1125 = false;
    bool _807 = false;
    bool _705 = false;
    bool _527 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3485 = as_type<float>(_119);
        out.gl_Position.z = _3485;
    }
    if (!_109)
    {
        return out;
    }
    float _123 = in.m_51.w;
    float _125 = in.m_53.x;
    bool _127 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_123);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_123;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _125;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    float _159 = _157;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _161 = _157 * 5.0;
        _121 = as_type<int>(_161);
    }
    int _163 = _121;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3560 = as_type<float>(_163);
        out.gl_Position.z = _3560;
    }
    if (_153)
    {
        return out;
    }
    float _165 = in.m_57.w;
    float _167 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_51.x;
    float _181 = in.m_51.y;
    float _183 = in.m_51.z;
    float _185 = in.m_46.x;
    float _187 = in.m_46.y;
    float _189 = in.m_46.z;
    float _191 = _167;
    if (!_177)
    {
        float _193 = _167 * _167;
        float _195 = _193 * 0.5;
        _159 = _195;
    }
    float _197 = _159;
    float _199 = _197;
    if (!_177)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_177;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _167 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _167);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_177;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _167 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _191 = _261;
    }
    float _263 = _191;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _179, _267);
    float _275 = fma(_263, _181, _269);
    float _277 = fma(_263, _183, _271);
    float _279 = fma(_273, _165, _185);
    float _281 = fma(_275, _165, _187);
    float _283 = fma(_277, _165, _189);
    bool _285 = !_265;
    float _287 = _279;
    float _289 = _283;
    float _305;
    if (!_285)
    {
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_105);
        float _311 = 1.0 / _309;
        float _313 = _139 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _315 + _321;
    bool _325 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _327 = isnan(_315);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = _315 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = 1.0 / _339;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _357 = 1.0 / _351;
    float _359 = 1.0 / _347;
    float _361 = _319 * _353;
    bool _363 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _365 = isnan(_315);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -_335;
    float _377 = _375 + 1.0;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _379;
    float _383 = _373 * _377;
    float _385 = _323 * _357;
    bool _387 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_315);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_373;
    float _401 = _399 + 1.0;
    bool _403 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_315);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = -_397;
    float _421 = _419 + 1.0;
    float _423 = _397 * _401;
    float _425 = _343 * _359;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    float _435 = _413 * _421;
    float _437 = fma(_381, _425, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _439 = fma(_429, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _441 = fma(_433, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = -_413;
    float _449 = _447 + 1.0;
    float _451 = _439 * _435;
    float _453 = _441 * _435;
    float _455 = _437 * _435;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _461 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _463 = fma(_417, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _471;
    float _475 = fma(_445, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _477 = fma(_459, _385, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _479 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].z, _455);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _481;
    float _485 = fma(_463, _423, _465);
    float _487 = fma(_469, _361, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_473, _361, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = fma(_483, _361, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _493 = fma(_475, _423, _461);
    float _495 = fma(_477, _423, _479);
    float _497 = fma(_487, _383, _485);
    float _499 = fma(_489, _383, _493);
    float _501 = fma(_491, _383, _495);
    float _503 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[146].x, _497);
    float _505 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[146].y, _499);
    float _507 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[146].z, _501);
    bool _509 = !_355;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _513 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_105);
        float _531 = 1.0 / _529;
        float _533 = _139 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = in.m_57.x;
    float _539 = in.m_57.y;
    float _541 = in.m_57.z;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _545 = _535 + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _547;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _555 = 1.0 / _549;
    bool _557 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _559 = 1.0 / _553;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _561;
    float _565 = _507 * _541;
    float _567 = _505 * _539;
    bool _569 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _571 = isnan(_535);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _545 * _555;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _585 = _535 + _583;
    bool _587 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _589 = isnan(_535);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _599;
    bool _603 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _605 = isnan(_535);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_579;
    float _617 = _615 + 1.0;
    float _619 = fma(_563, _581, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _621 = fma(_601, _581, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _623 = _585 * _559;
    float _625 = _613 * _617;
    float _627 = -_613;
    float _629 = _627 + 1.0;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _631;
    float _635 = _597 * _629;
    float _637 = fma(_633, _581, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _639 = -_597;
    float _641 = _639 + 1.0;
    float _643 = _619 * _635;
    float _645 = _637 * _635;
    float _647 = _621 * _635;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[107].x, _645);
    float _663 = fma(_651, _623, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _665 = fma(_655, _623, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _667 = fma(_659, _623, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _669 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[107].y, _643);
    float _671 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[107].z, _647);
    float _673 = fma(_663, _625, _661);
    float _675 = fma(_665, _625, _669);
    float _677 = fma(_667, _625, _671);
    float _679 = _503 * _537;
    float _681 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[109].x, _673);
    float _683 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[109].y, _675);
    float _685 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[109].z, _677);
    bool _687 = !_557;
    float _703;
    if (!_687)
    {
        float _689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _691 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _695 = _693 * _689;
        float _697 = floor(_695);
        float _699 = -_697;
        float _701 = _695 + _699;
        _703 = _701;
        _705 = true;
    }
    else
    {
        float _707 = float(_105);
        float _709 = 1.0 / _707;
        float _711 = _139 * _709;
        _703 = _711;
    }
    _705 = false;
    float _713 = _703;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _717 = _713 + _715;
    bool _719 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _721 = isnan(_713);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _735 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _737 = isnan(_713);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _747;
    float _751 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _753 = -_729;
    float _755 = _753 + 1.0;
    bool _757 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _759 = 1.0 / _733;
    float _761 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _745 * _755;
    float _765 = -_745;
    float _767 = _765 + 1.0;
    float _769 = _749 * _759;
    float _771 = _685 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _773 = fma(_769, _717, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _773 * _763;
    float _779 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _781 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[115].x, _777);
    float _783 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[116].x, _781);
    float _787 = _785 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _761;
    out.m_59.y = _783;
    out.m_59.z = _775;
    out.m_59.w = _787;
    bool _789 = !_757;
    float _805;
    if (!_789)
    {
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _793 = _125 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _797 = _795 * _791;
        float _799 = floor(_797);
        float _801 = -_799;
        float _803 = _797 + _801;
        _805 = _803;
        _807 = true;
    }
    else
    {
        float _809 = float(_105);
        float _811 = 1.0 / _809;
        float _813 = _139 * _811;
        _805 = _813;
    }
    _807 = false;
    float _815 = _805;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _819 = _815 + _817;
    bool _821 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _823 = isnan(_815);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _837 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _839 = isnan(_815);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _849;
    bool _853 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _855 = isnan(_815);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = 1.0 / _835;
    bool _867 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _869 = isnan(_815);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _883 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _885 = isnan(_815);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = 1.0 / _881;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _899 = _851 * _865;
    float _901 = -_831;
    float _903 = _901 + 1.0;
    float _905 = fma(_899, _819, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _907 = _847 * _903;
    float _909 = -_847;
    float _911 = _909 + 1.0;
    bool _913 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _915 = isnan(_815);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _863 * _911;
    float _927 = -_863;
    float _929 = _927 + 1.0;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _935 = _877 * _929;
    float _937 = -_877;
    float _939 = _937 + 1.0;
    float _941 = 1.0 / _933;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _947 = -_893;
    float _949 = _947 + 1.0;
    float _951 = _893 * _939;
    bool _953 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _955 = isnan(_815);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = -_923;
    float _967 = _965 + 1.0;
    float _969 = _923 * _949;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _975 = 1.0 / _945;
    float _977 = _963 * _967;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _983 = -_963;
    float _985 = _983 + 1.0;
    float _987 = _973 * _895;
    float _989 = _905 * _977;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _995 = 1.0 / _981;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _999 = _815 + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1001;
    float _1005 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[159].x, _989);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1011 = fma(_987, _999, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1017 = _1003 * _941;
    float _1019 = 1.0 / _993;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1023 = _815 + _1021;
    float _1025 = fma(_1011, _969, _1005);
    float _1027 = _1015 * _975;
    float _1029 = fma(_1017, _1023, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1033 = _815 + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1035;
    float _1039 = 1.0 / _1009;
    float _1041 = fma(_1027, _1033, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1047 = _1037 * _995;
    float _1049 = fma(_1029, _951, _1025);
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1053 = _815 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1055;
    bool _1059 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1061 = isnan(_815);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = _1045 * _1019;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1075 = _815 + _1073;
    float _1077 = fma(_1047, _1053, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1079 = fma(_1041, _935, _1049);
    float _1081 = -_1069;
    float _1083 = _1081 + 1.0;
    float _1085 = fma(_1071, _1075, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1089 = _815 + _1087;
    float _1091 = _1057 * _1039;
    float _1093 = fma(_1077, _925, _1079);
    float _1095 = _831 * _1083;
    float _1097 = fma(_1091, _1089, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1099 = fma(_1085, _907, _1093);
    float _1101 = fma(_1097, _1095, _1099);
    float _1103 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1101);
    float _1105 = precise::clamp(_1103, 0.0, 1.0);
    bool _1107 = !_897;
    float _1123;
    if (!_1107)
    {
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1111 = _125 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[14].y, _139);
        float _1115 = _1113 * _1109;
        float _1117 = floor(_1115);
        float _1119 = -_1117;
        float _1121 = _1115 + _1119;
        _1123 = _1121;
        _1125 = true;
    }
    else
    {
        float _1127 = float(_105);
        float _1129 = 1.0 / _1127;
        float _1131 = _139 * _1129;
        _1123 = _1131;
    }
    _1125 = false;
    float _1133 = _1123;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1137 = _1133 + _1135;
    bool _1139 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1141 = isnan(_1133);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1155;
    bool _1159 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1161 = isnan(_1133);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    bool _1171 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1173 = isnan(_1133);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = 1.0 / _1153;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1189 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1191 = isnan(_1133);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = -_1181;
    float _1203 = _1201 + 1.0;
    bool _1205 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1207 = isnan(_1133);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = 1.0 / _1187;
    float _1219 = -_1199;
    float _1221 = _1219 + 1.0;
    bool _1223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1225 = _1157 * _1183;
    float _1227 = -_1149;
    float _1229 = _1227 + 1.0;
    float _1231 = -_1169;
    float _1233 = _1231 + 1.0;
    float _1235 = -_1215;
    float _1237 = _1235 + 1.0;
    float _1239 = fma(_1225, _1137, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1241 = _1169 * _1229;
    float _1243 = _1181 * _1233;
    float _1245 = _1199 * _1203;
    bool _1247 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1249 = isnan(_1133);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1265 = _1263 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1267 = _1215 * _1221;
    bool _1269 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1271 = isnan(_1133);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1257 * _1237;
    float _1283 = 1.0 / _1265;
    float _1285 = -_1257;
    float _1287 = _1285 + 1.0;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1293 = _1279 * _1287;
    float _1295 = -_1279;
    float _1297 = _1295 + 1.0;
    float _1299 = _1291 * _1217;
    float _1301 = 1.0 / _1261;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1307 = _1239 * _1293;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1313;
    float _1317 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1307);
    float _1319 = 1.0 / _1305;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1323 = _1133 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1327 = _1325 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1329 = _1315 * _1283;
    float _1331 = fma(_1299, _1323, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1335 = _1133 + _1333;
    float _1337 = 1.0 / _1311;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1343 = fma(_1329, _1335, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1345 = fma(_1331, _1281, _1317);
    float _1347 = _1341 * _1301;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1351 = _1133 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1353;
    float _1357 = 1.0 / _1327;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1363 = fma(_1347, _1351, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1365 = _1355 * _1319;
    float _1367 = fma(_1343, _1267, _1345);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1371 = _1133 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1375 = _1133 + _1373;
    float _1377 = _1361 * _1337;
    bool _1379 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1381 = isnan(_1133);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1391;
    float _1395 = fma(_1365, _1371, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1397 = fma(_1363, _1245, _1367);
    float _1399 = fma(_1377, _1375, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1401 = -_1389;
    float _1403 = _1401 + 1.0;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1407 = _1133 + _1405;
    float _1409 = _1393 * _1357;
    float _1411 = fma(_1395, _1243, _1397);
    float _1413 = _1149 * _1403;
    float _1415 = fma(_1409, _1407, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1417 = fma(_1399, _1241, _1411);
    float _1419 = fma(_1415, _1413, _1417);
    float _1421 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1419);
    out.m_61.x = _1421;
    bool _1423 = !_1223;
    float _1439;
    if (!_1423)
    {
        float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1427 = _125 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[14].z, _139);
        float _1431 = _1429 * _1425;
        float _1433 = floor(_1431);
        float _1435 = -_1433;
        float _1437 = _1431 + _1435;
        _1439 = _1437;
        _1441 = true;
    }
    else
    {
        float _1443 = float(_105);
        float _1445 = 1.0 / _1443;
        float _1447 = _139 * _1445;
        _1439 = _1447;
    }
    _1441 = false;
    float _1449 = _1439;
    int _1451 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1453 = _1451;
    int _1455 = 0;
    int _1457 = _96(_1453, _1455, (*spvDescriptorSet0.support_buffer));
    float _1459 = in.m_63.z;
    float _1461 = trunc(_1459);
    int _1463 = int(_1461);
    int _1465 = _1457 + (-1);
    float _1467 = float(_1465);
    float _1469 = _1105 * _1467;
    float _1471 = trunc(_1469);
    int _1473 = int(_1471);
    int _1475 = _1473;
    int _1477 = 0;
    int _1479 = _97(_1475, _1477, (*spvDescriptorSet0.support_buffer));
    int _1481 = _1463;
    int _1483 = 0;
    int _1485 = _97(_1481, _1483, (*spvDescriptorSet0.support_buffer));
    float4 _1488 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1479, _1485)), 0).xyzw;
    float _1490 = _1488.x;
    float _1492 = _1488.y;
    float _1494 = _1488.z;
    float _1496 = _1488.w;
    float _1498 = in.m_53.y;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1502 = _1500 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1512 = 1.0 / _1502;
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1518 = in.m_63.x;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1522 = _1520 != 0;
    float _1524 = 1.0 / _1506;
    bool _1526 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1528 = isnan(_1449);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1540 = _1538 != 0;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1542;
    bool _1546 = _125 > 0.5;
    bool _1548 = _1546 && _1522;
    float _1550 = -_1536;
    float _1552 = _1550 + 1.0;
    bool _1554 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1556 = isnan(_1449);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = 1.0 / _1510;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1568;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1576 = _1570 * _1512;
    bool _1578 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1580 = isnan(_1449);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = 1.0 / _1516;
    bool _1592 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1594 = isnan(_1449);
    bool _1596 = _1592 || _1594;
    bool _1598 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1600 = _1596 || _1598;
    float _1602 = float(_1600);
    float _1604 = _1574 * _1524;
    bool _1606 = _1498 > 0.5;
    bool _1608 = _1606 && _1540;
    float _1610 = _1602 * _1552;
    float _1612 = -_1602;
    float _1614 = _1612 + 1.0;
    bool _1616 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1618 = isnan(_1449);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1632 = _1544 * _1566;
    float _1634 = _1564 * _1614;
    float _1636 = -_1564;
    float _1638 = _1636 + 1.0;
    bool _1640 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1642 = isnan(_1449);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1654 = _1449 + _1652;
    float _1656 = _1630 * _1590;
    float _1658 = -_1626;
    float _1660 = _1658 + 1.0;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1666 = _1626 * _1638;
    bool _1668 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1670 = isnan(_1449);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = _1650 * _1660;
    float _1682 = -_1650;
    float _1684 = _1682 + 1.0;
    float _1686 = 1.0 / _1664;
    float _1688 = fma(_1576, _1654, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1690 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1692 = isnan(_1449);
    bool _1694 = _1690 || _1692;
    bool _1696 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1698 = _1694 || _1696;
    float _1700 = float(_1698);
    float _1702 = _1678 * _1684;
    float _1704 = -_1678;
    float _1706 = _1704 + 1.0;
    float _1708 = _1700 * _1706;
    float _1710 = -_1700;
    float _1712 = _1710 + 1.0;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1724 = _1449 + _1722;
    float _1726 = _1588 * _1712;
    float _1728 = -_1588;
    float _1730 = _1728 + 1.0;
    float _1732 = _1716 * _1686;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1736 = _1449 + _1734;
    float _1738 = 1.0 / _1720;
    float _1740 = _1688 * _1726;
    float _1742 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1744 = _1742 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1746 = fma(_1632, _1736, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1748 = fma(_1604, _1724, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1750 = in.m_63.y;
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1740);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1756 = _1449 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1760 = _1758 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1762 = 1.0 / _1744;
    float _1764 = fma(_1748, _1708, _1752);
    float _1766 = fma(_1656, _1756, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1770 = _1449 + _1768;
    float _1772 = fma(_1746, _1702, _1764);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1776 = _1449 + _1774;
    float _1778 = _1760 * _1738;
    float _1780 = fma(_1732, _1770, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1782 = fma(_1766, _1680, _1772);
    float _1784 = fma(_1778, _1776, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1788 = _1449 + _1786;
    float _1790 = fma(_1780, _1666, _1782);
    int _1792 = _1473 + 1;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1794;
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1800 = fma(_1784, _1634, _1790);
    float _1802 = _1634;
    float _1804 = _1788;
    if (_1522)
    {
        _1802 = _1518;
    }
    float _1806 = _1802;
    float _1808 = _1796 * _1762;
    float _1810 = _1750;
    float _1812 = _1806;
    if (_1608)
    {
        float _1814 = -_1750;
        float _1816 = _1814 + 1.0;
        _1810 = _1816;
    }
    float _1818 = _1810;
    int _1820 = min(_1465, _1792);
    if (_1548)
    {
        float _1822 = -_1806;
        float _1824 = _1822 + 1.0;
        _1812 = _1824;
    }
    float _1826 = _1812;
    float _1828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1830 = fma(_1808, _1788, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    if (!_1522)
    {
        _1804 = _1518;
    }
    float _1832 = _1804;
    float _1834 = _1832;
    if (_1522)
    {
        _1834 = _1826;
    }
    float _1836 = _1834;
    float _1838 = fma(_1830, _1610, _1800);
    float _1840 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1842 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1844 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1838);
    float _1846 = _1840 * _1798;
    out.m_65.x = _1844;
    float _1848 = _1842 * _1828;
    uint _1851 = as_type<uint>(half2(float2(_1496, 0.0)));
    uint _1853 = extract_bits(_1851, 0u, 8u);
    int _1855 = int(_1853) & 255;
    uint _1857 = extract_bits(_1851, 8u, 8u);
    int _1859 = int(_1857) & 255;
    int _1861 = _1859 << 8;
    int _1863 = _1855 | _1861;
    bool _1865 = _1863 >= 32768;
    int _1867 = _1863 + (-1024);
    int _1869 = _1867;
    if (_1865)
    {
        int _1871 = ~_1863;
        int _1873 = _1871 + 33792;
        int _1875 = _1873 + 1;
        _1869 = _1875;
    }
    int _1877 = _1869;
    int _1879 = _1877 + 30719;
    float _1881 = float(_1879);
    float _1883 = fma(_1881, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1885 = abs(_1883);
    float _1887 = -_1885;
    float _1889 = _1887 + 1.0;
    float _1891 = abs(_1883);
    float _1893 = fma(_1891, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1895 = _1883 < 0.0;
    float _1897 = float(_1895);
    int _1899 = as_type<int>(_1889) + (-218103808);
    float _1901 = abs(_1883);
    float _1903 = fma(_1901, _1893, -0.212114393711090087890625);
    bool _1905 = uint(_1899) >= 1920991232u;
    float _1907 = abs(_1883);
    float _1909 = fma(_1907, _1903, 1.570728778839111328125);
    bool _1911 = !_1905;
    float _1933;
    if (!_1911)
    {
        int _1913 = as_type<int>(_1889);
        int _1915 = as_type<int>(_1842);
        int _1917 = 9248;
        int _1919 = as_type<int>(_1730);
        int _1921;
        int _1923;
        int _1925;
        int _1927;
        int _1929;
        int _1931;
        _94(_1913, _1915, _1917, _1919, _1921, _1923, _1925, _1927, _1929, _1931, out.gl_Position, out.gl_PointSize);
        _1933 = as_type<float>(_1929);
        _1935 = true;
    }
    else
    {
        float _1937 = rsqrt(_1889);
        float _1939 = _1889 * _1937;
        float _1941 = _1937 * 0.5;
        float _1943 = -_1939;
        float _1945 = 0.0 + _1943;
        float _1947 = fma(_1941, _1945, 0.5);
        float _1949 = fma(_1939, _1947, _1939);
        float _1951 = -_1949;
        float _1953 = 0.0 + _1951;
        float _1955 = fma(_1949, _1953, _1889);
        float _1957 = fma(_1941, _1955, _1949);
        _1933 = _1957;
    }
    _1935 = false;
    float _1959 = _1933;
    int _1961 = _1820;
    int _1963 = 0;
    int _1965 = _97(_1961, _1963, (*spvDescriptorSet0.support_buffer));
    int _1967 = _1463;
    int _1969 = 0;
    int _1971 = _97(_1967, _1969, (*spvDescriptorSet0.support_buffer));
    float4 _1973 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1965, _1971)), 0).xyzw;
    float _1975 = _1973.x;
    float _1977 = _1973.y;
    float _1979 = _1973.z;
    float _1981 = _1973.w;
    float _1983 = _1909 * _1959;
    float _1985 = _1897 * 2.0;
    float _1987 = _1881 * 3.883221149444580078125;
    float _1989 = floor(_1469);
    float _1991 = -_1985;
    float _1993 = fma(_1983, _1991, _1983);
    float _1995 = _1987 * 0.15915493667125701904296875;
    float _1997 = fma(_1897, 3.1415927410125732421875, _1993);
    float _1999 = _1995 * 6.283185482025146484375;
    float _2001 = cos(_1999);
    float _2003 = _1997 * 0.15915493667125701904296875;
    float _2005 = _2003 * 6.283185482025146484375;
    float _2007 = sin(_2005);
    float _2009 = -_1989;
    float _2011 = _1469 + _2009;
    float _2013 = _1995 * 6.283185482025146484375;
    float _2015 = sin(_2013);
    float _2017 = _2007 * _2001;
    float _2019 = _2007 * _2015;
    uint _2021 = as_type<uint>(half2(float2(_1981, 0.0)));
    float _2023 = -_1490;
    float _2025 = _2023 + _1975;
    uint _2027 = extract_bits(_2021, 0u, 8u);
    int _2029 = int(_2027) & 255;
    uint _2031 = extract_bits(_2021, 8u, 8u);
    int _2033 = int(_2031) & 255;
    int _2035 = _2033 << 8;
    int _2037 = _2029 | _2035;
    float _2039 = fma(_2011, _2025, _1490);
    bool _2041 = _2037 >= 32768;
    int _2043 = _2037 + (-1024);
    int _2045 = _2043;
    float _2047 = _2011;
    if (_2041)
    {
        int _2049 = ~_2037;
        int _2051 = _2049 + 33792;
        int _2053 = _2051 + 1;
        _2045 = _2053;
    }
    int _2055 = _2045;
    float _2057 = -_1494;
    float _2059 = _2057 + _1979;
    int _2061 = _2055 + 30719;
    float _2063 = fma(_2011, _2059, _1494);
    float _2065 = float(_2061);
    float _2067 = fma(_2065, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2069 = abs(_2067);
    float _2071 = -_2069;
    float _2073 = _2071 + 1.0;
    float _2075 = abs(_2067);
    float _2077 = fma(_2075, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2079 = as_type<int>(_2073) + (-218103808);
    float _2081 = abs(_2067);
    float _2083 = fma(_2081, _2077, -0.212114393711090087890625);
    bool _2085 = uint(_2079) >= 1920991232u;
    float _2087 = -_1492;
    float _2089 = _2087 + _1977;
    bool _2091 = _2067 < 0.0;
    float _2093 = float(_2091);
    float _2095 = abs(_2067);
    float _2097 = fma(_2095, _2083, 1.570728778839111328125);
    float _2099 = fma(_2011, _2089, _1492);
    bool _2101 = !_2085;
    float _2123;
    if (!_2101)
    {
        int _2103 = as_type<int>(_2073);
        int _2105 = as_type<int>(_1979);
        int _2107 = 10144;
        int _2109 = as_type<int>(_1983);
        int _2111;
        int _2113;
        int _2115;
        int _2117;
        int _2119;
        int _2121;
        _94(_2103, _2105, _2107, _2109, _2111, _2113, _2115, _2117, _2119, _2121, out.gl_Position, out.gl_PointSize);
        _2123 = as_type<float>(_2119);
        _2125 = true;
    }
    else
    {
        float _2127 = rsqrt(_2073);
        float _2129 = _2073 * _2127;
        float _2131 = _2127 * 0.5;
        float _2133 = -_2129;
        float _2135 = 0.0 + _2133;
        float _2137 = fma(_2131, _2135, 0.5);
        float _2139 = fma(_2129, _2137, _2129);
        float _2141 = -_2139;
        float _2143 = 0.0 + _2141;
        float _2145 = fma(_2139, _2143, _2073);
        float _2147 = fma(_2131, _2145, _2139);
        _2123 = _2147;
    }
    _2125 = false;
    float _2149 = _2123;
    float _2151 = in.m_53.x;
    float _2153 = in.m_53.y;
    float _2155 = in.m_53.z;
    float _2157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2159 = log2(_2157);
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2163 = _2161 != 0;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2167 = _2165 != 0;
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2171 = _2169 != 0;
    bool _2173 = !_2171;
    int _2175 = _2173 ? 0 : 1;
    bool _2177 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2179 = isnan(1.0);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2185 = _2181 || _2183;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2189 = 1.0 + _2187;
    int _2191 = abs(_2175);
    float _2193 = _2159 * _139;
    float _2195 = 1.0 / _2189;
    float _2197 = _2155 * 2.0;
    float _2199 = _2155 + _2151;
    float _2201 = _2153 * 2.0;
    float _2203 = _2153 + _2151;
    float _2205 = _2151 * 2.0;
    float _2207 = _2199 + (-1.0);
    float _2209 = floor(_2197);
    float _2211 = _2203 + (-1.0);
    float _2213 = _2151 + (-0.5);
    float _2215 = fma(_2207, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2217 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2219 = fma(_2211, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2221 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2223 = floor(_2201);
    float _2225 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2217);
    float _2227 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2221);
    float _2229 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2225);
    float _2231 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2227);
    float _2233 = exp2(_2193);
    bool _2235 = _2209 > 0.0;
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2239 = _2209 >= 0.0;
    bool _2241 = isnan(_2209);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(0.0);
    bool _2247 = _2243 || _2245;
    float _2249 = _2229 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2251 = _2247 ? 0 : 1;
    float _2253 = floor(_2205);
    bool _2255 = _2223 > 0.0;
    int _2257 = ~_2251;
    int _2259 = _2257 + 1;
    int _2261 = _2259 + 1;
    bool _2263 = _2223 >= 0.0;
    bool _2265 = isnan(_2223);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan(0.0);
    bool _2271 = _2267 || _2269;
    int _2273 = _2261;
    bool _2275 = _2185;
    if (!_2235)
    {
        int _2277 = ~_2251;
        int _2279 = _2277 + 1;
        _2273 = _2279;
    }
    int _2281 = _2273;
    float _2283 = -_2233;
    float _2285 = _2283 + 1.0;
    float _2287 = in.m_67.x;
    float _2289 = in.m_67.y;
    float _2291 = in.m_67.z;
    bool _2293 = !_2163;
    int _2295 = _2293 ? 0 : 1;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2299 = _2237 + _2297;
    bool _2301 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2303 = isnan(0.0);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2309 = _2305 || _2307;
    int _2311 = abs(_2295);
    float _2313 = -_2249;
    float _2315 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2317 = _2309 ? _2285 : 0.0;
    int _2319 = _2271 ? 0 : 1;
    bool _2321 = _2253 > 0.0;
    float _2323 = _2299;
    float _2325 = _2315;
    if (_2185)
    {
        float _2327 = _2317 * _2195;
        _143 = _2327;
    }
    float _2329 = _143;
    bool _2331 = _2253 >= 0.0;
    bool _2333 = isnan(_2253);
    bool _2335 = _2331 || _2333;
    bool _2337 = isnan(0.0);
    bool _2339 = _2335 || _2337;
    float _2341 = float(_2311);
    float _2343 = float(_2281);
    float _2345 = abs(_2299);
    float _2347 = abs(_2315);
    float _2349 = precise::max(_2345, _2347);
    int _2351 = ~_2319;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    float _2357 = _2341 * _2343;
    bool _2359 = !_2167;
    int _2361 = _2359 ? 0 : 1;
    int _2363 = _2355;
    float _2365 = _2329;
    if (!_2255)
    {
        int _2367 = ~_2319;
        int _2369 = _2367 + 1;
        _2363 = _2369;
    }
    int _2371 = _2363;
    float _2373 = _2357 * (-2.0);
    bool _2375 = _2349 >= 16.0;
    int _2377 = abs(_2361);
    float _2379 = fma(_2373, _2287, _2287);
    float _2381 = float(_2191);
    float _2383 = fma(_2219, _2373, _2219);
    float _2385 = float(_2371);
    float _2387 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2379);
    int _2389 = _2339 ? 0 : 1;
    float _2391 = _2155 + (-0.5);
    float _2393 = _2381 * _2385;
    int _2395 = ~_2389;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    int _2401 = _2399;
    if (_2375)
    {
        float _2403 = _2299 * 0.0625;
        _2323 = _2403;
    }
    float _2405 = _2323;
    if (!_2321)
    {
        int _2407 = ~_2389;
        int _2409 = _2407 + 1;
        _2401 = _2409;
    }
    int _2411 = _2401;
    float _2413 = _2393 * (-2.0);
    if (_2375)
    {
        float _2415 = _2315 * 0.0625;
        _2325 = _2415;
    }
    float _2417 = _2325;
    float _2419 = fma(_2383, _2329, _2387);
    float _2421 = abs(_2405);
    bool _2423 = _2421 != 0.0;
    bool _2425 = isnan(_2421);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(0.0);
    bool _2431 = _2427 || _2429;
    float _2433 = fma(_2413, _2291, _2291);
    float _2435 = fma(_2215, _2413, _2215);
    float _2437 = float(_2377);
    float _2439 = _2155 + _2153;
    float _2441 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2433);
    float _2443 = float(_2411);
    float _2445 = _2419 * 0.15915493667125701904296875;
    float _2447 = abs(_2417);
    bool _2449 = _2447 == 0.0;
    bool _2451 = !_2431;
    bool _2453 = _2449 && _2451;
    float _2455 = fma(_2435, _2329, _2441);
    float _2457 = abs(_2417);
    bool _2459 = _2457 == 0.0;
    float _2461 = _2437 * _2443;
    float _2463 = _2455 * 0.15915493667125701904296875;
    float _2465 = _2439 + (-1.0);
    float _2467 = _2461 * (-2.0);
    float _2469 = _2445 * 6.283185482025146484375;
    float _2471 = sin(_2469);
    float _2473 = _2153 + (-0.5);
    float _2475 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2477 = fma(_2467, _2289, _2289);
    int _2479 = as_type<int>(_2477);
    if (_2453)
    {
        bool _2481 = as_type<int>(_2417) >= 0;
        _2275 = _2481;
    }
    bool _2483 = _2275;
    float _2485 = fma(_2475, _2467, _2475);
    float _2487 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2477);
    float _2489 = _2445 * 6.283185482025146484375;
    float _2491 = cos(_2489);
    int _2493 = _2483 ? (-1) : 0;
    if (_2453)
    {
        int _2495 = _2483 ? 0 : 1078530011;
        _2479 = _2495;
    }
    int _2497 = _2479;
    float _2499 = fma(_2485, _2329, _2487);
    int _2501 = _2497;
    if (_2453)
    {
        int _2503 = int(0x80000000) & as_type<int>(_2405);
        int _2505 = _2497 | _2503;
        _2365 = as_type<float>(_2505);
    }
    float _2507 = _2365;
    float _2509 = _2463 * 6.283185482025146484375;
    float _2511 = sin(_2509);
    bool _2513 = !_2431;
    bool _2515 = _2513 && _2459;
    float _2517 = _2507;
    float _2519 = _2507;
    if (!_2515)
    {
        float _2521 = abs(_2405);
        bool _2523 = _2521 != as_type<float>(0x7f800000u /* inf */);
        bool _2525 = isnan(_2521);
        bool _2527 = _2523 || _2525;
        bool _2529 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2531 = _2527 || _2529;
        float _2533 = abs(_2417);
        bool _2535 = _2533 == as_type<float>(0x7f800000u /* inf */);
        float _2537 = abs(_2417);
        bool _2539 = _2537 == as_type<float>(0x7f800000u /* inf */);
        bool _2541 = !_2531;
        bool _2543 = _2539 && _2541;
        if (_2543)
        {
            bool _2545 = as_type<int>(_2417) >= 0;
            _2493 = _2545 ? (-1) : 0;
        }
        int _2547 = _2493;
        if (_2543)
        {
            _2501 = 1075235812;
        }
        int _2549 = _2501;
        int _2551 = _2549;
        if (_2543)
        {
            int _2553 = ~_2547;
            int _2555 = (_2553 != 0) ? _2549 : 1061752795;
            _2551 = _2555;
        }
        int _2557 = _2551;
        if (_2543)
        {
            int _2559 = int(0x80000000) & as_type<int>(_2405);
            int _2561 = _2557 | _2559;
            _2517 = as_type<float>(_2561);
        }
        float _2563 = _2517;
        bool _2565 = !_2531;
        bool _2567 = _2565 && _2535;
        _2519 = _2563;
        if (!_2567)
        {
            float _2569 = abs(_2405);
            float _2571 = abs(_2417);
            float _2573 = precise::max(_2569, _2571);
            float _2575 = abs(_2405);
            float _2577 = abs(_2417);
            float _2579 = precise::min(_2575, _2577);
            float _2581 = 1.0 / _2573;
            float _2583 = abs(_2405);
            float _2585 = abs(_2417);
            bool _2587 = _2583 > _2585;
            bool _2589 = as_type<int>(_2417) >= 0;
            float _2591 = _2579 * _2581;
            float _2593 = abs(_2405);
            float _2595 = abs(_2417);
            float _2597 = _2593 + _2595;
            int _2599 = as_type<int>(_2405) & int(0x80000000);
            float _2601 = _2591 * _2591;
            bool _2603 = _2597 > as_type<float>(0x7f800000u /* inf */);
            bool _2605 = isnan(_2597);
            bool _2607 = _2603 || _2605;
            bool _2609 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2611 = _2607 || _2609;
            float _2613 = _2601 + 11.33538818359375;
            float _2615 = fma(_2601, _2613, 28.84246826171875);
            float _2617 = fma(_2601, _2615, 19.6966705322265625);
            float _2619 = fma(_2601, -0.82336294651031494140625, -5.674867153167724609375);
            float _2621 = fma(_2601, _2619, -6.565555095672607421875);
            float _2623 = 1.0 / _2617;
            float _2625 = _2601 * _2621;
            float _2627 = _2591 * _2625;
            float _2629 = fma(_2627, _2623, _2591);
            float _2631 = _2629;
            _2519 = _2597;
            if (_2587)
            {
                float _2633 = -_2629;
                float _2635 = _2633 + 1.57079637050628662109375;
                _2631 = _2635;
            }
            float _2637 = _2631;
            int _2639 = as_type<int>(_2637);
            if (!_2589)
            {
                float _2641 = -_2637;
                float _2643 = _2641 + 3.1415927410125732421875;
                _2639 = as_type<int>(_2643);
            }
            int _2645 = _2639;
            if (!_2611)
            {
                int _2647 = _2599 | _2645;
                _2519 = as_type<float>(_2647);
            }
        }
    }
    float _2649 = _2519;
    float _2651 = -_2649;
    float _2653 = _2499 + _2651;
    float _2655 = _2463 * 6.283185482025146484375;
    float _2657 = cos(_2655);
    float _2659 = _679 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2661 = _2653 * 0.15915493667125701904296875;
    float _2663 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2665 = _2491 * _2511;
    float _2667 = _2097 * _2149;
    float _2669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2039);
    float _2671 = _2661 * 6.283185482025146484375;
    float _2673 = sin(_2671);
    float _2675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2099);
    float _2677 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2679 = _2669 * _2659;
    float _2681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2063);
    float _2683 = _2675 * _2663;
    float _2685 = _2471 * _2511;
    float _2687 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2689 = _2661 * 6.283185482025146484375;
    float _2691 = cos(_2689);
    float _2693 = _2471 * _2657;
    float _2695 = _2491 * _2657;
    float _2697 = _2681 * _2677;
    float _2699 = -_1883;
    float _2701 = _2699 + _2067;
    float _2703 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2687);
    bool _2705 = _2099 != 0.0;
    bool _2707 = isnan(_2099);
    bool _2709 = _2705 || _2707;
    bool _2711 = isnan(0.0);
    bool _2713 = _2709 || _2711;
    float _2715 = -_2665;
    float _2717 = fma(_2673, _2693, _2715);
    float _2719 = _2065 * 3.883221149444580078125;
    float _2721 = _2093 * 2.0;
    float _2723 = fma(_2673, _2695, _2685);
    float _2725 = _2717 * _2683;
    float _2727 = _2719 * 0.15915493667125701904296875;
    float _2729 = -_2721;
    float _2731 = fma(_2667, _2729, _2667);
    float _2733 = fma(_2673, _2685, _2695);
    float _2735 = _2471 * _2691;
    float _2737 = _2691 * _2657;
    float _2739 = _2491 * _2691;
    float _2741 = fma(_2093, 3.1415927410125732421875, _2731);
    float _2743 = _2735 * _2683;
    float _2745 = fma(_2737, _2679, _2725);
    float _2747 = _2691 * _2511;
    float _2749 = _2733 * _2683;
    float _2751 = -_2673;
    float _2753 = fma(_2751, _2679, _2743);
    float _2755 = fma(_2723, _2697, _2745);
    float _2757 = _2741 * 0.15915493667125701904296875;
    float _2759 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2703);
    float _2761 = fma(_2739, _2697, _2753);
    float _2763 = _2237 + _2755;
    float _2765 = _2727 * 6.283185482025146484375;
    float _2767 = cos(_2765);
    float _2769 = -_2693;
    float _2771 = fma(_2673, _2665, _2769);
    float _2773 = _2249 + _2761;
    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2777 = _2763 + _2775;
    float _2779 = fma(_2747, _2679, _2749);
    float _2781 = _2759 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2785 = _2773 + _2783;
    float _2787 = _2777 * _2777;
    float _2789 = _2757 * 6.283185482025146484375;
    float _2791 = sin(_2789);
    bool _2793 = _2039 == 0.0;
    bool _2795 = !_2713;
    bool _2797 = _2793 && _2795;
    float _2799 = _2785 * _2785;
    float _2801 = fma(_2011, _2701, _1883);
    bool _2803 = _2063 == 0.0;
    bool _2805 = _2803 && _2797;
    float _2807 = _2787 + _2799;
    float _2809 = _2727 * 6.283185482025146484375;
    float _2811 = sin(_2809);
    float _2813 = sqrt(_2807);
    float _2815 = -_2017;
    float _2817 = fma(_2791, _2767, _2815);
    float _2819 = fma(_2011, _2817, _2017);
    float _2821 = -_2019;
    float _2823 = fma(_2791, _2811, _2821);
    float _2825 = fma(_2771, _2697, _2779);
    float _2827 = fma(_2011, _2823, _2019);
    float _2829 = _2781 + _2825;
    bool _2831 = _2813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2833 = _2697;
    float _2835 = _2701;
    float _2837 = _2819;
    float _2839 = _2739;
    float _2841 = _2723;
    if (!_2831)
    {
        _2047 = _2799;
    }
    float _2843 = _2047;
    float _2845 = _2843;
    if (!_2831)
    {
        _2833 = _2787;
    }
    float _2847 = _2833;
    float _2849 = _2847;
    if (!_2831)
    {
        _287 = _2763;
    }
    float _2851 = _287;
    float _2853 = _2851;
    if (!_2831)
    {
        _2835 = _2773;
    }
    float _2855 = _2835;
    float _2857 = _2855;
    if (!_2831)
    {
        _289 = _2829;
    }
    float _2859 = _289;
    bool _2861 = !_2831;
    float _2863 = _2859;
    if (!_2861)
    {
        float _2865 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2869 = _2813 + _2867;
        float _2871 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2873 = rsqrt(_2807);
        float _2875 = _2869 * _2865;
        float _2877 = _2875 * 0.15915493667125701904296875;
        float _2879 = _2877 * 6.283185482025146484375;
        float _2881 = sin(_2879);
        float _2883 = _2877 * 6.283185482025146484375;
        float _2885 = cos(_2883);
        float _2887 = fma(_2881, _2871, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2889 = _2873 * _2887;
        float _2891 = _2885 + (-1.0);
        float _2893 = _2777 * _2889;
        float _2895 = _2785 * _2889;
        float _2897 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2899 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2901 = _2893 * _2893;
        float _2903 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2905 = fma(_2829, _2885, _2897);
        float _2907 = _2895 * _2895;
        _2863 = _2905;
        _2849 = _2901;
        _2845 = _2907;
        _2853 = _2899;
        _2857 = _2903;
    }
    float _2909 = _2863;
    float _2911 = _2849;
    float _2913 = _2845;
    float _2915 = _2853;
    float _2917 = _2857;
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2921 = _2909 + _2919;
    float _2923 = _2801;
    float _2925 = _2909;
    if (!_2805)
    {
        float _2927 = fma(_2039, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2819);
        _2837 = _2927;
    }
    float _2929 = _2837;
    float _2931 = fma(_2921, _2921, _2911);
    out.m_69.x = _1848;
    out.m_69.y = _1846;
    float _2933 = _2827;
    float _2935 = _2929;
    if (!_2805)
    {
        float _2937 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2801);
        _2923 = _2937;
    }
    float _2939 = _2923;
    float _2941 = _2931 + _2913;
    if (!_2805)
    {
        float _2943 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2827);
        _2933 = _2943;
    }
    float _2945 = _2933;
    float _2947 = _2717 * _2939;
    float _2949 = _2733 * _2939;
    float _2951 = _2735 * _2939;
    float _2953 = sqrt(_2941);
    float _2955 = fma(_2737, _2929, _2947);
    float _2957 = fma(_2747, _2929, _2949);
    float _2959 = -_2673;
    float _2961 = fma(_2959, _2929, _2951);
    float _2963 = fma(_2723, _2945, _2955);
    float _2965 = fma(_2771, _2945, _2957);
    float _2967 = fma(_2739, _2945, _2961);
    out.m_71.x = _2963;
    out.m_71.y = _2965;
    out.m_71.z = _2967;
    bool _2969 = _2953 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2971 = isnan(_2953);
    bool _2973 = _2969 || _2971;
    bool _2975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2977 = _2973 || _2975;
    if (!_2977)
    {
        _2839 = 1.0;
    }
    float _2979 = _2839;
    bool _2981 = !_2977;
    float _2983 = _2979;
    if (!_2981)
    {
        bool _2985 = _2953 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2987 = isnan(_2953);
        bool _2989 = _2985 || _2987;
        bool _2991 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2993 = _2989 || _2991;
        if (!_2993)
        {
            float _2995 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2997 = _2953 + _2995;
            float _2999 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3001 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2999;
            float _3003 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3005 = _3003 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3007 = 1.0 / _3001;
            float _3009 = _2997 * _3007;
            float _3011 = fma(_3009, _3005, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2983 = _3011;
            _3013 = true;
        }
        else
        {
            bool _3015 = _2953 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3017 = isnan(_2953);
            bool _3019 = _3015 || _3017;
            bool _3021 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3023 = _3019 || _3021;
            if (!_3023)
            {
                float _3025 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3027 = _2953 + _3025;
                float _3029 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3031 = _3029 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3033 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3035 = _3033 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3037 = 1.0 / _3031;
                float _3039 = _3027 * _3037;
                float _3041 = fma(_3039, _3035, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2983 = _3041;
                _3013 = true;
            }
            else
            {
                _2983 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3013 = false;
    float _3043 = _2983;
    float _3045 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3047 = _2909 + _3045;
    float _3049 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3051 = _2915 + _3049;
    float _3053 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3055 = _2917 + _3053;
    float _3057 = fma(_3047, _3043, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3059 = fma(_3051, _3043, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3061 = fma(_3055, _3043, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3065 = _3057 + _3063;
    float _3067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3069 = _3059 + _3067;
    float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3073 = _3061 + _3071;
    float _3075 = _3065 * _3065;
    float _3077 = fma(_3069, _3069, _3075);
    float _3079 = fma(_3073, _3073, _3077);
    float _3081 = rsqrt(_3079);
    float _3083 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3085 = _3069 * _3083;
    float _3087 = _3073 * _3083;
    float _3089 = _3085 * _3085;
    float _3091 = _3087 * _3087;
    float _3093 = _3089 + _3091;
    float _3095 = sqrt(_3093);
    bool _3097 = _3095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3101 = _3095 + _3099;
    float _3103 = _3073;
    float _3105 = _3101;
    float _3107 = _3065;
    float _3109 = _3085;
    if (_3097)
    {
        float _3111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3103 = _3111;
    }
    float _3113 = _3103;
    if (_3097)
    {
        float _3115 = rsqrt(_3093);
        _2925 = _3115;
    }
    float _3117 = _2925;
    float _3119 = _3117;
    if (_3097)
    {
        float _3121 = _3101 * _3113;
        _3105 = _3121;
    }
    float _3123 = _3105;
    if (_3097)
    {
        float _3125 = _3123 * 0.15915493667125701904296875;
        _2841 = _3125;
    }
    float _3127 = _2841;
    float _3129 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3131 = _3081;
    if (_3097)
    {
        float _3133 = _3127 * 6.283185482025146484375;
        float _3135 = sin(_3133);
        _3131 = _3135;
    }
    float _3137 = _3131;
    float _3139 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3141 = precise::max(0.0, _3139);
    float _3143 = _3113;
    float _3145 = _3141;
    if (_3097)
    {
        float _3147 = _3127 * 6.283185482025146484375;
        float _3149 = cos(_3147);
        _3143 = _3149;
    }
    float _3151 = _3143;
    float _3153 = -_3083;
    float _3155 = -_3141;
    float _3157 = fma(_3065, _3153, _3155);
    float _3159 = _3157;
    if (_3097)
    {
        float _3161 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3107 = _3161;
    }
    float _3163 = _3107;
    float _3165 = sqrt(_3079);
    float _3167 = _3163;
    float _3169 = _3137;
    if (_3097)
    {
        float _3171 = fma(_3137, _3163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3167 = _3171;
    }
    float _3173 = _3167;
    float _3175 = _3173;
    if (_3097)
    {
        float _3177 = _3151 + (-1.0);
        _3145 = _3177;
    }
    float _3179 = _3145;
    float _3181 = _3179;
    if (_3097)
    {
        float _3183 = _3117 * _3173;
        _2935 = _3183;
    }
    float _3185 = _2935;
    if (!_3097)
    {
        _3119 = _3087;
    }
    float _3187 = _3119;
    float _3189 = _3187;
    if (_3097)
    {
        float _3191 = _3179 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3169 = _3191;
    }
    float _3193 = _3169;
    if (_3097)
    {
        float _3195 = _3085 * _3185;
        _3109 = _3195;
    }
    float _3197 = _3109;
    if (!_3097)
    {
        _3181 = _3089;
    }
    float _3199 = _3181;
    float _3201 = _3199;
    if (_3097)
    {
        float _3203 = _3087 * _3185;
        _3189 = _3203;
    }
    float _3205 = _3189;
    if (_3097)
    {
        float _3207 = fma(_3157, _3151, _3193);
        _3159 = _3207;
    }
    float _3209 = _3159;
    if (_3097)
    {
        float _3211 = _3197 * _3197;
        _3201 = _3211;
    }
    float _3213 = _3201;
    if (!_3097)
    {
        _3175 = _3091;
    }
    float _3215 = _3175;
    float _3217 = _3215;
    if (_3097)
    {
        float _3219 = _3205 * _3205;
        _3217 = _3219;
    }
    float _3221 = _3217;
    float _3223 = fma(_3209, _3209, _3213);
    float _3225 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3227 = _3223 + _3221;
    float _3229 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3233 = fma(_3165, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3231);
    float _3235 = precise::clamp(_3233, 0.0, 1.0);
    float _3237 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3225);
    float _3239 = rsqrt(_3227);
    float _3241 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3229);
    float _3243 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3245 = -_3235;
    float _3247 = _3245 + 1.0;
    float _3249 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3241);
    float _3251 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3253 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3243);
    float _3255 = _3249 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3257 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3251);
    float _3259 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3253);
    float _3261 = abs(_3247);
    float _3263 = log2(_3261);
    float _3265 = _3255 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3267 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3257);
    float _3269 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3271 = _3239 * _3197;
    float _3273 = -_3265;
    float _3275 = fma(_3273, _3129, 1.0);
    float _3277 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3237);
    float _3279 = _3267 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3281 = _3239 * _3209;
    float _3283 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3285 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3287 = _3239 * _3205;
    float _3289 = _3277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3291 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3283);
    float _3293 = -_3285;
    float _3295 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3293);
    float _3297 = log2(_3275);
    float _3299 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3301 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3291);
    float _3303 = -_3287;
    float _3305 = fma(_3303, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3295);
    float _3307 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3309 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3311 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3301);
    float _3313 = fma(_3305, -0.5, 0.5);
    float _3315 = exp2(_3299);
    float _3317 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3307);
    float _3319 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3309);
    float _3321 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3317);
    float _3323 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3319);
    float _3325 = 1.0 / _3311;
    float _3327 = fma(_3305, 0.5, 0.5);
    float _3329 = _3281 + 1.0;
    float _3331 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3321);
    float _3333 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3323);
    float _3335 = fma(_3327, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3337 = _3297 * 0.693147182464599609375;
    float _3339 = sqrt(_3313);
    float _3341 = -_3281;
    float _3343 = fma(_3315, _3329, _3341);
    float _3345 = fma(_3327, _3335, -0.212114393711090087890625);
    float _3347 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3349 = fma(_3343, 0.5, 0.5);
    float _3351 = fma(_3327, _3345, 1.570728778839111328125);
    float _3353 = _3331 * _3325;
    float _3355 = _3333 * _3325;
    float _3357 = fma(_3353, 0.5, 0.5);
    float _3359 = fma(_3355, -0.5, 0.5);
    float _3361 = _3339 * 0.636619746685028076171875;
    float3 _8381 = float3(_3357, _3359, _3347);
    float _3363 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8381, float3(0.0), isnan(_8381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8381, float3(0.0), isnan(_8381)), level(0.0)).x;
    float3 _8392 = float3(_3357, _3359, _3347);
    float4 _3365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8392, float3(0.0), isnan(_8392)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8392, float3(0.0), isnan(_8392)), level(0.0)).xyzw;
    float _3367 = _3365.x;
    float _3369 = _3365.y;
    float _3371 = _3365.z;
    float _3373 = _3365.w;
    float _3375 = -_3351;
    float _3377 = fma(_3361, _3375, 1.0);
    float2 _8413 = float2(_3377, _3349);
    float3 _3381 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8413, float2(0.0), isnan(_8413)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8413, float2(0.0), isnan(_8413)), level(0.0)).xyz;
    float _3383 = _3381.x;
    float _3385 = _3381.y;
    float _3387 = _3381.z;
    float _3389 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3391 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _2237;
    out.m_73.y = _2781;
    out.m_73.z = _2249;
    float _3393 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3391);
    float _3395 = exp2(_3389);
    out.m_75.x = _3059;
    out.m_75.y = _3057;
    out.m_75.z = _3061;
    float _3397 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3393);
    float _3399 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3401 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3397);
    out.m_49.x = 1.0;
    float _3403 = _3401 + _3311;
    out.gl_Position.x = _3331;
    out.gl_Position.y = _3333;
    out.gl_Position.z = _3401;
    out.gl_Position.w = _3311;
    float _3405 = _3403 * 0.5;
    float _3407 = -_3395;
    float _3409 = _3407 + 1.0;
    out.m_77.w = _3399;
    float _3411 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _3405;
    out.m_79.w = _3311;
    float _3413 = _3411 * _3363;
    float _3415 = -_3411;
    float _3417 = _3415 + 1.0;
    float _3419 = _3373 * _3413;
    float _3421 = _3373 * _3417;
    float _3423 = _3387 * _3413;
    float _3425 = fma(_3383, _3419, _3367);
    float _3427 = fma(_3385, _3419, _3369);
    float _3429 = fma(_3373, _3423, _3371);
    out.m_81.x = _3425;
    out.m_81.y = _3427;
    out.m_81.z = _3429;
    out.m_81.w = _3421;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3013 = false;
    bool _2125 = false;
    bool _1935 = false;
    bool _1441 = false;
    bool _1125 = false;
    bool _807 = false;
    bool _705 = false;
    bool _527 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3485 = as_type<float>(_119);
        out.gl_Position.z = _3485;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_51.w;
    float _125 = in.m_53.x;
    bool _127 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_123);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_123;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _125;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    float _159 = _157;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _161 = _157 * 5.0;
        _121 = as_type<int>(_161);
    }
    int _163 = _121;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3560 = as_type<float>(_163);
        out.gl_Position.z = _3560;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_57.w;
    float _167 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_51.x;
    float _181 = in.m_51.y;
    float _183 = in.m_51.z;
    float _185 = in.m_46.x;
    float _187 = in.m_46.y;
    float _189 = in.m_46.z;
    float _191 = _167;
    if (!_177)
    {
        float _193 = _167 * _167;
        float _195 = _193 * 0.5;
        _159 = _195;
    }
    float _197 = _159;
    float _199 = _197;
    if (!_177)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_177;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _167 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _167);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_177;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _167 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _191 = _261;
    }
    float _263 = _191;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _179, _267);
    float _275 = fma(_263, _181, _269);
    float _277 = fma(_263, _183, _271);
    float _279 = fma(_273, _165, _185);
    float _281 = fma(_275, _165, _187);
    float _283 = fma(_277, _165, _189);
    bool _285 = !_265;
    float _287 = _279;
    float _289 = _283;
    float _305;
    if (!_285)
    {
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _293 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        float _309 = float(_105);
        float _311 = 1.0 / _309;
        float _313 = _139 * _311;
        _305 = _313;
    }
    _307 = false;
    float _315 = _305;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = _315 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _315 + _321;
    bool _325 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _327 = isnan(_315);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = _315 + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = 1.0 / _339;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _357 = 1.0 / _351;
    float _359 = 1.0 / _347;
    float _361 = _319 * _353;
    bool _363 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _365 = isnan(_315);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -_335;
    float _377 = _375 + 1.0;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _379;
    float _383 = _373 * _377;
    float _385 = _323 * _357;
    bool _387 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_315);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -_373;
    float _401 = _399 + 1.0;
    bool _403 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_315);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = -_397;
    float _421 = _419 + 1.0;
    float _423 = _397 * _401;
    float _425 = _343 * _359;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    float _435 = _413 * _421;
    float _437 = fma(_381, _425, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _439 = fma(_429, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _441 = fma(_433, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = -_413;
    float _449 = _447 + 1.0;
    float _451 = _439 * _435;
    float _453 = _441 * _435;
    float _455 = _437 * _435;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _461 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _453);
    float _463 = fma(_417, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _451);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _471;
    float _475 = fma(_445, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _477 = fma(_459, _385, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _479 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].z, _455);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _481;
    float _485 = fma(_463, _423, _465);
    float _487 = fma(_469, _361, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_473, _361, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = fma(_483, _361, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _493 = fma(_475, _423, _461);
    float _495 = fma(_477, _423, _479);
    float _497 = fma(_487, _383, _485);
    float _499 = fma(_489, _383, _493);
    float _501 = fma(_491, _383, _495);
    float _503 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[146].x, _497);
    float _505 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[146].y, _499);
    float _507 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[146].z, _501);
    bool _509 = !_355;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _513 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_105);
        float _531 = 1.0 / _529;
        float _533 = _139 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = in.m_57.x;
    float _539 = in.m_57.y;
    float _541 = in.m_57.z;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _545 = _535 + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _547;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _555 = 1.0 / _549;
    bool _557 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _559 = 1.0 / _553;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _561;
    float _565 = _507 * _541;
    float _567 = _505 * _539;
    bool _569 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _571 = isnan(_535);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = _545 * _555;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _585 = _535 + _583;
    bool _587 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _589 = isnan(_535);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _599;
    bool _603 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _605 = isnan(_535);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_579;
    float _617 = _615 + 1.0;
    float _619 = fma(_563, _581, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _621 = fma(_601, _581, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _623 = _585 * _559;
    float _625 = _613 * _617;
    float _627 = -_613;
    float _629 = _627 + 1.0;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _631;
    float _635 = _597 * _629;
    float _637 = fma(_633, _581, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _639 = -_597;
    float _641 = _639 + 1.0;
    float _643 = _619 * _635;
    float _645 = _637 * _635;
    float _647 = _621 * _635;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[107].x, _645);
    float _663 = fma(_651, _623, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _665 = fma(_655, _623, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _667 = fma(_659, _623, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _669 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[107].y, _643);
    float _671 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[107].z, _647);
    float _673 = fma(_663, _625, _661);
    float _675 = fma(_665, _625, _669);
    float _677 = fma(_667, _625, _671);
    float _679 = _503 * _537;
    float _681 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[109].x, _673);
    float _683 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[109].y, _675);
    float _685 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[109].z, _677);
    bool _687 = !_557;
    float _703;
    if (!_687)
    {
        float _689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _691 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _695 = _693 * _689;
        float _697 = floor(_695);
        float _699 = -_697;
        float _701 = _695 + _699;
        _703 = _701;
        _705 = true;
    }
    else
    {
        float _707 = float(_105);
        float _709 = 1.0 / _707;
        float _711 = _139 * _709;
        _703 = _711;
    }
    _705 = false;
    float _713 = _703;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _717 = _713 + _715;
    bool _719 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _721 = isnan(_713);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _735 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _737 = isnan(_713);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _747;
    float _751 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _753 = -_729;
    float _755 = _753 + 1.0;
    bool _757 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _759 = 1.0 / _733;
    float _761 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _745 * _755;
    float _765 = -_745;
    float _767 = _765 + 1.0;
    float _769 = _749 * _759;
    float _771 = _685 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _773 = fma(_769, _717, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _773 * _763;
    float _779 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _781 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[115].x, _777);
    float _783 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[116].x, _781);
    float _787 = _785 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _761;
    out.m_59.y = _783;
    out.m_59.z = _775;
    out.m_59.w = _787;
    bool _789 = !_757;
    float _805;
    if (!_789)
    {
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _793 = _125 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _797 = _795 * _791;
        float _799 = floor(_797);
        float _801 = -_799;
        float _803 = _797 + _801;
        _805 = _803;
        _807 = true;
    }
    else
    {
        float _809 = float(_105);
        float _811 = 1.0 / _809;
        float _813 = _139 * _811;
        _805 = _813;
    }
    _807 = false;
    float _815 = _805;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _819 = _815 + _817;
    bool _821 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _823 = isnan(_815);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _837 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _839 = isnan(_815);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _849;
    bool _853 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _855 = isnan(_815);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = 1.0 / _835;
    bool _867 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _869 = isnan(_815);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _881 = _879 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _883 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _885 = isnan(_815);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = 1.0 / _881;
    bool _897 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _899 = _851 * _865;
    float _901 = -_831;
    float _903 = _901 + 1.0;
    float _905 = fma(_899, _819, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _907 = _847 * _903;
    float _909 = -_847;
    float _911 = _909 + 1.0;
    bool _913 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _915 = isnan(_815);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _863 * _911;
    float _927 = -_863;
    float _929 = _927 + 1.0;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _935 = _877 * _929;
    float _937 = -_877;
    float _939 = _937 + 1.0;
    float _941 = 1.0 / _933;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _947 = -_893;
    float _949 = _947 + 1.0;
    float _951 = _893 * _939;
    bool _953 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _955 = isnan(_815);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = -_923;
    float _967 = _965 + 1.0;
    float _969 = _923 * _949;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _973 = _971 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _975 = 1.0 / _945;
    float _977 = _963 * _967;
    float _979 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _983 = -_963;
    float _985 = _983 + 1.0;
    float _987 = _973 * _895;
    float _989 = _905 * _977;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _993 = _991 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _995 = 1.0 / _981;
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _999 = _815 + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1001;
    float _1005 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[159].x, _989);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1011 = fma(_987, _999, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1017 = _1003 * _941;
    float _1019 = 1.0 / _993;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1023 = _815 + _1021;
    float _1025 = fma(_1011, _969, _1005);
    float _1027 = _1015 * _975;
    float _1029 = fma(_1017, _1023, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1033 = _815 + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1035;
    float _1039 = 1.0 / _1009;
    float _1041 = fma(_1027, _1033, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1047 = _1037 * _995;
    float _1049 = fma(_1029, _951, _1025);
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1053 = _815 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1055;
    bool _1059 = _815 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1061 = isnan(_815);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = _1045 * _1019;
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1075 = _815 + _1073;
    float _1077 = fma(_1047, _1053, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1079 = fma(_1041, _935, _1049);
    float _1081 = -_1069;
    float _1083 = _1081 + 1.0;
    float _1085 = fma(_1071, _1075, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1089 = _815 + _1087;
    float _1091 = _1057 * _1039;
    float _1093 = fma(_1077, _925, _1079);
    float _1095 = _831 * _1083;
    float _1097 = fma(_1091, _1089, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1099 = fma(_1085, _907, _1093);
    float _1101 = fma(_1097, _1095, _1099);
    float _1103 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1101);
    float _1105 = precise::clamp(_1103, 0.0, 1.0);
    bool _1107 = !_897;
    float _1123;
    if (!_1107)
    {
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1111 = _125 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[14].y, _139);
        float _1115 = _1113 * _1109;
        float _1117 = floor(_1115);
        float _1119 = -_1117;
        float _1121 = _1115 + _1119;
        _1123 = _1121;
        _1125 = true;
    }
    else
    {
        float _1127 = float(_105);
        float _1129 = 1.0 / _1127;
        float _1131 = _139 * _1129;
        _1123 = _1131;
    }
    _1125 = false;
    float _1133 = _1123;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1137 = _1133 + _1135;
    bool _1139 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1141 = isnan(_1133);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1155;
    bool _1159 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1161 = isnan(_1133);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    bool _1171 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1173 = isnan(_1133);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = 1.0 / _1153;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1189 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1191 = isnan(_1133);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = -_1181;
    float _1203 = _1201 + 1.0;
    bool _1205 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1207 = isnan(_1133);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = 1.0 / _1187;
    float _1219 = -_1199;
    float _1221 = _1219 + 1.0;
    bool _1223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1225 = _1157 * _1183;
    float _1227 = -_1149;
    float _1229 = _1227 + 1.0;
    float _1231 = -_1169;
    float _1233 = _1231 + 1.0;
    float _1235 = -_1215;
    float _1237 = _1235 + 1.0;
    float _1239 = fma(_1225, _1137, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1241 = _1169 * _1229;
    float _1243 = _1181 * _1233;
    float _1245 = _1199 * _1203;
    bool _1247 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1249 = isnan(_1133);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1265 = _1263 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1267 = _1215 * _1221;
    bool _1269 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1271 = isnan(_1133);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1277 = _1273 || _1275;
    float _1279 = float(_1277);
    float _1281 = _1257 * _1237;
    float _1283 = 1.0 / _1265;
    float _1285 = -_1257;
    float _1287 = _1285 + 1.0;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1293 = _1279 * _1287;
    float _1295 = -_1279;
    float _1297 = _1295 + 1.0;
    float _1299 = _1291 * _1217;
    float _1301 = 1.0 / _1261;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1305 = _1303 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1307 = _1239 * _1293;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1313;
    float _1317 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1307);
    float _1319 = 1.0 / _1305;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1323 = _1133 + _1321;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1327 = _1325 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1329 = _1315 * _1283;
    float _1331 = fma(_1299, _1323, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1335 = _1133 + _1333;
    float _1337 = 1.0 / _1311;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1343 = fma(_1329, _1335, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1345 = fma(_1331, _1281, _1317);
    float _1347 = _1341 * _1301;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1351 = _1133 + _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1353;
    float _1357 = 1.0 / _1327;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1363 = fma(_1347, _1351, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1365 = _1355 * _1319;
    float _1367 = fma(_1343, _1267, _1345);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1371 = _1133 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1375 = _1133 + _1373;
    float _1377 = _1361 * _1337;
    bool _1379 = _1133 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1381 = isnan(_1133);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1391;
    float _1395 = fma(_1365, _1371, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1397 = fma(_1363, _1245, _1367);
    float _1399 = fma(_1377, _1375, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1401 = -_1389;
    float _1403 = _1401 + 1.0;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1407 = _1133 + _1405;
    float _1409 = _1393 * _1357;
    float _1411 = fma(_1395, _1243, _1397);
    float _1413 = _1149 * _1403;
    float _1415 = fma(_1409, _1407, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1417 = fma(_1399, _1241, _1411);
    float _1419 = fma(_1415, _1413, _1417);
    float _1421 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1419);
    out.m_61.x = _1421;
    bool _1423 = !_1223;
    float _1439;
    if (!_1423)
    {
        float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1427 = _125 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[14].z, _139);
        float _1431 = _1429 * _1425;
        float _1433 = floor(_1431);
        float _1435 = -_1433;
        float _1437 = _1431 + _1435;
        _1439 = _1437;
        _1441 = true;
    }
    else
    {
        float _1443 = float(_105);
        float _1445 = 1.0 / _1443;
        float _1447 = _139 * _1445;
        _1439 = _1447;
    }
    _1441 = false;
    float _1449 = _1439;
    int _1451 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1453 = _1451;
    int _1455 = 0;
    int _1457 = _96(_1453, _1455, (*spvDescriptorSet0.support_buffer));
    float _1459 = in.m_63.z;
    float _1461 = trunc(_1459);
    int _1463 = int(_1461);
    int _1465 = _1457 + (-1);
    float _1467 = float(_1465);
    float _1469 = _1105 * _1467;
    float _1471 = trunc(_1469);
    int _1473 = int(_1471);
    int _1475 = _1473;
    int _1477 = 0;
    int _1479 = _97(_1475, _1477, (*spvDescriptorSet0.support_buffer));
    int _1481 = _1463;
    int _1483 = 0;
    int _1485 = _97(_1481, _1483, (*spvDescriptorSet0.support_buffer));
    float4 _1488 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1479, _1485)), 0).xyzw;
    float _1490 = _1488.x;
    float _1492 = _1488.y;
    float _1494 = _1488.z;
    float _1496 = _1488.w;
    float _1498 = in.m_53.y;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1502 = _1500 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1506 = _1504 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1512 = 1.0 / _1502;
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1518 = in.m_63.x;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1522 = _1520 != 0;
    float _1524 = 1.0 / _1506;
    bool _1526 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1528 = isnan(_1449);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1540 = _1538 != 0;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1542;
    bool _1546 = _125 > 0.5;
    bool _1548 = _1546 && _1522;
    float _1550 = -_1536;
    float _1552 = _1550 + 1.0;
    bool _1554 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1556 = isnan(_1449);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = 1.0 / _1510;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1568;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1576 = _1570 * _1512;
    bool _1578 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1580 = isnan(_1449);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = 1.0 / _1516;
    bool _1592 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1594 = isnan(_1449);
    bool _1596 = _1592 || _1594;
    bool _1598 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1600 = _1596 || _1598;
    float _1602 = float(_1600);
    float _1604 = _1574 * _1524;
    bool _1606 = _1498 > 0.5;
    bool _1608 = _1606 && _1540;
    float _1610 = _1602 * _1552;
    float _1612 = -_1602;
    float _1614 = _1612 + 1.0;
    bool _1616 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1618 = isnan(_1449);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1632 = _1544 * _1566;
    float _1634 = _1564 * _1614;
    float _1636 = -_1564;
    float _1638 = _1636 + 1.0;
    bool _1640 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1642 = isnan(_1449);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1654 = _1449 + _1652;
    float _1656 = _1630 * _1590;
    float _1658 = -_1626;
    float _1660 = _1658 + 1.0;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1666 = _1626 * _1638;
    bool _1668 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1670 = isnan(_1449);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = _1650 * _1660;
    float _1682 = -_1650;
    float _1684 = _1682 + 1.0;
    float _1686 = 1.0 / _1664;
    float _1688 = fma(_1576, _1654, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1690 = _1449 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1692 = isnan(_1449);
    bool _1694 = _1690 || _1692;
    bool _1696 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1698 = _1694 || _1696;
    float _1700 = float(_1698);
    float _1702 = _1678 * _1684;
    float _1704 = -_1678;
    float _1706 = _1704 + 1.0;
    float _1708 = _1700 * _1706;
    float _1710 = -_1700;
    float _1712 = _1710 + 1.0;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1724 = _1449 + _1722;
    float _1726 = _1588 * _1712;
    float _1728 = -_1588;
    float _1730 = _1728 + 1.0;
    float _1732 = _1716 * _1686;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1736 = _1449 + _1734;
    float _1738 = 1.0 / _1720;
    float _1740 = _1688 * _1726;
    float _1742 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1744 = _1742 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1746 = fma(_1632, _1736, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1748 = fma(_1604, _1724, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1750 = in.m_63.y;
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1740);
    float _1754 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1756 = _1449 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1760 = _1758 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1762 = 1.0 / _1744;
    float _1764 = fma(_1748, _1708, _1752);
    float _1766 = fma(_1656, _1756, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1770 = _1449 + _1768;
    float _1772 = fma(_1746, _1702, _1764);
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1776 = _1449 + _1774;
    float _1778 = _1760 * _1738;
    float _1780 = fma(_1732, _1770, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1782 = fma(_1766, _1680, _1772);
    float _1784 = fma(_1778, _1776, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1788 = _1449 + _1786;
    float _1790 = fma(_1780, _1666, _1782);
    int _1792 = _1473 + 1;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1794;
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1800 = fma(_1784, _1634, _1790);
    float _1802 = _1634;
    float _1804 = _1788;
    if (_1522)
    {
        _1802 = _1518;
    }
    float _1806 = _1802;
    float _1808 = _1796 * _1762;
    float _1810 = _1750;
    float _1812 = _1806;
    if (_1608)
    {
        float _1814 = -_1750;
        float _1816 = _1814 + 1.0;
        _1810 = _1816;
    }
    float _1818 = _1810;
    int _1820 = min(_1465, _1792);
    if (_1548)
    {
        float _1822 = -_1806;
        float _1824 = _1822 + 1.0;
        _1812 = _1824;
    }
    float _1826 = _1812;
    float _1828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1830 = fma(_1808, _1788, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    if (!_1522)
    {
        _1804 = _1518;
    }
    float _1832 = _1804;
    float _1834 = _1832;
    if (_1522)
    {
        _1834 = _1826;
    }
    float _1836 = _1834;
    float _1838 = fma(_1830, _1610, _1800);
    float _1840 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1842 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1844 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1838);
    float _1846 = _1840 * _1798;
    out.m_65.x = _1844;
    float _1848 = _1842 * _1828;
    uint _1851 = as_type<uint>(half2(float2(_1496, 0.0)));
    uint _1853 = extract_bits(_1851, 0u, 8u);
    int _1855 = int(_1853) & 255;
    uint _1857 = extract_bits(_1851, 8u, 8u);
    int _1859 = int(_1857) & 255;
    int _1861 = _1859 << 8;
    int _1863 = _1855 | _1861;
    bool _1865 = _1863 >= 32768;
    int _1867 = _1863 + (-1024);
    int _1869 = _1867;
    if (_1865)
    {
        int _1871 = ~_1863;
        int _1873 = _1871 + 33792;
        int _1875 = _1873 + 1;
        _1869 = _1875;
    }
    int _1877 = _1869;
    int _1879 = _1877 + 30719;
    float _1881 = float(_1879);
    float _1883 = fma(_1881, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1885 = abs(_1883);
    float _1887 = -_1885;
    float _1889 = _1887 + 1.0;
    float _1891 = abs(_1883);
    float _1893 = fma(_1891, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1895 = _1883 < 0.0;
    float _1897 = float(_1895);
    int _1899 = as_type<int>(_1889) + (-218103808);
    float _1901 = abs(_1883);
    float _1903 = fma(_1901, _1893, -0.212114393711090087890625);
    bool _1905 = uint(_1899) >= 1920991232u;
    float _1907 = abs(_1883);
    float _1909 = fma(_1907, _1903, 1.570728778839111328125);
    bool _1911 = !_1905;
    float _1933;
    if (!_1911)
    {
        int _1913 = as_type<int>(_1889);
        int _1915 = as_type<int>(_1842);
        int _1917 = 9248;
        int _1919 = as_type<int>(_1730);
        int _1921;
        int _1923;
        int _1925;
        int _1927;
        int _1929;
        int _1931;
        _94(_1913, _1915, _1917, _1919, _1921, _1923, _1925, _1927, _1929, _1931, out.gl_Position, out.gl_PointSize);
        _1933 = as_type<float>(_1929);
        _1935 = true;
    }
    else
    {
        float _1937 = rsqrt(_1889);
        float _1939 = _1889 * _1937;
        float _1941 = _1937 * 0.5;
        float _1943 = -_1939;
        float _1945 = 0.0 + _1943;
        float _1947 = fma(_1941, _1945, 0.5);
        float _1949 = fma(_1939, _1947, _1939);
        float _1951 = -_1949;
        float _1953 = 0.0 + _1951;
        float _1955 = fma(_1949, _1953, _1889);
        float _1957 = fma(_1941, _1955, _1949);
        _1933 = _1957;
    }
    _1935 = false;
    float _1959 = _1933;
    int _1961 = _1820;
    int _1963 = 0;
    int _1965 = _97(_1961, _1963, (*spvDescriptorSet0.support_buffer));
    int _1967 = _1463;
    int _1969 = 0;
    int _1971 = _97(_1967, _1969, (*spvDescriptorSet0.support_buffer));
    float4 _1973 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1965, _1971)), 0).xyzw;
    float _1975 = _1973.x;
    float _1977 = _1973.y;
    float _1979 = _1973.z;
    float _1981 = _1973.w;
    float _1983 = _1909 * _1959;
    float _1985 = _1897 * 2.0;
    float _1987 = _1881 * 3.883221149444580078125;
    float _1989 = floor(_1469);
    float _1991 = -_1985;
    float _1993 = fma(_1983, _1991, _1983);
    float _1995 = _1987 * 0.15915493667125701904296875;
    float _1997 = fma(_1897, 3.1415927410125732421875, _1993);
    float _1999 = _1995 * 6.283185482025146484375;
    float _2001 = cos(_1999);
    float _2003 = _1997 * 0.15915493667125701904296875;
    float _2005 = _2003 * 6.283185482025146484375;
    float _2007 = sin(_2005);
    float _2009 = -_1989;
    float _2011 = _1469 + _2009;
    float _2013 = _1995 * 6.283185482025146484375;
    float _2015 = sin(_2013);
    float _2017 = _2007 * _2001;
    float _2019 = _2007 * _2015;
    uint _2021 = as_type<uint>(half2(float2(_1981, 0.0)));
    float _2023 = -_1490;
    float _2025 = _2023 + _1975;
    uint _2027 = extract_bits(_2021, 0u, 8u);
    int _2029 = int(_2027) & 255;
    uint _2031 = extract_bits(_2021, 8u, 8u);
    int _2033 = int(_2031) & 255;
    int _2035 = _2033 << 8;
    int _2037 = _2029 | _2035;
    float _2039 = fma(_2011, _2025, _1490);
    bool _2041 = _2037 >= 32768;
    int _2043 = _2037 + (-1024);
    int _2045 = _2043;
    float _2047 = _2011;
    if (_2041)
    {
        int _2049 = ~_2037;
        int _2051 = _2049 + 33792;
        int _2053 = _2051 + 1;
        _2045 = _2053;
    }
    int _2055 = _2045;
    float _2057 = -_1494;
    float _2059 = _2057 + _1979;
    int _2061 = _2055 + 30719;
    float _2063 = fma(_2011, _2059, _1494);
    float _2065 = float(_2061);
    float _2067 = fma(_2065, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2069 = abs(_2067);
    float _2071 = -_2069;
    float _2073 = _2071 + 1.0;
    float _2075 = abs(_2067);
    float _2077 = fma(_2075, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2079 = as_type<int>(_2073) + (-218103808);
    float _2081 = abs(_2067);
    float _2083 = fma(_2081, _2077, -0.212114393711090087890625);
    bool _2085 = uint(_2079) >= 1920991232u;
    float _2087 = -_1492;
    float _2089 = _2087 + _1977;
    bool _2091 = _2067 < 0.0;
    float _2093 = float(_2091);
    float _2095 = abs(_2067);
    float _2097 = fma(_2095, _2083, 1.570728778839111328125);
    float _2099 = fma(_2011, _2089, _1492);
    bool _2101 = !_2085;
    float _2123;
    if (!_2101)
    {
        int _2103 = as_type<int>(_2073);
        int _2105 = as_type<int>(_1979);
        int _2107 = 10144;
        int _2109 = as_type<int>(_1983);
        int _2111;
        int _2113;
        int _2115;
        int _2117;
        int _2119;
        int _2121;
        _94(_2103, _2105, _2107, _2109, _2111, _2113, _2115, _2117, _2119, _2121, out.gl_Position, out.gl_PointSize);
        _2123 = as_type<float>(_2119);
        _2125 = true;
    }
    else
    {
        float _2127 = rsqrt(_2073);
        float _2129 = _2073 * _2127;
        float _2131 = _2127 * 0.5;
        float _2133 = -_2129;
        float _2135 = 0.0 + _2133;
        float _2137 = fma(_2131, _2135, 0.5);
        float _2139 = fma(_2129, _2137, _2129);
        float _2141 = -_2139;
        float _2143 = 0.0 + _2141;
        float _2145 = fma(_2139, _2143, _2073);
        float _2147 = fma(_2131, _2145, _2139);
        _2123 = _2147;
    }
    _2125 = false;
    float _2149 = _2123;
    float _2151 = in.m_53.x;
    float _2153 = in.m_53.y;
    float _2155 = in.m_53.z;
    float _2157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2159 = log2(_2157);
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2163 = _2161 != 0;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2167 = _2165 != 0;
    int _2169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2171 = _2169 != 0;
    bool _2173 = !_2171;
    int _2175 = _2173 ? 0 : 1;
    bool _2177 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2179 = isnan(1.0);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2185 = _2181 || _2183;
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2189 = 1.0 + _2187;
    int _2191 = abs(_2175);
    float _2193 = _2159 * _139;
    float _2195 = 1.0 / _2189;
    float _2197 = _2155 * 2.0;
    float _2199 = _2155 + _2151;
    float _2201 = _2153 * 2.0;
    float _2203 = _2153 + _2151;
    float _2205 = _2151 * 2.0;
    float _2207 = _2199 + (-1.0);
    float _2209 = floor(_2197);
    float _2211 = _2203 + (-1.0);
    float _2213 = _2151 + (-0.5);
    float _2215 = fma(_2207, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2217 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2219 = fma(_2211, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2221 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2223 = floor(_2201);
    float _2225 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2217);
    float _2227 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2221);
    float _2229 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2225);
    float _2231 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2227);
    float _2233 = exp2(_2193);
    bool _2235 = _2209 > 0.0;
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2239 = _2209 >= 0.0;
    bool _2241 = isnan(_2209);
    bool _2243 = _2239 || _2241;
    bool _2245 = isnan(0.0);
    bool _2247 = _2243 || _2245;
    float _2249 = _2229 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2251 = _2247 ? 0 : 1;
    float _2253 = floor(_2205);
    bool _2255 = _2223 > 0.0;
    int _2257 = ~_2251;
    int _2259 = _2257 + 1;
    int _2261 = _2259 + 1;
    bool _2263 = _2223 >= 0.0;
    bool _2265 = isnan(_2223);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan(0.0);
    bool _2271 = _2267 || _2269;
    int _2273 = _2261;
    bool _2275 = _2185;
    if (!_2235)
    {
        int _2277 = ~_2251;
        int _2279 = _2277 + 1;
        _2273 = _2279;
    }
    int _2281 = _2273;
    float _2283 = -_2233;
    float _2285 = _2283 + 1.0;
    float _2287 = in.m_67.x;
    float _2289 = in.m_67.y;
    float _2291 = in.m_67.z;
    bool _2293 = !_2163;
    int _2295 = _2293 ? 0 : 1;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2299 = _2237 + _2297;
    bool _2301 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2303 = isnan(0.0);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2309 = _2305 || _2307;
    int _2311 = abs(_2295);
    float _2313 = -_2249;
    float _2315 = _2313 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2317 = _2309 ? _2285 : 0.0;
    int _2319 = _2271 ? 0 : 1;
    bool _2321 = _2253 > 0.0;
    float _2323 = _2299;
    float _2325 = _2315;
    if (_2185)
    {
        float _2327 = _2317 * _2195;
        _143 = _2327;
    }
    float _2329 = _143;
    bool _2331 = _2253 >= 0.0;
    bool _2333 = isnan(_2253);
    bool _2335 = _2331 || _2333;
    bool _2337 = isnan(0.0);
    bool _2339 = _2335 || _2337;
    float _2341 = float(_2311);
    float _2343 = float(_2281);
    float _2345 = abs(_2299);
    float _2347 = abs(_2315);
    float _2349 = precise::max(_2345, _2347);
    int _2351 = ~_2319;
    int _2353 = _2351 + 1;
    int _2355 = _2353 + 1;
    float _2357 = _2341 * _2343;
    bool _2359 = !_2167;
    int _2361 = _2359 ? 0 : 1;
    int _2363 = _2355;
    float _2365 = _2329;
    if (!_2255)
    {
        int _2367 = ~_2319;
        int _2369 = _2367 + 1;
        _2363 = _2369;
    }
    int _2371 = _2363;
    float _2373 = _2357 * (-2.0);
    bool _2375 = _2349 >= 16.0;
    int _2377 = abs(_2361);
    float _2379 = fma(_2373, _2287, _2287);
    float _2381 = float(_2191);
    float _2383 = fma(_2219, _2373, _2219);
    float _2385 = float(_2371);
    float _2387 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2379);
    int _2389 = _2339 ? 0 : 1;
    float _2391 = _2155 + (-0.5);
    float _2393 = _2381 * _2385;
    int _2395 = ~_2389;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    int _2401 = _2399;
    if (_2375)
    {
        float _2403 = _2299 * 0.0625;
        _2323 = _2403;
    }
    float _2405 = _2323;
    if (!_2321)
    {
        int _2407 = ~_2389;
        int _2409 = _2407 + 1;
        _2401 = _2409;
    }
    int _2411 = _2401;
    float _2413 = _2393 * (-2.0);
    if (_2375)
    {
        float _2415 = _2315 * 0.0625;
        _2325 = _2415;
    }
    float _2417 = _2325;
    float _2419 = fma(_2383, _2329, _2387);
    float _2421 = abs(_2405);
    bool _2423 = _2421 != 0.0;
    bool _2425 = isnan(_2421);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(0.0);
    bool _2431 = _2427 || _2429;
    float _2433 = fma(_2413, _2291, _2291);
    float _2435 = fma(_2215, _2413, _2215);
    float _2437 = float(_2377);
    float _2439 = _2155 + _2153;
    float _2441 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2433);
    float _2443 = float(_2411);
    float _2445 = _2419 * 0.15915493667125701904296875;
    float _2447 = abs(_2417);
    bool _2449 = _2447 == 0.0;
    bool _2451 = !_2431;
    bool _2453 = _2449 && _2451;
    float _2455 = fma(_2435, _2329, _2441);
    float _2457 = abs(_2417);
    bool _2459 = _2457 == 0.0;
    float _2461 = _2437 * _2443;
    float _2463 = _2455 * 0.15915493667125701904296875;
    float _2465 = _2439 + (-1.0);
    float _2467 = _2461 * (-2.0);
    float _2469 = _2445 * 6.283185482025146484375;
    float _2471 = sin(_2469);
    float _2473 = _2153 + (-0.5);
    float _2475 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2477 = fma(_2467, _2289, _2289);
    int _2479 = as_type<int>(_2477);
    if (_2453)
    {
        bool _2481 = as_type<int>(_2417) >= 0;
        _2275 = _2481;
    }
    bool _2483 = _2275;
    float _2485 = fma(_2475, _2467, _2475);
    float _2487 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2477);
    float _2489 = _2445 * 6.283185482025146484375;
    float _2491 = cos(_2489);
    int _2493 = _2483 ? (-1) : 0;
    if (_2453)
    {
        int _2495 = _2483 ? 0 : 1078530011;
        _2479 = _2495;
    }
    int _2497 = _2479;
    float _2499 = fma(_2485, _2329, _2487);
    int _2501 = _2497;
    if (_2453)
    {
        int _2503 = int(0x80000000) & as_type<int>(_2405);
        int _2505 = _2497 | _2503;
        _2365 = as_type<float>(_2505);
    }
    float _2507 = _2365;
    float _2509 = _2463 * 6.283185482025146484375;
    float _2511 = sin(_2509);
    bool _2513 = !_2431;
    bool _2515 = _2513 && _2459;
    float _2517 = _2507;
    float _2519 = _2507;
    if (!_2515)
    {
        float _2521 = abs(_2405);
        bool _2523 = _2521 != as_type<float>(0x7f800000u /* inf */);
        bool _2525 = isnan(_2521);
        bool _2527 = _2523 || _2525;
        bool _2529 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2531 = _2527 || _2529;
        float _2533 = abs(_2417);
        bool _2535 = _2533 == as_type<float>(0x7f800000u /* inf */);
        float _2537 = abs(_2417);
        bool _2539 = _2537 == as_type<float>(0x7f800000u /* inf */);
        bool _2541 = !_2531;
        bool _2543 = _2539 && _2541;
        if (_2543)
        {
            bool _2545 = as_type<int>(_2417) >= 0;
            _2493 = _2545 ? (-1) : 0;
        }
        int _2547 = _2493;
        if (_2543)
        {
            _2501 = 1075235812;
        }
        int _2549 = _2501;
        int _2551 = _2549;
        if (_2543)
        {
            int _2553 = ~_2547;
            int _2555 = (_2553 != 0) ? _2549 : 1061752795;
            _2551 = _2555;
        }
        int _2557 = _2551;
        if (_2543)
        {
            int _2559 = int(0x80000000) & as_type<int>(_2405);
            int _2561 = _2557 | _2559;
            _2517 = as_type<float>(_2561);
        }
        float _2563 = _2517;
        bool _2565 = !_2531;
        bool _2567 = _2565 && _2535;
        _2519 = _2563;
        if (!_2567)
        {
            float _2569 = abs(_2405);
            float _2571 = abs(_2417);
            float _2573 = precise::max(_2569, _2571);
            float _2575 = abs(_2405);
            float _2577 = abs(_2417);
            float _2579 = precise::min(_2575, _2577);
            float _2581 = 1.0 / _2573;
            float _2583 = abs(_2405);
            float _2585 = abs(_2417);
            bool _2587 = _2583 > _2585;
            bool _2589 = as_type<int>(_2417) >= 0;
            float _2591 = _2579 * _2581;
            float _2593 = abs(_2405);
            float _2595 = abs(_2417);
            float _2597 = _2593 + _2595;
            int _2599 = as_type<int>(_2405) & int(0x80000000);
            float _2601 = _2591 * _2591;
            bool _2603 = _2597 > as_type<float>(0x7f800000u /* inf */);
            bool _2605 = isnan(_2597);
            bool _2607 = _2603 || _2605;
            bool _2609 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2611 = _2607 || _2609;
            float _2613 = _2601 + 11.33538818359375;
            float _2615 = fma(_2601, _2613, 28.84246826171875);
            float _2617 = fma(_2601, _2615, 19.6966705322265625);
            float _2619 = fma(_2601, -0.82336294651031494140625, -5.674867153167724609375);
            float _2621 = fma(_2601, _2619, -6.565555095672607421875);
            float _2623 = 1.0 / _2617;
            float _2625 = _2601 * _2621;
            float _2627 = _2591 * _2625;
            float _2629 = fma(_2627, _2623, _2591);
            float _2631 = _2629;
            _2519 = _2597;
            if (_2587)
            {
                float _2633 = -_2629;
                float _2635 = _2633 + 1.57079637050628662109375;
                _2631 = _2635;
            }
            float _2637 = _2631;
            int _2639 = as_type<int>(_2637);
            if (!_2589)
            {
                float _2641 = -_2637;
                float _2643 = _2641 + 3.1415927410125732421875;
                _2639 = as_type<int>(_2643);
            }
            int _2645 = _2639;
            if (!_2611)
            {
                int _2647 = _2599 | _2645;
                _2519 = as_type<float>(_2647);
            }
        }
    }
    float _2649 = _2519;
    float _2651 = -_2649;
    float _2653 = _2499 + _2651;
    float _2655 = _2463 * 6.283185482025146484375;
    float _2657 = cos(_2655);
    float _2659 = _679 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2661 = _2653 * 0.15915493667125701904296875;
    float _2663 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2665 = _2491 * _2511;
    float _2667 = _2097 * _2149;
    float _2669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2039);
    float _2671 = _2661 * 6.283185482025146484375;
    float _2673 = sin(_2671);
    float _2675 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2099);
    float _2677 = _565 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2679 = _2669 * _2659;
    float _2681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2063);
    float _2683 = _2675 * _2663;
    float _2685 = _2471 * _2511;
    float _2687 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2689 = _2661 * 6.283185482025146484375;
    float _2691 = cos(_2689);
    float _2693 = _2471 * _2657;
    float _2695 = _2491 * _2657;
    float _2697 = _2681 * _2677;
    float _2699 = -_1883;
    float _2701 = _2699 + _2067;
    float _2703 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2687);
    bool _2705 = _2099 != 0.0;
    bool _2707 = isnan(_2099);
    bool _2709 = _2705 || _2707;
    bool _2711 = isnan(0.0);
    bool _2713 = _2709 || _2711;
    float _2715 = -_2665;
    float _2717 = fma(_2673, _2693, _2715);
    float _2719 = _2065 * 3.883221149444580078125;
    float _2721 = _2093 * 2.0;
    float _2723 = fma(_2673, _2695, _2685);
    float _2725 = _2717 * _2683;
    float _2727 = _2719 * 0.15915493667125701904296875;
    float _2729 = -_2721;
    float _2731 = fma(_2667, _2729, _2667);
    float _2733 = fma(_2673, _2685, _2695);
    float _2735 = _2471 * _2691;
    float _2737 = _2691 * _2657;
    float _2739 = _2491 * _2691;
    float _2741 = fma(_2093, 3.1415927410125732421875, _2731);
    float _2743 = _2735 * _2683;
    float _2745 = fma(_2737, _2679, _2725);
    float _2747 = _2691 * _2511;
    float _2749 = _2733 * _2683;
    float _2751 = -_2673;
    float _2753 = fma(_2751, _2679, _2743);
    float _2755 = fma(_2723, _2697, _2745);
    float _2757 = _2741 * 0.15915493667125701904296875;
    float _2759 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2703);
    float _2761 = fma(_2739, _2697, _2753);
    float _2763 = _2237 + _2755;
    float _2765 = _2727 * 6.283185482025146484375;
    float _2767 = cos(_2765);
    float _2769 = -_2693;
    float _2771 = fma(_2673, _2665, _2769);
    float _2773 = _2249 + _2761;
    float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2777 = _2763 + _2775;
    float _2779 = fma(_2747, _2679, _2749);
    float _2781 = _2759 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2785 = _2773 + _2783;
    float _2787 = _2777 * _2777;
    float _2789 = _2757 * 6.283185482025146484375;
    float _2791 = sin(_2789);
    bool _2793 = _2039 == 0.0;
    bool _2795 = !_2713;
    bool _2797 = _2793 && _2795;
    float _2799 = _2785 * _2785;
    float _2801 = fma(_2011, _2701, _1883);
    bool _2803 = _2063 == 0.0;
    bool _2805 = _2803 && _2797;
    float _2807 = _2787 + _2799;
    float _2809 = _2727 * 6.283185482025146484375;
    float _2811 = sin(_2809);
    float _2813 = sqrt(_2807);
    float _2815 = -_2017;
    float _2817 = fma(_2791, _2767, _2815);
    float _2819 = fma(_2011, _2817, _2017);
    float _2821 = -_2019;
    float _2823 = fma(_2791, _2811, _2821);
    float _2825 = fma(_2771, _2697, _2779);
    float _2827 = fma(_2011, _2823, _2019);
    float _2829 = _2781 + _2825;
    bool _2831 = _2813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2833 = _2697;
    float _2835 = _2701;
    float _2837 = _2819;
    float _2839 = _2739;
    float _2841 = _2723;
    if (!_2831)
    {
        _2047 = _2799;
    }
    float _2843 = _2047;
    float _2845 = _2843;
    if (!_2831)
    {
        _2833 = _2787;
    }
    float _2847 = _2833;
    float _2849 = _2847;
    if (!_2831)
    {
        _287 = _2763;
    }
    float _2851 = _287;
    float _2853 = _2851;
    if (!_2831)
    {
        _2835 = _2773;
    }
    float _2855 = _2835;
    float _2857 = _2855;
    if (!_2831)
    {
        _289 = _2829;
    }
    float _2859 = _289;
    bool _2861 = !_2831;
    float _2863 = _2859;
    if (!_2861)
    {
        float _2865 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2867 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2869 = _2813 + _2867;
        float _2871 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2873 = rsqrt(_2807);
        float _2875 = _2869 * _2865;
        float _2877 = _2875 * 0.15915493667125701904296875;
        float _2879 = _2877 * 6.283185482025146484375;
        float _2881 = sin(_2879);
        float _2883 = _2877 * 6.283185482025146484375;
        float _2885 = cos(_2883);
        float _2887 = fma(_2881, _2871, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2889 = _2873 * _2887;
        float _2891 = _2885 + (-1.0);
        float _2893 = _2777 * _2889;
        float _2895 = _2785 * _2889;
        float _2897 = _2891 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2899 = _2893 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2901 = _2893 * _2893;
        float _2903 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2905 = fma(_2829, _2885, _2897);
        float _2907 = _2895 * _2895;
        _2863 = _2905;
        _2849 = _2901;
        _2845 = _2907;
        _2853 = _2899;
        _2857 = _2903;
    }
    float _2909 = _2863;
    float _2911 = _2849;
    float _2913 = _2845;
    float _2915 = _2853;
    float _2917 = _2857;
    float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2921 = _2909 + _2919;
    float _2923 = _2801;
    float _2925 = _2909;
    if (!_2805)
    {
        float _2927 = fma(_2039, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2819);
        _2837 = _2927;
    }
    float _2929 = _2837;
    float _2931 = fma(_2921, _2921, _2911);
    out.m_69.x = _1848;
    out.m_69.y = _1846;
    float _2933 = _2827;
    float _2935 = _2929;
    if (!_2805)
    {
        float _2937 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2801);
        _2923 = _2937;
    }
    float _2939 = _2923;
    float _2941 = _2931 + _2913;
    if (!_2805)
    {
        float _2943 = fma(_2063, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2827);
        _2933 = _2943;
    }
    float _2945 = _2933;
    float _2947 = _2717 * _2939;
    float _2949 = _2733 * _2939;
    float _2951 = _2735 * _2939;
    float _2953 = sqrt(_2941);
    float _2955 = fma(_2737, _2929, _2947);
    float _2957 = fma(_2747, _2929, _2949);
    float _2959 = -_2673;
    float _2961 = fma(_2959, _2929, _2951);
    float _2963 = fma(_2723, _2945, _2955);
    float _2965 = fma(_2771, _2945, _2957);
    float _2967 = fma(_2739, _2945, _2961);
    out.m_71.x = _2963;
    out.m_71.y = _2965;
    out.m_71.z = _2967;
    bool _2969 = _2953 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2971 = isnan(_2953);
    bool _2973 = _2969 || _2971;
    bool _2975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2977 = _2973 || _2975;
    if (!_2977)
    {
        _2839 = 1.0;
    }
    float _2979 = _2839;
    bool _2981 = !_2977;
    float _2983 = _2979;
    if (!_2981)
    {
        bool _2985 = _2953 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2987 = isnan(_2953);
        bool _2989 = _2985 || _2987;
        bool _2991 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2993 = _2989 || _2991;
        if (!_2993)
        {
            float _2995 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2997 = _2953 + _2995;
            float _2999 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3001 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2999;
            float _3003 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3005 = _3003 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3007 = 1.0 / _3001;
            float _3009 = _2997 * _3007;
            float _3011 = fma(_3009, _3005, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2983 = _3011;
            _3013 = true;
        }
        else
        {
            bool _3015 = _2953 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3017 = isnan(_2953);
            bool _3019 = _3015 || _3017;
            bool _3021 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3023 = _3019 || _3021;
            if (!_3023)
            {
                float _3025 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3027 = _2953 + _3025;
                float _3029 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3031 = _3029 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3033 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3035 = _3033 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3037 = 1.0 / _3031;
                float _3039 = _3027 * _3037;
                float _3041 = fma(_3039, _3035, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2983 = _3041;
                _3013 = true;
            }
            else
            {
                _2983 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3013 = false;
    float _3043 = _2983;
    float _3045 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3047 = _2909 + _3045;
    float _3049 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3051 = _2915 + _3049;
    float _3053 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3055 = _2917 + _3053;
    float _3057 = fma(_3047, _3043, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3059 = fma(_3051, _3043, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3061 = fma(_3055, _3043, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3065 = _3057 + _3063;
    float _3067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3069 = _3059 + _3067;
    float _3071 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3073 = _3061 + _3071;
    float _3075 = _3065 * _3065;
    float _3077 = fma(_3069, _3069, _3075);
    float _3079 = fma(_3073, _3073, _3077);
    float _3081 = rsqrt(_3079);
    float _3083 = _3081 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3085 = _3069 * _3083;
    float _3087 = _3073 * _3083;
    float _3089 = _3085 * _3085;
    float _3091 = _3087 * _3087;
    float _3093 = _3089 + _3091;
    float _3095 = sqrt(_3093);
    bool _3097 = _3095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3101 = _3095 + _3099;
    float _3103 = _3073;
    float _3105 = _3101;
    float _3107 = _3065;
    float _3109 = _3085;
    if (_3097)
    {
        float _3111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3103 = _3111;
    }
    float _3113 = _3103;
    if (_3097)
    {
        float _3115 = rsqrt(_3093);
        _2925 = _3115;
    }
    float _3117 = _2925;
    float _3119 = _3117;
    if (_3097)
    {
        float _3121 = _3101 * _3113;
        _3105 = _3121;
    }
    float _3123 = _3105;
    if (_3097)
    {
        float _3125 = _3123 * 0.15915493667125701904296875;
        _2841 = _3125;
    }
    float _3127 = _2841;
    float _3129 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3131 = _3081;
    if (_3097)
    {
        float _3133 = _3127 * 6.283185482025146484375;
        float _3135 = sin(_3133);
        _3131 = _3135;
    }
    float _3137 = _3131;
    float _3139 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3141 = precise::max(0.0, _3139);
    float _3143 = _3113;
    float _3145 = _3141;
    if (_3097)
    {
        float _3147 = _3127 * 6.283185482025146484375;
        float _3149 = cos(_3147);
        _3143 = _3149;
    }
    float _3151 = _3143;
    float _3153 = -_3083;
    float _3155 = -_3141;
    float _3157 = fma(_3065, _3153, _3155);
    float _3159 = _3157;
    if (_3097)
    {
        float _3161 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3107 = _3161;
    }
    float _3163 = _3107;
    float _3165 = sqrt(_3079);
    float _3167 = _3163;
    float _3169 = _3137;
    if (_3097)
    {
        float _3171 = fma(_3137, _3163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3167 = _3171;
    }
    float _3173 = _3167;
    float _3175 = _3173;
    if (_3097)
    {
        float _3177 = _3151 + (-1.0);
        _3145 = _3177;
    }
    float _3179 = _3145;
    float _3181 = _3179;
    if (_3097)
    {
        float _3183 = _3117 * _3173;
        _2935 = _3183;
    }
    float _3185 = _2935;
    if (!_3097)
    {
        _3119 = _3087;
    }
    float _3187 = _3119;
    float _3189 = _3187;
    if (_3097)
    {
        float _3191 = _3179 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3169 = _3191;
    }
    float _3193 = _3169;
    if (_3097)
    {
        float _3195 = _3085 * _3185;
        _3109 = _3195;
    }
    float _3197 = _3109;
    if (!_3097)
    {
        _3181 = _3089;
    }
    float _3199 = _3181;
    float _3201 = _3199;
    if (_3097)
    {
        float _3203 = _3087 * _3185;
        _3189 = _3203;
    }
    float _3205 = _3189;
    if (_3097)
    {
        float _3207 = fma(_3157, _3151, _3193);
        _3159 = _3207;
    }
    float _3209 = _3159;
    if (_3097)
    {
        float _3211 = _3197 * _3197;
        _3201 = _3211;
    }
    float _3213 = _3201;
    if (!_3097)
    {
        _3175 = _3091;
    }
    float _3215 = _3175;
    float _3217 = _3215;
    if (_3097)
    {
        float _3219 = _3205 * _3205;
        _3217 = _3219;
    }
    float _3221 = _3217;
    float _3223 = fma(_3209, _3209, _3213);
    float _3225 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3227 = _3223 + _3221;
    float _3229 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3233 = fma(_3165, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3231);
    float _3235 = precise::clamp(_3233, 0.0, 1.0);
    float _3237 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3225);
    float _3239 = rsqrt(_3227);
    float _3241 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3229);
    float _3243 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3245 = -_3235;
    float _3247 = _3245 + 1.0;
    float _3249 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3241);
    float _3251 = _3057 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3253 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3243);
    float _3255 = _3249 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3257 = fma(_3059, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3251);
    float _3259 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3253);
    float _3261 = abs(_3247);
    float _3263 = log2(_3261);
    float _3265 = _3255 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3267 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3257);
    float _3269 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3271 = _3239 * _3197;
    float _3273 = -_3265;
    float _3275 = fma(_3273, _3129, 1.0);
    float _3277 = fma(_3061, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3237);
    float _3279 = _3267 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3281 = _3239 * _3209;
    float _3283 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3285 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3287 = _3239 * _3205;
    float _3289 = _3277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3291 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3283);
    float _3293 = -_3285;
    float _3295 = fma(_3281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3293);
    float _3297 = log2(_3275);
    float _3299 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3301 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3291);
    float _3303 = -_3287;
    float _3305 = fma(_3303, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3295);
    float _3307 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3309 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3311 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3301);
    float _3313 = fma(_3305, -0.5, 0.5);
    float _3315 = exp2(_3299);
    float _3317 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3307);
    float _3319 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3309);
    float _3321 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3317);
    float _3323 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3319);
    float _3325 = 1.0 / _3311;
    float _3327 = fma(_3305, 0.5, 0.5);
    float _3329 = _3281 + 1.0;
    float _3331 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3321);
    float _3333 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3323);
    float _3335 = fma(_3327, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3337 = _3297 * 0.693147182464599609375;
    float _3339 = sqrt(_3313);
    float _3341 = -_3281;
    float _3343 = fma(_3315, _3329, _3341);
    float _3345 = fma(_3327, _3335, -0.212114393711090087890625);
    float _3347 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3349 = fma(_3343, 0.5, 0.5);
    float _3351 = fma(_3327, _3345, 1.570728778839111328125);
    float _3353 = _3331 * _3325;
    float _3355 = _3333 * _3325;
    float _3357 = fma(_3353, 0.5, 0.5);
    float _3359 = fma(_3355, -0.5, 0.5);
    float _3361 = _3339 * 0.636619746685028076171875;
    float3 _8381 = float3(_3357, _3359, _3347);
    float _3363 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8381, float3(0.0), isnan(_8381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8381, float3(0.0), isnan(_8381)), level(0.0)).x;
    float3 _8392 = float3(_3357, _3359, _3347);
    float4 _3365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8392, float3(0.0), isnan(_8392)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8392, float3(0.0), isnan(_8392)), level(0.0)).xyzw;
    float _3367 = _3365.x;
    float _3369 = _3365.y;
    float _3371 = _3365.z;
    float _3373 = _3365.w;
    float _3375 = -_3351;
    float _3377 = fma(_3361, _3375, 1.0);
    float2 _8413 = float2(_3377, _3349);
    float3 _3381 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8413, float2(0.0), isnan(_8413)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8413, float2(0.0), isnan(_8413)), level(0.0)).xyz;
    float _3383 = _3381.x;
    float _3385 = _3381.y;
    float _3387 = _3381.z;
    float _3389 = _3263 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3391 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _2237;
    out.m_73.y = _2781;
    out.m_73.z = _2249;
    float _3393 = fma(_3279, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3391);
    float _3395 = exp2(_3389);
    out.m_75.x = _3059;
    out.m_75.y = _3057;
    out.m_75.z = _3061;
    float _3397 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3393);
    float _3399 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3401 = fma(_3289, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3397);
    out.m_49.x = 1.0;
    float _3403 = _3401 + _3311;
    out.gl_Position.x = _3331;
    out.gl_Position.y = _3333;
    out.gl_Position.z = _3401;
    out.gl_Position.w = _3311;
    float _3405 = _3403 * 0.5;
    float _3407 = -_3395;
    float _3409 = _3407 + 1.0;
    out.m_77.w = _3399;
    float _3411 = _3409 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _3405;
    out.m_79.w = _3311;
    float _3413 = _3411 * _3363;
    float _3415 = -_3411;
    float _3417 = _3415 + 1.0;
    float _3419 = _3373 * _3413;
    float _3421 = _3373 * _3417;
    float _3423 = _3387 * _3413;
    float _3425 = fma(_3383, _3419, _3367);
    float _3427 = fma(_3385, _3419, _3369);
    float _3429 = fma(_3373, _3423, _3371);
    out.m_81.x = _3425;
    out.m_81.y = _3427;
    out.m_81.z = _3429;
    out.m_81.w = _3421;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

