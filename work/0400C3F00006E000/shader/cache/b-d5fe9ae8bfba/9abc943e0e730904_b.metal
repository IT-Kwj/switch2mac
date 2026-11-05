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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
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
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _55;
    float _101 = _99 * _61;
    float _103 = _99 * _67;
    float _105 = _99 * _73;
    float _107 = _99 * _79;
    float _109 = 1.0 / _101;
    float _111 = _99 * _85;
    float _113 = _99 * _91;
    float _115 = _99 * _97;
    float _117 = _103 * _109;
    float _119 = _105 * _109;
    float2 _437 = float2(_117, _119);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_437, float2(0.0), isnan(_437))).x;
    float2 _448 = float2(_107, _111);
    float4 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    float2 _464 = float2(_113, _115);
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_464, float2(0.0), isnan(_464))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_464, float2(0.0), isnan(_464))).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float _144 = in.m_37.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_41.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _158 = _99 * _148;
    float _160 = _158 * _109;
    float _162 = in.m_43.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _170 = fma(_160, (*spvDescriptorSet0.fp_c8)._m0[30].w, _168);
    float _172 = _99 * _154;
    float _174 = 1.0 / _170;
    float _176 = in.m_45.y;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_41.z;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_45.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_45.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = _99 * _180;
    float _202 = _99 * _186;
    float _204 = _99 * _192;
    float _206 = _99 * _198;
    float _208 = -_206;
    float _210 = _202 + _208;
    float _212 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _214 = fma(_121, (*spvDescriptorSet0.fp_c8)._m0[30].w, _212);
    float _216 = 1.0 / _214;
    float _218 = _132 * _142;
    float _220 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _222 = _174 * _220;
    float _224 = _218 * _172;
    float _226 = 0.0 + _224;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _232 = -_222;
    float _234 = fma(_216, _230, _232);
    float _236 = _234 * _156;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = _99 * _166;
    float _242 = _228 * _238;
    float _244 = _242 * _240;
    bool _248 = _244 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _250 = isnan(_244);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _256 = _252 || _254;
    float _258 = in.m_41.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_41.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = _222;
    float _272 = _130;
    if (!_256)
    {
        discard_fragment();
    }
    float _274 = _126 * _136;
    float _276 = _130 * _140;
    float _278 = fma(_276, _210, _206);
    float _280 = _99 * _262;
    float _282 = _99 * _268;
    float _284 = _128 * _138;
    float _286 = -_204;
    float _288 = _280 + _286;
    float _290 = -_200;
    float _292 = _282 + _290;
    float _294 = fma(_274, _288, _204);
    float _296 = fma(_284, _292, _200);
    if (!_256)
    {
        out.m_48.x = _294;
        out.m_48.y = _296;
        out.m_48.z = _278;
        out.m_48.w = _224;
        return out;
    }
    float _298 = _296 * 0.715200006961822509765625;
    float _300 = fma(_294, 0.2125999927520751953125, _298);
    float _302 = fma(_278, 0.072200000286102294921875, _300);
    bool _304 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _306 = 1.0 / _302;
    float _308 = 0.0 + _244;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = _310;
    if (_304)
    {
        float _314 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _316 = _222 + _314;
        _270 = _316;
    }
    float _318 = _270;
    float _320 = _306 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    if (_304)
    {
        float _324 = _318 * 8.0;
        float _326 = precise::clamp(_324, 0.0, 1.0);
        _272 = _326;
    }
    float _328 = _272;
    float _330 = fma(_322, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_304)
    {
        float _332 = _310 * _328;
        _312 = _332;
    }
    float _334 = _312;
    float _336 = _294 * _330;
    float _338 = _296 * _330;
    float _340 = _278 * _330;
    float _342 = 0.0 + _334;
    float _344 = precise::clamp(_342, 0.0, 1.0);
    out.m_48.x = _336;
    out.m_48.y = _338;
    out.m_48.z = _340;
    out.m_48.w = _344;
    return out;
}

