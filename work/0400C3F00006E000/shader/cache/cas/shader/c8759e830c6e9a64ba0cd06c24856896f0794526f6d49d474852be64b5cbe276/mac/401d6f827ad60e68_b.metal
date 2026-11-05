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
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_46 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _387 = float2(_71, _73);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_387, float2(0.0), isnan(_387))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_37.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_39.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_41.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _69 * _90;
    float _106 = _69 * _96;
    float _108 = _84 * _104;
    float _110 = _106 * _108;
    float _112 = _69 * _102;
    float _114 = 0.0 + _110;
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = _116 * _112;
    bool _122 = _118 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _124 = isnan(_118);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _130 = _126 || _128;
    float _132 = in.m_35.z;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_35.w;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    if (!_130)
    {
        discard_fragment();
    }
    float _144 = _69 * _136;
    float _146 = _69 * _142;
    float2 _493;
    _493.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_144, _146));
    _493.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_144, _146));
    float _148 = _493.x;
    float _150 = _148 * 256.0;
    int _153 = int(_150);
    float _155 = float(uint(_153));
    float _157 = _155 * 0.00390625;
    float _159 = precise::min(_157, 2.0);
    float2 _512 = float2(_144, _146);
    float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_512, float2(0.0), isnan(_512)), level(_159)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_512, float2(0.0), isnan(_512)), level(_159)).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float _171 = in.m_37.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_39.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_37.y;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_39.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_37.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_39.z;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _69 * _187;
    float _209 = _69 * _193;
    float _211 = _69 * _199;
    float _213 = _78 + _165;
    float _215 = _80 + _167;
    float _217 = _69 * _175;
    float _219 = _69 * _181;
    float _221 = _69 * _205;
    float _223 = _82 + _169;
    float _225 = -_209;
    float _227 = _207 + _225;
    float _229 = -_219;
    float _231 = _217 + _229;
    float _233 = -_221;
    float _235 = _211 + _233;
    float _237 = fma(_215, _227, _209);
    float _239 = fma(_213, _231, _219);
    float _241 = fma(_223, _235, _221);
    if (!_130)
    {
        out.m_44.x = _239;
        out.m_44.y = _237;
        out.m_44.z = _241;
        out.m_44.w = _110;
        return out;
    }
    float _243 = _237 * 0.715200006961822509765625;
    float _245 = in.m_46.w;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_46.z;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_46.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = fma(_239, 0.2125999927520751953125, _243);
    float _265 = in.m_46.y;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = fma(_241, 0.072200000286102294921875, _263);
    bool _273 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _275 = 1.0 / _271;
    float _277 = _275 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _69 * _249;
    float _283 = fma(_279, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _285 = _69 * _255;
    float _287 = _283 * _281;
    float _289 = 0.0 + _118;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = _69 * _261;
    float _295 = _69 * _269;
    float _297 = fma(_241, _287, _285);
    float _299 = fma(_239, _287, _293);
    float _301 = fma(_237, _287, _295);
    float _303 = _285;
    if (!_273)
    {
        _303 = _291;
    }
    float _305 = _303;
    bool _307 = !_273;
    float _309 = _305;
    if (!_307)
    {
        float _311 = in.m_48.w;
        float _313 = gl_FragCoord.w;
        float _315 = _311 * _313;
        float _317 = in.m_48.z;
        float _319 = gl_FragCoord.w;
        float _321 = _317 * _319;
        float _323 = _69 * _315;
        float _325 = _69 * _321;
        float _327 = 1.0 / _323;
        float _329 = _325 * _327;
        float _331 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _333 = fma(_329, (*spvDescriptorSet0.fp_c8)._m0[30].w, _331);
        float _335 = 1.0 / _333;
        float _337 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _339 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _341 = fma(_335, _337, _339);
        float _343 = _341 * 8.0;
        float _345 = precise::clamp(_343, 0.0, 1.0);
        float _347 = _291 * _345;
        _309 = _347;
    }
    float _349 = _309;
    float _351 = 0.0 + _349;
    float _353 = precise::clamp(_351, 0.0, 1.0);
    out.m_44.x = _299;
    out.m_44.y = _301;
    out.m_44.z = _297;
    out.m_44.w = _353;
    return out;
}

