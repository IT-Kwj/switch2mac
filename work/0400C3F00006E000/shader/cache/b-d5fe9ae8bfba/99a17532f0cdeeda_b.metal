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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _45 = in.m_33.x;
    float _47 = in.m_33.y;
    float _49 = _45 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float2 _322 = float2(_45, _47);
    float3 _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_322, float2(0.0), isnan(_322))).xyz;
    float _55 = _53.x;
    float _57 = _53.y;
    float _59 = _53.z;
    float2 _339 = float2(_45, _47);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_339, float2(0.0), isnan(_339))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_339, float2(0.0), isnan(_339))).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float _69 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _71 = _45 + _69;
    float _73 = _47 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _75 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _77 = _47 + _75;
    float2 _370 = float2(_49, _47);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_370, float2(0.0), isnan(_370))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_370, float2(0.0), isnan(_370))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _384 = float2(_71, _47);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_384, float2(0.0), isnan(_384))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_384, float2(0.0), isnan(_384))).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float2 _398 = float2(_45, _73);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_398, float2(0.0), isnan(_398))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_398, float2(0.0), isnan(_398))).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _412 = float2(_45, _77);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_412, float2(0.0), isnan(_412))).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float _111 = _57 + (-0.5);
    float _113 = _55 + (-0.5);
    float _115 = _65 + (-0.5);
    float _117 = _59 + (-0.5);
    float _119 = _111 * _111;
    float _121 = _83 + (-0.5);
    float _123 = _81 + (-0.5);
    float _125 = _63 + (-0.5);
    float _127 = _91 + (-0.5);
    float _129 = fma(_113, _113, _119);
    float _131 = _121 * _121;
    float _133 = _115 * _111;
    float _135 = _89 + (-0.5);
    float _137 = _127 * _127;
    float _139 = fma(_117, _117, _129);
    float _141 = _99 + (-0.5);
    float _143 = _85 + (-0.5);
    float _145 = fma(_123, _123, _131);
    float _147 = fma(_125, _113, _133);
    float _149 = fma(_135, _135, _137);
    float _151 = _97 + (-0.5);
    float _153 = _141 * _141;
    float _155 = fma(_143, _143, _145);
    float _157 = _93 + (-0.5);
    float _159 = _67 + (-0.5);
    float _161 = _107 + (-0.5);
    float _163 = _101 + (-0.5);
    float _165 = fma(_151, _151, _153);
    float _167 = fma(_157, _157, _149);
    float _169 = fma(_159, _117, _147);
    float _171 = _105 + (-0.5);
    float _173 = _161 * _161;
    float _175 = rsqrt(_139);
    float _177 = fma(_163, _163, _165);
    float _179 = _115 * _121;
    float _181 = _109 + (-0.5);
    float _183 = fma(_171, _171, _173);
    float _185 = fma(_125, _123, _179);
    float _187 = _115 * _127;
    float _189 = rsqrt(_155);
    float _191 = fma(_181, _181, _183);
    float _193 = fma(_159, _143, _185);
    float _195 = fma(_125, _135, _187);
    float _197 = _115 * _141;
    float _199 = _115 * _161;
    float _201 = fma(_159, _157, _195);
    float _203 = rsqrt(_167);
    float _205 = _175 * _169;
    float _207 = fma(_125, _151, _197);
    float _209 = fma(_125, _171, _199);
    float _211 = fma(_159, _163, _207);
    float _213 = fma(_159, _181, _209);
    float _215 = rsqrt(_177);
    float _217 = _189 * _193;
    float _219 = -_205;
    float _221 = -_217;
    float _223 = precise::min(_219, _221);
    float _225 = rsqrt(_191);
    float _227 = _203 * _201;
    bool _231 = _217 > _205;
    float _233 = -_227;
    float _235 = precise::min(_223, _233);
    float _237 = _215 * _211;
    float _239 = -_227;
    bool _241 = _223 > _239;
    bool _243 = !_231;
    int _246 = _243 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _248 = -_237;
    bool _250 = _235 > _248;
    float _252 = -_237;
    float _254 = precise::min(_235, _252);
    float _256 = _225 * _213;
    bool _258 = !_241;
    float _260 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _262 = _258 ? _246 : as_type<int>(_260);
    float _264 = -_256;
    bool _266 = _254 > _264;
    bool _268 = !_250;
    int _270 = _268 ? _262 : 0;
    bool _272 = !_250;
    int _274 = _272 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    bool _276 = !_266;
    float _278 = _276 ? as_type<float>(_270) : (-0.0);
    bool _280 = !_266;
    float _282 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _284 = _280 ? as_type<float>(_274) : _282;
    float _286 = _45 + _278;
    float _288 = _47 + _284;
    float2 _687 = float2(_286, _288);
    float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_687, float2(0.0), isnan(_687))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_687, float2(0.0), isnan(_687))).xyz;
    float _292 = _290.x;
    float _294 = _290.y;
    float _296 = _290.z;
    float2 _701 = float2(_286, _288);
    float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_701, float2(0.0), isnan(_701))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_701, float2(0.0), isnan(_701))).xyz;
    float _300 = _298.x;
    float _302 = _298.y;
    float _304 = _298.z;
    out.m_36.x = _292;
    out.m_36.y = _294;
    out.m_36.z = _296;
    out.m_38.x = _300;
    out.m_38.y = _302;
    out.m_38.z = _304;
    return out;
}

