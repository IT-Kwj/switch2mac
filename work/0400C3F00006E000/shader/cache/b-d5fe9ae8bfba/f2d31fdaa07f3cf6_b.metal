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
    constant _16* fp_c9 [[id(1)]];
    texturecube<float> fp_t_tcb_1E [[id(2)]];
    sampler fp_t_tcb_1ESmplr [[id(3)]];
    sampler fp_t_tcb_1ESmplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_42 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_38 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_29.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _53;
    float _75 = _73 * _59;
    float _77 = _73 * _65;
    float _79 = _73 * _71;
    float _81 = _75 * _77;
    float _83 = 0.0 + _81;
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = _85 * _79;
    bool _91 = _87 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _93 = isnan(_87);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _99 = _95 || _97;
    float _101 = in.m_31.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_29.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_29.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_31.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_29.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_31.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    if (!_99)
    {
        discard_fragment();
    }
    float _137 = _73 * _105;
    float _139 = _73 * _111;
    float _141 = _73 * _117;
    float _143 = _73 * _123;
    float _145 = _73 * _129;
    float _147 = _73 * _135;
    float _149 = _141 * _137;
    float _151 = _139 * _143;
    float _153 = _145 * _147;
    if (!_99)
    {
        out.m_36.x = _149;
        out.m_36.y = _151;
        out.m_36.z = _153;
        out.m_36.w = _81;
        return out;
    }
    float _155 = in.m_38.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = _73 * _159;
    bool _163 = _161 != 1.0;
    bool _165 = isnan(_161);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    bool _173 = !_171;
    if (!_173)
    {
        float _175 = gl_FragCoord.x;
        float _177 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _179 = _175 / _177;
        float _181 = gl_FragCoord.y;
        float _183 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _185 = _181 / _183;
        float _187 = _161 * 256.0;
        float _189 = trunc(_187);
        int _192 = int(_189);
        float _194 = trunc(_179);
        int _196 = int(_194);
        float _198 = trunc(_185);
        int _200 = int(_198);
        int _202 = _196 + 2;
        int _204 = _202 >> 1;
        uint _207 = uint(int(uint(_200) >> uint(1)));
        int _209 = _204 ^ int(_207);
        int _211 = _209 << 16;
        int _213 = _211 ^ _204;
        int _215 = 983055 & _213;
        uint _217 = uint(int(uint(_192) >> uint(7)));
        int _219 = int(_217) + _192;
        int _221 = _215 << 6;
        int _223 = _221 + _215;
        int _225 = _223 & 13369548;
        uint _227 = uint(int(uint(_225) >> uint(3)));
        int _229 = _225 | int(_227);
        int _231 = _229 & 5570560;
        int _233 = _229 & 85;
        uint _235 = uint(int(uint(_231) >> uint(15)));
        int _237 = int(_235) + _233;
        bool _239 = uint(_219) > uint(_237);
        if (!_239)
        {
            discard_fragment();
        }
        if (!_239)
        {
            out.m_36.x = _149;
            out.m_36.y = _151;
            out.m_36.z = _153;
            out.m_36.w = _87;
            return out;
        }
    }
    float _241 = in.m_40.y;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_40.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_40.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_38.x;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = _73 * _245;
    float _267 = _73 * _251;
    float _269 = _73 * _257;
    float _271 = _265 * _265;
    float _273 = fma(_267, _267, _271);
    float _275 = fma(_269, _269, _273);
    float _277 = rsqrt(_275);
    float _279 = _267 * _277;
    float _281 = _265 * _277;
    float _283 = _269 * _277;
    float _285 = abs(_279);
    float _287 = abs(_281);
    float _289 = precise::max(_285, _287);
    float _291 = abs(_283);
    float _293 = precise::max(_291, _289);
    float _295 = _73 * _263;
    float _297 = 1.0 / _293;
    float _299 = precise::min(_295, 1.0);
    float _301 = -_297;
    float _303 = _283 * _301;
    float _305 = _279 * _297;
    float _307 = _281 * _297;
    float3 _810 = float3(_305, _307, _303);
    float3 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_810, float3(0.0), isnan(_810)), level(_299)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_810, float3(0.0), isnan(_810)), level(_299)).xyz;
    float _313 = _311.x;
    float _315 = _311.y;
    float _317 = _311.z;
    float _319 = in.m_42.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_42.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_42.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_44.x;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_44.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_44.z;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_46.x;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_46.y;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_46.z;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_46.w;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = _73 * _323;
    float _381 = _73 * _329;
    float _383 = _73 * _335;
    float _385 = fma(_313, 0.20999999344348907470703125, _379);
    float _387 = fma(_315, 0.20999999344348907470703125, _381);
    float _389 = _73 * _341;
    float _391 = fma(_317, 0.20999999344348907470703125, _383);
    float _393 = _73 * _347;
    float _395 = _73 * _353;
    float _397 = _385 + _389;
    float _399 = _73 * _371;
    float _401 = _387 + _393;
    float _403 = _391 + _395;
    float _405 = _73 * _359;
    float _407 = _73 * _365;
    float _409 = _73 * _377;
    float _411 = _149 * _397;
    float _413 = _151 * _401;
    float _415 = _153 * _403;
    float _417 = fma(_411, _409, _405);
    float _419 = fma(_413, _409, _407);
    float _421 = fma(_415, _409, _399);
    float _423 = 0.0 + _87;
    float _425 = precise::clamp(_423, 0.0, 1.0);
    out.m_36.x = _417;
    out.m_36.y = _419;
    out.m_36.z = _421;
    out.m_36.w = _425;
    return out;
}

