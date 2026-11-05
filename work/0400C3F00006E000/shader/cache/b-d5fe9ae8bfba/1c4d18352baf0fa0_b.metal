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

struct spvDescriptorSetBuffer0
{
    texture2d_array<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    texture2d_array<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_27 [[user(locn2)]];
    float4 m_25 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_25.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_25.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_25.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_27.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_27.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_27.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _41;
    float _81 = _79 * _47;
    float _83 = _79 * _53;
    float _85 = _79 * _59;
    float _87 = _79 * _65;
    float _89 = _79 * _71;
    float _91 = _79 * _77;
    float _93 = rint(_81);
    float _95 = precise::max(_93, 0.0);
    uint _98 = uint(_95);
    uint _100 = clamp(_98, 0u, 65535u);
    float _102 = rint(_87);
    float _104 = precise::max(_102, 0.0);
    uint _106 = uint(_104);
    uint _108 = clamp(_106, 0u, 65535u);
    float3 _447 = float3(_85, _83, float(int(_100)));
    float3 _451 = select(_447, float3(0.0), isnan(_447));
    float _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _451.xy, uint(rint(_451.z)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _451.xy, uint(rint(_451.z)), int2(1)).w;
    float3 _462 = float3(_85, _83, float(int(_100)));
    float3 _464 = select(_462, float3(0.0), isnan(_462));
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _464.xy, uint(rint(_464.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _464.xy, uint(rint(_464.z))).w;
    float3 _473 = float3(_85, _83, float(int(_100)));
    float3 _475 = select(_473, float3(0.0), isnan(_473));
    float _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _475.xy, uint(rint(_475.z)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _475.xy, uint(rint(_475.z)), int2(1, 0)).w;
    float3 _485 = float3(_85, _83, float(int(_100)));
    float3 _487 = select(_485, float3(0.0), isnan(_485));
    float _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _487.xy, uint(rint(_487.z)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _487.xy, uint(rint(_487.z)), int2(0, 1)).w;
    float3 _497 = float3(_91, _89, float(int(_108)));
    float3 _499 = select(_497, float3(0.0), isnan(_497));
    float3 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _499.xy, uint(rint(_499.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _499.xy, uint(rint(_499.z))).xyz;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = in.m_29.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_29.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_29.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_29.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_31.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_31.y;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_31.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _79 * _132;
    float _172 = in.m_31.w;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = _170 * 0.15915493667125701904296875;
    float _180 = _79 * _138;
    float _182 = _180 * 0.15915493667125701904296875;
    float _184 = _79 * _144;
    float _186 = _178 * 6.283185482025146484375;
    float _188 = cos(_186);
    float _190 = _184 * 0.15915493667125701904296875;
    float _192 = _79 * _150;
    float _194 = _192 * 0.15915493667125701904296875;
    float _196 = _79 * _156;
    float _198 = _190 * 6.283185482025146484375;
    float _200 = sin(_198);
    float _202 = _196 * 0.15915493667125701904296875;
    float _204 = _79 * _162;
    float _206 = _188 * _188;
    float _208 = _204 * 0.15915493667125701904296875;
    float _210 = _79 * _168;
    float _212 = _182 * 6.283185482025146484375;
    float _214 = cos(_212);
    float _216 = _79 * _176;
    float _218 = _210 * 0.15915493667125701904296875;
    float _220 = _200 * _200;
    float _222 = _216 * 0.15915493667125701904296875;
    float _224 = _194 * 6.283185482025146484375;
    float _226 = sin(_224);
    float _228 = _202 * 6.283185482025146484375;
    float _230 = cos(_228);
    float _232 = _206 * _214;
    float _234 = _208 * 6.283185482025146484375;
    float _236 = sin(_234);
    float _238 = _220 * _226;
    float _240 = _218 * 6.283185482025146484375;
    float _242 = sin(_240);
    float _244 = _232 * _230;
    float _246 = _222 * 6.283185482025146484375;
    float _248 = cos(_246);
    float _250 = _238 * _236;
    float _252 = _242 * 0.0199999995529651641845703125;
    float _254 = fma(_244, 0.5, _252);
    float _256 = _248 * 0.0199999995529651641845703125;
    float _258 = _254 * 16.0;
    float _260 = fma(_250, 0.5, _256);
    float _262 = floor(_258);
    float _264 = _260 * 16.0;
    float _266 = floor(_264);
    float _268 = -_262;
    float _270 = _258 + _268;
    float _272 = fma(_270, 3.0518044695782009512186050415039e-06, -1.525902234789100475609302520752e-06);
    float _274 = -_266;
    float _276 = _264 + _274;
    float _278 = fma(_276, 3.0518044695782009512186050415039e-06, -1.525902234789100475609302520752e-06);
    bool _282 = _112 == _110;
    float _284 = float(_282);
    bool _286 = _114 == _110;
    float _288 = float(_286);
    bool _290 = _114 == _116;
    float _292 = float(_290);
    bool _294 = _112 == _116;
    float _296 = float(_294);
    float _298 = _284 + _288;
    bool _300 = _116 == _110;
    float _302 = float(_300);
    bool _304 = _112 == _114;
    float _306 = float(_304);
    float _308 = _296 + _292;
    float _310 = _302 + _298;
    float _312 = _306 + _296;
    float _314 = _306 + _292;
    float _316 = _302 + _308;
    float _318 = _272 + _310;
    float _320 = _284 + _312;
    float _322 = _288 + _314;
    bool _324 = _316 > _318;
    float _326 = _272 + _322;
    float _328 = _324 ? _316 : _310;
    bool _330 = _320 > _326;
    float _332 = _278 + _328;
    float _334 = _330 ? _320 : _322;
    float _336 = _330 ? _112 : _114;
    bool _338 = _334 > _332;
    float _340 = _336;
    if (!_338)
    {
        float _342 = _324 ? _116 : _110;
        _340 = _342;
    }
    float _344 = _340;
    float _346 = fma(_344, 510.0, 0.25);
    float _348 = floor(_346);
    float _350 = fma(_348, 0.00196078442968428134918212890625, 3.9215687138494104146957397460938e-05);
    out.m_34.x = _122;
    out.m_34.y = _124;
    out.m_34.z = _126;
    out.m_34.w = _350;
    return out;
}

