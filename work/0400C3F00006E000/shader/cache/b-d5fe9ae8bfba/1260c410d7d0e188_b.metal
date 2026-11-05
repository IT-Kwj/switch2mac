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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texturecube<float> fp_t_tcb_1E [[id(4)]];
    sampler fp_t_tcb_1ESmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_1ESmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
    float4 m_40 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_34 [[user(locn3)]];
    float4 m_38 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _58 = gl_FragCoord.w;
    float _60 = in.m_34.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_34.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _58;
    float _74 = _72 * _64;
    float _76 = _72 * _70;
    float2 _457 = float2(_74, _76);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_457, float2(0.0), isnan(_457))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_36.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_38.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_36.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = _72 * _93;
    float _109 = _72 * _99;
    float _111 = in.m_36.z;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_40.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_40.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = _72 * _121;
    float _131 = _87 * _107;
    float _133 = 0.0 + _131;
    float _135 = precise::clamp(_133, 0.0, 1.0);
    float _137 = _135 * _109;
    bool _141 = _137 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _143 = isnan(_137);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _149 = _145 || _147;
    float _151 = in.m_36.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_40.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    if (!_149)
    {
        discard_fragment();
    }
    float _163 = _72 * _105;
    float _165 = _72 * _155;
    float _167 = _72 * _161;
    float _169 = _72 * _115;
    float _171 = _72 * _127;
    float _173 = -_129;
    float _175 = _165 + _173;
    float _177 = -_167;
    float _179 = _163 + _177;
    float _181 = -_171;
    float _183 = _169 + _181;
    float _185 = fma(_83, _175, _129);
    float _187 = fma(_81, _179, _167);
    float _189 = fma(_85, _183, _171);
    if (!_149)
    {
        out.m_43.x = _187;
        out.m_43.y = _185;
        out.m_43.z = _189;
        out.m_43.w = _131;
        return out;
    }
    float _191 = in.m_45.w;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = _72 * _195;
    bool _199 = _197 != 1.0;
    bool _201 = isnan(_197);
    bool _203 = _199 || _201;
    bool _205 = isnan(1.0);
    bool _207 = _203 || _205;
    bool _209 = !_207;
    if (!_209)
    {
        float _211 = gl_FragCoord.x;
        float _213 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _215 = _211 / _213;
        float _217 = gl_FragCoord.y;
        float _219 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _221 = _217 / _219;
        float _223 = _197 * 256.0;
        float _225 = trunc(_223);
        int _228 = int(_225);
        uint _231 = uint(int(uint(_228) >> uint(7)));
        int _233 = int(_231) + _228;
        float _235 = trunc(_215);
        int _237 = int(_235);
        float _239 = trunc(_221);
        int _241 = int(_239);
        int _243 = _237 + 2;
        int _245 = _243 >> 1;
        uint _247 = uint(int(uint(_241) >> uint(1)));
        int _249 = _245 ^ int(_247);
        int _251 = _249 << 16;
        int _253 = _251 ^ _245;
        int _255 = 983055 & _253;
        int _257 = _255 << 6;
        int _259 = _257 + _255;
        int _261 = _259 & 13369548;
        uint _263 = uint(int(uint(_261) >> uint(3)));
        int _265 = _261 | int(_263);
        int _267 = _265 & 5570560;
        int _269 = _265 & 85;
        uint _271 = uint(int(uint(_267) >> uint(15)));
        int _273 = int(_271) + _269;
        bool _275 = uint(_233) > uint(_273);
        if (!_275)
        {
            discard_fragment();
        }
        if (!_275)
        {
            out.m_43.x = _187;
            out.m_43.y = _185;
            out.m_43.z = _189;
            out.m_43.w = _137;
            return out;
        }
    }
    float _277 = in.m_47.y;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_47.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_47.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_45.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = _72 * _281;
    float _303 = _72 * _287;
    float _305 = _72 * _293;
    float _307 = _301 * _301;
    float _309 = fma(_303, _303, _307);
    float _311 = fma(_305, _305, _309);
    float _313 = rsqrt(_311);
    float _315 = _303 * _313;
    float _317 = _301 * _313;
    float _319 = _305 * _313;
    float _321 = _72 * _299;
    float _323 = abs(_315);
    float _325 = abs(_317);
    float _327 = precise::max(_323, _325);
    float _329 = abs(_319);
    float _331 = precise::max(_329, _327);
    float _333 = 1.0 / _331;
    float _335 = _315 * _333;
    float _337 = -_333;
    float _339 = _319 * _337;
    float _341 = precise::min(_321, 1.0);
    float _343 = _317 * _333;
    float3 _855 = float3(_335, _343, _339);
    float3 _347 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_855, float3(0.0), isnan(_855)), level(_341)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_855, float3(0.0), isnan(_855)), level(_341)).xyz;
    float _349 = _347.x;
    float _351 = _347.y;
    float _353 = _347.z;
    float _355 = in.m_49.x;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_49.y;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_49.z;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_51.x;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_51.y;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_51.z;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = _72 * _359;
    float _393 = _72 * _365;
    float _395 = _72 * _371;
    float _397 = _72 * _377;
    float _399 = _72 * _383;
    float _401 = _72 * _389;
    float _403 = fma(_349, 0.20999999344348907470703125, _391);
    float _405 = fma(_351, 0.20999999344348907470703125, _393);
    float _407 = fma(_353, 0.20999999344348907470703125, _395);
    float _409 = _403 + _397;
    float _411 = _405 + _399;
    float _413 = _407 + _401;
    float _415 = _187 * _409;
    float _417 = _185 * _411;
    float _419 = _189 * _413;
    float _421 = 0.0 + _137;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    out.m_43.x = _415;
    out.m_43.y = _417;
    out.m_43.z = _419;
    out.m_43.w = _423;
    return out;
}

