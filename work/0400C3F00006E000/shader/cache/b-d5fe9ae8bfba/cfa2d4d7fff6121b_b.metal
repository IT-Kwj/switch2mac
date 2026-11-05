#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _55 = 1.0 / _39;
    float _57 = _55 * _45;
    float _59 = _55 * _51;
    float _61 = fma(_53, -1.5, _57);
    float _63 = fma(_53, -1.5, _59);
    float3 _401 = float3(_63, _61, float(0));
    float3 _407 = select(_401, float3(0.0), isnan(_401));
    float4 _66 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _407.xy, uint(rint(_407.z)), int2(0), component::x).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = fma(_53, 2.0, _63);
    float3 _426 = float3(_76, _61, float(0));
    float3 _428 = select(_426, float3(0.0), isnan(_426));
    float4 _78 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _428.xy, uint(rint(_428.z)), int2(0), component::x).xyzw;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    float _86 = _78.w;
    float _88 = precise::min(_68, _70);
    float _90 = fma(_53, 2.0, _61);
    float3 _449 = float3(_63, _90, float(0));
    float3 _451 = select(_449, float3(0.0), isnan(_449));
    float4 _92 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _451.xy, uint(rint(_451.z)), int2(0), component::x).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float3 _466 = float3(_76, _90, float(0));
    float3 _468 = select(_466, float3(0.0), isnan(_466));
    float4 _102 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _468.xy, uint(rint(_468.z)), int2(0), component::x).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float3 _483 = float3(_63, _61, float(1));
    float3 _485 = select(_483, float3(0.0), isnan(_483));
    float4 _112 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _485.xy, uint(rint(_485.z)), int2(0), component::x).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float3 _500 = float3(_76, _61, float(1));
    float3 _502 = select(_500, float3(0.0), isnan(_500));
    float4 _122 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _502.xy, uint(rint(_502.z)), int2(0), component::x).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float3 _517 = float3(_63, _90, float(1));
    float3 _519 = select(_517, float3(0.0), isnan(_517));
    float4 _132 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _519.xy, uint(rint(_519.z)), int2(0), component::x).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float3 _534 = float3(_76, _90, float(1));
    float3 _536 = select(_534, float3(0.0), isnan(_534));
    float4 _142 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _536.xy, uint(rint(_536.z)), int2(0), component::x).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float _152 = precise::min(_72, _74);
    float _154 = precise::min(_80, _82);
    float _156 = precise::min(_84, _86);
    float _158 = precise::min(_88, _152);
    float _160 = precise::min(_154, _156);
    float _162 = precise::min(_158, _160);
    float _164 = precise::min(_94, _96);
    float _166 = precise::min(_98, _100);
    float _168 = precise::min(_104, _106);
    float _170 = precise::min(_108, _110);
    float _172 = precise::min(_114, _116);
    float _174 = precise::min(_118, _120);
    float _176 = precise::min(_124, _126);
    float _178 = precise::min(_128, _130);
    float _180 = precise::min(_164, _166);
    float _182 = precise::min(_168, _170);
    float _184 = precise::min(_172, _174);
    float _186 = precise::min(_176, _178);
    float _188 = precise::min(_180, _182);
    float _190 = precise::min(_144, _146);
    float _192 = precise::min(_148, _150);
    float _194 = precise::min(_134, _136);
    float _196 = precise::min(_138, _140);
    float _198 = precise::min(_184, _186);
    float _200 = precise::min(_162, _188);
    float _202 = precise::min(_190, _192);
    float _204 = precise::min(_194, _196);
    float _206 = precise::min(_204, _202);
    float3 _636 = float3(_63, _61, float(2));
    float3 _638 = select(_636, float3(0.0), isnan(_636));
    float4 _208 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _638.xy, uint(rint(_638.z)), int2(0), component::x).xyzw;
    float _210 = _208.x;
    float _212 = _208.y;
    float _214 = _208.z;
    float _216 = _208.w;
    float3 _653 = float3(_76, _61, float(2));
    float3 _655 = select(_653, float3(0.0), isnan(_653));
    float4 _218 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _655.xy, uint(rint(_655.z)), int2(0), component::x).xyzw;
    float _220 = _218.x;
    float _222 = _218.y;
    float _224 = _218.z;
    float _226 = _218.w;
    float3 _670 = float3(_63, _90, float(2));
    float3 _672 = select(_670, float3(0.0), isnan(_670));
    float4 _228 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _672.xy, uint(rint(_672.z)), int2(0), component::x).xyzw;
    float _230 = _228.x;
    float _232 = _228.y;
    float _234 = _228.z;
    float _236 = _228.w;
    float3 _687 = float3(_76, _90, float(2));
    float3 _689 = select(_687, float3(0.0), isnan(_687));
    float4 _238 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _689.xy, uint(rint(_689.z)), int2(0), component::x).xyzw;
    float _240 = _238.x;
    float _242 = _238.y;
    float _244 = _238.z;
    float _246 = _238.w;
    float3 _704 = float3(_63, _61, float(3));
    float3 _706 = select(_704, float3(0.0), isnan(_704));
    float4 _248 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _706.xy, uint(rint(_706.z)), int2(0), component::x).xyzw;
    float _250 = _248.x;
    float _252 = _248.y;
    float _254 = _248.z;
    float _256 = _248.w;
    float3 _721 = float3(_76, _61, float(3));
    float3 _723 = select(_721, float3(0.0), isnan(_721));
    float4 _258 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _723.xy, uint(rint(_723.z)), int2(0), component::x).xyzw;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    float _266 = _258.w;
    float3 _738 = float3(_63, _90, float(3));
    float3 _740 = select(_738, float3(0.0), isnan(_738));
    float4 _268 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _740.xy, uint(rint(_740.z)), int2(0), component::x).xyzw;
    float _270 = _268.x;
    float _272 = _268.y;
    float _274 = _268.z;
    float _276 = _268.w;
    float3 _755 = float3(_76, _90, float(3));
    float3 _757 = select(_755, float3(0.0), isnan(_755));
    float4 _278 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, _757.xy, uint(rint(_757.z)), int2(0), component::x).xyzw;
    float _280 = _278.x;
    float _282 = _278.y;
    float _284 = _278.z;
    float _286 = _278.w;
    float _288 = precise::min(_198, _206);
    float _290 = precise::min(_214, _216);
    float _292 = precise::min(_210, _212);
    float _294 = precise::min(_220, _222);
    float _296 = precise::min(_224, _226);
    float _298 = precise::min(_230, _232);
    float _300 = precise::min(_234, _236);
    float _302 = precise::min(_240, _242);
    float _304 = precise::min(_244, _246);
    float _306 = precise::min(_250, _252);
    float _308 = precise::min(_254, _256);
    float _310 = precise::min(_260, _262);
    float _312 = precise::min(_264, _266);
    float _314 = precise::min(_270, _272);
    float _316 = precise::min(_274, _276);
    float _318 = precise::min(_280, _282);
    float _320 = precise::min(_284, _286);
    float _322 = precise::min(_292, _290);
    float _324 = precise::min(_294, _296);
    float _326 = precise::min(_298, _300);
    float _328 = precise::min(_302, _304);
    float _330 = precise::min(_306, _308);
    float _332 = precise::min(_310, _312);
    float _334 = precise::min(_314, _316);
    float _336 = precise::min(_318, _320);
    float _338 = precise::min(_322, _324);
    float _340 = precise::min(_326, _328);
    float _342 = precise::min(_330, _332);
    float _344 = precise::min(_334, _336);
    float _346 = precise::min(_338, _340);
    float _348 = precise::min(_342, _344);
    float _350 = precise::min(_200, _288);
    float _352 = precise::min(_346, _348);
    float _354 = precise::min(_350, _352);
    out.m_32.x = _354;
    out.m_32.y = _354;
    out.m_32.z = _354;
    out.m_32.w = _354;
    return out;
}

