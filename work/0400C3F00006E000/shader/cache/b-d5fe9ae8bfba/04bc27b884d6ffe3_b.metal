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
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_46 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _57;
    float _79 = _77 * _63;
    float _81 = _77 * _69;
    float _83 = _77 * _75;
    float _85 = _79 * _81;
    float _87 = 0.0 + _85;
    float _89 = precise::clamp(_87, 0.0, 1.0);
    float _91 = _89 * _83;
    bool _95 = _91 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _97 = isnan(_91);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _103 = _99 || _101;
    float _105 = in.m_39.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_39.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    if (!_103)
    {
        discard_fragment();
    }
    float _117 = _77 * _109;
    float _119 = _77 * _115;
    float2 _521 = float2(_117, _119);
    float3 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_521, float2(0.0), isnan(_521))).xyz;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = in.m_33.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_33.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_41.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_33.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_41.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_41.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_35.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_35.y;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_35.z;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = _77 * _135;
    float _187 = _77 * _141;
    float _189 = _77 * _147;
    float _191 = _77 * _153;
    float _193 = _77 * _159;
    float _195 = _77 * _165;
    float _197 = -_189;
    float _199 = _187 + _197;
    float _201 = -_193;
    float _203 = _191 + _201;
    float _205 = -_195;
    float _207 = _185 + _205;
    float _209 = fma(_125, _199, _189);
    float _211 = fma(_127, _203, _193);
    float _213 = fma(_129, _207, _195);
    float _215 = _77 * _171;
    float _217 = _77 * _177;
    float _219 = _77 * _183;
    float _221 = _209 * _215;
    float _223 = _211 * _217;
    float _225 = _213 * _219;
    if (!_103)
    {
        out.m_44.x = _221;
        out.m_44.y = _223;
        out.m_44.z = _225;
        out.m_44.w = _85;
        return out;
    }
    float _227 = in.m_46.w;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = _77 * _231;
    bool _235 = _233 != 1.0;
    bool _237 = isnan(_233);
    bool _239 = _235 || _237;
    bool _241 = isnan(1.0);
    bool _243 = _239 || _241;
    bool _245 = !_243;
    if (!_245)
    {
        float _247 = gl_FragCoord.x;
        float _249 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _251 = _247 / _249;
        float _253 = gl_FragCoord.y;
        float _255 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _257 = _253 / _255;
        float _259 = _233 * 256.0;
        float _261 = trunc(_259);
        int _264 = int(_261);
        uint _267 = uint(int(uint(_264) >> uint(7)));
        int _269 = int(_267) + _264;
        float _271 = trunc(_251);
        int _273 = int(_271);
        float _275 = trunc(_257);
        int _277 = int(_275);
        int _279 = _273 + 2;
        int _281 = _279 >> 1;
        uint _283 = uint(int(uint(_277) >> uint(1)));
        int _285 = _281 ^ int(_283);
        int _287 = _285 << 16;
        int _289 = _287 ^ _281;
        int _291 = 983055 & _289;
        int _293 = _291 << 6;
        int _295 = _293 + _291;
        int _297 = _295 & 13369548;
        uint _299 = uint(int(uint(_297) >> uint(3)));
        int _301 = _297 | int(_299);
        int _303 = _301 & 5570560;
        int _305 = _301 & 85;
        uint _307 = uint(int(uint(_303) >> uint(15)));
        int _309 = int(_307) + _305;
        bool _311 = uint(_269) > uint(_309);
        if (!_311)
        {
            discard_fragment();
        }
        if (!_311)
        {
            out.m_44.x = _221;
            out.m_44.y = _223;
            out.m_44.z = _225;
            out.m_44.w = _91;
            return out;
        }
    }
    float _313 = _223 * 0.715200006961822509765625;
    float _315 = in.m_48.w;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_48.z;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_48.x;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = fma(_221, 0.2125999927520751953125, _313);
    float _335 = in.m_48.y;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = fma(_225, 0.072200000286102294921875, _333);
    bool _343 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _345 = 1.0 / _341;
    float _347 = _345 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = fma(_349, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _353 = _77 * _319;
    float _355 = 0.0 + _91;
    float _357 = precise::clamp(_355, 0.0, 1.0);
    float _359 = _77 * _325;
    float _361 = _77 * _339;
    float _363 = _351 * _353;
    float _365 = _77 * _331;
    float _367 = fma(_225, _363, _359);
    float _369 = fma(_221, _363, _365);
    float _371 = fma(_223, _363, _361);
    float _373 = _359;
    if (!_343)
    {
        _373 = _357;
    }
    float _375 = _373;
    bool _377 = !_343;
    float _379 = _375;
    if (!_377)
    {
        float _381 = in.m_50.w;
        float _383 = gl_FragCoord.w;
        float _385 = _381 * _383;
        float _387 = in.m_50.z;
        float _389 = gl_FragCoord.w;
        float _391 = _387 * _389;
        float _393 = _77 * _385;
        float _395 = _77 * _391;
        float _397 = 1.0 / _393;
        float _399 = _395 * _397;
        float _401 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _403 = fma(_399, (*spvDescriptorSet0.fp_c8)._m0[30].w, _401);
        float _405 = 1.0 / _403;
        float _407 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _409 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _411 = fma(_405, _407, _409);
        float _413 = _411 * 8.0;
        float _415 = precise::clamp(_413, 0.0, 1.0);
        float _417 = _357 * _415;
        _379 = _417;
    }
    float _419 = _379;
    float _421 = 0.0 + _419;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    out.m_44.x = _369;
    out.m_44.y = _371;
    out.m_44.z = _367;
    out.m_44.w = _423;
    return out;
}

