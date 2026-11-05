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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _43 = in.m_33.x;
    float _45 = in.m_33.y;
    float _47 = _43 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float2 _326 = float2(_43, _45);
    float3 _51 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_326, float2(0.0), isnan(_326))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_326, float2(0.0), isnan(_326))).xyz;
    float _53 = _51.x;
    float _55 = _51.y;
    float _57 = _51.z;
    float2 _343 = float2(_43, _45);
    float3 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_343, float2(0.0), isnan(_343))).xyz;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = _59.z;
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _69 = _43 + _67;
    float _71 = _45 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _73 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _75 = _45 + _73;
    float2 _374 = float2(_47, _45);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_374, float2(0.0), isnan(_374))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_374, float2(0.0), isnan(_374))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _388 = float2(_69, _45);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_388, float2(0.0), isnan(_388))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_388, float2(0.0), isnan(_388))).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _402 = float2(_43, _71);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_402, float2(0.0), isnan(_402))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _416 = float2(_43, _75);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_416, float2(0.0), isnan(_416))).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float _109 = _55 + (-0.5);
    float _111 = _53 + (-0.5);
    float _113 = _63 + (-0.5);
    float _115 = _57 + (-0.5);
    float _117 = _109 * _109;
    float _119 = _81 + (-0.5);
    float _121 = _79 + (-0.5);
    float _123 = _61 + (-0.5);
    float _125 = _89 + (-0.5);
    float _127 = fma(_111, _111, _117);
    float _129 = _119 * _119;
    float _131 = _113 * _109;
    float _133 = _87 + (-0.5);
    float _135 = _125 * _125;
    float _137 = fma(_115, _115, _127);
    float _139 = _97 + (-0.5);
    float _141 = _83 + (-0.5);
    float _143 = fma(_121, _121, _129);
    float _145 = fma(_123, _111, _131);
    float _147 = fma(_133, _133, _135);
    float _149 = _95 + (-0.5);
    float _151 = _139 * _139;
    float _153 = fma(_141, _141, _143);
    float _155 = _91 + (-0.5);
    float _157 = _65 + (-0.5);
    float _159 = _105 + (-0.5);
    float _161 = _99 + (-0.5);
    float _163 = fma(_149, _149, _151);
    float _165 = fma(_155, _155, _147);
    float _167 = fma(_157, _115, _145);
    float _169 = _103 + (-0.5);
    float _171 = _159 * _159;
    float _173 = rsqrt(_137);
    float _175 = fma(_161, _161, _163);
    float _177 = _113 * _119;
    float _179 = _107 + (-0.5);
    float _181 = fma(_169, _169, _171);
    float _183 = fma(_123, _121, _177);
    float _185 = _113 * _125;
    float _187 = rsqrt(_153);
    float _189 = fma(_179, _179, _181);
    float _191 = fma(_157, _141, _183);
    float _193 = fma(_123, _133, _185);
    float _195 = _113 * _139;
    float _197 = _113 * _159;
    float _199 = fma(_157, _155, _193);
    float _201 = rsqrt(_165);
    float _203 = _173 * _167;
    float _205 = fma(_123, _149, _195);
    float _207 = fma(_123, _169, _197);
    float _209 = fma(_157, _161, _205);
    float _211 = fma(_157, _179, _207);
    float _213 = rsqrt(_175);
    float _215 = _187 * _191;
    float _217 = -_203;
    float _219 = -_215;
    float _221 = precise::min(_217, _219);
    float _223 = rsqrt(_189);
    float _225 = _201 * _199;
    bool _229 = _215 > _203;
    float _231 = -_225;
    float _233 = precise::min(_221, _231);
    float _235 = _213 * _209;
    float _237 = -_225;
    bool _239 = _221 > _237;
    bool _241 = !_229;
    int _244 = _241 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _246 = -_235;
    bool _248 = _233 > _246;
    float _250 = -_235;
    float _252 = precise::min(_233, _250);
    float _254 = _223 * _211;
    bool _256 = !_239;
    float _258 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _260 = _256 ? _244 : as_type<int>(_258);
    float _262 = -_254;
    bool _264 = _252 > _262;
    bool _266 = !_248;
    int _268 = _266 ? _260 : 0;
    bool _270 = !_248;
    int _272 = _270 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    bool _274 = !_264;
    float _276 = _274 ? as_type<float>(_268) : (-0.0);
    bool _278 = !_264;
    float _280 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _282 = _278 ? as_type<float>(_272) : _280;
    float _284 = _43 + _276;
    float _286 = _45 + _282;
    float2 _691 = float2(_43, _45);
    float3 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_691, float2(0.0), isnan(_691))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_691, float2(0.0), isnan(_691))).xyz;
    float _290 = _288.x;
    float _292 = _288.y;
    float _294 = _288.z;
    float2 _705 = float2(_284, _286);
    float3 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_705, float2(0.0), isnan(_705))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_705, float2(0.0), isnan(_705))).xyz;
    float _298 = _296.x;
    float _300 = _296.y;
    float _302 = _296.z;
    float _304 = _298 * _290;
    float _306 = _300 * _292;
    float _308 = _302 * _294;
    out.m_36.x = _304;
    out.m_36.y = _306;
    out.m_36.z = _308;
    return out;
}

