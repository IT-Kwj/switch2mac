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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_10Smplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_43 [[user(locn4), flat]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_41 [[user(locn7)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _61;
    float _83 = _81 * _67;
    float _85 = _81 * _73;
    float _87 = _81 * _79;
    float _89 = 1.0 / _83;
    float _91 = _85 * _89;
    float _93 = _87 * _89;
    float2 _473 = float2(_91, _93);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_473, float2(0.0), isnan(_473))).x;
    float _97 = in.m_39.y;
    float _99 = in.m_41.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _107 = in.m_41.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _105);
    float _115 = in.m_39.x;
    float _117 = in.m_37.z;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _113);
    float _125 = (*spvDescriptorSet0.fp_c10)._m0[5].y * (*spvDescriptorSet0.fp_c10)._m0[5].y;
    float _127 = in.m_39.z;
    float _129 = (*spvDescriptorSet0.fp_c10)._m0[5].z * (*spvDescriptorSet0.fp_c10)._m0[5].z;
    float _131 = fma((*spvDescriptorSet0.fp_c10)._m0[4].y, (*spvDescriptorSet0.fp_c10)._m0[4].y, _125);
    float _133 = sqrt(_123);
    float _135 = in.m_41.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = fma((*spvDescriptorSet0.fp_c10)._m0[6].y, (*spvDescriptorSet0.fp_c10)._m0[6].y, _131);
    float _143 = fma((*spvDescriptorSet0.fp_c10)._m0[4].z, (*spvDescriptorSet0.fp_c10)._m0[4].z, _129);
    float _145 = sqrt(_141);
    float _147 = fma((*spvDescriptorSet0.fp_c10)._m0[6].z, (*spvDescriptorSet0.fp_c10)._m0[6].z, _143);
    float _149 = in.m_43.x;
    float _151 = in.m_43.y;
    float _153 = sqrt(_147);
    float _155 = _115 * _133;
    float _157 = _97 * _145;
    float _159 = in.m_43.z;
    float _161 = _157 * _157;
    float _163 = _127 * _153;
    float _165 = fma(_155, _155, _161);
    float _167 = fma(_163, _163, _165);
    float _169 = _81 * _103;
    float _171 = _169 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _173 = sqrt(_167);
    float _175 = _151 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _177 = _81 * _111;
    float _179 = fma(_149, (*spvDescriptorSet0.fp_c8)._m0[1].x, _175);
    float _181 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[1].x, _171);
    float _183 = _81 * _121;
    float _185 = _81 * _139;
    float _187 = _183 * _89;
    float _189 = fma(_185, (*spvDescriptorSet0.fp_c8)._m0[1].z, _181);
    float _191 = fma(_159, (*spvDescriptorSet0.fp_c8)._m0[1].z, _179);
    float _193 = _173 + _173;
    float _195 = in.m_45.w;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _203 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[30].w, _201);
    float _205 = -_191;
    float _207 = _189 + _205;
    float _209 = 1.0 / _193;
    float _211 = in.m_47.x;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = _207 + _173;
    float _219 = 1.0 / _203;
    float _221 = _217 * _209;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _227 = _219 * _225;
    float _229 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _231 = fma(_95, (*spvDescriptorSet0.fp_c8)._m0[30].w, _229);
    float _233 = _223 * _223;
    float _235 = _81 * _199;
    float _237 = _81 * _215;
    float _239 = 1.0 / _231;
    float _241 = fma(_233, (*spvDescriptorSet0.fp_c9)._m0[194].z, _227);
    float _243 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _245 = -_241;
    float _247 = fma(_239, _243, _245);
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _235 * _249;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _253 * _237;
    bool _259 = _255 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _261 = isnan(_255);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _267 = _263 || _265;
    float _269 = in.m_49.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_49.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = _227;
    if (!_267)
    {
        discard_fragment();
    }
    float _283 = _81 * _273;
    float _285 = _81 * _279;
    float2 _786 = float2(_283, _285);
    float3 _289 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_786, float2(0.0), isnan(_786))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_786, float2(0.0), isnan(_786))).xyz;
    float _291 = _289.x;
    float _293 = _289.y;
    float _295 = _289.z;
    float _297 = in.m_45.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_45.y;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_45.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = _291 + (-1.0);
    float _317 = _293 + (-1.0);
    float _319 = _295 + (-1.0);
    float _321 = _81 * _301;
    float _323 = fma(_315, (*spvDescriptorSet0.fp_c9)._m0[194].w, 1.0);
    float _325 = fma(_317, (*spvDescriptorSet0.fp_c9)._m0[194].w, 1.0);
    float _327 = fma(_319, (*spvDescriptorSet0.fp_c9)._m0[194].w, 1.0);
    float _329 = _81 * _307;
    float _331 = _81 * _313;
    float _333 = _321 * _323;
    float _335 = _329 * _325;
    float _337 = _331 * _327;
    if (!_267)
    {
        out.m_52.x = _333;
        out.m_52.y = _335;
        out.m_52.z = _337;
        out.m_52.w = _253;
        return out;
    }
    float _339 = _335 * 0.715200006961822509765625;
    float _341 = in.m_54.w;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_54.x;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_54.y;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = fma(_333, 0.2125999927520751953125, _339);
    float _361 = in.m_54.z;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = fma(_337, 0.072200000286102294921875, _359);
    bool _369 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _371 = 1.0 / _367;
    float _373 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_369)
    {
        float _375 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _377 = _227 + _375;
        _281 = _377;
    }
    float _379 = _281;
    float _381 = _371 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = fma(_383, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _387 = _81 * _345;
    if (_369)
    {
        float _389 = _379 * 8.0;
        float _391 = precise::clamp(_389, 0.0, 1.0);
        _373 = _391;
    }
    float _393 = _373;
    float _395 = _81 * _351;
    float _397 = _385 * _387;
    float _399 = 0.0 + _255;
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = _81 * _357;
    float _405 = _81 * _365;
    float _407 = fma(_333, _397, _395);
    float _409 = _401;
    if (_369)
    {
        float _411 = _401 * _393;
        _409 = _411;
    }
    float _413 = _409;
    float _415 = fma(_335, _397, _403);
    float _417 = fma(_337, _397, _405);
    float _419 = 0.0 + _413;
    float _421 = precise::clamp(_419, 0.0, 1.0);
    out.m_52.x = _407;
    out.m_52.y = _415;
    out.m_52.z = _417;
    out.m_52.w = _421;
    return out;
}

