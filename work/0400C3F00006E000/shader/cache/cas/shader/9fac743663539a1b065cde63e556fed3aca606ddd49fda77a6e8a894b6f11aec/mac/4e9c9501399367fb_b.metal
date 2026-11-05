#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _961, thread const int& _962, constant _10& support_buffer)
{
    int _965 = 1 + _962;
    float _967 = support_buffer._m5[_965].x;
    float _969 = abs(_967);
    bool _971 = _969 == 1.0;
    if (_971)
    {
        return _961;
    }
    float _973 = float(_961);
    float _975 = _973 / _969;
    int _977 = int(_975);
    return _977;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _442 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_442, float2(0.0), isnan(_442))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_442, float2(0.0), isnan(_442))).x;
    float2 _453 = float2(_62, _64);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_453, float2(0.0), isnan(_453))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_453, float2(0.0), isnan(_453))).x;
    float _70 = -_66;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    float _76 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _82 = precise::clamp(_80, 0.0, 1.0);
    float _84 = precise::max(_68, _78);
    bool _88 = _84 != 0.0;
    bool _90 = isnan(_84);
    bool _92 = _88 || _90;
    bool _94 = isnan(0.0);
    bool _96 = _92 || _94;
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = precise::min(_100, _82);
    bool _104 = !_96;
    if (!_104)
    {
        float _106 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _108 = fma(_84, _106, 1.0);
        float _110 = log2(_108);
        float _112 = _110 + (-1.0);
        float _114 = trunc(_112);
        int _116 = int(_114);
        int _118 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_116), spvDescriptorSet0.fp_t_tcb_A.get_height(_116)).x;
        int _120 = _118;
        int _122 = 2;
        int _124 = _42(_120, _122, (*spvDescriptorSet0.support_buffer));
        int _126 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_116), spvDescriptorSet0.fp_t_tcb_A.get_height(_116)).y;
        int _128 = _126;
        int _130 = 2;
        int _132 = _42(_128, _130, (*spvDescriptorSet0.support_buffer));
        float _134 = float(_124);
        float _136 = float(_132);
        float _138 = fma(_62, _134, -0.5);
        float _140 = fma(_64, _136, -0.5);
        float _142 = 1.0 / _134;
        float _144 = floor(_138);
        float _146 = floor(_140);
        float _148 = -_144;
        float _150 = _138 + _148;
        float _152 = -_150;
        float _154 = _152 + 1.0;
        float _156 = -_150;
        float _158 = _156 + 2.0;
        float _160 = -_146;
        float _162 = _140 + _160;
        float _164 = _154 * _154;
        float _166 = _158 * _158;
        float _168 = -_162;
        float _170 = _168 + 1.0;
        float _172 = _154 * _164;
        float _174 = _170 * _170;
        float _176 = _172 * 4.0;
        float _178 = _170 * _174;
        float _180 = -_162;
        float _182 = _180 + 2.0;
        float _184 = -_176;
        float _186 = fma(_158, _166, _184);
        float _188 = -_172;
        float _190 = _188 + 6.0;
        float _192 = _178 * 4.0;
        float _194 = _182 * _182;
        float _196 = _172 + _186;
        float _198 = -_186;
        float _200 = _198 + _190;
        float _202 = _186 * 0.16666667163372039794921875;
        float _204 = -_192;
        float _206 = fma(_182, _194, _204);
        float _208 = -_178;
        float _210 = _208 + 6.0;
        float _212 = _200 * 0.16666667163372039794921875;
        float _214 = _196 * 0.16666667163372039794921875;
        float _216 = _178 + _206;
        float _218 = -_206;
        float _220 = _218 + _210;
        float _222 = 1.0 / _136;
        float _224 = _162 * _162;
        float _226 = _216 * 0.16666667163372039794921875;
        float _228 = _220 * 0.16666667163372039794921875;
        float _230 = _206 * 0.16666667163372039794921875;
        float _232 = _162 * _224;
        float _234 = _144 + (-0.5);
        float _236 = _146 + 1.5;
        float _238 = 1.0 / _226;
        float _240 = _150 * _150;
        float _242 = _232 * 0.16666667163372039794921875;
        float _244 = _150 * _240;
        float _246 = _144 + 1.5;
        float _248 = _146 + (-0.5);
        float _250 = 1.0 / _214;
        float _252 = _244 * 0.16666667163372039794921875;
        float _254 = 1.0 / _212;
        float _256 = fma(_230, _238, _248);
        float _258 = _256 * _222;
        float _260 = 1.0 / _228;
        float _262 = fma(_202, _250, _234);
        float _264 = fma(_252, _254, _246);
        float _266 = _264 * _142;
        float _268 = fma(_242, _260, _236);
        float _270 = _262 * _142;
        float _272 = _268 * _222;
        float2 _733 = float2(_270, _258);
        float3 _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_733, float2(0.0), isnan(_733)), level(_112)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_733, float2(0.0), isnan(_733)), level(_112)).xyz;
        float _278 = _276.x;
        float _280 = _276.y;
        float _282 = _276.z;
        float2 _748 = float2(_266, _258);
        float3 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_748, float2(0.0), isnan(_748)), level(_112)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_748, float2(0.0), isnan(_748)), level(_112)).xyz;
        float _286 = _284.x;
        float _288 = _284.y;
        float _290 = _284.z;
        float2 _763 = float2(_270, _272);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_763, float2(0.0), isnan(_763)), level(_112)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_763, float2(0.0), isnan(_763)), level(_112)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float2 _778 = float2(_266, _272);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_778, float2(0.0), isnan(_778)), level(_112)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_778, float2(0.0), isnan(_778)), level(_112)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float _308 = 0.0 + _110;
        float _310 = precise::clamp(_308, 0.0, 1.0);
        float _312 = -_286;
        float _314 = _278 + _312;
        float _316 = -_288;
        float _318 = _280 + _316;
        float _320 = -_290;
        float _322 = _282 + _320;
        float _324 = -_304;
        float _326 = _296 + _324;
        float _328 = fma(_214, _314, _286);
        float _330 = fma(_214, _318, _288);
        float _332 = -_302;
        float _334 = _294 + _332;
        float _336 = fma(_214, _326, _304);
        float _338 = -_306;
        float _340 = _298 + _338;
        float _342 = fma(_214, _322, _290);
        float _344 = fma(_214, _334, _302);
        float _346 = -_336;
        float _348 = _346 + _330;
        float _350 = fma(_214, _340, _306);
        float _352 = _102 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _354 = -_344;
        float _356 = _354 + _328;
        float _358 = fma(_226, _348, _336);
        float _360 = -_350;
        float _362 = _360 + _342;
        float _364 = fma(_226, _356, _344);
        float _366 = _358 * 0.586600005626678466796875;
        float _368 = fma(_226, _362, _350);
        float _370 = fma(_364, 0.29890000820159912109375, _366);
        float _372 = fma(_368, 0.1143999993801116943359375, _370);
        float _374 = -_364;
        float _376 = _374 + _372;
        float _378 = -_358;
        float _380 = _378 + _372;
        float _382 = -_368;
        float _384 = _382 + _372;
        float _386 = fma(_352, _376, _364);
        float _388 = fma(_352, _380, _358);
        float _390 = fma(_352, _384, _368);
        float _392 = -_386;
        float _394 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[13].x, _392);
        float _396 = -_388;
        float _398 = fma(_388, (*spvDescriptorSet0.fp_c3)._m0[13].y, _396);
        float _400 = -_390;
        float _402 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[13].z, _400);
        float _404 = fma(_102, _394, _386);
        float _406 = fma(_102, _398, _388);
        float _408 = fma(_102, _402, _390);
        out.m_36.x = _404;
        out.m_36.y = _406;
        out.m_36.z = _408;
        out.m_36.w = _310;
        return out;
    }
    discard_fragment();
    return out;
}

