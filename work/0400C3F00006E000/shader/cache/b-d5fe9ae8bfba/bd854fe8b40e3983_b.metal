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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c9 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    constant _16* vp_c7 [[id(7)]];
    texture2d<float> vp_t_tcb_C [[id(8)]];
    sampler vp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_16 [[id(12)]];
    sampler vp_t_tcb_16Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_32 [[id(14)]];
    sampler vp_t_tcb_32Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_30 [[id(16)]];
    sampler vp_t_tcb_30Smplr [[id(17)]];
    texture2d<float> vp_t_tcb_1C [[id(18)]];
    sampler vp_t_tcb_1CSmplr [[id(19)]];
    texture2d_array<float> vp_t_tcb_14 [[id(20)]];
    sampler vp_t_tcb_14Smplr [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    sampler vp_t_tcb_14Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_69 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_75 [[attribute(9)]];
    float4 m_79 [[attribute(10)]];
};

static inline __attribute__((always_inline))
int _108(thread const int& _8555, thread const int& _8556, constant _10& support_buffer)
{
    float _8559 = as_type<float>(support_buffer._m4);
    int _8561 = _8556 + as_type<int>(_8559);
    int _8563 = 1 + _8561;
    float _8565 = support_buffer._m5[_8563].x;
    float _8567 = abs(_8565);
    bool _8569 = _8567 == 1.0;
    if (_8569)
    {
        return _8555;
    }
    float _8571 = float(_8555);
    float _8573 = _8571 / _8567;
    int _8575 = int(_8573);
    return _8575;
}

static inline __attribute__((always_inline))
int _109(thread const int& _8605, thread const int& _8606, constant _10& support_buffer)
{
    float _8609 = as_type<float>(support_buffer._m4);
    int _8611 = _8606 + as_type<int>(_8609);
    int _8613 = 1 + _8611;
    float _8615 = support_buffer._m5[_8613].x;
    bool _8617 = _8615 == 1.0;
    if (_8617)
    {
        return _8605;
    }
    float _8619 = float(_8605);
    float _8621 = _8619 * _8615;
    int _8623 = int(_8621);
    return _8623;
}

static inline __attribute__((always_inline))
void _106(thread const int& _8253, thread const int& _8254, thread const int& _8255, thread const int& _8256, thread int& _8257, thread int& _8258, thread int& _8259, thread int& _8260, thread int& _8261, thread int& _8262, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8265 = _8254;
    int _8267 = _8253;
    int _8269 = _8255;
    float _8271 = 0.0 + as_type<float>(_8253);
    bool _8273 = _8271 != 0.0;
    bool _8275 = isnan(_8271);
    bool _8277 = _8273 || _8275;
    bool _8279 = isnan(0.0);
    bool _8281 = _8277 || _8279;
    int _8283 = _8281 ? (-1) : 0;
    if (!_8281)
    {
        float _8285 = as_type<float>(_8253) * 1.0;
        _8265 = as_type<int>(_8285);
    }
    int _8287 = _8265;
    bool _8289 = !_8281;
    int _8291 = _8287;
    int _8293 = _8287;
    if (!_8289)
    {
        bool _8295 = _8271 >= 0.0;
        bool _8297 = isnan(_8271);
        bool _8299 = _8295 || _8297;
        bool _8301 = isnan(0.0);
        bool _8303 = _8299 || _8301;
        _8283 = _8303 ? (-1) : 0;
        if (!_8303)
        {
            _8291 = 2147483647;
        }
        int _8305 = _8291;
        bool _8307 = !_8303;
        int _8309 = _8305;
        _8293 = _8305;
        if (!_8307)
        {
            float _8311 = abs(as_type<float>(_8253));
            float _8313 = 0.0 + _8311;
            bool _8315 = _8313 > as_type<float>(0x7f800000u /* inf */);
            bool _8317 = isnan(_8313);
            bool _8319 = _8315 || _8317;
            bool _8321 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _8323 = _8319 || _8321;
            _8283 = _8323 ? (-1) : 0;
            if (_8323)
            {
                float _8325 = as_type<float>(_8253) + 1.0;
                _8309 = as_type<int>(_8325);
            }
            int _8327 = _8309;
            int _8329 = _8327;
            _8293 = _8327;
            if (!_8323)
            {
                bool _8331 = _8313 != as_type<float>(0x7f800000u /* inf */);
                bool _8333 = isnan(_8313);
                bool _8335 = _8331 || _8333;
                bool _8337 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _8339 = _8335 || _8337;
                _8283 = _8339 ? (-1) : 0;
                if (!_8339)
                {
                    _8329 = _8253;
                }
                int _8341 = _8329;
                bool _8343 = !_8339;
                _8293 = _8341;
                if (!_8343)
                {
                    float _8345 = as_type<float>(_8253) * 18446744073709551616.0;
                    float _8347 = rsqrt(_8345);
                    float _8349 = _8345 * _8347;
                    float _8351 = _8347 * 0.5;
                    float _8353 = -_8349;
                    float _8355 = 0.0 + _8353;
                    float _8357 = fma(_8351, _8355, 0.5);
                    float _8359 = fma(_8349, _8357, _8349);
                    float _8361 = -_8359;
                    float _8363 = 0.0 + _8361;
                    float _8365 = fma(_8359, _8363, _8345);
                    float _8367 = fma(_8351, _8365, _8359);
                    float _8369 = _8367 * 2.3283064365386962890625e-10;
                    _8267 = as_type<int>(_8345);
                    _8293 = as_type<int>(_8369);
                    _8269 = as_type<int>(_8359);
                }
            }
        }
    }
    int _8371 = _8267;
    int _8373 = _8293;
    int _8375 = _8269;
    int _8377 = _8283;
    _8257 = _8371;
    _8258 = _8256;
    _8259 = 0;
    _8260 = _8373;
    _8261 = _8375;
    _8262 = _8377;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3023 = false;
    bool _1895 = false;
    bool _1187 = false;
    bool _999 = false;
    bool _565 = false;
    bool _317 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_60.w;
    float _115 = trunc(_113);
    int _117 = int(_115);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_63.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3308 = as_type<float>(_133);
        out.gl_Position.z = _3308;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_65.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3377 = as_type<float>(_171);
        out.gl_Position.z = _3377;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = in.m_67.w;
    float _175 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_65.x;
    float _189 = in.m_65.y;
    float _191 = in.m_65.z;
    float _193 = in.m_60.x;
    float _195 = in.m_60.y;
    float _197 = in.m_60.z;
    float _199 = 0.0;
    float _201 = _175;
    if (!_185)
    {
        float _203 = _175 * _175;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_185)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    bool _215 = !_185;
    float _217 = _213;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _175 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _175);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_185;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _175 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _201 = _271;
    }
    float _273 = _201;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _187, _277);
    float _285 = fma(_273, _189, _279);
    float _287 = fma(_273, _191, _281);
    float _289 = fma(_283, _173, _193);
    float _291 = fma(_285, _173, _195);
    float _293 = fma(_287, _173, _197);
    bool _295 = !_275;
    float _297 = _293;
    float _315;
    if (!_295)
    {
        float _299 = in.m_69.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_117);
        float _321 = 1.0 / _319;
        float _323 = _151 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = 1.0 / _329;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _347 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_325);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _333;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _363 = _341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _365 = _345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _325 + _367;
    out.m_71.w = _361;
    float _371 = 1.0 / _337;
    float _373 = _343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = _325 + _375;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    out.m_73.x = _363;
    out.m_73.y = _373;
    out.m_73.z = _365;
    float _381 = _377 * _339;
    float _383 = _369 * _359;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _325 + _385;
    bool _389 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _391 = isnan(_325);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    bool _401 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _403 = isnan(_325);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _387 * _371;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _415;
    float _419 = -_357;
    float _421 = _419 + 1.0;
    bool _423 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _425 = isnan(_325);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    float _439 = fma(_417, _381, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _441 = _399 * _421;
    float _443 = -_399;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _459;
    float _463 = -_433;
    float _465 = _463 + 1.0;
    float _467 = _433 * _445;
    float _469 = fma(_437, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _471 = fma(_461, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _473 = fma(_449, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _475 = fma(_453, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _477 = fma(_457, _383, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _479 = _411 * _465;
    float _481 = in.m_67.x;
    float _483 = in.m_67.y;
    float _485 = in.m_67.z;
    float _487 = -_411;
    float _489 = _487 + 1.0;
    float _491 = _469 * _479;
    float _493 = _471 * _479;
    float _495 = _439 * _479;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _503 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _493);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _509;
    float _513 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].z, _495);
    float _515 = fma(_499, _413, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _517 = fma(_507, _413, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = fma(_511, _413, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _521 = fma(_477, _467, _513);
    float _523 = fma(_475, _467, _503);
    float _525 = fma(_473, _467, _501);
    float _527 = fma(_519, _441, _521);
    float _529 = fma(_517, _441, _523);
    float _531 = fma(_515, _441, _525);
    float _533 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].z, _527);
    float _535 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _529);
    float _537 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _531);
    float _539 = _533 * _485;
    float _541 = _535 * _483;
    float _543 = _537 * _481;
    bool _545 = !_379;
    float _563;
    if (!_545)
    {
        float _547 = in.m_69.x;
        float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[14].x, _151);
        float _555 = _553 * _549;
        float _557 = floor(_555);
        float _559 = -_557;
        float _561 = _555 + _559;
        _563 = _561;
        _565 = true;
    }
    else
    {
        float _567 = float(_117);
        float _569 = 1.0 / _567;
        float _571 = _151 * _569;
        _563 = _571;
    }
    _565 = false;
    float _573 = _563;
    int _575 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _577 = _575;
    int _579 = 0;
    int _581 = _108(_577, _579, (*spvDescriptorSet0.support_buffer));
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _595 = 1.0 / _585;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _601 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _603 = isnan(_573);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = 1.0 / _589;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _623 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _625 = isnan(_573);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = 1.0 / _593;
    float _637 = _617 * _595;
    bool _639 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _641 = isnan(_573);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _653 = _573 + _651;
    float _655 = fma(_637, _653, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _657 = 1.0 / _599;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _671 = _665 * _613;
    float _673 = _669 * _635;
    float _675 = _621 * _657;
    bool _677 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _679 = isnan(_573);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_649;
    float _691 = _689 + 1.0;
    bool _693 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _695 = isnan(_573);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _709 = -_687;
    float _711 = _709 + 1.0;
    float _713 = _687 * _691;
    float _715 = -_703;
    float _717 = _715 + 1.0;
    float _719 = 1.0 / _707;
    float _721 = _703 * _711;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _727 = _611 * _717;
    float _729 = -_611;
    float _731 = _729 + 1.0;
    float _733 = -_633;
    float _735 = _733 + 1.0;
    bool _737 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _739 = isnan(_573);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = _633 * _731;
    float _751 = 1.0 / _725;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _757 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _759 = isnan(_573);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -_747;
    float _771 = _769 + 1.0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _773;
    float _777 = _747 * _735;
    float _779 = _767 * _771;
    float _781 = 1.0 / _755;
    float _783 = _775 * _719;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _787 = _573 + _785;
    float _789 = _655 * _779;
    float _791 = -_767;
    float _793 = _791 + 1.0;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _797 = _573 + _795;
    float _799 = fma(_675, _787, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _801 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[159].x, _789);
    float _803 = _661 * _751;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _811 = _573 + _809;
    float _813 = fma(_671, _797, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _815 = fma(_799, _777, _801);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _819 = _573 + _817;
    float _821 = fma(_673, _811, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _823 = _807 * _781;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _827 = _573 + _825;
    float _829 = fma(_813, _749, _815);
    bool _831 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _833 = isnan(_573);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = in.m_75.z;
    float _845 = fma(_783, _827, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _847 = fma(_821, _727, _829);
    float _849 = fma(_803, _819, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _851 = -_841;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _857 = _573 + _855;
    float _859 = fma(_845, _721, _847);
    float _861 = _649 * _853;
    float _863 = fma(_823, _857, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _865 = fma(_849, _713, _859);
    float _867 = fma(_863, _861, _865);
    float _869 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[166].x, _867);
    float _871 = precise::clamp(_869, 0.0, 1.0);
    float _873 = trunc(_843);
    int _875 = int(_873);
    int _877 = _581 + (-1);
    float _879 = float(_877);
    float _881 = _871 * _879;
    float _883 = trunc(_881);
    int _885 = int(_883);
    int _887 = _885;
    int _889 = 0;
    int _891 = _109(_887, _889, (*spvDescriptorSet0.support_buffer));
    int _893 = _875;
    int _895 = 0;
    int _897 = _109(_893, _895, (*spvDescriptorSet0.support_buffer));
    float4 _900 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_891, _897)), 0).xyzw;
    float _902 = _900.x;
    float _904 = _900.y;
    float _906 = _900.z;
    float _908 = _900.w;
    int _910 = _885 + 1;
    int _912 = min(_877, _910);
    uint _915 = as_type<uint>(half2(float2(_908, 0.0)));
    uint _917 = extract_bits(_915, 0u, 8u);
    int _919 = int(_917) & 255;
    uint _921 = extract_bits(_915, 8u, 8u);
    int _923 = int(_921) & 255;
    int _925 = _923 << 8;
    int _927 = _919 | _925;
    bool _929 = _927 >= 32768;
    int _931 = _927 + (-1024);
    int _933 = _931;
    if (_929)
    {
        int _935 = ~_927;
        int _937 = _935 + 33792;
        int _939 = _937 + 1;
        _933 = _939;
    }
    int _941 = _933;
    int _943 = _941 + 30719;
    float _945 = float(_943);
    float _947 = fma(_945, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _949 = abs(_947);
    float _951 = -_949;
    float _953 = _951 + 1.0;
    float _955 = abs(_947);
    float _957 = fma(_955, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _959 = _947 < 0.0;
    float _961 = float(_959);
    int _963 = as_type<int>(_953) + (-218103808);
    float _965 = abs(_947);
    float _967 = fma(_965, _957, -0.212114393711090087890625);
    bool _969 = uint(_963) >= 1920991232u;
    float _971 = abs(_947);
    float _973 = fma(_971, _967, 1.570728778839111328125);
    bool _975 = !_969;
    float _997;
    if (!_975)
    {
        int _977 = as_type<int>(_953);
        int _979 = as_type<int>(_727);
        int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[166].x);
        int _983 = 4544;
        int _985;
        int _987;
        int _989;
        int _991;
        int _993;
        int _995;
        _106(_977, _979, _981, _983, _985, _987, _989, _991, _993, _995, out.gl_Position, out.gl_PointSize);
        _997 = as_type<float>(_991);
        _999 = true;
    }
    else
    {
        float _1001 = rsqrt(_953);
        float _1003 = _953 * _1001;
        float _1005 = _1001 * 0.5;
        float _1007 = -_1003;
        float _1009 = 0.0 + _1007;
        float _1011 = fma(_1005, _1009, 0.5);
        float _1013 = fma(_1003, _1011, _1003);
        float _1015 = -_1013;
        float _1017 = 0.0 + _1015;
        float _1019 = fma(_1013, _1017, _953);
        float _1021 = fma(_1005, _1019, _1013);
        _997 = _1021;
    }
    _999 = false;
    float _1023 = _997;
    int _1025 = _912;
    int _1027 = 0;
    int _1029 = _109(_1025, _1027, (*spvDescriptorSet0.support_buffer));
    int _1031 = _875;
    int _1033 = 0;
    int _1035 = _109(_1031, _1033, (*spvDescriptorSet0.support_buffer));
    float4 _1037 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1029, _1035)), 0).xyzw;
    float _1039 = _1037.x;
    float _1041 = _1037.y;
    float _1043 = _1037.z;
    float _1045 = _1037.w;
    float _1047 = _973 * _1023;
    float _1049 = _961 * 2.0;
    float _1051 = _945 * 3.883221149444580078125;
    float _1053 = floor(_881);
    float _1055 = -_1049;
    float _1057 = fma(_1047, _1055, _1047);
    float _1059 = _1051 * 0.15915493667125701904296875;
    float _1061 = fma(_961, 3.1415927410125732421875, _1057);
    float _1063 = _1059 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1061 * 0.15915493667125701904296875;
    float _1069 = _1067 * 6.283185482025146484375;
    float _1071 = sin(_1069);
    float _1073 = -_1053;
    float _1075 = _881 + _1073;
    float _1077 = _1059 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1071 * _1065;
    float _1083 = _1071 * _1079;
    uint _1085 = as_type<uint>(half2(float2(_1045, 0.0)));
    float _1087 = -_902;
    float _1089 = _1087 + _1039;
    float _1091 = -_906;
    float _1093 = _1091 + _1043;
    uint _1095 = extract_bits(_1085, 0u, 8u);
    int _1097 = int(_1095) & 255;
    uint _1099 = extract_bits(_1085, 8u, 8u);
    int _1101 = int(_1099) & 255;
    int _1103 = _1101 << 8;
    int _1105 = _1097 | _1103;
    float _1107 = fma(_1075, _1089, _902);
    float _1109 = fma(_1075, _1093, _906);
    bool _1111 = _1105 >= 32768;
    int _1113 = _1105 + (-1024);
    int _1115 = _1113;
    if (_1111)
    {
        int _1117 = ~_1105;
        int _1119 = _1117 + 33792;
        int _1121 = _1119 + 1;
        _1115 = _1121;
    }
    int _1123 = _1115;
    int _1125 = _1123 + 30719;
    float _1127 = float(_1125);
    float _1129 = fma(_1127, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1131 = abs(_1129);
    float _1133 = -_1131;
    float _1135 = _1133 + 1.0;
    float _1137 = abs(_1129);
    float _1139 = fma(_1137, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1141 = -_904;
    float _1143 = _1141 + _1041;
    int _1145 = as_type<int>(_1135) + (-218103808);
    float _1147 = abs(_1129);
    float _1149 = fma(_1147, _1139, -0.212114393711090087890625);
    float _1151 = fma(_1075, _1143, _904);
    bool _1153 = _1129 < 0.0;
    float _1155 = float(_1153);
    bool _1157 = uint(_1145) >= 1920991232u;
    float _1159 = abs(_1129);
    float _1161 = fma(_1159, _1149, 1.570728778839111328125);
    bool _1163 = !_1157;
    float _1185;
    if (!_1163)
    {
        int _1165 = as_type<int>(_1135);
        int _1167 = as_type<int>(_1047);
        int _1169 = as_type<int>(_1135);
        int _1171 = 5440;
        int _1173;
        int _1175;
        int _1177;
        int _1179;
        int _1181;
        int _1183;
        _106(_1165, _1167, _1169, _1171, _1173, _1175, _1177, _1179, _1181, _1183, out.gl_Position, out.gl_PointSize);
        _1185 = as_type<float>(_1179);
        _1187 = true;
    }
    else
    {
        float _1189 = rsqrt(_1135);
        float _1191 = _1135 * _1189;
        float _1193 = _1189 * 0.5;
        float _1195 = -_1191;
        float _1197 = 0.0 + _1195;
        float _1199 = fma(_1193, _1197, 0.5);
        float _1201 = fma(_1191, _1199, _1191);
        float _1203 = -_1201;
        float _1205 = 0.0 + _1203;
        float _1207 = fma(_1201, _1205, _1135);
        float _1209 = fma(_1193, _1207, _1201);
        _1185 = _1209;
    }
    _1187 = false;
    float _1211 = _1185;
    float _1213 = in.m_69.x;
    float _1215 = in.m_69.y;
    float _1217 = in.m_69.z;
    float _1219 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1221 = log2(_1219);
    float _1223 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1225 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1233 = _1231 != 0;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1237 = _1235 != 0;
    float _1239 = _1161 * _1211;
    float _1241 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1243 = _1127 * 3.883221149444580078125;
    float _1245 = -_947;
    float _1247 = _1245 + _1129;
    float _1249 = fma(_1075, _1247, _947);
    float _1251 = _1217 * 2.0;
    float _1253 = _1213 * 2.0;
    float _1255 = _1215 + _1217;
    float _1257 = _1215 + _1213;
    float _1259 = _1215 * 2.0;
    float _1261 = floor(_1253);
    float _1263 = _1255 + (-1.0);
    float _1265 = _1257 + (-1.0);
    float _1267 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1269 = floor(_1251);
    float _1271 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1273 = _1221 * _151;
    bool _1275 = !_1229;
    int _1277 = _1275 ? 0 : 1;
    int _1279 = abs(_1277);
    float _1281 = exp2(_1273);
    bool _1283 = _1261 >= 0.0;
    bool _1285 = isnan(_1261);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    int _1293 = _1291 ? 0 : 1;
    bool _1295 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1297 = isnan(0.0);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1303 = _1299 || _1301;
    float _1305 = floor(_1259);
    bool _1307 = _1269 > 0.0;
    bool _1309 = _1269 >= 0.0;
    bool _1311 = isnan(_1269);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.0);
    bool _1317 = _1313 || _1315;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = -_1281;
    float _1323 = _1321 + 1.0;
    bool _1325 = _1261 > 0.0;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1329 = 1.0 + _1327;
    int _1331 = ~_1319;
    int _1333 = _1331 + 1;
    int _1335 = _1333 + 1;
    bool _1337 = !_1233;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = 1.0 / _1329;
    int _1343 = _1335;
    float _1345 = _1249;
    if (!_1307)
    {
        int _1347 = ~_1319;
        int _1349 = _1347 + 1;
        _1343 = _1349;
    }
    int _1351 = _1343;
    float _1353 = in.m_77.x;
    float _1355 = in.m_77.y;
    float _1357 = in.m_77.z;
    bool _1359 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1361 = isnan(1.0);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1367 = _1363 || _1365;
    float _1369 = float(_1351);
    float _1371 = _1303 ? _1323 : 0.0;
    int _1373 = abs(_1339);
    float _1375 = float(_1279);
    int _1377 = ~_1293;
    int _1379 = _1377 + 1;
    int _1381 = _1379 + 1;
    int _1383 = _1381;
    if (!_1325)
    {
        int _1385 = ~_1293;
        int _1387 = _1385 + 1;
        _1383 = _1387;
    }
    int _1389 = _1383;
    float _1391 = _1375 * _1369;
    bool _1393 = _1305 > 0.0;
    if (_1367)
    {
        float _1395 = _1371 * _1341;
        _155 = _1395;
    }
    float _1397 = _155;
    float _1399 = float(_1373);
    float _1401 = _1391 * (-2.0);
    float _1403 = float(_1389);
    float _1405 = _1213 + (-0.5);
    bool _1407 = _1305 >= 0.0;
    bool _1409 = isnan(_1305);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan(0.0);
    bool _1415 = _1411 || _1413;
    float _1417 = _1217 + _1213;
    float _1419 = _1217 + (-0.5);
    float _1421 = fma(_1401, _1353, _1353);
    bool _1423 = !_1237;
    int _1425 = _1423 ? 0 : 1;
    float _1427 = _1399 * _1403;
    int _1429 = _1415 ? 0 : 1;
    float _1431 = fma(_1267, _1401, _1267);
    float _1433 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1421);
    int _1435 = abs(_1425);
    float _1437 = _1427 * (-2.0);
    int _1439 = ~_1429;
    int _1441 = _1439 + 1;
    int _1443 = _1441 + 1;
    float _1445 = fma(_1431, _1397, _1433);
    int _1447 = _1443;
    if (!_1393)
    {
        int _1449 = ~_1429;
        int _1451 = _1449 + 1;
        _1447 = _1451;
    }
    int _1453 = _1447;
    float _1455 = fma(_1437, _1355, _1355);
    float _1457 = fma(_1271, _1437, _1271);
    float _1459 = _1215 + (-0.5);
    float _1461 = float(_1453);
    float _1463 = _1417 + (-1.0);
    float _1465 = float(_1435);
    float _1467 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1455);
    float _1469 = _1445 * 0.15915493667125701904296875;
    bool _1471 = _1151 != 0.0;
    bool _1473 = isnan(_1151);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    float _1481 = _1465 * _1461;
    float _1483 = fma(_1457, _1397, _1467);
    float _1485 = _1469 * 6.283185482025146484375;
    float _1487 = sin(_1485);
    float _1489 = _1481 * (-2.0);
    float _1491 = _1483 * 0.15915493667125701904296875;
    bool _1493 = _1107 == 0.0;
    bool _1495 = !_1479;
    bool _1497 = _1493 && _1495;
    float _1499 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1501 = fma(_1489, _1357, _1357);
    bool _1503 = _1109 == 0.0;
    bool _1505 = _1503 && _1497;
    float _1507 = fma(_1499, _1489, _1499);
    float _1509 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1501);
    float _1511 = _1469 * 6.283185482025146484375;
    float _1513 = cos(_1511);
    float _1515 = _1155 * 2.0;
    float _1517 = fma(_1507, _1397, _1509);
    float _1519 = -_1515;
    float _1521 = fma(_1239, _1519, _1239);
    float _1523 = _1517 * 0.15915493667125701904296875;
    float _1525 = _1491 * 6.283185482025146484375;
    float _1527 = sin(_1525);
    float _1529 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1109);
    float _1531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1107);
    float _1533 = fma(_1155, 3.1415927410125732421875, _1521);
    if (!_1505)
    {
        float _1535 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1249);
        _1345 = _1535;
    }
    float _1537 = _1345;
    float _1539 = _1531 * _1241;
    float _1541 = _1491 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    float _1545 = _1523 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1551 = _1487 * _1527;
    float _1553 = _1549 * _1223;
    float _1555 = _1529 * _1225;
    float _1557 = _1513 * _1527;
    float _1559 = _1523 * 6.283185482025146484375;
    float _1561 = sin(_1559);
    float _1563 = _1513 * _1543;
    float _1565 = _1487 * _1543;
    float _1567 = _1487 * _1547;
    float _1569 = _1513 * _1547;
    float _1571 = _1543 * _1547;
    float _1573 = _1527 * _1547;
    float _1575 = _1567 * _1553;
    float _1577 = _1569 * _1553;
    float _1579 = _1243 * 0.15915493667125701904296875;
    float _1581 = fma(_1561, _1563, _1551);
    float _1583 = fma(_1561, _1551, _1563);
    float _1585 = -_1557;
    float _1587 = fma(_1561, _1565, _1585);
    float _1589 = -_1565;
    float _1591 = fma(_1561, _1557, _1589);
    float _1593 = -_1553;
    float _1595 = _1561 * _1593;
    float _1597 = _291 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1599 = fma(_1581, _1539, _1577);
    float _1601 = fma(_1587, _1539, _1575);
    float _1603 = fma(_1571, _1539, _1595);
    float _1605 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1597);
    float _1607 = _291 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1609 = fma(_1583, _1555, _1601);
    float _1611 = fma(_1573, _1555, _1603);
    float _1613 = fma(_1591, _1555, _1599);
    float _1615 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1607);
    float _1617 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1605);
    float _1619 = _1579 * 6.283185482025146484375;
    float _1621 = cos(_1619);
    float _1623 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1625 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1627 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1615);
    float _1629 = _1617 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1631 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1623);
    float _1633 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1625);
    float _1635 = _1627 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1637 = _291 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1639 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1631);
    float _1641 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1633);
    float _1643 = _1533 * 0.15915493667125701904296875;
    float _1645 = _1579 * 6.283185482025146484375;
    float _1647 = sin(_1645);
    float _1649 = _1629 + _1639;
    float _1651 = _1635 + _1641;
    float _1653 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1637);
    float _1655 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1659 = _1649 + _1657;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1663 = _1651 + _1661;
    float _1665 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1653);
    float _1667 = _1643 * 6.283185482025146484375;
    float _1669 = sin(_1667);
    float _1671 = _1659 * _1659;
    float _1673 = _1663 * _1663;
    float _1675 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1655);
    float _1677 = -_1537;
    float _1679 = _1561 * _1677;
    float _1681 = _1569 * _1537;
    float _1683 = _1671 + _1673;
    float _1685 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1675);
    float _1687 = _1567 * _1537;
    float _1689 = sqrt(_1683);
    float _1691 = -_1081;
    float _1693 = fma(_1669, _1621, _1691);
    float _1695 = -_1083;
    float _1697 = fma(_1669, _1647, _1695);
    float _1699 = fma(_1075, _1693, _1081);
    float _1701 = fma(_1075, _1697, _1083);
    float _1703 = _1665 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1705 = _1699;
    float _1707 = _1701;
    float _1709 = _1569;
    float _1711 = _1665;
    float _1713 = _1561;
    float _1715 = _1637;
    float _1717 = _1629;
    if (!_1505)
    {
        float _1719 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1699);
        _1705 = _1719;
    }
    float _1721 = _1705;
    if (!_1505)
    {
        float _1723 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1701);
        _1707 = _1723;
    }
    float _1725 = _1707;
    bool _1727 = _1689 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1729 = _1703 + _1685;
    float _1731 = _1725;
    if (!_1727)
    {
        _1709 = _1673;
    }
    float _1733 = _1709;
    float _1735 = _1733;
    if (!_1727)
    {
        _297 = _1671;
    }
    float _1737 = _297;
    float _1739 = _1737;
    if (!_1727)
    {
        _1711 = _1649;
    }
    float _1741 = _1711;
    float _1743 = _1741;
    if (!_1727)
    {
        _1713 = _1651;
    }
    float _1745 = _1713;
    float _1747 = _1745;
    if (!_1727)
    {
        _1715 = _1729;
    }
    float _1749 = _1715;
    bool _1751 = !_1727;
    float _1753 = _1749;
    if (!_1751)
    {
        float _1755 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1759 = _1689 + _1757;
        float _1761 = rsqrt(_1683);
        float _1763 = _1759 * _1755;
        float _1765 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1767 = _1763 * 0.15915493667125701904296875;
        float _1769 = _1767 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1767 * 6.283185482025146484375;
        float _1775 = cos(_1773);
        float _1777 = fma(_1771, _1765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1779 = _1761 * _1777;
        float _1781 = _1775 + (-1.0);
        float _1783 = _1659 * _1779;
        float _1785 = _1663 * _1779;
        float _1787 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1791 = _1785 * _1785;
        float _1793 = fma(_1729, _1775, _1787);
        float _1795 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1797 = _1783 * _1783;
        _1753 = _1793;
        _1739 = _1797;
        _1735 = _1791;
        _1743 = _1795;
        _1747 = _1789;
    }
    float _1799 = _1753;
    float _1801 = _1739;
    float _1803 = _1735;
    float _1805 = _1743;
    float _1807 = _1747;
    float _1809 = in.m_79.x;
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1813 = _1799 + _1811;
    float _1815 = fma(_1581, _1721, _1681);
    float _1817 = fma(_1571, _1721, _1679);
    float _1819 = fma(_1587, _1721, _1687);
    float _1821 = fma(_1813, _1813, _1801);
    float _1823 = fma(_1591, _1725, _1815);
    float _1825 = fma(_1573, _1725, _1817);
    float _1827 = fma(_1583, _1725, _1819);
    float _1829 = _1821 + _1803;
    float _1831 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1833 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1837 = sqrt(_1829);
    float _1839 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1831);
    float _1841 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1833);
    float _1843 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1835);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1839);
    float _1847 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1841);
    float _1849 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1843);
    out.m_81.x = _1809;
    out.m_83.x = _1847;
    out.m_83.y = _1845;
    out.m_83.z = _1849;
    bool _1851 = _1837 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1853 = isnan(_1837);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1859 = _1855 || _1857;
    if (!_1859)
    {
        _1731 = 1.0;
    }
    float _1861 = _1731;
    bool _1863 = !_1859;
    float _1865 = _1861;
    if (!_1863)
    {
        bool _1867 = _1837 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1869 = isnan(_1837);
        bool _1871 = _1867 || _1869;
        bool _1873 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1875 = _1871 || _1873;
        if (!_1875)
        {
            float _1877 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1879 = _1837 + _1877;
            float _1881 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1883 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1881;
            float _1885 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1887 = _1885 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1889 = 1.0 / _1883;
            float _1891 = _1879 * _1889;
            float _1893 = fma(_1891, _1887, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1865 = _1893;
            _1895 = true;
        }
        else
        {
            bool _1897 = _1837 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1899 = isnan(_1837);
            bool _1901 = _1897 || _1899;
            bool _1903 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1905 = _1901 || _1903;
            if (!_1905)
            {
                float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1909 = _1837 + _1907;
                float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1913 = _1911 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1917 = _1915 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1919 = 1.0 / _1913;
                float _1921 = _1909 * _1919;
                float _1923 = fma(_1921, _1917, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1865 = _1923;
                _1895 = true;
            }
            else
            {
                _1865 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1895 = false;
    float _1925 = _1865;
    float _1927 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1929 = _1799 + _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1933 = _1805 + _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1937 = _1807 + _1935;
    float _1939 = fma(_1929, _1925, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1941 = fma(_1933, _1925, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1943 = fma(_1937, _1925, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1945 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1949 = _1939 + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1953 = _1941 + _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1957 = _1943 + _1955;
    float _1959 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1945);
    float _1961 = _1949 * _1949;
    float _1963 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1959);
    float _1965 = fma(_1953, _1953, _1961);
    float _1967 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1969 = _1963 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1971 = fma(_1957, _1957, _1965);
    float _1973 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1967);
    float _1975 = 1.0 / _1969;
    float _1977 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1979 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1973);
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1983 = rsqrt(_1971);
    float _1985 = _1981 + _1969;
    float _1987 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1989 = _1703 + _1987;
    float _1991 = _1985 * _1975;
    float _1993 = _1991 * 0.5;
    float _1995 = floor(_1977);
    float _1997 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2001 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1999);
    float _2003 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2005 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1997);
    float _2007 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2009 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2003);
    float _2011 = 1.0 / _2001;
    float _2013 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2005);
    float _2015 = _1953 * _2007;
    float _2017 = _1957 * _2007;
    float _2019 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2009);
    float _2021 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2023 = _2015 * _2015;
    float _2025 = _2017 * _2017;
    float _2027 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2029 = trunc(_2021);
    int _2031 = int(_2029);
    float _2033 = -_1995;
    float _2035 = _1977 + _2033;
    float _2037 = _2023 + _2025;
    float _2039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2041 = _2011 * _2039;
    float _2043 = sqrt(_2037);
    bool _2045 = _2041 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2047 = _2041 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2049 = trunc(_2027);
    int _2051 = int(_2049);
    int _2053 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2055 = _2031 + _2053;
    int _2057 = _2055 + 1;
    bool _2059 = _2043 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2063 = _2043 + _2061;
    int _2065 = 2;
    float _2067 = _2037;
    float _2069 = _2063;
    float _2071 = _2007;
    float _2073 = _2015;
    float _2075 = _2023;
    if (!_2045)
    {
        _2065 = 1;
    }
    int _2077 = _2065;
    float _2079 = sqrt(_1971);
    int _2081 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2083 = _2051 + _2081;
    int _2085 = _2083 + 1;
    float _2087 = _1987;
    int _2089 = _2077;
    if (_2059)
    {
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2087 = _2091;
    }
    float _2093 = _2087;
    if (_2059)
    {
        float _2095 = rsqrt(_2037);
        _2067 = _2095;
    }
    float _2097 = _2067;
    float _2099 = _2097;
    if (_2059)
    {
        float _2101 = _2063 * _2093;
        _2069 = _2101;
    }
    float _2103 = _2069;
    float _2105 = 0.0;
    if (_2059)
    {
        float _2107 = _2103 * 0.15915493667125701904296875;
        _2105 = _2107;
    }
    float _2109 = _2105;
    bool _2111 = !_2045;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2117 = _2013;
    if (_2059)
    {
        float _2119 = _2109 * 6.283185482025146484375;
        float _2121 = sin(_2119);
        _2117 = _2121;
    }
    float _2123 = _2117;
    if (!_2047)
    {
        _2089 = _2113;
    }
    int _2125 = _2089;
    float _2127 = precise::max(0.0, _2115);
    int _2129 = _2125 << 6;
    bool _2131 = _2057 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2133 = -_2007;
    float _2135 = -_2127;
    float _2137 = fma(_1949, _2133, _2135);
    int _2139 = _2129 + 96;
    uint _2141 = uint(int(uint(_2139) >> uint(2)));
    uint _2143 = uint(int(uint(int(_2141)) >> uint(2)));
    int _2145 = int(_2141) & 3;
    float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
    int _2149 = int(_2141) + 1;
    uint _2151 = uint(int(uint(_2149) >> uint(2)));
    int _2153 = _2149 & 3;
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[int(_2151)][_2153];
    int _2157 = _2057 | _2085;
    float _2159 = _2109;
    float _2161 = as_type<float>(_2157);
    float _2163 = _2137;
    if (_2059)
    {
        float _2165 = _2109 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        _2159 = _2167;
    }
    float _2169 = _2159;
    if (_2059)
    {
        float _2171 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2071 = _2171;
    }
    float _2173 = _2071;
    bool _2175 = _2157 < 0;
    bool _2177 = _2175 || _2131;
    if (_2059)
    {
        float _2179 = fma(_2123, _2173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2161 = _2179;
    }
    float _2181 = _2161;
    int _2183 = _2129 + 48;
    uint _2185 = uint(int(uint(_2183) >> uint(2)));
    uint _2187 = uint(int(uint(int(_2185)) >> uint(2)));
    int _2189 = int(_2185) & 3;
    float _2191 = (*spvDescriptorSet0.vp_c15)._m0[int(_2187)][_2189];
    int _2193 = int(_2185) + 1;
    uint _2195 = uint(int(uint(_2193) >> uint(2)));
    int _2197 = _2193 & 3;
    float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
    float _2201 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2203 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2205 = 0.0;
    if (_2059)
    {
        float _2207 = _2097 * _2181;
        _2205 = _2207;
    }
    float _2209 = _2205;
    bool _2211 = _2085 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2213 = _2211 || _2177;
    float _2215 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2201);
    float _2217 = floor(_2203);
    if (_2059)
    {
        float _2219 = _2015 * _2209;
        _2073 = _2219;
    }
    float _2221 = _2073;
    int _2223 = _2129 + 104;
    uint _2225 = uint(int(uint(_2223) >> uint(2)));
    uint _2227 = uint(int(uint(int(_2225)) >> uint(2)));
    int _2229 = int(_2225) & 3;
    float _2231 = (*spvDescriptorSet0.vp_c15)._m0[int(_2227)][_2229];
    int _2233 = int(_2225) + 1;
    uint _2235 = uint(int(uint(_2233) >> uint(2)));
    int _2237 = _2233 & 3;
    float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
    float _2241 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2215);
    float _2243 = _2241;
    if (_2059)
    {
        float _2245 = _2169 + (-1.0);
        _2099 = _2245;
    }
    float _2247 = _2099;
    float _2249 = _2247;
    if (_2059)
    {
        float _2251 = _2221 * _2221;
        _2075 = _2251;
    }
    float _2253 = _2075;
    float _2255 = 0.0;
    if (_2059)
    {
        float _2257 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2257;
    }
    float _2259 = _2255;
    if (!_2059)
    {
        _2249 = _2017;
    }
    float _2261 = _2249;
    int _2263 = _2129 + 64;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    uint _2267 = uint(int(uint(int(_2265)) >> uint(2)));
    int _2269 = int(_2265) & 3;
    float _2271 = (*spvDescriptorSet0.vp_c15)._m0[int(_2267)][_2269];
    int _2273 = int(_2265) + 1;
    uint _2275 = uint(int(uint(_2273) >> uint(2)));
    int _2277 = _2273 & 3;
    float _2279 = (*spvDescriptorSet0.vp_c15)._m0[int(_2275)][_2277];
    float _2281 = _2261;
    if (_2059)
    {
        float _2283 = _2017 * _2209;
        _2281 = _2283;
    }
    float _2285 = _2281;
    if (_2059)
    {
        float _2287 = fma(_2137, _2169, _2259);
        _2163 = _2287;
    }
    float _2289 = _2163;
    float _2291 = _2241 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2059)
    {
        _2243 = _2025;
    }
    float _2293 = _2243;
    float _2295 = _2293;
    if (_2059)
    {
        float _2297 = _2285 * _2285;
        _2295 = _2297;
    }
    float _2299 = _2295;
    float _2301 = fma(_2289, _2289, _2253);
    float _2303 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _2305 = _2129 + 80;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
    int _2311 = int(_2307) & 3;
    float _2313 = (*spvDescriptorSet0.vp_c15)._m0[int(_2309)][_2311];
    int _2315 = int(_2307) + 1;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    int _2319 = _2315 & 3;
    float _2321 = (*spvDescriptorSet0.vp_c15)._m0[int(_2317)][_2319];
    float _2323 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2325 = _2301 + _2299;
    float _2327 = 0.0;
    int _2329 = as_type<int>(_2323);
    if (!_2213)
    {
        float _2331 = floor(_2027);
        _2327 = _2331;
    }
    float _2333 = _2327;
    float _2335 = -_2323;
    float _2337 = fma(_2335, _2303, 1.0);
    if (!_2213)
    {
        int _2339 = _2085 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2341 = _2339 + _2057;
        _2329 = _2341;
    }
    int _2343 = _2329;
    float _2345 = -_2217;
    float _2347 = _2203 + _2345;
    int _2349 = _2129 + 56;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    uint _2353 = uint(int(uint(int(_2351)) >> uint(2)));
    int _2355 = int(_2351) & 3;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[int(_2353)][_2355];
    int _2359 = int(_2351) + 1;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    int _2363 = _2359 & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    float _2367 = log2(_2337);
    int _2369 = _2129 + 88;
    uint _2371 = uint(int(uint(_2369) >> uint(2)));
    uint _2373 = uint(int(uint(int(_2371)) >> uint(2)));
    int _2375 = int(_2371) & 3;
    float _2377 = (*spvDescriptorSet0.vp_c15)._m0[int(_2373)][_2375];
    int _2379 = int(_2371) + 1;
    uint _2381 = uint(int(uint(_2379) >> uint(2)));
    int _2383 = _2379 & 3;
    float _2385 = (*spvDescriptorSet0.vp_c15)._m0[int(_2381)][_2383];
    float _2387 = _1989 * _2155;
    float _2389 = fma(_1629, _2147, _2387);
    int _2391 = _2129 + 72;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    uint _2395 = uint(int(uint(int(_2393)) >> uint(2)));
    int _2397 = int(_2393) & 3;
    float _2399 = (*spvDescriptorSet0.vp_c15)._m0[int(_2395)][_2397];
    int _2401 = int(_2393) + 1;
    uint _2403 = uint(int(uint(_2401) >> uint(2)));
    int _2405 = _2401 & 3;
    float _2407 = (*spvDescriptorSet0.vp_c15)._m0[int(_2403)][_2405];
    float _2409 = _1989 * _2199;
    float _2411 = rsqrt(_2325);
    float _2413 = fma(_1629, _2191, _2409);
    int _2415 = as_type<int>(_2409);
    int _2417 = as_type<int>(_2147);
    if (!_2213)
    {
        int _2419 = _2343 << 2;
        _2415 = _2419;
    }
    int _2421 = _2415;
    float _2423 = fma(_1635, _2231, _2389);
    int _2425 = _2421;
    if (!_2213)
    {
        int _2427 = 12 & _2421;
        _2425 = _2427;
    }
    int _2429 = _2425;
    float _2431 = _2423 + _2239;
    float _2433 = _1989 * _2279;
    float _2435 = _2279;
    int _2437 = as_type<int>(_2321);
    if (!_2213)
    {
        float _2439 = -_2333;
        float _2441 = _2027 + _2439;
        _2435 = _2441;
    }
    float _2443 = _2435;
    float _2445 = 1.0 / _2431;
    float _2447 = _2411 * _2221;
    float _2449 = fma(_1629, _2271, _2433);
    float _2451 = _2411 * _2289;
    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2455 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2453);
    float _2457 = precise::clamp(_2455, 0.0, 1.0);
    float _2459 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2461 = _1989 * _2321;
    float _2463 = _2411 * _2285;
    if (!_2213)
    {
        uint _2465 = uint(int(uint(_2343) >> uint(2)));
        _2437 = int(_2465);
    }
    int _2467 = _2437;
    float _2469 = fma(_1629, _2313, _2461);
    float _2471 = -_2457;
    float _2473 = _2471 + 1.0;
    float _2475 = as_type<float>(_2467);
    if (!_2213)
    {
        int _2477 = _2467 << 4;
        int _2479 = _2477 + _2429;
        _2417 = _2479;
    }
    int _2481 = _2417;
    float _2483 = fma(_1635, _2357, _2413);
    if (!_2213)
    {
        float _2485 = floor(_2021);
        _2475 = _2485;
    }
    float _2487 = _2475;
    float _2489 = _2483 + _2365;
    float _2491 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2493 = fma(_1635, _2377, _2469);
    float _2495 = -_2459;
    float _2497 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2495);
    float _2499 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2501 = abs(_2473);
    float _2503 = log2(_2501);
    float _2505 = -_2463;
    float _2507 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2497);
    float _2509 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2499);
    float _2511 = _2489 * _2445;
    float _2513 = fma(_1635, _2399, _2449);
    float _2515 = fma(_2507, -0.5, 0.5);
    float _2517 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2509);
    float _2519 = fma(_2507, 0.5, 0.5);
    float _2521 = _2513 + _2407;
    float _2523 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2525 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2491);
    bool _2527 = _2511 >= 0.0;
    float _2529 = _2521 * _2445;
    float _2531 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2523);
    float _2533 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2525);
    bool _2535 = _2511 <= 1.0;
    bool _2537 = _2535 && _2527;
    float _2539 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2541 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2531);
    float _2543 = _2533 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2545 = _2529 >= 0.0;
    bool _2547 = _2545 && _2537;
    float _2549 = _2449;
    if (!_2213)
    {
        int _2551 = _2481 + 400;
        uint _2553 = uint(int(uint(_2551) >> uint(2)));
        uint _2555 = uint(int(uint(int(_2553)) >> uint(2)));
        int _2557 = int(_2553) & 3;
        float _2559 = (*spvDescriptorSet0.vp_c15)._m0[int(_2555)][_2557];
        _2549 = _2559;
    }
    float _2561 = _2549;
    float _2563 = _2541 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2565 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2567 = _2529 <= 1.0;
    bool _2569 = _2567 && _2547;
    float _2571 = exp2(_2539);
    float _2573 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2575 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2565);
    float _2577 = _2493 + _2385;
    float _2579 = fma(_2519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2581 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2583 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2575);
    float _2585 = _2451 + 1.0;
    float _2587 = fma(_2519, _2579, -0.212114393711090087890625);
    float _2589 = sqrt(_2515);
    float _2591 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2583);
    float _2593 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2595 = fma(_2519, _2587, 1.570728778839111328125);
    float _2597 = _2587;
    float _2599 = _2591;
    if (_2569)
    {
        float _2601 = float(_2125);
        _2597 = _2601;
    }
    float _2603 = _2597;
    float _2605 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2581);
    float _2607 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2593);
    float _2609 = -_2451;
    float _2611 = fma(_2571, _2585, _2609);
    float _2613 = 1.0 / _2591;
    float _2615 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2605);
    float _2617 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2607);
    float _2619 = _2607;
    if (!_2213)
    {
        float _2621 = -_2487;
        float _2623 = _2021 + _2621;
        _2619 = _2623;
    }
    float _2625 = _2619;
    float _2627 = _2577 * _2445;
    float _2629 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2615);
    float _2631 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2617);
    float _2633 = _2367 * 0.693147182464599609375;
    float _2635 = _2603;
    float _2637 = _2625;
    if (_2569)
    {
        float _2639 = rint(_2603);
        float _2641 = precise::max(_2639, 0.0);
        uint _2643 = uint(_2641);
        uint _2645 = clamp(_2643, 0u, 65535u);
        _2635 = as_type<float>(_2645);
    }
    float _2647 = _2635;
    float _2649 = _2589 * 0.636619746685028076171875;
    float2 _7181 = float2(_2035, _2347);
    float _2651 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7181, float2(0.0), isnan(_7181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7181, float2(0.0), isnan(_7181)), level(0.0)).x;
    float _2653 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2655 = fma(_2611, 0.5, 0.5);
    float _2657 = -_2595;
    float _2659 = fma(_2649, _2657, 1.0);
    float _2661 = _2629 * _2613;
    float _2663 = _2631 * _2613;
    float _2665 = fma(_2661, 0.5, 0.5);
    float _2667 = fma(_2663, -0.5, 0.5);
    float _2669 = _2647;
    if (_2569)
    {
        float3 _7218 = float3(_2511, _2529, float(as_type<int>(_2647)));
        float3 _7222 = select(_7218, float3(0.0), isnan(_7218));
        float _2671 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7222.xy, uint(rint(_7222.z)), _2627, level(0.0));
        _2669 = _2671;
    }
    float _2673 = _2669;
    float3 _7232 = float3(_2665, _2667, _2653);
    float _2675 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7232, float3(0.0), isnan(_7232)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7232, float3(0.0), isnan(_7232)), level(0.0)).x;
    float3 _7241 = float3(_2665, _2667, _2653);
    float4 _2677 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7241, float3(0.0), isnan(_7241)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7241, float3(0.0), isnan(_7241)), level(0.0)).xyzw;
    float _2679 = _2677.x;
    float _2681 = _2677.y;
    float _2683 = _2677.z;
    float _2685 = _2677.w;
    float2 _7257 = float2(_2659, _2655);
    float3 _2689 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7257, float2(0.0), isnan(_7257)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7257, float2(0.0), isnan(_7257)), level(0.0)).xyz;
    float _2691 = _2689.x;
    float _2693 = _2689.y;
    float _2695 = _2689.z;
    float _2697 = _2633;
    if (!_2213)
    {
        float _2699 = rint(_2561);
        float _2701 = precise::max(_2699, 0.0);
        uint _2703 = uint(_2701);
        uint _2705 = clamp(_2703, 0u, 65535u);
        _2697 = as_type<float>(_2705);
    }
    float _2707 = _2697;
    float _2709 = _2707;
    if (!_2213)
    {
        float3 _7294 = float3(_2625, _2443, float(as_type<int>(_2707)));
        float3 _7296 = select(_7294, float3(0.0), isnan(_7294));
        float _2711 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7296.xy, uint(rint(_7296.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7296.xy, uint(rint(_7296.z)), level(0.0)).x;
        _2709 = _2711;
    }
    float _2713 = _2709;
    float _2715 = abs(_2041);
    float _2717 = log2(_2715);
    float _2719 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2721 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2719);
    float _2723 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2721);
    float _2725 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2727 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2723);
    bool _2729 = _2041 <= 8000.0;
    bool _2731 = isnan(_2041);
    bool _2733 = _2729 || _2731;
    bool _2735 = isnan(8000.0);
    bool _2737 = _2733 || _2735;
    float _2739 = float(_2737);
    float _2741 = _2717 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2743 = _2727 + _2591;
    float _2745 = exp2(_2725);
    if (!_2569)
    {
        _2637 = 1.0;
    }
    float _2747 = _2637;
    float _2749 = _2743 * 0.5;
    float _2751 = exp2(_2741);
    out.m_85.z = _2749;
    out.m_85.w = _2591;
    float _2753 = fma(_2751, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2755 = precise::clamp(_2753, 0.0, 1.0);
    float _2757 = fma(_2755, -2.0, 3.0);
    float _2759 = _2755 * _2755;
    float _2761 = _2759 * _2757;
    float _2763 = -_2761;
    float _2765 = _2763 + 1.0;
    out.gl_Position.x = _2629;
    out.gl_Position.y = _2631;
    out.gl_Position.z = _2727;
    out.gl_Position.w = _2591;
    float _2767 = fma(_2765, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2761);
    float _2769 = _2739 * _2767;
    float _2771 = -_2745;
    float _2773 = _2771 + 1.0;
    float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2777 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2779 = _2629;
    float _2781 = _2747;
    if (_2213)
    {
        _2779 = 1.0;
    }
    float _2783 = _2779;
    float _2785 = -_2651;
    float _2787 = _2785 + 1.0;
    float _2789 = _2787 * _2775;
    float _2791 = precise::clamp(_2789, 0.0, 1.0);
    float _2793 = _2783;
    float _2795 = _2791;
    if (_2569)
    {
        bool _2797 = _2673 >= _2627;
        bool _2799 = isnan(_2673);
        bool _2801 = _2797 || _2799;
        bool _2803 = isnan(_2627);
        bool _2805 = _2801 || _2803;
        float _2807 = float(_2805);
        _2781 = _2807;
    }
    float _2809 = _2781;
    if (!_2213)
    {
        int _2811 = _2343 << 4;
        int _2813 = _2811 + 2048;
        uint _2815 = uint(int(uint(_2813) >> uint(2)));
        uint _2817 = uint(int(uint(int(_2815)) >> uint(2)));
        int _2819 = int(_2815) & 3;
        float _2821 = (*spvDescriptorSet0.vp_c15)._m0[int(_2817)][_2819];
        int _2823 = int(_2815) + 1;
        uint _2825 = uint(int(uint(_2823) >> uint(2)));
        int _2827 = _2823 & 3;
        float _2829 = (*spvDescriptorSet0.vp_c15)._m0[int(_2825)][_2827];
        int _2831 = _2813 + 8;
        uint _2833 = uint(int(uint(_2831) >> uint(2)));
        uint _2835 = uint(int(uint(int(_2833)) >> uint(2)));
        int _2837 = int(_2833) & 3;
        float _2839 = (*spvDescriptorSet0.vp_c15)._m0[int(_2835)][_2837];
        int _2841 = int(_2833) + 1;
        uint _2843 = uint(int(uint(_2841) >> uint(2)));
        int _2845 = _2841 & 3;
        float _2847 = (*spvDescriptorSet0.vp_c15)._m0[int(_2843)][_2845];
        float _2849 = _1989 * _2829;
        float _2851 = fma(_1629, _2821, _2849);
        float _2853 = fma(_1635, _2839, _2851);
        float _2855 = _2853 + _2847;
        float _2857 = precise::clamp(_2855, 0.0, 1.0);
        float _2859 = -_2857;
        float _2861 = _2859 + _2713;
        float _2863 = fma(_2861, 500.0, 1.5);
        float _2865 = exp2(_2863);
        float _2867 = 0.0 + _2865;
        float _2869 = precise::clamp(_2867, 0.0, 1.0);
        _2793 = _2869;
        _2599 = _2847;
    }
    float _2871 = _2793;
    float _2873 = _2599;
    float _2875 = _2777 * _2675;
    float _2877 = _2809 * _2871;
    float _2879 = -_2791;
    float _2881 = fma(_2879, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2883 = -_2777;
    float _2885 = _2883 + 1.0;
    float _2887 = _2685 * _2875;
    float _2889 = _2695 * _2875;
    float _2891 = -_2877;
    float _2893 = fma(_2891, _2881, 1.0);
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = _2685 * _2885;
    float _2899 = fma(_2691, _2887, _2679);
    float _2901 = fma(_2693, _2887, _2681);
    float _2903 = _2895 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2905 = fma(_2685, _2889, _2683);
    bool _2907 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2909 = isnan(_2079);
    bool _2911 = _2907 || _2909;
    bool _2913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2915 = _2911 || _2913;
    out.m_87.x = _2903;
    out.m_89.x = _2899;
    out.m_89.y = _2901;
    out.m_89.z = _2905;
    out.m_89.w = _2897;
    float _2917 = _2873;
    float _2919 = _2885;
    float _2921 = _2881;
    float _2923 = _2895;
    if (!_2915)
    {
        _1717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2925 = _1717;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2915)
    {
        _2795 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2931 = _2795;
    float _2933 = _2931;
    float _2935 = _2931;
    if (!_2915)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2937 = _2917;
    float _2939 = _2937;
    float _2941 = _2937;
    if (!_2915)
    {
        _2919 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2943 = _2919;
    float _2945 = _2943;
    float _2947 = _2943;
    if (!_2915)
    {
        _2921 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2949 = _2921;
    float _2951 = _2949;
    float _2953 = _2949;
    if (!_2915)
    {
        _2923 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2955 = _2923;
    bool _2957 = !_2915;
    float _2959 = _2955;
    float _2961 = _2955;
    if (!_2957)
    {
        bool _2963 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2965 = isnan(_2079);
        bool _2967 = _2963 || _2965;
        bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2971 = _2967 || _2969;
        if (!_2971)
        {
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2975 = _2079 + _2973;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2979 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2977;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2985 = 1.0 / _2979;
            float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3003 = _2975 * _2985;
            float _3005 = precise::clamp(_3003, 0.0, 1.0);
            float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3011 = fma(_3005, _2983, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3013 = fma(_3005, _3009, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3015 = fma(_3005, _2989, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3017 = fma(_3005, _2993, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3019 = fma(_3005, _2997, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3021 = fma(_3005, _3001, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2935 = _3015;
            _2953 = _3019;
            _2929 = _3011;
            _2947 = _3017;
            _2941 = _3013;
            _2961 = _3021;
            _3023 = true;
        }
        else
        {
            bool _3025 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3027 = isnan(_2079);
            bool _3029 = _3025 || _3027;
            bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3033 = _3029 || _3031;
            if (!_3033)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3035 = _2927;
            _2929 = _3035;
            if (!_3033)
            {
                _2933 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3037 = _2933;
            _2935 = _3037;
            if (!_3033)
            {
                _2939 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3039 = _2939;
            _2941 = _3039;
            if (!_3033)
            {
                _2945 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3041 = _2945;
            _2947 = _3041;
            if (!_3033)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3043 = _2951;
            _2953 = _3043;
            if (!_3033)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3045 = _2959;
            bool _3047 = !_3033;
            _2961 = _3045;
            if (!_3047)
            {
                bool _3049 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3051 = isnan(_2079);
                bool _3053 = _3049 || _3051;
                bool _3055 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3057 = _3053 || _3055;
                if (!_3057)
                {
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3061 = _2079 + _3059;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3065 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3063;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3071 = 1.0 / _3065;
                    float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3089 = _3061 * _3071;
                    float _3091 = precise::clamp(_3089, 0.0, 1.0);
                    float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3097 = fma(_3091, _3069, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3099 = fma(_3091, _3095, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3101 = fma(_3091, _3075, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3103 = fma(_3091, _3079, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3105 = fma(_3091, _3083, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3107 = fma(_3091, _3087, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2935 = _3101;
                    _2953 = _3105;
                    _2929 = _3097;
                    _2947 = _3103;
                    _2941 = _3099;
                    _2961 = _3107;
                    _3023 = true;
                }
                else
                {
                    _2935 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2947 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2941 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3023 = false;
    float _3109 = _2935;
    float _3111 = _2953;
    float _3113 = _2929;
    float _3115 = _2947;
    float _3117 = _2941;
    float _3119 = _2961;
    float _3121 = fma(_1845, -0.5, 0.5);
    float _3123 = precise::clamp(_3121, 0.0, 1.0);
    float _3125 = -_3109;
    float _3127 = _3125 + _3111;
    float _3129 = -_3113;
    float _3131 = _3129 + _3115;
    float _3133 = -_3117;
    float _3135 = _3133 + _3119;
    bool _3137 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3139 = fma(_3123, _3127, _3109);
    float _3141 = fma(_3123, _3131, _3113);
    float _3143 = fma(_3123, _3135, _3117);
    float _3145 = _3139 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3147 = fma(_3141, 0.298911988735198974609375, _3145);
    float _3149 = fma(_3143, 0.114477999508380889892578125, _3147);
    out.m_91.x = 0.0;
    float _3151 = -_3149;
    float _3153 = _3141 + _3151;
    float _3155 = -_3149;
    float _3157 = _3139 + _3155;
    float _3159 = -_3149;
    float _3161 = _3143 + _3159;
    float _3163 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3165 = fma(_3153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3149);
    float _3167 = fma(_3157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3149);
    float _3169 = fma(_3161, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3149);
    out.m_87.w = _3163;
    out.m_93.x = _3165;
    out.m_93.y = _3167;
    out.m_93.z = _3169;
    if (!_3137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3171 = -_1939;
    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3175 = -_1941;
    float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3179 = -_1943;
    float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3183 = _3173 * _3173;
    float _3185 = fma(_3177, _3177, _3183);
    float _3187 = fma(_3181, _3181, _3185);
    float _3189 = sqrt(_3187);
    float _3191 = rsqrt(_3187);
    float _3193 = -_3189;
    float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3197 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3199 = precise::clamp(_3197, 0.0, 1.0);
    float _3201 = _3177 * _3191;
    float _3203 = _3173 * _3191;
    float _3205 = abs(_3199);
    float _3207 = log2(_3205);
    float _3209 = _3181 * _3191;
    float _3211 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3213 = _1845 * _3203;
    float _3215 = -_3203;
    float _3217 = -_3211;
    float _3219 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3217);
    float _3221 = fma(_1847, _3201, _3213);
    float _3223 = -_3209;
    float _3225 = fma(_3223, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3219);
    float _3227 = fma(_1849, _3209, _3221);
    float _3229 = precise::clamp(_3227, 0.0, 1.0);
    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3233 = _3225 + _3231;
    float _3235 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3237 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3239 = precise::clamp(_3237, 0.0, 1.0);
    float _3241 = exp2(_3235);
    float _3243 = _3241 * _3239;
    float _3245 = _3229 * _3243;
    float _3247 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3249 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3251 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3247;
    out.m_91.y = _3249;
    out.m_91.z = _3251;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3023 = false;
    bool _1895 = false;
    bool _1187 = false;
    bool _999 = false;
    bool _565 = false;
    bool _317 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_60.w;
    float _115 = trunc(_113);
    int _117 = int(_115);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_63.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3308 = as_type<float>(_133);
        out.gl_Position.z = _3308;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_65.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3377 = as_type<float>(_171);
        out.gl_Position.z = _3377;
    }
    if (_165)
    {
        return out;
    }
    float _173 = in.m_67.w;
    float _175 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_65.x;
    float _189 = in.m_65.y;
    float _191 = in.m_65.z;
    float _193 = in.m_60.x;
    float _195 = in.m_60.y;
    float _197 = in.m_60.z;
    float _199 = 0.0;
    float _201 = _175;
    if (!_185)
    {
        float _203 = _175 * _175;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_185)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    bool _215 = !_185;
    float _217 = _213;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _175 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _175);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_185;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _175 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _201 = _271;
    }
    float _273 = _201;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _187, _277);
    float _285 = fma(_273, _189, _279);
    float _287 = fma(_273, _191, _281);
    float _289 = fma(_283, _173, _193);
    float _291 = fma(_285, _173, _195);
    float _293 = fma(_287, _173, _197);
    bool _295 = !_275;
    float _297 = _293;
    float _315;
    if (!_295)
    {
        float _299 = in.m_69.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_117);
        float _321 = 1.0 / _319;
        float _323 = _151 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = 1.0 / _329;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _347 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_325);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _333;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _363 = _341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _365 = _345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _325 + _367;
    out.m_71.w = _361;
    float _371 = 1.0 / _337;
    float _373 = _343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = _325 + _375;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    out.m_73.x = _363;
    out.m_73.y = _373;
    out.m_73.z = _365;
    float _381 = _377 * _339;
    float _383 = _369 * _359;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _325 + _385;
    bool _389 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _391 = isnan(_325);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    bool _401 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _403 = isnan(_325);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _387 * _371;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _415;
    float _419 = -_357;
    float _421 = _419 + 1.0;
    bool _423 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _425 = isnan(_325);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    float _439 = fma(_417, _381, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _441 = _399 * _421;
    float _443 = -_399;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _459;
    float _463 = -_433;
    float _465 = _463 + 1.0;
    float _467 = _433 * _445;
    float _469 = fma(_437, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _471 = fma(_461, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _473 = fma(_449, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _475 = fma(_453, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _477 = fma(_457, _383, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _479 = _411 * _465;
    float _481 = in.m_67.x;
    float _483 = in.m_67.y;
    float _485 = in.m_67.z;
    float _487 = -_411;
    float _489 = _487 + 1.0;
    float _491 = _469 * _479;
    float _493 = _471 * _479;
    float _495 = _439 * _479;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _503 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _493);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _509;
    float _513 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].z, _495);
    float _515 = fma(_499, _413, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _517 = fma(_507, _413, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = fma(_511, _413, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _521 = fma(_477, _467, _513);
    float _523 = fma(_475, _467, _503);
    float _525 = fma(_473, _467, _501);
    float _527 = fma(_519, _441, _521);
    float _529 = fma(_517, _441, _523);
    float _531 = fma(_515, _441, _525);
    float _533 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].z, _527);
    float _535 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _529);
    float _537 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _531);
    float _539 = _533 * _485;
    float _541 = _535 * _483;
    float _543 = _537 * _481;
    bool _545 = !_379;
    float _563;
    if (!_545)
    {
        float _547 = in.m_69.x;
        float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[14].x, _151);
        float _555 = _553 * _549;
        float _557 = floor(_555);
        float _559 = -_557;
        float _561 = _555 + _559;
        _563 = _561;
        _565 = true;
    }
    else
    {
        float _567 = float(_117);
        float _569 = 1.0 / _567;
        float _571 = _151 * _569;
        _563 = _571;
    }
    _565 = false;
    float _573 = _563;
    int _575 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _577 = _575;
    int _579 = 0;
    int _581 = _108(_577, _579, (*spvDescriptorSet0.support_buffer));
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _595 = 1.0 / _585;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _601 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _603 = isnan(_573);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = 1.0 / _589;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _623 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _625 = isnan(_573);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = 1.0 / _593;
    float _637 = _617 * _595;
    bool _639 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _641 = isnan(_573);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _653 = _573 + _651;
    float _655 = fma(_637, _653, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _657 = 1.0 / _599;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _671 = _665 * _613;
    float _673 = _669 * _635;
    float _675 = _621 * _657;
    bool _677 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _679 = isnan(_573);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_649;
    float _691 = _689 + 1.0;
    bool _693 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _695 = isnan(_573);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _709 = -_687;
    float _711 = _709 + 1.0;
    float _713 = _687 * _691;
    float _715 = -_703;
    float _717 = _715 + 1.0;
    float _719 = 1.0 / _707;
    float _721 = _703 * _711;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _727 = _611 * _717;
    float _729 = -_611;
    float _731 = _729 + 1.0;
    float _733 = -_633;
    float _735 = _733 + 1.0;
    bool _737 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _739 = isnan(_573);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = _633 * _731;
    float _751 = 1.0 / _725;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _757 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _759 = isnan(_573);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -_747;
    float _771 = _769 + 1.0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _773;
    float _777 = _747 * _735;
    float _779 = _767 * _771;
    float _781 = 1.0 / _755;
    float _783 = _775 * _719;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _787 = _573 + _785;
    float _789 = _655 * _779;
    float _791 = -_767;
    float _793 = _791 + 1.0;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _797 = _573 + _795;
    float _799 = fma(_675, _787, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _801 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[159].x, _789);
    float _803 = _661 * _751;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _811 = _573 + _809;
    float _813 = fma(_671, _797, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _815 = fma(_799, _777, _801);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _819 = _573 + _817;
    float _821 = fma(_673, _811, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _823 = _807 * _781;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _827 = _573 + _825;
    float _829 = fma(_813, _749, _815);
    bool _831 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _833 = isnan(_573);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = in.m_75.z;
    float _845 = fma(_783, _827, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _847 = fma(_821, _727, _829);
    float _849 = fma(_803, _819, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _851 = -_841;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _857 = _573 + _855;
    float _859 = fma(_845, _721, _847);
    float _861 = _649 * _853;
    float _863 = fma(_823, _857, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _865 = fma(_849, _713, _859);
    float _867 = fma(_863, _861, _865);
    float _869 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[166].x, _867);
    float _871 = precise::clamp(_869, 0.0, 1.0);
    float _873 = trunc(_843);
    int _875 = int(_873);
    int _877 = _581 + (-1);
    float _879 = float(_877);
    float _881 = _871 * _879;
    float _883 = trunc(_881);
    int _885 = int(_883);
    int _887 = _885;
    int _889 = 0;
    int _891 = _109(_887, _889, (*spvDescriptorSet0.support_buffer));
    int _893 = _875;
    int _895 = 0;
    int _897 = _109(_893, _895, (*spvDescriptorSet0.support_buffer));
    float4 _900 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_891, _897)), 0).xyzw;
    float _902 = _900.x;
    float _904 = _900.y;
    float _906 = _900.z;
    float _908 = _900.w;
    int _910 = _885 + 1;
    int _912 = min(_877, _910);
    uint _915 = as_type<uint>(half2(float2(_908, 0.0)));
    uint _917 = extract_bits(_915, 0u, 8u);
    int _919 = int(_917) & 255;
    uint _921 = extract_bits(_915, 8u, 8u);
    int _923 = int(_921) & 255;
    int _925 = _923 << 8;
    int _927 = _919 | _925;
    bool _929 = _927 >= 32768;
    int _931 = _927 + (-1024);
    int _933 = _931;
    if (_929)
    {
        int _935 = ~_927;
        int _937 = _935 + 33792;
        int _939 = _937 + 1;
        _933 = _939;
    }
    int _941 = _933;
    int _943 = _941 + 30719;
    float _945 = float(_943);
    float _947 = fma(_945, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _949 = abs(_947);
    float _951 = -_949;
    float _953 = _951 + 1.0;
    float _955 = abs(_947);
    float _957 = fma(_955, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _959 = _947 < 0.0;
    float _961 = float(_959);
    int _963 = as_type<int>(_953) + (-218103808);
    float _965 = abs(_947);
    float _967 = fma(_965, _957, -0.212114393711090087890625);
    bool _969 = uint(_963) >= 1920991232u;
    float _971 = abs(_947);
    float _973 = fma(_971, _967, 1.570728778839111328125);
    bool _975 = !_969;
    float _997;
    if (!_975)
    {
        int _977 = as_type<int>(_953);
        int _979 = as_type<int>(_727);
        int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[166].x);
        int _983 = 4544;
        int _985;
        int _987;
        int _989;
        int _991;
        int _993;
        int _995;
        _106(_977, _979, _981, _983, _985, _987, _989, _991, _993, _995, out.gl_Position, out.gl_PointSize);
        _997 = as_type<float>(_991);
        _999 = true;
    }
    else
    {
        float _1001 = rsqrt(_953);
        float _1003 = _953 * _1001;
        float _1005 = _1001 * 0.5;
        float _1007 = -_1003;
        float _1009 = 0.0 + _1007;
        float _1011 = fma(_1005, _1009, 0.5);
        float _1013 = fma(_1003, _1011, _1003);
        float _1015 = -_1013;
        float _1017 = 0.0 + _1015;
        float _1019 = fma(_1013, _1017, _953);
        float _1021 = fma(_1005, _1019, _1013);
        _997 = _1021;
    }
    _999 = false;
    float _1023 = _997;
    int _1025 = _912;
    int _1027 = 0;
    int _1029 = _109(_1025, _1027, (*spvDescriptorSet0.support_buffer));
    int _1031 = _875;
    int _1033 = 0;
    int _1035 = _109(_1031, _1033, (*spvDescriptorSet0.support_buffer));
    float4 _1037 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1029, _1035)), 0).xyzw;
    float _1039 = _1037.x;
    float _1041 = _1037.y;
    float _1043 = _1037.z;
    float _1045 = _1037.w;
    float _1047 = _973 * _1023;
    float _1049 = _961 * 2.0;
    float _1051 = _945 * 3.883221149444580078125;
    float _1053 = floor(_881);
    float _1055 = -_1049;
    float _1057 = fma(_1047, _1055, _1047);
    float _1059 = _1051 * 0.15915493667125701904296875;
    float _1061 = fma(_961, 3.1415927410125732421875, _1057);
    float _1063 = _1059 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1061 * 0.15915493667125701904296875;
    float _1069 = _1067 * 6.283185482025146484375;
    float _1071 = sin(_1069);
    float _1073 = -_1053;
    float _1075 = _881 + _1073;
    float _1077 = _1059 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1071 * _1065;
    float _1083 = _1071 * _1079;
    uint _1085 = as_type<uint>(half2(float2(_1045, 0.0)));
    float _1087 = -_902;
    float _1089 = _1087 + _1039;
    float _1091 = -_906;
    float _1093 = _1091 + _1043;
    uint _1095 = extract_bits(_1085, 0u, 8u);
    int _1097 = int(_1095) & 255;
    uint _1099 = extract_bits(_1085, 8u, 8u);
    int _1101 = int(_1099) & 255;
    int _1103 = _1101 << 8;
    int _1105 = _1097 | _1103;
    float _1107 = fma(_1075, _1089, _902);
    float _1109 = fma(_1075, _1093, _906);
    bool _1111 = _1105 >= 32768;
    int _1113 = _1105 + (-1024);
    int _1115 = _1113;
    if (_1111)
    {
        int _1117 = ~_1105;
        int _1119 = _1117 + 33792;
        int _1121 = _1119 + 1;
        _1115 = _1121;
    }
    int _1123 = _1115;
    int _1125 = _1123 + 30719;
    float _1127 = float(_1125);
    float _1129 = fma(_1127, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1131 = abs(_1129);
    float _1133 = -_1131;
    float _1135 = _1133 + 1.0;
    float _1137 = abs(_1129);
    float _1139 = fma(_1137, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1141 = -_904;
    float _1143 = _1141 + _1041;
    int _1145 = as_type<int>(_1135) + (-218103808);
    float _1147 = abs(_1129);
    float _1149 = fma(_1147, _1139, -0.212114393711090087890625);
    float _1151 = fma(_1075, _1143, _904);
    bool _1153 = _1129 < 0.0;
    float _1155 = float(_1153);
    bool _1157 = uint(_1145) >= 1920991232u;
    float _1159 = abs(_1129);
    float _1161 = fma(_1159, _1149, 1.570728778839111328125);
    bool _1163 = !_1157;
    float _1185;
    if (!_1163)
    {
        int _1165 = as_type<int>(_1135);
        int _1167 = as_type<int>(_1047);
        int _1169 = as_type<int>(_1135);
        int _1171 = 5440;
        int _1173;
        int _1175;
        int _1177;
        int _1179;
        int _1181;
        int _1183;
        _106(_1165, _1167, _1169, _1171, _1173, _1175, _1177, _1179, _1181, _1183, out.gl_Position, out.gl_PointSize);
        _1185 = as_type<float>(_1179);
        _1187 = true;
    }
    else
    {
        float _1189 = rsqrt(_1135);
        float _1191 = _1135 * _1189;
        float _1193 = _1189 * 0.5;
        float _1195 = -_1191;
        float _1197 = 0.0 + _1195;
        float _1199 = fma(_1193, _1197, 0.5);
        float _1201 = fma(_1191, _1199, _1191);
        float _1203 = -_1201;
        float _1205 = 0.0 + _1203;
        float _1207 = fma(_1201, _1205, _1135);
        float _1209 = fma(_1193, _1207, _1201);
        _1185 = _1209;
    }
    _1187 = false;
    float _1211 = _1185;
    float _1213 = in.m_69.x;
    float _1215 = in.m_69.y;
    float _1217 = in.m_69.z;
    float _1219 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1221 = log2(_1219);
    float _1223 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1225 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1233 = _1231 != 0;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1237 = _1235 != 0;
    float _1239 = _1161 * _1211;
    float _1241 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1243 = _1127 * 3.883221149444580078125;
    float _1245 = -_947;
    float _1247 = _1245 + _1129;
    float _1249 = fma(_1075, _1247, _947);
    float _1251 = _1217 * 2.0;
    float _1253 = _1213 * 2.0;
    float _1255 = _1215 + _1217;
    float _1257 = _1215 + _1213;
    float _1259 = _1215 * 2.0;
    float _1261 = floor(_1253);
    float _1263 = _1255 + (-1.0);
    float _1265 = _1257 + (-1.0);
    float _1267 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1269 = floor(_1251);
    float _1271 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1273 = _1221 * _151;
    bool _1275 = !_1229;
    int _1277 = _1275 ? 0 : 1;
    int _1279 = abs(_1277);
    float _1281 = exp2(_1273);
    bool _1283 = _1261 >= 0.0;
    bool _1285 = isnan(_1261);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    int _1293 = _1291 ? 0 : 1;
    bool _1295 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1297 = isnan(0.0);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1303 = _1299 || _1301;
    float _1305 = floor(_1259);
    bool _1307 = _1269 > 0.0;
    bool _1309 = _1269 >= 0.0;
    bool _1311 = isnan(_1269);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.0);
    bool _1317 = _1313 || _1315;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = -_1281;
    float _1323 = _1321 + 1.0;
    bool _1325 = _1261 > 0.0;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1329 = 1.0 + _1327;
    int _1331 = ~_1319;
    int _1333 = _1331 + 1;
    int _1335 = _1333 + 1;
    bool _1337 = !_1233;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = 1.0 / _1329;
    int _1343 = _1335;
    float _1345 = _1249;
    if (!_1307)
    {
        int _1347 = ~_1319;
        int _1349 = _1347 + 1;
        _1343 = _1349;
    }
    int _1351 = _1343;
    float _1353 = in.m_77.x;
    float _1355 = in.m_77.y;
    float _1357 = in.m_77.z;
    bool _1359 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1361 = isnan(1.0);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1367 = _1363 || _1365;
    float _1369 = float(_1351);
    float _1371 = _1303 ? _1323 : 0.0;
    int _1373 = abs(_1339);
    float _1375 = float(_1279);
    int _1377 = ~_1293;
    int _1379 = _1377 + 1;
    int _1381 = _1379 + 1;
    int _1383 = _1381;
    if (!_1325)
    {
        int _1385 = ~_1293;
        int _1387 = _1385 + 1;
        _1383 = _1387;
    }
    int _1389 = _1383;
    float _1391 = _1375 * _1369;
    bool _1393 = _1305 > 0.0;
    if (_1367)
    {
        float _1395 = _1371 * _1341;
        _155 = _1395;
    }
    float _1397 = _155;
    float _1399 = float(_1373);
    float _1401 = _1391 * (-2.0);
    float _1403 = float(_1389);
    float _1405 = _1213 + (-0.5);
    bool _1407 = _1305 >= 0.0;
    bool _1409 = isnan(_1305);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan(0.0);
    bool _1415 = _1411 || _1413;
    float _1417 = _1217 + _1213;
    float _1419 = _1217 + (-0.5);
    float _1421 = fma(_1401, _1353, _1353);
    bool _1423 = !_1237;
    int _1425 = _1423 ? 0 : 1;
    float _1427 = _1399 * _1403;
    int _1429 = _1415 ? 0 : 1;
    float _1431 = fma(_1267, _1401, _1267);
    float _1433 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1421);
    int _1435 = abs(_1425);
    float _1437 = _1427 * (-2.0);
    int _1439 = ~_1429;
    int _1441 = _1439 + 1;
    int _1443 = _1441 + 1;
    float _1445 = fma(_1431, _1397, _1433);
    int _1447 = _1443;
    if (!_1393)
    {
        int _1449 = ~_1429;
        int _1451 = _1449 + 1;
        _1447 = _1451;
    }
    int _1453 = _1447;
    float _1455 = fma(_1437, _1355, _1355);
    float _1457 = fma(_1271, _1437, _1271);
    float _1459 = _1215 + (-0.5);
    float _1461 = float(_1453);
    float _1463 = _1417 + (-1.0);
    float _1465 = float(_1435);
    float _1467 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1455);
    float _1469 = _1445 * 0.15915493667125701904296875;
    bool _1471 = _1151 != 0.0;
    bool _1473 = isnan(_1151);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    float _1481 = _1465 * _1461;
    float _1483 = fma(_1457, _1397, _1467);
    float _1485 = _1469 * 6.283185482025146484375;
    float _1487 = sin(_1485);
    float _1489 = _1481 * (-2.0);
    float _1491 = _1483 * 0.15915493667125701904296875;
    bool _1493 = _1107 == 0.0;
    bool _1495 = !_1479;
    bool _1497 = _1493 && _1495;
    float _1499 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1501 = fma(_1489, _1357, _1357);
    bool _1503 = _1109 == 0.0;
    bool _1505 = _1503 && _1497;
    float _1507 = fma(_1499, _1489, _1499);
    float _1509 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1501);
    float _1511 = _1469 * 6.283185482025146484375;
    float _1513 = cos(_1511);
    float _1515 = _1155 * 2.0;
    float _1517 = fma(_1507, _1397, _1509);
    float _1519 = -_1515;
    float _1521 = fma(_1239, _1519, _1239);
    float _1523 = _1517 * 0.15915493667125701904296875;
    float _1525 = _1491 * 6.283185482025146484375;
    float _1527 = sin(_1525);
    float _1529 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1109);
    float _1531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1107);
    float _1533 = fma(_1155, 3.1415927410125732421875, _1521);
    if (!_1505)
    {
        float _1535 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1249);
        _1345 = _1535;
    }
    float _1537 = _1345;
    float _1539 = _1531 * _1241;
    float _1541 = _1491 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    float _1545 = _1523 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1551 = _1487 * _1527;
    float _1553 = _1549 * _1223;
    float _1555 = _1529 * _1225;
    float _1557 = _1513 * _1527;
    float _1559 = _1523 * 6.283185482025146484375;
    float _1561 = sin(_1559);
    float _1563 = _1513 * _1543;
    float _1565 = _1487 * _1543;
    float _1567 = _1487 * _1547;
    float _1569 = _1513 * _1547;
    float _1571 = _1543 * _1547;
    float _1573 = _1527 * _1547;
    float _1575 = _1567 * _1553;
    float _1577 = _1569 * _1553;
    float _1579 = _1243 * 0.15915493667125701904296875;
    float _1581 = fma(_1561, _1563, _1551);
    float _1583 = fma(_1561, _1551, _1563);
    float _1585 = -_1557;
    float _1587 = fma(_1561, _1565, _1585);
    float _1589 = -_1565;
    float _1591 = fma(_1561, _1557, _1589);
    float _1593 = -_1553;
    float _1595 = _1561 * _1593;
    float _1597 = _291 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1599 = fma(_1581, _1539, _1577);
    float _1601 = fma(_1587, _1539, _1575);
    float _1603 = fma(_1571, _1539, _1595);
    float _1605 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1597);
    float _1607 = _291 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1609 = fma(_1583, _1555, _1601);
    float _1611 = fma(_1573, _1555, _1603);
    float _1613 = fma(_1591, _1555, _1599);
    float _1615 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1607);
    float _1617 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1605);
    float _1619 = _1579 * 6.283185482025146484375;
    float _1621 = cos(_1619);
    float _1623 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1625 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1627 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1615);
    float _1629 = _1617 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1631 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1623);
    float _1633 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1625);
    float _1635 = _1627 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1637 = _291 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1639 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1631);
    float _1641 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1633);
    float _1643 = _1533 * 0.15915493667125701904296875;
    float _1645 = _1579 * 6.283185482025146484375;
    float _1647 = sin(_1645);
    float _1649 = _1629 + _1639;
    float _1651 = _1635 + _1641;
    float _1653 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1637);
    float _1655 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1659 = _1649 + _1657;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1663 = _1651 + _1661;
    float _1665 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1653);
    float _1667 = _1643 * 6.283185482025146484375;
    float _1669 = sin(_1667);
    float _1671 = _1659 * _1659;
    float _1673 = _1663 * _1663;
    float _1675 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1655);
    float _1677 = -_1537;
    float _1679 = _1561 * _1677;
    float _1681 = _1569 * _1537;
    float _1683 = _1671 + _1673;
    float _1685 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1675);
    float _1687 = _1567 * _1537;
    float _1689 = sqrt(_1683);
    float _1691 = -_1081;
    float _1693 = fma(_1669, _1621, _1691);
    float _1695 = -_1083;
    float _1697 = fma(_1669, _1647, _1695);
    float _1699 = fma(_1075, _1693, _1081);
    float _1701 = fma(_1075, _1697, _1083);
    float _1703 = _1665 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1705 = _1699;
    float _1707 = _1701;
    float _1709 = _1569;
    float _1711 = _1665;
    float _1713 = _1561;
    float _1715 = _1637;
    float _1717 = _1629;
    if (!_1505)
    {
        float _1719 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1699);
        _1705 = _1719;
    }
    float _1721 = _1705;
    if (!_1505)
    {
        float _1723 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1701);
        _1707 = _1723;
    }
    float _1725 = _1707;
    bool _1727 = _1689 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1729 = _1703 + _1685;
    float _1731 = _1725;
    if (!_1727)
    {
        _1709 = _1673;
    }
    float _1733 = _1709;
    float _1735 = _1733;
    if (!_1727)
    {
        _297 = _1671;
    }
    float _1737 = _297;
    float _1739 = _1737;
    if (!_1727)
    {
        _1711 = _1649;
    }
    float _1741 = _1711;
    float _1743 = _1741;
    if (!_1727)
    {
        _1713 = _1651;
    }
    float _1745 = _1713;
    float _1747 = _1745;
    if (!_1727)
    {
        _1715 = _1729;
    }
    float _1749 = _1715;
    bool _1751 = !_1727;
    float _1753 = _1749;
    if (!_1751)
    {
        float _1755 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1759 = _1689 + _1757;
        float _1761 = rsqrt(_1683);
        float _1763 = _1759 * _1755;
        float _1765 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1767 = _1763 * 0.15915493667125701904296875;
        float _1769 = _1767 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1767 * 6.283185482025146484375;
        float _1775 = cos(_1773);
        float _1777 = fma(_1771, _1765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1779 = _1761 * _1777;
        float _1781 = _1775 + (-1.0);
        float _1783 = _1659 * _1779;
        float _1785 = _1663 * _1779;
        float _1787 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1791 = _1785 * _1785;
        float _1793 = fma(_1729, _1775, _1787);
        float _1795 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1797 = _1783 * _1783;
        _1753 = _1793;
        _1739 = _1797;
        _1735 = _1791;
        _1743 = _1795;
        _1747 = _1789;
    }
    float _1799 = _1753;
    float _1801 = _1739;
    float _1803 = _1735;
    float _1805 = _1743;
    float _1807 = _1747;
    float _1809 = in.m_79.x;
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1813 = _1799 + _1811;
    float _1815 = fma(_1581, _1721, _1681);
    float _1817 = fma(_1571, _1721, _1679);
    float _1819 = fma(_1587, _1721, _1687);
    float _1821 = fma(_1813, _1813, _1801);
    float _1823 = fma(_1591, _1725, _1815);
    float _1825 = fma(_1573, _1725, _1817);
    float _1827 = fma(_1583, _1725, _1819);
    float _1829 = _1821 + _1803;
    float _1831 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1833 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1837 = sqrt(_1829);
    float _1839 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1831);
    float _1841 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1833);
    float _1843 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1835);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1839);
    float _1847 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1841);
    float _1849 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1843);
    out.m_81.x = _1809;
    out.m_83.x = _1847;
    out.m_83.y = _1845;
    out.m_83.z = _1849;
    bool _1851 = _1837 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1853 = isnan(_1837);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1859 = _1855 || _1857;
    if (!_1859)
    {
        _1731 = 1.0;
    }
    float _1861 = _1731;
    bool _1863 = !_1859;
    float _1865 = _1861;
    if (!_1863)
    {
        bool _1867 = _1837 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1869 = isnan(_1837);
        bool _1871 = _1867 || _1869;
        bool _1873 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1875 = _1871 || _1873;
        if (!_1875)
        {
            float _1877 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1879 = _1837 + _1877;
            float _1881 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1883 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1881;
            float _1885 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1887 = _1885 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1889 = 1.0 / _1883;
            float _1891 = _1879 * _1889;
            float _1893 = fma(_1891, _1887, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1865 = _1893;
            _1895 = true;
        }
        else
        {
            bool _1897 = _1837 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1899 = isnan(_1837);
            bool _1901 = _1897 || _1899;
            bool _1903 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1905 = _1901 || _1903;
            if (!_1905)
            {
                float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1909 = _1837 + _1907;
                float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1913 = _1911 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1917 = _1915 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1919 = 1.0 / _1913;
                float _1921 = _1909 * _1919;
                float _1923 = fma(_1921, _1917, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1865 = _1923;
                _1895 = true;
            }
            else
            {
                _1865 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1895 = false;
    float _1925 = _1865;
    float _1927 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1929 = _1799 + _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1933 = _1805 + _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1937 = _1807 + _1935;
    float _1939 = fma(_1929, _1925, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1941 = fma(_1933, _1925, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1943 = fma(_1937, _1925, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1945 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1949 = _1939 + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1953 = _1941 + _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1957 = _1943 + _1955;
    float _1959 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1945);
    float _1961 = _1949 * _1949;
    float _1963 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1959);
    float _1965 = fma(_1953, _1953, _1961);
    float _1967 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1969 = _1963 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1971 = fma(_1957, _1957, _1965);
    float _1973 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1967);
    float _1975 = 1.0 / _1969;
    float _1977 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1979 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1973);
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1983 = rsqrt(_1971);
    float _1985 = _1981 + _1969;
    float _1987 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1989 = _1703 + _1987;
    float _1991 = _1985 * _1975;
    float _1993 = _1991 * 0.5;
    float _1995 = floor(_1977);
    float _1997 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2001 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1999);
    float _2003 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2005 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1997);
    float _2007 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2009 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2003);
    float _2011 = 1.0 / _2001;
    float _2013 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2005);
    float _2015 = _1953 * _2007;
    float _2017 = _1957 * _2007;
    float _2019 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2009);
    float _2021 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2023 = _2015 * _2015;
    float _2025 = _2017 * _2017;
    float _2027 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2029 = trunc(_2021);
    int _2031 = int(_2029);
    float _2033 = -_1995;
    float _2035 = _1977 + _2033;
    float _2037 = _2023 + _2025;
    float _2039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2041 = _2011 * _2039;
    float _2043 = sqrt(_2037);
    bool _2045 = _2041 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2047 = _2041 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2049 = trunc(_2027);
    int _2051 = int(_2049);
    int _2053 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2055 = _2031 + _2053;
    int _2057 = _2055 + 1;
    bool _2059 = _2043 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2063 = _2043 + _2061;
    int _2065 = 2;
    float _2067 = _2037;
    float _2069 = _2063;
    float _2071 = _2007;
    float _2073 = _2015;
    float _2075 = _2023;
    if (!_2045)
    {
        _2065 = 1;
    }
    int _2077 = _2065;
    float _2079 = sqrt(_1971);
    int _2081 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2083 = _2051 + _2081;
    int _2085 = _2083 + 1;
    float _2087 = _1987;
    int _2089 = _2077;
    if (_2059)
    {
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2087 = _2091;
    }
    float _2093 = _2087;
    if (_2059)
    {
        float _2095 = rsqrt(_2037);
        _2067 = _2095;
    }
    float _2097 = _2067;
    float _2099 = _2097;
    if (_2059)
    {
        float _2101 = _2063 * _2093;
        _2069 = _2101;
    }
    float _2103 = _2069;
    float _2105 = 0.0;
    if (_2059)
    {
        float _2107 = _2103 * 0.15915493667125701904296875;
        _2105 = _2107;
    }
    float _2109 = _2105;
    bool _2111 = !_2045;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2117 = _2013;
    if (_2059)
    {
        float _2119 = _2109 * 6.283185482025146484375;
        float _2121 = sin(_2119);
        _2117 = _2121;
    }
    float _2123 = _2117;
    if (!_2047)
    {
        _2089 = _2113;
    }
    int _2125 = _2089;
    float _2127 = precise::max(0.0, _2115);
    int _2129 = _2125 << 6;
    bool _2131 = _2057 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2133 = -_2007;
    float _2135 = -_2127;
    float _2137 = fma(_1949, _2133, _2135);
    int _2139 = _2129 + 96;
    uint _2141 = uint(int(uint(_2139) >> uint(2)));
    uint _2143 = uint(int(uint(int(_2141)) >> uint(2)));
    int _2145 = int(_2141) & 3;
    float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
    int _2149 = int(_2141) + 1;
    uint _2151 = uint(int(uint(_2149) >> uint(2)));
    int _2153 = _2149 & 3;
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[int(_2151)][_2153];
    int _2157 = _2057 | _2085;
    float _2159 = _2109;
    float _2161 = as_type<float>(_2157);
    float _2163 = _2137;
    if (_2059)
    {
        float _2165 = _2109 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        _2159 = _2167;
    }
    float _2169 = _2159;
    if (_2059)
    {
        float _2171 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2071 = _2171;
    }
    float _2173 = _2071;
    bool _2175 = _2157 < 0;
    bool _2177 = _2175 || _2131;
    if (_2059)
    {
        float _2179 = fma(_2123, _2173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2161 = _2179;
    }
    float _2181 = _2161;
    int _2183 = _2129 + 48;
    uint _2185 = uint(int(uint(_2183) >> uint(2)));
    uint _2187 = uint(int(uint(int(_2185)) >> uint(2)));
    int _2189 = int(_2185) & 3;
    float _2191 = (*spvDescriptorSet0.vp_c15)._m0[int(_2187)][_2189];
    int _2193 = int(_2185) + 1;
    uint _2195 = uint(int(uint(_2193) >> uint(2)));
    int _2197 = _2193 & 3;
    float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
    float _2201 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2203 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2205 = 0.0;
    if (_2059)
    {
        float _2207 = _2097 * _2181;
        _2205 = _2207;
    }
    float _2209 = _2205;
    bool _2211 = _2085 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2213 = _2211 || _2177;
    float _2215 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2201);
    float _2217 = floor(_2203);
    if (_2059)
    {
        float _2219 = _2015 * _2209;
        _2073 = _2219;
    }
    float _2221 = _2073;
    int _2223 = _2129 + 104;
    uint _2225 = uint(int(uint(_2223) >> uint(2)));
    uint _2227 = uint(int(uint(int(_2225)) >> uint(2)));
    int _2229 = int(_2225) & 3;
    float _2231 = (*spvDescriptorSet0.vp_c15)._m0[int(_2227)][_2229];
    int _2233 = int(_2225) + 1;
    uint _2235 = uint(int(uint(_2233) >> uint(2)));
    int _2237 = _2233 & 3;
    float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
    float _2241 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2215);
    float _2243 = _2241;
    if (_2059)
    {
        float _2245 = _2169 + (-1.0);
        _2099 = _2245;
    }
    float _2247 = _2099;
    float _2249 = _2247;
    if (_2059)
    {
        float _2251 = _2221 * _2221;
        _2075 = _2251;
    }
    float _2253 = _2075;
    float _2255 = 0.0;
    if (_2059)
    {
        float _2257 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2257;
    }
    float _2259 = _2255;
    if (!_2059)
    {
        _2249 = _2017;
    }
    float _2261 = _2249;
    int _2263 = _2129 + 64;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    uint _2267 = uint(int(uint(int(_2265)) >> uint(2)));
    int _2269 = int(_2265) & 3;
    float _2271 = (*spvDescriptorSet0.vp_c15)._m0[int(_2267)][_2269];
    int _2273 = int(_2265) + 1;
    uint _2275 = uint(int(uint(_2273) >> uint(2)));
    int _2277 = _2273 & 3;
    float _2279 = (*spvDescriptorSet0.vp_c15)._m0[int(_2275)][_2277];
    float _2281 = _2261;
    if (_2059)
    {
        float _2283 = _2017 * _2209;
        _2281 = _2283;
    }
    float _2285 = _2281;
    if (_2059)
    {
        float _2287 = fma(_2137, _2169, _2259);
        _2163 = _2287;
    }
    float _2289 = _2163;
    float _2291 = _2241 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2059)
    {
        _2243 = _2025;
    }
    float _2293 = _2243;
    float _2295 = _2293;
    if (_2059)
    {
        float _2297 = _2285 * _2285;
        _2295 = _2297;
    }
    float _2299 = _2295;
    float _2301 = fma(_2289, _2289, _2253);
    float _2303 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _2305 = _2129 + 80;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
    int _2311 = int(_2307) & 3;
    float _2313 = (*spvDescriptorSet0.vp_c15)._m0[int(_2309)][_2311];
    int _2315 = int(_2307) + 1;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    int _2319 = _2315 & 3;
    float _2321 = (*spvDescriptorSet0.vp_c15)._m0[int(_2317)][_2319];
    float _2323 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2325 = _2301 + _2299;
    float _2327 = 0.0;
    int _2329 = as_type<int>(_2323);
    if (!_2213)
    {
        float _2331 = floor(_2027);
        _2327 = _2331;
    }
    float _2333 = _2327;
    float _2335 = -_2323;
    float _2337 = fma(_2335, _2303, 1.0);
    if (!_2213)
    {
        int _2339 = _2085 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2341 = _2339 + _2057;
        _2329 = _2341;
    }
    int _2343 = _2329;
    float _2345 = -_2217;
    float _2347 = _2203 + _2345;
    int _2349 = _2129 + 56;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    uint _2353 = uint(int(uint(int(_2351)) >> uint(2)));
    int _2355 = int(_2351) & 3;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[int(_2353)][_2355];
    int _2359 = int(_2351) + 1;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    int _2363 = _2359 & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    float _2367 = log2(_2337);
    int _2369 = _2129 + 88;
    uint _2371 = uint(int(uint(_2369) >> uint(2)));
    uint _2373 = uint(int(uint(int(_2371)) >> uint(2)));
    int _2375 = int(_2371) & 3;
    float _2377 = (*spvDescriptorSet0.vp_c15)._m0[int(_2373)][_2375];
    int _2379 = int(_2371) + 1;
    uint _2381 = uint(int(uint(_2379) >> uint(2)));
    int _2383 = _2379 & 3;
    float _2385 = (*spvDescriptorSet0.vp_c15)._m0[int(_2381)][_2383];
    float _2387 = _1989 * _2155;
    float _2389 = fma(_1629, _2147, _2387);
    int _2391 = _2129 + 72;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    uint _2395 = uint(int(uint(int(_2393)) >> uint(2)));
    int _2397 = int(_2393) & 3;
    float _2399 = (*spvDescriptorSet0.vp_c15)._m0[int(_2395)][_2397];
    int _2401 = int(_2393) + 1;
    uint _2403 = uint(int(uint(_2401) >> uint(2)));
    int _2405 = _2401 & 3;
    float _2407 = (*spvDescriptorSet0.vp_c15)._m0[int(_2403)][_2405];
    float _2409 = _1989 * _2199;
    float _2411 = rsqrt(_2325);
    float _2413 = fma(_1629, _2191, _2409);
    int _2415 = as_type<int>(_2409);
    int _2417 = as_type<int>(_2147);
    if (!_2213)
    {
        int _2419 = _2343 << 2;
        _2415 = _2419;
    }
    int _2421 = _2415;
    float _2423 = fma(_1635, _2231, _2389);
    int _2425 = _2421;
    if (!_2213)
    {
        int _2427 = 12 & _2421;
        _2425 = _2427;
    }
    int _2429 = _2425;
    float _2431 = _2423 + _2239;
    float _2433 = _1989 * _2279;
    float _2435 = _2279;
    int _2437 = as_type<int>(_2321);
    if (!_2213)
    {
        float _2439 = -_2333;
        float _2441 = _2027 + _2439;
        _2435 = _2441;
    }
    float _2443 = _2435;
    float _2445 = 1.0 / _2431;
    float _2447 = _2411 * _2221;
    float _2449 = fma(_1629, _2271, _2433);
    float _2451 = _2411 * _2289;
    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2455 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2453);
    float _2457 = precise::clamp(_2455, 0.0, 1.0);
    float _2459 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2461 = _1989 * _2321;
    float _2463 = _2411 * _2285;
    if (!_2213)
    {
        uint _2465 = uint(int(uint(_2343) >> uint(2)));
        _2437 = int(_2465);
    }
    int _2467 = _2437;
    float _2469 = fma(_1629, _2313, _2461);
    float _2471 = -_2457;
    float _2473 = _2471 + 1.0;
    float _2475 = as_type<float>(_2467);
    if (!_2213)
    {
        int _2477 = _2467 << 4;
        int _2479 = _2477 + _2429;
        _2417 = _2479;
    }
    int _2481 = _2417;
    float _2483 = fma(_1635, _2357, _2413);
    if (!_2213)
    {
        float _2485 = floor(_2021);
        _2475 = _2485;
    }
    float _2487 = _2475;
    float _2489 = _2483 + _2365;
    float _2491 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2493 = fma(_1635, _2377, _2469);
    float _2495 = -_2459;
    float _2497 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2495);
    float _2499 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2501 = abs(_2473);
    float _2503 = log2(_2501);
    float _2505 = -_2463;
    float _2507 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2497);
    float _2509 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2499);
    float _2511 = _2489 * _2445;
    float _2513 = fma(_1635, _2399, _2449);
    float _2515 = fma(_2507, -0.5, 0.5);
    float _2517 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2509);
    float _2519 = fma(_2507, 0.5, 0.5);
    float _2521 = _2513 + _2407;
    float _2523 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2525 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2491);
    bool _2527 = _2511 >= 0.0;
    float _2529 = _2521 * _2445;
    float _2531 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2523);
    float _2533 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2525);
    bool _2535 = _2511 <= 1.0;
    bool _2537 = _2535 && _2527;
    float _2539 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2541 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2531);
    float _2543 = _2533 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2545 = _2529 >= 0.0;
    bool _2547 = _2545 && _2537;
    float _2549 = _2449;
    if (!_2213)
    {
        int _2551 = _2481 + 400;
        uint _2553 = uint(int(uint(_2551) >> uint(2)));
        uint _2555 = uint(int(uint(int(_2553)) >> uint(2)));
        int _2557 = int(_2553) & 3;
        float _2559 = (*spvDescriptorSet0.vp_c15)._m0[int(_2555)][_2557];
        _2549 = _2559;
    }
    float _2561 = _2549;
    float _2563 = _2541 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2565 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2567 = _2529 <= 1.0;
    bool _2569 = _2567 && _2547;
    float _2571 = exp2(_2539);
    float _2573 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2575 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2565);
    float _2577 = _2493 + _2385;
    float _2579 = fma(_2519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2581 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2583 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2575);
    float _2585 = _2451 + 1.0;
    float _2587 = fma(_2519, _2579, -0.212114393711090087890625);
    float _2589 = sqrt(_2515);
    float _2591 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2583);
    float _2593 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2595 = fma(_2519, _2587, 1.570728778839111328125);
    float _2597 = _2587;
    float _2599 = _2591;
    if (_2569)
    {
        float _2601 = float(_2125);
        _2597 = _2601;
    }
    float _2603 = _2597;
    float _2605 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2581);
    float _2607 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2593);
    float _2609 = -_2451;
    float _2611 = fma(_2571, _2585, _2609);
    float _2613 = 1.0 / _2591;
    float _2615 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2605);
    float _2617 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2607);
    float _2619 = _2607;
    if (!_2213)
    {
        float _2621 = -_2487;
        float _2623 = _2021 + _2621;
        _2619 = _2623;
    }
    float _2625 = _2619;
    float _2627 = _2577 * _2445;
    float _2629 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2615);
    float _2631 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2617);
    float _2633 = _2367 * 0.693147182464599609375;
    float _2635 = _2603;
    float _2637 = _2625;
    if (_2569)
    {
        float _2639 = rint(_2603);
        float _2641 = precise::max(_2639, 0.0);
        uint _2643 = uint(_2641);
        uint _2645 = clamp(_2643, 0u, 65535u);
        _2635 = as_type<float>(_2645);
    }
    float _2647 = _2635;
    float _2649 = _2589 * 0.636619746685028076171875;
    float2 _7181 = float2(_2035, _2347);
    float _2651 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7181, float2(0.0), isnan(_7181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7181, float2(0.0), isnan(_7181)), level(0.0)).x;
    float _2653 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2655 = fma(_2611, 0.5, 0.5);
    float _2657 = -_2595;
    float _2659 = fma(_2649, _2657, 1.0);
    float _2661 = _2629 * _2613;
    float _2663 = _2631 * _2613;
    float _2665 = fma(_2661, 0.5, 0.5);
    float _2667 = fma(_2663, -0.5, 0.5);
    float _2669 = _2647;
    if (_2569)
    {
        float3 _7218 = float3(_2511, _2529, float(as_type<int>(_2647)));
        float3 _7222 = select(_7218, float3(0.0), isnan(_7218));
        float _2671 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7222.xy, uint(rint(_7222.z)), _2627, level(0.0));
        _2669 = _2671;
    }
    float _2673 = _2669;
    float3 _7232 = float3(_2665, _2667, _2653);
    float _2675 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7232, float3(0.0), isnan(_7232)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7232, float3(0.0), isnan(_7232)), level(0.0)).x;
    float3 _7241 = float3(_2665, _2667, _2653);
    float4 _2677 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7241, float3(0.0), isnan(_7241)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7241, float3(0.0), isnan(_7241)), level(0.0)).xyzw;
    float _2679 = _2677.x;
    float _2681 = _2677.y;
    float _2683 = _2677.z;
    float _2685 = _2677.w;
    float2 _7257 = float2(_2659, _2655);
    float3 _2689 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7257, float2(0.0), isnan(_7257)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7257, float2(0.0), isnan(_7257)), level(0.0)).xyz;
    float _2691 = _2689.x;
    float _2693 = _2689.y;
    float _2695 = _2689.z;
    float _2697 = _2633;
    if (!_2213)
    {
        float _2699 = rint(_2561);
        float _2701 = precise::max(_2699, 0.0);
        uint _2703 = uint(_2701);
        uint _2705 = clamp(_2703, 0u, 65535u);
        _2697 = as_type<float>(_2705);
    }
    float _2707 = _2697;
    float _2709 = _2707;
    if (!_2213)
    {
        float3 _7294 = float3(_2625, _2443, float(as_type<int>(_2707)));
        float3 _7296 = select(_7294, float3(0.0), isnan(_7294));
        float _2711 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7296.xy, uint(rint(_7296.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7296.xy, uint(rint(_7296.z)), level(0.0)).x;
        _2709 = _2711;
    }
    float _2713 = _2709;
    float _2715 = abs(_2041);
    float _2717 = log2(_2715);
    float _2719 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2721 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2719);
    float _2723 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2721);
    float _2725 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2727 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2723);
    bool _2729 = _2041 <= 8000.0;
    bool _2731 = isnan(_2041);
    bool _2733 = _2729 || _2731;
    bool _2735 = isnan(8000.0);
    bool _2737 = _2733 || _2735;
    float _2739 = float(_2737);
    float _2741 = _2717 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2743 = _2727 + _2591;
    float _2745 = exp2(_2725);
    if (!_2569)
    {
        _2637 = 1.0;
    }
    float _2747 = _2637;
    float _2749 = _2743 * 0.5;
    float _2751 = exp2(_2741);
    out.m_85.z = _2749;
    out.m_85.w = _2591;
    float _2753 = fma(_2751, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2755 = precise::clamp(_2753, 0.0, 1.0);
    float _2757 = fma(_2755, -2.0, 3.0);
    float _2759 = _2755 * _2755;
    float _2761 = _2759 * _2757;
    float _2763 = -_2761;
    float _2765 = _2763 + 1.0;
    out.gl_Position.x = _2629;
    out.gl_Position.y = _2631;
    out.gl_Position.z = _2727;
    out.gl_Position.w = _2591;
    float _2767 = fma(_2765, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2761);
    float _2769 = _2739 * _2767;
    float _2771 = -_2745;
    float _2773 = _2771 + 1.0;
    float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2777 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2779 = _2629;
    float _2781 = _2747;
    if (_2213)
    {
        _2779 = 1.0;
    }
    float _2783 = _2779;
    float _2785 = -_2651;
    float _2787 = _2785 + 1.0;
    float _2789 = _2787 * _2775;
    float _2791 = precise::clamp(_2789, 0.0, 1.0);
    float _2793 = _2783;
    float _2795 = _2791;
    if (_2569)
    {
        bool _2797 = _2673 >= _2627;
        bool _2799 = isnan(_2673);
        bool _2801 = _2797 || _2799;
        bool _2803 = isnan(_2627);
        bool _2805 = _2801 || _2803;
        float _2807 = float(_2805);
        _2781 = _2807;
    }
    float _2809 = _2781;
    if (!_2213)
    {
        int _2811 = _2343 << 4;
        int _2813 = _2811 + 2048;
        uint _2815 = uint(int(uint(_2813) >> uint(2)));
        uint _2817 = uint(int(uint(int(_2815)) >> uint(2)));
        int _2819 = int(_2815) & 3;
        float _2821 = (*spvDescriptorSet0.vp_c15)._m0[int(_2817)][_2819];
        int _2823 = int(_2815) + 1;
        uint _2825 = uint(int(uint(_2823) >> uint(2)));
        int _2827 = _2823 & 3;
        float _2829 = (*spvDescriptorSet0.vp_c15)._m0[int(_2825)][_2827];
        int _2831 = _2813 + 8;
        uint _2833 = uint(int(uint(_2831) >> uint(2)));
        uint _2835 = uint(int(uint(int(_2833)) >> uint(2)));
        int _2837 = int(_2833) & 3;
        float _2839 = (*spvDescriptorSet0.vp_c15)._m0[int(_2835)][_2837];
        int _2841 = int(_2833) + 1;
        uint _2843 = uint(int(uint(_2841) >> uint(2)));
        int _2845 = _2841 & 3;
        float _2847 = (*spvDescriptorSet0.vp_c15)._m0[int(_2843)][_2845];
        float _2849 = _1989 * _2829;
        float _2851 = fma(_1629, _2821, _2849);
        float _2853 = fma(_1635, _2839, _2851);
        float _2855 = _2853 + _2847;
        float _2857 = precise::clamp(_2855, 0.0, 1.0);
        float _2859 = -_2857;
        float _2861 = _2859 + _2713;
        float _2863 = fma(_2861, 500.0, 1.5);
        float _2865 = exp2(_2863);
        float _2867 = 0.0 + _2865;
        float _2869 = precise::clamp(_2867, 0.0, 1.0);
        _2793 = _2869;
        _2599 = _2847;
    }
    float _2871 = _2793;
    float _2873 = _2599;
    float _2875 = _2777 * _2675;
    float _2877 = _2809 * _2871;
    float _2879 = -_2791;
    float _2881 = fma(_2879, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2883 = -_2777;
    float _2885 = _2883 + 1.0;
    float _2887 = _2685 * _2875;
    float _2889 = _2695 * _2875;
    float _2891 = -_2877;
    float _2893 = fma(_2891, _2881, 1.0);
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = _2685 * _2885;
    float _2899 = fma(_2691, _2887, _2679);
    float _2901 = fma(_2693, _2887, _2681);
    float _2903 = _2895 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2905 = fma(_2685, _2889, _2683);
    bool _2907 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2909 = isnan(_2079);
    bool _2911 = _2907 || _2909;
    bool _2913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2915 = _2911 || _2913;
    out.m_87.x = _2903;
    out.m_89.x = _2899;
    out.m_89.y = _2901;
    out.m_89.z = _2905;
    out.m_89.w = _2897;
    float _2917 = _2873;
    float _2919 = _2885;
    float _2921 = _2881;
    float _2923 = _2895;
    if (!_2915)
    {
        _1717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2925 = _1717;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2915)
    {
        _2795 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2931 = _2795;
    float _2933 = _2931;
    float _2935 = _2931;
    if (!_2915)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2937 = _2917;
    float _2939 = _2937;
    float _2941 = _2937;
    if (!_2915)
    {
        _2919 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2943 = _2919;
    float _2945 = _2943;
    float _2947 = _2943;
    if (!_2915)
    {
        _2921 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2949 = _2921;
    float _2951 = _2949;
    float _2953 = _2949;
    if (!_2915)
    {
        _2923 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2955 = _2923;
    bool _2957 = !_2915;
    float _2959 = _2955;
    float _2961 = _2955;
    if (!_2957)
    {
        bool _2963 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2965 = isnan(_2079);
        bool _2967 = _2963 || _2965;
        bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2971 = _2967 || _2969;
        if (!_2971)
        {
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2975 = _2079 + _2973;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2979 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2977;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2985 = 1.0 / _2979;
            float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3003 = _2975 * _2985;
            float _3005 = precise::clamp(_3003, 0.0, 1.0);
            float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3011 = fma(_3005, _2983, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3013 = fma(_3005, _3009, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3015 = fma(_3005, _2989, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3017 = fma(_3005, _2993, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3019 = fma(_3005, _2997, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3021 = fma(_3005, _3001, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2935 = _3015;
            _2953 = _3019;
            _2929 = _3011;
            _2947 = _3017;
            _2941 = _3013;
            _2961 = _3021;
            _3023 = true;
        }
        else
        {
            bool _3025 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3027 = isnan(_2079);
            bool _3029 = _3025 || _3027;
            bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3033 = _3029 || _3031;
            if (!_3033)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3035 = _2927;
            _2929 = _3035;
            if (!_3033)
            {
                _2933 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3037 = _2933;
            _2935 = _3037;
            if (!_3033)
            {
                _2939 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3039 = _2939;
            _2941 = _3039;
            if (!_3033)
            {
                _2945 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3041 = _2945;
            _2947 = _3041;
            if (!_3033)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3043 = _2951;
            _2953 = _3043;
            if (!_3033)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3045 = _2959;
            bool _3047 = !_3033;
            _2961 = _3045;
            if (!_3047)
            {
                bool _3049 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3051 = isnan(_2079);
                bool _3053 = _3049 || _3051;
                bool _3055 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3057 = _3053 || _3055;
                if (!_3057)
                {
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3061 = _2079 + _3059;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3065 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3063;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3071 = 1.0 / _3065;
                    float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3089 = _3061 * _3071;
                    float _3091 = precise::clamp(_3089, 0.0, 1.0);
                    float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3097 = fma(_3091, _3069, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3099 = fma(_3091, _3095, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3101 = fma(_3091, _3075, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3103 = fma(_3091, _3079, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3105 = fma(_3091, _3083, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3107 = fma(_3091, _3087, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2935 = _3101;
                    _2953 = _3105;
                    _2929 = _3097;
                    _2947 = _3103;
                    _2941 = _3099;
                    _2961 = _3107;
                    _3023 = true;
                }
                else
                {
                    _2935 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2947 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2941 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3023 = false;
    float _3109 = _2935;
    float _3111 = _2953;
    float _3113 = _2929;
    float _3115 = _2947;
    float _3117 = _2941;
    float _3119 = _2961;
    float _3121 = fma(_1845, -0.5, 0.5);
    float _3123 = precise::clamp(_3121, 0.0, 1.0);
    float _3125 = -_3109;
    float _3127 = _3125 + _3111;
    float _3129 = -_3113;
    float _3131 = _3129 + _3115;
    float _3133 = -_3117;
    float _3135 = _3133 + _3119;
    bool _3137 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3139 = fma(_3123, _3127, _3109);
    float _3141 = fma(_3123, _3131, _3113);
    float _3143 = fma(_3123, _3135, _3117);
    float _3145 = _3139 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3147 = fma(_3141, 0.298911988735198974609375, _3145);
    float _3149 = fma(_3143, 0.114477999508380889892578125, _3147);
    out.m_91.x = 0.0;
    float _3151 = -_3149;
    float _3153 = _3141 + _3151;
    float _3155 = -_3149;
    float _3157 = _3139 + _3155;
    float _3159 = -_3149;
    float _3161 = _3143 + _3159;
    float _3163 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3165 = fma(_3153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3149);
    float _3167 = fma(_3157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3149);
    float _3169 = fma(_3161, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3149);
    out.m_87.w = _3163;
    out.m_93.x = _3165;
    out.m_93.y = _3167;
    out.m_93.z = _3169;
    if (!_3137)
    {
        return out;
    }
    float _3171 = -_1939;
    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3175 = -_1941;
    float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3179 = -_1943;
    float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3183 = _3173 * _3173;
    float _3185 = fma(_3177, _3177, _3183);
    float _3187 = fma(_3181, _3181, _3185);
    float _3189 = sqrt(_3187);
    float _3191 = rsqrt(_3187);
    float _3193 = -_3189;
    float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3197 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3199 = precise::clamp(_3197, 0.0, 1.0);
    float _3201 = _3177 * _3191;
    float _3203 = _3173 * _3191;
    float _3205 = abs(_3199);
    float _3207 = log2(_3205);
    float _3209 = _3181 * _3191;
    float _3211 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3213 = _1845 * _3203;
    float _3215 = -_3203;
    float _3217 = -_3211;
    float _3219 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3217);
    float _3221 = fma(_1847, _3201, _3213);
    float _3223 = -_3209;
    float _3225 = fma(_3223, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3219);
    float _3227 = fma(_1849, _3209, _3221);
    float _3229 = precise::clamp(_3227, 0.0, 1.0);
    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3233 = _3225 + _3231;
    float _3235 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3237 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3239 = precise::clamp(_3237, 0.0, 1.0);
    float _3241 = exp2(_3235);
    float _3243 = _3241 * _3239;
    float _3245 = _3229 * _3243;
    float _3247 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3249 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3251 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3247;
    out.m_91.y = _3249;
    out.m_91.z = _3251;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3023 = false;
    bool _1895 = false;
    bool _1187 = false;
    bool _999 = false;
    bool _565 = false;
    bool _317 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_60.w;
    float _115 = trunc(_113);
    int _117 = int(_115);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_63.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3308 = as_type<float>(_133);
        out.gl_Position.z = _3308;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_65.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    float _155 = _151;
    if (_147)
    {
        float _157 = float(_117);
        _153 = _157;
    }
    float _159 = _153;
    bool _161 = _151 >= _159;
    bool _163 = !_147;
    bool _165 = _161 || _163;
    if (_165)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _127;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    if (_165)
    {
        float _169 = _167 * 5.0;
        _135 = as_type<int>(_169);
    }
    int _171 = _135;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3377 = as_type<float>(_171);
        out.gl_Position.z = _3377;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = in.m_67.w;
    float _175 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _177 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _179 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _181 = _177 || _179;
    bool _183 = isnan(1.0);
    bool _185 = _181 || _183;
    float _187 = in.m_65.x;
    float _189 = in.m_65.y;
    float _191 = in.m_65.z;
    float _193 = in.m_60.x;
    float _195 = in.m_60.y;
    float _197 = in.m_60.z;
    float _199 = 0.0;
    float _201 = _175;
    if (!_185)
    {
        float _203 = _175 * _175;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _207;
    if (!_185)
    {
        float _211 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _211;
    }
    float _213 = _209;
    bool _215 = !_185;
    float _217 = _213;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _175 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _175);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_185;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _175 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _201 = _271;
    }
    float _273 = _201;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _187, _277);
    float _285 = fma(_273, _189, _279);
    float _287 = fma(_273, _191, _281);
    float _289 = fma(_283, _173, _193);
    float _291 = fma(_285, _173, _195);
    float _293 = fma(_287, _173, _197);
    bool _295 = !_275;
    float _297 = _293;
    float _315;
    if (!_295)
    {
        float _299 = in.m_69.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_117);
        float _321 = 1.0 / _319;
        float _323 = _151 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = 1.0 / _329;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _347 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_325);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = 1.0 / _333;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _363 = _341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _365 = _345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _369 = _325 + _367;
    out.m_71.w = _361;
    float _371 = 1.0 / _337;
    float _373 = _343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = _325 + _375;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    out.m_73.x = _363;
    out.m_73.y = _373;
    out.m_73.z = _365;
    float _381 = _377 * _339;
    float _383 = _369 * _359;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = _325 + _385;
    bool _389 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _391 = isnan(_325);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    bool _401 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _403 = isnan(_325);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _387 * _371;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _415;
    float _419 = -_357;
    float _421 = _419 + 1.0;
    bool _423 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _425 = isnan(_325);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _435;
    float _439 = fma(_417, _381, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _441 = _399 * _421;
    float _443 = -_399;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _459;
    float _463 = -_433;
    float _465 = _463 + 1.0;
    float _467 = _433 * _445;
    float _469 = fma(_437, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _471 = fma(_461, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _473 = fma(_449, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _475 = fma(_453, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _477 = fma(_457, _383, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _479 = _411 * _465;
    float _481 = in.m_67.x;
    float _483 = in.m_67.y;
    float _485 = in.m_67.z;
    float _487 = -_411;
    float _489 = _487 + 1.0;
    float _491 = _469 * _479;
    float _493 = _471 * _479;
    float _495 = _439 * _479;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _503 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _493);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _509;
    float _513 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].z, _495);
    float _515 = fma(_499, _413, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _517 = fma(_507, _413, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = fma(_511, _413, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _521 = fma(_477, _467, _513);
    float _523 = fma(_475, _467, _503);
    float _525 = fma(_473, _467, _501);
    float _527 = fma(_519, _441, _521);
    float _529 = fma(_517, _441, _523);
    float _531 = fma(_515, _441, _525);
    float _533 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].z, _527);
    float _535 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].y, _529);
    float _537 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[146].x, _531);
    float _539 = _533 * _485;
    float _541 = _535 * _483;
    float _543 = _537 * _481;
    bool _545 = !_379;
    float _563;
    if (!_545)
    {
        float _547 = in.m_69.x;
        float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[14].x, _151);
        float _555 = _553 * _549;
        float _557 = floor(_555);
        float _559 = -_557;
        float _561 = _555 + _559;
        _563 = _561;
        _565 = true;
    }
    else
    {
        float _567 = float(_117);
        float _569 = 1.0 / _567;
        float _571 = _151 * _569;
        _563 = _571;
    }
    _565 = false;
    float _573 = _563;
    int _575 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _577 = _575;
    int _579 = 0;
    int _581 = _108(_577, _579, (*spvDescriptorSet0.support_buffer));
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _595 = 1.0 / _585;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _601 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _603 = isnan(_573);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = 1.0 / _589;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _623 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _625 = isnan(_573);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = 1.0 / _593;
    float _637 = _617 * _595;
    bool _639 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _641 = isnan(_573);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _653 = _573 + _651;
    float _655 = fma(_637, _653, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _657 = 1.0 / _599;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _671 = _665 * _613;
    float _673 = _669 * _635;
    float _675 = _621 * _657;
    bool _677 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _679 = isnan(_573);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_649;
    float _691 = _689 + 1.0;
    bool _693 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _695 = isnan(_573);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _709 = -_687;
    float _711 = _709 + 1.0;
    float _713 = _687 * _691;
    float _715 = -_703;
    float _717 = _715 + 1.0;
    float _719 = 1.0 / _707;
    float _721 = _703 * _711;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _727 = _611 * _717;
    float _729 = -_611;
    float _731 = _729 + 1.0;
    float _733 = -_633;
    float _735 = _733 + 1.0;
    bool _737 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _739 = isnan(_573);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = _633 * _731;
    float _751 = 1.0 / _725;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _757 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _759 = isnan(_573);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -_747;
    float _771 = _769 + 1.0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _773;
    float _777 = _747 * _735;
    float _779 = _767 * _771;
    float _781 = 1.0 / _755;
    float _783 = _775 * _719;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _787 = _573 + _785;
    float _789 = _655 * _779;
    float _791 = -_767;
    float _793 = _791 + 1.0;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _797 = _573 + _795;
    float _799 = fma(_675, _787, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _801 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[159].x, _789);
    float _803 = _661 * _751;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _811 = _573 + _809;
    float _813 = fma(_671, _797, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _815 = fma(_799, _777, _801);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _819 = _573 + _817;
    float _821 = fma(_673, _811, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _823 = _807 * _781;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _827 = _573 + _825;
    float _829 = fma(_813, _749, _815);
    bool _831 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _833 = isnan(_573);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = in.m_75.z;
    float _845 = fma(_783, _827, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _847 = fma(_821, _727, _829);
    float _849 = fma(_803, _819, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _851 = -_841;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _857 = _573 + _855;
    float _859 = fma(_845, _721, _847);
    float _861 = _649 * _853;
    float _863 = fma(_823, _857, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _865 = fma(_849, _713, _859);
    float _867 = fma(_863, _861, _865);
    float _869 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[166].x, _867);
    float _871 = precise::clamp(_869, 0.0, 1.0);
    float _873 = trunc(_843);
    int _875 = int(_873);
    int _877 = _581 + (-1);
    float _879 = float(_877);
    float _881 = _871 * _879;
    float _883 = trunc(_881);
    int _885 = int(_883);
    int _887 = _885;
    int _889 = 0;
    int _891 = _109(_887, _889, (*spvDescriptorSet0.support_buffer));
    int _893 = _875;
    int _895 = 0;
    int _897 = _109(_893, _895, (*spvDescriptorSet0.support_buffer));
    float4 _900 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_891, _897)), 0).xyzw;
    float _902 = _900.x;
    float _904 = _900.y;
    float _906 = _900.z;
    float _908 = _900.w;
    int _910 = _885 + 1;
    int _912 = min(_877, _910);
    uint _915 = as_type<uint>(half2(float2(_908, 0.0)));
    uint _917 = extract_bits(_915, 0u, 8u);
    int _919 = int(_917) & 255;
    uint _921 = extract_bits(_915, 8u, 8u);
    int _923 = int(_921) & 255;
    int _925 = _923 << 8;
    int _927 = _919 | _925;
    bool _929 = _927 >= 32768;
    int _931 = _927 + (-1024);
    int _933 = _931;
    if (_929)
    {
        int _935 = ~_927;
        int _937 = _935 + 33792;
        int _939 = _937 + 1;
        _933 = _939;
    }
    int _941 = _933;
    int _943 = _941 + 30719;
    float _945 = float(_943);
    float _947 = fma(_945, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _949 = abs(_947);
    float _951 = -_949;
    float _953 = _951 + 1.0;
    float _955 = abs(_947);
    float _957 = fma(_955, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _959 = _947 < 0.0;
    float _961 = float(_959);
    int _963 = as_type<int>(_953) + (-218103808);
    float _965 = abs(_947);
    float _967 = fma(_965, _957, -0.212114393711090087890625);
    bool _969 = uint(_963) >= 1920991232u;
    float _971 = abs(_947);
    float _973 = fma(_971, _967, 1.570728778839111328125);
    bool _975 = !_969;
    float _997;
    if (!_975)
    {
        int _977 = as_type<int>(_953);
        int _979 = as_type<int>(_727);
        int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[166].x);
        int _983 = 4544;
        int _985;
        int _987;
        int _989;
        int _991;
        int _993;
        int _995;
        _106(_977, _979, _981, _983, _985, _987, _989, _991, _993, _995, out.gl_Position, out.gl_PointSize);
        _997 = as_type<float>(_991);
        _999 = true;
    }
    else
    {
        float _1001 = rsqrt(_953);
        float _1003 = _953 * _1001;
        float _1005 = _1001 * 0.5;
        float _1007 = -_1003;
        float _1009 = 0.0 + _1007;
        float _1011 = fma(_1005, _1009, 0.5);
        float _1013 = fma(_1003, _1011, _1003);
        float _1015 = -_1013;
        float _1017 = 0.0 + _1015;
        float _1019 = fma(_1013, _1017, _953);
        float _1021 = fma(_1005, _1019, _1013);
        _997 = _1021;
    }
    _999 = false;
    float _1023 = _997;
    int _1025 = _912;
    int _1027 = 0;
    int _1029 = _109(_1025, _1027, (*spvDescriptorSet0.support_buffer));
    int _1031 = _875;
    int _1033 = 0;
    int _1035 = _109(_1031, _1033, (*spvDescriptorSet0.support_buffer));
    float4 _1037 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1029, _1035)), 0).xyzw;
    float _1039 = _1037.x;
    float _1041 = _1037.y;
    float _1043 = _1037.z;
    float _1045 = _1037.w;
    float _1047 = _973 * _1023;
    float _1049 = _961 * 2.0;
    float _1051 = _945 * 3.883221149444580078125;
    float _1053 = floor(_881);
    float _1055 = -_1049;
    float _1057 = fma(_1047, _1055, _1047);
    float _1059 = _1051 * 0.15915493667125701904296875;
    float _1061 = fma(_961, 3.1415927410125732421875, _1057);
    float _1063 = _1059 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1061 * 0.15915493667125701904296875;
    float _1069 = _1067 * 6.283185482025146484375;
    float _1071 = sin(_1069);
    float _1073 = -_1053;
    float _1075 = _881 + _1073;
    float _1077 = _1059 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1071 * _1065;
    float _1083 = _1071 * _1079;
    uint _1085 = as_type<uint>(half2(float2(_1045, 0.0)));
    float _1087 = -_902;
    float _1089 = _1087 + _1039;
    float _1091 = -_906;
    float _1093 = _1091 + _1043;
    uint _1095 = extract_bits(_1085, 0u, 8u);
    int _1097 = int(_1095) & 255;
    uint _1099 = extract_bits(_1085, 8u, 8u);
    int _1101 = int(_1099) & 255;
    int _1103 = _1101 << 8;
    int _1105 = _1097 | _1103;
    float _1107 = fma(_1075, _1089, _902);
    float _1109 = fma(_1075, _1093, _906);
    bool _1111 = _1105 >= 32768;
    int _1113 = _1105 + (-1024);
    int _1115 = _1113;
    if (_1111)
    {
        int _1117 = ~_1105;
        int _1119 = _1117 + 33792;
        int _1121 = _1119 + 1;
        _1115 = _1121;
    }
    int _1123 = _1115;
    int _1125 = _1123 + 30719;
    float _1127 = float(_1125);
    float _1129 = fma(_1127, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1131 = abs(_1129);
    float _1133 = -_1131;
    float _1135 = _1133 + 1.0;
    float _1137 = abs(_1129);
    float _1139 = fma(_1137, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _1141 = -_904;
    float _1143 = _1141 + _1041;
    int _1145 = as_type<int>(_1135) + (-218103808);
    float _1147 = abs(_1129);
    float _1149 = fma(_1147, _1139, -0.212114393711090087890625);
    float _1151 = fma(_1075, _1143, _904);
    bool _1153 = _1129 < 0.0;
    float _1155 = float(_1153);
    bool _1157 = uint(_1145) >= 1920991232u;
    float _1159 = abs(_1129);
    float _1161 = fma(_1159, _1149, 1.570728778839111328125);
    bool _1163 = !_1157;
    float _1185;
    if (!_1163)
    {
        int _1165 = as_type<int>(_1135);
        int _1167 = as_type<int>(_1047);
        int _1169 = as_type<int>(_1135);
        int _1171 = 5440;
        int _1173;
        int _1175;
        int _1177;
        int _1179;
        int _1181;
        int _1183;
        _106(_1165, _1167, _1169, _1171, _1173, _1175, _1177, _1179, _1181, _1183, out.gl_Position, out.gl_PointSize);
        _1185 = as_type<float>(_1179);
        _1187 = true;
    }
    else
    {
        float _1189 = rsqrt(_1135);
        float _1191 = _1135 * _1189;
        float _1193 = _1189 * 0.5;
        float _1195 = -_1191;
        float _1197 = 0.0 + _1195;
        float _1199 = fma(_1193, _1197, 0.5);
        float _1201 = fma(_1191, _1199, _1191);
        float _1203 = -_1201;
        float _1205 = 0.0 + _1203;
        float _1207 = fma(_1201, _1205, _1135);
        float _1209 = fma(_1193, _1207, _1201);
        _1185 = _1209;
    }
    _1187 = false;
    float _1211 = _1185;
    float _1213 = in.m_69.x;
    float _1215 = in.m_69.y;
    float _1217 = in.m_69.z;
    float _1219 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1221 = log2(_1219);
    float _1223 = _541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1225 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1229 = _1227 != 0;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1233 = _1231 != 0;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1237 = _1235 != 0;
    float _1239 = _1161 * _1211;
    float _1241 = _543 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1243 = _1127 * 3.883221149444580078125;
    float _1245 = -_947;
    float _1247 = _1245 + _1129;
    float _1249 = fma(_1075, _1247, _947);
    float _1251 = _1217 * 2.0;
    float _1253 = _1213 * 2.0;
    float _1255 = _1215 + _1217;
    float _1257 = _1215 + _1213;
    float _1259 = _1215 * 2.0;
    float _1261 = floor(_1253);
    float _1263 = _1255 + (-1.0);
    float _1265 = _1257 + (-1.0);
    float _1267 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1269 = floor(_1251);
    float _1271 = fma(_1263, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1273 = _1221 * _151;
    bool _1275 = !_1229;
    int _1277 = _1275 ? 0 : 1;
    int _1279 = abs(_1277);
    float _1281 = exp2(_1273);
    bool _1283 = _1261 >= 0.0;
    bool _1285 = isnan(_1261);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    int _1293 = _1291 ? 0 : 1;
    bool _1295 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1297 = isnan(0.0);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1303 = _1299 || _1301;
    float _1305 = floor(_1259);
    bool _1307 = _1269 > 0.0;
    bool _1309 = _1269 >= 0.0;
    bool _1311 = isnan(_1269);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.0);
    bool _1317 = _1313 || _1315;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = -_1281;
    float _1323 = _1321 + 1.0;
    bool _1325 = _1261 > 0.0;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1329 = 1.0 + _1327;
    int _1331 = ~_1319;
    int _1333 = _1331 + 1;
    int _1335 = _1333 + 1;
    bool _1337 = !_1233;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = 1.0 / _1329;
    int _1343 = _1335;
    float _1345 = _1249;
    if (!_1307)
    {
        int _1347 = ~_1319;
        int _1349 = _1347 + 1;
        _1343 = _1349;
    }
    int _1351 = _1343;
    float _1353 = in.m_77.x;
    float _1355 = in.m_77.y;
    float _1357 = in.m_77.z;
    bool _1359 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1361 = isnan(1.0);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1367 = _1363 || _1365;
    float _1369 = float(_1351);
    float _1371 = _1303 ? _1323 : 0.0;
    int _1373 = abs(_1339);
    float _1375 = float(_1279);
    int _1377 = ~_1293;
    int _1379 = _1377 + 1;
    int _1381 = _1379 + 1;
    int _1383 = _1381;
    if (!_1325)
    {
        int _1385 = ~_1293;
        int _1387 = _1385 + 1;
        _1383 = _1387;
    }
    int _1389 = _1383;
    float _1391 = _1375 * _1369;
    bool _1393 = _1305 > 0.0;
    if (_1367)
    {
        float _1395 = _1371 * _1341;
        _155 = _1395;
    }
    float _1397 = _155;
    float _1399 = float(_1373);
    float _1401 = _1391 * (-2.0);
    float _1403 = float(_1389);
    float _1405 = _1213 + (-0.5);
    bool _1407 = _1305 >= 0.0;
    bool _1409 = isnan(_1305);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan(0.0);
    bool _1415 = _1411 || _1413;
    float _1417 = _1217 + _1213;
    float _1419 = _1217 + (-0.5);
    float _1421 = fma(_1401, _1353, _1353);
    bool _1423 = !_1237;
    int _1425 = _1423 ? 0 : 1;
    float _1427 = _1399 * _1403;
    int _1429 = _1415 ? 0 : 1;
    float _1431 = fma(_1267, _1401, _1267);
    float _1433 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1421);
    int _1435 = abs(_1425);
    float _1437 = _1427 * (-2.0);
    int _1439 = ~_1429;
    int _1441 = _1439 + 1;
    int _1443 = _1441 + 1;
    float _1445 = fma(_1431, _1397, _1433);
    int _1447 = _1443;
    if (!_1393)
    {
        int _1449 = ~_1429;
        int _1451 = _1449 + 1;
        _1447 = _1451;
    }
    int _1453 = _1447;
    float _1455 = fma(_1437, _1355, _1355);
    float _1457 = fma(_1271, _1437, _1271);
    float _1459 = _1215 + (-0.5);
    float _1461 = float(_1453);
    float _1463 = _1417 + (-1.0);
    float _1465 = float(_1435);
    float _1467 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1455);
    float _1469 = _1445 * 0.15915493667125701904296875;
    bool _1471 = _1151 != 0.0;
    bool _1473 = isnan(_1151);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    float _1481 = _1465 * _1461;
    float _1483 = fma(_1457, _1397, _1467);
    float _1485 = _1469 * 6.283185482025146484375;
    float _1487 = sin(_1485);
    float _1489 = _1481 * (-2.0);
    float _1491 = _1483 * 0.15915493667125701904296875;
    bool _1493 = _1107 == 0.0;
    bool _1495 = !_1479;
    bool _1497 = _1493 && _1495;
    float _1499 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1501 = fma(_1489, _1357, _1357);
    bool _1503 = _1109 == 0.0;
    bool _1505 = _1503 && _1497;
    float _1507 = fma(_1499, _1489, _1499);
    float _1509 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1501);
    float _1511 = _1469 * 6.283185482025146484375;
    float _1513 = cos(_1511);
    float _1515 = _1155 * 2.0;
    float _1517 = fma(_1507, _1397, _1509);
    float _1519 = -_1515;
    float _1521 = fma(_1239, _1519, _1239);
    float _1523 = _1517 * 0.15915493667125701904296875;
    float _1525 = _1491 * 6.283185482025146484375;
    float _1527 = sin(_1525);
    float _1529 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1109);
    float _1531 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1107);
    float _1533 = fma(_1155, 3.1415927410125732421875, _1521);
    if (!_1505)
    {
        float _1535 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1249);
        _1345 = _1535;
    }
    float _1537 = _1345;
    float _1539 = _1531 * _1241;
    float _1541 = _1491 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    float _1545 = _1523 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1551 = _1487 * _1527;
    float _1553 = _1549 * _1223;
    float _1555 = _1529 * _1225;
    float _1557 = _1513 * _1527;
    float _1559 = _1523 * 6.283185482025146484375;
    float _1561 = sin(_1559);
    float _1563 = _1513 * _1543;
    float _1565 = _1487 * _1543;
    float _1567 = _1487 * _1547;
    float _1569 = _1513 * _1547;
    float _1571 = _1543 * _1547;
    float _1573 = _1527 * _1547;
    float _1575 = _1567 * _1553;
    float _1577 = _1569 * _1553;
    float _1579 = _1243 * 0.15915493667125701904296875;
    float _1581 = fma(_1561, _1563, _1551);
    float _1583 = fma(_1561, _1551, _1563);
    float _1585 = -_1557;
    float _1587 = fma(_1561, _1565, _1585);
    float _1589 = -_1565;
    float _1591 = fma(_1561, _1557, _1589);
    float _1593 = -_1553;
    float _1595 = _1561 * _1593;
    float _1597 = _291 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1599 = fma(_1581, _1539, _1577);
    float _1601 = fma(_1587, _1539, _1575);
    float _1603 = fma(_1571, _1539, _1595);
    float _1605 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1597);
    float _1607 = _291 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1609 = fma(_1583, _1555, _1601);
    float _1611 = fma(_1573, _1555, _1603);
    float _1613 = fma(_1591, _1555, _1599);
    float _1615 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1607);
    float _1617 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1605);
    float _1619 = _1579 * 6.283185482025146484375;
    float _1621 = cos(_1619);
    float _1623 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1625 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1627 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1615);
    float _1629 = _1617 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1631 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1623);
    float _1633 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1625);
    float _1635 = _1627 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1637 = _291 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1639 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1631);
    float _1641 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1633);
    float _1643 = _1533 * 0.15915493667125701904296875;
    float _1645 = _1579 * 6.283185482025146484375;
    float _1647 = sin(_1645);
    float _1649 = _1629 + _1639;
    float _1651 = _1635 + _1641;
    float _1653 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1637);
    float _1655 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1659 = _1649 + _1657;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1663 = _1651 + _1661;
    float _1665 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1653);
    float _1667 = _1643 * 6.283185482025146484375;
    float _1669 = sin(_1667);
    float _1671 = _1659 * _1659;
    float _1673 = _1663 * _1663;
    float _1675 = fma(_1611, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1655);
    float _1677 = -_1537;
    float _1679 = _1561 * _1677;
    float _1681 = _1569 * _1537;
    float _1683 = _1671 + _1673;
    float _1685 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1675);
    float _1687 = _1567 * _1537;
    float _1689 = sqrt(_1683);
    float _1691 = -_1081;
    float _1693 = fma(_1669, _1621, _1691);
    float _1695 = -_1083;
    float _1697 = fma(_1669, _1647, _1695);
    float _1699 = fma(_1075, _1693, _1081);
    float _1701 = fma(_1075, _1697, _1083);
    float _1703 = _1665 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1705 = _1699;
    float _1707 = _1701;
    float _1709 = _1569;
    float _1711 = _1665;
    float _1713 = _1561;
    float _1715 = _1637;
    float _1717 = _1629;
    if (!_1505)
    {
        float _1719 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1699);
        _1705 = _1719;
    }
    float _1721 = _1705;
    if (!_1505)
    {
        float _1723 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1701);
        _1707 = _1723;
    }
    float _1725 = _1707;
    bool _1727 = _1689 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1729 = _1703 + _1685;
    float _1731 = _1725;
    if (!_1727)
    {
        _1709 = _1673;
    }
    float _1733 = _1709;
    float _1735 = _1733;
    if (!_1727)
    {
        _297 = _1671;
    }
    float _1737 = _297;
    float _1739 = _1737;
    if (!_1727)
    {
        _1711 = _1649;
    }
    float _1741 = _1711;
    float _1743 = _1741;
    if (!_1727)
    {
        _1713 = _1651;
    }
    float _1745 = _1713;
    float _1747 = _1745;
    if (!_1727)
    {
        _1715 = _1729;
    }
    float _1749 = _1715;
    bool _1751 = !_1727;
    float _1753 = _1749;
    if (!_1751)
    {
        float _1755 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1757 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1759 = _1689 + _1757;
        float _1761 = rsqrt(_1683);
        float _1763 = _1759 * _1755;
        float _1765 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1767 = _1763 * 0.15915493667125701904296875;
        float _1769 = _1767 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1767 * 6.283185482025146484375;
        float _1775 = cos(_1773);
        float _1777 = fma(_1771, _1765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1779 = _1761 * _1777;
        float _1781 = _1775 + (-1.0);
        float _1783 = _1659 * _1779;
        float _1785 = _1663 * _1779;
        float _1787 = _1781 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1791 = _1785 * _1785;
        float _1793 = fma(_1729, _1775, _1787);
        float _1795 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1797 = _1783 * _1783;
        _1753 = _1793;
        _1739 = _1797;
        _1735 = _1791;
        _1743 = _1795;
        _1747 = _1789;
    }
    float _1799 = _1753;
    float _1801 = _1739;
    float _1803 = _1735;
    float _1805 = _1743;
    float _1807 = _1747;
    float _1809 = in.m_79.x;
    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1813 = _1799 + _1811;
    float _1815 = fma(_1581, _1721, _1681);
    float _1817 = fma(_1571, _1721, _1679);
    float _1819 = fma(_1587, _1721, _1687);
    float _1821 = fma(_1813, _1813, _1801);
    float _1823 = fma(_1591, _1725, _1815);
    float _1825 = fma(_1573, _1725, _1817);
    float _1827 = fma(_1583, _1725, _1819);
    float _1829 = _1821 + _1803;
    float _1831 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1833 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1837 = sqrt(_1829);
    float _1839 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1831);
    float _1841 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1833);
    float _1843 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1835);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1839);
    float _1847 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1841);
    float _1849 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1843);
    out.m_81.x = _1809;
    out.m_83.x = _1847;
    out.m_83.y = _1845;
    out.m_83.z = _1849;
    bool _1851 = _1837 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1853 = isnan(_1837);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1859 = _1855 || _1857;
    if (!_1859)
    {
        _1731 = 1.0;
    }
    float _1861 = _1731;
    bool _1863 = !_1859;
    float _1865 = _1861;
    if (!_1863)
    {
        bool _1867 = _1837 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1869 = isnan(_1837);
        bool _1871 = _1867 || _1869;
        bool _1873 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1875 = _1871 || _1873;
        if (!_1875)
        {
            float _1877 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1879 = _1837 + _1877;
            float _1881 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1883 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1881;
            float _1885 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1887 = _1885 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1889 = 1.0 / _1883;
            float _1891 = _1879 * _1889;
            float _1893 = fma(_1891, _1887, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1865 = _1893;
            _1895 = true;
        }
        else
        {
            bool _1897 = _1837 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1899 = isnan(_1837);
            bool _1901 = _1897 || _1899;
            bool _1903 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1905 = _1901 || _1903;
            if (!_1905)
            {
                float _1907 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1909 = _1837 + _1907;
                float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1913 = _1911 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1915 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1917 = _1915 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1919 = 1.0 / _1913;
                float _1921 = _1909 * _1919;
                float _1923 = fma(_1921, _1917, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1865 = _1923;
                _1895 = true;
            }
            else
            {
                _1865 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1895 = false;
    float _1925 = _1865;
    float _1927 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1929 = _1799 + _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1933 = _1805 + _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1937 = _1807 + _1935;
    float _1939 = fma(_1929, _1925, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1941 = fma(_1933, _1925, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1943 = fma(_1937, _1925, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1945 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1949 = _1939 + _1947;
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1953 = _1941 + _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1957 = _1943 + _1955;
    float _1959 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1945);
    float _1961 = _1949 * _1949;
    float _1963 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1959);
    float _1965 = fma(_1953, _1953, _1961);
    float _1967 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1969 = _1963 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1971 = fma(_1957, _1957, _1965);
    float _1973 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1967);
    float _1975 = 1.0 / _1969;
    float _1977 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1979 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1973);
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1983 = rsqrt(_1971);
    float _1985 = _1981 + _1969;
    float _1987 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1989 = _1703 + _1987;
    float _1991 = _1985 * _1975;
    float _1993 = _1991 * 0.5;
    float _1995 = floor(_1977);
    float _1997 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1999 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2001 = fma(_1993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1999);
    float _2003 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2005 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1997);
    float _2007 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2009 = fma(_1629, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2003);
    float _2011 = 1.0 / _2001;
    float _2013 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2005);
    float _2015 = _1953 * _2007;
    float _2017 = _1957 * _2007;
    float _2019 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2009);
    float _2021 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2023 = _2015 * _2015;
    float _2025 = _2017 * _2017;
    float _2027 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2029 = trunc(_2021);
    int _2031 = int(_2029);
    float _2033 = -_1995;
    float _2035 = _1977 + _2033;
    float _2037 = _2023 + _2025;
    float _2039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2041 = _2011 * _2039;
    float _2043 = sqrt(_2037);
    bool _2045 = _2041 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2047 = _2041 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2049 = trunc(_2027);
    int _2051 = int(_2049);
    int _2053 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2055 = _2031 + _2053;
    int _2057 = _2055 + 1;
    bool _2059 = _2043 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2063 = _2043 + _2061;
    int _2065 = 2;
    float _2067 = _2037;
    float _2069 = _2063;
    float _2071 = _2007;
    float _2073 = _2015;
    float _2075 = _2023;
    if (!_2045)
    {
        _2065 = 1;
    }
    int _2077 = _2065;
    float _2079 = sqrt(_1971);
    int _2081 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2083 = _2051 + _2081;
    int _2085 = _2083 + 1;
    float _2087 = _1987;
    int _2089 = _2077;
    if (_2059)
    {
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2087 = _2091;
    }
    float _2093 = _2087;
    if (_2059)
    {
        float _2095 = rsqrt(_2037);
        _2067 = _2095;
    }
    float _2097 = _2067;
    float _2099 = _2097;
    if (_2059)
    {
        float _2101 = _2063 * _2093;
        _2069 = _2101;
    }
    float _2103 = _2069;
    float _2105 = 0.0;
    if (_2059)
    {
        float _2107 = _2103 * 0.15915493667125701904296875;
        _2105 = _2107;
    }
    float _2109 = _2105;
    bool _2111 = !_2045;
    int _2113 = _2111 ? 0 : 1;
    float _2115 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2117 = _2013;
    if (_2059)
    {
        float _2119 = _2109 * 6.283185482025146484375;
        float _2121 = sin(_2119);
        _2117 = _2121;
    }
    float _2123 = _2117;
    if (!_2047)
    {
        _2089 = _2113;
    }
    int _2125 = _2089;
    float _2127 = precise::max(0.0, _2115);
    int _2129 = _2125 << 6;
    bool _2131 = _2057 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2133 = -_2007;
    float _2135 = -_2127;
    float _2137 = fma(_1949, _2133, _2135);
    int _2139 = _2129 + 96;
    uint _2141 = uint(int(uint(_2139) >> uint(2)));
    uint _2143 = uint(int(uint(int(_2141)) >> uint(2)));
    int _2145 = int(_2141) & 3;
    float _2147 = (*spvDescriptorSet0.vp_c15)._m0[int(_2143)][_2145];
    int _2149 = int(_2141) + 1;
    uint _2151 = uint(int(uint(_2149) >> uint(2)));
    int _2153 = _2149 & 3;
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[int(_2151)][_2153];
    int _2157 = _2057 | _2085;
    float _2159 = _2109;
    float _2161 = as_type<float>(_2157);
    float _2163 = _2137;
    if (_2059)
    {
        float _2165 = _2109 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        _2159 = _2167;
    }
    float _2169 = _2159;
    if (_2059)
    {
        float _2171 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2071 = _2171;
    }
    float _2173 = _2071;
    bool _2175 = _2157 < 0;
    bool _2177 = _2175 || _2131;
    if (_2059)
    {
        float _2179 = fma(_2123, _2173, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2161 = _2179;
    }
    float _2181 = _2161;
    int _2183 = _2129 + 48;
    uint _2185 = uint(int(uint(_2183) >> uint(2)));
    uint _2187 = uint(int(uint(int(_2185)) >> uint(2)));
    int _2189 = int(_2185) & 3;
    float _2191 = (*spvDescriptorSet0.vp_c15)._m0[int(_2187)][_2189];
    int _2193 = int(_2185) + 1;
    uint _2195 = uint(int(uint(_2193) >> uint(2)));
    int _2197 = _2193 & 3;
    float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
    float _2201 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2203 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2205 = 0.0;
    if (_2059)
    {
        float _2207 = _2097 * _2181;
        _2205 = _2207;
    }
    float _2209 = _2205;
    bool _2211 = _2085 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2213 = _2211 || _2177;
    float _2215 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2201);
    float _2217 = floor(_2203);
    if (_2059)
    {
        float _2219 = _2015 * _2209;
        _2073 = _2219;
    }
    float _2221 = _2073;
    int _2223 = _2129 + 104;
    uint _2225 = uint(int(uint(_2223) >> uint(2)));
    uint _2227 = uint(int(uint(int(_2225)) >> uint(2)));
    int _2229 = int(_2225) & 3;
    float _2231 = (*spvDescriptorSet0.vp_c15)._m0[int(_2227)][_2229];
    int _2233 = int(_2225) + 1;
    uint _2235 = uint(int(uint(_2233) >> uint(2)));
    int _2237 = _2233 & 3;
    float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
    float _2241 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2215);
    float _2243 = _2241;
    if (_2059)
    {
        float _2245 = _2169 + (-1.0);
        _2099 = _2245;
    }
    float _2247 = _2099;
    float _2249 = _2247;
    if (_2059)
    {
        float _2251 = _2221 * _2221;
        _2075 = _2251;
    }
    float _2253 = _2075;
    float _2255 = 0.0;
    if (_2059)
    {
        float _2257 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2257;
    }
    float _2259 = _2255;
    if (!_2059)
    {
        _2249 = _2017;
    }
    float _2261 = _2249;
    int _2263 = _2129 + 64;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    uint _2267 = uint(int(uint(int(_2265)) >> uint(2)));
    int _2269 = int(_2265) & 3;
    float _2271 = (*spvDescriptorSet0.vp_c15)._m0[int(_2267)][_2269];
    int _2273 = int(_2265) + 1;
    uint _2275 = uint(int(uint(_2273) >> uint(2)));
    int _2277 = _2273 & 3;
    float _2279 = (*spvDescriptorSet0.vp_c15)._m0[int(_2275)][_2277];
    float _2281 = _2261;
    if (_2059)
    {
        float _2283 = _2017 * _2209;
        _2281 = _2283;
    }
    float _2285 = _2281;
    if (_2059)
    {
        float _2287 = fma(_2137, _2169, _2259);
        _2163 = _2287;
    }
    float _2289 = _2163;
    float _2291 = _2241 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2059)
    {
        _2243 = _2025;
    }
    float _2293 = _2243;
    float _2295 = _2293;
    if (_2059)
    {
        float _2297 = _2285 * _2285;
        _2295 = _2297;
    }
    float _2299 = _2295;
    float _2301 = fma(_2289, _2289, _2253);
    float _2303 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _2305 = _2129 + 80;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
    int _2311 = int(_2307) & 3;
    float _2313 = (*spvDescriptorSet0.vp_c15)._m0[int(_2309)][_2311];
    int _2315 = int(_2307) + 1;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    int _2319 = _2315 & 3;
    float _2321 = (*spvDescriptorSet0.vp_c15)._m0[int(_2317)][_2319];
    float _2323 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2325 = _2301 + _2299;
    float _2327 = 0.0;
    int _2329 = as_type<int>(_2323);
    if (!_2213)
    {
        float _2331 = floor(_2027);
        _2327 = _2331;
    }
    float _2333 = _2327;
    float _2335 = -_2323;
    float _2337 = fma(_2335, _2303, 1.0);
    if (!_2213)
    {
        int _2339 = _2085 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2341 = _2339 + _2057;
        _2329 = _2341;
    }
    int _2343 = _2329;
    float _2345 = -_2217;
    float _2347 = _2203 + _2345;
    int _2349 = _2129 + 56;
    uint _2351 = uint(int(uint(_2349) >> uint(2)));
    uint _2353 = uint(int(uint(int(_2351)) >> uint(2)));
    int _2355 = int(_2351) & 3;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[int(_2353)][_2355];
    int _2359 = int(_2351) + 1;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    int _2363 = _2359 & 3;
    float _2365 = (*spvDescriptorSet0.vp_c15)._m0[int(_2361)][_2363];
    float _2367 = log2(_2337);
    int _2369 = _2129 + 88;
    uint _2371 = uint(int(uint(_2369) >> uint(2)));
    uint _2373 = uint(int(uint(int(_2371)) >> uint(2)));
    int _2375 = int(_2371) & 3;
    float _2377 = (*spvDescriptorSet0.vp_c15)._m0[int(_2373)][_2375];
    int _2379 = int(_2371) + 1;
    uint _2381 = uint(int(uint(_2379) >> uint(2)));
    int _2383 = _2379 & 3;
    float _2385 = (*spvDescriptorSet0.vp_c15)._m0[int(_2381)][_2383];
    float _2387 = _1989 * _2155;
    float _2389 = fma(_1629, _2147, _2387);
    int _2391 = _2129 + 72;
    uint _2393 = uint(int(uint(_2391) >> uint(2)));
    uint _2395 = uint(int(uint(int(_2393)) >> uint(2)));
    int _2397 = int(_2393) & 3;
    float _2399 = (*spvDescriptorSet0.vp_c15)._m0[int(_2395)][_2397];
    int _2401 = int(_2393) + 1;
    uint _2403 = uint(int(uint(_2401) >> uint(2)));
    int _2405 = _2401 & 3;
    float _2407 = (*spvDescriptorSet0.vp_c15)._m0[int(_2403)][_2405];
    float _2409 = _1989 * _2199;
    float _2411 = rsqrt(_2325);
    float _2413 = fma(_1629, _2191, _2409);
    int _2415 = as_type<int>(_2409);
    int _2417 = as_type<int>(_2147);
    if (!_2213)
    {
        int _2419 = _2343 << 2;
        _2415 = _2419;
    }
    int _2421 = _2415;
    float _2423 = fma(_1635, _2231, _2389);
    int _2425 = _2421;
    if (!_2213)
    {
        int _2427 = 12 & _2421;
        _2425 = _2427;
    }
    int _2429 = _2425;
    float _2431 = _2423 + _2239;
    float _2433 = _1989 * _2279;
    float _2435 = _2279;
    int _2437 = as_type<int>(_2321);
    if (!_2213)
    {
        float _2439 = -_2333;
        float _2441 = _2027 + _2439;
        _2435 = _2441;
    }
    float _2443 = _2435;
    float _2445 = 1.0 / _2431;
    float _2447 = _2411 * _2221;
    float _2449 = fma(_1629, _2271, _2433);
    float _2451 = _2411 * _2289;
    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2455 = fma(_2079, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2453);
    float _2457 = precise::clamp(_2455, 0.0, 1.0);
    float _2459 = _2447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2461 = _1989 * _2321;
    float _2463 = _2411 * _2285;
    if (!_2213)
    {
        uint _2465 = uint(int(uint(_2343) >> uint(2)));
        _2437 = int(_2465);
    }
    int _2467 = _2437;
    float _2469 = fma(_1629, _2313, _2461);
    float _2471 = -_2457;
    float _2473 = _2471 + 1.0;
    float _2475 = as_type<float>(_2467);
    if (!_2213)
    {
        int _2477 = _2467 << 4;
        int _2479 = _2477 + _2429;
        _2417 = _2479;
    }
    int _2481 = _2417;
    float _2483 = fma(_1635, _2357, _2413);
    if (!_2213)
    {
        float _2485 = floor(_2021);
        _2475 = _2485;
    }
    float _2487 = _2475;
    float _2489 = _2483 + _2365;
    float _2491 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2493 = fma(_1635, _2377, _2469);
    float _2495 = -_2459;
    float _2497 = fma(_2451, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2495);
    float _2499 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2501 = abs(_2473);
    float _2503 = log2(_2501);
    float _2505 = -_2463;
    float _2507 = fma(_2505, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2497);
    float _2509 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2499);
    float _2511 = _2489 * _2445;
    float _2513 = fma(_1635, _2399, _2449);
    float _2515 = fma(_2507, -0.5, 0.5);
    float _2517 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2509);
    float _2519 = fma(_2507, 0.5, 0.5);
    float _2521 = _2513 + _2407;
    float _2523 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2525 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2491);
    bool _2527 = _2511 >= 0.0;
    float _2529 = _2521 * _2445;
    float _2531 = fma(_1941, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2523);
    float _2533 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2525);
    bool _2535 = _2511 <= 1.0;
    bool _2537 = _2535 && _2527;
    float _2539 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2541 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2531);
    float _2543 = _2533 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2545 = _2529 >= 0.0;
    bool _2547 = _2545 && _2537;
    float _2549 = _2449;
    if (!_2213)
    {
        int _2551 = _2481 + 400;
        uint _2553 = uint(int(uint(_2551) >> uint(2)));
        uint _2555 = uint(int(uint(int(_2553)) >> uint(2)));
        int _2557 = int(_2553) & 3;
        float _2559 = (*spvDescriptorSet0.vp_c15)._m0[int(_2555)][_2557];
        _2549 = _2559;
    }
    float _2561 = _2549;
    float _2563 = _2541 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2565 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2567 = _2529 <= 1.0;
    bool _2569 = _2567 && _2547;
    float _2571 = exp2(_2539);
    float _2573 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2575 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2565);
    float _2577 = _2493 + _2385;
    float _2579 = fma(_2519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2581 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2583 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2575);
    float _2585 = _2451 + 1.0;
    float _2587 = fma(_2519, _2579, -0.212114393711090087890625);
    float _2589 = sqrt(_2515);
    float _2591 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2583);
    float _2593 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2595 = fma(_2519, _2587, 1.570728778839111328125);
    float _2597 = _2587;
    float _2599 = _2591;
    if (_2569)
    {
        float _2601 = float(_2125);
        _2597 = _2601;
    }
    float _2603 = _2597;
    float _2605 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2581);
    float _2607 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2593);
    float _2609 = -_2451;
    float _2611 = fma(_2571, _2585, _2609);
    float _2613 = 1.0 / _2591;
    float _2615 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2605);
    float _2617 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2607);
    float _2619 = _2607;
    if (!_2213)
    {
        float _2621 = -_2487;
        float _2623 = _2021 + _2621;
        _2619 = _2623;
    }
    float _2625 = _2619;
    float _2627 = _2577 * _2445;
    float _2629 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2615);
    float _2631 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2617);
    float _2633 = _2367 * 0.693147182464599609375;
    float _2635 = _2603;
    float _2637 = _2625;
    if (_2569)
    {
        float _2639 = rint(_2603);
        float _2641 = precise::max(_2639, 0.0);
        uint _2643 = uint(_2641);
        uint _2645 = clamp(_2643, 0u, 65535u);
        _2635 = as_type<float>(_2645);
    }
    float _2647 = _2635;
    float _2649 = _2589 * 0.636619746685028076171875;
    float2 _7181 = float2(_2035, _2347);
    float _2651 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7181, float2(0.0), isnan(_7181)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7181, float2(0.0), isnan(_7181)), level(0.0)).x;
    float _2653 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2655 = fma(_2611, 0.5, 0.5);
    float _2657 = -_2595;
    float _2659 = fma(_2649, _2657, 1.0);
    float _2661 = _2629 * _2613;
    float _2663 = _2631 * _2613;
    float _2665 = fma(_2661, 0.5, 0.5);
    float _2667 = fma(_2663, -0.5, 0.5);
    float _2669 = _2647;
    if (_2569)
    {
        float3 _7218 = float3(_2511, _2529, float(as_type<int>(_2647)));
        float3 _7222 = select(_7218, float3(0.0), isnan(_7218));
        float _2671 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7222.xy, uint(rint(_7222.z)), _2627, level(0.0));
        _2669 = _2671;
    }
    float _2673 = _2669;
    float3 _7232 = float3(_2665, _2667, _2653);
    float _2675 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7232, float3(0.0), isnan(_7232)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7232, float3(0.0), isnan(_7232)), level(0.0)).x;
    float3 _7241 = float3(_2665, _2667, _2653);
    float4 _2677 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7241, float3(0.0), isnan(_7241)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7241, float3(0.0), isnan(_7241)), level(0.0)).xyzw;
    float _2679 = _2677.x;
    float _2681 = _2677.y;
    float _2683 = _2677.z;
    float _2685 = _2677.w;
    float2 _7257 = float2(_2659, _2655);
    float3 _2689 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7257, float2(0.0), isnan(_7257)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7257, float2(0.0), isnan(_7257)), level(0.0)).xyz;
    float _2691 = _2689.x;
    float _2693 = _2689.y;
    float _2695 = _2689.z;
    float _2697 = _2633;
    if (!_2213)
    {
        float _2699 = rint(_2561);
        float _2701 = precise::max(_2699, 0.0);
        uint _2703 = uint(_2701);
        uint _2705 = clamp(_2703, 0u, 65535u);
        _2697 = as_type<float>(_2705);
    }
    float _2707 = _2697;
    float _2709 = _2707;
    if (!_2213)
    {
        float3 _7294 = float3(_2625, _2443, float(as_type<int>(_2707)));
        float3 _7296 = select(_7294, float3(0.0), isnan(_7294));
        float _2711 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7296.xy, uint(rint(_7296.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7296.xy, uint(rint(_7296.z)), level(0.0)).x;
        _2709 = _2711;
    }
    float _2713 = _2709;
    float _2715 = abs(_2041);
    float _2717 = log2(_2715);
    float _2719 = _2543 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2721 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2719);
    float _2723 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2721);
    float _2725 = _2503 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2727 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2723);
    bool _2729 = _2041 <= 8000.0;
    bool _2731 = isnan(_2041);
    bool _2733 = _2729 || _2731;
    bool _2735 = isnan(8000.0);
    bool _2737 = _2733 || _2735;
    float _2739 = float(_2737);
    float _2741 = _2717 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2743 = _2727 + _2591;
    float _2745 = exp2(_2725);
    if (!_2569)
    {
        _2637 = 1.0;
    }
    float _2747 = _2637;
    float _2749 = _2743 * 0.5;
    float _2751 = exp2(_2741);
    out.m_85.z = _2749;
    out.m_85.w = _2591;
    float _2753 = fma(_2751, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2755 = precise::clamp(_2753, 0.0, 1.0);
    float _2757 = fma(_2755, -2.0, 3.0);
    float _2759 = _2755 * _2755;
    float _2761 = _2759 * _2757;
    float _2763 = -_2761;
    float _2765 = _2763 + 1.0;
    out.gl_Position.x = _2629;
    out.gl_Position.y = _2631;
    out.gl_Position.z = _2727;
    out.gl_Position.w = _2591;
    float _2767 = fma(_2765, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2761);
    float _2769 = _2739 * _2767;
    float _2771 = -_2745;
    float _2773 = _2771 + 1.0;
    float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2777 = _2773 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2779 = _2629;
    float _2781 = _2747;
    if (_2213)
    {
        _2779 = 1.0;
    }
    float _2783 = _2779;
    float _2785 = -_2651;
    float _2787 = _2785 + 1.0;
    float _2789 = _2787 * _2775;
    float _2791 = precise::clamp(_2789, 0.0, 1.0);
    float _2793 = _2783;
    float _2795 = _2791;
    if (_2569)
    {
        bool _2797 = _2673 >= _2627;
        bool _2799 = isnan(_2673);
        bool _2801 = _2797 || _2799;
        bool _2803 = isnan(_2627);
        bool _2805 = _2801 || _2803;
        float _2807 = float(_2805);
        _2781 = _2807;
    }
    float _2809 = _2781;
    if (!_2213)
    {
        int _2811 = _2343 << 4;
        int _2813 = _2811 + 2048;
        uint _2815 = uint(int(uint(_2813) >> uint(2)));
        uint _2817 = uint(int(uint(int(_2815)) >> uint(2)));
        int _2819 = int(_2815) & 3;
        float _2821 = (*spvDescriptorSet0.vp_c15)._m0[int(_2817)][_2819];
        int _2823 = int(_2815) + 1;
        uint _2825 = uint(int(uint(_2823) >> uint(2)));
        int _2827 = _2823 & 3;
        float _2829 = (*spvDescriptorSet0.vp_c15)._m0[int(_2825)][_2827];
        int _2831 = _2813 + 8;
        uint _2833 = uint(int(uint(_2831) >> uint(2)));
        uint _2835 = uint(int(uint(int(_2833)) >> uint(2)));
        int _2837 = int(_2833) & 3;
        float _2839 = (*spvDescriptorSet0.vp_c15)._m0[int(_2835)][_2837];
        int _2841 = int(_2833) + 1;
        uint _2843 = uint(int(uint(_2841) >> uint(2)));
        int _2845 = _2841 & 3;
        float _2847 = (*spvDescriptorSet0.vp_c15)._m0[int(_2843)][_2845];
        float _2849 = _1989 * _2829;
        float _2851 = fma(_1629, _2821, _2849);
        float _2853 = fma(_1635, _2839, _2851);
        float _2855 = _2853 + _2847;
        float _2857 = precise::clamp(_2855, 0.0, 1.0);
        float _2859 = -_2857;
        float _2861 = _2859 + _2713;
        float _2863 = fma(_2861, 500.0, 1.5);
        float _2865 = exp2(_2863);
        float _2867 = 0.0 + _2865;
        float _2869 = precise::clamp(_2867, 0.0, 1.0);
        _2793 = _2869;
        _2599 = _2847;
    }
    float _2871 = _2793;
    float _2873 = _2599;
    float _2875 = _2777 * _2675;
    float _2877 = _2809 * _2871;
    float _2879 = -_2791;
    float _2881 = fma(_2879, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2883 = -_2777;
    float _2885 = _2883 + 1.0;
    float _2887 = _2685 * _2875;
    float _2889 = _2695 * _2875;
    float _2891 = -_2877;
    float _2893 = fma(_2891, _2881, 1.0);
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = _2685 * _2885;
    float _2899 = fma(_2691, _2887, _2679);
    float _2901 = fma(_2693, _2887, _2681);
    float _2903 = _2895 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2905 = fma(_2685, _2889, _2683);
    bool _2907 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2909 = isnan(_2079);
    bool _2911 = _2907 || _2909;
    bool _2913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2915 = _2911 || _2913;
    out.m_87.x = _2903;
    out.m_89.x = _2899;
    out.m_89.y = _2901;
    out.m_89.z = _2905;
    out.m_89.w = _2897;
    float _2917 = _2873;
    float _2919 = _2885;
    float _2921 = _2881;
    float _2923 = _2895;
    if (!_2915)
    {
        _1717 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2925 = _1717;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2915)
    {
        _2795 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2931 = _2795;
    float _2933 = _2931;
    float _2935 = _2931;
    if (!_2915)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2937 = _2917;
    float _2939 = _2937;
    float _2941 = _2937;
    if (!_2915)
    {
        _2919 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2943 = _2919;
    float _2945 = _2943;
    float _2947 = _2943;
    if (!_2915)
    {
        _2921 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2949 = _2921;
    float _2951 = _2949;
    float _2953 = _2949;
    if (!_2915)
    {
        _2923 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2955 = _2923;
    bool _2957 = !_2915;
    float _2959 = _2955;
    float _2961 = _2955;
    if (!_2957)
    {
        bool _2963 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2965 = isnan(_2079);
        bool _2967 = _2963 || _2965;
        bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2971 = _2967 || _2969;
        if (!_2971)
        {
            float _2973 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2975 = _2079 + _2973;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2979 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2977;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2985 = 1.0 / _2979;
            float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2991 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2993 = _2991 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3003 = _2975 * _2985;
            float _3005 = precise::clamp(_3003, 0.0, 1.0);
            float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3011 = fma(_3005, _2983, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3013 = fma(_3005, _3009, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3015 = fma(_3005, _2989, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3017 = fma(_3005, _2993, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3019 = fma(_3005, _2997, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3021 = fma(_3005, _3001, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2935 = _3015;
            _2953 = _3019;
            _2929 = _3011;
            _2947 = _3017;
            _2941 = _3013;
            _2961 = _3021;
            _3023 = true;
        }
        else
        {
            bool _3025 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3027 = isnan(_2079);
            bool _3029 = _3025 || _3027;
            bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3033 = _3029 || _3031;
            if (!_3033)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3035 = _2927;
            _2929 = _3035;
            if (!_3033)
            {
                _2933 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3037 = _2933;
            _2935 = _3037;
            if (!_3033)
            {
                _2939 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3039 = _2939;
            _2941 = _3039;
            if (!_3033)
            {
                _2945 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3041 = _2945;
            _2947 = _3041;
            if (!_3033)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3043 = _2951;
            _2953 = _3043;
            if (!_3033)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3045 = _2959;
            bool _3047 = !_3033;
            _2961 = _3045;
            if (!_3047)
            {
                bool _3049 = _2079 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3051 = isnan(_2079);
                bool _3053 = _3049 || _3051;
                bool _3055 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3057 = _3053 || _3055;
                if (!_3057)
                {
                    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3061 = _2079 + _3059;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3065 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3063;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3071 = 1.0 / _3065;
                    float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3089 = _3061 * _3071;
                    float _3091 = precise::clamp(_3089, 0.0, 1.0);
                    float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3097 = fma(_3091, _3069, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3099 = fma(_3091, _3095, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3101 = fma(_3091, _3075, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3103 = fma(_3091, _3079, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3105 = fma(_3091, _3083, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3107 = fma(_3091, _3087, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2935 = _3101;
                    _2953 = _3105;
                    _2929 = _3097;
                    _2947 = _3103;
                    _2941 = _3099;
                    _2961 = _3107;
                    _3023 = true;
                }
                else
                {
                    _2935 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2947 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2941 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3023 = false;
    float _3109 = _2935;
    float _3111 = _2953;
    float _3113 = _2929;
    float _3115 = _2947;
    float _3117 = _2941;
    float _3119 = _2961;
    float _3121 = fma(_1845, -0.5, 0.5);
    float _3123 = precise::clamp(_3121, 0.0, 1.0);
    float _3125 = -_3109;
    float _3127 = _3125 + _3111;
    float _3129 = -_3113;
    float _3131 = _3129 + _3115;
    float _3133 = -_3117;
    float _3135 = _3133 + _3119;
    bool _3137 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3139 = fma(_3123, _3127, _3109);
    float _3141 = fma(_3123, _3131, _3113);
    float _3143 = fma(_3123, _3135, _3117);
    float _3145 = _3139 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3147 = fma(_3141, 0.298911988735198974609375, _3145);
    float _3149 = fma(_3143, 0.114477999508380889892578125, _3147);
    out.m_91.x = 0.0;
    float _3151 = -_3149;
    float _3153 = _3141 + _3151;
    float _3155 = -_3149;
    float _3157 = _3139 + _3155;
    float _3159 = -_3149;
    float _3161 = _3143 + _3159;
    float _3163 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3165 = fma(_3153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3149);
    float _3167 = fma(_3157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3149);
    float _3169 = fma(_3161, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3149);
    out.m_87.w = _3163;
    out.m_93.x = _3165;
    out.m_93.y = _3167;
    out.m_93.z = _3169;
    if (!_3137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3171 = -_1939;
    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3175 = -_1941;
    float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3179 = -_1943;
    float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3183 = _3173 * _3173;
    float _3185 = fma(_3177, _3177, _3183);
    float _3187 = fma(_3181, _3181, _3185);
    float _3189 = sqrt(_3187);
    float _3191 = rsqrt(_3187);
    float _3193 = -_3189;
    float _3195 = _3193 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3197 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3199 = precise::clamp(_3197, 0.0, 1.0);
    float _3201 = _3177 * _3191;
    float _3203 = _3173 * _3191;
    float _3205 = abs(_3199);
    float _3207 = log2(_3205);
    float _3209 = _3181 * _3191;
    float _3211 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3213 = _1845 * _3203;
    float _3215 = -_3203;
    float _3217 = -_3211;
    float _3219 = fma(_3215, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3217);
    float _3221 = fma(_1847, _3201, _3213);
    float _3223 = -_3209;
    float _3225 = fma(_3223, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3219);
    float _3227 = fma(_1849, _3209, _3221);
    float _3229 = precise::clamp(_3227, 0.0, 1.0);
    float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3233 = _3225 + _3231;
    float _3235 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3237 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3239 = precise::clamp(_3237, 0.0, 1.0);
    float _3241 = exp2(_3235);
    float _3243 = _3241 * _3239;
    float _3245 = _3229 * _3243;
    float _3247 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3249 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3251 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3247;
    out.m_91.y = _3249;
    out.m_91.z = _3251;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

