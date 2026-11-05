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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
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
    float4 m_48 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_37 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _389;
    _389.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_71, _73));
    _389.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_71, _73));
    float _75 = _389.x;
    float _77 = _75 * 256.0;
    int _80 = int(_77);
    float _82 = in.m_35.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_35.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = float(uint(_80));
    float _96 = _94 * 0.00390625;
    float _98 = _69 * _86;
    float _100 = _69 * _92;
    float _102 = precise::min(_96, 2.0);
    float2 _431 = float2(_98, _100);
    float4 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_431, float2(0.0), isnan(_431))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_431, float2(0.0), isnan(_431))).xyzw;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = _105.w;
    float2 _450 = float2(_71, _73);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_450, float2(0.0), isnan(_450)), level(_102)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_450, float2(0.0), isnan(_450)), level(_102)).xyzw;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _115.w;
    float _125 = in.m_37.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_39.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_41.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_43.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _69 * _129;
    float _151 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _153 = _149 + _151;
    float _155 = (*spvDescriptorSet0.fp_c9)._m0[191].y + 2000.0;
    float _157 = precise::max(_153, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _159 = _69 * _135;
    float _161 = precise::min(_155, _157);
    float _163 = in.m_41.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_39.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = _113 + _123;
    float _177 = -_159;
    float _179 = _175 + _177;
    float _181 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _183 = _161 + _181;
    float _185 = _69 * _141;
    float _187 = _183 * 0.0005000000237487256526947021484375;
    float _189 = _185 * _179;
    float _191 = _189 * _187;
    float _193 = _69 * _147;
    float _195 = 0.0 + _191;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = _197 * _193;
    bool _203 = _199 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _205 = isnan(_199);
    bool _207 = _203 || _205;
    bool _209 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _211 = _207 || _209;
    float _213 = in.m_41.y;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_41.z;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_39.y;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_39.z;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    if (!_211)
    {
        discard_fragment();
    }
    float _237 = _109 + _119;
    float _239 = _107 + _117;
    float _241 = _111 + _121;
    float _243 = _69 * _167;
    float _245 = -_237;
    float _247 = _245 + 1.0;
    float _249 = -_239;
    float _251 = _249 + 1.0;
    float _253 = _69 * _217;
    float _255 = _69 * _223;
    float _257 = -_241;
    float _259 = _257 + 1.0;
    float _261 = _243 * _251;
    float _263 = _253 * _247;
    float _265 = _69 * _173;
    float _267 = _255 * _259;
    float _269 = _69 * _229;
    float _271 = _69 * _235;
    float _273 = fma(_239, _265, _261);
    float _275 = fma(_237, _269, _263);
    float _277 = fma(_241, _271, _267);
    if (!_211)
    {
        out.m_46.x = _273;
        out.m_46.y = _275;
        out.m_46.z = _277;
        out.m_46.w = _191;
        return out;
    }
    float _279 = _275 * 0.715200006961822509765625;
    float _281 = 0.0 + _199;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = fma(_273, 0.2125999927520751953125, _279);
    bool _287 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _289 = fma(_277, 0.072200000286102294921875, _285);
    float _291 = 1.0 / _289;
    float _293 = _291 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = fma(_295, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _299 = _273 * _297;
    float _301 = _275 * _297;
    float _303 = _277 * _297;
    float _305 = _297;
    if (!_287)
    {
        _305 = _283;
    }
    float _307 = _305;
    bool _309 = !_287;
    float _311 = _307;
    if (!_309)
    {
        float _313 = in.m_48.w;
        float _315 = gl_FragCoord.w;
        float _317 = _313 * _315;
        float _319 = in.m_48.z;
        float _321 = gl_FragCoord.w;
        float _323 = _319 * _321;
        float _325 = _69 * _317;
        float _327 = _69 * _323;
        float _329 = 1.0 / _325;
        float _331 = _327 * _329;
        float _333 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _335 = fma(_331, (*spvDescriptorSet0.fp_c8)._m0[30].w, _333);
        float _337 = 1.0 / _335;
        float _339 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _341 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _343 = fma(_337, _339, _341);
        float _345 = _343 * 8.0;
        float _347 = precise::clamp(_345, 0.0, 1.0);
        float _349 = _283 * _347;
        _311 = _349;
    }
    float _351 = _311;
    float _353 = 0.0 + _351;
    float _355 = precise::clamp(_353, 0.0, 1.0);
    out.m_46.x = _299;
    out.m_46.y = _301;
    out.m_46.z = _303;
    out.m_46.w = _355;
    return out;
}

