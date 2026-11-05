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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_37 [[user(locn5), flat]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _57;
    float _73 = _71 * _63;
    float _75 = _71 * _69;
    float2 _419;
    _419.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_73, _75));
    _419.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_73, _75));
    float _77 = _419.x;
    float _79 = _77 * 256.0;
    int _82 = int(_79);
    float _84 = float(uint(_82));
    float _86 = _84 * 0.00390625;
    float _88 = precise::min(_86, 2.0);
    float2 _439 = float2(_73, _75);
    float2 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439)), level(_88)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_439, float2(0.0), isnan(_439)), level(_88)).xy;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = in.m_37.x;
    float _100 = in.m_35.z;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_35.w;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = _94 * _94;
    float _114 = _96 * _96;
    float _116 = _71 * _110;
    float _118 = fma(_112, 2.0, -1.0);
    float _120 = fma(_114, 2.0, -1.0);
    float _122 = _98 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _124 = _98 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _126 = _71 * _104;
    float _128 = fma(_122, _118, _126);
    float _130 = fma(_124, _120, _116);
    float2 _508;
    _508.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_128, _130));
    _508.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_128, _130));
    float _132 = _508.x;
    float _134 = _132 * 256.0;
    int _136 = int(_134);
    float _138 = float(uint(_136));
    float _140 = _138 * 0.00390625;
    float _142 = precise::min(_140, 2.0);
    float2 _524 = float2(_128, _130);
    float4 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_524, float2(0.0), isnan(_524)), level(_142)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_524, float2(0.0), isnan(_524)), level(_142)).xyzw;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = _145.w;
    float _155 = in.m_39.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_41.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_43.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _71 * _159;
    float _175 = _71 * _165;
    float _177 = in.m_39.y;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_41.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_39.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_41.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_41.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _71 * _181;
    float _209 = _71 * _193;
    float _211 = _71 * _205;
    float _213 = -_173;
    float _215 = _153 + _213;
    float _217 = _71 * _171;
    float _219 = _175 * _215;
    float _221 = 0.0 + _219;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _223 * _217;
    bool _229 = _225 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _231 = isnan(_225);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _237 = _233 || _235;
    float _239 = in.m_39.z;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    if (!_237)
    {
        discard_fragment();
    }
    float _245 = _71 * _187;
    float _247 = _71 * _199;
    float _249 = -_247;
    float _251 = _207 + _249;
    float _253 = _149 * _149;
    float _255 = fma(_253, _251, _247);
    float _257 = _71 * _243;
    float _259 = -_245;
    float _261 = _209 + _259;
    float _263 = _147 * _147;
    float _265 = -_211;
    float _267 = _257 + _265;
    float _269 = _151 * _151;
    float _271 = fma(_263, _261, _245);
    float _273 = fma(_269, _267, _211);
    if (!_237)
    {
        out.m_46.x = _271;
        out.m_46.y = _255;
        out.m_46.z = _273;
        out.m_46.w = _219;
        return out;
    }
    float _275 = _255 * 0.715200006961822509765625;
    float _277 = in.m_48.w;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_48.z;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_48.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = fma(_271, 0.2125999927520751953125, _275);
    float _297 = in.m_48.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = fma(_273, 0.072200000286102294921875, _295);
    bool _305 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _307 = 1.0 / _303;
    float _309 = _307 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = fma(_311, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _315 = _71 * _281;
    float _317 = _71 * _287;
    float _319 = _313 * _315;
    float _321 = 0.0 + _225;
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = _71 * _293;
    float _327 = _71 * _301;
    float _329 = fma(_273, _319, _317);
    float _331 = fma(_271, _319, _325);
    float _333 = fma(_255, _319, _327);
    float _335 = _317;
    if (!_305)
    {
        _335 = _323;
    }
    float _337 = _335;
    bool _339 = !_305;
    float _341 = _337;
    if (!_339)
    {
        float _343 = in.m_50.w;
        float _345 = gl_FragCoord.w;
        float _347 = _343 * _345;
        float _349 = in.m_50.z;
        float _351 = gl_FragCoord.w;
        float _353 = _349 * _351;
        float _355 = _71 * _347;
        float _357 = _71 * _353;
        float _359 = 1.0 / _355;
        float _361 = _357 * _359;
        float _363 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _365 = fma(_361, (*spvDescriptorSet0.fp_c8)._m0[30].w, _363);
        float _367 = 1.0 / _365;
        float _369 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _371 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _373 = fma(_367, _369, _371);
        float _375 = _373 * 8.0;
        float _377 = precise::clamp(_375, 0.0, 1.0);
        float _379 = _323 * _377;
        _341 = _379;
    }
    float _381 = _341;
    float _383 = 0.0 + _381;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    out.m_46.x = _331;
    out.m_46.y = _333;
    out.m_46.z = _329;
    out.m_46.w = _385;
    return out;
}

