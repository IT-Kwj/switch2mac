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
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_51 [[user(locn5), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_41.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_41.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _353;
    _353.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_77, _79));
    _353.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_77, _79));
    float _81 = _353.x;
    float _83 = _81 * 256.0;
    int _86 = int(_83);
    float _88 = in.m_43.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_43.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_43.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_41.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_41.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = _75 * _92;
    float _120 = _75 * _98;
    float _122 = _75 * _104;
    float _124 = 1.0 / _118;
    float _126 = _120 * _124;
    float _128 = _122 * _124;
    float _130 = _75 * _116;
    float2 _419 = float2(_126, _128);
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_419, float2(0.0), isnan(_419))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_419, float2(0.0), isnan(_419))).x;
    float _134 = float(uint(_86));
    float _136 = _134 * 0.00390625;
    float _138 = _75 * _110;
    float _140 = precise::min(_136, 2.0);
    float2 _443 = float2(_77, _79);
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443)), level(_140)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443)), level(_140)).w;
    float2 _452 = float2(_138, _130);
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_452, float2(0.0), isnan(_452))).w;
    float _146 = in.m_43.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_45.w;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_47.w;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _75 * _150;
    float _166 = _164 * _124;
    float _168 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _170 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[30].w, _168);
    float _172 = _75 * _156;
    float _174 = in.m_49.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = _172 * 0.300000011920928955078125;
    float _182 = 1.0 / _170;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _186 = fma(_132, (*spvDescriptorSet0.fp_c8)._m0[30].w, _184);
    float _188 = _180 + 0.0500000007450580596923828125;
    float _190 = 1.0 / _186;
    float _192 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _194 = precise::max(_180, _142);
    float _196 = _144 * _144;
    float _198 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _200 = _182 * _198;
    float _202 = precise::min(_188, _194);
    float _204 = _75 * _162;
    float _206 = _75 * _178;
    float _208 = -_180;
    float _210 = _208 + _202;
    float _212 = _196 * _204;
    float _214 = _210 * 20.0;
    float _216 = precise::max(_212, _214);
    float _218 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _220 = -_200;
    float _222 = fma(_190, _218, _220);
    float _224 = _222 * _192;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = 0.0 + _216;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = _230 * _226;
    float _234 = _232 * _206;
    bool _238 = _234 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _240 = isnan(_234);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _246 = _242 || _244;
    float _248 = in.m_51.x;
    float _250 = _200;
    if (!_246)
    {
        discard_fragment();
    }
    float _252 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 0.25, 0.125);
    float2 _616 = float2(_248, _252);
    float3 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_616, float2(0.0), isnan(_616))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_616, float2(0.0), isnan(_616))).xyz;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = fma(_258, (*spvDescriptorSet0.fp_c9)._m0[106].x, _216);
    float _266 = fma(_260, (*spvDescriptorSet0.fp_c9)._m0[106].x, _216);
    float _268 = fma(_262, (*spvDescriptorSet0.fp_c9)._m0[106].x, _216);
    if (!_246)
    {
        out.m_54.x = _264;
        out.m_54.y = _266;
        out.m_54.z = _268;
        out.m_54.w = _216;
        return out;
    }
    float _270 = _266 * 0.715200006961822509765625;
    float _272 = fma(_264, 0.2125999927520751953125, _270);
    float _274 = fma(_268, 0.072200000286102294921875, _272);
    bool _276 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _278 = 1.0 / _274;
    float _280 = 0.0 + _234;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _282;
    if (_276)
    {
        float _286 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _288 = _200 + _286;
        _250 = _288;
    }
    float _290 = _250;
    float _292 = _278 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = _290;
    if (_276)
    {
        float _298 = _290 * 8.0;
        float _300 = precise::clamp(_298, 0.0, 1.0);
        _296 = _300;
    }
    float _302 = _296;
    float _304 = fma(_294, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_276)
    {
        float _306 = _282 * _302;
        _284 = _306;
    }
    float _308 = _284;
    float _310 = _264 * _304;
    float _312 = _266 * _304;
    float _314 = _268 * _304;
    float _316 = 0.0 + _308;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    out.m_54.x = _310;
    out.m_54.y = _312;
    out.m_54.z = _314;
    out.m_54.w = _318;
    return out;
}

