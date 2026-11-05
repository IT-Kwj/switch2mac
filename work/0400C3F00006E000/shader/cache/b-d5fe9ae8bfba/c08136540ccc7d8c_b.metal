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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _349;
    _349.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_71, _73));
    _349.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_71, _73));
    float _75 = _349.x;
    float _77 = _75 * 256.0;
    int _80 = int(_77);
    float _82 = in.m_39.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_39.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_39.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_37.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_37.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = _69 * _86;
    float _114 = _69 * _92;
    float _116 = _69 * _98;
    float _118 = 1.0 / _112;
    float _120 = _114 * _118;
    float _122 = _116 * _118;
    float _124 = _69 * _104;
    float2 _415 = float2(_120, _122);
    float _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_415, float2(0.0), isnan(_415))).x;
    float _128 = float(uint(_80));
    float _130 = _128 * 0.00390625;
    float _132 = _69 * _110;
    float _134 = precise::min(_130, 2.0);
    float2 _439 = float2(_71, _73);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439)), level(_134)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_439, float2(0.0), isnan(_439)), level(_134)).w;
    float2 _448 = float2(_132, _124);
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_448, float2(0.0), isnan(_448))).w;
    float _140 = in.m_39.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_41.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _154 = _69 * _144;
    float _156 = in.m_43.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = _154 * _118;
    float _164 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _166 = fma(_162, (*spvDescriptorSet0.fp_c8)._m0[30].w, _164);
    float _168 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _170 = fma(_126, (*spvDescriptorSet0.fp_c8)._m0[30].w, _168);
    float _172 = in.m_45.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = 1.0 / _166;
    float _180 = 1.0 / _170;
    float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _184 = _178 * _182;
    float _186 = _136 * _136;
    float _188 = _186 * _138;
    float _190 = _69 * _150;
    float _192 = _190 + 0.699999988079071044921875;
    float _194 = precise::max(_190, _188);
    float _196 = precise::min(_192, _194);
    float _198 = _69 * _160;
    float _200 = _136 * _198;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _206 = -_184;
    float _208 = fma(_180, _204, _206);
    float _210 = -_190;
    float _212 = _210 + _196;
    float _214 = _69 * _176;
    float _216 = _208 * _152;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = fma(_212, 1.4285714626312255859375, _202);
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _222 * _218;
    float _226 = _224 * _214;
    bool _230 = _226 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _232 = isnan(_226);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _238 = _234 || _236;
    float _240 = in.m_41.x;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_41.y;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_41.z;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = _250;
    float _260 = _170;
    if (!_238)
    {
        discard_fragment();
    }
    float _262 = _69 * _244;
    float _264 = _69 * _250;
    float _266 = _69 * _256;
    if (!_238)
    {
        out.m_48.x = _262;
        out.m_48.y = _264;
        out.m_48.z = _266;
        out.m_48.w = _222;
        return out;
    }
    float _268 = _264 * 0.715200006961822509765625;
    float _270 = fma(_262, 0.2125999927520751953125, _268);
    float _272 = fma(_266, 0.072200000286102294921875, _270);
    bool _274 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _276 = 1.0 / _272;
    float _278 = 0.0 + _226;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _280;
    if (_274)
    {
        float _284 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _286 = _184 + _284;
        _258 = _286;
    }
    float _288 = _258;
    float _290 = _276 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    if (_274)
    {
        float _294 = _288 * 8.0;
        float _296 = precise::clamp(_294, 0.0, 1.0);
        _260 = _296;
    }
    float _298 = _260;
    float _300 = fma(_292, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_274)
    {
        float _302 = _280 * _298;
        _282 = _302;
    }
    float _304 = _282;
    float _306 = _262 * _300;
    float _308 = _264 * _300;
    float _310 = _266 * _300;
    float _312 = 0.0 + _304;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    out.m_48.x = _306;
    out.m_48.y = _308;
    out.m_48.z = _310;
    out.m_48.w = _314;
    return out;
}

