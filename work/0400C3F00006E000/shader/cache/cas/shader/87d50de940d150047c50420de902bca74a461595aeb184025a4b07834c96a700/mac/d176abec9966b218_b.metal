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
int _98(thread const int& _9239, thread const int& _9240, constant _10& support_buffer)
{
    float _9243 = as_type<float>(support_buffer._m4);
    int _9245 = _9240 + as_type<int>(_9243);
    int _9247 = 1 + _9245;
    float _9249 = support_buffer._m5[_9247].x;
    float _9251 = abs(_9249);
    bool _9253 = _9251 == 1.0;
    if (_9253)
    {
        return _9239;
    }
    float _9255 = float(_9239);
    float _9257 = _9255 / _9251;
    int _9259 = int(_9257);
    return _9259;
}

static inline __attribute__((always_inline))
int _99(thread const int& _9289, thread const int& _9290, constant _10& support_buffer)
{
    float _9293 = as_type<float>(support_buffer._m4);
    int _9295 = _9290 + as_type<int>(_9293);
    int _9297 = 1 + _9295;
    float _9299 = support_buffer._m5[_9297].x;
    bool _9301 = _9299 == 1.0;
    if (_9301)
    {
        return _9289;
    }
    float _9303 = float(_9289);
    float _9305 = _9303 * _9299;
    int _9307 = int(_9305);
    return _9307;
}

static inline __attribute__((always_inline))
void _96(thread const int& _8945, thread const int& _8946, thread const int& _8947, thread const int& _8948, thread int& _8949, thread int& _8950, thread int& _8951, thread int& _8952, thread int& _8953, thread int& _8954, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8957 = _8946;
    int _8959 = _8947;
    float _8961 = 0.0 + as_type<float>(_8945);
    bool _8963 = _8961 != 0.0;
    bool _8965 = isnan(_8961);
    bool _8967 = _8963 || _8965;
    bool _8969 = isnan(0.0);
    bool _8971 = _8967 || _8969;
    int _8973 = _8971 ? (-1) : 0;
    if (!_8971)
    {
        float _8975 = as_type<float>(_8945) * 1.0;
        _8957 = as_type<int>(_8975);
    }
    int _8977 = _8957;
    bool _8979 = !_8971;
    int _8981 = _8977;
    int _8983 = _8977;
    if (!_8979)
    {
        bool _8985 = _8961 >= 0.0;
        bool _8987 = isnan(_8961);
        bool _8989 = _8985 || _8987;
        bool _8991 = isnan(0.0);
        bool _8993 = _8989 || _8991;
        _8973 = _8993 ? (-1) : 0;
        if (!_8993)
        {
            _8981 = 2147483647;
        }
        int _8995 = _8981;
        bool _8997 = !_8993;
        int _8999 = _8995;
        _8983 = _8995;
        if (!_8997)
        {
            float _9001 = abs(as_type<float>(_8945));
            float _9003 = 0.0 + _9001;
            bool _9005 = _9003 > as_type<float>(0x7f800000u /* inf */);
            bool _9007 = isnan(_9003);
            bool _9009 = _9005 || _9007;
            bool _9011 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _9013 = _9009 || _9011;
            _8973 = _9013 ? (-1) : 0;
            if (_9013)
            {
                float _9015 = as_type<float>(_8945) + 1.0;
                _8999 = as_type<int>(_9015);
            }
            int _9017 = _8999;
            int _9019 = _9017;
            _8983 = _9017;
            if (!_9013)
            {
                bool _9021 = _9003 != as_type<float>(0x7f800000u /* inf */);
                bool _9023 = isnan(_9003);
                bool _9025 = _9021 || _9023;
                bool _9027 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _9029 = _9025 || _9027;
                _8973 = _9029 ? (-1) : 0;
                if (!_9029)
                {
                    _9019 = _8945;
                }
                int _9031 = _9019;
                bool _9033 = !_9029;
                _8983 = _9031;
                if (!_9033)
                {
                    float _9035 = as_type<float>(_8945) * 18446744073709551616.0;
                    float _9037 = rsqrt(_9035);
                    float _9039 = _9035 * _9037;
                    float _9041 = _9037 * 0.5;
                    float _9043 = -_9039;
                    float _9045 = 0.0 + _9043;
                    float _9047 = fma(_9041, _9045, 0.5);
                    float _9049 = fma(_9039, _9047, _9039);
                    float _9051 = -_9049;
                    float _9053 = 0.0 + _9051;
                    float _9055 = fma(_9049, _9053, _9035);
                    float _9057 = fma(_9041, _9055, _9049);
                    float _9059 = _9057 * 2.3283064365386962890625e-10;
                    _8983 = as_type<int>(_9059);
                    _8959 = as_type<int>(_9045);
                }
            }
        }
    }
    int _9061 = _8983;
    int _9063 = _8959;
    int _9065 = _8973;
    _8949 = _9061;
    _8950 = _9061;
    _8951 = _8948;
    _8952 = 0;
    _8953 = _9063;
    _8954 = _9065;
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
    bool _3127 = false;
    bool _2307 = false;
    bool _2117 = false;
    bool _1555 = false;
    bool _1235 = false;
    bool _1105 = false;
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
        float _3606 = as_type<float>(_123);
        out.gl_Position.z = _3606;
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
        float _3678 = as_type<float>(_165);
        out.gl_Position.z = _3678;
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
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _647 = _643 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _651 = _643 + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _655 = _643 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _673 = 1.0 / _659;
    bool _675 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _677 = isnan(_643);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = 1.0 / _663;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _691 = _643 + _689;
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _695 = 1.0 / _671;
    float _697 = _651 * _673;
    float _699 = 1.0 / _667;
    float _701 = _647 * _687;
    bool _703 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _705 = isnan(_643);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _715;
    float _719 = fma(_717, _697, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _721 = _691 * _695;
    bool _723 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _725 = isnan(_643);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    bool _735 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _737 = isnan(_643);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -_733;
    float _749 = _747 + 1.0;
    float _751 = _655 * _699;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _757;
    float _761 = _745 * _749;
    float _763 = -_745;
    float _765 = _763 + 1.0;
    float _767 = fma(_755, _697, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _769 = fma(_759, _697, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _771 = -_713;
    float _773 = _771 + 1.0;
    float _775 = _713 * _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _781 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _783 = isnan(_643);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = _685 * _773;
    float _795 = -_685;
    float _797 = _795 + 1.0;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = fma(_779, _701, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _809 = _791 * _797;
    float _811 = -_791;
    float _813 = _811 + 1.0;
    float _815 = fma(_801, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _817 = fma(_805, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _819 = _719 * _809;
    float _821 = _767 * _809;
    float _823 = _769 * _809;
    float _825 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].x, _819);
    float _827 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].y, _821);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _829;
    float _833 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].z, _823);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _839;
    float _843 = fma(_831, _751, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _845 = fma(_815, _793, _825);
    float _847 = fma(_807, _793, _833);
    float _849 = fma(_817, _793, _827);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _859 = fma(_837, _751, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _861 = fma(_841, _751, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _867 = fma(_843, _775, _845);
    float _869 = fma(_853, _721, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _871 = fma(_857, _721, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _873 = fma(_865, _721, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _875 = fma(_859, _775, _849);
    float _877 = fma(_861, _775, _847);
    float _879 = fma(_869, _761, _867);
    float _881 = fma(_871, _761, _875);
    float _883 = fma(_873, _761, _877);
    float _885 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[147].x, _879);
    float _887 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[147].y, _881);
    float _889 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[147].z, _883);
    bool _891 = !_693;
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
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _923 = _919 + _921;
    bool _925 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _927 = isnan(_919);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _939 = _919 + _937;
    bool _941 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _943 = isnan(_919);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _949 = _945 || _947;
    float _951 = float(_949);
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _961 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _963 = isnan(_919);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = -_935;
    float _975 = _973 + 1.0;
    float _977 = 1.0 / _955;
    float _979 = _971 * _975;
    float _981 = -_971;
    float _983 = _981 + 1.0;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _985;
    float _989 = 1.0 / _959;
    float _991 = _951 * _983;
    float _993 = -_951;
    float _995 = _993 + 1.0;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _999 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1001 = _923 * _977;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1007;
    float _1011 = fma(_987, _1001, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1013 = fma(_1005, _1001, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1015 = fma(_1009, _1001, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1017 = _939 * _989;
    float _1019 = _1011 * _991;
    float _1021 = _1013 * _991;
    float _1023 = _1015 * _991;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1037 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1019);
    float _1039 = fma(_1027, _1017, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1041 = fma(_1031, _1017, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1043 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1021);
    float _1045 = fma(_1035, _1017, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1047 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1023);
    float _1049 = fma(_1039, _979, _1037);
    float _1051 = fma(_1041, _979, _1043);
    float _1053 = fma(_1045, _979, _1047);
    float _1055 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1049);
    float _1057 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1051);
    float _1059 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1053);
    float _1061 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1063 = _1057 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1065 = in.m_53.x;
    float _1067 = in.m_53.y;
    float _1069 = in.m_53.z;
    float _1071 = _1059 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1073 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1075 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1073;
    out.m_57.y = _1075;
    out.m_57.z = _1077;
    out.m_57.w = _997;
    float _1079 = _889 * _1069;
    float _1081 = _887 * _1067;
    float _1083 = _885 * _1065;
    bool _1085 = !_999;
    float _1103;
    if (!_1085)
    {
        float _1087 = in.m_55.x;
        float _1089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1091 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _1095 = _1093 * _1089;
        float _1097 = floor(_1095);
        float _1099 = -_1097;
        float _1101 = _1095 + _1099;
        _1103 = _1101;
        _1105 = true;
    }
    else
    {
        float _1107 = float(_107);
        float _1109 = 1.0 / _1107;
        float _1111 = _141 * _1109;
        _1103 = _1111;
    }
    _1105 = false;
    float _1113 = _1103;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1117 = _1113 + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1123 = _1113 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1125 = isnan(_1113);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1139 = _1113 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1141 = isnan(_1113);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1151;
    bool _1155 = _1113 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1157 = isnan(_1113);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = 1.0 / _1121;
    float _1169 = -_1133;
    float _1171 = _1169 + 1.0;
    bool _1173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1175 = 1.0 / _1137;
    float _1177 = _1153 * _1167;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1183 = -_1165;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_1177, _1117, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1189 = _1149 * _1171;
    float _1191 = -_1149;
    float _1193 = _1191 + 1.0;
    float _1195 = _1133 * _1185;
    float _1197 = _1181 * _1175;
    float _1199 = _1187 * _1189;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1203 = _1113 + _1201;
    float _1205 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1199);
    float _1207 = fma(_1197, _1203, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1209 = fma(_1207, _1195, _1205);
    float _1211 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1209);
    float _1213 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1213;
    bool _1215 = !_1173;
    float _1233;
    if (!_1215)
    {
        float _1217 = in.m_55.x;
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1221 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _1225 = _1223 * _1219;
        float _1227 = floor(_1225);
        float _1229 = -_1227;
        float _1231 = _1225 + _1229;
        _1233 = _1231;
        _1235 = true;
    }
    else
    {
        float _1237 = float(_107);
        float _1239 = 1.0 / _1237;
        float _1241 = _141 * _1239;
        _1233 = _1241;
    }
    _1235 = false;
    float _1243 = _1233;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1247 = _1243 + _1245;
    bool _1249 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1251 = isnan(_1243);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1265 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1267 = isnan(_1243);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1277;
    bool _1281 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1283 = isnan(_1243);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = -_1259;
    float _1295 = _1293 + 1.0;
    float _1297 = 1.0 / _1263;
    bool _1299 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1301 = isnan(_1243);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    float _1311 = -_1291;
    float _1313 = _1311 + 1.0;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1321 = 1.0 / _1317;
    float _1323 = _1279 * _1297;
    float _1325 = -_1275;
    float _1327 = _1325 + 1.0;
    float _1329 = _1275 * _1295;
    bool _1331 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1333 = isnan(_1243);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = fma(_1323, _1247, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1345 = _1291 * _1327;
    float _1347 = _1309 * _1313;
    float _1349 = -_1309;
    float _1351 = _1349 + 1.0;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1357 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1359 = isnan(_1243);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1365 = _1361 || _1363;
    float _1367 = float(_1365);
    float _1369 = _1341 * _1351;
    float _1371 = -_1341;
    float _1373 = _1371 + 1.0;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1379 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1381 = isnan(_1243);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = 1.0 / _1355;
    float _1393 = _1367 * _1373;
    float _1395 = -_1367;
    float _1397 = _1395 + 1.0;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1403 = _1389 * _1397;
    float _1405 = 1.0 / _1377;
    float _1407 = _1401 * _1321;
    float _1409 = -_1389;
    float _1411 = _1409 + 1.0;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1417;
    float _1421 = 1.0 / _1415;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1425 = _1423 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1427 = _1343 * _1403;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1431 = _1243 + _1429;
    float _1433 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1427);
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1439 = 1.0 / _1425;
    float _1441 = _1419 * _1405;
    float _1443 = fma(_1407, _1431, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1447 = _1243 + _1445;
    float _1449 = fma(_1443, _1393, _1433);
    float _1451 = fma(_1441, _1447, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1453 = 1.0 / _1437;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1465 = _1243 + _1463;
    float _1467 = _1457 * _1391;
    float _1469 = fma(_1451, _1369, _1449);
    float _1471 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1473 = _1471 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1475 = _1461 * _1439;
    float _1477 = fma(_1467, _1465, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1481 = _1243 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1483;
    bool _1487 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1489 = isnan(_1243);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = _1473 * _1421;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1503 = _1243 + _1501;
    float _1505 = fma(_1475, _1481, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1507 = fma(_1477, _1347, _1469);
    float _1509 = _1485 * _1453;
    float _1511 = fma(_1499, _1503, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1513 = -_1497;
    float _1515 = _1513 + 1.0;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1519 = _1243 + _1517;
    float _1521 = fma(_1505, _1345, _1507);
    float _1523 = _1259 * _1515;
    float _1525 = fma(_1509, _1519, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1527 = fma(_1511, _1329, _1521);
    float _1529 = fma(_1525, _1523, _1527);
    float _1531 = fma(_1497, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1529);
    float _1533 = precise::clamp(_1531, 0.0, 1.0);
    bool _1535 = !_1319;
    float _1553;
    if (!_1535)
    {
        float _1537 = in.m_55.x;
        float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1541 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[14].z, _141);
        float _1545 = _1543 * _1539;
        float _1547 = floor(_1545);
        float _1549 = -_1547;
        float _1551 = _1545 + _1549;
        _1553 = _1551;
        _1555 = true;
    }
    else
    {
        float _1557 = float(_107);
        float _1559 = 1.0 / _1557;
        float _1561 = _141 * _1559;
        _1553 = _1561;
    }
    _1555 = false;
    float _1563 = _1553;
    int _1565 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1567 = _1565;
    int _1569 = 0;
    int _1571 = _98(_1567, _1569, (*spvDescriptorSet0.support_buffer));
    float _1573 = in.m_61.z;
    float _1575 = trunc(_1573);
    int _1577 = int(_1575);
    int _1579 = _1571 + (-1);
    float _1581 = float(_1579);
    float _1583 = _1533 * _1581;
    float _1585 = trunc(_1583);
    int _1587 = int(_1585);
    int _1589 = _1587;
    int _1591 = 0;
    int _1593 = _99(_1589, _1591, (*spvDescriptorSet0.support_buffer));
    int _1595 = _1577;
    int _1597 = 0;
    int _1599 = _99(_1595, _1597, (*spvDescriptorSet0.support_buffer));
    float4 _1602 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1593, _1599)), 0).xyzw;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = _1602.w;
    float _1612 = in.m_55.w;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1616 = _1614 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1622 = 1.0 / _1616;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1634 = _1632 != 0;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1638 = _1636 != 0;
    float _1640 = 1.0 / _1620;
    bool _1642 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1644 = isnan(_1563);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1660 = _1658 != 0;
    float _1662 = -_1652;
    float _1664 = _1662 + 1.0;
    bool _1666 = _1612 > 0.5;
    bool _1668 = _1666 && _1634;
    float _1670 = 1.0 / _1626;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1672;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1680 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1682 = isnan(_1563);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    float _1692 = _1674 * _1622;
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1694;
    float _1698 = 1.0 / _1630;
    bool _1700 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1702 = isnan(_1563);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1708 = _1704 || _1706;
    float _1710 = float(_1708);
    float _1712 = _1678 * _1640;
    float _1714 = _1690 * _1664;
    float _1716 = -_1690;
    float _1718 = _1716 + 1.0;
    bool _1720 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1722 = isnan(_1563);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = -_1710;
    float _1734 = _1732 + 1.0;
    float _1736 = _1696 * _1670;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1740 = _1738 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    bool _1742 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1744 = isnan(_1563);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = _1710 * _1718;
    float _1756 = _1730 * _1734;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1760 = _1758 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1762 = -_1730;
    float _1764 = _1762 + 1.0;
    bool _1766 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1768 = isnan(_1563);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    float _1778 = _1740 * _1698;
    float _1780 = -_1752;
    float _1782 = _1780 + 1.0;
    float _1784 = _1752 * _1764;
    bool _1786 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1788 = isnan(_1563);
    bool _1790 = _1786 || _1788;
    bool _1792 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1794 = _1790 || _1792;
    float _1796 = float(_1794);
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1800 = _1563 + _1798;
    float _1802 = _1776 * _1782;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1806 = _1804 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1808 = -_1776;
    float _1810 = _1808 + 1.0;
    float _1812 = 1.0 / _1760;
    float _1814 = fma(_1692, _1800, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1816 = _1796 * _1810;
    float _1818 = _1814 * _1816;
    float _1820 = 1.0 / _1806;
    float _1822 = -_1796;
    float _1824 = _1822 + 1.0;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1828 = _1563 + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1832 = _1830 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1834;
    float _1838 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1818);
    float _1840 = fma(_1712, _1828, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1846 = _1836 * _1812;
    float _1848 = in.m_61.x;
    float _1850 = 1.0 / _1832;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1854 = _1563 + _1852;
    float _1856 = fma(_1840, _1802, _1838);
    float _1858 = in.m_55.y;
    float _1860 = fma(_1736, _1854, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1862 = _1844 * _1820;
    float _1864 = in.m_61.y;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1868 = _1563 + _1866;
    int _1870 = as_type<int>(_1802);
    float _1872 = _1652;
    float _1874 = _1754;
    int _1876 = as_type<int>(_1563);
    if (_1638)
    {
        float _1878 = in.m_55.x;
        _1870 = as_type<int>(_1878);
    }
    int _1880 = _1870;
    float _1882 = fma(_1778, _1868, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1884;
    float _1888 = fma(_1860, _1784, _1856);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1892 = _1563 + _1890;
    bool _1894 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1896 = isnan(_1563);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = _1886 * _1850;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1910 = _1563 + _1908;
    float _1912 = fma(_1846, _1892, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1914 = fma(_1882, _1756, _1888);
    float _1916 = -_1904;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1862, _1910, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1924 = _1563 + _1922;
    float _1926 = fma(_1912, _1754, _1914);
    float _1928 = _1652 * _1918;
    int _1930 = as_type<int>(_1926);
    if (!_1638)
    {
        _1872 = _1848;
    }
    float _1932 = _1872;
    float _1934 = _1824;
    float _1936 = _1932;
    if (_1656)
    {
        float _1938 = in.m_55.z;
        _1934 = _1938;
    }
    float _1940 = _1934;
    float _1942 = fma(_1920, _1714, _1926);
    float _1944 = fma(_1906, _1924, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1946 = -_1864;
    float _1948 = _1946 + 1.0;
    if (!_1638)
    {
        _1874 = _1932;
    }
    float _1950 = _1874;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1954 = _1950;
    if (_1638)
    {
        _1936 = _1848;
    }
    float _1956 = _1936;
    float _1958 = fma(_1944, _1928, _1942);
    float _1960 = _1668 ? _1948 : _1864;
    bool _1962 = false;
    float _1964 = _1956;
    int _1966 = _1880;
    if (_1638)
    {
        bool _1968 = as_type<float>(_1880) > 0.5;
        _1962 = _1968;
    }
    bool _1970 = _1962;
    if (_1638)
    {
        float _1972 = -_1956;
        float _1974 = _1972 + 1.0;
        _1876 = as_type<int>(_1974);
    }
    int _1976 = _1876;
    bool _1978 = _1858 > 0.5;
    bool _1980 = _1978 && _1660;
    if (_1656)
    {
        float _1982 = -_1956;
        float _1984 = _1982 + 1.0;
        _1930 = as_type<int>(_1984);
    }
    int _1986 = _1930;
    float _1988 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1958);
    float _1990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1638)
    {
        float _1992 = _1970 ? as_type<float>(_1976) : _1956;
        _1954 = _1992;
    }
    float _1994 = _1954;
    float _1996 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1998 = _1587 + 1;
    out.m_63.x = _1988;
    float _2000 = _1980 ? _1948 : _1864;
    int _2002 = min(_1579, _1998);
    bool _2004 = false;
    if (_1656)
    {
        bool _2006 = _1940 > 0.5;
        _2004 = _2006;
    }
    bool _2008 = _2004;
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1656)
    {
        float _2014 = _2008 ? as_type<float>(_1986) : _1956;
        _1964 = _2014;
    }
    float _2016 = _1964;
    float _2018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2020 = _2012 * _2010;
    float _2022 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2024 = _1996 * _1990;
    float _2026 = _2022 * _2018;
    uint _2029 = as_type<uint>(half2(float2(_1610, 0.0)));
    uint _2031 = extract_bits(_2029, 0u, 8u);
    int _2033 = int(_2031) & 255;
    uint _2035 = extract_bits(_2029, 8u, 8u);
    int _2037 = int(_2035) & 255;
    int _2039 = _2037 << 8;
    int _2041 = _2033 | _2039;
    bool _2043 = _2041 >= 32768;
    int _2045 = _2041 + (-1024);
    int _2047 = _2045;
    if (_2043)
    {
        int _2049 = ~_2041;
        int _2051 = _2049 + 33792;
        int _2053 = _2051 + 1;
        _2047 = _2053;
    }
    int _2055 = _2047;
    int _2057 = _2055 + 30719;
    float _2059 = float(_2057);
    float _2061 = fma(_2059, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2063 = abs(_2061);
    float _2065 = -_2063;
    float _2067 = _2065 + 1.0;
    bool _2069 = _2061 < 0.0;
    float _2071 = float(_2069);
    float _2073 = abs(_2061);
    float _2075 = fma(_2073, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2077 = as_type<int>(_2067) + (-218103808);
    float _2079 = abs(_2061);
    float _2081 = fma(_2079, _2075, -0.212114393711090087890625);
    bool _2083 = uint(_2077) >= 1920991232u;
    float _2085 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2087 = _2085 * _1952;
    float _2089 = abs(_2061);
    float _2091 = fma(_2089, _2081, 1.570728778839111328125);
    bool _2093 = !_2083;
    float _2115;
    if (!_2093)
    {
        int _2095 = as_type<int>(_2067);
        int _2097 = as_type<int>(_2018);
        int _2099 = _1880;
        int _2101 = 10608;
        int _2103;
        int _2105;
        int _2107;
        int _2109;
        int _2111;
        int _2113;
        _96(_2095, _2097, _2099, _2101, _2103, _2105, _2107, _2109, _2111, _2113, out.gl_Position, out.gl_PointSize);
        _2115 = as_type<float>(_2103);
        _1966 = _2111;
        _2117 = true;
    }
    else
    {
        float _2119 = rsqrt(_2067);
        float _2121 = _2067 * _2119;
        float _2123 = _2119 * 0.5;
        float _2125 = -_2121;
        float _2127 = 0.0 + _2125;
        float _2129 = fma(_2123, _2127, 0.5);
        float _2131 = fma(_2121, _2129, _2121);
        float _2133 = -_2131;
        float _2135 = 0.0 + _2133;
        float _2137 = fma(_2131, _2135, _2067);
        float _2139 = fma(_2123, _2137, _2131);
        _2115 = _2139;
    }
    _2117 = false;
    float _2141 = _2115;
    int _2143 = _1966;
    int _2145 = _2002;
    int _2147 = 0;
    int _2149 = _99(_2145, _2147, (*spvDescriptorSet0.support_buffer));
    int _2151 = _1577;
    int _2153 = 0;
    int _2155 = _99(_2151, _2153, (*spvDescriptorSet0.support_buffer));
    float4 _2157 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2149, _2155)), 0).xyzw;
    float _2159 = _2157.x;
    float _2161 = _2157.y;
    float _2163 = _2157.z;
    float _2165 = _2157.w;
    float _2167 = _2059 * 3.883221149444580078125;
    float _2169 = floor(_1583);
    float _2171 = _2091 * _2141;
    float _2173 = _2071 * 2.0;
    float _2175 = _2167 * 0.15915493667125701904296875;
    float _2177 = -_2173;
    float _2179 = fma(_2171, _2177, _2171);
    float _2181 = _2175 * 6.283185482025146484375;
    float _2183 = cos(_2181);
    float _2185 = fma(_2071, 3.1415927410125732421875, _2179);
    float _2187 = _2185 * 0.15915493667125701904296875;
    float _2189 = -_2169;
    float _2191 = _1583 + _2189;
    float _2193 = _2175 * 6.283185482025146484375;
    float _2195 = sin(_2193);
    float _2197 = _2187 * 6.283185482025146484375;
    float _2199 = sin(_2197);
    uint _2201 = as_type<uint>(half2(float2(_2165, 0.0)));
    float _2203 = _2199 * _2183;
    float _2205 = -_1604;
    float _2207 = _2205 + _2159;
    float _2209 = _2199 * _2195;
    uint _2211 = extract_bits(_2201, 0u, 8u);
    int _2213 = int(_2211) & 255;
    uint _2215 = extract_bits(_2201, 8u, 8u);
    int _2217 = int(_2215) & 255;
    int _2219 = _2217 << 8;
    int _2221 = _2213 | _2219;
    float _2223 = fma(_2191, _2207, _1604);
    bool _2225 = _2221 >= 32768;
    int _2227 = _2221 + (-1024);
    int _2229 = _2227;
    if (_2225)
    {
        int _2231 = ~_2221;
        int _2233 = _2231 + 33792;
        int _2235 = _2233 + 1;
        _2229 = _2235;
    }
    int _2237 = _2229;
    int _2239 = _2237 + 30719;
    float _2241 = float(_2239);
    float _2243 = -_1606;
    float _2245 = _2243 + _2161;
    float _2247 = fma(_2241, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2249 = fma(_2191, _2245, _1606);
    float _2251 = abs(_2247);
    float _2253 = -_2251;
    float _2255 = _2253 + 1.0;
    float _2257 = abs(_2247);
    float _2259 = fma(_2257, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2261 = _2247 < 0.0;
    float _2263 = float(_2261);
    int _2265 = as_type<int>(_2255) + (-218103808);
    float _2267 = abs(_2247);
    float _2269 = fma(_2267, _2259, -0.212114393711090087890625);
    bool _2271 = uint(_2265) >= 1920991232u;
    float _2273 = -_1608;
    float _2275 = _2273 + _2163;
    float _2277 = abs(_2247);
    float _2279 = fma(_2277, _2269, 1.570728778839111328125);
    float _2281 = fma(_2191, _2275, _1608);
    bool _2283 = !_2271;
    float _2305;
    if (!_2283)
    {
        int _2285 = as_type<int>(_2255);
        int _2287 = as_type<int>(_2169);
        int _2289 = _2143;
        int _2291 = 11488;
        int _2293;
        int _2295;
        int _2297;
        int _2299;
        int _2301;
        int _2303;
        _96(_2285, _2287, _2289, _2291, _2293, _2295, _2297, _2299, _2301, _2303, out.gl_Position, out.gl_PointSize);
        _2305 = as_type<float>(_2293);
        _2307 = true;
    }
    else
    {
        float _2309 = rsqrt(_2255);
        float _2311 = _2255 * _2309;
        float _2313 = _2309 * 0.5;
        float _2315 = -_2311;
        float _2317 = 0.0 + _2315;
        float _2319 = fma(_2313, _2317, 0.5);
        float _2321 = fma(_2311, _2319, _2311);
        float _2323 = -_2321;
        float _2325 = 0.0 + _2323;
        float _2327 = fma(_2321, _2325, _2255);
        float _2329 = fma(_2313, _2327, _2321);
        _2305 = _2329;
    }
    _2307 = false;
    float _2331 = _2305;
    float _2333 = in.m_55.x;
    float _2335 = in.m_55.y;
    float _2337 = in.m_55.z;
    float _2339 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2341 = log2(_2339);
    float _2343 = _607 * _607;
    float _2345 = _2279 * _2331;
    float _2347 = fma(_609, _609, _2343);
    int _2349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2351 = _2349 != 0;
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2355 = _2353 != 0;
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2359 = _2357 != 0;
    float _2361 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2363 = fma(_611, _611, _2347);
    float _2365 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2367 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2369 = rsqrt(_2363);
    float _2371 = _2341 * _141;
    float _2373 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2367);
    float _2375 = _2337 * 2.0;
    float _2377 = _2333 * 2.0;
    float _2379 = _2333 + _2337;
    float _2381 = exp2(_2371);
    float _2383 = _2335 * 2.0;
    float _2385 = _2379 + (-1.0);
    float _2387 = _2369 * _609;
    float _2389 = _2369 * _607;
    float _2391 = fma(_2385, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2393 = floor(_2375);
    float _2395 = _2335 + _2333;
    float _2397 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2399 = _2387 * _2397;
    float _2401 = _2395 + (-1.0);
    float _2403 = floor(_2377);
    bool _2405 = _2393 > 0.0;
    float _2407 = floor(_2383);
    bool _2409 = _2393 >= 0.0;
    bool _2411 = isnan(_2393);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan(0.0);
    bool _2417 = _2413 || _2415;
    int _2419 = _2417 ? 0 : 1;
    bool _2421 = _2403 > 0.0;
    float _2423 = fma(_2401, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2425 = _2403 >= 0.0;
    bool _2427 = isnan(_2403);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2437 = 1.0 + _2435;
    bool _2439 = !_2351;
    int _2441 = _2439 ? 0 : 1;
    int _2443 = ~_2419;
    int _2445 = _2443 + 1;
    int _2447 = _2445 + 1;
    float _2449 = 1.0 / _2437;
    int _2451 = _2447;
    if (!_2405)
    {
        int _2453 = ~_2419;
        int _2455 = _2453 + 1;
        _2451 = _2455;
    }
    int _2457 = _2451;
    float _2459 = _2369 * _611;
    int _2461 = abs(_2441);
    float _2463 = -_2381;
    float _2465 = _2463 + 1.0;
    bool _2467 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2469 = isnan(1.0);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2475 = _2471 || _2473;
    int _2477 = _2433 ? 0 : 1;
    float _2479 = in.m_65.x;
    float _2481 = in.m_65.y;
    float _2483 = in.m_65.z;
    bool _2485 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2487 = isnan(0.0);
    bool _2489 = _2485 || _2487;
    bool _2491 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2493 = _2489 || _2491;
    bool _2495 = _2407 > 0.0;
    float _2497 = _2493 ? _2465 : 0.0;
    bool _2499 = _2407 >= 0.0;
    bool _2501 = isnan(_2407);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan(0.0);
    bool _2507 = _2503 || _2505;
    float _2509 = float(_2461);
    if (_2475)
    {
        float _2511 = _2497 * _2449;
        _147 = _2511;
    }
    float _2513 = _147;
    float _2515 = float(_2457);
    float _2517 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2519 = _2459 * _2517;
    int _2521 = _2507 ? 0 : 1;
    bool _2523 = !_2359;
    int _2525 = _2523 ? 0 : 1;
    float _2527 = _2509 * _2515;
    int _2529 = ~_2521;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    float _2535 = _2333 + (-0.5);
    int _2537 = _2533;
    if (!_2495)
    {
        int _2539 = ~_2521;
        int _2541 = _2539 + 1;
        _2537 = _2541;
    }
    int _2543 = _2537;
    float _2545 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2547 = -_2519;
    float _2549 = fma(_2387, _2545, _2547);
    int _2551 = abs(_2525);
    float _2553 = _2527 * (-2.0);
    float _2555 = float(_2543);
    float _2557 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2559 = _2389 * _2557;
    float _2561 = float(_2551);
    float _2563 = fma(_2553, _2479, _2479);
    int _2565 = ~_2477;
    int _2567 = _2565 + 1;
    int _2569 = _2567 + 1;
    float _2571 = fma(_2423, _2553, _2423);
    int _2573 = _2569;
    if (!_2421)
    {
        int _2575 = ~_2477;
        int _2577 = _2575 + 1;
        _2573 = _2577;
    }
    int _2579 = _2573;
    float _2581 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2563);
    bool _2583 = !_2355;
    int _2585 = _2583 ? 0 : 1;
    float _2587 = _2561 * _2555;
    float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2591 = -_2559;
    float _2593 = fma(_2459, _2589, _2591);
    float _2595 = fma(_2571, _2513, _2581);
    int _2597 = abs(_2585);
    float _2599 = _2587 * (-2.0);
    float _2601 = _2337 + (-0.5);
    float _2603 = _2595 * 0.15915493667125701904296875;
    float _2605 = float(_2597);
    float _2607 = fma(_2599, _2483, _2483);
    float _2609 = float(_2579);
    float _2611 = fma(_2391, _2599, _2391);
    float _2613 = _2549 * _2549;
    float _2615 = fma(_2601, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2607);
    float _2617 = _2335 + _2337;
    float _2619 = _2605 * _2609;
    float _2621 = _2335 + (-0.5);
    float _2623 = _2617 + (-1.0);
    float _2625 = _2619 * (-2.0);
    float _2627 = fma(_2611, _2513, _2615);
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2631 = -_2399;
    float _2633 = fma(_2389, _2629, _2631);
    float _2635 = fma(_2623, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2637 = fma(_2625, _2481, _2481);
    float _2639 = fma(_2593, _2593, _2613);
    float _2641 = _2627 * 0.15915493667125701904296875;
    float _2643 = fma(_2635, _2625, _2635);
    float _2645 = fma(_2621, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2637);
    float _2647 = fma(_2633, _2633, _2639);
    float _2649 = _2603 * 6.283185482025146484375;
    float _2651 = sin(_2649);
    float _2653 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2655 = fma(_2643, _2513, _2645);
    float _2657 = _2263 * 2.0;
    float _2659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2249);
    float _2661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2223);
    float _2663 = _2655 * 0.15915493667125701904296875;
    float _2665 = -_2657;
    float _2667 = fma(_2345, _2665, _2345);
    float _2669 = _2603 * 6.283185482025146484375;
    float _2671 = cos(_2669);
    float _2673 = _2365 * _2659;
    float _2675 = _2653 * _2661;
    float _2677 = fma(_2263, 3.1415927410125732421875, _2667);
    float _2679 = _2241 * 3.883221149444580078125;
    float _2681 = -_2061;
    float _2683 = _2681 + _2247;
    bool _2685 = _2249 != 0.0;
    bool _2687 = isnan(_2249);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    float _2695 = _2641 * 6.283185482025146484375;
    float _2697 = sin(_2695);
    float _2699 = _2679 * 0.15915493667125701904296875;
    float _2701 = fma(_2191, _2683, _2061);
    bool _2703 = _2223 == 0.0;
    bool _2705 = !_2693;
    bool _2707 = _2703 && _2705;
    float _2709 = fma(_2249, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2701);
    bool _2711 = _2281 == 0.0;
    bool _2713 = _2711 && _2707;
    float _2715 = _2641 * 6.283185482025146484375;
    float _2717 = cos(_2715);
    float _2719 = _2663 * 6.283185482025146484375;
    float _2721 = sin(_2719);
    float _2723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2281);
    float _2725 = _2671 * _2697;
    float _2727 = _2361 * _2723;
    float _2729 = _2651 * _2697;
    float _2731 = rsqrt(_2647);
    float _2733 = _2651 * _2717;
    float _2735 = _2663 * 6.283185482025146484375;
    float _2737 = cos(_2735);
    float _2739 = -_2725;
    float _2741 = fma(_2721, _2733, _2739);
    float _2743 = -_2733;
    float _2745 = fma(_2721, _2725, _2743);
    float _2747 = _2745 * _2387;
    float _2749 = _2745 * _2459;
    float _2751 = _2633 * _2731;
    float _2753 = _2671 * _2717;
    float _2755 = _2593 * _2731;
    float _2757 = _2549 * _2731;
    float _2759 = _2389 * _2751;
    float _2761 = fma(_2721, _2729, _2753);
    float _2763 = fma(_2721, _2753, _2729);
    float _2765 = _2737 * _2697;
    float _2767 = _2737 * _2717;
    float _2769 = _2651 * _2737;
    float _2771 = _2671 * _2737;
    float _2773 = _2761 * _2387;
    float _2775 = _2765 * _2387;
    float _2777 = -_2759;
    float _2779 = fma(_2459, _2757, _2777);
    float _2781 = fma(_2763, _2755, _2747);
    float _2783 = fma(_2741, _2755, _2773);
    float _2785 = fma(_2767, _2755, _2775);
    float _2787 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2789 = fma(_2771, _2779, _2781);
    float _2791 = fma(_2769, _2779, _2783);
    float _2793 = -_2721;
    float _2795 = fma(_2793, _2779, _2785);
    float _2797 = _2387 * _2757;
    float _2799 = _2761 * _2459;
    float _2801 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2787);
    float _2803 = _2765 * _2459;
    float _2805 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2807 = -_2797;
    float _2809 = fma(_2389, _2755, _2807);
    float _2811 = fma(_2741, _2751, _2799);
    float _2813 = fma(_2763, _2751, _2749);
    float _2815 = fma(_2767, _2751, _2803);
    float _2817 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2805);
    float _2819 = fma(_2769, _2809, _2811);
    float _2821 = fma(_2771, _2809, _2813);
    float _2823 = -_2721;
    float _2825 = fma(_2823, _2809, _2815);
    float _2827 = _2673 * _2791;
    float _2829 = _2673 * _2819;
    float _2831 = _2677 * 0.15915493667125701904296875;
    float _2833 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2801);
    float _2835 = fma(_2675, _2795, _2827);
    float _2837 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2817);
    float _2839 = fma(_2675, _2825, _2829);
    float _2841 = _2699 * 6.283185482025146484375;
    float _2843 = sin(_2841);
    float _2845 = _2833 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2847 = fma(_2727, _2789, _2835);
    float _2849 = _2837 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2851 = fma(_2727, _2821, _2839);
    float _2853 = _2459 * _2755;
    float _2855 = _2845 + _2847;
    float _2857 = _2765 * _2389;
    float _2859 = _2831 * 6.283185482025146484375;
    float _2861 = sin(_2859);
    float _2863 = _2849 + _2851;
    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2867 = _2855 + _2865;
    float _2869 = -_2853;
    float _2871 = fma(_2387, _2751, _2869);
    float _2873 = _2761 * _2389;
    float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2877 = _2863 + _2875;
    float _2879 = _2867 * _2867;
    float _2881 = fma(_2767, _2757, _2857);
    float _2883 = fma(_2741, _2757, _2873);
    float _2885 = _2877 * _2877;
    float _2887 = _2745 * _2389;
    float _2889 = _2713 ? _2701 : _2709;
    float _2891 = fma(_2769, _2871, _2883);
    float _2893 = _2879 + _2885;
    float _2895 = fma(_2763, _2757, _2887);
    float _2897 = -_2721;
    float _2899 = fma(_2897, _2871, _2881);
    float _2901 = -_2209;
    float _2903 = fma(_2861, _2843, _2901);
    float _2905 = _2673 * _2891;
    float _2907 = _2699 * 6.283185482025146484375;
    float _2909 = cos(_2907);
    float _2911 = _2889 * _2889;
    float _2913 = fma(_2191, _2903, _2209);
    float _2915 = fma(_2675, _2899, _2905);
    float _2917 = fma(_2771, _2871, _2895);
    float _2919 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2373);
    float _2921 = fma(_2281, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2913);
    float _2923 = sqrt(_2893);
    float _2925 = fma(_2727, _2917, _2915);
    float _2927 = _2919 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2929 = _2713 ? _2913 : _2921;
    float _2931 = _2927 + _2925;
    float _2933 = fma(_2929, _2929, _2911);
    float _2935 = -_2203;
    float _2937 = fma(_2861, _2909, _2935);
    float _2939 = rsqrt(_2933);
    float _2941 = fma(_2191, _2937, _2203);
    bool _2943 = _2923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2945 = _2879;
    float _2947 = _2885;
    float _2949 = _2855;
    float _2951 = _2863;
    float _2953 = _2701;
    float _2955 = _2941;
    float _2957 = _2913;
    float _2959 = _2921;
    if (!_2943)
    {
        _445 = _2931;
    }
    float _2961 = _445;
    bool _2963 = !_2943;
    float _2965 = _2961;
    if (!_2963)
    {
        float _2967 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2971 = _2923 + _2969;
        float _2973 = rsqrt(_2893);
        float _2975 = _2971 * _2967;
        float _2977 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2979 = _2975 * 0.15915493667125701904296875;
        float _2981 = _2979 * 6.283185482025146484375;
        float _2983 = sin(_2981);
        float _2985 = _2979 * 6.283185482025146484375;
        float _2987 = cos(_2985);
        float _2989 = fma(_2983, _2977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2991 = _2973 * _2989;
        float _2993 = _2987 + (-1.0);
        float _2995 = _2867 * _2991;
        float _2997 = _2877 * _2991;
        float _2999 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3001 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3003 = _2995 * _2995;
        float _3005 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3007 = fma(_2931, _2987, _2999);
        float _3009 = _2997 * _2997;
        _2965 = _3007;
        _2945 = _3003;
        _2947 = _3009;
        _2949 = _3001;
        _2951 = _3005;
    }
    float _3011 = _2965;
    float _3013 = _2945;
    float _3015 = _2947;
    float _3017 = _2949;
    float _3019 = _2951;
    float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3023 = _3011 + _3021;
    float _3025 = _3011;
    if (!_2713)
    {
        _2953 = _2709;
    }
    float _3027 = _2953;
    float _3029 = _2889 * _2939;
    if (!_2713)
    {
        float _3031 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2941);
        _2955 = _3031;
    }
    float _3033 = _2955;
    float _3035 = fma(_3023, _3023, _3013);
    if (!_2713)
    {
        _2957 = _2921;
    }
    float _3037 = _2957;
    float _3039 = _2791 * _3027;
    float _3041 = _2891 * _3027;
    float _3043 = _3035 + _3015;
    float _3045 = _2819 * _3027;
    float _3047 = _2929 * _2939;
    float _3049 = -_3029;
    float _3051 = _2789 * _3049;
    float _3053 = -_3029;
    float _3055 = _2917 * _3053;
    float _3057 = -_3029;
    float _3059 = _2821 * _3057;
    float _3061 = sqrt(_3043);
    float _3063 = fma(_2795, _3033, _3039);
    float _3065 = fma(_2899, _3033, _3041);
    float _3067 = fma(_2825, _3033, _3045);
    float _3069 = fma(_2791, _3047, _3051);
    float _3071 = fma(_2891, _3047, _3055);
    float _3073 = fma(_2819, _3047, _3059);
    float _3075 = fma(_2789, _3037, _3063);
    float _3077 = fma(_2917, _3037, _3065);
    float _3079 = fma(_2821, _3037, _3067);
    out.m_67.x = _2087;
    out.m_67.y = _2020;
    out.m_67.z = _2026;
    out.m_67.w = _2024;
    out.m_69.x = _2795;
    out.m_69.y = _2899;
    out.m_69.z = _2825;
    bool _3081 = _3061 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3083 = isnan(_3061);
    bool _3085 = _3081 || _3083;
    bool _3087 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3089 = _3085 || _3087;
    out.m_71.x = _3069;
    out.m_71.y = _3071;
    out.m_71.z = _3073;
    out.m_73.x = _3075;
    out.m_73.y = _3077;
    out.m_73.z = _3079;
    float _3091 = _3039;
    if (!_3089)
    {
        _3091 = 1.0;
    }
    float _3093 = _3091;
    bool _3095 = !_3089;
    float _3097 = _3093;
    if (!_3095)
    {
        bool _3099 = _3061 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3101 = isnan(_3061);
        bool _3103 = _3099 || _3101;
        bool _3105 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3107 = _3103 || _3105;
        if (!_3107)
        {
            float _3109 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3111 = _3061 + _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3115 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3113;
            float _3117 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3119 = _3117 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3121 = 1.0 / _3115;
            float _3123 = _3111 * _3121;
            float _3125 = fma(_3123, _3119, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3097 = _3125;
            _3127 = true;
        }
        else
        {
            bool _3129 = _3061 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3131 = isnan(_3061);
            bool _3133 = _3129 || _3131;
            bool _3135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3137 = _3133 || _3135;
            if (!_3137)
            {
                float _3139 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3141 = _3061 + _3139;
                float _3143 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3145 = _3143 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3147 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3149 = _3147 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3151 = 1.0 / _3145;
                float _3153 = _3141 * _3151;
                float _3155 = fma(_3153, _3149, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3097 = _3155;
                _3127 = true;
            }
            else
            {
                _3097 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3127 = false;
    float _3157 = _3097;
    float _3159 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3161 = _3011 + _3159;
    float _3163 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3165 = _3017 + _3163;
    float _3167 = fma(_3161, _3157, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3169 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3171 = _3019 + _3169;
    float _3173 = fma(_3165, _3157, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3177 = _3167 + _3175;
    float _3179 = fma(_3171, _3157, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3183 = _3173 + _3181;
    float _3185 = _3177 * _3177;
    float _3187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3189 = _3179 + _3187;
    float _3191 = fma(_3183, _3183, _3185);
    float _3193 = fma(_3189, _3189, _3191);
    float _3195 = rsqrt(_3193);
    float _3197 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3199 = _3183 * _3197;
    float _3201 = _3189 * _3197;
    float _3203 = _3199 * _3199;
    float _3205 = _3201 * _3201;
    float _3207 = _3203 + _3205;
    float _3209 = sqrt(_3207);
    bool _3211 = _3209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3215 = _3209 + _3213;
    float _3217 = _3195;
    float _3219 = _3215;
    float _3221 = _3157;
    float _3223 = _3177;
    float _3225 = _3199;
    if (_3211)
    {
        float _3227 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3217 = _3227;
    }
    float _3229 = _3217;
    if (_3211)
    {
        float _3231 = rsqrt(_3207);
        _3025 = _3231;
    }
    float _3233 = _3025;
    float _3235 = _3233;
    if (_3211)
    {
        float _3237 = _3215 * _3229;
        _3219 = _3237;
    }
    float _3239 = _3219;
    float _3241 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3211)
    {
        float _3243 = _3239 * 0.15915493667125701904296875;
        _3221 = _3243;
    }
    float _3245 = _3221;
    float _3247 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3241);
    float _3249 = _3189;
    if (_3211)
    {
        float _3251 = _3245 * 6.283185482025146484375;
        float _3253 = sin(_3251);
        _3249 = _3253;
    }
    float _3255 = _3249;
    float _3257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3259 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3247);
    float _3261 = precise::max(0.0, _3257);
    float _3263 = _3229;
    float _3265 = _3261;
    if (_3211)
    {
        float _3267 = _3245 * 6.283185482025146484375;
        float _3269 = cos(_3267);
        _3263 = _3269;
    }
    float _3271 = _3263;
    float _3273 = -_3197;
    float _3275 = -_3261;
    float _3277 = fma(_3177, _3273, _3275);
    if (_3211)
    {
        float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3223 = _3279;
    }
    float _3281 = _3223;
    float _3283 = sqrt(_3193);
    float _3285 = _3281;
    float _3287 = _3255;
    if (_3211)
    {
        float _3289 = fma(_3255, _3281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3285 = _3289;
    }
    float _3291 = _3285;
    float _3293 = _3291;
    if (!_3211)
    {
        _3287 = _3201;
    }
    float _3295 = _3287;
    float _3297 = _3295;
    if (_3211)
    {
        float _3299 = _3271 + (-1.0);
        _3265 = _3299;
    }
    float _3301 = _3265;
    float _3303 = _3301;
    if (_3211)
    {
        float _3305 = _3233 * _3291;
        _2959 = _3305;
    }
    float _3307 = _2959;
    if (!_3211)
    {
        _3235 = _3277;
    }
    float _3309 = _3235;
    float _3311 = _3309;
    if (_3211)
    {
        float _3313 = _3301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3303 = _3313;
    }
    float _3315 = _3303;
    float _3317 = _3315;
    if (_3211)
    {
        float _3319 = _3199 * _3307;
        _3225 = _3319;
    }
    float _3321 = _3225;
    if (!_3211)
    {
        _3293 = _3203;
    }
    float _3323 = _3293;
    float _3325 = _3323;
    if (_3211)
    {
        float _3327 = _3201 * _3307;
        _3297 = _3327;
    }
    float _3329 = _3297;
    if (_3211)
    {
        float _3331 = fma(_3277, _3271, _3315);
        _3311 = _3331;
    }
    float _3333 = _3311;
    if (_3211)
    {
        float _3335 = _3321 * _3321;
        _3325 = _3335;
    }
    float _3337 = _3325;
    if (!_3211)
    {
        _3317 = _3205;
    }
    float _3339 = _3317;
    float _3341 = _3339;
    if (_3211)
    {
        float _3343 = _3329 * _3329;
        _3341 = _3343;
    }
    float _3345 = _3341;
    float _3347 = fma(_3333, _3333, _3337);
    float _3349 = _3347 + _3345;
    float _3351 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3355 = fma(_3283, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3353);
    float _3357 = precise::clamp(_3355, 0.0, 1.0);
    float _3359 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3361 = rsqrt(_3349);
    float _3363 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3351);
    float _3365 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3367 = -_3357;
    float _3369 = _3367 + 1.0;
    float _3371 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3363);
    float _3373 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3375 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3365);
    float _3377 = _3371 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3379 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3373);
    float _3381 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3375);
    float _3383 = abs(_3369);
    float _3385 = log2(_3383);
    float _3387 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3389 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3379);
    float _3391 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3393 = _3361 * _3321;
    float _3395 = -_3387;
    float _3397 = fma(_3395, _3359, 1.0);
    float _3399 = _3389 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3401 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3403 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3405 = _3361 * _3329;
    float _3407 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3409 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3401);
    float _3411 = _3361 * _3333;
    float _3413 = log2(_3397);
    float _3415 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3417 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3409);
    float _3419 = -_3403;
    float _3421 = fma(_3411, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3419);
    float _3423 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3425 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3415);
    float _3427 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3417);
    float _3429 = -_3405;
    float _3431 = fma(_3429, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3421);
    float _3433 = exp2(_3423);
    float _3435 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3437 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3425);
    float _3439 = fma(_3431, -0.5, 0.5);
    float _3441 = fma(_3431, 0.5, 0.5);
    float _3443 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3435);
    float _3445 = _3411 + 1.0;
    float _3447 = 1.0 / _3427;
    float _3449 = fma(_3441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3451 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3443);
    float _3453 = _3413 * 0.693147182464599609375;
    float _3455 = fma(_3441, _3449, -0.212114393711090087890625);
    float _3457 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3451);
    float _3459 = sqrt(_3439);
    float _3461 = -_3411;
    float _3463 = fma(_3433, _3445, _3461);
    float _3465 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3437);
    float _3467 = fma(_3441, _3455, 1.570728778839111328125);
    float _3469 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3471 = fma(_3463, 0.5, 0.5);
    float _3473 = _3457 * _3447;
    float _3475 = _3465 * _3447;
    float _3477 = fma(_3473, 0.5, 0.5);
    float _3479 = fma(_3475, -0.5, 0.5);
    float _3481 = _3459 * 0.636619746685028076171875;
    float3 _8794 = float3(_3477, _3479, _3469);
    float _3483 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8794, float3(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8794, float3(0.0), isnan(_8794)), level(0.0)).x;
    float3 _8805 = float3(_3477, _3479, _3469);
    float4 _3485 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8805, float3(0.0), isnan(_8805)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8805, float3(0.0), isnan(_8805)), level(0.0)).xyzw;
    float _3487 = _3485.x;
    float _3489 = _3485.y;
    float _3491 = _3485.z;
    float _3493 = _3485.w;
    float _3495 = -_3467;
    float _3497 = fma(_3481, _3495, 1.0);
    float2 _8826 = float2(_3497, _3471);
    float3 _3501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8826, float2(0.0), isnan(_8826)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8826, float2(0.0), isnan(_8826)), level(0.0)).xyz;
    float _3503 = _3501.x;
    float _3505 = _3501.y;
    float _3507 = _3501.z;
    float _3509 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3511 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2845;
    out.m_75.y = _2927;
    out.m_75.z = _2849;
    float _3513 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3511);
    float _3515 = exp2(_3509);
    out.m_49.x = 1.0;
    float _3517 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3513);
    out.m_77.x = _3173;
    out.m_77.y = _3167;
    out.m_77.z = _3179;
    float _3519 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3517);
    float _3521 = _3519 + _3427;
    out.gl_Position.x = _3457;
    out.gl_Position.y = _3465;
    out.gl_Position.z = _3519;
    out.gl_Position.w = _3427;
    float _3523 = -_3515;
    float _3525 = _3523 + 1.0;
    float _3527 = _3525 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3529 = _3521 * 0.5;
    float _3531 = -_3527;
    float _3533 = _3531 + 1.0;
    float _3535 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3529;
    out.m_79.w = _3427;
    out.m_81.w = _3535;
    float _3537 = _3527 * _3483;
    float _3539 = _3493 * _3537;
    float _3541 = _3507 * _3537;
    float _3543 = fma(_3503, _3539, _3487);
    float _3545 = fma(_3505, _3539, _3489);
    float _3547 = _3493 * _3533;
    float _3549 = fma(_3493, _3541, _3491);
    out.m_83.x = _3543;
    out.m_83.y = _3545;
    out.m_83.z = _3549;
    out.m_83.w = _3547;
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
    bool _3127 = false;
    bool _2307 = false;
    bool _2117 = false;
    bool _1555 = false;
    bool _1235 = false;
    bool _1105 = false;
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
        float _3606 = as_type<float>(_123);
        out.gl_Position.z = _3606;
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
        float _3678 = as_type<float>(_165);
        out.gl_Position.z = _3678;
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
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _647 = _643 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _651 = _643 + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _655 = _643 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _673 = 1.0 / _659;
    bool _675 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _677 = isnan(_643);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = 1.0 / _663;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _691 = _643 + _689;
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _695 = 1.0 / _671;
    float _697 = _651 * _673;
    float _699 = 1.0 / _667;
    float _701 = _647 * _687;
    bool _703 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _705 = isnan(_643);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _715;
    float _719 = fma(_717, _697, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _721 = _691 * _695;
    bool _723 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _725 = isnan(_643);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    bool _735 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _737 = isnan(_643);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -_733;
    float _749 = _747 + 1.0;
    float _751 = _655 * _699;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _757;
    float _761 = _745 * _749;
    float _763 = -_745;
    float _765 = _763 + 1.0;
    float _767 = fma(_755, _697, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _769 = fma(_759, _697, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _771 = -_713;
    float _773 = _771 + 1.0;
    float _775 = _713 * _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _781 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _783 = isnan(_643);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = _685 * _773;
    float _795 = -_685;
    float _797 = _795 + 1.0;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = fma(_779, _701, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _809 = _791 * _797;
    float _811 = -_791;
    float _813 = _811 + 1.0;
    float _815 = fma(_801, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _817 = fma(_805, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _819 = _719 * _809;
    float _821 = _767 * _809;
    float _823 = _769 * _809;
    float _825 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].x, _819);
    float _827 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].y, _821);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _829;
    float _833 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].z, _823);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _839;
    float _843 = fma(_831, _751, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _845 = fma(_815, _793, _825);
    float _847 = fma(_807, _793, _833);
    float _849 = fma(_817, _793, _827);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _859 = fma(_837, _751, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _861 = fma(_841, _751, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _867 = fma(_843, _775, _845);
    float _869 = fma(_853, _721, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _871 = fma(_857, _721, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _873 = fma(_865, _721, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _875 = fma(_859, _775, _849);
    float _877 = fma(_861, _775, _847);
    float _879 = fma(_869, _761, _867);
    float _881 = fma(_871, _761, _875);
    float _883 = fma(_873, _761, _877);
    float _885 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[147].x, _879);
    float _887 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[147].y, _881);
    float _889 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[147].z, _883);
    bool _891 = !_693;
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
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _923 = _919 + _921;
    bool _925 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _927 = isnan(_919);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _939 = _919 + _937;
    bool _941 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _943 = isnan(_919);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _949 = _945 || _947;
    float _951 = float(_949);
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _961 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _963 = isnan(_919);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = -_935;
    float _975 = _973 + 1.0;
    float _977 = 1.0 / _955;
    float _979 = _971 * _975;
    float _981 = -_971;
    float _983 = _981 + 1.0;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _985;
    float _989 = 1.0 / _959;
    float _991 = _951 * _983;
    float _993 = -_951;
    float _995 = _993 + 1.0;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _999 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1001 = _923 * _977;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1007;
    float _1011 = fma(_987, _1001, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1013 = fma(_1005, _1001, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1015 = fma(_1009, _1001, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1017 = _939 * _989;
    float _1019 = _1011 * _991;
    float _1021 = _1013 * _991;
    float _1023 = _1015 * _991;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1037 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1019);
    float _1039 = fma(_1027, _1017, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1041 = fma(_1031, _1017, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1043 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1021);
    float _1045 = fma(_1035, _1017, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1047 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1023);
    float _1049 = fma(_1039, _979, _1037);
    float _1051 = fma(_1041, _979, _1043);
    float _1053 = fma(_1045, _979, _1047);
    float _1055 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1049);
    float _1057 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1051);
    float _1059 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1053);
    float _1061 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1063 = _1057 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1065 = in.m_53.x;
    float _1067 = in.m_53.y;
    float _1069 = in.m_53.z;
    float _1071 = _1059 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1073 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1075 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1073;
    out.m_57.y = _1075;
    out.m_57.z = _1077;
    out.m_57.w = _997;
    float _1079 = _889 * _1069;
    float _1081 = _887 * _1067;
    float _1083 = _885 * _1065;
    bool _1085 = !_999;
    float _1103;
    if (!_1085)
    {
        float _1087 = in.m_55.x;
        float _1089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1091 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _1095 = _1093 * _1089;
        float _1097 = floor(_1095);
        float _1099 = -_1097;
        float _1101 = _1095 + _1099;
        _1103 = _1101;
        _1105 = true;
    }
    else
    {
        float _1107 = float(_107);
        float _1109 = 1.0 / _1107;
        float _1111 = _141 * _1109;
        _1103 = _1111;
    }
    _1105 = false;
    float _1113 = _1103;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1117 = _1113 + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1123 = _1113 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1125 = isnan(_1113);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1139 = _1113 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1141 = isnan(_1113);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1151;
    bool _1155 = _1113 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1157 = isnan(_1113);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = 1.0 / _1121;
    float _1169 = -_1133;
    float _1171 = _1169 + 1.0;
    bool _1173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1175 = 1.0 / _1137;
    float _1177 = _1153 * _1167;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1183 = -_1165;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_1177, _1117, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1189 = _1149 * _1171;
    float _1191 = -_1149;
    float _1193 = _1191 + 1.0;
    float _1195 = _1133 * _1185;
    float _1197 = _1181 * _1175;
    float _1199 = _1187 * _1189;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1203 = _1113 + _1201;
    float _1205 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1199);
    float _1207 = fma(_1197, _1203, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1209 = fma(_1207, _1195, _1205);
    float _1211 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1209);
    float _1213 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1213;
    bool _1215 = !_1173;
    float _1233;
    if (!_1215)
    {
        float _1217 = in.m_55.x;
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1221 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _1225 = _1223 * _1219;
        float _1227 = floor(_1225);
        float _1229 = -_1227;
        float _1231 = _1225 + _1229;
        _1233 = _1231;
        _1235 = true;
    }
    else
    {
        float _1237 = float(_107);
        float _1239 = 1.0 / _1237;
        float _1241 = _141 * _1239;
        _1233 = _1241;
    }
    _1235 = false;
    float _1243 = _1233;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1247 = _1243 + _1245;
    bool _1249 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1251 = isnan(_1243);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1265 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1267 = isnan(_1243);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1277;
    bool _1281 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1283 = isnan(_1243);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = -_1259;
    float _1295 = _1293 + 1.0;
    float _1297 = 1.0 / _1263;
    bool _1299 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1301 = isnan(_1243);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    float _1311 = -_1291;
    float _1313 = _1311 + 1.0;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1321 = 1.0 / _1317;
    float _1323 = _1279 * _1297;
    float _1325 = -_1275;
    float _1327 = _1325 + 1.0;
    float _1329 = _1275 * _1295;
    bool _1331 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1333 = isnan(_1243);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = fma(_1323, _1247, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1345 = _1291 * _1327;
    float _1347 = _1309 * _1313;
    float _1349 = -_1309;
    float _1351 = _1349 + 1.0;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1357 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1359 = isnan(_1243);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1365 = _1361 || _1363;
    float _1367 = float(_1365);
    float _1369 = _1341 * _1351;
    float _1371 = -_1341;
    float _1373 = _1371 + 1.0;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1379 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1381 = isnan(_1243);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = 1.0 / _1355;
    float _1393 = _1367 * _1373;
    float _1395 = -_1367;
    float _1397 = _1395 + 1.0;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1403 = _1389 * _1397;
    float _1405 = 1.0 / _1377;
    float _1407 = _1401 * _1321;
    float _1409 = -_1389;
    float _1411 = _1409 + 1.0;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1417;
    float _1421 = 1.0 / _1415;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1425 = _1423 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1427 = _1343 * _1403;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1431 = _1243 + _1429;
    float _1433 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1427);
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1439 = 1.0 / _1425;
    float _1441 = _1419 * _1405;
    float _1443 = fma(_1407, _1431, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1447 = _1243 + _1445;
    float _1449 = fma(_1443, _1393, _1433);
    float _1451 = fma(_1441, _1447, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1453 = 1.0 / _1437;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1465 = _1243 + _1463;
    float _1467 = _1457 * _1391;
    float _1469 = fma(_1451, _1369, _1449);
    float _1471 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1473 = _1471 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1475 = _1461 * _1439;
    float _1477 = fma(_1467, _1465, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1481 = _1243 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1483;
    bool _1487 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1489 = isnan(_1243);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = _1473 * _1421;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1503 = _1243 + _1501;
    float _1505 = fma(_1475, _1481, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1507 = fma(_1477, _1347, _1469);
    float _1509 = _1485 * _1453;
    float _1511 = fma(_1499, _1503, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1513 = -_1497;
    float _1515 = _1513 + 1.0;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1519 = _1243 + _1517;
    float _1521 = fma(_1505, _1345, _1507);
    float _1523 = _1259 * _1515;
    float _1525 = fma(_1509, _1519, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1527 = fma(_1511, _1329, _1521);
    float _1529 = fma(_1525, _1523, _1527);
    float _1531 = fma(_1497, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1529);
    float _1533 = precise::clamp(_1531, 0.0, 1.0);
    bool _1535 = !_1319;
    float _1553;
    if (!_1535)
    {
        float _1537 = in.m_55.x;
        float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1541 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[14].z, _141);
        float _1545 = _1543 * _1539;
        float _1547 = floor(_1545);
        float _1549 = -_1547;
        float _1551 = _1545 + _1549;
        _1553 = _1551;
        _1555 = true;
    }
    else
    {
        float _1557 = float(_107);
        float _1559 = 1.0 / _1557;
        float _1561 = _141 * _1559;
        _1553 = _1561;
    }
    _1555 = false;
    float _1563 = _1553;
    int _1565 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1567 = _1565;
    int _1569 = 0;
    int _1571 = _98(_1567, _1569, (*spvDescriptorSet0.support_buffer));
    float _1573 = in.m_61.z;
    float _1575 = trunc(_1573);
    int _1577 = int(_1575);
    int _1579 = _1571 + (-1);
    float _1581 = float(_1579);
    float _1583 = _1533 * _1581;
    float _1585 = trunc(_1583);
    int _1587 = int(_1585);
    int _1589 = _1587;
    int _1591 = 0;
    int _1593 = _99(_1589, _1591, (*spvDescriptorSet0.support_buffer));
    int _1595 = _1577;
    int _1597 = 0;
    int _1599 = _99(_1595, _1597, (*spvDescriptorSet0.support_buffer));
    float4 _1602 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1593, _1599)), 0).xyzw;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = _1602.w;
    float _1612 = in.m_55.w;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1616 = _1614 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1622 = 1.0 / _1616;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1634 = _1632 != 0;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1638 = _1636 != 0;
    float _1640 = 1.0 / _1620;
    bool _1642 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1644 = isnan(_1563);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1660 = _1658 != 0;
    float _1662 = -_1652;
    float _1664 = _1662 + 1.0;
    bool _1666 = _1612 > 0.5;
    bool _1668 = _1666 && _1634;
    float _1670 = 1.0 / _1626;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1672;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1680 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1682 = isnan(_1563);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    float _1692 = _1674 * _1622;
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1694;
    float _1698 = 1.0 / _1630;
    bool _1700 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1702 = isnan(_1563);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1708 = _1704 || _1706;
    float _1710 = float(_1708);
    float _1712 = _1678 * _1640;
    float _1714 = _1690 * _1664;
    float _1716 = -_1690;
    float _1718 = _1716 + 1.0;
    bool _1720 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1722 = isnan(_1563);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = -_1710;
    float _1734 = _1732 + 1.0;
    float _1736 = _1696 * _1670;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1740 = _1738 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    bool _1742 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1744 = isnan(_1563);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = _1710 * _1718;
    float _1756 = _1730 * _1734;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1760 = _1758 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1762 = -_1730;
    float _1764 = _1762 + 1.0;
    bool _1766 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1768 = isnan(_1563);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    float _1778 = _1740 * _1698;
    float _1780 = -_1752;
    float _1782 = _1780 + 1.0;
    float _1784 = _1752 * _1764;
    bool _1786 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1788 = isnan(_1563);
    bool _1790 = _1786 || _1788;
    bool _1792 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1794 = _1790 || _1792;
    float _1796 = float(_1794);
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1800 = _1563 + _1798;
    float _1802 = _1776 * _1782;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1806 = _1804 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1808 = -_1776;
    float _1810 = _1808 + 1.0;
    float _1812 = 1.0 / _1760;
    float _1814 = fma(_1692, _1800, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1816 = _1796 * _1810;
    float _1818 = _1814 * _1816;
    float _1820 = 1.0 / _1806;
    float _1822 = -_1796;
    float _1824 = _1822 + 1.0;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1828 = _1563 + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1832 = _1830 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1834;
    float _1838 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1818);
    float _1840 = fma(_1712, _1828, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1846 = _1836 * _1812;
    float _1848 = in.m_61.x;
    float _1850 = 1.0 / _1832;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1854 = _1563 + _1852;
    float _1856 = fma(_1840, _1802, _1838);
    float _1858 = in.m_55.y;
    float _1860 = fma(_1736, _1854, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1862 = _1844 * _1820;
    float _1864 = in.m_61.y;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1868 = _1563 + _1866;
    int _1870 = as_type<int>(_1802);
    float _1872 = _1652;
    float _1874 = _1754;
    int _1876 = as_type<int>(_1563);
    if (_1638)
    {
        float _1878 = in.m_55.x;
        _1870 = as_type<int>(_1878);
    }
    int _1880 = _1870;
    float _1882 = fma(_1778, _1868, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1884;
    float _1888 = fma(_1860, _1784, _1856);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1892 = _1563 + _1890;
    bool _1894 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1896 = isnan(_1563);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = _1886 * _1850;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1910 = _1563 + _1908;
    float _1912 = fma(_1846, _1892, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1914 = fma(_1882, _1756, _1888);
    float _1916 = -_1904;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1862, _1910, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1924 = _1563 + _1922;
    float _1926 = fma(_1912, _1754, _1914);
    float _1928 = _1652 * _1918;
    int _1930 = as_type<int>(_1926);
    if (!_1638)
    {
        _1872 = _1848;
    }
    float _1932 = _1872;
    float _1934 = _1824;
    float _1936 = _1932;
    if (_1656)
    {
        float _1938 = in.m_55.z;
        _1934 = _1938;
    }
    float _1940 = _1934;
    float _1942 = fma(_1920, _1714, _1926);
    float _1944 = fma(_1906, _1924, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1946 = -_1864;
    float _1948 = _1946 + 1.0;
    if (!_1638)
    {
        _1874 = _1932;
    }
    float _1950 = _1874;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1954 = _1950;
    if (_1638)
    {
        _1936 = _1848;
    }
    float _1956 = _1936;
    float _1958 = fma(_1944, _1928, _1942);
    float _1960 = _1668 ? _1948 : _1864;
    bool _1962 = false;
    float _1964 = _1956;
    int _1966 = _1880;
    if (_1638)
    {
        bool _1968 = as_type<float>(_1880) > 0.5;
        _1962 = _1968;
    }
    bool _1970 = _1962;
    if (_1638)
    {
        float _1972 = -_1956;
        float _1974 = _1972 + 1.0;
        _1876 = as_type<int>(_1974);
    }
    int _1976 = _1876;
    bool _1978 = _1858 > 0.5;
    bool _1980 = _1978 && _1660;
    if (_1656)
    {
        float _1982 = -_1956;
        float _1984 = _1982 + 1.0;
        _1930 = as_type<int>(_1984);
    }
    int _1986 = _1930;
    float _1988 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1958);
    float _1990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1638)
    {
        float _1992 = _1970 ? as_type<float>(_1976) : _1956;
        _1954 = _1992;
    }
    float _1994 = _1954;
    float _1996 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1998 = _1587 + 1;
    out.m_63.x = _1988;
    float _2000 = _1980 ? _1948 : _1864;
    int _2002 = min(_1579, _1998);
    bool _2004 = false;
    if (_1656)
    {
        bool _2006 = _1940 > 0.5;
        _2004 = _2006;
    }
    bool _2008 = _2004;
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1656)
    {
        float _2014 = _2008 ? as_type<float>(_1986) : _1956;
        _1964 = _2014;
    }
    float _2016 = _1964;
    float _2018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2020 = _2012 * _2010;
    float _2022 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2024 = _1996 * _1990;
    float _2026 = _2022 * _2018;
    uint _2029 = as_type<uint>(half2(float2(_1610, 0.0)));
    uint _2031 = extract_bits(_2029, 0u, 8u);
    int _2033 = int(_2031) & 255;
    uint _2035 = extract_bits(_2029, 8u, 8u);
    int _2037 = int(_2035) & 255;
    int _2039 = _2037 << 8;
    int _2041 = _2033 | _2039;
    bool _2043 = _2041 >= 32768;
    int _2045 = _2041 + (-1024);
    int _2047 = _2045;
    if (_2043)
    {
        int _2049 = ~_2041;
        int _2051 = _2049 + 33792;
        int _2053 = _2051 + 1;
        _2047 = _2053;
    }
    int _2055 = _2047;
    int _2057 = _2055 + 30719;
    float _2059 = float(_2057);
    float _2061 = fma(_2059, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2063 = abs(_2061);
    float _2065 = -_2063;
    float _2067 = _2065 + 1.0;
    bool _2069 = _2061 < 0.0;
    float _2071 = float(_2069);
    float _2073 = abs(_2061);
    float _2075 = fma(_2073, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2077 = as_type<int>(_2067) + (-218103808);
    float _2079 = abs(_2061);
    float _2081 = fma(_2079, _2075, -0.212114393711090087890625);
    bool _2083 = uint(_2077) >= 1920991232u;
    float _2085 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2087 = _2085 * _1952;
    float _2089 = abs(_2061);
    float _2091 = fma(_2089, _2081, 1.570728778839111328125);
    bool _2093 = !_2083;
    float _2115;
    if (!_2093)
    {
        int _2095 = as_type<int>(_2067);
        int _2097 = as_type<int>(_2018);
        int _2099 = _1880;
        int _2101 = 10608;
        int _2103;
        int _2105;
        int _2107;
        int _2109;
        int _2111;
        int _2113;
        _96(_2095, _2097, _2099, _2101, _2103, _2105, _2107, _2109, _2111, _2113, out.gl_Position, out.gl_PointSize);
        _2115 = as_type<float>(_2103);
        _1966 = _2111;
        _2117 = true;
    }
    else
    {
        float _2119 = rsqrt(_2067);
        float _2121 = _2067 * _2119;
        float _2123 = _2119 * 0.5;
        float _2125 = -_2121;
        float _2127 = 0.0 + _2125;
        float _2129 = fma(_2123, _2127, 0.5);
        float _2131 = fma(_2121, _2129, _2121);
        float _2133 = -_2131;
        float _2135 = 0.0 + _2133;
        float _2137 = fma(_2131, _2135, _2067);
        float _2139 = fma(_2123, _2137, _2131);
        _2115 = _2139;
    }
    _2117 = false;
    float _2141 = _2115;
    int _2143 = _1966;
    int _2145 = _2002;
    int _2147 = 0;
    int _2149 = _99(_2145, _2147, (*spvDescriptorSet0.support_buffer));
    int _2151 = _1577;
    int _2153 = 0;
    int _2155 = _99(_2151, _2153, (*spvDescriptorSet0.support_buffer));
    float4 _2157 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2149, _2155)), 0).xyzw;
    float _2159 = _2157.x;
    float _2161 = _2157.y;
    float _2163 = _2157.z;
    float _2165 = _2157.w;
    float _2167 = _2059 * 3.883221149444580078125;
    float _2169 = floor(_1583);
    float _2171 = _2091 * _2141;
    float _2173 = _2071 * 2.0;
    float _2175 = _2167 * 0.15915493667125701904296875;
    float _2177 = -_2173;
    float _2179 = fma(_2171, _2177, _2171);
    float _2181 = _2175 * 6.283185482025146484375;
    float _2183 = cos(_2181);
    float _2185 = fma(_2071, 3.1415927410125732421875, _2179);
    float _2187 = _2185 * 0.15915493667125701904296875;
    float _2189 = -_2169;
    float _2191 = _1583 + _2189;
    float _2193 = _2175 * 6.283185482025146484375;
    float _2195 = sin(_2193);
    float _2197 = _2187 * 6.283185482025146484375;
    float _2199 = sin(_2197);
    uint _2201 = as_type<uint>(half2(float2(_2165, 0.0)));
    float _2203 = _2199 * _2183;
    float _2205 = -_1604;
    float _2207 = _2205 + _2159;
    float _2209 = _2199 * _2195;
    uint _2211 = extract_bits(_2201, 0u, 8u);
    int _2213 = int(_2211) & 255;
    uint _2215 = extract_bits(_2201, 8u, 8u);
    int _2217 = int(_2215) & 255;
    int _2219 = _2217 << 8;
    int _2221 = _2213 | _2219;
    float _2223 = fma(_2191, _2207, _1604);
    bool _2225 = _2221 >= 32768;
    int _2227 = _2221 + (-1024);
    int _2229 = _2227;
    if (_2225)
    {
        int _2231 = ~_2221;
        int _2233 = _2231 + 33792;
        int _2235 = _2233 + 1;
        _2229 = _2235;
    }
    int _2237 = _2229;
    int _2239 = _2237 + 30719;
    float _2241 = float(_2239);
    float _2243 = -_1606;
    float _2245 = _2243 + _2161;
    float _2247 = fma(_2241, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2249 = fma(_2191, _2245, _1606);
    float _2251 = abs(_2247);
    float _2253 = -_2251;
    float _2255 = _2253 + 1.0;
    float _2257 = abs(_2247);
    float _2259 = fma(_2257, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2261 = _2247 < 0.0;
    float _2263 = float(_2261);
    int _2265 = as_type<int>(_2255) + (-218103808);
    float _2267 = abs(_2247);
    float _2269 = fma(_2267, _2259, -0.212114393711090087890625);
    bool _2271 = uint(_2265) >= 1920991232u;
    float _2273 = -_1608;
    float _2275 = _2273 + _2163;
    float _2277 = abs(_2247);
    float _2279 = fma(_2277, _2269, 1.570728778839111328125);
    float _2281 = fma(_2191, _2275, _1608);
    bool _2283 = !_2271;
    float _2305;
    if (!_2283)
    {
        int _2285 = as_type<int>(_2255);
        int _2287 = as_type<int>(_2169);
        int _2289 = _2143;
        int _2291 = 11488;
        int _2293;
        int _2295;
        int _2297;
        int _2299;
        int _2301;
        int _2303;
        _96(_2285, _2287, _2289, _2291, _2293, _2295, _2297, _2299, _2301, _2303, out.gl_Position, out.gl_PointSize);
        _2305 = as_type<float>(_2293);
        _2307 = true;
    }
    else
    {
        float _2309 = rsqrt(_2255);
        float _2311 = _2255 * _2309;
        float _2313 = _2309 * 0.5;
        float _2315 = -_2311;
        float _2317 = 0.0 + _2315;
        float _2319 = fma(_2313, _2317, 0.5);
        float _2321 = fma(_2311, _2319, _2311);
        float _2323 = -_2321;
        float _2325 = 0.0 + _2323;
        float _2327 = fma(_2321, _2325, _2255);
        float _2329 = fma(_2313, _2327, _2321);
        _2305 = _2329;
    }
    _2307 = false;
    float _2331 = _2305;
    float _2333 = in.m_55.x;
    float _2335 = in.m_55.y;
    float _2337 = in.m_55.z;
    float _2339 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2341 = log2(_2339);
    float _2343 = _607 * _607;
    float _2345 = _2279 * _2331;
    float _2347 = fma(_609, _609, _2343);
    int _2349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2351 = _2349 != 0;
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2355 = _2353 != 0;
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2359 = _2357 != 0;
    float _2361 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2363 = fma(_611, _611, _2347);
    float _2365 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2367 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2369 = rsqrt(_2363);
    float _2371 = _2341 * _141;
    float _2373 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2367);
    float _2375 = _2337 * 2.0;
    float _2377 = _2333 * 2.0;
    float _2379 = _2333 + _2337;
    float _2381 = exp2(_2371);
    float _2383 = _2335 * 2.0;
    float _2385 = _2379 + (-1.0);
    float _2387 = _2369 * _609;
    float _2389 = _2369 * _607;
    float _2391 = fma(_2385, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2393 = floor(_2375);
    float _2395 = _2335 + _2333;
    float _2397 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2399 = _2387 * _2397;
    float _2401 = _2395 + (-1.0);
    float _2403 = floor(_2377);
    bool _2405 = _2393 > 0.0;
    float _2407 = floor(_2383);
    bool _2409 = _2393 >= 0.0;
    bool _2411 = isnan(_2393);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan(0.0);
    bool _2417 = _2413 || _2415;
    int _2419 = _2417 ? 0 : 1;
    bool _2421 = _2403 > 0.0;
    float _2423 = fma(_2401, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2425 = _2403 >= 0.0;
    bool _2427 = isnan(_2403);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2437 = 1.0 + _2435;
    bool _2439 = !_2351;
    int _2441 = _2439 ? 0 : 1;
    int _2443 = ~_2419;
    int _2445 = _2443 + 1;
    int _2447 = _2445 + 1;
    float _2449 = 1.0 / _2437;
    int _2451 = _2447;
    if (!_2405)
    {
        int _2453 = ~_2419;
        int _2455 = _2453 + 1;
        _2451 = _2455;
    }
    int _2457 = _2451;
    float _2459 = _2369 * _611;
    int _2461 = abs(_2441);
    float _2463 = -_2381;
    float _2465 = _2463 + 1.0;
    bool _2467 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2469 = isnan(1.0);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2475 = _2471 || _2473;
    int _2477 = _2433 ? 0 : 1;
    float _2479 = in.m_65.x;
    float _2481 = in.m_65.y;
    float _2483 = in.m_65.z;
    bool _2485 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2487 = isnan(0.0);
    bool _2489 = _2485 || _2487;
    bool _2491 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2493 = _2489 || _2491;
    bool _2495 = _2407 > 0.0;
    float _2497 = _2493 ? _2465 : 0.0;
    bool _2499 = _2407 >= 0.0;
    bool _2501 = isnan(_2407);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan(0.0);
    bool _2507 = _2503 || _2505;
    float _2509 = float(_2461);
    if (_2475)
    {
        float _2511 = _2497 * _2449;
        _147 = _2511;
    }
    float _2513 = _147;
    float _2515 = float(_2457);
    float _2517 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2519 = _2459 * _2517;
    int _2521 = _2507 ? 0 : 1;
    bool _2523 = !_2359;
    int _2525 = _2523 ? 0 : 1;
    float _2527 = _2509 * _2515;
    int _2529 = ~_2521;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    float _2535 = _2333 + (-0.5);
    int _2537 = _2533;
    if (!_2495)
    {
        int _2539 = ~_2521;
        int _2541 = _2539 + 1;
        _2537 = _2541;
    }
    int _2543 = _2537;
    float _2545 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2547 = -_2519;
    float _2549 = fma(_2387, _2545, _2547);
    int _2551 = abs(_2525);
    float _2553 = _2527 * (-2.0);
    float _2555 = float(_2543);
    float _2557 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2559 = _2389 * _2557;
    float _2561 = float(_2551);
    float _2563 = fma(_2553, _2479, _2479);
    int _2565 = ~_2477;
    int _2567 = _2565 + 1;
    int _2569 = _2567 + 1;
    float _2571 = fma(_2423, _2553, _2423);
    int _2573 = _2569;
    if (!_2421)
    {
        int _2575 = ~_2477;
        int _2577 = _2575 + 1;
        _2573 = _2577;
    }
    int _2579 = _2573;
    float _2581 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2563);
    bool _2583 = !_2355;
    int _2585 = _2583 ? 0 : 1;
    float _2587 = _2561 * _2555;
    float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2591 = -_2559;
    float _2593 = fma(_2459, _2589, _2591);
    float _2595 = fma(_2571, _2513, _2581);
    int _2597 = abs(_2585);
    float _2599 = _2587 * (-2.0);
    float _2601 = _2337 + (-0.5);
    float _2603 = _2595 * 0.15915493667125701904296875;
    float _2605 = float(_2597);
    float _2607 = fma(_2599, _2483, _2483);
    float _2609 = float(_2579);
    float _2611 = fma(_2391, _2599, _2391);
    float _2613 = _2549 * _2549;
    float _2615 = fma(_2601, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2607);
    float _2617 = _2335 + _2337;
    float _2619 = _2605 * _2609;
    float _2621 = _2335 + (-0.5);
    float _2623 = _2617 + (-1.0);
    float _2625 = _2619 * (-2.0);
    float _2627 = fma(_2611, _2513, _2615);
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2631 = -_2399;
    float _2633 = fma(_2389, _2629, _2631);
    float _2635 = fma(_2623, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2637 = fma(_2625, _2481, _2481);
    float _2639 = fma(_2593, _2593, _2613);
    float _2641 = _2627 * 0.15915493667125701904296875;
    float _2643 = fma(_2635, _2625, _2635);
    float _2645 = fma(_2621, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2637);
    float _2647 = fma(_2633, _2633, _2639);
    float _2649 = _2603 * 6.283185482025146484375;
    float _2651 = sin(_2649);
    float _2653 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2655 = fma(_2643, _2513, _2645);
    float _2657 = _2263 * 2.0;
    float _2659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2249);
    float _2661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2223);
    float _2663 = _2655 * 0.15915493667125701904296875;
    float _2665 = -_2657;
    float _2667 = fma(_2345, _2665, _2345);
    float _2669 = _2603 * 6.283185482025146484375;
    float _2671 = cos(_2669);
    float _2673 = _2365 * _2659;
    float _2675 = _2653 * _2661;
    float _2677 = fma(_2263, 3.1415927410125732421875, _2667);
    float _2679 = _2241 * 3.883221149444580078125;
    float _2681 = -_2061;
    float _2683 = _2681 + _2247;
    bool _2685 = _2249 != 0.0;
    bool _2687 = isnan(_2249);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    float _2695 = _2641 * 6.283185482025146484375;
    float _2697 = sin(_2695);
    float _2699 = _2679 * 0.15915493667125701904296875;
    float _2701 = fma(_2191, _2683, _2061);
    bool _2703 = _2223 == 0.0;
    bool _2705 = !_2693;
    bool _2707 = _2703 && _2705;
    float _2709 = fma(_2249, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2701);
    bool _2711 = _2281 == 0.0;
    bool _2713 = _2711 && _2707;
    float _2715 = _2641 * 6.283185482025146484375;
    float _2717 = cos(_2715);
    float _2719 = _2663 * 6.283185482025146484375;
    float _2721 = sin(_2719);
    float _2723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2281);
    float _2725 = _2671 * _2697;
    float _2727 = _2361 * _2723;
    float _2729 = _2651 * _2697;
    float _2731 = rsqrt(_2647);
    float _2733 = _2651 * _2717;
    float _2735 = _2663 * 6.283185482025146484375;
    float _2737 = cos(_2735);
    float _2739 = -_2725;
    float _2741 = fma(_2721, _2733, _2739);
    float _2743 = -_2733;
    float _2745 = fma(_2721, _2725, _2743);
    float _2747 = _2745 * _2387;
    float _2749 = _2745 * _2459;
    float _2751 = _2633 * _2731;
    float _2753 = _2671 * _2717;
    float _2755 = _2593 * _2731;
    float _2757 = _2549 * _2731;
    float _2759 = _2389 * _2751;
    float _2761 = fma(_2721, _2729, _2753);
    float _2763 = fma(_2721, _2753, _2729);
    float _2765 = _2737 * _2697;
    float _2767 = _2737 * _2717;
    float _2769 = _2651 * _2737;
    float _2771 = _2671 * _2737;
    float _2773 = _2761 * _2387;
    float _2775 = _2765 * _2387;
    float _2777 = -_2759;
    float _2779 = fma(_2459, _2757, _2777);
    float _2781 = fma(_2763, _2755, _2747);
    float _2783 = fma(_2741, _2755, _2773);
    float _2785 = fma(_2767, _2755, _2775);
    float _2787 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2789 = fma(_2771, _2779, _2781);
    float _2791 = fma(_2769, _2779, _2783);
    float _2793 = -_2721;
    float _2795 = fma(_2793, _2779, _2785);
    float _2797 = _2387 * _2757;
    float _2799 = _2761 * _2459;
    float _2801 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2787);
    float _2803 = _2765 * _2459;
    float _2805 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2807 = -_2797;
    float _2809 = fma(_2389, _2755, _2807);
    float _2811 = fma(_2741, _2751, _2799);
    float _2813 = fma(_2763, _2751, _2749);
    float _2815 = fma(_2767, _2751, _2803);
    float _2817 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2805);
    float _2819 = fma(_2769, _2809, _2811);
    float _2821 = fma(_2771, _2809, _2813);
    float _2823 = -_2721;
    float _2825 = fma(_2823, _2809, _2815);
    float _2827 = _2673 * _2791;
    float _2829 = _2673 * _2819;
    float _2831 = _2677 * 0.15915493667125701904296875;
    float _2833 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2801);
    float _2835 = fma(_2675, _2795, _2827);
    float _2837 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2817);
    float _2839 = fma(_2675, _2825, _2829);
    float _2841 = _2699 * 6.283185482025146484375;
    float _2843 = sin(_2841);
    float _2845 = _2833 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2847 = fma(_2727, _2789, _2835);
    float _2849 = _2837 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2851 = fma(_2727, _2821, _2839);
    float _2853 = _2459 * _2755;
    float _2855 = _2845 + _2847;
    float _2857 = _2765 * _2389;
    float _2859 = _2831 * 6.283185482025146484375;
    float _2861 = sin(_2859);
    float _2863 = _2849 + _2851;
    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2867 = _2855 + _2865;
    float _2869 = -_2853;
    float _2871 = fma(_2387, _2751, _2869);
    float _2873 = _2761 * _2389;
    float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2877 = _2863 + _2875;
    float _2879 = _2867 * _2867;
    float _2881 = fma(_2767, _2757, _2857);
    float _2883 = fma(_2741, _2757, _2873);
    float _2885 = _2877 * _2877;
    float _2887 = _2745 * _2389;
    float _2889 = _2713 ? _2701 : _2709;
    float _2891 = fma(_2769, _2871, _2883);
    float _2893 = _2879 + _2885;
    float _2895 = fma(_2763, _2757, _2887);
    float _2897 = -_2721;
    float _2899 = fma(_2897, _2871, _2881);
    float _2901 = -_2209;
    float _2903 = fma(_2861, _2843, _2901);
    float _2905 = _2673 * _2891;
    float _2907 = _2699 * 6.283185482025146484375;
    float _2909 = cos(_2907);
    float _2911 = _2889 * _2889;
    float _2913 = fma(_2191, _2903, _2209);
    float _2915 = fma(_2675, _2899, _2905);
    float _2917 = fma(_2771, _2871, _2895);
    float _2919 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2373);
    float _2921 = fma(_2281, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2913);
    float _2923 = sqrt(_2893);
    float _2925 = fma(_2727, _2917, _2915);
    float _2927 = _2919 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2929 = _2713 ? _2913 : _2921;
    float _2931 = _2927 + _2925;
    float _2933 = fma(_2929, _2929, _2911);
    float _2935 = -_2203;
    float _2937 = fma(_2861, _2909, _2935);
    float _2939 = rsqrt(_2933);
    float _2941 = fma(_2191, _2937, _2203);
    bool _2943 = _2923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2945 = _2879;
    float _2947 = _2885;
    float _2949 = _2855;
    float _2951 = _2863;
    float _2953 = _2701;
    float _2955 = _2941;
    float _2957 = _2913;
    float _2959 = _2921;
    if (!_2943)
    {
        _445 = _2931;
    }
    float _2961 = _445;
    bool _2963 = !_2943;
    float _2965 = _2961;
    if (!_2963)
    {
        float _2967 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2971 = _2923 + _2969;
        float _2973 = rsqrt(_2893);
        float _2975 = _2971 * _2967;
        float _2977 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2979 = _2975 * 0.15915493667125701904296875;
        float _2981 = _2979 * 6.283185482025146484375;
        float _2983 = sin(_2981);
        float _2985 = _2979 * 6.283185482025146484375;
        float _2987 = cos(_2985);
        float _2989 = fma(_2983, _2977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2991 = _2973 * _2989;
        float _2993 = _2987 + (-1.0);
        float _2995 = _2867 * _2991;
        float _2997 = _2877 * _2991;
        float _2999 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3001 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3003 = _2995 * _2995;
        float _3005 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3007 = fma(_2931, _2987, _2999);
        float _3009 = _2997 * _2997;
        _2965 = _3007;
        _2945 = _3003;
        _2947 = _3009;
        _2949 = _3001;
        _2951 = _3005;
    }
    float _3011 = _2965;
    float _3013 = _2945;
    float _3015 = _2947;
    float _3017 = _2949;
    float _3019 = _2951;
    float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3023 = _3011 + _3021;
    float _3025 = _3011;
    if (!_2713)
    {
        _2953 = _2709;
    }
    float _3027 = _2953;
    float _3029 = _2889 * _2939;
    if (!_2713)
    {
        float _3031 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2941);
        _2955 = _3031;
    }
    float _3033 = _2955;
    float _3035 = fma(_3023, _3023, _3013);
    if (!_2713)
    {
        _2957 = _2921;
    }
    float _3037 = _2957;
    float _3039 = _2791 * _3027;
    float _3041 = _2891 * _3027;
    float _3043 = _3035 + _3015;
    float _3045 = _2819 * _3027;
    float _3047 = _2929 * _2939;
    float _3049 = -_3029;
    float _3051 = _2789 * _3049;
    float _3053 = -_3029;
    float _3055 = _2917 * _3053;
    float _3057 = -_3029;
    float _3059 = _2821 * _3057;
    float _3061 = sqrt(_3043);
    float _3063 = fma(_2795, _3033, _3039);
    float _3065 = fma(_2899, _3033, _3041);
    float _3067 = fma(_2825, _3033, _3045);
    float _3069 = fma(_2791, _3047, _3051);
    float _3071 = fma(_2891, _3047, _3055);
    float _3073 = fma(_2819, _3047, _3059);
    float _3075 = fma(_2789, _3037, _3063);
    float _3077 = fma(_2917, _3037, _3065);
    float _3079 = fma(_2821, _3037, _3067);
    out.m_67.x = _2087;
    out.m_67.y = _2020;
    out.m_67.z = _2026;
    out.m_67.w = _2024;
    out.m_69.x = _2795;
    out.m_69.y = _2899;
    out.m_69.z = _2825;
    bool _3081 = _3061 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3083 = isnan(_3061);
    bool _3085 = _3081 || _3083;
    bool _3087 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3089 = _3085 || _3087;
    out.m_71.x = _3069;
    out.m_71.y = _3071;
    out.m_71.z = _3073;
    out.m_73.x = _3075;
    out.m_73.y = _3077;
    out.m_73.z = _3079;
    float _3091 = _3039;
    if (!_3089)
    {
        _3091 = 1.0;
    }
    float _3093 = _3091;
    bool _3095 = !_3089;
    float _3097 = _3093;
    if (!_3095)
    {
        bool _3099 = _3061 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3101 = isnan(_3061);
        bool _3103 = _3099 || _3101;
        bool _3105 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3107 = _3103 || _3105;
        if (!_3107)
        {
            float _3109 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3111 = _3061 + _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3115 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3113;
            float _3117 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3119 = _3117 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3121 = 1.0 / _3115;
            float _3123 = _3111 * _3121;
            float _3125 = fma(_3123, _3119, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3097 = _3125;
            _3127 = true;
        }
        else
        {
            bool _3129 = _3061 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3131 = isnan(_3061);
            bool _3133 = _3129 || _3131;
            bool _3135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3137 = _3133 || _3135;
            if (!_3137)
            {
                float _3139 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3141 = _3061 + _3139;
                float _3143 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3145 = _3143 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3147 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3149 = _3147 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3151 = 1.0 / _3145;
                float _3153 = _3141 * _3151;
                float _3155 = fma(_3153, _3149, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3097 = _3155;
                _3127 = true;
            }
            else
            {
                _3097 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3127 = false;
    float _3157 = _3097;
    float _3159 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3161 = _3011 + _3159;
    float _3163 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3165 = _3017 + _3163;
    float _3167 = fma(_3161, _3157, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3169 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3171 = _3019 + _3169;
    float _3173 = fma(_3165, _3157, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3177 = _3167 + _3175;
    float _3179 = fma(_3171, _3157, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3183 = _3173 + _3181;
    float _3185 = _3177 * _3177;
    float _3187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3189 = _3179 + _3187;
    float _3191 = fma(_3183, _3183, _3185);
    float _3193 = fma(_3189, _3189, _3191);
    float _3195 = rsqrt(_3193);
    float _3197 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3199 = _3183 * _3197;
    float _3201 = _3189 * _3197;
    float _3203 = _3199 * _3199;
    float _3205 = _3201 * _3201;
    float _3207 = _3203 + _3205;
    float _3209 = sqrt(_3207);
    bool _3211 = _3209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3215 = _3209 + _3213;
    float _3217 = _3195;
    float _3219 = _3215;
    float _3221 = _3157;
    float _3223 = _3177;
    float _3225 = _3199;
    if (_3211)
    {
        float _3227 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3217 = _3227;
    }
    float _3229 = _3217;
    if (_3211)
    {
        float _3231 = rsqrt(_3207);
        _3025 = _3231;
    }
    float _3233 = _3025;
    float _3235 = _3233;
    if (_3211)
    {
        float _3237 = _3215 * _3229;
        _3219 = _3237;
    }
    float _3239 = _3219;
    float _3241 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3211)
    {
        float _3243 = _3239 * 0.15915493667125701904296875;
        _3221 = _3243;
    }
    float _3245 = _3221;
    float _3247 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3241);
    float _3249 = _3189;
    if (_3211)
    {
        float _3251 = _3245 * 6.283185482025146484375;
        float _3253 = sin(_3251);
        _3249 = _3253;
    }
    float _3255 = _3249;
    float _3257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3259 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3247);
    float _3261 = precise::max(0.0, _3257);
    float _3263 = _3229;
    float _3265 = _3261;
    if (_3211)
    {
        float _3267 = _3245 * 6.283185482025146484375;
        float _3269 = cos(_3267);
        _3263 = _3269;
    }
    float _3271 = _3263;
    float _3273 = -_3197;
    float _3275 = -_3261;
    float _3277 = fma(_3177, _3273, _3275);
    if (_3211)
    {
        float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3223 = _3279;
    }
    float _3281 = _3223;
    float _3283 = sqrt(_3193);
    float _3285 = _3281;
    float _3287 = _3255;
    if (_3211)
    {
        float _3289 = fma(_3255, _3281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3285 = _3289;
    }
    float _3291 = _3285;
    float _3293 = _3291;
    if (!_3211)
    {
        _3287 = _3201;
    }
    float _3295 = _3287;
    float _3297 = _3295;
    if (_3211)
    {
        float _3299 = _3271 + (-1.0);
        _3265 = _3299;
    }
    float _3301 = _3265;
    float _3303 = _3301;
    if (_3211)
    {
        float _3305 = _3233 * _3291;
        _2959 = _3305;
    }
    float _3307 = _2959;
    if (!_3211)
    {
        _3235 = _3277;
    }
    float _3309 = _3235;
    float _3311 = _3309;
    if (_3211)
    {
        float _3313 = _3301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3303 = _3313;
    }
    float _3315 = _3303;
    float _3317 = _3315;
    if (_3211)
    {
        float _3319 = _3199 * _3307;
        _3225 = _3319;
    }
    float _3321 = _3225;
    if (!_3211)
    {
        _3293 = _3203;
    }
    float _3323 = _3293;
    float _3325 = _3323;
    if (_3211)
    {
        float _3327 = _3201 * _3307;
        _3297 = _3327;
    }
    float _3329 = _3297;
    if (_3211)
    {
        float _3331 = fma(_3277, _3271, _3315);
        _3311 = _3331;
    }
    float _3333 = _3311;
    if (_3211)
    {
        float _3335 = _3321 * _3321;
        _3325 = _3335;
    }
    float _3337 = _3325;
    if (!_3211)
    {
        _3317 = _3205;
    }
    float _3339 = _3317;
    float _3341 = _3339;
    if (_3211)
    {
        float _3343 = _3329 * _3329;
        _3341 = _3343;
    }
    float _3345 = _3341;
    float _3347 = fma(_3333, _3333, _3337);
    float _3349 = _3347 + _3345;
    float _3351 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3355 = fma(_3283, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3353);
    float _3357 = precise::clamp(_3355, 0.0, 1.0);
    float _3359 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3361 = rsqrt(_3349);
    float _3363 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3351);
    float _3365 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3367 = -_3357;
    float _3369 = _3367 + 1.0;
    float _3371 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3363);
    float _3373 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3375 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3365);
    float _3377 = _3371 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3379 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3373);
    float _3381 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3375);
    float _3383 = abs(_3369);
    float _3385 = log2(_3383);
    float _3387 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3389 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3379);
    float _3391 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3393 = _3361 * _3321;
    float _3395 = -_3387;
    float _3397 = fma(_3395, _3359, 1.0);
    float _3399 = _3389 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3401 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3403 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3405 = _3361 * _3329;
    float _3407 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3409 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3401);
    float _3411 = _3361 * _3333;
    float _3413 = log2(_3397);
    float _3415 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3417 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3409);
    float _3419 = -_3403;
    float _3421 = fma(_3411, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3419);
    float _3423 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3425 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3415);
    float _3427 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3417);
    float _3429 = -_3405;
    float _3431 = fma(_3429, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3421);
    float _3433 = exp2(_3423);
    float _3435 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3437 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3425);
    float _3439 = fma(_3431, -0.5, 0.5);
    float _3441 = fma(_3431, 0.5, 0.5);
    float _3443 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3435);
    float _3445 = _3411 + 1.0;
    float _3447 = 1.0 / _3427;
    float _3449 = fma(_3441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3451 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3443);
    float _3453 = _3413 * 0.693147182464599609375;
    float _3455 = fma(_3441, _3449, -0.212114393711090087890625);
    float _3457 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3451);
    float _3459 = sqrt(_3439);
    float _3461 = -_3411;
    float _3463 = fma(_3433, _3445, _3461);
    float _3465 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3437);
    float _3467 = fma(_3441, _3455, 1.570728778839111328125);
    float _3469 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3471 = fma(_3463, 0.5, 0.5);
    float _3473 = _3457 * _3447;
    float _3475 = _3465 * _3447;
    float _3477 = fma(_3473, 0.5, 0.5);
    float _3479 = fma(_3475, -0.5, 0.5);
    float _3481 = _3459 * 0.636619746685028076171875;
    float3 _8794 = float3(_3477, _3479, _3469);
    float _3483 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8794, float3(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8794, float3(0.0), isnan(_8794)), level(0.0)).x;
    float3 _8805 = float3(_3477, _3479, _3469);
    float4 _3485 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8805, float3(0.0), isnan(_8805)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8805, float3(0.0), isnan(_8805)), level(0.0)).xyzw;
    float _3487 = _3485.x;
    float _3489 = _3485.y;
    float _3491 = _3485.z;
    float _3493 = _3485.w;
    float _3495 = -_3467;
    float _3497 = fma(_3481, _3495, 1.0);
    float2 _8826 = float2(_3497, _3471);
    float3 _3501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8826, float2(0.0), isnan(_8826)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8826, float2(0.0), isnan(_8826)), level(0.0)).xyz;
    float _3503 = _3501.x;
    float _3505 = _3501.y;
    float _3507 = _3501.z;
    float _3509 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3511 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2845;
    out.m_75.y = _2927;
    out.m_75.z = _2849;
    float _3513 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3511);
    float _3515 = exp2(_3509);
    out.m_49.x = 1.0;
    float _3517 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3513);
    out.m_77.x = _3173;
    out.m_77.y = _3167;
    out.m_77.z = _3179;
    float _3519 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3517);
    float _3521 = _3519 + _3427;
    out.gl_Position.x = _3457;
    out.gl_Position.y = _3465;
    out.gl_Position.z = _3519;
    out.gl_Position.w = _3427;
    float _3523 = -_3515;
    float _3525 = _3523 + 1.0;
    float _3527 = _3525 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3529 = _3521 * 0.5;
    float _3531 = -_3527;
    float _3533 = _3531 + 1.0;
    float _3535 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3529;
    out.m_79.w = _3427;
    out.m_81.w = _3535;
    float _3537 = _3527 * _3483;
    float _3539 = _3493 * _3537;
    float _3541 = _3507 * _3537;
    float _3543 = fma(_3503, _3539, _3487);
    float _3545 = fma(_3505, _3539, _3489);
    float _3547 = _3493 * _3533;
    float _3549 = fma(_3493, _3541, _3491);
    out.m_83.x = _3543;
    out.m_83.y = _3545;
    out.m_83.z = _3549;
    out.m_83.w = _3547;
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
    bool _3127 = false;
    bool _2307 = false;
    bool _2117 = false;
    bool _1555 = false;
    bool _1235 = false;
    bool _1105 = false;
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
        float _3606 = as_type<float>(_123);
        out.gl_Position.z = _3606;
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
        float _3678 = as_type<float>(_165);
        out.gl_Position.z = _3678;
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
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _647 = _643 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _651 = _643 + _649;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _655 = _643 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _673 = 1.0 / _659;
    bool _675 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _677 = isnan(_643);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = 1.0 / _663;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _691 = _643 + _689;
    bool _693 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _695 = 1.0 / _671;
    float _697 = _651 * _673;
    float _699 = 1.0 / _667;
    float _701 = _647 * _687;
    bool _703 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _705 = isnan(_643);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _715;
    float _719 = fma(_717, _697, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _721 = _691 * _695;
    bool _723 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _725 = isnan(_643);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    bool _735 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _737 = isnan(_643);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -_733;
    float _749 = _747 + 1.0;
    float _751 = _655 * _699;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _753;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _757;
    float _761 = _745 * _749;
    float _763 = -_745;
    float _765 = _763 + 1.0;
    float _767 = fma(_755, _697, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _769 = fma(_759, _697, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _771 = -_713;
    float _773 = _771 + 1.0;
    float _775 = _713 * _765;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _781 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _783 = isnan(_643);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = _685 * _773;
    float _795 = -_685;
    float _797 = _795 + 1.0;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _801 = _799 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _807 = fma(_779, _701, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _809 = _791 * _797;
    float _811 = -_791;
    float _813 = _811 + 1.0;
    float _815 = fma(_801, _701, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _817 = fma(_805, _701, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _819 = _719 * _809;
    float _821 = _767 * _809;
    float _823 = _769 * _809;
    float _825 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].x, _819);
    float _827 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].y, _821);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _829;
    float _833 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[143].z, _823);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _839;
    float _843 = fma(_831, _751, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _845 = fma(_815, _793, _825);
    float _847 = fma(_807, _793, _833);
    float _849 = fma(_817, _793, _827);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _859 = fma(_837, _751, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _861 = fma(_841, _751, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _867 = fma(_843, _775, _845);
    float _869 = fma(_853, _721, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _871 = fma(_857, _721, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _873 = fma(_865, _721, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _875 = fma(_859, _775, _849);
    float _877 = fma(_861, _775, _847);
    float _879 = fma(_869, _761, _867);
    float _881 = fma(_871, _761, _875);
    float _883 = fma(_873, _761, _877);
    float _885 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[147].x, _879);
    float _887 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[147].y, _881);
    float _889 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[147].z, _883);
    bool _891 = !_693;
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
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _923 = _919 + _921;
    bool _925 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _927 = isnan(_919);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _939 = _919 + _937;
    bool _941 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _943 = isnan(_919);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _949 = _945 || _947;
    float _951 = float(_949);
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _961 = _919 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _963 = isnan(_919);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = -_935;
    float _975 = _973 + 1.0;
    float _977 = 1.0 / _955;
    float _979 = _971 * _975;
    float _981 = -_971;
    float _983 = _981 + 1.0;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _985;
    float _989 = 1.0 / _959;
    float _991 = _951 * _983;
    float _993 = -_951;
    float _995 = _993 + 1.0;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _999 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1001 = _923 * _977;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1007;
    float _1011 = fma(_987, _1001, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1013 = fma(_1005, _1001, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1015 = fma(_1009, _1001, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1017 = _939 * _989;
    float _1019 = _1011 * _991;
    float _1021 = _1013 * _991;
    float _1023 = _1015 * _991;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1027 = _1025 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1037 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1019);
    float _1039 = fma(_1027, _1017, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1041 = fma(_1031, _1017, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1043 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1021);
    float _1045 = fma(_1035, _1017, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1047 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1023);
    float _1049 = fma(_1039, _979, _1037);
    float _1051 = fma(_1041, _979, _1043);
    float _1053 = fma(_1045, _979, _1047);
    float _1055 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1049);
    float _1057 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1051);
    float _1059 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1053);
    float _1061 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1063 = _1057 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1065 = in.m_53.x;
    float _1067 = in.m_53.y;
    float _1069 = in.m_53.z;
    float _1071 = _1059 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1073 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1075 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1073;
    out.m_57.y = _1075;
    out.m_57.z = _1077;
    out.m_57.w = _997;
    float _1079 = _889 * _1069;
    float _1081 = _887 * _1067;
    float _1083 = _885 * _1065;
    bool _1085 = !_999;
    float _1103;
    if (!_1085)
    {
        float _1087 = in.m_55.x;
        float _1089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1091 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _1095 = _1093 * _1089;
        float _1097 = floor(_1095);
        float _1099 = -_1097;
        float _1101 = _1095 + _1099;
        _1103 = _1101;
        _1105 = true;
    }
    else
    {
        float _1107 = float(_107);
        float _1109 = 1.0 / _1107;
        float _1111 = _141 * _1109;
        _1103 = _1111;
    }
    _1105 = false;
    float _1113 = _1103;
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1117 = _1113 + _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1123 = _1113 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1125 = isnan(_1113);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1139 = _1113 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1141 = isnan(_1113);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1151;
    bool _1155 = _1113 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1157 = isnan(_1113);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = 1.0 / _1121;
    float _1169 = -_1133;
    float _1171 = _1169 + 1.0;
    bool _1173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1175 = 1.0 / _1137;
    float _1177 = _1153 * _1167;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1183 = -_1165;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_1177, _1117, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1189 = _1149 * _1171;
    float _1191 = -_1149;
    float _1193 = _1191 + 1.0;
    float _1195 = _1133 * _1185;
    float _1197 = _1181 * _1175;
    float _1199 = _1187 * _1189;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1203 = _1113 + _1201;
    float _1205 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1199);
    float _1207 = fma(_1197, _1203, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1209 = fma(_1207, _1195, _1205);
    float _1211 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1209);
    float _1213 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1213;
    bool _1215 = !_1173;
    float _1233;
    if (!_1215)
    {
        float _1217 = in.m_55.x;
        float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1221 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[14].x, _141);
        float _1225 = _1223 * _1219;
        float _1227 = floor(_1225);
        float _1229 = -_1227;
        float _1231 = _1225 + _1229;
        _1233 = _1231;
        _1235 = true;
    }
    else
    {
        float _1237 = float(_107);
        float _1239 = 1.0 / _1237;
        float _1241 = _141 * _1239;
        _1233 = _1241;
    }
    _1235 = false;
    float _1243 = _1233;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1247 = _1243 + _1245;
    bool _1249 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1251 = isnan(_1243);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1265 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1267 = isnan(_1243);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1277;
    bool _1281 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1283 = isnan(_1243);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = -_1259;
    float _1295 = _1293 + 1.0;
    float _1297 = 1.0 / _1263;
    bool _1299 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1301 = isnan(_1243);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    float _1311 = -_1291;
    float _1313 = _1311 + 1.0;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1321 = 1.0 / _1317;
    float _1323 = _1279 * _1297;
    float _1325 = -_1275;
    float _1327 = _1325 + 1.0;
    float _1329 = _1275 * _1295;
    bool _1331 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1333 = isnan(_1243);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = fma(_1323, _1247, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1345 = _1291 * _1327;
    float _1347 = _1309 * _1313;
    float _1349 = -_1309;
    float _1351 = _1349 + 1.0;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1357 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1359 = isnan(_1243);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1365 = _1361 || _1363;
    float _1367 = float(_1365);
    float _1369 = _1341 * _1351;
    float _1371 = -_1341;
    float _1373 = _1371 + 1.0;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1379 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1381 = isnan(_1243);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = 1.0 / _1355;
    float _1393 = _1367 * _1373;
    float _1395 = -_1367;
    float _1397 = _1395 + 1.0;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1403 = _1389 * _1397;
    float _1405 = 1.0 / _1377;
    float _1407 = _1401 * _1321;
    float _1409 = -_1389;
    float _1411 = _1409 + 1.0;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1417;
    float _1421 = 1.0 / _1415;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1425 = _1423 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1427 = _1343 * _1403;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1431 = _1243 + _1429;
    float _1433 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1427);
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1439 = 1.0 / _1425;
    float _1441 = _1419 * _1405;
    float _1443 = fma(_1407, _1431, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1447 = _1243 + _1445;
    float _1449 = fma(_1443, _1393, _1433);
    float _1451 = fma(_1441, _1447, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1453 = 1.0 / _1437;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1465 = _1243 + _1463;
    float _1467 = _1457 * _1391;
    float _1469 = fma(_1451, _1369, _1449);
    float _1471 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1473 = _1471 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1475 = _1461 * _1439;
    float _1477 = fma(_1467, _1465, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1481 = _1243 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1483;
    bool _1487 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1489 = isnan(_1243);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = _1473 * _1421;
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1503 = _1243 + _1501;
    float _1505 = fma(_1475, _1481, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1507 = fma(_1477, _1347, _1469);
    float _1509 = _1485 * _1453;
    float _1511 = fma(_1499, _1503, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1513 = -_1497;
    float _1515 = _1513 + 1.0;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1519 = _1243 + _1517;
    float _1521 = fma(_1505, _1345, _1507);
    float _1523 = _1259 * _1515;
    float _1525 = fma(_1509, _1519, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1527 = fma(_1511, _1329, _1521);
    float _1529 = fma(_1525, _1523, _1527);
    float _1531 = fma(_1497, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1529);
    float _1533 = precise::clamp(_1531, 0.0, 1.0);
    bool _1535 = !_1319;
    float _1553;
    if (!_1535)
    {
        float _1537 = in.m_55.x;
        float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1541 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[14].z, _141);
        float _1545 = _1543 * _1539;
        float _1547 = floor(_1545);
        float _1549 = -_1547;
        float _1551 = _1545 + _1549;
        _1553 = _1551;
        _1555 = true;
    }
    else
    {
        float _1557 = float(_107);
        float _1559 = 1.0 / _1557;
        float _1561 = _141 * _1559;
        _1553 = _1561;
    }
    _1555 = false;
    float _1563 = _1553;
    int _1565 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1567 = _1565;
    int _1569 = 0;
    int _1571 = _98(_1567, _1569, (*spvDescriptorSet0.support_buffer));
    float _1573 = in.m_61.z;
    float _1575 = trunc(_1573);
    int _1577 = int(_1575);
    int _1579 = _1571 + (-1);
    float _1581 = float(_1579);
    float _1583 = _1533 * _1581;
    float _1585 = trunc(_1583);
    int _1587 = int(_1585);
    int _1589 = _1587;
    int _1591 = 0;
    int _1593 = _99(_1589, _1591, (*spvDescriptorSet0.support_buffer));
    int _1595 = _1577;
    int _1597 = 0;
    int _1599 = _99(_1595, _1597, (*spvDescriptorSet0.support_buffer));
    float4 _1602 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1593, _1599)), 0).xyzw;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = _1602.w;
    float _1612 = in.m_55.w;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1616 = _1614 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1622 = 1.0 / _1616;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1634 = _1632 != 0;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1638 = _1636 != 0;
    float _1640 = 1.0 / _1620;
    bool _1642 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1644 = isnan(_1563);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1660 = _1658 != 0;
    float _1662 = -_1652;
    float _1664 = _1662 + 1.0;
    bool _1666 = _1612 > 0.5;
    bool _1668 = _1666 && _1634;
    float _1670 = 1.0 / _1626;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1672;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1678 = _1676 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1680 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1682 = isnan(_1563);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1688 = _1684 || _1686;
    float _1690 = float(_1688);
    float _1692 = _1674 * _1622;
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1694;
    float _1698 = 1.0 / _1630;
    bool _1700 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1702 = isnan(_1563);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1708 = _1704 || _1706;
    float _1710 = float(_1708);
    float _1712 = _1678 * _1640;
    float _1714 = _1690 * _1664;
    float _1716 = -_1690;
    float _1718 = _1716 + 1.0;
    bool _1720 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1722 = isnan(_1563);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1728 = _1724 || _1726;
    float _1730 = float(_1728);
    float _1732 = -_1710;
    float _1734 = _1732 + 1.0;
    float _1736 = _1696 * _1670;
    float _1738 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1740 = _1738 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    bool _1742 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1744 = isnan(_1563);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = _1710 * _1718;
    float _1756 = _1730 * _1734;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1760 = _1758 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1762 = -_1730;
    float _1764 = _1762 + 1.0;
    bool _1766 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1768 = isnan(_1563);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1774 = _1770 || _1772;
    float _1776 = float(_1774);
    float _1778 = _1740 * _1698;
    float _1780 = -_1752;
    float _1782 = _1780 + 1.0;
    float _1784 = _1752 * _1764;
    bool _1786 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1788 = isnan(_1563);
    bool _1790 = _1786 || _1788;
    bool _1792 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1794 = _1790 || _1792;
    float _1796 = float(_1794);
    float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1800 = _1563 + _1798;
    float _1802 = _1776 * _1782;
    float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1806 = _1804 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1808 = -_1776;
    float _1810 = _1808 + 1.0;
    float _1812 = 1.0 / _1760;
    float _1814 = fma(_1692, _1800, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1816 = _1796 * _1810;
    float _1818 = _1814 * _1816;
    float _1820 = 1.0 / _1806;
    float _1822 = -_1796;
    float _1824 = _1822 + 1.0;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1828 = _1563 + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1832 = _1830 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1834;
    float _1838 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1818);
    float _1840 = fma(_1712, _1828, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1844 = _1842 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1846 = _1836 * _1812;
    float _1848 = in.m_61.x;
    float _1850 = 1.0 / _1832;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1854 = _1563 + _1852;
    float _1856 = fma(_1840, _1802, _1838);
    float _1858 = in.m_55.y;
    float _1860 = fma(_1736, _1854, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1862 = _1844 * _1820;
    float _1864 = in.m_61.y;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1868 = _1563 + _1866;
    int _1870 = as_type<int>(_1802);
    float _1872 = _1652;
    float _1874 = _1754;
    int _1876 = as_type<int>(_1563);
    if (_1638)
    {
        float _1878 = in.m_55.x;
        _1870 = as_type<int>(_1878);
    }
    int _1880 = _1870;
    float _1882 = fma(_1778, _1868, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1884;
    float _1888 = fma(_1860, _1784, _1856);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1892 = _1563 + _1890;
    bool _1894 = _1563 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1896 = isnan(_1563);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = _1886 * _1850;
    float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1910 = _1563 + _1908;
    float _1912 = fma(_1846, _1892, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1914 = fma(_1882, _1756, _1888);
    float _1916 = -_1904;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1862, _1910, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1924 = _1563 + _1922;
    float _1926 = fma(_1912, _1754, _1914);
    float _1928 = _1652 * _1918;
    int _1930 = as_type<int>(_1926);
    if (!_1638)
    {
        _1872 = _1848;
    }
    float _1932 = _1872;
    float _1934 = _1824;
    float _1936 = _1932;
    if (_1656)
    {
        float _1938 = in.m_55.z;
        _1934 = _1938;
    }
    float _1940 = _1934;
    float _1942 = fma(_1920, _1714, _1926);
    float _1944 = fma(_1906, _1924, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1946 = -_1864;
    float _1948 = _1946 + 1.0;
    if (!_1638)
    {
        _1874 = _1932;
    }
    float _1950 = _1874;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1954 = _1950;
    if (_1638)
    {
        _1936 = _1848;
    }
    float _1956 = _1936;
    float _1958 = fma(_1944, _1928, _1942);
    float _1960 = _1668 ? _1948 : _1864;
    bool _1962 = false;
    float _1964 = _1956;
    int _1966 = _1880;
    if (_1638)
    {
        bool _1968 = as_type<float>(_1880) > 0.5;
        _1962 = _1968;
    }
    bool _1970 = _1962;
    if (_1638)
    {
        float _1972 = -_1956;
        float _1974 = _1972 + 1.0;
        _1876 = as_type<int>(_1974);
    }
    int _1976 = _1876;
    bool _1978 = _1858 > 0.5;
    bool _1980 = _1978 && _1660;
    if (_1656)
    {
        float _1982 = -_1956;
        float _1984 = _1982 + 1.0;
        _1930 = as_type<int>(_1984);
    }
    int _1986 = _1930;
    float _1988 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1958);
    float _1990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1638)
    {
        float _1992 = _1970 ? as_type<float>(_1976) : _1956;
        _1954 = _1992;
    }
    float _1994 = _1954;
    float _1996 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1998 = _1587 + 1;
    out.m_63.x = _1988;
    float _2000 = _1980 ? _1948 : _1864;
    int _2002 = min(_1579, _1998);
    bool _2004 = false;
    if (_1656)
    {
        bool _2006 = _1940 > 0.5;
        _2004 = _2006;
    }
    bool _2008 = _2004;
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1656)
    {
        float _2014 = _2008 ? as_type<float>(_1986) : _1956;
        _1964 = _2014;
    }
    float _2016 = _1964;
    float _2018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2020 = _2012 * _2010;
    float _2022 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2024 = _1996 * _1990;
    float _2026 = _2022 * _2018;
    uint _2029 = as_type<uint>(half2(float2(_1610, 0.0)));
    uint _2031 = extract_bits(_2029, 0u, 8u);
    int _2033 = int(_2031) & 255;
    uint _2035 = extract_bits(_2029, 8u, 8u);
    int _2037 = int(_2035) & 255;
    int _2039 = _2037 << 8;
    int _2041 = _2033 | _2039;
    bool _2043 = _2041 >= 32768;
    int _2045 = _2041 + (-1024);
    int _2047 = _2045;
    if (_2043)
    {
        int _2049 = ~_2041;
        int _2051 = _2049 + 33792;
        int _2053 = _2051 + 1;
        _2047 = _2053;
    }
    int _2055 = _2047;
    int _2057 = _2055 + 30719;
    float _2059 = float(_2057);
    float _2061 = fma(_2059, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2063 = abs(_2061);
    float _2065 = -_2063;
    float _2067 = _2065 + 1.0;
    bool _2069 = _2061 < 0.0;
    float _2071 = float(_2069);
    float _2073 = abs(_2061);
    float _2075 = fma(_2073, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2077 = as_type<int>(_2067) + (-218103808);
    float _2079 = abs(_2061);
    float _2081 = fma(_2079, _2075, -0.212114393711090087890625);
    bool _2083 = uint(_2077) >= 1920991232u;
    float _2085 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2087 = _2085 * _1952;
    float _2089 = abs(_2061);
    float _2091 = fma(_2089, _2081, 1.570728778839111328125);
    bool _2093 = !_2083;
    float _2115;
    if (!_2093)
    {
        int _2095 = as_type<int>(_2067);
        int _2097 = as_type<int>(_2018);
        int _2099 = _1880;
        int _2101 = 10608;
        int _2103;
        int _2105;
        int _2107;
        int _2109;
        int _2111;
        int _2113;
        _96(_2095, _2097, _2099, _2101, _2103, _2105, _2107, _2109, _2111, _2113, out.gl_Position, out.gl_PointSize);
        _2115 = as_type<float>(_2103);
        _1966 = _2111;
        _2117 = true;
    }
    else
    {
        float _2119 = rsqrt(_2067);
        float _2121 = _2067 * _2119;
        float _2123 = _2119 * 0.5;
        float _2125 = -_2121;
        float _2127 = 0.0 + _2125;
        float _2129 = fma(_2123, _2127, 0.5);
        float _2131 = fma(_2121, _2129, _2121);
        float _2133 = -_2131;
        float _2135 = 0.0 + _2133;
        float _2137 = fma(_2131, _2135, _2067);
        float _2139 = fma(_2123, _2137, _2131);
        _2115 = _2139;
    }
    _2117 = false;
    float _2141 = _2115;
    int _2143 = _1966;
    int _2145 = _2002;
    int _2147 = 0;
    int _2149 = _99(_2145, _2147, (*spvDescriptorSet0.support_buffer));
    int _2151 = _1577;
    int _2153 = 0;
    int _2155 = _99(_2151, _2153, (*spvDescriptorSet0.support_buffer));
    float4 _2157 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2149, _2155)), 0).xyzw;
    float _2159 = _2157.x;
    float _2161 = _2157.y;
    float _2163 = _2157.z;
    float _2165 = _2157.w;
    float _2167 = _2059 * 3.883221149444580078125;
    float _2169 = floor(_1583);
    float _2171 = _2091 * _2141;
    float _2173 = _2071 * 2.0;
    float _2175 = _2167 * 0.15915493667125701904296875;
    float _2177 = -_2173;
    float _2179 = fma(_2171, _2177, _2171);
    float _2181 = _2175 * 6.283185482025146484375;
    float _2183 = cos(_2181);
    float _2185 = fma(_2071, 3.1415927410125732421875, _2179);
    float _2187 = _2185 * 0.15915493667125701904296875;
    float _2189 = -_2169;
    float _2191 = _1583 + _2189;
    float _2193 = _2175 * 6.283185482025146484375;
    float _2195 = sin(_2193);
    float _2197 = _2187 * 6.283185482025146484375;
    float _2199 = sin(_2197);
    uint _2201 = as_type<uint>(half2(float2(_2165, 0.0)));
    float _2203 = _2199 * _2183;
    float _2205 = -_1604;
    float _2207 = _2205 + _2159;
    float _2209 = _2199 * _2195;
    uint _2211 = extract_bits(_2201, 0u, 8u);
    int _2213 = int(_2211) & 255;
    uint _2215 = extract_bits(_2201, 8u, 8u);
    int _2217 = int(_2215) & 255;
    int _2219 = _2217 << 8;
    int _2221 = _2213 | _2219;
    float _2223 = fma(_2191, _2207, _1604);
    bool _2225 = _2221 >= 32768;
    int _2227 = _2221 + (-1024);
    int _2229 = _2227;
    if (_2225)
    {
        int _2231 = ~_2221;
        int _2233 = _2231 + 33792;
        int _2235 = _2233 + 1;
        _2229 = _2235;
    }
    int _2237 = _2229;
    int _2239 = _2237 + 30719;
    float _2241 = float(_2239);
    float _2243 = -_1606;
    float _2245 = _2243 + _2161;
    float _2247 = fma(_2241, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2249 = fma(_2191, _2245, _1606);
    float _2251 = abs(_2247);
    float _2253 = -_2251;
    float _2255 = _2253 + 1.0;
    float _2257 = abs(_2247);
    float _2259 = fma(_2257, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2261 = _2247 < 0.0;
    float _2263 = float(_2261);
    int _2265 = as_type<int>(_2255) + (-218103808);
    float _2267 = abs(_2247);
    float _2269 = fma(_2267, _2259, -0.212114393711090087890625);
    bool _2271 = uint(_2265) >= 1920991232u;
    float _2273 = -_1608;
    float _2275 = _2273 + _2163;
    float _2277 = abs(_2247);
    float _2279 = fma(_2277, _2269, 1.570728778839111328125);
    float _2281 = fma(_2191, _2275, _1608);
    bool _2283 = !_2271;
    float _2305;
    if (!_2283)
    {
        int _2285 = as_type<int>(_2255);
        int _2287 = as_type<int>(_2169);
        int _2289 = _2143;
        int _2291 = 11488;
        int _2293;
        int _2295;
        int _2297;
        int _2299;
        int _2301;
        int _2303;
        _96(_2285, _2287, _2289, _2291, _2293, _2295, _2297, _2299, _2301, _2303, out.gl_Position, out.gl_PointSize);
        _2305 = as_type<float>(_2293);
        _2307 = true;
    }
    else
    {
        float _2309 = rsqrt(_2255);
        float _2311 = _2255 * _2309;
        float _2313 = _2309 * 0.5;
        float _2315 = -_2311;
        float _2317 = 0.0 + _2315;
        float _2319 = fma(_2313, _2317, 0.5);
        float _2321 = fma(_2311, _2319, _2311);
        float _2323 = -_2321;
        float _2325 = 0.0 + _2323;
        float _2327 = fma(_2321, _2325, _2255);
        float _2329 = fma(_2313, _2327, _2321);
        _2305 = _2329;
    }
    _2307 = false;
    float _2331 = _2305;
    float _2333 = in.m_55.x;
    float _2335 = in.m_55.y;
    float _2337 = in.m_55.z;
    float _2339 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2341 = log2(_2339);
    float _2343 = _607 * _607;
    float _2345 = _2279 * _2331;
    float _2347 = fma(_609, _609, _2343);
    int _2349 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2351 = _2349 != 0;
    int _2353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2355 = _2353 != 0;
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2359 = _2357 != 0;
    float _2361 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2363 = fma(_611, _611, _2347);
    float _2365 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2367 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2369 = rsqrt(_2363);
    float _2371 = _2341 * _141;
    float _2373 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2367);
    float _2375 = _2337 * 2.0;
    float _2377 = _2333 * 2.0;
    float _2379 = _2333 + _2337;
    float _2381 = exp2(_2371);
    float _2383 = _2335 * 2.0;
    float _2385 = _2379 + (-1.0);
    float _2387 = _2369 * _609;
    float _2389 = _2369 * _607;
    float _2391 = fma(_2385, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2393 = floor(_2375);
    float _2395 = _2335 + _2333;
    float _2397 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2399 = _2387 * _2397;
    float _2401 = _2395 + (-1.0);
    float _2403 = floor(_2377);
    bool _2405 = _2393 > 0.0;
    float _2407 = floor(_2383);
    bool _2409 = _2393 >= 0.0;
    bool _2411 = isnan(_2393);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan(0.0);
    bool _2417 = _2413 || _2415;
    int _2419 = _2417 ? 0 : 1;
    bool _2421 = _2403 > 0.0;
    float _2423 = fma(_2401, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2425 = _2403 >= 0.0;
    bool _2427 = isnan(_2403);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2437 = 1.0 + _2435;
    bool _2439 = !_2351;
    int _2441 = _2439 ? 0 : 1;
    int _2443 = ~_2419;
    int _2445 = _2443 + 1;
    int _2447 = _2445 + 1;
    float _2449 = 1.0 / _2437;
    int _2451 = _2447;
    if (!_2405)
    {
        int _2453 = ~_2419;
        int _2455 = _2453 + 1;
        _2451 = _2455;
    }
    int _2457 = _2451;
    float _2459 = _2369 * _611;
    int _2461 = abs(_2441);
    float _2463 = -_2381;
    float _2465 = _2463 + 1.0;
    bool _2467 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2469 = isnan(1.0);
    bool _2471 = _2467 || _2469;
    bool _2473 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2475 = _2471 || _2473;
    int _2477 = _2433 ? 0 : 1;
    float _2479 = in.m_65.x;
    float _2481 = in.m_65.y;
    float _2483 = in.m_65.z;
    bool _2485 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2487 = isnan(0.0);
    bool _2489 = _2485 || _2487;
    bool _2491 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2493 = _2489 || _2491;
    bool _2495 = _2407 > 0.0;
    float _2497 = _2493 ? _2465 : 0.0;
    bool _2499 = _2407 >= 0.0;
    bool _2501 = isnan(_2407);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan(0.0);
    bool _2507 = _2503 || _2505;
    float _2509 = float(_2461);
    if (_2475)
    {
        float _2511 = _2497 * _2449;
        _147 = _2511;
    }
    float _2513 = _147;
    float _2515 = float(_2457);
    float _2517 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2519 = _2459 * _2517;
    int _2521 = _2507 ? 0 : 1;
    bool _2523 = !_2359;
    int _2525 = _2523 ? 0 : 1;
    float _2527 = _2509 * _2515;
    int _2529 = ~_2521;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    float _2535 = _2333 + (-0.5);
    int _2537 = _2533;
    if (!_2495)
    {
        int _2539 = ~_2521;
        int _2541 = _2539 + 1;
        _2537 = _2541;
    }
    int _2543 = _2537;
    float _2545 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2547 = -_2519;
    float _2549 = fma(_2387, _2545, _2547);
    int _2551 = abs(_2525);
    float _2553 = _2527 * (-2.0);
    float _2555 = float(_2543);
    float _2557 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2559 = _2389 * _2557;
    float _2561 = float(_2551);
    float _2563 = fma(_2553, _2479, _2479);
    int _2565 = ~_2477;
    int _2567 = _2565 + 1;
    int _2569 = _2567 + 1;
    float _2571 = fma(_2423, _2553, _2423);
    int _2573 = _2569;
    if (!_2421)
    {
        int _2575 = ~_2477;
        int _2577 = _2575 + 1;
        _2573 = _2577;
    }
    int _2579 = _2573;
    float _2581 = fma(_2535, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2563);
    bool _2583 = !_2355;
    int _2585 = _2583 ? 0 : 1;
    float _2587 = _2561 * _2555;
    float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2591 = -_2559;
    float _2593 = fma(_2459, _2589, _2591);
    float _2595 = fma(_2571, _2513, _2581);
    int _2597 = abs(_2585);
    float _2599 = _2587 * (-2.0);
    float _2601 = _2337 + (-0.5);
    float _2603 = _2595 * 0.15915493667125701904296875;
    float _2605 = float(_2597);
    float _2607 = fma(_2599, _2483, _2483);
    float _2609 = float(_2579);
    float _2611 = fma(_2391, _2599, _2391);
    float _2613 = _2549 * _2549;
    float _2615 = fma(_2601, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2607);
    float _2617 = _2335 + _2337;
    float _2619 = _2605 * _2609;
    float _2621 = _2335 + (-0.5);
    float _2623 = _2617 + (-1.0);
    float _2625 = _2619 * (-2.0);
    float _2627 = fma(_2611, _2513, _2615);
    float _2629 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2631 = -_2399;
    float _2633 = fma(_2389, _2629, _2631);
    float _2635 = fma(_2623, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2637 = fma(_2625, _2481, _2481);
    float _2639 = fma(_2593, _2593, _2613);
    float _2641 = _2627 * 0.15915493667125701904296875;
    float _2643 = fma(_2635, _2625, _2635);
    float _2645 = fma(_2621, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2637);
    float _2647 = fma(_2633, _2633, _2639);
    float _2649 = _2603 * 6.283185482025146484375;
    float _2651 = sin(_2649);
    float _2653 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2655 = fma(_2643, _2513, _2645);
    float _2657 = _2263 * 2.0;
    float _2659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2249);
    float _2661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2223);
    float _2663 = _2655 * 0.15915493667125701904296875;
    float _2665 = -_2657;
    float _2667 = fma(_2345, _2665, _2345);
    float _2669 = _2603 * 6.283185482025146484375;
    float _2671 = cos(_2669);
    float _2673 = _2365 * _2659;
    float _2675 = _2653 * _2661;
    float _2677 = fma(_2263, 3.1415927410125732421875, _2667);
    float _2679 = _2241 * 3.883221149444580078125;
    float _2681 = -_2061;
    float _2683 = _2681 + _2247;
    bool _2685 = _2249 != 0.0;
    bool _2687 = isnan(_2249);
    bool _2689 = _2685 || _2687;
    bool _2691 = isnan(0.0);
    bool _2693 = _2689 || _2691;
    float _2695 = _2641 * 6.283185482025146484375;
    float _2697 = sin(_2695);
    float _2699 = _2679 * 0.15915493667125701904296875;
    float _2701 = fma(_2191, _2683, _2061);
    bool _2703 = _2223 == 0.0;
    bool _2705 = !_2693;
    bool _2707 = _2703 && _2705;
    float _2709 = fma(_2249, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2701);
    bool _2711 = _2281 == 0.0;
    bool _2713 = _2711 && _2707;
    float _2715 = _2641 * 6.283185482025146484375;
    float _2717 = cos(_2715);
    float _2719 = _2663 * 6.283185482025146484375;
    float _2721 = sin(_2719);
    float _2723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2281);
    float _2725 = _2671 * _2697;
    float _2727 = _2361 * _2723;
    float _2729 = _2651 * _2697;
    float _2731 = rsqrt(_2647);
    float _2733 = _2651 * _2717;
    float _2735 = _2663 * 6.283185482025146484375;
    float _2737 = cos(_2735);
    float _2739 = -_2725;
    float _2741 = fma(_2721, _2733, _2739);
    float _2743 = -_2733;
    float _2745 = fma(_2721, _2725, _2743);
    float _2747 = _2745 * _2387;
    float _2749 = _2745 * _2459;
    float _2751 = _2633 * _2731;
    float _2753 = _2671 * _2717;
    float _2755 = _2593 * _2731;
    float _2757 = _2549 * _2731;
    float _2759 = _2389 * _2751;
    float _2761 = fma(_2721, _2729, _2753);
    float _2763 = fma(_2721, _2753, _2729);
    float _2765 = _2737 * _2697;
    float _2767 = _2737 * _2717;
    float _2769 = _2651 * _2737;
    float _2771 = _2671 * _2737;
    float _2773 = _2761 * _2387;
    float _2775 = _2765 * _2387;
    float _2777 = -_2759;
    float _2779 = fma(_2459, _2757, _2777);
    float _2781 = fma(_2763, _2755, _2747);
    float _2783 = fma(_2741, _2755, _2773);
    float _2785 = fma(_2767, _2755, _2775);
    float _2787 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2789 = fma(_2771, _2779, _2781);
    float _2791 = fma(_2769, _2779, _2783);
    float _2793 = -_2721;
    float _2795 = fma(_2793, _2779, _2785);
    float _2797 = _2387 * _2757;
    float _2799 = _2761 * _2459;
    float _2801 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2787);
    float _2803 = _2765 * _2459;
    float _2805 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2807 = -_2797;
    float _2809 = fma(_2389, _2755, _2807);
    float _2811 = fma(_2741, _2751, _2799);
    float _2813 = fma(_2763, _2751, _2749);
    float _2815 = fma(_2767, _2751, _2803);
    float _2817 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2805);
    float _2819 = fma(_2769, _2809, _2811);
    float _2821 = fma(_2771, _2809, _2813);
    float _2823 = -_2721;
    float _2825 = fma(_2823, _2809, _2815);
    float _2827 = _2673 * _2791;
    float _2829 = _2673 * _2819;
    float _2831 = _2677 * 0.15915493667125701904296875;
    float _2833 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2801);
    float _2835 = fma(_2675, _2795, _2827);
    float _2837 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2817);
    float _2839 = fma(_2675, _2825, _2829);
    float _2841 = _2699 * 6.283185482025146484375;
    float _2843 = sin(_2841);
    float _2845 = _2833 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2847 = fma(_2727, _2789, _2835);
    float _2849 = _2837 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2851 = fma(_2727, _2821, _2839);
    float _2853 = _2459 * _2755;
    float _2855 = _2845 + _2847;
    float _2857 = _2765 * _2389;
    float _2859 = _2831 * 6.283185482025146484375;
    float _2861 = sin(_2859);
    float _2863 = _2849 + _2851;
    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2867 = _2855 + _2865;
    float _2869 = -_2853;
    float _2871 = fma(_2387, _2751, _2869);
    float _2873 = _2761 * _2389;
    float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2877 = _2863 + _2875;
    float _2879 = _2867 * _2867;
    float _2881 = fma(_2767, _2757, _2857);
    float _2883 = fma(_2741, _2757, _2873);
    float _2885 = _2877 * _2877;
    float _2887 = _2745 * _2389;
    float _2889 = _2713 ? _2701 : _2709;
    float _2891 = fma(_2769, _2871, _2883);
    float _2893 = _2879 + _2885;
    float _2895 = fma(_2763, _2757, _2887);
    float _2897 = -_2721;
    float _2899 = fma(_2897, _2871, _2881);
    float _2901 = -_2209;
    float _2903 = fma(_2861, _2843, _2901);
    float _2905 = _2673 * _2891;
    float _2907 = _2699 * 6.283185482025146484375;
    float _2909 = cos(_2907);
    float _2911 = _2889 * _2889;
    float _2913 = fma(_2191, _2903, _2209);
    float _2915 = fma(_2675, _2899, _2905);
    float _2917 = fma(_2771, _2871, _2895);
    float _2919 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2373);
    float _2921 = fma(_2281, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2913);
    float _2923 = sqrt(_2893);
    float _2925 = fma(_2727, _2917, _2915);
    float _2927 = _2919 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2929 = _2713 ? _2913 : _2921;
    float _2931 = _2927 + _2925;
    float _2933 = fma(_2929, _2929, _2911);
    float _2935 = -_2203;
    float _2937 = fma(_2861, _2909, _2935);
    float _2939 = rsqrt(_2933);
    float _2941 = fma(_2191, _2937, _2203);
    bool _2943 = _2923 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2945 = _2879;
    float _2947 = _2885;
    float _2949 = _2855;
    float _2951 = _2863;
    float _2953 = _2701;
    float _2955 = _2941;
    float _2957 = _2913;
    float _2959 = _2921;
    if (!_2943)
    {
        _445 = _2931;
    }
    float _2961 = _445;
    bool _2963 = !_2943;
    float _2965 = _2961;
    if (!_2963)
    {
        float _2967 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2971 = _2923 + _2969;
        float _2973 = rsqrt(_2893);
        float _2975 = _2971 * _2967;
        float _2977 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2979 = _2975 * 0.15915493667125701904296875;
        float _2981 = _2979 * 6.283185482025146484375;
        float _2983 = sin(_2981);
        float _2985 = _2979 * 6.283185482025146484375;
        float _2987 = cos(_2985);
        float _2989 = fma(_2983, _2977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2991 = _2973 * _2989;
        float _2993 = _2987 + (-1.0);
        float _2995 = _2867 * _2991;
        float _2997 = _2877 * _2991;
        float _2999 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3001 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3003 = _2995 * _2995;
        float _3005 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3007 = fma(_2931, _2987, _2999);
        float _3009 = _2997 * _2997;
        _2965 = _3007;
        _2945 = _3003;
        _2947 = _3009;
        _2949 = _3001;
        _2951 = _3005;
    }
    float _3011 = _2965;
    float _3013 = _2945;
    float _3015 = _2947;
    float _3017 = _2949;
    float _3019 = _2951;
    float _3021 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3023 = _3011 + _3021;
    float _3025 = _3011;
    if (!_2713)
    {
        _2953 = _2709;
    }
    float _3027 = _2953;
    float _3029 = _2889 * _2939;
    if (!_2713)
    {
        float _3031 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2941);
        _2955 = _3031;
    }
    float _3033 = _2955;
    float _3035 = fma(_3023, _3023, _3013);
    if (!_2713)
    {
        _2957 = _2921;
    }
    float _3037 = _2957;
    float _3039 = _2791 * _3027;
    float _3041 = _2891 * _3027;
    float _3043 = _3035 + _3015;
    float _3045 = _2819 * _3027;
    float _3047 = _2929 * _2939;
    float _3049 = -_3029;
    float _3051 = _2789 * _3049;
    float _3053 = -_3029;
    float _3055 = _2917 * _3053;
    float _3057 = -_3029;
    float _3059 = _2821 * _3057;
    float _3061 = sqrt(_3043);
    float _3063 = fma(_2795, _3033, _3039);
    float _3065 = fma(_2899, _3033, _3041);
    float _3067 = fma(_2825, _3033, _3045);
    float _3069 = fma(_2791, _3047, _3051);
    float _3071 = fma(_2891, _3047, _3055);
    float _3073 = fma(_2819, _3047, _3059);
    float _3075 = fma(_2789, _3037, _3063);
    float _3077 = fma(_2917, _3037, _3065);
    float _3079 = fma(_2821, _3037, _3067);
    out.m_67.x = _2087;
    out.m_67.y = _2020;
    out.m_67.z = _2026;
    out.m_67.w = _2024;
    out.m_69.x = _2795;
    out.m_69.y = _2899;
    out.m_69.z = _2825;
    bool _3081 = _3061 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3083 = isnan(_3061);
    bool _3085 = _3081 || _3083;
    bool _3087 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3089 = _3085 || _3087;
    out.m_71.x = _3069;
    out.m_71.y = _3071;
    out.m_71.z = _3073;
    out.m_73.x = _3075;
    out.m_73.y = _3077;
    out.m_73.z = _3079;
    float _3091 = _3039;
    if (!_3089)
    {
        _3091 = 1.0;
    }
    float _3093 = _3091;
    bool _3095 = !_3089;
    float _3097 = _3093;
    if (!_3095)
    {
        bool _3099 = _3061 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3101 = isnan(_3061);
        bool _3103 = _3099 || _3101;
        bool _3105 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3107 = _3103 || _3105;
        if (!_3107)
        {
            float _3109 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3111 = _3061 + _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3115 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3113;
            float _3117 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3119 = _3117 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3121 = 1.0 / _3115;
            float _3123 = _3111 * _3121;
            float _3125 = fma(_3123, _3119, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3097 = _3125;
            _3127 = true;
        }
        else
        {
            bool _3129 = _3061 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3131 = isnan(_3061);
            bool _3133 = _3129 || _3131;
            bool _3135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3137 = _3133 || _3135;
            if (!_3137)
            {
                float _3139 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3141 = _3061 + _3139;
                float _3143 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3145 = _3143 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3147 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3149 = _3147 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3151 = 1.0 / _3145;
                float _3153 = _3141 * _3151;
                float _3155 = fma(_3153, _3149, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3097 = _3155;
                _3127 = true;
            }
            else
            {
                _3097 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3127 = false;
    float _3157 = _3097;
    float _3159 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3161 = _3011 + _3159;
    float _3163 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3165 = _3017 + _3163;
    float _3167 = fma(_3161, _3157, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3169 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3171 = _3019 + _3169;
    float _3173 = fma(_3165, _3157, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3177 = _3167 + _3175;
    float _3179 = fma(_3171, _3157, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3183 = _3173 + _3181;
    float _3185 = _3177 * _3177;
    float _3187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3189 = _3179 + _3187;
    float _3191 = fma(_3183, _3183, _3185);
    float _3193 = fma(_3189, _3189, _3191);
    float _3195 = rsqrt(_3193);
    float _3197 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3199 = _3183 * _3197;
    float _3201 = _3189 * _3197;
    float _3203 = _3199 * _3199;
    float _3205 = _3201 * _3201;
    float _3207 = _3203 + _3205;
    float _3209 = sqrt(_3207);
    bool _3211 = _3209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3215 = _3209 + _3213;
    float _3217 = _3195;
    float _3219 = _3215;
    float _3221 = _3157;
    float _3223 = _3177;
    float _3225 = _3199;
    if (_3211)
    {
        float _3227 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3217 = _3227;
    }
    float _3229 = _3217;
    if (_3211)
    {
        float _3231 = rsqrt(_3207);
        _3025 = _3231;
    }
    float _3233 = _3025;
    float _3235 = _3233;
    if (_3211)
    {
        float _3237 = _3215 * _3229;
        _3219 = _3237;
    }
    float _3239 = _3219;
    float _3241 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3211)
    {
        float _3243 = _3239 * 0.15915493667125701904296875;
        _3221 = _3243;
    }
    float _3245 = _3221;
    float _3247 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3241);
    float _3249 = _3189;
    if (_3211)
    {
        float _3251 = _3245 * 6.283185482025146484375;
        float _3253 = sin(_3251);
        _3249 = _3253;
    }
    float _3255 = _3249;
    float _3257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3259 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3247);
    float _3261 = precise::max(0.0, _3257);
    float _3263 = _3229;
    float _3265 = _3261;
    if (_3211)
    {
        float _3267 = _3245 * 6.283185482025146484375;
        float _3269 = cos(_3267);
        _3263 = _3269;
    }
    float _3271 = _3263;
    float _3273 = -_3197;
    float _3275 = -_3261;
    float _3277 = fma(_3177, _3273, _3275);
    if (_3211)
    {
        float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3223 = _3279;
    }
    float _3281 = _3223;
    float _3283 = sqrt(_3193);
    float _3285 = _3281;
    float _3287 = _3255;
    if (_3211)
    {
        float _3289 = fma(_3255, _3281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3285 = _3289;
    }
    float _3291 = _3285;
    float _3293 = _3291;
    if (!_3211)
    {
        _3287 = _3201;
    }
    float _3295 = _3287;
    float _3297 = _3295;
    if (_3211)
    {
        float _3299 = _3271 + (-1.0);
        _3265 = _3299;
    }
    float _3301 = _3265;
    float _3303 = _3301;
    if (_3211)
    {
        float _3305 = _3233 * _3291;
        _2959 = _3305;
    }
    float _3307 = _2959;
    if (!_3211)
    {
        _3235 = _3277;
    }
    float _3309 = _3235;
    float _3311 = _3309;
    if (_3211)
    {
        float _3313 = _3301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3303 = _3313;
    }
    float _3315 = _3303;
    float _3317 = _3315;
    if (_3211)
    {
        float _3319 = _3199 * _3307;
        _3225 = _3319;
    }
    float _3321 = _3225;
    if (!_3211)
    {
        _3293 = _3203;
    }
    float _3323 = _3293;
    float _3325 = _3323;
    if (_3211)
    {
        float _3327 = _3201 * _3307;
        _3297 = _3327;
    }
    float _3329 = _3297;
    if (_3211)
    {
        float _3331 = fma(_3277, _3271, _3315);
        _3311 = _3331;
    }
    float _3333 = _3311;
    if (_3211)
    {
        float _3335 = _3321 * _3321;
        _3325 = _3335;
    }
    float _3337 = _3325;
    if (!_3211)
    {
        _3317 = _3205;
    }
    float _3339 = _3317;
    float _3341 = _3339;
    if (_3211)
    {
        float _3343 = _3329 * _3329;
        _3341 = _3343;
    }
    float _3345 = _3341;
    float _3347 = fma(_3333, _3333, _3337);
    float _3349 = _3347 + _3345;
    float _3351 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3355 = fma(_3283, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3353);
    float _3357 = precise::clamp(_3355, 0.0, 1.0);
    float _3359 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3361 = rsqrt(_3349);
    float _3363 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3351);
    float _3365 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3367 = -_3357;
    float _3369 = _3367 + 1.0;
    float _3371 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3363);
    float _3373 = _3167 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3375 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3365);
    float _3377 = _3371 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3379 = fma(_3173, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3373);
    float _3381 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3375);
    float _3383 = abs(_3369);
    float _3385 = log2(_3383);
    float _3387 = _3377 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3389 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3379);
    float _3391 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3393 = _3361 * _3321;
    float _3395 = -_3387;
    float _3397 = fma(_3395, _3359, 1.0);
    float _3399 = _3389 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3401 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3403 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3405 = _3361 * _3329;
    float _3407 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3409 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3401);
    float _3411 = _3361 * _3333;
    float _3413 = log2(_3397);
    float _3415 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3417 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3409);
    float _3419 = -_3403;
    float _3421 = fma(_3411, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3419);
    float _3423 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3425 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3415);
    float _3427 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3417);
    float _3429 = -_3405;
    float _3431 = fma(_3429, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3421);
    float _3433 = exp2(_3423);
    float _3435 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3437 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3425);
    float _3439 = fma(_3431, -0.5, 0.5);
    float _3441 = fma(_3431, 0.5, 0.5);
    float _3443 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3435);
    float _3445 = _3411 + 1.0;
    float _3447 = 1.0 / _3427;
    float _3449 = fma(_3441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3451 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3443);
    float _3453 = _3413 * 0.693147182464599609375;
    float _3455 = fma(_3441, _3449, -0.212114393711090087890625);
    float _3457 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3451);
    float _3459 = sqrt(_3439);
    float _3461 = -_3411;
    float _3463 = fma(_3433, _3445, _3461);
    float _3465 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3437);
    float _3467 = fma(_3441, _3455, 1.570728778839111328125);
    float _3469 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3471 = fma(_3463, 0.5, 0.5);
    float _3473 = _3457 * _3447;
    float _3475 = _3465 * _3447;
    float _3477 = fma(_3473, 0.5, 0.5);
    float _3479 = fma(_3475, -0.5, 0.5);
    float _3481 = _3459 * 0.636619746685028076171875;
    float3 _8794 = float3(_3477, _3479, _3469);
    float _3483 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8794, float3(0.0), isnan(_8794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8794, float3(0.0), isnan(_8794)), level(0.0)).x;
    float3 _8805 = float3(_3477, _3479, _3469);
    float4 _3485 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8805, float3(0.0), isnan(_8805)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8805, float3(0.0), isnan(_8805)), level(0.0)).xyzw;
    float _3487 = _3485.x;
    float _3489 = _3485.y;
    float _3491 = _3485.z;
    float _3493 = _3485.w;
    float _3495 = -_3467;
    float _3497 = fma(_3481, _3495, 1.0);
    float2 _8826 = float2(_3497, _3471);
    float3 _3501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8826, float2(0.0), isnan(_8826)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8826, float2(0.0), isnan(_8826)), level(0.0)).xyz;
    float _3503 = _3501.x;
    float _3505 = _3501.y;
    float _3507 = _3501.z;
    float _3509 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3511 = _3391 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2845;
    out.m_75.y = _2927;
    out.m_75.z = _2849;
    float _3513 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3511);
    float _3515 = exp2(_3509);
    out.m_49.x = 1.0;
    float _3517 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3513);
    out.m_77.x = _3173;
    out.m_77.y = _3167;
    out.m_77.z = _3179;
    float _3519 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3517);
    float _3521 = _3519 + _3427;
    out.gl_Position.x = _3457;
    out.gl_Position.y = _3465;
    out.gl_Position.z = _3519;
    out.gl_Position.w = _3427;
    float _3523 = -_3515;
    float _3525 = _3523 + 1.0;
    float _3527 = _3525 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3529 = _3521 * 0.5;
    float _3531 = -_3527;
    float _3533 = _3531 + 1.0;
    float _3535 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3529;
    out.m_79.w = _3427;
    out.m_81.w = _3535;
    float _3537 = _3527 * _3483;
    float _3539 = _3493 * _3537;
    float _3541 = _3507 * _3537;
    float _3543 = fma(_3503, _3539, _3487);
    float _3545 = fma(_3505, _3539, _3489);
    float _3547 = _3493 * _3533;
    float _3549 = fma(_3493, _3541, _3491);
    out.m_83.x = _3543;
    out.m_83.y = _3545;
    out.m_83.z = _3549;
    out.m_83.w = _3547;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

