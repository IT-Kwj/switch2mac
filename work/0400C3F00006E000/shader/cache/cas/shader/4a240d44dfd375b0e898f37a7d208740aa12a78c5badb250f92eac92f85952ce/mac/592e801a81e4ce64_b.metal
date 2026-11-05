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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1036, thread const int& _1037, constant _10& support_buffer)
{
    int _1040 = 1 + _1037;
    float _1042 = support_buffer._m5[_1040].x;
    float _1044 = abs(_1042);
    bool _1046 = _1044 == 1.0;
    if (_1046)
    {
        return _1036;
    }
    float _1048 = float(_1036);
    float _1050 = _1048 / _1044;
    int _1052 = int(_1050);
    return _1052;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _468 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_468, float2(0.0), isnan(_468))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_468, float2(0.0), isnan(_468))).x;
    bool _70 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_70)
    {
        discard_fragment();
    }
    if (_70)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _72 = in.m_36.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = _60 * _76;
    float _96 = precise::max(_92, _94);
    float _98 = _60 * _82;
    float _100 = _60 * _88;
    bool _102 = _96 != 0.0;
    bool _104 = isnan(_96);
    bool _106 = _102 || _104;
    bool _108 = isnan(0.0);
    bool _110 = _106 || _108;
    float _112 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = precise::min(_114, _118);
    bool _122 = !_110;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_96, _124, 1.0);
        float _128 = log2(_126);
        float _130 = _128 + (-1.0);
        float _132 = trunc(_130);
        int _134 = int(_132);
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _138 = _136;
        int _140 = 1;
        int _142 = _42(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _146 = _144;
        int _148 = 1;
        int _150 = _42(_146, _148, (*spvDescriptorSet0.support_buffer));
        float _152 = float(_142);
        float _154 = float(_150);
        float _156 = fma(_62, _152, -0.5);
        float _158 = fma(_64, _154, -0.5);
        float _160 = 1.0 / _152;
        float _162 = floor(_156);
        float _164 = floor(_158);
        float _166 = -_162;
        float _168 = _156 + _166;
        float _170 = -_168;
        float _172 = _170 + 1.0;
        float _174 = -_168;
        float _176 = _174 + 2.0;
        float _178 = -_164;
        float _180 = _158 + _178;
        float _182 = _172 * _172;
        float _184 = _176 * _176;
        float _186 = -_180;
        float _188 = _186 + 1.0;
        float _190 = _172 * _182;
        float _192 = -_180;
        float _194 = _192 + 2.0;
        float _196 = _188 * _188;
        float _198 = -_190;
        float _200 = _198 + 6.0;
        float _202 = _194 * _194;
        float _204 = _188 * _196;
        float _206 = _190 * 4.0;
        float _208 = _204 * 4.0;
        float _210 = -_206;
        float _212 = fma(_176, _184, _210);
        float _214 = -_204;
        float _216 = _214 + 6.0;
        float _218 = 1.0 / _154;
        float _220 = -_208;
        float _222 = fma(_194, _202, _220);
        float _224 = _190 + _212;
        float _226 = -_212;
        float _228 = _226 + _200;
        float _230 = _212 * 0.16666667163372039794921875;
        float _232 = _204 + _222;
        float _234 = -_222;
        float _236 = _234 + _216;
        float _238 = _224 * 0.16666667163372039794921875;
        float _240 = _228 * 0.16666667163372039794921875;
        float _242 = _232 * 0.16666667163372039794921875;
        float _244 = _236 * 0.16666667163372039794921875;
        float _246 = 1.0 / _238;
        float _248 = _168 * _168;
        float _250 = _180 * _180;
        float _252 = _222 * 0.16666667163372039794921875;
        float _254 = _168 * _248;
        float _256 = _180 * _250;
        float _258 = _164 + (-0.5);
        float _260 = 1.0 / _242;
        float _262 = _162 + (-0.5);
        float _264 = _164 + 1.5;
        float _266 = _256 * 0.16666667163372039794921875;
        float _268 = _162 + 1.5;
        float _270 = _254 * 0.16666667163372039794921875;
        float _272 = 1.0 / _244;
        float _274 = fma(_230, _246, _262);
        float _276 = 1.0 / _240;
        float _278 = fma(_252, _260, _258);
        float _280 = _278 * _218;
        float _282 = fma(_266, _272, _264);
        float _284 = _282 * _218;
        float _286 = fma(_270, _276, _268);
        float _288 = _274 * _160;
        float _290 = _286 * _160;
        float2 _785 = float2(_288, _280);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_785, float2(0.0), isnan(_785)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_785, float2(0.0), isnan(_785)), level(_130)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float2 _800 = float2(_290, _280);
        float3 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_800, float2(0.0), isnan(_800)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_800, float2(0.0), isnan(_800)), level(_130)).xyz;
        float _304 = _302.x;
        float _306 = _302.y;
        float _308 = _302.z;
        float2 _815 = float2(_288, _284);
        float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_815, float2(0.0), isnan(_815)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_815, float2(0.0), isnan(_815)), level(_130)).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        float2 _830 = float2(_290, _284);
        float3 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_830, float2(0.0), isnan(_830)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_830, float2(0.0), isnan(_830)), level(_130)).xyz;
        float _320 = _318.x;
        float _322 = _318.y;
        float _324 = _318.z;
        float _326 = -_306;
        float _328 = _298 + _326;
        float _330 = -_304;
        float _332 = _296 + _330;
        float _334 = fma(_238, _328, _306);
        float _336 = -_320;
        float _338 = _312 + _336;
        float _340 = fma(_238, _332, _304);
        float _342 = -_322;
        float _344 = _314 + _342;
        float _346 = -_308;
        float _348 = _300 + _346;
        float _350 = -_324;
        float _352 = _316 + _350;
        float _354 = fma(_238, _338, _320);
        float _356 = fma(_238, _344, _322);
        float _358 = fma(_238, _348, _308);
        float _360 = fma(_238, _352, _324);
        float _362 = -_354;
        float _364 = _362 + _340;
        float _366 = -_356;
        float _368 = _366 + _334;
        float _370 = 0.0 + _128;
        float _372 = precise::clamp(_370, 0.0, 1.0);
        float _374 = -_360;
        float _376 = _374 + _358;
        float _378 = fma(_242, _364, _354);
        float _380 = fma(_242, _368, _356);
        float _382 = fma(_100, _372, _98);
        float _384 = fma(_242, _376, _360);
        float _386 = -_378;
        float _388 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[13].x, _386);
        float _390 = -_380;
        float _392 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[13].y, _390);
        float _394 = 1.0 / _382;
        float _396 = -_384;
        float _398 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[13].z, _396);
        float _400 = fma(_120, _388, _378);
        float _402 = fma(_120, _392, _380);
        float _404 = fma(_120, _398, _384);
        float _406 = _372 * _400;
        float _408 = _372 * _402;
        float _410 = _372 * _404;
        float _412 = -_406;
        float _414 = _412 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _416 = -_408;
        float _418 = _416 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _420 = -_410;
        float _422 = _420 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _424 = fma(_98, _414, _406);
        float _426 = fma(_98, _418, _408);
        float _428 = fma(_98, _422, _410);
        float _430 = _424 * _394;
        float _432 = _426 * _394;
        float _434 = _428 * _394;
        out.m_34.x = _430;
        out.m_34.y = _432;
        out.m_34.z = _434;
        out.m_34.w = _382;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _98;
    return out;
}

