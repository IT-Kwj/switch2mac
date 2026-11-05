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
    float4 m_41 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _53;
    float _81 = _79 * _59;
    float _83 = _79 * _65;
    float _85 = _79 * _71;
    float _87 = _79 * _77;
    float2 _351 = float2(_81, _83);
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_351, float2(0.0), isnan(_351))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_351, float2(0.0), isnan(_351))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    float2 _370 = float2(_85, _87);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_370, float2(0.0), isnan(_370))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_370, float2(0.0), isnan(_370))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = in.m_37.w;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_39.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = _79 * _114;
    float _124 = _79 * _120;
    float _126 = in.m_37.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_37.z;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_41.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_41.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_41.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = _79 * _130;
    float _158 = _98 * _108;
    float _160 = _158 * _122;
    float _162 = 0.0 + _160;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = _164 * _124;
    bool _170 = _166 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _172 = isnan(_166);
    bool _174 = _170 || _172;
    bool _176 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _178 = _174 || _176;
    float _180 = in.m_37.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    if (!_178)
    {
        discard_fragment();
    }
    float _186 = fma(_104, _104, _94);
    float _188 = fma(_102, _102, _92);
    float _190 = _79 * _136;
    float _192 = _79 * _142;
    float _194 = _79 * _148;
    float _196 = _79 * _154;
    float _198 = fma(_106, _106, _96);
    float _200 = -_192;
    float _202 = _156 + _200;
    float _204 = -_196;
    float _206 = _190 + _204;
    float _208 = fma(_188, _202, _192);
    float _210 = fma(_198, _206, _196);
    float _212 = _79 * _184;
    float _214 = -_194;
    float _216 = _212 + _214;
    float _218 = fma(_186, _216, _194);
    if (!_178)
    {
        out.m_44.x = _208;
        out.m_44.y = _218;
        out.m_44.z = _210;
        out.m_44.w = _160;
        return out;
    }
    float _220 = _218 * 0.715200006961822509765625;
    float _222 = 0.0 + _166;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = fma(_208, 0.2125999927520751953125, _220);
    bool _228 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _230 = fma(_210, 0.072200000286102294921875, _226);
    float _232 = 1.0 / _230;
    float _234 = _232 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = fma(_236, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _240 = _208 * _238;
    float _242 = _218 * _238;
    float _244 = _210 * _238;
    float _246 = _238;
    if (!_228)
    {
        _246 = _224;
    }
    float _248 = _246;
    bool _250 = !_228;
    float _252 = _248;
    if (!_250)
    {
        float _254 = in.m_46.w;
        float _256 = gl_FragCoord.w;
        float _258 = _254 * _256;
        float _260 = in.m_46.z;
        float _262 = gl_FragCoord.w;
        float _264 = _260 * _262;
        float _266 = _79 * _258;
        float _268 = _79 * _264;
        float _270 = 1.0 / _266;
        float _272 = _268 * _270;
        float _274 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _276 = fma(_272, (*spvDescriptorSet0.fp_c8)._m0[30].w, _274);
        float _278 = 1.0 / _276;
        float _280 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _282 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _284 = fma(_278, _280, _282);
        float _286 = _284 * 8.0;
        float _288 = precise::clamp(_286, 0.0, 1.0);
        float _290 = _224 * _288;
        _252 = _290;
    }
    float _292 = _252;
    float _294 = 0.0 + _292;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    out.m_44.x = _240;
    out.m_44.y = _242;
    out.m_44.z = _244;
    out.m_44.w = _296;
    return out;
}

